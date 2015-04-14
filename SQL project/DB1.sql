CREATE DATABASE DB1
GO

CREATE TABLE Departments
 (
  ID INTEGER NOT NULL,
  Name VARCHAR(150) NOT NULL,
  Lead VARCHAR(100) NOT NULL,
  City INTEGER NOT NULL,
  DepState INTEGER NOT NULL,
  DepAddress VARCHAR(100) NOT NULL,
  ZIP INTEGER NOT NULL,
  Country INTEGER NOT NULL,
  Region INTEGER NOT NULL,
  CONSTRAINT PK_Departments PRIMARY KEY (ID)
)
GO

CREATE TABLE Cities
 (
  ID INTEGER NOT NULL,
  Name VARCHAR(100) NOT NULL,
  CONSTRAINT PK_Cities PRIMARY KEY (ID)
  )
GO

CREATE TABLE States
 (
  ID INTEGER NOT NULL,
  Name VARCHAR(100) NOT NULL,
  CONSTRAINT PK_States PRIMARY KEY (ID)
)
GO

CREATE TABLE ZIPCodes (
  ID INTEGER NOT NULL,
  Name VARCHAR NOT NULL,
  CONSTRAINT PK_ZIPCodes PRIMARY KEY (ID)
)
GO

ALTER TABLE ZIPCodes
ALTER COLUMN Name INTEGER NOT NULL
Go

CREATE TABLE Countries
 (
  ID INTEGER NOT NULL,
  Name VARCHAR NOT NULL,
  CONSTRAINT PK_Countries PRIMARY KEY (ID)
)
GO
ALTER TABLE Countries
ALTER COLUMN Name Varchar(50) NOT NULL
GO

CREATE TABLE Regions
 (
  ID INTEGER NOT NULL,
  Name VARCHAR(100) NOT NULL,
  Country INTEGER Not null,
  CONSTRAINT PK_Regions PRIMARY KEY (ID)
)
GO

CREATE TABLE Clients
 (
  ID INTEGER NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  ClAddress VARCHAR(150) NOT NULL,
  Country INTEGER NOT NULL,
  Clmail VARCHAR(50) NOT NULL,
  Gender VARCHAR(20) NULL,
  CONSTRAINT PK_Clients PRIMARY KEY (ID)
)
GO

alter table Clients
add CONSTRAINT FK_Clients_Countries FOREIGN KEY (Country)
    REFERENCES Countries (ID)
 
    ON DELETE CASCADE
    ON UPDATE CASCADE
GO

CREATE TABLE Orders
 (
  ID INTEGER NOT NULL,
  DateOrd DATETIME NOT NULL,
  Clients INTEGER NOT NULL,
  ClAddress VARCHAR NOT NULL,
  Employee INTEGER NOT NULL,
  CONSTRAINT PK_Orders PRIMARY KEY (ID)
  )
  GO

  alter table Orders
add CONSTRAINT FK_Orders_Clients FOREIGN KEY (Clients)
    REFERENCES Clients (ID)
 
    ON DELETE CASCADE
    ON UPDATE CASCADE
GO
CREATE TABLE OrderedProducts
 (
  ID INTEGER NOT NULL,
  Product INTEGER NOT NULL,
  Quantity INTEGER NOT NULL,
  Price decimal (7,2) NOT NULL,
  POrder INTEGER NOT NULL,
  CONSTRAINT PK_OrderedProducts PRIMARY KEY (ID)
)
alter table OrderedProducts
add CONSTRAINT FK_OrderedProducts_Orders FOREIGN KEY (POrder)
    REFERENCES Orders (ID)
 
    ON DELETE CASCADE
    ON UPDATE CASCADE
GO

CREATE TABLE Products
 (
  ID INTEGER NOT NULL,
  Name VARCHAR(100) NOT NULL,
  Price DECIMAL(7,2) NOT NULL,
  DescriptionPRod VARCHAR(400) NOT NULL,
  CONSTRAINT PK_Products PRIMARY KEY (ID)
)
GO

alter table OrderedProducts
add CONSTRAINT FK_OrderedProducts_Product FOREIGN KEY (Product)
    REFERENCES Products (ID)
 
    ON DELETE CASCADE
    ON UPDATE CASCADE
GO

CREATE TABLE Employees 
(
  ID INTEGER NOT NULL,
  FullName VARCHAR(150) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Phone INTEGER NOT NULL,
  SDate DATE NOT NULL,
  Salary DECIMAL(9,2) NOT NULL,
  Position INTEGER NOT NULL ,
  TeamLeader INTEGER NOT NULL ,
  CONSTRAINT PK_Employees PRIMARY KEY (ID)
)
GO
ALTER TABLE Employees
ADD Department INTEGER NOT NULL
GO
alter table Orders
add CONSTRAINT FK_Orders_Employees FOREIGN KEY (Employee)
    REFERENCES Employees (ID)
 
    ON DELETE CASCADE
    ON UPDATE CASCADE
GO

alter table Employees
add CONSTRAINT FK_Employees_Departments FOREIGN KEY (Department)
    REFERENCES Departments (ID)

GO

CREATE TABLE Positions
 (
  ID INTEGER NOT NULL,
  Name VARCHAR(40) NOT NULL,
  MinSalary DECIMAL(3,2) NOT NULL,
  MaxSalary DECIMAL(7,2) NOT NULL,
  CONSTRAINT PK_Positions PRIMARY KEY (ID)
)
GO

alter table Employees
add CONSTRAINT FK_Employees_Positions FOREIGN KEY (Position)
    REFERENCES Positions (ID)
GO

CREATE TABLE TeamLeaders
 (
  ID INTEGER NOT NULL,
  Name VARCHAR(40) NOT NULL,
  CONSTRAINT PK_TeamLeaders PRIMARY KEY (ID)
)
GO

alter table Employees
add CONSTRAINT FK_Employees_TeamLeaders FOREIGN KEY (TeamLeader)
    REFERENCES TeamLeaders (ID)
GO

alter table Departments
add CONSTRAINT FK_Departments_Cities FOREIGN KEY (City)
    REFERENCES Cities (ID)
 
    ON DELETE CASCADE
    ON UPDATE CASCADE
GO

alter table Departments
add CONSTRAINT FK_Departments_States FOREIGN KEY (DepState)
    REFERENCES States (ID)
 
    ON DELETE CASCADE
    ON UPDATE CASCADE
GO

alter table Departments
add CONSTRAINT FK_Departments_ZIPCodes FOREIGN KEY (ZIP)
    REFERENCES ZIPCodes (ID)
 
    ON DELETE CASCADE
    ON UPDATE CASCADE
GO

alter table Departments
add CONSTRAINT FK_Departments_Countries FOREIGN KEY (Country)
    REFERENCES Countries (ID)
 
    ON DELETE CASCADE
    ON UPDATE CASCADE
GO

alter table Departments
add CONSTRAINT FK_Departments_Regions FOREIGN KEY (Region)
    REFERENCES Regions (ID)
 
    ON DELETE CASCADE
    ON UPDATE CASCADE
GO

/* INSERT DATA */

/* Cities */

insert into Cities (ID, Name)
values ('1', 'Пловдив')

insert into Cities (ID, Name)
values ('2', 'Sofia')

insert into Cities (ID, Name)
values ('3', 'Burgas')

insert into Cities (ID, Name)
values ('4', 'Varna')

/* States */

insert into States (ID, Name)
values ('1', 'Sofia')

insert into States (ID, Name)
values ('2', 'Sofia')

insert into States (ID, Name)
values ('3', 'Burgas')

insert into States (ID, Name)
values ('2', 'Varna')

/* ZIPCodes */

insert into ZIPCodes (ID, Name)
Values ('1', '1234')

insert into ZIPCodes (ID, Name)
Values ('2', '1235')

insert into ZIPCodes (ID, Name)
Values ('3', '1236')

insert into ZIPCodes (ID, Name)
Values ('4', '1237')

/* Countries */

insert into Countries (ID, Name)
Values ('1', 'BG')

insert into Countries (ID, Name)
Values ('2', 'BG')

insert into Countries (ID, Name)
Values ('3', 'BG')

insert into Countries (ID, Name)
Values ('4', 'BG')

/* Regions */

Insert into Regions (ID, Name, Country)
Values ('1', 'Plovdiv', '1')

Insert into Regions (ID, Name, Country)
Values ('2', 'Sofia', '2')

Insert into Regions (ID, Name, Country)
Values('3', 'Burgas', '1')

Insert into Regions (ID, Name, Country)
Values ('4', 'Varna', '2')

Insert into Regions (ID, Name, Country)
Values ('5', 'Varna', '')

/* Clients */

Insert into Clients (ID, FirstName, LastName,Clmail, ClAddress, Country, Gender)
Values ('1', 'Ivan', 'Ivanov', 'iivanov@abv.bg','Peshtersko shose 36', '1', 'M' )

Insert into Clients (ID, FirstName, LastName,Clmail, ClAddress, Country, Gender)
Values ('2', 'Ivan', 'Ivanoff', 'iivanoff@abv.bg','Peshtersko shose 38', '2', 'M' )

Insert into Clients (ID, FirstName, LastName,Clmail, ClAddress, Country, Gender)
Values ('3', 'Fred', 'Ivanoff', 'fivanoff@abv.bg','Peshtersko shose 48', '3', 'M' )

/* Positions */

Insert into Positions (ID, Name, MinSalary, MaxSalary)
Values ('1', 'Programmer', '900', '5000')

Insert into Positions (ID, Name, MinSalary, MaxSalary)
Values ('2', 'Head', '1000', '7000')

/* TeamLeaders */

Insert into TeamLeaders (ID, Name)
Values ('1', 'Petar Petrov')

Insert into TeamLeaders (ID, Name)
Values ('2', 'Stefan Petrov')

/* Products */

Insert into Products (ID, Name, Price, DescriptionPRod)
Values ('1', 'Chasha', '2.50', 'Cherna chasha za kafe')

Insert into Products (ID, Name, Price, DescriptionPRod)
Values ('2', 'Panichka', '21.50', 'Panichka za plodove')

/* Departments */

insert into Departments (ID, Name, Lead, City, DepState, DepAddress, ZIP, Country, Region)
Values ('1', 'HeadOffice', 'Petar Petrov', '1', '1', 'Pop Bogomil 1', '1', '1', '1')

insert into Departments (ID, Name, Lead, City, DepState, DepAddress, ZIP, Country, Region)
Values ('2', 'SubOffice', 'Genadii Dimitrov', '1', '2', 'Pop Bogomil 4', '2', '3', '2')

/* Employees */

insert into Employees (ID, FullName, Email, Phone, SDate, Salary, Position, TeamLeader, Department)
Values ('1', 'Geogri Georgiev', 'gg@abv.bg', '123456', '2007-10-02', '1200', '1', '1', '1')

insert into Employees (ID, FullName, Email, Phone, SDate, Salary, Position, TeamLeader, Department)
Values ('2', 'Elena Genova', 'egrjf@abv.bg', '124553456', '2010-11-02', '1800', '1', '2', '2')

insert into Employees (ID, FullName, Email, Phone, SDate, Salary, Position, TeamLeader, Department)
Values ('3', 'Ivan Genov', 'ig@abv.bg', '123456', '2007-10-02', '1700', '1', '1', '1')

insert into Employees (ID, FullName, Email, Phone, SDate, Salary, Position, TeamLeader, Department)
Values ('4', 'Elena Gfdgffgenova', 'egrjf@abv.bg', '124553456', '2008-11-02', '1600', '1', '2', '2')

/* Orders */

insert into Orders (ID, DateOrd, Clients, ClAddress, Employee)
values ('1', '2014-10-15', '1', 'Hristo Botev 123', '2')

insert into Orders (ID, DateOrd, Clients, ClAddress, Employee)
values ('2', '2013-11-25', '2', 'Vasil Aprilov 312', '1')

/* OrderedProducts */

insert into OrderedProducts (ID, Product, Quantity, Price, POrder)
values ('1', '1', '3', '42.50', '1')

insert into OrderedProducts (ID, Product, Quantity, Price, POrder)
values ('2', '2', '6', '65.20', '1')

insert into OrderedProducts (ID, Product, Quantity, Price, POrder)
values ('3', '2', '8', '65.20', '2')

insert into OrderedProducts (ID, Product, Quantity, Price, POrder)
values ('4', '1', '2', '42.50', '2')

/* END OF INSERT DATA */



/* START QUERIES */

/* Общата сума от заплатите на всички служители, наети след определена дата; */

SELECT SDate, SUM(Salary) as suma
FROM Employees
Where SDate > '1998-02-01'
group by SDate

/* Общата сума от заплатите на всички служители, групирани по отдели, където работят */

SELECT Department, SUM(Salary) as suma
FROM Employees
group by Department

/* Да се изведе информация за клиентите , чието малко име е “Fred”; */

select * from Clients
where FirstName = 'Fred'

/* Регионите и страните им. В резултатният набор да участват и регионите, за които няма въведени страни */

select Regions.Name, Countries.Name 
from Regions 
FULL JOIN Countries 
on Regions.Country=Countries.ID
order by Regions.Name

/* Кой клиент колко поръчки е направил до момента */

select Clients.FirstName, Clients.LastName, COUNT(Orders.Clients)  as 'Number of orders'
from Orders
join Clients
on Orders.Clients=Clients.ID
Group by Clients.FirstName, Clients.LastName

/* Да се изведат всички служители, които са обработили над 4 поръчки до момента */ 

select Employees.FullName
from Employees
JOIN Orders 
on Employees.ID=Orders.Employee
group by Employees.FullName
HAVING COUNT(Orders.Employee) = 1

/* Да се създаде изглед, който съдържа номерата на поръчките, датата им, името на клиента, направил поръчката */
drop view ALLORDERS
CREATE VIEW ALLORDERS
as 
select Orders.ID, Orders.DateOrd, Clients.FirstName, Clients.LastName 
from Orders 
FULL JOIN Clients 
on Orders.Clients = Clients.ID

/* Да се изведат данните от изгледа */

select * from ALLORDERS

/* Да се модифицира горния изглед така, че да съдържа и колона с името на съответния служител, обработил поръчката */

ALTER VIEW ALLORDERS
as 
select Orders.ID, Orders.DateOrd, Clients.FirstName, Clients.LastName, Employees.FullName
from Orders 
FULL JOIN Clients 
on Orders.Clients = Clients.ID
Join Employees
on Orders.Employee = Employees.ID

select * from ALLORDERS

/* END QUERIES */

Select ID,Name 
from TeamLeaders 

select FullName, Department
from Employees

