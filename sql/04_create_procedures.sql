/****** Object:  StoredProcedure [dbo].[p_DevStoreCertificateFile]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[p_DevStoreCertificateFile]
    @CertificateName NVARCHAR(100),
    @FilePath NVARCHAR(260),
    @FileType NVARCHAR(10),
    @Query    NVARCHAR(500),
    @client   NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @FileName NVARCHAR(255) = RIGHT(@FilePath, CHARINDEX('\', REVERSE(@FilePath)) - 1);

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = '
        INSERT INTO t_DevCertificateBackups (CertificateName, FileName, FileType, FileContent, Query, client)
        SELECT 
            @CertificateName,
            @FileName,
            @FileType,
            BulkData.*,
            @Query,
            @client
        FROM OPENROWSET(BULK ''' + REPLACE(@FilePath, '''', '''''') + ''', SINGLE_BLOB) AS BulkData;';

    EXEC sp_executesql @SQL,
        N'@CertificateName NVARCHAR(100), @FileName NVARCHAR(255), @FileType NVARCHAR(10), @Query NVARCHAR(500), @client NVARCHAR(100)',
        @CertificateName = @CertificateName,
        @FileName = @FileName,
        @FileType = @FileType,
        @Query = @Query,
        @client = @client;
END;


GO
/****** Object:  StoredProcedure [dbo].[p_LIVEStoreCertificateFile]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[p_LIVEStoreCertificateFile]
    @CertificateName NVARCHAR(100),
    @FilePath NVARCHAR(260),
    @FileType NVARCHAR(10),
    @Query NVARCHAR(500),
    @client NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @FileName NVARCHAR(255) = RIGHT(@FilePath, CHARINDEX('\', REVERSE(@FilePath)) - 1);

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = '
        INSERT INTO t_LIVECertificateBackups (CertificateName, FileName, FileType, FileContent, Query, client)
        SELECT 
            @CertificateName,
            @FileName,
            @FileType,
            BulkData.*,
            @Query,
            @client
        FROM OPENROWSET(BULK ''' + REPLACE(@FilePath, '''', '''''') + ''', SINGLE_BLOB) AS BulkData;';

    EXEC sp_executesql @SQL,
        N'@CertificateName NVARCHAR(100), @FileName NVARCHAR(255), @FileType NVARCHAR(10), @Query NVARCHAR(500), @client NVARCHAR(100)',
        @CertificateName = @CertificateName,
        @FileName = @FileName,
        @FileType = @FileType,
        @Query = @Query,
        @client = @client;
END;


GO
/****** Object:  StoredProcedure [dbo].[p_PREPRODStoreCertificateFile]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[p_PREPRODStoreCertificateFile]
    @CertificateName NVARCHAR(100),
    @FilePath NVARCHAR(260),
    @FileType NVARCHAR(10),
    @Query NVARCHAR(500),
    @client NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @FileName NVARCHAR(255) = RIGHT(@FilePath, CHARINDEX('\', REVERSE(@FilePath)) - 1);

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = '
        INSERT INTO t_PREPRODCertificateBackups (CertificateName, FileName, FileType, FileContent, Query, client)
        SELECT 
            @CertificateName,
            @FileName,
            @FileType,
            BulkData.*,
            @Query,
            @client
        FROM OPENROWSET(BULK ''' + REPLACE(@FilePath, '''', '''''') + ''', SINGLE_BLOB) AS BulkData;';

    EXEC sp_executesql @SQL,
        N'@CertificateName NVARCHAR(100), @FileName NVARCHAR(255), @FileType NVARCHAR(10), @Query NVARCHAR(500), @client NVARCHAR(100)',
        @CertificateName = @CertificateName,
        @FileName = @FileName,
        @FileType = @FileType,
        @Query = @Query,
        @client = @client;
END;

GO
/****** Object:  StoredProcedure [dbo].[p_QAStoreCertificateFile]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[p_QAStoreCertificateFile]
    @CertificateName NVARCHAR(100),
    @FilePath NVARCHAR(260),
    @FileType NVARCHAR(10),
    @Query    NVARCHAR(500),
    @client   NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @FileName NVARCHAR(255) = RIGHT(@FilePath, CHARINDEX('\', REVERSE(@FilePath)) - 1);

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = '
        INSERT INTO t_QACertificateBackups (CertificateName, FileName, FileType, FileContent, Query, client)
        SELECT 
            @CertificateName,
            @FileName,
            @FileType,
            BulkData.*,
            @Query,
            @client
        FROM OPENROWSET(BULK ''' + REPLACE(@FilePath, '''', '''''') + ''', SINGLE_BLOB) AS BulkData;';

    EXEC sp_executesql @SQL,
        N'@CertificateName NVARCHAR(100), @FileName NVARCHAR(255), @FileType NVARCHAR(10), @Query NVARCHAR(500), @client NVARCHAR(100)',
        @CertificateName = @CertificateName,
        @FileName = @FileName,
        @FileType = @FileType,
        @Query = @Query,
        @client = @client;
END;
GO
/****** Object:  StoredProcedure [dbo].[p_TDECrtDwnld]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[p_TDECrtDwnld]
	@TableName [nvarchar](128),
	@FileName [nvarchar](255),
	@OutputPath [nvarchar](1000)
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME [FileExporter].[FileExporter].[p_TDECrtDwnld]
GO
/****** Object:  StoredProcedure [dbo].[p_UATStoreCertificateFile]    Script Date: 04-02-2026 14:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[p_UATStoreCertificateFile]
    @CertificateName NVARCHAR(100),
    @FilePath NVARCHAR(260),
    @FileType NVARCHAR(10),
    @Query    NVARCHAR(500),
    @client   NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @FileName NVARCHAR(255) = RIGHT(@FilePath, CHARINDEX('\', REVERSE(@FilePath)) - 1);

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = '
        INSERT INTO t_UATCertificateBackups (CertificateName, FileName, FileType, FileContent, Query, client)
        SELECT 
            @CertificateName,
            @FileName,
            @FileType,
            BulkData.*,
            @Query,
            @client
        FROM OPENROWSET(BULK ''' + REPLACE(@FilePath, '''', '''''') + ''', SINGLE_BLOB) AS BulkData;';

    EXEC sp_executesql @SQL,
        N'@CertificateName NVARCHAR(100), @FileName NVARCHAR(255), @FileType NVARCHAR(10), @Query NVARCHAR(500), @client NVARCHAR(100)',
        @CertificateName = @CertificateName,
        @FileName = @FileName,
        @FileType = @FileType,
        @Query = @Query,
        @client = @client;
END;



GO
