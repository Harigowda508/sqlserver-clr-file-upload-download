-- for uploading file into the database 

EXEC p_LIVEStoreCertificateFile
    @CertificateName = N'TDE_Certificate_CLIENTNAME',
    @FilePath = N'D:\Working Folder\TDE_CERTIFICATES_BACKUP_LIVE\TDE_Certificate_CLIENTNAME.pvk',
    @FileType = N'pvk',
    @Query = N'EXEC p_TDECrtDwnld @TableName = N''t_LIVECertificateBackups'',   
        @FileName = N''TDE_Certificate_CLIENTNAME.pvk'', 
        @OutputPath = N''D:\RecoveredCertificates\TDE_Certificate_CLIENTNAME.pvk'';',
    @client = N'CLIENTNAME';

-- for downloading script from the database


EXEC p_TDECrtDwnld       @TableName = N't_LIVECertificateBackups',  
@FileName = N'TDE_Certificate_CLIENTNAME.pvk',  
@OutputPath = N'D:\RecoveredCertificates\TDE_Certificate_CLIENTNAME.pvk';


--Binary Integrity Check

SELECT
FileName,
DATALENGTH(BinaryData) AS SizeInBytes,
CHECKSUM(BinaryData) AS BinaryChecksum
FROM t_LIVECertificateBackups;

