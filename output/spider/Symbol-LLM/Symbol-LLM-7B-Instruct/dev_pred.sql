 SELECT COUNT(*) FROM singer; 
 SELECT COUNT(*) FROM singer; 
 SELECT Name, Country, Age FROM singer ORDER BY Age DESC; 
 SELECT Name, Country, Age FROM singer ORDER BY Age DESC; 
 SELECT AVG(Age), MIN(Age), MAX(Age) FROM Singer WHERE Country = 'France'; 
 SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'; 
 SELECT T2.Name, T2.Song_release_year FROM concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID ORDER BY T2.Age ASC LIMIT 1; 
 SELECT T2.Song_Name, T2.Song_release_year FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T1.Age = (SELECT MIN(Age) FROM singer) 
 SELECT DISTINCT Country FROM singer WHERE Age > 20; 
 SELECT DISTINCT Country FROM singer WHERE Age > 20; 
 SELECT Country, COUNT(*) FROM singer GROUP BY Country; 
 SELECT Country, COUNT(*) AS num_singers FROM singer GROUP BY Country; 
SELECT T2.Song_Name FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN concert AS T3 ON T1.concert_ID = T3.concert_ID WHERE T2.Age > (SELECT AVG(Age) FROM singer)
SELECT T2.Song_Name FROM singer AS T1 JOIN concert AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T1.Age > (SELECT AVG(Age) FROM singer)
 SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000; 
 SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000; 
 SELECT MAX(Capacity), AVG(Capacity) FROM stadium; 
 SELECT AVG(Capacity), MAX(Capacity) FROM stadium; 
 SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1; 
 SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1; 
 SELECT COUNT(*) FROM concert WHERE Year = 2014 OR Year = 2015; 
 SELECT COUNT(*) FROM concert WHERE Year = 2014 OR Year = 2015; 
 SELECT T1.Name, COUNT(*) FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T1.Name; 
 SELECT T1.Name, COUNT(*) AS concerts FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T1.Name; 
 SELECT T1.Name, T1.Capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year >= 2014 GROUP BY T1.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.Name, T1.Capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year > 2013 GROUP BY T1.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Name FROM stadium WHERE NOT Stadium_ID IN (SELECT Stadium_ID FROM concert) 
 SELECT Name FROM stadium WHERE NOT Stadium_ID IN (SELECT Stadium_ID FROM concert) 
 SELECT Country FROM singer WHERE Age > 40 INTERSECT SELECT Country FROM singer WHERE Age < 30; 
SELECT Name FROM stadium EXCEPT SELECT T2.Name FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year = 2014;
 SELECT Name FROM stadium WHERE NOT Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE Year = 2014) 
 SELECT concert_Name, theme, COUNT(*) AS num_singers FROM concert GROUP BY concert_Name, theme; 
 SELECT concert_Name, theme, COUNT(*) AS num_singers FROM concert GROUP BY concert_Name, theme; 
 SELECT T2.Name, COUNT(*) AS concerts FROM concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T2.Name; 
 SELECT T2.Name, COUNT(*) AS concerts FROM concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T2.Name; 
SELECT T2.Name FROM concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T1.Year = 2014;
SELECT T2.Name FROM concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T1.Year = 2014;
 SELECT T2.Name, T2.Country FROM concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Song_Name LIKE '%Hey%' 
 SELECT T1.Name, T1.Country FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Song_Name LIKE '%Hey%' 
 SELECT T1.Name, T1.Location FROM stadium AS T1 INNER JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = 2014 INNER JOIN concert AS T3 ON T1.Stadium_ID = T3.Stadium_ID WHERE T3.Year = 2015 
 SELECT T1.Name, T1.Location FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = 2014 INTERSECT SELECT T1.Name, T1.Location FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = 2015 
 SELECT COUNT(*) FROM concert WHERE stadium.Name = 'stadium' ORDER BY stadium.Capacity DESC LIMIT 1; 
 SELECT COUNT(*) FROM concert WHERE stadium_id = (SELECT stadium_id FROM stadium ORDER BY Capacity DESC LIMIT 1) 
 SELECT COUNT(*) FROM Pets WHERE weight > 10; 
 SELECT COUNT(*) FROM Pets WHERE weight > 10; 
 SELECT weight FROM Pets ORDER BY pet_age LIMIT 1; 
 SELECT weight FROM Pets ORDER BY pet_age LIMIT 1; 
 SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType; 
 SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType; 
 SELECT COUNT(*) FROM Pets WHERE PetType = 'Dog' AND pet_age > 20 AND FOREIGN KEY(PetID) REFERENCES Student(StuID) AND StuID IN (     SELECT StuID     FROM Student     WHERE Age > 20 ); 
 SELECT COUNT(*) FROM Pets AS T1 JOIN Student AS T2 ON T1.PetID = T2.StuID WHERE T2.Age > 20; 
 SELECT COUNT(*) FROM Pets WHERE PetType = 'Dog' AND FOREIGN KEY(StuID) REFERENCES Student(StuID) AND Sex = 'F'; 
 SELECT COUNT(*) FROM (   SELECT * FROM Pets   JOIN Student ON Student.StuID = Pets.StuID   WHERE Pets.PetType = 'Dog' AND Student.Sex = 'F' ) AS t1; 
 SELECT COUNT(DISTINCT PetType) FROM Pets; 
 SELECT COUNT(DISTINCT PetType) FROM Pets; 
 SELECT T1.Fname FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' OR T3.PetType = 'dog'; 
 SELECT T1.Fname FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' OR T3.PetType = 'dog'; 
 SELECT T1.Fname FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'Cat' AND T3.PetType = 'Dog' 
 SELECT T1.Fname FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'Cat' AND T3.PetType = 'Dog'; 
 SELECT Major, Age FROM Student WHERE NOT StuID IN (SELECT StuID FROM Has_Pet WHERE PetType = 'Cat'); 
 SELECT Major, Age FROM Student WHERE NOT StuID IN (SELECT StuID FROM Has_Pet WHERE PetType = 'Cat'); 
SELECT StuID FROM Has_Pet WHERE PetType != 'Cat';
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Has_Pet WHERE PetType = 'Cat'
 SELECT T1.Fname, T1.Age FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T2.PetType = 'Dog' AND NOT T2.PetType = 'Cat'; 
 SELECT T1.Fname FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T2.PetType = 'Dog' EXCEPT SELECT T1.Fname FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T2.PetType = 'Cat'; 
 SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1; 
 SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1; 
 SELECT PetID, weight FROM Pets WHERE pet_age > 1; 
 SELECT PetID, weight FROM Pets WHERE pet_age > 1; 
 SELECT PetType, AVG(weight) AS avg_weight, MAX(weight) AS max_weight FROM Pets GROUP BY PetType; 
 SELECT PetType, AVG(weight) AS avg_weight, MAX(weight) AS max_weight FROM Pets GROUP BY PetType; 
 SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType; 
 SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType; 
 SELECT T1.Fname, T1.Age FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID; 
 SELECT DISTINCT T1.Fname, T1.Age FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID; 
SELECT T2.PetID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith';
 SELECT T2.PetID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'; 
 SELECT COUNT(*), StuID FROM Has_Pet GROUP BY StuID; 
 SELECT T1.StuID, COUNT(*) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID; 
 SELECT T1.Fname, T1.Sex FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID HAVING COUNT(*) > 1; 
 SELECT T1.Fname, T1.Sex FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID HAVING COUNT(*) > 1; 
 SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.pet_age = 3 
 SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.pet_age = 3; 
 SELECT AVG(Age) FROM Student WHERE NOT StuID IN (SELECT StuID FROM Has_Pet); 
 SELECT AVG(Age) FROM Student WHERE NOT StuID IN (SELECT StuID FROM Has_Pet); 
 SELECT COUNT(*) FROM continents; 
 SELECT COUNT(*) FROM continents; 
 SELECT T1.ContId, T1.Continent, COUNT(*) AS num_countries FROM continents AS T1 JOIN countries AS T2 ON T1.ContId = T2.Continent_Id GROUP BY T1.ContId; 
 SELECT T1.ContId, T1.Continent, COUNT(*) AS num_countries FROM continents AS T1 GROUP BY T1.Continent; 
 SELECT COUNT(*) FROM countries; 
 SELECT COUNT(*) FROM countries; 
 SELECT T1.Maker, T1.Id, COUNT(*) AS Models FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId GROUP BY T1.Id; 
 SELECT T1.Maker, T1.Id, COUNT(*) AS num_models FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Maker ORDER BY num_models DESC; 
 SELECT Model FROM cars_data ORDER BY Horsepower ASC LIMIT 1; 
 SELECT Model FROM cars_data ORDER BY Horsepower ASC LIMIT 1; 
 SELECT Model FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data) 
 SELECT Model FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data) 
 SELECT T2.Maker FROM cars_data AS T1 JOIN car_makers AS T2 ON T1.MakeId = T2.Id WHERE T1.Year = 1970 
 SELECT T2.Maker FROM car_names AS T1 JOIN car_makers AS T2 ON T1.MakeId = T2.Id WHERE T1.Year = 1970 GROUP BY T2.Maker HAVING COUNT(*) > 0; 
 SELECT Make, Year FROM cars_data ORDER BY Year ASC LIMIT 1; 
 SELECT T2.Maker, T1.Year FROM cars_data AS T1 JOIN car_names AS T2 ON T1.MakeId = T2.Id ORDER BY T1.Year LIMIT 1; 
 SELECT DISTINCT Model FROM car_names WHERE Year > 1980; 
 SELECT DISTINCT Model FROM cars_data WHERE Year > 1980; 
 SELECT Continent, COUNT(*) AS CarMakers FROM car_makers GROUP BY Continent; 
 SELECT T1.Continent, COUNT(*) AS CarMakers FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.Continent; 
 SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.Maker, COUNT(*) AS Count FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Maker; 
 SELECT T1.Maker, COUNT(*) AS num_models, T1.Id FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Maker; 
 SELECT Accelerate FROM cars_data WHERE Model = 'amc hornet sportabout (sw)' 
 SELECT Accelerate FROM cars_data WHERE Model = 'AMC Hornet Sportabout (SW)' 
 SELECT COUNT(*) FROM car_makers WHERE Country = 'France'; 
 SELECT COUNT(*) FROM car_makers WHERE Country = 'France'; 
 SELECT COUNT(*) FROM car_names WHERE Make = 'USA'; 
 SELECT COUNT(*) FROM car_names WHERE Make = 'United States'; 
 SELECT AVG(mpg) FROM cars_data WHERE cylinders = 4; 
 SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4; 
 SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974; 
 SELECT MIN(Weight) FROM cars_data WHERE MPG = '8' AND Year = 1974; 
 SELECT Maker, Model FROM car_makers INNER JOIN car_names ON car_makers.Maker = car_names.Make 
 SELECT T2.Maker, T2.Model FROM car_names AS T1 JOIN car_makers AS T2 ON T1.MakeId = T2.Id; 
 SELECT T1.CountryName, T1.CountryId FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId HAVING COUNT(*) >= 1; 
 SELECT T1.CountryName, T1.CountryId FROM countries AS T1 INNER JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId HAVING COUNT(*) >= 1; 
 SELECT Model, COUNT(*) AS num_cars FROM cars_data WHERE Horsepower > 150 GROUP BY Model; 
 SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150; 
 SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year; 
 SELECT Year, AVG(Weight) AS Average_Weight, AVG(Year) AS Average_Year FROM cars_data GROUP BY Year; 
 SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T1.Continent = 'Europe' GROUP BY T1.CountryName HAVING COUNT(*) >= 3; 
 SELECT T1.Continent, T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T1.Continent = 'Europe' GROUP BY T1.Continent HAVING COUNT(*) >= 3; 
 SELECT MAX(Horsepower), Make FROM cars_data WHERE Cylinders = 3; 
 SELECT MAX(Horsepower) FROM cars_data WHERE Cylinders = 3; 
 SELECT Model FROM cars_data ORDER BY MPG DESC LIMIT 1; 
 SELECT Model FROM cars_data ORDER BY MPG DESC LIMIT 1; 
 SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980; 
 SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980; 
 SELECT AVG(Edispl) FROM cars_data WHERE Model = 'volvo'; 
 SELECT AVG(Edispl) FROM cars_data WHERE Make = 'volvo'; 
 SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders; 
 SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders; 
 SELECT Model FROM car_names GROUP BY Model ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Model FROM car_names GROUP BY Model ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4; 
 SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4; 
 SELECT COUNT(*) FROM cars_data WHERE Year = 1980; 
 SELECT COUNT(*) FROM cars_data WHERE Year = 1980; 
 SELECT COUNT(*) FROM car_names AS t1 JOIN car_makers AS t2 ON t1.MakeId = t2.Id WHERE t2.FullName = 'American Motor Company'; 
 SELECT COUNT(*) FROM car_names AS t1 JOIN car_makers AS t2 ON t1.MakeId = t2.Id WHERE t2.Maker = 'American Motor Company'; 
 SELECT T1.Maker, T1.Id FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId GROUP BY T1.Id HAVING COUNT(*) > 3; 
 SELECT T2.Maker, T1.MakerId FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T1.MakerId HAVING COUNT(*) > 3; 
 SELECT DISTINCT Model FROM car_names WHERE Make = 'General Motors' OR Weight > 3500; 
 SELECT DISTINCT Model FROM car_names WHERE Make = 'General Motors' OR Weight > 3500; 
 SELECT Year FROM cars_data WHERE Weight >= 3000 AND Weight <= 4000; 
 SELECT Year FROM cars_data WHERE Weight < 4000 OR Weight > 3000 
 SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1; 
 SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1; 
 SELECT Cylinders FROM cars_data WHERE Model = 'volvo' ORDER BY Accelerate LIMIT 1; 
 SELECT Cylinders FROM cars_data WHERE Make = 'volvo' ORDER BY Accelerate ASC LIMIT 1; 
 SELECT COUNT(*)  FROM (   SELECT *    FROM cars_data    WHERE Accelerate > (SELECT MAX(Accelerate) FROM cars_data)  ) AS t1; 
 SELECT COUNT(*)  FROM (   SELECT *    FROM cars_data    WHERE Accelerate > (SELECT MAX(Accelerate) FROM cars_data)  ) AS t; 
 SELECT COUNT(*)  FROM (   SELECT Country    FROM car_makers    GROUP BY Country    HAVING COUNT(*) > 2 ) AS t; 
 SELECT COUNT(*)  FROM (SELECT CountryId        FROM car_makers        GROUP BY CountryId        HAVING COUNT(*) > 2)  AS t1; 
 SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6; 
 SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6; 
 SELECT Model FROM cars_data WHERE Cylinders = 4 ORDER BY Horsepower DESC LIMIT 1; 
 SELECT Model FROM cars_data WHERE Cylinders = 4 ORDER BY Horsepower DESC LIMIT 1; 
 SELECT T1.MakeId, T2.Model FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Horsepower > (SELECT MIN(Horsepower) FROM car_names) AND T1.Cylinders <= 3; 
 SELECT T1.MakeId, T2.Model FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Country = 'america' AND T2.Horsepower < 4 AND T2.Cylinders < 4; 
 SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980; 
 SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980; 
 SELECT Model FROM cars_data WHERE Weight < 3500 AND NOT Make = 'Ford Motor Company'; 
 SELECT DISTINCT Model FROM cars_data WHERE Weight < 3500 AND NOT MakeId IN (SELECT Id FROM car_makers WHERE Maker = 'Ford Motor Company'); 
 SELECT CountryName FROM countries WHERE NOT CountryId IN (   SELECT Country   FROM car_makers ); 
 SELECT CountryName FROM countries WHERE NOT ContId IN (SELECT Country FROM car_makers); 
 SELECT T1.Maker, T1.Id FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId GROUP BY T1.Maker HAVING COUNT(*) >= 2 AND COUNT(*) < 3; 
 SELECT T1.Maker, T1.Id FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Maker HAVING COUNT(*) >= 2 AND COUNT(*) < 3; 
 SELECT T1.CountryId, T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId HAVING COUNT(*) > 3 UNION SELECT T1.CountryId, T1.CountryName FROM countries AS T1 JOIN car_names AS T2 ON T1.CountryId = T2.Country WHERE T2.Model = 'fiat' 
 SELECT T1.CountryId, T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId HAVING COUNT(*) > 3 UNION SELECT T1.CountryId, T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country JOIN car_names AS T3 ON T2.MakeId = T3.MakeId WHERE T3.Model = 'fiat' 
 SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'; 
 SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways' 
 SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'; 
 SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'; 
 SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'; 
 SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'; 
 SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'; 
 SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'; 
 SELECT COUNT(*) FROM airlines; 
 SELECT COUNT(*) FROM airlines; 
 SELECT COUNT(*) FROM airports; 
 SELECT COUNT(*) FROM airports; 
 SELECT COUNT(*) FROM flights; 
 SELECT COUNT(*) FROM flights; 
 SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'; 
 SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'; 
 SELECT COUNT(*) FROM airlines WHERE Country = 'USA'; 
 SELECT COUNT(*) FROM airlines WHERE Country = 'USA'; 
 SELECT City, Country FROM airports WHERE AirportName = 'Alton'; 
 SELECT City, Country FROM airports WHERE AirportName = 'Alton'; 
 SELECT AirportName FROM airports WHERE AirportCode = 'AKO'; 
 SELECT AirportName FROM airports WHERE AirportCode = 'AKO'; 
SELECT AirportName FROM airports WHERE City = 'Aberdeen';
 SELECT AirportName FROM airports WHERE City = 'Aberdeen'; 
 SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'; 
 SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'; 
 SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'; 
 SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'; 
 SELECT COUNT(*) FROM flights WHERE SourceAirport = 'Aberdeen'; 
 SELECT COUNT(*) FROM flights WHERE SourceAirport = 'Aberdeen'; 
 SELECT COUNT(*) FROM flights WHERE DestAirport = 'Aberdeen'; 
 SELECT COUNT(*) FROM flights WHERE DestAirport = 'ABZ'; 
 SELECT COUNT(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen' AND T2.DestAirport = 'Ashley'; 
 SELECT COUNT(*) FROM flights WHERE SourceAirport = 'Aberdeen' AND DestAirport = 'Ashley'; 
 SELECT COUNT(*) FROM flights WHERE Airline = 'JetBlue Airways'; 
 SELECT COUNT(*) FROM flights WHERE Airline = 'JetBlue Airways'; 
 SELECT COUNT(*) FROM flights WHERE Airline = 'United Airlines' AND DestAirport = 'ASY'; 
 SELECT COUNT(*) FROM flights WHERE DestAirport = 'ASY' AND Airline = 'United Airlines'; 
 SELECT COUNT(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid JOIN airports AS T3 ON T1.SourceAirport = T3.AirportCode WHERE T2.Airline = 'United Airlines' AND T3.AirportName = 'AHD'; 
 SELECT COUNT(*) FROM flights WHERE Airline = 'United Airlines' AND SourceAirport = 'AHD'; 
 SELECT COUNT(*) FROM flights WHERE airline = 'United Airlines' AND DestAirport = 'Aberdeen'; 
 SELECT COUNT(*) FROM flights WHERE DestAirport = 'Aberdeen' AND Airline = 'United Airlines'; 
 SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT City FROM airports GROUP BY City ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT City FROM airports GROUP BY City ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.AirportCode FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.AirportCode ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.AirportCode FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.AirportCode ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.AirportCode FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.AirportCode ORDER BY COUNT(*) LIMIT 1; 
 SELECT T1.AirportCode FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.AirportCode ORDER BY COUNT(*) LIMIT 1; 
 SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T2.Airline ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T2.Airline ORDER BY COUNT(*) LIMIT 1; 
 SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Abbreviation, T1.Country ORDER BY COUNT(*) LIMIT 1; 
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline JOIN airports AS T3 ON T2.SourceAirport = T3.AirportCode WHERE T3.AirportName = 'AHD';
 SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'; 
 SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'; 
 SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'; 
 SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'APG' INTERSECT SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'CVO' 
 SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'APG' INTERSECT SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'CVO' 
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' EXCEPT SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'APG';
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' EXCEPT SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'APG'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T2.Airline HAVING COUNT(*) >= 10;
 SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T2.Airline HAVING COUNT(*) >= 10; 
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T2.Airline HAVING COUNT(*) < 200;
 SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(*) < 200; 
 SELECT FlightNo FROM flights WHERE Airline = 'United Airlines'; 
 SELECT FlightNo FROM flights WHERE Airline = 'United Airlines' 
 SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'; 
 SELECT FlightNo FROM flights WHERE SourceAirport = 'APG' 
 SELECT FlightNo FROM flights WHERE DestAirport = 'APG'; 
 SELECT FlightNo FROM flights WHERE DestAirport = 'APG'; 
 SELECT FlightNo FROM flights WHERE SourceAirport = 'Aberdeen'; 
 SELECT FlightNo FROM flights WHERE SourceAirport = 'Aberdeen'; 
 SELECT FlightNo FROM flights WHERE DestAirport = 'Aberdeen'; 
 SELECT FlightNo FROM flights WHERE DestAirport = 'ABZ'; 
 SELECT COUNT(*) FROM flights WHERE DestAirport IN ('ABR', 'ABI'); 
 SELECT COUNT(*) FROM flights WHERE DestAirport IN ('ABZ', 'ABI'); 
SELECT AirportName FROM airports WHERE NOT City IN (SELECT DISTINCT SourceAirport FROM flights) AND NOT City IN (SELECT DISTINCT DestAirport FROM flights)
 SELECT AirportName FROM airports WHERE NOT City IN (SELECT SourceAirport FROM flights) AND NOT City IN (SELECT DestAirport FROM flights) 
 SELECT COUNT(*) FROM employee; 
 SELECT COUNT(*) FROM employee; 
SELECT Name FROM employee ORDER BY Age ASC;
 SELECT Name FROM employee ORDER BY Age ASC; 
 SELECT City, COUNT(*) AS num_employees FROM employee GROUP BY City; 
 SELECT City, COUNT(*) AS num_employees FROM employee GROUP BY City; 
 SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1; 
 SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1; 
 SELECT Location, COUNT(*) AS num_shops FROM shop GROUP BY Location; 
 SELECT Location, COUNT(*) AS num_shops FROM shop GROUP BY Location; 
 SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1; 
 SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1; 
 SELECT MIN(Number_products), MAX(Number_products) FROM shop; 
 SELECT MIN(Number_products), MAX(Number_products) FROM shop; 
 SELECT Name, Location, District FROM shop ORDER BY Number_products DESC; 
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC;
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop);
 SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop) 
 SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T2.Employee_ID ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Employee_ID ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T2.Bonus DESC LIMIT 1; 
 SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T2.Bonus DESC LIMIT 1; 
 SELECT Name FROM employee WHERE NOT Employee_ID IN (SELECT Employee_ID FROM evaluation); 
 SELECT Name FROM employee WHERE NOT Employee_ID IN (SELECT Employee_ID FROM evaluation) 
 SELECT T2.Name FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Shop_ID ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T2.Name FROM employee AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Shop_ID ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Name FROM shop WHERE NOT Shop_ID IN (SELECT Shop_ID FROM hiring);
 SELECT Name FROM shop WHERE NOT EXISTS (SELECT * FROM employee WHERE shop_id = shop_id); 
 SELECT shop.Name, COUNT(*) AS num_employees FROM shop JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY shop.Name; 
SELECT shop.Name, COUNT(employee.Employee_ID) FROM employee JOIN hiring ON employee.Employee_ID = hiring.Employee_ID JOIN shop ON hiring.Shop_ID = shop.Shop_ID GROUP BY shop.Name;
 SELECT SUM(Bonus) FROM evaluation; 
 SELECT SUM(Bonus) FROM evaluation; 
 SELECT * FROM hiring; 
 SELECT * FROM hiring; 
 SELECT District FROM shop WHERE Number_products < 3000 AND Number_products > 10000 
 SELECT District FROM shop WHERE Number_products < 3000 AND Number_products > 10000 GROUP BY District HAVING COUNT(*) > 1; 
 SELECT COUNT(DISTINCT Location) FROM shop; 
 SELECT COUNT(DISTINCT Location) FROM shop; 
 SELECT COUNT(*) FROM Documents; 
 SELECT COUNT(*) FROM Documents; 
 SELECT Document_ID, Document_Name, Document_Description FROM Documents; 
 SELECT Document_ID, Document_Name, Document_Description FROM Documents; 
 SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%' 
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
 SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'; 
 SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'; 
 SELECT COUNT(DISTINCT Template_ID) FROM Documents; 
 SELECT COUNT(DISTINCT Template_ID) FROM Documents; 
 SELECT COUNT(*) FROM Documents WHERE Document_ID IN (   SELECT Document_ID   FROM Templates   WHERE Template_Type_Code = 'PPT' ); 
 SELECT COUNT(*) FROM Documents WHERE Document_ID IN (   SELECT Document_ID   FROM Templates   WHERE Template_Type_Code = 'PPT' ); 
 SELECT Template_ID, COUNT(*) AS num_docs FROM Documents GROUP BY Template_ID; 
 SELECT Template_ID, COUNT(*) AS Template_Count FROM Documents GROUP BY Template_ID; 
 SELECT T1.Template_ID, T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID, T1.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.Template_ID, T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.Template_ID FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID HAVING COUNT(*) > 1; 
 SELECT T1.Template_ID FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID HAVING COUNT(*) > 1; 
SELECT Template_ID FROM Templates EXCEPT SELECT Template_ID FROM Documents
 SELECT Template_ID FROM Templates WHERE NOT Template_ID IN (SELECT Template_ID FROM Documents) 
 SELECT COUNT(*) FROM Templates; 
 SELECT COUNT(*) FROM Templates; 
 SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates; 
 SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates; 
 SELECT DISTINCT Template_Type_Code FROM Templates; 
 SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types; 
SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PP' OR Template_Type_Code = 'PPT';
 SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PP' OR Template_Type_Code = 'PPT'; 
 SELECT COUNT(*) FROM Ref_Template_Types AS t1 JOIN Templates AS t2 ON t1.Template_Type_Code = t2.Template_Type_Code WHERE t1.Template_Type_Code = 'CV'; 
 SELECT COUNT(*) FROM Ref_Template_Types INNER JOIN Templates ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Description = 'CV'; 
 SELECT T1.Template_Type_Code, T1.Version_Number FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Date_Effective_From > '2021-01-01'; 
 SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5; 
 SELECT Template_Type_Code, COUNT(*) AS num_templates FROM Templates GROUP BY Template_Type_Code; 
 SELECT Template_Type_Code, COUNT(*) AS num_templates FROM Templates GROUP BY Template_Type_Code; 
 SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3; 
 SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3; 
 SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY Version_Number ASC; 
 SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code; 
 SELECT T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = 'Data base'; 
 SELECT T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = 'Data base'; 
SELECT Document_Name FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'BK';
SELECT Document_Name FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'BK';
 SELECT Template_Type_Code, COUNT(*) AS num_docs FROM Templates GROUP BY Template_Type_Code; 
 SELECT Template_Type_Code, COUNT(*) AS num_documents FROM Templates GROUP BY Template_Type_Code; 
 SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Template_Type_Code FROM Ref_Template_Types WHERE NOT Template_Type_Code IN (   SELECT Template_Type_Code   FROM Documents ); 
 SELECT Template_Type_Code FROM Ref_Template_Types WHERE NOT Template_Type_Code IN (   SELECT Template_Type_Code   FROM Documents ); 
 SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types; 
 SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types; 
 SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = "AD"; 
 SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'; 
 SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'; 
 SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'; 
 SELECT DISTINCT T1.Template_Type_Description FROM Ref_Template_Types AS T1 INNER JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code; 
 SELECT DISTINCT T1.Template_Description FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code JOIN Documents AS T3 ON T2.Template_ID = T3.Template_ID; 
 SELECT T2.Template_ID FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T1.Template_Type_Description = 'Presentation'; 
 SELECT T2.Template_ID FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T1.Template_Type_Description = 'Presentation'; 
 SELECT COUNT(*) FROM Paragraphs; 
 SELECT COUNT(*) FROM Paragraphs; 
 SELECT COUNT(*) FROM Paragraphs WHERE Document_Name = 'Summer Show'; 
 SELECT COUNT(*) FROM Paragraphs WHERE Document_Name = 'Summer Show'; 
SELECT Other_Details FROM Paragraphs WHERE Paragraph_Text = 'Korea'
 SELECT Paragraph_Details FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%' 
 SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs WHERE Document_Name = 'Welcome to NY'; 
 SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs WHERE Document_Name = 'Welcome to NY'; 
SELECT Paragraph_Text FROM Paragraphs WHERE Document_ID = (SELECT Document_ID FROM Documents WHERE Document_Name = 'Customer reviews');
 SELECT Paragraph_Text FROM Paragraphs WHERE Document_Name = 'Customer reviews'; 
 SELECT Document_ID, COUNT(*) AS num_paragraphs FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID; 
 SELECT Document_ID, COUNT(*) AS num_paras FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID; 
 SELECT Document_ID, Document_Name, COUNT(*) AS num_paras FROM Paragraphs GROUP BY Document_ID, Document_Name; 
 SELECT Document_ID, Document_Name, COUNT(*) AS Number_of_Paragraphs FROM Documents GROUP BY Document_ID, Document_Name; 
 SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2; 
 SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2; 
 SELECT t1.Document_ID, t1.Document_Name FROM Documents AS t1 JOIN Paragraphs AS t2 ON t1.Document_ID = t2.Document_ID GROUP BY t1.Document_ID, t1.Document_Name ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT t1.Document_ID, t1.Document_Name FROM Documents AS t1 JOIN Paragraphs AS t2 ON t1.Document_ID = t2.Document_ID GROUP BY t1.Document_ID ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1; 
 SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1; 
 SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%1 to 2%' 
 SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%one to two paragraphs%' 
 SELECT Document_ID, Paragraph_Text FROM Paragraphs WHERE Paragraph_Text LIKE '%Brazil%' AND Paragraph_Text LIKE '%Ireland%' 
 SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%Brazil%' AND Paragraph_Text LIKE '%Ireland%' 
 SELECT COUNT(*) FROM teacher; 
 SELECT COUNT(*) FROM teacher; 
 SELECT Name FROM teacher ORDER BY Age ASC; 
 SELECT Name FROM teacher ORDER BY Age ASC; 
 SELECT Age, Hometown FROM teacher; 
 SELECT Age, Hometown FROM teacher; 
SELECT Name FROM teacher WHERE Hometown <> 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Hometown <> 'Little Lever Urban District'
 SELECT Name FROM teacher WHERE Age = 32 OR Age = 33; 
 SELECT Name FROM teacher WHERE Age = 32 OR Age = 33; 
 SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1; 
 SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1; 
 SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown; 
 SELECT Hometown, COUNT(*) AS num_teachers FROM teacher GROUP BY Hometown; 
 SELECT Hometown, COUNT(*) AS num_teachers FROM teacher GROUP BY Hometown ORDER BY num_teachers DESC LIMIT 1; 
 SELECT Hometown, COUNT(*) as num_teachers FROM teacher GROUP BY Hometown ORDER BY num_teachers DESC LIMIT 1; 
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2;
 SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2; 
SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID;
 SELECT T2.Name, T1.Course FROM course AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID; 
 SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID ORDER BY T2.Name 
 SELECT T2.Name, T1.Course FROM course AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID ORDER BY T2.Name 
SELECT T2.Name FROM course AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID WHERE T1.Course = 'Math';
 SELECT T2.Name FROM course AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID WHERE T1.Course = 'Math'; 
 SELECT T2.Name, COUNT(*) AS num_courses FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name ORDER BY num_courses DESC; 
 SELECT T2.Name, COUNT(*) AS num_courses FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name; 
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name HAVING COUNT(*) >= 2;
 SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name HAVING COUNT(*) >= 2; 
SELECT Name FROM teacher WHERE NOT Teacher_ID IN (SELECT Teacher_ID FROM course_arrange)
SELECT Name FROM teacher WHERE NOT "Teacher_ID" IN (SELECT Teacher_ID FROM course_arrange);
 SELECT COUNT(*) FROM visitor WHERE Age < 30; 
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC;
 SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4; 
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC;
 SELECT Name, Museum_ID FROM museum ORDER BY Num_of_Staff DESC LIMIT 1; 
 SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < 2009; 
 SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'; 
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > 2010)
 SELECT T1.ID, T1.Name, T1.Age FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID GROUP BY T1.ID, T1.Name, T1.Age HAVING COUNT(*) > 1; 
 SELECT T1.ID, T1.Name, T1.Level_of_membership FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID GROUP BY T1.ID, T1.Name, T1.Level_of_membership ORDER BY SUM(T2.Total_spent) DESC LIMIT 1; 
 SELECT T1.Name, T1.Museum_ID FROM museum AS T1 JOIN visit AS T2 ON T1.Museum_ID = T2.Museum_ID GROUP BY T1.Museum_ID ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Name FROM museum WHERE NOT Museum_ID IN (SELECT Museum_ID FROM visit) 
 SELECT T1.Name, T1.Age FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID GROUP BY T2.visitor_ID ORDER BY SUM(T2.Total_spent) DESC LIMIT 1; 
 SELECT AVG(Total_spent), MAX(Total_spent) FROM visit; 
 SELECT SUM(Total_spent) FROM visit WHERE Level_of_membership = 1; 
 SELECT T1.Name FROM visitor AS T1 INNER JOIN visit AS T2 ON T1.ID = T2.visitor_ID WHERE T2.Museum_ID IN (   SELECT Museum_ID   FROM museum   WHERE Open_Year < 2009 ) AND T2.Museum_ID IN (   SELECT Museum_ID   FROM museum   WHERE Open_Year > 2011 ) 
 SELECT COUNT(*) FROM visitor WHERE NOT ID IN (SELECT visitor_ID FROM visit WHERE Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year > 2010)) 
 SELECT COUNT(*) FROM (   SELECT * FROM museum   WHERE Open_Year > 2013   UNION SELECT * FROM museum   WHERE Open_Year < 2008 ) AS t; 
 SELECT COUNT(*) FROM players; 
 SELECT COUNT(*) FROM players; 
 SELECT COUNT(*) FROM matches; 
 SELECT COUNT(*) FROM matches; 
 SELECT first_name, birth_date FROM players WHERE country_code = 'USA'; 
 SELECT first_name, birth_date FROM players WHERE country_code = 'USA'; 
 SELECT AVG(loser_age), AVG(winner_age) FROM matches; 
 SELECT AVG(loser_age), AVG(winner_age) FROM matches; 
 SELECT AVG(winner_rank) FROM matches; 
 SELECT AVG(winner_rank) FROM matches; 
 SELECT MAX(loser_rank) FROM matches; 
 SELECT MAX(loser_rank) FROM matches; 
 SELECT COUNT(DISTINCT country_code) FROM players; 
 SELECT COUNT(DISTINCT country_code) FROM players; 
 SELECT COUNT(DISTINCT loser_name) FROM matches; 
 SELECT COUNT(DISTINCT loser_name) FROM matches; 
 SELECT t1.tourney_name FROM matches AS t1 JOIN players AS t2 ON t1.loser_id = t2.player_id GROUP BY t1.tourney_name HAVING COUNT(*) > 10; 
 SELECT T1.tournery_name FROM matches AS T1 JOIN rankings AS T2 ON T1.tournery_id = T2.tournery_id GROUP BY T1.tournery_id HAVING COUNT(*) > 10; 
 SELECT T1.winner_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.year = 2013 INTERSECT SELECT T1.winner_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.year = 2016 
 SELECT T1.first_name, T1.last_name FROM players AS T1 INNER JOIN rankings AS T2 ON T1.player_id = T2.player_id WHERE T2.ranking_date = 2013 AND T2.ranking_date = 2016 
 SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016; 
 SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016; 
 SELECT T1.country_code, T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name = "WTA Championships" INTERSECT SELECT T1.country_code, T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.loser_id WHERE T2.tourney_name = "Australian Open" 
 SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name = 'WTA Championships' INTERSECT SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.loser_id WHERE T2.tourney_name = 'Australian Open' 
 SELECT first_name, country_code FROM players ORDER BY birth_date DESC LIMIT 1; 
 SELECT first_name, country_code FROM players ORDER BY birth_date DESC LIMIT 1; 
 SELECT first_name, last_name FROM players ORDER BY birth_date; 
 SELECT first_name, last_name FROM players ORDER BY birth_date; 
 SELECT first_name, last_name FROM players WHERE hand = "L" ORDER BY birth_date; 
 SELECT first_name, last_name FROM players WHERE hand = 'L'; ORDER BY birth_date; 
 SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.winner_name, T1.winner_rank_points FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.winner_name, T2.ranking_points FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id WHERE T1.winner_id = (SELECT T1.winner_id FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id GROUP BY T1.winner_id ORDER BY COUNT(*) DESC LIMIT 1) GROUP BY T2.player_id ORDER BY T2.ranking_points DESC LIMIT 1; 
 SELECT T1.winner_name FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id WHERE T2.tours = 'Australian Open' ORDER BY T2.ranking_points DESC LIMIT 1; 
 SELECT T1.winner_name FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id WHERE T2.tours = 1 ORDER BY T2.ranking_points DESC LIMIT 1; 
 SELECT T1.loser_name, T1.winner_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.loser_id OR T2.winner_id = T1.player_id ORDER BY T2.minutes DESC LIMIT 1; 
 SELECT T1.winner_name, T1.loser_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id OR T2.loser_id = T1.player_id ORDER BY T2.minutes DESC LIMIT 1; 
 SELECT T2.first_name, AVG(T1.ranking) AS average_ranking FROM rankings AS T1 JOIN players AS T2 ON T1.player_id = T2.player_id GROUP BY T2.first_name; 
 SELECT T1.first_name, AVG(T2.ranking) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id; 
 SELECT SUM(ranking_points), first_name FROM rankings GROUP BY player_id; 
 SELECT T1.first_name, SUM(T2.ranking_points) AS total_ranking_points FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id; 
 SELECT country_code, COUNT(*) AS num_players FROM players GROUP BY country_code; 
 SELECT country_code, COUNT(*) AS num_players FROM players GROUP BY country_code; 
 SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50; 
 SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50; 
 SELECT ranking_date, COUNT(ranking_date) AS total_tours FROM rankings GROUP BY ranking_date; 
 SELECT ranking_date, COUNT(ranking_date) AS total_tours FROM rankings GROUP BY ranking_date; 
 SELECT year, COUNT(*) AS matches_count FROM matches GROUP BY year; 
 SELECT year, COUNT(*) AS matches_played FROM matches GROUP BY year; 
 SELECT T1.first_name, T1.last_name, T2.ranking FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id WHERE T2.ranking_points = (SELECT MAX(ranking_points) FROM rankings) ORDER BY T2.ranking_date DESC LIMIT 3; 
 SELECT T1.first_name, T1.last_name, T2.ranking FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id WHERE T2.ranking_points = (SELECT MAX(ranking_points) FROM rankings) ORDER BY T2.ranking_date DESC LIMIT 3; 
 SELECT COUNT(*) FROM (   SELECT player_id   FROM players   WHERE hand = 'L'   INTERSECT   SELECT player_id   FROM players   WHERE hand = 'R' ) AS t1 WHERE t1.player_id IN (   SELECT player_id   FROM matches   WHERE tourney_name = 'WTA Championships' ) 
 SELECT COUNT(*) FROM (   SELECT player_id   FROM matches   WHERE winner_hand = 'L'   AND tourney_name = 'WTA Championships' ) AS t1 JOIN players ON t1.player_id = players.player_id; 
 SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id ORDER BY T2.ranking_points DESC LIMIT 1; 
 SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id WHERE T2.ranking_points = (SELECT MAX(T2.ranking_points) FROM rankings AS T2) 
 SELECT hand, COUNT(*) AS num_players FROM players GROUP BY hand; 
 SELECT hand, COUNT(*) AS num_players FROM players GROUP BY hand; 
 SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'; 
 SELECT name, tonnage FROM ship ORDER BY name DESC; 
 SELECT name, date, result FROM battle; 
 SELECT MAX(killed), MIN(killed) FROM death; 
 SELECT AVG(injured) FROM death; 
 SELECT DISTINCT death.killed, death.injured FROM death INNER JOIN ship ON death.caused_by_ship_id = ship.id WHERE ship.tonnage = 't'; 
 SELECT name, result FROM battle WHERE bulgarian_commander <> 'Boril'; 
 SELECT DISTINCT T1.name, T1.id FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.id WHERE T2.ship_type = 'Brig'; 
 SELECT T1.name, T1.id FROM battle AS T1 JOIN death AS T2 ON T1.id = T2.caused_by_ship_id GROUP BY T1.id HAVING SUM(T2.killed) > 10; 
 SELECT t1.name, t1.id FROM ship AS t1 JOIN death AS t2 ON t1.id = t2.caused_by_ship_id GROUP BY t1.id, t1.name ORDER BY SUM(t2.injured) DESC LIMIT 1; 
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I';
 SELECT COUNT(DISTINCT result) FROM battle; 
 SELECT COUNT(*) FROM battle WHERE NOT id IN (SELECT battle.id FROM battle                   JOIN ship ON battle.id = ship.id                   WHERE ship.tonnage = 225); 
 SELECT T1.name, T1.date FROM battle AS T1 JOIN ship AS T2 ON T1.lost_in_battle = T2.id WHERE T2.name = 'Lettice' INTERSECT SELECT T1.name, T1.date FROM battle AS T1 JOIN ship AS T2 ON T1.lost_in_battle = T2.id WHERE T2.name = 'HMS Atalanta' 
SELECT name, result, bulgarian_commander FROM battle WHERE NOT id IN (SELECT battle_id FROM death WHERE location = 'English Channel');
SELECT note FROM death WHERE note LIKE '%East%'
 SELECT * FROM Addresses; 
 SELECT line_1, line_2 FROM Addresses; 
 SELECT COUNT(*) FROM Courses; 
 SELECT COUNT(*) FROM Courses; 
 SELECT course_description FROM Courses WHERE course_name = 'Math' 
 SELECT course_description FROM Courses WHERE course_name LIKE '%math%' 
 SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'; 
 SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'; 
 SELECT T1.department_name, T1.department_id FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id GROUP BY T1.department_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T2.department_name, T1.department_id FROM Degree_Programs AS T1 JOIN Departments AS T2 ON T1.department_id = T2.department_id GROUP BY T1.department_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT COUNT(DISTINCT department_id) FROM Degree_Programs; 
 SELECT COUNT(DISTINCT department_id) FROM Degree_Programs; 
 SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs; 
 SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs; 
 SELECT COUNT(*) FROM Degree_Programs AS T1 JOIN Courses AS T2 ON T1.department_id = T2.department_id WHERE T1.department_name = 'Engineering'; 
 SELECT COUNT(*) FROM Degree_Programs AS T1 JOIN Departments AS T2 ON T1.department_id = T2.department_id WHERE T2.department_name = 'Engineering'; 
 SELECT section_name, section_description FROM Sections; 
 SELECT section_name, section_description FROM Sections; 
 SELECT T1.course_name, T1.course_id FROM Courses AS T1 JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(*) <= 2; 
 SELECT course_name, course_id FROM Courses WHERE course_id IN (   SELECT course_id   FROM Sections   GROUP BY course_id   HAVING COUNT(*) < 2 ) ORDER BY course_id; 
 SELECT section_name FROM Sections ORDER BY section_name DESC; 
 SELECT section_name FROM Sections ORDER BY section_name DESC; 
 SELECT T1.semester_name, T1.semester_id FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.semester_name, T1.semester_id FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT department_description FROM Departments WHERE department_name LIKE '%the computer%' 
 SELECT department_description FROM Departments WHERE department_name LIKE '%computer%' 
 SELECT T2.first_name, T2.middle_name, T2.last_name, T1.student_id FROM Student_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id WHERE T1.degree_program_id IN (SELECT DISTINCT T3.degree_program_id                               FROM Student_Enrolment AS T3 JOIN Semesters AS T4 ON T3.semester_id = T4.semester_id) AND T1.semester_id = T4.semester_id GROUP BY T1.student_id HAVING COUNT(DISTINCT T3.degree_program_id) = 2; 
 SELECT T2.first_name, T2.middle_name, T2.last_name, T1.student_id FROM Student_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id WHERE T1.degree_program_id IN (SELECT T1.degree_program_id FROM Student_Enrolment AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.student_enrolment_id = T2.student_enrolment_id WHERE T1.semester_id = (SELECT T1.semester_id FROM Student_Enrolment AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.student_enrolment_id = T2.student_enrolment_id WHERE T1.degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.student_enrolment_id = T2.student_enrolment_id WHERE T1.semester_id = (SELECT T1.semester_id FROM Student_Enrolment AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.student_enrolment_id = T2.student_enrolment_id WHERE T1.degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.student_enrolment_id = T2.student_enrolment_id WHERE T1.semester_id = (SELECT T1.semester_id FROM Student_Enrolment AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.student_enrolment_id = T2.student_enrolment_id WHERE T1.degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.student_enrolment_id = T2.student_enrolment_id WHERE T1.semester_id = (SELECT
 SELECT T2.first_name, T2.middle_name, T2.last_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id WHERE T1.degree_summary_name = 'Bachelor'; 
 SELECT T2.first_name, T2.middle_name, T2.last_name FROM Degree_Programs AS T1 JOIN Students AS T2 ON T1.department_id = T2.department_id WHERE T1.degree_summary_name = 'Bachelors' 
 SELECT T1.department_name, T1.degree_summary_name, T1.degree_summary_description, COUNT(*) AS num_students FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.department_name, T1.degree_summary_name, T1.degree_summary_description ORDER BY num_students DESC LIMIT 1; 
 SELECT T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.degree_program_id, T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.degree_program_id, T2.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.student_id, T1.first_name, T1.middle_name, T1.last_name, COUNT(*) AS num_enrollments FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY num_enrollments DESC LIMIT 1; 
 SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id, COUNT(*) AS num_enrollments FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY num_enrollments DESC LIMIT 1; 
 SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment) 
 SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment) 
SELECT DISTINCT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id
 SELECT course_name FROM Courses WHERE course_id IN (SELECT course_id FROM Student_Enrolment_Courses) 
 SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_name ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_name ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT last_name FROM Students WHERE state_province_county = 'North Carolina' EXCEPT SELECT last_name FROM Student_Enrolment
 SELECT last_name FROM Students WHERE state_province_county = 'North Carolina' AND NOT student_id IN (SELECT student_id FROM Student_Enrolment) 
 SELECT T2.transcript_date, T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(*) >= 2; 
 SELECT T1.transcript_date, T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(*) >= 2; 
 SELECT cell_mobile_number FROM Students WHERE first_name = "Timmothy" AND last_name = "Ward"; 
 SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'; 
 SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered LIMIT 1; 
 SELECT first_name, last_name, middle_name FROM Students ORDER BY date_first_registered LIMIT 1; 
 SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered LIMIT 1; 
 SELECT first_name, last_name, middle_name FROM Students ORDER BY date_first_registered ASC LIMIT 1; 
 SELECT first_name FROM Students WHERE permanent_address_id <> current_address_id; 
 SELECT first_name FROM Students WHERE permanent_address_id <> current_address_id; 
 SELECT T1.address_id, T1.line_1, T1.line_2, T1.line_3, T1.city, T1.zip_postcode, T1.state_province_county, T1.country FROM Addresses AS T1 JOIN Student_Enrolment AS T2 ON T1.address_id = T2.current_address_id GROUP BY T1.address_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.address_id, T1.line_1, T1.line_2 FROM Addresses AS T1 JOIN Student_Enrolment AS T2 ON T1.address_id = T2.current_address_id GROUP BY T1.address_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT AVG(transcript_date) FROM Transcripts; 
 SELECT AVG(transcript_date) FROM Transcripts; 
 SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1; 
 SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1; 
 SELECT COUNT(*) FROM Transcripts; 
 SELECT COUNT(*) FROM Transcripts; 
SELECT MAX(transcript_date) FROM Transcripts;
 SELECT transcript_date FROM Transcripts ORDER BY transcript_date DESC LIMIT 1; 
 SELECT course_enrolment_id, COUNT(*) AS count FROM Transcripts GROUP BY course_enrolment_id HAVING COUNT(*) <= 10; 
 SELECT course_id, COUNT(*) AS count, student_enrolment_id FROM Transcripts GROUP BY course_id, student_enrolment_id ORDER BY count DESC LIMIT 1; 
 SELECT transcript_date, transcript_id FROM Transcripts ORDER BY transcript_date LIMIT 1; 
 SELECT transcript_date, transcript_id FROM Transcripts ORDER BY transcript_date LIMIT 1; 
 SELECT T1.semester_name FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Master' INTERSECT SELECT T1.semester_name FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Bachelor' 
 SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (   SELECT degree_program_id   FROM Student_Enrolment   WHERE degree_program_id IN (     SELECT degree_program_id     FROM Student_Enrolment     WHERE degree_program_id IN (       SELECT degree_program_id       FROM Student_Enrolment       WHERE degree_program_id IN (         SELECT degree_program_id         FROM Student_Enrolment         WHERE degree_program_id IN (           SELECT degree_program_id           FROM Student_Enrolment           WHERE degree_program_id IN (             SELECT degree_program_id             FROM Student_Enrolment             WHERE degree_program_id IN (               SELECT degree_program_id               FROM Student_Enrolment               WHERE degree_program_id IN (                 SELECT degree_program_id                 FROM Student_Enrolment                 WHERE degree_program_id IN (                   SELECT degree_program_id                   FROM Student_Enrolment                   WHERE degree_program_id IN (                     SELECT degree_program_id                     FROM Student_Enrolment                     WHERE degree_program_id IN (                       SELECT degree_program_id                       FROM Student_Enrolment                       WHERE degree_program_id IN (                         SELECT degree_program_id                         FROM Student_Enrolment                         WHERE degree_program_id IN (                           SELECT degree_program_id                           FROM Student_Enrolment                           WHERE degree_program_id IN (                             SELECT degree_program_id                             FROM Student_Enrolment                             WHERE degree_program_id IN (                               SELECT degree_program_id                               FROM Student_Enrolment                               WHERE degree_program_id IN (                                 SELECT degree_program_id                                 FROM Student_Enrolment                                 WHERE degree_program_id IN (                                   SELECT degree_program_id                                   FROM Student_Enrolment                                   WHERE degree_program_id IN (                                     SELECT degree_program_id                                     FROM Student_
 SELECT COUNT(DISTINCT current_address_id) FROM Students; 
 SELECT DISTINCT T1.address_id FROM Addresses AS T1 JOIN Student_Enrolment AS T2 ON T1.address_id = T2.permanent_address_id 
 SELECT * FROM Students ORDER BY other_student_details DESC; 
 SELECT other_student_details FROM Students ORDER BY last_name DESC; 
SELECT * FROM Sections WHERE section_name = 'h'
 SELECT section_description FROM Sections WHERE section_name = 'h'; 
 SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT Addresses.address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582' 
 SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT Addresses.address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582' 
 SELECT Title FROM Cartoon ORDER BY Title 
SELECT Title FROM Cartoon ORDER BY Title;
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones';
 SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' 
 SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'; 
 SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'; 
 SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date; 
 SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date; 
 SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'; 
 SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'; 
 SELECT Country, COUNT(*) AS num_channels FROM TV_Channel GROUP BY Country ORDER BY num_channels DESC LIMIT 1; 
 SELECT Country, COUNT(*) AS num_channels FROM TV_Channel GROUP BY Country ORDER BY num_channels DESC LIMIT 1; 
 SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel; 
 SELECT COUNT(DISTINCT series_name) FROM TV_Channel; 
 SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'; 
 SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'; 
 SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'; 
 SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'; 
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English';
 SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'; 
 SELECT Language, COUNT(*) AS num_channels FROM TV_Channel GROUP BY Language ORDER BY num_channels ASC LIMIT 1; 
 SELECT Language, COUNT(*) AS num_channels FROM TV_Channel GROUP BY Language ORDER BY num_channels ASC LIMIT 1; 
 SELECT Language, COUNT(*) AS num_channels FROM TV_Channel GROUP BY Language; 
 SELECT Language, COUNT(*) AS num_channels FROM TV_Channel GROUP BY Language; 
 SELECT T1.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!' 
 SELECT t1.series_name FROM TV_Channel AS t1 JOIN TV_series AS t2 ON t1.id = t2.Channel WHERE t2.Title = 'The Rise of the Blue Beetle'; 
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio';
 SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'; 
SELECT Episode FROM TV_series ORDER BY Rating;
SELECT Episode FROM TV_series ORDER BY Rating;
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3;
 SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3; 
 SELECT MIN(Share), MAX(Share) FROM TV_series; 
 SELECT MAX(Share), MIN(Share) FROM TV_series; 
 SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
 SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
 SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
 SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
 SELECT T1.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = 'A Love of a Lifetime'; 
 SELECT T1.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = 'A Love of a Lifetime'; 
SELECT T1.Episode FROM TV_series AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio';
 SELECT Episode FROM TV_series WHERE Channel = 'Sky Radio'; 
 SELECT Directed_by, COUNT(*) AS num_cartoons FROM Cartoon GROUP BY Directed_by; 
 SELECT Directed_by, COUNT(*) AS num_cartoons FROM Cartoon GROUP BY Directed_by; 
 SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1; 
 SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1; 
 SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'yes'; 
 SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'yes'; 
 SELECT Country FROM TV_Channel INNER JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Written_by = 'Todd Casey' 
 SELECT Country FROM Cartoon WHERE Written_by = 'Todd Casey' 
 SELECT Country FROM TV_Channel WHERE NOT id IN (   SELECT Channel   FROM Cartoon   WHERE Written_by = 'Todd Casey' ) 
 SELECT Country FROM TV_Channel WHERE NOT id IN (   SELECT Channel   FROM Cartoon   WHERE Written_by = 'Todd Casey' ) 
 SELECT t1.series_name, t1.Country FROM TV_Channel AS t1 JOIN Cartoon AS t2 ON t1.id = t2.Channel WHERE t2.Directed_by = 'Ben Jones' AND t2.Written_by = 'Michael Chang'; 
 SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones' INNER JOIN Cartoon AS T3 ON T1.id = T3.Channel WHERE T3.Directed_by = 'Michael Chang' 
 SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language <> 'English'; 
 SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language <> 'English'; 
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(*) > 2)
 SELECT id FROM (   SELECT id   FROM TV_Channel   GROUP BY id   HAVING COUNT(*) > 2 ) AS t 
SELECT id FROM TV_Channel EXCEPT SELECT T1.id FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones'
 SELECT id FROM TV_Channel EXCEPT SELECT T1.id FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones' 
 SELECT Package_Option FROM TV_Channel WHERE NOT id IN (   SELECT Channel   FROM Cartoon   WHERE Directed_by = 'Ben Jones' ) 
 SELECT DISTINCT Package_Option FROM TV_Channel WHERE NOT id IN (   SELECT Channel   FROM Cartoon   WHERE Directed_by = 'Ben Jones' ); 
 SELECT COUNT(*) FROM poker_player; 
 SELECT COUNT(*) FROM poker_player; 
 SELECT Earnings, COUNT(*) AS Number_of_Players FROM poker_player GROUP BY Earnings ORDER BY Earnings DESC; 
 SELECT Earnings FROM poker_player ORDER BY Earnings DESC; 
SELECT Final_Table_Made, Best_Finish FROM poker_player;
 SELECT Final_Table_Made, Best_Finish FROM poker_player; 
 SELECT AVG(Earnings) FROM poker_player; 
 SELECT AVG(Earnings) FROM poker_player; 
 SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1; 
 SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1; 
 SELECT MAX(Final_Table_Made) FROM poker_player WHERE Money_Rank < 200000; 
 SELECT MAX(Final_Table_Made) FROM poker_player WHERE Money_Rank < 200000; 
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID;
 SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings > 300000; 
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings > 300000;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC;
 SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made 
 SELECT T1.Birth_Date FROM people AS T1 INNER JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Earnings LIMIT 1; 
SELECT T1.Birth_Date FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Earnings LIMIT 1;
 SELECT Money_Rank FROM poker_player ORDER BY Height DESC LIMIT 1; 
 SELECT Money_Rank FROM poker_player ORDER BY Height DESC LIMIT 1; 
 SELECT AVG(Earnings) FROM poker_player WHERE Height > 200; 
SELECT AVG(Earnings) FROM poker_player WHERE Height > 200;
 SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC; 
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC;
 SELECT Nationality, COUNT(*) AS Number_of_People FROM people GROUP BY Nationality; 
 SELECT Nationality, COUNT(*) AS Number_of_People FROM people GROUP BY Nationality; 
 SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2; 
 SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2; 
 SELECT Name, Birth_Date FROM people ORDER BY Name 
 SELECT Name, Birth_Date FROM people ORDER BY Name 
SELECT Name FROM people WHERE Nationality <> 'Russia';
SELECT Name FROM people WHERE Nationality <> 'Russia';
SELECT Name FROM people WHERE NOT People_ID IN (SELECT People_ID FROM poker_player);
SELECT Name FROM people WHERE NOT People_ID IN (SELECT People_ID FROM poker_player);
 SELECT COUNT(DISTINCT Nationality) FROM people; 
 SELECT COUNT(DISTINCT Nationality) FROM people; 
 SELECT COUNT(*) FROM AREA_CODE_STATE; 
 SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC; 
 SELECT vote_id, phone_number, state FROM VOTES; 
 SELECT MAX(area_code), MIN(area_code) FROM AREA_CODE_STATE; 
 SELECT MAX(created) FROM VOTES WHERE state = 'CA'; 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name <> 'Jessie Alloway';
 SELECT DISTINCT state, created FROM VOTES; 
 SELECT T1.contestant_number, T1.contestant_name FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T1.contestant_number HAVING COUNT(*) >= 2; 
 SELECT T1.contestant_number, T1.contestant_name FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T1.contestant_number ORDER BY COUNT(*) ASC LIMIT 1; 
 SELECT COUNT(*) FROM VOTES WHERE state = 'NY' OR state = 'CA'; 
 SELECT COUNT(*) FROM CONTESTANTS WHERE NOT `contestant_number` IN (SELECT `contestant_number` FROM VOTES); 
 SELECT T1.area_code FROM AREA_CODE_STATE AS T1 JOIN VOTES AS T2 ON T1.area_code = T2.state GROUP BY T1.area_code ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.created, T2.state, T1.phone_number FROM VOTES AS T1 JOIN CONTESTANTS AS T2 ON T1.contestant_number = T2.contestant_number WHERE T2.contestant_name = 'Tabatha Gehling'; 
 SELECT T1.area_code FROM AREA_CODE_STATE AS T1 JOIN VOTES AS T2 ON T1.area_code = T2.state WHERE T2.contestant_number = 101 INTERSECT SELECT T1.area_code FROM AREA_CODE_STATE AS T1 JOIN VOTES AS T2 ON T1.area_code = T2.state WHERE T2.contestant_number = 102 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
 SELECT Name FROM country WHERE IndependenceYear > 1950; 
 SELECT Name FROM country WHERE IndependenceYear > 1950; 
 SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'; 
 SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'; 
 SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'; 
 SELECT SUM(SurfaceArea) FROM country WHERE Continent = 'Carribean'; 
 SELECT Continent FROM country WHERE Name = 'Anguilla'; 
 SELECT Continent FROM country WHERE Name = 'Anguilla'; 
 SELECT Region FROM city WHERE Name = 'Kabul'; 
 SELECT Region FROM country WHERE Name = 'Afghanistan' 
 SELECT Language FROM countrylanguage WHERE CountryCode = 'ARU' GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Language FROM countrylanguage WHERE CountryCode = 'ARU' 
 SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'; 
 SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'; 
 SELECT Region, Population FROM country WHERE Name = 'Angola'; 
 SELECT Region, Population FROM country WHERE Name = 'Angola'; 
 SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'; 
 SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Central Africa'; 
 SELECT Name FROM country ORDER BY LifeExpectancy LIMIT 1; 
 SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy LIMIT 1; 
 SELECT SUM(Population), MAX(GNP) FROM country WHERE Continent = 'Asia'; 
 SELECT MAX(GNP), COUNT(*) FROM country WHERE Continent = 'Asia'; 
 SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'; 
 SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'; 
 SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe'); 
 SELECT SUM(SurfaceArea) FROM country WHERE Continent = 'Asia' OR Continent = 'Europe'; 
 SELECT Population FROM city WHERE District = 'Gelderland'; 
 SELECT SUM(Population) FROM city WHERE District = 'Gelderland'; 
 SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm = 'US territory'; 
 SELECT AVG(GNP), SUM(Population) FROM country WHERE Continent = 'North America' AND NOT IndependenceYear IS NULL; 
 SELECT COUNT(DISTINCT Language) FROM countrylanguage; 
 SELECT COUNT(DISTINCT Language) FROM countrylanguage; 
 SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'; 
 SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'; 
 SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'ARU'; 
 SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'ARU'; 
 SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'F'; 
 SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'F'; 
 SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT t1.Name FROM country AS t1 JOIN countrylanguage AS t2 ON t1.Code = t2.CountryCode GROUP BY t1.Name ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Continent FROM country GROUP BY Continent ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Continent FROM country GROUP BY Continent ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT COUNT(*) FROM (   SELECT c.Name, c.Code   FROM country c   JOIN countrylanguage cl ON c.Code = cl.CountryCode   WHERE cl.Language = 'English'   INTERSECT   SELECT c.Name, c.Code   FROM country c   JOIN countrylanguage cl ON c.Code = cl.CountryCode   WHERE cl.Language = 'Dutch' ) AS t WHERE t.Name = 'English' AND t.Name = 'Dutch'; 
 SELECT COUNT(*) FROM country WHERE Language IN ('English', 'Dutch') 
 SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.Language = 'French' 
 SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.Language = 'French' 
 SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'F' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French' AND T2.IsOfficial = 'F' 
 SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' OR T2.Language = 'French' ORDER BY T1.Code; 
 SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'; 
 SELECT COUNT(DISTINCT Continent) FROM country WHERE Language = 'Chinese' 
 SELECT Region FROM country WHERE Language IN ('English', 'Dutch'); 
 SELECT Region FROM country WHERE Language IN ('Dutch', 'English'); 
 SELECT CountryCode FROM country WHERE (IsOfficial = 'English' OR IsOfficial = 'Dutch') 
 SELECT CountryCode FROM country WHERE (IsOfficial = 'English' OR IsOfficial = 'Dutch') 
 SELECT t1.Language FROM countrylanguage AS t1 JOIN country AS t2 ON t1.CountryCode = t2.Code WHERE t2.Continent = 'Asia' GROUP BY t1.Language ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT t1.Language FROM countrylanguage AS t1 JOIN country AS t2 ON t1.CountryCode = t2.Code WHERE t2.Continent = 'Asia' GROUP BY t1.Language ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Language FROM countrylanguage WHERE IsOfficial = 'F' AND NOT CountryCode IN (   SELECT CountryCode   FROM country   WHERE GovernmentForm = 'Monarchy' ) GROUP BY Language HAVING COUNT(*) = 1; 
 SELECT Language FROM countrylanguage WHERE CountryCode IN (   SELECT CountryCode   FROM country   WHERE GovernmentForm = 'Republic' ) GROUP BY Language HAVING COUNT(*) = 1; 
 SELECT city.Name FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' ORDER BY city.Population DESC LIMIT 1; 
 SELECT city.Name, city.Population FROM city WHERE city.Name IN (   SELECT T1.Name   FROM city   JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode   JOIN country ON country.Code = countrylanguage.CountryCode   WHERE country.Name = 'United States' ) ORDER BY city.Population DESC LIMIT 1; 
 SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1; 
 SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1; 
 SELECT AVG(LifeExpectancy) FROM country WHERE NOT IsOfficial = 'English'; 
 SELECT AVG(LifeExpectancy) FROM country WHERE NOT IsOfficial = 'English'; 
 SELECT SUM(Population) FROM city WHERE NOT CountryCode IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English'); 
 SELECT COUNT(*) FROM city WHERE NOT CountryCode IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English'); 
 SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'F'; 
 SELECT t2.Language FROM country AS t1 JOIN countrylanguage AS t2 ON t1.Code = t2.CountryCode WHERE t1.HeadOfState = 'Beatrix' AND t2.IsOfficial = 'F'; 
 SELECT COUNT(DISTINCT T2.Language) FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T1.IndepYear < 1930; 
 SELECT COUNT(DISTINCT T2.Language) FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.IndepYear < 1930; 
 SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe'); 
 SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe'); 
 SELECT CountryCode FROM country WHERE Population < (SELECT MAX(Population) FROM country WHERE Continent = 'Asia'); 
 SELECT CountryCode FROM country WHERE Population < (SELECT MAX(Population) FROM country WHERE Continent = 'Asia') AND Continent = 'Africa'; 
 SELECT CountryCode FROM country WHERE Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa') AND Continent = 'Asia'; 
 SELECT CountryCode FROM country WHERE Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa') AND Continent = 'Asia'; 
 SELECT CountryCode FROM country WHERE NOT Name LIKE '%English%' 
 SELECT CountryCode FROM country WHERE NOT Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English'); 
 SELECT CountryCode FROM country WHERE NOT Name LIKE '%English%' 
 SELECT CountryCode FROM country WHERE NOT CountryCode IN (   SELECT CountryCode   FROM country   WHERE Language = 'English' ); 
 SELECT CountryCode FROM country WHERE GovernmentForm <> 'Republic' AND NOT Language IN ('English'); 
 SELECT CountryCode FROM country WHERE NOT Language LIKE '%English%' AND GovernmentForm <> 'Republic'; 
 SELECT c.Name, c.CountryCode, c.Population FROM city c INNER JOIN country c2 ON c.CountryCode = c2.Code WHERE c2.Language <> 'English' AND c2.Continent = 'Europe'; 
 SELECT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Name = 'Europe' AND T2.Language != 'English' AND T1.Name != 'Amsterdam'; 
 SELECT DISTINCT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Continent = 'Asia' AND T2.OfficialLanguage = 'Chinese' 
 SELECT DISTINCT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Continent = 'Asia' AND T2.OfficialLanguage = 'Chinese' 
 SELECT Name, IndependenceYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1; 
 SELECT Name, IndependenceYear, SurfaceArea FROM country ORDER BY Population LIMIT 1; 
 SELECT Population, Name, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1; 
 SELECT Name, Population, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1; 
 SELECT T1.Name, COUNT(*) AS num_languages FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name HAVING COUNT(*) >= 3; 
 SELECT T1.Name, COUNT(T2.Language) AS num_languages FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name HAVING COUNT(T2.Language) > 2; 
 SELECT District, COUNT(*) AS num_cities FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District; 
 SELECT District, COUNT(*) AS num_cities FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District; 
 SELECT GovernmentForm, SUM(Population) AS TotalPopulation FROM country WHERE LifeExpectancy > 72 GROUP BY GovernmentForm; 
 SELECT GovernmentForm, SUM(Population) AS TotalPopulation FROM country WHERE LifeExpectancy > 72 GROUP BY GovernmentForm; 
 SELECT AVG(LifeExpectancy), SUM(Population), Continent FROM country WHERE AVG(LifeExpectancy) < 72 GROUP BY Continent; 
 SELECT Continent, SUM(Population), AVG(LifeExpectancy) FROM country WHERE LifeExpectancy < 72 GROUP BY Continent; 
 SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5; 
 SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5; 
 SELECT Name FROM country ORDER BY Population DESC LIMIT 3; 
 SELECT Name FROM country ORDER BY Population DESC LIMIT 3; 
 SELECT Name FROM country ORDER BY Population LIMIT 3; 
 SELECT Name FROM country ORDER BY Population LIMIT 3; 
 SELECT COUNT(*) FROM country WHERE Continent = 'Asia'; 
 SELECT COUNT(*) FROM country WHERE Continent = 'Asia'; 
 SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000; 
 SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000; 
 SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000; 
 SELECT AVG(SurfaceArea), SUM(Population) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000; 
 SELECT * FROM city WHERE Population BETWEEN 160000 AND 900000; 
 SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000; 
 SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.Name, T2.Language, MAX(T2.Percentage) AS MaxPercentage FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name, T1.Code; 
 SELECT CountryCode, MAX(Percentage) AS MaxPercentage FROM countrylanguage GROUP BY CountryCode; 
 SELECT COUNT(*) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Spanish' AND T2.Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish') 
 SELECT COUNT(*) FROM country WHERE Language = 'Spanish' AND NOT Official = 'English' AND NOT Official = 'French' AND NOT Official = 'Russian' AND NOT Official = 'Chinese' AND NOT Official = 'Arabic' AND NOT Official = 'Hindi' AND NOT Official = 'Brazilian' AND NOT Official = 'Portuguese' AND NOT Official = 'Italian' AND NOT Official = 'German' AND NOT Official = 'Japanese' AND NOT Official = 'Korean' AND NOT Official = 'Turkish' AND NOT Official = 'Polish' AND NOT Official = 'Romanian' AND NOT Official = 'Bulgarian' AND NOT Official = 'Croatian' AND NOT Official = 'Slovene' AND NOT Official = 'Serbian' AND NOT Official = 'Czech' AND NOT Official = 'Slovak' AND NOT Official = 'Hungarian' AND NOT Official = 'Finnish' AND NOT Official = 'Swedish' AND NOT Official = 'Norwegian' AND NOT Official = 'Danish' AND NOT Official = 'Irish' AND NOT Official = 'Greek' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = 'Turkish' AND NOT Official = '
 SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC LIMIT 1; 
 SELECT CountryCode FROM country WHERE Language = 'Spanish' 
 SELECT COUNT(*) FROM conductor; 
 SELECT COUNT(*) FROM conductor; 
 SELECT Name FROM conductor ORDER BY Age ASC; 
 SELECT Name FROM conductor ORDER BY Age; 
 SELECT Name FROM conductor WHERE Nationality <> 'USA'; 
 SELECT Name FROM conductor WHERE Nationality <> 'USA'; 
 SELECT Record_Company, COUNT(Record_Company) FROM orchestra GROUP BY Record_Company ORDER BY Year_of_Founded DESC; 
 SELECT Record_Company, COUNT(Record_Company) FROM orchestra GROUP BY Record_Company ORDER BY Year_of_Founded DESC; 
 SELECT AVG(Attendance) FROM show; 
 SELECT AVG(Attendance) FROM show; 
 SELECT MAX(Share), MIN(Share) FROM performance WHERE Type <> 'Live final'; 
 SELECT MAX(Share), MIN(Share) FROM performance WHERE Type <> 'Live final'; 
 SELECT COUNT(DISTINCT Nationality) FROM conductor; 
 SELECT COUNT(DISTINCT Nationality) FROM conductor; 
 SELECT Name FROM conductor ORDER BY Year_of_Work DESC; 
 SELECT Name FROM conductor ORDER BY Year_of_Work DESC; 
 SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1; 
 SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1; 
 SELECT T1.Name, T2.Orchestra FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID; 
 SELECT T1.Name, T2.Orchestra FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID; 
 SELECT T2.Name FROM orchestra AS T1 JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T2.Name HAVING COUNT(*) > 1; 
 SELECT t1.Name FROM conductor AS t1 INNER JOIN orchestra AS t2 ON t1.Conductor_ID = t2.Conductor_ID GROUP BY t1.Name HAVING COUNT(*) > 1; 
 SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T2.Name FROM orchestra AS T1 JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T1.Year_of_Founded > 2008;
SELECT T2.Name FROM orchestra AS T1 JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T1.Year_of_Founded > 2008;
 SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company; 
 SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company; 
 SELECT Major_Record_Format, COUNT(*) FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) ASC; 
 SELECT Major_Record_Format, COUNT(*) AS Frequency FROM orchestra GROUP BY Major_Record_Format ORDER BY Frequency DESC; 
 SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Orchestra FROM orchestra WHERE NOT Orchestra_ID IN (SELECT Orchestra_ID FROM performance) 
 SELECT * FROM orchestra WHERE NOT "Orchestra_ID" IN (SELECT "Orchestra_ID" FROM performance); 
 SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003 
 SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003 
 SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format = 'CD' OR Major_Record_Format = 'DVD'; 
 SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format = 'CD' OR Major_Record_Format = 'DVD'; 
 SELECT Year_of_Founded FROM orchestra WHERE Year_of_Founded > 1 
 SELECT T1.Year_of_Founded FROM orchestra AS T1 JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T2.Orchestra_ID HAVING COUNT(*) > 1; 
 SELECT COUNT(*) FROM Highschooler; 
 SELECT COUNT(*) FROM Highschooler; 
 SELECT name, grade FROM Highschooler; 
 SELECT name, grade FROM Highschooler; 
SELECT grade FROM Highschooler;
 SELECT grade FROM Highschooler; 
 SELECT grade FROM Highschooler WHERE name = 'Kyle'; 
SELECT grade FROM Highschooler WHERE name = 'Kyle';
SELECT name FROM Highschooler WHERE grade = 10;
 SELECT name FROM Highschooler WHERE grade = 10; 
 SELECT ID FROM Highschooler WHERE name = 'Kyle'; 
 SELECT ID FROM Highschooler WHERE name = 'Kyle' 
 SELECT COUNT(*) FROM Highschooler WHERE grade = 9 OR grade = 10; 
 SELECT COUNT(*) FROM Highschooler WHERE grade = 9 OR grade = 10; 
 SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade; 
 SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade; 
 SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4;
 SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4; 
 SELECT student_id, COUNT(*) FROM Friend GROUP BY student_id; 
 SELECT student_id, COUNT(*) AS num_friends FROM Friend GROUP BY student_id; 
 SELECT T2.name, COUNT(*) FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id; 
 SELECT T1.name, COUNT(*) AS num_friends FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID; 
 SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id HAVING COUNT(*) >= 3;
 SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id HAVING COUNT(*) >= 3; 
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID WHERE T1.friend_id = 1510;
 SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID WHERE T1.friend_id = 1510; 
 SELECT COUNT(*) FROM Friend WHERE student_id = 1510; 
 SELECT COUNT(*) FROM Friend WHERE student_id = 1510; 
SELECT ID FROM Highschooler WHERE NOT ID IN (SELECT student_id FROM Friend)
SELECT ID FROM Highschooler WHERE NOT ID IN (SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE NOT ID IN (SELECT student_id FROM Friend)
 SELECT name FROM Highschooler WHERE NOT ID IN (SELECT student_id FROM Friend) 
SELECT DISTINCT T1.ID FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id JOIN Likes AS T3 ON T2.student_id = T3.student_id
 SELECT student_id FROM Friend INTERSECT SELECT student_id FROM Likes 
SELECT name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id JOIN Likes AS T3 ON T2.student_id = T3.student_id
 SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id JOIN Likes AS T3 ON T2.student_id = T3.student_id WHERE T2.student_id IN (SELECT T2.student_id FROM Friend AS T2 JOIN Likes AS T3 ON T2.student_id = T3.student_id) AND T3.student_id IN (SELECT T3.student_id FROM Friend AS T2 JOIN Likes AS T3 ON T2.student_id = T3.student_id) 
 SELECT student_id, COUNT(*) AS likes FROM Likes GROUP BY student_id; 
 SELECT student_id, COUNT(*) AS likes FROM Likes GROUP BY student_id; 
 SELECT T1.name, COUNT(*) AS likes FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T1.ID; 
 SELECT T1.name, COUNT(*) AS likes FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T1.ID; 
 SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T2.liked_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T2.liked_id ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T2.liked_id HAVING COUNT(*) >= 2;
 SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T2.liked_id HAVING COUNT(*) >= 2; 
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID WHERE T2.grade > 5 GROUP BY T1.student_id HAVING COUNT(*) >= 2;
 SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.grade > 5 GROUP BY T1.ID HAVING COUNT(*) >= 2; 
 SELECT COUNT(*) FROM Likes WHERE liked_id = 1510; 
 SELECT COUNT(*) FROM Likes WHERE liked_id IN (     SELECT ID FROM Highschooler     WHERE name = 'Kyle' ); 
 SELECT AVG(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend); 
 SELECT AVG(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend); 
 SELECT MIN(grade) FROM Highschooler WHERE NOT ID IN (SELECT student_id FROM Friend); 
 SELECT MIN(grade) FROM Highschooler WHERE NOT ID IN (SELECT student_id FROM Friend) 
 SELECT state FROM Owners INTERSECT SELECT state FROM Professionals 
 SELECT state FROM Owners INTERSECT SELECT state FROM Professionals 
 SELECT AVG(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments); 
 SELECT AVG(T1.age) FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id; 
 SELECT T2.professional_id, T2.last_name, T2.cell_number FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id WHERE T2.state = 'Indiana' GROUP BY T2.professional_id HAVING COUNT(*) > 2; 
 SELECT T2.professional_id, T2.last_name, T2.cell_number FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id WHERE T2.state = 'Indiana' OR T1.treatment_id > 2; 
 SELECT t1.name FROM Dogs AS t1 JOIN Treatments AS t2 ON t1.dog_id = t2.dog_id WHERE t2.cost_of_treatment <= 1000 
 SELECT T1.name FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id JOIN Owners AS T3 ON T1.owner_id = T3.owner_id WHERE T2.cost_of_treatment <= 1000 AND T3.first_name = 'John' AND T3.last_name = 'Doe'; 
 SELECT first_name FROM Professionals EXCEPT SELECT first_name FROM Dogs 
 SELECT first_name FROM Professionals EXCEPT SELECT first_name FROM Owners EXCEPT SELECT first_name FROM Dogs 
 SELECT `professional_id`, `role_code`, `email_address` FROM `Professionals` WHERE NOT `professional_id` IN (   SELECT `professional_id` FROM `Treatments` ) ORDER BY `professional_id` 
 SELECT professional_id, role_code, email_address FROM Professionals WHERE NOT professional_id IN (   SELECT professional_id FROM Treatments ); 
 SELECT owner_id, first_name, last_name FROM Owners GROUP BY owner_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.owner_id, T1.first_name, T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id GROUP BY T1.owner_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T2.professional_id, T2.role_code, T2.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id GROUP BY T2.professional_id HAVING COUNT(*) >= 2; 
 SELECT T1.professional_id, T1.role_code, T2.first_name FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING COUNT(*) >= 2; 
 SELECT T1.breed_name FROM Breeds AS T1 JOIN Dogs AS T2 ON T1.breed_code = T2.breed_code GROUP BY T1.breed_name ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT breed_name FROM Breeds GROUP BY breed_name ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.owner_id, T1.last_name FROM Owners AS T1 JOIN Treatments AS T2 ON T1.owner_id = T2.professional_id GROUP BY T1.owner_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.owner_id, T1.last_name FROM Owners AS T1 JOIN Treatments AS T2 ON T1.owner_id = T2.professional_id GROUP BY T1.owner_id ORDER BY SUM(T2.cost_of_treatment) DESC LIMIT 1; 
 SELECT T1.treatment_type_description FROM Treatment_Types AS T1 JOIN Treatments AS T2 ON T1.treatment_type_code = T2.treatment_type_code GROUP BY T1.treatment_type_code ORDER BY SUM(T2.cost_of_treatment) ASC LIMIT 1; 
 SELECT t1.treatment_type_description FROM Treatment_Types AS t1 JOIN Treatments AS t2 ON t1.treatment_type_code = t2.treatment_type_code GROUP BY t1.treatment_type_code ORDER BY SUM(t2.cost_of_treatment) ASC LIMIT 1; 
 SELECT OwnerID, ZipCode FROM Charges GROUP BY OwnerID ORDER BY SUM(ChargeAmount) DESC LIMIT 1; 
 SELECT OwnerID, ZipCode FROM Treatments GROUP BY OwnerID, ZipCode ORDER BY SUM(CostOfTreatment) DESC LIMIT 1; 
 SELECT T2.professional_id, T2.cell_number FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id GROUP BY T2.professional_id HAVING COUNT(*) >= 2; 
 SELECT T2.professional_id, T2.cell_number FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id GROUP BY T2.professional_id HAVING COUNT(*) >= 2; 
 SELECT t2.first_name, t2.last_name FROM Treatments AS t1 JOIN Professionals AS t2 ON t1.professional_id = t2.professional_id WHERE t1.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments) 
 SELECT T2.first_name, T2.last_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id WHERE T1.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments) 
 SELECT T1.date_of_treatment, T2.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id; 
 SELECT T1.date_of_treatment, T2.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id; 
 SELECT T1.treatment_type_description, T2.cost_of_treatment FROM Treatment_Types AS T1 JOIN Treatments AS T2 ON T1.treatment_type_code = T2.treatment_type_code; 
 SELECT treatment_type_description, cost_of_treatment FROM Treatments ORDER BY treatment_type_description; 
 SELECT T1.first_name, T1.last_name, T2.size_description FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id 
 SELECT T1.first_name, T1.last_name, T2.size_description FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id 
 SELECT T1.first_name, T1.last_name, T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id; 
 SELECT T1.first_name, T1.last_name, T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id; 
 SELECT T1.name, T2.date_of_treatment FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id WHERE T1.breed_code = (SELECT breed_code FROM Breeds ORDER BY breed_code LIMIT 1) ORDER BY T2.date_of_treatment; 
 SELECT t1.name, t2.date_of_treatment FROM Dogs AS t1 JOIN Treatments AS t2 ON t1.dog_id = t2.dog_id WHERE t1.breed_code = (   SELECT breed_code   FROM Breeds   GROUP BY breed_code   ORDER BY COUNT(*) LIMIT 1 ) 
 SELECT T1.first_name, T1.last_name, T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id WHERE T1.state = 'Virginia'; 
 SELECT T1.first_name, T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id WHERE T1.state = 'Virginia'; 
 SELECT date_arrived, date_departed FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments) 
 SELECT T1.date_arrived, T1.date_departed FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id; 
 SELECT T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id ORDER BY T2.date_of_birth DESC LIMIT 1; 
 SELECT last_name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id ORDER BY Dogs.date_of_birth DESC LIMIT 1; 
 SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'; 
 SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'; 
 SELECT date_arrived, date_departed FROM Dogs; 
 SELECT date_arrived, date_departed FROM Dogs; 
 SELECT COUNT(DISTINCT dog_id) FROM Treatments; 
 SELECT COUNT(DISTINCT dog_id) FROM Treatments; 
 SELECT COUNT(*) FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments) 
 SELECT COUNT(*) FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments) 
 SELECT T1.first_name, T1.last_name, T1.street, T1.city, T1.state FROM Professionals AS T1 WHERE T1.city LIKE '%West%' 
 SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%' 
 SELECT T1.first_name, T1.last_name, T1.email_address FROM Owners AS T1 WHERE T1.state LIKE '%North%' 
 SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%' 
 SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs); 
 SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs); 
 SELECT MAX(cost_of_treatment) FROM Treatments; 
 SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1; 
 SELECT COUNT(*) FROM Dogs WHERE NOT dog_id IN (SELECT dog_id FROM Treatments); 
 SELECT COUNT(*) FROM Dogs WHERE NOT dog_id IN (SELECT dog_id FROM Treatments); 
 SELECT COUNT(*) FROM Owners WHERE NOT EXISTS(SELECT * FROM Dogs); 
 SELECT COUNT(*) FROM Owners WHERE NOT EXISTS(SELECT * FROM Dogs WHERE Owners.owner_id = Dogs.owner_id); 
 SELECT COUNT(*) FROM Professionals WHERE NOT professional_id IN (SELECT professional_id FROM Treatments AS T1 JOIN Dogs AS T2 ON T1.dog_id = T2.dog_id) 
 SELECT COUNT(*) FROM Professionals WHERE NOT professional_id IN (SELECT professional_id FROM Treatments); 
 SELECT name, age, weight FROM Dogs WHERE abandon_yn = 1; 
 SELECT name, age, weight FROM Dogs WHERE abandon_yn = 1; 
 SELECT AVG(age) FROM Dogs; 
 SELECT AVG(age) FROM Dogs; 
 SELECT age FROM Dogs ORDER BY date_of_birth DESC LIMIT 1; 
 SELECT age FROM Dogs ORDER BY date_of_birth DESC LIMIT 1; 
 SELECT charge_type, charge_amount FROM Charges ORDER BY charge_type; 
 SELECT charge_type, charge_amount FROM Charges; 
 SELECT MAX(charge_amount) FROM Charges; 
 SELECT charge_amount FROM Charges ORDER BY charge_amount DESC LIMIT 1; 
 SELECT email_address, cell_number, home_phone FROM Professionals; 
 SELECT email_address, home_phone, cell_number FROM Professionals; 
 SELECT breed_code, size_code FROM Breeds INNER JOIN Sizes ON breed_code = size_code; 
 SELECT DISTINCT breed_code, size_code FROM Dogs; 
 SELECT T1.first_name, T2.treatment_type_description FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id; 
 SELECT T1.first_name, T2.treatment_type_description FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id; 
 SELECT COUNT(*) FROM singer; 
 SELECT COUNT(*) FROM singer; 
 SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC; 
 SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC; 
 SELECT Birth_Year, Citizenship FROM singer; 
 SELECT Birth_Year, Citizenship FROM singer; 
 SELECT Name FROM singer WHERE Citizenship <> 'France'; 
 SELECT Name FROM singer WHERE Citizenship != 'France'; 
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949;
 SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949; 
 SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1; 
 SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1; 
 SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship; 
 SELECT Citizenship, COUNT(*) AS Number_of_Singers FROM singer GROUP BY Citizenship; 
 SELECT Citizenship, COUNT(*) AS Count FROM singer GROUP BY Citizenship ORDER BY Count DESC LIMIT 1; 
 SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship; 
 SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship; 
SELECT T1.Title, T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID;
 SELECT T1.Title, T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID; 
SELECT DISTINCT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000;
 SELECT DISTINCT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000; 
 SELECT T1.Name FROM singer AS T1 INNER JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name HAVING COUNT(*) > 1; 
 SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name HAVING COUNT(*) > 1; 
 SELECT T1.Name, SUM(T2.Sales) AS Total_Sales FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name; 
 SELECT T1.Name, SUM(T2.Sales) AS Total_Sales FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name; 
 SELECT Name FROM singer WHERE NOT Singer_ID IN (SELECT Singer_ID FROM song); 
 SELECT Name FROM singer WHERE NOT Singer_ID IN (SELECT Singer_ID FROM song) 
 SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT     SELECT Citizenship FROM singer WHERE Birth_Year > 1955; 
 SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT     SELECT Citizenship FROM singer WHERE Birth_Year > 1955; 
 SELECT COUNT(*) FROM Other_Available_Features; 
 SELECT T2.feature_type_name FROM Other_Available_Features AS T1 JOIN Ref_Feature_Types AS T2 ON T1.feature_type_code = T2.feature_type_code WHERE T1.feature_name = "AirCon"; 
 SELECT T1.property_type_description FROM Ref_Property_Types AS T1 JOIN Properties AS T2 ON T1.property_type_code = T2.property_type_code WHERE T2.property_type_code = 'House'; 
 SELECT property_name FROM Properties WHERE property_type_code IN ('House', 'Apartment') AND room_count > 1; 
