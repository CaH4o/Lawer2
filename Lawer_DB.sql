USE [Lawer_DB]
GO
/****** Object:  Table [dbo].[References]    Script Date: 07/06/2017 18:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[References](
	[Lable] [varchar](30) NOT NULL,
	[EN_name] [nvarchar](255) NULL,
	[Ru_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Lable] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[status]    Script Date: 07/06/2017 18:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name_status] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Type_case]    Script Date: 07/06/2017 18:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Type_case](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name_type_case] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 07/06/2017 18:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name_employee] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lawer]    Script Date: 07/06/2017 18:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lawer](
	[id_Case] [varchar](30) NOT NULL,
	[Family_name] [nvarchar](30) NULL,
	[First_name] [nvarchar](30) NULL,
	[Middle_name] [nvarchar](30) NULL,
	[Employees] [int] NULL,
	[type_of_case] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Case] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Process]    Script Date: 07/06/2017 18:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Process](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Case_ID] [varchar](30) NOT NULL,
	[Status] [int] NULL,
	[Date] [date] NULL,
	[Comments] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Trigger [Status_control]    Script Date: 07/06/2017 18:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Status_control] 
   ON  [dbo].[Process] 
   INSTEAD OF INSERT
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @Status_count INT = (
	
		SELECT COUNT(*)
		FROM dbo.Process
		WHERE dbo.Process.case_id = (
		
			SELECT TOP 1 case_id
			FROM inserted
		)
		AND
		dbo.Process.[status] = (
		
			SELECT TOP 1 [status]
			FROM inserted
		)
	)
	
	IF @Status_count = 0
		INSERT INTO dbo.Process
			SELECT case_id, [status], [date], comments FROM inserted;

END;
GO
/****** Object:  ForeignKey [FK__Type_case__name___267ABA7A]    Script Date: 07/06/2017 18:36:57 ******/
ALTER TABLE [dbo].[Type_case]  WITH CHECK ADD FOREIGN KEY([name_type_case])
REFERENCES [dbo].[References] ([Lable])
GO
/****** Object:  ForeignKey [FK__status__name_sta__30F848ED]    Script Date: 07/06/2017 18:36:57 ******/
ALTER TABLE [dbo].[status]  WITH CHECK ADD FOREIGN KEY([name_status])
REFERENCES [dbo].[References] ([Lable])
GO
/****** Object:  ForeignKey [FK__Employees__name___21B6055D]    Script Date: 07/06/2017 18:36:57 ******/
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([name_employee])
REFERENCES [dbo].[References] ([Lable])
GO
/****** Object:  ForeignKey [FK__Lawer__Employees__2B3F6F97]    Script Date: 07/06/2017 18:36:57 ******/
ALTER TABLE [dbo].[Lawer]  WITH CHECK ADD FOREIGN KEY([Employees])
REFERENCES [dbo].[Employees] ([ID])
GO
/****** Object:  ForeignKey [FK__Lawer__type_of_c__2C3393D0]    Script Date: 07/06/2017 18:36:57 ******/
ALTER TABLE [dbo].[Lawer]  WITH CHECK ADD FOREIGN KEY([type_of_case])
REFERENCES [dbo].[Type_case] ([ID])
GO
/****** Object:  ForeignKey [FK__Process__Case_ID__35BCFE0A]    Script Date: 07/06/2017 18:36:57 ******/
ALTER TABLE [dbo].[Process]  WITH CHECK ADD FOREIGN KEY([Case_ID])
REFERENCES [dbo].[Lawer] ([id_Case])
GO
/****** Object:  ForeignKey [FK__Process__Status__36B12243]    Script Date: 07/06/2017 18:36:57 ******/
ALTER TABLE [dbo].[Process]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[status] ([ID])
GO
