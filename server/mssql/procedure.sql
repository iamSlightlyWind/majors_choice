use major
go

create procedure login
    @username varchar(25),
    @password varchar(25),
    @result int output
as
begin
    if exists (SELECT 1
    FROM users
    WHERE username = @username and password = @password and active = 1)
    begin
        set @result = 1
    -- login successful
    end
    else if exists (SELECT 1
    FROM users
    WHERE username = @username and backupPassword = @password and active = 1)
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
    WHERE username = @username and password = @password and active = 0)
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

create procedure resetPassword
    @email varchar(25),
    @password varchar(25),
    @result int output
as
begin
    if exists (SELECT 1
    FROM userDetails
    WHERE email = @email)
    begin
        update users
        set backupPassword = @password
        where id = (select id
        from userDetails
        where email = @email)
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
    @image NVARCHAR(max),
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
        (id, name, generation, socket, cores, threads, baseClock, boostClock, tdp, image)
    VALUES
        (@id, @name, @generation, @socket, @cores, @threads, @baseClock, @boostClock, @tdp, @image)

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
    @image NVARCHAR(max),
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
        (id, name, generation, vram, baseClock, boostClock, tdp, image)
    VALUES
        (@id, @name, @generation, @vram, @baseClock, @boostClock, @tdp, @image)

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
    @image NVARCHAR(max),
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
        (id, name, generation, capacity, speed, latency, image)
    VALUES
        (@id, @name, @generation, @capacity, @speed, @latentcy, @image)

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
    @image NVARCHAR(max),
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
        (id, name, socket, chipset, formFactor, ramType, maxRamSpeed, ramSlots, wifi, image)
    VALUES
        (@id, @name, @socket, @chipset, @formFactor, @ramType, @maxRamSpeed, @ramSlots, @wifi, @image)

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
    @image NVARCHAR(max),
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
        (id, name, interface, capacity, cache, image)
    VALUES
        (@id, @name, @interface, @capacity, @cache, @image)

    set @result = 1
END;
go

create PROCEDURE addProductPSU
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @wattage int,
    @efficiency nvarchar(10),
    @image NVARCHAR(max),
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
        (id, name, wattage, efficiency, image)
    VALUES
        (@id, @name, @wattage, @efficiency, @image)

    set @result = 1
END;
go

create procedure getCPU
as
begin
    select
        cpus.id,
        sellingPrice,
        costPrice,
        description,
        name,
        generation,
        socket,
        cores,
        threads,
        baseClock,
        boostClock,
        tdp
    from products
        join cpus on products.id = cpus.id
end
go

create procedure getGPU
as
begin
    select
        gpus.id,
        sellingPrice,
        costPrice,
        description,
        name,
        generation,
        vram,
        baseClock,
        boostClock,
        tdp
    from products
        join gpus on products.id = gpus.id
end
go

create procedure getMotherboard
as
begin
    select
        motherboards.id,
        sellingPrice,
        costPrice,
        description,
        name,
        socket,
        chipset,
        formFactor,
        ramType,
        maxRamSpeed,
        ramSlots,
        wifi
    from products
        join motherboards on products.id = motherboards.id
end
go

create procedure getRAM
as
begin
    select
        rams.id,
        sellingPrice,
        costPrice,
        description,
        name,
        generation,
        capacity,
        speed,
        latency
    from products
        join rams on products.id = rams.id
end
go

create procedure getSSD
as
begin
    select
        ssds.id,
        sellingPrice,
        costPrice,
        description,
        name,
        interface,
        capacity,
        cache
    from products
        join ssds on products.id = ssds.id
end
go

create procedure getPSU
as
begin
    select
        psus.id,
        sellingPrice,
        costPrice,
        description,
        name,
        wattage,
        efficiency
    from products
        join psus on products.id = psus.id
end
go
CREATE PROCEDURE updateProductCPU
    @id int,
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
    @image nvarchar(max),
    @result varchar(50) output
AS
BEGIN
    IF NOT EXISTS (SELECT 1
    FROM cpus
    WHERE id = @id)
    BEGIN
        SET @result = 'Product not found with ID: ' + CAST(@id AS nvarchar)
        RETURN
    END
    UPDATE products
    SET sellingPrice = @sellingPrice,
        costPrice = @costPrice
    WHERE id = @id

    UPDATE cpus
    SET name = @name,
        generation = @generation,
        socket = @socket,
        cores = @cores,
        threads = @threads,
        baseClock = @baseClock,
        boostClock = @boostClock,
        tdp = @tdp,
        image = @image
    WHERE id = @id

    SET @result = 'Update successful'
END;
GO

CREATE PROCEDURE updateProductGPU
    @id int,
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @generation nvarchar(50),
    @vram int,
    @baseClock int,
    @boostClock int,
    @tdp int,
    @image nvarchar(max),
    @result varchar(50) output
AS
BEGIN
    IF NOT EXISTS (SELECT 1
    FROM gpus
    WHERE id = @id)
    BEGIN
        SET @result = 'Product not found with ID: ' + CAST(@id AS nvarchar)
        RETURN
    END
    UPDATE products
    SET sellingPrice = @sellingPrice,
        costPrice = @costPrice
    WHERE id = @id

    UPDATE gpus
    SET name = @name,
        generation = @generation,
        vram = @vram,
        baseClock = @baseClock,
        boostClock = @boostClock,
        tdp = @tdp,
        image = @image
    WHERE id = @id

    SET @result = 'Update successful'
END;
GO

CREATE PROCEDURE updateProductMotherboard
    @id int,
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @socket nvarchar(10),
    @chipset nvarchar(50),
    @formFactor nvarchar(50),
    @ramType nvarchar(50),
    @maxRamSpeed int,
    @ramSlots int,
    @wifi bit,
    @image nvarchar(max),
    @result varchar(50) output
AS
BEGIN
    IF NOT EXISTS (SELECT 1
    FROM motherboards
    WHERE id = @id)
    BEGIN
        SET @result = 'Product not found with ID: ' + CAST(@id AS nvarchar)
        RETURN
    END
    UPDATE products
    SET sellingPrice = @sellingPrice,
        costPrice = @costPrice
    WHERE id = @id

    UPDATE motherboards
    SET name = @name,
        socket = @socket,
        chipset = @chipset,
        formFactor = @formFactor,
        ramType = @ramType,
        maxRamSpeed = @maxRamSpeed,
        ramSlots = @ramSlots,
        wifi = @wifi,
        image = @image
    WHERE id = @id

    SET @result = 'Update successful'
END;
GO

CREATE PROCEDURE updateProductPSU
    @id int,
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @wattage int,
    @efficiency nvarchar(50),
    @image nvarchar(max),
    @result varchar(50) output
AS
BEGIN
    IF NOT EXISTS (SELECT 1
    FROM psus
    WHERE id = @id)
    BEGIN
        SET @result = 'Product not found with ID: ' + CAST(@id AS nvarchar)
        RETURN
    END
    UPDATE products
    SET sellingPrice = @sellingPrice,
        costPrice = @costPrice
    WHERE id = @id

    UPDATE psus
    SET name = @name,
        wattage = @wattage,
        efficiency = @efficiency,
        image = @image
    WHERE id = @id

    SET @result = 'Update successful'
END;
GO

CREATE PROCEDURE updateProductRAM
    @id int,
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @generation nvarchar(50),
    @capacity int,
    @speed int,
    @latency int,
    @image nvarchar(max),
    @result varchar(50) OUTPUT
AS
BEGIN
    IF NOT EXISTS (SELECT 1
    FROM rams
    WHERE id = @id)
    BEGIN
        SET @result = 'Product not found with ID: ' + CAST(@id AS nvarchar)
        RETURN
    END
    UPDATE products
    SET sellingPrice = @sellingPrice,
        costPrice = @costPrice
    WHERE id = @id

    UPDATE rams
    SET name = @name,
        generation = @generation,
        capacity = @capacity,
        speed = @speed,
        latency = @latency,
        image = @image
    WHERE id = @id

    SET @result = 'Update successful'
END;
GO

CREATE PROCEDURE updateProductSSD
    @id int,
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @name nvarchar(50),
    @interface nvarchar(50),
    @capacity int,
    @cache int,
    @image nvarchar(max),
    @result varchar(50) OUTPUT
AS
BEGIN
    IF NOT EXISTS (SELECT 1
    FROM ssds
    WHERE id = @id)
    BEGIN
        SET @result = 'Product not found with ID: ' + CAST(@id AS nvarchar)
        RETURN
    END
    UPDATE products
    SET sellingPrice = @sellingPrice,
        costPrice = @costPrice
    WHERE id = @id

    UPDATE ssds
    SET name = @name,
        interface = @interface,
        capacity = @capacity,
        cache = @cache,
        image = @image
    WHERE id = @id

    SET @result = 'Update successful'
END;
GO
