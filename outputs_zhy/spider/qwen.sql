SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT Name ,  Country ,  Age FROM singer ORDER BY Age DESC
SELECT Name ,  Country ,  Age FROM singer ORDER BY Age DESC
SELECT AVG(Age) ,  MIN(Age) ,  MAX(Age) FROM singer WHERE Country  =  "France"
SELECT avg(Age) ,  min(Age) ,  max(Age) FROM singer WHERE Country  =  "France";
SELECT T2.Song_Name ,  T2.Song_release_year FROM singer AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID ORDER BY T1.Age LIMIT 1
SELECT name ,  song_release_year FROM singer ORDER BY age ASC LIMIT 1
SELECT DISTINCT T1.Country FROM singer AS T1 INNER JOIN singer_in_concert AS T2 ON T1.Singer_ID  =  T2.Singer_ID WHERE T1.Age  >  20
SELECT DISTINCT country FROM singer WHERE age  >  20
SELECT Country ,  COUNT(*) FROM singer GROUP BY Country
SELECT count(*) ,  T2.Country FROM singer AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T2.Country
SELECT DISTINCT Song_Name FROM singer WHERE Age  >  (SELECT avg(Age) FROM singer)
SELECT T1.song_name FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID  =  T2.Singer_ID ORDER BY T1.age DESC LIMIT 1
SELECT LOCATION ,  NAME FROM stadium WHERE CAPACITY BETWEEN 5000 AND 10000
SELECT T1.Location ,  T1.Name FROM stadium AS T1 WHERE T1.capacity BETWEEN 5000 AND 10000
SELECT MAX(capacity) ,  AVG(capacity) FROM stadium
SELECT AVG(Capacity) ,  MAX(Capacity) FROM stadium
SELECT name ,  capacity FROM stadium ORDER BY average DESC LIMIT 1
SELECT T1.Name ,  T1.Capacity FROM stadium AS T1 ORDER BY T1.Average DESC LIMIT 1
SELECT count(*) FROM concert WHERE YEAR  =  "2014" OR YEAR  =  "2015";
SELECT COUNT(*) FROM concert WHERE YEAR  =  2014 OR YEAR  =  2015
SELECT s.Name, COUNT(c.concert_ID) FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Stadium_ID
SELECT COUNT(concert_Name) ,  stadium_ID FROM concert GROUP BY stadium_ID
SELECT T2.name ,  T2.capacity FROM concert AS T1 JOIN stadium AS T2 ON T1.stadium_id  =  T2.stadium_id WHERE T1.year  >=  2014 GROUP BY T2.name ,  T2.capacity ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name ,  T1.Capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID  =  T2.Stadium_ID WHERE T2.Year > 2013 GROUP BY T1.Stadium_ID ORDER BY COUNT(T2.concert_ID) DESC LIMIT 1
SELECT YEAR FROM concert GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)
SELECT t2.name FROM concert AS t1 JOIN stadium AS t2 ON t1.stadium_id = t2.stadium_id WHERE t1.stadium_id IS NULL
SELECT Country FROM singer WHERE Age  >  40 INTERSECT SELECT Country FROM singer WHERE Age  <  30
SELECT DISTINCT T1.Name FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year != 2014
SELECT DISTINCT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert WHERE year = '2014')
SELECT T1.concert_Name ,  T1.theme ,  COUNT(T2.Singer_ID) FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_ID  =  T2.concert_ID GROUP BY T2.concert_ID
SELECT T1.concert_Name, T1.theme, COUNT(*) FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_ID  =  T2.concert_ID GROUP BY T2.concert_ID
SELECT Singer.Name ,  COUNT(DISTINCT Concert.Concert_ID) FROM Singer_in_concert AS SIC JOIN Concert ON SIC.Concert_ID = Concert.Concert_ID JOIN Singer ON SIC.Singer_ID = Singer.Singer_ID GROUP BY Singer.Name
SELECT T1.name ,  count(*) FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.singer_id  =  T2.singer_id GROUP BY T1.name
SELECT DISTINCT T2.Name FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN concert AS T3 ON T1.concert_ID = T3.concert_ID WHERE T3.Year = 2014
SELECT t2.Name FROM concert AS T1 JOIN singer_in_concert AS T3 ON T1.concert_ID = T3.concert_ID JOIN singer AS T2 ON T3.Singer_ID = T2.Singer_ID WHERE T1.Year = 2014
SELECT T1.name FROM singer AS T1 INNER JOIN singersong AS T2 ON T1.singer_id  =  T2.singer_id WHERE T2.song_name LIKE 'Hey%'
SELECT T1.Name ,  T1.Country FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID  =  T2.Singer_ID WHERE T1.Song_Name LIKE '%Hey%'
SELECT T2.Name ,  T2.Location FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID  =  T2.Stadium_ID WHERE T1.Year  =  2014 INTERSECT SELECT T2.Name ,  T2.Location FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID  =  T2.Stadium_ID WHERE T1.Year  =  2015
SELECT T1.Name ,  T1.Location FROM stadium AS T1 JOIN ( SELECT t2.Stadium_ID FROM concert AS t2 WHERE t2.Year  =  2014 INTERSECT SELECT t3.Stadium_ID FROM concert AS t3 WHERE t3.Year  =  2015) AS T2 ON T1.Stadium_ID  =  T2.Stadium_ID
SELECT COUNT(*) FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID  =  T2.Stadium_ID ORDER BY T2.Capacity DESC LIMIT 1
SELECT count(*) FROM stadium WHERE capacity = ( SELECT max(capacity) FROM stadium )
SELECT COUNT(*) FROM Pets WHERE weight > 10
SELECT COUNT(*) FROM Pets WHERE weight > 10
SELECT min(weight) FROM Pets WHERE petType = 'dog'
SELECT weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType;
SELECT t2.PetType, MAX(t2.weight) as MaxWeight FROM Has_Pet t1 JOIN Pets t2 ON t1.PetID = t2.PetID GROUP BY t2.PetType
SELECT COUNT(*) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.Age > 20
SELECT COUNT(*) FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.age > 20
SELECT COUNT(*) FROM Has_Pet hp JOIN Student s ON hp.StuID = s.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE s.Sex = 'F' AND p.PetType = 'dog'
SELECT COUNT(*) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.Sex = 'F' AND T3.PetType = 'dog'
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT T2.fname FROM has_pet AS T1 JOIN student AS T2 ON T1.stuid = T2.stuid JOIN pets AS T3 ON T3.petid = T1.petid WHERE T3.pettype IN ('cat', 'dog')
SELECT DISTINCT T1.fname FROM STUDENT AS T1 JOIN HAS_PET AS T2 ON T1.stuid = T2.stuid JOIN PETS AS T3 ON T2.petid = T3.petid WHERE T3.PetType IN ('cat', 'dog')
SELECT T1.fname FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.stuid = T2.stuid INNER JOIN Pets AS T3 ON T2.petid = T3.petid WHERE T3.pettype = 'cat' INTERSECT SELECT T1.fname FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.stuid = T2.stuid INNER JOIN Pets AS T3 ON T2.petid = T3.petid WHERE T3.pettype = 'dog'
SELECT T.Fname FROM ( SELECT S.Fname, COUNT(DISTINCT HP.PetID) AS NumPets FROM Student AS S INNER JOIN Has_Pet AS HP ON S.StuID = HP.StuID INNER JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType IN ('cat', 'dog') GROUP BY S.Fname ) AS T WHERE T.NumPets = 2
SELECT major, age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT t1.major, t1.age FROM Student AS t1 JOIN Has_Pet AS t2 ON t1.stuid  =  t2.stuid WHERE t2.petid <> (SELECT petid FROM Pets WHERE pettype  =  'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'));
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'));
SELECT T1.Fname, T1.age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog' AND T3.PetID NOT IN (SELECT PetID FROM Pets WHERE PetType = 'cat')
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'dog')) AND StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC, weight DESC LIMIT 1
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT T1.PetType ,  AVG(T2.age) ,  MAX(T2.age) FROM Pets AS T1 JOIN Student AS T2 ON T1.PetID  =  T2.PetID GROUP BY T1.PetType
SELECT PetType, AVG(pet_age) AS Average_Age, MAX(pet_age) AS Maximum_Age FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType;
SELECT avg(weight) ,  PetType FROM pets GROUP BY PetType
SELECT T1.Fname, T1.Age FROM STUDENT AS T1 JOIN HAS_PET AS T2 ON T1.StuID = T2.StuID
SELECT DISTINCT T2.Fname, T2.age FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID = T2.StuID
SELECT PetID FROM Has_Pet WHERE StuID = (SELECT StuID FROM Student WHERE LName = 'Smith')
SELECT petid FROM Has_Pet WHERE StuID = (SELECT StuID FROM Student WHERE LName = 'Smith')
SELECT StuID, COUNT(*) AS NumPets FROM Has_Pet GROUP BY StuID
SELECT StuID, COUNT(PetID) AS Pet_Count  FROM Has_Pet GROUP BY StuID
SELECT T1.Fname, T1.Sex FROM Student AS T1 INNER JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T2.StuID HAVING COUNT(*) > 1
SELECT Fname, Sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet GROUP BY StuID HAVING COUNT(PetID) > 1)
SELECT t1.lname FROM Student AS t1 JOIN Has_Pet AS t2 ON t1.stuid = t2.stuid JOIN Pets AS t3 ON t2.petid = t3.petid WHERE t3.pettype = 'cat' AND t3.pet_age = 3
SELECT t1.lname FROM STUDENT AS t1 JOIN HAS_PET AS t2 ON t1.stuid  =  t2.stuid JOIN PETS AS t3 ON t3.petid  =  t2.petid WHERE t3.pettype  =  'cat' AND t3.pet_age = 3
SELECT AVG(age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT count(*) FROM continents
SELECT count(DISTINCT Continent) FROM countries
SELECT T1.ContId, T1.Continent, COUNT(T2.CountryId) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId = T2.Continent GROUP BY T2.Continent
SELECT ContId, Continent, COUNT(*) FROM continents GROUP BY ContId
SELECT count(*) FROM countries
SELECT count(CountryId) FROM countries
SELECT maker ,  COUNT(*) ,  fullname FROM car_makers GROUP BY maker
SELECT T1.Id ,  T1.FullName ,  COUNT(*) FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id  =  T2.Maker GROUP BY T1.Id
SELECT T2.Model FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.Model ORDER BY T1.Horsepower LIMIT 1
SELECT Model FROM car_names ORDER BY Horsepower ASC LIMIT 1
SELECT DISTINCT T2.Model FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.ModelId WHERE T1.Weight < ( SELECT AVG(T1.Weight) FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.ModelId )
SELECT T2.Model FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.Model WHERE T1.Weight < ( SELECT avg(T1.Weight) FROM cars_data AS T1 )
SELECT DISTINCT T2.Maker FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.Model WHERE T1.Year = 1970
SELECT DISTINCT T2.FullName FROM car_makers AS T1 JOIN model_list AS T3 ON T1.Id = T3.Maker JOIN cars_data AS T4 ON T3.Model = T4.Id WHERE T4.Year = 1970
SELECT T3.Make, T1.Year FROM cars_data AS T1  JOIN car_names AS T2 ON T1.Id = T2.MakeId  JOIN car_makers AS T3 ON T2.Make = T3.Maker  ORDER BY T1.Year ASC LIMIT 1
SELECT car_makers.Maker, MIN(cars_data.Year) FROM car_makers JOIN car_names ON car_makers.Id = car_names.MakeId JOIN cars_data ON car_names.Model = cars_data.Id
SELECT DISTINCT T1.Model FROM model_list AS T1 INNER JOIN car_names AS T2 ON T1.Model = T2.Model INNER JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Year > 1980
SELECT DISTINCT T2.Model FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.Model WHERE T1.Year > 1980
SELECT T1.Continent, COUNT(*) FROM Continents AS T1 JOIN Countries AS T2 ON T1.ContId  =  T2.Continent JOIN Car_makers AS T3 ON T2.CountryId  =  T3.Country GROUP BY T1.Continent
SELECT T1.Continent ,  COUNT(T2.Id) FROM continents AS T1 JOIN car_makers AS T2 ON T1.ContId  =  T2.Country GROUP BY T1.Continent
SELECT T2.CountryName FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker  =  T2.Id GROUP BY T2.CountryName ORDER BY count(*) DESC LIMIT 1
SELECT CountryName FROM countries WHERE CountryId = ( SELECT COUNT(*) FROM car_makers GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT T1.FullName, COUNT(*) FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id = T2.Make GROUP BY T1.FullName
SELECT model_list.Maker, COUNT(car_names.Model), car_makers.Id, car_makers.FullName FROM model_list JOIN car_names ON model_list.Model = car_names.Model JOIN car_makers ON car_names.Make = car_makers.Id GROUP BY model_list.Maker
SELECT T2.Accelerate FROM car_makers AS T1 JOIN cars_data AS T2 ON T1.Id  =  T2.Id WHERE T1.FullName  =  "amc hornet sportabout (sw)"
SELECT T2.accelerate FROM model_list AS T1 JOIN cars_data AS T2 ON T1.Model = T2.Id WHERE T1.Model = 'amc hornet sportabout'
SELECT COUNT(*) FROM car_makers WHERE Country = (SELECT CountryId FROM countries WHERE CountryName = 'France')
SELECT COUNT(*) FROM car_makers WHERE Country = (SELECT CountryId FROM countries WHERE CountryName = 'France')
SELECT COUNT(T1.Model) FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker  =  T2.Id WHERE T2.Country  =  "usa"
SELECT COUNT(T1.Model) FROM model_list AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId WHERE T2.CountryName = 'United States'
SELECT AVG(cars_data.MPG) FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId WHERE cars_data.Cylinders = 4
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT Weight FROM cars_data INNER JOIN model_list ON cars_data.Id = model_list.Model INNER JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Country IN (SELECT CountryId FROM countries WHERE Continent = 'North America') AND cars_data.Cylinders = 8 AND cars_data.Year = 1974 ORDER BY Weight ASC LIMIT 1
SELECT min(t3.weight) FROM model_list AS t1 JOIN cars_data AS t3 ON t3.id  =  t1.Model WHERE t3.cylinders  =  8 AND t3.year  =  1974
SELECT DISTINCT T1.Maker, T2.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model
SELECT Model FROM model_list
SELECT T3.CountryName, T3.CountryId FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id JOIN countries AS T3 ON T2.Country = T3.CountryId GROUP BY T3.CountryId, T3.CountryName HAVING COUNT(DISTINCT T1.Maker) >= 1
SELECT COUNT(*) ,  DISTINCT T2.CountryName FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T1.Country
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year
SELECT avg(weight), Year FROM cars_data GROUP BY Year
SELECT T3.Continent FROM countries AS T1 JOIN car_makers AS T2 ON T2.Country = T1.CountryId JOIN continents AS T3 ON T3.ContId = T1.Continent WHERE T3.Continent = 'Europe' GROUP BY T3.Continent, T2.Country HAVING COUNT(T2.Id) >= 3
SELECT T2.CountryName FROM countries AS T1 JOIN continents AS T3 ON T1.Continent = T3.ContId WHERE T3.Continent = 'Europe' GROUP BY T2.CountryName HAVING COUNT(T1.CountryId) >= 3
SELECT cn.Make, MAX(cd.Horsepower) FROM cars_data cd JOIN car_names cn ON cd.Id = cn.MakeId WHERE cd.Cylinders = 3
SELECT horsepower, maker FROM ( SELECT h.horsepower, c.maker, m.model FROM cars_data h JOIN car_names n ON h.Id = n.MakeId JOIN model_list m ON n.model = m.Model WHERE cylinders = 3 ORDER BY horsepower DESC LIMIT 1 )
SELECT T1.Model, T1.Make FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id ORDER BY CAST(T2.MPG AS REAL) DESC LIMIT 1
SELECT T2.Model FROM cars_data AS T1 JOIN model_list AS T2 ON T2.Model = T1.Model ORDER BY T1.MPG DESC LIMIT 1
SELECT AVG(T1.horsepower) FROM cars_data AS T1 JOIN model_list AS T2 ON T1.id = T2.model WHERE T1.year < 1980
SELECT AVG(T1.Horsepower) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Model LIKE '%%';
SELECT avg(cars_data.edispl) FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id INNER JOIN model_list AS T3 ON T1.Model = T3.Model WHERE T3.Model = 'volvo';
SELECT AVG(T2.edispl) FROM car_makers AS T1 JOIN cars_data AS T2 ON T1.Id = T2.MakeId WHERE T1.Maker = 'volvo'
SELECT MAX(Accelerate), Cylinders FROM cars_data GROUP BY Cylinders
SELECT T2.Cylinders, MAX(T3.Accelerate) FROM car_names AS T1 JOIN model_list AS T2 ON T1.Make = T2.Model JOIN cars_data AS T3 ON T1.MakeId = T3.Id GROUP BY T2.Cylinders
SELECT Model FROM model_list GROUP BY Model ORDER BY COUNT(*) DESC LIMIT 1
SELECT Model FROM model_list GROUP BY Model ORDER BY count(*) DESC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(cars_data.Id) FROM cars_data
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE FullName = 'American Motor Company')
SELECT COUNT(*) FROM model_list WHERE Maker = (SELECT Id FROM car_makers WHERE Maker = 'American Motor Company')
SELECT Maker FROM car_makers GROUP BY Maker HAVING COUNT(Model) > 3
SELECT Id, Maker FROM car_makers WHERE Id IN ( SELECT Maker FROM model_list GROUP BY Maker HAVING COUNT(*)  >  3 )
SELECT DISTINCT T1.Model FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker  =  T2.Id WHERE T2.FullName  =  'General Motors' UNION SELECT DISTINCT T3.Model FROM cars_data AS T3 JOIN car_names AS T4 ON T3.Id  =  T4.MakeId WHERE T3.Weight  >  3500
SELECT DISTINCT M.Model FROM model_list M JOIN car_makers C ON M.Maker = C.Id WHERE (C.Maker = 'General Motors' OR C.Country = '3500')
SELECT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000
SELECT DISTINCT YEAR FROM cars_data WHERE Weight < 4000 INTERSECT SELECT DISTINCT YEAR FROM cars_data WHERE Weight > 3000;
SELECT horsepower FROM cars_data ORDER BY accelerate DESC LIMIT 1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT cylinders FROM cars_data WHERE Model = 'volvo' ORDER BY accelerate ASC LIMIT 1
SELECT cylinders FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.id = T2.MakeId INNER JOIN model_list AS T3 ON T2.model = T3.Model WHERE T3.model = 'volvo' ORDER BY T1.accelerate ASC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT Max(Horsepower) FROM cars_data)
SELECT count(*) FROM ( SELECT T1.Model FROM model_list AS T1 JOIN cars_data AS T2 ON T1.ModelId = T2.Id WHERE T2.Accelerate > ( SELECT max(T2.Horsepower) FROM cars_data AS T2 ) )
SELECT COUNT(DISTINCT T2.CountryName) FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T1.Country HAVING COUNT(DISTINCT T1.Maker) > 2
SELECT COUNT(DISTINCT Country) FROM countries WHERE CountryId IN (SELECT Id FROM car_makers GROUP BY Country HAVING COUNT(Id) > 2)
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT COUNT(Id) FROM cars_data WHERE Cylinders > 6
SELECT Model FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE Continent IN (SELECT ContId FROM continents WHERE Continent = "Asia"))) AND Model IN (SELECT Model FROM cars_data WHERE Cylinders = 4) ORDER BY Horsepower DESC LIMIT 1
SELECT Model FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE Continent IN (SELECT ContId FROM continents WHERE Continent = "Europe"))) AND Model IN (SELECT Model FROM cars_data WHERE Cylinders = 4) ORDER BY Horsepower DESC LIMIT 1
SELECT c.MakeId, c.Make FROM car_names AS c INNER JOIN cars_data AS d ON c.MakeId = d.Id WHERE d.Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND d.Cylinders <= 3
SELECT DISTINCT T1.MakeId, T1.Model FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id INNER JOIN model_list AS T3 ON T1.Model = T3.Model WHERE T2.Horsepower < 4
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 AND Year < 1980
SELECT max(T1.mpg) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.cylinders = 8 OR T1.year < 1980
SELECT T2.Model FROM cars_data AS T1 JOIN model_list AS T2 ON T2.Model = T1.Make WHERE T1.Weight < 3500 AND T2.Maker != ( SELECT Id FROM car_makers WHERE Maker = 'Ford Motor Company' )
SELECT DISTINCT model FROM model_list WHERE ModelId IN (SELECT Id FROM cars_data WHERE Weight < 3500) AND Model NOT IN (SELECT Model FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Maker = 'Ford Motor Company'))
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT DISTINCT Country FROM car_makers)
SELECT CountryName FROM countries WHERE NOT EXISTS (SELECT 1 FROM car_makers WHERE Country = CountryId);
SELECT Id, Maker FROM car_makers WHERE Model IN (SELECT DISTINCT Model FROM model_list) GROUP BY Maker HAVING COUNT(Model) >= 2 AND COUNT(Id) >= 3
SELECT M.Id, M.Maker FROM car_makers AS M INNER JOIN model_list AS L ON M.Id = L.Maker GROUP BY M.Id, M.Maker HAVING COUNT(DISTINCT L.Model) >= 2 AND SUM(COUNT(DISTINCT L.Model)) OVER (PARTITION BY M.Id) > 3
SELECT CountryId, CountryName FROM countries WHERE CountryId IN ( SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(*) > 3 UNION SELECT Country FROM model_list WHERE Model = 'fiat' )
SELECT T3.CountryId, T3.CountryName FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN countries AS T3 ON T1.Country = T3.CountryId GROUP BY T3.CountryId, T3.CountryName HAVING COUNT(T1.Id) > 3 OR COUNT(T2.Model) > 0
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Airline ,  Abbreviation FROM airlines WHERE Country = 'USA'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT AirportCode ,  AirportName FROM airports WHERE City  =  'Anthony'
SELECT count(*) FROM airlines
SELECT COUNT(*) FROM airlines;
SELECT count(*) FROM airports
SELECT count(*) FROM airports
SELECT count(*) FROM flights
SELECT count(*) FROM flights
SELECT uid FROM airlines WHERE Abbreviation = 'UAL'
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT count(*) FROM airlines WHERE Country = 'USA'
SELECT count(*) FROM airlines WHERE Country = 'USA'
SELECT City, Country FROM airports WHERE AirportCode = 'ALB'
SELECT City, Country FROM airports WHERE AirportCode = 'ALN'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen '
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen '
SELECT count(*) FROM flights WHERE SourceAirport = 'ABR'
SELECT count(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'
SELECT count(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen '
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode JOIN airports AS T3 ON T1.DestAirport = T3.AirportCode WHERE T2.City = 'Aberdeen' AND T3.City = 'Ashley'
SELECT count(*) FROM flights WHERE SourceAirport = 'ABR' AND DestAirport = 'ASY'
SELECT count(*) FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'JetBlue Airways'
SELECT count(*) FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T1.Airline  =  "Jetblue Airways"
SELECT COUNT(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T2.Airline = 'United Airlines' AND T1.DestAirport = 'ASY'
SELECT count(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid WHERE T2.Airline  =  'United Airlines' AND T1.DestAirport  =  'ASY'
SELECT count(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid WHERE T2.Airline  =  'United Airlines' AND T1.SourceAirport  =  'AHD'
SELECT COUNT(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.SourceAirport = 'AHD' AND T2.Airline = 'United Airlines'
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode JOIN airlines AS T3 ON T1.Airline = T3.uid WHERE T2.City = 'Aberdeen ' AND T3.Airline = 'United Airlines'
SELECT count(*) FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen ' AND Country = 'United States ') AND Airline IN (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.City, COUNT(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.City FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T2.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT City FROM airports WHERE AirportCode = (SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(SourceAirport) DESC LIMIT 1)
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) DESC LIMIT 1
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.AirportCode FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.SourceAirport GROUP BY T1.AirportCode ORDER BY count(*) ASC LIMIT 1
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) ASC LIMIT 1
SELECT a.Airline FROM flights AS t1 JOIN airlines AS a ON t1.Airline = a.uid GROUP BY t1.Airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.Airline FROM airlines AS t1 JOIN flights AS t2 ON t1.uid  =  t2.Airline GROUP BY t1.Airline ORDER BY count(*) DESC LIMIT 1
SELECT T2.abbreviation, T2.country FROM flights AS T1 JOIN airlines AS T2 ON T1.airline = T2.uid GROUP BY T2.uid ORDER BY count(*) ASC LIMIT 1
SELECT Abbreviation, Country FROM airlines ORDER BY (SELECT COUNT(*) FROM flights WHERE Airline = airlines.uid) LIMIT 1
SELECT DISTINCT T2.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.SourceAirport = 'AHD'
SELECT DISTINCT T2.Airline FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.AirportCode = 'AHD'
SELECT DISTINCT a1.Airline FROM airlines AS a1 JOIN flights AS f ON a1.uid = f.Airline WHERE f.DestAirport = 'AHD'
SELECT T2.Airline FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline  =  T2.uid WHERE T1.DestAirport  =  'AHD'
SELECT DISTINCT T2.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid WHERE T1.SourceAirport  =  'APG' AND T1.DestAirport  =  'CVO'
SELECT a.Airline FROM airlines a JOIN (SELECT f.Airline FROM flights f WHERE f.SourceAirport = 'APG' INTERSECT SELECT f.Airline FROM flights f WHERE f.SourceAirport = 'CVO') f ON a.uid = f.Airline
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T2.SourceAirport  =  'CVO' EXCEPT SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T2.SourceAirport  =  'APG'
SELECT DISTINCT a.Airline FROM airlines a INNER JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport = 'CVO' EXCEPT SELECT DISTINCT a.Airline FROM airlines a INNER JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport = 'APG'
SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(*)  >=  10
SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(*)  >=  10
SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(*) < 200
SELECT COUNT(*), Airline FROM flights GROUP BY Airline HAVING COUNT(*)  <  200
SELECT DISTINCT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG';
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport  =  T2.AirportCode WHERE T2.City  =  'Aberdeen'
SELECT FlightNo FROM flights WHERE DestAirport = (SELECT AirportCode FROM airports WHERE City = 'Aberdeen ');
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City IN ('Aberdeen', 'Abilene')
SELECT COUNT(*) FROM flights WHERE DestAirport IN ('ABR', 'ABI');
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights)
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT DISTINCT SourceAirport FROM flights UNION ALL SELECT DISTINCT DestAirport FROM flights)
SELECT count(*) FROM employee
SELECT count(*) FROM employee
SELECT name FROM employee ORDER BY age ASC
SELECT Name FROM employee ORDER BY Age ASC
SELECT City, COUNT(*) FROM employee GROUP BY City
SELECT city ,  count(*) FROM employee GROUP BY city
SELECT City FROM employee WHERE Age  <  30 GROUP BY City HAVING COUNT(*)  >  1
SELECT DISTINCT City FROM employee WHERE Age  <  30 GROUP BY City HAVING COUNT(*)  >  1
SELECT `Location`, COUNT(`Shop_ID`) FROM `shop` GROUP BY `Location`
SELECT COUNT(*) ,  LOCATION FROM shop GROUP BY LOCATION
SELECT T1.Manager_name, T1.District FROM shop AS T1 JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID WHERE T2.Is_full_time = 'T' AND T1.Number_products = (SELECT MAX(Number_products) FROM shop)
SELECT T2.Manager_name ,  T2.District FROM shop AS T2 JOIN hiring AS T3 ON T2.Shop_ID  =  T3.Shop_ID JOIN employee AS T4 ON T3.Employee_ID  =  T4.Employee_ID WHERE T2.Number_products  =  ( SELECT MAX(Number_products) FROM shop )
SELECT min(Number_products) ,  max(Number_products) FROM shop
SELECT min(Number_products) ,  max(Number_products) FROM shop
SELECT Name ,  Location ,  District FROM shop ORDER BY Number_products DESC
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT Name FROM shop WHERE Number_products  >  (SELECT avg(Number_products) FROM shop)
SELECT t2.name FROM hiring AS t1 JOIN shop AS t2 ON t1.shop_id  =  t2.shop_id WHERE t2.number_products > (SELECT avg(number_products) FROM shop)
SELECT T2.Name FROM evaluation AS T1 JOIN employee AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Employee_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.name FROM evaluation AS T1 JOIN employee AS T2 ON T1.employee_id  =  T2.employee_id GROUP BY T1.employee_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name FROM Employee AS T1 JOIN Evaluation AS T2 ON T1.Employee_ID  =  T2.Employee_ID WHERE T2.Bonus = ( SELECT MAX(Bonus) FROM Evaluation WHERE Bonus < 10000 )
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T2.Bonus DESC LIMIT 1
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID WHERE T2.Year_awarded IS NULL
SELECT name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation);
SELECT T2.Name FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T2.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM shop ORDER BY Number_products DESC LIMIT 1
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop EXCEPT SELECT T3.Name FROM hiring AS T1 JOIN shop AS T3 ON T1.Shop_ID = T3.Shop_ID
SELECT T2.Name, COUNT(T1.Employee_ID) FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T2.Name;
SELECT T2.Name ,  COUNT(*) FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID  =  T2.Shop_ID GROUP BY T1.Shop_ID
SELECT SUM(bonus) FROM evaluation
SELECT sum(bonus) FROM evaluation
SELECT * FROM hiring
SELECT * FROM hiring
SELECT T2.District FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID WHERE T2.Number_products < 3000 INTERSECT SELECT T2.District FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID WHERE T2.Number_products > 10000
SELECT DISTINCT T2.District FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID  =  T2.Shop_ID WHERE T2.Number_products < 3000 INTERSECT SELECT DISTINCT T2.District FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID  =  T2.Shop_ID WHERE T2.Number_products > 10000
SELECT count(DISTINCT location) FROM shop
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(*) FROM Documents
SELECT count(*) FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT d.Document_Name, t.Template_ID FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID WHERE d.Document_Description LIKE '%w%'
SELECT T2.Document_Name, T2.Document_ID FROM Documents AS T1 INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T2.Paragraph_Text LIKE '%w%'
SELECT D.Document_ID, T.Template_ID, T.Document_Description FROM Documents AS D INNER JOIN Templates AS T ON D.Template_ID = T.Template_ID WHERE D.Document_Name = 'Robbin CV'
SELECT d.Document_ID, t.Template_ID, d.Document_Description FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID WHERE d.Document_Name = 'Robbin CV';
SELECT count(DISTINCT T2.Template_ID) FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID
SELECT COUNT(DISTINCT t1.Template_Type_Code) FROM Ref_Template_Types AS t1 JOIN Templates AS t2 ON t1.Template_Type_Code = t2.Template_Type_Code
SELECT COUNT(*) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT')
SELECT COUNT(*) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT')
SELECT t.Template_ID, COUNT(d.Document_ID) as Number_of_Documents  FROM Templates t  JOIN Documents d ON t.Template_ID = d.Template_ID  GROUP BY t.Template_ID
SELECT Template_ID, COUNT(*) AS Times_Used FROM Documents GROUP BY Template_ID
SELECT T2.Template_ID, T1.Template_Type_Code  FROM Ref_Template_Types AS T1  JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code  JOIN Documents AS T3 ON T2.Template_ID = T3.Template_ID  GROUP BY T2.Template_ID, T1.Template_Type_Code  ORDER BY COUNT(T3.Document_ID) DESC  LIMIT 1
SELECT T1.template_id, T2.template_type_code FROM templates AS T1 JOIN ref_template_types AS T2 ON T1.template_type_code = T2.template_type_code GROUP BY T1.template_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Template_ID FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.Document_ID  =  T2.Document_ID GROUP BY T2.Template_ID HAVING count(T2.Document_ID)  >  1
SELECT DISTINCT T1.template_id FROM templates AS T1 JOIN documents AS T2 ON T1.template_id = T2.template_id GROUP BY T1.template_id HAVING COUNT(*) > 1
SELECT T1.Template_ID FROM Templates AS T1 LEFT JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_ID IS NULL
SELECT T1.Template_ID FROM Templates AS T1 LEFT JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Document_ID IS NULL
SELECT count(*) FROM Templates
SELECT count(*) FROM Templates
SELECT T1.Template_ID ,  T1.Version_Number ,  T1.Template_Type_Code FROM Templates AS T1 INNER JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT Template_Type_Code FROM Ref_Template_Types
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT COUNT(Template_ID) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT COUNT(*) FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T1.Template_Type_Description = 'CV'
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Version_Number ,  Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code IN (SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3);
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(Template_ID) < 3
SELECT T1.Version_Number ,  T2.Template_Type_Code FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code ORDER BY T1.Version_Number LIMIT 1
SELECT t1.Version_Number ,  t2.Template_Type_Code FROM Templates AS t1 JOIN Ref_Template_Types AS t2 ON t1.Template_Type_Code = t2.Template_Type_Code ORDER BY t1.Version_Number ASC LIMIT 1
SELECT T.Template_Type_Code FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID WHERE D.Document_Name = "Data base";
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1 INNER JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code INNER JOIN Documents AS T3 ON T2.Template_ID = T3.Template_ID WHERE T3.Document_Name = 'Data base'
SELECT T2.Document_Name FROM Ref_Template_Types AS T1 INNER JOIN Documents AS T2 ON T1.Template_Type_Code = T2.Template_ID WHERE T1.Template_Type_Code = 'BK'
SELECT T1.Document_Name FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'BK'
SELECT T1.Template_Type_Code, COUNT(*) FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code JOIN Documents AS T3 ON T3.Template_ID = T2.Template_ID GROUP BY T1.Template_Type_Code
SELECT T1.Template_Type_Code, COUNT(*) FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code JOIN Documents AS T3 ON T2.Template_ID = T3.Template_ID GROUP BY T1.Template_Type_Code
SELECT T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates)
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates)
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Code ,  Template_Type_Description FROM Ref_Template_Types
SELECT T1.Template_Type_Description FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Code = 'AD'
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = "Book";
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT DISTINCT T2.Template_Type_Description FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID
SELECT DISTINCT T1.Template_Type_Description FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code
SELECT T1.Template_ID FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code  =  T2.Template_Type_Code WHERE T2.Template_Type_Description = 'Presentation'
SELECT Templates.Template_ID FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Description = 'Presentation'
SELECT COUNT(*) FROM Paragraphs
SELECT count(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name = 'Summer Show')
SELECT COUNT(*) FROM Documents AS T1 INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Document_Name = 'Summer Show'
SELECT T2.paragraph_text, T2.other_details FROM Documents AS T1 INNER JOIN Paragraphs AS T2 ON T1.document_id = T2.document_id WHERE T2.paragraph_text = 'Korea '
SELECT Paragraph_Text FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs WHERE Document_ID = (SELECT Document_ID FROM Documents WHERE Document_Name = 'Welcome to NY')
SELECT paragraphs.paragraph_id, paragraphs.paragraph_text FROM paragraphs INNER JOIN documents ON paragraphs.document_id = documents.document_id WHERE documents.document_name = 'Welcome to NY'
SELECT Paragraph_Text FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name = 'Customer reviews')
SELECT Paragraph_Text FROM Paragraphs WHERE Document_ID = (SELECT Document_ID FROM Documents WHERE Document_Name = 'Customer reviews')
SELECT D.Document_ID, COUNT(P.Paragraph_ID) as Paragraph_Count FROM Documents AS D LEFT JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY D.Document_ID
SELECT Document_ID, COUNT(*) FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) AS Paragraph_Count  FROM Documents D  LEFT JOIN Paragraphs P ON D.Document_ID = P.Document_ID  GROUP BY D.Document_ID, D.Document_Name
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) as Paragraph_Count FROM Documents D LEFT JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name
SELECT DISTINCT T2.Document_ID FROM Paragraphs AS T1 INNER JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T2.Document_ID HAVING COUNT(*) >= 2
SELECT DISTINCT d.Document_ID FROM Documents AS d INNER JOIN Paragraphs AS p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID HAVING COUNT(*) >= 2
SELECT T1.Document_ID ,  T1.Document_Name FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID  =  T2.Document_ID GROUP BY T1.Document_ID ORDER BY count(*) DESC LIMIT 1
SELECT D.Document_ID, D.Document_Name FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Document_ID FROM Documents AS T1 INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT T2.Document_ID FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.Document_ID  =  T2.Document_ID GROUP BY T2.Document_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT D.Document_ID FROM Documents D WHERE ( SELECT COUNT(*) FROM Paragraphs P WHERE P.Document_ID = D.Document_ID ) BETWEEN 1 AND 2;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2
SELECT DISTINCT P.Document_ID FROM Paragraphs AS P WHERE P.Paragraph_Text IN ('Brazil', 'Ireland')
SELECT T2.Document_ID FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Paragraph_Text = 'Brazil' AND T1.Paragraph_Text = 'Ireland'
SELECT count(*) FROM teacher
SELECT count(*) FROM teacher
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Age ,  Hometown FROM teacher
SELECT Age ,  Hometown FROM teacher
SELECT name FROM teacher WHERE hometown != 'Little Lever Urban District'
SELECT T1.Name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID WHERE T1.Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1
SELECT hometown FROM teacher ORDER BY age ASC LIMIT 1
SELECT Hometown ,  COUNT(*) FROM teacher GROUP BY Hometown
SELECT T2.Hometown, COUNT(*) FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID GROUP BY T2.Hometown
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT Hometown, COUNT(*) AS Teacher_count  FROM teacher  GROUP BY Hometown  ORDER BY Teacher_count DESC  LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) > 1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING count(*)  >=  2
SELECT T1.name, T2.course FROM teacher AS T1 JOIN course_arrange AS T3 ON T1.teacher_id  =  T3.teacher_id JOIN course AS T2 ON T3.course_id  =  T2.course_id
SELECT T2.name ,  T1.course FROM course AS T1 JOIN course_arrange AS T3 ON T3.course_id  =  T1.course_id JOIN teacher AS T2 ON T2.teacher_id  =  T3.teacher_id
SELECT T1.name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.teacher_id = T2.teacher_id JOIN course AS T3 ON T2.course_id = T3.course_id ORDER BY T1.name ASC
SELECT t.name, c.Course FROM teacher AS t JOIN course_arrange AS a ON t.teacher_id  =  a.teacher_id JOIN course AS c ON a.course_id  =  c.course_id ORDER BY t.name
SELECT t.name FROM teacher t JOIN course_arrange ca ON t.teacher_id = ca.teacher_id JOIN course c ON ca.course_id = c.course_id WHERE c.course = 'Math';
SELECT T1.name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN course AS T3 ON T2.course_id = T3.course_id WHERE T3.course  =  'Math'
SELECT T2.name ,  count(T1.course_id) FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T2.name
SELECT T1.name ,  count(*) FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.name
SELECT t1.Name FROM teacher AS t1 JOIN course_arrange AS t2 ON t1.Teacher_ID = t2.Teacher_ID GROUP BY t1.Name HAVING COUNT(*)  >=  2
SELECT T1.Name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T1.Name HAVING count(*)  >=  2
SELECT name FROM teacher WHERE teacher_id NOT IN (SELECT teacher_id FROM course_arrange)
SELECT t.Name FROM teacher t WHERE t.Teacher_ID NOT IN (SELECT T1.Teacher_ID FROM course_arrange AS T1 JOIN course AS T2 ON T1.Course_ID = T2.Course_ID)
SELECT COUNT(Name) FROM visitor WHERE age  < 30
SELECT name FROM visitor WHERE level_of_membership  >  4 ORDER BY level_of_membership DESC
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4
SELECT name ,  level_of_membership FROM visitor WHERE level_of_membership  >  4 ORDER BY age DESC
SELECT Museum_ID ,  Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < 2009
SELECT Open_Year ,  Num_of_Staff FROM museum WHERE Name  =  "Plaza Museum"
SELECT Name FROM museum WHERE Num_of_Staff > ( SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > 2010 )
SELECT visitor_id FROM visit GROUP BY visitor_id HAVING COUNT(*) > 1
SELECT V.ID , V.Name , V.Level_of_membership FROM visitor AS V JOIN visit AS VI ON V.ID = VI.visitor_ID ORDER BY VI.Total_spent DESC LIMIT 1
SELECT T1.Museum_ID, T2.name FROM visit AS T1 JOIN museum AS T2 ON T1.Museum_ID = T2.Museum_ID GROUP BY T1.Museum_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT T2.Name ,  T2.Age FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_ID  =  T2.ID GROUP BY T1.visitor_ID ORDER BY SUM(T1.Num_of_Ticket) DESC LIMIT 1
SELECT avg(Num_of_Ticket), max(Num_of_Ticket) FROM visit
SELECT sum(T2.Total_spent) FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID WHERE T1.Level_of_membership = 1
SELECT T2.name FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_id = T2.id WHERE T1.museum_id IN (SELECT T3.museum_id FROM museum AS T3 WHERE T3.open_year < '2009') INTERSECT SELECT T2.name FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_id = T2.id WHERE T1.museum_id IN (SELECT T3.museum_id FROM museum AS T3 WHERE T3.open_year > '2011')
SELECT count(*) FROM visitor AS t1 JOIN visit AS t2 ON t1.id  =  t2.visitor_id JOIN museum AS t3 ON t3.Museum_ID  =  t2.Museum_ID WHERE t3.Open_Year  <  2010
SELECT count(*) FROM museum WHERE Open_Year < '2008' OR Open_Year > '2013'
SELECT COUNT(*) FROM players
SELECT count(*) FROM players
SELECT count(*) FROM matches
SELECT count(*) FROM matches
SELECT first_name, birth_date FROM players WHERE country_code = 'USA';
SELECT first_name ,  birth_date FROM players WHERE country_code = 'USA'
SELECT AVG(loser_age) ,  AVG(winner_age) FROM matches
SELECT AVG(winner_age), AVG(loser_age) FROM matches;
SELECT AVG(winner_rank) FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT MAX(T3.ranking) FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.loser_id JOIN rankings AS T3 ON T1.player_id = T3.player_id
SELECT MIN(loser_rank) AS best_rank_loser FROM matches
SELECT count(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT winner_name) FROM matches
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT T2.tourney_name FROM matches AS T1 JOIN matches AS T2 ON T1.tourney_id = T2.tourney_id GROUP BY T1.tourney_id HAVING COUNT(*) > 10
SELECT T1.tourney_name FROM matches AS T1 JOIN ( SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10 ) AS T2 ON T1.tourney_name = T2.tourney_name
SELECT winner_name FROM matches WHERE year = 2013 INTERSECT SELECT winner_name FROM matches WHERE year = 2016
SELECT T3.winner_name FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id JOIN players AS T3 ON T1.loser_id = T3.player_id WHERE T1.year IN (2013, 2016) GROUP BY T3.winner_name HAVING COUNT(T1.match_num) = 2
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016)
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016)
SELECT T2.country_code ,  T2.first_name FROM matches AS T1 JOIN players AS T2 ON T1.winner_id  =  T2.player_id WHERE T1.tourney_name  =  'WTA Championships' INTERSECT SELECT T2.country_code ,  T2.first_name FROM matches AS T1 JOIN players AS T2 ON T1.winner_id  =  T2.player_id WHERE T1.tourney_name  =  'Australian Open'
SELECT first_name ,  country_code FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE tourney_name IN ('WTA Championships','Australian Open') GROUP BY winner_id HAVING COUNT(DISTINCT tourney_name) = 2)
SELECT first_name ,  country_code FROM players ORDER BY birth_date ASC LIMIT 1
SELECT first_name, country_code FROM players ORDER BY birth_date DESC LIMIT 1
SELECT first_name, last_name FROM players ORDER BY birth_date
SELECT first_name ,  last_name FROM players ORDER BY birth_date
SELECT first_name ,  last_name FROM players WHERE hand =  'L' ORDER BY birth_date
SELECT T1.first_name ,  T1.last_name FROM players AS T1 INNER JOIN matches AS T2 ON T1.player_id = T2.loser_id WHERE T1.hand = 'L' ORDER BY T1.birth_date
SELECT first_name ,  country_code FROM players ORDER BY tours DESC LIMIT 1
SELECT first_name ,  country_code FROM players ORDER BY tours DESC LIMIT 1
SELECT `year` FROM `matches` GROUP BY `year` ORDER BY COUNT(`year`) DESC LIMIT 1
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.winner_name ,  T1.winner_rank_points FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id GROUP BY T1.winner_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT winner_name, winner_rank_points FROM matches ORDER BY winner_rank_points DESC LIMIT 1
SELECT T3.first_name, T3.last_name FROM rankings AS T1 JOIN players AS T3 ON T1.player_id = T3.player_id JOIN matches AS T4 ON T3.player_id = T4.winner_id WHERE T1.tours = 0 AND T4.tourney_name = 'Australian Open' ORDER BY T1.ranking_points DESC LIMIT 1
SELECT T2.winner_name FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_name = 'Australian Open' ORDER BY T2.ranking_points DESC LIMIT 1
SELECT winner_name ,  loser_name FROM matches ORDER BY minutes DESC LIMIT 1
SELECT T2.winner_name ,  T2.loser_name FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.minutes = (SELECT MAX(minutes) FROM matches)
SELECT T2.first_name, AVG(T1.ranking) FROM rankings AS T1 JOIN players AS T2 ON T2.player_id = T1.player_id GROUP BY T2.first_name
SELECT first_name ,  avg(ranking_points) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY T1.player_id
SELECT T1.first_name ,  sum(T2.ranking_points) ,  T1.player_id FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY T1.player_id
SELECT T1.first_name, SUM(T2.ranking_points) FROM players AS T1 INNER JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.first_name
SELECT country_code ,  COUNT(*) FROM players GROUP BY country_code
SELECT country_code, COUNT(*) FROM players GROUP BY country_code
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50
SELECT country_code FROM players GROUP BY country_code HAVING count(*)  >  50
SELECT COUNT(player_id) ,  ranking_date FROM rankings GROUP BY ranking_date
SELECT ranking_date, COUNT(*) FROM rankings GROUP BY ranking_date
SELECT year ,  COUNT(*) FROM matches GROUP BY year
SELECT year, COUNT(*) FROM matches GROUP BY year
SELECT winner_name, winner_rank FROM matches ORDER BY winner_age ASC LIMIT 3
SELECT winner_name, winner_rank FROM matches ORDER BY winner_age ASC LIMIT 3
SELECT COUNT(DISTINCT T2.player_id) FROM matches AS T1 INNER JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_level = 'W' AND T2.hand = 'R';
SELECT COUNT(*) FROM players INNER JOIN matches ON players.player_id = matches.winner_id WHERE players.hand = 'L' AND matches.tourney_level = 'W'
SELECT T1.first_name ,  T1.country_code ,  T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id ORDER BY T2.winner_rank_points DESC LIMIT 1
SELECT T1.first_name ,  T1.country_code ,  T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id GROUP BY T1.player_id ORDER BY sum(T2.winner_rank_points) DESC LIMIT 1
SELECT hand, COUNT(*) FROM players GROUP BY hand
SELECT hand ,  COUNT(*) FROM players GROUP BY hand
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured';
SELECT name, tonnage FROM ship ORDER BY name DESC
SELECT name ,  date ,  result FROM battle
SELECT MAX(t1.killed) ,  MIN(t1.killed) FROM death AS t1 JOIN ship AS t2 ON t1.caused_by_ship_id  =  t2.id JOIN battle AS t3 ON t2.lost_in_battle  =  t3.id
SELECT AVG(injured) FROM death
SELECT killed, injured FROM death WHERE caused_by_ship_id IN (SELECT id FROM ship WHERE tonnage = 't')
SELECT T2.name ,  T2.result FROM battle AS T1 JOIN ship AS T3 ON T1.id = T3.lost_in_battle JOIN death AS T4 ON T3.id = T4.caused_by_ship_id WHERE T1.bulgarian_commander != 'Boril'
SELECT DISTINCT T3.lost_in_battle, T4.name FROM death AS T1  INNER JOIN ship AS T2 ON T1.caused_by_ship_id = T2.id  INNER JOIN battle AS T3 ON T3.id = T2.lost_in_battle  INNER JOIN ship AS T4 ON T4.id = T3.lost_in_battle  WHERE T2.ship_type = 'Brig'
SELECT T2.id ,  T2.name FROM death AS T1 JOIN battle AS T2 ON T1.caused_by_ship_id  =  T2.id GROUP BY T1.caused_by_ship_id HAVING SUM(T1.killed)  >  10
SELECT T3.id, T3.name FROM death AS T1  JOIN ship AS T3 ON T1.caused_by_ship_id = T3.id  GROUP BY T1.caused_by_ship_id  ORDER BY SUM(T1.killed + T1.injured) DESC  LIMIT 1;
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'
SELECT COUNT(DISTINCT result) FROM battle
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = '225')
SELECT T1.name ,  T1.date FROM battle AS T1 JOIN ship AS T2 ON T1.id  =  T2.lost_in_battle WHERE T2.name  =  'Lettice' OR T2.name  =  'HMS Atalanta'
SELECT name, result, bulgarian_commander FROM battle WHERE id NOT IN ( SELECT lost_in_battle FROM ship WHERE location = 'English Channel' )
SELECT `note` FROM `death` WHERE `note` LIKE '%East%'
SELECT line_1 , line_2 FROM addresses
SELECT line_1 ,  line_2 FROM Addresses
SELECT count(*) FROM Courses
SELECT count(*) FROM courses
SELECT course_description FROM courses WHERE course_name  =  'math'
SELECT course_description FROM courses WHERE course_name = 'math';
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT T1.department_id ,  T1.department_name FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id  =  T2.department_id GROUP BY T1.department_name ORDER BY count(*) DESC LIMIT 1
SELECT department_name, department_id FROM Departments GROUP BY department_name, department_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT count(DISTINCT T2.department_id) FROM Degree_Programs AS T1 JOIN Courses AS T2 ON T1.degree_summary_name = T2.course_name
SELECT COUNT (DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs;
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(degree_summary_name) FROM Degree_Programs WHERE department_id IN (SELECT department_id FROM Departments WHERE department_name = 'computer science');
SELECT COUNT(DISTINCT department_id) FROM Departments
SELECT section_name ,  section_description FROM Sections
SELECT section_name ,  section_description FROM Sections
SELECT course_id, course_name FROM courses WHERE course_id NOT IN (SELECT course_id FROM sections GROUP BY course_id HAVING count(*)  >  2)
SELECT course_id,course_name FROM COURSES WHERE course_id NOT IN ( SELECT course_id FROM SECTIONS GROUP BY course_id HAVING count(*) >= 2 )
SELECT `section_name` FROM `Sections` ORDER BY `section_name` DESC
SELECT section_name FROM sections ORDER BY section_name DESC
SELECT T1.semester_id, T1.semester_name FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_name, T1.semester_id ORDER BY count(*) DESC LIMIT 1
SELECT T3.semester_id ,  T2.degree_summary_name FROM STUDENT_ENROLMENT_COURSES AS T1 INNER JOIN DEGREE_PROGRAMS AS T2 ON T1.degree_program_id  =  T2.degree_program_id INNER JOIN SEMESTERS AS T3 ON T1.semester_id  =  T3.semester_id WHERE (SELECT COUNT(*) FROM STUDENT_ENROLMENT_COURSES WHERE semester_id = T3.semester_id ) = (SELECT MAX(COUNT(*)) FROM STUDENT_ENROLMENT_COURSES WHERE semester_id = T3.semester_id);
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT T3.first_name, T3.middle_name, T3.last_name, T3.student_id FROM Degree_Programs AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id INNER JOIN Students AS T3 ON T2.student_id = T3.student_id WHERE T1.degree_program_id IN (SELECT degree_program_id FROM Student_Enrolment WHERE semester_id = ( SELECT semester_id FROM Student_Enrolment WHERE student_id = 5 GROUP BY semester_id HAVING count(*) = 2 ))
SELECT T1.student_id ,  T1.first_name ,  T1.middle_name ,  T1.last_name FROM Students AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.student_id  =  T2.student_id WHERE T2.degree_program_id IN (SELECT degree_program_id FROM Student_Enrolment GROUP BY semester_id,degree_program_id HAVING count(*)  =  2)
SELECT first_name, middle_name, last_name FROM students WHERE student_id IN (SELECT student_id FROM student_enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Bachelor'))
SELECT first_name ,  middle_name ,  last_name FROM Students WHERE student_id IN ( SELECT student_id FROM Student_Enrolment_Courses WHERE course_id IN ( SELECT course_id FROM Sections WHERE section_id IN ( SELECT section_id FROM Courses WHERE course_name LIKE 'Bachelor' ) ) )
SELECT T2.degree_summary_name FROM degree_programs AS T1 JOIN student_enrolment AS T3 ON T1.degree_program_id  =  T3.degree_program_id JOIN degree_summary AS T2 ON T1.degree_summary_id  =  T2.degree_summary_id GROUP BY T1.degree_summary_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T4.degree_summary_name FROM student_enrolment_courses AS T1 JOIN student_enrolment AS T2 ON T1.student_enrolment_id = T2.student_enrolment_id JOIN degree_programs AS T3 ON T2.degree_program_id = T3.degree_program_id JOIN degree_programs AS T4 ON T4.degree_program_id = T2.degree_program_id GROUP BY T3.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.degree_program_id ,  T2.degree_summary_name FROM `student_enrolment` AS T1 JOIN `degree_programs` AS T2 ON T1.degree_program_id  =  T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY count(T1.student_id) DESC LIMIT 1
SELECT T1.degree_program_id ,  T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id  =  T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT student_id, first_name, middle_name, last_name, COUNT(student_enrolment_id) as number_of_enrollments FROM Students INNER JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id GROUP BY student_id ORDER BY number_of_enrollments DESC LIMIT 1
SELECT T1.student_id ,  T1.first_name ,  T1.middle_name ,  T1.last_name ,  COUNT(*) ,  T1.date_first_registered FROM STUDENTS AS T1 JOIN STUDENT_ENROLMENT AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment);
SELECT T1.course_name FROM courses AS T1 JOIN `student_enrolment_courses` AS T2 ON T1.course_id  =  T2.course_id
SELECT DISTINCT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id
SELECT T2.course_name FROM Student_Enrolment_Courses AS T1 JOIN Courses AS T2 ON T1.course_id  =  T2.course_id GROUP BY T2.course_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT course_name FROM courses AS t1 JOIN student_enrolment_courses AS t2 ON t1.course_id  =  t2.course_id GROUP BY t2.course_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT last_name FROM Students WHERE current_address_id IN (SELECT address_id FROM Addresses WHERE state_province_county = "North Carolina") AND student_id NOT IN (SELECT student_id FROM Student_Enrolment)
SELECT first_name, middle_name, last_name FROM Students WHERE country = 'United States' AND state_province_county = 'North Carolina';
SELECT T3.transcript_date, T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id JOIN Student_Enrolment_Courses AS T3 ON T2.student_course_id = T3.student_course_id GROUP BY T1.transcript_id HAVING COUNT(*) >= 2
SELECT `transcript_date`, `transcript_id` FROM Transcripts AS T WHERE (SELECT COUNT(T2.transcript_id) FROM Transcript_Contents AS T2 WHERE T2.transcript_id = T.transcript_id) >= 2
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward';
SELECT cell_mobile_number FROM STUDENTS WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT first_name, middle_name, last_name FROM students ORDER BY date_first_registered ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM students ORDER BY date_first_registered LIMIT 1;
SELECT first_name, middle_name, last_name FROM Students WHERE DATE_FIRST_REGISTERED = (SELECT min(DATE_FIRST_REGISTERED) FROM Students);
SELECT first_name ,  middle_name ,  last_name FROM students ORDER BY date_first_registered LIMIT 1
SELECT T2.first_name FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.permanent_address_id WHERE T1.address_id != T2.current_address_id
SELECT first_name FROM students WHERE permanent_address_id != current_address_id
SELECT current_address_id ,  line_1 ,  line_2 ,  line_3 ,  city ,  zip_postcode ,  state_province_county ,  country ,  other_address_details FROM addresses GROUP BY current_address_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.line_1, T2.line_2 FROM Student_Enrolment AS T1 INNER JOIN Addresses AS T2 ON T1.student_id = T2.address_id GROUP BY T2.address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT avg(transcript_date) FROM Transcripts
SELECT AVG(transcript_date) FROM Transcripts
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT count(transcript_id) FROM TRANSCRIPTS
SELECT count(*) FROM transcripts
SELECT MAX(T1.transcript_date) FROM Transcripts AS T1
SELECT MAX(transcript_date) FROM Transcripts
SELECT course_id, MAX(transcript_id) FROM Student_Enrolment_Courses GROUP BY course_id;
SELECT course_id, count(*) FROM Student_Enrolment_Courses GROUP BY course_id ORDER BY count(*) DESC LIMIT 1
SELECT `transcript_date` FROM `transcripts` ORDER BY `transcript_date` LIMIT 1;
SELECT transcript_date ,  transcript_id FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT T1.semester_id FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Master' INTERSECT SELECT T1.semester_id FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Bachelor'
SELECT semester_id FROM STUDENT_ENROLMENT GROUP BY degree_program_id HAVING COUNT(degree_program_id) = 2
SELECT COUNT(DISTINCT current_address_id) FROM Students;
SELECT DISTINCT a.line_1, a.line_2, a.line_3, a.city, a.zip_postcode, a.state_province_county, a.country FROM addresses AS a INNER JOIN students AS s ON a.address_id = s.permanent_address_id
SELECT * FROM Students ORDER BY last_name DESC;
SELECT first_name, middle_name, last_name, other_student_details FROM students ORDER BY last_name DESC
SELECT section_name FROM Sections WHERE section_name = 'h'
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582'
SELECT t4.first_name FROM addresses AS t1 JOIN students AS t2 ON t1.address_id = t2.permanent_address_id OR t1.address_id = t2.current_address_id JOIN addresses AS t3 ON t3.address_id = t2.permanent_address_id JOIN students AS t4 ON t3.address_id = t4.current_address_id WHERE t1.country = 'Haiti' OR t2.cell_mobile_number = '09700166582'
SELECT Title FROM Cartoon ORDER BY Title
SELECT Title FROM Cartoon ORDER BY Title
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT Title FROM Cartoon WHERE Directed_by  =  'Ben Jones'
SELECT count(*) FROM cartoon WHERE written_by  =  "Joseph Kuhr"
SELECT count(*) FROM Cartoon WHERE Written_by  =  'Joseph Kuhr'
SELECT t2.title ,  t2.directed_by FROM tv_series AS t1 JOIN cartoon AS t2 ON t1.channel = t2.channel ORDER BY t1.air_date
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T2.id  =  T1.Channel WHERE T2.Directed_by = "Ben Jones" OR T2.Directed_by = "Brandon Vietti"
SELECT `Country` ,  count(*) FROM TV_Channel GROUP BY `Country` ORDER BY count(*) DESC LIMIT 1
SELECT Country, COUNT(*) FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1
SELECT count(DISTINCT series_name) ,  count(DISTINCT Content) FROM TV_Channel
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT T3.Package_Option FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel JOIN TV_Channel AS T3 ON T1.id = T3.id WHERE T2.series_name = 'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language  =  "English";
SELECT COUNT(id) FROM TV_channel WHERE language = 'English'
SELECT Language FROM TV_Channel GROUP BY Language ORDER BY count(*) ASC LIMIT 1
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language ORDER BY COUNT(*) ASC LIMIT 1
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language
SELECT T2.series_name FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T2.id = T1.channel WHERE T1.title = 'The Rise of the Blue Beetle!'
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!'
SELECT T2.title FROM TV_series AS T1 JOIN Cartoon AS T2 ON T1.channel  =  T2.channel JOIN TV_Channel AS T3 ON T3.id  =  T2.channel WHERE T1.series_name  =  'Sky Radio';
SELECT T3.Title FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel JOIN Cartoon AS T3 ON T1.id = T3.Channel WHERE T1.series_name = 'Sky Radio'
SELECT Episode FROM TV_series ORDER BY Rating
SELECT Episode FROM TV_series ORDER BY Rating
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT MIN(T1.Share), MAX(T1.Share) FROM TV_series AS T1
SELECT MAX(T1.Share), MIN(T1.Share) FROM TV_series AS T1
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT T2.series_name FROM TV_series AS T1 JOIN TV_Channel AS T2 ON T1.Channel  =  T2.id WHERE T1.Episode  =  'A Love of a Lifetime'
SELECT series_name FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Episode FROM TV_series WHERE Channel = (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio')
SELECT Episode FROM TV_series WHERE Channel IN (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio')
SELECT directed_by ,  COUNT(*) FROM Cartoon GROUP BY directed_by
SELECT DIRECTED_BY ,  COUNT(*) FROM Cartoon GROUP BY DIRECTED_BY
SELECT Production_code ,  Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'yes'
SELECT T1.Package_Option, T3.series_name FROM TV_channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel JOIN TV_channel AS T3 ON T2.Channel = T3.id WHERE T1.Hight_definition_TV = 'yes'
SELECT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'
SELECT T2.Country FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel  =  T2.id WHERE T1.Written_by  =  'Todd Casey'
SELECT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by <> 'Todd Casey'
SELECT DISTINCT T2.series_name, T2.Country FROM Cartoon AS T1 INNER JOIN TV_channel AS T2 ON T1.Channel = T2.id WHERE T1.Directed_by IN ('Ben Jones', 'Michael Chang')
SELECT T2.series_name, T2.country FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.channel  =  T2.id WHERE T1.directed_by  =  'Ben Jones' OR T1.directed_by  =  'Michael Chang'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English';
SELECT Country, COUNT(id) FROM TV_Channel GROUP BY Country HAVING COUNT(id) > 2
SELECT `id` FROM `TV_Channel` GROUP BY `Channel` HAVING COUNT(`id`) > 2
SELECT T1.id FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by != 'Ben Jones'
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE NOT EXISTS (SELECT 1 FROM Cartoon WHERE Cartoon.Directed_by = 'Ben Jones' AND Cartoon.Channel = TV_Channel.id);
SELECT DISTINCT T1.Package_Option FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by != 'Ben Jones';
SELECT count(*) FROM poker_player
SELECT count(*) FROM poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT Final_Table_Made ,  Best_Finish FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT Name FROM people
SELECT Name FROM people
SELECT Name FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player WHERE Earnings > 300000)
SELECT t2.name FROM poker_player AS t1 JOIN people AS t2 ON t1.people_id  =  t2.people_id WHERE t1.earnings  >  300000
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC
SELECT T2.name FROM poker_player AS T1 JOIN people AS T2 ON T1.people_id = T2.people_id ORDER BY T1.final_table_made ASC
SELECT T2.birth_date FROM poker_player AS T1 JOIN people AS T2 ON T1.people_id = T2.people_id ORDER BY T1.earnings ASC LIMIT 1
SELECT T1.Birth_Date FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T2.Earnings LIMIT 1
SELECT Money_Rank FROM poker_player ORDER BY Height DESC LIMIT 1
SELECT Money_Rank FROM poker_player ORDER BY Height DESC LIMIT 1
SELECT AVG(Earnings) FROM poker_player WHERE People_ID IN (SELECT People_ID FROM people WHERE Height > 200)
SELECT AVG(T2.Earnings) FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Height > 200
SELECT Name FROM people ORDER BY Earnings DESC
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T2.Earnings DESC
SELECT DISTINCT T1.Nationality ,  count(*) FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID  =  T2.People_ID GROUP BY T1.Nationality
SELECT Nationality ,  count(*) FROM people GROUP BY Nationality
SELECT Nationality, COUNT(*) as count FROM people GROUP BY Nationality ORDER BY count DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*)  >=  2
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*)  >=  2
SELECT Name, Birth_Date FROM people ORDER BY Name ASC
SELECT Name ,  Birth_Date FROM people ORDER BY Name ASC
SELECT Name FROM people WHERE Nationality != "Russia";
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people EXCEPT SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT count(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT count(DISTINCT state) FROM area_code_state
SELECT contestant_number ,  contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC
SELECT vote_id ,  phone_number ,  state FROM VOTES
SELECT max(area_code) ,  min(area_code) FROM area_code_state
SELECT MAX(created) FROM VOTES WHERE state = 'CA'
SELECT contestant_name FROM CONTENTATS WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT state, created FROM votes
SELECT T1.contestant_number ,  T1.contestant_name FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number  =  T2.contestant_number GROUP BY T1.contestant_number HAVING count(*)  >=  2
SELECT c.contestant_number, c.contestant_name FROM CONTESTANTS c INNER JOIN ( SELECT t1.contestant_number, count(*) AS cnt FROM VOTES t1 GROUP BY t1.contestant_number ORDER BY cnt ASC LIMIT 1 ) t2 ON c.contestant_number = t2.contestant_number
SELECT count(*) FROM votes WHERE state  =  'NY' OR state  =  'CA'
SELECT count(*) FROM ( SELECT * FROM CONTESTANTS WHERE contestant_number NOT IN ( SELECT DISTINCT contestant_number FROM VOTES ) )
SELECT T1.area_code FROM votes AS T2 INNER JOIN area_code_state AS T1 ON T1.state = T2.state GROUP BY T1.area_code ORDER BY count(*) DESC LIMIT 1
SELECT created,state,phone_number FROM VOTES JOIN CONTESTANTS ON VOTES.contestant_number=CONTESTANTS.contestant_number WHERE CONTESTANTS.contestant_name='Tabatha Gehling'
SELECT DISTINCT T2.area_code FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number  =  T2.contestant_number WHERE T1.contestant_name  =  'Tabatha Gehling' INTERSECT SELECT DISTINCT T2.area_code FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number  =  T2.contestant_number WHERE T1.contestant_name  =  'Kelly Clauss'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear > 1950
SELECT Name FROM country WHERE IndepYear > 1950
SELECT count(*) FROM country WHERE governmentform = 'Republic'
SELECT count(*) FROM country WHERE GovernmentForm = 'Republic'
SELECT SUM(T2.SurfaceArea) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Region = 'Caribbean'
SELECT SUM(T1.SurfaceArea) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Dutch';
SELECT continent FROM country WHERE name = 'Anguilla';
SELECT continent FROM country WHERE name = 'Anguilla'
SELECT T1.region FROM country AS T1 INNER JOIN city AS T2 ON T1.code = T2.countrycode WHERE T2.name = 'Kabul'
SELECT Region FROM country WHERE Name = 'Kabul'
SELECT Language FROM countrylanguage WHERE CountryCode = 'ABW' ORDER BY Percentage DESC LIMIT 1
SELECT language FROM countrylanguage WHERE CountryCode = 'ABW' AND IsOfficial = 'T'
SELECT population, lifeexpectancy FROM country WHERE name = 'Brazil'
SELECT T1.Population, T1.LifeExpectancy FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Brazil'
SELECT region ,  population FROM country WHERE Name = 'Angola'
SELECT region, population FROM country WHERE code = 'ALB';
SELECT avg(lifeexpectancy) FROM country WHERE region = 'Central Africa'
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Region = 'Central Africa';
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1
SELECT name FROM country WHERE continent = 'Asia' ORDER BY lifeexpectancy ASC LIMIT 1
SELECT SUM(population), max(GNP) FROM country WHERE continent = 'Asia'
SELECT SUM(T1.Population), MAX(T1.GNP) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.IsOfficial = 'T' AND T1.Continent = 'Asia'
SELECT AVG(T2.LifeExpectancy) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Africa' AND T1.GovernmentForm = 'Republic'
SELECT avg(lifeexpectancy) FROM country WHERE continent = 'Africa' AND governmentform = 'Republic'
SELECT sum(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(T1.Population) FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.District = 'Gelderland'
SELECT SUM(T2.Population) FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.District = 'Gelderland'
SELECT avg(GNP), sum(Population) FROM country WHERE GovernmentForm LIKE 'United States%'
SELECT AVG(T2.GNP), SUM(T2.Population) FROM country AS T1 INNER JOIN countrylanguage AS T3 ON T1.Code = T3.CountryCode INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.GovernmentForm = 'United States territory'
SELECT count(DISTINCT language) FROM countrylanguage
SELECT count(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE continent = 'Africa';
SELECT DISTINCT GovernmentForm FROM country WHERE Continent = 'Africa'
SELECT count(T1.Language) FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Name = 'Aruba'
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'ABW'
SELECT COUNT(T1.Language) FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Name = 'Afghanistan' AND T1.IsOfficial = 'T'
SELECT COUNT(T1.Language) FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Name = 'Afghanistan' AND T1.IsOfficial = 'T'
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.IsOfficial = 'T' GROUP BY T1.Code ORDER BY COUNT(T2.Language) DESC LIMIT 1
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY COUNT(T1.Name) DESC LIMIT 1
SELECT continent FROM countrylanguage GROUP BY continent ORDER BY COUNT(DISTINCT language) DESC LIMIT 1
SELECT T2.CONTINENT FROM countrylanguage AS T1 JOIN country AS T2 ON T1.COUNTRYCODE  =  T2.CODE GROUP BY T2.CONTINENT ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT t1.Code) FROM country AS t1 JOIN countrylanguage AS t2 ON t1.Code = t2.CountryCode WHERE t2.Language = 'Dutch' INTERSECT SELECT COUNT(DISTINCT t1.Code) FROM country AS t1 JOIN countrylanguage AS t2 ON t1.Code = t2.CountryCode WHERE t2.Language = 'English'
SELECT COUNT(DISTINCT CountryCode) FROM countrylanguage WHERE Language IN ('English', 'Dutch')
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'T' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French' AND T2.IsOfficial = 'T'
SELECT L.CountryCode FROM countrylanguage L JOIN countrylanguage L2 ON L.CountryCode = L2.CountryCode WHERE L.Language = 'English' AND L2.Language = 'French'
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T') AND Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'French' AND IsOfficial = 'T')
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'English' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  'French'
SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'
SELECT COUNT(DISTINCT t2.Continent) FROM countrylanguage AS t1 JOIN country AS t2 ON t1.CountryCode  =  t2.Code WHERE t1.Language  =  "Chinese"
SELECT DISTINCT T1.region FROM country AS T1 JOIN countrylanguage AS T2 ON T1.code  =  T2.CountryCode WHERE T2.language IN ('English', 'Dutch')
SELECT DISTINCT T3.Region FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code INNER JOIN city AS T3 ON T2.Code = T3.CountryCode WHERE T1.Language IN ('Dutch', 'English')
SELECT T1.LocalName FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('English', 'Dutch')
SELECT DISTINCT t1.name FROM country AS t1 JOIN countrylanguage AS t2 ON t1.code = t2.countrycode WHERE t2.isofficial = 'T' AND (t2.language = 'English' OR t2.language = 'Dutch')
SELECT T1.`Language`, T1.Percentage FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Continent = 'Asia' ORDER BY T1.Percentage DESC LIMIT 1
SELECT T1.language FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T2.code = T1.countrycode WHERE T2.continent = 'Asia' GROUP BY T1.language ORDER BY count(T1.language) DESC LIMIT 1
SELECT l.Language FROM countrylanguage AS l LEFT JOIN country AS c ON l.CountryCode = c.Code WHERE c.GovernmentForm = 'Republic' GROUP BY l.Language HAVING COUNT(DISTINCT c.Code) = 1
SELECT t2.language FROM country t1 JOIN countrylanguage t2 ON t1.code = t2.countrycode WHERE t1.governmentform = 'Republic' GROUP BY t2.language HAVING COUNT(t2.language) = 1
SELECT t2.city FROM countrylanguage AS t1 INNER JOIN city AS t2 ON t1.CountryCode = t2.CountryCode WHERE t1.Language = 'English' AND t1.IsOfficial = 'T' ORDER BY t2.Population DESC LIMIT 1
SELECT T2.Name FROM countrylanguage AS T1 JOIN city AS T2 ON T1.CountryCode = T2.CountryCode WHERE T1.Language = 'English' ORDER BY T2.Population DESC LIMIT 1
SELECT T1.Name, T1.Population, T1.LifeExpectancy FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.SurfaceArea = ( SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Asia' )
SELECT T1.Name, T1.Population, T1.LifeExpectancy FROM country AS T1 INNER JOIN ( SELECT MAX(SurfaceArea) AS max_land FROM country WHERE Continent = 'Asia' ) AS T2 ON T1.SurfaceArea = T2.max_land
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English' AND T2.IsOfficial = 'F'
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.IsOfficial = 'F' AND T2.Language = 'English'
SELECT SUM(T2.Population) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT SUM(city.Population) FROM city LEFT JOIN country ON city.CountryCode = country.Code LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language <> 'English'
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T'
SELECT Language FROM countrylanguage WHERE CountryCode = (SELECT CountryCode FROM country WHERE HeadOfState = 'Beatrix')
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE IndepYear < 1930 AND GovernmentForm = 'Republic')
SELECT COUNT(DISTINCT T3.Language) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode INNER JOIN city AS T3 ON T1.Code = T3.CountryCode WHERE T1.IndepYear < 1930
SELECT Code FROM country WHERE SurfaceArea  >  (SELECT MAX(SurfaceArea) FROM country WHERE Continent  =  "Europe")
SELECT T1.Name FROM country AS T1 INNER JOIN continent AS T2 ON T1.Continent = T2.name WHERE T2.name = 'Europe' EXCEPT SELECT T1.name FROM country AS T1 INNER JOIN continent AS T2 ON T1.Continent = T2.name WHERE T2.name = 'Europe' ORDER BY T1.SurfaceArea DESC
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < ( SELECT MIN(Population) FROM country WHERE Continent = 'Asia' )
SELECT T2.name FROM city AS T1 INNER JOIN country AS T2 ON T1.countrycode = T2.code WHERE T2.continent = 'Asia' ORDER BY T1.population ASC LIMIT 1
SELECT T1.Name FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' GROUP BY T2.CountryCode HAVING AVG(T2.Population) > ( SELECT MAX(T3.Population) FROM country AS T3 WHERE T3.Continent = 'Africa' )
SELECT name FROM country WHERE continent = 'Asia' AND population > ( SELECT MAX(population) FROM country WHERE continent = 'Africa' )
SELECT CountryCode FROM country EXCEPT SELECT CountryCode FROM countrylanguage WHERE Language = 'English'
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT DISTINCT T2.CountryCode FROM countrylanguage AS T1 JOIN city AS T2 ON T2.CountryCode = T1.CountryCode WHERE T1.Language <> 'English'
SELECT T1.CountryCode FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English'
SELECT Code FROM country WHERE GovernmentForm != 'Republic' AND Language NOT IN (SELECT Language FROM countrylanguage WHERE CountryCode = country.Code)
SELECT Code FROM country WHERE GovernmentForm != 'Republic' AND Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT t2.Name FROM city AS t1 JOIN country AS t2 ON t1.CountryCode = t2.Code JOIN countrylanguage AS t3 ON t2.Code = t3.CountryCode WHERE t2.Continent = 'Europe' AND t3.Language = 'English' AND t3.IsOfficial = 'F'
SELECT T3.name FROM countrylanguage AS T1 INNER JOIN city AS T2 ON T1.countrycode = T2.countrycode INNER JOIN country AS T3 ON T3.code = T2.countrycode WHERE T3.continent = 'Europe' AND T1.language <> 'English';
SELECT DISTINCT T1.name FROM city AS T1  INNER JOIN country AS T2 ON T1.CountryCode = T2.Code  INNER JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode  WHERE T2.continent = 'Asia' AND T3.language = 'Chinese'
SELECT DISTINCT T2.Name FROM countrylanguage AS T1 JOIN city AS T2 ON T1.CountryCode = T2.CountryCode WHERE T1.Language = 'Chinese' AND T2.CountryCode IN (SELECT Code FROM country WHERE Continent = 'Asia')
SELECT name ,  IndepYear ,  SurfaceArea FROM country ORDER BY population ASC LIMIT 1
SELECT Name ,  IndepYear ,  SurfaceArea FROM country ORDER BY Population ASC LIMIT 1
SELECT Population, Name, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1
SELECT Name ,  Population ,  HeadOfState FROM Country ORDER BY SurfaceArea DESC LIMIT 1
SELECT T1.name, COUNT(T2.countrycode) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.code  =  T2.countrycode WHERE T2.Percentage  >=  3 GROUP BY T1.name
SELECT T2.Name ,  COUNT(*) FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode  =  T2.Code GROUP BY T2.Name HAVING COUNT(*)  >  2
SELECT COUNT(C1.ID) ,  C1.District FROM city AS C1 WHERE C1.Population > ( SELECT AVG(C2.Population) FROM city AS C2 WHERE C2.District = C1.District ) GROUP BY C1.District
SELECT t2.district, COUNT(*) FROM city AS t1 JOIN city AS t2 ON t1.district = t2.district WHERE t1.population > ( SELECT avg(population) FROM city ) GROUP BY t2.district
SELECT governmentform ,  sum(population) FROM country GROUP BY governmentform HAVING avg(lifeexpectancy)  >  72
SELECT GovernmentForm ,  SUM(Population) FROM country WHERE LifeExpectancy > 72 GROUP BY GovernmentForm
SELECT avg(T1.lifeexpectancy) ,  sum(T1.population) ,  T2.continent FROM country AS T1 INNER JOIN city AS T3 ON T1.code = T3.CountryCode GROUP BY T2.continent HAVING avg(T1.lifeexpectancy) < 72
SELECT continent, SUM(population) ,  AVG(lifeexpectancy) FROM country WHERE lifeexpectancy < 72 GROUP BY continent
SELECT Name ,  SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT name ,  surfacearea FROM country ORDER BY surfacearea DESC LIMIT 5
SELECT T1.Name FROM country AS T1 ORDER BY T1.Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT count(*) FROM country WHERE Continent  =  'Asia'
SELECT count(*) FROM country WHERE continent = 'Asia'
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT SUM(T1.population) ,  AVG(T1.surfacearea) FROM country AS T1 INNER JOIN city AS T2 ON T1.code = T2.countrycode WHERE T1.continent = 'North America' AND T1.surfacearea > 3000
SELECT SUM(T1.Population), AVG(T1.SurfaceArea) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'North America' AND T2.Population > 3000
SELECT name FROM city WHERE population BETWEEN 160000 AND 900000
SELECT name FROM city WHERE population BETWEEN 160000 AND 900000
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(Language) DESC LIMIT 1
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.CountryCode, T1.Language, T1.Percentage FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code ORDER BY T2.Population DESC, T1.Percentage DESC
SELECT T1.Code, T3.Language, T3.Percentage FROM country AS T1 JOIN countrylanguage AS T3 ON T1.Code = T3.CountryCode ORDER BY T1.Code
SELECT count(*) FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'Spanish' ORDER BY Percentage DESC LIMIT 1)
SELECT COUNT(*) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Spanish' AND countrylanguage.Percentage = 100
SELECT countrycode FROM countrylanguage WHERE language = 'Spanish' ORDER BY percentage DESC LIMIT 1
SELECT T1.CountryCode FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.IsOfficial = 'T' AND T2.Language = 'Spanish'
SELECT count(*) FROM conductor
SELECT count(*) FROM conductor
SELECT Name FROM conductor ORDER BY Age ASC
SELECT Name FROM conductor ORDER BY Age
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT name FROM conductor WHERE nationality != 'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT avg(T2.attendance) FROM performance AS T1 JOIN show AS T2 ON T1.performance_id = T2.performance_id
SELECT AVG(Attendance) FROM show
SELECT MAX(T2.Share), MIN(T2.Share) FROM performance AS T1 JOIN show AS T2 ON T1.Performance_ID = T2.Performance_ID WHERE T1.Type != 'Live final'
SELECT MAX(T1.share) ,  MIN(T1.share) FROM performance AS T1 WHERE T1.type <> 'Live final'
SELECT count(DISTINCT Nationality) FROM conductor;
SELECT count(DISTINCT nationality) FROM conductor
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT conductor.Name, orchestra.Orchestra FROM conductor JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID
SELECT c.name, o.orchestra FROM conductor AS c JOIN orchestra AS o ON c.conductor_id  =  o.conductor_id
SELECT T1.name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.name HAVING count(*) > 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID  =  T2.Conductor_ID GROUP BY T2.Conductor_ID HAVING COUNT(*)  >  1
SELECT Name FROM conductor WHERE Conductor_ID = (SELECT Conductor_ID FROM orchestra GROUP BY Conductor_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name ORDER BY COUNT(o.Orchestra_ID) DESC LIMIT 1
SELECT T1.name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.conductor_id  =  T2.conductor_id WHERE T2.year_of_founded  >  2008
SELECT T2.Name FROM orchestra AS T1 JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T1.Year_of_Founded > 2008
SELECT Record_Company ,  COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Record_Company ,  COUNT(Orchestra) FROM orchestra GROUP BY Record_Company
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY count(*) ASC
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) DESC
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY count(*) DESC LIMIT 1
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(Orchestra) DESC LIMIT 1
SELECT Orchestra FROM orchestra EXCEPT SELECT O.Orchestra FROM performance AS P JOIN orchestra AS O ON P.Orchestra_ID = O.Orchestra_ID
SELECT Orchestra FROM orchestra EXCEPT SELECT T2.Orchestra FROM performance AS T1 JOIN orchestra AS T2 ON T1.Orchestra_ID  =  T2.Orchestra_ID
SELECT DISTINCT T1.record_company FROM orchestra AS T1 INNER JOIN orchestra AS T2 ON T1.record_company = T2.record_company WHERE T1.year_of_founded < 2003 AND T2.year_of_founded > 2003
SELECT Record_Company FROM orchestra WHERE Year_of_Founded  < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded  > 2003
SELECT count(*) FROM orchestra WHERE Major_Record_Format IN ("CD", "DVD")
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT YEAR_OF_FOUNDED FROM orchestra GROUP BY YEAR_OF_FOUNDED HAVING COUNT(*)  >  1
SELECT T2.Year_of_Founded FROM performance AS T1 JOIN orchestra AS T2 ON T1.Orchestra_ID  =  T2.Orchestra_ID GROUP BY T2.Year_of_Founded HAVING COUNT(T1.Performance_ID)  >  1
SELECT COUNT(*) FROM Highschooler
SELECT count(*) FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT DISTINCT grade FROM Highschooler;
SELECT grade FROM Highschooler
SELECT grade FROM Highschooler WHERE name = 'Kyle';
SELECT grade FROM Highschooler WHERE name = 'Kyle';
SELECT name FROM Highschooler WHERE grade = 10
SELECT name FROM Highschooler WHERE grade = 10
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT grade ,  count(*) FROM Highschooler GROUP BY grade
SELECT grade, COUNT(ID) FROM Highschooler GROUP BY grade
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(ID) >= 4
SELECT T1.ID ,  count(*) FROM FRIEND AS T1 JOIN HIGHSCHOOLER AS T2 ON T1.friend_id  =  T2.id GROUP BY T2.ID
SELECT COUNT(*) FROM friend GROUP BY student_id
SELECT T1.name, COUNT(T2.friend_id) AS NumberOfFriends FROM Highschooler AS T1 LEFT JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.name
SELECT name, ( SELECT count(*) FROM Friend WHERE student_id = Highschooler.ID ) as friend_count FROM Highschooler
SELECT name FROM Highschooler ORDER BY (SELECT COUNT(*) FROM Friend WHERE student_id = Highschooler.ID) DESC LIMIT 1
SELECT name FROM highschooler WHERE id IN (SELECT student_id FROM friend GROUP BY student_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.id GROUP BY T1.student_id HAVING COUNT(*) >= 3
SELECT name FROM highschooler WHERE ID IN (SELECT student_id FROM friend GROUP BY student_id HAVING COUNT(*) >= 3)
SELECT name FROM Highschooler WHERE ID IN (SELECT friend_id FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle'))
SELECT DISTINCT name FROM highschooler WHERE ID IN (SELECT friend_id FROM friend WHERE student_id = (SELECT ID FROM highschooler WHERE name = 'Kyle'))
SELECT COUNT(friend_id) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT ID FROM Highschooler EXCEPT SELECT student_id FROM Friend
SELECT ID FROM highschooler WHERE ID NOT IN (SELECT friend_id FROM friend UNION SELECT student_id FROM friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT name FROM highschooler WHERE ID NOT IN (SELECT student_id FROM friend)
SELECT student_id FROM Highschooler WHERE ID IN (SELECT friend_id FROM Friend) INTERSECT SELECT liked_id FROM Likes
SELECT ID FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend) INTERSECT SELECT ID FROM Highschooler WHERE ID IN (SELECT liked_id FROM Likes)
SELECT name FROM Highschooler WHERE ID IN (SELECT friend_id FROM Friend WHERE student_id IN (SELECT ID FROM Highschooler)) AND ID IN (SELECT liked_id FROM Likes)
SELECT H1.name FROM Highschooler AS H1 INNER JOIN Friend AS F1 ON H1.ID = F1.student_id WHERE H1.ID IN (SELECT H2.ID FROM Highschooler AS H2 INNER JOIN Likes AS L ON H2.ID = L.student_id)
SELECT student_id, COUNT(*) FROM Likes GROUP BY student_id
SELECT student_id, COUNT(liked_id) FROM Likes GROUP BY student_id
SELECT T1.name, COUNT(*) FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T2.liked_id
SELECT T2.name, COUNT(*) FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.liked_id = T2.ID GROUP BY T2.ID
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT h.name FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.name ORDER BY COUNT(l.student_id) DESC LIMIT 1
SELECT name FROM Highschooler WHERE ID IN (SELECT liked_id FROM Likes GROUP BY liked_id HAVING COUNT(*) >= 2)
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID HAVING COUNT(T1.ID) >= 2
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.grade > 5 GROUP BY T2.student_id HAVING COUNT(*) >= 2
SELECT name FROM Highschooler WHERE grade > 5 AND ID IN (SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(*) >= 2)
SELECT COUNT(*) FROM Likes WHERE liked_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle');
SELECT COUNT(*) FROM Likes WHERE liked_id IN (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT avg(T2.grade) FROM friend AS T1 JOIN highschooler AS T2 ON T2.id = T1.student_id
SELECT avg(grade) FROM highschooler WHERE ID IN (SELECT student_id FROM friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT DISTINCT T1.state FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id = T2.owner_id INNER JOIN professionals AS T3 ON T1.owner_id = T3.owner_id
SELECT state FROM owners GROUP BY state HAVING COUNT(*) > 0 AND COUNT(DISTINCT professional_id) > 0
SELECT AVG(age) FROM Dogs WHERE dog_id IN ( SELECT dog_id FROM Treatments)
SELECT avg(T1.age) FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT professional_id ,  last_name ,  cell_number FROM professionals WHERE (home_phone LIKE '%(1)_________%' AND state = 'Indiana') OR (professional_id IN ( SELECT professional_id FROM treatments GROUP BY professional_id HAVING COUNT(*) > 2 ))
SELECT professional_id , last_name , cell_number FROM Professionals WHERE state  =  'Indiana' INTERSECT SELECT professional_id , last_name , cell_number FROM Professional WHERE professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING count(*)  >  2)
SELECT DISTINCT T4.name FROM treatments AS T1  INNER JOIN dogs AS T2 ON T2.dog_id = T1.dog_id  INNER JOIN professionals AS T3 ON T3.professional_id = T1.professional_id  INNER JOIN breeds AS T4 ON T4.breed_code = T2.breed_code  WHERE T1.cost_of_treatment < 1000
SELECT dogs.name  FROM dogs  INNER JOIN treatments  ON dogs.dog_id = treatments.dog_id WHERE dogs.owner_id NOT IN (    SELECT DISTINCT owner_id     FROM treatments     WHERE treatment_type_code IN ('Daily Accommodation', 'Drugs')     GROUP BY owner_id     HAVING SUM(cost_of_treatment) > 1000 )
SELECT first_name FROM professionals EXCEPT SELECT name FROM dogs UNION SELECT first_name FROM owners EXCEPT SELECT name FROM dogs
SELECT DISTINCT T1.first_name FROM Owners AS T1 LEFT JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id WHERE T2.name IS NULL UNION SELECT DISTINCT first_name FROM Professionals WHERE first_name NOT IN (SELECT T1.first_name FROM Dogs AS T1 JOIN Professionals AS T2 ON T1.name  =  T2.first_name UNION SELECT T1.first_name FROM Dogs AS T1 JOIN Breeds AS T2 ON T1.breed_code  =  T2.breed_code UNION SELECT first_name FROM Professionals)
SELECT professional_id, role_code, email_address FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments)
SELECT professional_id, role_code, email_address FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments)
SELECT owner_id, first_name, last_name FROM Owners WHERE owner_id IN ( SELECT owner_id FROM Dogs GROUP BY owner_id ORDER BY COUNT(*) DESC LIMIT 1 );
SELECT T1.owner_id , T1.first_name , T1.last_name FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id = T2.owner_id GROUP BY T1.owner_id ORDER BY COUNT(T2.dog_id) DESC LIMIT 1
SELECT T1.professional_id ,  T1.role_code ,  T1.first_name FROM professionals AS T1 JOIN treatments AS T2 ON T1.professional_id  =  T2.professional_id GROUP BY T1.professional_id HAVING count(*)  >=  2
SELECT P.professional_id, P.role_code, P.first_name FROM Professionals P JOIN Treatments T ON P.professional_id = T.professional_id GROUP BY T.professional_id HAVING COUNT(T.treatment_id) >= 2
SELECT breed_name FROM Breeds ORDER BY (SELECT COUNT(*) FROM Dogs WHERE breed_code = Breeds.breed_code) DESC LIMIT 1
SELECT breed_name FROM breeds JOIN dogs ON breeds.breed_code = dogs.breed_code GROUP BY breed_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT owner_id, last_name FROM dogs d JOIN treatments t ON d.dog_id = t.dog_id JOIN owners o ON d.owner_id = o.owner_id GROUP BY owner_id, last_name ORDER BY COUNT(t.treatment_id) DESC LIMIT 1
SELECT T1.owner_id, T3.last_name FROM dogs AS T1 INNER JOIN treatments AS T2 ON T1.dog_id = T2.dog_id INNER JOIN owners AS T3 ON T3.owner_id = T1.owner_id GROUP BY T1.owner_id, T3.last_name ORDER BY SUM(T2.cost_of_treatment) DESC LIMIT 1
SELECT treatment_type_description FROM treatment_types WHERE treatment_type_code =  (SELECT treatment_type_code FROM treatments GROUP BY treatment_type_code ORDER BY sum(cost_of_treatment) ASC LIMIT 1)
SELECT T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code GROUP BY T1.treatment_type_code ORDER BY SUM(T1.cost_of_treatment) LIMIT 1
SELECT T1.owner_id ,  T1.zip_code FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id = T2.owner_id JOIN treatments AS T3 ON T2.dog_id = T3.dog_id JOIN charges AS T4 ON T3.treatment_type_code = T4.charge_type GROUP BY T1.owner_id ,  T1.zip_code ORDER BY SUM(T4.charge_amount) DESC LIMIT 1
SELECT T1.owner_id, T2.zip_code FROM Dogs AS T1 JOIN Owners AS T2 ON T1.owner_id = T2.owner_id GROUP BY T1.owner_id ORDER BY SUM(T1.age) DESC LIMIT 1
SELECT p.professional_id, p.cell_number FROM professionals p JOIN treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id HAVING COUNT(DISTINCT t.treatment_type_code) >= 2
SELECT professional_id, cell_number FROM Professionals WHERE professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(*)  >= 2 )
SELECT first_name, last_name FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments WHERE cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments))
SELECT first_name, last_name FROM professionals WHERE professional_id IN (SELECT professional_id FROM treatments WHERE cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM treatments))
SELECT T1.date_of_treatment, T3.first_name FROM Treatments AS T1 JOIN Professional AS T3 ON T1.professional_id  =  T3.professional_id
SELECT T1.date_of_treatment ,  T3.first_name FROM Treatments AS T1 JOIN Dogs AS T2 ON T1.dog_id  =  T2.dog_id JOIN Professionals AS T3 ON T3.professional_id  =  T1.professional_id
SELECT T3.`treatment_type_description`, T1.`cost_of_treatment` FROM Treatments AS T1 JOIN Charges AS T2 ON T2.`charge_id` = T1.`cost_of_treatment` JOIN Treatment_Types AS T3 ON T3.`treatment_type_code` = T1.`treatment_type_code`
SELECT T1.cost_of_treatment ,  T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code  =  T2.treatment_type_code
SELECT T1.first_name ,  T1.last_name ,  T3.size_description FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id  =  T2.owner_id JOIN sizes AS T3 ON T2.size_code  =  T3.size_code
SELECT T2.first_name, T2.last_name, T1.size_description FROM sizes AS T1 JOIN dogs AS T3 ON T1.size_code  =  T3.size_code JOIN owners AS T2 ON T3.owner_id  =  T2.owner_id
SELECT T1.first_name ,  T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id
SELECT T1.first_name , T3.name FROM owners AS T1 JOIN dogs AS T3 ON T1.owner_id  =  T3.owner_id
SELECT T1.name ,  T3.date_of_treatment FROM dogs AS T1 JOIN breeds AS T2 ON T1.breed_code = T2.breed_code JOIN treatments AS T3 ON T1.dog_id = T3.dog_id WHERE T2.breed_code = ( SELECT breed_code FROM dogs GROUP BY breed_code ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT T2.name, T3.date_of_treatment FROM Breeds AS T1 INNER JOIN Dogs AS T2 ON T1.breed_code = T2.breed_code INNER JOIN Treatments AS T3 ON T3.dog_id = T2.dog_id WHERE T1.breed_code IN ( SELECT breed_code FROM ( SELECT breed_code, COUNT(*) AS Num FROM Dogs GROUP BY breed_code ORDER BY Num LIMIT 1 ) AS T )
SELECT O.first_name, D.name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id WHERE O.state = 'Virginia'
SELECT T2.first_name ,  T3.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id  =  T2.owner_id JOIN Breeds AS T3 ON T2.breed_code  =  T3.breed_code WHERE T1.state  =  'Virginia'
SELECT T3.date_arrived, T3.date_departed FROM Treatments AS T1 JOIN Dogs AS T2 ON T1.dog_id = T2.dog_id JOIN Dogs AS T3 ON T1.dog_id = T3.dog_id
SELECT T3.date_arrived ,  T3.date_departed FROM Treatments AS T1 JOIN Dogs AS T2 ON T1.dog_id  =  T2.dog_id JOIN Dogs AS T3 ON T1.dog_id  =  T3.dog_id
SELECT last_name FROM owners ORDER BY date_of_birth ASC LIMIT 1
SELECT last_name FROM dogs ORDER BY date_of_birth DESC LIMIT 1
SELECT email_address FROM Professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT `date_arrived`, `date_departed` FROM `Dogs`
SELECT date_arrived ,  date_departed FROM dogs
SELECT COUNT(DISTINCT dog_id) FROM Treatments;
SELECT COUNT(dog_id) FROM Treatments
SELECT count(DISTINCT professional_id) FROM treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT role_code ,  street ,  city ,  state FROM Professionals WHERE city LIKE '%West%'
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%';
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT T2.first_name ,  T2.last_name ,  T2.email_address FROM Sizes AS T1 JOIN Dogs AS T3 ON T3.size_code = T1.size_code JOIN Owners AS T2 ON T2.owner_id = T3.owner_id WHERE T1.size_description LIKE '%North%'
SELECT COUNT(*) FROM dogs WHERE age < (SELECT AVG(age) FROM dogs)
SELECT COUNT(*) FROM dogs WHERE age < (SELECT AVG(age) FROM dogs)
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT count(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT COUNT(*) FROM dogs WHERE dog_id NOT IN ( SELECT dog_id FROM treatments )
SELECT COUNT(*) FROM owners WHERE abandoned_yn = 1 AND dog_id IS NULL;
SELECT COUNT(*) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs WHERE date_adopted IS NOT NULL AND date_departed IS NULL)
SELECT COUNT(*) FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments)
SELECT COUNT(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = 1
SELECT AVG(age) FROM Dogs
SELECT avg(age) FROM Dogs
SELECT MAX(age) AS age FROM Dogs
SELECT MAX(age) FROM dogs
SELECT charge_type ,  charge_amount FROM Charges
SELECT charge_type ,  charge_amount FROM Charges
SELECT MAX(t1.charge_amount) FROM Charges AS t1 INNER JOIN Treatments AS t2 ON t1.charge_id = t2.treatment_id
SELECT MAX(charge_amount) FROM Charges
SELECT email_address ,  cell_number ,  home_phone FROM Professional
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT breed_code, size_code FROM Dogs
SELECT DISTINCT breed_code ,  size_code FROM Dogs
SELECT T3.first_name, T4.treatment_type_description FROM Treatments AS T1 JOIN Professional AS T2 ON T1.professional_id  =  T2.professional_id JOIN Professionals AS T3 ON T3.professional_id  =  T2.professional_id JOIN Treatment_Types AS T4 ON T4.treatment_type_code  =  T1.treatment_type_code
SELECT T2.first_name ,  T1.treatment_type_description FROM Treatments AS T1 JOIN Professional AS T2 ON T1.professional_id = T2.professional_id
SELECT COUNT(*) FROM singer
SELECT count(*) FROM singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year, Citizenship FROM singer
SELECT Birth_Year ,  Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949)
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT COUNT(*), Citizenship FROM singer GROUP BY Citizenship
SELECT COUNT(*) ,  Citizenship FROM singer GROUP BY Citizenship
SELECT `Citizenship` FROM `singer` GROUP BY `Citizenship` ORDER BY count(*) DESC LIMIT 1
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship ,  MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT Citizenship ,  MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT s.title, si.Name FROM song AS s JOIN singer AS si ON s.Singer_ID = si.Singer_ID
SELECT T2.Title ,  T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID  =  T2.Singer_ID
SELECT DISTINCT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000
SELECT DISTINCT t1.name FROM singer AS t1 JOIN song AS t2 ON t1.singer_id  =  t2.singer_id WHERE t2.sales  >  300000
SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T1.Singer_ID HAVING count(*)  >  1
SELECT s1.Name FROM singer s1 JOIN song s2 ON s1.Singer_ID = s2.Singer_ID GROUP BY s1.Name HAVING COUNT(s2.Song_ID) > 1
SELECT T1.Name, SUM(T2.Sales) FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T1.Name
SELECT T1.Name ,  SUM(T2.Sales) FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T1.Name
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT name FROM singer WHERE singer_id NOT IN (SELECT singer_id FROM song)
SELECT T1.Citizenship FROM singer AS T1 WHERE T1.Birth_Year < 1945 INTERSECT SELECT T1.Citizenship FROM singer AS T1 WHERE T1.Birth_Year > 1955
SELECT DISTINCT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT DISTINCT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT count(*) FROM Other_Available_Features
SELECT feature_type_name FROM Ref_Feature_Types WHERE feature_type_code = 'Amenity'
SELECT DISTINCT T2.property_type_description FROM Other_Property_Features AS T1 INNER JOIN Properties AS T3 ON T3.property_id = T1.property_id INNER JOIN Ref_Property_Types AS T2 ON T2.property_type_code = T3.property_type_code
SELECT property_name FROM Properties WHERE property_type_code IN ('House', 'Apartment') AND room_count > 1