using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PICUdrugs.Code.Utilities
{
    public class StyleProperties
    {
        public StyleProperties(string attributeList)
        {
            foreach (string style in attributeList.Split(';'))
            {
                int c = style.IndexOf(':');
                if (c == -1) { continue; }
                string val = style.Substring(c+1).Trim();
                switch (style.Substring(0, c).Trim())
                {
                    case "color":
                        byte[] bytes = new byte[3];
                        using (var sr = new System.IO.StringReader(val))
                        {
                            sr.Read(); // advance past #
                            for (int i = 0; i < 3; i++)
                            {
                                bytes[i] = Convert.ToByte(new string(new char[2]{(char)sr.Read(), (char)sr.Read()}), 16);
                            }
                        }
                        break;
                    case "font-size":
                        FontSize = val.EndsWith("pt")? int.Parse(val.Substring(0, val.Length - 2)): 12*int.Parse(val); 
                        break;
                    case "font-family":
                        FontFamily = val;
                        break;
                    case "text-decoration":
                        if (val == "underline")
                        {
                            Underline = true;
                        }
                        break;
                }
            }
        }
        public int? FontSize { get; set; }
        public byte[] Color {get; set;}
        public string FontFamily {get; set;}
        public bool Underline {get; set;}
    }
}