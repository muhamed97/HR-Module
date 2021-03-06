USE [master]
GO
/****** Object:  Database [HRModuleAll]    Script Date: 9/16/2019 12:01:32 PM ******/
CREATE DATABASE [HRModuleAll]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HRModuleAll', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MME\MSSQL\DATA\HRModuleAll.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HRModuleAll_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MME\MSSQL\DATA\HRModuleAll_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HRModuleAll] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HRModuleAll].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HRModuleAll] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HRModuleAll] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HRModuleAll] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HRModuleAll] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HRModuleAll] SET ARITHABORT OFF 
GO
ALTER DATABASE [HRModuleAll] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HRModuleAll] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HRModuleAll] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HRModuleAll] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HRModuleAll] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HRModuleAll] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HRModuleAll] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HRModuleAll] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HRModuleAll] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HRModuleAll] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HRModuleAll] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HRModuleAll] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HRModuleAll] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HRModuleAll] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HRModuleAll] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HRModuleAll] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HRModuleAll] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HRModuleAll] SET RECOVERY FULL 
GO
ALTER DATABASE [HRModuleAll] SET  MULTI_USER 
GO
ALTER DATABASE [HRModuleAll] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HRModuleAll] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HRModuleAll] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HRModuleAll] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HRModuleAll] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HRModuleAll] SET QUERY_STORE = OFF
GO
USE [HRModuleAll]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [HRModuleAll]
GO
/****** Object:  Table [dbo].[TbBranches]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbBranches](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [nvarchar](100) NULL,
	[CompanyID] [int] NOT NULL,
	[BranchMail] [nvarchar](100) NOT NULL,
	[BranchPhone] [int] NOT NULL,
	[BranchFax] [int] NOT NULL,
	[BranchAddress] [nvarchar](300) NULL,
	[BranchStartDate] [date] NULL,
 CONSTRAINT [PK__TbBranch__A1682FA5685B63F5] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbCompanies]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbCompanies](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[CompanyPhone] [varchar](15) NOT NULL,
	[CompanyFax] [varchar](15) NOT NULL,
	[CompanyCreationDate] [date] NOT NULL,
	[CompanyAddress] [nvarchar](300) NOT NULL,
	[CompanyLogo] [varbinary](max) NULL,
	[CompanyEmail] [varchar](100) NOT NULL,
	[CompanyEmailBox] [varchar](7) NOT NULL,
 CONSTRAINT [PK_TbCompanies] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbDepartments]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbDepartments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[DepartmentPhone] [varchar](15) NOT NULL,
	[DepartmentFax] [varchar](10) NOT NULL,
	[DepartmentEmail] [varchar](150) NOT NULL,
	[DepartmentNotes] [nvarchar](500) NULL,
	[IsDeleted] [bit] NOT NULL,
	[BranchID] [int] NOT NULL,
 CONSTRAINT [PK_TbDepartments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vw_ShowOrganizationUnitData]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[Vw_ShowOrganizationUnitData]
as

SELECT        dbo.TbBranches.BranchID, dbo.TbBranches.BranchName, dbo.TbCompanies.CompanyID, dbo.TbCompanies.CompanyName, dbo.TbDepartments.DepartmentID, dbo.TbDepartments.DepartmentName
FROM            dbo.TbBranches full JOIN
                         dbo.TbCompanies ON dbo.TbBranches.CompanyID = dbo.TbCompanies.CompanyID full JOIN
                         dbo.TbDepartments ON dbo.TbBranches.BranchID = dbo.TbDepartments.BranchID
						 group by TbCompanies.CompanyID, CompanyName,TbBranches.BranchID , BranchName, TbDepartments.DepartmentID , DepartmentName 

GO
/****** Object:  View [dbo].[Vw_Comp_Branch_Dep]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[Vw_Comp_Branch_Dep]
AS
SELECT        dbo.TbCompanies.CompanyName, dbo.TbBranches.BranchName, dbo.TbDepartments.DepartmentName
FROM            dbo.TbBranches full JOIN
                         dbo.TbCompanies ON dbo.TbBranches.CompanyID = dbo.TbCompanies.CompanyID full JOIN
                         dbo.TbDepartments ON dbo.TbBranches.BranchID = dbo.TbDepartments.BranchID
						 group by CompanyName,BranchName,DepartmentName



GO
/****** Object:  Table [dbo].[TbEmployees]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbEmployees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](100) NOT NULL,
	[Password] [varchar](50) NULL,
	[BasicHoliday] [int] NULL,
	[ExtraHoliday] [int] NULL,
	[EmployeVariableSalary] [decimal](9, 2) NULL,
	[EmployeBasicSalary] [decimal](9, 2) NOT NULL,
	[HireDate] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsTerminated] [bit] NOT NULL,
	[PositionId] [int] NOT NULL,
	[JobTilteId] [int] NOT NULL,
	[EducationId] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[InsuranceID] [int] NOT NULL,
 CONSTRAINT [PK_TbEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vw_HolidayReadEmployeeName]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[Vw_HolidayReadEmployeeName]
as
select  EmployeeID, EmployeeName,ExtraHoliday,BasicHoliday
from TbEmployees
GO
/****** Object:  Table [dbo].[TbHolidayTypes]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbHolidayTypes](
	[HolidayTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NOT NULL,
	[MaxDays] [tinyint] NOT NULL,
	[Percentage] [float] NULL,
	[IsDeduct] [bit] NOT NULL,
 CONSTRAINT [PK_TbHolidayTypes] PRIMARY KEY CLUSTERED 
(
	[HolidayTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vw_HolidayReadTypeName]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Vw_HolidayReadTypeName]
as
select  HolidayTypeID, TypeName
from TbHolidayTypes
GO
/****** Object:  View [dbo].[Vw_HolidayDetailReadExtraHolidayForOnEmployee]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Vw_HolidayDetailReadExtraHolidayForOnEmployee]
as
select EmployeeID,ExtraHoliday
from TbEmployees
GO
/****** Object:  Table [dbo].[payRollLast]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payRollLast](
	[PayRollId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[PayRollDate] [date] NOT NULL,
	[SumOfAdditionals] [decimal](9, 2) NULL,
	[SumOfDeductions] [decimal](9, 2) NULL,
	[SumOf Insurance] [decimal](9, 2) NULL,
	[SumOfTaxes] [decimal](9, 2) NULL,
	[Total] [decimal](9, 2) NULL,
 CONSTRAINT [PK_payRollLast_1] PRIMARY KEY CLUSTERED 
(
	[PayRollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PayrollTransactions]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_PayrollTransactions](
	[PayRollId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[PayRollDate] [date] NOT NULL,
	[SumOfAdditionals] [decimal](9, 2) NULL,
	[SumOfDeductions] [decimal](9, 2) NULL,
	[SumOf Insurance] [decimal](9, 2) NULL,
	[SumOfTaxes] [decimal](9, 2) NULL,
	[Total] [decimal](9, 2) NULL,
 CONSTRAINT [PK_Tb_PayrollTransactions_1] PRIMARY KEY CLUSTERED 
(
	[PayRollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbAdditionDetails]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbAdditionDetails](
	[AdditionDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[AdditionID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Notes] [nvarchar](500) NULL,
	[AdditionDetailsDate] [date] NULL,
	[Amount] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_TbAdditionDetails] PRIMARY KEY CLUSTERED 
(
	[AdditionDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbAdditions]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbAdditions](
	[AdditionID] [int] IDENTITY(1,1) NOT NULL,
	[AdditionName] [nvarchar](100) NOT NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_TbAdditions] PRIMARY KEY CLUSTERED 
(
	[AdditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbAttendences]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbAttendences](
	[AttendID] [int] IDENTITY(1,1) NOT NULL,
	[AttendFrom] [time](0) NULL,
	[AttendTo] [time](0) NULL,
	[Delay] [time](0) NULL,
	[Date] [date] NULL,
	[EmployeeID] [int] NOT NULL,
	[ShiftID] [int] NOT NULL,
	[Notes] [nvarchar](500) NULL,
	[AttendenceStatus] [char](1) NULL,
 CONSTRAINT [PK_TbAttendences] PRIMARY KEY CLUSTERED 
(
	[AttendID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbCalenders]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbCalenders](
	[CalenderID] [smallint] IDENTITY(1,1) NOT NULL,
	[CalenderDate] [date] NOT NULL,
	[IsVac] [bit] NOT NULL,
	[MonthID] [smallint] NOT NULL,
 CONSTRAINT [PK_TbCalenders] PRIMARY KEY CLUSTERED 
(
	[CalenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbDeductionDetails]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbDeductionDetails](
	[DeductionDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[DeductionID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Notes] [nvarchar](500) NULL,
	[DeductionDetailsDate] [date] NULL,
	[Amount] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_TbDeductionDetails] PRIMARY KEY CLUSTERED 
(
	[DeductionDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbDeductions]    Script Date: 9/16/2019 12:01:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbDeductions](
	[DeductionID] [int] IDENTITY(1,1) NOT NULL,
	[DeductionName] [nvarchar](100) NOT NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_TbDeductions] PRIMARY KEY CLUSTERED 
(
	[DeductionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbEducations]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbEducations](
	[EducationID] [int] IDENTITY(1,1) NOT NULL,
	[EducationName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TbEducations] PRIMARY KEY CLUSTERED 
(
	[EducationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbEmployeeMasterData]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbEmployeeMasterData](
	[EmployeeID] [int] NOT NULL,
	[NationalID] [varchar](14) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Gender] [bit] NOT NULL,
	[BloodType] [char](3) NOT NULL,
	[Nationality] [nvarchar](100) NOT NULL,
	[MartialStatus] [int] NOT NULL,
	[FatherName] [nvarchar](100) NOT NULL,
	[MotherName] [nvarchar](100) NOT NULL,
	[EmployeePhoto] [varbinary](max) NULL,
	[Email] [varchar](100) NOT NULL,
	[Mobile] [varchar](300) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_TbEmployeeMasterData] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbHolidayDetails]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbHolidayDetails](
	[HolidayDetailID] [int] IDENTITY(1,1) NOT NULL,
	[HolidayTypeID] [int] NULL,
	[EmployeeID] [int] NULL,
	[HolidayActualDate] [date] NULL,
	[HolidayStart] [date] NULL,
	[HolidayEnd] [date] NULL,
	[DaysNumber] [int] NULL,
 CONSTRAINT [PK_TbHolidayDetails] PRIMARY KEY CLUSTERED 
(
	[HolidayDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbInsurancesTypes]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbInsurancesTypes](
	[InsuranceID] [int] IDENTITY(1,1) NOT NULL,
	[EnsuranceType] [nvarchar](50) NOT NULL,
	[EmpFixedSalaryInsu] [decimal](9, 2) NOT NULL,
	[ComFixedSalaryInsu] [decimal](9, 2) NOT NULL,
	[EmpVarSalaryInsu] [decimal](9, 2) NOT NULL,
	[ComVarSalaryInsu] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_TbInsurances] PRIMARY KEY CLUSTERED 
(
	[InsuranceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbJobTitles]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbJobTitles](
	[JobTitleID] [int] IDENTITY(1,1) NOT NULL,
	[JobTitleName] [nvarchar](100) NULL,
 CONSTRAINT [PK_TbJobTitle] PRIMARY KEY CLUSTERED 
(
	[JobTitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbMonths]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbMonths](
	[MonthID] [smallint] IDENTITY(1,1) NOT NULL,
	[MonthNumber] [tinyint] NOT NULL,
	[MonthTotalDays] [tinyint] NOT NULL,
	[MonthActualWorkDays] [tinyint] NOT NULL,
	[YearID] [tinyint] NOT NULL,
 CONSTRAINT [PK_TbMonths] PRIMARY KEY CLUSTERED 
(
	[MonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbPayrollAudits]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbPayrollAudits](
	[PayrollAuditID] [int] IDENTITY(1,1) NOT NULL,
	[OldSalary] [decimal](9, 2) NOT NULL,
	[NewSalary] [decimal](9, 2) NOT NULL,
	[PayrollAuditDate] [date] NOT NULL,
 CONSTRAINT [PK_TbPayrollAudits] PRIMARY KEY CLUSTERED 
(
	[PayrollAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbPayrolls]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbPayrolls](
	[PayrollID] [int] IDENTITY(1,1) NOT NULL,
	[NetSalary] [decimal](9, 2) NOT NULL,
	[MonthDate] [date] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_TbPayrolls] PRIMARY KEY CLUSTERED 
(
	[PayrollID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbPositions]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbPositions](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](100) NULL,
 CONSTRAINT [PK_TbPositions] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbSalaryAudits]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbSalaryAudits](
	[SalaryAuditID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[OldSalary] [decimal](9, 2) NULL,
	[NewSalary] [decimal](9, 2) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_TbSalaryAudits] PRIMARY KEY CLUSTERED 
(
	[SalaryAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbSalaryStaticInfo]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbSalaryStaticInfo](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[InsuranceID] [int] NULL,
	[InsuEmpFixSalaryCalc] [decimal](9, 2) NULL,
	[InsuCompFixSalaryCalc] [decimal](9, 2) NULL,
	[InsuEmpVarSalaryCalc] [decimal](9, 2) NULL,
	[InsuCompVarSalaryCalc] [decimal](9, 2) NULL,
 CONSTRAINT [PK_TbPayrolles] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbShifts]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbShifts](
	[ShiftID] [int] IDENTITY(1,1) NOT NULL,
	[ShiftName] [nvarchar](100) NOT NULL,
	[ShiftStart] [time](1) NOT NULL,
	[ShiftEnd] [time](1) NOT NULL,
	[DelayTime] [int] NULL,
	[LeaveEarlyByMinuts] [int] NULL,
	[BeginningIn] [time](1) NULL,
	[EndingIn] [time](1) NULL,
	[BeginningOut] [time](1) NULL,
	[EndingOut] [time](1) NULL,
	[CountAsWorkDay] [int] NULL,
	[CountAsMinuts] [int] NULL,
	[Notes] [nvarchar](500) NULL,
	[ChekIn] [bit] NULL,
	[CheckOut] [bit] NULL,
 CONSTRAINT [PK_TbShifts] PRIMARY KEY CLUSTERED 
(
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbShiftsVacations]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbShiftsVacations](
	[ShiftID] [int] NOT NULL,
	[WeekDayID] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbTaxes]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbTaxes](
	[TaxID] [int] IDENTITY(1,1) NOT NULL,
	[TaxFrom] [decimal](9, 2) NOT NULL,
	[TaxTo] [decimal](9, 2) NOT NULL,
	[TaxPercentage] [decimal](4, 2) NOT NULL,
	[TaxExemption] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_TbTaxes] PRIMARY KEY CLUSTERED 
(
	[TaxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbVacations]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbVacations](
	[VacationID] [tinyint] IDENTITY(1,1) NOT NULL,
	[VacationDate] [date] NOT NULL,
	[VacationDuration] [tinyint] NOT NULL,
 CONSTRAINT [PK_TbVacations] PRIMARY KEY CLUSTERED 
(
	[VacationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbWeeklyVacations]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbWeeklyVacations](
	[WeekDayID] [tinyint] NOT NULL,
	[WeekDayName] [nvarchar](10) NOT NULL,
	[IsVac] [bit] NOT NULL,
 CONSTRAINT [PK_TbWeeklyVacations] PRIMARY KEY CLUSTERED 
(
	[WeekDayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbYears]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbYears](
	[YearID] [tinyint] NOT NULL,
	[YearNumber] [smallint] NOT NULL,
 CONSTRAINT [PK_TbYears] PRIMARY KEY CLUSTERED 
(
	[YearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[payRollLast] ADD  CONSTRAINT [DF_payRollLast_SumOfAdditionals]  DEFAULT ((0)) FOR [SumOfAdditionals]
GO
ALTER TABLE [dbo].[payRollLast] ADD  CONSTRAINT [DF_payRollLast_SumOfDeductions]  DEFAULT ((0)) FOR [SumOfDeductions]
GO
ALTER TABLE [dbo].[payRollLast] ADD  CONSTRAINT [DF_payRollLast_SumOf Insurance]  DEFAULT ((0)) FOR [SumOf Insurance]
GO
ALTER TABLE [dbo].[payRollLast] ADD  CONSTRAINT [DF_payRollLast_SumOfTaxes]  DEFAULT ((0)) FOR [SumOfTaxes]
GO
ALTER TABLE [dbo].[payRollLast] ADD  CONSTRAINT [DF_payRollLast_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[Tb_PayrollTransactions] ADD  CONSTRAINT [DF_Tb_PayrollTransactions_SumOfAdditionals]  DEFAULT ((0)) FOR [SumOfAdditionals]
GO
ALTER TABLE [dbo].[Tb_PayrollTransactions] ADD  CONSTRAINT [DF_Tb_PayrollTransactions_SumOfDeductions]  DEFAULT ((0)) FOR [SumOfDeductions]
GO
ALTER TABLE [dbo].[Tb_PayrollTransactions] ADD  CONSTRAINT [DF_Tb_PayrollTransactions_SumOf Insurance]  DEFAULT ((0)) FOR [SumOf Insurance]
GO
ALTER TABLE [dbo].[Tb_PayrollTransactions] ADD  CONSTRAINT [DF_Tb_PayrollTransactions_SumOfTaxes]  DEFAULT ((0)) FOR [SumOfTaxes]
GO
ALTER TABLE [dbo].[Tb_PayrollTransactions] ADD  CONSTRAINT [DF_Tb_PayrollTransactions_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[TbCalenders] ADD  CONSTRAINT [IsVac_TbCalenders]  DEFAULT ((0)) FOR [IsVac]
GO
ALTER TABLE [dbo].[payRollLast]  WITH CHECK ADD  CONSTRAINT [FK_payRollLast_TbEmployees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[TbEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[payRollLast] CHECK CONSTRAINT [FK_payRollLast_TbEmployees]
GO
ALTER TABLE [dbo].[Tb_PayrollTransactions]  WITH CHECK ADD  CONSTRAINT [FK_Tb_PayrollTransactions_TbEmployees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[TbEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Tb_PayrollTransactions] CHECK CONSTRAINT [FK_Tb_PayrollTransactions_TbEmployees]
GO
ALTER TABLE [dbo].[TbAdditionDetails]  WITH CHECK ADD  CONSTRAINT [FK_TbAdditionDetails_TbAdditions] FOREIGN KEY([AdditionID])
REFERENCES [dbo].[TbAdditions] ([AdditionID])
GO
ALTER TABLE [dbo].[TbAdditionDetails] CHECK CONSTRAINT [FK_TbAdditionDetails_TbAdditions]
GO
ALTER TABLE [dbo].[TbAdditionDetails]  WITH CHECK ADD  CONSTRAINT [FK_TbAdditionDetails_TbEmployees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[TbEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[TbAdditionDetails] CHECK CONSTRAINT [FK_TbAdditionDetails_TbEmployees]
GO
ALTER TABLE [dbo].[TbAttendences]  WITH CHECK ADD  CONSTRAINT [FK_TbAttendences_TbEmployees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[TbEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[TbAttendences] CHECK CONSTRAINT [FK_TbAttendences_TbEmployees]
GO
ALTER TABLE [dbo].[TbAttendences]  WITH CHECK ADD  CONSTRAINT [FK_TbAttendences_TbShifts] FOREIGN KEY([ShiftID])
REFERENCES [dbo].[TbShifts] ([ShiftID])
GO
ALTER TABLE [dbo].[TbAttendences] CHECK CONSTRAINT [FK_TbAttendences_TbShifts]
GO
ALTER TABLE [dbo].[TbBranches]  WITH CHECK ADD  CONSTRAINT [FK_TbBranches_TbCompanies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[TbCompanies] ([CompanyID])
GO
ALTER TABLE [dbo].[TbBranches] CHECK CONSTRAINT [FK_TbBranches_TbCompanies]
GO
ALTER TABLE [dbo].[TbCalenders]  WITH CHECK ADD  CONSTRAINT [FK_TbCalenders_TbMonths] FOREIGN KEY([MonthID])
REFERENCES [dbo].[TbMonths] ([MonthID])
GO
ALTER TABLE [dbo].[TbCalenders] CHECK CONSTRAINT [FK_TbCalenders_TbMonths]
GO
ALTER TABLE [dbo].[TbDeductionDetails]  WITH CHECK ADD  CONSTRAINT [FK_TbDeductionDetails_TbDeductions] FOREIGN KEY([DeductionID])
REFERENCES [dbo].[TbDeductions] ([DeductionID])
GO
ALTER TABLE [dbo].[TbDeductionDetails] CHECK CONSTRAINT [FK_TbDeductionDetails_TbDeductions]
GO
ALTER TABLE [dbo].[TbDeductionDetails]  WITH CHECK ADD  CONSTRAINT [FK_TbDeductionDetails_TbEmployees1] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[TbEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[TbDeductionDetails] CHECK CONSTRAINT [FK_TbDeductionDetails_TbEmployees1]
GO
ALTER TABLE [dbo].[TbDepartments]  WITH CHECK ADD  CONSTRAINT [FK_TbDepartments_TbBranches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[TbBranches] ([BranchID])
GO
ALTER TABLE [dbo].[TbDepartments] CHECK CONSTRAINT [FK_TbDepartments_TbBranches]
GO
ALTER TABLE [dbo].[TbEmployeeMasterData]  WITH CHECK ADD  CONSTRAINT [FK_TbEmployeeMasterData_TbEmployee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[TbEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[TbEmployeeMasterData] CHECK CONSTRAINT [FK_TbEmployeeMasterData_TbEmployee]
GO
ALTER TABLE [dbo].[TbEmployees]  WITH CHECK ADD  CONSTRAINT [FK_TbEmployee_TbEducations] FOREIGN KEY([EducationId])
REFERENCES [dbo].[TbEducations] ([EducationID])
GO
ALTER TABLE [dbo].[TbEmployees] CHECK CONSTRAINT [FK_TbEmployee_TbEducations]
GO
ALTER TABLE [dbo].[TbEmployees]  WITH CHECK ADD  CONSTRAINT [FK_TbEmployee_TbJobTitle] FOREIGN KEY([JobTilteId])
REFERENCES [dbo].[TbJobTitles] ([JobTitleID])
GO
ALTER TABLE [dbo].[TbEmployees] CHECK CONSTRAINT [FK_TbEmployee_TbJobTitle]
GO
ALTER TABLE [dbo].[TbEmployees]  WITH CHECK ADD  CONSTRAINT [FK_TbEmployee_TbPositions] FOREIGN KEY([PositionId])
REFERENCES [dbo].[TbPositions] ([PositionID])
GO
ALTER TABLE [dbo].[TbEmployees] CHECK CONSTRAINT [FK_TbEmployee_TbPositions]
GO
ALTER TABLE [dbo].[TbEmployees]  WITH CHECK ADD  CONSTRAINT [FK_TbEmployees_TbDepartments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[TbDepartments] ([DepartmentID])
GO
ALTER TABLE [dbo].[TbEmployees] CHECK CONSTRAINT [FK_TbEmployees_TbDepartments]
GO
ALTER TABLE [dbo].[TbEmployees]  WITH CHECK ADD  CONSTRAINT [FK_TbEmployees_TbInsurancesTypes] FOREIGN KEY([InsuranceID])
REFERENCES [dbo].[TbInsurancesTypes] ([InsuranceID])
GO
ALTER TABLE [dbo].[TbEmployees] CHECK CONSTRAINT [FK_TbEmployees_TbInsurancesTypes]
GO
ALTER TABLE [dbo].[TbHolidayDetails]  WITH CHECK ADD  CONSTRAINT [FK_TbHolidayDetails_TbEmployees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[TbEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[TbHolidayDetails] CHECK CONSTRAINT [FK_TbHolidayDetails_TbEmployees]
GO
ALTER TABLE [dbo].[TbHolidayDetails]  WITH CHECK ADD  CONSTRAINT [FK_TbHolidayDetails_TbHolidayTypes] FOREIGN KEY([HolidayTypeID])
REFERENCES [dbo].[TbHolidayTypes] ([HolidayTypeID])
GO
ALTER TABLE [dbo].[TbHolidayDetails] CHECK CONSTRAINT [FK_TbHolidayDetails_TbHolidayTypes]
GO
ALTER TABLE [dbo].[TbMonths]  WITH CHECK ADD  CONSTRAINT [FK_TbMonths_TbYears] FOREIGN KEY([YearID])
REFERENCES [dbo].[TbYears] ([YearID])
GO
ALTER TABLE [dbo].[TbMonths] CHECK CONSTRAINT [FK_TbMonths_TbYears]
GO
ALTER TABLE [dbo].[TbPayrolls]  WITH CHECK ADD  CONSTRAINT [FK_TbPayrolls_TbEmployees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[TbEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[TbPayrolls] CHECK CONSTRAINT [FK_TbPayrolls_TbEmployees]
GO
ALTER TABLE [dbo].[TbSalaryAudits]  WITH CHECK ADD  CONSTRAINT [FK_TbSalaryAudits_TbEmployees1] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[TbEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[TbSalaryAudits] CHECK CONSTRAINT [FK_TbSalaryAudits_TbEmployees1]
GO
ALTER TABLE [dbo].[TbSalaryStaticInfo]  WITH CHECK ADD  CONSTRAINT [FK_TbSalaryStaticInfo_TbEmployees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[TbEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[TbSalaryStaticInfo] CHECK CONSTRAINT [FK_TbSalaryStaticInfo_TbEmployees]
GO
ALTER TABLE [dbo].[TbShiftsVacations]  WITH CHECK ADD  CONSTRAINT [FK_TbShiftsVacations_TbShifts] FOREIGN KEY([ShiftID])
REFERENCES [dbo].[TbShifts] ([ShiftID])
GO
ALTER TABLE [dbo].[TbShiftsVacations] CHECK CONSTRAINT [FK_TbShiftsVacations_TbShifts]
GO
ALTER TABLE [dbo].[TbShiftsVacations]  WITH CHECK ADD  CONSTRAINT [FK_TbShiftsVacations_TbWeeklyVacations] FOREIGN KEY([WeekDayID])
REFERENCES [dbo].[TbWeeklyVacations] ([WeekDayID])
GO
ALTER TABLE [dbo].[TbShiftsVacations] CHECK CONSTRAINT [FK_TbShiftsVacations_TbWeeklyVacations]
GO
/****** Object:  StoredProcedure [dbo].[FillTreeViewDataCompDepBranch]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FillTreeViewDataCompDepBranch]
as
begin
select * from View_Treeview_compBranchDep
end
GO
/****** Object:  StoredProcedure [dbo].[GetEmpInMonth]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetEmpInMonth]
@month date
as
select top 1  EmployeeID
from TbAdditionDetails as ad where ad.AdditionDetailsDate=@month
GO
/****** Object:  StoredProcedure [dbo].[sp_BranchDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_BranchDelete](
@BranchID int
)
as
begin
delete From TbBranch 
where BranchID=@BranchID
end 

GO
/****** Object:  StoredProcedure [dbo].[sp_BranchInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_BranchInsert](
@CompanyID int,
@BranchMail nvarchar(100),
@BranchPhone int ,
@BranchFax varchar(15),
@BranchAddress nvarchar(300),
@BranchStartDate date
)
as
begin

 
insert into TbBranch 
  (CompanyID, BranchMail ,BranchPhone,BranchFax ,BranchAddress,BranchStartDate)
     values(@CompanyID, @BranchMail,@BranchPhone,@BranchFax ,@BranchAddress,@BranchStartDate)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_BranchUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_BranchUpdate](
@BranchID int,
@CompanyID int,
@BranchMail nvarchar(100),
@BranchPhone int ,
@BranchFax varchar(15),
@BranchAddress nvarchar(300),
@BranchStartDate date
)
as
begin

 
Update TbBranch 
 set CompanyID=@CompanyID, 
 BranchMail=@BranchMail ,
 BranchPhone=@BranchPhone,
 BranchFax=@BranchFax ,
 BranchAddress=@BranchAddress,
 BranchStartDate=@BranchStartDate
     where BranchID=@BranchID

END
GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Usp_AdditionByID]
@AdditionID int
as
begin
select * from TbAdditions where AdditionID = @AdditionID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_AdditionDelete](
@AdditionID int
)
as
begin
delete From TbAdditions 
where AdditionID=@AdditionID
end 

GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionDetailsDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_AdditionDetailsDelete]
@AdditionDetailsID int
as
begin
delete from TbAdditionDetails
where AdditionDetailsID  = @AdditionDetailsID 
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionDetailsInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_AdditionDetailsInsert]
@AdditionID int,
@EmployeeID int, 
@Notes nvarchar(500),
@AdditionDetailsDate date,
@Amount decimal(9,2)
as
begin
insert into TbAdditionDetails(AdditionID,EmployeeID,Notes,AdditionDetailsDate,Amount) values (@AdditionID,@EmployeeID,@Notes,@AdditionDetailsDate, @Amount )
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionDetailsReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_AdditionDetailsReadAll]
as
begin
select  * from TbAdditionDetails
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionDetailsReadByOne]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_AdditionDetailsReadByOne]
@AdditionDetailsID int
as
begin
select  * from TbAdditionDetails
where AdditionDetailsID = @AdditionDetailsID 
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionDetailsUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_AdditionDetailsUpdate]
@AdditionDetailsID  int,
@AdditionID int,
@EmployeeID int, 
@Notes nvarchar(500),
@AdditionDetailsDate datetime
as
begin
update TbAdditionDetails set @AdditionID = @AdditionID , EmployeeID = @EmployeeID , Notes = @Notes, AdditionDetailsDate = @AdditionDetailsDate
where AdditionDetailsID = @AdditionDetailsDate
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_AdditionReadAll]
as
begin
select * From TbAdditions 
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionReadByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_AdditionReadByID]
@AdditionID int
as
begin
select * from dbo.TbAdditions where AdditionID = @AdditionID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionsCalculate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_AdditionsCalculate]
@EmployeeID int,
@MonthDate datetime
as
begin
Declare @month int = DatePart(month,@MonthDate);
Declare @year int = DatePart(year,@MonthDate);


Declare @AmountOfAddition decimal(9,2) =( SELECT
						  sum(dbo.TbAdditionDetails.Amount) as TotalAddition
FROM				      dbo.TbAdditionDetails INNER JOIN
                          dbo.TbAdditions ON dbo.TbAdditionDetails.AdditionID = dbo.TbAdditions.AdditionID and TbAdditionDetails.EmployeeID = @EmployeeID and datepart(YEAR ,TbAdditionDetails.AdditionDetailsDate) = @year and datepart(month ,TbAdditionDetails.AdditionDetailsDate) = @month)
if(@AmountOfAddition > 0)
	set @AmountOfAddition = @AmountOfAddition;
else
	set @AmountOfAddition = 0;

return @AmountOfAddition
end 

GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionsCalculateByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_AdditionsCalculateByID]
@EmployeeID int,
@MonthDate datetime
as
begin
Declare @month int = DatePart(month,@MonthDate);
Declare @year int = DatePart(year,@MonthDate);


Declare @AmountOfAddition decimal(9,2) =( SELECT
						  sum(dbo.TbAdditionDetails.Amount) as TotalAddition
FROM				      dbo.TbAdditionDetails INNER JOIN
                          dbo.TbAdditions ON dbo.TbAdditionDetails.AdditionID = dbo.TbAdditions.AdditionID and TbAdditionDetails.EmployeeID = @EmployeeID and datepart(YEAR ,TbAdditionDetails.AdditionDetailsDate) = @year and datepart(month ,TbAdditionDetails.AdditionDetailsDate) = @month)
if(@AmountOfAddition > 0)
	set @AmountOfAddition = @AmountOfAddition;
else
	set @AmountOfAddition = 0;

select @AmountOfAddition
end 

GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionsForEmployeeByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_AdditionsForEmployeeByID]
@EmployeeId int, 
@MonthDate date
as
begin
declare @year int = datepart(YEAR,@MonthDate);
declare @month int = datepart(month,@MonthDate);

select * from TbAdditionDetails where datepart(year,TbAdditionDetails.AdditionDetailsDate) = @year and datepart(MONTH,TbAdditionDetails.AdditionDetailsDate) = @month and EmployeeID = @EmployeeId
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionsInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_AdditionsInsert]
(@AdditionName nvarchar(100),@Notes nvarchar(500))
as
begin
insert into TbAdditions(AdditionName ,Notes) 
                 values(@AdditionName, @Notes)
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_AdditionUpdate](
@AdditionID int,
@AdditionName nvarchar(100),
@Notes nvarchar(500)


)
as
begin

 
Update TbAdditions 
 set 
 AdditionName=@AdditionName,
 Notes=@Notes 

     where AdditionID=@AdditionID

END
GO
/****** Object:  StoredProcedure [dbo].[Usp_AttendCheckInOrNo]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_AttendCheckInOrNo]
@attendId int
as
select t.AttendID,t.AttendFrom,t.Date,e.EmployeeName,e.Password,t.Notes,t.AttendTo,t.AttendenceStatus
from TbAttendences as t join TbEmployees as e 
on t.EmployeeID= e.EmployeeID
where t.AttendID=@attendId
GO
/****** Object:  StoredProcedure [dbo].[Usp_attendenceCheckPassword]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_attendenceCheckPassword]
@empId int,
@pwd varchar(50)
as
select e.EmployeeID,e.EmployeeName,e.Password
from TbEmployees as e
where e.EmployeeID=@empId and Password=@pwd
GO
/****** Object:  StoredProcedure [dbo].[Usp_AttendenceDetailsForOneEmployee]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[Usp_AttendenceDetailsForOneEmployee]
 @empID int,
 @date date
 as
 select t.AttendID,t.AttendFrom,t.AttendTo,t.Date,t.Delay,t.EmployeeID,t.Notes,t.ShiftID
 from TbEmployees as e inner join TbAttendences as t 
 on e.EmployeeID= t.EmployeeID
 where e.EmployeeID=@empID and t.Date=@date
GO
/****** Object:  StoredProcedure [dbo].[Usp_AttendenceInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_AttendenceInsert]
@from time(0),
@to time(0),
@delay time(0),
@date date,
@empID int,
@shiftID int,
@notes nvarchar(500),
@status char(1)
as
insert into TbAttendences values(@from,@to,@delay,@date,@empID,@shiftID,@notes,@status)
GO
/****** Object:  StoredProcedure [dbo].[Usp_AttendenceReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_AttendenceReadAll]
@date date 
as
select att.AttendID,emp.EmployeeName , sh.ShiftName,dep.DepartmentName,
		att.AttendFrom,att.AttendTo,att.Delay,att.Date,att.AttendenceStatus,att.Notes
from TbAttendences as att inner join TbShifts  as sh
on sh.ShiftID=att.ShiftID inner join TbEmployees as emp
on emp.EmployeeID=att.EmployeeID inner join TbDepartments as dep
on dep.DepartmentID=emp.DepartmentID
where att.Date=@date
GO
/****** Object:  StoredProcedure [dbo].[Usp_AttendenceReadDelay]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_AttendenceReadDelay]
@shiftid int
as
select DATEADD(MINUTE,DelayTime,ShiftStart)
from TbShifts 
where ShiftID=@shiftid
GO
/****** Object:  StoredProcedure [dbo].[Usp_AttendenceReadEmployeeName]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_AttendenceReadEmployeeName]
as
select EmployeeID,EmployeeName
from TbEmployees
GO
/****** Object:  StoredProcedure [dbo].[Usp_AttendenceUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_AttendenceUpdate]
@id int ,
@to time(0),
@notes nvarchar(500),
@status char,
@delay time(0)
as
update TbAttendences set AttendTo=@to,Notes=@notes,AttendenceStatus=@status,Delay=@delay
where AttendID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_AttendReadID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_AttendReadID]
@date date,
@empId int,
@shiftID int
as
select t.AttendID
from TbAttendences as t inner join TbEmployees as e
on t.EmployeeID=e.EmployeeID
where e.EmployeeID=@empId and  t.ShiftID=@shiftID and t.Date=@date
GO
/****** Object:  StoredProcedure [dbo].[Usp_BranchDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_BranchDelete](
@BranchID int
)
as
begin
delete From TbBranches 
where BranchID=@BranchID
end 


GO
/****** Object:  StoredProcedure [dbo].[Usp_BranchesInCompany]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_BranchesInCompany]
@CompanyID nvarchar(100)
as
begin
select  *
from    dbo.TbBranches INNER JOIN
                         dbo.TbCompanies ON dbo.TbBranches.CompanyID = dbo.TbCompanies.CompanyID 
						 and TbCompanies.CompanyID = @CompanyID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_BranchInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_BranchInsert](
@CompanyID int,
@BranchMail nvarchar(100),
@BranchPhone int ,
@BranchFax int,
@BranchAddress nvarchar(300),
@BranchStartDate date,
@BranchName nvarchar(100)
)
as
begin

 
insert into TbBranches 
  (CompanyID, BranchMail ,BranchPhone,BranchFax ,BranchAddress,BranchStartDate,BranchName)
     values(@CompanyID, @BranchMail,@BranchPhone,@BranchFax ,@BranchAddress,@BranchStartDate,@BranchName)

END
GO
/****** Object:  StoredProcedure [dbo].[Usp_BranchReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_BranchReadAll]
as
begin
select * From TbBranches 
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_BranchReadByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_BranchReadByID](
@BranchID int
)
as
begin
SELECT TbBranches.BranchID,TbBranches.CompanyID, TbBranches.BranchMail ,TbBranches.BranchPhone,
       TbBranches.BranchFax ,TbBranches.BranchAddress,TbBranches.BranchStartDate,
	   TbBranches.BranchName,
	   TbCompanies.CompanyID,TbCompanies.CompanyName 
FROM TbBranches
 JOIN TbCompanies 
ON TbBranches.CompanyID = TbCompanies.CompanyID
where BranchID=@BranchID
end 
GO
/****** Object:  StoredProcedure [dbo].[Usp_BranchRename]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_BranchRename]
@BranchID int,
@BranchName nvarchar(100) 
as
begin
update TbBranches 
 set 
 BranchName=@BranchName
     where BranchID=@BranchID
	 end
GO
/****** Object:  StoredProcedure [dbo].[Usp_BranchUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_BranchUpdate](
@BranchID int,
@CompanyID int,
@BranchMail nvarchar(100),
@BranchPhone int ,
@BranchFax varchar(15),
@BranchAddress nvarchar(300),
@BranchStartDate date,
@BranchName nvarchar(100)
)
as
begin

 
Update TbBranches 
 set CompanyID=@CompanyID, 
 BranchMail=@BranchMail ,
 BranchPhone=@BranchPhone,
 BranchFax=@BranchFax ,
 BranchAddress=@BranchAddress,
 BranchStartDate=@BranchStartDate,
 BranchName=@BranchName
     where BranchID=@BranchID

END
GO
/****** Object:  StoredProcedure [dbo].[Usp_CalculatePayroll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_CalculatePayroll]
@monthDate date
as

begin
		

Declare @month int = DatePart(month,@monthDate);
Declare @year int = DatePart(year,@MonthDate);
declare @Empid int

begin try
			begin tran 

						select EmployeeID into #temp  from TbEmployees 

						while(exists(select * from #temp))
						begin
						select top 1  @Empid =  EmployeeID  from #temp
						--------------

						Declare @AmountOfAddition decimal(9,2)=(select sum(ad.Amount) as total
						from TbAdditionDetails as ad
						where ad.AdditionDetailsDate=@monthDate and datepart(YEAR ,ad.AdditionDetailsDate) = @year 
							and datepart(month ,ad.AdditionDetailsDate) = @month  and  EmployeeID=@Empid
						group by ad.EmployeeID)

						----

						Declare @AmountOfDeduction decimal(9,2)=(select sum(ad.Amount) as total
						from TbDeductionDetails as ad
						where ad.DeductionDetailsDate = @monthDate and datepart(YEAR ,ad.DeductionDetailsDate) = @year
							 and datepart(month ,ad.DeductionDetailsDate) = @month and EmployeeID=@Empid
						group by ad.EmployeeID)

						
						----
						Declare @InsfixSalaryEmp decimal(9,2)
						select @InsfixSalaryEmp = InsuEmpFixSalaryCalc    from TbSalaryStaticInfo  where EmployeeID=@Empid

						--- 
						Declare @basicSalary decimal(9,2)
						select  @basicSalary = EmployeBasicSalary from TbEmployees where EmployeeID=@Empid

						Declare @VarSalary decimal(9,2)
						select  @VarSalary = EmployeVariableSalary from TbEmployees where EmployeeID=@Empid

						----

						Declare @total decimal(9,2)=sum(isNull(@basicSalary,0)+isNull(@VarSalary,0)+isNull(@AmountOfAddition,0))-(isNull(@AmountOfDeduction,0)+isnull(@InsfixSalaryEmp,0))


						insert into Tb_PayrollTransactions values(@Empid,getdate(),@AmountOfAddition,@AmountOfDeduction,@InsfixSalaryEmp,0,@total)

						--------------
						delete from #temp where  EmployeeID=@Empid
						end
							commit
								end try
								begin catch 
									rollback
								end catch
	end
GO
/****** Object:  StoredProcedure [dbo].[Usp_CalenderInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--add a year to calender
CREATE proc [dbo].[Usp_CalenderInsert] (@year smallint,@month tinyint,@monthID smallint)
as
declare @monthTotalDays tinyint;
declare @day tinyint=1;
declare @date date;

set @date=concat(@year,'-',@month,'-',1);
set @monthTotalDays= day(eomonth(@date));

while @day<=@monthTotalDays
begin
insert into TbCalenders (CalenderDate,MonthID)values
(CONCAT(@year,'-',@month,'-',@day),@monthID)
set @day+=1;
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_CalenderShow]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_CalenderShow] @MonthID smallint
as
select  datename(weekday,CalenderDate),IsVac from TbCalenders where MonthID=@MonthID
GO
/****** Object:  StoredProcedure [dbo].[Usp_CompanyGetId]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_CompanyGetId]
@CompanyName nvarchar(100)
as
begin
select TbCompanies.CompanyID from TbCompanies where TbCompanies.CompanyName = @CompanyName
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_CompanyInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_CompanyInsert]
(@name nvarchar(100), @Phone varchar(15),@Fax varchar(15), @CreationDate date, @Address nvarchar(300), @Logo varbinary(MAX), @Email varchar(100), @EmailBox varchar(7) )
as
begin
insert into TbCompanies values(@name, @Phone, @Fax, @CreationDate, @Address, @Logo, @Email, @EmailBox)
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_CompanyReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_CompanyReadAll]
as
begin
select * from dbo.TbCompanies
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_CompanyReadByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_CompanyReadByID]
@id int
as
begin
select * from dbo.TbCompanies where CompanyID = @id
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_CompanyReName]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_CompanyReName]
@CompanyID int,
@CompanyName nvarchar(100)
as
begin 
update TbCompanies set TbCompanies.CompanyName = @CompanyName where CompanyID = @CompanyID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_CompanyUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_CompanyUpdate]
(@id int ,@name nvarchar(100), @Phone varchar(15),@Fax varchar(15), @CreationDate date, @Address nvarchar(300), @Logo varbinary(MAX), @Email varchar(100), @EmailBox varchar(7) )
as
begin

update TbCompanies set 
					CompanyName = @name, CompanyPhone = @Phone, CompanyFax = @Fax, CompanyCreationDate = @CreationDate, CompanyAddress = @Address, CompanyLogo = @Logo, CompanyEmail = @Email, CompanyEmailBox = @EmailBox
				   where 
				   dbo.TbCompanies.CompanyID = @id

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeductionDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_DeductionDelete](
@DeductionID int
)
as
begin
delete From TbDeductions 
where DeductionID=@DeductionID
end 

GO
/****** Object:  StoredProcedure [dbo].[Usp_DeductionDetailsDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_DeductionDetailsDelete]
@DeductionDetailsID int
as
begin
delete from TbDeductionDetails
where DeductionDetailsID = @DeductionDetailsID 
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_DeductionDetailsInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_DeductionDetailsInsert]
@DeductionID int,
@EmployeeID int, 
@Notes nvarchar(500),
@DeductionDetailsDate date,
@Amount Decimal(9,2)
as
begin
insert into TbDeductionDetails values (@DeductionID,@EmployeeID,@Notes,@DeductionDetailsDate,@Amount)
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeductionDetailsReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_DeductionDetailsReadAll]
as
begin
select  * from TbDeductionDetails
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_DeductionDetailsReadByOne]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_DeductionDetailsReadByOne]
@DeductionDetailsID int
as
begin
select  * from TbDeductionDetails
where DeductionDetailsID = @DeductionDetailsID 
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_DeductionDetailsUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_DeductionDetailsUpdate]
@DeductionDetailsID int,
@DeductionID int,
@EmployeeID int, 
@Notes nvarchar(500),
@DeductionDetailsDate date,
@Amount decimal(9,2)
as
begin
update TbDeductionDetails set DeductionID = @DeductionID , EmployeeID = @EmployeeID , Notes = @Notes,DeductionDetailsDate = @DeductionDetailsDate, Amount = @Amount
where DeductionDetailsID = @DeductionDetailsID 
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeductionReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_DeductionReadAll]
as
begin
select * From TbDeductions 
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_DeductionReadByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_DeductionReadByID]
@DeductionID int
as
begin
select * from dbo.TbDeductions where DeductionID = @DeductionID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeductionsCalculate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_DeductionsCalculate]
@EmployeeID int,
@MonthDate datetime
as
begin
Declare @month int = DatePart(month,@MonthDate);
Declare @year int = DatePart(year,@MonthDate);

         
Declare @AmountOfDeduction decimal(9,2) =( select sum(dbo.TbDeductionDetails.Amount) as TotalDeduction
FROM            dbo.TbDeductionDetails INNER JOIN
                         dbo.TbDeductions ON dbo.TbDeductionDetails.DeductionID = dbo.TbDeductions.DeductionID and TbDeductionDetails.EmployeeID = @EmployeeID and datepart(YEAR ,TbDeductionDetails.DeductionDetailsDate) = @year and datepart(month ,TbDeductionDetails.DeductionDetailsDate) = @month);
if(@AmountOfDeduction > 0)
	set @AmountOfDeduction = @AmountOfDeduction;
else
	set @AmountOfDeduction = 0;
 
	

return @AmountOfDeduction;						 
end 
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeductionsCalculatebyID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_DeductionsCalculatebyID]
@EmployeeID int,
@MonthDate datetime
as
begin
Declare @month int = DatePart(month,@MonthDate);
Declare @year int = DatePart(year,@MonthDate);

         
Declare @AmountOfDeduction decimal(9,2) =( select sum(dbo.TbDeductionDetails.Amount) as TotalDeduction
FROM            dbo.TbDeductionDetails INNER JOIN
                         dbo.TbDeductions ON dbo.TbDeductionDetails.DeductionID = dbo.TbDeductions.DeductionID and TbDeductionDetails.EmployeeID = @EmployeeID and datepart(YEAR ,TbDeductionDetails.DeductionDetailsDate) = @year and datepart(month ,TbDeductionDetails.DeductionDetailsDate) = @month);
if(@AmountOfDeduction > 0)
	set @AmountOfDeduction = @AmountOfDeduction;
else
	set @AmountOfDeduction = 0;
 
	

select @AmountOfDeduction;						 
end 
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeductionsForEmployeeByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_DeductionsForEmployeeByID]
@EmployeeId int, 
@MonthDate date
as
begin
declare @year int = datepart(YEAR,@MonthDate);
declare @month int = datepart(month,@MonthDate);

select * from TbDeductionDetails where datepart(year,TbDeductionDetails.DeductionDetailsDate) = @year and datepart(MONTH,TbDeductionDetails.DeductionDetailsDate) = @month and EmployeeID = @EmployeeId
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeductionsInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_DeductionsInsert]
(@DeductionName nvarchar(100),@Notes nvarchar(500))
as
begin
insert into TbDeductions(DeductionName ,Notes) 
                 values(@DeductionName, @Notes)
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeductionUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_DeductionUpdate](
@DeductionID int,
@DeductionName nvarchar(100),
@Notes nvarchar(500)


)
as
begin

 
Update TbDeductions 
 set 
 DeductionName=@DeductionName,
 Notes=@Notes 


     where DeductionID=@DeductionID 

END
GO
/****** Object:  StoredProcedure [dbo].[Usp_DepartmentDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_DepartmentDelete]
@id int 
as 
begin 
delete from TbDepartments where dbo.TbDepartments.DepartmentID = @id
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DepartmentInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_DepartmentInsert]
@Name nvarchar(50),
@Phone varchar(15),
@Fax varchar(10),
@Email varchar(150),
@Notes nvarchar(500),
@BranchID int
as begin
insert into TbDepartments values (@Name, @Phone, @Fax, @Email, @Notes, 0, @BranchID)
end


GO
/****** Object:  StoredProcedure [dbo].[Usp_DepartmentReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_DepartmentReadAll]
as begin
select * from TbDepartments where IsDeleted = 0
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_DepartmentReadByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_DepartmentReadByID]
@ID int
as begin
select * from TbDepartments where DepartmentID = @ID and IsDeleted = 0
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DepartmentReadIDReturnName]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_DepartmentReadIDReturnName]
@id int
as
begin 
select dbo.TbBranches.[BranchName]
from TbBranches
where BranchID = @id 
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DepartmentRename]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_DepartmentRename]
@DepartmentID int,
@DepartmentName nvarchar(100) 
as
begin
update TbDepartments
 set 
 DepartmentName=@DepartmentName
     where DepartmentID=@DepartmentID
	 end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DepartmentUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_DepartmentUpdate]
@ID int,
@Name nvarchar(50),
@Phone varchar(15),
@Fax varchar(10),
@Email varchar(150),
@Notes nvarchar(500),
@BranchID int
as begin 
update TbDepartments set DepartmentName = @Name, DepartmentPhone = @Phone, DepartmentFax = @Fax, DepartmentEmail = @Email, DepartmentNotes = @Notes, BranchID = @BranchID where @ID = DepartmentID
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_EducationDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Delete Education
Create proc [dbo].[Usp_EducationDelete]
@EducationID int
as
begin
	delete TbEducations
	where EducationID = @EducationID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EducationInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----Education Table
--Insert Education--
create proc [dbo].[Usp_EducationInsert] 
@EducationName nvarchar(100)
as
begin
	insert into TbEducations values(@EducationName)
end
--Update Education--
GO
/****** Object:  StoredProcedure [dbo].[Usp_EducationReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Get All Education
CREATE proc [dbo].[Usp_EducationReadAll]
as 
begin
	select *
	from TbEducations
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EducationReadById]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Get Education By Id
create proc [dbo].[Usp_EducationReadById]
@EducationID int
as 
begin
	select EducationID, EducationName
	from TbEducations
	Where EducationID = @EducationID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EducationUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_EducationUpdate]
@EducationID int,
@EducationName nvarchar(100)
as
begin
	update TbEducations set EducationName = @EducationName
	where EducationID = @EducationID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- delete Employee
create proc [dbo].[Usp_EmployeeDelete]
@EmployeeID int
as 
begin
	update TbEmployees set IsTerminated = 'true'
	where EmployeeID = @EmployeeID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------
-- Employee Table
-- Insert new Employee 
CREATE proc [dbo].[Usp_EmployeeInsert]
@EmployeeName nvarchar(100),
@pwd varchar(50),
@basicHoliday int,
@extraHoliday int,
@EmployeeBasicSalary decimal(9,2),
@HireDate date,
@IsActive bit,
@IsTerminated bit,
@PositionID int,
@JobTitleID int,
@EducationID int,
@DepartmentID int,
@insuranceID int,
@salaryVariable decimal(9,2)
as
begin
	insert into TbEmployees(EmployeeName,Password,BasicHoliday,ExtraHoliday,EmployeBasicSalary,HireDate,IsActive,IsTerminated,PositionId,JobTilteId,EducationId,DepartmentID,InsuranceID,EmployeVariableSalary)
	values(@EmployeeName,@pwd,@basicHoliday,@extraHoliday,@EmployeeBasicSalary,@HireDate,@IsActive,@IsTerminated,@PositionID,@JobTitleID,@EducationID,@DepartmentID,@insuranceID,@salaryVariable)	
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeInShift]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_EmployeeInShift]
@shiftID int
as
select e.EmployeeID,t.AttendID,sh.ShiftID,e.EmployeeName
from TbEmployees as e inner join TbAttendences as t
on e.EmployeeID=t.EmployeeID join TbShifts as sh
on sh.ShiftID=t.ShiftID
where sh.ShiftID=@shiftID
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeMasterdataDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Delete Employee Masterdata
CREATE procedure [dbo].[Usp_EmployeeMasterdataDelete]
@EmployeeID int
as 
begin
	delete TbEmployeeMasterData
	where EmployeeID = @EmployeeID 
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeMasterdataInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EmployeeMasterdata procedure --

-- Create Employee Masterdata
CREATE procedure [dbo].[Usp_EmployeeMasterdataInsert]
@EmployeeID int,
@NationalID nvarchar(14),
@DateOfBirth datetime2(7),
@Gender bit,
@BloodType char(3),
@Nationality nvarchar(100),
@MartialStatus int,
@FatherName nvarchar(100),
@MotherName nvarchar(100),
@EmployeePhoto varbinary(max) = null,
@Email varchar(300),
@Mobile varchar(300),
@Address nvarchar(300)
as
begin
	insert into TbEmployeeMasterdata 
	values(
			@EmployeeID,
		    @NationalID,
			@DateOfBirth,
			@Gender,
			@BloodType,
			@Nationality,
			@MartialStatus,
			@FatherName,
			@MotherName,
			@EmployeePhoto,
			@Email,
			@Mobile,
			@Address)
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeMasterdataReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Read All Employee Masterdata
CREATE procedure [dbo].[Usp_EmployeeMasterdataReadAll]
as
begin
	select * from TbEmployeeMasterData
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeMasterdataReadById]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Find Employee by ID
CREATE procedure [dbo].[Usp_EmployeeMasterdataReadById]
@EmployeeID int
as
begin
	select * from TbEmployeeMasterData
	where EmployeeID = @EmployeeID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeMasterdataUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Update Employee Masterdata

CREATE procedure [dbo].[Usp_EmployeeMasterdataUpdate]
@EmployeeID int,
@NationalID nvarchar(14),
@DateOfBirth date,
@Gender bit,
@BloodType char(3),
@Nationality nvarchar(100),
@MartialStatus int,
@FatherName nvarchar(100),
@MotherName nvarchar(100),
@EmployeePhoto varbinary(max),
@Email varchar(300),
@Mobile varchar(300),
@Address nvarchar(300)
as
begin
	update TbEmployeeMasterData 
	set NationalID = @NationalID,
		DateOfBirth = @DateOfBirth,
		Gender = @Gender,
		BloodType = @BloodType,
		Nationality = @Nationality,
		MartialStatus = @MartialStatus,
		FatherName = @FatherName,
		MotherName = @MotherName,
		EmployeePhoto = @EmployeePhoto,
		Email = @Email,
		Mobile = @Mobile,
		Address = @Address
	where EmployeeID = @EmployeeID 
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Get All Employee
CREATE proc [dbo].[Usp_EmployeeReadAll]
as
begin
	select emp.EmployeeID, emp.EmployeeName, emp.EmployeBasicSalary,emp.HireDate,e.EducationName,j.JobTitleName,p.PositionName,d.DepartmentName,emp.IsActive
	from TbEmployees as emp
		inner join TbEducations as e 
			on emp.EducationId = e.EducationID
		inner join TbJobTitles j
			on emp.JobTilteId = j.JobTitleID
		inner join TbPositions as p
			on emp.PositionId = p.PositionID
		inner join TbDepartments as d
			on emp.DepartmentID = d.DepartmentID
			inner join TbInsurancesTypes as i
			on emp.InsuranceID=i.InsuranceID
			
	where IsTerminated = 'false'
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeReadById]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Get Employee By Id
CREATE proc [dbo].[Usp_EmployeeReadById]
@EmployeeID int
as
begin
	select *
	from TbEmployees
	where EmployeeID = @EmployeeID and IsTerminated = 'false'
end
---------------------------------
-- EmployeeMaster Datatable Table
---------------------------------
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeReadByName]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Usp_EmployeeReadByName]
@EmployeeName nvarchar(100)
as
begin
	select EmployeeID, EmployeeName, HireDate
	from TbEmployees
	where EmployeeName like @EmployeeName + '%' and IsTerminated = 'false'
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeesData]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Usp_EmployeesData]
as 
begin
	select employee.EmployeeName
		,employeeData.Mobile
		,employeeData.Email
		,department.DepartmentName
		,position.PositionName
		,education.EducationName
		,employeeData.EmployeePhoto
	from TbEmployees as employee
		inner join TbEmployeeMasterData as employeeData
			on employee.EmployeeID = employeeData.EmployeeID
		inner join TbDepartments as department
			on employee.DepartmentID = department.DepartmentID
		inner join TbJobTitles as jobTitle
			on employee.JobTilteId = jobTitle.JobTitleID
		inner join TbEducations as education
			on employee.EducationId = education.EducationID
		inner join TbPositions as position
			on employee.PositionId = position.PositionID
	where employee.IsTerminated = 'false'
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeesReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Usp_EmployeesReadAll]
as
select EmployeeID,EmployeeName
from TbEmployees
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- update Employee
CREATE proc [dbo].[Usp_EmployeeUpdate]
@EmployeeID int,
@pwd varchar(50),
@basicHoliday int,
@extraHoliday int,
@EmployeeName nvarchar(100),
@EmployeeBasicSalary decimal(9,2),
@HireDate date,
@IsActive bit,
@IsTerminated bit,
@PositionID int,
@JobTitleID int,
@EducationID int,
@DepartmentID int,
@insuranceID int,
@salaryVariable decimal(9,2)
as 
begin 
	update TbEmployees set EmployeeName=@EmployeeName,Password=@pwd,BasicHoliday=@basicHoliday,ExtraHoliday=@extraHoliday,
						   EmployeBasicSalary=@EmployeeBasicSalary,
						   HireDate = @HireDate,
						   IsActive = @IsActive,
						   IsTerminated = @IsTerminated,
						   PositionId = @PositionID,
						   JobTilteId = @JobTitleID,
						   EducationId = @EducationID,
						   DepartmentID = @DepartmentID,
						   InsuranceID=@insuranceID,
						 EmployeVariableSalary=@salaryVariable
	where EmployeeID = @EmployeeID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_FillTreeViewDataCompDepBranch]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_FillTreeViewDataCompDepBranch]
as
begin
select * from Vw_Comp_Branch_Dep 
group by CompanyName,BranchName,DepartmentName
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetBasicSalary]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Usp_GetBasicSalary]
@Employeeid int
as 
begin
declare @BasicSalary decimal(9,2) = (select TbEmployees.EmployeBasicSalary from TbEmployees where EmployeeID = @Employeeid);
if(@BasicSalary  > 0)
	set @BasicSalary  = @BasicSalary ;
else
	set @BasicSalary  = 0;
 


return @BasicSalary
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetBrachinComp]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_GetBrachinComp]
@CompanyName nvarchar(100) 
as
begin 
select  b.BranchName 
from TbBranches b join TbCompanies c
on c.CompanyID = b.CompanyID and CompanyName = @CompanyName
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetBranchId]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetBranchId]
@CompanyName nvarchar(100),
@BranchName nvarchar(100)
as
begin 
select top 1 BranchID from Vw_ShowOrganizationUnitData 
where   CompanyName = @CompanyName and BranchName=@BranchName 
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetCompanyId]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_GetCompanyId]
@CompanyName nvarchar(100)
as
begin 
select top 1 CompanyID from Vw_ShowOrganizationUnitData 
where   CompanyName = @CompanyName 
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetDepartmentId]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_GetDepartmentId]
@CompanyName nvarchar(100),
@BranchName nvarchar(100),
@DepartmentName nvarchar(50)	
as
begin 
select DepartmentID from Vw_ShowOrganizationUnitData 
where   CompanyName = @CompanyName and BranchName=@BranchName and DepartmentName=@DepartmentName
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_GetDepinBrach]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Usp_GetDepinBrach]
@BranchName nvarchar(100) 
as
begin 
select d.DepartmentName
from TbDepartments d join TbBranches b 
on b.BranchID = d.BranchID and BranchName = @BranchName
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetIdFromName]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Usp_GetIdFromName]
@name nvarchar(50)
as
begin
select top 1 TbCompanies.CompanyID
from TbCompanies
where TbCompanies.CompanyName =@name
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailCheckNumber]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[Usp_HolidayDetailCheckNumber]
@id int
as
select ExtraHoliday
from TbEmployees
where EmployeeID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayDetailDelete]
@id int
as
delete from TbHolidayDetails where HolidayDetailID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--insert holiday details in TbHolidayDetails
CREATE proc [dbo].[Usp_HolidayDetailInsert]
@hType int,
@empId int,
@actulDate date,
@start date ,
@end date,
@totalHoliday int ,
@action bit
as
if @action=1
begin
insert into TbHolidayDetails values(@hType,@empId,@actulDate,@start,@end,@totalHoliday)

--update extra holiday in TbEmployees

update TbEmployees   set ExtraHoliday -= @totalHoliday
from TbHolidayDetails as hd join TbEmployees as e
on e.EmployeeID= hd.EmployeeID join TbHolidayTypes as ht 
on ht.HolidayTypeID= hd.HolidayTypeID
where e.EmployeeID=@empId and ht.HolidayTypeID=@hType and ht.IsDeduct=0
end
else
begin
-- update tbemployee
update TbEmployees   set ExtraHoliday += @totalHoliday
from TbHolidayDetails as hd join TbEmployees as e
on e.EmployeeID= hd.EmployeeID join TbHolidayTypes as ht 
on ht.HolidayTypeID= hd.HolidayTypeID
where e.EmployeeID=@empId and ht.HolidayTypeID=@hType and ht.IsDeduct=0

-- delete row from tb holidayDetails
delete from TbHolidayDetails 
where EmployeeID=@empId and  HolidayStart=@start


end
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayDetailReadAll]
as
select hd.HolidayDetailID,emp.EmployeeName ,dep.DepartmentName,ht.TypeName,ht.MaxDays,ht.Percentage,
		hd.HolidayActualDate,hd.HolidayStart,hd.HolidayEnd,hd.DaysNumber
from TbHolidayDetails as hd join TbHolidayTypes  as ht
on ht.HolidayTypeID=hd.HolidayTypeID join TbEmployees as emp
on emp.EmployeeID=hd.EmployeeID join TbDepartments as dep
on dep.DepartmentID=emp.DepartmentID
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailReadByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_HolidayDetailReadByID]
@id int
as
select h.HolidayDetailID,e.EmployeeID,e.EmployeeName,ht.HolidayTypeID,ht.TypeName,h.HolidayActualDate,h.HolidayStart
		,h.HolidayEnd,h.DaysNumber
from TbHolidayDetails as h inner join TbEmployees as e
on e.EmployeeID=h.EmployeeID inner join TbHolidayTypes as ht
on ht.HolidayTypeID=h.HolidayTypeID

where h.HolidayDetailID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailReadExtraHolidayForOnEmployee]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_HolidayDetailReadExtraHolidayForOnEmployee]
@id int
as
select ExtraHoliday from  Vw_HolidayDetailReadExtraHolidayForOnEmployee
where EmployeeID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailSearchEndDate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_HolidayDetailSearchEndDate]
@empId int,
@endDate date
as

declare @Date date=( select top 1 HolidayEnd from TbHolidayDetails 
where EmployeeID=@empId
ORDER BY HolidayEnd DESC)

if @endDate>@Date
begin
return 1
end

else
begin
return 0
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_HolidayDetailUpdate]
@id int,
@hType int,
@empId int,
@actulDate date,
@start date ,
@end date,
@totalHoliday int, 
@action bit
as
if @action=1
begin
--update extra holiday in TbEmployees
update TbEmployees   set ExtraHoliday -= @totalHoliday
from TbHolidayDetails as hd join TbEmployees as e
on e.EmployeeID= hd.EmployeeID join TbHolidayTypes as ht 
on ht.HolidayTypeID= hd.HolidayTypeID
where e.EmployeeID=@empId and ht.HolidayTypeID=@hType and ht.IsDeduct=0
end

else

begin
-- update tbemployee
update TbEmployees   set ExtraHoliday += @totalHoliday
from TbHolidayDetails as hd join TbEmployees as e
on e.EmployeeID= hd.EmployeeID join TbHolidayTypes as ht 
on ht.HolidayTypeID= hd.HolidayTypeID
where e.EmployeeID=@empId and ht.HolidayTypeID=@hType and ht.IsDeduct=0
end

-- update tb holiday Details 
update  TbHolidayDetails set HolidayTypeID=@hType,EmployeeID=@empId,HolidayActualDate=@actulDate,HolidayStart=@start,HolidayEnd=@end
							,DaysNumber=@totalHoliday
where HolidayDetailID =@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayNameIsExist]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_HolidayNameIsExist]
@name nvarchar(100)
as
select TypeName from TbHolidayTypes where  TypeName like @name +'%'
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayReadEmployeeName]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayReadEmployeeName]
as
select  EmployeeID, EmployeeName
from Vw_HolidayReadEmployeeName
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayReadTypeName]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayReadTypeName]
as
select  HolidayTypeID, TypeName
from Vw_HolidayReadTypeName
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayTypeDelete]
@id int 
as
delete from TbHolidayTypes where HolidayTypeID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayTypeInsert]
@name nvarchar(100),
@maxDays tinyint,
@percntage float,
@isDeduct bit
as
insert into TbHolidayTypes values(@name,@maxDays,@percntage,@isDeduct)
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeIsDiscountOrNo]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_HolidayTypeIsDiscountOrNo]
@id int 
as
select *
from TbHolidayTypes  where HolidayTypeID=@id and IsDeduct=1
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeNameIsExist]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayTypeNameIsExist]
@name nvarchar(100)
as
select *
from TbHolidayTypes
where TypeName=@name
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayTypeReadAll]
as
select * from TbHolidayTypes
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeReadByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayTypeReadByID]
@id int 
as 
select * from TbHolidayTypes 
where HolidayTypeID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeReadMaxDays]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayTypeReadMaxDays]
@id int 
as
select  MaxDays
from TbHolidayTypes
where HolidayTypeID=@id and IsDeduct=1
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayTypeUpdate]
@id int,
@name nvarchar(100),
@maxDays tinyint,
@percntage float,
@isDeduct bit
as
update TbHolidayTypes set TypeName=@name,MaxDays=@maxDays,Percentage=@percntage,IsDeduct=@isDeduct
where HolidayTypeID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_InsuranceDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_InsuranceDelete]
@InsuranceID int 
as
begin
Delete from TbInsurancesTypes where TbInsurancesTypes.InsuranceID = @InsuranceID
end 
GO
/****** Object:  StoredProcedure [dbo].[Usp_InsuranceInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_InsuranceInsert]
@type nvarchar(100),
@empFixSalary decimal(9,2),
@comFixSalary decimal(9,2),
@comVarSalary decimal(9,2),
@empVarSalary decimal(9,2)
as
insert into TbInsurancesTypes values(@type,@empFixSalary,@comFixSalary,@empVarSalary,@comVarSalary)
GO
/****** Object:  StoredProcedure [dbo].[Usp_InsuranceReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_InsuranceReadAll]
as
select * from TbInsurancesTypes
GO
/****** Object:  StoredProcedure [dbo].[Usp_InsuranceReadByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_InsuranceReadByID]
@id int
as
begin
select * from TbInsurancesTypes
where InsuranceID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_InsuranceUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_InsuranceUpdate]
@id int,
@type nvarchar(100),
@empFixSalary decimal(9,2),
@comFixSalary decimal(9,2),
@comVarSalary decimal(9,2),
@empVarSalary decimal(9,2)
as
update TbInsurancesTypes set EnsuranceType=@type,EmpFixedSalaryInsu=@empFixSalary,ComFixedSalaryInsu=@comFixSalary
								,EmpVarSalaryInsu=@empVarSalary,ComVarSalaryInsu=@comVarSalary
where InsuranceID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_JobTitleDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Delete JobTitle
create proc [dbo].[Usp_JobTitleDelete]
@JobTitleID int
as
begin
	delete TbJobTitles
	where JobTitleID = @JobTitleID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_JobTitleInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------
----- JobTitle Table
--Insert new jobTitle
create proc [dbo].[Usp_JobTitleInsert]
@JobTitleName nvarchar(100)
as 
begin
	insert into TbJobTitles values(@JobTitleName)
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_JobTitleReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Get All Job Title
create proc [dbo].[Usp_JobTitleReadAll]
as 
begin
	select JobTitleID,JobTitleName
	from TbJobTitles
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_JobTitleReadById]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Get JobTitleById
create proc [dbo].[Usp_JobTitleReadById]
@JobTitleID int 
as 
begin
	select JobTitleID, JobTitleName
	from TbJobTitles
	where JobTitleID = @JobTitleID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_JobTitleUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Update JobTitle
create proc [dbo].[Usp_JobTitleUpdate]
@JobTitleID int,
@JobTitleName nvarchar(100)
as
begin
	update TbJobTitles set JobTitleName = @JobTitleName
	where JobTitleID = @JobTitleID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_MonthsInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--add months of a year
CREATE proc [dbo].[Usp_MonthsInsert] (@year smallint)
as
declare @YearID smallint=(select YearID from TbYears where YearNumber=@year)
declare @WeeklyVacationDays tinyint
declare @VacationDays tinyint
declare @month tinyint=1;
while @month<=12
begin
exec @WeeklyVacationDays=Usp_WeeklyVacationsInMonth @year,@month;
exec @VacationDays=[Usp_VacationsInMonth] @year,@month;
declare @date date=concat(@year,'-',@month,'-',1);

insert into TbMonths (MonthNumber,MonthTotalDays,MonthActualWorkDays,YearID) values
(@month, day(eomonth(@date)),(day(eomonth(@date)))-@WeeklyVacationDays-@VacationDays , @YearID);

--call Usp_CalenderInsert
declare @monthID smallint=(select max(MonthID) from TbMonths)
exec Usp_CalenderInsert @year,@month,@monthID

set @month+=1;
end


update TbCalenders
set IsVac=1
where (DATENAME(weekday, CalenderDate))In(select WeekDayName from TbWeeklyVacations where IsVac=1)

--
exec Usp_VacationsToCalenderInsert



GO
/****** Object:  StoredProcedure [dbo].[Usp_MonthsShow]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_MonthsShow] @YearID int
as
declare @year int =(select YEARNumber from TbYears where YearID=@YearID)
select MonthID,DATENAME(month,DATEADD(month,MonthNumber,-1)),MonthTotalDays,MonthActualWorkDays
 from TbMonths where YearID=@YearID
GO
/****** Object:  StoredProcedure [dbo].[Usp_PayrollCalculate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_PayrollCalculate]
@EmployeeId int,
@MonthDate date
as
begin 
declare @AdditionAmount decimal(9,2);
declare @DeductionAmount decimal(9,2);
declare @BasicSalary decimal(9,2);
declare @SalaryAfterAdditionAndDedduction decimal(9,2);


exec @AdditionAmount =  Usp_AdditionsCalculate @EmployeeId, @MonthDate
exec @DeductionAmount =  Usp_DeductionsCalculate @EmployeeId ,@MonthDate
exec @BasicSalary =  Usp_GetBasicSalary @EmployeeId
set @SalaryAfterAdditionAndDedduction = @BasicSalary + @AdditionAmount - @DeductionAmount;
return @SalaryAfterAdditionAndDedduction;
end

declare @y decimal(9,2);
exec @y =  [Usp_PayrollCalculate] 7 ,'1/17/2019'
print @y


GO
/****** Object:  StoredProcedure [dbo].[Usp_PayrollInMonthIsPaid]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_PayrollInMonthIsPaid]
@Monthdate date
as
begin
Declare @month int = DatePart(month,@MonthDate);
Declare @year int = DatePart(year,@MonthDate);

declare @IsPaid int = (select count(*) from TbPayrolls where DATEPART(year, TbPayrolls.MonthDate) = @year and DATEPART(MONTH, TbPayrolls.MonthDate) = @month)

--return @IsPaid;
select @IsPaid;

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_PayrollInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_PayrollInsert]
@EmployeeID int,
@MonthDate date
as
begin
declare @NetSalary decimal(9,2);
exec @NetSalary =  [Usp_PayrollCalculate] @EmployeeID

insert into TbPayrolls (NetSalary,MonthDate, EmployeeID)
values(@NetSalary,@MonthDate,@EmployeeID)

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_PayrollInsertAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Usp_PayrollInsertAll]
@MonthDate datetime
as
begin


declare @EmployeeID int;
Declare @CounterEmployee int = 0;
declare @NetSalary decimal(9,2);


declare @CountOfEmployees int;
set @CountOfEmployees = (select count(*) from TbEmployees where TbEmployees.IsTerminated =0);


WHILE ( @CounterEmployee < @CountOfEmployees)
BEGIN

	set @EmployeeID = (select TbEmployees.EmployeeID from TbEmployees 	
	order by EmployeeID
	OFFSET @CounterEmployee rows
    FETCH NEXT 1 ROWS ONLY);
	  
	exec @NetSalary =  [Usp_PayrollCalculate] @EmployeeID,@MonthDate;
    SET @CounterEmployee +=  1;
insert into TbPayrolls (NetSalary,MonthDate, EmployeeID) values(@NetSalary,@MonthDate,@EmployeeID);
END

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_PayrollInsertByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_PayrollInsertByID]
@EmployeeID int,
@MonthDate date
as
begin
declare @NetSalary decimal(9,2);
exec @NetSalary =  [Usp_PayrollCalculate] @EmployeeID

insert into TbPayrolls (NetSalary,MonthDate, EmployeeID)
values(@NetSalary,@MonthDate,@EmployeeID)

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_PayrollReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_PayrollReadAll]
@MonthDate date
as
begin
Declare @month int = DatePart(month,@MonthDate);
Declare @year int = DatePart(year,@MonthDate);

select * from TbPayrolls where DATEPART(year, TbPayrolls.MonthDate) = @year and DATEPART(MONTH, TbPayrolls.MonthDate) = @month
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_PayrollViewPayrollAllArchieve]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_PayrollViewPayrollAllArchieve]
@EmployeeID int
as
begin
select * from TbPayrolls where  EmployeeID = @EmployeeID 
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_PositionDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Delete Postion
create proc [dbo].[Usp_PositionDelete]
@PositionID int
as
begin
	delete TbPositions
	where PositionID = @PositionID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_PositionInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------
----Position Table
--Insert new Position
create proc [dbo].[Usp_PositionInsert] 
@PositionName nvarchar(100)
as 
begin
	insert into TbPositions values(@PositionName)
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_PositionReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Get All Position
create proc [dbo].[Usp_PositionReadAll]
as
begin
	select PositionID, PositionName
	from TbPositions
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_PositionReadById]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- Get Position By Id
create proc [dbo].[Usp_PositionReadById]
@PositionID int 
as
begin
	select PositionID, PositionName
	from TbPositions
	where PositionID = @PositionID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_PositionUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Update Postion
CREATE proc [dbo].[Usp_PositionUpdate] 
@PositionID int,
@PositionName nvarchar(100)
as
begin
	update TbPositions set PositionName = @PositionName 
	where PositionID = @PositionID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_proc]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_proc]
@name nvarchar(50)
as
begin
select top 1 TbCompanies.CompanyID
from TbCompanies
where TbCompanies.CompanyName =@name


end
GO
/****** Object:  StoredProcedure [dbo].[Usp_ShiftCheckTime]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_ShiftCheckTime]
@start time(7),
@end time(7)
as
select * from TbShifts where  ShiftStart not between @start and @end
GO
/****** Object:  StoredProcedure [dbo].[Usp_ShiftDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_ShiftDelete]
@id int 
as
delete from TbShifts
where ShiftID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_ShiftInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_ShiftInsert]
@name nvarchar(100),
@start time(1),
@end time(1) ,
@notes nvarchar(500),
@delayTime int,
@LeaveEarly int,
@BeginningIn time(1),
@EndingIn time(1),
@BeginningOut time(1),
@EndingOut time(1),
@CountAsWorkDay int,
@CountAsMinuts int,
@checkin bit,
@checkOut bit
as
insert into TbShifts values(@name,@start,@end,@delayTime
							,@LeaveEarly,@BeginningIn,@EndingIn,@BeginningOut,@EndingOut,@CountAsWorkDay,@CountAsMinuts,@notes,@checkin,@checkOut)
GO
/****** Object:  StoredProcedure [dbo].[Usp_ShiftReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_ShiftReadAll]
as
select * from TbShifts
GO
/****** Object:  StoredProcedure [dbo].[Usp_ShiftReadByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_ShiftReadByID]
@id int

as
select * from TbShifts where ShiftID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_ShiftSearch]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_ShiftSearch]
@name nvarchar(100),
@start time(1),
@end time(1)

as
select * from TbShifts where  ShiftName = @name or ShiftStart=@start and ShiftEnd=@end
GO
/****** Object:  StoredProcedure [dbo].[Usp_ShiftUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_ShiftUpdate]
@id int ,
@name nvarchar(100),
@start time(1),
@end time(1) ,
@notes nvarchar(500),
@delay int,
@LeaveEarly int,
@BeginningIn time(1),
@EndingIn time(1),
@BeginningOut time(1),
@EndingOut time(1),
@CountAsWorkDay int,
@CountAsMinuts int ,
@checkin bit,
@checkOut bit
as
update TbShifts  set ShiftName= @name,ShiftStart= @start,ShiftEnd= @end,DelayTime=@delay,
								LeaveEarlyByMinuts=@LeaveEarly,[BeginningIn]=@BeginningIn,[EndingIn]=@EndingIn,

									[BeginningOut]=@BeginningOut,[EndingOut]=@EndingOut,[CountAsWorkDay]=@CountAsWorkDay
									,[CountAsMinuts]=@CountAsMinuts,Notes=@notes,ChekIn=@checkin,CheckOut=@checkOut
where ShiftID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_ShiftVacationDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_ShiftVacationDelete] @DayID tinyint,@ShiftID int
as
delete from TbShiftsVacations
where ShiftID=@ShiftID and WeekDayID=@DayID
GO
/****** Object:  StoredProcedure [dbo].[Usp_ShiftVacationInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_ShiftVacationInsert] @StrbShifts varchar(9),
@WeeklyVacationsIDs varchar(7)
as
declare @ShiftID tinyint=1;
while @ShiftID<=LEN(@StrbShifts)
begin
delete from TbShiftsVacations
where ShiftID=Convert(int,SUBSTRING(@StrbShifts,@ShiftID,1))+1
set @ShiftID+=1;
end

set @ShiftID=1
while @ShiftID<=LEN(@StrbShifts)
begin

declare @DayID tinyint=1;
while @DayID<=LEN(@WeeklyVacationsIDs)
begin
insert into TbShiftsVacations values
(Convert(tinyint,SUBSTRING(@StrbShifts,@ShiftID,1))+1,
 SUBSTRING(@WeeklyVacationsIDs,@DayID,1))

set @DayID+=1;
end

set @ShiftID+=1;
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_ShiftVacationsShow]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_ShiftVacationsShow] @ShiftID int
as
select TbWeeklyVacations.WeekDayName,
TbShifts.ShiftStart,TbShifts.ShiftEnd
from TbWeeklyVacations join TbShiftsVacations
on TbWeeklyVacations.WeekDayID=TbShiftsVacations.WeekDayID
join TbShifts on TbShifts.ShiftID=TbShiftsVacations.ShiftID
where TbShiftsVacations.ShiftID=@ShiftID
GO
/****** Object:  StoredProcedure [dbo].[Usp_TaxDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_TaxDelete](
@TaxID int
)
as
begin
delete From TbTaxes 
where TaxID=@TaxID
end 
GO
/****** Object:  StoredProcedure [dbo].[Usp_TaxReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_TaxReadAll]
as
begin
select  * from TbTaxes
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_TaxReadByOne]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_TaxReadByOne]
@TaxID int
as
begin
select  * from TbTaxes
where TaxID=@TaxID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_TbBranchReadAll]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_TbBranchReadAll]
as
begin
select * From TbBranches 
end 

GO
/****** Object:  StoredProcedure [dbo].[Usp_TbBranchReadByID]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Usp_TbBranchReadByID](
@BranchID int
)
as
begin
select * From TbBranches 
where BranchID=@BranchID
end 

GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdateCompanyName]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_UpdateCompanyName]
@id int,
@name nvarchar(50)
as
begin

update TbCompanies   
set TbCompanies.CompanyName = @name
where TbCompanies.CompanyID = @id

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_VacationDelete]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_VacationDelete] (@OldVacationDate date)
as
-- check that old vacation is in TbYears and greater than today
if datepart(year,@OldVacationDate)in(select YearNumber from TbYears)
and @OldVacationDate>convert(date,getdate())
begin
declare @oldDuration tinyint=(select VacationDuration from TbVacations where VacationDate=@OldVacationDate)-1

delete from TbVacations where VacationDate=@OldVacationDate

--Update TbCalenders
declare @StartDate date=@OldVacationDate
declare @EndDate date=dateadd(day,@oldDuration,@StartDate)

--remove an old vacation from TbCalenders
update TbCalenders set IsVac=0 
where CalenderDate between @StartDate and @EndDate
and
datename(weekday,CalenderDate)not in(select WeekDayName from TbWeeklyVacations where IsVac=1)

--update ActualWorkDays in TbMonths(old)
declare @MonthID tinyint=(select MonthID from TbMonths where MonthNumber=datepart(month,@OldVacationDate)
and
YearID=(select YearID from TbYears where YearNumber=datepart(year,@OldVacationDate)))

update TbMonths set MonthActualWorkDays=
(select count(MonthID) from TbCalenders where MonthID=@MonthID and IsVac=0)
where MonthID=@MonthID

--check if vacation include two months
declare @MonthID2 tinyint=(select MonthID from TbMonths where MonthNumber=datepart(month,@EndDate)
and
YearID=(select YearID from TbYears where YearNumber=datepart(year,@EndDate)))

if @MonthID2!=@MonthID
begin
--update ActualWorkDays in TbMonths(old)
update TbMonths set MonthActualWorkDays=
(select count(MonthID) from TbCalenders where MonthID=@MonthID2 and IsVac=0)
where MonthID=@MonthID2
end

end

--check if that year of vacation not added in TbYears,then just remove it
else if datepart(year,@OldVacationDate)not in(select YearNumber from TbYears)
begin
delete from TbVacations where VacationDate=@OldVacationDate
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_VacationInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_VacationInsert] (@VacationDate date,@VacationDuration tinyint)
as
-- check registering vacation before adding the year
if datepart(year,@VacationDate)not in(select YearNumber from TbYears)
begin
insert into TbVacations (VacationDate,VacationDuration) values(@VacationDate,@VacationDuration)
end

-- if year of vacation is exist, vacation must be greater than today
else
begin
if @VacationDate>convert(date,getdate())
begin
insert into TbVacations (VacationDate,VacationDuration) values(@VacationDate,@VacationDuration)
end
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_vacationsCount]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_vacationsCount]
as
select count(VacationID) from TbVacations
 where VacationDate>CONVERT(date,getdate())
GO
/****** Object:  StoredProcedure [dbo].[Usp_VacationsInMonth]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_VacationsInMonth] @year SMALLINT,@month tinyint
as
declare @VacationsNumber tinyint=0;
declare @VacationID tinyint=1;
declare @VacationIDs tinyint=(select count(VacationID) from TbVacations);

while @VacationID<=@VacationIDs 
begin                          --1

declare @date date=(select VacationDate from TbVacations where VacationID=@VacationID)
declare @duration tinyint=(select VacationDuration from TbVacations where VacationID=@VacationID)

if datepart(month,@date)=@month or datepart(month,dateadd(day,@duration-1,@date))=@month 
begin                          --2

declare @counter tinyint=1;


while @counter<=@duration
begin                          --3

if datename(weekday,@date)not in(select WeekDayName from TbWeeklyVacations where IsVac=1)
	and datepart(month,@date)=@month
begin                           --4
set @VacationsNumber+=1;

end                             --4
set @date=dateadd(day,1,@date);
set @counter+=1;
end                             --3

end                             --2
set @VacationID+=1;
end                             --1

return @VacationsNumber
GO
/****** Object:  StoredProcedure [dbo].[Usp_VacationsToCalenderInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Usp_VacationsToCalenderInsert]
as
declare @VacationsCount tinyint=(select count(VacationID) from TbVacations)
declare @VacationID tinyint=(select top 1 VacationID from TbVacations )
declare @counter tinyint=1
while @counter<=@VacationsCount
begin
declare @startDate date=(select VacationDate from TbVacations where VacationID=@VacationID);
declare @duration tinyint=(select VacationDuration from TbVacations where VacationID=@VacationID)-1;
declare @EndDate date=dateadd(day,@duration,@startDate);

Update TbCalenders set IsVac=1
where CalenderDate between @startDate and @EndDate
and CalenderDate>convert(date,getdate())
and
CalenderDate<=CONCAT(DATEPART(year,getdate()),'-12-31')
set @counter+=1;
set @VacationID+=1;
end


GO
/****** Object:  StoredProcedure [dbo].[Usp_VacationUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_VacationUpdate] (@VacationDate date,@VacationDuration tinyint,@OldVacationDate date)
as
-- check registering vacation before add the year
if datepart(year,@OldVacationDate)not in(select YearNumber from TbYears)
begin

--get duration of old vacation
declare @oldDuration tinyint=(select VacationDuration from TbVacations where VacationDate=@OldVacationDate)-1

--update TbVacations
update TbVacations set VacationDate=@VacationDate,VacationDuration=@VacationDuration
where VacationDate=@OldVacationDate

--Update TbCalenders
declare @StartDate date=@OldVacationDate
declare @EndDate date=dateadd(day,@oldDuration,@StartDate)

--remove an old vacation from TbCalenders
update TbCalenders set IsVac=0 
where CalenderDate between @StartDate and @EndDate
and
datename(weekday,CalenderDate)not in(select WeekDayName from TbWeeklyVacations where IsVac=1)

--add a new vacation from TbCalenders
set @EndDate=dateadd(day,@VacationDuration-1,@VacationDate)
update TbCalenders set IsVac=1
where CalenderDate between @VacationDate and @EndDate
and CalenderDate>=convert(date,getdate())

--update ActualWorkDays in TbMonths(old)
declare @MonthID tinyint=(select MonthID from TbMonths where MonthNumber=datepart(month,@OldVacationDate)
and
YearID=(select YearID from TbYears where YearNumber=datepart(year,@OldVacationDate)))

update TbMonths set MonthActualWorkDays=
(select count(MonthID) from TbCalenders where MonthID=@MonthID and IsVac=0)
where MonthID=@MonthID

--update ActualWorkDays in TbMonths(new)
set @MonthID =(select MonthID from TbMonths where MonthNumber=datepart(month,@VacationDate)
and
YearID=(select YearID from TbYears where YearNumber=datepart(year,@VacationDate)))

update TbMonths set MonthActualWorkDays=
(select count(MonthID) from TbCalenders where MonthID=@MonthID and IsVac=0)
where MonthID=@MonthID
end

-- if year of vacation is exist, vacation must be greater than today
else
begin
if @OldVacationDate>convert(date,getdate())
begin

--get duration of old vacation
set @oldDuration =(select VacationDuration from TbVacations where VacationDate=@OldVacationDate)-1

--update TbVacations
update TbVacations set VacationDate=@VacationDate,VacationDuration=@VacationDuration
where VacationDate=@OldVacationDate

--Update TbCalenders
set @StartDate =@OldVacationDate
set @EndDate =dateadd(day,@oldDuration,@StartDate)

--remove an old vacation from TbCalenders
update TbCalenders set IsVac=0 
where CalenderDate between @StartDate and @EndDate
and
datename(weekday,CalenderDate)not in(select WeekDayName from TbWeeklyVacations where IsVac=1)

--add a new vacation from TbCalenders
set @EndDate=dateadd(day,@VacationDuration-1,@VacationDate)
update TbCalenders set IsVac=1
where CalenderDate between @VacationDate and @EndDate
and CalenderDate>=convert(date,getdate())

--update ActualWorkDays in TbMonths(old)
set @MonthID =(select MonthID from TbMonths where MonthNumber=datepart(month,@OldVacationDate)
and
YearID=(select YearID from TbYears where YearNumber=datepart(year,@OldVacationDate)))

update TbMonths set MonthActualWorkDays=
(select count(MonthID) from TbCalenders where MonthID=@MonthID and IsVac=0)
where MonthID=@MonthID

--update ActualWorkDays in TbMonths(new)
set @MonthID =(select MonthID from TbMonths where MonthNumber=datepart(month,@VacationDate)
and
YearID=(select YearID from TbYears where YearNumber=datepart(year,@VacationDate)))

update TbMonths set MonthActualWorkDays=
(select count(MonthID) from TbCalenders where MonthID=@MonthID and IsVac=0)
where MonthID=@MonthID

end
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_WeeklyVacationsInMonth]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exclude number of weekly vacations days from a month
CREATE proc [dbo].[Usp_WeeklyVacationsInMonth] @year SMALLINT,@month tinyint
as
declare @WeeklyVacationsInMonth tinyint=
(select count(*) from TbWeeklyVacations where IsVac=1)*4
declare @date date=concat(@year,'-',@month,'-',1);
declare @MonthTotalDays tinyint=day(eomonth(@date))
declare @day tinyint=29

while @day<=@MonthTotalDays
begin
set @date=concat(@year,'-',@month,'-',@day)

if (select count(*) from TbWeeklyVacations where IsVac=1 and WeekDayName=datename(weekday,@date))>0
begin
set @WeeklyVacationsInMonth+=1
end
set @day+=1
end
return @WeeklyVacationsInMonth
GO
/****** Object:  StoredProcedure [dbo].[Usp_WeeklyVacationsInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_WeeklyVacationsInsert] (@DaysID varchar(7))
as
declare @DayID tinyint=0;
while @DayID<=LEN(@DaysID)
begin
update TbWeeklyVacations set isvac=1 where WeekDayID=SUBSTRING(@DaysID,@DayID,1);
set @DayID+=1;
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_WeeklyVacationsShow]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_WeeklyVacationsShow]
as
select WeekDayID from TbWeeklyVacations where IsVac=1
GO
/****** Object:  StoredProcedure [dbo].[Usp_WeeklyVacationsUpdate]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_WeeklyVacationsUpdate] (@DaysID varchar(7))
as
update TbWeeklyVacations set isvac=0;
declare @DayID tinyint=0;
while @DayID<=LEN(@DaysID)
begin
update TbWeeklyVacations set isvac=1 where WeekDayID=SUBSTRING(@DaysID,@DayID,1);
set @DayID+=1;
end


update TbCalenders set IsVac=0
where CalenderDate >convert(date,getdate())
and
CalenderDate<=CONCAT(DATEPART(year,getdate()),'-12-31')

update TbCalenders set IsVac=1
where datename(weekday,CalenderDate)in(select WeekDayName from TbWeeklyVacations where IsVac=1)
and
CalenderDate >convert(date,getdate())
and
CalenderDate<=CONCAT(DATEPART(year,getdate()),'-12-31')

--
exec Usp_VacationsToCalenderInsert

--
declare @YearID tinyint=(select YearID from TbYears where YearNumber=datepart(year,getdate()))
declare @MonthID smallint=(select top 1 MonthID from TbMonths where YearID=@YearID)
declare @MonthCounter tinyint=1
while @MonthCounter<=12
begin
update TbMonths set MonthActualWorkDays=
(select count(MonthID) from TbCalenders where MonthID=@MonthID and IsVac=0)
where MonthID=@MonthID
set @MonthID+=1
set @MonthCounter+=1
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_YearInsert]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_YearInsert]
as
declare @LastYearID tinyint=(select isnull(max(YearID),0) from TbYears);
if @LastYearID=0
begin
insert into TbYears values(1,datepart(year,getdate()))
end
else
begin
insert into TbYears values(@LastYearID+1,(select YearNumber from TbYears where YearID=@LastYearID)+1)
end
--call Usp_MonthsInsert
declare @yearNum smallint=(select max(YearNumber) from TbYears)
exec Usp_MonthsInsert @yearNum
GO
/****** Object:  StoredProcedure [dbo].[Usp_YearsShow]    Script Date: 9/16/2019 12:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_YearsShow]
as
select * from TbYears;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1---> employee attend
2---> employee absent
3--->employee late' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAttendences', @level2type=N'COLUMN',@level2name=N'AttendenceStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ طلب الاجازة  وليس بدء الاجازة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbHolidayDetails', @level2type=N'COLUMN',@level2name=N'HolidayActualDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'تاريخ بدء الاجازة الفعلى والتى من خلاله يتم الخصم الايام' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbHolidayDetails', @level2type=N'COLUMN',@level2name=N'HolidayStart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'اقصى عدد الايام المطلوبة فى هذا النوع من الاجازات' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbHolidayTypes', @level2type=N'COLUMN',@level2name=N'MaxDays'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'النسبة المئوية التى تحسب على اجمالى الراتب او اجمالى الاساسى للموظف فى حالة تم اخذ هذا النوع من الاجازة
تحسب النسبة على الكل ماعدا الاعتيادى والعارضة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbHolidayTypes', @level2type=N'COLUMN',@level2name=N'Percentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0--> فى حالة وجود خصم على الراتب بنسبة معين من عمود النسب
1---> فى حالة عدم وجود نسبة خصم ويتم الخصم من الايام الاعتيادى و العارضة التى تم تسجيلهم فى جدول الموظف' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbHolidayTypes', @level2type=N'COLUMN',@level2name=N'IsDeduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'مؤمن عليه - مؤمن عليه بعد المعاش - غير مؤمن عليه ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbInsurancesTypes', @level2type=N'COLUMN',@level2name=N'EnsuranceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نسبة خصم التامينات على المرتب الاساسى الخاصة بالموظف والتى ستكون 14% من اجمالى 40% خصم المرتبات للاجور الثابته وهو ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbInsurancesTypes', @level2type=N'COLUMN',@level2name=N'EmpFixedSalaryInsu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نسبة خصم التامينات على المرتب الاساسى الخاصة ببالشركة
 والتى ستكون 26% من اجمالى 40% خصم المرتبات للاجور الثابته  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbInsurancesTypes', @level2type=N'COLUMN',@level2name=N'ComFixedSalaryInsu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نسبة خصم التامينات على المرتب المتغير الخاصة بالموظف
 والتى ستكون 14% من اجمالى 35% خصم المرتبات للاجور الثابته وهو ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbInsurancesTypes', @level2type=N'COLUMN',@level2name=N'EmpVarSalaryInsu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نسبة خصم التامينات على المرتب المتغير الخاصة بالشركة
 والتى ستكون 24% من اجمالى 35% خصم المرتبات للاجور الثابته وهو ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbInsurancesTypes', @level2type=N'COLUMN',@level2name=N'ComVarSalaryInsu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'حساب التامينات لموظف معين  على الراتب الاساسى بناءا على نظام التامينات فى جدول التامينات وهل هو مومن علية ام لا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbSalaryStaticInfo', @level2type=N'COLUMN',@level2name=N'InsuEmpFixSalaryCalc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'حساب التامينات للشركة لموظف معين على الراتب الاساسى بناءا على نظام التامينات فى جدول التامينات وهل هو مومن علية ام لا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbSalaryStaticInfo', @level2type=N'COLUMN',@level2name=N'InsuCompFixSalaryCalc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'حساب التامينات لموظف معين على الراتب المتغير بناءا على نظام التامينات فى جدول التامينات وهل هو مومن علية ام لا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbSalaryStaticInfo', @level2type=N'COLUMN',@level2name=N'InsuEmpVarSalaryCalc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'حساب التامينات للسركة على الراتب المتغير  للموظف بناءا على نظام التامينات فى جدول التامينات وهل هو مومن علية ام لا' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbSalaryStaticInfo', @level2type=N'COLUMN',@level2name=N'InsuCompVarSalaryCalc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'جدول سوف يتم اضافة جميع البيانات الثابته التى يتم عمل عليها عمليات رياضية خاصة بالموظف مثل التامينات  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbSalaryStaticInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'فترة السماح لتاخير الموظف وتحسب بالدقائق وبعد زلك تضاف الى وقت الشيفت وتقارن مع وقت حضور الموظف لو اقل يكون حاضر دون تاخير لو اكثر يخصم من الراتب ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbShifts', @level2type=N'COLUMN',@level2name=N'DelayTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'يجب على الموظف عمل checkin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbShifts', @level2type=N'COLUMN',@level2name=N'ChekIn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'يجب على الموظف عمل checkOut' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbShifts', @level2type=N'COLUMN',@level2name=N'CheckOut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'نسبة الخصم على راتب الموظف عند دخولة شريحة معينة' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbTaxes', @level2type=N'COLUMN',@level2name=N'TaxPercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'النسبة الا هتتخصم من الخصم' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbTaxes', @level2type=N'COLUMN',@level2name=N'TaxExemption'
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
         Begin Table = "TbBranches"
            Begin Extent = 
               Top = 61
               Left = 279
               Bottom = 191
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "TbCompanies"
            Begin Extent = 
               Top = 37
               Left = 9
               Bottom = 167
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TbDepartments"
            Begin Extent = 
               Top = 6
               Left = 498
               Bottom = 136
               Right = 684
            End
            DisplayFlags = 280
            TopColumn = 2
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_Comp_Branch_Dep'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_Comp_Branch_Dep'
GO
USE [master]
GO
ALTER DATABASE [HRModuleAll] SET  READ_WRITE 
GO
