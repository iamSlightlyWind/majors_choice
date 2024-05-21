use major

create table users
(
    id int identity(1,1) primary key,
    username varchar(25),
    password varchar(25),
    active int default 1
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
)

create table staffDetails
(
    id int references staffs(id),
    fullname nvarchar(50),
    email varchar(100),
    phoneNumber varchar(15),
    dateOfBirth date,
    dateJoined date default getdate()
);

create table warehouses
(
    id int identity(1,1) primary key,
    name nvarchar(50),
    location nvarchar(100),
    productid int references products(id),
    quantity int
);

create table products(
    id int identity(1,1) primary key,
    brand nvarchar(50),
    name nvarchar(50),
    description nvarchar(max),
    sellingPrice decimal(18,2),
    costPrice decimal(18,2)
)

create table ratings(
    id int identity(1,1) primary key,
    userId int references users(id),
    productId int references products(id),
    rating int,
    dateRated date default getdate()
)

create table cpus(
    id int references products(id),
    generation nvarchar(50),
    class nvarchar(10),
    cores int,
    threads int,
    baseClock int,
    boostClock int,
    tdp int
)

create table gpus(
    id int references products(id),
    vram int,
    genration nvarchar(50),
    class nvarchar(10),
    baseClock int,
    boostClock int,
    tdp int
)

create table rams(
    id int references products(id),
    generation nvarchar(50),
    capacity int,
    speed int,
    type nvarchar(50)
)

create table ssds(
    id int references products(id),
    type nvarchar(50),
    capacity int,
    readSpeed int,
    writeSpeed int
)

create table mobos(
    id int references products(id),
    socket nvarchar(50),
    chipset nvarchar(50),
    formFactor nvarchar(50)
)

create table cases(
    id int references products(id),
    type nvarchar(50),
    formFactor nvarchar(50),
    color nvarchar(50)
)

create table psus(
    id int references products(id),
    wattage int,
    efficiency nvarchar(50),
    modular nvarchar(50)
)

create table carts
(
    id int identity(1,1) primary key,
    userId int references users(id),
    productId int references products(id),
    quantity int,
    dateAdded date default getdate()
);

create table feedback (
    id int identity(1,1) primary key,
    userId int references users(id),
    feedback nvarchar(max),
    dateSent date default getdate()
);