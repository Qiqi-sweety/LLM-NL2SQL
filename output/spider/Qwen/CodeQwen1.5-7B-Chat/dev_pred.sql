SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT T1.Name, T1.Country, T1.Age FROM singer AS T1 ORDER BY T1.Age DESC
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = "France";
SELECT AVG(age), MIN(age), MAX(age) FROM singer WHERE country = 'France'
SELECT T3.Name ,  T3.Song_release_year FROM singer_in_concert AS T1 JOIN singer AS T3 ON T1.Singer_ID  =  T3.Singer_ID JOIN concert AS T2 ON T1.concert_ID  =  T2.concert_ID ORDER BY T3.Age ASC LIMIT 1
SELECT T2.Name ,  T2.Song_release_year FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID ORDER BY T2.Age ASC LIMIT 1
SELECT DISTINCT T2.Country FROM singer AS T1 INNER JOIN singer_in_concert AS T3 ON T1.Singer_ID = T3.Singer_ID INNER JOIN concert AS T4 ON T3.concert_ID = T4.concert_ID INNER JOIN stadium AS T5 ON T4.Stadium_ID = T5.Stadium_ID WHERE T1.Age > 20
SELECT DISTINCT T2.Country FROM singer AS T1 INNER JOIN stadium AS T3 ON T1.Stadium_ID = T3.Stadium_ID INNER JOIN singer_in_concert AS T4 ON T1.Singer_ID = T4.Singer_ID INNER JOIN concert AS T5 ON T5.concert_ID = T4.concert_ID WHERE T1.Age > 20
SELECT Country, COUNT(Singer_ID) FROM singer GROUP BY Country
SELECT Country, COUNT(*) FROM singer GROUP BY Country
SELECT S.Song_Name  FROM singer AS S  WHERE S.Age > (SELECT AVG(Age) FROM singer)
SELECT t2.Song_Name FROM singer AS t1 JOIN singer_in_concert AS t3 ON t1.Singer_ID = t3.Singer_ID JOIN concert AS t4 ON t3.concert_ID = t4.concert_ID WHERE t1.Age > ( SELECT AVG(Age) FROM singer )
SELECT location ,  name FROM stadium WHERE capacity BETWEEN 5000 AND 10000
SELECT LOCATION ,  NAME FROM stadium WHERE capacity BETWEEN 5000 AND 10000
SELECT MAX(Capacity) ,  AVG(Capacity) FROM stadium
SELECT avg(Capacity) ,  max(Capacity) FROM stadium
SELECT T1.Name, T1.Capacity FROM stadium AS T1 ORDER BY T1.Average DESC LIMIT 1
SELECT T.name ,  T.capacity FROM stadium AS T ORDER BY T.average DESC LIMIT 1
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015')
SELECT COUNT(*) FROM concert WHERE YEAR IN ('2014', '2015')
SELECT s.Name, COUNT(c.concert_ID)  FROM stadium s  JOIN concert c ON s.Stadium_ID = c.Stadium_ID  GROUP BY s.Stadium_ID
SELECT T1.name ,  COUNT(*) FROM stadium AS T1 JOIN concert AS T2 ON T1.stadium_id = T2.stadium_id GROUP BY T2.stadium_id
SELECT T2.Name ,  T2.Capacity FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID  =  T2.Stadium_ID WHERE YEAR  >=  2014 GROUP BY T2.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.Name, T3.Capacity FROM singer_in_concert AS T1  INNER JOIN concert AS T2 ON T1.concert_ID = T2.concert_ID  INNER JOIN stadium AS T3 ON T2.Stadium_ID = T3.Stadium_ID  WHERE T2.Year > 2013  GROUP BY T3.Name  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT location FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT DISTINCT Stadium_ID FROM concert)
SELECT Country FROM singer WHERE Age > 40 INTERSECT SELECT Country FROM singer WHERE Age < 30
SELECT DISTINCT T2.Name FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year != '2014'
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT DISTINCT Stadium_ID FROM concert WHERE YEAR = '2014')
SELECT c.concert_Name, c.Theme, COUNT(si.Singer_ID)  FROM concert c  JOIN singer_in_concert si ON c.concert_ID = si.concert_ID  GROUP BY c.concert_Name, c.Theme
SELECT T2.concert_Name ,  T2.Theme ,  COUNT(T1.Singer_ID) FROM singer_in_concert AS T1 JOIN concert AS T2 ON T1.concert_ID  =  T2.concert_ID GROUP BY T1.concert_ID
SELECT T1.Name, count(*) FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name
SELECT T3.Name ,  count(*) FROM singer_in_concert AS T1 JOIN concert AS T2 ON T1.concert_ID  =  T2.concert_ID JOIN singer AS T3 ON T3.Singer_ID  =  T1.Singer_ID GROUP BY T3.Name
SELECT T2.name FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.singer_id  =  T2.singer_id JOIN concert AS T3 ON T1.concert_id  =  T3.concert_id WHERE T3.year  =  2014
SELECT DISTINCT SINGER_NAME FROM singer WHERE Singer_ID IN (SELECT Singer_ID FROM singer_in_concert WHERE concert_ID IN (SELECT concert_ID FROM concert WHERE Year = 2014))
SELECT T2.Name, T2.Country FROM singer AS T2 JOIN singer_in_concert AS T1 ON T1.Singer_ID = T2.Singer_ID JOIN concert AS T3 ON T1.concert_ID = T3.concert_ID WHERE T2.Song_Name LIKE '%Hey%'
SELECT DISTINCT T1.Name, T1.Country FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN Concert AS T3 ON T2.concert_ID = T3.concert_ID WHERE T1.Song_Name LIKE '%Hey%'
SELECT T2.Name ,  T2.Location FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID  =  T2.Stadium_ID WHERE T1.Year IN (2014, 2015) GROUP BY T2.Name HAVING COUNT(DISTINCT T1.Year) = 2
SELECT T1.Name, T1.Location FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID  =  T2.Stadium_ID WHERE T2.Year  =  2014 INTERSECT SELECT T1.Name, T1.Location FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID  =  T2.Stadium_ID WHERE T2.Year  =  2015
SELECT count(*) FROM concert WHERE stadium_id = ( SELECT stadium_id FROM stadium ORDER BY capacity DESC LIMIT 1 )
SELECT count(*) FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_ID  =  T2.stadium_ID WHERE T2.capacity = (SELECT max(capacity) FROM stadium)
SELECT COUNT(*) FROM Pets WHERE weight > 10
SELECT COUNT(*) FROM Pets WHERE weight > 10;
SELECT weight FROM Pets WHERE PetType = 'dog' ORDER BY pet_age LIMIT 1
SELECT weight FROM Pets ORDER BY pet_age ASC LIMIT 1;
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType;
SELECT PetType, MAX(weight) as MaxWeight FROM Pets GROUP BY PetType
SELECT COUNT(*) FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE age > 20);
SELECT COUNT(*) FROM Student WHERE age > 20 INTERSECT SELECT COUNT(*) FROM Has_Pet
SELECT COUNT(*) FROM Pets AS T1 JOIN Has_Pet AS T2 ON T1.PetID = T2.PetID JOIN Student AS T3 ON T3.StuID = T2.StuID WHERE T1.PetType = 'dog' AND T3.Sex = 'F'
SELECT COUNT(*) FROM Pets WHERE PetID IN (SELECT PetID FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE Sex = 'F')) AND PetType = 'dog'
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT COUNT(DISTINCT PetType) FROM Pets;
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID  =  T2.StuID JOIN Pets AS T3 ON T2.PetID  =  T3.PetID WHERE T3.PetType IN ('cat', 'dog')
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType IN ('cat', 'dog')))
SELECT T2.Fname FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID  =  T2.StuID JOIN Pets AS T3 ON T1.PetID  =  T3.PetID WHERE T3.PetType  =  'cat' INTERSECT SELECT T2.Fname FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID  =  T2.StuID JOIN Pets AS T3 ON T1.PetID  =  T3.PetID WHERE T3.PetType  =  'dog'
SELECT DISTINCT T1.fname  FROM Student AS T1  JOIN Has_Pet AS T2 ON T1.stuid = T2.stuid  JOIN Pets AS T3 ON T2.petid = T3.petid  WHERE T3.pettype IN ('cat', 'dog')  GROUP BY T1.fname  HAVING COUNT(DISTINCT T3.pettype) = 2
SELECT major, age FROM Student WHERE StuID NOT IN (SELECT T1.StuID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat')
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT Has_Pet.StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat');
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT T1.Fname, T1.Age FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' EXCEPT SELECT T1.Fname, T1.Age FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog'
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'dog')) AND StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1;
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT P.PetID, P.weight FROM Pets AS P WHERE P.pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetType, AVG(pet_age), MAX(pet_age) FROM Pets GROUP BY PetType
SELECT AVG(pet_age), MAX(pet_age), PetType FROM Pets GROUP BY PetType;
SELECT pettype, AVG(weight) FROM pets GROUP BY pettype
SELECT pet_type, AVG(weight) FROM Pets GROUP BY pet_type
SELECT Fname, Age FROM STUDENT WHERE StuID IN (SELECT StuID FROM HAS_PET);
SELECT DISTINCT t1.fname, t1.age FROM STUDENT AS t1 INNER JOIN HAS_PET AS t2 ON t1.stuid = t2.stuid
SELECT Has_Pet.PetID FROM Has_Pet INNER JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.LName = 'Smith'
SELECT T2.PetID FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID INNER JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.LName = 'Smith'
SELECT StuID, COUNT(*) AS Number_of_Pets FROM Has_Pet GROUP BY StuID
SELECT StuID, COUNT(*) as NumOfPets FROM Has_Pet GROUP BY StuID
SELECT Fname, Sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet GROUP BY StuID HAVING COUNT(*) > 1)
SELECT Fname, Sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet GROUP BY StuID HAVING COUNT(*) > 1)
SELECT Lname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' AND pet_age = 3))
SELECT Lname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE pet_age = 3 AND PetType = 'cat'))
SELECT AVG(age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT count(*) FROM continents
SELECT COUNT(*) FROM continents
SELECT C.ContId, C.Continent, COUNT(CountryName) FROM countries AS T1 JOIN continents AS C ON T1.Continent = C.ContId GROUP BY C.ContId
SELECT T1.ContId ,  T1.Continent ,  COUNT(*) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId  =  T2.Continent GROUP BY T1.ContId
SELECT COUNT(CountryName) FROM countries
SELECT COUNT(*) FROM countries
SELECT car_makers.FullName ,  car_makers.Id ,  COUNT(*)  FROM car_makers  JOIN model_list ON car_makers.Id  =  model_list.Maker  GROUP BY car_makers.Id
SELECT T3.Id, T3.Maker, T3.FullName, COUNT(T1.Model)  FROM model_list AS T1  JOIN car_makers AS T2 ON T1.Maker = T2.Id  JOIN model_list AS T3 ON T2.Id = T3.Id
SELECT model FROM model_list ORDER BY Horsepower ASC LIMIT 1
SELECT T1.Model FROM model_list AS T1 JOIN cars_data AS T2 ON T1.ModelId = T2.Id ORDER BY CAST(REPLACE(T2.Horsepower, ',', '') AS INTEGER) ASC LIMIT 1
SELECT T1.Model FROM model_list AS T1 JOIN cars_data AS T2 ON T1.ModelId = T2.Id ORDER BY T2.weight LIMIT 1
SELECT Model FROM cars_data WHERE Weight &lt; (SELECT avg(Weight) FROM cars_data)
SELECT DISTINCT T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN cars_data AS T3 ON T2.Model = T3.Id WHERE T3.Year = 1970
SELECT T3.Maker FROM cars_data AS T1 JOIN car_names AS T2 ON T1.MakeId = T2.MakeId JOIN car_makers AS T3 ON T2.Make = T3.Maker WHERE T1.Year = 1970
SELECT Maker, MIN(Year) FROM cars_data GROUP BY Maker
SELECT T2.FullName, MIN(T3.Year) FROM cars_data AS T1 JOIN model_list AS T2 ON T2.Model = T1.Id JOIN car_makers AS T3 ON T3.Id = T2.Maker
SELECT DISTINCT M.Model FROM model_list AS M INNER JOIN car_names AS C ON M.Model = C.Model WHERE C.Year > 1980
SELECT DISTINCT t3.Model FROM model_list AS t1 JOIN car_names AS t2 ON t1.Model  =  t2.Model JOIN cars_data AS t3 ON t2.MakeId  =  t3.Id WHERE t3.Year  >  1980
SELECT C.Continent, COUNT(DISTINCT M.Maker)  FROM continents AS C  JOIN countries AS Co ON C.ContId = Co.Continent  JOIN car_makers AS M ON Co.CountryId = M.Country  GROUP BY C.Continent
SELECT T1.Continent, COUNT(*) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId  =  T2.Continent JOIN car_makers AS T3 ON T2.CountryId  =  T3.Country GROUP BY T1.Continent
SELECT CountryName FROM countries ORDER BY (SELECT COUNT(*) FROM car_makers WHERE Country = countries.CountryId) DESC LIMIT 1
SELECT T3.CountryName FROM model_list AS T1  JOIN car_makers AS T2 ON T1.Maker = T2.Id  JOIN countries AS T3 ON T2.Country = T3.CountryId  GROUP BY T3.CountryId  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT T3.FullName, COUNT(*) FROM model_list AS T1  JOIN car_makers AS T3 ON T1.Maker = T3.Id  JOIN cars_data AS T2 ON T1.Model = T2.Id  GROUP BY T3.FullName
SELECT T1.id, T1.FullName FROM car_makers AS T1 JOIN model_list AS T2 ON T1.id = T2.Maker
SELECT Accelerate FROM car_names WHERE Make = 'amc hornet sportabout' AND Model = 'sw'
SELECT accelerate FROM cars_data WHERE Id = (SELECT MakeId FROM car_names WHERE Make = 'amc' AND Model = 'hornet sportabout (sw)')
SELECT COUNT(*) FROM car_makers WHERE Country = (SELECT CountryId FROM countries WHERE CountryName = 'France')
SELECT count(*) FROM car_makers WHERE Country = (SELECT CountryId FROM countries WHERE CountryName = 'France')
SELECT COUNT(*) FROM model_list WHERE Country = (SELECT CountryId FROM countries WHERE CountryName = 'USA')
SELECT COUNT(T1.Model) FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker  =  T2.Id WHERE T2.Country  =  "United States"
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT AVG(T2.MPG) FROM model_list AS T1 JOIN cars_data AS T2 ON T1.Model = T2.Id WHERE T1.Id IN (SELECT DISTINCT MakeId FROM car_names WHERE Model IN (SELECT Model FROM model_list WHERE Cylinders = 4))
SELECT T1.Weight FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.Model INNER JOIN car_makers AS T3 ON T2.Maker = T3.Id WHERE T1.Cylinders = 8 AND T1.Year = 1974 ORDER BY T1.Weight ASC LIMIT 1
SELECT MIN(weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT Maker, Model FROM car_makers
SELECT car_makers.Maker, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker
SELECT DISTINCT T3.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country JOIN continents AS T3 ON T1.Continent = T3.ContId
SELECT CountryName, CountryId FROM countries WHERE CountryId IN ( SELECT Country FROM car_makers GROUP BY Country )
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year
SELECT Year, AVG(Weight) AS average_weight, AVG(Year) AS average_year FROM cars_data GROUP BY Year
SELECT T3.CountryName FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id JOIN countries AS T3 ON T3.CountryId = T2.Country WHERE T3.Continent = 2 GROUP BY T3.CountryName HAVING COUNT(DISTINCT T2.Maker) >= 3
SELECT T3.CountryName FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker  =  T2.Id JOIN countries AS T3 ON T2.Country  =  T3.CountryId WHERE T3.Continent  =  2 GROUP BY T3.CountryName HAVING COUNT(*)  >=  3
SELECT T3.Maker, T2.Model FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.ModelId JOIN car_makers AS T3 ON T2.Maker = T3.Id WHERE T1.Cylinders = 3 ORDER BY T1.Horsepower DESC LIMIT 1
SELECT T1.Make, T1.Model FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id INNER JOIN model_list AS T3 ON T3.Model = T1.Model WHERE T2.Cylinders = 3 ORDER BY T2.Horsepower DESC LIMIT 1
SELECT model FROM model_list WHERE ModelId IN (SELECT MakeId FROM cars_data ORDER BY MPG DESC LIMIT 1)
SELECT Model FROM cars_data ORDER BY MPG DESC LIMIT 1
SELECT AVG(T2.Horsepower) FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Year < 1980
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980;
SELECT AVG(T1.Edispl) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Model = 'volvo'
SELECT AVG(T1.Edispl) FROM cars_data AS T1 JOIN car_makers AS T2 ON T1.Id = T2.Id WHERE T2.Maker = 'volvo'
SELECT cylinders, max(accelerate) FROM cars_data GROUP BY cylinders
SELECT MAX(Accelerate) ,  Cylinders FROM cars_data GROUP BY Cylinders
SELECT Model FROM model_list GROUP BY Model ORDER BY COUNT(Model) DESC LIMIT 1
SELECT T.Model ,  COUNT(DISTINCT T1.Model) AS num_version FROM car_names AS T1 JOIN cars_data AS T2 ON T2.Id = T1.MakeId JOIN model_list AS T3 ON T3.Model = T1.Model GROUP BY T1.Model ORDER BY num_version DESC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT count(*) FROM cars_data WHERE cylinders  >  4
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT count(*) FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Year = 1980
SELECT COUNT(model_list.Model) FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.FullName = 'American Motor Company'
SELECT COUNT(DISTINCT T1.Model) FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id WHERE T2.Maker = 'American Motor Company';
SELECT T1.FullName, T1.Id FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T2.Maker HAVING COUNT(*)  >  3
SELECT Maker, Id FROM car_makers WHERE Id IN ( SELECT Maker FROM model_list GROUP BY Maker HAVING count(*)  >  3 );
SELECT DISTINCT T1.Model FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T2.Id = T1.Maker INNER JOIN cars_data AS T3 ON T3.Id = T1.Model WHERE T2.FullName = 'General Motors' OR T3.Weight > 3500
SELECT DISTINCT Model FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Maker = 'General Motors') OR Weight > 3500
SELECT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 UNION SELECT DISTINCT Year FROM cars_data WHERE Weight > 3000
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT T2.Cylinders FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T1.Model = 'volvo' ORDER BY T2.Accelerate ASC LIMIT 1
SELECT C1.Cylinders FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.Model JOIN car_makers AS T3 ON T2.Maker = T3.Id JOIN countries AS T4 ON T3.Country = T4.CountryId WHERE T3.Maker = 'volvo' AND T1.Accelerate = (SELECT MIN(Accelerate) FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.Model JOIN car_makers AS T3 ON T2.Maker = T3.Id JOIN countries AS T4 ON T3.Country = T4.CountryId WHERE T3.Maker = 'volvo')
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Horsepower) FROM cars_data)
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT Max(Horsepower) FROM cars_data)
SELECT COUNT(DISTINCT T2.Country) FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T1.Country HAVING COUNT(T1.Id) > 2
SELECT COUNT(C) FROM (SELECT Continent, COUNT(*) AS C FROM countries INNER JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY Continent HAVING COUNT(*) > 2)
SELECT count(*) FROM cars_data WHERE cylinders  >  6
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT Model FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE Continent = (SELECT ContId FROM continents WHERE Continent = 'america')) AND Maker IN (SELECT Maker FROM cars_data WHERE Cylinders = 4) ORDER BY Horsepower DESC LIMIT 1
SELECT T2.Model FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.Model WHERE T1.Cylinders = 4 ORDER BY T1.Horsepower DESC LIMIT 1
SELECT T1.MakeId, T1.Make FROM car_names AS T1 INNER JOIN model_list AS T2 ON T1.Model = T2.Model INNER JOIN cars_data AS T3 ON T1.MakeId = T3.Id WHERE T3.Horsepower > ( SELECT MAX(Horsepower) FROM cars_data ) AND T3.Cylinders <= 3
SELECT T1.MakeId, T1.Make FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Cylinders < 4
SELECT T2.Model, T2.Make FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN cars_data AS T3 ON T2.Model = T3.Make WHERE T3.Cylinders = 8 AND T3.Year < 1980 ORDER BY T3.MPG DESC LIMIT 1
SELECT MAX(cars_data.MPG) FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId INNER JOIN model_list ON car_names.Model = model_list.Model INNER JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Cylinders = 8 OR cars_data.Year < 1980
SELECT t3.Model FROM cars_data AS t1  JOIN car_names AS t2 ON t1.Id = t2.MakeId  JOIN model_list AS t3 ON t2.Model = t3.Model  JOIN car_makers AS t4 ON t3.Maker = t4.Id  WHERE t1.Weight < 3500 AND t4.Maker != 'Ford Motor Company'
SELECT T3.Model FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id JOIN cars_data AS T3 ON T1.ModelId = T3.Id WHERE T3.Weight < 3500 AND T2.Maker != 'ford'
SELECT CountryName FROM countries WHERE Continent NOT IN (SELECT Continent FROM car_makers)
SELECT CountryName FROM countries WHERE NOT EXISTS (SELECT * FROM car_makers WHERE car_makers.Country = countries.CountryId)
SELECT T2.Id, T2.Maker FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T2.Id HAVING COUNT(T1.ModelId) > 1 OR COUNT(T2.Country) > 3
SELECT DISTINCT T1.Id, T1.Maker FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Maker HAVING COUNT(*) >= 2 AND SUM(T2.Model) > 3
SELECT countries.CountryName, countries.CountryId FROM countries  JOIN car_makers ON countries.CountryId = car_makers.Country  GROUP BY countries.CountryId  HAVING COUNT(DISTINCT car_makers.Id) > 3  UNION  SELECT countries.CountryName, countries.CountryId FROM countries  JOIN model_list ON countries.CountryId = model_list.Maker  WHERE model_list.Model = 'fiat'
SELECT CountryId ,  CountryName FROM countries WHERE Continent IN (SELECT ContId FROM continents) GROUP BY CountryName HAVING COUNT(CountryName)  >  3 OR CountryName = 'fiat'
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways';
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Airline, Abbreviation  FROM airlines  WHERE Country = 'USA' 
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony';
SELECT COUNT(*) FROM airlines;
SELECT COUNT(*) FROM airlines
SELECT count(*) FROM airports
SELECT count(*) FROM airports
SELECT COUNT(*) FROM flights
SELECT COUNT(*) FROM flights;
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA';
SELECT count(*) FROM airlines WHERE Country  =  'USA'
SELECT city, country FROM airports WHERE AirportCode = 'ALON'
SELECT City, Country FROM airports WHERE AirportCode = 'ALQ';
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT count(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT count(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT count(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen'
SELECT count(*) FROM flights WHERE SourceAirport = (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT count(*) FROM flights AS T1 JOIN airports AS T2 ON T1.destairport = T2.airportcode WHERE T2.city = 'Aberdeen'
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode JOIN airports AS T3 ON T1.DestAirport = T3.AirportCode WHERE T2.City = 'Aberdeen' AND T3.City = 'Ashley';
SELECT COUNT(*) FROM flights WHERE SourceAirport = (SELECT AirportCode FROM airports WHERE City = 'Aberdeen') AND DestAirport = (SELECT AirportCode FROM airports WHERE City = 'Ashley')
SELECT count(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T2.Airline = 'JetBlue Airways'
SELECT COUNT(*) FROM flights INNER JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'Jetblue Airways'
SELECT COUNT(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid WHERE T2.Airline  =  'United Airlines' AND T1.DestAirport  =  'ASY'
SELECT count(*) FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline JOIN airports AS T3 ON T2.DestAirport = T3.AirportCode WHERE T3.AirportCode = 'ASY' AND T1.Airline = 'United Airlines'
SELECT COUNT(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid JOIN airports AS T3 ON T1.SourceAirport = T3.AirportCode WHERE T2.Airline = 'United Airlines' AND T3.AirportCode = 'AHD'
SELECT COUNT(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid JOIN airports AS T3 ON T1.SourceAirport = T3.AirportCode WHERE T2.Airline = 'United Airlines' AND T3.AirportCode = 'AHD'
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode JOIN airlines AS T3 ON T1.Airline = T3.uid WHERE T2.City = 'Aberdeen' AND T3.Airline = 'United Airlines'
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode JOIN airlines AS T3 ON T1.Airline = T3.uid WHERE T2.City = 'Aberdeen' AND T3.Airline = 'United Airlines'
SELECT City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport GROUP BY City ORDER BY count(*) DESC LIMIT 1
SELECT a2.City FROM airports a1 INNER JOIN flights f ON a1.AirportCode = f.DestAirport INNER JOIN airports a2 ON f.SourceAirport = a2.AirportCode GROUP BY a2.City ORDER BY COUNT(f.FlightNo) DESC LIMIT 1
SELECT City FROM airports WHERE AirportCode IN (SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1)
SELECT City FROM airports GROUP BY City ORDER BY COUNT(*) DESC LIMIT 1
SELECT DestAirport  FROM flights  GROUP BY DestAirport  ORDER BY COUNT(FlightNo) DESC  LIMIT 1
SELECT T1.AirportCode FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.SourceAirport OR T1.AirportCode  =  T2.DestAirport GROUP BY T1.AirportCode ORDER BY COUNT(*) DESC LIMIT 1;
SELECT AirportCode FROM flights GROUP BY AirportCode ORDER BY COUNT(*) ASC LIMIT 1
SELECT AirportCode FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) ASC LIMIT 1
SELECT Airline FROM flights GROUP BY Airline ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid GROUP BY T1.Airline ORDER BY count(*) DESC LIMIT 1
SELECT a.Abbreviation, a.Country FROM airlines a JOIN flights f ON a.uid = f.Airline GROUP BY a.uid ORDER BY COUNT(*) ASC LIMIT 1
SELECT T2.Abbreviation, T2.Country FROM ( SELECT SourceAirport, COUNT(*) AS cnt FROM flights GROUP BY SourceAirport ORDER BY cnt ASC LIMIT 1 ) T1 INNER JOIN airlines T2 ON T1.SourceAirport = T2.uid
SELECT T2.Airline FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.AirportCode = 'AHD'
SELECT T1.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid WHERE T1.SourceAirport  =  'AHD'
SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.DestAirport = 'AHD'
 SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'; 
SELECT DISTINCT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport = 'APG' INTERSECT SELECT DISTINCT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.DestAirport = 'CVO'
SELECT DISTINCT airlines.Airline FROM airlines JOIN flights ON airlines.uid  =  flights.Airline WHERE flights.SourceAirport  =  'APG' INTERSECT SELECT DISTINCT airlines.Airline FROM airlines JOIN flights ON airlines.uid  =  flights.Airline WHERE flights.SourceAirport  =  'CVO'
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T2.SourceAirport  =  'CVO' INTERSECT SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T2.SourceAirport  <>  'APG'
SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.SourceAirport = 'CVO' EXCEPT SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.SourceAirport = 'APG'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T2.Airline HAVING COUNT(*) >= 10
SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(*)  >=  10
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline GROUP BY T2.Airline HAVING COUNT(*)  <  200
SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(*) < 200
SELECT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE Airline IN (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT DISTINCT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = (SELECT AirportCode FROM airports WHERE AirportName = 'APG')
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT DISTINCT T2.FlightNo FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen'
SELECT t1.FlightNo FROM flights AS t1 JOIN airports AS t2 ON t1.DestAirport = t2.AirportCode WHERE t2.City = 'Aberdeen'
SELECT FlightNo FROM flights WHERE DestAirport = (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT COUNT(flights.FlightNo) FROM flights INNER JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City IN ('Aberdeen', 'Abilene')
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City IN ('Aberdeen', 'Abilene') UNION SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City IN ('Aberdeen', 'Abilene');
SELECT T2.AirportName FROM airports AS T1 LEFT JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport LEFT JOIN flights AS T3 ON T1.AirportCode = T3.DestAirport WHERE T2.Airline IS NULL AND T3.Airline IS NULL
SELECT AirportCode FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) OR AirportCode NOT IN (SELECT DestAirport FROM flights)
SELECT COUNT(*) FROM employee
SELECT count(*) FROM employee
SELECT Name FROM employee ORDER BY Age ASC;
SELECT Name, Age FROM employee ORDER BY Age ASC
SELECT City ,  COUNT(*) FROM employee GROUP BY City
SELECT City ,  COUNT(Name) FROM employee GROUP BY City
SELECT City FROM employee WHERE Age  <  30 GROUP BY City HAVING COUNT(*)  >  1
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*)  > 1
SELECT Location, COUNT(*) FROM shop GROUP BY Location
SELECT location ,  COUNT(*) FROM shop GROUP BY location
SELECT T1.manager_name ,  T1.district FROM shop AS T1 JOIN hiring AS T2 ON T1.shop_id  =  T2.shop_id WHERE T1.Number_products  =  (SELECT max(number_products) FROM shop)
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1
SELECT MIN(Number_products) ,  MAX(Number_products) FROM shop
SELECT MIN(Number_products) ,  MAX(Number_products) FROM shop
SELECT T1.Name ,  T1.Location ,  T1.District FROM shop AS T1 ORDER BY T1.Number_products DESC
SELECT T1.Name, T1.Location, T1.District FROM shop AS T1 INNER JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID ORDER BY T1.Number_products DESC
SELECT Name FROM shop WHERE Number_products  >  (SELECT avg(Number_products) FROM shop)
SELECT Name FROM shop WHERE Number_products > ( SELECT AVG(Number_products) FROM shop )
SELECT T1.Name FROM employee AS T1 JOIN hiring AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Employee_ID ORDER BY COUNT(T2.Employee_ID) DESC LIMIT 1
SELECT T1.Name FROM employee AS T1 INNER JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Employee_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM EMPLOYEE AS T1 JOIN evaluation AS T2 ON T1.Employee_ID  =  T2.Employee_ID ORDER BY T2.bonus DESC LIMIT 1
SELECT Name FROM employee WHERE Employee_ID = (SELECT Employee_ID FROM evaluation ORDER BY Bonus DESC LIMIT 1)
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT T2.Name FROM hiring AS T1 INNER JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Shop_ID ORDER BY COUNT(T1.Employee_ID) DESC LIMIT 1
SELECT s.Name FROM shop AS s JOIN hiring AS h ON s.Shop_ID = h.Shop_ID GROUP BY s.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM shop EXCEPT SELECT T2.Name FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID  =  T2.Shop_ID
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT s.Name, COUNT(h.Shop_ID) FROM shop AS s JOIN hiring AS h ON s.Shop_ID = h.Shop_ID GROUP BY s.Name
SELECT T2.Shop_ID ,  COUNT(T2.Employee_ID) FROM hiring AS T1 JOIN shop AS T2 ON T2.Shop_ID  =  T1.Shop_ID GROUP BY T2.Shop_ID
SELECT sum(Bonus) FROM evaluation
SELECT sum(Bonus) FROM evaluation
SELECT * FROM hiring;
SELECT * FROM hiring
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000
SELECT DISTINCT T3.District FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID JOIN employee AS T3 ON T1.Employee_ID = T3.Employee_ID WHERE T2.Number_products < 3000 INTERSECT SELECT DISTINCT T3.District FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID JOIN employee AS T3 ON T1.Employee_ID = T3.Employee_ID WHERE T2.Number_products > 10000
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(*) FROM Documents
SELECT COUNT(Document_ID) FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT T1.Document_ID, T1.Document_Name, T1.Document_Description FROM Documents AS T1
SELECT D.Document_Name, T.Template_ID FROM Documents D JOIN Templates T ON D.Template_ID = T.Template_ID WHERE D.Document_Description LIKE '%w%'
SELECT D.Document_Name, T.Template_ID FROM Documents AS D INNER JOIN Templates AS T ON D.Template_ID = T.Template_ID WHERE D.Document_Description LIKE '%w%'
 SELECT D.Document_ID, T.Template_ID, D.Document_Description FROM Documents D JOIN Templates T ON D.Template_ID = T.Template_ID WHERE D.Document_Name = 'Robbin CV' 
SELECT D.Document_ID, D.Template_ID, D.Document_Description FROM Documents D WHERE D.Document_Name = 'Robbin CV';
SELECT COUNT(DISTINCT Template_ID) FROM Documents
SELECT COUNT(DISTINCT T.Template_Type_Code)  FROM Templates AS T  JOIN Documents AS D ON T.Template_ID = D.Template_ID;
SELECT COUNT(DISTINCT Document_ID) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT')
SELECT COUNT(*) FROM Documents INNER JOIN Templates ON Documents.Template_ID = Templates.Template_ID INNER JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Code = 'PPT'
SELECT Templates.Template_ID, COUNT(Documents.Document_ID) as Number_of_Documents FROM Templates INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID
SELECT Template_ID, COUNT(*) as Usage_Count FROM Documents GROUP BY Template_ID
SELECT T2.Template_ID, T1.Template_Type_Code FROM Ref_Template_Types AS T1 INNER JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T2.Template_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Template_ID, T1.Template_Type_Code FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T1.Template_ID ORDER BY COUNT(T2.Document_ID) DESC LIMIT 1
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(Document_ID) > 1
SELECT T1.Template_ID FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID HAVING COUNT(T2.Document_ID) > 1
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)
SELECT Template_ID FROM Templates WHERE Document_ID IS NULL
SELECT COUNT(*) FROM Templates
SELECT COUNT(Template_ID) FROM Templates
SELECT T1.Template_ID, T1.Version_Number, T1.Template_Type_Code FROM Templates AS T1
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT Template_Type_Code FROM Ref_Template_Types
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT');
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT');
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV';
SELECT Version_Number ,  Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT T1.Template_Type_Code, COUNT(*) FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T1.Template_Type_Code
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code IN (SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3)
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(Template_ID) < 3
SELECT Templates.Version_Number, Templates.Template_Type_Code FROM Templates INNER JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code ORDER BY Templates.Version_Number ASC LIMIT 1
SELECT Template_Type_Code, MIN(Version_Number) FROM Templates GROUP BY Template_Type_Code;
SELECT T2.Template_Type_Code FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = 'Data base';
SELECT Templates.Template_Type_Code FROM Templates INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID WHERE Documents.Document_Name = 'Data Base';
SELECT D.Document_Name FROM Documents D JOIN Templates T ON D.Template_ID = T.Template_ID WHERE T.Template_Type_Code = 'BK'
SELECT DISTINCT d.Document_Name FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID WHERE t.Template_Type_Code = 'BK'
SELECT T2.Template_Type_Code, COUNT(T1.Document_ID) as Document_Count FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_Type_Code; 
SELECT T1.Template_Type_Code ,  COUNT(*) FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_Type_Code
SELECT Template_Type_Code FROM Documents GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT DISTINCT Template_Type_Code FROM Templates)
SELECT T1.Template_Type_Code  FROM Ref_Template_Types AS T1  LEFT JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code  WHERE T2.Template_ID IS NULL
SELECT Template_Type_Code ,  Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT T1.Template_Type_Description FROM Ref_Template_Types AS T1 INNER JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Code = 'AD'
SELECT T2.Template_Type_Description FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Code = 'AD';
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = "Book"
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT DISTINCT T1.Template_Type_Description FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code
SELECT DISTINCT T2.template_type_description FROM documents AS T1 INNER JOIN templates AS T2 ON T1.template_id = T2.template_id
SELECT Templates.Template_ID FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Description = 'Presentation'
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN (SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Presentation')
SELECT COUNT(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs;
SELECT COUNT(*) FROM Paragraphs WHERE Document_ID = (SELECT Document_ID FROM Documents WHERE Document_Name = 'Summer Show')
SELECT COUNT(Paragraph_ID) FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID WHERE T2.Document_Name = 'Summer Show'
SELECT Paragraph_Text, Other_Details FROM Paragraphs WHERE Paragraph_Text = 'Korea';
SELECT Paragraph_Text, Other_Details FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs AS P JOIN Documents AS D ON P.Document_ID = D.Document_ID WHERE D.Document_Name = 'Welcome to NY';
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Welcome to NY'
SELECT Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = "Customer reviews"
SELECT Paragraphs.Paragraph_Text  FROM Paragraphs  JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID  WHERE Documents.Document_Name = 'Customer reviews';
SELECT Documents.Document_ID, COUNT(Paragraphs.Paragraph_ID) as Paragraphs_Count FROM Documents INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Documents.Document_ID
SELECT Document_ID, COUNT(*) FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS Paragraph_Count FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID, Documents.Document_Name
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) AS Number_of_Paragraphs FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name
SELECT DISTINCT Paragraphs.Document_ID FROM Paragraphs GROUP BY Paragraphs.Document_ID HAVING COUNT(*) >= 2
SELECT DISTINCT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT T2.Document_ID, T2.Document_Name FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Document_ID, T2.Document_Name FROM      (SELECT Document_ID, COUNT(*) AS max_paragraphs      FROM Paragraphs      GROUP BY Document_ID      ORDER BY max_paragraphs DESC      LIMIT 1) AS T1,      Documents AS T2 WHERE T1.Document_ID = T2.Document_ID
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(Paragraph_ID) ASC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT D.Document_ID FROM Documents AS D INNER JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID HAVING COUNT(*) BETWEEN 1 AND 2
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2
SELECT DISTINCT Documents.Document_ID  FROM Documents  INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID  WHERE Paragraphs.Paragraph_Text = 'Brazil' OR Paragraphs.Paragraph_Text = 'Ireland';
SELECT DISTINCT Documents.Document_ID FROM Documents INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID WHERE Paragraphs.Paragraph_Text = 'Brazil' AND Paragraphs.Paragraph_Text = 'Ireland'
SELECT count(*) FROM teacher                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
SELECT count(*) FROM teacher
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Age ,  Hometown FROM teacher
SELECT Name, Age, Hometown FROM teacher; 
SELECT name FROM teacher WHERE hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Hometown != ' Little Lever Urban District '
SELECT `Name` FROM `teacher` WHERE `Age` = 32 OR `Age` = 33
SELECT name FROM teacher WHERE age = '32' OR age = '33'
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1
SELECT hometown FROM teacher ORDER BY age LIMIT 1
SELECT Hometown ,  COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown ,  COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown, COUNT(*) as TeacherCount FROM teacher GROUP BY Hometown ORDER BY TeacherCount DESC LIMIT 1; 
SELECT Hometown, COUNT(*) AS Total_Teachers FROM teacher GROUP BY Hometown ORDER BY Total_Teachers DESC LIMIT 1;
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(Teacher_ID) >= 2
SELECT DISTINCT T2.Hometown FROM teacher AS T1 INNER JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID WHERE T2.Teacher_ID IN (SELECT Teacher_ID FROM course_arrange GROUP BY Teacher_ID HAVING COUNT(*) > 1)
SELECT teacher.name, course.Course FROM teacher JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id JOIN course ON course_arrange.course_id = course.course_id
SELECT T1.name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.teacher_id  =  T2.teacher_id
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID ORDER BY T2.Name
SELECT T2.Name ,  T1.Course FROM course AS T1 JOIN course_arrange AS T3 ON T1.Course_ID  =  T3.Course_ID JOIN teacher AS T2 ON T3.Teacher_ID  =  T2.Teacher_ID ORDER BY T2.Name ASC
SELECT T1.name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN course AS T3 ON T2.course_id  =  T3.course_id WHERE T3.course  =  'Math'
SELECT t1.name FROM teacher AS t1 JOIN course_arrange AS t2 ON t1.teacher_id  =  t2.teacher_id JOIN course AS t3 ON t3.course_id  =  t2.course_id WHERE t3.course  =  'Math'
SELECT T2.Name ,  COUNT(*) FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID GROUP BY T2.Name
SELECT T2.Name ,  count(*) FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID GROUP BY T2.Teacher_ID
SELECT T1.Name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T1.Name HAVING count(*)  >=  2
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID GROUP BY T2.Name HAVING COUNT(T1.Course_ID) >= 2
SELECT Name FROM teacher WHERE teacher_id NOT IN (SELECT teacher_id FROM course_arrange)
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT count(*) FROM visitor WHERE Age < 30
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT AVG(T1.Age) FROM visitor AS T1 INNER JOIN visit AS T2 ON T1.ID = T2.visitor_ID WHERE T1.Level_of_membership <= 4
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1;
SELECT avg(Num_of_Staff) FROM museum WHERE Open_Year  <  "2009"
SELECT Open_Year ,  Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > 2010)
SELECT v.ID, v.Name, v.Age FROM visitor AS v JOIN visit AS vi ON v.ID = vi.visitor_ID GROUP BY vi.visitor_ID HAVING COUNT(vi.Museum_ID) > 1
SELECT T1.ID, T1.Name, T1.Level_of_membership FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID ORDER BY T2.Total_spent DESC LIMIT 1
SELECT T1.Name FROM museum AS T1 JOIN ( SELECT Museum_ID, COUNT(*) FROM visit GROUP BY Museum_ID ORDER BY COUNT(*) DESC LIMIT 1 ) AS T2 ON T1.Museum_ID = T2.Museum_ID
SELECT Name FROM museum EXCEPT SELECT t1.Name FROM museum AS t1 JOIN visit AS t2 ON t1.Museum_ID  =  t2.Museum_ID
SELECT visitor.Name ,  visitor.Age FROM visitor  JOIN visit  ON visitor.ID  =  visit.visitor_ID ORDER BY visit.Num_of_Ticket DESC LIMIT 1
SELECT avg(Num_of_Ticket) ,  max(Num_of_Ticket) FROM visit;
SELECT sum(t2.Total_spent) FROM visitor AS t1 JOIN visit AS t2 ON t1.ID  =  t2.visitor_ID WHERE t1.Level_of_membership  =  1
SELECT T2.name FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_id  =  T2.id JOIN museum AS T3 ON T1.museum_id = T3.Museum_ID WHERE T3.Open_Year  <  '2009' INTERSECT SELECT T2.name FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_id  =  T2.id JOIN museum AS T3 ON T1.museum_id = T3.Museum_ID WHERE T3.Open_Year  >  '2011'
SELECT COUNT(DISTINCT visitor_ID) FROM visit WHERE Museum_ID NOT IN (SELECT Museum_ID FROM museum WHERE Open_Year > '2010')
SELECT COUNT(*) FROM museum WHERE Open_Year < '2008' OR Open_Year > '2013'
SELECT count(*) FROM players
SELECT count(*) FROM players
SELECT count(*) FROM matches
SELECT COUNT(*) FROM matches
SELECT first_name, birth_date FROM players WHERE country_code = 'USA';
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT AVG(loser_age), AVG(winner_age) FROM matches
SELECT AVG(loser_age), AVG(winner_age) FROM matches;
SELECT AVG(ranking) FROM rankings WHERE player_id IN (SELECT winner_id FROM matches)
SELECT AVG(winner_rank) FROM matches
SELECT MAX(ranking) FROM rankings
SELECT MIN(loser_rank) FROM matches
SELECT COUNT(DISTINCT country_code) FROM players;
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT T2.tourney_name  FROM matches AS T1  JOIN matches AS T2 ON T1.tourney_id = T2.tourney_id  GROUP BY T2.tourney_name  HAVING COUNT(*) > 10
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(*) > 10
SELECT DISTINCT t1.winner_name FROM matches AS t1 INNER JOIN players AS t2 ON t1.winner_id = t2.player_id WHERE t1.year IN (2013, 2016)
SELECT p.first_name, p.last_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.year = 2013 INTERSECT SELECT p.first_name, p.last_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.year = 2016
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016)
SELECT count(*) FROM matches WHERE YEAR IN (2013, 2016)
SELECT T3.country_code, T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id JOIN players AS T3 ON T1.player_id = T3.player_id WHERE T2.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY T1.first_name HAVING COUNT(DISTINCT T2.tourney_name) = 2
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name = 'WTA Championships' INTERSECT SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name = 'Australian Open'
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT min(birth_date) FROM players)
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1
SELECT first_name ,  last_name FROM players ORDER BY birth_date
SELECT first_name, last_name FROM players ORDER BY birth_date;
SELECT first_name ,  last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id ORDER BY T2.tours DESC LIMIT 1
SELECT first_name ,  country_code FROM players ORDER BY tours DESC LIMIT 1
SELECT YEAR FROM matches GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1
SELECT YEAR FROM matches GROUP BY YEAR ORDER BY COUNT(year) DESC LIMIT 1
SELECT T1.winner_name, T2.ranking_points FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id GROUP BY T1.winner_id ORDER BY COUNT(T1.winner_id) DESC LIMIT 1
SELECT T1.winner_name, T1.winner_rank_points FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id GROUP BY T1.winner_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.winner_name FROM players AS T1 INNER JOIN matches AS T2 ON T1.player_id = T2.winner_id INNER JOIN tournaments AS T3 ON T2.tourney_id = T3.tourney_id WHERE T3.tourney_name = 'Australian Open' AND T2.winner_rank_points = ( SELECT MAX(ranking_points) FROM rankings WHERE player_id = T1.player_id )
SELECT T1.winner_name FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_name = 'Australian Open' ORDER BY T2.ranking_points DESC LIMIT 1
SELECT L.winner_name, L.loser_name FROM matches L ORDER BY L.minutes DESC LIMIT 1
SELECT T3.winner_name, T3.loser_name FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id JOIN players AS T3 ON T1.loser_id = T3.player_id WHERE T1.minutes = ( SELECT MAX(minutes) FROM matches );
SELECT avg(ranking_points) ,  p.first_name ,  p.last_name FROM rankings r JOIN players p ON r.player_id  =  p.player_id GROUP BY p.first_name ,  p.last_name
SELECT first_name ,  avg(ranking_points) FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY first_name;
SELECT P.first_name, SUM(R.ranking_points) AS total_ranking_points  FROM players AS P  JOIN rankings AS R ON P.player_id = R.player_id  GROUP BY P.first_name
SELECT T1.first_name ,  SUM(T2.ranking_points) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY T1.first_name
SELECT country_code, COUNT(*) AS number_of_players FROM players GROUP BY country_code
SELECT country_code, COUNT(*) FROM players GROUP BY country_code;
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50
SELECT ranking_date, COUNT(DISTINCT player_id) AS total_tours FROM rankings GROUP BY ranking_date
SELECT ranking_date, COUNT(tours) FROM rankings GROUP BY ranking_date
SELECT YEAR, COUNT(*) FROM matches GROUP BY YEAR
SELECT YEAR, COUNT(*) FROM matches GROUP BY YEAR
SELECT w.winner_name, p.ranking FROM matches m JOIN players p ON m.winner_id = p.player_id ORDER BY m.winner_age ASC LIMIT 3
SELECT name, rank FROM players ORDER BY birth_date ASC LIMIT 3
SELECT COUNT(T1.winner_id) FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T2.hand = 'L' AND T1.tourney_level = 'G';
SELECT COUNT(*) FROM players AS t1 JOIN matches AS t2 ON t1.player_id = t2.winner_id WHERE t1.hand = 'L' AND t2.tourney_name LIKE 'WTA Championships%'
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id ORDER BY T2.winner_rank_points DESC LIMIT 1
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id GROUP BY T2.winner_id ORDER BY SUM(T2.winner_rank_points) DESC LIMIT 1
SELECT hand, COUNT(*) FROM players GROUP BY hand
SELECT hand, COUNT(*) FROM players GROUP BY hand
SELECT COUNT(*) FROM death WHERE note = 'Captured';
SELECT name, tonnage FROM ship ORDER BY name DESC
SELECT id ,  name ,  date ,  result FROM battle
SELECT MAX(killed) ,  MIN(killed) ,  note FROM death GROUP BY caused_by_ship_id
SELECT AVG(injured) FROM death
SELECT D.note, D.killed, D.injured  FROM death AS D JOIN ship AS S ON D.caused_by_ship_id = S.id  WHERE S.tonnage = 't';
SELECT name ,  result FROM battle WHERE bulgarian_commander != 'Boril'
SELECT b.id, b.name FROM battle AS b INNER JOIN ship AS s ON b.id = s.lost_in_battle WHERE s.ship_type = 'Brig'
SELECT DISTINCT T2.name ,  T2.id FROM death AS T1 JOIN battle AS T2 ON T1.caused_by_ship_id  =  T2.id GROUP BY T1.caused_by_ship_id HAVING sum(T1.killed)  >  10
SELECT T2.id , T2.name FROM death AS T1 JOIN ship AS T2 ON T2.id  =  T1.caused_by_ship_id ORDER BY T1.killed + T1.injured DESC LIMIT 1
SELECT DISTINCT t1.name FROM battle AS t1 JOIN ship AS t2 ON t1.id  =  t2.lost_in_battle WHERE t1.bulgarian_commander  =  'Kaloyan' AND t1.latin_commander  =  'Baldwin I'
SELECT COUNT(DISTINCT result) FROM battle
SELECT COUNT(T1.id) FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.tonnage = '225'
SELECT t2.name, t2.date FROM ship AS t1 JOIN battle AS t2 ON t1.lost_in_battle  =  t2.id WHERE t1.name  =  'Lettice' OR t1.name  =  'HMS Atalanta'
SELECT T1.name, T1.result, T1.bulgarian_commander FROM battle AS T1 INNER JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.disposition_of_ship != 'Lost in English Channel'
SELECT T3.note FROM death AS T1 JOIN ship AS T2 ON T1.caused_by_ship_id  =  T2.id JOIN battle AS T3 ON T2.lost_in_battle  =  T3.id WHERE T3.name LIKE '%East%'
SELECT line_1, line_2 FROM Addresses
SELECT line_1, line_2 FROM Addresses
SELECT COUNT(*) FROM Courses
SELECT count(*) FROM Courses
SELECT course_description FROM Courses WHERE course_name = 'math';
SELECT course_description FROM Courses WHERE course_name LIKE '%Math%'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT T1.department_name, T1.department_id FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id GROUP BY T1.department_id ORDER BY count(*) DESC LIMIT 1
SELECT department_id, department_name FROM Departments ORDER BY ( SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs WHERE department_id = Departments.department_id ) DESC LIMIT 1
SELECT count(*) FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id
SELECT count(DISTINCT T1.department_id) FROM Degree_Programs AS T1
SELECT COUNT (DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs
SELECT COUNT(DISTINCT T2.degree_program_id) FROM Departments AS T1 INNER JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id WHERE T1.department_name = 'Engineering'
SELECT COUNT(degree_program_id) FROM Degree_Programs WHERE department_id IN ( SELECT department_id FROM Departments WHERE department_name = 'Engineering' )
SELECT section_name ,  section_description FROM Sections
SELECT section_name ,  section_description FROM Sections
SELECT course_id, course_name FROM Courses GROUP BY course_id HAVING COUNT(*) <= 2
SELECT course_id, course_name FROM Courses WHERE course_id NOT IN (SELECT course_id FROM Sections GROUP BY course_id HAVING count(*)  >=  2)
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM SECTIONS ORDER BY section_name DESC
SELECT semester_id, semester_name FROM Semesters WHERE semester_id IN ( SELECT semester_id FROM Student_Enrolment_Courses GROUP BY semester_id ORDER BY count(student_enrolment_id) DESC LIMIT 1 )
SELECT semester_id ,  COUNT(*) ,  T2.semester_name FROM Student_Enrolment AS T1 JOIN Semesters AS T2 ON T1.semester_id  =  T2.semester_id GROUP BY semester_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.department_description FROM Students AS T1 JOIN Student_Enrolment AS T3 ON T1.student_id = T3.student_id JOIN Degree_Programs AS T2 ON T3.degree_program_id = T2.degree_program_id WHERE T2.department_name LIKE '%computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT first_name, middle_name, last_name, student_id FROM Students WHERE student_id IN ( SELECT student_id FROM Student_Enrolment_Courses GROUP BY student_enrolment_id HAVING COUNT(*) = 2 )
SELECT T3.student_id, T3.first_name, T3.middle_name, T3.last_name  FROM Student_Enrolment_Courses AS T1  JOIN Student_Enrolment AS T2 ON T1.student_enrolment_id = T2.student_enrolment_id  JOIN Students AS T3 ON T2.student_id = T3.student_id  WHERE T2.degree_program_id IN (SELECT degree_program_id FROM Student_Enrolment GROUP BY degree_program_id HAVING count(DISTINCT semester_id) = 1)
SELECT first_name, middle_name, last_name FROM students JOIN student_enrolment ON students.student_id = student_enrolment.student_id JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id WHERE degree_summary_name = 'Bachelor';
SELECT s.first_name, s.middle_name, s.last_name FROM students AS s JOIN student_enrolment AS se ON s.student_id = se.student_id JOIN degree_programs AS dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name = 'Bachelors'
SELECT degree_summary_name FROM Degree_Programs ORDER BY COUNT(student_id) DESC LIMIT 1
SELECT T3.degree_summary_name FROM STUDENT_ENROLMENT AS T1 INNER JOIN DEGREE_PROGRAMS AS T2 ON T1.degree_program_id = T2.degree_program_id INNER JOIN DEGREE_SUMMARY AS T3 ON T2.DEGREE_SUMMARY_ID = T3.DEGREE_SUMMARY_ID GROUP BY T3.degree_summary_name ORDER BY COUNT(T1.student_enrolment_id) DESC LIMIT 1
SELECT `degree_program_id`, degree_summary_name FROM Degree_Programs GROUP BY `degree_program_id` ORDER BY COUNT(`student_id`) DESC LIMIT 1
SELECT T1.degree_program_id, T4.degree_summary_name FROM Student_Enrolment AS T1 INNER JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id INNER JOIN Degree_Programs AS T4 ON T4.degree_program_id = T2.degree_program_id GROUP BY T2.degree_summary_name ORDER BY COUNT(T1.student_id) DESC LIMIT 1
SELECT st.student_id, st.first_name, st.middle_name, st.last_name, COUNT(*) as number_of_enrollments FROM Students st JOIN Student_Enrolment se ON st.student_id = se.student_id GROUP BY st.student_id, st.first_name, st.middle_name, st.last_name ORDER BY number_of_enrollments DESC LIMIT 1
SELECT students.first_name, students.middle_name, students.last_name, students.student_id, COUNT(*) as number_of_enrollments FROM students JOIN student_enrolment ON students.student_id = student_enrolment.student_id GROUP BY students.student_id ORDER BY number_of_enrollments DESC LIMIT 1
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id  =  T2.course_id
SELECT DISTINCT c.course_name FROM Courses c JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id  =  T2.course_id GROUP BY T1.course_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id ORDER BY COUNT(T2.student_course_id) DESC LIMIT 1
SELECT T2.last_name FROM addresses AS T1 INNER JOIN students AS T2 ON T1.address_id = T2.current_address_id WHERE T1.state_province_county = 'North Carolina' AND T2.student_id NOT IN (SELECT student_id FROM student_enrolment)
SELECT s.last_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id WHERE a.state_province_county = 'North Carolina' AND s.student_id NOT IN (SELECT se.student_id FROM Student_Enrolment se)
SELECT DISTINCT T1.transcript_id, T1.transcript_date FROM Transcripts AS T1 INNER JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(*) >= 2
SELECT T1.transcript_date ,  T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id  =  T2.transcript_id GROUP BY T2.student_course_id HAVING COUNT(*)  >=  2
SELECT T1.cell_mobile_number FROM Students AS T1 INNER JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id WHERE T1.first_name = 'Timmothy' AND T1.last_name = 'Ward'
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward';
SELECT first_name, middle_name, last_name FROM students ORDER BY date_first_registered LIMIT 1;
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered LIMIT 1
SELECT first_name, middle_name, last_name FROM students ORDER BY date_left ASC LIMIT 1
SELECT T3.first_name ,  T3.middle_name ,  T3.last_name FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id  =  T2.transcript_id JOIN Student_Enrolment_Courses AS T3 ON T3.student_course_id  =  T2.student_course_id ORDER BY T1.transcript_date ASC LIMIT 1
SELECT t1.first_name FROM Students AS t1 JOIN Addresses AS t2 ON t1.permanent_address_id = t2.address_id JOIN Addresses AS t3 ON t1.current_address_id = t3.address_id WHERE t2.line_1 != t3.line_1 OR t2.line_2 != t3.line_2 OR t2.line_3 != t3.line_3 OR t2.city != t3.city OR t2.zip_postcode != t3.zip_postcode OR t2.state_province_county != t3.state_province_county OR t2.country != t3.country OR t2.other_address_details != t3.other_address_details
SELECT t3.first_name FROM Addresses AS t1 JOIN Students AS t3 ON t1.address_id  =  t3.permanent_address_id JOIN Addresses AS t2 ON t1.address_id  =  t2.address_id WHERE t3.current_address_id  !=  t2.address_id
SELECT T1.address_id, T1.line_1, T1.line_2, T1.line_3, T1.city, T1.zip_postcode, T1.state_province_county, T1.country, T1.other_address_details FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.current_address_id GROUP BY T1.address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.address_id ,  T1.line_1 ,  T1.line_2 FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id  =  T2.current_address_id OR T1.address_id  =  T2.permanent_address_id GROUP BY T1.address_id ORDER BY count(*) DESC LIMIT 1
SELECT AVG(T1.transcript_date) FROM Transcripts AS T1
SELECT AVG(transcript_date) FROM Transcripts;
SELECT `transcript_date`, `other_details` FROM `Transcripts` ORDER BY `transcript_date` ASC LIMIT 1
SELECT * FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT COUNT(transcript_id) FROM Transcripts
SELECT COUNT(*) FROM Transcripts
SELECT max(transcript_date) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT student_course_id, COUNT(*) as NumberOfOccurrences FROM Transcript_Contents GROUP BY student_course_id ORDER BY NumberOfOccurrences DESC
SELECT course_id, COUNT(*) as times_transcript_appeared  FROM Transcript_Contents  GROUP BY course_id  ORDER BY times_transcript_appeared DESC  LIMIT 1
SELECT student_course_id, MIN(transcript_id) FROM Transcript_Contents;
SELECT `transcript_date`, `transcript_id` FROM Transcripts ORDER BY (SELECT COUNT(*) FROM Transcript_Contents WHERE `transcript_id` = Transcripts.transcript_id) ASC LIMIT 1
SELECT semester_id FROM student_enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name LIKE '%Master%') INTERSECT SELECT semester_id FROM student_enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name LIKE '%Bachelor%')
SELECT T1.semester_id FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id WHERE T2.degree_program_id IN ( SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Masters' ) AND T2.student_id IN ( SELECT student_id FROM Students WHERE student_id NOT IN ( SELECT student_id FROM Students WHERE degree_program_id IN ( SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Bachelors' ) ) )
SELECT count(DISTINCT current_address_id) FROM STUDENTS
SELECT DISTINCT line_1 ,  line_2 ,  line_3 ,  city ,  zip_postcode ,  state_province_county ,  country FROM addresses WHERE address_id IN (SELECT current_address_id FROM students UNION SELECT permanent_address_id FROM students)
SELECT * FROM students ORDER BY last_name DESC
SELECT * FROM Students ORDER BY last_name DESC
SELECT `section_id`, `section_name`, `section_description`, `other_details` FROM `Sections` WHERE `section_name` = 'h'
SELECT section_description FROM Sections WHERE section_name = 'h';
SELECT first_name FROM Students WHERE permanent_address_id IN ( SELECT address_id FROM Addresses WHERE country = 'Haiti' ) OR cell_mobile_number = '09700166582'
SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582'
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones";
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT COUNT(*) FROM Cartoon WHERE written_by = 'Joseph Kuhr'
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti');
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti');
SELECT Country FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1
SELECT country FROM tv_channel GROUP BY country ORDER BY COUNT(*) DESC LIMIT 1
SELECT count(DISTINCT series_name) ,  count(DISTINCT Content) FROM TV_Channel
SELECT count(DISTINCT series_name), count(DISTINCT Content) FROM TV_Channel
SELECT content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT T1.Package_Option FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.series_name = 'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English';
SELECT COUNT(Language) FROM TV_Channel WHERE Language = 'English';
SELECT Language, COUNT(id) AS num_channels FROM TV_Channel GROUP BY Language ORDER BY num_channels ASC LIMIT 1
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language ORDER BY COUNT(*) ASC LIMIT 1
SELECT Language, COUNT(*) as Number_of_Channels FROM TV_Channel GROUP BY Language
SELECT Language ,  COUNT(*) FROM TV_Channel GROUP BY Language
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!'
SELECT T2.series_name FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Title = 'The Rise of the Blue Beetle'
SELECT Cartoon.Title  FROM Cartoon  INNER JOIN TV_Channel  ON Cartoon.Channel = TV_Channel.id  WHERE TV_Channel.series_name = 'Sky Radio'
SELECT T3.Title FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel JOIN Cartoon AS T3 ON T1.id = T3.Channel WHERE T2.series_name = 'Sky Radio'
SELECT Episode FROM TV_series ORDER BY Rating;
SELECT Episode FROM TV_series ORDER BY Rating
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT MIN(Share), MAX(Share) FROM TV_series
SELECT MAX(Share) as Max_Share, MIN(Share) as Min_Share FROM TV_series; 
SELECT Episode FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT "Weekly_Rank" FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT `Weekly_Rank` FROM `TV_series` WHERE `Episode` = 'A Love of a Lifetime'
SELECT T1.series_name FROM TV_channel AS T1 JOIN TV_series AS T2 ON T1.id  =  T2.Channel WHERE T2.Episode  =  "A Love of a Lifetime"
SELECT series_name FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Episode FROM TV_series WHERE Channel IN (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio')
SELECT Episode FROM TV_series WHERE series_name = "Sky Radio"
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT Director, COUNT(*) as Num_Cartoons FROM Cartoon GROUP BY Director
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT T1.Package_Option, T2.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE Hight_definition_TV = 'yes'
SELECT T2.Package_Option, T2.series_name FROM TV_Channel AS T1 INNER JOIN TV_Series AS T2 ON T1.id = T2.Channel WHERE T1.Hight_definition_TV = 'yes'
SELECT DISTINCT T2.Country FROM Cartoon AS T1  JOIN TV_Channel AS T2 ON T1.Channel = T2.id  WHERE T1.Written_by = 'Todd Casey'
SELECT DISTINCT T3.Country FROM Cartoon AS T1 INNER JOIN TV_Channel AS T3 ON T1.Channel = T3.id WHERE T1.Written_by = 'Todd Casey'
SELECT Country FROM TV_Channel WHERE NOT EXISTS (SELECT * FROM Cartoon WHERE Channel = TV_Channel.id AND Written_by = 'Todd Casey')
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id  =  T2.Channel WHERE T2.Written_by  <>  "Todd Casey"
SELECT T2.series_name, T2.Country FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Directed_by = 'Ben Jones' OR T1.Directed_by = 'Michael Chang'
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones' OR T2.Directed_by = 'Michael Chang'
SELECT T1.Pixel_aspect_ratio_PAR, T1.Country FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.Language != 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT T1.id FROM TV_Channel AS T1 JOIN TV_Channel AS T2 ON T1.Country = T2.Country GROUP BY T1.id HAVING COUNT(T2.id) > 2
SELECT id FROM TV_Channel WHERE id IN (SELECT Channel FROM TV_series GROUP BY Channel HAVING COUNT(*) > 2)
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT T3.Channel FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel  =  T2.id JOIN TV_series AS T3 ON T1.Channel  =  T3.Channel WHERE T1.Directed_by  =  'Ben Jones')
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT T1.Package_Option FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by != 'Ben Jones'
SELECT T1.Package_Option FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by <> 'Ben Jones'
SELECT count(*) FROM poker_player
SELECT count(*) FROM poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC;
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT Final_Table_Made ,  Best_Finish FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT avg(Earnings) FROM poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT MAX(T1.Final_Table_Made) FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID WHERE T1.Earnings  <  200000
SELECT Name FROM people
SELECT Name FROM people
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID WHERE T1.Earnings  >  300000;
SELECT p.Name  FROM poker_player pp INNER JOIN people p ON pp.People_ID = p.People_ID  WHERE pp.Earnings > 300000;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Final_Table_Made ASC
SELECT T1.Birth_Date FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Earnings ASC LIMIT 1
SELECT T1.Birth_Date FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Earnings ASC LIMIT 1
SELECT Money_Rank FROM poker_player WHERE Height = (SELECT max(Height) FROM poker_player)
SELECT T2.Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1
SELECT AVG(Earnings) FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE people.Height > 200;
SELECT AVG(Earnings) FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE Height > 200
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC
SELECT Name FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID ORDER BY Earnings DESC
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality;
SELECT T2.Nationality FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID GROUP BY T2.Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1;
SELECT NATIONALITY FROM people GROUP BY NATIONALITY HAVING count(*)  >=  2
SELECT Nationality FROM people GROUP BY Nationality HAVING count(*)  >=  2
SELECT Name, Birth_Date FROM people ORDER BY Name ASC
SELECT Name, Birth_Date FROM people ORDER BY Name;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Nationality != 'Russia'
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT COUNT(DISTINCT Nationality) FROM people;
SELECT count(DISTINCT Nationality) FROM people
SELECT count(DISTINCT state) FROM votes
SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC
SELECT vote_id, phone_number, state FROM VOTES
SELECT max(area_code) , min(area_code) FROM area_code_state
SELECT MAX(created) FROM votes WHERE state = 'CA';
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT state ,  created FROM votes
SELECT T1.contestant_number, T1.contestant_name FROM CONT 
SELECT T1.contestant_number, T1.contestant_name FROM CONTESTANTS AS T1 INNER JOIN ( SELECT T2.contestant_number, COUNT(*) AS total_votes FROM VOTES AS T2 GROUP BY T2.contestant_number ORDER BY total_votes ASC LIMIT 1 ) AS T3 ON T3.contestant_number = T1.contestant_number
SELECT COUNT(*) FROM VOTES WHERE state IN ('NY', 'CA')
SELECT COUNT(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES)
SELECT area_code FROM VOTES JOIN AREA_CODE_STATE ON VOTES.state = AREA_CODE_STATE.state GROUP BY area_code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT created, state, phone_number FROM VOTES WHERE contestant_number = (SELECT contestant_number FROM CONTESTANTS WHERE contestant_name = 'Tabatha Gehling')
SELECT DISTINCT A.area_code FROM VOTES AS V JOIN CONTESTANTS AS C ON V.contestant_number = C.contestant_number JOIN AREA_CODE_STATE AS A ON V.state = A.state WHERE C.contestant_name IN ('Tabatha Gehling', 'Kelly Clauss') GROUP BY A.area_code HAVING COUNT(DISTINCT C.contestant_name) = 2
SELECT T2.contestant_name FROM VOTES AS T1 JOIN CONTESTANTS AS T2 ON T1.contestant_number = T2.contestant_number WHERE T2.contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear > 1950
SELECT Name FROM country WHERE IndepYear > 1950
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'
SELECT SUM(T1.SurfaceArea) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Region = 'Caribbean'
SELECT SUM(T2.SurfaceArea) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Caribbean'
SELECT continent FROM country WHERE name = 'Anguilla'
SELECT T1.Continent FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T2.Name = 'Anguilla'
SELECT Region FROM country WHERE Code = (SELECT CountryCode FROM city WHERE Name = 'Kabul')
SELECT Region FROM country WHERE Code = ( SELECT CountryCode FROM city WHERE Name = 'Kabul' )
SELECT T3.Language FROM country AS T1  JOIN city AS T2 ON T1.Code = T2.CountryCode  JOIN countrylanguage AS T3 ON T1.Code = T3.CountryCode  WHERE T2.Name = 'Aruba' AND T3.IsOfficial = 'T' ORDER BY T3.Percentage DESC LIMIT 1
SELECT L.Language FROM countrylanguage AS L  JOIN country AS C ON L.CountryCode = C.Code  WHERE C.Name = 'Aruba' AND L.Percentage =    (SELECT MAX(L2.Percentage) FROM countrylanguage AS L2 JOIN country AS C2 ON L2.CountryCode = C2.Code WHERE C2.Name = 'Aruba')
SELECT Population, LifeExpectancy FROM country WHERE Code = 'BRA'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil';
SELECT Region ,  Population FROM country WHERE Name = 'Angola'
SELECT T2.region, T2.Population FROM country AS T1 INNER JOIN country AS T2 ON T2.Code = T1.Code WHERE T1.name = "Angola";
SELECT AVG(T2.LifeExpectancy) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Region = 'Central Africa'
SELECT AVG(T2.LifeExpectancy)  FROM country AS T1  INNER JOIN city AS T2 ON T1.Code = T2.CountryCode  WHERE T1.Continent = 'Africa'
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1
SELECT T2.name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.continent = 'Asia' GROUP BY T2.name ORDER BY AVG(T1.LifeExpectancy) ASC LIMIT 1
SELECT SUM(t1.Population) AS total_population, MAX(t1.GNP) AS maximum_gnp FROM country AS t1 IN WHERE t1.Continent = 'Asia'
SELECT SUM(T1.Population), T2.GNP FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Continent = 'Asia' ORDER BY T2.GNP DESC LIMIT 1;
SELECT AVG(T2.LifeExpectancy) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' AND T1.GovernmentForm = 'Republic';
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' AND T1.GovernmentForm = 'Republic'
SELECT sum(surfacearea) FROM country WHERE continent IN ('Asia', 'Europe')
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe');
SELECT COUNT(T1.Name) FROM city AS T1 INNER JOIN country AS T2 ON T2.Code = T1.CountryCode WHERE T2.GovernmentForm = 'Kingdom' AND T1.District = 'Gelderland';
SELECT sum(T1.Population) FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.District = 'Gelderland'
SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm = 'United States';
SELECT avg(GNP), sum(population) FROM country WHERE GovernmentForm = 'United States Territory';
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa';
SELECT count(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Asia'
SELECT SUM(Percentage) FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba');
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'ABW'
SELECT COUNT(*) FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.IsOfficial = 'T' AND T2.Name = 'Afghanistan';
SELECT COUNT(CountryCode) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T';
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage GROUP BY CountryCode ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.LocalName FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T2.CountryCode ORDER BY COUNT(T2.Language) DESC LIMIT 1
SELECT Continent FROM country GROUP BY Continent ORDER BY COUNT(DISTINCT Language) DESC LIMIT 1
SELECT continent FROM country GROUP BY continent ORDER BY SUM(COUNT(Language)) DESC LIMIT 1
SELECT COUNT(T1.CountryCode) FROM countrylanguage AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T1.Language = 'English' AND T2.Language = 'Dutch'
SELECT COUNT(DISTINCT t1.code) FROM country AS t1 JOIN countrylanguage AS t2 ON t1.code = t2.countrycode WHERE t2.language IN ('English', 'Dutch')
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'French' AND T2.Language  =  'English'
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'English' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'French'
SELECT DISTINCT T1.name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.code  =  T2.countrycode WHERE T2.language  =  "English" INTERSECT SELECT DISTINCT T1.name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.code  =  T2.countrycode WHERE T2.language  =  "French"
SELECT CountryCode FROM countrylanguage WHERE Language = 'English' INTERSECT SELECT CountryCode FROM countrylanguage WHERE Language = 'French'
SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'
SELECT COUNT(DISTINCT T1.continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'Chinese'
SELECT region FROM country WHERE governmentform IN ('Constitutional monarchy', 'Republic') ORDER BY region
SELECT DISTINCT T1.Region FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('Dutch', 'English')
SELECT DISTINCT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('English', 'Dutch')
SELECT DISTINCT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'English' OR T2.Language  =  'Dutch'
SELECT Language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Asia') GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT Language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Asia') GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT Language FROM countrylanguage WHERE IsOfficial = 'T' AND CountryCode IN ( SELECT CountryCode FROM country WHERE GovernmentForm = 'Republic' ) GROUP BY Language HAVING COUNT(*) = 1
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.IsOfficial = 'T' AND T1.GovernmentForm = 'Republic' GROUP BY T2.Language HAVING COUNT(T1.Code) = 1
SELECT Name  FROM city  JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'English'  ORDER BY city.Population DESC  LIMIT 1
SELECT T1.Name, T1.Population FROM city AS T1 INNER JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'English' ORDER BY T1.Population DESC LIMIT 1;
SELECT t2.Name, t2.Population, t2.LifeExpectancy FROM country t2 WHERE t2.Continent = 'Asia' ORDER BY t2.SurfaceArea DESC LIMIT 1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English' AND T2.IsOfficial = 'F'
SELECT AVG(T1.lifeexpectancy) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.code  =  T2.CountryCode WHERE T2.Language  !=  'English' AND T2.IsOfficial  =  'T'
SELECT SUM(T1.Population) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.IsOfficial <> 'T' AND T2.Language <> 'English'
SELECT SUM(Population) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T'
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T';
SELECT COUNT(DISTINCT T2.Language) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930 AND T2.IsOfficial = 'T'
SELECT COUNT(DISTINCT T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930
SELECT Name FROM country WHERE Continent = 'Europe' AND SurfaceArea > (SELECT SurfaceArea FROM country WHERE Continent = 'Europe' ORDER BY SurfaceArea DESC LIMIT 1)
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < ( SELECT MIN(Population) FROM country WHERE Continent = 'Asia' )
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY Population DESC LIMIT 1; SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT Population FROM country WHERE Continent = 'Asia' ORDER BY Population DESC LIMIT 1);
SELECT DISTINCT T2.Name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Continent = 'Asia' AND T1.Population > (SELECT MAX(Population) FROM city AS T3 INNER JOIN country AS T4 ON T3.CountryCode = T4.Code WHERE T4.Continent = 'Africa')
SELECT T1.Name FROM country AS T1 INNER JOIN country AS T2 ON T1.Code = T2.Code WHERE T1.Continent = 'Asia' AND T1.Population > T2.Population AND T2.Continent = 'Africa'
SELECT Code FROM country WHERE GovernmentForm <> 'English'
SELECT DISTINCT T2.CountryCode FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'English'
SELECT DISTINCT T1.Code FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English'
SELECT T1.Code FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English'
SELECT Code FROM country WHERE GovernmentForm != 'Republic' AND Language != 'English'
SELECT T2.Code FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code EXCEPT SELECT T2.Code FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.GovernmentForm = 'Republic';
SELECT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T3.CountryCode = T2.Code WHERE T2.Continent = 'Europe' AND T3.Language = 'English' AND T3.IsOfficial = 'F'
SELECT T1.Name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Continent = 'Europe' AND T1.Name NOT IN (SELECT T3.Name FROM city AS T1 INNER JOIN countrylanguage AS T3 ON T1.CountryCode = T3.CountryCode WHERE T3.Language = 'English' AND T3.IsOfficial = 'T')
SELECT DISTINCT T2.Name FROM countrylanguage AS T1 INNER JOIN city AS T2 ON T2.CountryCode = T1.CountryCode INNER JOIN country AS T3 ON T3.Code = T1.CountryCode WHERE T3.Continent = 'Asia' AND T1.Language = 'Chinese'
SELECT DISTINCT T1.name FROM city AS T1 INNER JOIN country AS T2 ON T1.countrycode = T2.code INNER JOIN countrylanguage AS T3 ON T2.code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.IsOfficial = 'T' AND T3.Language = 'chinese'
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1
SELECT name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1;
SELECT population ,  name ,  HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1
SELECT Name, Population, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1
SELECT T2.Name ,  COUNT(*)  FROM countrylanguage AS T1  JOIN country AS T2 ON T1.CountryCode = T2.Code  WHERE T1.IsOfficial = 'T'  GROUP BY T1.CountryCode  HAVING COUNT(*)  >=  3
SELECT T1.LocalName, COUNT(T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Code HAVING COUNT(T2.Language) > 2
SELECT COUNT(*), District FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District
SELECT District, COUNT(*) FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District
SELECT T1.GovernmentForm ,  SUM(T2.Population) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.GovernmentForm HAVING avg(T1.LifeExpectancy) > 72
SELECT GovernmentForm ,  SUM(Population) FROM country GROUP BY GovernmentForm HAVING avg(LifeExpectancy) > 72
SELECT Continent, AVG(LifeExpectancy) as average_life_expectancy, SUM(Population) as total_population FROM country  WHERE LifeExpectancy < 72  GROUP BY Continent
SELECT continent ,  SUM(population) ,  avg(lifeexpectancy) FROM country GROUP BY continent HAVING avg(lifeexpectancy) < 72
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT Name ,  SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT T2.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code GROUP BY T1.CountryCode ORDER BY SUM(T1.Population) DESC LIMIT 3
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3;
SELECT COUNT(*) FROM country WHERE continent = 'Asia'
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'
SELECT T1.Name FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Europe' AND T2.Population = 80000
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT SUM(T1.Population) ,  AVG(T1.SurfaceArea) FROM country AS T1 INNER JOIN continent AS T2 ON T1.Continent = T2.Name WHERE T2.Continent = 'North America' AND T1.SurfaceArea > 3000
SELECT SUM(T1.Population), AVG(T1.SurfaceArea) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'North America' AND T1.SurfaceArea > 3000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000;
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name, T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode ORDER BY T2.Percentage DESC
SELECT T2.CountryCode ,  T2.Language ,  T2.Percentage FROM countrylanguage AS T2 JOIN country AS T1 ON T2.CountryCode = T1.Code ORDER BY T2.Percentage DESC
SELECT COUNT(T2.CountryCode) FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'Spanish' AND T1.Percentage = ( SELECT MAX(Percentage) FROM countrylanguage WHERE CountryCode IN ( SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' ) );
SELECT count(*) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Spanish' AND countrylanguage.IsOfficial = 'T'
SELECT c.Code FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'Spanish' ORDER BY cl.Percentage DESC LIMIT 1
SELECT t1.code FROM country AS t1 JOIN countrylanguage AS t2 ON t1.code  =  t2.countrycode WHERE language  =  'spanish' AND percentage  =  100
SELECT count(*) FROM conductor
SELECT count(*) FROM conductor
SELECT Name FROM conductor ORDER BY Age
SELECT Name FROM conductor ORDER BY Age
SELECT name FROM conductor WHERE nationality != "USA"
SELECT name FROM conductor WHERE nationality != 'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT Record_Company, Year_of_Founded FROM orchestra ORDER BY Year_of_Founded DESC
SELECT AVG(Attendance) FROM show
SELECT AVG(Attendance) FROM show
SELECT max(T2.share) ,  min(T2.share) FROM performance AS T1 JOIN show AS T2 ON T1.performance_id  =  T2.performance_id WHERE T1.type  !=  'Live final'
SELECT MAX(T2.Share) ,  MIN(T2.Share) FROM performance AS T1 JOIN show AS T2 ON T1.Performance_ID  =  T2.Performance_ID WHERE T1.Type  !=  'Live final'
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT c.Name ,  o.Orchestra FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID  =  o.Conductor_ID
SELECT T2.Name ,  T1.Orchestra FROM orchestra AS T1 JOIN conductor AS T2 ON T1.Conductor_ID  =  T2.Conductor_ID
SELECT Name FROM conductor WHERE Conductor_ID IN (SELECT Conductor_ID FROM orchestra GROUP BY Conductor_ID HAVING COUNT(*) > 1)
SELECT T1.name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID  =  T2.Conductor_ID GROUP BY T2.Conductor_ID HAVING COUNT(*)  >  1
SELECT Name FROM conductor ORDER BY Conductor_ID DESC LIMIT 1
SELECT T1.name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.conductor_id = T2.conductor_id GROUP BY T2.conductor_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Name FROM orchestra AS T1 JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T1.Year_of_Founded  >  2008
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID  =  T2.Conductor_ID WHERE T2.Year_of_Founded  >  2008
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Record_Company ,  COUNT(*) FROM orchestra GROUP BY Record_Company;
SELECT `Major_Record_Format` FROM `orchestra` GROUP BY `Major_Record_Format` ORDER BY COUNT(*) ASC
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) DESC
SELECT Record_Company  FROM orchestra GROUP BY Record_Company  ORDER BY COUNT(*) DESC  LIMIT 1
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Orchestra FROM performance AS T1 JOIN orchestra AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID WHERE T2.Orchestra_ID NOT IN ( SELECT Orchestra_ID FROM performance )
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT T1.Record_Company FROM orchestra AS T1 JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID WHERE T2.Year_of_Founded < 2003 INTERSECT SELECT T1.Record_Company FROM orchestra AS T1 JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID WHERE T2.Year_of_Founded > 2003
SELECT Record_Company FROM orchestra WHERE Year_of_Founded  < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded  > 2003
SELECT count(*) FROM orchestra WHERE Major_Record_Format IN ('CD','DVD');
SELECT count(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT YEAR_OF_FOUNDED FROM ORCHESTRA GROUP BY Orchestra_ID HAVING COUNT(*)  > 1
SELECT YEAR_OF_FOUNDED FROM Orchestra GROUP BY Conductor_ID HAVING COUNT(Orchestra_ID)  >  1
SELECT count(*) FROM Highschooler
SELECT count(*) FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT grade FROM Highschooler
SELECT grade FROM Highschooler
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT name FROM Highschooler WHERE grade = 10;
SELECT name FROM Highschooler WHERE grade = 10
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT count(*) FROM highschooler WHERE grade = 9 OR grade = 10
SELECT grade ,  COUNT(*) FROM Highschooler GROUP BY grade
SELECT grade, COUNT(*) as number_of_students FROM Highschooler GROUP BY grade;
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT grade FROM highschooler GROUP BY grade HAVING COUNT(*)  >=  4
SELECT student_id, COUNT(friend_id) AS num_friends FROM Friend GROUP BY student_id
SELECT student_id, COUNT(*) as number_of_friends FROM friend GROUP BY student_id;
SELECT name, COUNT(*) as num_friends FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY name ORDER BY num_friends DESC
SELECT name, COUNT(*) AS friend_count FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID, name
SELECT T1.name FROM Highschooler AS T1 JOIN (SELECT T2.student_id FROM Friend AS T2 JOIN Friend AS T3 ON T2.friend_id = T3.student_id WHERE T2.student_id = T3.friend_id GROUP BY T2.student_id ORDER BY COUNT(*) DESC LIMIT 1) AS T2 ON T1.id = T2.student_id
SELECT name FROM Highschooler WHERE ID = (SELECT student_id FROM Friend GROUP BY student_id ORDER BY COUNT(student_id) DESC LIMIT 1)
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend GROUP BY student_id HAVING count(*) >= 3)
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(*) >= 3)
SELECT T1.name FROM highschooler AS T1 JOIN friend AS T2 ON T1.id = T2.student_id JOIN highschooler AS T3 ON T3.id = T2.friend_id WHERE T3.name = 'Kyle'
SELECT t1.name FROM Highschooler AS t1 JOIN Friend AS t2 ON t1.id = t2.student_id WHERE t2.friend_id = 1934
SELECT count(*) FROM FRIEND WHERE STUDENT_ID IN (SELECT ID FROM HIGHSCHOOLER WHERE NAME = 'Kyle')
SELECT COUNT(*) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT ID FROM Highschooler EXCEPT SELECT T1.student_id FROM Friend AS T1 JOIN Friend AS T2 ON T1.friend_id  =  T2.student_id
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT DISTINCT student_id FROM Friend)
SELECT DISTINCT T2.student_id FROM friend AS T1 INNER JOIN likes AS T2 ON T1.student_id = T2.student_id WHERE T1.student_id IN (SELECT student_id FROM friend)
SELECT student_id FROM Friend WHERE student_id IN (SELECT student_id FROM Likes) AND student_id IN (SELECT friend_id FROM Friend)
SELECT h.name FROM Highschooler h WHERE h.ID IN (   SELECT f1.student_id   FROM Friend f1   JOIN Friend f2 ON f1.friend_id = f2.student_id   WHERE f1.student_id != f1.friend_id AND f1.student_id IN (     SELECT l.student_id     FROM Likes l     WHERE l.liked_id IN (       SELECT l2.liked_id       FROM Likes l2       WHERE l2.student_id = h.ID     )   ) ); 
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id JOIN Friend AS T3 ON T1.ID = T3.friend_id JOIN Likes AS T4 ON T1.ID = T4.student_id
SELECT student_id, COUNT(*) FROM Likes GROUP BY student_id;
SELECT student_id, COUNT(*) FROM Likes GROUP BY student_id
SELECT H.name, COUNT(*) as likes FROM Highschooler H JOIN Likes L ON H.ID = L.student_id GROUP BY H.name
SELECT T1.name AS names, COUNT(*) AS num FROM Highschooler AS T1 INNER JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T1.ID
SELECT T3.name FROM Likes AS T1 JOIN Highschooler AS T3 ON T1.liked_id = T3.id GROUP BY T1.liked_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.name HAVING COUNT(*) >= 2
SELECT T2.name FROM likes AS T1 JOIN highschooler AS T2 ON T1.liked_id = T2.ID GROUP BY T2.name HAVING COUNT(*) >= 2
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID  =  T2.student_id WHERE T1.grade  >  5 GROUP BY T1.name HAVING COUNT(*)  >=  2
SELECT name FROM Highschooler WHERE grade > 5 INTERSECT SELECT hs1.name FROM Highschooler hs1 JOIN Friend f ON hs1.ID = f.student_id JOIN Highschooler hs2 ON f.friend_id = hs2.ID GROUP BY hs1.ID HAVING COUNT(*) >= 2;
SELECT COUNT(*) FROM Likes WHERE liked_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM Likes WHERE liked_id IN (SELECT ID FROM Highschooler WHERE name = 'Kyle');
SELECT AVG(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(student_id) > 0)
SELECT AVG(t1.grade) FROM Highschooler AS t1 JOIN friend AS t2 ON t1.ID  =  t2.student_id
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals;
SELECT state FROM ( SELECT state FROM Owners GROUP BY state UNION SELECT state FROM Professionals GROUP BY state ) AS T GROUP BY state HAVING COUNT(*)  >= 2
SELECT AVG(Dogs.age) FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id
SELECT AVG(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT DISTINCT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' OR professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(*) > 2)
SELECT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' UNION SELECT professional_id, last_name, cell_number FROM Treatments WHERE professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(treatment_id) > 2 );
SELECT T2.name  FROM Treatments AS T1 JOIN Dogs AS T2 ON T1.dog_id = T2.dog_id  GROUP BY T2.name  HAVING SUM(T1.cost_of_treatment) <= 1000
SELECT D.name  FROM Dogs D  WHERE NOT EXISTS  (SELECT T.dog_id  FROM Treatments T  JOIN Charges C ON T.treatment_type_code = C.charge_type  WHERE T.dog_id = D.dog_id AND C.charge_amount > 1000)
SELECT first_name FROM Professionals UNION SELECT first_name FROM Owners EXCEPT SELECT name FROM Dogs
SELECT first_name FROM Professionals UNION SELECT first_name FROM Owners EXCEPT SELECT name FROM Dogs
SELECT professional_id, role_code, email_address FROM Professional WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT p.professional_id, p.role_code, p.email_address FROM Professionals AS p WHERE p.professional_id NOT IN (SELECT DISTINCT professional_id FROM Treatments)
SELECT owner_id, first_name, last_name FROM owners GROUP BY owner_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.owner_id, T1.first_name, T1.last_name FROM owners AS T1 INNER JOIN dogs AS T2 ON T1.owner_id = T2.owner_id GROUP BY T1.owner_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT P.professional_id ,  P.role_code ,  P.first_name FROM Professional P LEFT JOIN Treatments T ON P.professional_id = T.professional_id WHERE T.professional_id IS NOT NULL GROUP BY T.professional_id HAVING COUNT(T.professional_id) >= 2
SELECT T1.professional_id ,  T1.role_code ,  T1.first_name FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id  =  T2.professional_id GROUP BY T2.professional_id HAVING COUNT(*)  >=  2
SELECT breed_name FROM Breeds WHERE breed_code IN (   SELECT breed_code   FROM Dogs   GROUP BY breed_code   ORDER BY COUNT(*) DESC   LIMIT 1 )
SELECT breed_name  FROM breeds  WHERE breed_code IN (     SELECT breed_code      FROM dogs      GROUP BY breed_code      ORDER BY count(*) DESC      LIMIT 1 );
SELECT owner_id ,  last_name FROM Owners ORDER BY (SELECT COUNT(*) FROM Treatments WHERE Treatments.dog_id = Dogs.dog_id) DESC LIMIT 1
SELECT t1.owner_id, t2.last_name FROM dogs AS t1 JOIN owners AS t2 ON t1.owner_id = t2.owner_id JOIN treatments AS t3 ON t3.dog_id = t1.dog_id WHERE t3.date_of_treatment IS NOT NULL GROUP BY t2.owner_id ORDER BY SUM(t3.cost_of_treatment) DESC LIMIT 1
SELECT size_description FROM Treatments AS T1 JOIN dogs AS T2 ON T1.dog_id = T2.dog_id WHERE T2.weight LIKE 'SMALL' GROUP BY T1.treatment_type_code ORDER BY SUM(T1.cost_of_treatment) ASC LIMIT 1
SELECT SUM(t.cost_of_treatment), tt.treatment_type_description FROM Treatments t JOIN Treatment_Types tt ON t.treatment_type_code = tt.treatment_type_code GROUP BY tt.treatment_type_description ORDER BY SUM(t.cost_of_treatment) ASC LIMIT 1
SELECT owner_id ,  zip_code FROM Owners WHERE owner_id IN ( SELECT owner_id FROM Dogs WHERE dog_id IN ( SELECT dog_id FROM Treatments ORDER BY cost_of_treatment DESC LIMIT 1 ) )
SELECT T1.owner_id ,  T1.zip_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id JOIN Treatments AS T3 ON T2.dog_id  =  T3.dog_id JOIN Charges AS T4 ON T3.treatment_type_code  =  T4.charge_type GROUP BY T1.owner_id ORDER BY SUM(T4.charge_amount) DESC LIMIT 1
SELECT professional_id ,  cell_number FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2
SELECT P.professional_id, P.cell_number FROM Professionals P JOIN Treatments T ON P.professional_id = T.professional_id GROUP BY P.professional_id, P.cell_number HAVING COUNT(DISTINCT T.treatment_type_code) >= 2
SELECT first_name ,  last_name FROM professionals WHERE professional_id IN (SELECT professional_id FROM treatments WHERE cost_of_treatment < (SELECT avg(cost_of_treatment) FROM treatments))
SELECT first_name ,  last_name FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments WHERE cost_of_treatment < (SELECT avg(cost_of_treatment) FROM Treatments))
SELECT T2.date_of_treatment, T1.first_name FROM Professionals AS T1 INNER JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id
SELECT treatments.date_of_treatment, professionals.first_name FROM treatments JOIN professionals ON treatments.professional_id = professionals.professional_id;
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT T3.cost_of_treatment, T1.treatment_type_description FROM Treatment_types AS T1 JOIN Treatments AS T2 ON T1.treatment_type_code = T2.treatment_type_code JOIN Charges AS T3 ON T2.charge_id = T3.charge_id
SELECT T4.first_name ,  T4.last_name ,  T6.size_description FROM Treatments AS T1 JOIN Dogs AS T2 ON T1.dog_id  =  T2.dog_id JOIN Professionals AS T3 ON T1.professional_id  =  T3.professional_id JOIN Owners AS T4 ON T2.owner_id  =  T4.owner_id JOIN Sizes AS T6 ON T2.size_code  =  T6.size_code
SELECT T1.first_name ,  T1.last_name ,  T2.size_description FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id  =  T2.owner_id
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id
SELECT T1.first_name, T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id
SELECT T1.name, T2.date_of_treatment FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id INNER JOIN Breeds AS T3 ON T1.breed_code = T3.breed_code WHERE T3.breed_name = ( SELECT breed_name FROM Dogs AS T4 GROUP BY breed_name ORDER BY count(*) LIMIT 1 )
SELECT d.name, t.date_of_treatment FROM Dogs AS d JOIN Treatments AS t ON d.dog_id = t.dog_id JOIN Breeds AS b ON d.breed_code = b.breed_code WHERE b.breed_code IN (SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT T1.first_name ,  T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id WHERE T1.state = 'Virginia'
SELECT T3.first_name, T4.name FROM Breeds AS T1  JOIN Dogs AS T2 ON T1.breed_code = T2.breed_code  JOIN Owners AS T3 ON T2.owner_id = T3.owner_id  WHERE T3.state = 'Virginia'
SELECT d.date_arrived, d.date_departed FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id
SELECT d.date_arrived, d.date_departed FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id
SELECT last_name FROM owners WHERE owner_id IN (SELECT owner_id FROM dogs ORDER BY date_of_birth DESC LIMIT 1)
SELECT last_name FROM owners WHERE owner_id IN (SELECT owner_id FROM dogs ORDER BY date_of_birth DESC LIMIT 1)
SELECT email_address FROM Professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT date_arrived, date_departed FROM Dogs
SELECT dog_id, date_arrived, date_departed FROM Dogs
SELECT COUNT(DISTINCT dog_id) FROM Treatments
SELECT COUNT(DISTINCT d.dog_id) AS number_of_dogs_treated FROM Treatments t JOIN Dogs d ON t.dog_id = d.dog_id
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT first_name, last_name, email_address FROM owners WHERE state LIKE '%North%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT MAX(T1.cost_of_treatment) FROM Treatments AS T1 ORDER BY T1.treatment_id DESC LIMIT 1
SELECT COUNT(DISTINCT dog_id) FROM Dogs WHERE treatment_id IS NULL
SELECT COUNT(T1.dog_id) AS num_of_dogs FROM Dogs AS T1 LEFT JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id WHERE T2.dog_id IS NULL
SELECT COUNT(o.owner_id) FROM Owners o WHERE o.date_adopted IS NULL;
SELECT COUNT(T1.owner_id) FROM Owners AS T1 LEFT JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id WHERE T2.date_departed IS NULL
SELECT COUNT(*) FROM Professional_Roles AS PR LEFT JOIN Treatments AS T ON PR.role_code = T.treatment_type_code WHERE T.professional_id IS NULL
SELECT count(*) FROM Professional WHERE professional_id NOT IN ( SELECT professional_id FROM Treatments )
SELECT `name`, `age`, `weight` FROM `Dogs` WHERE `abandoned_yn` = '1'
SELECT T1.name, T1.age, T1.weight FROM Dogs AS T1 INNER JOIN Breeds AS T2 ON T1.breed_code = T2.breed_code WHERE T1.abandoned_yn = 1
SELECT avg(age) FROM Dogs
SELECT AVG(T2.age) FROM Dogs AS T1 INNER JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id
SELECT MAX(age) FROM Dogs
SELECT MAX(age) FROM Dogs  ;
SELECT charge_type, SUM(charge_amount) FROM CHARGES GROUP BY charge_type
SELECT charge_type, charge_amount FROM CHARGES
SELECT charge_amount FROM Charges ORDER BY charge_amount DESC LIMIT 1
SELECT MAX(T1.charge_amount) FROM Charges AS T1
SELECT email_address, cell_number, home_phone FROM professionals
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT DISTINCT breed_code, size_code FROM Dogs;
SELECT DISTINCT breed_code, size_code FROM Dogs
SELECT P.first_name, T.treatment_type_description FROM Professionals P JOIN Treatments T ON P.professional_id = T.professional_id
SELECT T1.first_name, T3.treatment_type_description FROM professionals AS T1 JOIN treatments AS T2 ON T1.professional_id = T2.professional_id JOIN treatment_types AS T3 ON T2.treatment_type_code = T3.treatment_type_code
SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC;
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year ,  Citizenship FROM singer;
SELECT Birth_Year, Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949);
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949)
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1;
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT citizenship ,  COUNT(*) FROM singer GROUP BY citizenship
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT citizenship FROM singer GROUP BY citizenship ORDER BY count(*) DESC LIMIT 1
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship ,  MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT COUNT(DISTINCT Citizenship), MAX(Net_Worth_Millions) FROM singer
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT T2.Title, T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID
SELECT DISTINCT T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T1.Sales > 300000
SELECT DISTINCT T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T1.Sales > 300000;
SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID HAVING COUNT(T2.Song_ID) > 1
SELECT T3.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN singer AS T3 ON T2.Singer_ID = T3.Singer_ID GROUP BY T3.Name HAVING COUNT(T1.Song_ID) > 1
SELECT s.Name, SUM(so.Sales) FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name
SELECT s.Name, SUM(so.Sales) AS Total_Sales  FROM singer s  JOIN song so ON s.Singer_ID = so.Singer_ID  GROUP BY s.Name
SELECT Name FROM singer WHERE singer_id NOT IN (SELECT singer_id FROM song)
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song);
SELECT citizenship FROM singer WHERE birth_year < 1945 INTERSECT SELECT citizenship FROM singer WHERE birth_year > 1955
SELECT DISTINCT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT DISTINCT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT count(*) FROM Other_Available_Features  SELECT    COUNT(feature_id)  FROM    Other_Available_Features
SELECT feature_type_name FROM Ref_Feature_Types WHERE feature_type_code = 'Amenity'
SELECT T2.property_type_description FROM properties AS T1 INNER JOIN Ref_property_types AS T2 ON T1.property_type_code = T2.property_type_code
SELECT t2.property_name FROM Ref_Property_Types t1 JOIN Properties t2 ON t1.property_type_code = t2.property_type_code WHERE t1.property_type_description IN ('House', 'Apartment') AND t2.room_count > 1
