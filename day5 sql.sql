create database Vehicles;
use Vehicles;

create table Members(
Member_ID int primary key,
First_Name varchar(20),
Last_Name varchar(20),
Member_Location varchar(20),
Member_Age int
);

CREATE TABLE Vehicles (
    Vehicle_Registration VARCHAR(10) PRIMARY KEY,
    Vehicle_Make VARCHAR(10),
    Vehicle_Model VARCHAR(10),
    Member_ID INT,
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID)
);

create table Engineers(
Engineer_ID  int primary key,
First_Name varchar(20),
Last_Name varchar(20)
);

create table Breakdowns(
Breakdown_ID int primary key,
Vehicle_Registration varchar(10),
Engineer_ID int,
Breakdown_Date date,
Breakdown_Time time,
Breakdown_Location varchar(20),
foreign key(Vehicle_Registration) references Vehicles(Vehicle_Registration),
foreign key(Engineer_ID) references Engineers(Engineer_ID)
);

-- I've already linked the foreign keys in the tables but I also wrote them with alter command
alter table Vehicles add foreign key(Member_ID) references Members(Member_ID);
alter table Breakdowns add foreign key(Vehicle_Registration) references Vehicles(Vehicle_Registration);
alter table Breakdowns add foreign key(Engineer_ID) references Engineers(Engineer_ID);


INSERT INTO Members (Member_ID, First_Name, Last_Name, Member_Location, Member_Age) VALUES
(1, 'John', 'Doe', 'New York', 32),
(2, 'Jane', 'Smith', 'Los Angeles', 27),
(3, 'Mark', 'Jones', 'Chicago', 45),
(4, 'Emily', 'Davis', 'Houston', 30),
(5, 'Luke', 'Brown', 'Phoenix', 38),
(6, 'Sophia', 'White', 'Dallas', 29),
(7, 'Liam', 'Taylor', 'Miami', 41),
(8, 'Olivia', 'Green', 'San Diego', 36),
(9, 'James', 'Harris', 'Denver', 33),
(10, 'Mia', 'Robinson', 'Atlanta', 25);


INSERT INTO Vehicles (Vehicle_Registration, Vehicle_Make, Vehicle_Model, Member_ID) VALUES

('ABC1234', 'Toyota', 'Corolla', 1),
('XYZ5678', 'Ford', 'Mustang', 2),
('DEF1111', 'Honda', 'Civic', 3),
('GHI2222', 'Chevy', 'Cruze', 4),
('JKL3333', 'BMW', 'X5', 5),
('MNO4444', 'Audi', 'A4', 1),
('PQR5555', 'Mercedes', 'C300', 2),
('STU6666', 'Nissan', 'Altima', 3),
('VWX7777', 'Hyundai', 'Elantra', 6),
('YZA8888', 'Tesla', 'Model S', 7),
('BCD9999', 'Kia', 'Sportage', 8),
('EFG1112', 'Subaru', 'Forester', 9),
('HIJ1212', 'Jeep', 'Wrangler', 10),
('KLM1414', 'Mazda', 'CX-5', 4),
('NOP1515', 'Honda', 'Accord', 5),
('QRS1616', 'Chevy', 'Malibu', 6),
('TUV1717', 'Nissan', 'Sentra', 7),
('WXY1818', 'Ford', 'Explorer', 8),
('ZAB1919', 'Volvo', 'XC90', 9),
('CDE2020', 'Lexus', 'RX350', 10);


INSERT INTO Engineers (Engineer_ID, First_Name, Last_Name) VALUES
(1, 'Ethan', 'Williams'),
(2, 'Olivia', 'Miller'),
(3, 'Sophia', 'Clark'),
(4, 'Noah', 'Walker');


INSERT INTO Breakdowns (Breakdown_ID, Vehicle_Registration, Engineer_ID, Breakdown_Date, Breakdown_Time, Breakdown_Location) VALUES
(1, 'ABC1234', 1, '2024-09-10', '10:30:00', 'New York'),
(2, 'XYZ5678', 2, '2024-09-10', '11:00:00', 'Los Angeles'),
(3, 'DEF1111', 3, '2024-09-10', '12:30:00', 'Chicago'),
(4, 'GHI2222', 4, '2024-09-15', '14:00:00', 'Houston'),
(5, 'JKL3333', 1, '2024-09-18', '09:45:00', 'Phoenix'),
(6, 'MNO4444', 2, '2024-09-25', '08:20:00', 'New York'),
(7, 'PQR5555', 3, '2024-09-28', '11:15:00', 'Los Angeles'),
(8, 'STU6666', 4, '2024-09-30', '15:30:00', 'Chicago'),
(9, 'ABC1234', 2, '2024-10-10', '09:30:00', 'New York'),
(10, 'XYZ5678', 3, '2024-10-15', '13:30:00', 'Los Angeles'),
(11, 'DEF1111', 4, '2024-10-20', '14:45:00', 'Chicago'),
(12, 'MNO4444', 1, '2024-10-22', '16:20:00', 'New York'),
(13, 'JKL3333', 2, '2024-10-25', '17:00:00', 'Phoenix'),
(14, 'VWX7777', 3, '2024-11-01', '08:00:00', 'Dallas'),
(15, 'YZA8888', 4, '2024-11-05', '09:00:00', 'Miami'),
(16, 'BCD9999', 1, '2024-11-10', '10:30:00', 'San Diego'),
(17, 'EFG1112', 2, '2024-11-15', '14:00:00', 'Denver'),
(18, 'HIJ1212', 3, '2024-11-18', '11:00:00', 'Atlanta'),
(19, 'KLM1414', 4, '2024-11-20', '15:45:00', 'Houston'),
(20, 'NOP1515', 1, '2024-11-25', '16:30:00', 'Phoenix');




-- Task 3: Perform Queries
-- 1. Retrieve the first 5 members from the Member table.
select* from Members limit 5;

-- 2. Retrieve 5 members starting from the 6th row.
select* from Members limit 5 offset 5;

-- 3. List members who are older than 30 years.
select*from Members where Member_Age>30;

-- 4. Find members who live in either New York or Los Angeles.
select* from Members where Member_Location in('New York','Los Angeles');

-- 5. Retrieve all vehicles where the make is either 'Toyota' or 'Honda'.
select*from Vehicles where Vehicle_Make in('Toyota','Honda');

-- 6. Find members whose age is between 25 and 40 years.
select*from Members where Member_Age between 25 and 40;

-- 7. List vehicles whose registration number starts with the letter 'A'.
select*from Vehicles where Vehicle_registration like 'a%';

-- 8. Find vehicles where the model ends with the number '5'.
select* from Vehicles where vehicle_Model like '%5';

-- 9. List all engineers and order them alphabetically by their last name.
select*from Engineers order by Last_Name asc;

-- 10. Retrieve all members and order them by age in descending order.
select* from Members order by Member_Age desc;

-- 11. Count the total number of members in the Member table.
select count(*) as 'Total Number of Members' from Members;

-- 12. Retrieve all breakdowns that occurred in the year 2024.
select* from Breakdowns where year(Breakdown_Date)=2024;

-- 13. Find breakdowns for vehicles with the registration 'ABC1234' or 'XYZ5678'.
select* from Vehicles where Vehicle_Registration in('ABC1234','XYZ5678');

-- 14. List all vehicles with the make 'Ford'.
select* from Vehicles where Vehicle_Make='Ford';

-- 15. Find members whose first name starts with the letter 'J'.
select* from Members where First_Name like 'j%';

-- 16. Retrieve breakdowns that occurred before September 1, 2024.
select* from Breakdowns where Breakdown_Date <'2024-09-01';

-- 17. List members whose last name contains 'son'.
select* from Members where Last_Name like '%son%';

-- 18. Find breakdowns that occurred in locations containing 'New'.
select* from Breakdowns where Breakdown_Location like '%New%';

-- 19. Retrieve the youngest member in the Member table.
select* from Members order by Member_Age asc limit 1;

-- 20. Retrieve the oldest member in the Member table.
select* from Members order by Member_Age desc limit 1;

-- 21. Find vehicles owned by members who live in Los Angeles.
select* from Vehicles inner join Members on Vehicles.Member_ID=Members.Member_ID where Members.Member_Location='Los Angeles';

-- 22. Retrieve all breakdowns handled by engineer with ID 1.
select* from Breakdowns where Engineer_ID=1;

-- 23. List all members who are younger than 35 years.
select* from Members where Member_Age< 35;

-- 24. Find members who live in either Phoenix or Houston.
select* from Members where Member_Location in ('Phoenix','Houston');

-- 25. Retrieve vehicles where the model is either 'Civic' or 'Mustang'.
select* from Vehicles where Vehicle_Model in ('Civic','Mustang');

-- 26. List members whose first name contains the letter 'a'.
select* from Members where First_name like '%a%';

-- 27. Retrieve breakdowns that occurred between August 1, 2024, and August 31, 2024.
select* from Breakdowns where Breakdown_Date between '2024-08-01' and '2024-08-31';

-- 28. Find members whose age is not between 20 and 40 years.
select* from Members where Member_Age not between 20 and 40;

-- 29. List breakdowns that occurred after October 1, 2024.
select* from Breakdowns where Breakdown_Date >' 2024-10-01';

-- 30. Retrieve the top 3 oldest members from the Member table.
select* from Members order by Member_Age desc limit 3 ;

-- Medium Tasks (10)
-- 1. Count the number of breakdowns for each vehicle.
select Vehicle_registration, count(*) as 'Number of breakdowns' from Breakdowns group by Vehicle_Registration;

-- 2. Find members who own more than one vehicle.
-- The HAVING clause enables users to filter the results based on the groups specified. The SQL HAVING clause is used with the GROUP BY clause. The HAVING clause can be used in tandem with aggregate functions, whereas a WHERE clause cannot be.
-- Syntax:
-- SELECT column_name(s)
-- FROM table_name
-- WHERE condition
-- GROUP BY column_name(s)
-- HAVING condition
-- ORDER BY column_name(s);
select Member_ID,count(*) as 'Vehicles owned' from Vehicles group by Member_ID having count(*)>1;

-- 3. Retrieve the total number of breakdowns handled by each engineer.
select Engineer_ID, count(*) as'Breakdowns Handled' from Breakdowns group by Engineer_ID;

-- 4. Group breakdowns by location and sort them by the total number of breakdowns in each location.
select Breakdown_Location,count(*) as'Number of breakdowns' from Breakdowns group by Breakdown_Location;

-- 5. List vehicles owned by members who are younger than 30 years.
select *from Vehicles inner join Members on Vehicles.Member_ID=Members.Member_ID where Member_Age<30;

-- 6. Retrieve all breakdowns and sort them by time in descending order.
select * from breakdowns order by year(Breakdown_date) desc;

-- 7. Find all breakdowns for vehicles owned by members who live in New York.
select*from Breakdowns inner join Vehicles on Breakdowns.Vehicle_Registration = Vehicles.Vehicle_Registration join Members on Vehicles.Member_ID = Members.Member_ID where Members.Member_Location = 'New York';

-- 8. Retrieve members who do not own any vehicles.
select * from Members left join Vehicles on Members.Member_ID=Vehicles.Member_ID where Vehicles.Member_ID is null;

-- 9. Find breakdowns that occurred in the same city where the vehicle owner resides.
select * from Breakdowns inner join Vehicles on Breakdowns.Vehicle_Registration=Vehicles.Vehicle_Registration inner join Members on Vehicles.Member_ID=Members.Member_ID where Members.Member_Location=Breakdowns.Breakdown_Location;

-- 10. Retrieve the total number of breakdowns handled by each engineer during 2024.
select Engineer_ID, count(*) as 'Breakdowns Handled' from Breakdowns where year(Breakdown_date)=2024 group by Engineer_ID;


-- Difficult tasks
-- 1. Retrieve a list of members along with their vehicles using a join.
select Members.Member_ID, Members.First_Name, Members.Last_Name, Vehicles.Vehicle_Registration, Vehicles.Vehicle_Make, Vehicles.Vehicle_Model from Members
inner join Vehicles on Members.Member_ID = Vehicles.Member_ID;

-- 2. Retrieve breakdown details along with the respective member details using a join.
select Breakdowns.Breakdown_ID,Breakdowns.Vehicle_registration,Breakdowns.Breakdown_date,Breakdowns.Breakdown_Time,Members.Member_ID,Members.First_name,Members.Last_name,Members.Member_Location,Vehicles.Vehicle_registration,Vehicles.Vehicle_Make,Vehicles.Vehicle_Model from Breakdowns inner join Vehicles on Breakdowns.vehicle_registration=Vehicles.Vehicle_Registration inner join Members on Vehicles.Member_ID=Members.Member_ID;

-- 3. Find members who own a vehicle but have never experienced a breakdown.
-- this one gives me an error and I can't figure out why.
select Members.First_Name,Members.Last_Name,Vehicles.Vehicle_Registration,Vehicles.Vehicle_Make,Vehicles.Vehicle_Model from members join Vehicles on Vehicles.Member_ID=Members.Members_ID left join Breakdowns on Breakdowns.Vehicle_Registration=Vehicles.Vehicle_Registration where Breakdowns.Vehicle_Registration is null;

select * from Members join Vehicles on Members.Member_ID = Vehicles.Member_ID left join Breakdowns on Vehicles.Vehicle_Registration = Breakdowns.Vehicle_Registration
where Breakdowns.Breakdown_ID is null;

-- 4. Retrieve vehicles along with the count of their breakdowns using a join and group by.
select Vehicles.Vehicle_Registration,Vehicles.Vehicle_Make,Vehicles.Vehicle_Model, count(Breakdowns.Breakdown_ID) as 'Numbers of breakdowns' from Vehicles left join Breakdowns on Vehicles.Vehicle_Registration=Breakdowns.Vehicle_Registration group by Vehicles.Vehicle_Registration,Vehicles.Vehicle_Make, Vehicles.Vehicle_Model;

-- 5. Find members whose vehicles have broken down more than twice.
-- error in this one too
select Members.Member_ID,Members.First_Name,Members.Last_name from members join vehicles on Members.Member_ID=Vehicles.Member_ID join Breakouts on Vehicles.Vehicle_Registration=Breakouts.Breakout.Vehicle_Registration group by Members.Member_ID,Members.First_name,Members.Last_Name having count(breakdowns.Breakdown_ID)>2;

-- 6. Retrieve breakdowns where multiple vehicles broke down on the same day.
-- again error,don't know how to do it.
select Breakdown_Date, count(distinct Vehicle_Registration)from Breakdowns having count(distinct Vehicle_Registration) > 1;

-- 7. Count the total breakdowns handled by each engineer and label those who handled more than 5 breakdowns as 'Expert' and others as 'Beginner' using a CASE expression.

-- 8. List all vehicles that have never had a breakdown using a subquery.
-- 9. Find the average age of members whose vehicles have experienced at least one breakdown.
-- 10. Retrieve the top 3 vehicles with the highest number of breakdowns, ordered by breakdown count.

-- Task 5 :search SQL Functions
-- Research the following SQL functions: AVG, MAX, MIN, and SUM. Explain with examples how each is used:

-- AVG means average and it is used to calculate the average of a numerical column
-- example 
select avg(Member_Age) as 'Average Age' from Members;

-- MAX(maximum) returns the highest value in a column
-- example 
select max(Member_Age) from Members;

-- MIN(minimum) returns the lowest value in a column;
-- example
select min(Member_Age) from Members;

-- SUM calculates the total sum of a column
select sum(Member_Age) from Members;

-- Task 6: Update and Delete Records
-- 1. Update 3 records of your own choice from the Engineer table.
-- update first name of all engineers

-- unfortunately I've run this code to see if it worked and now don't know how to go back 
select* from Engineers;
update Engineers set First_Name='Miki';

-- update engineer id by increasing all by 5
update Engineers set Engineer_ID=Engineer_ID+5;

-- update last name to nothing
update Engineers set Last_Name=null;


-- 2. Delete 2 records of your own choice from the breakdown table
-- delete a member
delete from Members where Member_ID=2;
-- delete a vehicle with an 'x' in the plate
delete from Vehicles where Vehicle_Registration like '%x%';

