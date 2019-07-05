using DBToJSON.SqlEntities.Enums;


namespace PICUdrugs.Code.Utilities
{
    public static class UnitString
    {
        public static string UserSafeShortSiUnit(SiUnit unit)
        {
            switch (unit)
            {
                case SiUnit.gram:
                    return "g";
                case SiUnit.joule:
                    return "J";
                case SiUnit.litre:
                    return "L";
                default:
                    return unit.ToString();
            }
        }
    }
}