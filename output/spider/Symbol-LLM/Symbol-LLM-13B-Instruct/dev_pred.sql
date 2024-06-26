SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France';
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France';
SELECT Name, Song_release_year FROM singer ORDER BY Age LIMIT 1; SELECT Name, Song_release_year FROM singer ORDER BY Age LIMIT 1;
SELECT Name, Song_release_year FROM singer ORDER BY Age LIMIT 1
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT Country, COUNT(*) FROM singer GROUP BY Country;
SELECT Country, COUNT(*) FROM singer GROUP BY Country;
SELECT T2.Song_Name FROM "singer" AS T1 JOIN "song_in_concert" AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T1.Age > (SELECT AVG(Age) FROM "singer") SELECT T2.Song_Name FROM "concert" AS T1 JOIN "song_in_concert" AS T2 ON T1.concert_ID = T2.concert_ID WHERE T1.Year > 2015 SELECT T2.Song_Name FROM "concert" AS T1 JOIN "song_in_concert" AS T2 ON T1.concert_ID = T2.concert_ID WHERE T1.Year > 2015 SELECT T2.Song_Name FROM "concert" AS T1 JOIN "song_in_concert" AS T2 ON T1.concert_ID = T2.concert_ID WHERE T1.Year > 2015 SELECT T2.Song_Name FROM "concert" AS T1 JOIN "song_in_concert" AS T2 ON T1.concert_ID = T2.concert_ID WHERE T1.Year > 2015 SELECT T2.Song_Name FROM "concert" AS T1 JOIN "song_in_concert" AS T2 ON T1.concert_ID = T2.concert_ID WHERE T1.Year > 2015 SELECT T2.Song_Name FROM "concert" AS T1 JOIN "song_in_concert" AS T2 ON T1.concert_ID = T2.concert_ID WHERE T1.Year > 2015 SELECT T2.Song_Name FROM "concert" AS T1 JOIN "song_in_concert" AS T2 ON T1.concert_ID = T2.concert_ID WHERE T1.Year > 2015 SELECT T2.Song_Name FROM "concert" AS T1 JOIN "song_in_concert" AS T2 ON T1.concert_ID = T2.concert_ID WHERE T1.Year > 2015 SELECT T2.Song_Name FROM "
SELECT T2.Song_Name FROM "singer" AS T1 JOIN "concert" AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T1.Age > (SELECT AVG(Age) FROM "singer") SELECT T2.Song_Name FROM "concert" AS T1 JOIN "stadium" AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year = 2019
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000;
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000;
SELECT MAX("Capacity"), AVG("Capacity") FROM stadium;
SELECT AVG(Capacity), MAX(Capacity) FROM stadium;
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1;
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1;
SELECT COUNT(*) FROM "concert" WHERE "Year" IN (2014,2015)
SELECT COUNT(*) FROM "concert" WHERE "Year" IN (2014,2015)
SELECT T2.Name, COUNT(*) FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T1.Stadium_ID
SELECT T2.Name, COUNT(*) FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T1.Stadium_ID
SELECT T2.Name, T2.Capacity FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year >= 2014 GROUP BY T1.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T2.Name, T2.Capacity FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year > 2013 GROUP BY T1.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Name FROM stadium WHERE NOT Stadium_ID IN (SELECT Stadium_ID FROM concert)
SELECT Name FROM stadium WHERE NOT Stadium_ID IN (SELECT Stadium_ID FROM concert)
SELECT Country FROM singer WHERE Age > 40 INTERSECT SELECT Country FROM singer WHERE Age < 30
SELECT Name FROM stadium EXCEPT SELECT T2.Name FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year = 2014
SELECT Name FROM stadium WHERE NOT Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE Year = 2014)
SELECT T3.concert_Name, T3.Theme, COUNT(*) FROM singer_in_concert AS T1 JOIN concert AS T2 ON T1.concert_ID = T2.concert_ID JOIN singer AS T3 ON T1.Singer_ID = T3.Singer_ID GROUP BY T3.concert_Name
SELECT T2.concert_Name, T2.Theme, COUNT(*) FROM singer_in_concert AS T1 JOIN concert AS T2 ON T1.concert_ID = T2.concert_ID GROUP BY T1.concert_ID
SELECT T2.Name, COUNT(*) FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T2.Name
SELECT T2.Name, COUNT(*) FROM concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID
SELECT T3.Name FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID JOIN singer AS T3 ON T2.Singer_ID = T3.Singer_ID WHERE T1.Year = 2014
SELECT T3.Name FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID JOIN singer AS T3 ON T2.Singer_ID = T3.Singer_ID WHERE T1.Year = 2014
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT T2.Name, T2.Country FROM concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN song AS T3 ON T3.Song_Name = T1.concert_Name WHERE T3.Song_Name LIKE '%Hey%'
SELECT T2.Name, T2.Location FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year = 2014 INTERSECT SELECT T2.Name, T2.Location FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year = 2015
SELECT T2.Name, T2.Location FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year = 2014 INTERSECT SELECT T2.Name, T2.Location FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year = 2015
SELECT COUNT(*) FROM "concert" AS T1 JOIN "stadium" AS T2 ON T1.Stadium_ID = T2.Stadium_ID ORDER BY T2.Capacity DESC LIMIT 1;
SELECT COUNT(*) FROM "concert" AS T1 JOIN "stadium" AS T2 ON T1.Stadium_ID = T2.Stadium_ID ORDER BY T2.Capacity DESC LIMIT 1;
SELECT COUNT(*) FROM Pets WHERE weight > 10;
SELECT COUNT(*) FROM Pets WHERE weight > 10;
SELECT weight FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog');
SELECT weight FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog');
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType;
SELECT PetType, MAX(weight), MAX(pet_age) FROM Pets GROUP BY PetType;
SELECT COUNT(*) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.Age > 20
SELECT COUNT(*) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.Age > 20
SELECT COUNT(*) FROM Pets AS T1 JOIN Has_Pet AS T2 ON T1.PetID = T2.PetID JOIN Student AS T3 ON T2.StuID = T3.StuID WHERE T3.Sex = 'F' AND T1.PetType = 'dog';
SELECT COUNT(*) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.Sex = 'F' AND T3.PetType = 'dog';
SELECT COUNT(DISTINCT PetType) FROM Pets; SELECT COUNT(DISTINCT PetType) FROM Pets;
SELECT COUNT(DISTINCT PetType) FROM Pets; SELECT COUNT(DISTINCT PetType) FROM Pets;
SELECT DISTINCT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' OR T3.PetType = 'dog';
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' OR T3.PetType = 'dog';
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' INTERSECT SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog'
SELECT T2.Fname FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T1.PetID = T3.PetID WHERE T3.PetType = 'cat' INTERSECT SELECT T2.Fname FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T1.PetID = T3.PetID WHERE T3.PetType = 'dog'
SELECT Major, Age FROM Student WHERE NOT StuID IN (SELECT T1.StuID FROM Has_Pet AS T1 JOIN Pets AS T2 ON T1.PetID = T2.PetID WHERE T2.PetType = 'cat');
SELECT Major, Age FROM Student WHERE NOT StuID IN (SELECT T1.StuID FROM Has_Pet AS T1 JOIN Pets AS T2 ON T1.PetID = T2.PetID WHERE T2.PetType = 'cat')
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Has_Pet AS T1 JOIN Pets AS T2 ON T1.PetID = T2.PetID WHERE T2.PetType = 'cat';
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Has_Pet AS T1 JOIN Pets AS T2 ON T1.PetID = T2.PetID WHERE T2.PetType = 'cat';
SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog' EXCEPT SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat'
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog' EXCEPT SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat'
SELECT PetType, weight FROM Pets ORDER BY pet_age LIMIT 1; SELECT PetType, weight FROM Pets ORDER BY pet_age LIMIT 1;
SELECT PetType, weight FROM Pets ORDER BY pet_age LIMIT 1; SELECT PetType, weight FROM Pets ORDER BY pet_age LIMIT 1;
SELECT PetID, weight FROM Pets WHERE pet_age > 1;
SELECT PetID, weight FROM Pets WHERE pet_age > 1;
SELECT AVG(pet_age), MAX(pet_age), PetType FROM Pets GROUP BY PetType;
SELECT AVG(pet_age), MAX(pet_age), PetType FROM Pets GROUP BY PetType;
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType;
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType;
SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has
SELECT DISTINCT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID
SELECT T2.PetID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'; SELECT T2.PetID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith';
SELECT T2.PetID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'
SELECT COUNT(*), StuID FROM Has_Pet GROUP BY StuID
SELECT StuID, COUNT(*) FROM Has_Pet GROUP BY StuID
SELECT T1.Fname, T1.Sex FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID HAVING COUNT(*) > 1;
SELECT T1.Fname, T1.Sex FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID HAVING COUNT(*) > 1;
SELECT T2.LName FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T1.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3;
SELECT T2.LName FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T1.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3;
SELECT AVG(Age) FROM Student WHERE NOT StuID IN (SELECT StuID FROM Has_Pet)
SELECT AVG(Age) FROM Student WHERE NOT StuID IN (SELECT StuID FROM Has_Pet)
SELECT COUNT(*) FROM continents; SELECT COUNT(*) FROM continents;
SELECT COUNT(*) FROM continents; The number of continents is 5.
SELECT T1.ContId, T1.Continent, COUNT(*) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId = T2.ContinentId GROUP BY T1.ContId;
SELECT ContId, Continent, COUNT(*) FROM continents GROUP BY ContId;
SELECT COUNT(*) FROM countries; 5
SELECT COUNT(*) FROM countries; SELECT COUNT(*) FROM countries;
SELECT Maker, COUNT(*) AS NumberOfModels FROM model_list GROUP BY Maker;
SELECT T1.Maker, T1.Id, COUNT(*) FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id
SELECT Model FROM cars_data ORDER BY Horsepower LIMIT 1;
SELECT Model FROM cars_data ORDER BY Horsepower LIMIT 1;
SELECT Model FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data) SELECT Model FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data);
SELECT Model FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data)
SELECT T1.Maker FROM car_makers AS T1 JOIN cars_data AS T2 ON T1.Id = T2.Maker WHERE T2.Year = 1970
SELECT DISTINCT T1.Maker FROM car_makers AS T1 JOIN cars_data AS T2 ON T1.Id = T2.Maker WHERE T2.Year = 1970
SELECT Make, Year FROM cars_data ORDER BY Year LIMIT 1 SELECT Make, Year FROM cars_data ORDER BY Year LIMIT 1;
SELECT Maker, Year FROM cars_data ORDER BY Year LIMIT 1; SELECT Maker, Year FROM cars_data ORDER BY Year LIMIT 1;
SELECT DISTINCT Model FROM car_names WHERE Year > 1980
SELECT DISTINCT Model FROM cars_data WHERE Year > 1980
SELECT Continent, COUNT(*) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId = T2.CountryId JOIN car_makers AS T3 ON T2.CountryId = T3.Country GROUP BY T1.Continent;
SELECT T1.Continent, COUNT(*) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId = T2.ContId JOIN car_makers AS T3 ON T2.CountryId = T3.Country GROUP BY T1.Continent;
SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.Continent = T2.Country GROUP BY T1.Country ORDER BY COUNT(*) DESC LIMIT 1;
SELECT CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryName ORDER BY COUNT(*) DESC LIMIT 1; The answer is America.
SELECT Maker, COUNT(*) FROM model_list GROUP BY Maker SELECT Maker, COUNT(*) FROM model_list GROUP BY Maker
SELECT Maker, COUNT(*) AS NumberOfModels, FullName FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id; SELECT Maker, COUNT(*) AS NumberOfModels, FullName FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id;
SELECT Accelerate FROM cars_data WHERE Make = 'amc hornet sportabout (sw)'
SELECT Accelerate FROM cars_data WHERE MakeId = (SELECT MakeId FROM car_names WHERE Model = 'amc hornet sportabout (sw)')
SELECT COUNT(*) FROM car_makers WHERE Country = 'france';
SELECT COUNT(*) FROM car_makers WHERE Country = 'France';
SELECT COUNT(*) FROM car_names WHERE Make = 'USA';
SELECT COUNT(*) FROM car_names WHERE Make = 'USA';
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4;
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4;
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT Maker, Model FROM model_list
SELECT Maker, Model FROM model_list
SELECT T1.CountryName, T1.CountryId FROM countries AS T1 JOIN car_makers AS T2 ON T1.Continent = T2.Country SELECT T1.CountryName, T1.CountryId FROM countries AS T1 JOIN car_makers AS T2 ON T1.Continent = T2.Country GROUP BY T1.CountryId HAVING COUNT(*) >= 1;
SELECT T1.CountryName, T1.CountryId FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country SELECT T1.CountryName, T1.CountryId FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId HAVING COUNT(*) >= 1;
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150
SELECT AVG(Weight) FROM cars_data GROUP BY Year
SELECT AVG(Weight), AVG(Year) FROM cars_data GROUP BY Year
SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T1.Continent = 'europe' GROUP BY T1.CountryName HAVING COUNT(*) >= 3;
SELECT T1.CountryName FROM countries AS T1 JOIN continents AS T2 ON T1.Continent = T2.Continent WHERE T2.Continent = 'Europe' GROUP BY T1.CountryName HAVING COUNT(*) >= 3;
SELECT MAX(Horsepower), T1.Make FROM car_names AS T1 JOIN model_list AS T2 ON T1.Model = T2.Model WHERE T2.Maker = (SELECT MAX(Maker) FROM car_makers) AND T2.Model = '3 cylinders'
SELECT MAX(Horsepower) FROM cars_data WHERE Cylinders = 3
SELECT Model FROM cars_data ORDER BY MPG DESC LIMIT 1;
SELECT Model FROM cars_data ORDER BY MPG DESC LIMIT 1;
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(Edispl) FROM cars_data WHERE Model = 'volvo'
SELECT AVG(Edispl) FROM cars_data WHERE Make = 'volvo'
SELECT MAX(Accelerate), Cylinders FROM cars_data GROUP BY Cylinders;
SELECT MAX(Accelerate), Cylinders FROM cars_data GROUP BY Cylinders
SELECT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model GROUP BY T1.Model ORDER BY COUNT(*) DESC LIMIT 1; The SQL query to find the model with the most version(make) of cars is: SELECT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model GROUP BY T1.Model ORDER BY COUNT(*) DESC LIMIT 1; This query joins the model_list and car_names tables on the Model column, groups the results by Model, and orders them by the count(*) column in descending order. The LIMIT 1 clause ensures that only the top result is returned.
SELECT Model, COUNT(*) AS Versions FROM model_list GROUP BY Model ORDER BY Versions DESC LIMIT 1; The model with the most different versions is the one with the highest number of versions.
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4;
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4;
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.Model = T3.Model WHERE T1.FullName = 'American Motor Company'
SELECT COUNT(*) FROM car_names AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id WHERE T2.Maker = 'American Motor Company';
SELECT T1.Maker, T1.Id FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(*) > 3;
SELECT T1.Maker, T1.Id FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(*) > 3;
SELECT DISTINCT Model FROM model_list WHERE Maker = 'General Motors' OR Weight > 3500
SELECT DISTINCT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Maker = T2.MakeId WHERE T2.Maker = 'General Motors' AND T1.Model IN (SELECT Model FROM cars_data WHERE Weight > 3500)
SELECT Year FROM cars_data WHERE Weight >= 3000 AND Weight <= 4000
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 OR Weight > 3000
SELECT MAX(Horsepower) FROM cars_data
SELECT MAX(Horsepower) FROM cars_data
SELECT MIN(Cylinders) FROM cars_data WHERE Accelerate = (SELECT MAX(Accelerate) FROM cars_data WHERE Make = 'volvo')
SELECT MIN(Cylinders) FROM cars_data WHERE Accelerate = (SELECT MAX(Accelerate) FROM cars_data WHERE Make = 'volvo')
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Accelerate) FROM cars_data)
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Accelerate) FROM cars_data)
SELECT COUNT(*) FROM (SELECT Country, COUNT(*) AS count  FROM car_makers  GROUP BY Country  HAVING COUNT(*) > 2) AS result; The SQL query to find the number of countries with more than 2 car makers is: SELECT COUNT(*) FROM (SELECT Country, COUNT(*) AS count  FROM car_makers  GROUP BY Country  HAVING COUNT(*) > 2) AS result; This query first groups the car makers by country and then counts the number of car makers in each group. It then filters the results to only include groups with more than 2 car makers. Finally, it counts the number of such groups and returns the result.
SELECT COUNT(*) FROM (SELECT CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryName HAVING COUNT(*) > 2) AS T3; The answer is 1.
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6;
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6;
SELECT MAX(Horsepower) FROM cars_data WHERE Cylinders = 4;
SELECT Model FROM cars_data WHERE Cylinders = 4 ORDER BY Horsepower DESC LIMIT 1;
SELECT MakeId, Make FROM car_names WHERE Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND Cylinders <= 3;
SELECT MakeId, Model FROM cars_data WHERE Horsepower < (SELECT MIN(Horsepower) FROM cars_data) AND Cylinders < 4 SELECT MakeId, Model FROM cars_data WHERE Horsepower < (SELECT MIN(Horsepower) FROM cars_data) AND Cylinders < 4;
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980
SELECT Model FROM model_list WHERE Maker != 'Ford Motor Company' AND Weight < 3500
SELECT DISTINCT Model FROM model_list WHERE Maker != 'Ford' AND Weight < 3500
SELECT CountryName FROM countries WHERE NOT CountryId IN (SELECT Country FROM car_makers)
SELECT CountryName FROM countries WHERE NOT CountryId IN (SELECT Country FROM car_makers)
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(*) >= 2;
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(*) >= 2 INTERSECT SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN cars_data AS T2 ON T1.Id = T2.MakeId GROUP BY T1.Id HAVING COUNT(*) >= 3
SELECT T1.CountryName, T1.CountryId FROM countries AS T1 JOIN car_makers AS T2 ON T1.Continent = T2.Continent WHERE T2.Maker = 'fiat' OR T2.Maker = 'skoda' OR T2.Maker = 'seat' OR T2.Maker = 'ford' OR T2.Maker = 'peugeot' OR T2.Maker = 'citroen' OR T2.Maker = 'skoda' OR T2.Maker = 'seat' OR T2.Maker = 'ford' OR T2.Maker = 'peugeot' OR T2.Maker = 'citroen' OR T2.Maker = 'skoda' OR T2.Maker = 'seat' OR T2.Maker = 'ford' OR T2.Maker = 'peugeot' OR T2.Maker = 'citroen' OR T2.Maker = 'skoda' OR T2.Maker = 'seat' OR T2.Maker = 'ford' OR T2.Maker = 'peugeot' OR T2.Maker = 'citroen' OR T2.Maker = 'skoda' OR T2.Maker = 'seat' OR T2.Maker = 'ford' OR T2.Maker = 'peugeot' OR T2.Maker = 'citroen' OR T2.Maker = 'skoda' OR T2.Maker = 'seat' OR T2.Maker = 'ford' OR T2.Maker = 'peugeot' OR T2.Maker = 'citroen' OR T2.Maker = 'skoda' OR T2.Maker = 'seat' OR T2.Maker = 'ford' OR T2.Maker = 'peugeot' OR T2.Maker = 'citroen' OR T2.Maker = 'skoda' OR T2.Maker = 'seat' OR T2.Maker = 'ford' OR T2.Maker = 'peugeot' OR T2.Maker = 'citroen' OR T2.Maker = 'skoda' OR T2.M
SELECT T1.CountryId, T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.Continent = T2.Continent WHERE T2.Maker = 'fiat' UNION SELECT T1.CountryId, T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.Continent = T2.Continent GROUP BY T1.CountryId HAVING COUNT(*) > 3
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'; SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways';
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA';
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA';
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony';
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony';
SELECT COUNT(*) FROM airlines; SELECT COUNT(*) FROM airlines;
SELECT COUNT(*) FROM airlines; SELECT COUNT(*) FROM airlines;
SELECT COUNT(*) FROM airports; SELECT COUNT(*) FROM airports;
SELECT COUNT(*) FROM airports; SELECT COUNT(*) FROM airports;
SELECT COUNT(*) FROM flights
SELECT COUNT(*) FROM flights; SELECT COUNT(*) FROM flights;
SELECT * FROM airlines WHERE Abbreviation = 'UAL'; SELECT * FROM airlines WHERE Abbreviation = 'UAL';
SELECT * FROM airlines WHERE Abbreviation = 'UAL';
SELECT COUNT(*) FROM airlines WHERE Country = 'USA';
SELECT COUNT(*) FROM airlines WHERE Country = 'USA';
SELECT City, Country FROM airports WHERE AirportCode = 'ALT'
SELECT City, Country FROM airports WHERE AirportCode = 'ALT'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO';
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen';
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG';
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG';
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO';
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO';
SELECT COUNT(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen';
SELECT COUNT(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen';
SELECT COUNT(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen';
SELECT COUNT(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen';
SELECT COUNT(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen' AND T2.DestAirport = T1.AirportCode
SELECT COUNT(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen' AND T2.DestAirport = 'Ashley';
SELECT COUNT(*) FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'JetBlue Airways';
SELECT COUNT(*) FROM flights WHERE Airline = 5; SELECT COUNT(*) FROM flights WHERE Airline = 5;
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode JOIN airlines AS T3 ON T1.Airline = T3.uid WHERE T2.AirportCode = 'ASY' AND T3.Airline = 'United Airlines';
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T1.Airline = 1 AND T2.AirportCode = 'ASY';
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode JOIN airlines AS T3 ON T1.Airline = T3.uid WHERE T2.AirportCode = 'AHD' AND T3.Airline = 'United Airlines';
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.AirportCode = 'AHD' AND T1.Airline = 'United Airlines';
SELECT COUNT(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport JOIN airlines AS T3 ON T2.Airline = T3.uid WHERE T1.City = 'Aberdeen' AND T3.Airline = 'United Airlines';
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode JOIN airlines AS T3 ON T1.Airline = T3.uid WHERE T2.City = 'Aberdeen' AND T3.Airline = 'United Airlines';
SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1;
SELECT City, COUNT(*) AS Frequency FROM airports JOIN flights ON flights.DestAirport = airports.AirportCode GROUP BY City ORDER BY Frequency DESC LIMIT 1; This SQL query will return the city with the most frequent destination airport.
SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1;
SELECT City FROM airports GROUP BY City ORDER BY COUNT(*) DESC LIMIT 1; The most frequent source airport is New York City.
SELECT T1.AirportCode FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.AirportCode ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.AirportCode FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.AirportCode ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.AirportCode FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.AirportCode ORDER BY COUNT(*) LIMIT 1;
SELECT T1.AirportCode FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.AirportCode ORDER BY COUNT(*) LIMIT 1;
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T2.Airline ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Airline, COUNT(*) FROM flights GROUP BY Airline ORDER BY COUNT(*) DESC LIMIT 1; SELECT Airline, COUNT(*) FROM flights GROUP BY Airline ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T2.Airline ORDER BY COUNT(*) LIMIT 1;
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T2.Airline ORDER BY COUNT(*) LIMIT 1; The answer is 'United Airlines' and 'USA'.
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline JOIN airports AS T3 ON T2.DestAirport = T3.AirportCode WHERE T3.AirportCode = 'AHD'
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'APG' INTERSECT SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'CVO'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'APG' INTERSECT SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'CVO'
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline JOIN airports AS T3 ON T2.SourceAirport = T3.AirportCode WHERE T3.AirportCode = 'CVO' EXCEPT SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline JOIN airports AS T3 ON T2.SourceAirport = T3.AirportCode WHERE T3.AirportCode = 'APG'
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'CVO' EXCEPT SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'APG'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T2.Airline HAVING COUNT(*) >= 10
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T2.Airline HAVING COUNT(*) >= 10
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T2.Airline HAVING COUNT(*) < 200;
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(*) < 200;
SELECT FlightNo FROM flights WHERE Airline = 1; SELECT FlightNo FROM flights WHERE Airline = 1;
SELECT FlightNo FROM flights WHERE Airline = 1
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.AirportName = 'APG';
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG';
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.AirportName = 'APG';
SELECT FlightNo FROM flights WHERE DestAirport = 'APG';
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'Aberdeen';
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'Aberdeen';
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen';
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen';
SELECT COUNT(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen' OR T1.City = 'Abilene';
SELECT COUNT(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen' OR T1.City = 'Abilene';
SELECT AirportName FROM airports WHERE NOT AirportCode IN (SELECT SourceAirport FROM flights)
SELECT AirportName FROM airports WHERE NOT AirportCode IN (SELECT SourceAirport FROM flights)
SELECT COUNT(*) FROM employee; SELECT COUNT(*) FROM employee;
SELECT COUNT(*) FROM employee;
SELECT Name FROM employee ORDER BY Age ASC
SELECT Name FROM employee ORDER BY Age
SELECT City, COUNT(*) FROM employee GROUP BY City;
SELECT City, COUNT(*) FROM employee GROUP BY City;
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1;
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1;
SELECT Location, COUNT(*) FROM shop GROUP BY Location;
SELECT Location, COUNT(*) FROM shop GROUP BY Location;
SELECT Name, District FROM shop ORDER BY Number_products DESC LIMIT 1;
SELECT Name, District FROM shop ORDER BY Number_products DESC LIMIT 1;
SELECT MIN(Number_products), MAX(Number_products) FROM shop;
SELECT MIN(Number_products), MAX(Number_products) FROM shop;
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC;
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop);
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID WHERE T2.Bonus = (SELECT MAX(Bonus) FROM evaluation)
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T2.Bonus DESC LIMIT 1;
SELECT Name FROM employee WHERE NOT Employee_ID IN (SELECT Employee_ID FROM evaluation)
SELECT Name FROM employee WHERE NOT Employee_ID IN (SELECT Employee_ID FROM evaluation)
SELECT T2.Name FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Shop_ID ORDER BY COUNT(T1.Employee_ID) DESC LIMIT 1;
SELECT T2.Name FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Shop_ID ORDER BY COUNT(T1.Employee_ID) DESC LIMIT 1;
SELECT Name FROM shop WHERE NOT Shop_ID IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop WHERE NOT Shop_ID IN (SELECT Shop_ID FROM hiring)
SELECT shop.Name, COUNT(hiring.Employee_ID) FROM hiring JOIN shop ON hiring.Shop_ID = shop.Shop_ID GROUP BY hiring.Shop_ID;
SELECT COUNT(*), T2.Name FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Shop_ID
SELECT SUM(Bonus) FROM evaluation
SELECT SUM(Bonus) FROM evaluation
SELECT * FROM hiring
SELECT * FROM hiring
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(*) FROM Documents;
SELECT COUNT(*) FROM Documents;
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_ID, Template_ID, Document_Name FROM Documents WHERE Document_Name = "Robbin CV"
SELECT Document_ID, Template_ID, Document_Name FROM Documents WHERE Document_Name = 'Robbin CV';
SELECT COUNT(DISTINCT Template_ID) FROM Documents
SELECT COUNT(DISTINCT Template_ID) FROM Documents
SELECT COUNT(*) FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'PPT';
SELECT COUNT(*) FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'PPT';
SELECT Template_ID, COUNT(*) FROM Documents GROUP BY Template_ID;
SELECT Template_ID, COUNT(*) FROM Documents GROUP BY Template_ID
SELECT T1.Template_ID, T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.Template_ID, T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.Template_ID FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID HAVING COUNT(*) > 1;
SELECT T1.Template_ID FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID HAVING COUNT(*) > 1;
SELECT Template_ID FROM Templates WHERE NOT Template_ID IN (SELECT Template_ID FROM Documents)
SELECT Template_ID FROM Templates WHERE NOT Template_ID IN (SELECT Template_ID FROM Documents)
SELECT COUNT(*) FROM Templates; SELECT COUNT(*) FROM Templates;
SELECT COUNT(*) FROM Templates;
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates;
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates;
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT Template_ID FROM Templates WHERE Template_Type_Code = "PP" OR Template_Type_Code = "PPT";
SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PP' OR Template_Type_Code = 'PPT';
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV';
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV';
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5;
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5;
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_Code;
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_Code;
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3;
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3;
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code; SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code;
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code; SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code;
SELECT T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = "Data base";
SELECT T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = "Data base"
SELECT T1.Document_Name FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = "BK";
SELECT T1.Document_Name FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = "BK";
SELECT T1.Template_Type_Code, COUNT(*) FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_Type_Code;
SELECT T1.Template_Type_Code, COUNT(*) FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_Type_Code;
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code JOIN Documents AS T3 ON T2.Template_ID = T3.Template_ID GROUP BY T1.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1 JOIN Documents AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T1.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Template_Type_Code FROM Templates WHERE NOT Template_ID IN (SELECT Template_ID FROM Documents)
SELECT Template_Type_Code FROM Ref_Template_Types WHERE NOT Template_Type_Code IN (SELECT Template_Type_Code FROM Documents)
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types;
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types;
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = "AD"
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = "AD";
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = "Book"
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = "Book"
SELECT DISTINCT T1.Template_Type_Description FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code JOIN Documents AS T3 ON T2.Template_ID = T3.Template_ID
SELECT DISTINCT T1.Template_Type_Description FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code JOIN Documents AS T3 ON T2.Template_ID = T3.Template_ID
SELECT T1.Template_ID FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Description = "Presentation";
SELECT T1.Template_ID FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Description = 'Presentation';
SELECT COUNT(*) FROM Paragraphs;
SELECT COUNT(*) FROM Paragraphs;
SELECT COUNT(*) FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID WHERE T2.Document_Name = "Summer Show";
SELECT COUNT(*) FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID WHERE T2.Document_Name = "Summer Show";
SELECT Other_Details FROM Paragraphs WHERE Paragraph_Text = 'Korea'
SELECT Other_Details FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name = 'Welcome to NY');
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name = 'Welcome to NY');
SELECT Paragraph_Text FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name = "Customer reviews");
SELECT t2.Paragraph_Text FROM Documents AS t1 JOIN Paragraphs AS t2 ON t1.Document_ID = t2.Document_ID WHERE t1.Document_Name = "Customer reviews"
SELECT Document_ID, COUNT(*) FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID;
SELECT Document_ID, COUNT(*) FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID;
SELECT Document_ID, Document_Name, COUNT(*) FROM Paragraphs GROUP BY Document_ID;
SELECT Document_ID, Document_Name, COUNT(*) FROM Paragraphs GROUP BY Document_ID
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2;
SELECT Document_ID, Document_Name FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.Document_ID, T1.Document_Name FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) LIMIT 1;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) LIMIT 1;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2;
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Brazil' INTERSECT SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Ireland'
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%Brazil%' INTERSECT SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%Ireland%'
SELECT COUNT(*) FROM teacher
SELECT COUNT(*) FROM teacher
SELECT Name FROM teacher ORDER BY Age
SELECT Name FROM teacher ORDER BY Age
SELECT Age, Hometown FROM teacher
SELECT Age, Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown <> 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Hometown <> 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Hometown FROM teacher ORDER BY Age LIMIT 1; SELECT Hometown FROM teacher ORDER BY Age LIMIT 1;
SELECT Hometown FROM teacher ORDER BY Age LIMIT 1; SELECT Hometown FROM teacher ORDER BY Age LIMIT 1;
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown;
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown;
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1; SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2;
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID
SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID SELECT T2.Name, T1
SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID ORDER BY T2.Name
SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID ORDER BY T2.Name
SELECT T2.Name FROM course AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID WHERE T1.Course = "Math";
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID JOIN course AS T3 ON T1.Course_ID = T3.Course_ID WHERE T3.Course = "Math"
SELECT T2.Name, COUNT(*) FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name
SELECT T2.Name, COUNT(*) FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T1.Teacher_ID HAVING COUNT(*) >= 2;
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T1.Teacher_ID HAVING COUNT(*) >= 2
SELECT Name FROM teacher WHERE NOT Teacher_ID IN (SELECT Teacher_ID FROM course_arrange)
SELECT Name FROM teacher WHERE NOT Teacher_ID IN (SELECT Teacher_ID FROM course_arrange)
SELECT COUNT(*) FROM visitor WHERE Age < 30;
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4;
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC
SELECT "Museum_ID", "Name" FROM "museum" ORDER BY "Num_of_Staff" DESC LIMIT 1;
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < 2009;
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum';
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > 2010)
SELECT T1.ID, T1.Name, T1.Age FROM visitor T1 JOIN visit T2 ON T1.ID = T2.visitor_ID GROUP BY T1.ID HAVING COUNT(*) > 1;
SELECT T1.ID, T1.Name, T1.Level_of_membership FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID GROUP BY T1.ID ORDER BY SUM(T2.Total_spent) DESC LIMIT 1;
SELECT T1.Museum_ID, T1.Name FROM museum AS T1 JOIN visit AS T2 ON T1.Museum_ID = T2.Museum_ID GROUP BY T1.Museum_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Name FROM museum WHERE NOT Museum_ID IN (SELECT Museum_ID FROM visit)
SELECT T2.Name, T2.Age FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_ID = T2.ID GROUP BY T1.visitor_ID ORDER BY SUM(T1.Num_of_Ticket) DESC LIMIT 1;
SELECT AVG(Num_of_Ticket), MAX(Num_of_Ticket) FROM visit
SELECT SUM(Total_spent) FROM visit WHERE visitor_ID IN (SELECT ID FROM visitor WHERE Level_of_membership = 1)
SELECT T1.Name FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID WHERE T2.Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year < 2009) INTERSECT SELECT T1.Name FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID WHERE T2.Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year > 2011)
SELECT COUNT(*) FROM visitor WHERE NOT ID IN (SELECT visitor_ID FROM visit WHERE Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year > 2010))
SELECT COUNT(*) FROM "museum" WHERE "Open_Year" > 2013 OR "Open_Year" < 2008;
SELECT COUNT(*) FROM players;
SELECT COUNT(*) FROM players; SELECT COUNT(*) FROM players;
SELECT COUNT(*) FROM matches;
SELECT COUNT(*) FROM matches;
SELECT first_name, birth_date FROM players WHERE country_code = 'USA';
SELECT first_name, birth_date FROM players WHERE country_code = 'USA';
SELECT AVG(loser_age) FROM matches UNION SELECT AVG(winner_age) FROM matches
SELECT AVG(loser_age) FROM matches UNION SELECT AVG(winner_age) FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT MAX(loser_rank) FROM matches
SELECT MIN(loser_rank) FROM matches
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10
SELECT T2.first_name, T2.last_name FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.year = 2013 INTERSECT SELECT T2.first_name, T2.last_name FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.year = 2016
SELECT T1.first_name, T1.last_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.year = 2013 INTERSECT SELECT T1.first_name, T1.last_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.year = 2016
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016)
SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name = "WTA Championships" INTERSECT SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name = "Australian Open"
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name = 'WTA Championships' INTERSECT SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name = 'Australian Open'
SELECT first_name, country_code FROM players ORDER BY birth_date LIMIT 1; SELECT first_name, country_code FROM players ORDER BY birth_date LIMIT 1;
SELECT first_name, country_code FROM players ORDER BY birth_date LIMIT 1;
SELECT first_name, last_name FROM players ORDER BY birth_date;
SELECT first_name, last_name FROM players ORDER BY birth_date
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T2.player_id ORDER BY SUM(T2.tours) DESC LIMIT 1;
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1;
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.winner_name, T1.winner_rank_points FROM matches AS T1 JOIN rankings AS T2 ON T1.winner_id = T2.player_id GROUP BY T1.winner_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.first_name, T1.last_name, T2.ranking_points FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T2.player_id ORDER BY COUNT(*) DESC LIMIT 1; The SQL query to find the winner who has won the most matches and their ranking points is: SELECT T1.first_name, T1.last_name, T2.ranking_points FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T2.player_id ORDER BY COUNT(*) DESC LIMIT 1; This query joins the players and rankings tables on the player_id column, groups the results by player_id, orders the results by the count of matches won in descending order, and limits the results to the first row.
SELECT t1.first_name, t1.last_name FROM players AS t1 JOIN matches AS t2 ON t1.player_id = t2.winner_id WHERE t2.tourney_name = "Australian Open" ORDER BY t2.winner_rank_points DESC LIMIT 1;
SELECT t1.first_name, t1.last_name FROM players AS t1 JOIN matches AS t2 ON t1.player_id = t2.winner_id WHERE t2.tourney_name = "Australian Open" ORDER BY t1.player_id LIMIT 1;
SELECT "loser_name", "winner_name" FROM matches ORDER BY "minutes" DESC LIMIT 1;
SELECT T1.first_name, T1.last_name, T2.loser_name, T2.winner_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.loser_id WHERE T2.minutes = (SELECT MAX(minutes) FROM matches) UNION SELECT T1.first_name, T1.last_name, T2.loser_name, T2.winner_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.minutes = (SELECT MAX(minutes) FROM matches)
SELECT T2.first_name, AVG(T1.ranking_points) FROM rankings AS T1 JOIN players AS T2 ON T1.player_id = T2.player_id GROUP BY T2.first_name;
SELECT T2.first_name, AVG(T1.ranking_points) FROM rankings AS T1 JOIN players AS T2 ON T1.player_id = T2.player_id GROUP BY T2.first_name
SELECT first_name, SUM(ranking_points) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id;
SELECT T1.first_name, SUM(T2.ranking_points) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id
SELECT COUNT(*), country_code FROM players GROUP BY country_code;
SELECT country_code, COUNT(*) FROM players GROUP BY country_code;
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1; The code of the country with the most players is SUI.
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50;
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50;
SELECT ranking_date, SUM(tours) FROM rankings GROUP BY ranking_date
SELECT ranking_date, COUNT(DISTINCT tours) FROM rankings GROUP BY ranking_date
SELECT year, COUNT(*) FROM matches GROUP BY year
SELECT year, COUNT(*) FROM matches GROUP BY year
SELECT T1.first_name, T1.last_name, T2.winner_rank FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id ORDER BY T1.birth_date DESC LIMIT 3;
SELECT T1.first_name, T1.last_name, T2.winner_rank FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T1.birth_date >= (SELECT MIN(T1.birth_date) FROM players AS T1) ORDER BY T1.birth_date DESC LIMIT 3;
SELECT COUNT(DISTINCT T1.player_id) FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T1.hand = "L" AND T2.tourney_name = "WTA Championships"
SELECT COUNT(*) FROM players WHERE hand = 'L' INTERSECT SELECT COUNT(*) FROM matches WHERE tourney_name = 'WTA Championships' AND winner_hand = 'L'
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id ORDER BY T2.winner_rank_points DESC LIMIT 1;
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id ORDER BY T2.winner_rank_points DESC LIMIT 1;
SELECT COUNT(*), hand FROM players GROUP BY hand;
SELECT hand, COUNT(*) FROM players GROUP BY hand;
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured';
SELECT name, tonnage FROM ship ORDER BY name DESC
SELECT name, date, result FROM battle;
SELECT MAX(killed), MIN(killed) FROM death
SELECT AVG(injured) FROM death
SELECT killed, injured FROM death WHERE caused_by_ship_id = (SELECT id FROM ship WHERE tonnage = 't')
SELECT name, result FROM battle WHERE bulgarian_commander <> 'Boril';
SELECT DISTINCT T1.id, T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.ship_type = 'Brig';
SELECT T1.id, T1.name FROM battle AS T1 JOIN death AS T2 ON T1.id = T2.caused_by_ship_id GROUP BY T1.id HAVING SUM(T2.killed) > 10;
SELECT "ship_type", "name" FROM "ship" ORDER BY "injured" DESC LIMIT 1;
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'
SELECT COUNT(DISTINCT result) FROM battle
SELECT COUNT(*) FROM battle WHERE NOT "result" IS NULL AND NOT "result" IS NULL; SELECT COUNT(*) FROM battle WHERE NOT "result" IS NULL AND NOT "result" IS NULL;
SELECT T1.name, T1.date FROM battle AS T1 JOIN ship AS T2 ON T1.lost_in_battle = T2.id WHERE T2.name = 'Lettice' INTERSECT SELECT T1.name, T1.date FROM battle AS T1 JOIN ship AS T2 ON T1.lost_in_battle = T2.id WHERE T2.name = 'HMS Atalanta'
SELECT name, result, bulgarian_commander FROM battle WHERE NOT id IN (SELECT battle_id FROM ship WHERE location = 'English Channel' AND lost_in_battle > 0);
SELECT note FROM death WHERE note LIKE '%East%'
SELECT * FROM Addresses
SELECT line_1, line_2 FROM Addresses
SELECT COUNT(*) FROM Courses
SELECT COUNT(*) FROM Courses
SELECT DISTINCT course_description FROM Courses WHERE course_name = 'Math'
SELECT DISTINCT course_description FROM Courses WHERE course_name LIKE '%math%'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT T1.department_name, T1.department_id FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id GROUP BY T1.department_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.department_name, T1.department_id FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id GROUP BY T1.department_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs
SELECT COUNT(*) FROM Degree_Programs AS T1 JOIN Courses AS T2 ON T1.course_id = T2.course_id WHERE T1.department_id = (SELECT department_id FROM Departments WHERE department_name = 'Engineering')
SELECT COUNT(*) FROM Degree_Programs AS T1 JOIN Departments AS T2 ON T1.department_id = T2.department_id WHERE T2.department_name = 'Engineering'
SELECT section_name, section_description FROM Sections
SELECT section_name, section_description FROM Sections
SELECT T1.course_name, T1.course_id FROM Courses AS T1 JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(*) <= 2
SELECT T1.course_name, T1.course_id FROM Courses AS T1 JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(*) < 2
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT T1.semester_name, T1.semester_id FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.semester_name, T1.semester_id FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT department_description FROM Departments WHERE department_name LIKE '%the computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT T2.first_name, T2.middle_name, T2.last_name, T1.student_id FROM Student_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING COUNT(DISTINCT T1.degree_program_id) = 2
SELECT T2.first_name, T2.middle_name, T2.last_name, T1.student_id FROM Student_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id WHERE T1.semester_id = (SELECT MAX(semester_id) FROM Student_Enrolment) GROUP BY T1.student_id HAVING COUNT(*) = 2;
SELECT T3.first_name, T3.middle_name, T3.last_name FROM Student_Enrolment AS T1 JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id JOIN Students AS T3 ON T1.student_id = T3.student_id WHERE T2.degree_summary_name = 'Bachelor'
SELECT T2.first_name, T2.middle_name, T2.last_name FROM Degree_Programs AS T1 JOIN Students AS T2 ON T1.degree_program_id = T2.degree_program_id WHERE T1.degree_summary_name = 'Bachelor'
SELECT degree_program_id FROM Student_Enrolment GROUP BY degree_program_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T3.degree_summary_name FROM Student_Enrolment AS T1 JOIN Semesters AS T2 ON T1.semester_id = T2.semester_id JOIN Degree_Programs AS T3 ON T1.degree_program_id = T3.degree_program_id GROUP BY T3.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.degree_program_id, T2.degree_summary_name FROM Student_Enrolment AS T1 JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.degree_program_id, T2.degree_summary_name FROM Student_Enrolment AS T1 JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.student_id, T1.first_name, T1.middle_name, T1.last_name, COUNT(*) AS enrollments, T2.degree_program_id FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY enrollments DESC LIMIT 1;
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id, COUNT(*) FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT semester_name FROM Semesters WHERE NOT semester_id IN (SELECT semester_id FROM Student_Enrolment)
SELECT semester_name FROM Semesters WHERE NOT semester_id IN (SELECT semester_id FROM Student_Enrolment)
SELECT DISTINCT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT last_name FROM Students WHERE current_address_id IN (SELECT address_id FROM Addresses WHERE state_province_county = 'North Carolina') AND NOT student_id IN (SELECT student_id FROM Student_Enrolment)
SELECT last_name FROM Students WHERE current_address_id IN (SELECT address_id FROM Addresses WHERE state_province_county = 'North Carolina') EXCEPT SELECT T1.last_name FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id
SELECT T1.transcript_date, T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(*) >= 2
SELECT T2.transcript_date, T1.transcript_id FROM Student_Enrolment AS T1 JOIN Transcripts AS T2 ON T1.student_enrolment_id = T2.transcript_id JOIN Student_Enrolment_Courses AS T3 ON T1.student_enrolment_id = T3.student_enrolment_id GROUP BY T1.transcript_id HAVING COUNT(*) >= 2
SELECT cell_mobile_number FROM Students WHERE first_name = "Timmothy" AND last_name = "Ward"
SELECT cell_mobile_number FROM Students WHERE first_name = "Timmothy" AND last_name = "Ward"
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered LIMIT 1;
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered LIMIT 1;
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered LIMIT 1;
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered LIMIT 1;
SELECT first_name FROM Students WHERE permanent_address_id <> current_address_id
SELECT T2.first_name FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.permanent_address_id WHERE T1.address_id <> T2.current_address_id
SELECT T1.address_id, T1.line_1, T1.line_2, T1.line_3 FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.current_address_id GROUP BY T1.address_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T2.address_id, T2.line_1, T2.line_2 FROM Student_Enrolment AS T1 JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id GROUP BY T2.address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(transcript_date) FROM Transcripts
SELECT AVG(transcript_date) FROM Transcripts
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date LIMIT 1;
SELECT MIN(transcript_date) FROM Transcripts, Transcript_Contents WHERE transcript_id = Transcript_Contents.transcript_id
SELECT COUNT(*) FROM Transcripts
SELECT COUNT(*) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT COUNT(*), T1.degree_program_id FROM Student_Enrolment AS T1 JOIN Transcript_Contents AS T2 ON T1.student_enrolment_id = T2.student_course_id GROUP BY T1.degree_program_id
SELECT COUNT(*), T1.course_id FROM Courses AS T1 JOIN Transcript_Contents AS T2 ON T1.course_id = T2.student_course_id GROUP BY T1.course_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT transcript_date, transcript_id FROM Transcripts GROUP BY transcript_date ORDER BY COUNT(*) LIMIT 1;
SELECT T2.transcript_date, T1.transcript_id FROM Transcript_Contents AS T1 JOIN Transcripts AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id ORDER BY COUNT(*) LIMIT 1;
SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Master') INTERSECT SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Bachelor')
SELECT semester_id FROM Student_Enrolment_Courses WHERE course_id IN (SELECT course_id FROM Degree_Programs WHERE degree_program_id IN (SELECT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT DISTINCT degree_program_id FROM Student_Enrolment WHERE
SELECT COUNT(DISTINCT `address_id`) FROM `Addresses`
SELECT DISTINCT T1.address_id FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.current_address_id
SELECT * FROM Students ORDER BY first_name DESC
SELECT other_student_details FROM Students ORDER BY last_name DESC
SELECT * FROM Sections WHERE section_name = 'h'
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582'
SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582'
SELECT Title FROM Cartoon ORDER BY Title
SELECT Title FROM Cartoon ORDER BY Title
SELECT * FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr';
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT Country, COUNT(*) FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1; SELECT Country, COUNT(*) FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Country, COUNT(*) FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1; SELECT Country, COUNT(*) FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel;
SELECT COUNT(DISTINCT series_name) FROM TV_Channel
SELECT Content FROM TV_Channel WHERE series_name = "Sky Radio"
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT Package_Option FROM TV_Channel WHERE series_name = "Sky Radio"
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English';
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English';
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language ORDER BY COUNT(Language) LIMIT 1;
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language ORDER BY COUNT(*) LIMIT 1;
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language;
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language;
SELECT t1.series_name FROM TV_Channel AS t1 JOIN TV_series AS t2 ON t1.id = t2.channel WHERE t2.Title = 'The Rise of the Blue Beetle!'
SELECT t1.series_name FROM TV_Channel AS t1 JOIN TV_series AS t2 ON t1.id = t2.channel WHERE t2.Title = 'The Rise of the Blue Beetle'
SELECT t2.Title FROM TV_Channel AS t1 JOIN Cartoon AS t2 ON t1.id = t2.Channel WHERE t1.series_name = 'Sky Radio'
SELECT Title FROM Cartoon WHERE Channel = (SELECT T1.Channel FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio')
SELECT Episode FROM TV_series ORDER BY Rating
SELECT * FROM TV_series ORDER BY Rating
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3;
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3;
SELECT MIN(Share), MAX(Share) FROM TV_series
SELECT MAX(Share), MIN(Share) FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT Air_Date FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT Weekly_Rank FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT Weekly_Rank FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT t1.series_name FROM TV_Channel AS t1 JOIN TV_series AS t2 ON t1.id = t2.channel WHERE t2.Episode = "A Love of a Lifetime"
SELECT T1.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.channel WHERE T2.Episode = "A Love of a Lifetime"
SELECT T2.Episode FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = "Sky Radio"
SELECT T2.Episode FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = "Sky Radio"
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by;
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1; SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1;
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1;
SELECT Package_Option, series_name FROM TV_Channel ORDER BY Hight_definition_TV DESC LIMIT 1;
SELECT "series_name", "Package_Option" FROM TV_Channel WHERE "Hight_definition_TV" = 'yes'
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'
SELECT DISTINCT t1.Country FROM TV_Channel AS t1 JOIN Cartoon AS t2 ON t1.id = t2.Channel WHERE t2.Written_by = 'Todd Casey'
SELECT Country FROM TV_Channel EXCEPT SELECT Country FROM TV_Channel WHERE Channel IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT Country FROM TV_Channel WHERE NOT Channel IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones' AND T2.Directed_by = 'Michael Chang'
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones' INTERSECT SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Michael Chang'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language <> 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language <> 'English';
SELECT id FROM TV_Channel GROUP BY Country HAVING COUNT(*) > 2;
SELECT id FROM TV_Channel GROUP BY id HAVING COUNT(*) > 2;
SELECT id FROM TV_Channel EXCEPT SELECT id FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT id FROM TV_Channel EXCEPT SELECT id FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT Package_Option FROM TV_Channel WHERE NOT id IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE NOT id IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT COUNT(*) FROM poker_player; SELECT COUNT(*) FROM poker_player;
SELECT COUNT(*) FROM poker_player;
SELECT "Earnings" FROM "poker_player" ORDER BY "Earnings" DESC;
SELECT Earnings FROM poker_player ORDER BY Earnings DESC;
SELECT Final_Table_Made, Best_Finish FROM poker_player;
SELECT Final_Table_Made, Best_Finish FROM poker_player;
SELECT AVG(Earnings) FROM poker_player;
SELECT AVG(Earnings) FROM poker_player;
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1;
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1;
SELECT MAX("Final_Table_Made") FROM "poker_player" WHERE "Earnings" < 200000;
SELECT MAX("Final_Table_Made") FROM "poker_player" WHERE "Earnings" < 200000;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings > 300000;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings > 300000;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made;
SELECT T2.Birth_Date FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings LIMIT 1;
SELECT T2.Birth_Date FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings LIMIT 1;
SELECT T2.Money_Rank FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Height DESC LIMIT 1;
SELECT T2.Money_Rank FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Height DESC LIMIT 1;
SELECT AVG(T2.Earnings) FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Height > 200;
SELECT AVG(T2.Earnings) FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Height > 200;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality;
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality;
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1; The most common nationality of people is Russia.
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1; The nationality that is most common across all people is Russia.
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2;
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2;
SELECT Name, Birth_Date FROM people ORDER BY Name
SELECT Name, Birth_Date FROM people ORDER BY Name;
SELECT Name FROM people WHERE Nationality != "Russia";
SELECT Name FROM people WHERE Nationality != 'Russia';
SELECT Name FROM people WHERE NOT People_ID IN (SELECT People_ID FROM poker_player);
SELECT Name FROM people WHERE NOT People_ID IN (SELECT People_ID FROM poker_player);
SELECT COUNT(DISTINCT Nationality) FROM people; SELECT COUNT(DISTINCT Nationality) FROM people;
SELECT COUNT(DISTINCT Nationality) FROM people;
SELECT COUNT(DISTINCT state) FROM AREA_CODE_STATE; 2
SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC;
SELECT vote_id, phone_number, state FROM VOTES;
SELECT MAX(area_code), MIN(area_code) FROM AREA_CODE_STATE;
SELECT MAX(created) FROM VOTES WHERE state = 'CA';
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name <> 'Jessie Alloway';
SELECT DISTINCT state, created FROM VOTES
SELECT T1.contestant_number, T1.contestant_name FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T1.contestant_number HAVING COUNT(*) >= 2;
SELECT T1.contestant_number, T1.contestant_name FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T1.contestant_number ORDER BY SUM(T2.vote_id) LIMIT 1;
SELECT COUNT(*) FROM VOTES WHERE state IN ('NY', 'CA');
SELECT COUNT(*) FROM CONTESTANTS WHERE NOT contestant_number IN (SELECT contestant_number FROM VOTES);
SELECT T1.area_code FROM AREA_CODE_STATE AS T1 JOIN VOTES AS T2 ON T1.area_code = T2.state GROUP BY T1.area_code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T2.created, T2.state, T2.phone_number FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number = T2.contestant_number WHERE T1.contestant_name = 'Tabatha Gehling';
SELECT T1.area_code FROM AREA_CODE_STATE AS T1 JOIN VOTES AS T2 ON T1.area_code = T2.state WHERE T2.contestant_number = (SELECT contestant_number FROM CONTESTANTS WHERE contestant_name = 'Tabatha Gehling') INTERSECT SELECT T1.area_code FROM AREA_CODE_STATE AS T1 JOIN VOTES AS T2 ON T1.area_code = T2.state WHERE T2.contestant_number = (SELECT contestant_number FROM CONTESTANTS WHERE contestant_name = 'Kelly Clauss')
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndependYear > 1950
SELECT Name FROM country WHERE IndependenceYear > 1950;
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic';
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic';
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean';
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean';
SELECT Continent FROM country WHERE Name = 'Anguilla';
SELECT Continent FROM country WHERE Name = 'Anguilla'; The continent name for Anguilla is 'North America'.
SELECT `Region` FROM `country` WHERE `Name` = 'Afghanistan'; SELECT `Region` FROM `country` WHERE `Name` = 'Afghanistan';
SELECT region FROM country WHERE Name = 'Afghanistan'; SELECT region FROM country WHERE Name = 'Afghanistan';
SELECT Language FROM countrylanguage WHERE CountryCode = 'ARU' ORDER BY Percentage DESC LIMIT 1; SELECT Language FROM countrylanguage WHERE CountryCode = 'ARU' ORDER BY Percentage DESC LIMIT 1;
SELECT Language FROM countrylanguage WHERE CountryCode = 'ARU'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'; SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil';
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'; SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil';
SELECT Region, Population FROM country WHERE Name = 'Angola'; SELECT Region, Population FROM country WHERE Name = 'Angola';
SELECT Region, Population FROM country WHERE Name = 'Angola'; SELECT Region, Population FROM country WHERE Name = 'Angola';
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa';
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa';
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy LIMIT 1;
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy LIMIT 1;
SELECT SUM(Population), MAX(GNP) FROM country WHERE Continent = 'Asia';
SELECT SUM(Population), MAX(GNP) FROM country WHERE Continent = 'Asia';
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic';
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic';
SELECT SUM(SurfaceArea) FROM country WHERE Continent = 'Asia' OR Continent = 'Europe';
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(Population) FROM city WHERE District = 'Gelderland';
SELECT SUM(Population) FROM city WHERE District = 'Gelderland';
SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm = 'US territory';
SELECT AVG(GNP), SUM(Population) FROM country WHERE Name IN ('American Samoa', 'Guam', 'Northern Mariana Islands', 'Puerto Rico', 'United States Virgin Islands')
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa';
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa';
SELECT COUNT(*) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Aruba';
SELECT COUNT(*) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Aruba';
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'F'; 2
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'F'; SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'F';
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1; The answer is Afghanistan.
SELECT Continent FROM country GROUP BY Continent ORDER BY COUNT(*) DESC LIMIT 1; The continent with the most diverse languages is Asia.
SELECT Continent, COUNT(*) AS NumberOfLanguages FROM countrylanguage GROUP BY Continent ORDER BY NumberOfLanguages DESC LIMIT 1; The continent that speaks the most languages is Asia.
SELECT COUNT(*) FROM countrylanguage WHERE Language = 'English' INTERSECT SELECT COUNT(*) FROM countrylanguage WHERE Language = 'Dutch'
SELECT COUNT(*) FROM country WHERE Language IN ('English', 'Dutch')
SELECT Name FROM country WHERE Language IN ('English', 'French')
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French'
SELECT Name FROM country WHERE Language = 'English' INTERSECT SELECT Name FROM country WHERE Language = 'French'
SELECT Name FROM country WHERE IsOfficial = 'F' OR IsOfficial = 'E';
SELECT COUNT(DISTINCT Continent) FROM country WHERE Language = 'Chinese';
SELECT COUNT(DISTINCT Continent) FROM country WHERE Language = 'Chinese'; SELECT COUNT(DISTINCT Continent) FROM country WHERE Language = 'Chinese';
SELECT Region FROM country WHERE Name IN ('English', 'Dutch')
SELECT Region FROM country WHERE Language IN ('Dutch', 'English')
SELECT CountryCode FROM countrylanguage WHERE IsOfficial = 'F' OR IsOfficial = 'D';
SELECT Name FROM country WHERE Language IN ('English', 'Dutch') AND IsOfficial = 'F';
SELECT Language FROM countrylanguage WHERE Continent = 'Asia' GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1; SELECT Language FROM countrylanguage WHERE Continent = 'Asia' GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Language FROM countrylanguage WHERE Continent = 'Asia' GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1; The answer is not provided in the given database schema.
SELECT Language FROM countrylanguage WHERE IsOfficial = 'F' GROUP BY Language HAVING COUNT(*) = 1;
SELECT Language FROM countrylanguage WHERE IsOfficial = 'F' GROUP BY Language HAVING COUNT(*) = 1;
SELECT Name FROM city WHERE CountryCode IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') ORDER BY Population DESC LIMIT 1;
SELECT MAX(Population) FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'English';
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1;
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1;
SELECT AVG(LifeExpectancy) FROM country WHERE NOT IsOfficial = 'F';
SELECT AVG(LifeExpectancy) FROM country WHERE Language <> 'English';
SELECT SUM(Population) FROM country WHERE NOT Name LIKE '%England%' OR NOT Name LIKE '%United Kingdom%' OR NOT Name LIKE '%United States%' OR NOT Name LIKE '%Canada%' OR NOT Name LIKE '%Australia%' OR NOT Name LIKE '%New Zealand%' OR NOT Name LIKE '%Ireland%' OR NOT Name LIKE '%South Africa%' OR NOT Name LIKE '%India%' OR NOT Name LIKE '%Pakistan%' OR NOT Name LIKE '%China%' OR NOT Name LIKE '%Japan%' OR NOT Name LIKE '%Korea%' OR NOT Name LIKE '%Thailand%' OR NOT Name LIKE '%Vietnam%' OR NOT Name LIKE '%Philippines%' OR NOT Name LIKE '%Indonesia%' OR NOT Name LIKE '%Malaysia%' OR NOT Name LIKE '%Singapore%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%' OR NOT Name LIKE '%Taiwan%' OR NOT Name LIKE '%Hong Kong%'
SELECT SUM(Population) FROM country WHERE NOT Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English');
SELECT Language FROM country WHERE HeadOfState = 'Beatrix'
SELECT t1.Language FROM country AS t1 JOIN countrylanguage AS t2 ON t1.Code = t2.CountryCode WHERE t1.HeadOfState = 'Beatrix';
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE CountryCode IN (SELECT CountryCode FROM country WHERE IndependenceYear < 1930);
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE CountryCode IN (SELECT CountryCode FROM country WHERE IndependenceYear < 1930);
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT * FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT * FROM city WHERE Population < (SELECT MIN(Population) FROM city WHERE CountryCode IN (SELECT CountryCode FROM country WHERE Continent = 'Asia'));
SELECT * FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia');
SELECT * FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa');
SELECT * FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa');
SELECT CountryCode FROM country EXCEPT SELECT CountryCode FROM countrylanguage WHERE Language = 'English'
SELECT CountryCode FROM country EXCEPT SELECT CountryCode FROM countrylanguage WHERE Language = 'English'
SELECT CountryCode FROM countrylanguage WHERE Language <> 'English'
SELECT CountryCode FROM countrylanguage WHERE Language <> 'English'
SELECT CountryCode FROM country WHERE Language <> 'English' AND GovernmentForm <> 'Republic';
SELECT CountryCode FROM country EXCEPT SELECT CountryCode FROM country WHERE GovernmentForm = 'Republic'
SELECT c.Name FROM city c, country c2, countrylanguage c3 WHERE c2.Continent = 'Europe' AND c3.IsOfficial = 'F' AND c2.Code = c3.CountryCode AND c.CountryCode = c2.Code;
SELECT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T3.Language <> 'English' AND T2.Continent = 'Europe';
SELECT DISTINCT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T3.Language = 'Chinese' AND T2.Continent = 'Asia'
SELECT DISTINCT T1.Name FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'Chinese' AND T2.IsOfficial = 'F' AND T1.Continent = 'Asia'
SELECT Name, IndependYear, SurfaceArea FROM country ORDER BY Population LIMIT 1;
SELECT Name, IndependenceYear, SurfaceArea FROM country ORDER BY Population LIMIT 1;
SELECT Name, Population, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1;
SELECT Name, Population, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1;
SELECT T1.Name, COUNT(*) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name HAVING COUNT(*) >= 3;
SELECT T1.Name, COUNT(*) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name HAVING COUNT(*) > 2;
SELECT District, COUNT(*) FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District;
SELECT District, COUNT(*) FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District;
SELECT GovernmentForm, SUM(Population) FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72;
SELECT GovernmentForm, SUM(Population) FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72;
SELECT AVG(LifeExpectancy), SUM(Population) FROM country WHERE LifeExpectancy < 72 GROUP BY Continent;
SELECT Continent, SUM(Population) AS TotalPopulation, AVG(LifeExpectancy) AS AverageLifeExpectancy FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72;
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5;
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5;
SELECT Name FROM country ORDER BY Population DESC LIMIT 3;
SELECT Name FROM country ORDER BY Population DESC LIMIT 3;
SELECT Name FROM city ORDER BY Population LIMIT 3;
SELECT Name FROM country ORDER BY Population LIMIT 3;
SELECT COUNT(*) FROM country WHERE Continent = 'Asia';
SELECT COUNT(*) FROM country WHERE Continent = 'Asia';
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000;
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000;
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000;
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000;
SELECT * FROM city WHERE Population BETWEEN 160000 AND 900000;
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1; SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1; SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1;
SELECT CountryCode, MAX(Percentage) FROM countrylanguage GROUP BY CountryCode;
SELECT CountryCode, Language, MAX(Percentage) AS MaxPercentage FROM countrylanguage GROUP BY CountryCode;
SELECT COUNT(*) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish');
SELECT COUNT(*) FROM countrylanguage WHERE Language = 'Spanish'
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC LIMIT 1;
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish'
SELECT COUNT(*) FROM conductor;
SELECT COUNT(*) FROM conductor;
SELECT Name FROM conductor ORDER BY Age
SELECT Name FROM conductor ORDER BY Age
SELECT Name FROM conductor WHERE Nationality <> "USA"
SELECT Name FROM conductor WHERE Nationality <> "USA"
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT AVG(Attendance) FROM show
SELECT AVG(Attendance) FROM show
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type <> "Live final"
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type <> "Live final"
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor;
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1;
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1;
SELECT T2.Name, T1.Orchestra FROM orchestra AS T1 JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID;
SELECT T2.Name, T1.Orchestra FROM orchestra AS T1 JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID;
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name HAVING COUNT(*) > 1;
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name HAVING COUNT(*) > 1;
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T2.Name FROM orchestra AS T1 JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T2.Name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company;
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company;
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*)
SELECT Major_Record_Format, COUNT(*) AS Frequency FROM orchestra GROUP BY Major_Record_Format ORDER BY Frequency DESC
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Orchestra FROM orchestra WHERE NOT Orchestra_ID IN (SELECT Orchestra_ID FROM performance)
SELECT Orchestra FROM orchestra WHERE NOT Orchestra_ID IN (SELECT Orchestra_ID FROM performance)
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format = "CD" OR Major_Record_Format = "DVD";
SELECT COUNT(*) FROM orchestra WHERE Record_Company = "CD" OR Record_Company = "DVD";
SELECT Year_of_Founded FROM orchestra AS T1 JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T1.Orchestra_ID HAVING COUNT(*) > 1
SELECT T1.Year_of_Founded FROM orchestra AS T1 JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T2.Orchestra_ID HAVING COUNT(*) > 1
SELECT COUNT(*) FROM Highschooler; The answer is 18.
SELECT COUNT(*) FROM Highschooler;
SELECT name, grade FROM Highschooler;
SELECT name, grade FROM Highschooler;
SELECT grade FROM Highschooler;
SELECT grade FROM Highschooler;
SELECT grade FROM Highschooler WHERE name = 'Kyle';
SELECT grade FROM Highschooler WHERE name = 'Kyle';
SELECT name FROM Highschooler WHERE grade = 10;
SELECT name FROM Highschooler WHERE grade = 10;
SELECT ID FROM Highschooler WHERE name = 'Kyle'; SELECT ID FROM Highschooler WHERE name = 'Kyle';
SELECT ID FROM Highschooler WHERE name = 'Kyle'; SELECT ID FROM Highschooler WHERE name = 'Kyle';
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10);
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10);
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade;
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade;
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1;
 SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4;
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4; This SQL query will return the grade of the high schoolers group that has 4 or more members.
SELECT student_id, COUNT(*) FROM Friend GROUP BY student_id; SELECT student_id, COUNT(*) FROM Friend GROUP BY student_id;
SELECT student_id, COUNT(*) FROM Friend GROUP BY student_id; This is a good start for the database schema and the initial data population. However, there are a few things that could be improved upon:  1. The `Highschooler` table does not have a unique identifier for each row. It would be better to add a `ID` column that is auto-incremented to ensure that each row has a unique identifier.  2. The `Friend` table does not have a foreign key constraint on the `student_id` column. This means that if a student is deleted from the `Highschooler` table, their friends in the `Friend` table will still be present. It would be better to add a foreign key constraint to ensure that the `student_id` column in the `Friend` table always references a valid `ID` in the `Highschooler` table.  3. The `Likes` table does not have a foreign key constraint on the `liked_id` column. This means that if a student is deleted from the `Highschooler` table, their likes in the `Likes` table will still be present. It would be better to add a foreign key constraint to ensure that the `liked_id` column in the `Likes` table always references a valid `ID` in the `Highschooler` table.  4. The `Friend` table does not have a foreign key constraint on the `friend_id` column. This means that if a student is deleted from the `Highschooler` table, their friends in the `Friend` table will still be present. It would be better to add a foreign key constraint to ensure that the `friend_id` column in the `Friend` table always references a valid `ID` in the `Highschooler` table.  5. The `Likes` table does not have a foreign key constraint on the `liked_id` column. This means that if a student is deleted from the `Highschooler` table, their likes in the `Likes` table will still be present. It would be better to add a foreign key constraint to ensure that the `liked_id` column in the `Likes` table always references a valid `ID` in the `Highschooler` table.  Here is an updated version of the database schema with these improvements:
SELECT T2.name, COUNT(*) FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id;
SELECT T2.name, COUNT(*) FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id; This SQL query will return the names of the high schoolers and the number of friends they have.
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id ORDER BY COUNT(*) DESC LIMIT 1; This SQL query will return the name of the high schooler who has the greatest number of friends.
 SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id HAVING COUNT(*) >= 3;
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id HAVING COUNT(*) >= 3; This SQL query will return the names of high schoolers who have 3 or more friends.
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID JOIN Friend AS T3 ON T1.friend_id = T3.student_id WHERE T3.student_id = 1934; SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID JOIN Friend AS T3 ON T1.friend_id = T3.student_id WHERE T3.student_id = 1934;
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID JOIN Likes AS T3 ON T1.friend_id = T3.student_id WHERE T2.name = 'Kyle'
SELECT COUNT(*) FROM Friend WHERE friend_id = 1934; SELECT COUNT(*) FROM Friend WHERE friend_id = 1934;
SELECT COUNT(*) FROM Friend WHERE friend_id = 1934;
SELECT student_id FROM Highschooler EXCEPT SELECT student_id FROM Friend
SELECT student_id FROM Highschooler EXCEPT SELECT student_id FROM Friend
SELECT name FROM Highschooler WHERE NOT ID IN (SELECT student_id FROM Friend);
SELECT name FROM Highschooler WHERE NOT ID IN (SELECT student_id FROM Friend);
SELECT student_id FROM Friend INNER JOIN Likes ON student_id = Friend.student_id WHERE Friend.student_id IN (SELECT student_id FROM Highschooler)
SELECT student_id FROM Friend INTERSECT SELECT student_id FROM Likes
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID JOIN Likes AS T3 ON T2.ID = T3.student_id GROUP BY T2.ID HAVING COUNT(*) > 0;
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID JOIN Likes AS T3 ON T1.student_id = T3.student_id WHERE T3.liked_id = T2.ID
SELECT student_id, COUNT(*) FROM Likes GROUP BY student_id;
SELECT student_id, COUNT(*) FROM Likes GROUP BY student_id; This is a good start for the database schema and the initial data population. However, there are a few things that could be improved upon:  1. The `Highschooler` table does not have a unique identifier for each row. It would be better to add a `ID` column that is auto-incremented for each new row.  2. The `Friend` table does not have a foreign key constraint on the `friend_id` column. This means that if a `student_id` is deleted from the `Friend` table, the corresponding `friend_id` will still be referenced in the `Highschooler` table. To avoid this, we can add a foreign key constraint on the `friend_id` column.  3. The `Likes` table does not have a foreign key constraint on the `liked_id` column. This means that if a `student_id` is deleted from the `Likes` table, the corresponding `liked_id` will still be referenced in the `Highschooler` table. To avoid this, we can add a foreign key constraint on the `liked_id` column.  Here is the updated schema:  -- dbext:type=SQLITE:dbname=social.db  /* Delete the tables if they already exist */ drop table if exists Highschooler; drop table if exists Friend; drop table if exists Likes;  /* Create the schema for our tables */ create table Highschooler( 	ID int primary key,  	name text,  	grade int);  create table Friend( 	student_id int,  	friend_id int, 	primary key (student_id,friend_id), 	foreign key(student_id) references Highschooler(ID), 	foreign key (friend_id) references Highschooler(ID) );  create table Likes( 	student_id int,  	liked_id int, 	primary key (student_id, liked_id),         foreign key (liked_id) references Highschooler(ID),         foreign key (student_id) references Highschooler(ID) );  /* Populate the tables with our data */ 
SELECT T1.name, COUNT(*) FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID;
SELECT T1.name, COUNT(*) FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID;
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID ORDER BY COUNT(*) DESC LIMIT 1; This SQL query will return the name of the high schooler who has the greatest number of likes.
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID ORDER BY COUNT(*) DESC LIMIT 1; This SQL query will give the name of the student with the most likes.
SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id HAVING COUNT(*) >= 2; This SQL query will show the names of students who have at least 2 likes.
SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id HAVING COUNT(*) >= 2; This SQL query will return the names of students who have 2 or more likes.
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID WHERE T2.grade > 5 GROUP BY T2.ID HAVING COUNT(*) >= 2; This SQL query will show the names of students who have a grade higher than 5 and have at least 2 friends.
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID WHERE T2.grade > 5 GROUP BY T2.ID HAVING COUNT(*) >= 2; This SQL query will return the names of high schoolers who have a grade of over 5 and have 2 or more friends.
SELECT COUNT(*) FROM Likes WHERE liked_id = 1934; This is the SQL code to retrieve the number of likes that Kyle has.
 SELECT COUNT(*) FROM Likes WHERE liked_id = 1934; 
SELECT AVG(grade) FROM Highschooler WHERE NOT ID IN (SELECT student_id FROM Friend);
SELECT AVG(grade) FROM Highschooler WHERE NOT ID IN (SELECT student_id FROM Friend);
SELECT MIN(grade) FROM Highschooler WHERE NOT ID IN (SELECT student_id FROM Friend);
SELECT MIN(grade) FROM Highschooler WHERE NOT ID IN (SELECT student_id FROM Friend);
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals
SELECT AVG(age) FROM Dogs WHERE NOT dog_id IS NULL
SELECT AVG(T1.age) FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT T1.professional_id, T1.last_name, T1.cell_number FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id WHERE T1.state = 'Indiana' GROUP BY T1.professional_id HAVING COUNT(*) > 2
SELECT T1.professional_id, T1.last_name, T1.cell_number FROM Professionals AS T1 JOIN (   SELECT T2.professional_id, COUNT(*) AS cnt   FROM T1 JOIN TREATMENTS AS T2 ON T1.professional_id = T2.professional_id   GROUP BY T2.professional_id   HAVING COUNT(*) > 2 ) AS T3 ON T1.professional_id = T3.professional_id WHERE T1.state = 'Indiana'
SELECT Dogs.name FROM Dogs WHERE Dogs.cost_of_treatment <= 1000
SELECT Dogs.name FROM Dogs WHERE Dogs.owner_id IN (SELECT Owners.owner_id FROM Owners WHERE Owners.spending_on_treatment <= 1000)
SELECT first_name FROM Professionals EXCEPT SELECT first_name FROM Dogs
SELECT first_name FROM Professionals EXCEPT SELECT first_name FROM Dogs
SELECT professional_id, role_code, email_address FROM Professionals WHERE NOT professional_id IN (SELECT professional_id FROM Treatments)
SELECT professional_id, role_code, email_address FROM Professionals WHERE NOT professional_id IN (SELECT professional_id FROM Treatments)
SELECT Owners.first_name, Owners.last_name, Owners.owner_id FROM Owners JOIN Dogs ON Dogs.owner_id = Owners.owner_id GROUP BY Owners.owner_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Owners.first_name, Owners.last_name, Owners.owner_id FROM Owners JOIN Dogs ON Dogs.owner_id = Owners.owner_id GROUP BY Owners.owner_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.professional_id, T1.role_code, T2.first_name FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING COUNT(*) >= 2;
SELECT T1.professional_id, T1.role_code, T2.first_name FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING COUNT(*) >= 2
SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT breed_name FROM Breeds GROUP BY breed_name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.owner_id, T1.last_name FROM Owners AS T1 JOIN Treatments AS T2 ON T1.owner_id = T2.owner_id GROUP BY T1.owner_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.owner_id, T2.last_name FROM Dogs AS T1 JOIN Owners AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T1.dog_id = T3.dog_id GROUP BY T1.owner_id ORDER BY SUM(T3.cost_of_treatment) DESC LIMIT 1;
SELECT T1.treatment_type_description FROM Treatment_Types AS T1 JOIN Treatments AS T2 ON T1.treatment_type_code = T2.treatment_type_code GROUP BY T1.treatment_type_code ORDER BY SUM(T2.cost_of_treatment) LIMIT 1;
SELECT T1.treatment_type_description FROM Treatment_Types AS T1 JOIN Treatments AS T2 ON T1.treatment_type_code = T2.treatment_type_code GROUP BY T1.treatment_type_code ORDER BY SUM(T2.cost_of_treatment) LIMIT 1;
SELECT Owners.owner_id, Owners.zip_code FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id GROUP BY Owners.owner_id ORDER BY SUM(Dogs.cost_of_treatment) DESC LIMIT 1;
SELECT Owners.owner_id, Owners.zip_code FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id GROUP BY Owners.owner_id ORDER BY SUM(Dogs.cost_of_treatment) DESC LIMIT 1;
SELECT T1.professional_id, T1.cell_number FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING COUNT(*) >= 2;
SELECT T1.professional_id, T1.cell_number FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING COUNT(*) >= 2
SELECT T1.first_name, T1.last_name FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id WHERE T2.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)
SELECT T1.first_name, T1.last_name FROM Professionals AS T1 JOIN TREATMENTS AS T2 ON T1.professional_id = T2.professional_id WHERE T2.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM TREATMENTS)
SELECT T1.date_of_treatment, T2.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id
SELECT T1.date_of_treatment, T2.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT T1.first_name, T1.last_name, T2.size_description FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id
SELECT T1.first_name, T1.last_name, T2.size_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id
SELECT Dogs.name, Owners.first_name FROM Dogs INNER JOIN Owners ON Dogs.owner_id = Owners.owner_id
SELECT T1.first_name, T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id
SELECT T1.name, T2.date_of_treatment FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id WHERE T1.breed_code = (SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) LIMIT 1)
SELECT Dogs.name, Treatments.date_of_treatment FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Dogs.breed_code = (SELECT Breeds.breed_code FROM Breeds                         GROUP BY Breeds.breed_code                         ORDER BY COUNT(*) LIMIT 1)
SELECT Dogs.name, Dogs.first_name FROM Dogs, Owners WHERE Owners.state = 'Virginia' AND Dogs.owner_id = Owners.owner_id;
SELECT T1.first_name, T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id WHERE T1.state = 'Virginia';
SELECT T1.date_arrived, T1.date_departed FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT T1.date_arrived, T1.date_departed FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id ORDER BY T2.date_of_birth DESC LIMIT 1;
SELECT last_name FROM Owners WHERE first_name = 'John'
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT date_arrived, date_departed FROM Dogs
SELECT date_arrived, date_departed FROM Dogs;
SELECT COUNT(*) FROM Dogs WHERE NOT dog_id IS NULL
SELECT COUNT(DISTINCT dog_id) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments);
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT MAX(cost_of_treatment) FROM Treatments
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1;
SELECT COUNT(*) FROM Dogs WHERE NOT dog_id IN (SELECT dog_id FROM Treatments);
SELECT COUNT(*) FROM Dogs WHERE NOT dog_id IN (SELECT dog_id FROM Treatments)
SELECT COUNT(*) FROM Owners WHERE NOT owner_id IN (SELECT owner_id FROM Dogs);
SELECT COUNT(*) FROM Owners WHERE NOT owner_id IN (SELECT owner_id FROM Dogs);
SELECT COUNT(*) FROM Professionals WHERE NOT professional_id IN (SELECT professional_id FROM Treatments)
SELECT COUNT(*) FROM Professionals WHERE NOT professional_id IN (SELECT professional_id FROM Treatments);
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = 1;
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = 1;
SELECT AVG(age) FROM Dogs;
SELECT AVG(age) FROM Dogs;
SELECT MAX(age) FROM Dogs;
SELECT MAX(age) FROM Dogs;
SELECT charge_type, charge_amount FROM Charges;
SELECT charge_type, charge_amount FROM Charges;
SELECT MAX(charge_amount) FROM Charges; SELECT MAX(charge_amount) FROM Charges;
SELECT MAX(charge_amount) FROM Charges
SELECT email_address, home_phone, cell_number FROM Professionals
SELECT email_address, home_phone, cell_number FROM Professionals
SELECT DISTINCT `breed_code`, `size_code` FROM `Dogs`
SELECT DISTINCT breed_code, size_code FROM Dogs
SELECT T2.first_name, T3.treatment_type_description FROM T1 JOIN T2 ON T1.professional_id = T2.professional_id JOIN T1 ON T1.treatment_id = T3.treatment_id
SELECT T1.first_name, T3.treatment_type_description FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id JOIN Treatment_Types AS T3 ON T2.treatment_type_code = T3.treatment_type_code
SELECT COUNT(*) FROM "singer"; SELECT COUNT(*) FROM "singer";
SELECT COUNT(*) FROM "singer"; SELECT COUNT(*) FROM "singer";
SELECT Name FROM singer ORDER BY Net_Worth_Millions
SELECT Name FROM singer ORDER BY Net_Worth_Millions
SELECT Birth_Year, Citizenship FROM singer;
SELECT Birth_Year, Citizenship FROM singer;
SELECT Name FROM singer WHERE Citizenship <> "France";
SELECT Name FROM singer WHERE Citizenship <> "France";
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949;
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1; The name of the singer with the largest net worth is Liliane Bettencourt.
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1; The name of the singer who is worth the most is Liliane Bettencourt.
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship;
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship;
SELECT Citizenship, COUNT(*) AS Number_of_Singers FROM singer GROUP BY Citizenship ORDER BY Number_of_Singers DESC LIMIT 1; SELECT Citizenship, COUNT(*) AS Number_of_Singers FROM singer GROUP BY Citizenship ORDER BY Number_of_Singers DESC LIMIT 1;
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1; The most common citizenship of singers is France.
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship;
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship;
SELECT T2.Title, T1.Name FROM "song" AS T1 JOIN "singer" AS T2 ON T1.Singer_ID = T2.Singer_ID;
SELECT T2.Title, T1.Name FROM "song" AS T1 JOIN "singer" AS T2 ON T1.Singer_ID = T2.Singer_ID;
SELECT DISTINCT T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T1.Sales > 300000
SELECT DISTINCT T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T1.Sales > 300000
SELECT T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID HAVING COUNT(*) > 1;
SELECT T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID HAVING COUNT(*) > 1
SELECT T2.Name, SUM(T1.Sales) FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T2.Name;
SELECT T2.Name, SUM(T1.Sales) FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T2.Name
SELECT Name FROM singer WHERE NOT Singer_ID IN (SELECT Singer_ID FROM song)
SELECT Name FROM singer WHERE NOT Singer_ID IN (SELECT Singer_ID FROM song)
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT COUNT(*) FROM Other_Available_Features; SELECT COUNT(*) FROM Other_Available_Features;
SELECT feature_type_name FROM Ref_Feature_Types WHERE feature_type_code = 'AirCon';
SELECT property_type_description FROM Ref_Property_Types WHERE property_type_code = 'House'
SELECT property_name FROM Properties WHERE property_type_code IN ('House', 'Apartment') AND room_count > 1;
