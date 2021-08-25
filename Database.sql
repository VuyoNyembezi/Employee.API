USE [Testing]
GO
/****** Object:  Table [dbo].[City]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  Table [dbo].[Departments]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  Table [dbo].[Gender]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  Table [dbo].[Nationality]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2021/08/25 10:12:49 AM ******/
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
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [CityName]) VALUES (1, N'DBN')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (2, N'CPT')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (3, N'JHB')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (4, N'PT')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (1, N'IT')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (2, N'HR')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (3, N'BI')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (4, N'Management')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (2, N'Lucy', N'DENCI', N'1988-05-25', 1, 4, 0)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (3, N'Malihe', N'SEIDN', N'1988-05-30', 1, 2, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (4, N'sibu', N'Qolo', N'1977-05-30', 1, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (5, N'Mali', N'Forika', N'1990-08-30', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (6, N'kolisa', N'makathini', N'1990-10-30', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (8, N'rase', N'jali', N'1990-10-30', 2, 3, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (9, N'Majuku', N'Magiya', N'1990-10-30', 1, 3, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (10, N'Thando', N'Sibiya', N'1980-11-30', 2, 3, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (11, N'Majoka', N'Mdoni', N'1980-12-30', 2, 3, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (12, N'Jabu', N'Msiya', N'1925-12-30', 1, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (1002, N'Jojo', N'Jayisa', N'2002-02-03', 2, 3, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (2004, N'Nomonde', N'Vakalisa', N'2001-08-31', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (2005, N'Jojo koi', N'Tank madusa', N'2020-08-18', 2, 3, 0)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (2006, N'Sabelo', N'Jambo', N'1962-07-23', 1, 2, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (2007, N'Gugu', N'Batyi', N'1996-05-31', 1, 2, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (5002, N'Mainly', N'Joko', N'1988-05-27', 1, 2, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (5003, N'Melisa', N'Naithin', N'1990-05-30', 2, 3, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (5004, N'Sthebe', N'Mabiliso', N'1980-10-30', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (5005, N'mashudu', N'Smith', N'2002-08-19', 2, 3, 0)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (6002, N'Nomonde', N'Vakalisa', N'1962-07-23', 1, 4, 0)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (6003, N'Jokazi', N'Mafanibusa', N'1880-02-13', 1, 2, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (7002, N'Jackie', N'Chan', N'1928-05-23', 2, 2, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (8002, N'gugulethu', N'Mayisa', N'1988-10-23', 2, 2, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (11002, N'Lisa', N'Marlin', N'1998-08-12', 1, 4, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (12002, N'Kaith', N'JHones', N'1988-02-02', 1, 3, 0)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (13002, N'percy', N'Morgan', N'2002-02-31', 2, 2, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (14008, N'mathile', N'ncakasana', N'1990-10-30', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (14009, N'huru', N'Vito', N'2021-02-06', 2, 3, 0)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (14010, N'Gugu', N'Mathumbu', N'2001-02-01', 1, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (15002, N'Gyu', N'Malija', N'2000-08-20', 1, 2, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (15003, N'kaithsssss', N'Huku', N'2020-08-20', 2, 3, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (17005, N'Nomonde', N'majoka', N'2001-08-31', 1, 2, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (18003, N'ASAMathi', N'Maseyi', N'2010-06-26', 2, 2, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (18004, N'Sarahi', N'Salihm', N'1999-02-17', 2, 3, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (19002, N'Godfrey', N'Sapula', N'1985-07-25', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (20002, N'Solly', N'Cele', N'1995-07-22', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (26011, N'Jojo', N'Smith', N'2021-02-22', 1, 2, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (27002, N'Gel', N'Test', N'2021-08-20', 1, 2, 0)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (27003, N'Vuyo', N'Nyembezi', N'2021-08-09', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (27004, N'Seni', N'Mayisa', N'2021-08-18', 2, 4, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (27009, N'Majozi', N'DESWA', N'1996-05-31', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (27010, N'Majozi', N'DESWA', N'1996-05-31', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (27011, N'Majozi', N'DESWA', N'1996-05-31', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (27012, N'AWQ', N'WWASE', N'2021-08-01', 1, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (27013, N'Vuyo', N'Jones', N'2021-08-28', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (27014, N'Test', N'Jayisa', N'2021-09-11', 1, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (27015, N'Sith', N'XEle', N'2021-08-20', 2, 4, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (27016, N'Mali', N'Smith', N'2021-08-13', 1, 2, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (27017, N'Nomonde', N'Jones', N'2021-08-30', 1, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (30002, N'vuyo', N'Nyembezi', N'1996-05-31', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (30003, N'vuyo', N'Nyembezi', N'1996-05-31', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (31002, N'Bheli', N'Mafika', N'2021-08-20', 2, 4, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (32002, N'lindelani', N'Mpontshane', N'2021-08-17', 2, 1, 1)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [DateOfBirth], [FK_GenderID], [FK_NationID], [IsActive]) VALUES (32003, N'Jojo', N'Tank', N'2020-08-18', 1, 2, 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
INSERT [dbo].[Gender] ([GenderID], [GenderType]) VALUES (1, N'Female')
INSERT [dbo].[Gender] ([GenderID], [GenderType]) VALUES (2, N'Male')
INSERT [dbo].[Nationality] ([NationID], [NationalityGroup]) VALUES (1, N'African')
INSERT [dbo].[Nationality] ([NationID], [NationalityGroup]) VALUES (2, N'White')
INSERT [dbo].[Nationality] ([NationID], [NationalityGroup]) VALUES (3, N'Indian/Asian')
INSERT [dbo].[Nationality] ([NationID], [NationalityGroup]) VALUES (4, N'Coloured')
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Capture')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Password], [AdminName], [FK_CityID], [FK_DepartmentID], [VerificationCode], [FK_RoleID]) VALUES (1, N'admin@gmail.com', N'B0-5E-BA-16-DB-11-F4-42-49-86-92-E0-C8-4C-83-49', N'admin', 1, 1, N'7kFu1v18HT', 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [AdminName], [FK_CityID], [FK_DepartmentID], [VerificationCode], [FK_RoleID]) VALUES (3003, N'vuyo@gmail.com', N'18-F9-48-F8-E5-3C-DE-AC-53-8E-7E-7F-7C-D9-5A-F2', N'vuyo', 2, 1, N'RnO0wE8Jow', 2)
INSERT [dbo].[Users] ([Id], [Email], [Password], [AdminName], [FK_CityID], [FK_DepartmentID], [VerificationCode], [FK_RoleID]) VALUES (4002, N'vuyo1@gmail.com', N'A2-D3-95-C8-15-52-EF-3A-FA-F9-1B-73-18-7F-88-0F', N'vuyo', 2, 1, N'SFGjXyJRmb', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
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
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 2021/08/25 10:12:49 AM ******/
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
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllEmployee]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetCities]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetDepartments]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetEmployee]    Script Date: 2021/08/25 10:12:49 AM ******/
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
	WHERE EmployeeID like @EmployeeID 
	END

GO
/****** Object:  StoredProcedure [dbo].[GetGender]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetNationality]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  StoredProcedure [dbo].[PasswordReset]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectAllSystemUserById]    Script Date: 2021/08/25 10:12:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllSystemUserById] 
	-- Add the parameters for the stored procedure here
	
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id],[Email],[Password],[AdminName],[FK_CityID],[FK_DepartmentID],[VerificationCode],[FK_RoleID]
	FROM Users

	WHERE Id=@Id
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAllSystemUsers]    Script Date: 2021/08/25 10:12:49 AM ******/
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
	SELECT [Id],[Email],[Password],[AdminName],[FK_CityID],[FK_DepartmentID],[FK_RoleID]
	FROM Users
	INNER JOIN City ON Users.FK_CityID = City.CityID
	INNER JOIN Departments ON Users.FK_DepartmentID = Departments.DepartmentID
	INNER JOIN Roles ON Users.FK_RoleID =Roles.RoleId
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 2021/08/25 10:12:49 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 2021/08/25 10:12:49 AM ******/
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
