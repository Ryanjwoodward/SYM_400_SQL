--Basic Queries working with the AdventureWorks_2017 Database on MS Sql Server (SSMS) 
--Database used was titled 'Indexes'
--Author: Ryan Woodward


CREATE TABLE authors(
authID char(3) NOT NULL PRIMARY KEY,
authfName varchar(15) NOT NULL,
authlName varchar(20) NOT NULL
);

INSERT INTO authors VALUES('abc', 'Geordi', 'LaForge', 'Berlin', 'DE');
INSERT INTO authors VALUES('def', 'Will', 'Riker', 'Anchorage', 'AK');
INSERT INTO authors VALUES('ghi', 'Jean-Luc', 'Picard', 'Paris', 'FR');

--Create Index on 'auth_ID' column
CREATE INDEX authID_idx ON authors(authID);

--create unique index on auth_fName column, PROBLEM because firstName can repeat, it will be problem because SQL will enforce UNIQUE
CREATE UNIQUE INDEX auth_fName_idx ON authors(authfName);

--Alter Table add cols for city, state, and add composite index on both cols.
ALTER TABLE authors ADD city varchar(20), state varchar(2);
CREATE INDEX authors_city_state_idx ON authors(city, state);--may have red squiggles, but it ran properly in SSMS

--Drop the index
DROP INDEX authors_city_state_idx;

SELECT * FROM authors WITH (INDEX(authID_idx));
