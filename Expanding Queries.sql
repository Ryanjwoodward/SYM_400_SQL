--Basic Queries working with the AdventureWorks_2017 Database on MS Sql Server (SSMS) '
--Author: Ryan Woodward

-- select all entries from the person table with the firstname 'john'
SELECT FirstName, MiddleName, LastName, BusinessEntityID FROM Person.Person WHERE FirstName = 'John';

SELECT FirstName = 'John', MiddleName = 'T', LastName = 'Moore' FROM Person.Person WHERE BusinessEntityID = 0000;
--or with where:
SELECT FROM Person.Person WHERE FirstName = 'John' AND MiddleName = 'T' AND LastName = 'Moore' AND BusinessEntityID = 18327;