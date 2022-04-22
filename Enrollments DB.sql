Create table Student( stuID varchar(6) NOT NULL Primary Key, lastName varchar(20) NOT NULL, firstName varchar(20) NOT NULL, major varchar(10), Credits int );

Create table Faculty( facID varchar(6) NOT NULL, name varchar(20) NOT NULL, department varchar(20), rank varchar(10), CONSTRAINT Faculty_facID_pk PRIMARY KEY (facID));

Create table Class( classNumber varchar(8), facID varchar(6) references Faculty (facID) ON DELETE SET NULL, Schedule varchar(8), room varchar(6), CONSTRAINT Class_classNumber_pk PRIMARY KEY (classNumber) );

Create table Enroll( stuID varchar(6), classNumber varchar(8), grade varchar(2), CONSTRAINT Enroll_classnumber_stuId PRIMARY KEY (classNumber, stuID), CONSTRAINT Enroll_classnumber_fk FOREIGN KEY (classnumber) references Class (classNumber) ON DELETE CASCADE, CONSTRAINT Enroll_stuID_fk FOREIGN KEY (stuID) references Student (stuID) ON DELETE CASCADE );
Insert INTO Student VALUES ('S1001', 'Smith', 'Tom', 'History', 90);

Insert INTO Student VALUES ('S1002', 'Chin', 'Ann', 'Math', 36);

Insert INTO Student VALUES ('S1005', 'Lee', 'Perry', 'History', 3);

Insert INTO Student VALUES ('S1010', 'Burns', 'Edwards', 'Art', 63);

Insert INTO Student VALUES ('S1013', 'McCarthy', 'Owen', 'Math', 10);

Insert INTO Student VALUES ('S1015', 'Jones', 'Mary', 'Math', 42);

Insert INTO Student VALUES ('S1020', 'Rivera', 'Jane', 'CSC', 15);

Insert INTO Faculty VALUES ('F101', 'Adams', 'Art', 'Professor');

Insert INTO Faculty VALUES ('F105', 'Tanaka', 'CSC', 'Instructor');

Insert INTO Faculty VALUES ('F110', 'Byrne', 'Math', 'Assistant');

Insert INTO Faculty VALUES ('F115', 'Smith', 'History', 'Associate');

Insert INTO Faculty VALUES ('F221', 'Smith', 'CSC', 'Professor');

Insert INTO Class VALUES ('ART103A', 'F101', 'MWF9', 'H221');

Insert INTO Class VALUES ('CSC201A', 'F105', 'TTH10', 'M110');

Insert INTO Class VALUES ('CSC203A', 'F105', 'MTF12', 'M110');

Insert INTO Class VALUES ('HST205A', 'F115', 'MWF11', 'H221');

Insert INTO Class VALUES ('MTH101B', 'F110', 'MTTH9', 'H225');

Insert INTO Class VALUES ('MTH103A', 'F110', 'MWF11', 'H225');

INSERT INTO Enroll VALUES ('S1001', 'ART103A', 'A');

INSERT INTO Enroll VALUES ('S1001', 'HST205A', 'C');

INSERT INTO Enroll VALUES ('S1002', 'ART103A', 'D');

INSERT INTO Enroll VALUES ('S1002', 'CSC201A', 'F');

INSERT INTO Enroll VALUES ('S1002', 'MTH103A', 'B');

INSERT INTO Enroll VALUES ('S1010', 'ART103A', 'A');

INSERT INTO Enroll VALUES ('S1010', 'MTH103A', 'B');

INSERT INTO Enroll VALUES ('S1020', 'CSC201A', 'B');

INSERT INTO Enroll VALUES ('S1020', 'MTH101B', 'A');

