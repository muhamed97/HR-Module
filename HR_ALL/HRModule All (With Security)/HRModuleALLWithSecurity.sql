USE [master]
GO
/****** Object:  Database [HRModuleAll]    Script Date: 9/24/2019 2:32:45 PM ******/
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
/****** Object:  Table [dbo].[TbBranches]    Script Date: 9/24/2019 2:32:45 PM ******/
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
/****** Object:  Table [dbo].[TbCompanies]    Script Date: 9/24/2019 2:32:46 PM ******/
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
/****** Object:  Table [dbo].[TbDepartments]    Script Date: 9/24/2019 2:32:46 PM ******/
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
/****** Object:  View [dbo].[Vw_ShowOrganizationUnitData]    Script Date: 9/24/2019 2:32:46 PM ******/
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
/****** Object:  View [dbo].[Vw_Comp_Branch_Dep]    Script Date: 9/24/2019 2:32:46 PM ******/
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
/****** Object:  Table [dbo].[TbEmployees]    Script Date: 9/24/2019 2:32:46 PM ******/
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
/****** Object:  View [dbo].[Vw_HolidayReadEmployeeName]    Script Date: 9/24/2019 2:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[Vw_HolidayReadEmployeeName]
as
select  EmployeeID, EmployeeName,ExtraHoliday,BasicHoliday
from TbEmployees
GO
/****** Object:  Table [dbo].[TbHolidayTypes]    Script Date: 9/24/2019 2:32:46 PM ******/
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
/****** Object:  View [dbo].[Vw_HolidayReadTypeName]    Script Date: 9/24/2019 2:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Vw_HolidayReadTypeName]
as
select  HolidayTypeID, TypeName
from TbHolidayTypes
GO
/****** Object:  View [dbo].[Vw_HolidayDetailReadExtraHolidayForOnEmployee]    Script Date: 9/24/2019 2:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Vw_HolidayDetailReadExtraHolidayForOnEmployee]
as
select EmployeeID,ExtraHoliday
from TbEmployees
GO
/****** Object:  Table [dbo].[TbAdditionDetails]    Script Date: 9/24/2019 2:32:46 PM ******/
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
/****** Object:  Table [dbo].[TbAdditions]    Script Date: 9/24/2019 2:32:47 PM ******/
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
/****** Object:  Table [dbo].[TbAttendences]    Script Date: 9/24/2019 2:32:47 PM ******/
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
/****** Object:  Table [dbo].[TbCalenders]    Script Date: 9/24/2019 2:32:47 PM ******/
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
/****** Object:  Table [dbo].[TbDeductionDetails]    Script Date: 9/24/2019 2:32:47 PM ******/
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
/****** Object:  Table [dbo].[TbDeductions]    Script Date: 9/24/2019 2:32:47 PM ******/
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
/****** Object:  Table [dbo].[TbEducations]    Script Date: 9/24/2019 2:32:47 PM ******/
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
/****** Object:  Table [dbo].[TbEmployeeMasterData]    Script Date: 9/24/2019 2:32:47 PM ******/
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
/****** Object:  Table [dbo].[TbHolidayDetails]    Script Date: 9/24/2019 2:32:48 PM ******/
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
/****** Object:  Table [dbo].[TbInsurancesTypes]    Script Date: 9/24/2019 2:32:48 PM ******/
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
/****** Object:  Table [dbo].[TbJobTitles]    Script Date: 9/24/2019 2:32:48 PM ******/
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
/****** Object:  Table [dbo].[TbMonths]    Script Date: 9/24/2019 2:32:48 PM ******/
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
/****** Object:  Table [dbo].[TbPayrollAudits]    Script Date: 9/24/2019 2:32:48 PM ******/
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
/****** Object:  Table [dbo].[TbPayrolls]    Script Date: 9/24/2019 2:32:48 PM ******/
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
/****** Object:  Table [dbo].[TbPositions]    Script Date: 9/24/2019 2:32:48 PM ******/
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
/****** Object:  Table [dbo].[TbRoles]    Script Date: 9/24/2019 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbRoles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TbRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbSalaryAudits]    Script Date: 9/24/2019 2:32:48 PM ******/
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
/****** Object:  Table [dbo].[TbSalaryStaticInfo]    Script Date: 9/24/2019 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbSalaryStaticInfo](
	[EmployeeID] [int] NOT NULL,
	[InsuranceID] [int] NULL,
	[InsuEmpFixSalaryCalc] [decimal](9, 2) NULL,
	[InsuCompFixSalaryCalc] [decimal](9, 2) NULL,
	[InsuEmpVarSalaryCalc] [decimal](9, 2) NULL,
	[InsuCompVarSalaryCalc] [decimal](9, 2) NULL,
 CONSTRAINT [PK_TbSalaryStaticInfo] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbShifts]    Script Date: 9/24/2019 2:32:49 PM ******/
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
/****** Object:  Table [dbo].[TbShiftsVacations]    Script Date: 9/24/2019 2:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbShiftsVacations](
	[ShiftID] [int] NOT NULL,
	[WeekDayID] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbTaxes]    Script Date: 9/24/2019 2:32:49 PM ******/
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
/****** Object:  Table [dbo].[TbUserRoles]    Script Date: 9/24/2019 2:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_TbUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbUsers]    Script Date: 9/24/2019 2:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbUsers](
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserHashedPassword] [nvarchar](max) NOT NULL,
	[QuestionForForgetPassword] [nvarchar](max) NOT NULL,
	[AnswerForForgetPassword] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TbUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbVacations]    Script Date: 9/24/2019 2:32:49 PM ******/
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
/****** Object:  Table [dbo].[TbWeeklyVacations]    Script Date: 9/24/2019 2:32:49 PM ******/
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
/****** Object:  Table [dbo].[TbYears]    Script Date: 9/24/2019 2:32:49 PM ******/
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
SET IDENTITY_INSERT [dbo].[TbAdditionDetails] ON 

INSERT [dbo].[TbAdditionDetails] ([AdditionDetailsID], [AdditionID], [EmployeeID], [Notes], [AdditionDetailsDate], [Amount]) VALUES (3, 1, 1, N'', CAST(N'2019-02-16' AS Date), CAST(600.00 AS Decimal(9, 2)))
INSERT [dbo].[TbAdditionDetails] ([AdditionDetailsID], [AdditionID], [EmployeeID], [Notes], [AdditionDetailsDate], [Amount]) VALUES (5, 1, 32, N'ddd', CAST(N'2019-02-16' AS Date), CAST(600.00 AS Decimal(9, 2)))
INSERT [dbo].[TbAdditionDetails] ([AdditionDetailsID], [AdditionID], [EmployeeID], [Notes], [AdditionDetailsDate], [Amount]) VALUES (7, 1, 1, N'ff', CAST(N'2019-01-01' AS Date), CAST(3.00 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[TbAdditionDetails] OFF
SET IDENTITY_INSERT [dbo].[TbAdditions] ON 

INSERT [dbo].[TbAdditions] ([AdditionID], [AdditionName], [Notes]) VALUES (1, N'bounce', N'')
SET IDENTITY_INSERT [dbo].[TbAdditions] OFF
SET IDENTITY_INSERT [dbo].[TbAttendences] ON 

INSERT [dbo].[TbAttendences] ([AttendID], [AttendFrom], [AttendTo], [Delay], [Date], [EmployeeID], [ShiftID], [Notes], [AttendenceStatus]) VALUES (1, CAST(N'10:45:57' AS Time), CAST(N'10:46:22' AS Time), CAST(N'00:33:16' AS Time), CAST(N'2019-09-11' AS Date), 1, 2, N'', N'2')
INSERT [dbo].[TbAttendences] ([AttendID], [AttendFrom], [AttendTo], [Delay], [Date], [EmployeeID], [ShiftID], [Notes], [AttendenceStatus]) VALUES (2, CAST(N'10:45:57' AS Time), CAST(N'10:46:22' AS Time), CAST(N'00:33:16' AS Time), CAST(N'2019-09-10' AS Date), 1, 2, N'', N'2')
INSERT [dbo].[TbAttendences] ([AttendID], [AttendFrom], [AttendTo], [Delay], [Date], [EmployeeID], [ShiftID], [Notes], [AttendenceStatus]) VALUES (3, CAST(N'10:45:57' AS Time), CAST(N'10:46:22' AS Time), CAST(N'00:33:16' AS Time), CAST(N'2019-09-11' AS Date), 1, 2, N'', N'2')
INSERT [dbo].[TbAttendences] ([AttendID], [AttendFrom], [AttendTo], [Delay], [Date], [EmployeeID], [ShiftID], [Notes], [AttendenceStatus]) VALUES (4, CAST(N'04:44:26' AS Time), CAST(N'04:44:54' AS Time), CAST(N'01:11:47' AS Time), CAST(N'2019-09-16' AS Date), 32, 3, N'', N'2')
SET IDENTITY_INSERT [dbo].[TbAttendences] OFF
SET IDENTITY_INSERT [dbo].[TbBranches] ON 

INSERT [dbo].[TbBranches] ([BranchID], [BranchName], [CompanyID], [BranchMail], [BranchPhone], [BranchFax], [BranchAddress], [BranchStartDate]) VALUES (1, N'alexBranch', 1, N'alex@aasermedia.com', 1011081610, 2020, N'roshdy', CAST(N'2019-09-07' AS Date))
INSERT [dbo].[TbBranches] ([BranchID], [BranchName], [CompanyID], [BranchMail], [BranchPhone], [BranchFax], [BranchAddress], [BranchStartDate]) VALUES (2, N'CairoBranch', 1, N'alex@aasermedia.com', 1011081610, 2020, N'roshdy', CAST(N'2019-09-07' AS Date))
SET IDENTITY_INSERT [dbo].[TbBranches] OFF
SET IDENTITY_INSERT [dbo].[TbCalenders] ON 

INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (1, CAST(N'2019-01-01' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (2, CAST(N'2019-01-02' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (3, CAST(N'2019-01-03' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (4, CAST(N'2019-01-04' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (5, CAST(N'2019-01-05' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (6, CAST(N'2019-01-06' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (7, CAST(N'2019-01-07' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (8, CAST(N'2019-01-08' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (9, CAST(N'2019-01-09' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (10, CAST(N'2019-01-10' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (11, CAST(N'2019-01-11' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (12, CAST(N'2019-01-12' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (13, CAST(N'2019-01-13' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (14, CAST(N'2019-01-14' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (15, CAST(N'2019-01-15' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (16, CAST(N'2019-01-16' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (17, CAST(N'2019-01-17' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (18, CAST(N'2019-01-18' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (19, CAST(N'2019-01-19' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (20, CAST(N'2019-01-20' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (21, CAST(N'2019-01-21' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (22, CAST(N'2019-01-22' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (23, CAST(N'2019-01-23' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (24, CAST(N'2019-01-24' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (25, CAST(N'2019-01-25' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (26, CAST(N'2019-01-26' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (27, CAST(N'2019-01-27' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (28, CAST(N'2019-01-28' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (29, CAST(N'2019-01-29' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (30, CAST(N'2019-01-30' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (31, CAST(N'2019-01-31' AS Date), 0, 1)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (32, CAST(N'2019-02-01' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (33, CAST(N'2019-02-02' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (34, CAST(N'2019-02-03' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (35, CAST(N'2019-02-04' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (36, CAST(N'2019-02-05' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (37, CAST(N'2019-02-06' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (38, CAST(N'2019-02-07' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (39, CAST(N'2019-02-08' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (40, CAST(N'2019-02-09' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (41, CAST(N'2019-02-10' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (42, CAST(N'2019-02-11' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (43, CAST(N'2019-02-12' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (44, CAST(N'2019-02-13' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (45, CAST(N'2019-02-14' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (46, CAST(N'2019-02-15' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (47, CAST(N'2019-02-16' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (48, CAST(N'2019-02-17' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (49, CAST(N'2019-02-18' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (50, CAST(N'2019-02-19' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (51, CAST(N'2019-02-20' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (52, CAST(N'2019-02-21' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (53, CAST(N'2019-02-22' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (54, CAST(N'2019-02-23' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (55, CAST(N'2019-02-24' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (56, CAST(N'2019-02-25' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (57, CAST(N'2019-02-26' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (58, CAST(N'2019-02-27' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (59, CAST(N'2019-02-28' AS Date), 0, 2)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (60, CAST(N'2019-03-01' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (61, CAST(N'2019-03-02' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (62, CAST(N'2019-03-03' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (63, CAST(N'2019-03-04' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (64, CAST(N'2019-03-05' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (65, CAST(N'2019-03-06' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (66, CAST(N'2019-03-07' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (67, CAST(N'2019-03-08' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (68, CAST(N'2019-03-09' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (69, CAST(N'2019-03-10' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (70, CAST(N'2019-03-11' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (71, CAST(N'2019-03-12' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (72, CAST(N'2019-03-13' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (73, CAST(N'2019-03-14' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (74, CAST(N'2019-03-15' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (75, CAST(N'2019-03-16' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (76, CAST(N'2019-03-17' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (77, CAST(N'2019-03-18' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (78, CAST(N'2019-03-19' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (79, CAST(N'2019-03-20' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (80, CAST(N'2019-03-21' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (81, CAST(N'2019-03-22' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (82, CAST(N'2019-03-23' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (83, CAST(N'2019-03-24' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (84, CAST(N'2019-03-25' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (85, CAST(N'2019-03-26' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (86, CAST(N'2019-03-27' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (87, CAST(N'2019-03-28' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (88, CAST(N'2019-03-29' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (89, CAST(N'2019-03-30' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (90, CAST(N'2019-03-31' AS Date), 0, 3)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (91, CAST(N'2019-04-01' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (92, CAST(N'2019-04-02' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (93, CAST(N'2019-04-03' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (94, CAST(N'2019-04-04' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (95, CAST(N'2019-04-05' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (96, CAST(N'2019-04-06' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (97, CAST(N'2019-04-07' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (98, CAST(N'2019-04-08' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (99, CAST(N'2019-04-09' AS Date), 0, 4)
GO
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (100, CAST(N'2019-04-10' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (101, CAST(N'2019-04-11' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (102, CAST(N'2019-04-12' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (103, CAST(N'2019-04-13' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (104, CAST(N'2019-04-14' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (105, CAST(N'2019-04-15' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (106, CAST(N'2019-04-16' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (107, CAST(N'2019-04-17' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (108, CAST(N'2019-04-18' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (109, CAST(N'2019-04-19' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (110, CAST(N'2019-04-20' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (111, CAST(N'2019-04-21' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (112, CAST(N'2019-04-22' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (113, CAST(N'2019-04-23' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (114, CAST(N'2019-04-24' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (115, CAST(N'2019-04-25' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (116, CAST(N'2019-04-26' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (117, CAST(N'2019-04-27' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (118, CAST(N'2019-04-28' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (119, CAST(N'2019-04-29' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (120, CAST(N'2019-04-30' AS Date), 0, 4)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (121, CAST(N'2019-05-01' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (122, CAST(N'2019-05-02' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (123, CAST(N'2019-05-03' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (124, CAST(N'2019-05-04' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (125, CAST(N'2019-05-05' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (126, CAST(N'2019-05-06' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (127, CAST(N'2019-05-07' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (128, CAST(N'2019-05-08' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (129, CAST(N'2019-05-09' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (130, CAST(N'2019-05-10' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (131, CAST(N'2019-05-11' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (132, CAST(N'2019-05-12' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (133, CAST(N'2019-05-13' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (134, CAST(N'2019-05-14' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (135, CAST(N'2019-05-15' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (136, CAST(N'2019-05-16' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (137, CAST(N'2019-05-17' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (138, CAST(N'2019-05-18' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (139, CAST(N'2019-05-19' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (140, CAST(N'2019-05-20' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (141, CAST(N'2019-05-21' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (142, CAST(N'2019-05-22' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (143, CAST(N'2019-05-23' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (144, CAST(N'2019-05-24' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (145, CAST(N'2019-05-25' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (146, CAST(N'2019-05-26' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (147, CAST(N'2019-05-27' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (148, CAST(N'2019-05-28' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (149, CAST(N'2019-05-29' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (150, CAST(N'2019-05-30' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (151, CAST(N'2019-05-31' AS Date), 0, 5)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (152, CAST(N'2019-06-01' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (153, CAST(N'2019-06-02' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (154, CAST(N'2019-06-03' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (155, CAST(N'2019-06-04' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (156, CAST(N'2019-06-05' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (157, CAST(N'2019-06-06' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (158, CAST(N'2019-06-07' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (159, CAST(N'2019-06-08' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (160, CAST(N'2019-06-09' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (161, CAST(N'2019-06-10' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (162, CAST(N'2019-06-11' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (163, CAST(N'2019-06-12' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (164, CAST(N'2019-06-13' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (165, CAST(N'2019-06-14' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (166, CAST(N'2019-06-15' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (167, CAST(N'2019-06-16' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (168, CAST(N'2019-06-17' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (169, CAST(N'2019-06-18' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (170, CAST(N'2019-06-19' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (171, CAST(N'2019-06-20' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (172, CAST(N'2019-06-21' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (173, CAST(N'2019-06-22' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (174, CAST(N'2019-06-23' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (175, CAST(N'2019-06-24' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (176, CAST(N'2019-06-25' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (177, CAST(N'2019-06-26' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (178, CAST(N'2019-06-27' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (179, CAST(N'2019-06-28' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (180, CAST(N'2019-06-29' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (181, CAST(N'2019-06-30' AS Date), 0, 6)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (182, CAST(N'2019-07-01' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (183, CAST(N'2019-07-02' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (184, CAST(N'2019-07-03' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (185, CAST(N'2019-07-04' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (186, CAST(N'2019-07-05' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (187, CAST(N'2019-07-06' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (188, CAST(N'2019-07-07' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (189, CAST(N'2019-07-08' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (190, CAST(N'2019-07-09' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (191, CAST(N'2019-07-10' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (192, CAST(N'2019-07-11' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (193, CAST(N'2019-07-12' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (194, CAST(N'2019-07-13' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (195, CAST(N'2019-07-14' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (196, CAST(N'2019-07-15' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (197, CAST(N'2019-07-16' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (198, CAST(N'2019-07-17' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (199, CAST(N'2019-07-18' AS Date), 0, 7)
GO
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (200, CAST(N'2019-07-19' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (201, CAST(N'2019-07-20' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (202, CAST(N'2019-07-21' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (203, CAST(N'2019-07-22' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (204, CAST(N'2019-07-23' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (205, CAST(N'2019-07-24' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (206, CAST(N'2019-07-25' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (207, CAST(N'2019-07-26' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (208, CAST(N'2019-07-27' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (209, CAST(N'2019-07-28' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (210, CAST(N'2019-07-29' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (211, CAST(N'2019-07-30' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (212, CAST(N'2019-07-31' AS Date), 0, 7)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (213, CAST(N'2019-08-01' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (214, CAST(N'2019-08-02' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (215, CAST(N'2019-08-03' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (216, CAST(N'2019-08-04' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (217, CAST(N'2019-08-05' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (218, CAST(N'2019-08-06' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (219, CAST(N'2019-08-07' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (220, CAST(N'2019-08-08' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (221, CAST(N'2019-08-09' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (222, CAST(N'2019-08-10' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (223, CAST(N'2019-08-11' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (224, CAST(N'2019-08-12' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (225, CAST(N'2019-08-13' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (226, CAST(N'2019-08-14' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (227, CAST(N'2019-08-15' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (228, CAST(N'2019-08-16' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (229, CAST(N'2019-08-17' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (230, CAST(N'2019-08-18' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (231, CAST(N'2019-08-19' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (232, CAST(N'2019-08-20' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (233, CAST(N'2019-08-21' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (234, CAST(N'2019-08-22' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (235, CAST(N'2019-08-23' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (236, CAST(N'2019-08-24' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (237, CAST(N'2019-08-25' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (238, CAST(N'2019-08-26' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (239, CAST(N'2019-08-27' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (240, CAST(N'2019-08-28' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (241, CAST(N'2019-08-29' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (242, CAST(N'2019-08-30' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (243, CAST(N'2019-08-31' AS Date), 0, 8)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (244, CAST(N'2019-09-01' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (245, CAST(N'2019-09-02' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (246, CAST(N'2019-09-03' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (247, CAST(N'2019-09-04' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (248, CAST(N'2019-09-05' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (249, CAST(N'2019-09-06' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (250, CAST(N'2019-09-07' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (251, CAST(N'2019-09-08' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (252, CAST(N'2019-09-09' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (253, CAST(N'2019-09-10' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (254, CAST(N'2019-09-11' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (255, CAST(N'2019-09-12' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (256, CAST(N'2019-09-13' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (257, CAST(N'2019-09-14' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (258, CAST(N'2019-09-15' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (259, CAST(N'2019-09-16' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (260, CAST(N'2019-09-17' AS Date), 1, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (261, CAST(N'2019-09-18' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (262, CAST(N'2019-09-19' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (263, CAST(N'2019-09-20' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (264, CAST(N'2019-09-21' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (265, CAST(N'2019-09-22' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (266, CAST(N'2019-09-23' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (267, CAST(N'2019-09-24' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (268, CAST(N'2019-09-25' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (269, CAST(N'2019-09-26' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (270, CAST(N'2019-09-27' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (271, CAST(N'2019-09-28' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (272, CAST(N'2019-09-29' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (273, CAST(N'2019-09-30' AS Date), 0, 9)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (274, CAST(N'2019-10-01' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (275, CAST(N'2019-10-02' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (276, CAST(N'2019-10-03' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (277, CAST(N'2019-10-04' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (278, CAST(N'2019-10-05' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (279, CAST(N'2019-10-06' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (280, CAST(N'2019-10-07' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (281, CAST(N'2019-10-08' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (282, CAST(N'2019-10-09' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (283, CAST(N'2019-10-10' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (284, CAST(N'2019-10-11' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (285, CAST(N'2019-10-12' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (286, CAST(N'2019-10-13' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (287, CAST(N'2019-10-14' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (288, CAST(N'2019-10-15' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (289, CAST(N'2019-10-16' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (290, CAST(N'2019-10-17' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (291, CAST(N'2019-10-18' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (292, CAST(N'2019-10-19' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (293, CAST(N'2019-10-20' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (294, CAST(N'2019-10-21' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (295, CAST(N'2019-10-22' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (296, CAST(N'2019-10-23' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (297, CAST(N'2019-10-24' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (298, CAST(N'2019-10-25' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (299, CAST(N'2019-10-26' AS Date), 0, 10)
GO
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (300, CAST(N'2019-10-27' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (301, CAST(N'2019-10-28' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (302, CAST(N'2019-10-29' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (303, CAST(N'2019-10-30' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (304, CAST(N'2019-10-31' AS Date), 0, 10)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (305, CAST(N'2019-11-01' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (306, CAST(N'2019-11-02' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (307, CAST(N'2019-11-03' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (308, CAST(N'2019-11-04' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (309, CAST(N'2019-11-05' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (310, CAST(N'2019-11-06' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (311, CAST(N'2019-11-07' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (312, CAST(N'2019-11-08' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (313, CAST(N'2019-11-09' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (314, CAST(N'2019-11-10' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (315, CAST(N'2019-11-11' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (316, CAST(N'2019-11-12' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (317, CAST(N'2019-11-13' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (318, CAST(N'2019-11-14' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (319, CAST(N'2019-11-15' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (320, CAST(N'2019-11-16' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (321, CAST(N'2019-11-17' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (322, CAST(N'2019-11-18' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (323, CAST(N'2019-11-19' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (324, CAST(N'2019-11-20' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (325, CAST(N'2019-11-21' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (326, CAST(N'2019-11-22' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (327, CAST(N'2019-11-23' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (328, CAST(N'2019-11-24' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (329, CAST(N'2019-11-25' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (330, CAST(N'2019-11-26' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (331, CAST(N'2019-11-27' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (332, CAST(N'2019-11-28' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (333, CAST(N'2019-11-29' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (334, CAST(N'2019-11-30' AS Date), 0, 11)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (335, CAST(N'2019-12-01' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (336, CAST(N'2019-12-02' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (337, CAST(N'2019-12-03' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (338, CAST(N'2019-12-04' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (339, CAST(N'2019-12-05' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (340, CAST(N'2019-12-06' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (341, CAST(N'2019-12-07' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (342, CAST(N'2019-12-08' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (343, CAST(N'2019-12-09' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (344, CAST(N'2019-12-10' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (345, CAST(N'2019-12-11' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (346, CAST(N'2019-12-12' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (347, CAST(N'2019-12-13' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (348, CAST(N'2019-12-14' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (349, CAST(N'2019-12-15' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (350, CAST(N'2019-12-16' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (351, CAST(N'2019-12-17' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (352, CAST(N'2019-12-18' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (353, CAST(N'2019-12-19' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (354, CAST(N'2019-12-20' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (355, CAST(N'2019-12-21' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (356, CAST(N'2019-12-22' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (357, CAST(N'2019-12-23' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (358, CAST(N'2019-12-24' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (359, CAST(N'2019-12-25' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (360, CAST(N'2019-12-26' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (361, CAST(N'2019-12-27' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (362, CAST(N'2019-12-28' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (363, CAST(N'2019-12-29' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (364, CAST(N'2019-12-30' AS Date), 0, 12)
INSERT [dbo].[TbCalenders] ([CalenderID], [CalenderDate], [IsVac], [MonthID]) VALUES (365, CAST(N'2019-12-31' AS Date), 0, 12)
SET IDENTITY_INSERT [dbo].[TbCalenders] OFF
SET IDENTITY_INSERT [dbo].[TbCompanies] ON 

INSERT [dbo].[TbCompanies] ([CompanyID], [CompanyName], [CompanyPhone], [CompanyFax], [CompanyCreationDate], [CompanyAddress], [CompanyLogo], [CompanyEmail], [CompanyEmailBox]) VALUES (1, N'aasermedia.com', N'01011081610', N'2020', CAST(N'2019-09-10' AS Date), N'alexandria', 0x89504E470D0A1A0A0000000D494844520000012C000000D908060000009A550D6B0000200049444154789CEC5D0978D5C4F69FBBE476DF59CB56A0EC5B054436A16229886CB25BB102022262AD8888889502A594B258B652A05444E4212262ADD85711B142AD50107915112B227FE4218F577995877DB5E67F4E6E72EF244DEED60DCAFCBEEF7C49269399C964E697332767268430303030303030303030303030303030303030303030303030303030303030303030303030303030D41E8CC437C85B3F766E03FD84F9B6257A493DC34B3B7DF5239FA9ED32333030DC85F027C16DC20D2979C70D5BBF2D376EFD967740CA0D5B0AF71AD61F37D676E1191818EE1E20E1F4D53FF27CA631AD90775A369F89A8ED1B606060B87BE00932493FFAF953DCA633BC9A1835C285731B4E8FABED1B606060B87B808415AD1FF1DC196EFD37BCB3624C39C5088B8181A1C62010966178CC19D3EB5FF3CE0AB7A68011160303438DC19B20610D7BF60CB7FA14EFB4249F6084C5C0C050ADD083F8BE3098743DB7842CFA742EC919F9DCB4ABA6A402DE6949FC8A1116030343B5C1D3D79D743CF82C595BBA9194FCB599F07FA5117E5DCAA3BCDBF213BC8912378D7D59D8B27C46580C0C0C550E745F6810338844FD5F122914884A141E086BFDDA49BCDBD2AF9C97F83C46580CB72D70286114B70C7706F05979370F246130F4DB51B68994D26425C9FA351379F7C55F3A2D6E71C7186131DC7670273E812186457BE71936161C326C395360D8F28F1D86CD5FF72446AEB6CBC6A00D7CB904C78F20337F5D452EE0D04F1051AB12B69286B56A02EFBE28CF69717BE50B46580CB715BC89874FB821E160BE6C6AC6B66F79C3D66FCB80B8561B5E3FE65DDB8564904130AA873523BDF35F26FBFF4C25E56A5A152D1B92C7F3EE2F1F15C443DCD2FBCAAD65FFA5CF196131DC363081F4D647BD9AA93DA7AC90376C292C32A49E8ED40D9E52DBE565303FB3E6EB269279BFBD4EAE58B4A934F396A7352C291C8E3F5EDB9BF7989FEB94B8CFCF2D777FFEEFDD6BFB861918240482CC362CFEE09A714B216F47CA0D9BFF916148F9AA5E6D17FA2E056A55FE0FB62783CEC49143404A56AD2A8DD2A61443425AD6AD98C00F5DF43ADF7BFEA652F7293BAF68CAD4B72EBBCFD85BE83E75572C71F761F64C86DB0621208986959FDD727C32EC3FAE18379D9E6098B68235E49A833B6720A13BA692A5BFAF23C5925D8ADFACB05789613C1556BA45C7FFB8D3832F7ACBD322FF58673A0F698ED190D12043413A62BEB575C30C0C6A680BB2D6989C7B0B8888774C0ACDDBD433078C29279AD6F60DD471E04B2170624F32FCFC5292AF659FE255342C94E2ED463EFA54377ED077BDE572F6BEB201F93D67113321A98989B02FC50CB72190B0528CAB8E9672A9FFE0D5C4288A324CDC161B377C3DCBF0DC36D6B8AB1EEE5E26D2FEFDA749CA1F1BC84DA59D4A29160D8BDAFF20B3013FE45C2F2D395BDB37C8C0E02CDA83AC37AEC92B356EFA87B0CC88796B168EDA979F3B436D41367E7304B4ADB6B57D3375048203E8EC8164D2A515A4B0827D2A4D3EE4D3D2B030ECBD8F1AF223BFEFA92A23BEEF79B1B66F9481C15974247AC346E39AFC326EE319BE3262DC78E69671FDD70B8CF11F9B6AFBA6EE607836F22561879E2719E800CA2BEC5216BF2A157B15BF59211076E060037EFC0FDDD5E57C7746580C771C3A13A3290D09CBB801176BFB8697B69CB055867D5321ACE235DF9C32BE7EA2676DDFD81D06C101F4D587C974C10154CD4E456DFFDCACE3772F19C4272F9A28C8AA4513F8A32B3B59E248F1B23EAECF3FFE63377529EAC6088BE18E02DA9D3A1393FB56E39AE365C2626DD2A26D2AFBB6C28CF4826F662933AEFB3AD9987884399CDA8630ADA67330E9FDE502B2AF3C9594CB6C539BD5ED55A9AF8EE47D1EFD48106F711B10F5017F6E6D53D975870E06F1332F7451971F3B9F2366A2F48E5CDFB4D598F75A7656CAD8F75A757EF493D0F64FE4B763AE2C0CB50EEC2C5D89BB573A1056B971DD69DE2CDF085B4E146598B44F0B07619C4A186CCF1BD716B035C1D5213880BE3E81CC2D5E4BAE581C3D55A6D528ED5473E7CEE27D267C5841B2137AC8D2287EC3C8BF76AE0D1F7BB1A352CAA7E6B55908F9874565B5DC89C72A7168297DFEA70ED36ABBC218EE6E206185110FDF0CE39A8272CE4252DFF01C4558F6C54EFC94D3E5DCEB5FA77349C7026BFB866F13080EA083DA9141DFC4911CC901D4119B94B47D21F629DE77CC0782F850DBEC653DE49A196C6F6DD3F33FBEE3C117EDF5B4C82F3B4DD74D46D2DEBB81216EC14F6DCB17FE5F3BDEAE5C6AC786900CB50AEC38DD8997FF0E0E092BE5346F4A11088697F64DD4BEAD304E231E1D1F48EB322EB76B78647E6DDF776DC264D493566F4C21F125EB48316D9B52DAA9FE52121615F642CC4CDE77D4FB15247B6977D5B49469946F26D7BDDD482FBF26C69DCB7E09E51D92CBADAFD776E531DCDD40C2EA497C8276726B4E21A154105385B0D32A61F6AE3B2D8699B790D77E2EE9CBBBCDE15470009D607600CDFB4BA131697EF553FA5889DBF48591BCDFF0FDBCAF28B8DF60E43B7CD19A46EAE92AEC6240583702BD487FFF60C3EEB5FF0CE11D9135FF0C6184C550AB3013966FFD5D0261ADFD5A2626C5B123E74D1ADB0A616B4E1573AB4E4C37BEB0FB6E703875076DA6FDFE5964EDAD0DA444CD4D812624351B96327EF9661DFFE1E25EFCE6971E12240DE454522BB9CD4B6348296A58258D7CC9800020ACB45F9BF10E0A232C865A0592452F12D078B7690D10492D08B7FAE421D0B6EAAAC3A9E000FAF44032E1E715E4CC5F6ADA4E2D0994E566F3403220B0897EF75BFF0AE61D1446580CB50A24ACDEA47EF33D2EFD4DA5AA64D5C99B5CF289F9DC2B5975C9E1D4B3A12FE99A134B32FE872B806ACCF5D31447E25426FE66521ADA8084D703C2DA5FDC907748FEDD90111643AD0209ABAFAE51EBBDDCAA53BC4990938A2D12CA29CBBEA9423C3ACE4971FFA44A7CB5EB1469249F2CE056E4DFE96B2F090EA0AF0C23D3AFAE224596A9348AB97E164D47E1CAA05CCBAA42BC34F939B5A564D63F379CEF333299EF397C6D05891CB3843FBAB43DC62BEBD8980CAA0F84F5F71B41BC2392FD5B10232C865A0512567F5D93F6FB812CF8DB430A4AB9A4E349DC6B9F78D676E53809C101B44323D2EBD84B64EF9FA9A48C2623B5F9807F29084B35BE236950E74E2D6FC907F47F9BF7EFB79B0F00F15791AE43D6F17FA6EACABB3525110D9AE8767F51E2CF3B288CB0186A15A80D0CD035EF72C0B412B49DDB49920ACE9996E787EBEA87D4761D3902C10174F538128B0EA0B209C92A1A909A23A83DA3BBA34BCA7CB8B0271FD07B974D69D4EF0DFE8F4D46BE4F2B32C8DB8FECC8BBEE537EF2A60F6F4F0A7EF7395FDB15CD707703092B5CD7F29E4CFAC7996ED4D68D3A3669ECBB29F64D2AD7ABC55186A9C42D37251EDF6A5AFC997F6D5794060407D0FEA124FCEB5749B6E400EAB076A4B43F698569695D6A84F5720F3EF0DEB72C12A0D8A234EE93211056746F82F33D17CD7E853B75EADF9E65676F79F25AF2CD7F3CAF1FFADE93ADEDCE50AB40C21AA46B7D6F96DB0A2009414E28B6B49C50D9578B5F99B08A7999124F5C3625E48FD1B7E95DDBF54503B5AA56DBA3495CC93A725DE94EA06A93A2B523154D4B550BA3C8484D2393D9BF90B0160061757FD3A634EE952E10D6C167492B82331D0889D6E9C81C90181599A3D79328105C86C858BB55CE70B743202C7DDB3E07811478A5B855228C3EE7A688E7A6728DBD3484FDE55FED352DFE3CB896EB4C70001DD1950C3DB7841C75F2CB5CD57F19545CF3E14BDDF9C0B01D3625B8C73681B07E5F479A8B6D0027A8FBDB106FC2C88AE1360036C2087DFB01D96EE26FC9AB4B4C55954EC2F1EBA6A55F4EE3666CA90D8753ACAF909563C942E8EC376CADFEA9FC12C853C3397BE764DA94C6D741D9D7434A9BFB707E773EA8CB1B7C2008BDA525386C0BFFC74623FFDFF58286C5C070C7003B60A4BED303394004BC52DC1C0CB325CEC677388D65F939A6C5B9A1355857B8CE79E7DDD34986F00F40357B92235FF8ECD9ABB46C58B6848AF7D14B617C50C7ED36A549D7CD8286756B03A9AB0EBB0C7514688719AAEF32F890DB52200610D3D2AF78695F2ECAF0AFC4F815E3AA85D916AD3C6D0B94B5C4B4E4CB79A6B9EF57B7C3299255CF7DB3C87EAD2F775A73FE945F006573FB54BE1A56B06B29EC5E15BE202ACA7365B51FDFAADB7A3EA87D3A5F0F2448947A948C1FF2BC101708AB6335D71B034395023BFA307DB7870EBB2D01D2B86325FFB85BDC17D5E5708A75D47D5B34D953697B93037194A4A426BC9DF4CF2D6FC4BFFEE4437CF294E11564EBAC07F8FFAC7317E2FFB14130B83330DC31C0CE38DC70CF8823EEF15FF156C917E52B1B92AFD8AA85A9A5A396AE5698A3E5C8E7DDE2F34BDD16E725BACDCFAE4A87531C32B79F1B4136FE49AD04AA666352DAA414F3F66C7ABACBAE53B1736979BF57D0EA68BB96CABE327EE946C296B166B8A3808435D2D06374AEFB62E8F87540DC167F79D6EDD52FC2896F83CAD60D1AF583C39A0AAB8196286D524AA7CD0A46722D1B96DABE2DA3BB23F62C3523FD66957415E7FEB789DC567E220C0CF680B699D1867BC71D757FED4BBEAE88DB6B5F96BBC5E5A5B9BDF449651C4EF153FEC8DC17C959DA26A5B44FA9AE0E9AA612AEB5AF8C6FEB5A659EF6D257B39B51040784D5BF8ADA1103438D00096B8CE1BE8979EE71797C45F952943CC5F64B8D786AF195D7DA4A43AD0CF6F254CBCB7C0CA475C9ED952F461A472E72B65E849F733CD98F64946BD88CD40CEAB66C4C6A3629653C7B6928E3AA6A610EA62712567895B72806866A0412D638439FA87CF757A1B3D751715B746C87DB4B9FBA3B512FFE7A1D9956B8D8FC63084D51B149A9D995945F0EEDC5578BA766FF52D5F86C9557111F082BB2BA1A16034375003BF10443DFE8E3EE8B8EF1EE8BA0830B5B5B92A7122F4F655FB9D50A534BC399738E94F718EFF6CAB1DD6ECFEE77A44E841F7344F522BB94DA919A2B82CCC04D9FA3ED462A1A999AADCB9681BD824D4A851095F62ADE4EFCB24D6458F5362F0686AA057E519B64EC3FB5C0FD15E8DC755D161E1DEA409DA0ED2AEAEFCF91224DEDC8118DC6965D492B9E8210556D55F6D250B361696B5823ABB97D3130542990B0A28C03A69F82CECC2BC563E131106558C57D8CA776BE62FC6396306BF83141D4E259E31EAB5036B5FCD5CB738CDEEE75A04E4282BC48E2EFEB4899DA1F6C6CD9B0D4C45E7C59FA2A1A9CEAA46ADA8EA566234B5339AFB47B9935AC31D5DDC01818AA124858938D039F3AEDF13274EA3A2EEE2F1F2DB2531FE877D57F467F92E590BDCA519B91ABF1AB325D150D11086B520DB43106862A030E7FA28D0FCC3EE3BE003A3588FB822F84AD87E5D81CE64E8599E50BCB393A4C799D35EE179670657C77C5B662FACABCE87CBEA0D2B79653239F2B76EA431822EF984A0A693B9345F3918E556C46B6867332FF2AA58D4B690F5349A38263AAD21666C36E66C7AD81AD6FC5704701096B0A37E8D9428F97A053D779F9FCEA80D3F7D95AA1A01EC8DCE30BC935550D45694752928196BDCA067938E5B7A52C87561AB6F2B40E53CBAEAD66AB3530DC5940C29AC63D187BD67D7E2E5FD7A5C9A64DE503BFED1D6DA33E4240127F5D456E55F07952212C357B922D1B96BDB84A82D1B457A91D6B919D4AFA78CDEFEBC84E1F777237FC1392A10EC117643A1731F7ACFB3CE8D4A27850E2AE10B570B5F81E2AF1ED85D94A5F590EB5F3B6D2F759F431DFAF60081F5E789F2DC2EAE8EB4E52FFD8282E1FA318BA39B4D48B62F8A675BEC2741907CE69C575B44CD250F1979564DF9C0748604D35320686AA8259C31AF074A1C70B9FF31E2F400717B6D27E2E15A63CF7B9465C47D2504BD3D6B1B369C8E37BCE3BC287654FE31F38DB9B0FFF872661A1B6D1BD7920D9599E4A75F6CD8AAD5618657F529BEBA7391FD0D1F4D5F2D23AA79106685557FF3683C418F48CAC18EE4C085373F4CDEE39E431F733DE63EEE732F114C55E98BDF86AFB6AE75C4DD79678CE3DC2B7FBDBCBFCA0EF7A0BF240E17D9335EA42F80B76EBFA64B76C8A8B52C3A20DDECA3869D673F47050EB5AB5AD4D37051552AC5036F5F2967FBB981C88EC4870099E3BEDF7690C0C166027ED0AB2D6F4F0E24B1ECF1FE169F114452DDC43E59C32BEDAB1DABEADBC5C114F4A5A672CE31F04A27AF0BBFB0419649BB07A87D657AC7BA5252A84E2701C57E32BAF7320FD1BAF934B5B1F27D389F98302B35931DCF1C061E150A237A672E131E73C9EFDA4DC33163A3B251E94D0616AFBE6E3CF54AF573BA77EBD359E87225D0FCD343E13E34AE73EE3DBBEF91A1F012415F15D2F710B52D8CB2661B56D0084A5B043295D181CB53F295D23946E106AD7C9B42EB57268D8B094E760585BF6F5AB6457AF10D29998356906863A0334BEF70559A80FEE9AED3E39A3D8E339E8F8A27888E2A90853DB3A13E64A7C6559D4F6BD5FC8E1BBBDFF0C3F18086AF039945E967D20AC288D3A40C2EADBAEA199B0346D426ADA8E33F62A67E26BE5AF2429C5B97FAF25456BC713BCCF40C2B42A863A0AE13F7B2093046DABEF8C428FD9D9E59E3140043187794F9948619F598EB5CFC9F7D5CE550C3BAC88EFB8D45FB28BEF7F6C143F04484A4D22ED1056FB4664AFCC5644DB96941A909A26A4724E697F5273E2A4C365619BE5DA99F27A3AFE9FA9A4347F01D9DAB6A1F07389EA5EE79E81A1D621FCC9180457A29CAFABDF26D36DC2E6EB1ECF027138289E2E9E73364D6598576C0EDF71D7027EC8D93EFCD0EF7B99E59CB4BDD71236E4DB7BB5A6A30884D5B131D95BED362C07D294F9613990FEAFAB4861FC08616EA03F615A15C35D067C3BE34F36C711A25BCFF57CECB4E7CCAC32CF3940149AF2A98D73D52B8D1332F88179C3F9878090ECC9D06FEF9DA071CF1261ED93692F6915351C99C6A4A1EDC81C35D32A6A4CCA736AAB35FCA5885BC199344D985E73EBC83C9252CF5B707A655A15C35D0BECC068DBC21F15C4EAFC9BED771FBDF6AAE733404C2E8A97C6BEABE21B7B90EFB627961FF65D2F7E1868518EC843DFF6B44558FDBB3421FB9CD6B028127134BE3D510E4BD5E49795A4606E04192A3E27A655313010F30A064D4170EDA4D5C62E8F1CF79C76A0D4EB69201D104F71ABDC578AE7D38734C2E5FBB6D2A0E3355DB1997FF0F8107EF8F7F78AD293DAD79687CFF6D49AF06B212C3EADA206A5F5E5D0D6D73CADF8AA1A9C8D30E5B9D28DA424FB3992E06E149E0BFB853C038302D899D1FD01FF633747E7DD708FDBB0E5973D677DC27BCE022202F1D4102F07F69D49C32F3693EFB9FF697E0490CF88F33DADF27DCF8AC7CA3090E17608AB5B53D0B0EC7DC5D3DAB7F3554FA63DD989AF15E76222C99DD15F588BDD9B30AD8A81C126F06DDE080497D64D32B61B92E719BDF796D753402A209EE2D69628E338728D593EE14356A5F0434F0DE2477DDF831F05E433EA7C0FAB7CDF437E4C9FA7E28F38DB436BD13A81B0C29A91FD4A2D48666352DA93B4E2697DF553C4B5F595909EB4FCDF0DA4F8FDA7C94293910413A655313038059CDE810E8933751E01BBDC225EBDE839E3EFBCE7CC4F782F5194FB9E8A70E5562D9EB41FF0FC7EBECF8753F9D1A0318D3E8FD283DAF6A08E9552F1DC286DC21216EFEBDEDCFC3B7A2DFB94D6D419B538B63CD1EDC5A7D3FF6119C99ED853F872CBA6D53030B808ECE0F8B7D208900443CB01473C1E7DFBA6D78C1CBECA64660EDF2625891FFECDFDFC981F7A54898CFEAEFB681BF733A0670BD0B036AB684A5A61698AF38A737F29C3945F09B5D24A334F567EFB49126BD00B5A2DD3AA1818AA0038EDA33DC83462F2DEE136605E91D7B48FCBBDA6FF9D47F19E9EC3ABED2BC55BD8E658F6EBBDF00E3F303B8A1F0B1AD2D81F24E90EC7A248C7D23929EC3C1D4E8799658C0384E5B486E5401CB57D5E79AD4856E5E6C9CAFB87746293951918AA0368FFC1C9B5E1207186A6F71EF21CFF4689F793403ECECAF46CBEE3C678FE91C23EFC78209CAA96B1DFDDA3F5A71881B07A859003AA362C6745CDBEE580E064E52D93D9646506869A006A5BA1209389D17DABA9F733E7BC9EC82AF79A06DAD3B46CDEBACDE6BDA97DE95CC317DFE2233E1DCB4FF8E19E6A93F1E71C202C6A78A7A93D29C2D48EB5E2A8A5FFBF54039FF56AAB23F7B2C9CA0C0C350AD40A70D26D7F8293A91B76CEF6189D56EC3D15484A437C9EFC88EFB665213FFEBB5EFCA4A27BE4F2C33D15C32A2113CF850DD728B740587D5A6968582A762867BF12AA695D78EEEB35ADF9FE7336F05E533E2EF58AFE30D173E2DB8CB018186A18B2C9D4A6EE530BBD267F50EEF50468539404BF94C10FCB1DCE471585D5884C3A17A6F5B76324AC7020AC4C2D0D4BCD15A1820B828D6B9506F8FFA69AF8C5AF4CE103A67E0875F1B15827B8FDB8D0EBF10FFBEA83DAD4DCD3626060904FA6D60786667A3CBCEEBA57F4C7BCEFB40FF97BDF98CB479DEFC13F0644F2D88FA2D0FB4A295289A30C53BB9E0A8BFABE9B4DC2EAD71A08AB2A6C58360489EB587247BEC7AC2DBC37D4052D5ED66D99D7E31FA5784D7CC7BBC69E16030383006932F52442743B9A3E3EE1F2E8FC48FE712012B374A3B6DD1461203F8A429FFB314CB1AFD82AC3C4B41E3B679BB0FA87AA6B589A9A938668D9B94A36B9F3F35E9AC5FB4567F1DE8F1F54918F956145DE8F7D18A9F76D5A734F8B81E12E87A069F985BA0D8DC868991FFD4357FE891FBBD58A3CFE7DD7A11A651408EBFE361A1A962D7B95BDF8E2FE272BBAF39DA667F0DE930FCAC44771AC1256EEFD585686F78477D9CF231818AA19A85D85F48E6FB260F299CED7A602695494AE8AAD23E79571D5AEEDAA1020ADF35D2335CA2910D6C0B6244B4B6B92694F1A362C35ADEBDF1BBCF959739FE77D1FFB88F701F116B7F4BE797B50764E791EE4B2F7A39963743EC135F8F81818EE0E085A55703FEF4163B2DB1E9AF663177EDA85AEEAF2A34678654525DDA9E7BBD822AC41026155915F1592D7FBCBFAF2A153DEE27DA28070407C14A20CF3B6134F38FFE8877BBDC7EF6B5483CF9281A14EC3A4D393560357355D3AE5DB4EC5D32F74E16F1779F207DB8435A8BD5CC3B265A7B22557D605F08FC7BCCCFB3C9A0504532D72CD7BE207D1EEFD1630E75206061721F860B51CEA3B6CE2E1B679332F74E667FED445218E863972CEF978D37FE81CA151762B6155C286550E61BB163FC8B7787C37EF3329AB9AE543DE7B62E641EF71FB426AEE113330D40DB81BDC746D2337355B3DE35CA792594020B7A3CCFCA1934DC28AE8400E3AB44A685AC5FD9F5E6FC08F793A9EF799884422175B61CEC6AF1036E1C31BDEE30FCCF61ABA894D906660B003611E61FB71FE631E3FDAF6D4EC9F3AF1B32F7676512A73AD6332ABA8D3208DFB10086B3012569AFA627ABC625F3AFFE7663D9FB6E861BEC9A3EFF03EE333413E5448A6622BED673A105F1947ED1A4BFC233E63F6B5AFC167CFC07047C1D3CD57DF797846F3D4A7CF77BC3507C8CAA65CB473BE2AAF535E231ECF2EEA688BB022223B521A962D11B5AAEFD634E587CE48E47DC7016928C457147ADF5711EE63278E5A3C3BE9DDF419FBFE02EF87B6B31F5230308810D6C20A9B1A18F5E4576DCFC60019C8A5235F31AC2A452D7DC7F29C53D431DCC63D450CED64D6B078A586A5981B589A6AE0572F18C7379CF02EEF3B36D3223E633F10F7E92D2D992AE73315E7ED9D533B96EF43398EFB3CB2AF7BCD35090686DB139EDE8D8C616377B7D811F36387D258200A417E16B7B4FCAC72EE6707C2E9E39F6D5CA3769D561E62584C5187708DFBB2129696BD4A24B0AF935BF103A6ACE17DC6003980D05BAD7D65187DEC6323BE565A5AF1146997FA3CF27E82F7B01D6C3235C35D07ECD0C1F73D1B347DD6A9B645737FEEC0DF8912FB63FB0136EE2F62586792CDABD8AB50FE4835F24B5E788C0F1AFB1EEFFBC80755223E55948EED3C0E14FA8CDCD797183D6AB0B93030D40E843FE604B432F58ADADF62EF0B3FB52F9B77A9033FEF527B5ED8FE2C6ED5C2E8736A616A695488A776AE8373E952E7E63A40586A36AB0B6B1BF0039F58C5FB8C3E2088AFB8A58FD5C2B4E26BC5B375DED9F415D795F98CDA9FE233EC2D36999AA1CE42F827E1C005F5E7C49C6973793E747C55B9A4B16FEBDC254A7E56D957C6D13AE7687C717FDE8FEDFADBB8D7C8115D2B6A58F92BDAF1ADC6EFE07D4741E71FF5BE457CA87DB31C10C3D4E21D7038BE328EF6BEADEBD4D387E3229F11EF69913603C31D09E1AFCF0D3BBBF59FF2518BAC977E6E57BEE0523BBE2EC88B17DAF5D5B86789B07268CD2A7779273EF891DDBCEFC8F7EB92DCF21DB1AF770DB62706866A83305979C8D206F3E77D177A6DE1FFB5E355E59246B83DB1759DA369BA9A37C84B17DADA24AC51DD488EA45D9D4A6ACD3779E46DDE6FC4FB82F88ED86FD9FA0A5B0C97F6F72BE248E7E9ED7ECBBE324DB5305BE7FCC4BC95792AF3A1E3FBCAD339E2714F6C0D362B0686AA85305939A49FC7A0A70EB538B4E8FFDAF275515EFEB14D2F8DFB47A28E1C1D66D6B0FE99E2CF7718B795F71DBEDF61F173E29C9FCABE5698DA7967F2568FF75EA9EF437F637FE461B823212C673C7C65C3B897CF8716C75D6ECBD75581FBD3F204C73A18FA0810D69F9B75FC2353E278BF87DFABD3E233F84DDF1A6C630C0C55021C0A758C8CABB771F1A5D0F2C597DBF07558CA5E3CDD526B113C81B0C6DC430E6D7F3992F71BB64F105FC59696CA843992BEADF88E8A8DF8653E0FA633C262B8E3D080F3D0CD59F08F96254B7E09E5EBB45C0EBDF2C00B815ACBB10884D5B7837F4ECB516FF07E0F416717C58FDAFA51C7BE8A63E5D657250DB574EC5DA70CD72A8723E5B1EC0FDD57EAF3C016E6E2C07047013B6FF7567D3D7625FCD29AB74A282F3F569E539ED70A53EEDB0B73264F5BE5558FBBF452EB6C1B75818435CCD46C70AEEF907779DF21D0A985AD52F6F1B6CF2BCF99F7FD54E32BD372264F795C3F07E228C26EF90C4C63362C863B0AC20A05ED1EF43C9878A5352FC82FE29616B5B0EA1667F37420FED29F5A2DB251174858234D4D2372FD228100EABE94F80CD8CCA6EC30DC5110BCBB43EFF7389874A5159FF48B285714F28B62EBEC392D71363DB532FEA208573B27EEC71586F4B45317917AAF2607FC06BFC3FB0FDE0BF2AEC656B92F1DABC5B7958652ECC577A63CB6AFF51BBCF7864FBFF56C4507863B0A8286D5AA8F7B5632746AB3B4E4ADFBB6C26C89B3F19D4DA3A59379B5E4932EB73CD77F869FAD05EE70788CBF894FF1EE117FCD3F023A771D16BF88BDC53E7D53D8827F0C7714843FC5B4E8E996B9FA9F2D794DB9E240D8153BF19D49CB5E98A3F1A97389452D163A501FF8D3D768BD778B6CDF816F94FA3F089DFB41D0B634B7D2BEBD787B6D5CA315CF56181D6EEF5A655C7398DF83948D06640000200049444154EF5CF3EA11CFD68367B8A3808435A05937D381B5FF0CE1EBAAACB91272E399F71A39F29719ECC0AD40620DFE1D727CFB6EBAE93F083A7C1D14BF41EF5CE51A6839FD3330DC9E40C2EA1FDC81DBB7EE6A08AF29FFB41166EB9CBDF86AF19C3D672B9E2849E79B27123319395A27485A5388C133C3A3FD53457EE1BBCBFD1FD8C39BE51D8DAD725F29B6E2D169399A8633E9578CE7F7C09ECBD5D6AA1818AA09D889FB360C35EEDD70B5055F1725E597E697A2D60439FBC764E1EF3F20E12071C680CE393EBDD6DEF00F870E5F47C42F7CCFC5AA6E4C0C0CD50D81B0829A1BF76CFAB539BFE92AC8AF2AA2152E9DBBAA124F6B5FEBDC553BF11C2D8FBC5CE58BBF0C1E5789FAC1CFFEA1205144674C736F35F9ACFFFD6F95FB0FFC1BEF3F103ABE6C4B8BA361CEC6B715662F7E85F34555D38418186A0E4858BDFD1B1B766FFEB5196F95E64E88567C6578333BE1F6E2391A66BD8755DF3549D51B4865BF840993C2B19E40E61BBC5B66F9745F7E3D6000747A4A0244F1A7B6FE2A616AF10214A28CA7769D5A1AF6CA214F73F7B94AB71E06861A0676C65EBE0DF4BBD2AE36E3B7FCEA805C7332DCD9385524EB2E3439D265B0BB7F15D615FA2C3507018D4DB7DEBDD9E8D3FE7D33CA02EEDFCD07DC0F44206EFD2DC752D86E4B98BF782C8F678D5F316CB72C1D651ACAF4B5AE955F63093B538575C3C0502340C2EAE91DA4DFB9E54A537EDB35905FC52D2DB6C27EB513CFD5349C49EB5779D8C60B4D0A229EF26E5A4DF5851386D1013556EFD1789F77974557FDFB0319DC61E2DFFFED53D5503F0C0CD50A612EA197BF6EC7D62B4DCA33AE35E1EF74D9F043705EF8135E21C4F1AF82AE40F82107C870906453A3887CBFFBD24A03FA0111F47B9B97B6F47E80E2B8E23E6E778B623E275D233FAF4CD356FAD2F5BBC5F4ACE9831CAFC6FA6160A81660A70EF3F0D165A45F0E2EDFF1AF26FC0EE8F4C25612E5B1325CB9AD4CD8354AFEA5D87720CF55058DF6B4EE690A26D54B563470B583AE20B374A680DD5EED9FBFE4DF77171FD0F76D99F82B8E1D3DA716476D5F2D0DAD73FE16D995574375C4C050651008CBCD53979EFE7F8DCB77FE2B98BF1365FBE5C6D7E7BE1D34576F108CE335EDBD2DFC5416241224810BEA9DEBD763FD4DFF3EBB78B3BCCD5BF781CC84637958C5637BE1D6F30136D20A90ED4BE7A4B0B7726BB89E18182A0DECDC5D3937B275FBA54665BBAE07F3CE4B631B618D6D84355688AD6B35CEFDAB71F99AE30D0EF61EED8E5FF06A7BA914CC1F57339DA63378EEF06C3DB3C8FFBE9DE501BD812C6E43F1EFFDD6A15AAE2F060697D0D9602469193F372AFB1B10C19D226FFCDCE8CAEC4DFE73884ED06E6E9749BCF802A847248753BF2E397EDD56DD08B8EF2D3EF03E200A712B498028D2B90045B8F2582D5EA0CA39B5F801B27C316CA7ADB5C118186E5B74D4E948EA1B3F352C7BE7DF8DF877AE83FC5B21D7155BB5738E865D77325DC5B93DFF6A54BEEA8B7A7B3AF4358511B363E7ED08C9E17432D171691ECD1F3B1B70EF1BE501BD80B014A216E6AA38935640AF9D59B55D490C0CAEA023C8C61D3F36287D1708C1756958EDD7EEB8D0A0686AA24F34316B31B7FB4A0392C329CE305E60F06A95E5DB69E9F5807B77F22881F7BE254880652B8559CFCBE359C3CC628EAB3C47C7B1EE5BE35AC3DE3C50CBF5C3C0E012D0EEB2FE8D1FEA97BE57DC90BF1DE5DD7F352C4DFA24706BE3D686B6E4F6D5AAB420FCE791080EA7FAF5EE8D479F0EE8BEAD4C228F408AA8D4C394E7B5C21C49CB1A16D0F3CD7DB55C2F0C0C2E014920E58D73F56EBD5FDC80BFDD64C7F9FA6726CEF71A4D48AD7C01AC2AC81D4EDD1BEFF769B7F02A900610071049CF9D962DBD4F8729CFA98539133FA0C78EDDB55C270C0C2E016D2D6B33BE0DBA95F95B03FE7691FDD7EADF4CC8F45FEDE5AB0B21662DA52E003F0EA007FE4890D56EF5238EFB774B2D0DEC0144D2E34DDEBC55EE2BC3D4CEA95D672B3E1065F71D3B6BB92E18185C0212D6EA8C3381373F2CAECFDF0EB2A330286FD8931E11C4AC95DCA95A9516F07E2487D3D93A2E60B777ABD84B40207C60F7376512A038D63AAFDCDABB16CF05DCB323A396EB8181C125E06275C9DBBF0E2C39F85B3DBE36E5C0D57AC5AFEDF65D64E0042DE4767155A82EE0FDE12AA8E8709A680AB82FD7BFF3EB3703EF0152A90109087B636B2DDF3F03834B0801494A2F0828C9BE11C467FF06A2B515A49EF679DCDEA8678D7B8392DFA87337E4697E0C92712A207BC02326FCA286DA475DD3AA6C011D4EF14BADE070EAD57CC685C06E19E54161A0713920B6E205D98AD72D23B5B66F9C81C115841024ACAFFC6FE40089D4B464FE1278E5A52DDE313ABDA06DD475AD4A0B328753CEA7CB21FFF6492541DD8068AA4980B0526AF79619185C03AEF194B82DCFAFF8D07F82F84337027961AB2637D4C230BE740DBD0D54A4254FF793DF02CBB77DE9B7B75B7F233A80D6F6B49ADB0594C3A969AB6770D4B9C02EDBCA83BABEC10782D05BB5305BE78214E702BB66ACAEED9B656070054858095BBFF02D3E0CA452139279C9FF42CC2ACF29E4CE7000AD69C81C4E8D9EADB3FCDAC4170775C9E083BA00D1885B5A946181549856FCC02EDB936AF93E19185C021AB8976E39E27BFD4849007FE43F20254E885A7C8D340EFF16509A76C4373DA4BD019D55EF3407D09A86E4703A8110C3468F06A34E0776DC5C16D83943464CC2560C0BECFC86EA39FA9AA0CE52D8F6845ABE3F06069780EB47C5A77DEA732D1748A5BA24F3825FE1938BDCC7903BDB01B4A6413B9CCE35B805EFF76DB9E0AA40409594C04EE971B57C6F0C0C2E01092B2E35C7FBDAD1DFFD795529D108D78A476D8F14FBDDDC70D07B6D60431DBA4FD41507D09A86CCE1D43D30E27840FBF5A5819D9078B68B92A1D86EE783A830F37E86F57CC77447FE84CDC070DB01BFCE2DDA74D0EB6ADEEF7E7C9549891FFFC1F7BEF913669BD0CFA82E3A80D634248753FC48315B6F0CDCE3D3ECB9CB811D917C809C9C10E19A0EDBE6D7F2FD3030B80424AC851B3FF4BA92FFBB2F6F163FDEBA6F2B4C4DFCF8DCEBBEC5ABDFF58C33B9DF150EA0350DC9E17428418753BFDE4703DAACBE15D401C8A8433A6FDED2FBCAADB4BF756E2DDF0703834BC005F016AC3FE079E5C44D5FFE04908E6CAB0C539EFFDD2AC741DEFF87774EE478EE6E7400AD69480EA7D37506AF1DDEC1D32F04B5DFC6D76BBF5D21E9AA6110774E6DDF0003832B40C29ABF6E9FC7E50220A0829B3EBC794B8B0F6FEFDCD15F7DAE2EDBEE114BC85DED005AD3901C4E0781C4735E5D0E05B44A2C1108A99D55CCA465157378DAE85A2E3B03834BC0063FEFF5773C2E9DFAAF0FAF2A3735C2CDE7CAF71578EDEF71BF813980D61E2487D3687438F56A10752EA86D5A793D89B01412D476EB65DF66F37D6BBBD00C0CAE00096BEE9ADDEE974EDFF4E69D91A357BC2FBEBCD66D1A610EA0B703B0FE0341FA832C34BAB73EE8DF627171505B1826820449D2664B09840FABE5B23230B80C6CE4B1AB76BA5D3CF35F6FDE1139FDBB57D99EA31E19AD3BE89903E8ED07CAE154BFDA2360E811BF660B8AFC5B2C3DEFD76CE15E8FC0E1685F644376863B16E8C839EBA524D3D9C25B5EBC20FF15B72AFB5F5CF22C8C596C1A479803E8ED0CC9E1145F2868DFC22F8ABD08B32F32D401A08634BA4337FDC16F6E78969F0562AA289EFC99FF78DEDC99E39E52BF117300BD8380C485046522ECE5C25047800D19DFC44B9F9ACF9DF9F677CFF2737F78F21601B2FAFC478FE353628CF896660EA00C0C0CB50ED4B270C8B030FC217DE6F64CB7739F14BA5FFEF8B47B41CA5BA6859E5ECC01948181E1F68264AC1D40CC73D6704D75FCA30E7300656060B86D21D93C70CB888A81818181818181818181818181818181818181818181818181818181818181818181818181818181818181A12621FC61F7937924E29FAF93D9FFD94466966D15E6D331D45DE033472F7E77516E87F9915806A93C77F3AA0A78DFEE94D8AB07E12F42FA8819EDB9C59F46738979A3B9D73EA9D36BB305720632E1D71472E9AF74C28B52787DDD5DDB60EA3AF0B906EBBA464471C90525663959CCAD2CC8E2567CD5B116CA8344156C98B4743A9770B4402C0FCA252E2EE76E6B8378BF4DF50F4C9D4D3D9B1278369136E3873F1103CFEE06C4E5B95520C927CFC071600D96BBC6808DA5E7F401642F12158F64B5DD2C7F6E13163B63A87BC046DE4BD7A47D8629F9142FC82AF3161AFA352EE978A31A2E4B2B7D9FF1F1DCCA13655239CCDB93C5C6D8B7EF36C2C2FE3840D771E05EAA1E78A81BADA59C71F1C828EEC57D97549E65420D96BBC680373CE5CB4532ED4A928327D84FBCEB229004FAEB1AB7D9C7991BB628A744A9D1868EEB8A45199FDB75D1AC1D88E5316F8B8D73DEB81B092B42D7AEDF41E15948F591745C8BB0424012B9F8C3B7ACF12DCF745FCD15BB66808DA163787B9206DA9459B302A22A474DCBBC5F5EB695D4C61081A17A61212CE16DAC1041CB4ACCAF89BFFE08ED4FD7E6BE3418F2945728CB5D4E58B2676287B08C4F6FBD56E139AEF86A61CD15BB66808D72CCFBCF924249ABFA650DB975652D29958685109656DB8564A87258090BDEC482AC12B7A270C905336BA01CD8FEC619A7A59C35895A9E492E773561D1F56183B07084345917DC2E937BE5A312A91EB9655F1C318C7FCDBF06CB5D230869598F24DEDC4CCA7891A0FEFE02B9F8410CB982FBA2965552BA45F8751543DD814CC34223ADF8162FA7B4AC422EFEB3EA240BC17645EAB748E212BF34DBAED0589CF865B9A53C773B6159EBC1166161FD340799444CEE71FA7B47ADD60F7C7C0A3179D4B93E8B9F8D23374E2679B4DD6ACE83246D441839FA57BA6C88B8A0B60BCB50A5906958C29B1C3A069043B12999EA242B0BAAF39F7DF8D97DA861FCABF9662DC29CA77176FA75CE7A7C771316552F36080B21FD19289898FF06E449EAA04B48232F1399FFCFD749092FDAAC40932AD4EB849F4FA6172E83F0ED1622BBF87B2AFB3B4C1D82D5E8BECA6CA84592D2F79B748A5B7EACDCB4CA62ECCD3144AFAAAE32041377EF855CFCE19B52FE30A429368C987B8EB3E67F77139645DBB569C3BA2B8095D277FE43248BD6AEAEAF27B38899A1E73E37989C96342CDC966F039593A1AE404E58E257397DEFB1598647975DE2A46162F2C9726EE589AED590BFF0E9DE10392BC7424E2086E1CF6702611572C96C48281F1232C20AD411320BB4A8ABBCD5E7EA6AFA5441AD444D2AC2D34476FF9A6236BE8B9A565ED18A2A5533056F5E778EF8EF799A74FF6E3999F4CB1A12F3AF75646EF106321B64F84F2B853FD4543A8F0E8D49E027F348CF8BC96418DCD3A01F5690AAF63312F231E889FF8EE924ECDB0432E1F21A3207EFE5DFEBC96C78118C84BC5BB569E852FD0969477424DE63BA13EFF851C4FDD462D574B0A17BC7449090E37164D8CFABC8AC6B625DDED84886C3B681224DEB5742D177471F3163A32EB86D0E9094250C4823DD8532DB433DA2D3CFE15ECEBC4E7DD1BA4EBCFC6390B0AAE12B21EDD5EF496ADE935E2B7FB5D90515BF123A46587A4A2A5B5669C6812755DE5AFBAF01661A36AE27D9F917E5245AB289245271D08817B7761229A2BE1622A9F5AD82FCF1C603178D20E1DF2792F45B69E4325D0E8940C53CCB21CF3C18AA4EFA7C815395857934D83A854C0012CC2CDB4A6E58344979BA138E3897AEEABDAC1847228A924886F25E680D55B0056E2317FEB795ACFECF26E10F3C8E02BFF48403F15DC4728B2279C709533280CC3A9E8823F1BF6D2005E5E9A44C56066BFE670B5EB3A4491196F88510C43069E95C085F6F7C2AED9A14068475934BFAAA2A095E7054D6F71ABD974BB6E6CD2DCC4A81F06986112F14525F2D2B4358988F3F10605FEEA50309DCD2CF73B815F917B8E4829B906F99B05D79A20888E00084C7C2D034A4CAEED09ABFAFFE8129DDB917F72DE2961C3908F914712BA5FC4FDE82FDCB90FF61743F80F321D47566C2A2BEDEDA212C249550EEB54FD2B8842F7671895FEE84B4A39D28AB792A906FFD60E3CCD4282E2E6707B7FCD869A89FEB6259CB20BDEB709C0F6D21894B38DAD9A51A7111F8ABAAA84F5F0432B20E076F41830FA1E260058C6E114432A1139653F1F656225F61BEE2C45E64D0B9E5240B3A6F998AA3AAA640473C0C650976E4FE42EA91BEDF2C1186BBE50AA2524BF708A4DBCA857B099CD28F4482B696539E2EAB23DB622E471910E68EDF531DBA9F109078D0D02CA40B75B71BC2DC410B6E7BF079920CE52FD6C8C72265DB64CF8E1A128A9FC1616B7C7E7714844FD7750ACFA3A678A054A5FB306AF1538C313B2F09E98BA408C482FE7E026151E1AE10166A2E8D0C6317464307C6FB2897DDCB2A8558CF61A73C009DBD7B25EF0F09A79E7EC0E3C380840F429AA515F2A6F64DD6B05220841DDC0B7BB12D5A868496F8B6090B158C586EC96725D66B0A1C7147C2BAF524F55BB437CEDE9E04247559F1DC79E9A5A2A8AB72B8AF3DDCF2BC6A9F1181056CDBBD05498137BDD0C950A3F9EF66A103E815F1F00FC8C9EF3E035A83B5F197C275212EE48B0FB1F9826164DECDCD15B41DB936200A968BA7F6C5F0F3A015D9EAE4BE3EEE64E8D90472C65E0756C8D5FF393ED91B3B44E81B4F92A43FD2C84D5E51765E45B352DE17B5BD06F98EB6931F36E0E40B2BC94DA99E7EDB480EC0F03202883FBF42BE2A750A845A0A43E1E1549A2A7E5830EC587A04FFC1D81B241DB482126A8AC715689C55E1486A76140DED858EA2D6692789793B8899C8280DCBE921A1F042D4B5EC1ECEBDF85E0E762AB376728AA7D2ABE0246B0DB3D8CD90B8D683C6E3CAFDBA13CEBD3368295BB9A413A596F4A5293336CA41D9ED6E18A296AFD7B5EF974DC7B74358A8B1AF0582BE65B98F9576094B98BFA97FF0C999A07D5E72A4AEB88A75750934AEEAB0715A8063D1E16FCD20A7F8740B2194FF942C345225B00145DFDF961C8637BA9940B60B8D7FB5937962430A99FD0089870E7E4B4A4712181EDDF8E87992FDCC209212D69CC4350B244B7B8490B49903C9A1F79F25979058A5AF986227CFBDB15175EC8F44D21788245B467ADB0567D82BBB9F2287178F2259CBC792BC8FE792CB407CE57439207E31683DF62ADF5DAF23DDA1BCFBA47997741A3024BB71783EC95B3389EC81F26F856177DAE37DC8EE578693C37B6793F3508E9B7FC9EF451A9EC63C79BF669E16C292AE3BB3841C3FB39414D2E48702F55B0A9AF2E9B468B2FFD907C9D6A8DE2465DAFD6461D47D0219D375A6F0C392BCA9BFC24E81B6AEB9FAFE8F9EB63454A171164C71E6A16B4074147DFD2CD509CAB9973351AB41CD5FD4B09CB6610993B9F5BD1E81CE77E4AAEC9EACF756061ACF55E3B33BCEC390F79CF199ED1761A8580CC3B4F20A71CDE52A80A19A3336545FE2D7609071DEBBF91CD5D92D69AE3C51CE2DFAF81A689645C65990FF6C6BFE963CAD79F3C6D85DD764E5B14F582966C212E3DB262C6C0BAD80AC9642FEB72CF54D1113F7CAC12BC6199B4E191E5D966798B4A4C0F8E4FA0B10566221566B5C18D67EE5C848C125346DE043E2E00D6DF164878E7BB481AF2A016023C08694FAE522187258DFD8D7A163F83A91A7E06F839DF6BF38BC14D329DB4A4A3F5F407676684CC289B953A27A89CE6E78F3A8DDE1C4EBF8888EE4C8B514CAF3DE4C9AD355F209F675270B80006FD13630C863ABAF87607BC3717718086A1A0BEF0D21078E2C2057CA45D228DE40F6FD63A9CDFB127E610F1A67A6A4C1484401D75E499F4A9283BC843F44633E21C4ACA68788C7788FD34C46B276FA0072F4FC0AABCB8834050A484BED9E0851D1B06028594A6B5530242C0112DE099AF368F11E5B89F9635DE28C7DE5F3A5342CEAED6EEE1448FC834053D80D1DA0949ACF768A5B7CB832F63EB3A368BDE682A3A865DEE28AFC43C4CD4BB0C5118B8665D1481C212CC17152DF73E47C18D29470C9CA8EF7D139C3232FAD2741CD26433CBCBF48718B5FBD638977E0467DBF49B9C6D8B729FF2FCBF5E71D242D5FB887A1C617F69EE1A48F18521A09478B8D53D6ECD285844DB7997FCC9BD7E0A56099CF292F877384E58086D580043699CD2DCBBD2933ECE3CB63FE7B79FADE636308D10D22666D1B05DBF514A2D3AFD6870D3DCAC5FDFD96B58CC210F180F185771CA826E7800D317CC53872981EAA0019D87257400299FD443F729C1E5A41279FE364BED86963C29A917478FB6767C5925D7323855FC063FA5A64890481768DF9405A475123A2CA5D54B2A982C6D06B6C0FB3E623C93FD7925DA011F9537948E9626746E29AF75017B23426824C321A88ADA538F0FACEAF8E24E9E58A21DEB709645FD7A602B14BF9283B98F4D5C55FBC9F299E2692B17D1AB9A01836966AAC4126272C45FEBFAC25C71FEB2D748206C4F12F5F151D47E5C30EE1A38B61F8F3E76586DF9505110EA4AD05B3A3E8B857F32DE9A1BCF6C948F1BC55C392EC26F6090BCF35D2B5E8320786353738697A115EBB3CEFBA6162FC42623062DBC37686DA9DF465CE241E63383E9371D04193F5F78ECAE3167F5A4AE56FD6B4961FB3353CC4FB1A609C9672445657282FEECBD4B5E88A7E8D9233A756FE634012741D071CE2E6BD7BC3F23CE872384C58A29DC93661E18B6C96AE5D9F2CE3736F5D0652BDC92D3E74DE306E11F6EB10F159486D59FAC2892F73A11FC34BE7201797738B6A3B68D3AA8A0F72323430EA49ECC564ABB6046FF50BF1A389AD85BE047F19CE4076FE440D49D096F4EFF54E2DF826184289F9863B8BFB8E38A2621EA831ACDDF124B9440DA3D0F04CAF0F84690D8361652E4D0270AFFD35D29588AB8128B6EA40186EB46F4CE6C150F4264D16DF2C21ABA16EEA11C73FF70AC67A627ECBA6248C25E714B6AD42D09E9465A9A06149F570790DC96CD74820176717DFA3566BA00CACD64E819D69240C710E40C72FA7E264119F2027B3B22018B490855CFC6737A9E926854012523B901116E798A7BB2FD11BC680665324BB8F65B967F57DC6F517D37468F13B1034076067CCE45E7ABF441A9A89F32AD71A46CCD5BAB6236824691087AEA77218FA258046826DCBDEB3311BBECDA413458CA6AD86B1AF1499B52D87A6E610421196C5386E9BB0B0CE43887914835F13478A69D8B3DB09434990F9BAAE11F956A3BC50C63D76AE750AC2A7E459E1A2ED45346843079CEFC0B5C8C60B168F226769DB0B10C648BB5756842B7E22D89826750C26D9A081D0F69F542A0E3E80D1D3EE27B996F368D3D952256E18F81087BDFF2C3925D51B6EAFAC25191E9C50365780D78583A4EE7ECA4CC4948D304611B7820D0BE5662A3915D949205B577DBBA8D51A644342E93C36E024C3638997E406E913ED5DC84F74147D2A8736E6724B8FCCA6E25887848ED9B084366D18F2F47E99FD25F1CBF3FAFBA3DA13E7495CF83004329D04046772AF66DFA2CA81F71DA6724D203170D3B99733652B25C07132686CCE1AED858F060487E3403E5057E71C5CAD01E1EC9050CA0FFB0DD6BB23AB9A4AC06B7098B8D518F35631D5364AA0EE9D3115D90456C4B4E371663F21DEFCE5E8C6272FCA9C09B5803733AC9E37D9070457C65B358CC3F31FAAAAE2D9045624BEFD3616BC468AA9FCCF4EE96789839538B44F6B7250BA3FF1EBD8DA4695AB42C1EE025A4C22905F9944D6303C2D7AF6C14A4F08C7928DF1F520FB4053BA457D04514E83B26A58D457C61371640071DD914F3135E7A49A6157707FD135EB74081D492DF1924FA66AA4690B50573AC151D492D7CA82AB864797D14F47AE61D9F7746F4038B7182EEEEF37ACC6EA825BC6E91BFA93CAD54B08C85C5DBB7E4715F77DC0F8D4663AAED99FACFFA3FB2CF784B2FCD85112D4CCD5171902AF9DA06BDBE7B0CC10EFB08675CA91216165816D3F46DF7FD2698B37BE39CF2A59F053505B1FEC48B696539FBBE10D9D4A1CB7778482246C9F462E527614341457D667C551E01072FE86C744DF31D197E9561A9196CFC032F6D4EB48FAFFAD168DEEE63296FD6F2B99346380CBF90A13C45F7F94E4D1EE0A4030CE38E569419A65BF70C130EBF23EA2F64ABB2054B06181A679A6814FA5D6605759C0AF42A7101C8C41361A9FDE769D5A14AE845BF19533648DE5EC0E43BF3D26DAA09C7054B948A0DC86657B488869F6064DEA806CE1C125475248E5D7A617CA4BD08176CA9A2BE68F0EA29F56D289102A9ED99F6CCE1B97A8216CB9F1F9B7D5BEB83B9B3FFA61655B17547482B0A4F8D54B588282407CEB1F1048DDBAF0E3D2AA485CF894FC418C79482775F6EF961367BC55856159D7A6C2B0AC9C7AD3EFA88A023A98FFE4E903E47E4750169A3071E83AFF8521A20FD676D917B8DDBF6D209D1F68EFF49B17ED4D734E2D26D7A4A118A47565DE108B6DA4B22268AFFE9E64DF7F379BDD2CC4FBA3A7C3C8084BBCEFCA38F012A2E1E9AED229F0FE67EABB46E459D666326B3ECEACDE21B8C7189F7DF312E53D7FCB18F36673453C6A4868D7D3DD4C164FA55DA0D22C35CEDAA24CD355E08B305AD7B2FB1199377EF249DA84D28A7807AEE612F3CB2CC322FCE259F9E92B8AB9849ACF8686CCE86EAA7E0D4B1AF5A4710BB36E5A9606AAA2154E5BB5AA4F92401BB1AC79F5471AC922CE552CC645824BC99967EDBCD0B16EFD6F8BCBF3F22C7396DC8CC41B8677F5DE7F96B43DF60AE90A43BFAE5FBD4ADAEE7E8A3468598F98407342D21DDEBF0DC9A6ED387FCA351164FDFE3A4252219DCBB47F924404103F1FEE3DF6CA5AD2D48373A88CA1EE1C592DD59DE8D39573F575B2F6B78D24BDB252BC81647C9B40F6EF9F43CE5E5F474AA9B2E65165A860C3FAD3ECE95E1968F86155E814C22479A2D36770F3F7975006D64B5CC231473E9A981D455BF744A3B475E860761455B63FC557429B36ACE6446F5CCAC57F66F53B4A387AD81095D0D618B333ACD2F2545A77FD7D63A275CD3B1F105C3B565934BE2CBA5EF4F73C94292D496C7661F8A22A163D74763D2C84B37E588E40EB252B015F0E09F092B86A71BD483E5950C93CCD9F923747937CCA46829DCE95B126BE75A68F14D7CAB218DFD349BC1369085A0568148D3E8C25637E5E4552FFB389E4C3B0ED9ACC1193DA1748712BB90843BD33D97385F974160D0B3AAE7268866FDE61463D49DD38999C179C4EB7574C57D4BA0E02110D7FE3494DE2168699DD5B90DD34F9812664357EAB906285732A61967B55BF5FBC2F5A83AA4058E5554A58D4971EF54E21ACDEA11FF8F819AB33A4F0E52CCA817CCC8EA253158EA20B3E50332528342CCD21A1F9ED5EBF4586EC2BD56B9F9C334FC3B196917202958559459A6E62B5E3A9C5B31247418E5806EC57A30D0FCD394EAD6C816570668EA8162A49580E7BBAD3306BFBF55B3430CE4C8DE45ECE9CC72DFE7423B72C772FBC08B2B9E57987E0259303DBFDDCF263E940CC09C617DE99A7BFEF917478B6007E7C7B000020004944415497A97ABE54A93B07047B9AC8826B29A2C116043AF19931DD5D5ADBCA6C37D0896B6551D35A543EC5ABC13DC88BB4FD743E4980F8B21F5E5069A986A99D173BF66C451E58F1485A68785DD03794ECCF7C8E5C14865B1A6900E19E2ADD42D4AC5C78BFE10F77B52EC1A32C13AF52365E715EEBBE945B4ACA2EAF11BE204A9019DD451B57D51196BA1F160D61F50E62F2DC833E4A94B3E071C3C3B1F6F26845829A898EA22239E0B0C9D34FED25A1706BD0F4C332FF55A6C3FD9916C2929C5F558E954B2F73F4FD2AE2CBAFB5865924312F962AEB14C384D7CE51E9941A272755C59A711516F073706A8E99B0A4B23B465858DE0686B1AF8CE1167DBC1FF2B8A1AC1BBAEE4C7479AC763BBAAE8A8DB3B7B93C24C61BEFBFF0617290D602FE6D5EF3CA55086FDBD8C1E4B4EC53FC3632CDC6357803F58675256340B33BAB1CAA554680B0B41C58F141A0CA8A8E8E31C1FE24EDB59124FFE46BE41A5C53AE4C47D4B8E2BF5922D3B6B0FE2247DD43721C2DCF5F4E969FAE0BDC076DF3F28938325D27371C57B38625AAF3B6BF44851074241DF56291E58D6FF6F5D1F27343581C45657F73B13A8A2A5161486883B022F5DD22736446E955D63CE453474423FF2A2A2E1547762D756C52A4059AC6217DC474E9EB1F8E3666C310B488FA4B4D31A99AE5575C59C04FFE95D03E61092E14BA36F70D026DF71027CCBB54D48D4448AB34EACAB24FADD9957CF206B7E8A0CBA42DAC797536416630BE011A47F78FE792505724631AE938B82399D6AD1939F8DB06AB5D073ADBE9A224CD87552FAC3989FE35C5BCF696B2C3166F20256796900B9FCC23A7F7CE26793044CB4D9F4A72619BF7B759A4E083187206CE9DCF7B855CC6292D7427C7397876EA002B0FBF68A18110BD8917746E4276C170F1EC35CA66440D6F13978FB55C2B349C016DE584BF2E8AECAEEF4DE655A9F890D886BE24CA8313BC9E351D47AB6B48E880615758BD830434CEC435D7A921DB3E7D9FF15A79E08AA20B704551CACFEBACAE6D1FAD065D6148A861C312BE50E93A85E758CB7E0A97562E344C5C7CA44A65D292C3C6C7571E1096DDF16F447F1945C29A6398185F440D2D6FEABB0FAB52C2B2D443D51ADDB18C0D74EDFB4FE1967C7685F6C3A3EBD3ACD57D55CE2DFBE216B7F4C84D905BB05F0A1A7299C5C628BB56B8A6847B35DB25C2123E494FEC457655D0686CD8565445ED9C4A1890C720957260231C96FB3239435F0B71CB8EBD420E4DEB4FE6BB1985F96FD2BCA59E94E0310ED5504BC2B7F23CD0940ED213B11D202CBA3EB0D3058BE9CEF2F72419EB1F93DBB9444D4BBA0F41430522D9534EDD2F106F12317F3DAB6AD15A87BB7A098B1E2ED9FED181B07A87313AF932F5879D32B8A6954A7CA1EE0C839FCAB6CCFCC7F4E58EA24A5073092DE96B695883744D3A645AA6C220613DBD0DD773EB5EC5826E1D21A4A2C73C9A1D661A863F7F969A8A53CE2DCFAB8A1F3FA82CE057A5841548DC7D2671AF7C7459B65205E6F16AF66578BE59FAFBA3D6EA9A759A4F3C7C66A1632CD1E95066C2FE1CE2E6398F78052C220D5BAFD585DE9B657C72FD55EA19BB4C5858A1933F7B895C50B3A9D8B3AD481A87D25E63C75673E05D7973141AF9C07664BD300C4BB7385D16274F20538879C826AD704ACF5BA2C548ACAB1FF66F1A4076236149F93A41583484F58A88990C131EBD8F1CB72CB5632E63EE9B332CE5EF0A5A6ADACFAB648E9D39E3EF752157D751C171B42A09CB32BCB3FF1617DA94AE45B7C3D2B411515254E2D6237AC31C186E5CB72CC1BCB2E09A61FCABB6DC78158EA39A362C3CEE4538F79DC2B421CB54941369A46A5C4DB4BE8AD1C0974B94FEBE31F9B4ADC7C6EFE49D81DC86E5E45C42AA2C6A8425AC68621831F7A06CCDABC42F6FC0D03D9E188C389715DB1B3A94E34B149F97B728B8EF2F86E3797C812D308C5B444F8B7289B0B092DBDE1B42D697D14BB3687D99521317E2A3B118F2A3BF92084BD9C010EA384D7827E2047B9723467AE53DF56A164076091A56E5088B2E1F3EA0F53014BD4C95B1EC8F2D96190038533F1E86A697A8F3A540BA955DBAD9195835AC6A202CD97A58F6FFCC6276249D93715D5A9140B05BACC8A7FF7F273A8A8EDC63754F106C4089EAC95A205FADC1B65B83B0FE9331666731F5C79D8BDCE2435531247304824331A9DF2213D7F5A26C6E6AE4ED2CA815475D58AD41BA469DB0F0453D877BE9FDEB16CD6D65C12D202B740F7264DE250D24B05970ED79E919BBAA61091357773F65358C2351A43D41B213C792035521CBC792CCB891E4D0B231E6C9BB543EEBA97260239E953D975CB22C0BB38D5CEDDACC69B242C808EB2FE787845AC032CE9C399014D0CB33976DB3AC0F26383D8EBA871CA50DEB38E5A792F93A03B9A77B7518DD1D9BAF86C0B7EB2CFD3D43F3E586EA027A66B0C551945A33E9161CDB73EAACB01E960D4F77EC78B186214F9F9519855716D85B0CB1AA20394EA672F3DF2BA1CA7B0DB495CA4CCB415434BA3B3135C78E1F567BE2536FBDF4FF4921DEB2DC0CE2DAEC001961719520ACE68DFC48FC7FA835AFD0D7899897B1A84AC10A4C3F1E275B2BEB066827D2DB16B59405C75E31FB5889AB43E4BB503108396159D3AB2C6109FE348FF5A15679D82EB87E486E0E822B070C0BD3CF269012C5523035352DA99A09EBA475A95EFB8425D8A60447D2051FDCB45C977CB2885BF68534ACEFA80BBD374D58B04E1AD224E6ED24F6DFDE1461D9FC4A8810B477613589C4BC72AA1C855CC217AEBC105D81305DCC3074F6598E368E2717547639E94AFB6169CC25C47AECAD0BE9B657B6E4F1F263AE4E339313D62AD78684C2E26BC913C811DADEF46B0A99E062A1B420B82A80CC99DA1FB413B95F93F4B6C507BAE8D3F9E42A75FE7C930097F3EBDD2CD06AC3FAABF24342046AA393363C265F5259F1930824DE98C77A536B8289F7722BADCAFFBEA306B91F56B50D091D222C047EB898A77F606AA16CBACECA8271847214A5EC1AB8A2684F07D255CC25D4B46149E5C767946898B0F8A2DC77A820C538B52A466676214CAB225E01FBB8A59F97517E5EB7A01ED556767014C257507DB7C18764BE634EF86169D8B0CCFE6B2DEFC954F8DEB9FAFB3EC590D035A37B039391C4FEBC8ADCA0FE747361F620978661F680051B60D0939D179365AB7C16FDB6C162D89E0B43517AC232AFB1489D2DE0AFC09AC3F073D1B7CBC81585E3686509AB69F34012F76B0A4506E9E4F2DED932C75ABC172C736A56AC8C7C51CEFC77B3D33FB0C0F43C5F1D49827F4A26619756DB5C381051BD844579793B485866FB8D9BE75E6EC99152CBB5C9054789C1685D51544A77C5578ECEAF9369580EACD680F14713EFA0FDC2A27B94573B74D6F9C6692E91963D63BB322E3E9B38D0B2CE59BDE54F9AED692BF2435CC85F58E2467FEFC8782EFED312D94A08CEAC87A5AD61F527FE0DF75856A11009DE8572625A4D75C1EDE28CCFBD758DF2CD738AB0848EF5CC20B29F76217070CD2B5721AC951537D2BA56166FF6C4465B82A0BD0CE96CD6F6283B172E52676F591BAC10EF7E6D48DB9C7964E1B57594C3A9F475B2E290D0BD9E37697466299950B289CC072219F98FA59A1EFD987E60DB466412C4B940BB67DC4C15DC1694C061EE84FA3E645F51927C5D2A28CBF5FF6D2153329FB36B0710561D9D702F19F0DD724153BC2592DE4DB88F7957B4AD62B2216175388E3AB8E6128D109078C3230B8AE84FEFFAF027E61BC62DCAA7A6E1D8721455C219A3BB740F68179BAFEF16996FF9A985D598BC957BED90A3F624E1056B18F94224177F780790EC61E8D41B8178EDAD558E8A400431703B8CCFFFED86AC2E71BEE58AFCBE24A0B123F99BDD6E7CEB87199F5CBF039E43A97C0A9173362C0DA33BE681F38153B90507E81F8CE0EA1B8EAE7126FCD60E9E73A4F18577F671495F955AFDB69CB761096B5E15BC66FECB0D6FD61670ADEFAAF00DD182E0CD1CE049F6FDB6D1BA5E14C891467EE6F5827032F2D185E4BAE25F7D17613815FDF64CCB52AC82EB82B71BF14F1843C2F25E21B1A07964FD6FABD96EC4CBAF55B361E1DF7206FD73AD99D8A8B5DF0B6F6E26E352A305F21496A685F2F80EED4CBA1E789624176F8072516E1CA0FD5DFE20467598870F1B1BEFCC8EC1E4A0B4848DCC10BF8D14C23DC500198584D4B3DC93B0146ECF10D2FCBD3924FA8715C23F122DD74A7943587E49AAE66280D54A5832AF65C7090BEB730C096C92058DBD5CD26E8C4F6F3BC72D3E74935AC3E9ACAE5BA4A30D981A12DA35BA4BC0B4D1969864889C7556F2CEA6E6B6A1A633D318F3965ADDEA85EBF586068691F3C6712FBD8FBFE42A937B6F9FBC00D7DB5B880F5FBE5348FD1659409094A6275C5F2610DF6B9F34075253BB56F8F9ADAE45D78EC6199BF0DF8997651F3368ADB16A8CEED8B6E7E907CF2C943D77ACA7C4BCBEC4B7025548AE45BEFAEE0F7734CE4E9FC7BD969327ACAE6A29DF49FA7E1D262C813DA1235AD71CDF2EFCACC0D135AF5C85A416276C79825CA0D7CAFA9FD9288DC39DE80ED0C9FFB54EFC0820B777DDFC238D9C8272E682E09CBE6B3421297F9705E42B1B925184858D66260C7DF3FFDC465D6BF5602F01322900CDEB28E473CEF24F442A7DD4788EC70993C26DBDD1434066B56D480E142E1387DD4A223597EB32E4771CF2C3FB2AFC731BB54697627B198879C6009BB630B9D13DBD9AFCB0EC770AE5F5F8565E6D5E33CA324FB05C969E6D4751259CB161D14042C129426B85AF862BAD3E62D49C3874BDD8CF2DCB5DC8C5FD3D9A9BBF3F8A7B715F2CF74AD60E2EE18B0B15E60C9AEBE206C471443B94DA458CAE79E71C20EC5295FC4B21BD4390D752209529DC820F26712FBE3713B649707C08CEDDAC90FF9223654E3C1B47FDB0CC1AA1D1B4D328AE1D2FB335621997E52EE0161D8C823A9A0C9AD87CEED58F3320EC349054996A3D251C2DA3EED361C2125629CC8A25E7282DA7EC6C82F035AFBA21185ADB352207FF48ABB056964468B1FD4249CE2F6BCCC3207EBB829494924E6955B00FDAC7B5258F9074D05C32E9EB28C2C24A42C36EC2D30F90029CECAC9CA7C72BD3A5D207A2BC9EFD02FE88C0A1F5B7D1072BCACB8DA46F9D62F69457965BA911F22AFB50C6EB1F3D4F16EA88DD35E1ABDDADC149A3BB04C17D41D7CABC6694F44590FA61C55543548233EBBD2A3CDD9DFACD17B6415C0E3B41DF7D581E0CEB4A95D34C2A6EA909BD54B9050D25FED3D386A1B3F14BB1A3DA21B61B5CE47236685A078C73F7145BBE906A4C7BA13DCC956533C6BE7D1ED74C974F93A9324F777CB94F230D42B2B8451FDFA4BF12CBDA82B2AE569D94D51B0E5B0D23E6E619262EBE280DFF9D1912E232BEC99635AF80AC60D8B29054AF762541FA6213FFD230725A9AEAF2977959181C46490F737A637FB26BCFD3E482F0071CAA736B4D0C06ADECCA47B16463A72682B6D61F867D3B406BB1CC6154DAB088D9B171DEBD2D4966EECBE46AB99D3C708AD0F789247BCE838251DDD1C629D8BF88D9537E01E4B5EFFD67851521CA6CE525C98D8DE4DAA117497A9FD602C13AB2EE77B54ECD7162195EB53484DFC0A103273D9432AF0D65D751540967D77457029F3FDA686611BF06BB0C51CB8BA47F0ECAFC9994B6217A7F59EE55E3B49404E2E1E3CA8F3D303EBECC26108371A361E833A741C32C3551CBD6A8E5492F61C3257E596C9C999A04C3D449BA669DB22C0EA95563C39220D9FEA69380C67B8D4F6FBD2A9F1BA85E57963682C3E6F9FB0FEB7B8E40CF837986B18BCE5BEEC941C212FE2CF37057B236631AC90642D8B164B430F7AEA6FC5188981776C0B97D434906681EFBBF5942D6DE4CB5FC9854987009128E71DA3424E92BC6913C9C3A041DB11888A9E45A0A29F929995C2D788D9CD93F87EC7B6E30893519050292FEAB27FC8E3B7630C97C733AC9CE7B85A4C175CA2F8ED22A0DE8B9BB68603BB267DB14720AED7AA0DDDDC07C2EAF21D7A06C8540323B27F6123E0E3422AE39CE615ED84071EEE19C467E64FDBCA12407D23D7B6629B92AE577652D29FE36811465CF2507178F220BFD3C8432ABFD2B500B48FA7392C6936C78BE8772E6911D90E63817CA4BC3EC93D3A8F50EFC8B0D74AC12E8DC57B9155FA9CD07B505D40E6741E33D0243989B822CCDC5B42E1B63DE7276F54F610D79C34373F28574967D71033AE939277F558F752AB5B35812D42CC330725E0137EFDDEBE82CC9593437AA1326E6DD82E1518161DCAB4B8977501871DEE39B065E875A25F68559C4CB3F1586A9F9C6E7FF76CD4C9ED6950DACCBB41494737139178DD3376CD58574EB2D5EDF9DE88DEB8DF3F65EE3967E8EF579CDCEB3C1975A227AB00B75B73C0FEF37D94E39B1DD633F49D0870DC936CEDA7A09AE2B3351AB35586633987F027BD13863E31E888B6D0FDB24DACCC7E9DAF73FC82DF94C7A5E458EACD620F944E1F0CF995F68553594BFF2521BEA08EBEF10B39730CEBB42968E16659C18866F6D6CECCA8623FD9A284CBC5EEB8F31E62F2E66324172C0871225E6813E2743C534AAAA9EA41521D0A6835A1792E06431BF2831FFDE62D9B1313A4B8EF832C006294DC66DEA421A4A48435B7CB14D21E6BA0F25CE77542C07DE373C47DD3410484B37123484A62EA485F588F71725A4A3D30D25060EE7243A998C252D6C1F5867B84A470CF10E4CD0757E60AB7EC0E4DDFAC13377E9074D4BD5778B9C4FDC7DB03DA086E2EB4299B5207C4D23E6768AED610EF1F45DAAEB38204D7FFF63BBF4113376EB1F7C3243DF776292AE79E768A2D34BF65EE9B9E2BEF9E7A544378EE8F5A1E2CF66B520FE3A4EA8FFC9905E2FC2B9D95358A47E82CF1DEB601671F35CAAEB70FF56FDC0C7CD75F4C0D4347D8F87E3496030F61B2461BACFE8C56BC7599F97B11E88C395E4A8FF4875C3917298BFD0983B231293A7B8EFC88F409DB94F291F4F2A1F477F36EA2CA42F2AEED5909F33FE418E42F00723D672BA4A82743ACEFE324A09E9B753954D47825E4C073B349228127FA8B8452D419A7C5F5DFD86CE3F98CA1F055FCAD20F5E95F94BD739FA6CE8F828CEBC88A53EE2AF28A354478144FB5928DBD0EDC03F0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A089F451B356AE4DDBC7973DF56AD5A79DF73CF3DEECD9A3553FB546B6ADCB8B1100F253434D47BF0E0C1A669D3A649718C0683C17BFCF8F1ADA64F9FDEC8DFDF9FBED6181919697CFAE9A795F99B388EF31E39726428A4D37ED4A851F4275D21CFDEBD7B9B860C19222B8B97979711F2B1F5B9580F6571C772B668D1C2B76DDBB6DEDDBB7757FB5C6CF40448F7141212E2DBAD5B37CF071E78409800DDAF5F3F63FBF61526C30BF7131111212C7AA7D3E9DCA5EB31AF0E1D3A78C27D4865D33768D0C03869D224AD4FC6C2A7E51E3D7A349A32654AD7C99327FBABC5F1F6F616CAD8B2654BBC0FF7B0B0303A3DBD9F9F9F69D8B0616AF521D4619F3E7D4CF04CA43053404080E539629A50C7EE8F3FFEB8E47A21D4F9D0A1B2FFF5EAA19AA43A97DA82AF9486D476FAF7EFEF0ECF51F35EA15D99468C18A1E57F87791A9F7DF6D90AD7C173313EF6D863AAEE034D9B36B5D43BDCA7B20E8CAD5BB736464545E9A96B8C5DBA7431CE9C3953BA5F6CEF96E7D7AE5D3BCF871F7ED8A43C47B7FB071F7C10EB5B480FFA8E327D13B41F53E7CE9D656585FA52BB07E1F9C333159E3F3C03B5E7CF40017D307A3EF9E493C7A74E9D7A0AA400F79F79E699C3D07046C3C3A2E3F582467F8A8A970FF1728084B092BD3D3C3CC2A0B16641A51F9E3163464E4C4C4C3C3416E9DA50887B081E8AF4C004AFE6F0F0F049D070F2A1A31E81877E10D2CA877C67C131C611BC8E21EC2CA4354FBC4EF0BA8707DC17C26CFDBBAD113490E1B367CFBE8E6545813261DA7BE7CC99134AA5D51C482966D6AC5997A578509EDCA79E7A0AF30B81E3B5900FEDA52C38FA4283EF0569EDC1B2F8FAFA46423EC5543E47218F8D62DC6068D863208D456A751F1C1CDC1DEA6C2F5E07A49605757A14D2DD09751548E5D70AC8712194E992F47C20FD4310AF2D750FD190C715B88E5ED940A8AB366DDA44C2B962881F42CC3E3B1D817832E0599EC3F420FFE370FFF8BCC3A53A87E342B8663E9D0E90646F08DB4ACC3E3B5D1F7DF4D1FD4F3CF1C46948E31C3CA36B582ED862B9D4E6C0E2F36E3B76ECD80448E3F0C48913E973C204642081E9780F502EBA53A30F517B6837E9D89E146962BBEB0B65BD28B549C8FF38E42FBD4185E936504EB83466B2F4EC7AF5EA3508EA0FDB1AFA51051A8DC601B06F79FE907F1ED4E36E0817BCD6A3A3A38FC27D9E81FBBB80CF00DB3D3CEF1C08C3EB83E1651B05E92F14F3AC07D7F586321443D818EAFE30DE24AA1D5B9E3FE459E1F983D85B67EDAE057A144F80CA3FEEE6E6164ECCDEDEC3E18D3E0E1AC97EA860E9E1A397EC04082BD0EBF5180767D8A36733361A6C181DE1AD92040D11D785C789ACF43FFAD0816D2834ACDC71E3C6496FB5A65DBB769D0E9DFB38BCD5F0558EDEE411F8B081F00689F1D059702636166844D9F010BB8BD77606AD6092D879D420C4090C0C9C0D0D215B2C2B92CE68780B4F83C6990769B512CBDD1B34CA0428779A184FF26A17081ACA360EE2EEA7D2167E7E01E5DB0965474FF38EA0794C874E7F58BC1EEFBDBD184FF8A103682B31908692B07CE15EFB43F9F2404BC53F12A3573FD6FF98BE7DFBC6202141A7407241E90F616BC78C19B35A8C331A5E049320CD83621E7D41835C0F9DEC22D409BDC202966110680B39901692592BF1BE8642E7D977FFFDF7CF12CBDC4B7CBE36EB1CEA02EB3C5D4CB7BD786D14683871D0A9F711B367BAD664706159E4810307EEC37242BA7DE9BA0019072FAC3350CEB3A2A62721185E0833A17E918C72E13CED018ECF290ACEE58B65190E5AF54878E120F9068B79F685174602D42712563D20083C7F1C34E0CE62395B417B8E06A2C8A39E1FB65DC9A112E3617B9F025AF07A207A6CDF52BBC767D30BB4CA791461B585F462203D2C2FBEB882C5783DA1BEE7528485CFBFAFE2F9633E83E0E5140EC4589DCB4ADDD1C0863A121AE711D01A240F6524B10150A123B191886F6DACF891D04973EBD7AF2F79B54BC3033C1E0084950CF1E3C463DABB163BC1687808471F79E4110CC3F4C2A191E7C2C3EA49A585E1524390AE8BC6B738748A49F0F00F43A7C53861D079A2ED1056572867145CB39B58BDE543408603514E816B7788E1BDEFBBEFBEF9708F8BC4636928204D5D18098DEA007400695CD80834C93140BE79303C1026EC02B94F807CF653D74BC3128110E18D3E57415802C143E74D82869D44ACDED0B8C57C46C37D264319A788E9F5074D742974D63962BD62871A0D1DEF080C3B844E095AD47AD02476C37DE4521A4A3094753AD4DF7920816C8AB02281707740BC70C53D4B753E19EB1C3A37D6F911E8A4784D57D0B6A345C292EE41206F20CFE9102F95D8F63AC77B43C2DA0F5AD646486717F5AC4261C8170FC3A5A3704F47A961934008304CDC01DAD746209964EA058AC0FB198D5A1DB1CE0D1D0DD7EF81FAEE2A966F005C9F04F7331B882F02B5C9D1A3470FA2CA190A243706EA365BE5F949B31FF0FE0700312D8278F388B5DD0BBFDD022C80FC68C2C23A2F8017E1747CD9C19011CBD15B8C275DDF71C0800189F0FC93A9E72F79D53B32A9FEAE854058404447E0419B14E1C3274C9890260E1590B0C6E19B03E2CE8586150B1D60369C9366C677E5386E020E13A0F166834C8178D2DBD04258919191C25B1CC8708CD8D0E8062E2D9C27233A54C1B18C70ED42481797847594B0500BD9458563DAF8C61C89432018320A0D0EDE9C71702F5950DE5808476D489A9C8C6FFE889E3D7BCE82BC368AD7778772A4603C319FCEA0614543B94EE3F5708FA81DCD0491EE458DB0B0410E8221402668AC32430711FFE1D8A449934914A92261C5D384052F97B950E64C318F5E9D3A758A0722D88B9A225C375CBCAE279475EB9021433280B0B228C21A062F8EDD700FEBB1CCF01CE6501A8FACCEE185B200EE45D02A148425D567F7D0D0D06962FDD802DE7304A4B7035E6CD8510F8A43540C0F87721F8217C922A8BF5C8AB07078351CB5702F2FAF413E3E3EA3F1A5052F3A294DBC9F71701FC7812040691C19FDD0430FA5423DE5C2569A3A160E75B01AB44C24AD5CC86712914F9509058289826BE8E787ED9A260DA19D8086B410C26395E14AC24202C4A11DD61F6A64625BE94B1196F4FC0FC0CB905E3F5E22483645C606B4084B78134327D80A0F10DF484858D3A0B114A226056AEB52A8F0E9F080A5C5EBB07363E50FAF57AF5E3474888DF0700EC11B4D5AB643202C78C30ACBD520614107CA56E4D711E267C2750570AE9E781DAAF0B9C43C11752474F07DD0E8E7B848580824D891509623400AC21B183A7F0A74E82338A485863D1FCA20599B2D0407F10F03F160E31E069A49FE88112302A57C408B998BF620BC1EDEE68BA0634481D8222CD42287427DEF878E42FF30432A7B18BC95D12E827FABC16712DEA74F9FF510B708EA220FF2423BCBC1E1C3874BC3DA5E61616173A173EC81EB26405E9950CE7A20C3A1E39C020D709282B0C6C030290B348D5D83060D4A84671503CF5FEA3815EA1CEE651F74FA982A20AC4190EF46242CB41B423951BB680ECF6932DABFB05C1461092F41208904E8F009C4AC1DA3F6B483B229A2063C13EAE202A4BB1FDA23DA1F8FC0105C5A6942202CD0CE52E03ED3A07EF6421D2AFF23801AD16CC85F787E709F715057F4CB9610E7090BB5BE1C7C2ED210B55BB76E9329C2A29FBF64EF135634012D12B5B8A3708FD309832AB4084B68F0D839A1C14A933F27A0BD00342969F2A772E95A69E5031CE68D83078FC64369850281B0A0F1E08309C16348FB3090A1D4B8302D7CCBE370240B1E7823F13A815C88991007F8FBFB8F83EB4EC3DB78B60B8485E16DA183CD827CF788E5450D2B1EF2C4CE831D1A87C3F41B18EF672834E445D021D603F92C8406B59A4A0F35AC2950C683C43AE1546AEC5A8485F71A01692E551861A53AEC0DC48736A959FFDFDEF9BDC4754471FC1A8A592A56D0A2EB0F44D6BAE8B2E441544496A0B26891458A481011097D905224942221945290507C0821843EF8504A297D284542901024482922A5943E8450F2D4873E94D27FA39FEF74CE3A5EEFC68A6FE91CB8ECDEBB7367CE9C73E67BCE9C1966FDFD2CD3D65D2208453A3A05602239C91539C062FA716B6D6D4DF270000320DCE052BF3455ABA5232CC0EA7BC079D9EBC2C037C992395329277380FDC3CB021620FB90E8E776535393DA38C6B955E1E55BFA2620908D1C2367777EBEEE71502F79F61D80B20BE03CC6616A31E74973B33355F567CDE79F1671821B4A5900700602F5080B40DBC19E978868E4109702BE0458AB02BA0CFD853AB908602D22EB032FD76AA150B8A91C1C53C04F3D6039FDE378A5FF3BE41127390000054049444154812C35AE5694A2087262915254CF61E1852C51FC165E798AF0791F45DA4A513D8735383818E67912FF99C318869912CA3035E835709E013C52421DB0304E959531CE8D8E8ECACB1ED2B60D3E955BE2BD438C2E0D58578C8772B97C5F51C60500CB0676A792D55AE964700B48EB392C00CC0E4C0CFB95F832A380F42AFDFB8D01A408205C652C698182761E65BC5F072CEAFF2CF8CDEA5C5224837157021EFBF1C69BCA9161D0761A4185C8F4734DC39393132492A08D09C912DDE8AF306647464636E1F1107E7F22DA50223C0D58735A25A48D4A72B6BF6999BBD40053CE7B5EE697022C22D3878ACCF9BE40FFEE0354E2E3D75C2E27993AC0425E6E45716868681BBE8F91C7C7BA4AA5D2367DBB2B47475FEC4482459F5A900DCDA1DF35BF60612788D47358FAAEFCA3C0097DD97F572A87F59E07982CFD9B0D5C08B0E0E1A9AF67806B9977BF413FCF831C96F4BFAC8899B2555F56BA99259AFE24A82F528ADCEA1F1EE0398ADFE77A8C609F49B880CFD6D5ABF573795C39BCD90B95D185921F69691FEFE5CE93227ABA8DA1FC8C717CA97C01CAB887F20C886A3246A69836309D8132A0B45CAF1595AFF19E5F69799A3A7EE47D3B136B41D331CF834B5672DDC2D00FCE03ACF6F6F60DF8FB53BC3228F605CA5CC74416D3C909404C32D8EF62342F558EB69583DB4B85E402CAF5F9F979F5792F390DD45A257C9F76FEB2F75586F777AC7EA66BDB41FD4E66787D45A1B344188A2835C0F6D1C117F45F007EC894DB92FC6E50E04CE49D3FC8E8ABFBB310A2C44DDAD5D449EF6D00C82FA853534A172122DB276184C5D4638FFBA390279FC7EAF1323F4ACB1CB0799A022C377D0558D6FF23605D476F0FB02D9DA336C18055CEE86F74A3415CB791CECE4EF158C1FE0E009B39CF932ED9CC020E467A55943BA07B6D31484EC0A1869EB46AF740FBF0540F11DD8EAD12725591F932FD3EE299A6FB9AE6AF51C71F81FE248FDD60CFA0736C44487732006B9248368C880480350F585646BADEC289FCE2014BD4EE794135EB3F28872AFD03D0DA26F43B32A99E23CFFF2DC98B4FB7B5B5AD62282BBABABABA6A84D732FC30F1A8A8689A2959BD5C4F4FCF82F23A7CDAE17C73FCBE323E3EBE8927BC1EBCAF77AF11190DF4F6F65A7D7A470368561E6E7878789341B78587AC315D680FDF632A129E7EA93A65EC93954AA5D1D2AFDB9B443D35E5477C9F6E747474582E2E5C052A2AD2D18AA2952384D7942CDCC0E78E6F06BCA7E025BD3FC60D346B47577F7FFF3494CFAABFBBBB7B11001BD6C6CCE4DF01A46D14359EAF23B78F8AC5A2762386871B8AD7426B6B6B0987D0E8DF63068850CA4461E2D9A671D3C8DB569CB425A1E837BABAD3650159F1EA78CAE7F34B442FD70093DC2B643E962173E78C785E2682386FDF90FA5B4407C3F069517815794FA1FB37AD5D22B901F4E6F299E239391DED583AA10448BCEDE557C6E1F4056D08D4CAF0D9C9B4D139466CB244DFEDBC27B53BC6B3825FFDD4FDBBF055D75F5F5F5F95FEF45147D86E8148BA84E308CFB977DB225A5A5ACA333333F65CF595D165F81763FA6D8A726341B92BC969FD6BDBC41672BFC9587C27B9FC218FAF2D59286A0660469E0E8BD3E574D91EACC47FEA3EEFEB48EF58CF25679560754AC93DBECE703B44A3F79A53E5B2C80E350B79CD7AA7D9F37B5EFF1BB569FD0EE5129EB69AAE3FDCB69124274BD9F9E46CFFC3B65F75A85B7A3B864D87EC3E94A1FD9EEE732EF8FD22327F2368FB3C0AFB617C84F7D66E231EAC3DE323FC9EF57BBACDB09DE6A0BC4024D45FD6C9B28D74907E9EC553929C6CF549537840A0C681FD755EA4489122458A142952A4489122458A142952A4489122458A14E975A47F0009D966F1A0A14A510000000049454E44AE426082, N'info@aasermedia.com', N'20')
SET IDENTITY_INSERT [dbo].[TbCompanies] OFF
SET IDENTITY_INSERT [dbo].[TbDeductionDetails] ON 

INSERT [dbo].[TbDeductionDetails] ([DeductionDetailsID], [DeductionID], [EmployeeID], [Notes], [DeductionDetailsDate], [Amount]) VALUES (7, 1, 1, N'', CAST(N'2019-02-16' AS Date), CAST(200.00 AS Decimal(9, 2)))
INSERT [dbo].[TbDeductionDetails] ([DeductionDetailsID], [DeductionID], [EmployeeID], [Notes], [DeductionDetailsDate], [Amount]) VALUES (9, 1, 32, N'', CAST(N'2019-02-16' AS Date), CAST(200.00 AS Decimal(9, 2)))
INSERT [dbo].[TbDeductionDetails] ([DeductionDetailsID], [DeductionID], [EmployeeID], [Notes], [DeductionDetailsDate], [Amount]) VALUES (10, 1, 1, N'', CAST(N'2019-09-19' AS Date), CAST(67.00 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[TbDeductionDetails] OFF
SET IDENTITY_INSERT [dbo].[TbDeductions] ON 

INSERT [dbo].[TbDeductions] ([DeductionID], [DeductionName], [Notes]) VALUES (1, N'minus', N'g')
SET IDENTITY_INSERT [dbo].[TbDeductions] OFF
SET IDENTITY_INSERT [dbo].[TbDepartments] ON 

INSERT [dbo].[TbDepartments] ([DepartmentID], [DepartmentName], [DepartmentPhone], [DepartmentFax], [DepartmentEmail], [DepartmentNotes], [IsDeleted], [BranchID]) VALUES (1, N'Softwaree', N'01011081610', N'23', N'soft@aasermedi.com', N'', 0, 1)
SET IDENTITY_INSERT [dbo].[TbDepartments] OFF
SET IDENTITY_INSERT [dbo].[TbEducations] ON 

INSERT [dbo].[TbEducations] ([EducationID], [EducationName]) VALUES (1, N'Hight lever')
INSERT [dbo].[TbEducations] ([EducationID], [EducationName]) VALUES (2, N'Gratuated')
SET IDENTITY_INSERT [dbo].[TbEducations] OFF
SET IDENTITY_INSERT [dbo].[TbEmployees] ON 

INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (1, N'ali abd elmawla', N'123', 8, 13, CAST(3000.00 AS Decimal(9, 2)), CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-09-10T00:00:00.0000000' AS DateTime2), 1, 0, 1, 2, 2, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (2, N'mohamed ali', N'1234', 12, 28, CAST(400.00 AS Decimal(9, 2)), CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-09-10T00:00:00.0000000' AS DateTime2), 1, 0, 1, 1, 1, 1, 2)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (3, N'ahmed khadr', N'12345', 12, 28, CAST(600.00 AS Decimal(9, 2)), CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-09-10T00:00:00.0000000' AS DateTime2), 1, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (4, N'islaaam bostami elsanhorry', N'123456', 8, 21, CAST(566.00 AS Decimal(9, 2)), CAST(300.00 AS Decimal(9, 2)), CAST(N'2019-09-11T00:00:00.0000000' AS DateTime2), 1, 0, 1, 1, 2, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (5, N'rasha', N'12345', 8, 21, CAST(2522.00 AS Decimal(9, 2)), CAST(400.00 AS Decimal(9, 2)), CAST(N'2019-09-11T00:00:00.0000000' AS DateTime2), 1, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (6, N'new employee', N'123', 8, 21, CAST(5000.00 AS Decimal(9, 2)), CAST(500.00 AS Decimal(9, 2)), CAST(N'2019-09-11T00:00:00.0000000' AS DateTime2), 0, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (7, N'new Employee', N'123', 8, 21, CAST(500.00 AS Decimal(9, 2)), CAST(500.00 AS Decimal(9, 2)), CAST(N'2019-09-11T00:00:00.0000000' AS DateTime2), 0, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (8, N'new test', N'123', 8, 21, CAST(600.00 AS Decimal(9, 2)), CAST(500.00 AS Decimal(9, 2)), CAST(N'2019-09-11T00:00:00.0000000' AS DateTime2), 0, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (9, N'nkdfjn', N'555', 2, 21, CAST(6000.00 AS Decimal(9, 2)), CAST(3000.00 AS Decimal(9, 2)), CAST(N'2019-09-11T00:00:00.0000000' AS DateTime2), 1, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (10, N'aliiiii', N'55', 20, 20, CAST(250.00 AS Decimal(9, 2)), CAST(300.00 AS Decimal(9, 2)), CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2), 0, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (11, N'yousef', N'2020', 8, 21, CAST(2300.00 AS Decimal(9, 2)), CAST(2500.00 AS Decimal(9, 2)), CAST(N'2019-09-11T00:00:00.0000000' AS DateTime2), 0, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (12, N'soliman', N'2300', 23, 23, CAST(3000.00 AS Decimal(9, 2)), CAST(5000.00 AS Decimal(9, 2)), CAST(N'2019-09-11T00:00:00.0000000' AS DateTime2), 0, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (17, N'Mooo Ali', N'123', 8, 21, CAST(5000.00 AS Decimal(9, 2)), CAST(1000.00 AS Decimal(9, 2)), CAST(N'2019-09-11T00:00:00.0000000' AS DateTime2), 0, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (18, N'mohamed', N'123', 10, 10, CAST(30.00 AS Decimal(9, 2)), CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-09-16T00:00:00.0000000' AS DateTime2), 0, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (19, N'salah', N'123', 10, 10, CAST(20.00 AS Decimal(9, 2)), CAST(1500.00 AS Decimal(9, 2)), CAST(N'2019-09-16T00:00:00.0000000' AS DateTime2), 0, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (20, N'shady', N'123', 8, 21, CAST(500.00 AS Decimal(9, 2)), CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-09-16T00:00:00.0000000' AS DateTime2), 0, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (21, N'yes', N'12', 8, 8, CAST(700.00 AS Decimal(9, 2)), CAST(700.00 AS Decimal(9, 2)), CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2), 0, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (29, N'nooo', N'12', 0, 0, CAST(111.00 AS Decimal(9, 2)), CAST(111.00 AS Decimal(9, 2)), CAST(N'2019-02-02T00:00:00.0000000' AS DateTime2), 0, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (30, N'samy', N'12', 0, 0, CAST(111.00 AS Decimal(9, 2)), CAST(600.00 AS Decimal(9, 2)), CAST(N'2019-02-02T00:00:00.0000000' AS DateTime2), 0, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (31, N'heba', N'12', 0, 0, CAST(111.00 AS Decimal(9, 2)), CAST(800.00 AS Decimal(9, 2)), CAST(N'2019-02-02T00:00:00.0000000' AS DateTime2), 1, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[TbEmployees] ([EmployeeID], [EmployeeName], [Password], [BasicHoliday], [ExtraHoliday], [EmployeVariableSalary], [EmployeBasicSalary], [HireDate], [IsActive], [IsTerminated], [PositionId], [JobTilteId], [EducationId], [DepartmentID], [InsuranceID]) VALUES (32, N'gogo', N'12', 0, 0, CAST(111.00 AS Decimal(9, 2)), CAST(900.00 AS Decimal(9, 2)), CAST(N'2019-02-02T00:00:00.0000000' AS DateTime2), 1, 0, 1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[TbEmployees] OFF
SET IDENTITY_INSERT [dbo].[TbHolidayDetails] ON 

INSERT [dbo].[TbHolidayDetails] ([HolidayDetailID], [HolidayTypeID], [EmployeeID], [HolidayActualDate], [HolidayStart], [HolidayEnd], [DaysNumber]) VALUES (1, 1, 1, CAST(N'2019-09-10' AS Date), CAST(N'2019-09-10' AS Date), CAST(N'2019-09-18' AS Date), 8)
SET IDENTITY_INSERT [dbo].[TbHolidayDetails] OFF
SET IDENTITY_INSERT [dbo].[TbHolidayTypes] ON 

INSERT [dbo].[TbHolidayTypes] ([HolidayTypeID], [TypeName], [MaxDays], [Percentage], [IsDeduct]) VALUES (1, N'اجازة اعتيادى', 28, 0, 0)
SET IDENTITY_INSERT [dbo].[TbHolidayTypes] OFF
SET IDENTITY_INSERT [dbo].[TbInsurancesTypes] ON 

INSERT [dbo].[TbInsurancesTypes] ([InsuranceID], [EnsuranceType], [EmpFixedSalaryInsu], [ComFixedSalaryInsu], [EmpVarSalaryInsu], [ComVarSalaryInsu]) VALUES (1, N'مومن علية', CAST(14.00 AS Decimal(9, 2)), CAST(26.00 AS Decimal(9, 2)), CAST(11.00 AS Decimal(9, 2)), CAST(24.00 AS Decimal(9, 2)))
INSERT [dbo].[TbInsurancesTypes] ([InsuranceID], [EnsuranceType], [EmpFixedSalaryInsu], [ComFixedSalaryInsu], [EmpVarSalaryInsu], [ComVarSalaryInsu]) VALUES (2, N'غير مومن علية', CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)))
INSERT [dbo].[TbInsurancesTypes] ([InsuranceID], [EnsuranceType], [EmpFixedSalaryInsu], [ComFixedSalaryInsu], [EmpVarSalaryInsu], [ComVarSalaryInsu]) VALUES (3, N'مومن علية بعد المعاش', CAST(3.00 AS Decimal(9, 2)), CAST(21.00 AS Decimal(9, 2)), CAST(3.00 AS Decimal(9, 2)), CAST(21.00 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[TbInsurancesTypes] OFF
SET IDENTITY_INSERT [dbo].[TbJobTitles] ON 

INSERT [dbo].[TbJobTitles] ([JobTitleID], [JobTitleName]) VALUES (1, N'Junior')
INSERT [dbo].[TbJobTitles] ([JobTitleID], [JobTitleName]) VALUES (2, N'Eng')
INSERT [dbo].[TbJobTitles] ([JobTitleID], [JobTitleName]) VALUES (1002, N'Engnieer')
SET IDENTITY_INSERT [dbo].[TbJobTitles] OFF
SET IDENTITY_INSERT [dbo].[TbMonths] ON 

INSERT [dbo].[TbMonths] ([MonthID], [MonthNumber], [MonthTotalDays], [MonthActualWorkDays], [YearID]) VALUES (1, 1, 31, 31, 1)
INSERT [dbo].[TbMonths] ([MonthID], [MonthNumber], [MonthTotalDays], [MonthActualWorkDays], [YearID]) VALUES (2, 2, 28, 28, 1)
INSERT [dbo].[TbMonths] ([MonthID], [MonthNumber], [MonthTotalDays], [MonthActualWorkDays], [YearID]) VALUES (3, 3, 31, 31, 1)
INSERT [dbo].[TbMonths] ([MonthID], [MonthNumber], [MonthTotalDays], [MonthActualWorkDays], [YearID]) VALUES (4, 4, 30, 30, 1)
INSERT [dbo].[TbMonths] ([MonthID], [MonthNumber], [MonthTotalDays], [MonthActualWorkDays], [YearID]) VALUES (5, 5, 31, 31, 1)
INSERT [dbo].[TbMonths] ([MonthID], [MonthNumber], [MonthTotalDays], [MonthActualWorkDays], [YearID]) VALUES (6, 6, 30, 30, 1)
INSERT [dbo].[TbMonths] ([MonthID], [MonthNumber], [MonthTotalDays], [MonthActualWorkDays], [YearID]) VALUES (7, 7, 31, 31, 1)
INSERT [dbo].[TbMonths] ([MonthID], [MonthNumber], [MonthTotalDays], [MonthActualWorkDays], [YearID]) VALUES (8, 8, 31, 31, 1)
INSERT [dbo].[TbMonths] ([MonthID], [MonthNumber], [MonthTotalDays], [MonthActualWorkDays], [YearID]) VALUES (9, 9, 30, 29, 1)
INSERT [dbo].[TbMonths] ([MonthID], [MonthNumber], [MonthTotalDays], [MonthActualWorkDays], [YearID]) VALUES (10, 10, 31, 31, 1)
INSERT [dbo].[TbMonths] ([MonthID], [MonthNumber], [MonthTotalDays], [MonthActualWorkDays], [YearID]) VALUES (11, 11, 30, 30, 1)
INSERT [dbo].[TbMonths] ([MonthID], [MonthNumber], [MonthTotalDays], [MonthActualWorkDays], [YearID]) VALUES (12, 12, 31, 31, 1)
SET IDENTITY_INSERT [dbo].[TbMonths] OFF
SET IDENTITY_INSERT [dbo].[TbPayrolls] ON 

INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (166, CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 1)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (167, CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 2)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (168, CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 3)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (169, CAST(300.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 4)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (170, CAST(400.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 5)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (171, CAST(500.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 6)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (172, CAST(500.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 7)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (173, CAST(500.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 8)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (174, CAST(3000.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 9)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (175, CAST(300.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 10)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (176, CAST(2500.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 11)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (177, CAST(4902.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 12)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (178, CAST(985.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 17)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (179, CAST(1985.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 18)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (180, CAST(1388.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 19)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (181, CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 20)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (182, CAST(700.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 21)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (183, CAST(111.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 29)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (184, CAST(600.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 30)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (185, CAST(800.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 31)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (186, CAST(788.00 AS Decimal(9, 2)), CAST(N'2019-01-01' AS Date), 32)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (187, CAST(2400.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 1)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (188, CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 2)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (189, CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 3)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (190, CAST(300.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 4)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (191, CAST(400.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 5)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (192, CAST(500.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 6)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (193, CAST(500.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 7)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (194, CAST(500.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 8)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (195, CAST(3000.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 9)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (196, CAST(300.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 10)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (197, CAST(2500.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 11)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (198, CAST(4902.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 12)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (199, CAST(985.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 17)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (200, CAST(1985.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 18)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (201, CAST(1388.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 19)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (202, CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 20)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (203, CAST(700.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 21)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (204, CAST(111.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 29)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (205, CAST(600.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 30)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (206, CAST(800.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 31)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (207, CAST(1188.00 AS Decimal(9, 2)), CAST(N'2019-02-16' AS Date), 32)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (208, CAST(1800.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 1)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (209, CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 2)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (210, CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 3)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (211, CAST(300.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 4)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (212, CAST(400.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 5)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (213, CAST(500.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 6)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (214, CAST(500.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 7)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (215, CAST(500.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 8)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (216, CAST(3000.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 9)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (217, CAST(300.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 10)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (218, CAST(2500.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 11)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (219, CAST(4902.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 12)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (220, CAST(985.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 17)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (221, CAST(1985.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 18)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (222, CAST(1388.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 19)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (223, CAST(2000.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 20)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (224, CAST(700.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 21)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (225, CAST(111.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 29)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (226, CAST(600.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 30)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (227, CAST(800.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 31)
INSERT [dbo].[TbPayrolls] ([PayrollID], [NetSalary], [MonthDate], [EmployeeID]) VALUES (228, CAST(788.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date), 32)
SET IDENTITY_INSERT [dbo].[TbPayrolls] OFF
SET IDENTITY_INSERT [dbo].[TbPositions] ON 

INSERT [dbo].[TbPositions] ([PositionID], [PositionName]) VALUES (1, N'Senior')
INSERT [dbo].[TbPositions] ([PositionID], [PositionName]) VALUES (2, N'Team leader')
INSERT [dbo].[TbPositions] ([PositionID], [PositionName]) VALUES (3, N'Scrum master')
SET IDENTITY_INSERT [dbo].[TbPositions] OFF
SET IDENTITY_INSERT [dbo].[TbRoles] ON 

INSERT [dbo].[TbRoles] ([RoleId], [RoleName]) VALUES (1, N'NormaL')
SET IDENTITY_INSERT [dbo].[TbRoles] OFF
SET IDENTITY_INSERT [dbo].[TbSalaryAudits] ON 

INSERT [dbo].[TbSalaryAudits] ([SalaryAuditID], [EmployeeID], [OldSalary], [NewSalary], [Date]) VALUES (1, 30, CAST(111.00 AS Decimal(9, 2)), CAST(600.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date))
INSERT [dbo].[TbSalaryAudits] ([SalaryAuditID], [EmployeeID], [OldSalary], [NewSalary], [Date]) VALUES (2, 32, CAST(800.00 AS Decimal(9, 2)), CAST(900.00 AS Decimal(9, 2)), CAST(N'2019-09-16' AS Date))
SET IDENTITY_INSERT [dbo].[TbSalaryAudits] OFF
INSERT [dbo].[TbSalaryStaticInfo] ([EmployeeID], [InsuranceID], [InsuEmpFixSalaryCalc], [InsuCompFixSalaryCalc], [InsuEmpVarSalaryCalc], [InsuCompVarSalaryCalc]) VALUES (12, 1, CAST(98.00 AS Decimal(9, 2)), CAST(182.00 AS Decimal(9, 2)), CAST(77.00 AS Decimal(9, 2)), CAST(168.00 AS Decimal(9, 2)))
INSERT [dbo].[TbSalaryStaticInfo] ([EmployeeID], [InsuranceID], [InsuEmpFixSalaryCalc], [InsuCompFixSalaryCalc], [InsuEmpVarSalaryCalc], [InsuCompVarSalaryCalc]) VALUES (17, 1, CAST(15.54 AS Decimal(9, 2)), CAST(28.86 AS Decimal(9, 2)), CAST(12.21 AS Decimal(9, 2)), CAST(26.64 AS Decimal(9, 2)))
INSERT [dbo].[TbSalaryStaticInfo] ([EmployeeID], [InsuranceID], [InsuEmpFixSalaryCalc], [InsuCompFixSalaryCalc], [InsuEmpVarSalaryCalc], [InsuCompVarSalaryCalc]) VALUES (18, 1, CAST(15.54 AS Decimal(9, 2)), CAST(28.86 AS Decimal(9, 2)), CAST(12.21 AS Decimal(9, 2)), CAST(26.64 AS Decimal(9, 2)))
INSERT [dbo].[TbSalaryStaticInfo] ([EmployeeID], [InsuranceID], [InsuEmpFixSalaryCalc], [InsuCompFixSalaryCalc], [InsuEmpVarSalaryCalc], [InsuCompVarSalaryCalc]) VALUES (19, 1, CAST(112.00 AS Decimal(9, 2)), CAST(208.00 AS Decimal(9, 2)), CAST(88.00 AS Decimal(9, 2)), CAST(192.00 AS Decimal(9, 2)))
INSERT [dbo].[TbSalaryStaticInfo] ([EmployeeID], [InsuranceID], [InsuEmpFixSalaryCalc], [InsuCompFixSalaryCalc], [InsuEmpVarSalaryCalc], [InsuCompVarSalaryCalc]) VALUES (32, 1, CAST(112.00 AS Decimal(9, 2)), CAST(208.00 AS Decimal(9, 2)), CAST(88.00 AS Decimal(9, 2)), CAST(192.00 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[TbShifts] ON 

INSERT [dbo].[TbShifts] ([ShiftID], [ShiftName], [ShiftStart], [ShiftEnd], [DelayTime], [LeaveEarlyByMinuts], [BeginningIn], [EndingIn], [BeginningOut], [EndingOut], [CountAsWorkDay], [CountAsMinuts], [Notes], [ChekIn], [CheckOut]) VALUES (2, N'Morning', CAST(N'09:42:41' AS Time), CAST(N'06:42:41' AS Time), 30, 0, CAST(N'10:42:41' AS Time), CAST(N'10:42:41' AS Time), CAST(N'10:42:41' AS Time), CAST(N'10:42:41' AS Time), 0, 0, N'', 1, 1)
INSERT [dbo].[TbShifts] ([ShiftID], [ShiftName], [ShiftStart], [ShiftEnd], [DelayTime], [LeaveEarlyByMinuts], [BeginningIn], [EndingIn], [BeginningOut], [EndingOut], [CountAsWorkDay], [CountAsMinuts], [Notes], [ChekIn], [CheckOut]) VALUES (3, N'night', CAST(N'03:17:39' AS Time), CAST(N'03:17:39' AS Time), 15, 0, CAST(N'03:17:39' AS Time), CAST(N'03:17:39' AS Time), CAST(N'03:17:39' AS Time), CAST(N'03:17:39' AS Time), 0, 0, N'', 0, 0)
INSERT [dbo].[TbShifts] ([ShiftID], [ShiftName], [ShiftStart], [ShiftEnd], [DelayTime], [LeaveEarlyByMinuts], [BeginningIn], [EndingIn], [BeginningOut], [EndingOut], [CountAsWorkDay], [CountAsMinuts], [Notes], [ChekIn], [CheckOut]) VALUES (4, N'wide', CAST(N'03:19:01' AS Time), CAST(N'03:19:01' AS Time), 10, 0, CAST(N'03:19:01' AS Time), CAST(N'03:19:01' AS Time), CAST(N'03:19:01' AS Time), CAST(N'03:19:01' AS Time), 0, 0, N'', 0, 0)
SET IDENTITY_INSERT [dbo].[TbShifts] OFF
SET IDENTITY_INSERT [dbo].[TbVacations] ON 

INSERT [dbo].[TbVacations] ([VacationID], [VacationDate], [VacationDuration]) VALUES (1, CAST(N'2019-09-17' AS Date), 1)
SET IDENTITY_INSERT [dbo].[TbVacations] OFF
INSERT [dbo].[TbYears] ([YearID], [YearNumber]) VALUES (1, 2019)
ALTER TABLE [dbo].[TbCalenders] ADD  CONSTRAINT [IsVac_TbCalenders]  DEFAULT ((0)) FOR [IsVac]
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
ALTER TABLE [dbo].[TbUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_TbUserRoles_TbRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[TbRoles] ([RoleId])
GO
ALTER TABLE [dbo].[TbUserRoles] CHECK CONSTRAINT [FK_TbUserRoles_TbRoles]
GO
ALTER TABLE [dbo].[TbUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_TbUserRoles_TbUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[TbUsers] ([UserID])
GO
ALTER TABLE [dbo].[TbUserRoles] CHECK CONSTRAINT [FK_TbUserRoles_TbUsers]
GO
ALTER TABLE [dbo].[TbUsers]  WITH CHECK ADD  CONSTRAINT [FK_TbUsers_TbEmployees] FOREIGN KEY([UserID])
REFERENCES [dbo].[TbEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[TbUsers] CHECK CONSTRAINT [FK_TbUsers_TbEmployees]
GO
/****** Object:  StoredProcedure [dbo].[FillTreeViewDataCompDepBranch]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetEmpInMonth]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_BranchDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_BranchInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_BranchInsert](
@CompanyID int,
@BranchMail nvarchar(100),
@BranchPhone varchar(15) ,
@BranchFax varchar(5),
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
/****** Object:  StoredProcedure [dbo].[sp_BranchUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_BranchUpdate](
@BranchID int,
@CompanyID int,
@BranchMail nvarchar(100),
@BranchPhone varchar(15) ,
@BranchFax varchar(5),
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
/****** Object:  StoredProcedure [dbo].[sp_RoleDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RoleDelete]
@RoleId int
as
begin
delete from TbRoles where RoleId = @RoleId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_RoleInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RoleInsert](
@RoleName nvarchar(100)
)
as
begin
insert into TbRoles values(@RoleName);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RoleReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RoleReadAll]
as
begin
select * from TbRoles
end
GO
/****** Object:  StoredProcedure [dbo].[sp_RoleReadById]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RoleReadById]
@RoleId int 
as
begin
select * from TbRoles where RoleId = @RoleId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_RoleUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RoleUpdate]
@RoleId int,
@RoleName nvarchar(100)
as
begin
update TbRoles set RoleName = @RoleName where RoleId = @RoleId
end

GO
/****** Object:  StoredProcedure [dbo].[sp_UserDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_UserDelete]
@UserId int
as
begin
delete from TbUsers where UserID = @UserId
end

GO
/****** Object:  StoredProcedure [dbo].[sp_UserReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_UserReadAll]
as
begin 
select * from TbUsers 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_UserReadById]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_UserReadById]
@UserID int 
as
begin
select * from TbUsers where UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_UserRoleInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UserRoleInsert]

@UserId int,
@RoleId int
as
begin
insert into TbUserRoles values(@UserId,@RoleId);
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UserRoleUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_UserRoleUpdate]
@UserId int,
@RoleId nvarchar(100)
as
begin
update TbUserRoles set RoleId = @RoleId where UserId = @UserId
end

GO
/****** Object:  StoredProcedure [dbo].[sp_UserUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_UserUpdate]
(
@UserId int,
@UserName nvarchar(100),
@UserPassword nvarchar(max),
@UserHashedPassword nvarchar(max),
@QuestionForForgetPassword nvarchar(MAX),
@AnswerForForgetPassword nvarchar(Max)
)
as
begin
update TbUsers set UserName = @UserName, UserPassword = @UserPassword,UserHashedPassword = @UserHashedPassword, @QuestionForForgetPassword = @QuestionForForgetPassword, AnswerForForgetPassword = @AnswerForForgetPassword 
 where UserID = @UserId 
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionByID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AdditionDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AdditionDetailsDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AdditionDetailsInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AdditionDetailsReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AdditionDetailsReadByOne]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AdditionDetailsUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_AdditionDetailsUpdate]
@AdditionDetailsID  int,
@AdditionID int,
@EmployeeID int, 
@Notes nvarchar(500),
@AdditionDetailsDate datetime,
@Amount decimal(9,2)
as
begin
update TbAdditionDetails set @AdditionID = @AdditionID , EmployeeID = @EmployeeID , Notes = @Notes, AdditionDetailsDate = @AdditionDetailsDate
where AdditionDetailsID = @AdditionDetailsID
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_AdditionReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AdditionReadByID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AdditionsCalculate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AdditionsCalculateByID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AdditionsForEmployeeByID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AdditionsInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AdditionUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AttendCheckInOrNo]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_attendenceCheckPassword]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AttendenceDetailsForOneEmployee]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AttendenceInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AttendenceReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AttendenceReadDelay]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AttendenceReadEmployeeName]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_AttendenceReadEmployeeName]
as
select EmployeeID,EmployeeName
from TbEmployees
GO
/****** Object:  StoredProcedure [dbo].[Usp_AttendenceUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_AttendReadID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_BranchDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_BranchesInCompany]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_BranchInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_BranchInsert](
@CompanyID int,
@BranchMail nvarchar(100),
@BranchPhone varchar(15) ,
@BranchFax varchar(5),
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
/****** Object:  StoredProcedure [dbo].[Usp_BranchReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_BranchReadByID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_BranchRename]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_BranchUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_BranchUpdate](
@BranchID int,
@CompanyID int,
@BranchMail nvarchar(100),
@BranchPhone varchar(15) ,
@BranchFax varchar(5),
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
/****** Object:  StoredProcedure [dbo].[Usp_CalenderInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_CalenderShow]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_CalenderShow] @MonthID smallint
as
select  datename(weekday,CalenderDate),IsVac from TbCalenders where MonthID=@MonthID
GO
/****** Object:  StoredProcedure [dbo].[Usp_CompanyGetId]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_CompanyInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_CompanyReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_CompanyReadByID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_CompanyReName]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_CompanyUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DeductionDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DeductionDetailsDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DeductionDetailsInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DeductionDetailsReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DeductionDetailsReadByOne]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DeductionDetailsUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DeductionReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DeductionReadByID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DeductionsCalculate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DeductionsCalculatebyID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DeductionsForEmployeeByID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DeductionsInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DeductionUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DepartmentDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DepartmentInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DepartmentReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_DepartmentReadAll]
as begin
select * from TbDepartments where IsDeleted = 0
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_DepartmentReadByID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DepartmentReadIDReturnName]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DepartmentRename]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_DepartmentUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EducationDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EducationInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EducationReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EducationReadById]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EducationUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeInShift]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeMasterdataDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeMasterdataInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeMasterdataReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeMasterdataReadById]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeMasterdataUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
			
	where IsTerminated = 'false' and IsActive=1
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeReadById]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeReadByName]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EmployeesData]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_EmployeesReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Usp_EmployeesReadAll]
as
select EmployeeID,EmployeeName
from TbEmployees
GO
/****** Object:  StoredProcedure [dbo].[Usp_EmployeeUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_FillTreeViewDataCompDepBranch]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_GetBasicSalary]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_GetBrachinComp]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_GetBranchId]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_GetCompanyId]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_GetDepartmentId]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_GetDepinBrach]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_GetIdFromName]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailCheckNumber]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayDetailDelete]
@id int
as
delete from TbHolidayDetails where HolidayDetailID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailReadByID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailReadExtraHolidayForOnEmployee]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailSearchEndDate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_HolidayDetailUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_HolidayNameIsExist]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_HolidayNameIsExist]
@name nvarchar(100)
as
select TypeName from TbHolidayTypes where  TypeName like @name +'%'
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayReadEmployeeName]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayReadEmployeeName]
as
select  EmployeeID, EmployeeName
from Vw_HolidayReadEmployeeName
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayReadTypeName]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayReadTypeName]
as
select  HolidayTypeID, TypeName
from Vw_HolidayReadTypeName
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayTypeDelete]
@id int 
as
delete from TbHolidayTypes where HolidayTypeID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeIsDiscountOrNo]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeNameIsExist]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_HolidayTypeReadAll]
as
select * from TbHolidayTypes
GO
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeReadByID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeReadMaxDays]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_HolidayTypeUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_InsuranceCalculate]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_InsuranceCalculate]
@EmployeeID int
as
begin

Declare @AmountOfInsurance decimal(9,2) =( SELECT TbSalaryStaticInfo.InsuEmpFixSalaryCalc from TbSalaryStaticInfo where EmployeeID = @EmployeeID);

 
if(@AmountOfInsurance > 0)
	set @AmountOfInsurance = @AmountOfInsurance;
else
	set @AmountOfInsurance= 0;

return @AmountOfInsurance
end 
GO
/****** Object:  StoredProcedure [dbo].[Usp_InsuranceDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_InsuranceInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_InsuranceReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_InsuranceReadAll]
as
select * from TbInsurancesTypes
GO
/****** Object:  StoredProcedure [dbo].[Usp_InsuranceReadByID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_InsuranceUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_JobTitleDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_JobTitleInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_JobTitleReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_JobTitleReadById]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_JobTitleUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_MonthsInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_MonthsShow]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_PayrollCalculate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
declare @InsuranceAmount decimal(9,2);

exec @AdditionAmount =  Usp_AdditionsCalculate @EmployeeId, @MonthDate
exec @DeductionAmount =  Usp_DeductionsCalculate @EmployeeId ,@MonthDate
exec @BasicSalary =  Usp_GetBasicSalary @EmployeeId
exec @InsuranceAmount = Usp_InsuranceCalculate @EmployeeId 
set @SalaryAfterAdditionAndDedduction =(@BasicSalary + @AdditionAmount) - (@DeductionAmount + @InsuranceAmount);
return @SalaryAfterAdditionAndDedduction;
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_PayrollInMonthIsPaid]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_PayrollInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_PayrollInsertAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_PayrollInsertByID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_PayrollReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_PayrollViewPayrollAllArchieve]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_PositionDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_PositionInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_PositionReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_PositionReadById]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_PositionUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_proc]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_ShiftCheckTime]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_ShiftDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_ShiftInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_ShiftReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_ShiftReadAll]
as
select * from TbShifts
GO
/****** Object:  StoredProcedure [dbo].[Usp_ShiftReadByID]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_ShiftReadByID]
@id int

as
select * from TbShifts where ShiftID=@id
GO
/****** Object:  StoredProcedure [dbo].[Usp_ShiftSearch]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_ShiftUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_ShiftVacationDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Usp_ShiftVacationDelete] @DayID tinyint,@ShiftID int
as
delete from TbShiftsVacations
where ShiftID=@ShiftID and WeekDayID=@DayID
GO
/****** Object:  StoredProcedure [dbo].[Usp_ShiftVacationInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_ShiftVacationsShow]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_TaxDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_TaxReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_TaxReadByOne]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_TbBranchReadAll]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_TbBranchReadByID]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_UpdateCompanyName]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_VacationDelete]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_VacationInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_vacationsCount]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_vacationsCount]
as
select count(VacationID) from TbVacations
 where VacationDate>CONVERT(date,getdate())
GO
/****** Object:  StoredProcedure [dbo].[Usp_VacationsInMonth]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_VacationsToCalenderInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_VacationUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_WeeklyVacationsInMonth]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_WeeklyVacationsInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_WeeklyVacationsShow]    Script Date: 9/24/2019 2:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_WeeklyVacationsShow]
as
select WeekDayID from TbWeeklyVacations where IsVac=1
GO
/****** Object:  StoredProcedure [dbo].[Usp_WeeklyVacationsUpdate]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_YearInsert]    Script Date: 9/24/2019 2:32:50 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_YearsShow]    Script Date: 9/24/2019 2:32:50 PM ******/
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
