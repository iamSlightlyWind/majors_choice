use major
go

create procedure login
    @username varchar(25),
    @password varchar(100),
    @result int output
as
begin
    if exists (SELECT 1
    FROM users
    WHERE username = @username and googleUser = 1)
    begin
        set @result = -2
    -- login failed, cannot login google account with normal login
    end
    else if exists (SELECT 1
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

create procedure googleLogin
    @username varchar(25),
    @password varchar(100),
    @result int output
as
begin
    if exists (SELECT 1
    FROM users
    WHERE username = @username and password = @password and googleUser = 1 and active = 1)
    begin
        set @result = 1
    -- login successful
    end
    else
    begin
        set @result = 0
    -- login failed
    end
end;
go

create procedure setGoogleUser
    @username varchar(25),
    @result int output
as
begin
    update users
    set googleUser = 1
    where username = @username
    set @result = 1
end;
go

create procedure userExists
    @email varchar(50),
    @result int output
as
begin
    if exists (SELECT 1
    FROM userDetails
    WHERE email = @email)
    begin
        set @result = 1
    -- exists
    end
    else
    begin
        set @result = 0
    -- not exists
    end
end;
go

create procedure forceActivate
    @username varchar(25),
    @result int output
as
begin
    update users
    set active = 1
    where username = @username
    set @result = 1
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

CREATE PROCEDURE register
    @tablename varchar(25),
    @username varchar(25),
    @password varchar(100),
    @fullname nvarchar(50),
    @email varchar(100),
    @phoneNumber varchar(15),
    @address nvarchar(100),
    @dateOfBirth date,
    @confirmCode varchar(10),
    @result int OUTPUT
AS
BEGIN
    -- User registration
    IF @tablename = 'user' OR @tablename IS NULL
    BEGIN
        -- Check if username exists
        IF EXISTS (SELECT 1 FROM users WHERE username = @username)
        BEGIN
            SET @result = -1
            -- Username already exists
        END
        -- Check if email exists
        ELSE IF EXISTS (SELECT 1 FROM userDetails WHERE email = @email)
        BEGIN
            SET @result = -2
            -- Email already exists
        END
        -- Check if phone number exists
        ELSE IF EXISTS (SELECT 1 FROM userDetails WHERE phoneNumber = @phoneNumber)
        BEGIN
            SET @result = -3
            -- Phone number already exists
        END
        ELSE
        BEGIN
            -- Insert into users table
            INSERT INTO users (username, password, confirmCode)
            VALUES (@username, @password, @confirmCode)

            -- Get the last inserted ID
            DECLARE @uid INT
            SET @uid = SCOPE_IDENTITY()

            -- Insert into userDetails table
            INSERT INTO userDetails (id, fullname, email, phoneNumber, address, dateOfBirth)
            VALUES (@uid, @fullname, @email, @phoneNumber, @address, @dateOfBirth)

            SET @result = 1
            -- Registration successful
        END
    END

    -- Staff registration
    IF @tablename = 'staff'
    BEGIN
        -- Check if username exists
        IF EXISTS (SELECT 1 FROM staffs WHERE username = @username)
        BEGIN
            SET @result = -1
            -- Username already exists
        END
        -- Check if email exists
        ELSE IF EXISTS (SELECT 1 FROM staffDetails WHERE email = @email)
        BEGIN
            SET @result = -2
            -- Email already exists
        END
        -- Check if phone number exists
        ELSE IF EXISTS (SELECT 1 FROM staffDetails WHERE phoneNumber = @phoneNumber)
        BEGIN
            SET @result = -3
            -- Phone number already exists
        END
        ELSE
        BEGIN
            -- Insert into staffs table
            INSERT INTO staffs (username, password, possition, active)
            VALUES (@username, @password, 0, 1)

            -- Get the last inserted ID
            DECLARE @sid INT
            SET @sid = SCOPE_IDENTITY()

            -- Insert into staffDetails table
            INSERT INTO staffDetails (id, fullname, email, phoneNumber, address, dateOfBirth)
            VALUES (@sid, @fullname, @email, @phoneNumber, @address, @dateOfBirth)

            SET @result = 1
            -- Registration successful
        END
    END
END;
go

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
    @image nvarchar(max),
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
    @image nvarchar(max),
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
    @image nvarchar(max),
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
    @image nvarchar(max),
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
    @image nvarchar(max),
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
    @image nvarchar(max),
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

create procedure loginEmployee
	@username varchar(25),
    @password varchar(25),
	@result int output
as
begin
    if exists (select 1 from staffs where username = @username and password = @password and possition = 1 and active = 1)
	begin
		set @result = 1
		--login with the Manager role
	end
	else if exists (select 1 from staffs where username = @username and password = @password and possition = 0 and active = 1)
	begin
		set @result = 0
		--login with staff role
	end
	else 
	begin
		set @result = -1
		--login failed. Staff or Manager has been removed
	end
end;

go

CREATE PROCEDURE GetUserDetailsByUsername
    @inputUsername varchar(25),
	@tableName varchar(25)
AS
BEGIN
    DECLARE @userId int;
    if(@tableName='users')
	begin
	SELECT @userId = id FROM users WHERE username = @inputUsername

    SELECT users.username,
        users.password,
        userDetails.fullname AS name,
        userDetails.email,
        userDetails.phoneNumber AS phone,
        userDetails.address,
        userDetails.dateOfBirth AS dob
    FROM users
        JOIN userDetails ON users.id = userDetails.id
    WHERE users.id = @userId
	end
	else if(@tableName='staffs' or @tableName='managers')
	begin
		select @userId = id from staffs where username = @inputUsername

	    SELECT staffs.username,
        staffs.password,
        staffDetails.fullname AS name,
        staffDetails.email,
        staffDetails.phoneNumber AS phone,
        staffDetails.address,
        staffDetails.dateOfBirth AS dob
    FROM staffs
        JOIN staffDetails ON staffs.id = staffDetails.id
    WHERE staffs.id = @userId
	end
END;
go

CREATE PROCEDURE GetUserDetails
    @tablename varchar(25)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);

    IF @tablename = 'staffs'
    BEGIN
        SET @sql = N'SELECT s.id, s.username, s.password, s.active, sd.dateJoined 
                    FROM ' + QUOTENAME(@tablename) + ' s 
                    INNER JOIN staffDetails sd ON s.id = sd.id 
                    WHERE s.possition = 0';
    END
    ELSE IF @tablename = 'users'
    BEGIN
        SET @sql = N'SELECT u.id, u.username, u.password, u.active, ud.dateJoined 
                    FROM ' + QUOTENAME(@tablename) + ' u INNER JOIN userDetails ud ON u.id = ud.id';
    END
    
    EXEC sp_executesql @sql;
END;
go

CREATE PROCEDURE updateUserInformation
    @tablename varchar(25),
    @username varchar(25),
    @password varchar(100),
    @fullname nvarchar(50),
    @email varchar(100),
    @phoneNumber varchar(15),
    @address nvarchar(100),
    @dateOfBirth date,
	@active int,
    @result int output
AS
BEGIN
    DECLARE @id int
    set @id = (select id
    from users
    where username = @username)

    IF @tablename = 'users'
    BEGIN
        -- Get user ID
        SELECT @id = id FROM users WHERE username = @username;
        
        -- Check email existence
        IF @email IS NOT NULL AND EXISTS (SELECT 1 FROM userDetails WHERE email = @email AND id <> @id)
        BEGIN
            SET @result = -1; -- Email already exists
            RETURN;
        END
        
        -- Check phone number existence
        IF @phoneNumber IS NOT NULL AND EXISTS (SELECT 1 FROM userDetails WHERE phoneNumber = @phoneNumber AND id <> @id)
        BEGIN
            SET @result = -2; -- Phone number already exists
            RETURN;
        END

        -- Update user information
        IF @password IS NOT NULL
        BEGIN
            UPDATE users
            SET password = @password
            WHERE id = @id;
        END
        
		IF @fullname IS NOT NULL
		BEGIN
			 UPDATE userDetails
			SET fullname = @fullname
			WHERE id = @id
		END

		IF @email IS NOT NULL
		BEGIN
			UPDATE userDetails
			SET email = @email
			WHERE id = @id
		END

		IF @phoneNumber IS NOT NULL
		BEGIN
			UPDATE userDetails
			SET phoneNumber = @phoneNumber
			WHERE id = @id
		END

		IF @address IS NOT NULL
		BEGIN
			UPDATE userDetails
			SET address = @address
			WHERE id = @id
		END

		IF @dateOfBirth IS NOT NULL
		BEGIN
			UPDATE userDetails
			SET dateOfBirth = @dateOfBirth
			WHERE id = @id
		END

		IF @active IS NOT NULL
		BEGIN
			UPDATE users
			SET active = @active
			WHERE id = @id
		END

        SET @result = 1; -- Update successful
    END
    ELSE IF @tablename = 'staffs' OR @tablename = 'manager'
    BEGIN
        -- Get staff ID
        SELECT @id = id FROM staffs WHERE username = @username;

        -- Check email existence
        IF @email IS NOT NULL AND EXISTS (SELECT 1 FROM staffDetails WHERE email = @email AND id <> @id)
        BEGIN
            SET @result = -1; -- Email already exists
            RETURN;
        END
        
        -- Check phone number existence
        IF @phoneNumber IS NOT NULL AND EXISTS (SELECT 1 FROM staffDetails WHERE phoneNumber = @phoneNumber AND id <> @id)
        BEGIN
            SET @result = -2; -- Phone number already exists
            RETURN;
        END

        -- Update staff information
        IF @password IS NOT NULL
        BEGIN
            UPDATE staffs
            SET password = @password
            WHERE id = @id;
        END

		IF @fullname IS NOT NULL
		BEGIN
			UPDATE staffDetails
			SET fullname = @fullname
			WHERE id = @id
		END

		IF @email IS NOT NULL
		BEGIN
			UPDATE staffDetails
			SET email = @email
			WHERE id = @id
		END

		IF @phoneNumber IS NOT NULL
		BEGIN
			UPDATE staffDetails
			SET phoneNumber = @phoneNumber
			WHERE id = @id
		END

		IF @address IS NOT NULL
		BEGIN
			UPDATE staffDetails
			SET address = @address
			WHERE id = @id
		END

		IF @dateOfBirth IS NOT NULL
		BEGIN
			UPDATE staffDetails
			SET dateOfBirth = @dateOfBirth
			WHERE id = @id
		END

		IF @active IS NOT NULL
		BEGIN
			UPDATE staffs
			SET active = @active
			WHERE id = @id
		END

        SET @result = 1; -- Update successful
    END
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

create procedure deleteCart
    @userID int,
    @result int output
as
begin
    if exists (select 1
    from users
    where id = @userID)
    begin
        delete from carts
        where userID = @userID
        set @result = 1
    end
    else
    begin
        set @result = 0
    end
end;
go

create procedure addToCart
    @userID int,
    @productID int,
    @sellingPrice decimal(18,2),
    @costPrice decimal(18,2),
    @result int output
as
begin
    if exists (select 1
    from users
    where id = @userID)
    begin
        insert into carts
            (userID, productID, sellingPrice, costPrice)
        values
            (@userID, @productID, @sellingPrice, @costPrice)
        set @result = 1
    end
    else
    begin
        set @result = 0
    end
end;
go

create procedure getCart
    @userID int
as
begin
    select *
    from carts
    where userID = @userID
end;
go

CREATE PROCEDURE placeOrder
    @userID int,
    @result int OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1
    FROM users
    WHERE id = @userID)
    BEGIN
        INSERT INTO orders
            (id, userId, productId, sellingPrice, costPrice, status)
        SELECT
            (SELECT ISNULL(MAX(id), 0) + 1
            FROM orders),
            userID,
            productID,
            sellingPrice,
            costPrice,
            'Pending'
        FROM carts
        WHERE userID = @userID;

        DELETE FROM carts
        WHERE userID = @userID;

        SET @result = 1;
    END
    ELSE
    BEGIN
        SET @result = 0;
    END
END;
GO

CREATE PROCEDURE getCartItems
    @userId int
AS
BEGIN
    SELECT
        c.productId,
        c.sellingPrice,
        c.costPrice,
        CASE 
            WHEN cpus.id IS NOT NULL THEN 'CPU'
            WHEN gpus.id IS NOT NULL THEN 'GPU'
            WHEN motherboards.id IS NOT NULL THEN 'Motherboard'
            WHEN rams.id IS NOT NULL THEN 'RAM'
            WHEN ssds.id IS NOT NULL THEN 'SSD'
            WHEN psus.id IS NOT NULL THEN 'PSU'
            WHEN cases.id IS NOT NULL THEN 'Case'
            ELSE 'Unknown'
        END AS productType
    FROM
        carts c
        LEFT JOIN cpus ON c.productId = cpus.id
        LEFT JOIN gpus ON c.productId = gpus.id
        LEFT JOIN motherboards ON c.productId = motherboards.id
        LEFT JOIN rams ON c.productId = rams.id
        LEFT JOIN ssds ON c.productId = ssds.id
        LEFT JOIN psus ON c.productId = psus.id
        LEFT JOIN cases ON c.productId = cases.id
    WHERE 
        c.userId = @userId;
END
go

CREATE PROCEDURE getOrders
    @userId int
AS
BEGIN
    SELECT
        o.id,
        o.userId,
        o.productId,
        o.sellingPrice,
        o.costPrice,
        o.status,
        o.dateOrdered,
        CASE 
            WHEN cpus.id IS NOT NULL THEN cpus.name
            WHEN gpus.id IS NOT NULL THEN gpus.name
            WHEN motherboards.id IS NOT NULL THEN motherboards.name
            WHEN rams.id IS NOT NULL THEN rams.name
            WHEN ssds.id IS NOT NULL THEN ssds.name
            WHEN psus.id IS NOT NULL THEN psus.name
            WHEN cases.id IS NOT NULL THEN cases.name
            ELSE 'Unknown'
        END AS productName
    FROM
        orders o
        INNER JOIN products p ON o.productId = p.id
        LEFT JOIN cpus ON o.productId = cpus.id
        LEFT JOIN gpus ON o.productId = gpus.id
        LEFT JOIN motherboards ON o.productId = motherboards.id
        LEFT JOIN rams ON o.productId = rams.id
        LEFT JOIN ssds ON o.productId = ssds.id
        LEFT JOIN psus ON o.productId = psus.id
        LEFT JOIN cases ON o.productId = cases.id
    WHERE 
        o.userId = @userId;
END;
go