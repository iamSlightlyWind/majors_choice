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
    @confirmCode = 'BfklE',
    @result = @resultInt OUTPUT

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
    @result = @resultInt OUTPUT

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
    @result = @resultInt OUTPUT

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
    @result = @resultInt OUTPUT

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
    @result = @resultInt OUTPUT

INSERT INTO staffs
    (username, password, possition, fullname, active)
VALUES
    ('manager', 'password', 1, 'Manager', 1);

EXEC addStaff @username = 'staff1', @password = 'password2', @fullname = 'Staff One', @result = @resultInt OUTPUT;
EXEC addStaff @username = 'staff2', @password = 'password3', @fullname = 'Staff Two', @result = @resultInt OUTPUT;
EXEC addStaff @username = 'staff3', @password = 'password4', @fullname = 'Staff Three', @result = @resultInt OUTPUT;
EXEC addStaff @username = 'staff4', @password = 'password5', @fullname = 'Staff Four', @result = @resultInt OUTPUT;

-- >> Add CPUs
DECLARE @result varchar(50)

EXEC addProductCPU
    @sellingPrice = 5200000,
    @costPrice = 4500000,
    @name = 'AMD Ryzen 5 5500',
    @generation = 'Cezanne',
    @socket = 'AM4',
    @cores = 6,
    @threads = 12,
    @baseClock = 3.6,
    @boostClock = 4.2,
    @tdp = 65,
    @image = '',
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 7500000,
    @costPrice = 6500000,
    @name = 'AMD Ryzen 7 5700X',
    @generation = 'Vermeer',
    @socket = 'AM4',
    @cores = 8,
    @threads = 16,
    @baseClock = 3.4,
    @boostClock = 4.6,
    @tdp = 65,
    @image = '',
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 13000000,
    @costPrice = 11000000,
    @name = 'AMD Ryzen 9 7950X',
    @generation = 'Raphael',
    @socket = 'AM5',
    @cores = 16,
    @threads = 32,
    @baseClock = 4.5,
    @boostClock = 5.7,
    @tdp = 170,
    @image = '',
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 5000000,
    @costPrice = 5800000,
    @name = 'AMD Ryzen 5 5600',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 6,
    @threads = 12,
    @baseClock = 3.7,
    @boostClock = 4.6,
    @tdp = 65,
    @image = '',
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 7800000,
    @costPrice = 9000000,
    @name = 'AMD Ryzen 7 5800X',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 8,
    @threads = 16,
    @baseClock = 3.8,
    @boostClock = 4.7,
    @tdp = 105,
    @image = '',
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 10500000,
    @costPrice = 9000000,
    @name = 'AMD Ryzen 9 5900X',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 12,
    @threads = 24,
    @baseClock = 3.7,
    @boostClock = 4.8,
    @tdp = 105,
    @image = '',
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 12000000,
    @costPrice = 10500000,
    @name = 'AMD Ryzen 9 5950X',
    @generation = 'Zen 3',
    @socket = 'AM4',
    @cores = 16,
    @threads = 32,
    @baseClock = 3.4,
    @boostClock = 4.9,
    @tdp = 105,
    @image = '',
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 9500000,
    @costPrice = 8000000,
    @name = 'AMD Ryzen 7 7700X',
    @generation = 'Raphael',
    @socket = 'AM5',
    @cores = 8,
    @threads = 16,
    @baseClock = 4.5,
    @boostClock = 5.4,
    @tdp = 105,
    @image = '',
    @result = @result OUTPUT

EXEC addProductCPU
    @sellingPrice = 7500000,
    @costPrice = 8500000,
    @name = 'Intel Core i7-13700K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 16,
    @threads = 24,
    @baseClock = 3.4,
    @boostClock = 5.4,
    @tdp = 125,
    @image = '',
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 11000000,
    @costPrice = 9500000,
    @name = 'Intel Core i9-13900K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3,
    @boostClock = 5.8,
    @tdp = 125,
    @image = '',
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 09700000,
    @costPrice = 8200000,
    @name = 'Intel Core i7-14700F',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 20,
    @threads = 28,
    @baseClock = 3.6,
    @boostClock = 5.5,
    @tdp = 125,
    @image = '',
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 011500000,
    @costPrice = 010000000,
    @name = 'Intel Core i9-14900F',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3.5,
    @boostClock = 5.8,
    @tdp = 125,
    @image = '',
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 07000000,
    @costPrice = 06000000,
    @name = 'Intel Core i5-13600K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 14,
    @threads = 20,
    @baseClock = 3.5,
    @boostClock = 5.1,
    @tdp = 125,
    @image = '',
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 06500000,
    @costPrice = 05500000,
    @name = 'Intel Core i5-13600KF',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 14,
    @threads = 20,
    @baseClock = 3.5,
    @boostClock = 5.1,
    @tdp = 125,
    @image = '',
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 010500000,
    @costPrice = 09000000,
    @name = 'Intel Core i9-13900KF',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3,
    @boostClock = 5.8,
    @tdp = 125,
    @image = '',
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 08000000,
    @costPrice = 07000000,
    @name = 'Intel Core i7-13700KF',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 16,
    @threads = 24,
    @baseClock = 3.4,
    @boostClock = 5.4,
    @tdp = 125,
    @image = '',
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 012000000,
    @costPrice = 010500000,
    @name = 'Intel Core i9-14900K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3.2,
    @boostClock = 6,
    @tdp = 125,
    @image = '',
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 011500000,
    @costPrice = 010000000,
    @name = 'Intel Core i9-14900KF',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 24,
    @threads = 32,
    @baseClock = 3.2,
    @boostClock = 6,
    @tdp = 125,
    @image = '',
    @result = @result OUTPUT


EXEC addProductCPU
    @sellingPrice = 010200000,
    @costPrice = 08700000,
    @name = 'Intel Core i7-14700K',
    @generation = 'Raptor Lake',
    @socket = 'LGA 1700',
    @cores = 20,
    @threads = 28,
    @baseClock = 3.4,
    @boostClock = 5.6,
    @tdp = 125,
    @image = '',
    @result = @result OUTPUT


-- >> Add GPUs
EXEC addProductGPU
    @sellingPrice = 14000000,
    @costPrice = 11000000,
    @name = 'AMD Radeon RX 6900 XT',
    @generation = 'RDNA 2',
    @vram = 16,
    @baseClock = 1825,
    @boostClock = 2250,
    @tdp = 300,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 11500000,
    @costPrice = 8500000,
    @name = 'AMD Radeon RX 6800 XT',
    @generation = 'RDNA 2',
    @vram = 16,
    @baseClock = 1825,
    @boostClock = 2250,
    @tdp = 300,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 10500000,
    @costPrice = 7500000,
    @name = 'AMD Radeon RX 6700 XT',
    @generation = 'RDNA 2',
    @vram = 12,
    @baseClock = 2321,
    @boostClock = 2581,
    @tdp = 230,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 8500000,
    @costPrice = 6000000,
    @name = 'AMD Radeon RX 6600 XT',
    @generation = 'RDNA 2',
    @vram = 8,
    @baseClock = 1968,
    @boostClock = 2589,
    @tdp = 160,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 27000000,
    @costPrice = 22000000,
    @name = 'NVIDIA GeForce RTX 3090',
    @generation = 'Ampere',
    @vram = 24,
    @baseClock = 1395,
    @boostClock = 1695,
    @tdp = 350,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 23000000,
    @costPrice = 18000000,
    @name = 'NVIDIA GeForce RTX 3080',
    @generation = 'Ampere',
    @vram = 10,
    @baseClock = 1440,
    @boostClock = 1710,
    @tdp = 320,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 20000000,
    @costPrice = 15000000,
    @name = 'NVIDIA GeForce RTX 3070',
    @generation = 'Ampere',
    @vram = 8,
    @baseClock = 1500,
    @boostClock = 1725,
    @tdp = 220,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 14000000,
    @costPrice = 11000000,
    @name = 'NVIDIA GeForce RTX 3060',
    @generation = 'Ampere',
    @vram = 8,
    @baseClock = 1410,
    @boostClock = 1665,
    @tdp = 200,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 20000000,
    @costPrice = 16000000,
    @name = 'AMD Radeon RX 7900 XTX',
    @generation = 'RDNA 3',
    @vram = 24,
    @baseClock = 1900,
    @boostClock = 2400,
    @tdp = 355,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 18000000,
    @costPrice = 14000000,
    @name = 'AMD Radeon RX 7900 XT',
    @generation = 'RDNA 3',
    @vram = 20,
    @baseClock = 1500,
    @boostClock = 2200,
    @tdp = 300,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 14000000,
    @costPrice = 11000000,
    @name = 'AMD Radeon RX 7800 XT',
    @generation = 'RDNA 3',
    @vram = 16,
    @baseClock = 1600,
    @boostClock = 2100,
    @tdp = 290,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 12000000,
    @costPrice = 9000000,
    @name = 'AMD Radeon RX 7700 XT',
    @generation = 'RDNA 3',
    @vram = 12,
    @baseClock = 1700,
    @boostClock = 2000,
    @tdp = 250,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 9000000,
    @costPrice = 7000000,
    @name = 'AMD Radeon RX 7600 XT',
    @generation = 'RDNA 3',
    @vram = 8,
    @baseClock = 1800,
    @boostClock = 2100,
    @tdp = 190,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 35000000,
    @costPrice = 30000000,
    @name = 'NVIDIA GeForce RTX 4090',
    @generation = 'Ada Lovelace',
    @vram = 24,
    @baseClock = 2235,
    @boostClock = 2520,
    @tdp = 450,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 30000000,
    @costPrice = 25000000,
    @name = 'NVIDIA GeForce RTX 4080',
    @generation = 'Ada Lovelace',
    @vram = 16,
    @baseClock = 2205,
    @boostClock = 2505,
    @tdp = 320,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 27000000,
    @costPrice = 22000000,
    @name = 'NVIDIA GeForce RTX 4070 Ti',
    @generation = 'Ada Lovelace',
    @vram = 12,
    @baseClock = 2310,
    @boostClock = 2610,
    @tdp = 285,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 23000000,
    @costPrice = 18000000,
    @name = 'NVIDIA GeForce RTX 4070',
    @generation = 'Ada Lovelace',
    @vram = 10,
    @baseClock = 2150,
    @boostClock = 2450,
    @tdp = 250,
    @image = '',
    @result = @result OUTPUT


EXEC addProductGPU
    @sellingPrice = 20000000,
    @costPrice = 15000000,
    @name = 'NVIDIA GeForce RTX 4060 Ti',
    @generation = 'Ada Lovelace',
    @vram = 8,
    @baseClock = 2100,
    @boostClock = 2400,
    @tdp = 220,
    @image = '',
    @result = @result OUTPUT



-- >> Add RAMs

EXEC addProductRAM
    @sellingPrice = 600000,
    @costPrice = 500000,
    @name = 'Corsair Vengeance LPX DDR4 1x8 2400',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2400,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 650000,
    @costPrice = 550000,
    @name = 'Corsair Vengeance LPX DDR4 1x8 2666',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2666,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 700000,
    @costPrice = 600000,
    @name = 'Corsair Vengeance LPX DDR4 1x8 3000',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 3000,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 750000,
    @costPrice = 650000,
    @name = 'Corsair Vengeance LPX DDR4 1x8 3200',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 3200,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 800000,
    @costPrice = 700000,
    @name = 'Corsair Vengeance LPX DDR4 1x8 3600',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 3600,
    @latentcy = 18,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1200000,
    @costPrice = 1000000,
    @name = 'Corsair Vengeance LPX DDR4 1x16 2400',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 2400,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1300000,
    @costPrice = 1100000,
    @name = 'Corsair Vengeance LPX DDR4 1x16 2666',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 2666,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1400000,
    @costPrice = 1200000,
    @name = 'Corsair Vengeance LPX DDR4 1x16 3000',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3000,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1500000,
    @costPrice = 1300000,
    @name = 'Corsair Vengeance LPX DDR4 1x16 3200',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3200,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1600000,
    @costPrice = 1400000,
    @name = 'Corsair Vengeance LPX DDR4 1x16 3600',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3600,
    @latentcy = 18,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 2400000,
    @costPrice = 2000000,
    @name = 'Corsair Vengeance LPX DDR4 1x32 2400',
    @generation = 'DDR4',
    @capacity = 32,
    @speed = 2400,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 2600000,
    @costPrice = 2200000,
    @name = 'Corsair Vengeance LPX DDR4 1x32 2666',
    @generation = 'DDR4',
    @capacity = 32,
    @speed = 2666,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 2800000,
    @costPrice = 2400000,
    @name = 'Corsair Vengeance LPX DDR4 1x32 3000',
    @generation = 'DDR4',
    @capacity = 32,
    @speed = 3000,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 600000,
    @costPrice = 500000,
    @name = 'Kingston HyperX Fury DDR4 1x8 2133',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2133,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 650000,
    @costPrice = 550000,
    @name = 'Kingston HyperX Fury DDR4 1x8 2400',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2400,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 700000,
    @costPrice = 600000,
    @name = 'Kingston HyperX Fury DDR4 1x8 2666',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2666,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 750000,
    @costPrice = 650000,
    @name = 'Kingston HyperX Fury DDR4 1x8 3000',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 3000,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 800000,
    @costPrice = 700000,
    @name = 'Kingston HyperX Fury DDR4 1x8 3200',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 3200,
    @latentcy = 18,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 850000,
    @costPrice = 750000,
    @name = 'Kingston HyperX Fury DDR4 1x8 3466',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 3466,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 800000,
    @costPrice = 650000,
    @name = 'Kingston HyperX Fury DDR4 1x16 2133',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 2133,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 850000,
    @costPrice = 700000,
    @name = 'Kingston HyperX Fury DDR4 1x16 2400',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 2400,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 900000,
    @costPrice = 750000,
    @name = 'Kingston HyperX Fury DDR4 1x16 2666',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 2666,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 950000,
    @costPrice = 800000,
    @name = 'Kingston HyperX Fury DDR4 1x16 3000',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3000,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1000000,
    @costPrice = 850000,
    @name = 'Kingston HyperX Fury DDR4 1x16 3200',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3200,
    @latentcy = 18,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1050000,
    @costPrice = 900000,
    @name = 'Kingston HyperX Fury DDR4 1x16 3466',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3466,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1400000,
    @costPrice = 1200000,
    @name = 'Kingston HyperX Fury DDR4 1x32 3200',
    @generation = 'DDR4',
    @capacity = 32,
    @speed = 3200,
    @latentcy = 18,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 550000,
    @costPrice = 450000,
    @name = 'G.Skill Ripjaws V DDR4 1x8 2400',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2400,
    @latentcy = 15,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 600000,
    @costPrice = 500000,
    @name = 'G.Skill Ripjaws V DDR4 1x8 2666',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2666,
    @latentcy = 15,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 650000,
    @costPrice = 550000,
    @name = 'G.Skill Ripjaws V DDR4 1x8 2800',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 2800,
    @latentcy = 15,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 700000,
    @costPrice = 600000,
    @name = 'G.Skill Ripjaws V DDR4 1x8 3000',
    @generation = 'DDR4',
    @capacity = 8,
    @speed = 3000,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 950000,
    @costPrice = 800000,
    @name = 'G.Skill Ripjaws V DDR4 1x16 2800',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 2800,
    @latentcy = 15,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1000000,
    @costPrice = 850000,
    @name = 'G.Skill Ripjaws V DDR4 1x16 3000',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3000,
    @latentcy = 15,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1050000,
    @costPrice = 900000,
    @name = 'G.Skill Ripjaws V DDR4 1x16 3200',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3200,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1150000,
    @costPrice = 1000000,
    @name = 'G.Skill Ripjaws V DDR4 1x16 3600',
    @generation = 'DDR4',
    @capacity = 16,
    @speed = 3600,
    @latentcy = 19,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1700000,
    @costPrice = 1500000,
    @name = 'G.Skill Ripjaws V DDR4 1x32 2666',
    @generation = 'DDR4',
    @capacity = 32,
    @speed = 2666,
    @latentcy = 18,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 1800000,
    @costPrice = 1600000,
    @name = 'G.Skill Ripjaws V DDR4 1x32 3200',
    @generation = 'DDR4',
    @capacity = 32,
    @speed = 3200,
    @latentcy = 16,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 3200000,
    @costPrice = 2800000,
    @name = 'G.Skill Trident DDR5 2x16 5600',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 5600,
    @latentcy = 28,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 3600000,
    @costPrice = 3200000,
    @name = 'G.Skill Trident DDR5 2x16 6000',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 6000,
    @latentcy = 32,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 4000000,
    @costPrice = 3600000,
    @name = 'G.Skill Trident DDR5 2x16 6400',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 6400,
    @latentcy = 36,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 4800000,
    @costPrice = 4200000,
    @name = 'G.Skill Trident DDR5 2x32 6000',
    @generation = 'DDR5',
    @capacity = 64,
    @speed = 6000,
    @latentcy = 30,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 5000000,
    @costPrice = 4500000,
    @name = 'Corsair Vengeance DDR5 2x16 5200',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 5200,
    @latentcy = 40,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 5300000,
    @costPrice = 4800000,
    @name = 'Corsair Vengeance DDR5 2x16 5600',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 5600,
    @latentcy = 36,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 5500000,
    @costPrice = 5000000,
    @name = 'Corsair Vengeance DDR5 2x16 6000',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 6000,
    @latentcy = 36,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 5700000,
    @costPrice = 5200000,
    @name = 'Corsair Vengeance DDR5 2x16 6200',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 6200,
    @latentcy = 36,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 5900000,
    @costPrice = 5400000,
    @name = 'Corsair Vengeance DDR5 2x16 6400',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 6400,
    @latentcy = 38,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6100000,
    @costPrice = 5600000,
    @name = 'Corsair Vengeance DDR5 2x16 6600',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 6600,
    @latentcy = 38,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6300000,
    @costPrice = 5800000,
    @name = 'Corsair Vengeance DDR5 2x16 6800',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 6800,
    @latentcy = 40,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6500000,
    @costPrice = 6000000,
    @name = 'Corsair Vengeance DDR5 2x16 7000',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 7000,
    @latentcy = 36,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6300000,
    @costPrice = 5800000,
    @name = 'Corsair Vengeance DDR5 2x16 7200',
    @generation = 'DDR5',
    @capacity = 32,
    @speed = 7000,
    @latentcy = 36,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6000000,
    @costPrice = 5500000,
    @name = 'Corsair Vengeance DDR5 2x32 5200',
    @generation = 'DDR5',
    @capacity = 64,
    @speed = 5200,
    @latentcy = 40,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6300000,
    @costPrice = 5800000,
    @name = 'Corsair Vengeance DDR5 2x32 5600',
    @generation = 'DDR5',
    @capacity = 64,
    @speed = 5600,
    @latentcy = 36,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6500000,
    @costPrice = 6000000,
    @name = 'Corsair Vengeance DDR5 2x32 6000',
    @generation = 'DDR5',
    @capacity = 64,
    @speed = 6000,
    @latentcy = 36,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6700000,
    @costPrice = 6200000,
    @name = 'Corsair Vengeance DDR5 2x32 6200',
    @generation = 'DDR5',
    @capacity = 64,
    @speed = 6200,
    @latentcy = 36,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 6900000,
    @costPrice = 6400000,
    @name = 'Corsair Vengeance DDR5 2x32 6400',
    @generation = 'DDR5',
    @capacity = 64,
    @speed = 6400,
    @latentcy = 38,
    @image = '',
    @result = @result OUTPUT


EXEC addProductRAM
    @sellingPrice = 7100000,
    @costPrice = 6600000,
    @name = 'Corsair Vengeance DDR5 2x32 6600',
    @generation = 'DDR5',
    @capacity = 64,
    @speed = 6400,
    @latentcy = 38,
    @image = '',
    @result = @result OUTPUT


-- >> Add Motherboards
EXEC addProductMotherboard
    @sellingPrice = 9000000,
    @costPrice = 8000000,
    @name = 'ASUS ROG Strix X670E-E',
    @socket = 'AM5',
    @chipset = 'X670E',
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 6600,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 9500000,
    @costPrice = 8500000,
    @name = 'MSI MAG B550 TOMAHAWK',
    @socket = 'AM4',
    @chipset = 'B550',
    @formFactor = 'ATX',
    @ramType = 'DDR4',
    @maxRamSpeed = 5100,
    @ramSlots = 4,
    @wifi = 0,
    @image = '',
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 13500000,
    @costPrice = 12000000,
    @name = 'ASUS ROG Maximus Z790 Hero',
    @socket = 'LGA 1700',
    @chipset = 'Z790',
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 7200,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 8000000,
    @costPrice = 7000000,
    @name = 'MSI PRO Z690-A',
    @socket = 'LGA 1700',
    @chipset = 'Z690',
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 6400,
    @ramSlots = 4,
    @wifi = 0,
    @image = '',
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 11500000,
    @costPrice = 10000000,
    @name = 'Gigabyte B650 AORUS Elite',
    @socket = 'AM5',
    @chipset = 'B650',
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 6400,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 7500000,
    @costPrice = 6500000,
    @name = 'MSI MPG Z790 Carbon WiFi',
    @socket = 'LGA 1700',
    @chipset = 'Z790',
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 7200,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 12000000,
    @costPrice = 10500000,
    @name = 'ASUS TUF Gaming X570-Plus',
    @socket = 'AM4',
    @chipset = 'X570',
    @formFactor = 'ATX',
    @ramType = 'DDR4',
    @maxRamSpeed = 4400,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 6500000,
    @costPrice = 5500000,
    @name = 'Gigabyte AORUS Master X570',
    @socket = 'AM4',
    @chipset = 'X570',
    @formFactor = 'ATX',
    @ramType = 'DDR4',
    @maxRamSpeed = 4400,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 8500000,
    @costPrice = 7500000,
    @name = 'Gigabyte B650E Aorus Master',
    @socket = 'AM5',
    @chipset = 'B650E',
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 6600,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 6000000,
    @costPrice = 5000000,
    @name = 'ASUS ROG Strix B760-F Gaming',
    @socket = 'LGA 1700',
    @chipset = 'B760',
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 6400,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 10000000,
    @costPrice = 9000000,
    @name = 'MSI MAG Z790 TOMAHAWK',
    @socket = 'LGA 1700',
    @chipset = 'Z790',
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 7200,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 11500000,
    @costPrice = 10000000,
    @name = 'ASRock Z790 Pro RS',
    @socket = 'LGA 1700',
    @chipset = 'Z790',
    @formFactor = 'ATX',
    @ramType = 'DDR5',
    @maxRamSpeed = 7000,
    @ramSlots = 4,
    @wifi = 0,
    @image = '',
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 8000000,
    @costPrice = 7000000,
    @name = 'ASUS Prime Z790-P WIFI D4',
    @socket = 'LGA 1700',
    @chipset = 'Z790',
    @formFactor = 'ATX',
    @ramType = 'DDR4',
    @maxRamSpeed = 5333,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @result = @result OUTPUT


EXEC addProductMotherboard
    @sellingPrice = 9000000,
    @costPrice = 8000000,
    @name = 'MSI PRO Z790-P WIFI DDR4',
    @socket = 'LGA 1700',
    @chipset = 'Z790',
    @formFactor = 'ATX',
    @ramType = 'DDR4',
    @maxRamSpeed = 5333,
    @ramSlots = 4,
    @wifi = 1,
    @image = '',
    @result = @result OUTPUT


-- >> Add PSUs
EXEC addProductPSU
    @sellingPrice = 3600000,
    @costPrice = 3000000,
    @name = 'Corsair RM850x',
    @wattage = 850,
    @efficiency = '80+ Gold',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3000000,
    @costPrice = 2500000,
    @name = 'EVGA SuperNOVA 750 G6',
    @wattage = 750,
    @efficiency = '80+ Gold',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 4700000,
    @costPrice = 4000000,
    @name = 'Seasonic PRIME TX-1000',
    @wattage = 1000,
    @efficiency = '80+ Titanium',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 2700000,
    @costPrice = 2200000,
    @name = 'Cooler Master MWE Gold 650 V2',
    @wattage = 650,
    @efficiency = '80+ Gold',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 4200000,
    @costPrice = 3500000,
    @name = 'be quiet! Straight Power 11 850W',
    @wattage = 850,
    @efficiency = '80+ Platinum',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3900000,
    @costPrice = 3300000,
    @name = 'Thermaltake Toughpower GF1 850W',
    @wattage = 850,
    @efficiency = '80+ Gold',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 8500000,
    @costPrice = 7000000,
    @name = 'Corsair AX1600i',
    @wattage = 1600,
    @efficiency = '80+ Titanium',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3300000,
    @costPrice = 2800000,
    @name = 'NZXT C750',
    @wattage = 750,
    @efficiency = '80+ Gold',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 4400000,
    @costPrice = 3700000,
    @name = 'SilverStone Strider Platinum 850W',
    @wattage = 850,
    @efficiency = '80+ Platinum',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3200000,
    @costPrice = 2700000,
    @name = 'Antec Earthwatts Gold Pro 750W',
    @wattage = 750,
    @efficiency = '80+ Gold',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3500000,
    @costPrice = 3000000,
    @name = 'Gigabyte P750GM',
    @wattage = 750,
    @efficiency = '80+ Gold',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 5800000,
    @costPrice = 5000000,
    @name = 'ASUS ROG Thor 850P',
    @wattage = 850,
    @efficiency = '80+ Platinum',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3200000,
    @costPrice = 2700000,
    @name = 'Fractal Design Ion+ 760P',
    @wattage = 760,
    @efficiency = '80+ Platinum',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3500000,
    @costPrice = 3000000,
    @name = 'Super Flower Leadex III Gold',
    @wattage = 650,
    @efficiency = '80+ Gold',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3800000,
    @costPrice = 3300000,
    @name = 'XPG Core Reactor 750W',
    @wattage = 750,
    @efficiency = '80+ Gold',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 4200000,
    @costPrice = 3500000,
    @name = 'Lian Li SP750',
    @wattage = 750,
    @efficiency = '80+ Gold',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 5200000,
    @costPrice = 4500000,
    @name = 'be quiet! Dark Power Pro 11',
    @wattage = 850,
    @efficiency = '80+ Platinum',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 3900000,
    @costPrice = 3400000,
    @name = 'Cooler Master V750 Gold V2',
    @wattage = 750,
    @efficiency = '80+ Gold',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 4500000,
    @costPrice = 3800000,
    @name = 'Thermaltake Toughpower Grand',
    @wattage = 850,
    @efficiency = '80+ Platinum',
    @image = '',
    @result = @result OUTPUT


EXEC addProductPSU
    @sellingPrice = 5000000,
    @costPrice = 4300000,
    @name = 'FSP Hydro PTM Pro 850W',
    @wattage = 850,
    @efficiency = '80+ Platinum',
    @image = '',
    @result = @result OUTPUT


-- >> Add SSDs
EXEC addProductSSD
    @sellingPrice = 1500000,
    @costPrice = 1200000,
    @name = 'Samsung 970 Evo 512GB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 512,
    @cache = 512,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1800000,
    @costPrice = 1500000,
    @name = 'Samsung 970 Evo 1TB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2700000,
    @costPrice = 2200000,
    @name = 'Samsung 970 Evo 2TB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3000000,
    @costPrice = 2500000,
    @name = 'Samsung 970 Evo Plus 512GB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 512,
    @cache = 512,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3300000,
    @costPrice = 2800000,
    @name = 'Samsung 970 Evo Plus 1TB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3200000,
    @costPrice = 2700000,
    @name = 'Samsung 970 Evo Plus 2TB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 2048,
    @cache = 1024,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3500000,
    @costPrice = 3000000,
    @name = 'Samsung 960 Evo 512GB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 512,
    @cache = 512,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1300000,
    @costPrice = 1000000,
    @name = 'Samsung 960 Evo 1TB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1600000,
    @costPrice = 1300000,
    @name = 'Samsung 960 Evo 2TB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1800000,
    @costPrice = 1500000,
    @name = 'Samsung 980 512GB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 512,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1100000,
    @costPrice = 800000,
    @name = 'Samsung 981 1TB PCIe 3.0',
    @interface = 'PCIe 3.0',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 5000000,
    @costPrice = 4200000,
    @name = 'Samsung 980 Pro 512GB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 512,
    @cache = 512,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 6000000,
    @costPrice = 5000000,
    @name = 'Samsung 980 Pro 1TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 5500000,
    @costPrice = 4500000,
    @name = 'Samsung 980 Pro 2TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 5800000,
    @costPrice = 4800000,
    @name = 'Acer Predator GM7000 512GB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 512,
    @cache = 512,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2100000,
    @costPrice = 1800000,
    @name = 'Acer Predator GM7001 1TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2400000,
    @costPrice = 2000000,
    @name = 'Acer Predator GM7002 2TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2600000,
    @costPrice = 2200000,
    @name = 'Western Digital Black SN850 512GB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 512,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1500000,
    @costPrice = 1200000,
    @name = 'Western Digital Black SN851 1TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2500000,
    @costPrice = 2000000,
    @name = 'Western Digital Black SN852 2TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1300000,
    @costPrice = 1000000,
    @name = 'Western Digital Black SN850X 1TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1500000,
    @costPrice = 1200000,
    @name = 'Western Digital Black SN850X 2TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1600000,
    @costPrice = 1300000,
    @name = 'Sabrent Rocket 4 1TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2100000,
    @costPrice = 1800000,
    @name = 'Sabrent Rocket 5 2TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1800000,
    @costPrice = 1500000,
    @name = 'Sabrent Rocket 4 Plus 1TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2700000,
    @costPrice = 2200000,
    @name = 'Sabrent Rocket 4 Plus 2TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2100000,
    @costPrice = 1800000,
    @name = 'Crucial P5 512GB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 512,
    @cache = 1024,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2400000,
    @costPrice = 2000000,
    @name = 'Crucial P6 1TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2600000,
    @costPrice = 2200000,
    @name = 'Crucial P7 2TB PCIe 4.0',
    @interface = 'PCIe 4.0',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3000000,
    @costPrice = 2500000,
    @name = 'Samsung 860 Evo 1TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3300000,
    @costPrice = 2800000,
    @name = 'Samsung 860 Evo 2TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3200000,
    @costPrice = 2700000,
    @name = 'Samsung 860 Evo 4TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 4096,
    @cache = 4096,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1800000,
    @costPrice = 1500000,
    @name = 'Samsung 860 Pro 2TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 1600000,
    @costPrice = 1300000,
    @name = 'Samsung 860 Pro 1TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2100000,
    @costPrice = 1800000,
    @name = 'Samsung 860 Pro 4TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 4096,
    @cache = 4096,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3700000,
    @costPrice = 3200000,
    @name = 'Samsung 850 Evo 1TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3300000,
    @costPrice = 2800000,
    @name = 'Samsung 850 Evo 2TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3500000,
    @costPrice = 3000000,
    @name = 'Samsung 850 Evo 4TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 4096,
    @cache = 4096,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 5000000,
    @costPrice = 4200000,
    @name = 'Samsung 850 Pro 1TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 5500000,
    @costPrice = 4500000,
    @name = 'Samsung 850 Pro 2TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 5800000,
    @costPrice = 4800000,
    @name = 'Western Digital Blue 1TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2700000,
    @costPrice = 2200000,
    @name = 'Western Digital Blue 2TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 2100000,
    @costPrice = 1800000,
    @name = 'Western Digital Blue 4TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 4096,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3000000,
    @costPrice = 2500000,
    @name = 'Crucial MX500 1TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 1024,
    @cache = 1024,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3500000,
    @costPrice = 3000000,
    @name = 'Crucial MX500 2TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 2048,
    @cache = 2048,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3300000,
    @costPrice = 2800000,
    @name = 'Crucial MX500 4TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 4096,
    @cache = 4096,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3000000,
    @costPrice = 2500000,
    @name = 'Crucial MX300 1TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 1024,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT

EXEC addProductSSD
    @sellingPrice = 3700000,
    @costPrice = 3200000,
    @name = 'Crucial MX300 2TB SATA 2.5',
    @interface = 'SATA 2.5',
    @capacity = 2048,
    @cache = 0,
    @image = '',
    @result = @result OUTPUT
