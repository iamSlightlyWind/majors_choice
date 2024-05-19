use master

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'major')
BEGIN
    ALTER DATABASE major SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE major
END

create database major