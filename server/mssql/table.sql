use major

--create a database for user accounts: username, password, fullname, email, phone number, address, date of birth, date joined, sex
create table users
( -- username password
    id int identity(1,1) primary key,
    username varchar(25),
    password varchar(25),
    active int default 1
);

create table userDetails
( -- fullnames, email, phone number, address, date of birth
    id int references users(id),
    fullname nvarchar(50),
    email varchar(100),
    phoneNumber varchar(15),
    address nvarchar(100),
    dateOfBirth date,
    dateJoined date default getdate()
);

select * from users
select * from userDetails