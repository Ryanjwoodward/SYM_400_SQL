--Basic Queries working with the AdventureWorks_2017 Database on MS Sql Server (SSMS) 
--Database used was titled 'Enrollments'
--Author: Ryan Woodward


--relies on the insertion of specific records into the enrollments table, however these methods in queries are valuable

--select the total students we currently have.
SELECT COUNT(*) TotalStudents FROM Student;
--or
SELECT COUNT(stuID) TotalStudents FROM Student;
SELECT * FROM Enroll; --query to verify the above as (9)

--Select the total classes available
SELECT COUNT(*) TotalClasses FROM Class;

--FIND ID's and Grades of All students taking any class taught by a faculty member with ID 'f110' sort by student ID
SELECT stuID, grade FROM Enroll; --expand this
--class table hac facId, so join enroll with class table
SELECT stuID, grade FROM Enroll e JOIN Class c ON e.classNumber WHERE c.facID = 'F110';

--Expand the above query to include student name and class number
--we need to join the enroll table (stuID and  grade) with the faculty table (facultyID) and the student table and the class table (classnumber)
SELECT firstName, lastName, e.stuID, grade from Enroll e JOIN Class c ON e.classNumber = c.classNumber JOIN Student s ON e.stuID = s.stuID WHERE c.facID = 'F110';
SELECT firstName + ' ' + lastName 'FullName', e.stuID, grade, c.classNumber FROM Enroll e JOIN Class c ON e.classNumber = c.classNumber JOIN Student s ON e.stuID = s.stuID WHERE c.facID = 'F110';

--find the #'s of all class number taught by Byrne of the math dept.
SELECT classNumber FROM Class c JOIN Faculty f ON c.facID = f.facID WHER f.name = 'Byrne' and f.department = 'MATH';

--find the names and ID's of all the faculty members who teach a class in H221
SELECT name, f.facId FROM Faculty f JOIN Class c ON f.facID = c.facID WHERE room = 'H221';