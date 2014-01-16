USE [master]
GO
/****** Object:  Database [PICUdrugs]    Script Date: 06/27/2012 13:43:21 ******/
CREATE DATABASE [PICUdrugs] ON  PRIMARY 
( NAME = N'PICUdrugs_dat', FILENAME = N'C:\Users\OEM\Documents\PICUdrugs.mdf' , SIZE = 4352KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PICUdrugs_log', FILENAME = N'C:\Users\OEM\Documents\PICUdrugs_log.ldf' , SIZE = 1024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PICUdrugs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PICUdrugs] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [PICUdrugs] SET ANSI_NULLS OFF
GO
ALTER DATABASE [PICUdrugs] SET ANSI_PADDING OFF
GO
ALTER DATABASE [PICUdrugs] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [PICUdrugs] SET ARITHABORT OFF
GO
ALTER DATABASE [PICUdrugs] SET AUTO_CLOSE ON
GO
ALTER DATABASE [PICUdrugs] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [PICUdrugs] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [PICUdrugs] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [PICUdrugs] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [PICUdrugs] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [PICUdrugs] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [PICUdrugs] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [PICUdrugs] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [PICUdrugs] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [PICUdrugs] SET  DISABLE_BROKER
GO
ALTER DATABASE [PICUdrugs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [PICUdrugs] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [PICUdrugs] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [PICUdrugs] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [PICUdrugs] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [PICUdrugs] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [PICUdrugs] SET  READ_WRITE
GO
ALTER DATABASE [PICUdrugs] SET RECOVERY SIMPLE
GO
ALTER DATABASE [PICUdrugs] SET  MULTI_USER
GO
ALTER DATABASE [PICUdrugs] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [PICUdrugs] SET DB_CHAINING OFF
GO
USE [PICUdrugs]
GO
/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE ROLE [aspnet_Membership_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE ROLE [aspnet_Membership_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE ROLE [aspnet_Personalization_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE ROLE [aspnet_Profile_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE ROLE [aspnet_Profile_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE ROLE [aspnet_Roles_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE ROLE [aspnet_Roles_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess] AUTHORIZATION [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess] AUTHORIZATION [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess] AUTHORIZATION [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess] AUTHORIZATION [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess] AUTHORIZATION [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess] AUTHORIZATION [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess] AUTHORIZATION [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess] AUTHORIZATION [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess] AUTHORIZATION [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess] AUTHORIZATION [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess] AUTHORIZATION [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess] AUTHORIZATION [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 06/27/2012 13:43:21 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess] AUTHORIZATION [aspnet_Membership_BasicAccess]
GO
/****** Object:  Table [dbo].[wards]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wards](
	[wardID] [int] IDENTITY(1,1) NOT NULL,
	[abbrev] [nvarchar](10) NOT NULL,
 CONSTRAINT [aaaaawards_PK] PRIMARY KEY NONCLUSTERED 
(
	[wardID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_unique_wards] ON [dbo].[wards] 
(
	[abbrev] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'wards' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'abbrev' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'abbrev' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'wards' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'12/09/2011 12:07:29 p.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'11/10/2011 10:00:19 a.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'wards' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wards'
GO
SET IDENTITY_INSERT [dbo].[wards] ON
INSERT [dbo].[wards] ([wardID], [abbrev]) VALUES (1, N'ICU')
INSERT [dbo].[wards] ([wardID], [abbrev]) VALUES (2, N'Emergency')
INSERT [dbo].[wards] ([wardID], [abbrev]) VALUES (3, N'Ward')
SET IDENTITY_INSERT [dbo].[wards] OFF
/****** Object:  Table [dbo].[SIunits]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIunits](
	[SIunitID] [int] IDENTITY(1,1) NOT NULL,
	[Measure] [nvarchar](10) NOT NULL,
 CONSTRAINT [aaaaasiunits_PK] PRIMARY KEY NONCLUSTERED 
(
	[SIunitID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'siunits' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Measure' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Measure' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'siunits' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits', @level2type=N'COLUMN',@level2name=N'Measure'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10/09/2011 7:08:57 p.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'11/10/2011 10:00:19 a.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'siunits' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIunits'
GO
SET IDENTITY_INSERT [dbo].[SIunits] ON
INSERT [dbo].[SIunits] ([SIunitID], [Measure]) VALUES (1, N'grams')
INSERT [dbo].[SIunits] ([SIunitID], [Measure]) VALUES (2, N'units')
INSERT [dbo].[SIunits] ([SIunitID], [Measure]) VALUES (3, N'moles')
INSERT [dbo].[SIunits] ([SIunitID], [Measure]) VALUES (4, N'joules')
INSERT [dbo].[SIunits] ([SIunitID], [Measure]) VALUES (5, N'litres')
SET IDENTITY_INSERT [dbo].[SIunits] OFF
/****** Object:  Table [dbo].[SIprefixes]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIprefixes](
	[SIprefixVal] [int] NOT NULL,
	[strVal] [nvarchar](8) NOT NULL,
 CONSTRAINT [aaaaasiprefixes_PK] PRIMARY KEY NONCLUSTERED 
(
	[SIprefixVal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'logVal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'logVal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'siprefixes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'strVal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'strVal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'siprefixes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes', @level2type=N'COLUMN',@level2name=N'strVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10/09/2011 7:08:57 p.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'11/10/2011 10:00:19 a.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'siprefixes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIprefixes'
GO
INSERT [dbo].[SIprefixes] ([SIprefixVal], [strVal]) VALUES (-12, N'pico')
INSERT [dbo].[SIprefixes] ([SIprefixVal], [strVal]) VALUES (-9, N'nano')
INSERT [dbo].[SIprefixes] ([SIprefixVal], [strVal]) VALUES (-6, N'micro')
INSERT [dbo].[SIprefixes] ([SIprefixVal], [strVal]) VALUES (-3, N'milli')
INSERT [dbo].[SIprefixes] ([SIprefixVal], [strVal]) VALUES (0, N'none')
/****** Object:  Table [dbo].[doseCats]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doseCats](
	[doseCatID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](12) NOT NULL,
	[sortOrder] [tinyint] NOT NULL,
 CONSTRAINT [aaaaadoseCats_PK] PRIMARY KEY NONCLUSTERED 
(
	[doseCatID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'doseCats' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'doseCatID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'doseCats' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10/09/2011 7:08:57 p.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'11/10/2011 10:00:19 a.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'doseCats' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'doseCats'
GO
SET IDENTITY_INSERT [dbo].[doseCats] ON
INSERT [dbo].[doseCats] ([doseCatID], [Category], [sortOrder]) VALUES (1, N'Low', 1)
INSERT [dbo].[doseCats] ([doseCatID], [Category], [sortOrder]) VALUES (2, N'Medium', 2)
INSERT [dbo].[doseCats] ([doseCatID], [Category], [sortOrder]) VALUES (3, N'High', 3)
INSERT [dbo].[doseCats] ([doseCatID], [Category], [sortOrder]) VALUES (5, N'Full', 4)
SET IDENTITY_INSERT [dbo].[doseCats] OFF
/****** Object:  Table [dbo].[dilutionMethods]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dilutionMethods](
	[dilutionMethodID] [int] IDENTITY(1,1) NOT NULL,
	[method] [nvarchar](38) NOT NULL,
	[Neat] [bit] NOT NULL,
	[varyConcentration] [bit] NOT NULL,
	[varyVolume] [bit] NOT NULL,
	[perKg] [bit] NOT NULL,
 CONSTRAINT [aaaaadilutionMethods_PK] PRIMARY KEY NONCLUSTERED 
(
	[dilutionMethodID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'dilutionMethods' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'method' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'method' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'dilutionMethods' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10/09/2011 7:08:57 p.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'11/10/2011 10:00:19 a.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'dilutionMethods' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dilutionMethods'
GO
SET IDENTITY_INSERT [dbo].[dilutionMethods] ON
INSERT [dbo].[dilutionMethods] ([dilutionMethodID], [method], [Neat], [varyConcentration], [varyVolume], [perKg]) VALUES (1, N'Neat, Fixed Rate', 1, 0, 0, 0)
INSERT [dbo].[dilutionMethods] ([dilutionMethodID], [method], [Neat], [varyConcentration], [varyVolume], [perKg]) VALUES (2, N'Neat, Vary Rate by Weight', 1, 0, 0, 1)
INSERT [dbo].[dilutionMethods] ([dilutionMethodID], [method], [Neat], [varyConcentration], [varyVolume], [perKg]) VALUES (3, N'Fixed Dilution, Fixed Rate Range', 0, 0, 0, 0)
INSERT [dbo].[dilutionMethods] ([dilutionMethodID], [method], [Neat], [varyConcentration], [varyVolume], [perKg]) VALUES (4, N'Fixed Dilution, Vary Rate by Weight', 0, 0, 0, 1)
INSERT [dbo].[dilutionMethods] ([dilutionMethodID], [method], [Neat], [varyConcentration], [varyVolume], [perKg]) VALUES (5, N'Vary Dilution Volume, Fixed Rate Range', 0, 1, 1, 1)
INSERT [dbo].[dilutionMethods] ([dilutionMethodID], [method], [Neat], [varyConcentration], [varyVolume], [perKg]) VALUES (6, N'Vary Drug added, Fixed Rate Range', 0, 1, 0, 1)
INSERT [dbo].[dilutionMethods] ([dilutionMethodID], [method], [Neat], [varyConcentration], [varyVolume], [perKg]) VALUES (7, N'Vary Drug added, Vary Dilution Volume', 0, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[dilutionMethods] OFF
/****** Object:  Table [dbo].[cdcWeightStatsByAge]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cdcWeightStatsByAge](
	[Lookupval] [int] NOT NULL,
	[genderText] [nvarchar](1) NOT NULL,
	[ageMonths] [float] NOT NULL,
	[L] [float] NOT NULL,
	[M] [float] NOT NULL,
	[S] [float] NOT NULL,
	[gender] [int] NOT NULL,
 CONSTRAINT [aaaaacdcwtlms_PK] PRIMARY KEY NONCLUSTERED 
(
	[Lookupval] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Lookupval' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Lookupval' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'cdcwtlms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'Lookupval'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'gendertxt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'gendertxt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'cdcwtlms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'genderText'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'agemos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'agemos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'cdcwtlms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'ageMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'L' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'L' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'cdcwtlms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'L'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'M' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'M' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'cdcwtlms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'M'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'S' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'S' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'cdcwtlms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'S'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'gender' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'gender' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'cdcwtlms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10/09/2011 7:08:57 p.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'10/09/2011 7:08:57 p.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'cdcwtlms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'484' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cdcWeightStatsByAge'
GO
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10000, N'M', 0, 1.8151510953903198, 3.530203104019165, 0.15238527953624725, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10005, N'M', 0.5, 1.5475231409072876, 4.0031065940856934, 0.14602501690387726, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10015, N'M', 1.5, 1.0687955617904663, 4.8795251846313477, 0.13647876679897308, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10025, N'M', 2.5, 0.69597351551055908, 5.67288875579834, 0.12967750430107117, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10035, N'M', 3.5, 0.41981509327888489, 6.3913917541503906, 0.12471708655357361, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10045, N'M', 4.5, 0.2198667973279953, 7.0418362617492676, 0.12104012072086334, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10055, N'M', 5.5, 0.077505595982074738, 7.630424976348877, 0.11827120184898377, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10065, N'M', 6.5, -0.021907610818743706, 8.1629514694213867, 0.11615369468927383, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10075, N'M', 7.5, -0.089440897107124329, 8.6448326110839844, 0.11451034992933273, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10085, N'M', 8.5, -0.13340909779071808, 9.0811195373535156, 0.11321716010570526, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10095, N'M', 9.5, -0.16009539365768433, 9.4765005111694336, 0.11218623816967011, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10105, N'M', 10.5, -0.17429685592651367, 9.8353080749511719, 0.1113545373082161, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10115, N'M', 11.5, -0.17971889674663544, 10.161535263061523, 0.11067641526460648, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10125, N'M', 12.5, -0.17925399541854858, 10.458853721618652, 0.11011863499879837, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10135, N'M', 13.5, -0.1751844733953476, 10.730625152587891, 0.1096569374203682, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10145, N'M', 14.5, -0.16932268440723419, 10.979925155639648, 0.10927364975214005, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10155, N'M', 15.5, -0.16311390697956085, 11.209555625915527, 0.10895595699548721, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10165, N'M', 16.5, -0.15770998597145081, 11.422067642211914, 0.10869468003511429, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10175, N'M', 17.5, -0.15402278304100037, 11.619776725769043, 0.10848332196474075, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10185, N'M', 18.5, -0.15276214480400085, 11.804779052734375, 0.10831741243600845, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10195, N'M', 19.5, -0.15446658432483673, 11.97896671295166, 0.10819394141435623, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10205, N'M', 20.5, -0.15952202677726746, 12.14404296875, 0.10811095684766769, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10215, N'M', 21.5, -0.16817925870418549, 12.301541328430176, 0.10806723684072495, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10225, N'M', 22.5, -0.18056680262088776, 12.452830314636231, 0.10806208103895187, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10235, N'M', 23.5, -0.19670195877552033, 12.599135398864746, 0.10809507966041565, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10245, N'M', 24.5, -0.21650120615959168, 12.741543769836426, 0.10816600918769836, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10255, N'M', 25.5, -0.23979048430919647, 12.881022453308106, 0.10827470570802689, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10265, N'M', 26.5, -0.26631584763526917, 13.018424034118652, 0.10842102766036987, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10275, N'M', 27.5, -0.29575496912002563, 13.154496192932129, 0.10860476642847061, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10285, N'M', 28.5, -0.32772937417030334, 13.289896965026856, 0.10882568359375, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10295, N'M', 29.5, -0.36181744933128357, 13.425193786621094, 0.10908342152833939, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10305, N'M', 30.5, -0.39756807684898376, 13.560880661010742, 0.10937757790088654, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10315, N'M', 31.5, -0.43452024459838867, 13.697378158569336, 0.10970764607191086, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10325, N'M', 32.5, -0.47218874096870422, 13.83504581451416, 0.11007308214902878, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10335, N'M', 33.5, -0.510123074054718, 13.97418212890625, 0.11047323793172836, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10345, N'M', 34.5, -0.54788559675216675, 14.115032196044922, 0.11090739816427231, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10355, N'M', 35.5, -0.58507013320922852, 14.257796287536621, 0.11137478798627853, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10365, N'M', 36.5, -0.62131971120834351, 14.402627944946289, 0.11187451332807541, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10375, N'M', 37.5, -0.6562960147857666, 14.549646377563477, 0.1124056875705719, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10385, N'M', 38.5, -0.6897350549697876, 14.698933601379395, 0.11296725273132324, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10395, N'M', 39.5, -0.72141039371490479, 14.850541114807129, 0.11355811357498169, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10405, N'M', 40.5, -0.75117522478103638, 15.004491806030273, 0.11417695879936218, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10415, N'M', 41.5, -0.7789042592048645, 15.160784721374512, 0.11482248455286026, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10425, N'M', 42.5, -0.80451548099517822, 15.319402694702148, 0.1154932901263237, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10435, N'M', 43.5, -0.82800322771072388, 15.480302810668945, 0.11618777364492416, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10445, N'M', 44.5, -0.849380373954773, 15.6434326171875, 0.11690430343151093, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10455, N'M', 45.5, -0.86869966983795166, 15.808725357055664, 0.1176411509513855, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10465, N'M', 46.5, -0.88603401184082031, 15.976104736328125, 0.11839654296636581, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10475, N'M', 47.5, -0.90150785446166992, 16.145481109619141, 0.11916855722665787, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10485, N'M', 48.5, -0.91524159908294678, 16.3167667388916, 0.11995532363653183, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10495, N'M', 49.5, -0.92737776041030884, 16.489864349365234, 0.1207549124956131, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10505, N'M', 50.5, -0.93806982040405273, 16.664674758911133, 0.12156542390584946, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10515, N'M', 51.5, -0.94747793674468994, 16.841098785400391, 0.1223849281668663, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10525, N'M', 52.5, -0.95576566457748413, 17.0190372467041, 0.1232115626335144, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10535, N'M', 53.5, -0.9630969762802124, 17.198390960693359, 0.12404350191354752, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10545, N'M', 54.5, -0.96963346004486084, 17.379062652587891, 0.12487899512052536, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10555, N'M', 55.5, -0.97553235292434692, 17.560962677001953, 0.12571634352207184, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10565, N'M', 56.5, -0.9809378981590271, 17.744001388549805, 0.12655402719974518, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10575, N'M', 57.5, -0.986006498336792, 17.928091049194336, 0.12739045917987824, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10585, N'M', 58.5, -0.99086695909500122, 18.113155364990234, 0.12822429835796356, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10595, N'M', 59.5, -0.99564439058303833, 18.299123764038086, 0.12905427813529968, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10605, N'M', 60.5, -1.0004538297653198, 18.485923767089844, 0.12987925112247467, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10615, N'M', 61.5, -1.0053997039794922, 18.673500061035156, 0.13069821894168854, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10625, N'M', 62.5, -1.0105750560760498, 18.861795425415039, 0.13151024281978607, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10635, N'M', 63.5, -1.0160619020462036, 19.050765991210938, 0.13231459259986877, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10645, N'M', 64.5, -1.0219312906265259, 19.24036979675293, 0.13311059772968292, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10655, N'M', 65.5, -1.0282423496246338, 19.430576324462891, 0.13389775156974793, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10665, N'M', 66.5, -1.0350435972213745, 19.621360778808594, 0.13467566668987274, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10675, N'M', 67.5, -1.0423721075057983, 19.812702178955078, 0.13544408977031708, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10685, N'M', 68.5, -1.050254225730896, 20.004594802856445, 0.1362028568983078, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10695, N'M', 69.5, -1.0587055683135986, 20.197031021118164, 0.13695195317268372, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10705, N'M', 70.5, -1.067731499671936, 20.390018463134766, 0.13769148290157318, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10715, N'M', 71.5, -1.0773211717605591, 20.583568572998047, 0.1384216696023941, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10725, N'M', 72.5, -1.0874712467193604, 20.777694702148438, 0.13914276659488678, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10735, N'M', 73.5, -1.0981529951095581, 20.97242546081543, 0.13985523581504822, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10745, N'M', 74.5, -1.1093341112136841, 21.167791366577148, 0.1405595988035202, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10755, N'M', 75.5, -1.120974063873291, 21.36383056640625, 0.14125649631023407, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10765, N'M', 76.5, -1.13302481174469, 21.560585021972656, 0.14194661378860474, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10775, N'M', 77.5, -1.145431399345398, 21.75810432434082, 0.14263078570365906, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10785, N'M', 78.5, -1.1581325531005859, 21.956445693969727, 0.14330989122390747, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10795, N'M', 79.5, -1.171061635017395, 22.155668258666992, 0.14398492872714996, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10805, N'M', 80.5, -1.184141993522644, 22.355838775634766, 0.1446569561958313, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10815, N'M', 81.5, -1.1973072290420532, 22.557022094726562, 0.14532700181007385, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10825, N'M', 82.5, -1.2104750871658325, 22.759296417236328, 0.14599628746509552, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10835, N'M', 83.5, -1.2235652208328247, 22.962734222412109, 0.14666600525379181, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10845, N'M', 84.5, -1.2364972829818726, 23.16741943359375, 0.14733737707138062, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10855, N'M', 85.5, -1.2491862773895264, 23.373434066772461, 0.148011714220047, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10865, N'M', 86.5, -1.2615554332733154, 23.580862045288086, 0.14869025349617004, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10875, N'M', 87.5, -1.2735235691070557, 23.789791107177734, 0.14937429130077362, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10885, N'M', 88.5, -1.2850137948989868, 24.000310897827148, 0.1500651091337204, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10895, N'M', 89.5, -1.2959520816802979, 24.21251106262207, 0.15076392889022827, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10905, N'M', 90.5, -1.3062684535980225, 24.426481246948242, 0.15147198736667633, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10915, N'M', 91.5, -1.3158975839614868, 24.642311096191406, 0.15219041705131531, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10925, N'M', 92.5, -1.3247787952423096, 24.860095977783203, 0.15292032063007355, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10935, N'M', 93.5, -1.332857608795166, 25.079923629760742, 0.15366272628307343, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10945, N'M', 94.5, -1.3400801420211792, 25.3018856048584, 0.15441863238811493, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10955, N'M', 95.5, -1.3464120626449585, 25.526069641113281, 0.15518876910209656, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10965, N'M', 96.5, -1.3518133163452148, 25.752565383911133, 0.15597391128540039, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10975, N'M', 97.5, -1.356253981590271, 25.981460571289062, 0.15677468478679657, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10985, N'M', 98.5, -1.3597108125686646, 26.212839126586914, 0.15759158134460449, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (10995, N'M', 99.5, -1.3621671199798584, 26.44679069519043, 0.15842495858669281, 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11005, N'M', 100.5, -1.3636124134063721, 26.683395385742188, 0.15927506983280182, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11015, N'M', 101.5, -1.3640421628952026, 26.9227352142334, 0.16014198958873749, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11025, N'M', 102.5, -1.3634577989578247, 27.164892196655273, 0.16102568805217743, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11035, N'M', 103.5, -1.3618656396865845, 27.409944534301758, 0.16192597150802612, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11045, N'M', 104.5, -1.3592826128005981, 27.657970428466797, 0.16284245252609253, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11055, N'M', 105.5, -1.3557205200195313, 27.90904426574707, 0.16377471387386322, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11065, N'M', 106.5, -1.3512024879455566, 28.163242340087891, 0.16472214460372925, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11075, N'M', 107.5, -1.3457543849945068, 28.420637130737305, 0.16568394005298615, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11085, N'M', 108.5, -1.3394054174423218, 28.681299209594727, 0.16665925085544586, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11095, N'M', 109.5, -1.3321881294250488, 28.945301055908203, 0.16764701902866364, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11105, N'M', 110.5, -1.3241374492645264, 29.212705612182617, 0.16864609718322754, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11115, N'M', 111.5, -1.3152910470962524, 29.483585357666016, 0.16965523362159729, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11125, N'M', 112.5, -1.3056882619857788, 29.758001327514648, 0.17067302763462067, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11135, N'M', 113.5, -1.2953698635101318, 30.036020278930664, 0.17169797420501709, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11145, N'M', 114.5, -1.2843749523162842, 30.317703247070312, 0.17272853851318359, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11155, N'M', 115.5, -1.2727508544921875, 30.603111267089844, 0.1737629622220993, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11165, N'M', 116.5, -1.260539174079895, 30.892301559448242, 0.17479948699474335, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11175, N'M', 117.5, -1.2477836608886719, 31.185329437255859, 0.17583627998828888, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11185, N'M', 118.5, -1.2345277070999146, 31.482254028320312, 0.1768714189529419, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11195, N'M', 119.5, -1.2208150625228882, 31.783123016357422, 0.17790290713310242, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11205, N'M', 120.5, -1.206688404083252, 32.087989807128906, 0.17892873287200928, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11215, N'M', 121.5, -1.1921901702880859, 32.396903991699219, 0.17994682490825653, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11225, N'M', 122.5, -1.1773617267608643, 32.709907531738281, 0.18095508217811585, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11235, N'M', 123.5, -1.1622438430786133, 33.027042388916016, 0.18195135891437531, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11245, N'M', 124.5, -1.1468759775161743, 33.348350524902344, 0.18293353915214539, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11255, N'M', 125.5, -1.1312965154647827, 33.673870086669922, 0.18389946222305298, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11265, N'M', 126.5, -1.1155426502227783, 34.003631591796875, 0.18484701216220856, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11275, N'M', 127.5, -1.0996502637863159, 34.337661743164062, 0.18577404320240021, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11285, N'M', 128.5, -1.0836540460586548, 34.675991058349609, 0.18667846918106079, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11295, N'M', 129.5, -1.0675872564315796, 35.018638610839844, 0.18755823373794556, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11305, N'M', 130.5, -1.0514829158782959, 35.365615844726562, 0.18841128051280975, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11315, N'M', 131.5, -1.0353673696517944, 35.716945648193359, 0.18923573195934296, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11325, N'M', 132.5, -1.0192773342132568, 36.072624206542969, 0.19002954661846161, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11335, N'M', 133.5, -1.0032353401184082, 36.432659149169922, 0.19079096615314484, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11345, N'M', 134.5, -0.98726987838745117, 36.797042846679688, 0.19151821732521057, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11355, N'M', 135.5, -0.97140663862228394, 37.165767669677734, 0.19220961630344391, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11365, N'M', 136.5, -0.95567011833190918, 37.538814544677734, 0.19286356866359711, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11375, N'M', 137.5, -0.94008386135101318, 37.916156768798828, 0.19347858428955078, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11385, N'M', 138.5, -0.92467021942138672, 38.297771453857422, 0.1940532773733139, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11395, N'M', 139.5, -0.90945082902908325, 38.683612823486328, 0.1945863664150238, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11405, N'M', 140.5, -0.89444625377655029, 39.073642730712891, 0.19507670402526856, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11415, N'M', 141.5, -0.87967628240585327, 39.467807769775391, 0.19552324712276459, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11425, N'M', 142.5, -0.86516004800796509, 39.866039276123047, 0.19592507183551788, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11435, N'M', 143.5, -0.85091596841812134, 40.268276214599609, 0.19628141820430756, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11445, N'M', 144.5, -0.83696192502975464, 40.6744384765625, 0.19659161567687988, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11455, N'M', 145.5, -0.82331520318984985, 41.084434509277344, 0.19685514271259308, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11465, N'M', 146.5, -0.80999273061752319, 41.498172760009766, 0.1970716267824173, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11475, N'M', 147.5, -0.797011137008667, 41.915546417236328, 0.19724079966545105, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11485, N'M', 148.5, -0.78438669443130493, 42.336441040039062, 0.19736258685588837, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11495, N'M', 149.5, -0.77213549613952637, 42.7607307434082, 0.19743700325489044, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11505, N'M', 150.5, -0.7602735161781311, 43.188285827636719, 0.19746421277523041, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11515, N'M', 151.5, -0.74881595373153687, 43.61895751953125, 0.19744452834129334, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11525, N'M', 152.5, -0.73778039216995239, 44.052593231201172, 0.19737835228443146, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11535, N'M', 153.5, -0.72718155384063721, 44.489028930664062, 0.19726626574993134, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11545, N'M', 154.5, -0.71703547239303589, 44.928092956542969, 0.19710896909236908, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11555, N'M', 155.5, -0.70735836029052734, 45.369602203369141, 0.19690726697444916, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11565, N'M', 156.5, -0.69816642999649048, 45.813362121582031, 0.19666211307048798, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11575, N'M', 157.5, -0.68947631120681763, 46.2591667175293, 0.19637453556060791, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11585, N'M', 158.5, -0.68130475282669067, 46.706806182861328, 0.19604569673538208, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11595, N'M', 159.5, -0.67366868257522583, 47.156059265136719, 0.19567686319351196, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11605, N'M', 160.5, -0.66658520698547363, 47.606689453125, 0.195269376039505, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11615, N'M', 161.5, -0.66006994247436523, 48.058464050292969, 0.19482472538948059, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11625, N'M', 162.5, -0.65414261817932129, 48.511131286621094, 0.1943444162607193, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11635, N'M', 163.5, -0.6488196849822998, 48.964431762695312, 0.19383004307746887, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11645, N'M', 164.5, -0.64411860704422, 49.4181022644043, 0.1932833194732666, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11655, N'M', 165.5, -0.6400567889213562, 49.871875762939453, 0.19270597398281097, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11665, N'M', 166.5, -0.63665139675140381, 50.325466156005859, 0.19209980964660645, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11675, N'M', 167.5, -0.63391929864883423, 50.778591156005859, 0.19146667420864105, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11685, N'M', 168.5, -0.63187688589096069, 51.230964660644531, 0.19080847501754761, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11695, N'M', 169.5, -0.63053995370864868, 51.682285308837891, 0.19012710452079773, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11705, N'M', 170.5, -0.62992334365844727, 52.132259368896484, 0.189424529671669, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11715, N'M', 171.5, -0.63004106283187866, 52.580585479736328, 0.18870271742343903, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11725, N'M', 172.5, -0.63090574741363525, 53.026954650878906, 0.18796363472938538, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11735, N'M', 173.5, -0.63252848386764526, 53.471065521240234, 0.18720927834510803, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11745, N'M', 174.5, -0.634918749332428, 53.9126091003418, 0.18644163012504578, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11755, N'M', 175.5, -0.63808387517929077, 54.351276397705078, 0.1856626570224762, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11765, N'M', 176.5, -0.64202880859375, 54.786766052246094, 0.18487432599067688, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11775, N'M', 177.5, -0.64675599336624146, 55.218776702880859, 0.18407857418060303, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11785, N'M', 178.5, -0.652262270450592, 55.647010803222656, 0.18327733874320984, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11795, N'M', 179.5, -0.65855163335800171, 56.071163177490234, 0.18247242271900177, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11805, N'M', 180.5, -0.66560900211334229, 56.490959167480469, 0.18166577816009522, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11815, N'M', 181.5, -0.67342597246170044, 56.906108856201172, 0.18085917830467224, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11825, N'M', 182.5, -0.68198728561401367, 57.316341400146484, 0.18005439639091492, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11835, N'M', 183.5, -0.69127362966537476, 57.721389770507812, 0.17925314605236054, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11845, N'M', 184.5, -0.701261043548584, 58.120998382568359, 0.17845712602138519, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11855, N'M', 185.5, -0.7119210958480835, 58.514923095703125, 0.17766794562339783, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11865, N'M', 186.5, -0.72321850061416626, 58.902931213378906, 0.17688719928264618, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11875, N'M', 187.5, -0.73512119054794312, 59.284797668457031, 0.17611630260944367, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11885, N'M', 188.5, -0.74758040904998779, 59.660327911376953, 0.17535682022571564, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11895, N'M', 189.5, -0.76055067777633667, 60.029315948486328, 0.17461007833480835, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11905, N'M', 190.5, -0.77398455142974854, 60.391586303710938, 0.17387732863426209, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11915, N'M', 191.5, -0.78781771659851074, 60.746986389160156, 0.17315995693206787, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11925, N'M', 192.5, -0.80199307203292847, 61.095367431640625, 0.17245905101299286, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11935, N'M', 193.5, -0.81644642353057861, 61.436599731445312, 0.17177572846412659, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11945, N'M', 194.5, -0.83111029863357544, 61.770572662353516, 0.17111098766326904, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11955, N'M', 195.5, -0.84591448307037354, 62.097194671630859, 0.17046575248241425, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11965, N'M', 196.5, -0.860786497592926, 62.416385650634766, 0.16984087228775024, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11975, N'M', 197.5, -0.87565219402313232, 62.728092193603516, 0.16923706233501434, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11985, N'M', 198.5, -0.89043629169464111, 63.032276153564453, 0.16865497827529907, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (11995, N'M', 199.5, -0.9050632119178772, 63.32891845703125, 0.16809512674808502, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12005, N'M', 200.5, -0.91945749521255493, 63.618015289306641, 0.16755793988704681, 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12015, N'M', 201.5, -0.93354469537734985, 63.899585723876953, 0.16704371571540833, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12025, N'M', 202.5, -0.94725173711776733, 64.173667907714844, 0.16655264794826508, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12035, N'M', 203.5, -0.960507869720459, 64.440322875976562, 0.16608479619026184, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12045, N'M', 204.5, -0.97324478626251221, 64.699615478515625, 0.16564008593559265, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12055, N'M', 205.5, -0.98539751768112183, 64.951644897460938, 0.16521833837032318, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12065, N'M', 206.5, -0.99690479040145874, 65.196533203125, 0.16481924057006836, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12075, N'M', 207.5, -1.007705569267273, 65.434402465820312, 0.16444237530231476, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12085, N'M', 208.5, -1.0177561044692993, 65.665397644042969, 0.16408710181713104, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12095, N'M', 209.5, -1.0270026922225952, 65.889701843261719, 0.16375279426574707, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12105, N'M', 210.5, -1.0354022979736328, 66.107490539550781, 0.16343866288661957, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12115, N'M', 211.5, -1.0429162979125977, 66.3189697265625, 0.1631438285112381, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12125, N'M', 212.5, -1.0495119094848633, 66.524368286132812, 0.16286730766296387, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12135, N'M', 213.5, -1.0551607608795166, 66.723907470703125, 0.1626080721616745, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12145, N'M', 214.5, -1.0598399639129639, 66.917839050292969, 0.16236500442028046, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12155, N'M', 215.5, -1.0635319948196411, 67.1064224243164, 0.162136971950531, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12165, N'M', 216.5, -1.0662239789962769, 67.289924621582031, 0.16192281246185303, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12175, N'M', 217.5, -1.0679088830947876, 67.468635559082031, 0.16172139346599579, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12185, N'M', 218.5, -1.0685899257659912, 67.642814636230469, 0.16153152287006378, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12195, N'M', 219.5, -1.0682611465454102, 67.8127670288086, 0.16135230660438538, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12205, N'M', 220.5, -1.0669337511062622, 67.978775024414062, 0.16118279099464417, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12215, N'M', 221.5, -1.0646209716796875, 68.14111328125, 0.16102218627929688, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12225, N'M', 222.5, -1.0613417625427246, 68.300048828125, 0.16086994111537933, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12235, N'M', 223.5, -1.0571169853210449, 68.455848693847656, 0.16072578728199005, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12245, N'M', 224.5, -1.051988959312439, 68.608718872070312, 0.16058957576751709, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12255, N'M', 225.5, -1.0459903478622437, 68.758895874023438, 0.16046169400215149, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12265, N'M', 226.5, -1.0391682386398315, 68.906532287597656, 0.16034291684627533, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12275, N'M', 227.5, -1.0315796136856079, 69.051765441894531, 0.1602344810962677, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12285, N'M', 228.5, -1.0232919454574585, 69.194671630859375, 0.16013815999031067, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12295, N'M', 229.5, -1.0143851041793823, 69.335273742675781, 0.16005639731884003, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12305, N'M', 230.5, -1.0049523115158081, 69.4735107421875, 0.15999233722686768, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12315, N'M', 231.5, -0.9951019287109375, 69.609260559082031, 0.15994998812675476, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12325, N'M', 232.5, -0.984958291053772, 69.742279052734375, 0.15993423759937286, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12335, N'M', 233.5, -0.97466331720352173, 69.872238159179688, 0.15995100140571594, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12345, N'M', 234.5, -0.96437656879425049, 69.998687744140625, 0.16000738739967346, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12355, N'M', 235.5, -0.95427495241165161, 70.121040344238281, 0.16011177003383637, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12365, N'M', 236.5, -0.94455116987228394, 70.238571166992188, 0.16027392446994782, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12375, N'M', 237.5, -0.93541043996810913, 70.350395202636719, 0.16050520539283752, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12385, N'M', 238.5, -0.92705976963043213, 70.455459594726562, 0.16081878542900085, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12395, N'M', 239.5, -0.91971844434738159, 70.552520751953125, 0.16122961044311523, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (12400, N'M', 240, -0.91648763418197632, 70.597618103027344, 0.16147679090499878, 1)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20000, N'F', 0, 1.5091874599456787, 3.399186372756958, 0.14210672676563263, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20005, N'F', 0.5, 1.3579443693161011, 3.7975285053253174, 0.13807591795921326, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20015, N'F', 1.5, 1.1055376529693604, 4.544776439666748, 0.13173389434814453, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20025, N'F', 2.5, 0.902596652507782, 5.2305841445922852, 0.12689270079135895, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20035, N'F', 3.5, 0.73412144184112549, 5.8599610328674316, 0.12302517890930176, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20045, N'F', 4.5, 0.59023529291152954, 6.4375877380371094, 0.11984091252088547, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20055, N'F', 5.5, 0.4643915593624115, 6.9678506851196289, 0.11716686934232712, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20065, N'F', 6.5, 0.35216405987739563, 7.4548540115356445, 0.114893838763237, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20075, N'F', 7.5, 0.25049787759780884, 7.9024362564086914, 0.11294964700937271, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20085, N'F', 8.5, 0.15724751353263855, 8.314178466796875, 0.11128468811511993, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20095, N'F', 9.5, 0.070885725319385529, 8.6934185028076172, 0.10986370593309403, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20105, N'F', 10.5, -0.0096849296241998672, 9.0432615280151367, 0.10866077989339829, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20115, N'F', 11.5, -0.08525799959897995, 9.3665933609008789, 0.10765621066093445, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20125, N'F', 12.5, -0.15640945732593536, 9.6660890579223633, 0.10683451592922211, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20135, N'F', 13.5, -0.2235586941242218, 9.9442262649536133, 0.10618308186531067, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20145, N'F', 14.5, -0.2870134711265564, 10.203293800354004, 0.10569123923778534, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20155, N'F', 15.5, -0.34699919819831848, 10.445405960083008, 0.10534963011741638, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20165, N'F', 16.5, -0.4036891758441925, 10.672507286071777, 0.10514975339174271, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20175, N'F', 17.5, -0.45721876621246338, 10.886385917663574, 0.10508366674184799, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20185, N'F', 18.5, -0.50770074129104614, 11.0886812210083, 0.10514375567436218, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20195, N'F', 19.5, -0.55523598194122314, 11.280895233154297, 0.10532257705926895, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20205, N'F', 20.5, -0.59992110729217529, 11.464397430419922, 0.10561277717351914, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20215, N'F', 21.5, -0.64185416698455811, 11.640434265136719, 0.10600702464580536, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20225, N'F', 22.5, -0.68113809823989868, 11.810138702392578, 0.10649795830249786, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20235, N'F', 23.5, -0.71788281202316284, 11.97453784942627, 0.1070781946182251, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20245, N'F', 24.5, -0.75220614671707153, 12.134554862976074, 0.10774034261703491, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20255, N'F', 25.5, -0.784233570098877, 12.291025161743164, 0.10847701132297516, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20265, N'F', 26.5, -0.81409579515457153, 12.444692611694336, 0.10928082466125488, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20275, N'F', 27.5, -0.84193551540374756, 12.596222877502441, 0.1101444885134697, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20285, N'F', 28.5, -0.867889404296875, 12.746209144592285, 0.11106081306934357, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20295, N'F', 29.5, -0.89210265874862671, 12.895172119140625, 0.1120227575302124, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20305, N'F', 30.5, -0.91471880674362183, 13.043571472167969, 0.11302346736192703, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20315, N'F', 31.5, -0.935879647731781, 13.191808700561523, 0.11405631899833679, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20325, N'F', 32.5, -0.95572346448898315, 13.340229034423828, 0.11511494964361191, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20335, N'F', 33.5, -0.97438102960586548, 13.489133834838867, 0.11619333922863007, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20345, N'F', 34.5, -0.99198073148727417, 13.638774871826172, 0.11728575080633164, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20355, N'F', 35.5, -1.0086407661437988, 13.789365768432617, 0.11838684976100922, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20365, N'F', 36.5, -1.0244712829589844, 13.941082954406738, 0.11949166655540466, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20375, N'F', 37.5, -1.0395735502243042, 14.094071388244629, 0.12059565633535385, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20385, N'F', 38.5, -1.054039478302002, 14.248444557189941, 0.12169467657804489, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20395, N'F', 39.5, -1.0679467916488648, 14.404292106628418, 0.12278503179550171, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20405, N'F', 40.5, -1.0813741683959961, 14.561675071716309, 0.12386339902877808, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20415, N'F', 41.5, -1.0943814516067505, 14.720640182495117, 0.12492693960666657, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20425, N'F', 42.5, -1.1070215702056885, 14.881213188171387, 0.12597322463989258, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20435, N'F', 43.5, -1.1193387508392334, 15.043405532836914, 0.12700021266937256, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20445, N'F', 44.5, -1.1313678026199341, 15.20721435546875, 0.12800629436969757, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20455, N'F', 45.5, -1.1431359052658081, 15.372627258300781, 0.12899021804332733, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20465, N'F', 46.5, -1.1546621322631836, 15.539622306823731, 0.12995114922523499, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20475, N'F', 47.5, -1.1659584045410156, 15.708169937133789, 0.13088852167129517, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20485, N'F', 48.5, -1.1770299673080444, 15.878236770629883, 0.13180218636989594, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20495, N'F', 49.5, -1.187870979309082, 16.049783706665039, 0.13269226253032684, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20505, N'F', 50.5, -1.1984840631484985, 16.222770690917969, 0.13355910778045654, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20515, N'F', 51.5, -1.2088539600372315, 16.397153854370117, 0.13440339267253876, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20525, N'F', 52.5, -1.2189650535583496, 16.572891235351562, 0.13522599637508392, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20535, N'F', 53.5, -1.2287982702255249, 16.749942779541016, 0.13602800667285919, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20545, N'F', 54.5, -1.2383308410644531, 16.928266525268555, 0.13681073486804962, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20555, N'F', 55.5, -1.2475379705429077, 17.107826232910156, 0.13757561147212982, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20565, N'F', 56.5, -1.2563921213150024, 17.288589477539062, 0.13832418620586395, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20575, N'F', 57.5, -1.2648648023605347, 17.470523834228516, 0.1390581876039505, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20585, N'F', 58.5, -1.2729259729385376, 17.653606414794922, 0.13977938890457153, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20595, N'F', 59.5, -1.2805451154708862, 17.837818145751953, 0.14048963785171509, 2)
GO
print 'Processed 300 total records'
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20605, N'F', 60.5, -1.2876914739608765, 18.023139953613281, 0.14119084179401398, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20615, N'F', 61.5, -1.2943320274353027, 18.209564208984375, 0.14188496768474579, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20625, N'F', 62.5, -1.3004415035247803, 18.397087097167969, 0.14257393777370453, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20635, N'F', 63.5, -1.3059890270233154, 18.585712432861328, 0.14325970411300659, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20645, N'F', 64.5, -1.3109469413757324, 18.775447845458984, 0.14394421875476837, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20655, N'F', 65.5, -1.3152894973754883, 18.966306686401367, 0.14462935924530029, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20665, N'F', 66.5, -1.3189929723739624, 19.15831184387207, 0.14531698822975159, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20675, N'F', 67.5, -1.3220353126525879, 19.351491928100586, 0.14600890874862671, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20685, N'F', 68.5, -1.3243981599807739, 19.545877456665039, 0.14670681953430176, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20695, N'F', 69.5, -1.3260645866394043, 19.741508483886719, 0.14741235971450806, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20705, N'F', 70.5, -1.3270204067230225, 19.938430786132812, 0.14812710881233215, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20715, N'F', 71.5, -1.327256441116333, 20.136695861816406, 0.14885248243808746, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20725, N'F', 72.5, -1.3267638683319092, 20.336359024047852, 0.14958983659744263, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20735, N'F', 73.5, -1.3255386352539063, 20.537483215332031, 0.15034039318561554, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20745, N'F', 74.5, -1.3235796689987183, 20.740133285522461, 0.15110526978969574, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20755, N'F', 75.5, -1.3208880424499512, 20.944379806518555, 0.15188546478748322, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20765, N'F', 76.5, -1.3174686431884766, 21.150300979614258, 0.15268181264400482, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20775, N'F', 77.5, -1.3133314847946167, 21.357973098754883, 0.15349504351615906, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20785, N'F', 78.5, -1.3084870576858521, 21.567480087280273, 0.15432575345039368, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20795, N'F', 79.5, -1.3029481172561646, 21.778909683227539, 0.15517441928386688, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20805, N'F', 80.5, -1.2967338562011719, 21.992347717285156, 0.15604132413864136, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20815, N'F', 81.5, -1.2898633480072022, 22.2078857421875, 0.15692666172981262, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20825, N'F', 82.5, -1.2823587656021118, 22.425617218017578, 0.15783050656318665, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20835, N'F', 83.5, -1.2742449045181274, 22.645637512207031, 0.15875273942947388, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20845, N'F', 84.5, -1.2655488252639771, 22.8680419921875, 0.1596931666135788, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20855, N'F', 85.5, -1.2562993764877319, 23.092926025390625, 0.16065141558647156, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20865, N'F', 86.5, -1.2465306520462036, 23.320384979248047, 0.16162694990634918, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20875, N'F', 87.5, -1.2362668514251709, 23.550518035888672, 0.16261930763721466, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20885, N'F', 88.5, -1.2255513668060303, 23.783416748046875, 0.16362759470939636, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20895, N'F', 89.5, -1.2144109010696411, 24.019176483154297, 0.16465109586715698, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20905, N'F', 90.5, -1.2028844356536865, 24.257890701293945, 0.16568881273269653, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20915, N'F', 91.5, -1.1910078525543213, 24.49964714050293, 0.16673965752124786, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20925, N'F', 92.5, -1.1788185834884644, 24.744535446166992, 0.16780249774456024, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20935, N'F', 93.5, -1.1663544178009033, 24.992637634277344, 0.1688760370016098, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20945, N'F', 94.5, -1.1536537408828735, 25.244033813476562, 0.16995891928672791, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20955, N'F', 95.5, -1.1407513618469238, 25.498802185058594, 0.17104975879192352, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20965, N'F', 96.5, -1.1276841163635254, 25.757017135620117, 0.17214703559875488, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20975, N'F', 97.5, -1.114490270614624, 26.018743515014648, 0.17324918508529663, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20985, N'F', 98.5, -1.1012048721313477, 26.284042358398438, 0.17435456812381744, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (20995, N'F', 99.5, -1.0878634452819824, 26.552974700927734, 0.17546151578426361, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21005, N'F', 100.5, -1.0745009183883667, 26.825588226318359, 0.17656828463077545, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21015, N'F', 101.5, -1.0611512660980225, 27.1019287109375, 0.17767313122749329, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21025, N'F', 102.5, -1.0478471517562866, 27.382034301757812, 0.17877423763275147, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21035, N'F', 103.5, -1.0346205234527588, 27.665933609008789, 0.17986983060836792, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21045, N'F', 104.5, -1.0215022563934326, 27.953653335571289, 0.18095806241035461, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21055, N'F', 105.5, -1.0085216760635376, 28.245204925537109, 0.1820371150970459, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21065, N'F', 106.5, -0.99570751190185547, 28.54060173034668, 0.18310517072677612, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21075, N'F', 107.5, -0.98308682441711426, 28.839839935302734, 0.18416041135787964, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21085, N'F', 108.5, -0.97068578004837036, 29.142911911010742, 0.185201033949852, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21095, N'F', 109.5, -0.95852917432785034, 29.449802398681641, 0.1862252801656723, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21105, N'F', 110.5, -0.94664055109024048, 29.76048469543457, 0.18723142147064209, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21115, N'F', 111.5, -0.93504244089126587, 30.074926376342773, 0.18821772933006287, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21125, N'F', 112.5, -0.92375606298446655, 30.393081665039062, 0.18918254971504211, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21135, N'F', 113.5, -0.91280144453048706, 30.714900970458984, 0.19012428820133209, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21145, N'F', 114.5, -0.90219765901565552, 31.040321350097656, 0.19104138016700745, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21155, N'F', 115.5, -0.89196252822875977, 31.369274139404297, 0.1919323205947876, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21165, N'F', 116.5, -0.88211292028427124, 31.701681137084961, 0.19279567897319794, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21175, N'F', 117.5, -0.8726646900177002, 32.037448883056641, 0.19363009929656982, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21185, N'F', 118.5, -0.86363273859024048, 32.376487731933594, 0.194434255361557, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21195, N'F', 119.5, -0.85503107309341431, 32.718681335449219, 0.19520695507526398, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21205, N'F', 120.5, -0.84687280654907227, 33.063922882080078, 0.19594700634479523, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21215, N'F', 121.5, -0.83917021751403809, 33.412086486816406, 0.19665336608886719, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21225, N'F', 122.5, -0.831934928894043, 33.763034820556641, 0.19732502102851868, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21235, N'F', 123.5, -0.82517766952514648, 34.116630554199219, 0.19796106219291687, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21245, N'F', 124.5, -0.81890875101089478, 34.472721099853516, 0.19856065511703491, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21255, N'F', 125.5, -0.81313765048980713, 34.831153869628906, 0.19912303984165192, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21265, N'F', 126.5, -0.8078734278678894, 35.1917610168457, 0.19964753091335297, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21275, N'F', 127.5, -0.80312263965606689, 35.554370880126953, 0.20013359189033508, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21285, N'F', 128.5, -0.79889768362045288, 35.918800354003906, 0.20058061182498932, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21295, N'F', 129.5, -0.79520350694656372, 36.284862518310547, 0.20098821818828583, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21305, N'F', 130.5, -0.79204797744750977, 36.652362823486328, 0.20135602355003357, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21315, N'F', 131.5, -0.78943526744842529, 37.0211067199707, 0.20168378949165344, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21325, N'F', 132.5, -0.78737443685531616, 37.390888214111328, 0.20197127759456635, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21335, N'F', 133.5, -0.78587067127227783, 37.761489868164062, 0.20221836864948273, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21345, N'F', 134.5, -0.78492987155914307, 38.132698059082031, 0.20242500305175781, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21355, N'F', 135.5, -0.784557580947876, 38.504295349121094, 0.2025911808013916, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21365, N'F', 136.5, -0.78475916385650635, 38.876056671142578, 0.20271697640419006, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21375, N'F', 137.5, -0.78553968667984009, 39.247745513916016, 0.20280253887176514, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21385, N'F', 138.5, -0.78690409660339355, 39.619140625, 0.20284804701805115, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21395, N'F', 139.5, -0.78885823488235474, 39.9900016784668, 0.20285375416278839, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21405, N'F', 140.5, -0.79140305519104, 40.360092163085938, 0.20282004773616791, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21415, N'F', 141.5, -0.794546365737915, 40.729175567626953, 0.20274724066257477, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21425, N'F', 142.5, -0.798291027545929, 41.097011566162109, 0.20263576507568359, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21435, N'F', 143.5, -0.80264091491699219, 41.463359832763672, 0.20248609781265259, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21445, N'F', 144.5, -0.80759960412979126, 41.827980041503906, 0.20229879021644592, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21455, N'F', 145.5, -0.81317043304443359, 42.190631866455078, 0.20207437872886658, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21465, N'F', 146.5, -0.81935667991638184, 42.551082611083984, 0.20181351900100708, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21475, N'F', 147.5, -0.82616120576858521, 42.909088134765625, 0.20151685178279877, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21485, N'F', 148.5, -0.83358603715896606, 43.2644157409668, 0.20118507742881775, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21495, N'F', 149.5, -0.84163492918014526, 43.6168327331543, 0.20081892609596252, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21505, N'F', 150.5, -0.85030746459960938, 43.966117858886719, 0.20041920244693756, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21515, N'F', 151.5, -0.8596075177192688, 44.312034606933594, 0.19998668134212494, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21525, N'F', 152.5, -0.86953431367874146, 44.654373168945312, 0.1995222270488739, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21535, N'F', 153.5, -0.88008862733840942, 44.992912292480469, 0.19902673363685608, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21545, N'F', 154.5, -0.89127057790756226, 45.327445983886719, 0.1985010951757431, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21555, N'F', 155.5, -0.90307945013046265, 45.657768249511719, 0.19794625043869019, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21565, N'F', 156.5, -0.91551351547241211, 45.983688354492188, 0.19736319780349731, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21575, N'F', 157.5, -0.92856943607330322, 46.305007934570312, 0.19675293564796448, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21585, N'F', 158.5, -0.94224584102630615, 46.621551513671875, 0.19611647725105286, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21595, N'F', 159.5, -0.95653790235519409, 46.933143615722656, 0.19545489549636841, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21605, N'F', 160.5, -0.97144049406051636, 47.239620208740234, 0.19476927816867828, 2)
GO
print 'Processed 400 total records'
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21615, N'F', 161.5, -0.98694729804992676, 47.540824890136719, 0.19406075775623322, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21625, N'F', 162.5, -1.0030509233474731, 47.836616516113281, 0.19333048164844513, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21635, N'F', 163.5, -1.0197423696517944, 48.126850128173828, 0.19257961213588715, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21645, N'F', 164.5, -1.0370117425918579, 48.411411285400391, 0.19180937111377716, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21655, N'F', 165.5, -1.054847002029419, 48.690177917480469, 0.19102099537849426, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21665, N'F', 166.5, -1.0732347965240479, 48.963047027587891, 0.19021573662757874, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21675, N'F', 167.5, -1.0921602249145508, 49.229934692382812, 0.18939490616321564, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21685, N'F', 168.5, -1.1116061210632324, 49.490753173828125, 0.18855980038642883, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21695, N'F', 169.5, -1.1315537691116333, 49.745441436767578, 0.18771180510520935, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21705, N'F', 170.5, -1.1519820690155029, 49.993942260742188, 0.18685226142406464, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21715, N'F', 171.5, -1.1728681325912476, 50.236209869384766, 0.18598261475563049, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21725, N'F', 172.5, -1.19418466091156, 50.472221374511719, 0.18510432541370392, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21735, N'F', 173.5, -1.2159074544906616, 50.701957702636719, 0.18421880900859833, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21745, N'F', 174.5, -1.23800528049469, 50.925411224365234, 0.18332755565643311, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21755, N'F', 175.5, -1.2604455947875977, 51.142593383789062, 0.18243211507797241, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21765, N'F', 176.5, -1.2831935882568359, 51.3535270690918, 0.18153402209281921, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21775, N'F', 177.5, -1.3062120676040649, 51.558246612548828, 0.18063484132289887, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21785, N'F', 178.5, -1.3294609785079956, 51.756805419921875, 0.17973616719245911, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21795, N'F', 179.5, -1.3528980016708374, 51.949256896972656, 0.17883960902690888, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21805, N'F', 180.5, -1.3764781951904297, 52.13568115234375, 0.17794680595397949, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21815, N'F', 181.5, -1.4001544713974, 52.316162109375, 0.17705938220024109, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21825, N'F', 182.5, -1.4238767623901367, 52.490795135498047, 0.17617899179458618, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21835, N'F', 183.5, -1.4475932121276856, 52.659698486328125, 0.17530728876590729, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21845, N'F', 184.5, -1.4712496995925903, 52.8229866027832, 0.17444595694541931, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21855, N'F', 185.5, -1.4947898387908936, 52.980792999267578, 0.17359663546085358, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21865, N'F', 186.5, -1.5181554555892944, 53.133270263671875, 0.1727609783411026, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21875, N'F', 187.5, -1.5412869453430176, 53.280563354492188, 0.1719406396150589, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21885, N'F', 188.5, -1.5641227960586548, 53.422843933105469, 0.17113722860813141, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21895, N'F', 189.5, -1.586600661277771, 53.560283660888672, 0.17035236954689026, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21905, N'F', 190.5, -1.6086570024490356, 53.693065643310547, 0.16958761215209961, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21915, N'F', 191.5, -1.6302276849746704, 53.821384429931641, 0.16884449124336243, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21925, N'F', 192.5, -1.6512482166290283, 53.945438385009766, 0.16812454164028168, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21935, N'F', 193.5, -1.6716538667678833, 54.065433502197266, 0.16742917895317078, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21945, N'F', 194.5, -1.6913806200027466, 54.181583404541016, 0.16675981879234314, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21955, N'F', 195.5, -1.710364580154419, 54.294113159179688, 0.16611778736114502, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21965, N'F', 196.5, -1.7285431623458862, 54.403244018554688, 0.16550436615943909, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21975, N'F', 197.5, -1.7458553314208984, 54.509208679199219, 0.16492074728012085, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21985, N'F', 198.5, -1.7622412443161011, 54.612236022949219, 0.16436804831027985, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (21995, N'F', 199.5, -1.7776437997817993, 54.712566375732422, 0.16384732723236084, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22005, N'F', 200.5, -1.7920079231262207, 54.810440063476562, 0.16335949301719666, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22015, N'F', 201.5, -1.8052816390991211, 54.906097412109375, 0.16290540993213654, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22025, N'F', 202.5, -1.8174163103103638, 54.999778747558594, 0.16248583793640137, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22035, N'F', 203.5, -1.828366756439209, 55.091720581054688, 0.16210140287876129, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22045, N'F', 204.5, -1.8380916118621826, 55.182167053222656, 0.16175264120101929, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22055, N'F', 205.5, -1.8465540409088135, 55.2713508605957, 0.16143994033336639, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22065, N'F', 206.5, -1.8537217378616333, 55.359504699707031, 0.16116362810134888, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22075, N'F', 207.5, -1.8595672845840454, 55.446853637695312, 0.16092383861541748, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22085, N'F', 208.5, -1.8640683889389038, 55.533622741699219, 0.16072060167789459, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22095, N'F', 209.5, -1.8672086000442505, 55.620014190673828, 0.16055384278297424, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22105, N'F', 210.5, -1.8689768314361572, 55.70623779296875, 0.16042332351207733, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22115, N'F', 211.5, -1.8693711757659912, 55.79248046875, 0.16032858192920685, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22125, N'F', 212.5, -1.8683865070343018, 55.878925323486328, 0.16026923060417175, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22135, N'F', 213.5, -1.8660339117050171, 55.965728759765625, 0.16024455428123474, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22145, N'F', 214.5, -1.8623278141021729, 56.053047180175781, 0.16025371849536896, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22155, N'F', 215.5, -1.85728919506073, 56.140998840332031, 0.160295769572258, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22165, N'F', 216.5, -1.850946307182312, 56.229694366455078, 0.16036958992481232, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22175, N'F', 217.5, -1.8433341979980469, 56.319221496582031, 0.16047392785549164, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22185, N'F', 218.5, -1.8344955444335938, 56.409629821777344, 0.16060738265514374, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22195, N'F', 219.5, -1.8244798183441162, 56.500957489013672, 0.16076837480068207, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22205, N'F', 220.5, -1.8133442401885986, 56.59320068359375, 0.16095525026321411, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22215, N'F', 221.5, -1.8011534214019775, 56.686325073242188, 0.16116616129875183, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22225, N'F', 222.5, -1.7879793643951416, 56.7802619934082, 0.16139915585517883, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22235, N'F', 223.5, -1.7739018201828003, 56.874904632568359, 0.16165216267108917, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22245, N'F', 224.5, -1.7590076923370361, 56.970100402832031, 0.16192299127578735, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22255, N'F', 225.5, -1.7433916330337524, 57.065650939941406, 0.16220939159393311, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22265, N'F', 226.5, -1.7271554470062256, 57.16131591796875, 0.1625090092420578, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22275, N'F', 227.5, -1.7104107141494751, 57.256797790527344, 0.16281935572624207, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22285, N'F', 228.5, -1.6932671070098877, 57.351757049560547, 0.16313812136650085, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22295, N'F', 229.5, -1.6758544445037842, 57.445781707763672, 0.16346271336078644, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22305, N'F', 230.5, -1.658302903175354, 57.538402557373047, 0.16379068791866303, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22315, N'F', 231.5, -1.6407474279403687, 57.629100799560547, 0.16411957144737244, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22325, N'F', 232.5, -1.6233328580856323, 57.717277526855469, 0.16444699466228485, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22335, N'F', 233.5, -1.606209397315979, 57.802265167236328, 0.16477063298225403, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22345, N'F', 234.5, -1.5895333290100098, 57.883335113525391, 0.16508829593658447, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22355, N'F', 235.5, -1.5734672546386719, 57.959674835205078, 0.16539788246154785, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22365, N'F', 236.5, -1.5581791400909424, 58.0303955078125, 0.16569750010967255, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22375, N'F', 237.5, -1.5438462495803833, 58.094532012939453, 0.16598539054393768, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22385, N'F', 238.5, -1.5306425094604492, 58.151035308837891, 0.16626010835170746, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22395, N'F', 239.5, -1.5187540054321289, 58.198772430419922, 0.1665203720331192, 2)
INSERT [dbo].[cdcWeightStatsByAge] ([Lookupval], [genderText], [ageMonths], [L], [M], [S], [gender]) VALUES (22400, N'F', 240, -1.5133618116378784, 58.218971252441406, 0.16664475202560425, 2)
/****** Object:  Table [dbo].[bolusDrugs]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bolusDrugs](
	[bolusDrugID] [int] IDENTITY(1,1) NOT NULL,
	[DrugName] [nvarchar](25) NOT NULL,
	[Route] [nvarchar](25) NULL,
	[Conc_ml] [real] NOT NULL,
	[Units] [nvarchar](8) NOT NULL,
	[Amp_conc] [nvarchar](14) NULL,
	[adultMax] [real] NOT NULL,
 CONSTRAINT [aaaaaBolusDose_PK] PRIMARY KEY NONCLUSTERED 
(
	[bolusDrugID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'莮ƸⱠ䗭낙ⓨ쏔' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'BolusDose' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'bolusDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1905' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⩑薪덐䉟֐ꉪ箺ꂜ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'DrugName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'25' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'DrugName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'BolusDose' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'DrugName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'975' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'Ꮋ䟮螢࣍Ꙩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Route' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'25' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Route' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'BolusDose' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Route'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1215' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⵳헆䆚⾖켱﶑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Conc_ml' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Conc_ml' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'BolusDose' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Conc_ml'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'900' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⩑ᆾ辥䙉杅䱉귱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'111' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LimitToList', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListRows', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListWidth', @value=N'0twip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'"ml";"mg";"mcg";"J"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Value List' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Units' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Units' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'BolusDose' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Units'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'䌻墡䏯㪕�ꊳ믾' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Amp_conc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Amp_conc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'BolusDose' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'Amp_conc'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ՠ慘뢮䜃溞望瓞ⲽ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'adultMax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'adultMax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'BolusDose' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs', @level2type=N'COLUMN',@level2name=N'adultMax'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'30/05/2011 11:19:32 a.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'2/11/2011 2:39:12 p.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'BolusDose' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bolusDrugs'
GO
SET IDENTITY_INSERT [dbo].[bolusDrugs] ON
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (1, N'Adrenaline', NULL, 1, N'ml', N'1:10,000', 10)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (2, N'Adrenaline', N'via ETT', 1, N'ml', N'1:1,000', 5)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (3, N'Atropine', NULL, 0.6, N'mg', N'0.6mg/ml', 0.6)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (4, N'Amiodarone', NULL, 50, N'mg', N'150mg/3mls', 300)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (5, N'Propofol', NULL, 10, N'mg', N'200mg/20ml', 200)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (6, N'Fentanyl', NULL, 50, N'mcg', N'100mcg/2ml', 500)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (7, N'Suxamethonium', NULL, 50, N'mg', N'100mg/2ml', 200)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (8, N'Pancuronium', NULL, 2, N'mg', N'4mg/2mls', 8)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (9, N'Rocuronium', NULL, 10, N'mg', N'50mg/5mls', 50)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (10, N'Calcium Gluconate', NULL, 1, N'ml', N'10%', 20)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (11, N'10% Glucose', NULL, 1, N'ml', NULL, 250)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (12, N'Bicarbonate', NULL, 1, N'ml', N'8.4%', 100)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (13, N'Diazepam', NULL, 5, N'mg', N'10mg/2mls', 10)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (17, N'Naloxone', NULL, 400, N'mcg', N'400mcg/1ml', 100)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (15, N'Defibrillation', N'External', 1, N'J', NULL, 150)
INSERT [dbo].[bolusDrugs] ([bolusDrugID], [DrugName], [Route], [Conc_ml], [Units], [Amp_conc], [adultMax]) VALUES (16, N'Defibrillation', N'Internal', 1, N'J', NULL, 100)
SET IDENTITY_INSERT [dbo].[bolusDrugs] OFF
/****** Object:  Table [dbo].[infusionDiluents]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[infusionDiluents](
	[DiluentID] [int] IDENTITY(1,1) NOT NULL,
	[DiluentType] [nvarchar](50) NOT NULL,
	[abbrev] [nchar](13) NOT NULL,
 CONSTRAINT [PK_DrugDiluents] PRIMARY KEY CLUSTERED 
(
	[DiluentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[infusionDiluents] ON
INSERT [dbo].[infusionDiluents] ([DiluentID], [DiluentType], [abbrev]) VALUES (0, N'N/A', N'N/A          ')
INSERT [dbo].[infusionDiluents] ([DiluentID], [DiluentType], [abbrev]) VALUES (2, N'Water for Injection', N'Water        ')
INSERT [dbo].[infusionDiluents] ([DiluentID], [DiluentType], [abbrev]) VALUES (3, N'0.9% Normal Saline', N'Saline       ')
INSERT [dbo].[infusionDiluents] ([DiluentID], [DiluentType], [abbrev]) VALUES (4, N'5% Dextrose', N'5% dex       ')
INSERT [dbo].[infusionDiluents] ([DiluentID], [DiluentType], [abbrev]) VALUES (5, N'Undiluted', N'Neat         ')
INSERT [dbo].[infusionDiluents] ([DiluentID], [DiluentType], [abbrev]) VALUES (6, N'N/Saline or Dextrose', N'Any          ')
INSERT [dbo].[infusionDiluents] ([DiluentID], [DiluentType], [abbrev]) VALUES (7, N'5% Dextrose Preferred', N'5% dex pref. ')
SET IDENTITY_INSERT [dbo].[infusionDiluents] OFF
/****** Object:  Table [dbo].[drugRoutes]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drugRoutes](
	[routeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](50) NOT NULL,
	[abbrev] [nchar](10) NOT NULL,
 CONSTRAINT [PK_drugRoutes] PRIMARY KEY CLUSTERED 
(
	[routeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[drugRoutes] ON
INSERT [dbo].[drugRoutes] ([routeID], [Description], [abbrev]) VALUES (1, N'Central Line Only                                 ', N'CVL only  ')
INSERT [dbo].[drugRoutes] ([routeID], [Description], [abbrev]) VALUES (2, N'Central Line Preferred                            ', N'CVL pref. ')
INSERT [dbo].[drugRoutes] ([routeID], [Description], [abbrev]) VALUES (3, N'Large Peripheral or Central Line                  ', N'Large PIV ')
INSERT [dbo].[drugRoutes] ([routeID], [Description], [abbrev]) VALUES (4, N'Peripheral or Central Line                        ', N'PIV       ')
SET IDENTITY_INSERT [dbo].[drugRoutes] OFF
/****** Object:  Table [dbo].[drugReferenceSource]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drugReferenceSource](
	[drugReferenceID] [int] IDENTITY(1,1) NOT NULL,
	[referenceDescription] [nvarchar](50) NOT NULL,
	[abbrev] [nchar](15) NOT NULL,
	[hyperlink] [nchar](100) NULL,
 CONSTRAINT [PK_drugReferences] PRIMARY KEY CLUSTERED 
(
	[drugReferenceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[drugReferenceSource] ON
INSERT [dbo].[drugReferenceSource] ([drugReferenceID], [referenceDescription], [abbrev], [hyperlink]) VALUES (1, N'Starship Pharmacy Guidelines (paediatric)', N'SS pharm       ', N'file://ahsl6/main/Groups/Everyone/POLICY/Master+file+of+Intranet/Medication+Admin/Paed/IV/          ')
INSERT [dbo].[drugReferenceSource] ([drugReferenceID], [referenceDescription], [abbrev], [hyperlink]) VALUES (2, N'Frank Shann Drug Doses 15th Ed', N'F Shann        ', N'                                                                                                    ')
INSERT [dbo].[drugReferenceSource] ([drugReferenceID], [referenceDescription], [abbrev], [hyperlink]) VALUES (3, N'Starship PICU Protocols', N'PICU RBPs      ', N'http://www.adhb.govt.nz/picu/Protocols/                                                             ')
INSERT [dbo].[drugReferenceSource] ([drugReferenceID], [referenceDescription], [abbrev], [hyperlink]) VALUES (5, N'Notes on Injectable Drugs 6th Ed', N'Notes on Inj   ', N'file://ahsl6/main/Groups/INTRANET/Pharmacy/eNoids6/eNOIDs6Mongraphs/                                ')
SET IDENTITY_INSERT [dbo].[drugReferenceSource] OFF
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications] 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'14304d40-17a0-4d53-bcfe-a5023075b5b1', NULL)
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths] 
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles] 
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'14304d40-17a0-4d53-bcfe-a5023075b5b1', N'f3eb3c2a-a5a4-4459-aec1-781f6c2c885a', N'drugAdmin', N'drugadmin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'14304d40-17a0-4d53-bcfe-a5023075b5b1', N'1437a6d8-9fb5-4de7-89f8-392c8edf34a0', N'wardAdmin', N'wardadmin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'14304d40-17a0-4d53-bcfe-a5023075b5b1', N'b8c0c94f-0cfb-43b5-b307-75bc7d8cdc4e', N'websiteAdmin', N'websiteadmin', NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'14304d40-17a0-4d53-bcfe-a5023075b5b1', N'9f799f1d-b12d-47dd-b7af-db369ab86def', N'brentm', N'brentm', NULL, 0, CAST(0x0000A07A0015E5B3 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'14304d40-17a0-4d53-bcfe-a5023075b5b1', N'835363d0-55cc-40de-a897-61a95096f7e1', N'elainem', N'elainem', NULL, 0, CAST(0x0000A062006C8BA1 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'14304d40-17a0-4d53-bcfe-a5023075b5b1', N'071280bb-edc3-4a1d-b621-683a75d7eb76', N'michaels', N'michaels', NULL, 0, CAST(0x0000A075008AF857 AS DateTime))
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  Table [dbo].[infusionDrugs]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[infusionDrugs](
	[InfusionDrugID] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[abbrev] [nvarchar](24) NULL,
	[SIprefixVal] [int] NOT NULL,
	[SIunitID] [int] NOT NULL,
	[infusionDiluentID] [int] NOT NULL,
	[Note] [ntext] NULL,
	[drugReferenceID] [int] NULL,
	[routeID] [int] NULL,
	[titratable] [bit] NOT NULL,
 CONSTRAINT [aaaaadrugs_PK] PRIMARY KEY NONCLUSTERED 
(
	[InfusionDrugID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_infusionDrugs] ON [dbo].[infusionDrugs] 
(
	[fullname] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'390' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'drugs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'InfusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'3525' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'fullname' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'fullname' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'drugs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2400' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'abbrev' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'24' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'abbrev' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'drugs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'abbrev'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'0;2268' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'110' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'unitPrefixLog10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'siprefix' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'siprefix' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'drugs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'0;2268' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'110' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'quantityMeasures' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'siunit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'siunit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'drugs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'SIunitID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'4125' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Note' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Note' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'drugs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'TextFormat', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10/09/2011 7:08:57 p.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'11/10/2011 10:00:19 a.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'drugs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'26' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionDrugs'
GO
SET IDENTITY_INSERT [dbo].[infusionDrugs] ON
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (1, N'DoPamine', N'Dopamine', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (2, N'DoBUTamine', N'Dobutamine', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (3, N'Adrenaline', N'Adrenaline', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (4, N'Noradrenaline', N'Norad', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (5, N'Glyceryl Trinitrate', N'GTN', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (6, N'Sodium Nitropruside', N'SNP', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (7, N'Milrinone', N'Milrinone', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (8, N'Amiodarone', N'Amiodarone', -3, 1, 0, N'load at 25 mcg/kg for 4hr then', 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (9, N'Vasopressin', N'Vasopressin', 0, 2, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (11, N'Prostaglandin E1', N'Alprostadil', -6, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (12, N'Morphine', N'Morphine', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (13, N'Midazolam', N'Midazolam', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (14, N'Ketamine', N'Ketamine', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (15, N'Frusemide', N'Frusemide', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (16, N'Actrapid Insulin', N'Actrapid', 0, 2, 3, NULL, 3, 4, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (20, N'Salbutamol', N'Salbutamol', -3, 1, 0, N'load at 5-10 mcg/kg/min for 4 hr then', 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (21, N'Aminophyline', N'Aminophyline', -3, 1, 4, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (22, N'Propofol', N'Propofol', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (23, N'Esmolol', N'Esmolol', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (24, N'DoPamine/DoBUTamine', N'DoP/DoBut', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (25, N'Adrenaline/Noradrenaline', N'Adrenaline/Norad', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (26, N'Glyceryl Trinitrate/Sodium Nitropruside', N'GTN/SNP', -3, 1, 0, NULL, 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (27, N'Morphine/Midazolam', N'Morph/Midaz', -3, 1, 0, N'same syringe', 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (28, N'Heparin', N'Heparin', 0, 2, 0, N'see protocol for indications and dosing', 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (30, N'Low Dose Heparin', N'low dose heparin', 0, 2, 0, N'see protocol for indications', 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (31, N'Full Anticoagulation Heparin', N'full dose heparin', 0, 2, 0, N'see protocol for dose adjustments', 3, 1, 1)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (32, N'Acetylcysteine', N'NAC', -3, 1, 4, NULL, 1, 4, 0)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (33, N'Levosimendan', N'Levosimendan', -3, 1, 4, NULL, 1, 4, 0)
INSERT [dbo].[infusionDrugs] ([InfusionDrugID], [fullname], [abbrev], [SIprefixVal], [SIunitID], [infusionDiluentID], [Note], [drugReferenceID], [routeID], [titratable]) VALUES (35, N'Magnesium Sulphate (asthma)', N'Mg', -3, 1, 4, N'may be repeated. keep serum Mg 1.5-2.5mmol/l', 3, 4, 0)
SET IDENTITY_INSERT [dbo].[infusionDrugs] OFF
/****** Object:  Table [dbo].[bolusDoses]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bolusDoses](
	[bolusDoseID] [int] IDENTITY(1,1) NOT NULL,
	[bolusDrugID] [int] NOT NULL,
	[minDosePerKg] [real] NOT NULL,
	[maxDosePerKg] [real] NOT NULL,
	[weightMinimum] [real] NOT NULL,
	[weightMaximum] [real] NOT NULL,
 CONSTRAINT [PK_bolusDoses] PRIMARY KEY CLUSTERED 
(
	[bolusDoseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bolusDoses] ON
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (2, 1, 0.1, 0.1, 0, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (3, 2, 0.1, 0.1, 0, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (4, 3, 0.02, 0.02, 0, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (5, 4, 3, 5, 0, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (6, 5, 1, 3, 0, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (7, 6, 5, 10, 0, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (8, 7, 1, 1, 10, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (9, 8, 0.1, 0.1, 0, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (10, 9, 0.6, 1.2, 0, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (11, 10, 0.5, 0.5, 0, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (12, 11, 2, 5, 0, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (13, 12, 1, 1, 0, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (14, 13, 0.2, 0.2, 0, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (15, 7, 2, 2, 0, 9.9)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (16, 15, 4, 4, 0, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (17, 16, 0.5, 1, 0, 100)
INSERT [dbo].[bolusDoses] ([bolusDoseID], [bolusDrugID], [minDosePerKg], [maxDosePerKg], [weightMinimum], [weightMaximum]) VALUES (24, 17, 2, 2, 0, 100)
SET IDENTITY_INSERT [dbo].[bolusDoses] OFF
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  Table [dbo].[bolusSortOrdering]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bolusSortOrdering](
	[bolusSortOrderID] [int] IDENTITY(1,1) NOT NULL,
	[wardID] [int] NOT NULL,
	[bolusDrugID] [int] NOT NULL,
	[sortOrder] [int] NULL,
 CONSTRAINT [PK_bolusSortOrdering] PRIMARY KEY CLUSTERED 
(
	[bolusSortOrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bolusSortOrdering] ON
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (121, 1, 1, 1)
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (122, 1, 2, 2)
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (123, 1, 3, 3)
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (124, 1, 4, 4)
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (125, 1, 5, 5)
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (126, 1, 6, 6)
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (127, 1, 7, 7)
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (128, 1, 8, 8)
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (129, 1, 9, 9)
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (130, 1, 10, 10)
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (131, 1, 11, 11)
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (132, 1, 12, 12)
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (133, 1, 13, 13)
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (134, 1, 15, 14)
INSERT [dbo].[bolusSortOrdering] ([bolusSortOrderID], [wardID], [bolusDrugID], [sortOrder]) VALUES (135, 1, 16, 15)
SET IDENTITY_INSERT [dbo].[bolusSortOrdering] OFF
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  StoredProcedure [dbo].[pUnusedBolusDrugs]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brent McSharry
-- Create date: 31jan2012
-- Description:	find drugs with no sort order for a particular department
-- =============================================
CREATE PROCEDURE [dbo].[pUnusedBolusDrugs] 
	-- Add the parameters for the stored procedure here
	@wardID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT DISTINCT TOP (100) PERCENT b.bolusDrugID, b.DrugName, b.Route
	FROM         dbo.bolusDrugs as b
	WHERE     (bolusDrugID NOT IN
                          (SELECT DISTINCT bolusDrugID
                            FROM          dbo.bolusSortOrdering
                            WHERE      (wardID = @wardID)))
	ORDER BY b.DrugName, b.Route	
END
GO
/****** Object:  Table [dbo].[infusionSortOrdering]    Script Date: 06/27/2012 13:43:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[infusionSortOrdering](
	[infusionSortOrderID] [int] IDENTITY(1,1) NOT NULL,
	[wardID] [int] NOT NULL,
	[infusionDrugID] [int] NOT NULL,
	[sortOrder] [int] NOT NULL,
 CONSTRAINT [aaaaainfusionOrder_PK] PRIMARY KEY NONCLUSTERED 
(
	[infusionSortOrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'infusionOrder' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionSortOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'0;2268' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'110' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'hospLocations' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ward' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ward' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'infusionOrder' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'wardID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'0;2268' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'110' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'drugNames' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'drug' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'drug' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'infusionOrder' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'sortOrder' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'sortOrder' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'infusionOrder' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering', @level2type=N'COLUMN',@level2name=N'sortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'12/09/2011 12:15:19 p.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'11/10/2011 10:00:19 a.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'infusionOrder' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'infusionSortOrdering'
GO
SET IDENTITY_INSERT [dbo].[infusionSortOrdering] ON
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (153, 1, 24, 1)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (154, 1, 25, 2)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (155, 1, 7, 3)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (156, 1, 12, 4)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (157, 1, 13, 5)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (158, 1, 15, 6)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (159, 1, 8, 7)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (160, 1, 11, 8)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (161, 1, 22, 9)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (162, 1, 14, 10)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (163, 1, 26, 11)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (164, 1, 9, 12)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (165, 1, 16, 13)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (166, 1, 20, 14)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (167, 1, 21, 15)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (168, 1, 30, 16)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (169, 1, 31, 17)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (122, 2, 3, 1)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (123, 2, 8, 2)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (124, 2, 2, 3)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (125, 2, 5, 4)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (126, 2, 14, 5)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (127, 2, 7, 6)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (128, 2, 27, 7)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (129, 2, 4, 8)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (130, 2, 11, 9)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (131, 2, 20, 10)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (132, 2, 6, 11)
INSERT [dbo].[infusionSortOrdering] ([infusionSortOrderID], [wardID], [infusionDrugID], [sortOrder]) VALUES (133, 2, 9, 12)
SET IDENTITY_INSERT [dbo].[infusionSortOrdering] OFF
/****** Object:  Table [dbo].[variableTimeDilutions]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[variableTimeDilutions](
	[infusionDilutionID] [int] IDENTITY(1,1) NOT NULL,
	[infusionDrugID] [int] NOT NULL,
	[dilutionMethodID] [int] NOT NULL,
	[SIprefixVal] [int] NOT NULL,
	[volume] [int] NULL,
	[wtMin] [float] NOT NULL,
	[wtMax] [float] NOT NULL,
	[ageMinMonths] [int] NOT NULL,
	[ageMaxMonths] [int] NOT NULL,
	[rateMin] [float] NOT NULL,
	[rateMax] [float] NOT NULL,
	[perMin] [bit] NOT NULL,
	[roundSigFigs] [float] NULL,
 CONSTRAINT [aaaaastandardInfusions_PK] PRIMARY KEY NONCLUSTERED 
(
	[infusionDilutionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'390' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'standardInfusions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDilutionID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'3780' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'0;2268' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'111' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LimitToList', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListRows', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListWidth', @value=N'0twip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'drugNames' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'drug' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'drug' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'standardInfusions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'infusionDrugID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1755' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'0;2268' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'110' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'dilutionType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'dilutionMethod' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'dilutionMethod' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'standardInfusions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'dilutionMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'0;2268' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'110' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'unitPrefixLog10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Table/View/StoredProc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'siprefix' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'siprefix' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'standardInfusions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'SIprefixVal'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'990' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'finalVol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'finalVol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'standardInfusions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'volume'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1020' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'wtMin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'wtMin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'standardInfusions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMin'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1050' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'wtMax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'wtMax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'standardInfusions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'wtMax'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1110' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ageMin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ageMin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'standardInfusions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMinMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1140' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ageMax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ageMax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'standardInfusions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'ageMaxMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1155' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'rateMin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'rateMin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'standardInfusions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMin'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1185' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'rateMax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'rateMax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'standardInfusions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'rateMax'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1095' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'perMin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'perMin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'standardInfusions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'perMin'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1305' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'RoundSigFigs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'RoundSigFigs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'standardInfusions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions', @level2type=N'COLUMN',@level2name=N'roundSigFigs'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10/09/2011 7:08:57 p.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'11/10/2011 10:00:19 a.m.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'standardInfusions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'61' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'variableTimeDilutions'
GO
SET IDENTITY_INSERT [dbo].[variableTimeDilutions] ON
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (1, 24, 6, -6, 50, 0, 30, 0, 1200, 2.5, 10, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (3, 25, 6, -6, 50, 3, 30, 0, 1200, 0.01, 1, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (7, 26, 6, -6, 50, 0, 30, 0, 1200, 0.5, 5, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (9, 7, 6, -6, 50, 0, 30, 0, 1200, 0.25, 0.75, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (10, 8, 6, -6, 50, 0, 10, 0, 1200, 5, 15, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (11, 8, 6, -6, 50, 10, 40, 0, 1200, 5, 15, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (12, 8, 6, -6, 50, 40, 100, 0, 1200, 5, 15, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (13, 9, 6, 0, 50, 0, 100, 0, 1200, 0.02, 0.06, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (14, 11, 6, -6, 50, 0, 10, 0, 3, 0.005, 0.1, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (15, 12, 6, -6, 50, 0, 29.9, 0, 1200, 10, 40, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (16, 13, 6, -6, 50, 0, 30, 0, 1200, 1, 4, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (17, 14, 6, -6, 50, 0, 100, 0, 1200, 1, 4, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (18, 15, 6, -3, 50, 0, 19.9, 0, 1200, 0.1, 0.3, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (20, 25, 5, -6, NULL, 30, 100, 0, 1200, 0.01, 1, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (26, 24, 5, -6, NULL, 30, 100, 0, 1200, 2.5, 10, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (30, 26, 5, -6, NULL, 30, 100, 0, 1200, 0.5, 5, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (32, 7, 5, -6, NULL, 30, 100, 0, 1200, 0.25, 0.75, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (33, 22, 2, -3, 50, 0, 100, 0, 1200, 0, 3, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (34, 16, 4, 0, 50, 0, 100, 0, 1200, 0.05, 0.1, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (35, 20, 6, -6, 50, 0, 16, 12, 1200, 1, 2, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (36, 20, 2, -6, 50, 16, 100, 12, 1200, 1, 2, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (37, 23, 2, -6, 50, 0, 100, 0, 1200, 25, 300, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (38, 21, 6, -3, 50, 5, 23, 12, 120, 0.7, 0.7, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (39, 21, 2, -3, 50, 23, 100, 12, 120, 0.7, 0.7, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (40, 21, 6, -3, 50, 10, 35, 120, 1200, 1.1, 1.1, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (41, 21, 2, -3, 50, 35, 100, 120, 1200, 1.1, 1.1, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (45, 28, 6, 0, 50, 0, 50, 0, 1200, 10, 10, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (46, 28, 6, 0, 50, 0, 29.9, 0, 1200, 10, 30, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (47, 28, 6, 0, 50, 29.9, 100, 0, 1200, 10, 30, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (48, 15, 1, -3, 25, 20, 100, 36, 1200, 2, 20, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (49, 12, 3, -3, 60, 29.9, 100, 60, 1200, 1, 4, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (50, 1, 6, -6, 50, 0, 30, 0, 1200, 2.5, 10, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (51, 3, 6, -6, 50, 0, 30, 0, 1200, 0.01, 1, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (53, 5, 6, -6, 50, 0, 30, 0, 1200, 0.5, 5, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (54, 2, 6, -6, 50, 0, 30, 0, 1200, 2.5, 10, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (55, 4, 6, -6, 50, 0, 30, 0, 1200, 0.01, 1, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (57, 6, 6, -6, 50, 0, 30, 0, 1200, 0.5, 5, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (58, 3, 5, -6, NULL, 30, 100, 0, 1200, 0.01, 1, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (61, 1, 5, -6, NULL, 30, 100, 0, 1200, 2.5, 10, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (63, 5, 5, -6, NULL, 30, 100, 0, 1200, 0.5, 5, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (64, 4, 5, -6, NULL, 30, 100, 0, 1200, 0.01, 1, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (67, 2, 5, -6, NULL, 30, 100, 0, 1200, 2.5, 10, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (69, 6, 5, -6, NULL, 30, 100, 0, 1200, 0.5, 5, 1, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (70, 28, 6, 0, 50, 50, 100, 0, 1200, 500, 500, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (71, 30, 6, 0, 50, 0, 50, 0, 1200, 10, 10, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (72, 31, 6, 0, 50, 0, 29.9, 0, 1200, 10, 30, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (73, 31, 6, 0, 50, 29.9, 100, 0, 1200, 10, 30, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (74, 30, 3, 0, 50, 50, 100, 0, 1200, 500, 500, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (75, 13, 3, -3, 60, 29.9, 100, 60, 1200, 0.5, 2, 0, 2)
INSERT [dbo].[variableTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [volume], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [rateMin], [rateMax], [perMin], [roundSigFigs]) VALUES (76, 25, 6, -6, NULL, 0, 3, 0, 1200, 0.01, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[variableTimeDilutions] OFF
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
GO
/****** Object:  View [dbo].[bolusDrugView]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[bolusDrugView]
AS
SELECT     dbo.bolusDrugs.DrugName, dbo.bolusDrugs.Route, dbo.bolusDrugs.Conc_ml, dbo.bolusDrugs.Units, dbo.bolusDrugs.Amp_conc, dbo.bolusDrugs.adultMax, 
                      dbo.bolusDoses.minDosePerKg, dbo.bolusDoses.maxDosePerKg, dbo.bolusDoses.weightMinimum, dbo.bolusDoses.weightMaximum
FROM         dbo.bolusDoses INNER JOIN
                      dbo.bolusDrugs ON dbo.bolusDoses.bolusDrugID = dbo.bolusDrugs.bolusDrugID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "bolusDoses"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "bolusDrugs"
            Begin Extent = 
               Top = 0
               Left = 284
               Bottom = 119
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'bolusDrugView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'bolusDrugView'
GO
/****** Object:  Table [dbo].[drugAmpuleConcentrations]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drugAmpuleConcentrations](
	[ampuleConcentrationID] [int] IDENTITY(1,1) NOT NULL,
	[InfusionDrugID] [int] NOT NULL,
	[Concentration] [float] NOT NULL,
	[Volume] [float] NULL,
 CONSTRAINT [PK_drugAmpuleConcentrations] PRIMARY KEY CLUSTERED 
(
	[ampuleConcentrationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[drugAmpuleConcentrations] ON
INSERT [dbo].[drugAmpuleConcentrations] ([ampuleConcentrationID], [InfusionDrugID], [Concentration], [Volume]) VALUES (1, 32, 200, 10)
INSERT [dbo].[drugAmpuleConcentrations] ([ampuleConcentrationID], [InfusionDrugID], [Concentration], [Volume]) VALUES (6, 33, 2.5, 5)
SET IDENTITY_INSERT [dbo].[drugAmpuleConcentrations] OFF
/****** Object:  Table [dbo].[fixedTimeDilutions]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fixedTimeDilutions](
	[infusionDilutionID] [int] IDENTITY(1,1) NOT NULL,
	[infusionDrugID] [int] NOT NULL,
	[dilutionMethodID] [int] NOT NULL,
	[SIprefixVal] [int] NOT NULL,
	[wtMin] [float] NOT NULL,
	[wtMax] [float] NOT NULL,
	[ageMinMonths] [int] NOT NULL,
	[ageMaxMonths] [int] NOT NULL,
	[perMin] [bit] NOT NULL,
	[roundSigFigs] [float] NULL,
	[referencePage] [nchar](50) NULL,
 CONSTRAINT [aaaaafixedTimeDilutions_PK] PRIMARY KEY NONCLUSTERED 
(
	[infusionDilutionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[fixedTimeDilutions] ON
INSERT [dbo].[fixedTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [perMin], [roundSigFigs], [referencePage]) VALUES (1, 32, 7, -3, 0, 20, 0, 144, 0, NULL, N'ACETYLCYSTEINE.pdf                                ')
INSERT [dbo].[fixedTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [perMin], [roundSigFigs], [referencePage]) VALUES (2, 32, 6, -3, 20, 100, 0, 144, 0, NULL, N'ACETYLCYSTEINE.pdf                                ')
INSERT [dbo].[fixedTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [perMin], [roundSigFigs], [referencePage]) VALUES (3, 32, 6, -3, 20, 100, 144, 1200, 0, NULL, N'ACETYLCYSTEINE.pdf                                ')
INSERT [dbo].[fixedTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [perMin], [roundSigFigs], [referencePage]) VALUES (4, 33, 4, -6, 0, 100, 0, 1200, 1, NULL, N'Levosimendan_Paed.pdf                             ')
INSERT [dbo].[fixedTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [perMin], [roundSigFigs], [referencePage]) VALUES (6, 35, 6, -3, 6, 50, 12, 1200, 0, NULL, N'Asthma.pdf                                        ')
INSERT [dbo].[fixedTimeDilutions] ([infusionDilutionID], [infusionDrugID], [dilutionMethodID], [SIprefixVal], [wtMin], [wtMax], [ageMinMonths], [ageMaxMonths], [perMin], [roundSigFigs], [referencePage]) VALUES (7, 35, 3, -3, 50.1, 100, 36, 1200, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[fixedTimeDilutions] OFF
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'071280bb-edc3-4a1d-b621-683a75d7eb76', N'1437a6d8-9fb5-4de7-89f8-392c8edf34a0')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'9f799f1d-b12d-47dd-b7af-db369ab86def', N'b8c0c94f-0cfb-43b5-b307-75bc7d8cdc4e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'835363d0-55cc-40de-a897-61a95096f7e1', N'f3eb3c2a-a5a4-4459-aec1-781f6c2c885a')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'9f799f1d-b12d-47dd-b7af-db369ab86def', N'f3eb3c2a-a5a4-4459-aec1-781f6c2c885a')
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'071280bb-edc3-4a1d-b621-683a75d7eb76', N'wardID:S:0:53:', N'<?xml version="1.0" encoding="utf-16"?>
<int>2</int>', 0x, CAST(0x0000A06D00AA664C AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'9f799f1d-b12d-47dd-b7af-db369ab86def', N'wardID:B:0:-1:', N'', 0x, CAST(0x0000A079016C9CD4 AS DateTime))
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership] 
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'14304d40-17a0-4d53-bcfe-a5023075b5b1', N'9f799f1d-b12d-47dd-b7af-db369ab86def', N'i/Iq0E8gH+UuRY0WmgeK1qDox9c=', 1, N'OnFssXpSTu2cb2HF+on04Q==', NULL, N'brentm@adhb.govt.nz', N'brentm@adhb.govt.nz', NULL, NULL, 1, 0, CAST(0x0000A074009C4A28 AS DateTime), CAST(0x0000A07A0014722E AS DateTime), CAST(0x0000A074009C4A28 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'14304d40-17a0-4d53-bcfe-a5023075b5b1', N'835363d0-55cc-40de-a897-61a95096f7e1', N'0iRDW0JhBp596gl75Fsq9EwyibU=', 1, N'ZwXIydT5qCTAz0+ZTXUbfQ==', NULL, N'emccall@adhb.govt.nz', N'emccall@adhb.govt.nz', NULL, NULL, 1, 0, CAST(0x0000A062006C8B80 AS DateTime), CAST(0x0000A062006C8BA1 AS DateTime), CAST(0x0000A062006C8B80 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'14304d40-17a0-4d53-bcfe-a5023075b5b1', N'071280bb-edc3-4a1d-b621-683a75d7eb76', N'cRRX1ny+WziYu0zxv/6PDyh6QaQ=', 1, N'xpZRoyySTPVA6Xjqhh+UPA==', NULL, N'michaels@adhb.govt.nz', N'michaels@adhb.govt.nz', NULL, NULL, 1, 0, CAST(0x0000A062006CB358 AS DateTime), CAST(0x0000A07500513CB5 AS DateTime), CAST(0x0000A062006CB358 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  Table [dbo].[fixedTimeConcentrations]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fixedTimeConcentrations](
	[infusionConcentrationID] [int] IDENTITY(1,1) NOT NULL,
	[infusionDilutionID] [int] NOT NULL,
	[concentration] [float] NOT NULL,
	[volume] [smallint] NULL,
	[stopMinutes] [int] NOT NULL,
	[rate] [float] NOT NULL,
 CONSTRAINT [aaaaafixedTimeConcentrations_PK] PRIMARY KEY NONCLUSTERED 
(
	[infusionConcentrationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[fixedTimeConcentrations] ON
INSERT [dbo].[fixedTimeConcentrations] ([infusionConcentrationID], [infusionDilutionID], [concentration], [volume], [stopMinutes], [rate]) VALUES (1, 1, 50, 3, 15, 600)
INSERT [dbo].[fixedTimeConcentrations] ([infusionConcentrationID], [infusionDilutionID], [concentration], [volume], [stopMinutes], [rate]) VALUES (11, 1, 7.1428571428571432, 7, 255, 12.5)
INSERT [dbo].[fixedTimeConcentrations] ([infusionConcentrationID], [infusionDilutionID], [concentration], [volume], [stopMinutes], [rate]) VALUES (12, 1, 7.1428571428571432, 14, 1215, 6.25)
INSERT [dbo].[fixedTimeConcentrations] ([infusionConcentrationID], [infusionDilutionID], [concentration], [volume], [stopMinutes], [rate]) VALUES (13, 2, 1.5, 100, 15, 600)
INSERT [dbo].[fixedTimeConcentrations] ([infusionConcentrationID], [infusionDilutionID], [concentration], [volume], [stopMinutes], [rate]) VALUES (14, 2, 0.2, 250, 255, 12.5)
INSERT [dbo].[fixedTimeConcentrations] ([infusionConcentrationID], [infusionDilutionID], [concentration], [volume], [stopMinutes], [rate]) VALUES (15, 2, 0.2, 500, 1215, 6.25)
INSERT [dbo].[fixedTimeConcentrations] ([infusionConcentrationID], [infusionDilutionID], [concentration], [volume], [stopMinutes], [rate]) VALUES (16, 3, 0.75, 200, 15, 600)
INSERT [dbo].[fixedTimeConcentrations] ([infusionConcentrationID], [infusionDilutionID], [concentration], [volume], [stopMinutes], [rate]) VALUES (17, 3, 0.1, 500, 255, 12.5)
INSERT [dbo].[fixedTimeConcentrations] ([infusionConcentrationID], [infusionDilutionID], [concentration], [volume], [stopMinutes], [rate]) VALUES (19, 4, 0.83333333333333337, 250, 1440, 0.2)
INSERT [dbo].[fixedTimeConcentrations] ([infusionConcentrationID], [infusionDilutionID], [concentration], [volume], [stopMinutes], [rate]) VALUES (21, 6, 2.5, 20, 20, 150)
INSERT [dbo].[fixedTimeConcentrations] ([infusionConcentrationID], [infusionDilutionID], [concentration], [volume], [stopMinutes], [rate]) VALUES (22, 7, 125, 20, 20, 7500)
INSERT [dbo].[fixedTimeConcentrations] ([infusionConcentrationID], [infusionDilutionID], [concentration], [volume], [stopMinutes], [rate]) VALUES (18, 3, 0.1, 1000, 1215, 6.25)
SET IDENTITY_INSERT [dbo].[fixedTimeConcentrations] OFF
/****** Object:  UserDefinedFunction [dbo].[standardInfusionsForWard]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brent Mcsharry
-- Create date: 13 Oct 2011
-- Description:	select standard infusions relevant to ward
-- =============================================
CREATE FUNCTION [dbo].[standardInfusionsForWard] 
(	
	-- Add the parameters for the function here
	@wardID int
	 
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
SELECT     TOP (100) PERCENT dbo.infusionSortOrdering.infusionSortOrderID AS viewID, dbo.infusionSortOrdering.sortOrder, dbo.drugs.fullname, 
                      dbo.drugs.abbrev, dbo.drugs.prefixVal AS ampPrefix, dbo.drugs.Note, dbo.siunits.Measure, dbo.doseCats.Category, dbo.standardInfusions.Conc, 
                      dbo.standardInfusions.prefixVal AS infusionPrefix, dbo.standardInfusions.finalVol, dbo.standardInfusions.wtMin, dbo.standardInfusions.wtMax, 
                      dbo.standardInfusions.ageMin, dbo.standardInfusions.ageMax, dbo.standardInfusions.rateMin, dbo.standardInfusions.rateMax, dbo.standardInfusions.perMin, 
                      dbo.standardInfusions.RoundSigFigs, dbo.dilutionMethods.method
FROM         dbo.doseCats INNER JOIN
                      dbo.dilutionMethods INNER JOIN
                      dbo.infusionSortOrdering INNER JOIN
                      dbo.drugs ON dbo.infusionSortOrdering.drugID = dbo.drugs.drugID INNER JOIN
                      dbo.siunits ON dbo.drugs.siunitID = dbo.siunits.siunitID INNER JOIN
                      dbo.standardInfusions ON dbo.drugs.drugID = dbo.standardInfusions.drugID ON dbo.dilutionMethods.methodID = dbo.standardInfusions.methodID ON 
                      dbo.doseCats.doseCatID = dbo.standardInfusions.doseCatID
WHERE dbo.infusionSortOrdering.wardID=@wardID
ORDER BY dbo.infusionSortOrdering.sortOrder)
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
GO
/****** Object:  StoredProcedure [dbo].[pUnusedInfusionDrugsAll]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brent McSharry
-- Create date: 31jan2012
-- Description:	find drugs with no sort order for a particular department
-- =============================================
CREATE PROCEDURE [dbo].[pUnusedInfusionDrugsAll] 
	-- Add the parameters for the stored procedure here
	@wardID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT DISTINCT TOP (100) PERCENT InfusionDrugID, fullname
	FROM         dbo.infusionDrugs
	WHERE     (InfusionDrugID NOT IN
                          (SELECT DISTINCT infusionDrugID
                            FROM          dbo.infusionSortOrdering
                            WHERE      (wardID = @wardID)))
	ORDER BY fullname	
END
GO
/****** Object:  StoredProcedure [dbo].[pUnusedInfusionDrugs]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brent McSharry
-- Create date: 31jan2012
-- Description:	find drugs with no sort order for a particular department
-- =============================================
CREATE PROCEDURE [dbo].[pUnusedInfusionDrugs] 
	-- Add the parameters for the stored procedure here
	@wardID int = 0, @titratable bit = 1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT DISTINCT TOP (100) PERCENT InfusionDrugID, fullname
	FROM         dbo.infusionDrugs d
	WHERE     ((d.titratable=@titratable) AND (d.InfusionDrugID NOT IN
                          (SELECT DISTINCT s.infusionDrugID
                            FROM          dbo.infusionSortOrdering s
                            WHERE      (s.wardID = @wardID))))
	ORDER BY fullname	
END
GO
/****** Object:  Table [dbo].[variableTimeConcentrations]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[variableTimeConcentrations](
	[infusionConcentrationID] [int] IDENTITY(1,1) NOT NULL,
	[doseCatID] [int] NULL,
	[infusionDilutionID] [int] NOT NULL,
	[concentration] [float] NOT NULL,
 CONSTRAINT [aaaaafinalInfusionRate_PK] PRIMARY KEY NONCLUSTERED 
(
	[infusionConcentrationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[variableTimeConcentrations] ON
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (116, NULL, 1, 5)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (117, 3, 3, 0.1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (118, 1, 3, 0.05)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (119, NULL, 7, 1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (120, NULL, 9, 0.25)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (121, NULL, 10, 10)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (122, NULL, 11, 5)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (123, NULL, 12, 2.5)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (124, NULL, 13, 0.02)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (125, NULL, 14, 0.01)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (126, NULL, 15, 10)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (127, NULL, 16, 1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (128, NULL, 17, 1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (129, NULL, 18, 0.5)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (130, 1, 20, 0.01)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (131, 2, 20, 0.02)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (180, 3, 20, 0.05)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (133, 1, 26, 1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (134, 3, 26, 2)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (135, NULL, 30, 0.5)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (136, NULL, 32, 0.1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (137, NULL, 33, 10)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (138, NULL, 34, 1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (139, NULL, 35, 1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (140, NULL, 36, 1000)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (141, NULL, 37, 10)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (142, NULL, 38, 1.1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (143, NULL, 39, 25)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (144, NULL, 40, 0.7)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (145, NULL, 41, 25)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (146, 1, 45, 10)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (147, NULL, 46, 10)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (148, NULL, 47, 4)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (149, NULL, 48, 10)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (150, NULL, 49, 1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (151, NULL, 50, 5)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (152, 3, 51, 0.1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (153, 1, 51, 0.05)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (154, NULL, 53, 1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (155, NULL, 54, 5)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (156, 3, 55, 0.1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (157, 1, 55, 0.05)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (158, NULL, 57, 1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (159, 1, 58, 0.01)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (160, 2, 58, 0.02)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (161, 3, 58, 0.05)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (162, 1, 61, 1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (163, 3, 61, 2)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (164, NULL, 63, 0.5)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (165, 1, 64, 0.01)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (166, 2, 64, 0.02)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (167, 3, 64, 0.05)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (168, 1, 67, 1)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (169, 3, 67, 2)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (170, NULL, 69, 0.5)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (171, 1, 70, 500)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (172, 1, 71, 10)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (173, 5, 72, 10)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (174, 5, 73, 4)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (175, 1, 74, 500)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (176, NULL, 75, 0.5)
INSERT [dbo].[variableTimeConcentrations] ([infusionConcentrationID], [doseCatID], [infusionDilutionID], [concentration]) VALUES (182, 3, 76, 0.1)
SET IDENTITY_INSERT [dbo].[variableTimeConcentrations] OFF
/****** Object:  View [dbo].[variableDurationInfusionView]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[variableDurationInfusionView]
AS
SELECT     TOP (100) PERCENT dbo.infusionSortOrdering.wardID, dbo.infusionDrugs.InfusionDrugID, dbo.infusionDrugs.fullname, dbo.infusionDrugs.abbrev, 
                      dbo.infusionDrugs.SIprefixVal AS ampPrefix, dbo.infusionDrugs.Note, dbo.SIunits.Measure, dbo.doseCats.Category, dilutionMethods.Neat, 
                      dilutionMethods.varyConcentration, dilutionMethods.varyVolume, dilutionMethods.perKg, dbo.infusionSortOrdering.sortOrder AS drugSort, 
                      dbo.doseCats.sortOrder AS categorySort, dbo.variableTimeDilutions.SIprefixVal AS dilutionPrefix, dbo.variableTimeDilutions.volume, dbo.variableTimeDilutions.wtMin,
                       dbo.variableTimeDilutions.wtMax, dbo.variableTimeDilutions.ageMinMonths, dbo.variableTimeDilutions.ageMaxMonths, dbo.variableTimeDilutions.rateMin, 
                      dbo.variableTimeDilutions.rateMax, dbo.variableTimeDilutions.perMin, dbo.variableTimeDilutions.roundSigFigs, dbo.variableTimeConcentrations.concentration
FROM         dbo.SIunits INNER JOIN
                      dbo.infusionDrugs ON dbo.SIunits.SIunitID = dbo.infusionDrugs.SIunitID INNER JOIN
                      dbo.variableTimeDilutions ON dbo.infusionDrugs.InfusionDrugID = dbo.variableTimeDilutions.infusionDrugID INNER JOIN
                      dbo.dilutionMethods AS dilutionMethods ON dbo.variableTimeDilutions.dilutionMethodID = dilutionMethods.dilutionMethodID INNER JOIN
                      dbo.variableTimeConcentrations ON dbo.variableTimeDilutions.infusionDilutionID = dbo.variableTimeConcentrations.infusionDilutionID LEFT OUTER JOIN
                      dbo.doseCats ON dbo.variableTimeConcentrations.doseCatID = dbo.doseCats.doseCatID LEFT OUTER JOIN
                      dbo.infusionSortOrdering ON dbo.infusionDrugs.InfusionDrugID = dbo.infusionSortOrdering.infusionDrugID
ORDER BY drugSort, categorySort
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[50] 4[23] 2[27] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -8
      End
      Begin Tables = 
         Begin Table = "SIunits"
            Begin Extent = 
               Top = 137
               Left = 482
               Bottom = 226
               Right = 642
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "infusionDrugs"
            Begin Extent = 
               Top = 105
               Left = 222
               Bottom = 224
               Right = 384
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dilutionMethods"
            Begin Extent = 
               Top = 0
               Left = 22
               Bottom = 119
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "infusionSortOrdering"
            Begin Extent = 
               Top = 0
               Left = 490
               Bottom = 119
               Right = 675
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "doseCats"
            Begin Extent = 
               Top = 227
               Left = 498
               Bottom = 331
               Right = 658
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "variableTimeDilutions"
            Begin Extent = 
               Top = 181
               Left = 23
               Bottom = 300
               Right = 195
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "variableTimeConcentrations"
            Begin Extent = 
               Top = 232
               Left = 232
               Bottom = 351
             ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'variableDurationInfusionView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1800
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'variableDurationInfusionView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'variableDurationInfusionView'
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 06/27/2012 13:43:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  Default [DF__BolusDose__Conc___787EE5A0]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[bolusDrugs] ADD  CONSTRAINT [DF__BolusDose__Conc___787EE5A0]  DEFAULT ((0)) FOR [Conc_ml]
GO
/****** Object:  Default [DF__BolusDose__adult__7B5B524B]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[bolusDrugs] ADD  CONSTRAINT [DF__BolusDose__adult__7B5B524B]  DEFAULT ((0)) FOR [adultMax]
GO
/****** Object:  Default [DF__aspnet_Ap__Appli__603D47BB]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__3335971A]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__1C5231C2]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
/****** Object:  Default [DF__aspnet_Us__UserI__65F62111]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__66EA454A]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__67DE6983]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
/****** Object:  Default [DF_infusionDrugs_infusionDiluent]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[infusionDrugs] ADD  CONSTRAINT [DF_infusionDrugs_infusionDiluent]  DEFAULT ((0)) FOR [infusionDiluentID]
GO
/****** Object:  Default [DF_infusionDrugs_titratable]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[infusionDrugs] ADD  CONSTRAINT [DF_infusionDrugs_titratable]  DEFAULT ((0)) FOR [titratable]
GO
/****** Object:  Default [DF_bolusDoses_wightMaximum]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[bolusDoses] ADD  CONSTRAINT [DF_bolusDoses_wightMaximum]  DEFAULT ((100)) FOR [weightMaximum]
GO
/****** Object:  Default [DF__standardI__perMi__023D5A04]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[variableTimeDilutions] ADD  CONSTRAINT [DF__standardI__perMi__023D5A04]  DEFAULT ((0)) FOR [perMin]
GO
/****** Object:  Default [DF__aspnet_Perso__Id__3EA749C6]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__aspnet_Me__Passw__7AF13DF7]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
/****** Object:  Check [CK_bolusDoses]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[bolusDoses]  WITH CHECK ADD  CONSTRAINT [CK_bolusDoses] CHECK  (([weightMinimum]>=(0) AND [weightMinimum]<=(100) AND ([weightMaximum]>=(0) AND [weightMaximum]<=(100)) AND [weightMinimum]<[weightMaximum]))
GO
ALTER TABLE [dbo].[bolusDoses] CHECK CONSTRAINT [CK_bolusDoses]
GO
/****** Object:  Check [CK_titratableDilutionsAge]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[variableTimeDilutions]  WITH CHECK ADD  CONSTRAINT [CK_titratableDilutionsAge] CHECK  (([ageMinMonths]>=(0) AND [ageMinMonths]<=(1200) AND ([ageMaxMonths]>=(0) AND [ageMaxMonths]<=(1200)) AND [ageMinMonths]<[ageMaxMonths]))
GO
ALTER TABLE [dbo].[variableTimeDilutions] CHECK CONSTRAINT [CK_titratableDilutionsAge]
GO
/****** Object:  Check [CK_titratableDilutionsRate]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[variableTimeDilutions]  WITH CHECK ADD  CONSTRAINT [CK_titratableDilutionsRate] CHECK  (([rateMin]>=(0) AND [rateMax]<=(100000)))
GO
ALTER TABLE [dbo].[variableTimeDilutions] CHECK CONSTRAINT [CK_titratableDilutionsRate]
GO
/****** Object:  Check [CK_titratableDilutionsWt]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[variableTimeDilutions]  WITH CHECK ADD  CONSTRAINT [CK_titratableDilutionsWt] CHECK  (([wtMin]>=(0) AND [wtMin]<(100) AND ([wtMax]>(0) AND [wtMax]<=(100)) AND [wtMin]<[wtMax]))
GO
ALTER TABLE [dbo].[variableTimeDilutions] CHECK CONSTRAINT [CK_titratableDilutionsWt]
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__324172E1]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__1B5E0D89]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__6501FCD8]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK_infusionDrugs_drugReferences]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[infusionDrugs]  WITH CHECK ADD  CONSTRAINT [FK_infusionDrugs_drugReferences] FOREIGN KEY([drugReferenceID])
REFERENCES [dbo].[drugReferenceSource] ([drugReferenceID])
GO
ALTER TABLE [dbo].[infusionDrugs] CHECK CONSTRAINT [FK_infusionDrugs_drugReferences]
GO
/****** Object:  ForeignKey [FK_infusionDrugs_drugRoutes]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[infusionDrugs]  WITH CHECK ADD  CONSTRAINT [FK_infusionDrugs_drugRoutes] FOREIGN KEY([routeID])
REFERENCES [dbo].[drugRoutes] ([routeID])
GO
ALTER TABLE [dbo].[infusionDrugs] CHECK CONSTRAINT [FK_infusionDrugs_drugRoutes]
GO
/****** Object:  ForeignKey [FK_infusionDrugs_infusionDiluents]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[infusionDrugs]  WITH CHECK ADD  CONSTRAINT [FK_infusionDrugs_infusionDiluents] FOREIGN KEY([infusionDiluentID])
REFERENCES [dbo].[infusionDiluents] ([DiluentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[infusionDrugs] CHECK CONSTRAINT [FK_infusionDrugs_infusionDiluents]
GO
/****** Object:  ForeignKey [FK_InfusionDrugs_SIprefixes]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[infusionDrugs]  WITH CHECK ADD  CONSTRAINT [FK_InfusionDrugs_SIprefixes] FOREIGN KEY([SIprefixVal])
REFERENCES [dbo].[SIprefixes] ([SIprefixVal])
GO
ALTER TABLE [dbo].[infusionDrugs] CHECK CONSTRAINT [FK_InfusionDrugs_SIprefixes]
GO
/****** Object:  ForeignKey [FK_InfusionDrugs_SIunits]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[infusionDrugs]  WITH CHECK ADD  CONSTRAINT [FK_InfusionDrugs_SIunits] FOREIGN KEY([SIunitID])
REFERENCES [dbo].[SIunits] ([SIunitID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[infusionDrugs] CHECK CONSTRAINT [FK_InfusionDrugs_SIunits]
GO
/****** Object:  ForeignKey [FK_bolusDoses_bolusDrugs]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[bolusDoses]  WITH CHECK ADD  CONSTRAINT [FK_bolusDoses_bolusDrugs] FOREIGN KEY([bolusDrugID])
REFERENCES [dbo].[bolusDrugs] ([bolusDrugID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bolusDoses] CHECK CONSTRAINT [FK_bolusDoses_bolusDrugs]
GO
/****** Object:  ForeignKey [FK_bolusSortOrdering_bolusDrugs]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[bolusSortOrdering]  WITH CHECK ADD  CONSTRAINT [FK_bolusSortOrdering_bolusDrugs] FOREIGN KEY([bolusDrugID])
REFERENCES [dbo].[bolusDrugs] ([bolusDrugID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[bolusSortOrdering] CHECK CONSTRAINT [FK_bolusSortOrdering_bolusDrugs]
GO
/****** Object:  ForeignKey [FK_bolusSortOrdering_wards]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[bolusSortOrdering]  WITH CHECK ADD  CONSTRAINT [FK_bolusSortOrdering_wards] FOREIGN KEY([wardID])
REFERENCES [dbo].[wards] ([wardID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bolusSortOrdering] CHECK CONSTRAINT [FK_bolusSortOrdering_wards]
GO
/****** Object:  ForeignKey [FK_infusionSortOrdering_InfusionDrugs]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[infusionSortOrdering]  WITH NOCHECK ADD  CONSTRAINT [FK_infusionSortOrdering_InfusionDrugs] FOREIGN KEY([infusionDrugID])
REFERENCES [dbo].[infusionDrugs] ([InfusionDrugID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[infusionSortOrdering] NOCHECK CONSTRAINT [FK_infusionSortOrdering_InfusionDrugs]
GO
/****** Object:  ForeignKey [FK_infusionSortOrdering_wards]    Script Date: 06/27/2012 13:43:21 ******/
ALTER TABLE [dbo].[infusionSortOrdering]  WITH CHECK ADD  CONSTRAINT [FK_infusionSortOrdering_wards] FOREIGN KEY([wardID])
REFERENCES [dbo].[wards] ([wardID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[infusionSortOrdering] CHECK CONSTRAINT [FK_infusionSortOrdering_wards]
GO
/****** Object:  ForeignKey [FK_InfusionDilutions_dilutionMethods]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[variableTimeDilutions]  WITH CHECK ADD  CONSTRAINT [FK_InfusionDilutions_dilutionMethods] FOREIGN KEY([dilutionMethodID])
REFERENCES [dbo].[dilutionMethods] ([dilutionMethodID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[variableTimeDilutions] CHECK CONSTRAINT [FK_InfusionDilutions_dilutionMethods]
GO
/****** Object:  ForeignKey [FK_InfusionDilutions_InfusionDrugs]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[variableTimeDilutions]  WITH NOCHECK ADD  CONSTRAINT [FK_InfusionDilutions_InfusionDrugs] FOREIGN KEY([infusionDrugID])
REFERENCES [dbo].[infusionDrugs] ([InfusionDrugID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[variableTimeDilutions] NOCHECK CONSTRAINT [FK_InfusionDilutions_InfusionDrugs]
GO
/****** Object:  ForeignKey [FK_InfusionDilutions_SIprefixes]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[variableTimeDilutions]  WITH CHECK ADD  CONSTRAINT [FK_InfusionDilutions_SIprefixes] FOREIGN KEY([SIprefixVal])
REFERENCES [dbo].[SIprefixes] ([SIprefixVal])
GO
ALTER TABLE [dbo].[variableTimeDilutions] CHECK CONSTRAINT [FK_InfusionDilutions_SIprefixes]
GO
/****** Object:  ForeignKey [FK_drugAmpuleConcentrations_infusionDrugs]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[drugAmpuleConcentrations]  WITH CHECK ADD  CONSTRAINT [FK_drugAmpuleConcentrations_infusionDrugs] FOREIGN KEY([InfusionDrugID])
REFERENCES [dbo].[infusionDrugs] ([InfusionDrugID])
GO
ALTER TABLE [dbo].[drugAmpuleConcentrations] CHECK CONSTRAINT [FK_drugAmpuleConcentrations_infusionDrugs]
GO
/****** Object:  ForeignKey [FK_fixedTimeDilutions_dilutionMethods]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[fixedTimeDilutions]  WITH CHECK ADD  CONSTRAINT [FK_fixedTimeDilutions_dilutionMethods] FOREIGN KEY([dilutionMethodID])
REFERENCES [dbo].[dilutionMethods] ([dilutionMethodID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[fixedTimeDilutions] CHECK CONSTRAINT [FK_fixedTimeDilutions_dilutionMethods]
GO
/****** Object:  ForeignKey [FK_fixedTimeDilutions_infusionDrugs]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[fixedTimeDilutions]  WITH CHECK ADD  CONSTRAINT [FK_fixedTimeDilutions_infusionDrugs] FOREIGN KEY([infusionDrugID])
REFERENCES [dbo].[infusionDrugs] ([InfusionDrugID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[fixedTimeDilutions] CHECK CONSTRAINT [FK_fixedTimeDilutions_infusionDrugs]
GO
/****** Object:  ForeignKey [FK_fixedTimeDilutions_SIprefixes]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[fixedTimeDilutions]  WITH CHECK ADD  CONSTRAINT [FK_fixedTimeDilutions_SIprefixes] FOREIGN KEY([SIprefixVal])
REFERENCES [dbo].[SIprefixes] ([SIprefixVal])
GO
ALTER TABLE [dbo].[fixedTimeDilutions] CHECK CONSTRAINT [FK_fixedTimeDilutions_SIprefixes]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__220B0B18]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__2116E6DF]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__3F9B6DFF]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__408F9238]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__0FEC5ADD]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__7908F585]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__79FD19BE]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__39E294A9]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK_fixedTimeConcentrations_fixedTimeDilutions]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[fixedTimeConcentrations]  WITH CHECK ADD  CONSTRAINT [FK_fixedTimeConcentrations_fixedTimeDilutions] FOREIGN KEY([infusionDilutionID])
REFERENCES [dbo].[fixedTimeDilutions] ([infusionDilutionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[fixedTimeConcentrations] CHECK CONSTRAINT [FK_fixedTimeConcentrations_fixedTimeDilutions]
GO
/****** Object:  ForeignKey [FK_finalInfusionConcentrations_doseCats]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[variableTimeConcentrations]  WITH CHECK ADD  CONSTRAINT [FK_finalInfusionConcentrations_doseCats] FOREIGN KEY([doseCatID])
REFERENCES [dbo].[doseCats] ([doseCatID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[variableTimeConcentrations] CHECK CONSTRAINT [FK_finalInfusionConcentrations_doseCats]
GO
/****** Object:  ForeignKey [FK_finalInfusionConcentrations_InfusionDilutions]    Script Date: 06/27/2012 13:43:22 ******/
ALTER TABLE [dbo].[variableTimeConcentrations]  WITH CHECK ADD  CONSTRAINT [FK_finalInfusionConcentrations_InfusionDilutions] FOREIGN KEY([infusionDilutionID])
REFERENCES [dbo].[variableTimeDilutions] ([infusionDilutionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[variableTimeConcentrations] CHECK CONSTRAINT [FK_finalInfusionConcentrations_InfusionDilutions]
GO
