CREATE TABLE Employee (SSN int PRIMARY KEY NOT NULL, name varchar(20) NOT NULL, deptNum int NOT NULL, jobTitle varchar(50) NOT NULL, salary float NOT NULL);

CREATE TABLE Trip (TripID int PRIMARY KEY NOT NULL, departureCity varchar(30) NOT NULL, destinationCity varchar(30) NOT NULL, departureDate date NOT NULL, returnDate date NOT NULL, SSN int FOREIGN KEY REFERENCES Employee(SSN) NOT NULL);

CREATE TABLE Expense (TripID int FOREIGN KEY REFERENCES Trip(TripID) NOT NULL, item varchar(20) NOT NULL, expenseDate date NOT NULL, amount float NOT NULL, PRIMARY KEY(TripID, item));

/***NOTE: in the Employee table it should all be NOT NULL*/

INSERT INTO EMPLOYEE VALUES

(111, 'Mike Smith', 10, 'project manager', 150000),

(222, 'Dan Prime', 10, 'IT Analyst', 65000),

(333, 'Scott Porter', 20, 'Data Entry', 40000),

(444, 'Dave Wolff', 30, 'Payroll Analyst', 57000),

(555, 'Tina Dunn', 40, 'Sales Manager', 155000),

(666, 'Chris Sullivan', 50, 'Consultant', 77000);

INSERT INTO Trip VALUES

(21, 'Phoenix', 'Denver', '01/01/2020', '01/14/2020', 111),

(31, 'Fargo', 'Seattle', '12/15/2019', '12/31/2019', 222),

(41, 'Hartford', 'Portland', '11/11/2019', '11/22/2019', 333),

(51, 'Dallas', 'Charlotte', '02/02/2020', '02/10/2020', 444),

(61, 'London', 'Chicago', '02/02/2020', '02/10/2020', 555),

(71, 'Oakland', 'Richmond', '05/15/2019', '06/01/2019', 666 );

INSERT INTO EXPENSE VALUES (21, 'Lunch', '01/01/2020', 20),

(21, 'Dinner', '01/01/2020', 20),

(31, 'Car Rental', '02/01/2020', 250),

(51, 'Hotel', '11/11/2019', 550),

(41, 'Hotel', '12/15/2019', 1050),

(31, 'Lunch', '01/01/2020', 20),

(61, 'Entertainment', '2/5/2020', 125);

/*--Could update table trip is cols mixd up

--INSERT INTO Trip VALUES (--column names, col name, col name---)

--(21, 'Phoenix', 'Denver', '01/01/2020', '01/14/2020', 111),

--(31, 'Fargo', 'Seattle', '12/15/2019', '12/31/2019', 222),

--(41, 'Hartford', 'Portland', '11/11/2019', '11/22/2019', 333),

--(51, 'Dallas', 'Charlotte', '02/02/2020', '02/10/2020', 444),

--(61, 'London', 'Chicago', '02/02/2020', '02/10/2020', 555),

--(71, 'Oakland', 'Richmond', '05/15/2019', '06/01/2019', 666 )

--If Trip table missing return date

--ALTER TABLE Trip returnDate date NOT NULL;

--If composite key was note created in expense originally

--ALTER TABLE Expense ADD PRIMARY KEY (tripID, item)*/

/*--give a list of all the destination cities where employees have taken trips to*/

SELECT destinationCity FROM Trip;

SELECT destinationCity FROM Trip WHERE SSN IS NOT NULL;

/*--find all employees information for employee who work in dept 10*/

SELECT * FROM Employee WHERE deptNum = 10;

/*--Get a complete trip record for all the trips with departure dates after Jan 1 2020*/

SELECT * FROM Trip WHERE departureDate > '1-1-2020';

/*--find the names of all employees who have departed on trips from London*/

SELECT name FROM Employee e JOIN Trip t ON e.SSN = t.SSN WHERE destinationCity = 'London';

SELECT * FROM Trip --to show that my destination city was swapper with departure city;

/*--find social security number for all employess that have any single expense item of more than $1000 for a trip*/

SELECT e.SSN, name, amount FROM Employee e JOIN Trip t ON e.SSN = t.SSN JOIN Expense x ON t.TripID = x.TripID WHERE amount > 1000;

/*--find the destination cities of all trips taken by employees who have the job titles of "consultant"*/

SELECT destinationCity, name FROM Trip t JOIN Employee e ON t.SSN = e.SSN WHERE jobTitle = 'Consultant'