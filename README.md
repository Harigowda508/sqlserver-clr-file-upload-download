# SQL Server CLR File Upload & Download

This project demonstrates a **production-safe SQL Server CLR implementation** to upload and download binary files
(such as **TDE certificates, private keys, and backup artifacts**) into/from SQL Server using CLR stored procedures.

The solution is compatible with **SQL Server 2017+ and SQL Server 2022**, following modern security practices
(`clr strict security`, trusted assemblies).

---

## 🚀 Features

- Upload physical files into SQL Server as `VARBINARY(MAX)`
- Download files back to disk without corruption
- Secure storage of TDE certificates & private keys
- CLR strict security–compliant
- Recovery-ready (server loss / DR scenarios)

---

## 🏗 Architecture

- SQL Server 2022
- CLR Assembly (`fileexporter.dll`)
- Upload procedure (File → DB)
- Download procedure (DB → File system)
- Storage table (`t_LIVECertificateBackups`)

-

