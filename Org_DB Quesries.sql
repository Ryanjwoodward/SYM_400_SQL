--Basic Queries working with the AdventureWorks_2017 Database on MS Sql Server (SSMS) 
--Database used was titled 'Org'
--Author: Ryan Woodward

--note: char requires a specific amount of characters where varchar does not
CREATE TABLE Department{

    deptID INT PRIMARY KEY NOT NULL,
    deptLoc VARCHAR(20) NOT NULL
};

--note: the optional portion for employees (null) does not have to be entered when inserted
CREATE TABLE Employee{
    
    empID INT PRIMARY KEY NOT NULL,
    empName VARCHAR(100) NOT NULL,
    depID INT REFERENCES Department(deptID)
};

--Create Departments
--dept 10, in PHX, and dept 20 in Denver
INSERT INTO Department VALUES (10, 'Phoenix'), (20, 'Denver');

--query to get total employees in table, label the returned column 'CountOfEmployees'
SELECT COUNT(*) CountOfEmployees FROM Employee;

--write a query to display 'deptID' for employee 'Dan Prime'
SELECT deptID FROM Employee WHERE empName = 'Dan Prime';

--Expand the previous query to show location of dept (requires join)
SELECT Employee.deptID, Department.deptLoc FROM Employee INNER JOIN Department.deptLoc = deptLoc WHERE empName = 'Dan Prime';

--ANSWER: abmiguous means it is in two tables, could use JOIN here as well.
SELECT Employee.deptID, Department.deptLoc, empName FROM Employee JOIN Department ON Employee.deptID = Department.deptID WHERE empName = 'Dan Prime';
--using aliases 'e' 'd'
SELECT d.deptID, d.deptLOC, empName FROM Employee e JOIN Department d ON e.deptID = d.deptID WHERE empName = 'Dan Prime';