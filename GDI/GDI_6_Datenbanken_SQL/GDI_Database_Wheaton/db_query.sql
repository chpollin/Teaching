Ass 5
author: Christopher Pollin
*************
CREATE TABLE Transaction (
    id varchar(10) PRIMARY KEY,
    entry varchar(400),
    date date,
    to_id varchar(100),
    from_id varchar(100),
    money_id varchar(100),
    good_id varchar(100)
);

LOAD DATA LOCAL INFILE 'transaction.csv' INTO TABLE Transaction 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n';
*************
*************
CREATE TABLE Person (
    from_id varchar(50),
    from_name varchar(150),
    to_id varchar(50),
    to_name varchar(150)
);

LOAD DATA LOCAL INFILE 'person.csv' INTO TABLE Person 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n';
*************
*************
CREATE TABLE Money (
    money_id varchar(10),
    unit varchar(100),
    quantity int
);

LOAD DATA LOCAL INFILE 'money.csv' INTO TABLE Money 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n';
*************
*************
CREATE TABLE Good (
    good_id varchar(10),
    unit varchar(150),
    quantity double,
    good varchar(150) 
);

LOAD DATA LOCAL INFILE 'good.csv' INTO TABLE Good 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n';
*************

SQL-Abfragen:
*************

SELECT Person.to_name, Transaction.entry FROM Person, Transaction
WHERE Person.from_id = Transaction.from_id;

//Gib entry und date aus von Einträgen, die im Dezember stattgefunden haben.
*************
SELECT entry, date FROM Transaction
WHERE MONTH(date) = 12;

//Gib eine Liste aller “from_name” aus. Jeder Name (Schreibweise) darf nur einmal vorkommen.
SELECT DISTINCT from_name FROM Person;

// Gib alle "unit", "quantity", "good" aus, deren "quantity" größer ist als 1 und  
// deren "unit" "bushels" oder "pounds" ist. 
*************
SELECT unit, quantity, good FROM Good
WHERE (quantity > 1) AND (unit = 'bushels') OR (unit = 'pounds');

// Gib alle einzigartigen Vorkommnisse von "to_name", "from_name", Geldbeträge und 
// Warenbezeichnungen aus und sortiere nach den Waren. 
*************
SELECT DISTINCT Person.to_name, Person.from_name, Money.unit, Money.quantity, Good.good FROM Person, Money, Good, Transaction
WHERE (Person.to_id = Transaction.to_id) AND (Money.money_id = Transaction.money_id)
AND (Good.good_id = Transaction.good_id)
ORDER BY Good.good;


select * from Person;



