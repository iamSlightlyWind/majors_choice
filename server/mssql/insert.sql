use major

DECLARE @resultInt int
-- User 1
EXEC register 
    @username = 'davitscott', 
    @password = 'password123', 
    @fullname = 'Davit Scott', 
    @email = 'davitscott@example.com', 
    @phoneNumber = '123-456-7890', 
    @address = '123 Main St, Anytown, USA', 
    @dateOfBirth = '1980-01-01', 
    @result = @resultInt OUTPUT

PRINT @resultInt

-- User 2
EXEC register 
    @username = 'emilyjohnson', 
    @password = 'password456', 
    @fullname = 'Emily Johnson', 
    @email = 'emilyjohnson@example.com', 
    @phoneNumber = '234-567-8901', 
    @address = '456 Elm St, Anytown, USA', 
    @dateOfBirth = '1985-02-02', 
    @result = @resultInt OUTPUT

PRINT @resultInt

-- User 3
EXEC register 
    @username = 'michaelbrown', 
    @password = 'password789', 
    @fullname = 'Michael Brown', 
    @email = 'michaelbrown@example.com', 
    @phoneNumber = '345-678-9012', 
    @address = '789 Pine St, Anytown, USA', 
    @dateOfBirth = '1990-03-03', 
    @result = @resultInt OUTPUT

PRINT @resultInt

-- User 4
EXEC register 
    @username = 'sarahmiller', 
    @password = 'password012', 
    @fullname = 'Sarah Miller', 
    @email = 'sarahmiller@example.com', 
    @phoneNumber = '456-789-0123', 
    @address = '012 Oak St, Anytown, USA', 
    @dateOfBirth = '1995-04-04', 
    @result = @resultInt OUTPUT

PRINT @resultInt

-- User 5
EXEC register 
    @username = 'jamesdavis', 
    @password = 'password345', 
    @fullname = 'James Davis', 
    @email = 'jamesdavis@example.com', 
    @phoneNumber = '567-890-1234', 
    @address = '345 Maple St, Anytown, USA', 
    @dateOfBirth = '2000-05-05', 
    @result = @resultInt OUTPUT

PRINT @resultInt

-- User 6 with duplicate username from User 1
EXEC register 
    @username = 'davitscott', 
    @password = 'password678', 
    @fullname = 'Robert White', 
    @email = 'robertwhite@example.com', 
    @phoneNumber = '678-901-2345', 
    @address = '678 Cedar St, Anytown, USA', 
    @dateOfBirth = '1985-06-06', 
    @result = @resultInt OUTPUT

PRINT @resultInt

-- User 7 with duplicate email from User 2
EXEC register 
    @username = 'jenniferblack', 
    @password = 'password901', 
    @fullname = 'Jennifer Black', 
    @email = 'emilyjohnson@example.com', 
    @phoneNumber = '789-012-3456', 
    @address = '901 Willow St, Anytown, USA', 
    @dateOfBirth = '1990-07-07', 
    @result = @resultInt OUTPUT

PRINT @resultInt

-- User 8 with duplicate phone number from User 3
EXEC register 
    @username = 'williamgreen', 
    @password = 'password234', 
    @fullname = 'William Green', 
    @email = 'williamgreen@example.com', 
    @phoneNumber = '345-678-9012', 
    @address = '234 Pine St, Anytown, USA', 
    @dateOfBirth = '1995-08-08', 
    @result = @resultInt OUTPUT
    
PRINT @resultInt

-- >> Add CPUs
DECLARE @result varchar(50)

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'AMD Ryzen 5 5500',
    @generation = 'Cezanne',
    @socket = 'AM4',
    @cores = 6,
    @threads = 12,
    @baseClock = 3.6,
    @boostClock = 4.2,
    @tdp = 65,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'AMD Ryzen 7 5700X',
    @generation = 'Vermeer',
    @socket = 'AM4',
    @cores = 8,
    @threads = 16,
    @baseClock = 3.4,
    @boostClock = 4.6,
    @tdp = 65,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'AMD Ryzen 7 7700X',
    @generation = 'Raphael',
    @socket = 'AM5',
    @cores = 8,
    @threads = 16,
    @baseClock = 4.5,
    @boostClock = 5.4,
    @tdp = 105,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'AMD Ryzen 9 7950X',
    @generation = 'Raphael',
    @socket = 'AM5',
    @cores = 16,
    @threads = 32,
    @baseClock = 4.5,
    @boostClock = 5.7,
    @tdp = 170,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'AMD Ryzen 5 5600',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 6,
    @threads = 12,
    @baseClock = 3.7,
    @boostClock = 4.6,
    @tdp = 65,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'AMD Ryzen 7 5800X',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 8,
    @threads = 16,
    @baseClock = 3.8,
    @boostClock = 4.7,
    @tdp = 105,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'AMD Ryzen 9 5900X',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 12,
    @threads = 24,
    @baseClock = 3.7,
    @boostClock = 4.8,
    @tdp = 105,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'AMD Ryzen 9 5950X',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 16,
    @threads = 32,
    @baseClock = 3.4,
    @boostClock = 4.9,
    @tdp = 105,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'AMD Ryzen 7 7700X',
    @generation = 'Raphael',
    @socket = 'AM5',
    @cores = 8,
    @threads = 16,
    @baseClock = 4.5,
    @boostClock = 5.4,
    @tdp = 105,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'AMD Ryzen 9 7950X',
    @generation = 'Raphael',
    @socket = 'AM5',
    @cores = 16,
    @threads = 32,
    @baseClock = 4.5,
    @boostClock = 5.7,
    @tdp = 170,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'Intel Core i7-13700K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 16,
    @threads = 24,
    @baseClock = 3.4,
    @boostClock = 5.4,
    @tdp = 125,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'Intel Core i9-13900K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3,
    @boostClock = 5.8,
    @tdp = 125,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'Intel Core i7-14700F',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 20,
    @threads = 28,
    @baseClock = 3.6,
    @boostClock = 5.5,
    @tdp = 125,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'Intel Core i9-14900F',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3.5,
    @boostClock = 5.8,
    @tdp = 125,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'Intel Core i5-13600K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 14,
    @threads = 20,
    @baseClock = 3.5,
    @boostClock = 5.1,
    @tdp = 125,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'Intel Core i5-13600KF',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 14,
    @threads = 20,
    @baseClock = 3.5,
    @boostClock = 5.1,
    @tdp = 125,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'Intel Core i9-13900KF',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3,
    @boostClock = 5.8,
    @tdp = 125,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'Intel Core i7-13700KF',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 16,
    @threads = 24,
    @baseClock = 3.4,
    @boostClock = 5.4,
    @tdp = 125,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'Intel Core i9-14900K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3.2,
    @boostClock = 6,
    @tdp = 125,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'Intel Core i9-14900KF',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3.2,
    @boostClock = 6,
    @tdp = 125,
    @result = @result OUTPUT

PRINT @result

EXEC addProductCPU
    @sellingPrice = 0,
    @costPrice = 0,
    @name = 'Intel Core i7-14700K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 20,
    @threads = 28,
    @baseClock = 3.4,
    @boostClock = 5.6,
    @tdp = 125,
    @result = @result OUTPUT

PRINT @result

select * from cpus