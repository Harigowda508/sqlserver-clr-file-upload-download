-- for enabling

EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'clr enabled', 1;
RECONFIGURE;


--for checking 
SELECT name, value_in_use
FROM sys.configurations
WHERE name IN ('clr enabled','clr strict security');

