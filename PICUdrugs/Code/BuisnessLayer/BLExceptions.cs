using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PICUdrugs.BLL
{
    [Serializable]
    public class BLexception : Exception
    {
        public BLexception(Exception innerException)
            : this("The buisness logic was violated - see innerException for details", innerException)
        {}
        public BLexception(string message, Exception innerException) : base(message, innerException)
        {}
        public BLexception(string message):base(message)
        {}

    }
    [Serializable]
    public class OverlappingAgeWeightException : BLexception
    {
        public OverlappingAgeWeightException(string message)
            : base(message)
        {        
        }
    }
    [Serializable]
    public class DuplicateDoseCatException : BLexception
    {
        public DuplicateDoseCatException(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class DuplicateConcentrationException : BLexception
    {
        public DuplicateConcentrationException(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class NonAscendingConcentrationException : BLexception
    {
        public NonAscendingConcentrationException(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class NullDoseCatException : BLexception
    {
        public NullDoseCatException(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class NonAscendingRangeException : BLexception
    {
        public NonAscendingRangeException(string variableDescription)
            : base("values for: " + variableDescription + " are not in ascending order")
        {
        }
    }
    [Serializable]
    public class DuplicateTimeException : BLexception
    {
        public DuplicateTimeException(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class DuplicateNameException : BLexception
    {
        public DuplicateNameException(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class ConcUnitDisparity : BLexception
    {
        public ConcUnitDisparity(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class InvalidNullCombination : BLexception
    {
        public InvalidNullCombination(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class HtmlParsingException : BLexception
    {
        public HtmlParsingException(string message)
            : base(message)
        {
        }
        public HtmlParsingException(Exception ex)
            : base(ex)
        {
        }
    }
}