--import file
source data/import-table-structure.sql;
--


--insert one row into decodemtl_addressbook.Account
INSERT INTO Account (email, password) VALUES('xyz@email.com','hidden1');
--

--Insert one row into decodemtl_addressbook.AddressBook

INSERT INTO AddressBook (name) VALUES ('Frank');
--                                                

--Insert three rows into decodemtl_addressbook.Entry

INSERT INTO Entry 
(firstName,lastName,birthday)
VALUES
("Marc","Mellow","1987-09-08"),
("Qwer","Fggef","1987-08-06"),
("Kbgr","Tuww","1990-05-13");

--

--delete row from a specific table
DELETE FROM Account WHERE id = 4
--


--Retrieve data from the previously inserted decodemtl_addressbook.Account row
SELECT * FROM Account;
--
--Retrieve data from the previously inserted decodemtl_addressbook.AddressBook row
SELECT * FROM AddressBook;

--Retrieve data from the previously inserted decodemtl_addressbook.Entry rows
SELECT * FROM Entry;



--Modify the decodemtl_addressbook.Account row

UPDATE Account 
SET password= "hidden2"
Where id = "5";


--Modify the decodemtl_addressbook.AddressBook row
UPDATE AddressBook
SET name= "Dude"
Where id = "1";

--Modify the three decodemtl_addressbook.Entry rows using one query only
--replace all id less or equal to 2 to work type
UPDATE Entry
SET type="other"
WHERE id <= "2";


--Delete all data from decodemtl_addressbook.
--Entry without using a DELETE statement
--TRUNCATE delete all row but doesnt destroy the structure of the table
TRUNCATE TABLE Entry;


Delete decodemtl_addressbook.Account and all associated date
DROP TABLE Account;


Exercise 7

--Import Database Schema from the following source file into decodemtl_addressbook_import:
--data/import-table-structure.sql
source data/import-table-structure.sql;


--Bulk import data from the following source files into decodemtl_addressbook_import:
--data/import-account.sql

source data/import-account.sql;

--data/import-addressbook.sql
source data/import-addressbook.sql;
--data/import-entry.sql
source data/import-entry.sql;



Exercise 8

--What is the email of the Account identified by "63"?
SELECT *
FROM Account
WHERE id= "63";


--What are the names of the AdressBook belonging to accountId "3"?

SELECT *
FROM AddressBook
WHERE accountId= 3;

--On which date was the AddressBook titled "Lorem Foundation" created?

SELECT *
FROM AddressBook
WHERE name= "Lorem Foundation";

--How many Accounts exist?

SELECT COUNT(*) FROM Account;
--How many Address Books exist?
SELECT COUNT(*) FROM AddressBook;

--How many Address Book Entries exist?
SELECT COUNT(*) FROM Entry;


--How many Address Book Entries are listed as born before February 12th of 1982?

SELECT COUNT(*)
FROM Entry
WHERE birthday < '1982-02-12';


--view whole table returning a list of id who was born before 
SELECT * FROM Entry WHERE birthday < '1982-02-12';

--How many Address Book Entries are listed as born on or after January 1st of 1965?
SELECT COUNT(*)
FROM Entry
WHERE birthday >= '1965-01-01';

--Which Address Book Entry is listed as being the oldest of age?
--AS mean alias so you put whatever name you want

SELECT Min(birthday) AS whatever FROM Entry;


--How many Address Book Entries are not listed as other?

SELECT COUNT(*) FROM Entry WHERE type != 'other';

--How many Address Book Entries are listed as either home or work?

SELECT COUNT(*) FROM Entry WHERE type = ('home') OR ('work');
--How many Address Book Entries are listed as phones?

SELECT COUNT(*) FROM Entry WHERE subtype = 'phone';