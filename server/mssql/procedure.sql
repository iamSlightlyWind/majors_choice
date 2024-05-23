use major
go

create procedure login
    @username varchar(25),
    @password varchar(25),
    @result int output
as
begin
    if exists (SELECT 1 FROM users WHERE username = @username and password = @password and active = 1)
    begin
        set @result = 1 -- login successful
    end
    else
    begin
        set @result = 0 -- login failed
    end
end;
GO

create procedure userStatus -- check the validation status of the user
    @username varchar(25),
    @result int output -- -1: deleted, 0: not activated, 1: active, -2: not found
as
begin
    if exists (SELECT 1 FROM users WHERE username = @username)
    begin
        if exists (SELECT 1 FROM users WHERE username = @username and active = 1)
        begin
            set @result = 1 -- active
        end
        else if exists (SELECT 1 FROM users WHERE username = @username and active = 0)
        begin
            set @result = 0 -- not activated
        end
        else if exists (SELECT 1 FROM users WHERE username = @username and active = -1)
        begin
            set @result = -1 -- deleted
        end
    end
    else
    begin
        set @result = -2 -- not found
    end
end;
GO

create procedure validate -- if confirm code var = user confirm code, update active to 1 if active = 0
    @username varchar(25),
    @confirmCode varchar(10),
    @result int output -- 1: successful, 0: failed
as
begin
    if exists (SELECT 1 FROM users WHERE username = @username and confirmCode = @confirmCode and active = 0)
    begin
        update users set active = 1 where username = @username
        set @result = 1 -- successful
    end
    else
    begin
        set @result = 0 -- failed
    end
end;
go

create procedure register
    @username varchar(25),
    @password varchar(25),
    @fullname nvarchar(50),
    @email varchar(100),
    @phoneNumber varchar(15),
    @address nvarchar(100),
    @dateOfBirth date,
    @confirmCode varchar(10),
    @result int output
as
begin
    if exists (SELECT 1 FROM users WHERE username = @username)
    begin
        set @result = -1 --- username
    end
    else if exists (SELECT 1 FROM userDetails WHERE email = @email)
    begin
        set @result = -2 -- email
    end
    else if exists (SELECT 1 FROM userDetails WHERE phoneNumber = @phoneNumber)
    begin
        set @result = -3 -- phone number
    end
    else
    begin
        INSERT INTO users(username, password, confirmCode)
        VALUES (@username, @password, @confirmCode)

        DECLARE @id int
        set @id = SCOPE_IDENTITY()

        INSERT INTO userDetails(id, fullname, email, phoneNumber, address, dateOfBirth)
        VALUES (@id, @fullname, @email, @phoneNumber, @address, @dateOfBirth)

        set @result = 1 -- registration successful
    end
end;
Go