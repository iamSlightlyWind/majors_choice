use major
go

-- Insert into staffs table with Manager Role
INSERT INTO staffs (username, password, possition, active) 
VALUES ('thangnvhe', '123', 1, 1);

-- Get the ID of the inserted staff member
DECLARE @id INT;
SET @id = SCOPE_IDENTITY();

-- Insert into staffDetails table using the obtained staff ID
INSERT INTO staffDetails (id, fullname, email, phoneNumber, address,dateOfBirth) 
VALUES (@id, 'Nguyen Van Thang', 'thangnvhe171327@fpt.edu.vn', '023432234', 'Viet Nam','1985-05-15');

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



