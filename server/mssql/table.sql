use major
go

create table users
(
    id int identity(1,1) primary key,
    username varchar(25),
    password varchar(25),
    backupPassword varchar(25),
    confirmCode varchar(10),
    active int default 0
);

create table userDetails
(
    id int references users(id),
    fullname nvarchar(50),
    email varchar(100),
    phoneNumber varchar(15),
    address nvarchar(100),
    dateOfBirth date,
    dateJoined date default getdate()
);

create table staffs
(
    id int identity(1,1) primary key,
    username varchar(25),
    password varchar(25),
    possition varchar(25),
    active int default 1
);

create table staffDetails
(
    id int references staffs(id),
    fullname nvarchar(50),
    email varchar(100),
    phoneNumber varchar(15),
    dateOfBirth date,
    dateJoined date default getdate()
);

create table products
(
    id int identity(1,1) primary key,
    sellingPrice decimal(18,2),
    costPrice decimal(18,2),
    description nvarchar(max)
);

create table cpus
(
    id int references products(id),
    name nvarchar(50),
    generation nvarchar(50),
    socket nvarchar(10),
    cores int,
    threads int,
    baseClock int,
    boostClock int,
    tdp int
);

create table gpus
(
    id int references products(id),
    name nvarchar(50),
    generation nvarchar(50),
    vram int,
    baseClock int,
    boostClock int,
    tdp int
);

create table motherboards
(
    id int references products(id),
    name nvarchar(50),
    socket nvarchar(10),
    chipset nvarchar(10),
    formFactor nvarchar(50),
    ramType nvarchar(10),
    maxRamSpeed int,
    ramSlots int,
    wifi int
);

create table rams
(
    id int references products(id),
    name nvarchar(50),
    generation nvarchar(50),
    capacity int,
    speed int,
    latency int
);

create table ssds
(
    id int references products(id),
    name nvarchar(50),
    interface nvarchar(20),
    capacity int,
    cache int
);

create table psus
(
    id int references products(id),
    name nvarchar(50),
    wattage int,
    efficiency nvarchar(50),
);

create table cases
(
    id int references products(id),
    name nvarchar(50),
    type nvarchar(50),
    formFactor nvarchar(50),
    color nvarchar(50)
);

create table warehouses
(
    id int identity(1,1) primary key,
    name nvarchar(50),
    location nvarchar(100),
    productid int references products(id),
    quantity int
);

create table ratings
(
    id int identity(1,1) primary key,
    userId int references users(id),
    productId int references products(id),
    rating int,
    dateRated date default getdate()
);

create table carts
(
    id int identity(1,1) primary key,
    userId int references users(id),
    productId int references products(id),
    quantity int,
    dateAdded date default getdate()
);

create table feedback
(
    id int identity(1,1) primary key,
    userId int references users(id),
    feedback nvarchar(max),
    dateSent date default getdate()
);