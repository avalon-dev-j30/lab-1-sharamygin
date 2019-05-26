create table USERINFO(
    USERINFOID integer primary key,
    USERINFONAME varchar(255) not null,
    SURNAME varchar(255) not null
);


create table SUPPLIER(
    SUPPLIERID integer unique,
    SUPPLIERNAME varchar(255) PRIMARY KEY,
    ADDRESS varchar(255) not null,
    PHONE varchar(255),
    REPRESENTATIVE varchar(255) not null
);


create table ROLES(
    ROLESID integer unique,
    ROLESNAME varchar(255) PRIMARY KEY
);


create table USERS(
    USERSID integer not null unique,
    EMAIL varchar(255) primary key,
    PASSWORD varchar (255),
    INFO integer references USERINFO(USERINFOID) unique,
    USERROLE integer references ROLES(ROLESID)
);


create table ORDERS(
    ORDERID integer not null primary key,
    "USER" integer references USERS(USERSID),
    CREATED timestamp
);

create table PRODUCTS(
    PRODUCTID integer unique,
    CODE varchar(255) primary key,
    TITLE varchar(255),
    SUPPLIER integer references SUPPLIER(SUPPLIERID),
    INITIALPRICE double,
    RETAILPRICE double
);


create table ORDER2PRODUCT(
    ORDERS integer primary key references ORDERS(ORDERID),
    PRODUCT integer primary key references PRODUCTS(PRODUCTID)
);


-------------------------------------------------------------------------------

insert into ORDERS(ORDERID, CREATED) 
values (1, '2018-01-03 08:02:00'),
       (2, '2018-12-23 15:58:05'),
       (3, '2019-02-21 12:03:00');

insert into PRODUCTS(PRODUCTID, CODE, TITLE, INITIALPRICE, RETAILPRICE) 
values (1, 'CAM', 'CAMCODER', 250.0, 280.0),
       (2, 'PHO', 'CAMERA', 430, 450),
       (3, 'AUD', 'AUDIORECORDER', 43, 80);

insert into USERS(USERSID, EMAIL, PASSWORD) 
values (1, 'johnweek@icloud.com', 'week'),
       (2, 'spongebob@gmail.com', 'bobby'),
       (3, 'president@hotmail.co.uk', 'prezza');

insert into USERINFO(USERINFOID, USERINFONAME, SURNAME) 
values (1, 'JOHN', 'WEEK'),
       (2, 'BOB', 'SPONGE'),
       (3, 'MR', 'PRESIDENT');

insert into SUPPLIER(SUPPLIERID, SUPPLIERNAME, ADDRESS, PHONE, REPRESENTATIVE) 
values (1, 'HOMIE', 'Grove Street', '+1 223 004 44 23', 'John Week'),
       (2, 'Krusty Krabs', 'Bikini Bottom', 'no phone', 'Sponge Bob'),
       (3, 'PEntagon', 'Washington DC', 'secret info', 'Mr President');

insert into ROLES(ROLESID, ROLESNAME) 
values (1, 'Killer, admin'),
       (2, 'Jellyfish catcher, guest'),
       (3, 'user');

insert into ORDER2PRODUCT(ORDERS, PRODUCT)
values  (1, 1),
        (2, 2),
        (3, 3);