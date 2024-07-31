use major
go

create table users
(
    id int identity(1,1) primary key,
    googleUser int default 0,
    username varchar(50),
    password varchar(100),
    backupPassword varchar(25),
    confirmCode varchar(10),
    active int default 0
)

create table userDetails
(
    id int references users(id),
    fullname nvarchar(50),
    email varchar(100),
    phoneNumber varchar(15),
    address nvarchar(100),
    dateOfBirth date,
    dateJoined date default getdate()
)

create table staffs
(
    id int identity(1,1) primary key,
    username varchar(25),
    password varchar(100),
    possition int default 0,
    fullname nvarchar(50),
    active int default 0
)

create table products
(
    id int identity(1,1) primary key,
    sellingPrice decimal(18,2),
    costPrice decimal(18,2),
    description nvarchar(max),
    quantity int,
    name nvarchar(50),
    image nvarchar(max)
)

create table cpus
(
    id int references products(id),
    generation nvarchar(50),
    socket nvarchar(10),
    cores int,
    threads int,
    baseClock int,
    boostClock int,
    tdp int,
    igpu nvarchar(50)
)

create table gpus
(
    id int references products(id),
    generation nvarchar(50),
    vram int,
    baseClock int,
    boostClock int,
    tdp int
)

create table motherboards
(
    id int references products(id),
    socket nvarchar(10),
    chipset nvarchar(10),
    igpu int, -- 0 for no, 1 for yes
    formFactor nvarchar(50),
    ramType nvarchar(10),
    maxRamSpeed int,
    maxRamCapacity int, -- in GB
    ramSlots int,
    wifi int
)

create table rams
(
    id int references products(id),
    generation nvarchar(50),
    capacity int,
    speed int,
    latency int
)

create table ssds
(
    id int references products(id),
    interface nvarchar(20),
    capacity int,
    cache int
)

create table psus
(
    id int references products(id),
    wattage int,
    efficiency nvarchar(50)
)

create table cases
(
    id int references products(id),
    formFactor nvarchar(50),
    color nvarchar(50)
)

create table carts
(
    userId int references users(id),
    productId int references products(id),
    sellingPrice decimal(18,2),
    costPrice decimal(18,2)
)

create table orders
(
    id int,
    userId int references users(id),
    productId int references products(id),
    productName nvarchar(50),
    sellingPrice decimal(18,2),
    costPrice decimal(18,2),
    status nvarchar(50),
    dateOrdered date default getdate()
)

create table coupons
(
    id int identity(1,1) primary key,
    description nvarchar(max),
    discount decimal(18,2),
    code nvarchar(10),
    expiry date,
    minPurchase decimal(18,2),
    maxDiscount decimal(18,2),
    uses int
)

create table orderInformation
(
    id int primary key,
    fullname nvarchar(50),
    phoneNumber varchar(15),
    address nvarchar(100),
    payment nvarchar(max),
    coupons nvarchar(10)
)

create table feedback
(
    id int identity(1,1) primary key,
    userId int references users(id),
    feedback nvarchar(max),
    dateSent date default getdate()
)

create table ratings
(
    id int identity(1,1) primary key,
	productId int references products(id),
    userId int references users(id),
    rating_star int,
    rating_text nvarchar(max),
    dateRated date default getdate()
)

create table favorites
(
    userId int references users(id),
    productId int references products(id)
)