USE [master]
GO
/****** Object:  Database [Testing]    Script Date: 2021/10/12 11:56:50 AM ******/
CREATE DATABASE [Testing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Testing', FILENAME = N'C:\Users\VuyoN\Testing.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Testing_log', FILENAME = N'C:\Users\VuyoN\Testing_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Testing] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Testing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Testing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Testing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Testing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Testing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Testing] SET ARITHABORT OFF 
GO
ALTER DATABASE [Testing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Testing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Testing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Testing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Testing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Testing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Testing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Testing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Testing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Testing] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Testing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Testing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Testing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Testing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Testing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Testing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Testing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Testing] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Testing] SET  MULTI_USER 
GO
ALTER DATABASE [Testing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Testing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Testing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Testing] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Testing] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Testing] SET QUERY_STORE = OFF
GO
USE [Testing]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Testing]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[Surname] [varchar](20) NOT NULL,
	[DateOfBirth] [varchar](10) NOT NULL,
	[FK_GenderID] [int] NOT NULL,
	[FK_NationID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gender]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderID] [int] NOT NULL,
	[GenderType] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Gender_1] PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nationality]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality](
	[NationID] [int] NOT NULL,
	[NationalityGroup] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[NationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[AdminName] [varchar](50) NOT NULL,
	[FK_CityID] [int] NOT NULL,
	[FK_DepartmentID] [int] NOT NULL,
	[VerificationCode] [varchar](50) NOT NULL,
	[FK_RoleID] [int] NOT NULL,
	[ResetPasswordKey] [varchar](50) NULL,
	[PassKey_Created] [datetime] NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Gender] FOREIGN KEY([FK_GenderID])
REFERENCES [dbo].[Gender] ([GenderID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Gender]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Nationality] FOREIGN KEY([FK_NationID])
REFERENCES [dbo].[Nationality] ([NationID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Nationality]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_City] FOREIGN KEY([FK_CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_City]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Department] FOREIGN KEY([FK_DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Department]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([FK_RoleID])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Vuyo Nyembezi>
-- Create date: <2021-08-11,,>
-- Description:	<creates profile for system users,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddUser] 
	-- Add the parameters for the stored procedure here
	
	@Email varchar(50),
	@Password varchar(50),
	@AdminName varchar(50),
	@City int,
	@Department int,
	@VerificationCode varchar(50),
	@FK_Role int,
	@Id int = null OUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT [Email] from Users  where Email=@Email)
	BEGIN
	INSERT INTO Users (Email,Password,AdminName,FK_CityID,FK_DepartmentID,VerificationCode,FK_RoleID)
	VALUES(@Email,@Password,@AdminName,@City,@Department,@VerificationCode,@FK_Role)
	SET @Id = SCOPE_iDENTITY()
	END
	ELSE
	BEGIN
	SET @Id = -1
	END


	RETURN @id
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteEmployee] 
	-- Add the parameters for the stored procedure here
	@EmployeeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	UPDATE  Employee 
	SET IsActive = 0
	WHERE EmployeeID=@EmployeeID
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUser]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM  Users 
	
	WHERE Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[ForgottenPassword]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ForgottenPassword]
	-- Add the parameters for the stored procedure here
	@Email varchar(50),
	@PassKey varchar(50),
	@Password varchar(50),
	@VerificationCode varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Users
	SET 
	ResetPasswordKey = NULL,
	Password =@Password,
	VerificationCode = @VerificationCode
	WHERE Email = @Email AND ResetPasswordKey =@PassKey



END

GO
/****** Object:  StoredProcedure [dbo].[GetAllEmployee]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Vuyo Nyembezi
-- Create date: 2021-05-13
-- Description:	Get all Employees
-- =============================================
CREATE PROCEDURE [dbo].[GetAllEmployee] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [EmployeeID],[FirstName],[Surname],[DateOfBirth],[GenderType],[NationalityGroup]
	FROM Employee 
	INNER JOIN Gender ON Employee.FK_GenderID = Gender.GenderID
	INNER JOIN Nationality ON Employee.FK_NationID = Nationality.NationID
	WHERE [IsActive] = 1
END

GO
/****** Object:  StoredProcedure [dbo].[GetCities]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCities]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [CityID],[CityName]
	FROM City
END

GO
/****** Object:  StoredProcedure [dbo].[GetDepartments]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDepartments]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [DepartmentID],[DepartmentName]
	FROM Departments
END

GO
/****** Object:  StoredProcedure [dbo].[GetEmployee]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmployee] 
	-- Add the parameters for the stored procedure here
	@EmployeeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [EmployeeID],[FirstName],[Surname],[DateOfBirth],[GenderType],[NationalityGroup] FROM 
	((Employee INNER JOIN Gender ON Employee.FK_GenderID =Gender.GenderID) INNER JOIN Nationality ON Employee.FK_NationID =Nationality.NationID)
	WHERE EmployeeID like @EmployeeID AND [IsActive] = 1
	END

GO
/****** Object:  StoredProcedure [dbo].[GetGender]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetGender]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [GenderID],[GenderType]
	FROM Gender
END

GO
/****** Object:  StoredProcedure [dbo].[GetNationality]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetNationality]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [NationID],[NationalityGroup]
	FROM Nationality
END

GO
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRoles]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [RoleId],[RoleName]
	FROM Roles
END

GO
/****** Object:  StoredProcedure [dbo].[GetTerminatedEmployeeById]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTerminatedEmployeeById] 
	-- Add the parameters for the stored procedure here
	@EmployeeID int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [EmployeeID],[FirstName],[Surname]
	FROM Employee
	WHERE [IsActive] =0 AND [EmployeeID] = @EmployeeID
END

GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertEmployee] 
	-- Add the parameters for the stored procedure here
	@FirstName varchar(20),@Surname varchar(20),@DateOfBirth varchar(10),@GenderID int,@NationID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Employee (FirstName,Surname,DateOfBirth,FK_GenderID,FK_NationID) 
	VALUES (@FirstName,@Surname,@DateOfBirth,@GenderID,@NationID)
END

GO
/****** Object:  StoredProcedure [dbo].[PasswordKey]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PasswordKey]
	-- Add the parameters for the stored procedure here
		@Email varchar(50),
	@ResetKey varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Users
	SET ResetPasswordKey =@ResetKey,
    PassKey_Created = GetDate()
	WHERE Email = @Email
END

GO
/****** Object:  StoredProcedure [dbo].[PasswordReset]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PasswordReset] 
	-- Add the parameters for the stored procedure here
	@Email varchar (50),
	@Password varchar(50),
	@VerificationCode varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Users
	SET Password =@password,
	VerificationCode = @VerificationCode
	WHERE Email=@Email
END

GO
/****** Object:  StoredProcedure [dbo].[SelectAllSystemUsers]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllSystemUsers] 
	-- Add the parameters for the stored procedure here
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id],[Email],[Password],[AdminName],[CityName],[DepartmentName],[RoleName]
	FROM Users
	INNER JOIN City ON Users.FK_CityID = City.CityID
	INNER JOIN Departments ON Users.FK_DepartmentID = Departments.DepartmentID
	INNER JOIN Roles ON Users.FK_RoleID =Roles.RoleId
END

GO
/****** Object:  StoredProcedure [dbo].[SelectSystemUserById]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectSystemUserById] 
	-- Add the parameters for the stored procedure here
	
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id],[Email],[Password],[AdminName],[CityName],[DepartmentName],[VerificationCode],[RoleName]
	FROM Users
	INNER JOIN City ON Users.FK_CityID = City.CityID
	INNER JOIN Departments ON Users.FK_DepartmentID = Departments.DepartmentID
	INNER JOIN Roles ON Users.FK_RoleID =Roles.RoleId
	WHERE Id=@Id
END



GO
/****** Object:  StoredProcedure [dbo].[SelectTest]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectTest]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	 
	 SELECT TOP(20) [EmployeeID]
      ,[FirstName]
      ,[Surname]
      ,[DateOfBirth]
      ,[FK_GenderID]
      ,[FK_NationID]
      ,[IsActive]
  FROM Employee
 

END

GO
/****** Object:  StoredProcedure [dbo].[SellectAllEmployees]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SellectAllEmployees] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 SELECT [EmployeeID],[FirstName],[Surname],[DateOfBirth],[GenderType],[NationalityGroup]
	FROM Employee 
	INNER JOIN Gender ON Employee.FK_GenderID = Gender.GenderID
	INNER JOIN Nationality ON Employee.FK_NationID = Nationality.NationID
	WHERE [IsActive] = 1
 
END

GO
/****** Object:  StoredProcedure [dbo].[TerminatedEmployees]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TerminatedEmployees] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [EmployeeID],[FirstName],[Surname]
	FROM Employee
	WHERE [IsActive] =0
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateEmployee] 
	-- Add the parameters for the stored procedure here
	@EmployeeID int,
	@FirstName varchar(20),
	@Surname varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Employee
	SET FirstName=@FirstName,
	Surname =@Surname
	WHERE EmployeeID = @EmployeeID
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateSystemUserRole]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Vuyo Nyembezi,,Name>
-- Create date: <2021/10/08>
-- Description:	<Changes Role of the User>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSystemUserRole]
	-- Add the parameters for the stored procedure here
	@Id int,
	@RoleID int,
	@Response int = NULL OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DECLARE @Result as Int = NULL;
	DECLARE @ReturnValue Int;

	SET @ReturnValue= (SELECT Id from Users WHERE Id = @Id);




	If (@ReturnValue IS NULL )
	BEGIN
	SET @Response = 2;
	RETURN @Response;
	END

	UPDATE Users
	SET FK_RoleID =@RoleID,
	 @Response = 0
	WHERE Id= @Id
	
	RETURN @Response;
END

GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 2021/10/12 11:56:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserLogin] 
	-- Add the parameters for the stored procedure here
	@Email varchar(50),
	@Password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id],[Email],[Password],[AdminName],[FK_CityID],[FK_DepartmentID],[VerificationCode],[RoleID]
	FROM Users
	INNER JOIN City ON Users.FK_CityID = City.CityID
	INNER JOIN Departments ON Users.FK_DepartmentID = Departments.DepartmentID
	INNER JOIN Roles ON Users.FK_RoleID =Roles.RoleId
	WHERE
	Email = @Email AND Password =@Password

	
	END

GO
USE [master]
GO
ALTER DATABASE [Testing] SET  READ_WRITE 
GO
