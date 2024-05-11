USE [TechTribePro];
GO

set identity_insert [UserType] on
insert into [UserType] ([ID], [Name]) VALUES (1, 'Employee'), (2, 'Customer');
set identity_insert [UserType] off

set identity_insert [UserProfile] on
insert into UserProfile (Id, FirstName, LastName, Email, [Password], ImageLocation, UserTypeId) values (1, 'Foo', 'Barington', 'foo@bar.com', '123456789', 'https://robohash.org/numquamutut.png?size=150x150&set=set1', 2);
insert into UserProfile (Id, FirstName, LastName, Email, [Password], ImageLocation, UserTypeId) values (2, 'Reina', 'Sandwith', 'email@customer.com', '123password0', 'https://robohash.org/numquamutut.png?size=150x150&set=set1', 2);
insert into UserProfile (Id, FirstName, LastName, Email, [Password], ImageLocation, UserTypeId) values (3, 'Red', 'Do', 'email@employee.com', 'GodisG00d', 'https://robohash.org/nisiautemet.png?size=150x150&set=set1', 1);
insert into UserProfile (Id, FirstName, LastName, Email, [Password], ImageLocation, UserTypeId) values (4, 'Juan', 'Alcalde', 'jjalcalde001@icloud.com','Jujo1998', 'https://robohash.org/molestiaemagnamet.png?size=150x150&set=set1', 1);
set identity_insert [UserProfile] off

SET IDENTITY_INSERT Employees ON;
INSERT INTO Employees (Id, Specialty, Rate, UserProfileId) VALUES 
(1, 'Macbook Pros', 100, 3);
SET IDENTITY_INSERT Employees OFF;

SET IDENTITY_INSERT ServiceTickets ON;
INSERT INTO ServiceTickets (Id, UserProfileId, [Description], IsEmergency, DateCompleted) VALUES (1, 1, 'cracked screen', 1, GETDATE());
SET IDENTITY_INSERT ServiceTickets OFF;

SET IDENTITY_INSERT Customers ON;
INSERT INTO Customers (Id, [Address], PhoneNumber, UserProfileId) VALUES 
(1, '2802 Zula Locks', '852-837-9713', 2),
(2, '568 Fadel Gateway', '202-244-7090', 1);
SET IDENTITY_INSERT Customers OFF;

SET IDENTITY_INSERT EmployeeTickets ON;
INSERT INTO EmployeeTickets (Id, EmployeeId, ServiceTicketId) VALUES (1, 1, 1);
SET IDENTITY_INSERT EmployeeTickets OFF;



