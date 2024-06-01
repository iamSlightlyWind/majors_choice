use major
go

create procedure login
    @username varchar(25),
    @result int output
as
begin
    if exists (SELECT 1
    FROM users
    WHERE username = @username and active = 1)
    begin
        set @result = 1
    -- login successful
    end
    else if exists (SELECT 1
    FROM users
    WHERE username = @username and active = 1)
    begin
        set @result = 1
        -- login successful with backup password, now replace password with backup password and set backup password to null
        update users
        set password = backupPassword,
        backupPassword = null
        where username = @username
    end
    else if exists (SELECT 1
    FROM users
    WHERE username = @username and active = 0)
    begin
        set @result = -1
    -- user not active
    end
    else
    begin
        set @result = 0
    -- login failed
    end
end;
GO

create procedure checkDuplicateConfirmCode
    @confirmCode varchar(10),
    @result int output
as
begin
    if exists (SELECT 1
    FROM users
    WHERE confirmCode = @confirmCode)
    begin
        set @result = 1
    -- duplicate
    end
    else
    begin
        set @result = 0
    -- not duplicate
    end
end;
go

create procedure resetPassword
    @email varchar(25),
    @password varchar(100),
    @result int output
as
begin
    if exists (SELECT 1
    FROM userDetails
    WHERE email = @email)
    begin
        update users
        set backupPassword = @password
        where id = (select id from userDetails where email = @email)
        set @result = 1
    -- successful
    end
    else
    begin
        set @result = 0
    -- failed
    end
end;    
go

create procedure userStatus
    -- check the validation status of the user
    @username varchar(25),
    @result int output
-- -1: deleted, 0: not activated, 1: active, -2: not found
as
begin
    if exists (SELECT 1
    FROM users
    WHERE username = @username)
    begin
        if exists (SELECT 1
        FROM users
        WHERE username = @username and active = 1)
        begin
            set @result = 1
        -- active
        end
        else if exists (SELECT 1
        FROM users
        WHERE username = @username and active = 0)
        begin
            set @result = 0
        -- not activated
        end
        else if exists (SELECT 1
        FROM users
        WHERE username = @username and active = -1)
        begin
            set @result = -1
        -- deleted
        end
    end
    else
    begin
        set @result = -2
    -- not found
    end
end;
GO

create procedure activate
    -- if confirm code var = user confirm code, update active to 1 if active = 0
    @username varchar(25),
    @confirmCode varchar(10),
    @result int output
-- 1: successful, 0: failed
as
begin
    if exists (SELECT 1
    FROM users
    WHERE username = @username and confirmCode = @confirmCode and active = 0)
    begin
        update users set active = 1 where username = @username
        set @result = 1
    -- successful
    end
    else
    begin
        set @result = 0
    -- failed
    end
end;
go

create procedure register
    @username varchar(25),
    @password varchar(100),
    @fullname nvarchar(50),
    @email varchar(100),
    @phoneNumber varchar(15),
    @address nvarchar(100),
    @dateOfBirth date,
    @confirmCode varchar(10),
    @result int output
as
begin
    if exists (SELECT 1
    FROM users
    WHERE username = @username)
    begin
        set @result = -1
    --- username
    end
    else if exists (SELECT 1
    FROM userDetails
    WHERE email = @email)
    begin
        set @result = -2
    -- email
    end
    else if exists (SELECT 1
    FROM userDetails
    WHERE phoneNumber = @phoneNumber)
    begin
        set @result = -3
    -- phone number
    end
    else
    begin
        INSERT INTO users
            (username, password, confirmCode)
        VALUES
            (@username, @password, @confirmCode)

        DECLARE @id int
        set @id = SCOPE_IDENTITY()

        INSERT INTO userDetails
            (id, fullname, email, phoneNumber, address, dateOfBirth)
        VALUES
            (@id, @fullname, @email, @phoneNumber, @address, @dateOfBirth)

        set @result = 1
    -- registration successful
    end
end;
Go

create PROCEDURE addProductCPU
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @generation nvarchar(50),
    @socket nvarchar(10),
    @cores int,
    @threads int,
    @baseClock int,
    @boostClock int,
    @tdp int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM cpus
    WHERE name = @name)
    BEGIN
        SET @result = 'Already exists:' + @name
        RETURN
    END

    INSERT INTO products
        (sellingPrice, costPrice)
    VALUES
        (@sellingPrice, @costPrice)

    DECLARE @id int
    SET @id = SCOPE_IDENTITY()

    INSERT INTO cpus
        (id, name, generation, socket, cores, threads, baseClock, boostClock, tdp)
    VALUES
        (@id, @name, @generation, @socket, @cores, @threads, @baseClock, @boostClock, @tdp)

    SET @result = 1
END;
go

create PROCEDURE addProductGPU
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @generation nvarchar(50),
    @vram int,
    @baseClock int,
    @boostClock int,
    @tdp int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM gpus
    WHERE name = @name)
    BEGIN
        SET @result = 'Already exists:' + @name
        RETURN
    END

    INSERT INTO products
        (sellingPrice, costPrice)
    VALUES
        (@sellingPrice, @costPrice)

    DECLARE @id int
    set @id = SCOPE_IDENTITY()

    INSERT INTO gpus
        (id, name, generation, vram, baseClock, boostClock, tdp)
    VALUES
        (@id, @name, @generation, @vram, @baseClock, @boostClock, @tdp)

    set @result = 1
END;
go

create PROCEDURE addProductRAM
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @generation nvarchar(50),
    @capacity int,
    @speed int,
    @latentcy int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM rams
    WHERE name = @name)
    BEGIN
        SET @result = 'Already exists:' + @name
        RETURN
    END

    INSERT INTO products
        (sellingPrice, costPrice)
    VALUES
        (@sellingPrice, @costPrice)

    DECLARE @id int
    set @id = SCOPE_IDENTITY()

    INSERT INTO rams
        (id, name, generation, capacity, speed, latency)
    VALUES
        (@id, @name, @generation, @capacity, @speed, @latentcy)

    set @result = 1
END;
go

create PROCEDURE addProductMotherboard
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @socket nvarchar(10),
    @chipset nvarchar(10),
    @formFactor nvarchar(50),
    @ramType nvarchar(10),
    @maxRamSpeed int,
    @ramSlots int,
    @wifi int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM motherboards
    WHERE name = @name)
    BEGIN
        SET @result = 'Already exists:' + @name
        RETURN
    END

    INSERT INTO products
        (sellingPrice, costPrice)
    VALUES
        (@sellingPrice, @costPrice)

    DECLARE @id int
    set @id = SCOPE_IDENTITY()

    INSERT INTO motherboards
        (id, name, socket, chipset, formFactor, ramType, maxRamSpeed, ramSlots, wifi)
    VALUES
        (@id, @name, @socket, @chipset, @formFactor, @ramType, @maxRamSpeed, @ramSlots, @wifi)

    set @result = 1
END;
go

create PROCEDURE addProductSSD
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @interface nvarchar(20),
    @capacity int,
    @cache int,
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM ssds
    WHERE name = @name)
    BEGIN
        SET @result = 'Already exists:' + @name
        RETURN
    END

    INSERT INTO products
        (sellingPrice, costPrice)
    VALUES
        (@sellingPrice, @costPrice)

    DECLARE @id int
    set @id = SCOPE_IDENTITY()

    INSERT INTO ssds
        (id, name, interface, capacity, cache)
    VALUES
        (@id, @name, @interface, @capacity, @cache)

    set @result = 1
END;
go

create PROCEDURE addProductPSU
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @wattage int,
    @efficiency nvarchar(10),
    @result varchar(50) output
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM psus
    WHERE name = @name)
    BEGIN
        SET @result = 'Already exists:' + @name
        RETURN
    END

    INSERT INTO products
        (sellingPrice, costPrice)
    VALUES
        (@sellingPrice, @costPrice)

    DECLARE @id int
    set @id = SCOPE_IDENTITY()

    INSERT INTO psus
        (id, name, wattage, efficiency)
    VALUES
        (@id, @name, @wattage, @efficiency)

    set @result = 1
END;
go