--Basic Queries working with the AdventureWorks_2017 Database on MS Sql Server (SSMS) 
--Database used was titled 'Enrollments'
--Author: Ryan Woodward

--PROBLEM ONE
--OBJ fins the names of all students that there exists an enrollement record containing their studeID with a class number CSC201A 
--hint: use the EXISTS command, this query is called a 'bridge' command.
SELECT firstName + ' ' + lastName 'fullName' FROM Student s WHERE EXISTS (SELECT * FROM Enroll e WHERE e.stuID = s.stuID AND ClassNumber = 'CSC201A');

--PROBLEM TWO
--findID's of all faculty who are assigned to the history dept. OR who teach in room H221
--NOTES: Union is very useful for mapping 'OR'
SELECT f.facID FROM Faculty f WHERE department = 'History' UNION SELECT facID FROM Class c WHERE c.room = 'H221'; --my attempt

--PROBLEM THREE
--find the total number enrolled in ART103A
--DISTINCT will remove duplicates
SELECT COUNT(DISTINCT stuID) totalStudentsEnrolled FROM Enroll e WHERE classNumber = 'ART103A';

--PROBLEM 4
--find the number of departments that faculty in them
SELECT COUNT(department) departmentsWithFac FROM Faculty WHER NOT department = NULL;
--the better query is witout the where clause because dept that dont have faculty wont show up? --also could use DISTINCT here

--PROBLEM 5
--find the sum of all credits that history majors have
SELECT SUM(Credits) SumOfHistCredits FROM Student WHERe major = 'History';

--PROBLEM 6
--find the average # of credits students have
SELECT AVG(Credits) AvgCredits FROM Student s;

--PROBLEM 7
--find the student with the largest number of credits (fName, lName, ID)
SELECT stuID, firstName, lastName, Credits FROM Student WHERE Credits IN (SELECT MAX(Credits) creds FROM Student);
SELECT stuID, firstName, lastName, Credits FROM Student WHERE Credits = (SELECT MAX(Credits) creds FROM Student);