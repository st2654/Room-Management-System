SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Facility]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Facility](
	[facility_id] [int] IDENTITY(1,1) NOT NULL,
	[facility_name] [varchar](20) NOT NULL,
	[facility_type] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Facility] PRIMARY KEY CLUSTERED 
(
	[facility_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Program_Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Program_Type](
	[program_id] [int] IDENTITY(1,1) NOT NULL,
	[program_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Program_Type] PRIMARY KEY CLUSTERED 
(
	[program_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[City_Location_Details]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[City_Location_Details](
	[city_location_id] [int] IDENTITY(1,1) NOT NULL,
	[city] [varchar](20) NOT NULL,
	[location] [varchar](20) NOT NULL,
	[block] [varchar](20) NULL,
	[address] [varchar](50) NULL,
 CONSTRAINT [PK_City_Location_Details] PRIMARY KEY CLUSTERED 
(
	[city_location_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Room_Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Room_Type](
	[room_type_id] [int] IDENTITY(1,1) NOT NULL,
	[room_type_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Room_type] PRIMARY KEY CLUSTERED 
(
	[room_type_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bu_Details]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bu_Details](
	[bu_id] [varchar](15) NOT NULL,
	[bu_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Bu_Details] PRIMARY KEY CLUSTERED 
(
	[bu_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Room_Facilities]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Room_Facilities](
	[room_facility_id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NOT NULL,
	[facility_id] [int] NOT NULL,
	[facility_desc] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Room_Facilities] PRIMARY KEY CLUSTERED 
(
	[room_facility_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Booking_Details]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Booking_Details](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[requester_psno] [varchar](10) NOT NULL,
	[program_type_id] [int] NOT NULL,
	[training_purpose] [varchar](20) NOT NULL,
	[room_id] [int] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[no_of_participants] [int] NOT NULL,
	[full_booking_status] [varchar](10) NOT NULL,
	[booking_user_id] [int] NOT NULL,
	[booking_date] [datetime] NOT NULL,
	[booking_remarks] [varchar](100) NULL,
 CONSTRAINT [PK_Booking_Details] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Booking_Schedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Booking_Schedule](
	[schedule_id] [bigint] IDENTITY(1,1) NOT NULL,
	[booking_id] [int] NOT NULL,
	[booked_for_date] [datetime] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[booking_status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Booking_Schedule] PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Master]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User_Master](
	[user_no] [int] IDENTITY(1,1) NOT NULL,
	[login_psno] [varchar](10) NOT NULL,
	[password] [varchar](40) NOT NULL,
	[full_name] [varchar](30) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[mobile_no] [varchar](10) NOT NULL,
	[city_location_id] [int] NOT NULL,
	[role_type] [varchar](5) NOT NULL,
	[del_flag] [bit] NOT NULL,
	[first_login] [bit] NOT NULL,
	[remarks] [varchar](100) NULL,
	[blocked_flag] [bit] NOT NULL,
 CONSTRAINT [PK_User_Master] PRIMARY KEY CLUSTERED 
(
	[user_no] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_User_Master] UNIQUE NONCLUSTERED 
(
	[login_psno] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Room_Master]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Room_Master](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[room_name] [varchar](20) NOT NULL,
	[room_type_id] [int] NOT NULL,
	[city_location_id] [int] NOT NULL,
	[location_coordinator_id] [int] NOT NULL,
	[creator_id] [int] NOT NULL,
	[creation_time_stamp] [datetime] NOT NULL,
	[update_id] [int] NULL,
	[update_time_stamp] [datetime] NULL,
	[del_flag] [bit] NOT NULL,
	[remarks] [varchar](100) NULL,
	[seating_capacity] [int] NOT NULL,
	[max_no_of_persons] [int] NOT NULL,
 CONSTRAINT [PK_Room_Master] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Requester_Details]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Requester_Details](
	[requester_psno] [varchar](10) NOT NULL,
	[requester_name] [varchar](30) NOT NULL,
	[requester_email] [varchar](40) NOT NULL,
	[requester_mobile_no] [varchar](10) NOT NULL,
	[requester_bu_id] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Requester_Details] PRIMARY KEY CLUSTERED 
(
	[requester_psno] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cancellation_Details]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cancellation_Details](
	[cancellation_id] [int] IDENTITY(1,1) NOT NULL,
	[schedule_id] [bigint] NOT NULL,
	[cancellation_user_id] [int] NOT NULL,
	[cancellation_date] [datetime] NOT NULL,
	[cancellation_remarks] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Cancellation_Details_1] PRIMARY KEY CLUSTERED 
(
	[cancellation_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addBooking_Details]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addBooking_Details]
	-- Add the parameters for the stored procedure here
	@requester_psno varchar(10),
	@program_type_name varchar(20),
	@training_purpose varchar(20),
	@room_name varchar(20),
	@start_date varchar(10),
	@end_date varchar(10),
	@no_of_participants int,
	@full_booking_status varchar(10),
	@booking_user_id int,
	@booking_date datetime,
	@booking_remarks varchar(100)
	
AS
BEGIN
	DECLARE @room_id int,
			@program_type_id int,
			@start_date_dt datetime,
			@end_date_dt datetime
			
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SET @start_date_dt=convert(datetime,@start_date,121)
	SET @end_date_dt=convert(datetime,@end_date,121)

	SELECT @room_id=room_id
	 FROM room_master
	WHERE room_name=@room_name

	SELECT @program_type_id=program_id
	 FROM program_type
	WHERE program_name=@program_type_name

	INSERT INTO BOOKING_DETAILS VALUES(@requester_psno,@program_type_id,@training_purpose,@room_id,@start_date_dt,@end_date_dt,@no_of_participants,@full_booking_status,@booking_user_id,@booking_date,@booking_remarks)
   
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PowerUserDurationReport]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[PowerUserDurationReport]
AS
SELECT DISTINCT 
                      dbo.Booking_Details.booking_id, dbo.Booking_Details.requester_psno, dbo.Requester_Details.requester_name, dbo.Bu_Details.bu_name, 
                      dbo.Program_Type.program_name, dbo.Booking_Details.training_purpose, dbo.Room_Master.room_name, dbo.City_Location_Details.city, 
                      dbo.City_Location_Details.location
FROM         dbo.City_Location_Details INNER JOIN
                      dbo.Room_Master ON dbo.City_Location_Details.city_location_id = dbo.Room_Master.city_location_id INNER JOIN
                      dbo.Booking_Schedule ON dbo.Room_Master.room_id = dbo.Booking_Schedule.room_id INNER JOIN
                      dbo.Booking_Details INNER JOIN
                      dbo.Requester_Details ON dbo.Booking_Details.requester_psno = dbo.Requester_Details.requester_psno INNER JOIN
                      dbo.Program_Type ON dbo.Booking_Details.program_type_id = dbo.Program_Type.program_id ON 
                      dbo.Booking_Schedule.booking_id = dbo.Booking_Details.booking_id INNER JOIN
                      dbo.Bu_Details ON dbo.Requester_Details.requester_bu_id = dbo.Bu_Details.bu_id
' 
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
         Begin Table = "City_Location_Details"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 193
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Room_Master"
            Begin Extent = 
               Top = 6
               Left = 231
               Bottom = 121
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Booking_Schedule"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 121
               Right = 626
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Booking_Details"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Requester_Details"
            Begin Extent = 
               Top = 126
               Left = 250
               Bottom = 241
               Right = 432
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Program_Type"
            Begin Extent = 
               Top = 126
               Left = 470
               Bottom = 211
               Right = 623
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Bu_Details"
            Begin Extent = 
               Top = 216
               Left = 470
               Bottom = 301
               Right = 6' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'PowerUserDurationReport'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'22
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
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'PowerUserDurationReport'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'PowerUserDurationReport'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PowerUserBuReport]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[PowerUserBuReport]
AS
SELECT DISTINCT 
                      dbo.Booking_Details.booking_id, dbo.Booking_Details.requester_psno, dbo.Requester_Details.requester_name, dbo.Booking_Details.start_date, 
                      dbo.Booking_Details.end_date, dbo.Program_Type.program_name, dbo.Booking_Details.training_purpose, dbo.Room_Master.room_name, 
                      dbo.City_Location_Details.city, dbo.City_Location_Details.location
FROM         dbo.City_Location_Details INNER JOIN
                      dbo.Room_Master ON dbo.City_Location_Details.city_location_id = dbo.Room_Master.city_location_id INNER JOIN
                      dbo.Booking_Schedule ON dbo.Room_Master.room_id = dbo.Booking_Schedule.room_id INNER JOIN
                      dbo.Booking_Details INNER JOIN
                      dbo.Requester_Details ON dbo.Booking_Details.requester_psno = dbo.Requester_Details.requester_psno INNER JOIN
                      dbo.Program_Type ON dbo.Booking_Details.program_type_id = dbo.Program_Type.program_id ON 
                      dbo.Booking_Schedule.booking_id = dbo.Booking_Details.booking_id
' 
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
         Begin Table = "Booking_Details"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Requester_Details"
            Begin Extent = 
               Top = 6
               Left = 452
               Bottom = 121
               Right = 634
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Room_Master"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Program_Type"
            Begin Extent = 
               Top = 65
               Left = 264
               Bottom = 150
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "City_Location_Details"
            Begin Extent = 
               Top = 126
               Left = 460
               Bottom = 241
               Right = 615
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Booking_Schedule"
            Begin Extent = 
               Top = 150
               Left = 269
               Bottom = 265
               Right = 433
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
   End
   Begin CriteriaPane = 
      Begin ColumnWi' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'PowerUserBuReport'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'dths = 11
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
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'PowerUserBuReport'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'PowerUserBuReport'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AdministratorBuReports]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[AdministratorBuReports]
AS
SELECT     dbo.Booking_Details.booking_id, dbo.Requester_Details.requester_psno, dbo.Requester_Details.requester_name, dbo.City_Location_Details.city, 
                      dbo.Program_Type.program_name, dbo.Booking_Details.start_date, dbo.Booking_Details.end_date, dbo.Booking_Details.training_purpose, 
                      dbo.Booking_Schedule.booking_status, dbo.Booking_Details.full_booking_status, dbo.Room_Master.room_name
FROM         dbo.Booking_Details INNER JOIN
                      dbo.Booking_Schedule ON dbo.Booking_Details.booking_id = dbo.Booking_Schedule.booking_id INNER JOIN
                      dbo.Program_Type ON dbo.Booking_Details.program_type_id = dbo.Program_Type.program_id INNER JOIN
                      dbo.Requester_Details ON dbo.Booking_Details.requester_psno = dbo.Requester_Details.requester_psno INNER JOIN
                      dbo.Room_Master ON dbo.Booking_Details.room_id = dbo.Room_Master.room_id INNER JOIN
                      dbo.City_Location_Details ON dbo.Room_Master.city_location_id = dbo.City_Location_Details.city_location_id INNER JOIN
                      dbo.Room_Type ON dbo.Room_Master.room_type_id = dbo.Room_Type.room_type_id INNER JOIN
                      dbo.User_Master ON dbo.Booking_Details.booking_user_id = dbo.User_Master.user_no AND 
                      dbo.Room_Master.location_coordinator_id = dbo.User_Master.user_no AND dbo.Room_Master.creator_id = dbo.User_Master.user_no AND 
                      dbo.Room_Master.update_id = dbo.User_Master.user_no AND dbo.City_Location_Details.city_location_id = dbo.User_Master.city_location_id
' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[60] 4[1] 2[20] 3) )"
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
         Begin Table = "Booking_Details"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Booking_Schedule"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 121
               Right = 414
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Program_Type"
            Begin Extent = 
               Top = 6
               Left = 452
               Bottom = 91
               Right = 605
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Requester_Details"
            Begin Extent = 
               Top = 96
               Left = 452
               Bottom = 211
               Right = 634
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Room_Master"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "City_Location_Details"
            Begin Extent = 
               Top = 126
               Left = 269
               Bottom = 241
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Room_Type"
            Begin Extent = 
               Top = 216
               Left = 462
               Bottom = 301
               Right = 627
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'AdministratorBuReports'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "User_Master"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 361
               Right = 193
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
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'AdministratorBuReports'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'AdministratorBuReports'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AdministratorDurationReports]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[AdministratorDurationReports]
AS
SELECT     dbo.Booking_Details.booking_id, dbo.Requester_Details.requester_psno, dbo.Requester_Details.requester_name, 
                      dbo.Booking_Details.training_purpose, dbo.Bu_Details.bu_name, dbo.Program_Type.program_name, dbo.Room_Master.room_name, 
                      dbo.Booking_Details.start_date, dbo.Booking_Details.end_date, dbo.Booking_Details.no_of_participants, dbo.City_Location_Details.city, 
                      dbo.Booking_Details.full_booking_status
FROM         dbo.Room_Master INNER JOIN
                      dbo.City_Location_Details ON dbo.Room_Master.city_location_id = dbo.City_Location_Details.city_location_id CROSS JOIN
                      dbo.Booking_Details INNER JOIN
                      dbo.Program_Type ON dbo.Booking_Details.program_type_id = dbo.Program_Type.program_id INNER JOIN
                      dbo.Requester_Details ON dbo.Booking_Details.requester_psno = dbo.Requester_Details.requester_psno INNER JOIN
                      dbo.Bu_Details ON dbo.Requester_Details.requester_bu_id = dbo.Bu_Details.bu_id
' 
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
         Begin Table = "Room_Master"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "City_Location_Details"
            Begin Extent = 
               Top = 6
               Left = 269
               Bottom = 121
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Booking_Details"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 121
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Program_Type"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 211
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Requester_Details"
            Begin Extent = 
               Top = 126
               Left = 229
               Bottom = 241
               Right = 411
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Bu_Details"
            Begin Extent = 
               Top = 126
               Left = 449
               Bottom = 211
               Right = 601
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = ' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'AdministratorDurationReports'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'11
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
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'AdministratorDurationReports'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'AdministratorDurationReports'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AdministratorProgramReports]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[AdministratorProgramReports]
AS
SELECT     dbo.Booking_Details.requester_psno, dbo.Booking_Details.training_purpose, dbo.Booking_Details.start_date, dbo.Booking_Details.end_date, 
                      dbo.Booking_Details.no_of_participants, dbo.Booking_Details.full_booking_status, dbo.Booking_Schedule.booking_status, dbo.Bu_Details.bu_name, 
                      dbo.City_Location_Details.city, dbo.Room_Master.room_name, dbo.Requester_Details.requester_psno AS Expr1, 
                      dbo.Requester_Details.requester_name
FROM         dbo.Booking_Details INNER JOIN
                      dbo.Booking_Schedule ON dbo.Booking_Details.booking_id = dbo.Booking_Schedule.booking_id INNER JOIN
                      dbo.Requester_Details ON dbo.Booking_Details.requester_psno = dbo.Requester_Details.requester_psno INNER JOIN
                      dbo.Bu_Details ON dbo.Requester_Details.requester_bu_id = dbo.Bu_Details.bu_id INNER JOIN
                      dbo.Room_Master ON dbo.Booking_Details.room_id = dbo.Room_Master.room_id INNER JOIN
                      dbo.City_Location_Details ON dbo.Room_Master.city_location_id = dbo.City_Location_Details.city_location_id
' 
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
         Begin Table = "Booking_Details"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "Booking_Schedule"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 121
               Right = 414
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Bu_Details"
            Begin Extent = 
               Top = 6
               Left = 452
               Bottom = 91
               Right = 604
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "City_Location_Details"
            Begin Extent = 
               Top = 96
               Left = 452
               Bottom = 211
               Right = 607
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Requester_Details"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Room_Master"
            Begin Extent = 
               Top = 126
               Left = 258
               Bottom = 241
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 9
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
      Begin ColumnWidths ' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'AdministratorProgramReports'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 11
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
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'AdministratorProgramReports'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'AdministratorProgramReports'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[checkAvailability]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- =============================================
-- Author:		<Ragini>
-- Create date: <12/03/2012>
-- Description:	<check availabuilty of rooms>
-- =============================================
CREATE PROCEDURE [dbo].[checkAvailability]
	@room_type_name varchar(20),
	@city varchar(20),
	@location varchar(20),
	@no_of_participants int,
	@start_date varchar(10),
	@end_date varchar(10),
	@start_time varchar(12),
	@end_time varchar(12)
	
AS
BEGIN
	--variable declaration
	DECLARE @count_q1 int,
			@count_q2 int,
			@count int,
			@current_date datetime,
			@room_type_id int,
			@start_date_dt datetime,
			@end_date_dt datetime,
			@current_date_dt datetime,
			@full_start_time datetime,
			@full_end_time datetime
			

	--getting the room_type_id
	SELECT @room_type_id=room_type_id
	  FROM room_type
	 WHERE room_type_name=@room_type_name


	--converting the varchar to datetime
	SET @current_date=@start_date
	/*SET @full_start_time=convert(datetime,(@current_date+'' ''+@start_time),121)
	SET @full_end_time=convert(datetime,(@current_date+'' ''+@end_time),121)*/
	SET @start_date_dt=convert(datetime,@start_date,121)
	SET @end_date_dt=convert(datetime,@start_date,121)
	SET @current_date_dt=convert(datetime,@start_date,121)
	
	--checking if any room is available and not booked for any days
	SELECT @count_q1=count(distinct room_id)
	  from room_master 
	 where city_location_id in (SELECT city_location_id
	   							  FROM city_location_details
								 WHERE city=@city
								   and location=@location)
								   and room_type_id=@room_type_id
								   and (seating_capacity>=@no_of_participants or max_no_of_persons>=@no_of_participants)
								   and room_id not in(select room_id
														from booking_details
														where full_booking_status!=''CANCELLED'')

			--if no rooms are available check for rooms that are booked but available for that time
			IF(@count_q1=0)
				BEGIN
					WHILE(@current_date_dt!=@end_date_dt)
						BEGIN
							SET @full_start_time=convert(datetime,(@current_date+'' ''+@start_time),121)
							SET @full_end_time=convert(datetime,(@current_date+'' ''+@end_time),121)
							
							--if multiday booking
							IF(@start_date_dt!=@end_date_dt)
								BEGIN
									select @count_q2=count(distinct room_id)
									from room_master
									where city_location_id in (SELECT city_location_id
																FROM city_location_details
																WHERE city=@city
																  and location=@location)
									  and room_type_id=@room_type_id
									  and (seating_capacity>=@no_of_participants or max_no_of_persons>=@no_of_participants)
									  and room_id in (select room_id
														 from booking_details
														 where booking_id not in (select distinct booking_id
																				    from booking_schedule
																				   where booking_status!=''CANCELLED''
																				  and booked_for_date=@current_date_dt
																				  and ((start_time>=@full_start_time and start_time>=@full_end_time)
																				   or (end_time<=@full_start_time and end_time<=@full_end_time)))
															and	((start_date>@start_date_dt and start_date>@end_date_dt)
															 or (end_date<@start_date_dt and end_date<@end_date_dt)))

									
								END
							--single day booking
							ELSE
								BEGIN
									select @count_q2=count(distinct room_id)
									from room_master
									where city_location_id in (SELECT city_location_id
																FROM city_location_details
																WHERE city=@city
																  and location=@location)

									 and room_type_id=@room_type_id
									 and (seating_capacity>=@no_of_participants or max_no_of_persons>=@no_of_participants)
									 and room_id in (select room_id
													   from booking_details
													  where booking_id in (select distinct booking_id
																			 from booking_schedule
																			where booking_status!=''CANCELLED''
																			  and booked_for_date=@current_date_dt
																			  and ((start_time>=@full_start_time and start_time>=@full_end_time)
																			   or (end_time<=@full_start_time and end_time<=@full_end_time))))
														
								END

						SET @current_date_dt=@current_date_dt+1
					END
				END					   
		
	--reset current date
	SET @current_date_dt=@start_date_dt

	--if room found that is fully available
	IF(@count_q1>0)
		BEGIN
			SELECT distinct room_name
			from room_master 
			where city_location_id in (SELECT city_location_id
										FROM city_location_details
										WHERE city=@city
										  and location=@location)
										  and room_type_id=@room_type_id
										  and (seating_capacity>=@no_of_participants or max_no_of_persons>=@no_of_participants)
										  and room_id not in(select room_id
															   from booking_details
															  where full_booking_status!=''CANCELLED'')
		END
	--else check for rooms that are booked but available for that time
	ELSE IF(@count_q2>0)
		BEGIN
			WHILE(@current_date_dt<=@end_date_dt)
				BEGIN
						
					SET @full_start_time=convert(datetime,(@current_date+'' ''+@start_time),121)
					SET @full_end_time=convert(datetime,(@current_date+'' ''+@end_time),121)

					IF(@start_date_dt!=@end_date_dt)
								BEGIN
									select distinct room_name
									from room_master
									where city_location_id in (SELECT city_location_id
																FROM city_location_details
																WHERE city=@city
																  and location=@location)
									  and room_type_id=@room_type_id
									  and (seating_capacity>=@no_of_participants or max_no_of_persons>=@no_of_participants)
									  and room_id in (select room_id
														 from booking_details
														 where booking_id not in (select distinct booking_id
																				 from booking_schedule
																				where booking_status!=''CANCELLED''
																				  and booked_for_date=@current_date_dt
																				  and ((start_time>=@full_start_time and start_time>=@full_end_time)
																				   or (end_time<=@full_start_time and end_time<=@full_end_time)))
															and	((start_date>@start_date_dt and start_date>@end_date_dt)
															 or (end_date<@start_date_dt and end_date<@end_date_dt)))

									
								END
							ELSE
								BEGIN
									select distinct room_name
									from room_master
									where city_location_id in (SELECT city_location_id
																FROM city_location_details
																WHERE city=@city
																  and location=@location)
									 and room_type_id=@room_type_id
									 and (seating_capacity>=@no_of_participants or max_no_of_persons>=@no_of_participants)
									 and room_id in (select room_id
													   from booking_details
													  where booking_id in (select distinct booking_id
																			 from booking_schedule
																			where booking_status!=''CANCELLED''
																			  and booked_for_date=@current_date_dt
																			  and ((start_time>=@full_start_time and start_time>=@full_end_time)
																			   or (end_time<=@full_start_time and end_time<=@full_end_time))))
														
								END

					SET @current_date_dt=@current_date_dt+1
				END
		END
	ELSE
			BEGIN
				SELECT ''No Rooms''
			END
END








' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[View_Booking_Schedule]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[View_Booking_Schedule]
AS
SELECT     dbo.Booking_Schedule.schedule_id, dbo.Booking_Details.requester_psno, dbo.Requester_Details.requester_name, 
                      dbo.Requester_Details.requester_bu_id, dbo.Booking_Schedule.booked_for_date, dbo.Booking_Schedule.start_time, dbo.Booking_Schedule.end_time, 
                      dbo.Booking_Details.booking_id, dbo.Requester_Details.requester_email
FROM         dbo.Booking_Details INNER JOIN
                      dbo.Booking_Schedule ON dbo.Booking_Details.booking_id = dbo.Booking_Schedule.booking_id INNER JOIN
                      dbo.Requester_Details ON dbo.Booking_Details.requester_psno = dbo.Requester_Details.requester_psno
WHERE     (dbo.Booking_Schedule.booking_status = ''TENTATIVE'')
' 
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
         Begin Table = "Booking_Details"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Booking_Schedule"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 121
               Right = 414
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Requester_Details"
            Begin Extent = 
               Top = 6
               Left = 452
               Bottom = 121
               Right = 634
            End
            DisplayFlags = 280
            TopColumn = 1
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
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'View_Booking_Schedule'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'View_Booking_Schedule'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SuperAdministratorProgramReports]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[SuperAdministratorProgramReports]
AS
SELECT     dbo.Booking_Details.requester_psno AS requestor_psno, dbo.Booking_Details.training_purpose, dbo.Booking_Details.start_date, 
                      dbo.Booking_Details.end_date, dbo.Booking_Details.no_of_participants, dbo.Booking_Details.full_booking_status, 
                      dbo.Booking_Schedule.booking_status, dbo.Bu_Details.bu_name, dbo.City_Location_Details.city, dbo.City_Location_Details.location, 
                      dbo.Room_Master.room_name, dbo.Requester_Details.requester_psno AS Expr1, dbo.Requester_Details.requester_name, 
                      dbo.Booking_Details.booking_id
FROM         dbo.Booking_Details INNER JOIN
                      dbo.Booking_Schedule ON dbo.Booking_Details.booking_id = dbo.Booking_Schedule.booking_id INNER JOIN
                      dbo.Requester_Details ON dbo.Booking_Details.requester_psno = dbo.Requester_Details.requester_psno INNER JOIN
                      dbo.Bu_Details ON dbo.Requester_Details.requester_bu_id = dbo.Bu_Details.bu_id INNER JOIN
                      dbo.Room_Master ON dbo.Booking_Details.room_id = dbo.Room_Master.room_id INNER JOIN
                      dbo.City_Location_Details ON dbo.Room_Master.city_location_id = dbo.City_Location_Details.city_location_id
' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[5] 2[25] 3) )"
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
         Begin Table = "Booking_Details"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Booking_Schedule"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 121
               Right = 414
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Requester_Details"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Bu_Details"
            Begin Extent = 
               Top = 6
               Left = 452
               Bottom = 91
               Right = 604
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Room_Master"
            Begin Extent = 
               Top = 126
               Left = 258
               Bottom = 241
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "City_Location_Details"
            Begin Extent = 
               Top = 96
               Left = 452
               Bottom = 211
               Right = 607
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
      Begin ColumnWidths = 15
         Width = 284
       ' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'SuperAdministratorProgramReports'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'SuperAdministratorProgramReports'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'SuperAdministratorProgramReports'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PowerUserProgramReoprt]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[PowerUserProgramReoprt]
AS
SELECT DISTINCT 
                      dbo.Booking_Details.booking_id, dbo.Booking_Details.requester_psno, dbo.Requester_Details.requester_name, dbo.Booking_Details.start_date, 
                      dbo.Booking_Details.end_date, dbo.Bu_Details.bu_name, dbo.Booking_Details.training_purpose, dbo.Room_Master.room_name, 
                      dbo.City_Location_Details.city, dbo.City_Location_Details.location
FROM         dbo.City_Location_Details INNER JOIN
                      dbo.Room_Master ON dbo.City_Location_Details.city_location_id = dbo.Room_Master.city_location_id INNER JOIN
                      dbo.Booking_Schedule ON dbo.Room_Master.room_id = dbo.Booking_Schedule.room_id INNER JOIN
                      dbo.Booking_Details INNER JOIN
                      dbo.Requester_Details ON dbo.Booking_Details.requester_psno = dbo.Requester_Details.requester_psno ON 
                      dbo.Booking_Schedule.booking_id = dbo.Booking_Details.booking_id INNER JOIN
                      dbo.Bu_Details ON dbo.Requester_Details.requester_bu_id = dbo.Bu_Details.bu_id
' 
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
         Begin Table = "City_Location_Details"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 193
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Room_Master"
            Begin Extent = 
               Top = 6
               Left = 231
               Bottom = 121
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Booking_Schedule"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 121
               Right = 626
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Booking_Details"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Requester_Details"
            Begin Extent = 
               Top = 126
               Left = 250
               Bottom = 241
               Right = 432
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Bu_Details"
            Begin Extent = 
               Top = 126
               Left = 470
               Bottom = 211
               Right = 622
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidth' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'PowerUserProgramReoprt'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N's = 11
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
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'PowerUserProgramReoprt'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'PowerUserProgramReoprt'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Authentication]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Authentication]
AS
SELECT     user_no, login_psno, password, role_type, first_login, full_name, del_flag
FROM         dbo.User_Master
' 
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
         Begin Table = "User_Master"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 193
            End
            DisplayFlags = 280
            TopColumn = 8
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
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'Authentication'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'Authentication'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addBooking_Schedule]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		<Ragini>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addBooking_Schedule]
	-- Add the parameters for the stored procedure here
	@booking_id int,
	@start_date varchar(10),
	@end_date varchar(10),
	@start_time varchar(12),
	@end_time varchar(12),
	@booking_status varchar(10)
AS
BEGIN

	DECLARE @current_date varchar(10),
			@current_date_dt datetime,
			@start_date_dt datetime,
			@end_date_dt datetime,
			@full_start_time datetime,
			@full_end_time datetime
			
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SET @current_date=@start_date

	SET @current_date_dt=convert(datetime,@current_date,121)	
	SET @start_date_dt=convert(datetime,@start_date,121)
	SET @end_date_dt=convert(datetime,@end_date,121)
    
	WHILE (@current_date_dt<=@end_date_dt)
	BEGIN	

		SET @full_start_time=convert(datetime,@current_date+'' ''+@start_time,121)
		SET @full_end_time=convert(datetime,@current_date+'' ''+@end_time,121)						
		
		INSERT INTO BOOKING_SCHEDULE values(@booking_id,@current_date_dt,@full_start_time,@full_end_time,@booking_status)
		SET @current_date_dt=@current_date_dt+1
	END

END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SuperAdministratorDurationReports]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[SuperAdministratorDurationReports]
AS
SELECT     dbo.AdministratorDurationReports.booking_id, dbo.User_Master.login_psno, dbo.User_Master.full_name, dbo.City_Location_Details.location, 
                      dbo.AdministratorDurationReports.city, dbo.AdministratorDurationReports.requester_psno, dbo.AdministratorDurationReports.requester_name, 
                      dbo.AdministratorDurationReports.bu_name, dbo.AdministratorDurationReports.room_name, dbo.AdministratorDurationReports.program_name, 
                      dbo.AdministratorDurationReports.training_purpose, dbo.AdministratorDurationReports.start_date, dbo.AdministratorDurationReports.end_date, 
                      dbo.AdministratorDurationReports.no_of_participants, dbo.Booking_Schedule.booking_status, 
                      dbo.AdministratorDurationReports.full_booking_status
FROM         dbo.AdministratorDurationReports INNER JOIN
                      dbo.Booking_Details ON dbo.AdministratorDurationReports.booking_id = dbo.Booking_Details.booking_id INNER JOIN
                      dbo.User_Master ON dbo.Booking_Details.booking_user_id = dbo.User_Master.user_no INNER JOIN
                      dbo.City_Location_Details ON dbo.User_Master.city_location_id = dbo.City_Location_Details.city_location_id INNER JOIN
                      dbo.Booking_Schedule ON dbo.Booking_Details.booking_id = dbo.Booking_Schedule.booking_id
' 
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
         Begin Table = "Booking_Details"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 121
               Right = 402
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "User_Master"
            Begin Extent = 
               Top = 6
               Left = 440
               Bottom = 121
               Right = 595
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "City_Location_Details"
            Begin Extent = 
               Top = 66
               Left = 38
               Bottom = 181
               Right = 193
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Booking_Schedule"
            Begin Extent = 
               Top = 126
               Left = 231
               Bottom = 241
               Right = 395
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AdministratorDurationReports"
            Begin Extent = 
               Top = 126
               Left = 433
               Bottom = 241
               Right = 607
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
 ' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'SuperAdministratorDurationReports'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'SuperAdministratorDurationReports'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'SuperAdministratorDurationReports'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SuperAdministratorBuReports]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[SuperAdministratorBuReports]
AS
SELECT     dbo.AdministratorBuReports.booking_id, dbo.User_Master.login_psno, dbo.User_Master.full_name, dbo.AdministratorBuReports.requester_psno, 
                      dbo.AdministratorBuReports.requester_name, dbo.AdministratorBuReports.city, dbo.City_Location_Details.location, 
                      dbo.AdministratorBuReports.room_name, dbo.AdministratorBuReports.program_name, dbo.AdministratorBuReports.training_purpose, 
                      dbo.AdministratorBuReports.start_date, dbo.AdministratorBuReports.end_date, dbo.AdministratorBuReports.booking_status, 
                      dbo.AdministratorBuReports.full_booking_status
FROM         dbo.AdministratorBuReports INNER JOIN
                      dbo.Booking_Details ON dbo.AdministratorBuReports.booking_id = dbo.Booking_Details.booking_id INNER JOIN
                      dbo.User_Master ON dbo.Booking_Details.booking_user_id = dbo.User_Master.user_no INNER JOIN
                      dbo.Cancellation_Details ON dbo.User_Master.user_no = dbo.Cancellation_Details.cancellation_user_id INNER JOIN
                      dbo.City_Location_Details ON dbo.User_Master.city_location_id = dbo.City_Location_Details.city_location_id
' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[20] 3) )"
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
         Begin Table = "Booking_Details"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 121
               Right = 402
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "User_Master"
            Begin Extent = 
               Top = 6
               Left = 440
               Bottom = 121
               Right = 595
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cancellation_Details"
            Begin Extent = 
               Top = 66
               Left = 38
               Bottom = 181
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "City_Location_Details"
            Begin Extent = 
               Top = 126
               Left = 257
               Bottom = 241
               Right = 412
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AdministratorBuReports"
            Begin Extent = 
               Top = 126
               Left = 450
               Bottom = 241
               Right = 624
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
   ' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'SuperAdministratorBuReports'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'SuperAdministratorBuReports'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'SuperAdministratorBuReports'

GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Facility]') AND parent_object_id = OBJECT_ID(N'[dbo].[Facility]'))
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [CK_Facility] CHECK  (([facility_type]='CHARACTER' OR [facility_type]='NUMERIC'))
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Room_Facilities_Facility1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Room_Facilities]'))
ALTER TABLE [dbo].[Room_Facilities]  WITH CHECK ADD  CONSTRAINT [FK_Room_Facilities_Facility1] FOREIGN KEY([facility_id])
REFERENCES [dbo].[Facility] ([facility_id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Room_Facilities_Room_Master]') AND parent_object_id = OBJECT_ID(N'[dbo].[Room_Facilities]'))
ALTER TABLE [dbo].[Room_Facilities]  WITH CHECK ADD  CONSTRAINT [FK_Room_Facilities_Room_Master] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room_Master] ([room_id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Booking_Details_Program_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[Booking_Details]'))
ALTER TABLE [dbo].[Booking_Details]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Details_Program_Type] FOREIGN KEY([program_type_id])
REFERENCES [dbo].[Program_Type] ([program_id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Booking_Details_Requester_Details]') AND parent_object_id = OBJECT_ID(N'[dbo].[Booking_Details]'))
ALTER TABLE [dbo].[Booking_Details]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Details_Requester_Details] FOREIGN KEY([requester_psno])
REFERENCES [dbo].[Requester_Details] ([requester_psno])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Booking_Details_Room_Master_Room_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[Booking_Details]'))
ALTER TABLE [dbo].[Booking_Details]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Details_Room_Master_Room_id] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room_Master] ([room_id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Booking_Details_User_Master]') AND parent_object_id = OBJECT_ID(N'[dbo].[Booking_Details]'))
ALTER TABLE [dbo].[Booking_Details]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Details_User_Master] FOREIGN KEY([booking_user_id])
REFERENCES [dbo].[User_Master] ([user_no])
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Booking_Details]') AND parent_object_id = OBJECT_ID(N'[dbo].[Booking_Details]'))
ALTER TABLE [dbo].[Booking_Details]  WITH CHECK ADD  CONSTRAINT [CK_Booking_Details] CHECK  (([full_booking_status]='CANCELLED' OR [full_booking_status]='TENTATIVE' OR [full_booking_status]='CONFIRMED'))
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Booking_Schedule_Booking_Details1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Booking_Schedule]'))
ALTER TABLE [dbo].[Booking_Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Schedule_Booking_Details1] FOREIGN KEY([booking_id])
REFERENCES [dbo].[Booking_Details] ([booking_id])
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Booking_Schedule]') AND parent_object_id = OBJECT_ID(N'[dbo].[Booking_Schedule]'))
ALTER TABLE [dbo].[Booking_Schedule]  WITH CHECK ADD  CONSTRAINT [CK_Booking_Schedule] CHECK  (([booking_status]='CANCELLED' OR [booking_status]='CONFIRMED' OR [booking_status]='TENTATIVE'))
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Master_City_Location_Details]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Master]'))
ALTER TABLE [dbo].[User_Master]  WITH CHECK ADD  CONSTRAINT [FK_User_Master_City_Location_Details] FOREIGN KEY([city_location_id])
REFERENCES [dbo].[City_Location_Details] ([city_location_id])
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_User_Master_3]') AND parent_object_id = OBJECT_ID(N'[dbo].[User_Master]'))
ALTER TABLE [dbo].[User_Master]  WITH CHECK ADD  CONSTRAINT [CK_User_Master_3] CHECK  (([role_type]='PU' OR [role_type]='AD' OR [role_type]='SA' OR [role_type]='DEF'))
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Room_Master_City_Location_Details]') AND parent_object_id = OBJECT_ID(N'[dbo].[Room_Master]'))
ALTER TABLE [dbo].[Room_Master]  WITH CHECK ADD  CONSTRAINT [FK_Room_Master_City_Location_Details] FOREIGN KEY([city_location_id])
REFERENCES [dbo].[City_Location_Details] ([city_location_id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Room_Master_Room_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[Room_Master]'))
ALTER TABLE [dbo].[Room_Master]  WITH CHECK ADD  CONSTRAINT [FK_Room_Master_Room_Type] FOREIGN KEY([room_type_id])
REFERENCES [dbo].[Room_Type] ([room_type_id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Room_Master_User_Master]') AND parent_object_id = OBJECT_ID(N'[dbo].[Room_Master]'))
ALTER TABLE [dbo].[Room_Master]  WITH CHECK ADD  CONSTRAINT [FK_Room_Master_User_Master] FOREIGN KEY([location_coordinator_id])
REFERENCES [dbo].[User_Master] ([user_no])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Room_Master_User_Master1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Room_Master]'))
ALTER TABLE [dbo].[Room_Master]  WITH CHECK ADD  CONSTRAINT [FK_Room_Master_User_Master1] FOREIGN KEY([update_id])
REFERENCES [dbo].[User_Master] ([user_no])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Room_Master_User_Master2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Room_Master]'))
ALTER TABLE [dbo].[Room_Master]  WITH CHECK ADD  CONSTRAINT [FK_Room_Master_User_Master2] FOREIGN KEY([creator_id])
REFERENCES [dbo].[User_Master] ([user_no])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Requester_Details_Bu_Details]') AND parent_object_id = OBJECT_ID(N'[dbo].[Requester_Details]'))
ALTER TABLE [dbo].[Requester_Details]  WITH CHECK ADD  CONSTRAINT [FK_Requester_Details_Bu_Details] FOREIGN KEY([requester_bu_id])
REFERENCES [dbo].[Bu_Details] ([bu_id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cancellation_Details_Cancellation_Details]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cancellation_Details]'))
ALTER TABLE [dbo].[Cancellation_Details]  WITH CHECK ADD  CONSTRAINT [FK_Cancellation_Details_Cancellation_Details] FOREIGN KEY([schedule_id])
REFERENCES [dbo].[Booking_Schedule] ([schedule_id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cancellation_Details_User_Master]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cancellation_Details]'))
ALTER TABLE [dbo].[Cancellation_Details]  WITH CHECK ADD  CONSTRAINT [FK_Cancellation_Details_User_Master] FOREIGN KEY([cancellation_user_id])
REFERENCES [dbo].[User_Master] ([user_no])
