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
            : base("The buisness logic was violated - see innerException for details", innerException)
        {
        }
    }
    [Serializable]
    public class OverlappingAgeWeightException : Exception
    {
        public OverlappingAgeWeightException(string message)
            : base(message)
        {        
        }
    }
    [Serializable]
    public class DuplicateDoseCatException : Exception
    {
        public DuplicateDoseCatException(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class DuplicateConcentrationException : Exception
    {
        public DuplicateConcentrationException(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class NonAscendingConcentrationException : Exception
    {
        public NonAscendingConcentrationException(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class NullDoseCatException : Exception
    {
        public NullDoseCatException(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class NonAscendingRangeException : Exception
    {
        public NonAscendingRangeException(string variableDescription)
            : base("values for: " + variableDescription.ToUpper() + " are not in ascending order")
        {
        }
    }
    [Serializable]
    public class DuplicateTimeException : Exception
    {
        public DuplicateTimeException(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class DuplicateNameException : Exception
    {
        public DuplicateNameException(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class ConcUnitDisparity : Exception
    {
        public ConcUnitDisparity(string message)
            : base(message)
        {
        }
    }
    [Serializable]
    public class InvalidNullCombination : Exception
    {
        public InvalidNullCombination(string message)
            : base(message)
        {
        }
    }
}