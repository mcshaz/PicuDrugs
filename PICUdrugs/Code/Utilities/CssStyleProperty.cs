using MigraDoc.DocumentObjectModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PICUdrugs.Code.Utilities
{
    public class CssStyleProperty
    {
        public CssStyleProperty (string pair)
        {
            int colonPos = pair.IndexOf(':');
            if (colonPos==-1) {throw new ArgumentException ("pair must be a colon seperated string");}
            Name = pair.Substring(0, colonPos).Trim();
            Value = pair.Substring(colonPos + 1).Trim();
        }
        public string Name { get; private set; }
        public string Value { get; private set; }
    }
}