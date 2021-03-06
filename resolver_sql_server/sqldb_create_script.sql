CREATE DATABASE [gs1-resolver-ce-v2-db]
GO

USE [gs1-resolver-ce-v2-db]
GO
/****** Object:  Table [dbo].[gcp_redirects]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gcp_redirects](
          [gcp_redirect_id] [bigint] IDENTITY(1,1) NOT NULL,
          [member_primary_gln] [nchar](13) NOT NULL,
          [gs1_key_code] [nvarchar](20) NOT NULL,
          [gs1_gcp_value] [nvarchar](45) NOT NULL,
          [target_url] [nvarchar](1024) NOT NULL,
          [active] [bit] NOT NULL,
          [flagged_for_deletion] [bit] NOT NULL,
          [date_inserted] [datetime] NOT NULL,
          [date_last_updated] [datetime] NOT NULL,
          CONSTRAINT [PK_gcp_resolves] PRIMARY KEY CLUSTERED
              (
               [gcp_redirect_id] ASC
                  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[resolver_auth]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resolver_auth](
          [auth_id] [bigint] IDENTITY(1,1) NOT NULL,
          [member_primary_gln] [nchar](13) NOT NULL,
          [account_name] [nvarchar](255) NOT NULL,
          [authentication_key] [nchar](64) NOT NULL,
          CONSTRAINT [PK_resolver_auth] PRIMARY KEY CLUSTERED
              (
               [auth_id] ASC
                  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[server_sync_register]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[server_sync_register](
         [resolver_sync_server_id] [nchar](12) NOT NULL,
         [last_heard_datetime] [datetime] NOT NULL,
         CONSTRAINT [PK_server_sync_register_table] PRIMARY KEY CLUSTERED
             (
              [resolver_sync_server_id] ASC
                 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[uri_requests]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uri_requests](
         [uri_request_id] [bigint] IDENTITY(1,1) NOT NULL,
         [member_primary_gln] [nchar](13) NOT NULL,
         [gs1_key_code] [nvarchar](20) NOT NULL,
         [gs1_key_value] [nvarchar](45) NOT NULL,
         [item_description] [nvarchar](2000) NOT NULL,
         [date_inserted] [datetime] NOT NULL,
         [date_last_updated] [datetime] NOT NULL,
         [variant_uri] [nvarchar](255) NOT NULL,
         [active] [bit] NOT NULL,
         [flagged_for_deletion] [bit] NOT NULL,
         CONSTRAINT [PK_uri_requests_uri_request_id] PRIMARY KEY CLUSTERED
             (
              [uri_request_id] ASC
                 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[uri_responses]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uri_responses](
          [uri_response_id] [bigint] IDENTITY(1,1) NOT NULL,
          [uri_request_id] [bigint] NOT NULL,
          [linktype] [nvarchar](100) NOT NULL,
          [iana_language] [nchar](2) NOT NULL,
          [context] [nvarchar](100) NOT NULL,
          [mime_type] [nvarchar](45) NOT NULL,
          [link_title] [nvarchar](100) NOT NULL,
          [target_url] [nvarchar](1024) NOT NULL,
          [default_linktype] [bit] NOT NULL,
          [default_iana_language] [bit] NOT NULL,
          [default_context] [bit] NOT NULL,
          [default_mime_type] [bit] NOT NULL,
          [forward_request_querystrings] [bit] NOT NULL,
          [active] [bit] NOT NULL,
          [flagged_for_deletion] [bit] NOT NULL,
          [date_inserted] [datetime] NOT NULL,
          [date_last_updated] [datetime] NOT NULL,
          CONSTRAINT [PK_uri_responses_uri_response_id] PRIMARY KEY CLUSTERED
              (
               [uri_response_id] ASC
                  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[gcp_redirects] ON
GO
INSERT [dbo].[gcp_redirects] ([gcp_redirect_id], [member_primary_gln], [gs1_key_code], [gs1_gcp_value], [target_url], [active], [flagged_for_deletion], [date_inserted], [date_last_updated]) VALUES (4, N'7612345000008', N'01', N'076', N'https://id.gs1.ch', 1, 0, CAST(N'2020-04-14T13:57:17.040' AS DateTime), CAST(N'2020-04-14T13:57:17.040' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[gcp_redirects] OFF
GO
SET IDENTITY_INSERT [dbo].[resolver_auth] ON
GO
INSERT [dbo].[resolver_auth] ([auth_id], [member_primary_gln], [account_name], [authentication_key]) VALUES (1, N'1111111111111', N'Demo Account', N'12345                                                           ')
GO
SET IDENTITY_INSERT [dbo].[resolver_auth] OFF
GO
INSERT [dbo].[server_sync_register] ([resolver_sync_server_id], [last_heard_datetime]) VALUES (N'BOv0yHw7fTBr', CAST(N'2020-04-20T16:47:37.640' AS DateTime))
GO
INSERT [dbo].[server_sync_register] ([resolver_sync_server_id], [last_heard_datetime]) VALUES (N'CmWfbTt7CkWU', CAST(N'2020-04-20T16:29:03.120' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[uri_requests] ON
GO
INSERT [dbo].[uri_requests] ([uri_request_id], [member_primary_gln], [gs1_key_code], [gs1_key_value], [item_description], [date_inserted], [date_last_updated], [variant_uri], [active], [flagged_for_deletion]) VALUES (79485, N'1111111111111', N'01', N'05052004033992', N'[]VGVzY28gSGVhbHRoIENhbGNpdW0gYW5kIFZpdGFtaW4gRCAtIDkwIHRhYmxldHM=', CAST(N'2020-04-20T16:24:21.620' AS DateTime), CAST(N'2020-04-20T16:44:58.843' AS DateTime), N'/', 1, 0)
GO
INSERT [dbo].[uri_requests] ([uri_request_id], [member_primary_gln], [gs1_key_code], [gs1_key_value], [item_description], [date_inserted], [date_last_updated], [variant_uri], [active], [flagged_for_deletion]) VALUES (79486, N'1111111111111', N'01', N'05052004033992', N'[]VGVzY28gSGVhbHRoIENhbGNpdW0gYW5kIFZpdGFtaW4gRCAtIDkwIHRhYmxldHMgLSBCYXRjaCBCTiAyMjY0NzA=', CAST(N'2020-04-20T16:24:21.710' AS DateTime), CAST(N'2020-04-20T16:44:58.963' AS DateTime), N'/lot/BN226470', 1, 0)
GO
INSERT [dbo].[uri_requests] ([uri_request_id], [member_primary_gln], [gs1_key_code], [gs1_key_value], [item_description], [date_inserted], [date_last_updated], [variant_uri], [active], [flagged_for_deletion]) VALUES (79487, N'1111111111111', N'01', N'05000204795370', N'[]UkFJRCBGbHkgJiBXYXNwIEtpbGxlciAzMDBtbA==', CAST(N'2020-04-20T16:44:59.010' AS DateTime), CAST(N'2020-04-20T16:44:59.010' AS DateTime), N'/', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[uri_requests] OFF
GO
SET IDENTITY_INSERT [dbo].[uri_responses] ON
GO
INSERT [dbo].[uri_responses] ([uri_response_id], [uri_request_id], [linktype], [iana_language], [context], [mime_type], [link_title], [target_url], [default_linktype], [default_iana_language], [default_context], [default_mime_type], [forward_request_querystrings], [active], [flagged_for_deletion], [date_inserted], [date_last_updated]) VALUES (38, 79485, N'https://gs1.org/voc/pip', N'en', N'gb', N'text/html', N'[]VGVzY28uY29tIFNhbGVzIFBhZ2U=', N'https://www.tesco.com/groceries/en-GB/products/273236303', 1, 1, 1, 1, 1, 1, 0, CAST(N'2020-04-20T16:24:21.687' AS DateTime), CAST(N'2020-04-20T16:44:58.920' AS DateTime))
GO
INSERT [dbo].[uri_responses] ([uri_response_id], [uri_request_id], [linktype], [iana_language], [context], [mime_type], [link_title], [target_url], [default_linktype], [default_iana_language], [default_context], [default_mime_type], [forward_request_querystrings], [active], [flagged_for_deletion], [date_inserted], [date_last_updated]) VALUES (39, 79486, N'https://gs1.org/voc/leaveReview', N'en', N'gb', N'text/html', N'[]TGVhdmUgYSByZXZpZXcgb24gQmF0Y2ggQk4gMjI2NDc', N'https://www.tesco.com/groceries/en-GB/reviews/submission/273236303?from=%2Fproducts%2F273236303', 1, 1, 1, 1, 1, 1, 0, CAST(N'2020-04-20T16:44:58.983' AS DateTime), CAST(N'2020-04-20T16:44:58.983' AS DateTime))
GO
INSERT [dbo].[uri_responses] ([uri_response_id], [uri_request_id], [linktype], [iana_language], [context], [mime_type], [link_title], [target_url], [default_linktype], [default_iana_language], [default_context], [default_mime_type], [forward_request_querystrings], [active], [flagged_for_deletion], [date_inserted], [date_last_updated]) VALUES (40, 79487, N'https://gs1.org/voc/promotion', N'en', N'gb', N'text/html', N'[]U2FpbnNidXJ5cyBQcm9tb3Rpb24=', N'https://www.sainsburys.co.uk/gol-ui/product/raid-fly---wasp-killer-300ml', 1, 1, 1, 1, 1, 1, 0, CAST(N'2020-04-20T16:44:59.030' AS DateTime), CAST(N'2020-04-20T16:44:59.030' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[uri_responses] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_gcp_resolves]    Script Date: 20/04/2020 17:47:39 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_gcp_resolves] ON [dbo].[gcp_redirects]
    (
     [gs1_key_code] ASC,
     [gs1_gcp_value] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Table_authentication_key]    Script Date: 20/04/2020 17:47:39 ******/
ALTER TABLE [dbo].[resolver_auth] ADD  CONSTRAINT [IX_Table_authentication_key] UNIQUE NONCLUSTERED
    (
     [authentication_key] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_uri_responses_unique_constraint_index]    Script Date: 20/04/2020 17:47:39 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_uri_responses_unique_constraint_index] ON [dbo].[uri_responses]
    (
     [uri_request_id] ASC,
     [linktype] ASC,
     [iana_language] ASC,
     [context] ASC,
     [mime_type] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[gcp_redirects] ADD  CONSTRAINT [DF_gcp_resolves_active]  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[gcp_redirects] ADD  CONSTRAINT [DF_gcp_resolves_marked_for_deletion]  DEFAULT ((0)) FOR [flagged_for_deletion]
GO
ALTER TABLE [dbo].[gcp_redirects] ADD  CONSTRAINT [DF_gcp_redirects_date_inserted]  DEFAULT (getutcdate()) FOR [date_inserted]
GO
ALTER TABLE [dbo].[gcp_redirects] ADD  CONSTRAINT [DF_gcp_redirects_date_last_updated]  DEFAULT (getutcdate()) FOR [date_last_updated]
GO
ALTER TABLE [dbo].[server_sync_register] ADD  CONSTRAINT [DF_server_sync_register_table_last_heard_unixtime]  DEFAULT (getutcdate()) FOR [last_heard_datetime]
GO
ALTER TABLE [dbo].[uri_requests] ADD  CONSTRAINT [DF__uri_reque__membe__236943A5]  DEFAULT ('') FOR [member_primary_gln]
GO
ALTER TABLE [dbo].[uri_requests] ADD  CONSTRAINT [DF__uri_reque__gs1_k__245D67DE]  DEFAULT ('') FOR [gs1_key_code]
GO
ALTER TABLE [dbo].[uri_requests] ADD  CONSTRAINT [DF__uri_reque__gs1_k__25518C17]  DEFAULT ('') FOR [gs1_key_value]
GO
ALTER TABLE [dbo].[uri_requests] ADD  CONSTRAINT [DF__uri_reque__item___2645B050]  DEFAULT ('NEW') FOR [item_description]
GO
ALTER TABLE [dbo].[uri_requests] ADD  CONSTRAINT [DF__uri_reque__date___2739D489]  DEFAULT (getutcdate()) FOR [date_inserted]
GO
ALTER TABLE [dbo].[uri_requests] ADD  CONSTRAINT [DF__uri_reque__date___282DF8C2]  DEFAULT (getutcdate()) FOR [date_last_updated]
GO
ALTER TABLE [dbo].[uri_requests] ADD  CONSTRAINT [DF__uri_reque__web_u__2A164134]  DEFAULT ('') FOR [variant_uri]
GO
ALTER TABLE [dbo].[uri_requests] ADD  CONSTRAINT [DF__uri_reque__activ__29221CFB]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[uri_requests] ADD  CONSTRAINT [DF_uri_requests_flagged_for_deletion]  DEFAULT ((0)) FOR [flagged_for_deletion]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF__uri_respo__attri__3A4CA8FD]  DEFAULT ('') FOR [linktype]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF__uri_respo__iana___3864608B]  DEFAULT ('') FOR [iana_language]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF_uri_responses_context]  DEFAULT ('') FOR [context]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF__uri_respo__desti__40F9A68C]  DEFAULT (N'text/html') FOR [mime_type]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF__uri_respo__alt_a__3D2915A8]  DEFAULT ('') FOR [link_title]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF__uri_respo__desti__3B40CD36]  DEFAULT ('') FOR [target_url]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF_uri_responses_default_linktype]  DEFAULT ((0)) FOR [default_linktype]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF_uri_responses_default_iana_language]  DEFAULT ((0)) FOR [default_iana_language]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF_uri_responses_default_context]  DEFAULT ((0)) FOR [default_context]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF_uri_responses_default_mime_type]  DEFAULT ((0)) FOR [default_mime_type]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF__uri_respo__forwa__41EDCAC5]  DEFAULT ((0)) FOR [forward_request_querystrings]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF__uri_respo__activ__3E1D39E1]  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF_uri_responses_flagged_for_deletion]  DEFAULT ((0)) FOR [flagged_for_deletion]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF_uri_responses_date_inserted]  DEFAULT (getutcdate()) FOR [date_inserted]
GO
ALTER TABLE [dbo].[uri_responses] ADD  CONSTRAINT [DF_uri_responses_date_last_updated]  DEFAULT (getutcdate()) FOR [date_last_updated]
GO
ALTER TABLE [dbo].[uri_responses]  WITH CHECK ADD  CONSTRAINT [FK_uri_responses_uri_requests] FOREIGN KEY([uri_request_id])
    REFERENCES [dbo].[uri_requests] ([uri_request_id])
    ON DELETE CASCADE
GO
ALTER TABLE [dbo].[uri_responses] CHECK CONSTRAINT [FK_uri_responses_uri_requests]
GO
/****** Object:  StoredProcedure [dbo].[BUILD_Get_GCP_Redirects]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 14-04-2020
-- Description:	Gets all the GCP redirects staring at a given lowest redirect_id (default 0) and batch size (default 1000)
--              Which is used by the BUILD application to rebuild its local document database from scratch / perform a full sync.

-- =============================================
CREATE PROCEDURE [dbo].[BUILD_Get_GCP_Redirects]
    @var_last_heard_datetime  nvarchar(30),
    @var_lowest_gcp_redirect_id bigint = 0,
    @var_max_rows_to_return int = 1000
AS
BEGIN

    SET  XACT_ABORT  ON

    SET  NOCOUNT  ON

    DECLARE @last_heard datetime = CONVERT(DATETIME, @var_last_heard_datetime)

    SELECT @var_max_rows_to_return = ISNULL(@var_max_rows_to_return, 1000)

    SELECT TOP (@var_max_rows_to_return)
        gcp_redirect_id,
        member_primary_gln,
        gs1_key_code,
        gs1_gcp_value,
        target_url,
        active
    FROM [gcp_redirects]
    WHERE gcp_redirect_id >= @var_lowest_gcp_redirect_id
      AND date_last_updated > @last_heard
    ORDER BY gcp_redirect_id

END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_Get_URI_Requests]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 24-FEB-2020
-- Description:	Gets all the URI requests staring at a given lowest request_id (default 0) and batch size (default 1000) for a given last heard date time
--              Which is used by the BUILD application to rebuild its local document database from scratch / perform a full sync.
-- =============================================
CREATE PROCEDURE [dbo].[BUILD_Get_URI_Requests]
(
    @var_last_heard_datetime nvarchar(30),
    @var_lowest_request_id bigint = 0,
    @var_max_rows_to_return int = 1000
)
AS
BEGIN

    SET  XACT_ABORT  ON

    SET  NOCOUNT  ON

    DECLARE @last_heard datetime = CONVERT(DATETIME, @var_last_heard_datetime)

    SELECT @var_max_rows_to_return = ISNULL(@var_max_rows_to_return, 1000)

    SELECT TOP (@var_max_rows_to_return)
        uri_request_id,
        member_primary_gln,
        gs1_key_code,
        gs1_key_value,
        item_description,
        date_inserted,
        date_last_updated,
        variant_uri,
        active
    FROM [uri_requests]
    WHERE uri_request_id >= @var_lowest_request_id
      AND date_last_updated > @last_heard
    ORDER BY uri_request_id

END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_GET_URI_Requests_using_gs1_key_code_and_value]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 18-Feb-2020
-- Description:	Used by the Build process to get URI requests based on the supplied gs1 key code and value
-- =============================================
CREATE PROCEDURE [dbo].[BUILD_GET_URI_Requests_using_gs1_key_code_and_value]
    @var_gs1_key_code nvarchar(20),
    @var_gs1_key_value nvarchar(45)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;


    SELECT
        [uri_request_id],
        [member_primary_gln],
        [gs1_key_code],
        [gs1_key_value],
        [item_description],
        [date_inserted],
        [date_last_updated],
        [variant_uri],
        [active]
    FROM [dbo].[uri_requests]
    WHERE gs1_key_code = @var_gs1_key_code
      AND gs1_key_value = @var_gs1_key_value
      AND flagged_for_deletion = 0

END
GO
/****** Object:  StoredProcedure [dbo].[BUILD_Register_Sync_Server]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 24-FEB-2020
-- Description:	The BUILD application in each resolver 'logs in' to this database my registering its unique server-id (generated
--              from the Docker Engine-provided 12-character hostname. This procedure inserts or updates this server-id's entry
--              and updates its 'last heard' data time, then responds with the previously heard date time.
--              This enables the Build process to just get those entries changed since that date time.
--              2020-01-01 is the earliest date before any resolver entry. If this server syncs fror thr dirt time, that
--              value is the one returned.
-- =============================================
CREATE PROCEDURE [dbo].[BUILD_Register_Sync_Server]
@sync_server_id NCHAR(12)
AS
BEGIN

    SET  XACT_ABORT  ON

    SET  NOCOUNT  ON

    DECLARE @last_heard_datetime DATETIME

    SELECT @last_heard_datetime = last_heard_datetime
    FROM server_sync_register
    WHERE resolver_sync_server_id = @sync_server_id

    IF @last_heard_datetime iS NULL
        BEGIN
            INSERT INTO server_sync_register (resolver_sync_server_id, last_heard_datetime)
            VALUES (@sync_server_id, CONVERT(DATETIME, '2020-01-01', 102))

            SELECT @last_heard_datetime = CONVERT(DATETIME, '2020-01-01', 102);
        END

    ELSE

        BEGIN

            UPDATE server_sync_register
            SET last_heard_datetime = GETUTCDATE()
            WHERE resolver_sync_server_id = @sync_server_id

        END

    SELECT
        @last_heard_datetime AS last_heard_datetime
END
GO
/****** Object:  StoredProcedure [dbo].[COUNT_URI_Requests_using_member_primary_gln]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 03-Apr-2020
-- Description:	[COUNT_URI_Requests_using_member_primary_gln] counts the URI requests and returns a count
--              of records matching @var_member_primary_gln
-- =============================================
CREATE PROCEDURE [dbo].[COUNT_URI_Requests_using_member_primary_gln]
@var_member_primary_gln nchar(13)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;


    SELECT
        COUNT(*) as entry_count,
        MIN(req.uri_request_id) as min_uri_request_id
    FROM [dbo].[uri_requests] req INNER JOIN [dbo].[uri_responses] res ON req.uri_request_id = res.uri_request_id
    WHERE member_primary_gln = @var_member_primary_gln
      AND req.flagged_for_deletion = 0 and res.flagged_for_deletion = 0

END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_GCP_Redirect]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 20-FEB-2020
-- Description:	Creates or updates a new or existing GCP Redirect
-- =============================================
CREATE PROCEDURE [dbo].[CREATE_GCP_Redirect]
    @var_member_primary_gln nchar(13),
    @var_gs1_key_code nvarchar(20),
    @var_gs1_gcp_value nvarchar(45),
    @var_target_url nvarchar(255),
    @var_active bit
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @var_gcp_redirect_id bigint = 0

    DECLARE @count INT = 0

    /* Find out if that key code and value combination already exists */

    SELECT @count = COUNT(*)
    FROM gcp_redirects
    WHERE gs1_key_code = @var_gs1_key_code
      AND gs1_gcp_value = @var_gs1_gcp_value

    IF @count = 0
        BEGIN
            INSERT INTO [dbo].[gcp_redirects]
            (
                member_primary_gln,
                gs1_key_code,
                gs1_gcp_value,
                target_url,
                active,
                flagged_for_deletion,
                date_inserted,
                date_last_updated
            )
            VALUES
            (
                @var_member_primary_gln,
                @var_gs1_key_code,
                @var_gs1_gcp_value,
                @var_target_url,
                @var_active,
                0,
                GETUTCDATE(),
                GETUTCDATE()
            )

            SELECT @var_gcp_redirect_id = SCOPE_IDENTITY()

        END

    ELSE
        /* Find the existing gcp_redirect_id value and update the record */
        BEGIN
            SELECT @var_gcp_redirect_id = gcp_redirect_id
            FROM gcp_redirects
            WHERE gs1_key_code = @var_gs1_key_code
              AND gs1_gcp_value = @var_gs1_gcp_value


            EXEC [dbo].[UPDATE_GCP_Redirect]
                 @var_gcp_redirect_id,
                 @var_member_primary_gln,
                 @var_gs1_key_code,
                 @var_gs1_gcp_value,
                 @var_target_url,
                 @var_active
        END

    SELECT @var_gcp_redirect_id AS new_gcp_redirect_id
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_URI_Request]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 18-FEB-2020
-- Description:	CREATE_URI_Request creates or updates a new URI request record.
-- =============================================
CREATE PROCEDURE [dbo].[CREATE_URI_Request]
    @var_member_primary_gln nchar(13),
    @var_gs1_key_code nvarchar(20),
    @var_gs1_key_value nvarchar(45),
    @var_item_description nvarchar(200),
    @var_variant_uri nvarchar(255),
    @var_active bit
AS
BEGIN

    SET  XACT_ABORT  ON
    SET  NOCOUNT  ON

    DECLARE @var_uri_request_id bigint = 0
    DECLARE @count INT = 0

    SELECT @count = COUNT(*)
    FROM uri_requests
    WHERE
            @var_gs1_key_code = @var_gs1_key_code
      AND gs1_key_value = @var_gs1_key_value
      AND variant_uri = @var_variant_uri


    IF @count = 0
        BEGIN
            /* insert a new record */
            INSERT INTO [dbo].[uri_requests]
            (
                [member_primary_gln],
                [gs1_key_code],
                [gs1_key_value],
                [item_description],
                [date_inserted],
                [date_last_updated],
                [variant_uri],
                [active],
                [flagged_for_deletion]
            )
            VALUES
            (
                @var_member_primary_gln,
                @var_gs1_key_code,
                @var_gs1_key_value,
                @var_item_description,
                GETUTCDATE(),
                GETUTCDATE(),
                @var_variant_uri,
                @var_active,
                0
            )


            /* store the request id from the IDENTITY as the record is inserted */
            SELECT @var_uri_request_id = SCOPE_IDENTITY()

            /* return the new uri_request_id (or the updated uri_request_id). */
            SELECT @var_uri_request_id AS  uri_request_id, CONVERT(bit, 1) AS SUCCESS

        END
    ELSE
        BEGIN
            /* Update an existing record*/
            /* First find out the existing record's uri_request_id */
            SELECT @var_uri_request_id = uri_request_id
            FROM uri_requests
            WHERE gs1_key_code = @var_gs1_key_code
              AND gs1_key_value = @var_gs1_key_value
              AND variant_uri = @var_variant_uri

            /* Now update the record using a call to the UPDATE stored procedure */
            EXEC [dbo].[UPDATE_URI_Request]
                 @var_uri_request_id,
                 @var_member_primary_gln,
                 @var_gs1_key_code,
                 @var_gs1_key_value,
                 @var_item_description,
                 @var_variant_uri,
                 @var_active

        END

END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_URI_Response]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 18-FEB-2020
-- Description:	CREATE_URI_Response inserts a new URI response into the database, and sends a message to the sync queue
--              of the change. If the same combination for response is already in the uri_responses table, the data
--              is updated instead
-- =============================================
CREATE PROCEDURE [dbo].[CREATE_URI_Response]
    @var_uri_request_id bigint,
    @var_linktype nvarchar(100),
    @var_iana_language nchar(2),
    @var_context nvarchar(100),
    @var_mime_type nvarchar(45),
    @var_link_title nvarchar(45),
    @var_target_url nvarchar(1024),
    @var_forward_request_querystrings bit,
    @var_active bit,
    @var_default_linktype bit,
    @var_default_iana_language bit,
    @var_default_context bit,
    @var_default_mime_type bit
AS
BEGIN

    SET  XACT_ABORT  ON
    SET  NOCOUNT  ON

    DECLARE @count INT = 0
    DECLARE @var_uri_response_id bigint = 0
    DECLARE @var_member_primary_gln NCHAR(13) = null

    /* Test if the supplied var_member_primary_gln matches the request's member_primary_gln */
    SELECT @var_member_primary_gln = member_primary_gln
    FROM uri_requests
    WHERE uri_request_id = @var_uri_request_id

    IF isnull(@var_member_primary_gln, 'X') = 'X'
        BEGIN
            /* Return a failure as this user is not allowed to create a response to this request with value from @var_uri_request_id */
            SELECT 0 as uri_response_id, CONVERT(bit, 0) AS SUCCESS
        END

    ELSE

        BEGIN

            SELECT @count = COUNT(*)
            FROM uri_responses
            WHERE
                    uri_request_id = @var_uri_request_id
              AND linktype = @var_linktype
              AND iana_language = @var_iana_language
              AND context = @var_context
              AND mime_type = @var_mime_type


            IF @count = 0
                BEGIN

                    INSERT INTO uri_responses
                    (
                        uri_request_id,
                        linktype,
                        iana_language,
                        context,
                        mime_type,
                        link_title,
                        target_url,
                        default_linktype,
                        default_iana_language,
                        default_context,
                        default_mime_type,
                        forward_request_querystrings,
                        active,
                        flagged_for_deletion,
                        date_inserted,
                        date_last_updated
                    )
                    VALUES
                    (
                        @var_uri_request_id,
                        @var_linktype,
                        @var_iana_language,
                        @var_context,
                        @var_mime_type,
                        @var_link_title,
                        @var_target_url,
                        @var_default_linktype,
                        @var_default_iana_language,
                        @var_default_context,
                        @var_default_mime_type,
                        @var_forward_request_querystrings,
                        @var_active,
                        0,
                        GETUTCDATE(),
                        GETUTCDATE()
                    )

                    /* return the request id from the IDENTITY as the record is inserte */
                    SELECT @var_uri_response_id = SCOPE_IDENTITY();

                    /* Return the new uri_response_id */
                    SELECT @var_uri_response_id as uri_response_id, CONVERT(bit, 1) AS SUCCESS

                END
            ELSE
                BEGIN

                    /* Update is required - find the uri_response_id and recurseively call this
                       very own stored procedure */
                    SELECT @var_uri_response_id = uri_response_id
                    FROM uri_responses
                    WHERE
                            uri_request_id = @var_uri_request_id
                      AND linktype = @var_linktype
                      AND iana_language = @var_iana_language
                      AND context = @var_context
                      AND mime_type = @var_mime_type


                    EXEC [dbo].[UPDATE_URI_Response]
                         @var_uri_response_id,
                         @var_uri_request_id,
                         @var_linktype,
                         @var_iana_language,
                         @var_context,
                         @var_mime_type,
                         @var_link_title,
                         @var_target_url,
                         @var_forward_request_querystrings,
                         @var_active,
                         @var_default_linktype,
                         @var_default_iana_language,
                         @var_default_context,
                         @var_default_mime_type
                END

        END
END
GO
/****** Object:  StoredProcedure [dbo].[DELETE_GCP_Redirect]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 20-FEB-2020
-- Description:	DELETE_GCP_Redirect sets the 'flagged_for_deletion' column to 1 for the supplied request and all of its responses.
--              This does not delete the record, but flags it for deletion by a later end-of-day process.
-- =============================================
CREATE PROCEDURE [dbo].[DELETE_GCP_Redirect]
@var_gcp_redirect_id bigint
AS
BEGIN

    SET  XACT_ABORT  ON
    SET  NOCOUNT  ON

    DECLARE @var_success_flag bit = 0

    BEGIN TRANSACTION

        UPDATE gcp_redirects
        SET flagged_for_deletion = 1
        WHERE gcp_redirect_id = @var_gcp_redirect_id

        IF @@ROWCOUNT > 0
            BEGIN
                SELECT @var_success_flag = 1
            END

    COMMIT TRANSACTION

    SELECT @var_success_flag as SUCCESS;
END
GO
/****** Object:  StoredProcedure [dbo].[DELETE_URI_Request]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 18-FEB-2020
-- Description:	DELETE_URI_Request sets the 'flagged_for_deletion' column to 1 for the supplied request and all of its responses.
--              This does not delete the record, but flags it for deletion by a later end-of-day process.
-- =============================================
CREATE PROCEDURE [dbo].[DELETE_URI_Request]
    @var_uri_request_id bigint,
    @var_member_primary_gln nchar(13)
AS
BEGIN

    SET  XACT_ABORT  ON
    SET  NOCOUNT  ON

    DECLARE @var_success_flag bit = 0

    /* Update the uri_requests_table */
    UPDATE uri_requests
    SET flagged_for_deletion = 1
    WHERE uri_request_id = @var_uri_request_id
      AND member_primary_gln = @var_member_primary_gln

    IF @@ROWCOUNT > 0
        BEGIN
            SELECT @var_success_flag = 1
        END

    /* Make sure that any dependent resposnses are also flagged for deletion */
    UPDATE uri_responses
    SET	flagged_for_deletion = 1
    WHERE uri_request_id = @var_uri_request_id

    /* We must check if there is at least one responses with active = 1 (and not flagged for deletion)
    for the associated request. If not, the request must have its active flag set to 0 */
    EXEC [INTERNAL_Ensure_Request_Has_Active_Responses] @var_uri_request_id

    SELECT @var_success_flag as SUCCESS;
END
GO
/****** Object:  StoredProcedure [dbo].[DELETE_URI_Response]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 18-FEB-2020
-- Description:	[DELETE_URI_Response] sets the 'flagged_for_deletion' column to 1 for the supplied request and all of its responses.
--              This does not delete the record, but flags it for deletion by a later end-of-day process.
--              N.B. Note how the message to the sync queue is an Update '1' not a Delete '0' message. This is because the request
--                   itself is not being deleted, just this response. Therefore this request is being updated, not itself deleted.
-- =============================================
CREATE PROCEDURE [dbo].[DELETE_URI_Response]
@var_uri_response_id bigint
AS
BEGIN

    SET  XACT_ABORT  ON
    SET  NOCOUNT  ON

    DECLARE @var_success_flag bit = 0
    DECLARE @var_uri_request_id bigint

    SELECT @var_uri_request_id = uri_request_id
    FROM uri_responses
    WHERE uri_response_id = @var_uri_response_id

    IF NOT @var_uri_response_id IS NULL
        BEGIN

            /* Update the uri_responses table */
            UPDATE uri_responses
            SET
                flagged_for_deletion = 1
            WHERE uri_response_id = @var_uri_response_id

            IF @@ROWCOUNT > 0
                BEGIN
                    SELECT @var_success_flag = 1
                END

            /* We must check if there is at least one responses with active = 1 (and not flagged for deletion)
            for the associated request. If not, the request must have its active flag set to 0 */
            EXEC [INTERNAL_Ensure_Request_Has_Active_Responses] @var_uri_request_id

        END

    SELECT @var_success_flag as SUCCESS;
END
GO
/****** Object:  StoredProcedure [dbo].[ENDOFDAY_Delete_Flagged_GCP_Entries]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 21-FEB-2020
-- Description: SQL DELETES all GCP entries flagged for deletion
-- =============================================
CREATE PROCEDURE [dbo].[ENDOFDAY_Delete_Flagged_GCP_Entries]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    DELETE FROM gcp_redirects
    WHERE flagged_for_deletion = 1

END
GO
/****** Object:  StoredProcedure [dbo].[ENDOFDAY_Delete_Flagged_URI_Entries]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 21-FEB-2020
-- Description: SQL DELETES all URI entries flagged for deletion
-- =============================================
CREATE PROCEDURE [dbo].[ENDOFDAY_Delete_Flagged_URI_Entries]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    BEGIN TRANSACTION

        DELETE FROM uri_responses
        WHERE uri_request_id IN
              (
                  SELECT uri_request_id
                  FROM uri_requests
                  WHERE flagged_for_deletion = 1
              )

        DELETE FROM uri_requests
        WHERE flagged_for_deletion = 1

    COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [dbo].[GET_GCP_Redirects]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 20-FEB-2020
-- Description:	Returns all the GCP Redirect entries for the supplied member's primary GLN
-- =============================================
CREATE PROCEDURE [dbo].[GET_GCP_Redirects]
@var_member_primary_gln NCHAR(13)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT gcp_redirect_id,
           member_primary_gln,
           gs1_key_code,
           gs1_gcp_value,
           target_url,
           active
    FROM gcp_redirects
    WHERE member_primary_gln = @var_member_primary_gln
      AND flagged_for_deletion = 0
    ORDER BY gcp_redirect_id

END
GO
/****** Object:  StoredProcedure [dbo].[GET_URI_Requests_using_gln_and_gs1_key_code_and_value]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 18-Feb-2020
-- Description:	[GET_URI_Requests_using_gln_and_gs1_key_code_and_value]
--               searches for the URI requests based on the supplied gln, gs1 key code and value
-- =============================================
CREATE PROCEDURE [dbo].[GET_URI_Requests_using_gln_and_gs1_key_code_and_value]
    @var_gs1_key_code nvarchar(20),
    @var_gs1_key_value nvarchar(45),
    @var_member_primary_gln nchar(13)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;


    SELECT
        [uri_request_id],
        [member_primary_gln],
        [gs1_key_code],
        [gs1_key_value],
        [item_description],
        [date_inserted],
        [date_last_updated],
        [variant_uri],
        [active]
    FROM [dbo].[uri_requests]
    WHERE gs1_key_code = @var_gs1_key_code
      AND gs1_key_value = @var_gs1_key_value
      AND member_primary_gln = @var_member_primary_gln
      AND flagged_for_deletion = 0

END
GO
/****** Object:  StoredProcedure [dbo].[GET_URI_Requests_using_gs1_key_code_and_value]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 18-Feb-2020
-- Description:	[SEARCH_URI_Requests__gs1_key_code_and_value] searches for the URI requests based on the supplied gs1 key code and value
-- =============================================
CREATE PROCEDURE [dbo].[GET_URI_Requests_using_gs1_key_code_and_value]
    @var_gs1_key_code nvarchar(20),
    @var_gs1_key_value nvarchar(45),
    @var_member_primary_gln nchar(13)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;


    SELECT
        [uri_request_id],
        [member_primary_gln],
        [gs1_key_code],
        [gs1_key_value],
        [item_description],
        [date_inserted],
        [date_last_updated],
        [variant_uri],
        [active]
    FROM [dbo].[uri_requests]
    WHERE gs1_key_code = @var_gs1_key_code
      AND gs1_key_value = @var_gs1_key_value
      AND member_primary_gln = @var_member_primary_gln
      AND flagged_for_deletion = 0

END
GO
/****** Object:  StoredProcedure [dbo].[GET_URI_Requests_using_member_primary_gln]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 18-Feb-2020
-- Description:	SEARCH_URI_Requests__member_primary_gln searches for the URI requests based on the supplied member_primary_gln
--              and minimum uri_request_id (default 0) with  maximum number of rows to return.
--              The results are returned in ascending uri_request_id order, allowing clients to read the data in batches.
-- =============================================
CREATE PROCEDURE [dbo].[GET_URI_Requests_using_member_primary_gln]
    @var_member_primary_gln nchar(13),
    @var_from_uri_request_id bigint = 0,
    @var_max_rows_to_return INT = 1000
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;


    SELECT TOP (@var_max_rows_to_return)
        [uri_request_id],
        [member_primary_gln],
        [gs1_key_code],
        [gs1_key_value],
        [item_description],
        [date_inserted],
        [date_last_updated],
        [variant_uri],
        [active]
    FROM [dbo].[uri_requests]
    WHERE uri_request_id >= @var_from_uri_request_id
      AND member_primary_gln = @var_member_primary_gln
      AND flagged_for_deletion = 0
    ORDER BY uri_request_id

END
GO
/****** Object:  StoredProcedure [dbo].[GET_URI_Responses]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 18-FEB-2020
-- Description:	SEARCH_UI_Responses__uri_request_id finds all the responses for a particular request, and returns them
--              oreded by  linktype, iana_language, context, and mime_type
-- =============================================
CREATE PROCEDURE [dbo].[GET_URI_Responses]
@var_uri_request_id bigint
AS
BEGIN

    SET  XACT_ABORT  ON

    SET  NOCOUNT  ON

    SELECT
        uri_response_id,
        uri_request_id,
        linktype,
        iana_language,
        context,
        mime_type,
        link_title,
        target_url,
        default_linktype,
        default_iana_language,
        default_context,
        default_mime_type,
        forward_request_querystrings,
        active
    FROM uri_responses
    WHERE uri_request_id = @var_uri_request_id
    ORDER BY linktype, iana_language, context, mime_type

END
GO
/****** Object:  StoredProcedure [dbo].[INTERNAL_Ensure_Request_Has_Active_Responses]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 26-FEB-2020
-- Description:	We must check if there is at least one responses with active = 1 (and not flagged for deletion)
-- for the associated request. If not, the request has no active responses so must have its active flag set to 0 */
-- A Request cannot be active unless it has at least one active Response.
-- =============================================
CREATE PROCEDURE [dbo].[INTERNAL_Ensure_Request_Has_Active_Responses]
@var_uri_request_id bigint
AS
BEGIN
    DECLARE @var_count INT = 0

    SELECT @var_count = COUNT(*)
    FROM uri_responses
    WHERE uri_request_id = @var_uri_request_id
      AND active = 1 AND flagged_for_deletion = 0

    IF @var_count = 0
        UPDATE uri_requests
        SET active = 0
        WHERE uri_request_id = @var_uri_request_id
END
GO
/****** Object:  StoredProcedure [dbo].[READ_GCP_Redirect]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 20-FEB-2020
-- Description:	Reads the GCP Redirect entry
-- =============================================
CREATE PROCEDURE [dbo].[READ_GCP_Redirect]
@var_uri_redirect_id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT gcp_redirect_id,
           member_primary_gln,
           gs1_key_code,
           gs1_gcp_value,
           target_url,
           active
    FROM gcp_redirects
    WHERE gcp_redirect_id = @var_uri_redirect_id
      AND flagged_for_deletion = 0

END
GO
/****** Object:  StoredProcedure [dbo].[READ_Resolver_Auth]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Nick Lansley
-- Create Date: 17 March 2020
-- Description: Checks the authentication key of an incoming request
--              Temporary authentication which should be replaced by a more robust service
-- =============================================
CREATE PROCEDURE [dbo].[READ_Resolver_Auth]
(
    @varAuthKey NCHAR(64)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    SELECT
        COUNT(*) AS success,
        min(member_primary_gln) AS member_primary_gln
    FROM resolver_auth
    WHERE authentication_key = @varAuthKey


END
GO
/****** Object:  StoredProcedure [dbo].[READ_URI_Request]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 18-Feb-2020
-- Description:	READ_URI_Request reads the URI request record based on the supplied uri_request_id
-- =============================================
CREATE PROCEDURE [dbo].[READ_URI_Request]
    @var_uri_request_id bigint,
    @var_member_primary_gln nchar(13)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;


    SELECT [uri_request_id],
           [member_primary_gln],
           [gs1_key_code],
           [gs1_key_value],
           [item_description],
           [date_inserted],
           [date_last_updated],
           [variant_uri],
           [active]
    FROM [dbo].[uri_requests]
    WHERE uri_request_id = @var_uri_request_id
      AND member_primary_gln = @var_member_primary_gln
      AND flagged_for_deletion = 0


END
GO
/****** Object:  StoredProcedure [dbo].[READ_URI_Response]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 18-FEB-2020
-- Description:	READ_URI_Response reads the response for a given uri_response_id
-- =============================================
CREATE PROCEDURE [dbo].[READ_URI_Response]
@var_uri_response_id bigint
AS
BEGIN

    SET  XACT_ABORT  ON

    SET  NOCOUNT  ON

    SELECT
        uri_response_id,
        uri_request_id,
        linktype,
        iana_language,
        context,
        mime_type,
        link_title,
        target_url,
        default_linktype,
        default_iana_language,
        default_context,
        default_mime_type,
        forward_request_querystrings,
        active
    FROM uri_responses
    WHERE uri_response_id = @var_uri_response_id
      AND flagged_for_deletion = 0

END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_GCP_Redirect]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 20-FEB-2020
-- Description:	UPDATE_GCP_Redirect updates existing request data using primary key gcp_redirect_id.
--              N.B. If this request has the 'active' column set to = 0 (inactive), the message
--              to the sync queue is that this is a 'Delete'. This will cause this GCP redirect
--              to be removed from active resolving. The request can be restored by
--              setting the 'active' column back to 1, causing an 'U' update to be sent to the sync queue.
-- =============================================
CREATE PROCEDURE [dbo].[UPDATE_GCP_Redirect]
    @var_gcp_redirect_id bigint,
    @var_member_primary_gln nchar(13),
    @var_gs1_key_code nvarchar(20),
    @var_gs1_gcp_value nvarchar(45),
    @var_target_url nvarchar(255),
    @var_active bit
AS
BEGIN

    DECLARE @var_success_flag bit = 0

    SET  XACT_ABORT  ON

    SET  NOCOUNT  ON

    UPDATE [dbo].[gcp_redirects]
    SET member_primary_gln = @var_member_primary_gln,
        gs1_key_code = @var_gs1_key_code,
        gs1_gcp_value = @var_gs1_gcp_value,
        target_url = @var_target_url,
        active  = @var_active,
        date_last_updated = GETUTCDATE()
    WHERE gcp_redirect_id = @var_gcp_redirect_id
      AND flagged_for_deletion = 0

    IF @@ROWCOUNT > 0
        BEGIN
            SELECT @var_success_flag = 1
        END

    SELECT @var_success_flag as SUCCESS;
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_URI_Request]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 18-FEB-2020
-- Description:	UPDATE_URI_Request updates existing request data using primary key uri_request_id.
--              N.B. If this request has the 'active' column set to = 0 (inactive), the message
--              to the sync queue is that this is a 'Delete'. This will cause this request (and all
--              its responses) to be removed from active resolving. The request can be restored by
--              setting the 'active' column back to 1, causing an 'U' update to be sent to the sync queue.
-- =============================================
CREATE PROCEDURE [dbo].[UPDATE_URI_Request]
    @var_uri_request_id bigint,
    @var_member_primary_gln nchar(13),
    @var_gs1_key_code nvarchar(20),
    @var_gs1_key_value nvarchar(45),
    @var_item_description nvarchar(200),
    @var_variant_uri nvarchar(255),
    @var_active bit
AS
BEGIN

    DECLARE @var_success_flag bit = 0

    SET  XACT_ABORT  ON

    SET  NOCOUNT  ON

    /* Update the uri_requests_table */
    UPDATE uri_requests
    SET
        member_primary_gln = @var_member_primary_gln,
        gs1_key_code = @var_gs1_key_code,
        gs1_key_value = @var_gs1_key_value,
        item_description = @var_item_description,
        date_last_updated = getutcdate(),
        variant_uri = @var_variant_uri,
        active = @var_active
    WHERE uri_request_id = @var_uri_request_id

    IF @@ROWCOUNT > 0
        BEGIN
            SELECT @var_success_flag = 1
        END

    SELECT @var_uri_request_id AS uri_request_id, @var_success_flag as SUCCESS;
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_URI_Response]    Script Date: 20/04/2020 17:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nick Lansley
-- Create date: 18-FEB-2020
-- Description:	Updates an existing URI response, and also sends a message to the sync_queue of this update.
-- =============================================
CREATE PROCEDURE [dbo].[UPDATE_URI_Response]
    @var_uri_response_id bigint,
    @var_uri_request_id bigint,
    @var_linktype nvarchar(100),
    @var_iana_language nchar(2),
    @var_context nvarchar(100),
    @var_mime_type nvarchar(45),
    @var_link_title nvarchar(45),
    @var_target_url nvarchar(1255),
    @var_forward_request_querystrings bit,
    @var_active bit,
    @var_default_linktype bit,
    @var_default_iana_language bit,
    @var_default_context bit,
    @var_default_mime_type bit
AS
BEGIN

    SET  XACT_ABORT  ON

    SET  NOCOUNT  ON
    DECLARE @var_success_flag bit = 0
    DECLARE @var_member_primary_gln NCHAR(13)

    /* Test if the supplied var_member_primary_gln matches the request's member_primary_gln */
    SELECT @var_member_primary_gln = member_primary_gln
    FROM uri_requests
    WHERE uri_request_id = @var_uri_request_id

    IF isnull(@var_member_primary_gln, 'X') = 'X'
        BEGIN
            /* Return a failure as this user is not allowed to create a response to this request with value from @var_uri_request_id */
            SELECT 0 as uri_response_id, CONVERT(bit, 0) AS SUCCESS
        END

    ELSE

        BEGIN

            UPDATE uri_responses
            SET uri_request_id = @var_uri_request_id,
                linktype = @var_linktype,
                iana_language = @var_iana_language,
                target_url = @var_target_url,
                context = @var_context,
                mime_type = @var_mime_type,
                link_title = @var_link_title,
                forward_request_querystrings = @var_forward_request_querystrings,
                active = @var_active,
                default_linktype = @var_default_linktype,
                default_iana_language = @var_default_iana_language,
                default_context = @var_default_context,
                default_mime_type = @var_default_mime_type,
                date_last_updated = GETUTCDATE()
            WHERE uri_response_id = @var_uri_response_id

            IF @@ROWCOUNT > 0
                BEGIN
                    SELECT @var_success_flag = 1
                END

            /* We must check if there is at least one responses with active = 1 (and not flagged for deletion)
            for the associated request. If not, the request must have its active flag set to 0 */
            EXEC [INTERNAL_Ensure_Request_Has_Active_Responses] @var_uri_request_id

            SELECT @var_uri_response_id AS uri_response_id, @var_success_flag as SUCCESS;
        END

END
GO
