use major

DECLARE @result int
-- User 1
EXEC register 
    @username = 'davitscott', 
    @password = 'password123', 
    @fullname = 'Davit Scott', 
    @email = 'davitscott@example.com', 
    @phoneNumber = '123-456-7890', 
    @address = '123 Main St, Anytown, USA', 
    @dateOfBirth = '1980-01-01',
    @confirmCode = 'BfklE',
    @result = @result OUTPUT

PRINT @result

-- User 2
EXEC register 
    @username = 'emilyjohnson', 
    @password = 'password456', 
    @fullname = 'Emily Johnson', 
    @email = 'emilyjohnson@example.com', 
    @phoneNumber = '234-567-8901', 
    @address = '456 Elm St, Anytown, USA', 
    @dateOfBirth = '1985-02-02', 
    @confirmCode = 'DfjgR',
    @result = @result OUTPUT

PRINT @result

-- User 3
EXEC register 
    @username = 'michaelbrown', 
    @password = 'password789', 
    @fullname = 'Michael Brown', 
    @email = 'michaelbrown@example.com', 
    @phoneNumber = '345-678-9012', 
    @address = '789 Pine St, Anytown, USA', 
    @dateOfBirth = '1990-03-03', 
    @confirmCode = 'GhjKl',
    @result = @result OUTPUT

PRINT @result

-- User 4
EXEC register 
    @username = 'sarahmiller', 
    @password = 'password012', 
    @fullname = 'Sarah Miller', 
    @email = 'sarahmiller@example.com', 
    @phoneNumber = '456-789-0123', 
    @address = '012 Oak St, Anytown, USA', 
    @dateOfBirth = '1995-04-04', 
    @confirmCode = 'JkLmN',
    @result = @result OUTPUT

PRINT @result

-- User 5
EXEC register 
    @username = 'jamesdavis', 
    @password = 'password345', 
    @fullname = 'James Davis', 
    @email = 'jamesdavis@example.com', 
    @phoneNumber = '567-890-1234', 
    @address = '345 Maple St, Anytown, USA', 
    @dateOfBirth = '2000-05-05', 
    @confirmCode = 'LmNoP',
    @result = @result OUTPUT

PRINT @result

-- User 6 with duplicate username from User 1
EXEC register 
    @username = 'davitscott', 
    @password = 'password678', 
    @fullname = 'Robert White', 
    @email = 'robertwhite@example.com', 
    @phoneNumber = '678-901-2345', 
    @address = '678 Cedar St, Anytown, USA', 
    @dateOfBirth = '1985-06-06', 
    @confirmCode = 'NpQrS',
    @result = @result OUTPUT

PRINT @result

-- User 7 with duplicate email from User 2
EXEC register 
    @username = 'jenniferblack', 
    @password = 'password901', 
    @fullname = 'Jennifer Black', 
    @email = 'emilyjohnson@example.com', 
    @phoneNumber = '789-012-3456', 
    @address = '901 Willow St, Anytown, USA', 
    @dateOfBirth = '1990-07-07', 
    @confirmCode = 'QrStU',
    @result = @result OUTPUT

PRINT @result

-- User 8 with duplicate phone number from User 3
EXEC register 
    @username = 'williamgreen', 
    @password = 'password234', 
    @fullname = 'William Green', 
    @email = 'williamgreen@example.com', 
    @phoneNumber = '345-678-9012', 
    @address = '234 Pine St, Anytown, USA', 
    @dateOfBirth = '1995-08-08', 
    @confirmCode = 'StUvW',
    @result = @result OUTPUT

PRINT @result

select * from users