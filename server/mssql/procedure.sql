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
    @password varchar(25),
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
        SET @sql = N'SELECT id, username, password, active FROM ' + QUOTENAME(@tablename) + ' WHERE position = 0';
    END
    ELSE
    BEGIN
        SET @sql = N'SELECT id, username, password, active FROM ' + QUOTENAME(@tablename);
    END
    
    EXEC sp_executesql @sql;
END;
go

CREATE PROCEDURE updateUserInformation
    @tablename varchar(25),
    @username varchar(25),
    @password varchar(25),
    @fullname nvarchar(50),
    @email varchar(100),
    @phoneNumber varchar(15),
    @address nvarchar(100),
    @dateOfBirth date,
    @result int output
AS
BEGIN
    DECLARE @id int;

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

        SET @result = 1; -- Update successful
    END
    ELSE IF @tablename = 'staffs' OR @tablename = 'managers'
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
        SET @result = 1; -- Update successful
    END
END;