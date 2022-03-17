--Basic Queries working with the AdventureWorks_2017 Database on MS Sql Server (SSMS) 
--Database used was titled 'Enrollment'
--Author: Ryan Woodward

--Basic Create and ALter tables in SQL
CREATE TABLE Faculty (facID varchar(6) PRIMARY KEY NOT NULL, facName varchar(20) NOT NULL, facDept varchar(20), facRank varchar(20));

CREATE TABLE Student (stuID varchar(6) PRIMARY KEY NOT NULL, studFName varchar(20) NOT NULL, studLName varchar(20) NOT NULL, studMajor varchar(20) NULL, StudTotCredits int); --default in cols is 'null'

CREATE TABLE Class (classNumber varchar(8), facID varchar(6) FOREIGN KEY REFERENCES Faculty(facID), classSchedule varchar(8) FOREIGN KEY REFERENCES Class(classNumber));

CREATE TABLE Enroll (grade varchar(1), studID varchar(6) FOREIGN KEY REFERENCES Student(stuID), classNumber varchar(8) FOREIGN KEY REFERENCES Class(classNumber));
--the relationship name does not matter, for instance stuID (fourth table creation) could be stuentID with no problem, but the name in the parent matters (stuID)


--TASK: update the enroll table so that the composite PK to stuID and classNumber
ALTER TABLE Enroll ALTER COLUMN stuID carchar(6) NOT NULL;
ALTER TABLE Enroll ALTER COLUMN classNumber varchar(8) NOT NULL;
ALTER TABLE Enroll ADD CONSTRAINT enroll_stuID_classNumber PRIMARY KEY (stuID, classNumber); --this command reuired the previous alterations to enroll table

INSERT INTO Student VALUES ('S1001', 'Smith', 'Tom', 'History' 90):
...
...
...

INSERT INTO Faculty VALUES ('F101', 'Adams', 'Art', 'Professor');
...
...
...
INSERT INTO Enroll VALUES('A', 'S1001', 'ART103A');
...
...
...