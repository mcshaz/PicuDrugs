using DBToJSON;
using PICUdrugs.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace PICUdrugs.Utils
{
    public class Vector
    {
        public int Index { get; set; }
        public string Header { get; set; }
    }
    public class BooleanTable
    {
        public Dictionary<int, Vector> Rows {get;set;}
        public Dictionary<int, Vector> Cols {get;set;}
        public bool[,] Cells { get; set; }
    }
    public static class TableExtensioons
    {
        public static string ToHtml(this BooleanTable tbl,string trueHtm = "&#x2611;", string falseHtm = "&#x2610;", string thead="", string id="", string colHeadFormat="{0}")
        {
            var sb = new StringBuilder();
            sb.AppendFormat("<table {0}>\n\t<thead>\n\t\t<tr>\n", string.IsNullOrEmpty(id)?"":"id='"+id+"'");
            int noOfCols = tbl.Cells.GetLength(0);
            if (!string.IsNullOrEmpty(thead))
            {
                sb.AppendFormat("\t\t\t<th class='tableDescription' colspan='{0}'>{1}</th>\n\t\t</tr>\t\t<tr>\n", noOfCols+1, thead);
            }
            sb.Append("\t\t\t<th class='corner'></th>\n");
            foreach (var c in tbl.Cols.Values)
            {
                sb.AppendFormat("\t\t\t<th>" + colHeadFormat + "</th>\n", HttpUtility.UrlPathEncode(c.Header),c.Header);
            }
            sb.Append("\t\t</tr>\n\t</thead>\n\t<tbody>\n");
            var j = 0;
            foreach (var r in tbl.Rows.Values)
            {
                sb.AppendFormat("\t\t<tr>\n\t\t\t<th>{0}</th>\n", r.Header);
                for (var i = 0; i < noOfCols; i++)
                {
                    sb.AppendFormat("\n\t\t\t<td class='{0}'>{1}</td>\n", 
                        tbl.Cells[i,j] ? "trueCell":"falseCell",
                        tbl.Cells[i,j] ? trueHtm : falseHtm);
                }
                sb.Append("\t\t</tr>\n");
                j++;
            }
            sb.Append("\t</tbody>\n</table>");
            return sb.ToString();
        }
    }
    public class DrugUseTables: IDisposable
    {
        private DrugSqlContext _db = new DrugSqlContext();
        private Dictionary<int, Vector> _wards;
        private Dictionary<int, Vector> GetWards()
        {
            if (_wards == null)
            {
                int i = 0;
                _wards = (from w in _db.Wards
                          select w).ToDictionary(w => w.WardId, w => new Vector { Index = i++, Header = w.Fullname });
            }
            return _wards;
        }
        public BooleanTable BolusTable()
        {
            var tbl = new BooleanTable
            {
                Cols = GetWards()
            };
            int i=0;
            tbl.Rows = (from b in _db.BolusDrugs
                        orderby b.DrugName
                        select b).ToDictionary(b=>b.BolusDrugId, b => new Vector{ Index=i++, Header=b.DrugName });
            var usedBoluses = (from s in _db.BolusSortOrdering
                               select s).ToArray();

            tbl.Cells = new bool[tbl.Cols.Count(), tbl.Rows.Count()];
            foreach (var sort in usedBoluses)
            {
                if (sort.BolusDrugId.HasValue)
                {
                    tbl.Cells[tbl.Cols[sort.WardId].Index, tbl.Rows[sort.BolusDrugId.Value].Index] = true;
                }
            }
            return tbl;
        }
        public BooleanTable InfusionTable()
        {
            var tbl = new BooleanTable
            {
                Cols = GetWards()
            };
            int i = 0;
            tbl.Rows = (from b in _db.InfusionDrugs
                        where b.IsTitratable
                        orderby b.Fullname
                        select b).ToDictionary(b => b.InfusionDrugId, b => new Vector { Index = i++, Header = b.Fullname });
            var usedInfusions = (from s in _db.InfusionSortOrderings
                                 select s).ToArray();

            tbl.Cells = new bool[tbl.Cols.Count(), tbl.Rows.Count()];
            foreach (var sort in usedInfusions)
            {
                tbl.Cells[tbl.Cols[sort.WardId].Index, tbl.Rows[sort.InfusionDrugId].Index] = true;
            }
            return tbl;
        }
        public string[] SelectableInfusions()
        {
            return (from b in _db.InfusionDrugs
                    where !b.IsTitratable
                    orderby b.Fullname
                    select b.Fullname).ToArray();
        }
        private bool disposedValue = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    _db.Dispose();
                }
            }
            this.disposedValue = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}