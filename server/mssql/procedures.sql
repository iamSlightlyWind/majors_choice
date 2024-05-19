use major

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

create procedure register
    @username varchar(25),
    @password varchar(25),
    @fullname nvarchar(50),
    @email varchar(100),
    @phoneNumber varchar(15),
    @address nvarchar(100),
    @dateOfBirth date,
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
        INSERT INTO users(username, password)
        VALUES (@username, @password)

        DECLARE @id int
        set @id = SCOPE_IDENTITY()

        INSERT INTO userDetails(id, fullname, email, phoneNumber, address, dateOfBirth)
        VALUES (@id, @fullname, @email, @phoneNumber, @address, @dateOfBirth)

        set @result = 1 -- registration successful
    end
end;