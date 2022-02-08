
-- Animal Activity
create table people2 (
	ID SERIAL PRIMARY KEY,
	name varchar(30) not null,
	has_pet boolean default false,
	pet_type varchar(10) not null,
	pet_name varchar(30),
	pet_age int 
);

select * from people;

INSERT INTO people (name, has_pet, pet_type, pet_name, pet_age)
VALUES ('Jacob', true, 'dog', 'Misty', 10),
  ('Ahmed', true, 'rock', 'Rockington', 100),
  ('Peter', true, 'cat', 'Franklin', 2),
  ('Dave', true, 'dog', 'Queso', 1);
  
SELECT *
from people2;

SELECT * 
FROM people
WHERE pet_age>2
AND pet_type = 'dog';

CREATE TABLE CITIES(
ID SERIAL PRIMARY KEY,
CITY VARCHAR(30) NOT NULL,
STATE VARCHAR(30) NOT NULL,
population int)

select * from CITIES

CREATE TABLE bird_song(
	english_name VARCHAR(20),
	country VARCHAR(20),
	latitude DEC,
	longitude DEC
	
);

select * from bird_song;

-- Activity 4 - filtering
create table wordassociation (
	author int,
	word1 VARCHAR(30),
	word2 VARCHAR(30),
	source VARCHAR(30)
);

SELECT *
from wordassociation;

-- Query1
SELECT 
	* 
FROM 
	wordassociation
WHERE 
	word1 = 'stone';

-- Query2
SELECT 
	* 
FROM 
	wordassociation
WHERE 
	author BETWEEN 0 and 10;

-- Query3
SELECT 
	* 
FROM 
	wordassociation
WHERE 
	word1 = 'pie'
	or 
	word2 = 'pie';

-- Query4
SELECT 
	* 
FROM 
	wordassociation
WHERE 
	source = 'BC';

-- Query5
SELECT 
	*
FROM 
	wordassociation
WHERE 
	(word1 LIKE '%pie') and (word2 LIKE '%pie%');
	
-- Query6
SELECT 
	* 
FROM 
	wordassociation
WHERE 
	source = 'BC'
	AND author >=333
	AND author <=355;



-- -- Activity 5
-- Create new table to import data
CREATE TABLE firepower (
	country VARCHAR,
	ISO3 VARCHAR,
	rank INT,
	TotalPopulation INT,
	ManpowerAvailable INT,
	TotalMilitaryPersonnel INT,
	ActivePersonnel INT,
	ReservePersonnel INT,
	TotalAircraftStrength INT,
	FighterAircraft INT,
	AttackAircraft INT,
	TotalHelicopterStrength INT,
	AttackHelicopters INT
);

-- Import data from firepower.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM firepower;

ALTER TABLE firepower
ADD COLUMN id SERIAL PRIMARY KEY;

UPDATE
	firepower
SET
	reservepersonnel = reservepersonnel + 2
WHERE
	fighteraircraft = 1;
	
DELETE FROM firepower
WHERE fighteraircraft < 1;


SELECT AVG (totalmilitarypersonnel)

--Joining
SELECT 
    -- columns you want
    players.first_name, players.last_name, players.hand, matches.loser_rank
FROM 
    -- source 1 tabletable
    matches
INNER JOIN 
    -- second table
    players 
ON 
    -- column you want to match - columns in common between the two tables
    players.player_id=matches.loser_id