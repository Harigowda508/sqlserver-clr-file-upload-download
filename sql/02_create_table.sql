CREATE TABLE [dbo].[t_DevCertificateBackups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CertificateName] [nvarchar](100) NULL,
	[FileName] [nvarchar](255) NULL,
	[FileType] [nvarchar](10) NULL,
	[FileContent] [varbinary](max) NULL,
	[UploadDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQDEV_FileName] UNIQUE NONCLUSTERED 
(
	[FileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_LIVECertificateBackups]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_LIVECertificateBackups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CertificateName] [nvarchar](100) NULL,
	[FileName] [nvarchar](255) NULL,
	[FileType] [nvarchar](10) NULL,
	[FileContent] [varbinary](max) NULL,
	[UploadDate] [datetime] NULL,
	[Query] [nvarchar](250) NULL,
	[Client] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_FileName] UNIQUE NONCLUSTERED 
(
	[FileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_LiveTDEDetails]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_LiveTDEDetails](
	[Server] [varchar](50) NOT NULL,
	[DATABASE] [nvarchar](50) NOT NULL,
	[Environment] [varchar](250) NULL,
	[Certificate_Name] [varchar](250) NULL,
	[Password] [varchar](250) NULL,
	[Certificate_Backup_Path] [varchar](250) NULL,
	[Private_Key_Backup_Path] [varchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_MasterKeysforInstance]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_MasterKeysforInstance](
	[Server] [nvarchar](50) NOT NULL,
	[Environment] [nvarchar](50) NOT NULL,
	[Type_of_Password] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_PREPRODCertificateBackups]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_PREPRODCertificateBackups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CertificateName] [nvarchar](100) NULL,
	[FileName] [nvarchar](255) NULL,
	[FileType] [nvarchar](10) NULL,
	[FileContent] [varbinary](max) NULL,
	[UploadDate] [datetime] NULL,
	[Query] [nvarchar](250) NULL,
	[Client] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNIQUE_FileName] UNIQUE NONCLUSTERED 
(
	[FileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_QACertificateBackups]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_QACertificateBackups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CertificateName] [nvarchar](100) NULL,
	[FileName] [nvarchar](255) NULL,
	[FileType] [nvarchar](10) NULL,
	[FileContent] [varbinary](max) NULL,
	[UploadDate] [datetime] NULL,
	[Query] [varchar](max) NULL,
	[Client] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQA_FileName] UNIQUE NONCLUSTERED 
(
	[FileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TDE_EncryptionStatusLog]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TDE_EncryptionStatusLog](
	[DatabaseName] [sysname] NOT NULL,
	[EncryptionState] [int] NULL,
	[PercentComplete] [decimal](5, 2) NULL,
	[KeyAlgorithm] [nvarchar](50) NULL,
	[KeyLength] [int] NULL,
	[LogTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TDEClientBackupPasswords]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TDEClientBackupPasswords](
	[Client_Names] [nvarchar](50) NOT NULL,
	[Certificate_Backup_Passwords] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TDEDEVDETAILS]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TDEDEVDETAILS](
	[Server] [nvarchar](100) NOT NULL,
	[DATABASE] [nvarchar](100) NOT NULL,
	[Environment] [nvarchar](100) NOT NULL,
	[Type_of_Password] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Certificate_Backup_Path] [nvarchar](100) NOT NULL,
	[Private_Key_Backup_Path] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_UATCertificateBackups]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_UATCertificateBackups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CertificateName] [nvarchar](100) NULL,
	[FileName] [nvarchar](255) NULL,
	[FileType] [nvarchar](10) NULL,
	[FileContent] [varbinary](max) NULL,
	[UploadDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQUAT_FileName] UNIQUE NONCLUSTERED 
(
	[FileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_UATTDEDETAILS]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_UATTDEDETAILS](
	[Server] [nvarchar](100) NOT NULL,
	[DATABASE] [nvarchar](100) NOT NULL,
	[Environment] [nvarchar](100) NOT NULL,
	[Certificate_Name] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Certificate_Backup_Path] [nvarchar](100) NOT NULL,
	[Private_Key_Backup_Path] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_DevCertificateBackups] ADD  DEFAULT (getdate()) FOR [UploadDate]
GO
ALTER TABLE [dbo].[t_LIVECertificateBackups] ADD  DEFAULT (getdate()) FOR [UploadDate]
GO
ALTER TABLE [dbo].[t_PREPRODCertificateBackups] ADD  DEFAULT (getdate()) FOR [UploadDate]
GO
ALTER TABLE [dbo].[t_QACertificateBackups] ADD  DEFAULT (getdate()) FOR [UploadDate]
GO
ALTER TABLE [dbo].[t_TDE_EncryptionStatusLog] ADD  DEFAULT (getdate()) FOR [LogTime]
GO
ALTER TABLE [dbo].[t_UATCertificateBackups] ADD  DEFAULT (getdate()) FOR [UploadDate]
GO