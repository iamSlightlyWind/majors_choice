create table users
(
    id int identity(1,1) primary key,
    username varchar(25),
    password varchar(25),
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

select * from users
select * from userDetails