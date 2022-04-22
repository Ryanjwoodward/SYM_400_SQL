--Basic Queries working with the AdventureWorks_2017 Database on MS Sql Server (SSMS) 
--Database used was titled 'HR'
--Author: Ryan Woodward

CREATE TABLE Employee(
employeeID int PRIMARY KEY NOT NULL,
employeeName varchar(50)
);

INSERT INTO Employee VALUES(1, 'Till Lindemann'), (2, 'Richard Kruspe');

CREATE TABLE Dependent(
departmentID int,
employeeIF int FOREIGN KEY REFERENCES Employee(employeeID), --this is a composite primary key
dependentRelation varchar(20),
PRIMARY KEY(dependentID, employeeID)
);

INSERT INTO Dependent VALUES(10, 1, 'Spouse'), (20, 1, 'child'), (10, 2, 'spouse'), (30,1,'sibling') --10,1, is unique it cannot be repeated same for 10-2 30-1

--list how many dependents Till Lindemann has
SELECT COUNT(*) dependents FROM Dependent WHERE employeeID = 1; --returns count, using the employeeID (do not assume you know the empID)
SELECT COUNT(*) dependents FROM Dependent d JOIN Employee e on d.employee = e.employeeID WHERE employeeName = 'Till Lindemann';
--examples of aggregation: COUNT MIN MAX
--always group by non-aggregate columns when aggregates are present
SELECT COUNT(*) dependents, employeeName FROM Dependent d JOIN Employee e ON d.employeeID = e.employeeID WHERE employeeName = 'Till Lindemann' GROUP BY employeeName;
--above withot the group-by clause will not run!!!