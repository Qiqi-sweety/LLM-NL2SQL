SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer;
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT Name ,  Country ,  Age FROM singer ORDER BY Age DESC
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'
SELECT AVG(age) ,  MIN(age) ,  MAX(age) FROM singer WHERE country = 'France'
SELECT T3.Name, T3.Song_release_year FROM singer_in_concert AS T1 JOIN concert AS T2 ON T1.concert_ID  =  T2.concert_ID JOIN singer AS T3 ON T1.Singer_ID  =  T3.Singer_ID WHERE T3.Age  =  (SELECT MIN(Age) FROM singer)
SELECT T2.Name, T2.Song_release_year FROM singer AS T1 JOIN singer_in_concert AS T3 ON T1.Singer_ID = T3.Singer_ID JOIN concert AS T4 ON T3.concert_ID = T4.concert_ID WHERE T1.Age = ( SELECT min(Age) FROM singer )
SELECT DISTINCT Country FROM singer WHERE Age  >  20
SELECT DISTINCT T2.Country FROM singer AS T1 INNER JOIN singer_in_concert AS T3 ON T1.Singer_ID  =  T3.Singer_ID INNER JOIN concert AS T4 ON T3.concert_ID  =  T4.concert_ID WHERE T1.Age  >  20
SELECT Country, COUNT(*) FROM singer GROUP BY Country
SELECT COUNT(*) ,  Country FROM singer GROUP BY Country
SELECT t1.song_name FROM singer AS t1 INNER JOIN singer_in_concert AS t2 ON t1.singer_id  =  t2.singer_id WHERE t1.age  >  (SELECT AVG(age) FROM singer)
SELECT DISTINCT s.Song_Name FROM singer s WHERE s.Age > (SELECT avg(s.Age) FROM singer s)
SELECT LOCATION ,  NAME FROM stadium WHERE CAPACITY  BETWEEN 5000 AND 10000
SELECT Location ,  Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT max(capacity), avg(capacity) FROM stadium
SELECT AVG(capacity) ,  MAX(capacity) FROM stadium
SELECT Name ,  Capacity FROM stadium ORDER BY Average DESC LIMIT 1
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1
SELECT COUNT(*) FROM concert WHERE Year IN (2014, 2015);
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015');
SELECT s.Name ,  COUNT(c.concert_ID) FROM stadium s JOIN concert c ON s.Stadium_ID  =  c.Stadium_ID GROUP BY c.Stadium_ID
SELECT t2.stadium_id ,  COUNT(*) FROM singer_in_concert AS t1 JOIN concert AS t2 ON t1.concert_id  =  t2.concert_id GROUP BY t2.stadium_id
SELECT t1.name ,  t1.capacity FROM stadium AS t1 JOIN ( SELECT T1.stadium_id ,  COUNT(T2.concert_id) AS num FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_id  =  T2.concert_id WHERE T1.year >= '2014' GROUP BY T1.stadium_id ORDER BY num DESC LIMIT 1 ) t2 ON t1.stadium_id  =  t2.stadium_id
SELECT T1.name ,  T1.capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID  =  T2.Stadium_ID WHERE T2.year  >  2013 GROUP BY T2.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT DISTINCT Stadium_ID FROM concert)
SELECT Country FROM singer WHERE Age  >  40 EXCEPT SELECT Country FROM singer WHERE Age  <  30
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = 2014)
SELECT DISTINCT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert WHERE year = '2014');
SELECT T2.concert_Name ,  T2.Theme ,  COUNT(*) FROM singer_in_concert AS T1 JOIN concert AS T2 ON T1.concert_ID  =  T2.concert_ID GROUP BY T1.concert_ID
SELECT T1.concert_Name ,  T1.Theme ,  count(T2.Singer_ID) FROM concert AS T1 JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID GROUP BY T1.concert_Name ,  T1.Theme
SELECT T1.Name ,  COUNT(*) FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T2.Singer_ID
SELECT T2.Name ,  COUNT(T3.concert_ID) FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID JOIN concert AS T3 ON T1.concert_ID  =  T3.concert_ID GROUP BY T2.Name
SELECT T3.Name FROM singer_in_concert AS T1 INNER JOIN concert AS T2 ON T1.concert_ID = T2.concert_ID INNER JOIN singer AS T3 ON T1.Singer_ID = T3.Singer_ID WHERE T2.Year = 2014
SELECT T2.Name FROM concert AS T1 JOIN singer_in_concert AS T3 ON T1.concert_ID  =  T3.concert_ID JOIN singer AS T2 ON T2.Singer_ID  =  T3.Singer_ID WHERE T1.Year  =  '2014'
SELECT T1.Name, T1.Country FROM singer AS T1 INNER JOIN singer_in_concert AS T2 ON T1.Singer_ID  =  T2.Singer_ID INNER JOIN concert AS T3 ON T2.concert_ID  =  T3.concert_ID WHERE T1.Song_Name LIKE 'Hey%'
SELECT DISTINCT T2.Name, T2.Country FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID JOIN concert AS T3 ON T1.concert_ID  =  T3.concert_ID WHERE T3.Theme LIKE '%Hey%'
SELECT DISTINCT T1.Name, T1.Location FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = '2014' AND T2.Year = '2015'
SELECT T1.Name, T1.Location FROM stadium AS T1 INNER JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = '2014' INTERSECT SELECT T1.Name, T1.Location FROM stadium AS T1 INNER JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = '2015'
SELECT count(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1)
SELECT COUNT(concert.concert_ID) FROM concert INNER JOIN stadium ON concert.Stadium_ID = stadium.Stadium_ID ORDER BY stadium.Capacity DESC LIMIT 1
SELECT COUNT(*) FROM Pets WHERE weight > 10
SELECT COUNT(*) FROM Pets WHERE weight > 10
SELECT weight FROM Pets WHERE PetType = 'Dog' ORDER BY pet_age ASC LIMIT 1
SELECT weight FROM Pets ORDER BY pet_age ASC LIMIT 1
SELECT pet_type, MAX(weight) FROM Pets GROUP BY pet_type
SELECT PetType, MAX(weight)  FROM Pets GROUP BY PetType
SELECT COUNT(*) FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE Age > 20)
SELECT COUNT(DISTINCT T2.PetID) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID  =  T2.StuID WHERE T1.Age  >  20
SELECT COUNT(*) FROM Pets AS T1 JOIN Has_Pet AS T2 ON T1.PetID = T2.PetID JOIN Student AS T3 ON T3.StuID = T2.StuID WHERE T1.PetType = 'dog' AND T3.sex = 'F';
SELECT count(T2.PetID) FROM Pets AS T1 JOIN Has_Pet AS T2 ON T1.PetID = T2.PetID JOIN Student AS T3 ON T3.StuID = T2.StuID WHERE T1.PetType = 'Dog' AND T3.Sex = 'F'
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT T1.fname FROM STUDENT AS T1 JOIN HAS_PET AS T2 ON T1.stuid = T2.stuid JOIN PETS AS T3 ON T2.petid = T3.petid WHERE T3.pettype IN ('cat', 'dog')
SELECT DISTINCT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID  =  T2.StuID JOIN Pets AS T3 ON T2.PetID  =  T3.PetID WHERE T3.PetType  =  'Cat' OR T3.PetType  =  'Dog'
SELECT T3.fname FROM Has_Pet AS T1 JOIN Has_Pet AS T2 ON T1.stuid  =  T2.stuid JOIN Student AS T3 ON T2.stuid  =  T3.stuid WHERE T1.petid  =  1 INTERSECT SELECT T3.fname FROM Has_Pet AS T1 JOIN Has_Pet AS T2 ON T1.stuid  =  T2.stuid JOIN Student AS T3 ON T2.stuid  =  T3.stuid WHERE T2.petid  =  2
SELECT DISTINCT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID  =  T2.StuID JOIN Pets AS T3 ON T2.PetID  =  T3.PetID WHERE T3.PetType  =  'cat' INTERSECT SELECT DISTINCT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID  =  T2.StuID JOIN Pets AS T3 ON T2.PetID  =  T3.PetID WHERE T3.PetType  =  'dog'
SELECT major, age FROM Student WHERE StuID NOT IN (SELECT Student.StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat')
SELECT DISTINCT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Cat'))
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Cat'))
SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'Dog' EXCEPT SELECT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'Cat'
SELECT T1.fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog' AND NOT T3.PetType = 'cat'
SELECT PetType, weight FROM Pets ORDER BY pet_age LIMIT 1;
SELECT PetType ,  weight FROM Pets ORDER BY pet_age ASC LIMIT 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetType, AVG(pet_age) AS AverageAge, MAX(pet_age) AS MaxAge FROM Pets GROUP BY PetType
SELECT PetType, AVG(pet_age) as Average_Age, MAX(pet_age) as Maximum_Age FROM Pets GROUP BY PetType
SELECT avg(weight) ,  pettype FROM pets GROUP BY pettype
SELECT pet_type, AVG(weight) FROM Pets GROUP BY pet_type
SELECT T1.Fname, T1.age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID
SELECT DISTINCT T1.Fname ,  T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID  =  T2.StuID
SELECT T1.StuID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.LName = 'Smith'
SELECT T1.PetID FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID = T2.StuID WHERE T2.LName = 'Smith'
SELECT T1.StuID, COUNT(*) FROM Has_Pet AS T1 JOIN Pets AS T2 ON T1.PetID  =  T2.PetID GROUP BY T1.StuID
SELECT StuID, COUNT(PetID) FROM Has_Pet GROUP BY StuID;
SELECT Fname ,  Sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet GROUP BY StuID HAVING count(*)  >  1)
SELECT T2.Fname ,  T2.Sex FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID  =  T2.StuID GROUP BY T1.StuID HAVING COUNT(*)  >  1
SELECT T2.lname FROM pets AS T1 JOIN student AS T2 ON T1.stuid = T2.stuid WHERE T1.pettype = 'cat' AND T1.pet_age = 3 ORDER BY T2.lname DESC LIMIT 1
SELECT T1.Lname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID  =  T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3
SELECT AVG(age) FROM student WHERE StuID NOT IN (SELECT StuID FROM has_pet)
SELECT AVG(T1.age) FROM Student AS T1 LEFT JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T2.StuID IS NULL
SELECT count(*) FROM continents
SELECT count(*) FROM continents
SELECT T1.ContId, T2.Continent, COUNT(*) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId = T2.Continent GROUP BY T1.ContId
SELECT continents.ContId ,  continents.Continent ,  COUNT(DISTINCT countries.CountryId) FROM continents JOIN countries ON continents.ContId  =  countries.Continent GROUP BY continents.ContId
SELECT count(*) FROM countries
SELECT count(CountryId) FROM countries
SELECT T1.Maker, T1.FullName, T1.Id, COUNT(T2.Model) AS Num_Models FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id
SELECT DISTINCT M.Id, M.FullName, COUNT(Model) FROM car_makers AS M JOIN model_list AS ML ON M.Id = ML.Maker GROUP BY M.Id, M.FullName
SELECT model FROM model_list ORDER BY Horsepower ASC LIMIT 1
SELECT T2.Model FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.Model ORDER BY T1.Horsepower ASC LIMIT 1;
SELECT Model FROM cars_data WHERE Weight < (SELECT avg(Weight) FROM cars_data)
SELECT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model WHERE T2.Weight  <  (SELECT avg(Weight) FROM cars_data)
SELECT DISTINCT T1.Maker FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Country IN (SELECT Country FROM countries WHERE Year = 1970)
SELECT DISTINCT T2.Maker FROM cars_data AS T1 JOIN car_makers AS T2 ON T1.Id = T2.Id WHERE T1.Year = 1970
SELECT T1.Make, T4.Year FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN car_names AS T3 ON T2.Model = T3.Model INNER JOIN cars_data AS T4 ON T3.MakeId = T4.Id ORDER BY T4.Year ASC LIMIT 1
SELECT T1.Maker, T2.Year FROM car_makers AS T1 JOIN cars_data AS T2 ON T1.Id = T2.Id ORDER BY T2.Year ASC LIMIT 1
SELECT DISTINCT T2.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model  =  T2.Model WHERE T2.Year  >  1980
SELECT T3.Model FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker  =  T2.Id JOIN cars_data AS T3 ON T3.Id = T1.Model WHERE T3.Year  >  1980
SELECT t2.continent, COUNT(t1.id) FROM car_makers AS t1 JOIN countries AS t2 ON t2.countryid  =  t1.country GROUP BY t2.continent
SELECT T2.Continent, COUNT(*) FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.Continent;
SELECT T2.CountryName FROM continents AS T1 JOIN countries AS T2 ON T1.ContId = T2.Continent GROUP BY T2.CountryName ORDER BY count(DISTINCT T3.Maker) DESC LIMIT 1;
SELECT T3.CountryName FROM model_list AS T1  JOIN car_makers AS T2 ON T1.Maker = T2.Id  JOIN countries AS T3 ON T2.Country = T3.CountryId  GROUP BY T3.CountryName  ORDER BY COUNT(*) DESC  LIMIT 1
SELECT T2.fullname, COUNT(*)  FROM model_list AS T1  JOIN car_makers AS T2 ON T1.maker = T2.id  GROUP BY T1.maker
SELECT T2.Id ,  T2.FullName FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker
SELECT T1.Accelerate FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Make = 'amc' AND T2.Model = 'hornet sportabout (sw)'
SELECT T1.Accelerate FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.Model JOIN car_makers AS T3 ON T2.Maker = T3.Id WHERE T3.Maker = 'amc' AND T2.Model = 'hornet sportabout'
SELECT COUNT(*) FROM car_makers WHERE Country = (SELECT CountryId FROM countries WHERE CountryName = 'France')
SELECT COUNT(DISTINCT car_makers.Maker)  FROM countries  INNER JOIN car_makers ON countries.CountryId = car_makers.Country  WHERE countries.CountryName = 'France'
SELECT COUNT(*) FROM model_list WHERE Country = 1
SELECT count(*) FROM model_list WHERE Country IN (SELECT CountryId FROM countries WHERE CountryName = 'United States')
SELECT AVG(T2.MPG) FROM model_list AS T1 JOIN cars_data AS T2 ON T1.ModelId = T2.Id WHERE T2.Cylinders = 4
SELECT AVG(T1.MPG) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Model IN (SELECT Model FROM model_list WHERE Cylinders = 4)
SELECT Weight FROM cars_data WHERE Cylinders = 8 AND Year = 1974 ORDER BY Weight ASC LIMIT 1
SELECT min(T1.Weight) FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.Model WHERE T1.Cylinders = 8 AND T1.Year = 1974
SELECT DISTINCT T2.Maker, T3.Model FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id  =  T2.Maker JOIN car_names AS T3 ON T2.Model  =  T3.Model
SELECT T3.Maker, T3.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id JOIN model_list AS T3 ON T1.Model = T3.Model
SELECT CountryId, CountryName FROM countries WHERE CountryId IN (SELECT DISTINCT Country FROM car_makers);
SELECT CountryName, CountryId FROM countries WHERE CountryId IN ( SELECT Country FROM car_makers GROUP BY Country )
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150
SELECT COUNT(*) FROM cars_data WHERE Horsepower  >  150
SELECT avg(weight), Year FROM cars_data GROUP BY Year
SELECT AVG(T1.Weight), T1.Year FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId GROUP BY T1.Year
SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T1.Continent = 2 GROUP BY T1.CountryId HAVING COUNT(T2.Id) >= 3
SELECT CountryName FROM countries WHERE Continent = (SELECT ContId FROM continents WHERE Continent = 'europe') AND CountryId IN (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(*) >= 3)
SELECT Horsepower, Make FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE Cylinders = 3 AND Horsepower = ( SELECT MAX(Horsepower) FROM cars_data WHERE Cylinders = 3 )
SELECT T2.Maker, T2.FullName FROM cars_data AS T1 INNER JOIN car_makers AS T2 ON T1.Id = T2.Id WHERE T1.Cylinders = 3 AND T1.Horsepower = ( SELECT MAX(T3.Horsepower) FROM cars_data AS T3 WHERE T3.Cylinders = 3)
SELECT Model FROM cars_data ORDER BY MPG DESC LIMIT 1
SELECT T1.Model FROM model_list AS T1 JOIN cars_data AS T2 ON T1.ModelId = T2.Id ORDER BY T2.MPG DESC LIMIT 1
SELECT AVG(T1.Horsepower) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Model IN (SELECT T3.Model FROM model_list AS T3 INNER JOIN car_makers AS T4 ON T4.Id = T3.Maker WHERE T4.FullName = 'Ford' AND T4.Maker IN (SELECT T5.Maker FROM car_makers AS T5 INNER JOIN countries AS T6 ON T5.Country = T6.CountryId WHERE T6.Continent = 1)) AND T1.Year < 1980
SELECT AVG(T1.Horsepower) FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Model IN ( SELECT Model FROM model_list WHERE Year < 1980 )
SELECT AVG(edispl) FROM cars_data WHERE cars_data.Id IN (SELECT Id FROM car_names WHERE Model = 'volvo')
SELECT AVG(T1.Edispl) FROM cars_data AS T1 JOIN car_makers AS T2 ON T1.Id = T2.Id WHERE T2.Maker = 'Volvo'
SELECT max(Accelerate) ,  Cylinders FROM cars_data GROUP BY Cylinders
SELECT MAX(Accelerate), Cylinders FROM cars_data GROUP BY Cylinders;
SELECT model FROM model_list GROUP BY model ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Model FROM model_list AS T1 JOIN cars_data AS T2 ON T1.ModelId = T2.Id GROUP BY T1.Model ORDER BY COUNT(DISTINCT T1.ModelId) DESC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT count(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(T2.Model) FROM car_makers AS T1  JOIN model_list AS T2 ON T1.Id  =  T2.Maker  WHERE T1.FullName  =  'American Motor Company'
SELECT COUNT(DISTINCT T3.Model) FROM car_makers AS T1 INNER JOIN model_list AS T2 ON T1.Id = T2.Maker INNER JOIN car_names AS T3 ON T2.Model = T3.Model WHERE T1.Maker = 'American Motor Company'
SELECT Maker FROM car_makers GROUP BY Maker HAVING COUNT(Maker)  >  3
SELECT T1.Maker, T1.Id FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(*) > 3
SELECT model FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE FullName = 'General Motors') OR Weight > 3500
SELECT T2.Model FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Make IN (SELECT T3.Maker FROM car_makers AS T3 WHERE T3.Maker = 'General Motors') OR T1.Weight > 3500
SELECT Year FROM cars_data WHERE Weight >= 3000 AND Weight <= 4000
SELECT DISTINCT YEAR FROM cars_data WHERE Weight < 4000 INTERSECT SELECT DISTINCT YEAR FROM cars_data WHERE Weight > 3000
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT horsepower FROM cars_data ORDER BY accelerate DESC LIMIT 1
SELECT Cylinders FROM cars_data WHERE Make = 'volvo' AND Model = (SELECT Model FROM model_list WHERE Maker = (SELECT Id FROM car_makers WHERE Maker = 'volvo') ORDER BY Accelerate ASC LIMIT 1)
SELECT T2.Cylinders FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T1.Make = 'volvo' AND T1.Model = ( SELECT T2.Model FROM car_names AS T1 INNER JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T1.Make = 'volvo' ORDER BY T2.Accelerate ASC LIMIT 1 )
SELECT COUNT(*) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id  =  T2.MakeId WHERE T1.Accelerate  >  (SELECT T1.Accelerate FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id  =  T2.MakeId ORDER BY T1.Horsepower DESC LIMIT 1)
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Horsepower) FROM cars_data);
SELECT COUNT(DISTINCT T2.country) FROM car_makers AS T1 JOIN countries AS T2 ON T1.country = T2.country_id GROUP BY T2.country_id HAVING COUNT(*) > 2
SELECT COUNT(DISTINCT T1.Country) FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId  =  T2.Country WHERE T1.Country IN (SELECT T1.Country FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id  =  T2.Maker GROUP BY T1.Country HAVING COUNT(DISTINCT T2.Model)  >  2)
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6;
SELECT model FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE Continent = 1)) AND Model IN (SELECT Model FROM cars_data WHERE Cylinders = 4) ORDER BY Horsepower DESC LIMIT 1
SELECT M.Model FROM model_list M WHERE M.Id IN (SELECT model FROM car_names WHERE Make IN (SELECT Maker FROM car_makers WHERE Cars_data.Id = M.Id AND Cars_data.Cylinders = 4) GROUP BY Horsepower ORDER BY Horsepower DESC LIMIT 1)
SELECT MakeId, Make FROM car_names WHERE MakeId IN (SELECT Model FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Horsepower > (SELECT MIN(Horsepower) FROM cars_data)) EXCEPT SELECT MakeId FROM cars_data WHERE Cylinders > 3)
SELECT T2.MakeId, T2.Model FROM cars_data AS T1 INNER JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Horsepower < 4 AND T1.Year > ( SELECT MIN(Year) FROM cars_data )
SELECT T2.MaxMPG FROM model_list AS T1 JOIN ( SELECT T3.Maker, MAX(T1.MPG) AS MaxMPG FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id  =  T2.MakeId WHERE T1.Cylinders  =  8 AND T1.Year  <  1980 GROUP BY T2.Maker ) AS T2 ON T1.Id  =  T2.Maker
SELECT max(T3.MPG) FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id INNER JOIN cars_data AS T3 ON T2.Country = T3.Id WHERE T1.Cylinders = 8 OR T3.Year < 1980
SELECT T1.Model FROM model_list AS T1 JOIN cars_data AS T2 ON T1.ModelId = T2.Id JOIN car_makers AS T3 ON T1.Maker = T3.Id WHERE T2.weight < 3500 AND T3.Maker != 'Ford Motor Company'
SELECT T3.Model FROM cars_data AS T1 JOIN car_makers AS T2 ON T1.Id = T2.Id JOIN model_list AS T3 ON T2.Maker = T3.Id WHERE T2.Maker != ( SELECT Id FROM car_makers WHERE Maker = 'Ford Motor Company' ) AND T1.Weight < 3500
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT DISTINCT Country FROM car_makers)
SELECT countryname FROM countries WHERE countryid NOT IN (SELECT country FROM car_makers)
SELECT t2.Id ,  t2.Maker FROM model_list AS t1 JOIN car_makers AS t2 ON t1.Maker  =  t2.Id GROUP BY t2.Maker HAVING count(*)  >=  2
SELECT DISTINCT C.Id, C.Maker FROM car_makers AS C WHERE (SELECT COUNT(Model) FROM model_list WHERE Maker = C.Id) >= 2 AND (SELECT COUNT(Id) FROM car_names WHERE Make = C.Id) > 3
SELECT T2.CountryName FROM car_makers AS T1 INNER JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName HAVING COUNT(*) > 3 UNION SELECT T2.CountryName FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id INNER JOIN countries AS T3 ON T2.Country = T3.CountryId WHERE T1.Model = 'fiat'
SELECT T.CountryId, T.CountryName FROM countries AS T INNER JOIN car_makers AS M ON T.CountryId = M.Country INNER JOIN model_list AS L ON M.Id = L.Maker WHERE T.CountryId IN ( SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(*) > 3 ) OR M.Maker = 'fiat'
SELECT T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T1.Airline  =  'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways';
SELECT abbreviation FROM airlines WHERE airline = "JetBlue Airways";
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Airline ,  Abbreviation FROM airlines WHERE Country = 'USA'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony';
SELECT count(*) FROM airlines
SELECT count(*) FROM airlines;  Lastly, the SQL query without comments: SELECT count(*) FROM airlines;
SELECT COUNT(*) FROM airports
SELECT count(*) FROM airports
SELECT COUNT(*) FROM flights;
SELECT COUNT(*) FROM flights;
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT * FROM airlines WHERE Abbreviation = 'UAL'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT count(uid) FROM airlines WHERE Country = 'USA';
SELECT City, Country FROM airports WHERE AirportCode = 'ALU'
SELECT T1.city, T1.country FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.AirportName = 'Alton'
SELECT T1.AirportName FROM airports AS T1 INNER JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = 'Aberdeen';
SELECT AirportName FROM airports WHERE Country = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG';
SELECT count(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT count(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport  =  T2.AirportCode WHERE T2.City  =  'Aberdeen'
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'Aberdeen';
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen';
SELECT COUNT(*) FROM flights WHERE SourceAirport = (SELECT AirportCode FROM airports WHERE City = 'Aberdeen') AND DestAirport = (SELECT AirportCode FROM airports WHERE City = 'Ashley')
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Abbotsford' AND flights.DestAirport = 'ADB';
SELECT COUNT(*) FROM flights WHERE Airline IN (SELECT uid FROM airlines WHERE Airline = 'JetBlue Airways')
SELECT COUNT(*) FROM flights INNER JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'Jetblue Airways'
SELECT COUNT(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid JOIN airports AS T3 ON T1.SourceAirport = T3.AirportCode WHERE T2.Airline = 'United Airlines' AND T3.AirportCode = 'ASY'
SELECT COUNT(*) FROM flights AS t1 JOIN airlines AS t2 ON t1.Airline = t2.uid JOIN airports AS t3 ON t1.DestAirport = t3.AirportCode WHERE t2.Airline = 'United Airlines' AND t3.AirportName = 'ASY Airport';
SELECT COUNT(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid JOIN airports AS T3 ON T1.SourceAirport = T3.AirportCode WHERE T2.Airline = 'United Airlines' AND T3.AirportCode = 'AHD'
SELECT COUNT(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline  =  T2.uid JOIN airports AS T3 ON T1.SourceAirport = T3.AirportCode WHERE T2.Abbreviation = 'UAL' AND T3.AirportCode = 'AHD'
SELECT COUNT(*) FROM flights WHERE Airline IN (SELECT uid FROM airlines WHERE Airline = 'United Airlines') AND DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode JOIN airlines AS T3 ON T1.Airline = T3.uid WHERE T2.City = 'Aberdeen' AND T3.Airline = 'United Airlines'
SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT City, COUNT(DISTINCT DestAirport) as Frequency FROM airports WHERE AirportCode IN ( 	SELECT DestAirport 	FROM flights 	GROUP BY DestAirport 	ORDER BY COUNT(*) DESC 	LIMIT 1 )
SELECT City, COUNT(*) as DepartingFlights FROM airports JOIN flights ON airports.AirportCode = flights.SourceAirport GROUP BY City ORDER BY DepartingFlights DESC LIMIT 1
SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode  =  T2.SourceAirport GROUP BY T2.SourceAirport ORDER BY count(*) DESC LIMIT 1
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) DESC LIMIT 1
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) DESC LIMIT 1
SELECT AirportCode FROM airports GROUP BY AirportCode ORDER BY COUNT(*) ASC LIMIT 1;
SELECT AirportCode FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) ASC LIMIT 1
SELECT Airline FROM flights GROUP BY Airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT Airline FROM flights GROUP BY Airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.uid ORDER BY COUNT(*) ASC LIMIT 1
SELECT Abbreviation, Country FROM airlines WHERE uid = ( SELECT Airline FROM flights GROUP BY Airline ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT DISTINCT a1.Airline  FROM airlines AS a1  JOIN flights AS f ON a1.uid = f.Airline  JOIN airports AS a2 ON f.SourceAirport = a2.AirportCode  WHERE a2.AirportCode = 'AHD'
SELECT DISTINCT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport = 'AHD'
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline JOIN airports AS T3 ON T2.SourceAirport = T3.AirportCode WHERE T3.AirportCode = 'AHD'
SELECT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline JOIN airports ap ON f.DestAirport = ap.AirportCode WHERE ap.AirportCode = 'AHD'
SELECT DISTINCT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport = 'APG' INTERSECT SELECT DISTINCT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.DestAirport = 'CVO'
SELECT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport IN ('APG', 'CVO') GROUP BY a.Airline HAVING COUNT(DISTINCT f.SourceAirport) = 2
SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.SourceAirport = 'CVO' INTERSECT SELECT DISTINCT T1.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T1.SourceAirport != 'APG'
SELECT DISTINCT T1.Airline FROM flights AS T1 INNER JOIN airlines AS T2 ON T1.Airline = T2.uid INNER JOIN airports AS T3 ON T1.SourceAirport = T3.AirportCode WHERE T3.AirportCode != 'CVO' AND T3.AirportCode = 'APG'
SELECT T3.Airline FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode JOIN airlines AS T3 ON T3.uid = T1.Airline GROUP BY T3.Airline HAVING COUNT(*) >= 10
SELECT T1.Abbreviation FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline GROUP BY T1.Abbreviation HAVING COUNT(*)  >=  10
SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(*)  < 200
SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(*) < 200
SELECT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE Airline IN (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE AirportName = 'APG')
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT FlightNo FROM flights WHERE SourceAirport = 'KZR'
SELECT DISTINCT t1.FlightNo FROM flights AS t1 JOIN airports AS t2 ON t1.DestAirport = t2.AirportCode WHERE t2.City = 'Aberdeen';
SELECT flights.FlightNo  FROM flights  JOIN airports  ON flights.DestAirport = airports.AirportCode  WHERE airports.City = 'Aberdeen'; 
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City IN ('Aberdeen', 'Abilene')
SELECT COUNT(*) FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen' OR City = 'Abilene')
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION ALL SELECT DestAirport FROM flights)
SELECT AirportCode FROM airports WHERE AirportCode NOT IN (SELECT DISTINCT SourceAirport FROM flights) UNION SELECT AirportCode FROM airports WHERE AirportCode NOT IN (SELECT DISTINCT DestAirport FROM flights);
SELECT COUNT(*) FROM employee;
SELECT count(*) FROM employee
SELECT Name FROM employee ORDER BY Age ASC
SELECT name FROM employee ORDER BY age ASC
SELECT city ,  COUNT(*) FROM employee GROUP BY city
SELECT city, COUNT(*) FROM employee GROUP BY city
SELECT city FROM employee WHERE age < 30 GROUP BY city HAVING COUNT(*) > 1
SELECT city FROM employee GROUP BY city HAVING count(*)  >  1 AND age  <  30
SELECT COUNT(shop_id) ,  location FROM shop GROUP BY location
SELECT COUNT(*) ,  Location FROM shop GROUP BY Location
SELECT T2.manager_name, T2.district FROM shop AS T1 JOIN hiring AS T3 ON T1.shop_id  =  T3.shop_id JOIN employee AS T4 ON T3.employee_id  =  T4.employee_id WHERE T3.is_full_time  =  TRUE ORDER BY T1.number_products DESC LIMIT 1
SELECT T2.Manager_name, T2.District FROM shop AS T1 INNER JOIN hiring AS T3 ON T1.Shop_ID  =  T3.Shop_ID INNER JOIN employee AS T2 ON T2.Employee_ID = T3.Employee_ID ORDER BY T1.Number_products DESC LIMIT 1
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT Name ,  Location ,  District FROM shop ORDER BY Number_products DESC
SELECT T1.name ,  T1.location ,  T1.district FROM shop AS T1 JOIN hiring AS T2 ON T1.shop_id  =  T2.shop_id WHERE T2.is_full_time = 'TRUE' GROUP BY T1.shop_id ORDER BY T1.number_products DESC
SELECT Name FROM shop WHERE Number_products > (SELECT avg(Number_products) FROM shop)
SELECT T3.Name FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID  =  T2.Shop_ID JOIN employee AS T3 ON T3.Employee_ID  =  T1.Employee_ID WHERE T2.Number_products  >  (SELECT avg(Number_products) FROM shop);
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T2.Employee_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.name FROM employee AS T1 INNER JOIN evaluation AS T2 ON T1.Employee_ID  =  T2.Employee_ID GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name FROM employee AS T1 INNER JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T2.Bonus DESC LIMIT 1
SELECT T2.Name FROM evaluation AS T1 JOIN employee AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T1.Bonus DESC LIMIT 1
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation);
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT T2.name FROM hiring AS T1 JOIN shop AS T2 ON T1.shop_id  =  T2.shop_id GROUP BY T1.shop_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM hiring AS T1 JOIN shop AS T2 ON T1.shop_id = T2.shop_id GROUP BY T2.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring);
SELECT DISTINCT T2.Name FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID WHERE T1.Employee_ID IS NULL
SELECT T1.Name, COUNT(T2.Employee_ID) FROM shop AS T1 JOIN hiring AS T2 ON T1.Shop_ID  =  T2.Shop_ID GROUP BY T1.Name
SELECT T2.name, count(*) FROM hiring AS T1 JOIN shop AS T2 ON T1.shop_id = T2.shop_id GROUP BY T1.shop_id
SELECT SUM(Bonus) FROM evaluation
SELECT sum(Bonus) FROM evaluation
SELECT * FROM hiring
SELECT * FROM hiring;
SELECT DISTINCT T1.District FROM shop AS T1 INNER JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID WHERE T1.Number_products < 3000 INTERSECT SELECT DISTINCT T1.District FROM shop AS T1 INNER JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID WHERE T1.Number_products > 10000
SELECT District FROM shop WHERE Number_products  <  3000 INTERSECT SELECT District FROM shop WHERE Number_products  >  10000
SELECT count(DISTINCT Location) FROM shop
SELECT count(DISTINCT location) FROM shop
SELECT COUNT(Document_ID) FROM Documents
SELECT count(*) FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT T1.Document_Name ,  T2.Template_ID FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID  =  T2.Template_ID WHERE T1.Document_Description LIKE '%w%'
SELECT DISTINCT t2.Document_Name, t2.Template_ID FROM Paragraphs AS t1 INNER JOIN Documents AS t2 ON t1.Document_ID = t2.Document_ID WHERE t2.Document_Description LIKE '%w%'
SELECT Documents.Document_ID, Documents.Template_ID, Documents.Document_Description FROM Documents WHERE Documents.Document_Name = 'Robbin CV';
SELECT d.Document_ID, t.Template_ID, d.Document_Description FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID WHERE d.Document_Name = 'Robbin CV'
SELECT COUNT(DISTINCT T2.Template_ID) FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID
SELECT COUNT(DISTINCT Templates.Template_ID) FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID
SELECT COUNT(*) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT')
SELECT COUNT(*) FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Code = 'PPT'
SELECT  T.Template_ID,  COUNT(D.Document_ID) AS Number_of_Documents FROM  Templates T JOIN  Documents D ON T.Template_ID = D.Template_ID GROUP BY  T.Template_ID; 
SELECT Template_ID, COUNT(*) FROM Documents GROUP BY Template_ID
SELECT t2.template_id, t1.template_type_code  FROM Ref_Template_Types AS t1  JOIN Templates AS t2 ON t1.template_type_code = t2.template_type_code  GROUP BY t2.template_id  ORDER BY COUNT(t2.template_id) DESC  LIMIT 1;
SELECT T1.Template_ID, T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Template_ID FROM Templates AS T1 INNER JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID HAVING COUNT(*) > 1
SELECT T1.Template_ID FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID  =  T2.Template_ID GROUP BY T1.Template_ID HAVING COUNT(*)  >  1
SELECT T1.Template_ID FROM Templates AS T1 LEFT JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_ID IS NULL
SELECT T1.Template_ID FROM Templates AS T1 LEFT JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_ID IS NULL
SELECT count(*) FROM Templates
 SELECT COUNT(*) FROM Templates; 
SELECT Templates.Template_ID ,  Templates.Version_Number ,  Templates.Template_Type_Code FROM Templates
SELECT T1.Template_ID, T1.Version_Number, T1.Template_Type_Code FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code
SELECT DISTINCT Template_Type_Code FROM Templates;  SELECT DISTINCT Template_Type_Code FROM Templates;
SELECT Template_Type_Code FROM Ref_Template_Types
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PP' OR Template_Type_Code = 'PPT';
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV';
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number  >  5
SELECT Template_Type_Code, COUNT(*) as Number_of_Templates FROM Templates GROUP BY Template_Type_Code;
SELECT T1.Template_Type_Code ,  COUNT(*) FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code  =  T2.Template_Type_Code GROUP BY T1.Template_Type_Code
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T1.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Ref_Template_Types GROUP BY Template_Type_Code HAVING count(*) < 3
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code IN (SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(Template_ID) < 3)
SELECT MIN(Version_Number), Template_Type_Code FROM Templates ORDER BY Version_Number ASC LIMIT 1;
SELECT T1.Version_Number, T1.Template_Type_Code FROM Templates AS T1 INNER JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code ORDER BY T1.Version_Number LIMIT 1
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code JOIN Documents AS T3 ON T2.Template_ID = T3.Template_ID WHERE T3.Document_Name = 'Data base'
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1 INNER JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code INNER JOIN Documents AS T3 ON T2.Template_ID = T3.Template_ID WHERE T3.Document_Name = 'Database'
SELECT D.Document_Name FROM Documents D JOIN Templates T ON D.Template_ID = T.Template_ID JOIN Ref_Template_Types R ON T.Template_Type_Code = R.Template_Type_Code WHERE R.Template_Type_Code = 'BK'; 
SELECT Document_Name FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'BK')
SELECT T1.Template_Type_Code, COUNT(*) AS Document_Count  FROM Ref_Template_Types AS T1  JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code  JOIN Documents AS T3 ON T2.Template_ID = T3.Template_ID  GROUP BY T1.Template_Type_Code
SELECT T1.Template_Type_Code, COUNT(T2.Document_ID) FROM Ref_Template_Types AS T1 JOIN Documents AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T1.Template_Type_Code;
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM (SELECT Template_Type_Code, COUNT(Template_Type_Code) AS count FROM Templates GROUP BY Template_Type_Code ORDER BY count DESC LIMIT 1);
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1 EXCEPT SELECT T2.Template_Type_Code FROM Documents AS T2 JOIN Templates AS T3 ON T2.Template_ID = T3.Template_ID
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT DISTINCT Template_Type_Code FROM Templates)
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Code ,  Template_Type_Description FROM Ref_Template_Types
SELECT T1.Template_Type_Description FROM Ref_Template_Types AS T1 INNER JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Code = 'AD'
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book';
SELECT DISTINCT T2.Template_Type_Description FROM Documents AS T1 INNER JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID
SELECT DISTINCT T1.Template_Details FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID
SELECT T1.Template_ID FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Description = 'Presentation'
SELECT T1.Template_ID FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Description = 'Presentation'
SELECT COUNT(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs WHERE Document_ID = (SELECT Document_ID FROM Documents WHERE Document_Name = 'Summer Show')
SELECT COUNT(*)  FROM Documents AS T1  INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID  WHERE T1.Document_Name = 'Summer Show'
SELECT Paragraph_ID, Document_ID, Paragraph_Text, Other_Details  FROM Paragraphs  WHERE Paragraph_Text = 'Korea'
SELECT DISTINCT Paragraphs.Paragraph_Text FROM Paragraphs WHERE Paragraph_Text = 'Korea'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs WHERE Document_ID = (SELECT Document_ID FROM Documents WHERE Document_Name = 'Welcome to NY')
SELECT T1.paragraph_id, T1.paragraph_text FROM paragraphs AS T1 JOIN documents AS T2 ON T1.document_id = T2.document_id WHERE T2.document_name = 'Welcome to NY'
SELECT T3.Paragraph_Text FROM Documents AS T1 INNER JOIN Paragraphs AS T3 ON T1.Document_ID = T3.Document_ID WHERE T1.Document_Name = 'Customer reviews'
SELECT Paragraph_Text FROM Paragraphs WHERE Document_ID = (SELECT Document_ID FROM Documents WHERE Document_Name = 'Customer reviews')
SELECT D.Document_ID, COUNT(P.Paragraph_ID) as Paragraph_Count FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY D.Document_ID
SELECT Document_ID, COUNT(*) AS num_paragraphs FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID;
SELECT D.Document_ID, D.Document_Name, COUNT(*) AS Number_of_Paragraphs FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name
SELECT T1.Document_ID, T1.Document_Name, COUNT(*) FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID, T1.Document_Name
SELECT DISTINCT d.Document_ID FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID HAVING COUNT(p.Paragraph_ID) >= 2
SELECT D.Document_ID FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID HAVING COUNT(*) >= 2;
SELECT T2.Document_ID, T2.Document_Name FROM Paragraphs AS T1 INNER JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T2.Document_ID, T2.Document_Name ORDER BY COUNT(T1.Paragraph_ID) DESC LIMIT 1
SELECT T2.Document_ID, T2.Document_Name FROM ( SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY count(*) DESC LIMIT 1 ) T1 INNER JOIN Documents T2 ON T2.Document_ID = T1.Document_ID
SELECT T2.Document_ID FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Document_ID FROM Documents WHERE Document_ID NOT IN (SELECT Document_ID FROM Paragraphs)
SELECT D.Document_ID FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID HAVING COUNT(P.Paragraph_ID) BETWEEN 1 AND 2
SELECT Document_ID FROM Documents WHERE Document_ID IN (SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2)
SELECT D.Document_ID  FROM Documents D  JOIN Paragraphs P ON D.Document_ID = P.Document_ID  WHERE P.Paragraph_Text IN ('Brazil', 'Ireland') GROUP BY D.Document_ID  HAVING COUNT(DISTINCT P.Paragraph_Text) = 2; 
SELECT D.Document_ID FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID WHERE P.Paragraph_Text = 'Brazil' INTERSECT SELECT D.Document_ID FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID WHERE P.Paragraph_Text = 'Ireland'
SELECT COUNT(*) FROM teacher
SELECT count(*) FROM teacher
SELECT Name FROM teacher ORDER BY Age ASC;
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Age ,  Hometown FROM teacher
SELECT Age ,  Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District';
SELECT Name FROM teacher WHERE Hometown != ' Little Lever Urban District '
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33;
SELECT T1.name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T1.age  =  32 OR T1.age  =  33;
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1
SELECT T2.Hometown FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID ORDER BY T2.Age ASC LIMIT 1
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown ,  count(*) FROM teacher GROUP BY Hometown
SELECT Hometown ,  COUNT(*) FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT Hometown ,  COUNT(*) as Cnt FROM teacher GROUP BY Hometown ORDER BY Cnt DESC LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(Hometown) >= 2
SELECT DISTINCT T1.Hometown FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID GROUP BY T1.Hometown HAVING count(*)  >=  2
SELECT t.Name, c.Course FROM teacher AS t JOIN course_arrange AS ca ON t.Teacher_ID = ca.Teacher_ID JOIN course AS c ON ca.Course_ID = c.Course_ID
SELECT T2.name, T1.course FROM course AS T1 JOIN course_arrange AS T3 ON T1.course_id  =  T3.course_id JOIN teacher AS T2 ON T3.teacher_id  =  T2.teacher_id
SELECT t.name FROM teacher AS t JOIN course_arrange AS ca ON t.teacher_id = ca.teacher_id ORDER BY t.name ASC
SELECT t1.name ,  t2.course FROM teacher t1 JOIN course_arrange t3 ON t1.teacher_id  =  t3.teacher_id JOIN course t2 ON t3.course_id  =  t2.course_id ORDER BY t1.name
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID JOIN course AS T3 ON T1.Course_ID = T3.Course_ID WHERE T3.Course = 'Math'
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID JOIN course AS T3 ON T1.Course_ID = T3.Course_ID WHERE T3.Course = 'Math'
SELECT Name, COUNT(*) FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID
SELECT T2.Name, COUNT(T1.Course_ID) FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID GROUP BY T2.Name
SELECT Name FROM teacher WHERE Teacher_ID IN (SELECT Teacher_ID FROM course_arrange GROUP BY Teacher_ID HAVING count(*) >= 2)
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID GROUP BY T2.Teacher_ID HAVING COUNT(*)  >=  2
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT COUNT(*) FROM visitor WHERE Age < 30
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT avg(age) FROM visitor WHERE Level_of_membership  <=  4
SELECT v.Name ,  v.Level_of_membership FROM visitor v WHERE v.Level_of_membership > 4 ORDER BY v.Age DESC
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1
SELECT avg(Num_of_Staff) FROM museum WHERE Open_Year < '2009'
SELECT Open_Year ,  Num_of_Staff FROM museum WHERE Name  =  'Plaza Museum'
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > 2010)
SELECT DISTINCT v.ID, v.Name, v.Age FROM visitor v JOIN visit vis ON v.ID = vis.visitor_ID GROUP BY vis.visitor_ID HAVING COUNT(DISTINCT vis.Museum_ID) > 1
SELECT t2.ID ,  t2.Name ,  t2.Level_of_membership FROM visit AS t1 JOIN visitor AS t2 ON t1.visitor_ID  =  t2.ID WHERE t1.Total_spent  =  (SELECT MAX(Total_spent) FROM visit)
SELECT Museum_ID, Name FROM museum ORDER BY (SELECT COUNT(*) FROM visit WHERE Museum_ID = museum.Museum_ID) DESC LIMIT 1
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT v.Name , v.Age FROM visitor v JOIN visit vv ON v.ID = vv.visitor_ID WHERE vv.Num_of_Ticket = (SELECT MAX(Num_of_Ticket) FROM visit)
SELECT AVG(Num_of_Ticket) AS Avg_tickets, MAX(Num_of_Ticket) AS Max_tickets FROM visit; 
SELECT sum(v.Total_spent) FROM visit v JOIN visitor vis ON v.visitor_ID  =  vis.ID WHERE vis.Level_of_membership  =  1
SELECT T2.Name FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_ID = T2.ID JOIN museum AS T3 ON T1.Museum_ID = T3.Museum_ID WHERE T3.Open_Year < 2009 INTERSECT SELECT T2.Name FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_ID = T2.ID JOIN museum AS T3 ON T1.Museum_ID = T3.Museum_ID WHERE T3.Open_Year > 2011
SELECT COUNT(*) FROM visitor WHERE ID NOT IN (SELECT visitor_ID FROM visit WHERE Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year > '2010'))
SELECT count(*) FROM museum WHERE Open_Year > 2013 OR Open_Year < 2008
SELECT count(*) FROM players;
SELECT count(*) FROM players
SELECT count(*) FROM matches
SELECT count(*) FROM matches
SELECT first_name, birth_date FROM players WHERE country_code = 'USA';
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT AVG(loser_age) AS average_loser_age, AVG(winner_age) AS average_winner_age FROM matches
SELECT avg(loser_age) AS avg_loser_age, avg(winner_age) AS avg_winner_age FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT MAX(ranking) FROM players;
SELECT MAX(ranking) FROM rankings;
SELECT count(DISTINCT country_code) FROM players
SELECT count(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT tournament_name FROM matches GROUP BY tournament_name HAVING COUNT(match_num) > 10
SELECT T2.tourney_name FROM matches AS T1 INNER JOIN matches AS T2 ON T1.tourney_id = T2.tourney_id GROUP BY T1.tourney_id HAVING COUNT(*) > 10
SELECT T2.winner_name FROM matches AS T1 INNER JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_date BETWEEN '2013-01-01' AND '2013-12-31' INTERSECT SELECT T2.winner_name FROM matches AS T1 INNER JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_date BETWEEN '2016-01-01' AND '2016-12-31'
SELECT DISTINCT T3.winner_name, T3.winner_id FROM matches AS T1 INNER JOIN players AS T2 ON T3.winner_id = T2.player_id INNER JOIN matches AS T3 ON T3.loser_id = T2.player_id WHERE T3.year = 2013 INTERSECT SELECT DISTINCT T3.winner_name, T3.winner_id FROM matches AS T1 INNER JOIN players AS T2 ON T3.winner_id = T2.player_id INNER JOIN matches AS T3 ON T3.loser_id = T2.player_id WHERE T3.year = 2016
SELECT COUNT(*) FROM matches WHERE YEAR IN (2013, 2016)
SELECT COUNT(*) FROM matches WHERE YEAR IN (2013, 2016)
SELECT T1.country_code, T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name = 'WTA Championships' INTERSECT SELECT T1.country_code, T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name = 'Australian Open'
SELECT T1.first_name, T1.country_code FROM players AS T1 INNER JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY T1.first_name, T1.country_code HAVING COUNT(*) = 2
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1
SELECT first_name, country_code FROM players ORDER BY birth_date DESC LIMIT 1
SELECT first_name, last_name FROM players ORDER BY birth_date
SELECT first_name, last_name FROM players ORDER BY birth_date
SELECT T2.first_name, T2.last_name FROM matches AS T1 JOIN players AS T2 ON T1.loser_id = T2.player_id WHERE T2.hand = 'L' ORDER BY T2.birth_date
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id ORDER BY T2.tours DESC LIMIT 1
SELECT first_name ,  country_code FROM players ORDER BY tours DESC LIMIT 1
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.winner_name, T3.ranking_points FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id JOIN rankings AS T3 ON T2.player_id = T3.player_id WHERE T1.winner_rank = 1 GROUP BY T1.winner_id ORDER BY COUNT(T1.winner_id) DESC LIMIT 1
SELECT players.first_name, players.last_name, players.ranking_points  FROM players  JOIN rankings ON players.player_id = rankings.player_id  WHERE players.winner = 1  ORDER BY players.ranking_points DESC  LIMIT 1
SELECT p.first_name, p.last_name FROM players p JOIN matches m ON p.player_id = m.winner_id JOIN rankings r ON p.player_id = r.player_id WHERE m.tourney_name = 'Australian Open' AND r.ranking_points = (SELECT MAX(ranking_points) FROM rankings r2 WHERE r2.tourney_name = 'Australian Open')
SELECT T1.winner_name FROM matches AS T1 INNER JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_name = 'Australian Open' ORDER BY T2.ranking_points DESC LIMIT 1
SELECT T1.loser_name, T1.winner_name FROM matches AS T1 ORDER BY T1.minutes DESC LIMIT 1
SELECT T1.winner_name, T1.loser_name FROM matches AS T1 ORDER BY T1.minutes DESC LIMIT 1
SELECT T1.first_name ,  avg(T2.ranking) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.first_name
SELECT T1.first_name ,  AVG(T2.ranking) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id;
SELECT p.first_name ,  sum(r.ranking_points) FROM players p JOIN rankings r ON p.player_id  =  r.player_id GROUP BY p.player_id ,  p.first_name
SELECT first_name, SUM(ranking_points) as total_points FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY first_name
SELECT country_code, COUNT(*) FROM players GROUP BY country_code;
SELECT country_code, COUNT(*) FROM players GROUP BY country_code;
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code HAVING count(*)  >  50
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50
SELECT ranking_date, COUNT(*) FROM rankings GROUP BY ranking_date;
SELECT ranking_date ,  COUNT(tours) FROM rankings GROUP BY ranking_date
SELECT COUNT(*) ,  `year` FROM matches GROUP BY `year`
SELECT YEAR, COUNT(*)  FROM matches  GROUP BY YEAR;
SELECT winner_name, winner_rank FROM matches ORDER BY winner_age ASC LIMIT 3
SELECT T2.name, T2.ranking FROM matches AS T1 INNER JOIN players AS T2 ON T1.winner_id = T2.player_id ORDER BY T1.winner_age ASC LIMIT 3
SELECT COUNT(DISTINCT T1.winner_id) FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T2.hand = 'L' AND T1.tourney_level = 'G';
SELECT COUNT(*) FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name LIKE 'WTA Championships' AND T1.hand LIKE 'L'
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.winner_rank_points  =  (SELECT max(ranking_points) FROM rankings)
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id GROUP BY T1.player_id ORDER BY SUM(T2.winner_rank_points) DESC LIMIT 1
SELECT hand, COUNT(*) FROM players GROUP BY hand
SELECT hand, COUNT(*) FROM players GROUP BY hand
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'
SELECT name, tonnage FROM ship ORDER BY name DESC
SELECT name, date, result FROM battle;
SELECT      b.name AS battle_name,     MIN(d.killed + d.injured) AS min_death_toll,     MAX(d.killed + d.injured) AS max_death_toll FROM      battle AS b JOIN      ship AS s ON b.id = s.lost_in_battle JOIN      death AS d ON s.id = d.caused_by_ship_id GROUP BY      b.id, b.name; 
SELECT AVG(injured) FROM death
SELECT killed, injured FROM death JOIN ship ON death.caused_by_ship_id = ship.id WHERE tonnage = 't'
SELECT T1.name, T1.result FROM battle AS T1 INNER JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T1.bulgarian_commander != 'Boril'
SELECT DISTINCT T1.id ,  T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.ship_type = 'Brig'
SELECT b.id, b.name  FROM battle AS b  JOIN death AS d ON b.id = d.caused_by_ship_id  GROUP BY b.id, b.name  HAVING COUNT(*) > 10
SELECT T1.id, T1.name FROM ship AS T1 JOIN death AS T2 ON T1.id  =  T2.caused_by_ship_id GROUP BY T1.id ORDER BY SUM(T2.killed + T2.injured) DESC LIMIT 1
SELECT DISTINCT T2.name FROM battle AS T1 INNER JOIN battle AS T2 ON T1.name BETWEEN T2.name AND T1.name WHERE T1.latin_commander = 'Baldwin I' AND T1.bulgarian_commander = 'Kaloyan'
SELECT count(DISTINCT result) FROM battle
SELECT count(*) FROM battle WHERE id NOT IN (SELECT battle_id FROM ship WHERE tonnage = '225');
SELECT T2.name, T2.date FROM ship AS T1 JOIN battle AS T2 ON T1.lost_in_battle = T2.id WHERE T1.name IN ('Lettice', 'HMS Atalanta')
SELECT T1.name, T1.result, T1.bulgarian_commander FROM battle AS T1 INNER JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.location != 'English Channel'
SELECT T2.note FROM ship AS T1 JOIN death AS T2 ON T1.id = T2.caused_by_ship_id WHERE T1.location LIKE '%East%'
SELECT line_1, line_2 FROM Addresses
SELECT line_1, line_2 FROM Addresses;
SELECT COUNT(*) FROM Courses
SELECT COUNT(*) FROM Courses
SELECT course_description FROM Courses WHERE course_name = 'math';
SELECT T2.course_description FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id  =  T2.course_id WHERE T1.course_name  =  'math'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea';
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT T2.department_name, T2.department_id FROM degree_programs AS T1 JOIN departments AS T2 ON T1.department_id = T2.department_id GROUP BY T2.department_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT department_name, department_id FROM Departments ORDER BY (SELECT COUNT(degree_program_id) FROM Degree_Programs WHERE degree_programs.department_id = departments.department_id) DESC LIMIT 1
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT department_name) FROM Departments
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs
SELECT COUNT(*) FROM Degrees WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'Engineering')
SELECT count(DISTINCT d.degree_program_id) FROM Degree_Programs AS d INNER JOIN Departments AS de ON d.department_id = de.department_id WHERE de.department_name = 'Engineering'
SELECT section_name ,  section_description FROM Sections
SELECT section_name, section_description FROM Sections
SELECT course_id ,  course_name FROM courses WHERE course_id IN (SELECT course_id FROM sections GROUP BY course_id HAVING COUNT(*) <= 2)
SELECT course_id ,  course_name FROM Courses WHERE course_id NOT IN (SELECT course_id FROM Sections GROUP BY course_id HAVING count(*)  < 2)
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT semester_name, semester_id FROM Semesters WHERE semester_id IN (SELECT semester_id FROM Student_Enrolment GROUP BY semester_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT semester_name, semester_id FROM Semesters GROUP BY semester_name, semester_id ORDER BY COUNT(semester_id) DESC LIMIT 1
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT T3.first_name ,  T3.middle_name ,  T3.last_name ,  T3.student_id FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id  =  T2.degree_program_id JOIN Students AS T3 ON T2.student_id  =  T3.student_id GROUP BY T2.student_id HAVING COUNT(*)  =  2
SELECT s.student_id, s.first_name, s.middle_name, s.last_name FROM Students s WHERE s.student_id IN ( SELECT se.student_id FROM Student_Enrolment se WHERE se.degree_program_id IN ( SELECT t.degree_program_id FROM Transcripts t WHERE t.transcript_date IN ( SELECT stc.transcript_date FROM Student_Enrolment_Courses stc GROUP BY stc.transcript_id HAVING COUNT(stc.student_course_id) > 1 ) ) GROUP BY se.student_id HAVING COUNT(se.degree_program_id) > 1 )
SELECT S.first_name, S.middle_name, S.last_name FROM Students S JOIN Student_Enrolment SE ON S.student_id = SE.student_id JOIN Degree_Programs DP ON SE.degree_program_id = DP.degree_program_id WHERE DP.degree_summary_name = 'Bachelor'
SELECT T1.first_name, T1.middle_name, T1.last_name FROM Students AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id INNER JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Bachelors'
SELECT T2.degree_summary_name FROM Student_Enrolment AS T1 JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T2.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.degree_summary_name FROM ( SELECT student_enrolment_id ,  COUNT(*) FROM Student_Enrolment_Courses GROUP BY student_enrolment_id ORDER BY COUNT(*) DESC LIMIT 1 ) AS T1 INNER JOIN Degree_Programs AS T2 ON T2.degree_program_id = T1.student_enrolment_id
SELECT T2.degree_summary_name ,  count(DISTINCT T3.student_id) FROM student_enrolment AS T1 JOIN degree_programs AS T2 ON T1.degree_program_id  =  T2.degree_program_id JOIN student_enrolment_courses AS T3 ON T1.student_enrolment_id  =  T3.student_enrolment_id GROUP BY T1.degree_program_id ORDER BY count(DISTINCT T3.student_id) DESC LIMIT 1
SELECT T1.degree_program_id, T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.student_id, T2.first_name, T2.middle_name, T2.last_name, COUNT(*) as number_of_enrollments FROM Student_Enrolment as T1 INNER JOIN Students as T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY number_of_enrollments DESC LIMIT 1;
SELECT students.student_id, students.first_name, students.middle_name, students.last_name, COUNT(*)  FROM students  JOIN student_enrolment ON students.student_id = student_enrolment.student_id  GROUP BY students.student_id, students.first_name, students.middle_name, students.last_name  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment);
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT T3.course_name FROM Student_Enrolment_Courses AS T1 INNER JOIN Courses AS T3 ON T1.course_id = T3.course_id
SELECT course_name FROM Courses WHERE course_id IN (SELECT course_id FROM Student_Enrolment_Courses GROUP BY course_id)
SELECT c.course_name FROM courses c JOIN student_enrolment_courses sec ON c.course_id = sec.course_id GROUP BY c.course_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.course_name FROM courses AS T1 JOIN student_enrolment_courses AS T2 ON T1.course_id  =  T2.course_id GROUP BY T1.course_id ORDER BY COUNT(T2.student_course_id) DESC LIMIT 1
SELECT s.last_name FROM students AS s WHERE s.current_address_id IN (SELECT a.address_id FROM addresses AS a WHERE a.state_province_county = 'North Carolina') AND s.student_id NOT IN (SELECT se.student_id FROM student_enrolment AS se)
SELECT last_name FROM Students WHERE country = 'North Carolina' EXCEPT SELECT T1.last_name FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T1.country = 'North Carolina'
SELECT t1.transcript_date, t1.transcript_id FROM Transcripts AS t1 INNER JOIN Transcript_Contents AS t2 ON t1.transcript_id = t2.transcript_id GROUP BY t2.transcript_id HAVING COUNT(*) >= 2
SELECT T1.transcript_date ,  T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id  =  T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(DISTINCT T2.student_course_id)  >=  2
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT first_name, middle_name, last_name FROM students ORDER BY date_first_registered ASC LIMIT 1;
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1
SELECT t1.first_name FROM students AS t1 JOIN addresses AS t2 ON t1.current_address_id = t2.address_id JOIN addresses AS t3 ON t1.permanent_address_id = t3.address_id WHERE t2.line_1 != t3.line_1 OR t2.line_2 != t3.line_2 OR t2.line_3 != t3.line_3 OR t2.city != t3.city OR t2.zip_postcode != t3.zip_postcode OR t2.state_province_county != t3.state_province_county OR t2.country != t3.country OR t2.other_address_details != t3.other_address_details
SELECT T1.first_name FROM Students AS T1 INNER JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id INNER JOIN Addresses AS T3 ON T1.permanent_address_id = T3.address_id WHERE T2.line_1 != T3.line_1 AND T2.line_2 != T3.line_2 AND T2.line_3 != T3.line_3 AND T2.city != T3.city AND T2.zip_postcode != T3.zip_postcode AND T2.state_province_county != T3.state_province_county AND T2.country != T3.country
SELECT T2.address_id, T2.line_1, T2.line_2, T2.line_3, T2.city, T2.zip_postcode, T2.state_province_county, T2.country, T2.other_address_details FROM Student_Enrolment AS T1 JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id GROUP BY T2.address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.address_id ,  T3.line_1 ,  T3.line_2 FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id JOIN Addresses AS T3 ON T3.address_id = T1.current_address_id GROUP BY T3.address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(transcript_date) FROM Transcripts
SELECT avg(T1.transcript_date) FROM Transcripts AS T1
SELECT MIN(T1.transcript_date) ,  T2.other_details FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id  =  T2.transcript_id
SELECT transcript_date FROM Transcripts ORDER BY transcript_date ASC LIMIT 1;
SELECT COUNT(*) FROM Transcripts
SELECT COUNT(*) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts;
SELECT MAX(transcript_date) FROM Transcripts
SELECT `student_course_id` , COUNT(DISTINCT `transcript_id`) FROM `Transcript_Contents` GROUP BY `student_course_id` ORDER BY COUNT(DISTINCT `transcript_id`) DESC
SELECT COUNT(student_course_id) ,  course_id FROM STUDENT_ENROLLMENT_COURSES GROUP BY course_id HAVING COUNT(student_course_id) = (SELECT MAX(count) FROM (SELECT COUNT(student_course_id) AS count FROM STUDENT_ENROLLMENT_COURSES GROUP BY course_id))
SELECT T.transcript_id, T.transcript_date FROM Transcripts AS T JOIN Transcript_Contents AS TC ON T.transcript_id = TC.transcript_id GROUP BY T.transcript_id, T.transcript_date ORDER BY COUNT(TC.student_course_id) ASC LIMIT 1;
SELECT transcript_id, transcript_date FROM Transcripts ORDER BY (SELECT COUNT(*) FROM Transcript_Contents WHERE transcript_id = Transcripts.transcript_id) ASC LIMIT 1
SELECT semester_id FROM STUDENT_ENROLMENT WHERE degree_program_id IN (SELECT degree_program_id FROM DEGREE_PROGRAMS WHERE degree_summary_name = 'Master') AND degree_program_id IN (SELECT degree_program_id FROM DEGREE_PROGRAMS WHERE degree_summary_name = 'Bachelor')
SELECT T3.semester_id FROM Degree_Programs AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id INNER JOIN Semesters AS T3 ON T2.semester_id = T3.semester_id WHERE T1.degree_summary_name = 'Master' INTERSECT SELECT T3.semester_id FROM Degree_Programs AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id INNER JOIN Semesters AS T3 ON T2.semester_id = T3.semester_id WHERE T1.degree_summary_name = 'Bachelor'
SELECT count(DISTINCT current_address_id) FROM students
SELECT DISTINCT line_1, line_2, line_3, city, zip_postcode, state_province_county, country FROM Addresses AS a JOIN Students AS s ON a.address_id = s.current_address_id OR a.address_id = s.permanent_address_id
SELECT * FROM Students ORDER BY last_name DESC
SELECT other_details FROM students ORDER BY last_name DESC
SELECT * FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id JOIN Courses AS T3 ON T3.course_id = T2.course_id WHERE T3.section_name = 'h'
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582'
SELECT T1.first_name FROM Students AS T1 INNER JOIN Addresses AS T2 ON T1.permanent_address_id = T2.address_id WHERE T2.country = 'Haiti' OR T1.cell_mobile_number = '09700166582'
SELECT Title FROM Cartoon ORDER BY Title
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT T2.Title FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones'
SELECT T2.title FROM cartoon AS T1 JOIN TV_channel AS T2 ON T1.channel  =  T2.id WHERE T2.directed_by  =  'Ben Jones';
SELECT count(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT Title, Director FROM Cartoon ORDER BY Original_air_date
SELECT t2.title, t2.directed_by FROM tv_series AS t1 JOIN cartoon AS t2 ON t1.channel = t2.channel ORDER BY t2.original_air_date
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti'); 
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT T2.Country, COUNT(*) AS Number_of_Channels  FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel  GROUP BY T2.Country  ORDER BY Number_of_Channels DESC  LIMIT 1
SELECT Country, COUNT(id) as Number_of_TV_Channels FROM TV_Channel GROUP BY Country ORDER BY Number_of_TV_Channels DESC LIMIT 1
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT content) FROM TV_Channel;
SELECT DISTINCT COUNT(series_name), content FROM TV_Channel
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT content FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT T1.Package_Option FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id  =  T2.Channel WHERE T2.series_name  =  'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English';
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT Language, COUNT(*) as Num FROM TV_Channel GROUP BY Language ORDER BY Num ASC LIMIT 1
SELECT Language, COUNT(*)  FROM TV_Channel  GROUP BY Language  ORDER BY COUNT(*) ASC  LIMIT 1
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language
SELECT Language ,  COUNT(*) FROM TV_Channel GROUP BY Language
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!'
SELECT T1.series_name FROM TV_Channel AS T1 INNER JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle';
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel  =  T2.id WHERE T2.series_name  =  'Sky Radio';
SELECT T2.title FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'
SELECT Episode FROM TV_series ORDER BY Rating
SELECT Episode FROM TV_series ORDER BY Rating
SELECT T2.Episode, T2.Rating FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel ORDER BY T2.Rating DESC LIMIT 3
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT MIN(Share), MAX(Share) FROM TV_series
SELECT max(Share), min(Share) FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT T1.Air_Date FROM TV_series AS T1 JOIN Cartoon AS T2 ON T1.Channel = T2.Channel WHERE T2.Title = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime';
SELECT T2.Weekly_Rank FROM TV_series AS T1 INNER JOIN Cartoon AS T2 ON T1.Channel = T2.Channel WHERE T2.Title = "A Love of a Lifetime"
SELECT T1.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id  =  T2.Channel WHERE T2.Episode  =  'A Love of a Lifetime'
SELECT T2.series_name FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Episode = 'A Love of a Lifetime';
SELECT Episode FROM TV_series WHERE Channel IN (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio')
SELECT Episode FROM TV_series WHERE Channel = (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio')
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT DIRECTED_BY ,  COUNT(*) FROM Cartoon GROUP BY DIRECTED_BY
SELECT T2.Production_code, T1.Title, T2.Channel FROM Cartoon AS T1 JOIN TV_series AS T2 ON T1.Channel = T2.Channel ORDER BY T2.Air_Date DESC LIMIT 1
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1;
SELECT T1.Package_Option ,  T2.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.Hight_definition_TV = 'yes'
SELECT T1.Package_Option ,  T2.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.Hight_definition_TV  =  "yes"
SELECT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'
SELECT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id  =  T2.Channel WHERE T2.Written_by  =  'Todd Casey'
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey');
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by != 'Todd Casey'
SELECT DISTINCT T2.series_name, T2.Country FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Directed_by IN ('Ben Jones', 'Michael Chang')
SELECT T1.series_name ,  T1.Country FROM TV_channel AS T1 JOIN cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by  =  'Ben Jones' INTERSECT SELECT T1.series_name ,  T1.Country FROM TV_channel AS T1 JOIN cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by  =  'Michael Chang'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language <> 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(*) > 2)
SELECT id FROM TV_Channel GROUP BY Content HAVING COUNT(*) > 2
SELECT DISTINCT T1.id FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by != 'Ben Jones'
SELECT t2.id FROM Cartoon AS t1 JOIN TV_Channel AS t2 ON t1.Channel = t2.id WHERE t1.Directed_by != 'Ben Jones'
SELECT T1.Package_Option FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by <> 'Ben Jones'
SELECT T2.Package_Option FROM Cartoon AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Directed_by != 'Ben Jones'
SELECT count(*) FROM poker_player;
SELECT COUNT(*) FROM poker_player
SELECT earnings FROM poker_player ORDER BY earnings DESC
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Final_Table_Made,Best_Finish FROM poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player;
SELECT AVG(Earnings) FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1;
SELECT MAX(Money_Rank) FROM poker_player
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000;
SELECT max(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT T1.name FROM people AS T1 JOIN poker_player AS T2 ON T1.people_id  =  T2.people_id
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID
SELECT T2.name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.earnings > 300000
SELECT t2.Name FROM poker_player AS t1 JOIN people AS t2 ON t1.People_ID = t2.People_ID WHERE t1.Earnings > 300000
SELECT Name FROM people INNER JOIN poker_player ON people.People_ID = poker_player.People_ID ORDER BY Final_Table_Made ASC
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID  =  T2.People_ID ORDER BY T1.Final_Table_Made ASC
SELECT T1.Birth_Date FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Earnings ASC LIMIT 1
SELECT Birth_Date FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player ORDER BY Earnings ASC LIMIT 1)
SELECT Money_Rank FROM poker_player ORDER BY Height DESC LIMIT 1
SELECT Money_Rank FROM poker_player ORDER BY Height DESC LIMIT 1
SELECT AVG(Earnings) FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE people.Height > 200
SELECT AVG(T1.Earnings) FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height > 200
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Earnings DESC
SELECT Name FROM people ORDER BY Earnings DESC
SELECT Nationality ,  COUNT(*) FROM people GROUP BY Nationality
SELECT COUNT(*), Nationality FROM people GROUP BY Nationality
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality HAVING count(*)  >= 2
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Name ,  Birth_Date FROM people ORDER BY Name ASC
SELECT Name, Birth_Date FROM people ORDER BY Name ASC
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player);
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT count(DISTINCT state) FROM votes
SELECT T1.contestant_number, T1.contestant_name FROM CONTESTANTS AS T1 ORDER BY T1.contestant_name DESC
SELECT vote_id, phone_number, state FROM VOTES
SELECT MAX(area_code), MIN(area_code) FROM AREA_CODE_STATE
SELECT created FROM VOTES WHERE state = 'CA' ORDER BY created DESC LIMIT 1
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT T2.state, T1.created FROM VOTES AS T1 INNER JOIN AREA_CODE_STATE AS T2 ON T1.state = T2.state
SELECT T2.contestant_number, T2.contestant_name FROM VOTES AS T1 INNER JOIN CONTESTANTS AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T2.contestant_number HAVING COUNT(*) >= 2
SELECT T2.contestant_number, T2.contestant_name FROM VOTES AS T1 INNER JOIN CONTESTANTS AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T2.contestant_number ORDER BY COUNT(T1.contestant_number) ASC LIMIT 1
SELECT COUNT(*) FROM VOTES WHERE state IN ('NY', 'CA')
SELECT count(1) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT DISTINCT contestant_number FROM votes)
SELECT t1.area_code FROM area_code_state AS t1 JOIN votes AS t2 ON t1.state = t2.state GROUP BY t1.area_code ORDER BY count(*) DESC LIMIT 1
SELECT created, state, phone_number FROM VOTES INNER JOIN CONTESTANTS ON VOTES.contestant_number = CONTESTANTS.contestant_number WHERE CONTESTANTS.contestant_name = 'Tabatha Gehling'
SELECT DISTINCT a.area_code FROM VOTES v1 JOIN CONTESTANTS c1 ON v1.contestant_number = c1.contestant_number JOIN AREA_CODE_STATE a ON v1.state = a.state JOIN VOTES v2 ON v1.phone_number = v2.phone_number AND v2.state = v1.state JOIN CONTESTANTS c2 ON v2.contestant_number = c2.contestant_number WHERE c1.contestant_name = 'Tabatha Gehling' AND c2.contestant_name = 'Kelly Clauss' 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT name FROM country WHERE IndepYear > 1950
SELECT Name FROM country WHERE IndepYear > 1950
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'
SELECT count(*) FROM country WHERE GovernmentForm = 'Republic'
SELECT SUM(T2.SurfaceArea) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Caribbean'
SELECT SUM(T1.SurfaceArea) FROM country AS T1 INNER JOIN continent AS T2 ON T1.Continent = T2.Name WHERE T2.Name = 'Caribbean'
SELECT continent FROM country WHERE name = 'Anguilla';
SELECT Continent FROM country WHERE Name = 'Anguilla';
SELECT T3.Region FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode INNER JOIN country AS T3 ON T1.Code = T3.Code WHERE T2.Name = 'Kabul'
SELECT Region FROM country WHERE Code = (SELECT CountryCode FROM city WHERE Name = 'Kabul')
SELECT Language FROM countrylanguage AS T1 JOIN city AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Name = 'Aruba' ORDER BY T1.Percentage DESC LIMIT 1
SELECT T3.Language FROM city AS T1  JOIN country AS T2 ON T1.CountryCode = T2.Code  JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode  WHERE T2.Name = 'Aruba' AND T3.IsOfficial = 'T'
SELECT Population ,  LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Region ,  Population FROM country WHERE Name = 'Angola'
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT AVG(lifeexpectancy) FROM country WHERE region = 'Central Africa'
SELECT AVG(lifeexpectancy)  FROM country  WHERE continent = 'Africa'
SELECT T1.Name FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' ORDER BY T2.LifeExpectancy LIMIT 1
SELECT T2.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.IsOfficial = 'T' ORDER BY T1.LifeExpectancy ASC LIMIT 1
SELECT sum(T2.population) ,  max(T2.GNP) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia'
SELECT COUNT(T2.Population) ,  MAX(T2.GNP) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia';
SELECT AVG(t1.LifeExpectancy) FROM country AS t1 JOIN countrylanguage AS t2 ON t1.Code = t2.CountryCode WHERE t1.Code2 = 'AF' AND t1.GovernmentForm = 'Republic'
SELECT AVG(T1.LifeExpectancy) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' AND T1.GovernmentForm = 'Republic' AND T2.IsOfficial = 'T'
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe');
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe');
SELECT Population FROM city WHERE District = 'Gelderland'
SELECT SUM(T2.Population) FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.District = 'Gelderland'
SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm = 'United States';
SELECT AVG(t1.GNP), SUM(t1.Population) FROM country AS t1 INNER JOIN city AS t2 ON t1.Code = t2.CountryCode WHERE t1.GovernmentForm = 'Republic'
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT count(DISTINCT T3.Language) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode INNER JOIN city AS T3 ON T3.CountryCode = T2.CountryCode
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Asia';
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Asia';
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba')
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba');
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT T3.Name FROM countrylanguage AS T1  JOIN country AS T3 ON T1.CountryCode = T3.Code  WHERE T1.IsOfficial = 'T'  GROUP BY T3.Name  ORDER BY COUNT(T1.Language) DESC  LIMIT 1
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T2.CountryCode ORDER BY COUNT(T2.Language) DESC LIMIT 1
SELECT Continent FROM country GROUP BY Continent ORDER BY COUNT(DISTINCT Language) DESC LIMIT 1
SELECT T1.continent FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.continent ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(T2.CountryCode) FROM countrylanguage AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T1.Language = 'English' AND T2.Language = 'Dutch';
SELECT COUNT(T1.CountryCode) FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language IN ('English','Dutch')
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 'T' INTERSECT SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French' AND T2.IsOfficial = 'T'
SELECT T1.name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.code  =  T2.CountryCode WHERE T2.Language  =  'English' INTERSECT SELECT T1.name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.code  =  T2.CountryCode WHERE T2.Language  =  'French'
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'French' INTERSECT SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English'
SELECT t1.name FROM country AS t1 JOIN countrylanguage AS t2 ON t1.code  =  t2.countrycode WHERE t2.language  =  "English"INTERSECT SELECT t1.name FROM country AS t1 JOIN countrylanguage AS t2 ON t1.code  =  t2.countrycode WHERE t2.language  =  "French"
SELECT count(DISTINCT T2.continent) FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.countrycode  =  T2.code WHERE T1.language  =  'Chinese'
SELECT COUNT(DISTINCT T1.continent) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.code  =  T2.countrycode WHERE T2.language  =  'Chinese'
SELECT DISTINCT T1.Region FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  IN  ('English','Dutch')
SELECT DISTINCT T1.region FROM country AS T1 JOIN countrylanguage AS T2 ON T1.code  =  T2.CountryCode WHERE T2.language = 'Dutch' OR T2.language = 'English'
SELECT T1.CountryCode FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' OR T2.Language = 'Dutch'
SELECT T1.Name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' OR T2.Language = 'Dutch'
SELECT Language FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Continent = 'Asia' GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT L.Language FROM country AS C JOIN countrylanguage AS L ON C.Code = L.CountryCode WHERE C.Continent = 'Asia' GROUP BY L.Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT `Name` FROM `countrylanguage` WHERE `IsOfficial` = 'T' AND `CountryCode` IN (SELECT `Code` FROM `country` WHERE `GovernmentForm` = 'Republic') GROUP BY `CountryCode` HAVING COUNT(*) = 1
SELECT T3.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode JOIN city AS T3 ON T2.CountryCode = T3.CountryCode WHERE T1.GovernmentForm = 'Republic' GROUP BY T2.Language HAVING COUNT(T3.ID) = 1
SELECT T1.Name FROM city AS T1 INNER JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'English' ORDER BY T1.Population DESC LIMIT 1
SELECT T1.Name FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'English' ORDER BY T1.Population DESC LIMIT 1
SELECT T1.Name, T1.Population, T1.LifeExpectancy FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' GROUP BY T1.Code ORDER BY T1.SurfaceArea DESC LIMIT 1
SELECT T1.Name ,  T1.Population ,  T1.LifeExpectancy FROM country AS T1 INNER JOIN continent AS T2 ON T1.Continent = T2.Name WHERE T2.Name = 'Asia' ORDER BY T1.SurfaceArea DESC LIMIT 1
SELECT AVG(T2.LifeExpectancy) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode LEFT JOIN countrylanguage AS T3 ON T1.Code = T3.CountryCode WHERE T3.Language != 'English' OR T3.Language IS NULL
SELECT AVG(lifeexpectancy) FROM country WHERE NOT Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT COUNT(*) FROM city JOIN country ON city.CountryCode = country.Code WHERE countrylanguage.Language != 'English' AND countrylanguage.IsOfficial = 'T';
SELECT SUM(T2.Population) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT T1.CountryCode FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.HeadOfState = 'Beatrix' AND T1.IsOfficial = 'T'
SELECT T1.Language FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.HeadOfState = 'Beatrix' AND T1.IsOfficial = 'T'
SELECT COUNT(DISTINCT language) FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.IndepYear < 1930 AND IsOfficial = 'T';
SELECT COUNT(T1.Language) FROM countrylanguage AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.IndepYear < 1930 AND T1.IsOfficial = 'T'
SELECT t1.Name FROM country AS t1 JOIN continent AS t2 ON t1.Continent = t2.Code WHERE t2.Name = 'Europe' AND t1.SurfaceArea > (SELECT MAX(SurfaceArea) FROM country AS t3 JOIN continent AS t4 ON t3.Continent = t4.Code WHERE t4.Name = 'Europe')
SELECT code FROM country WHERE continent = 'Europe' AND SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE continent <> 'Europe')
SELECT T1.Name FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Africa' AND T2.Population < ( SELECT MIN(T2.Population) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' )
SELECT C.Name FROM country AS C WHERE C.Continent = 'Asia' EXCEPT SELECT C.Name FROM country AS C WHERE C.Continent = 'Africa' AND C.Population <= (SELECT MIN(Population) FROM country WHERE Continent = 'Asia')
SELECT Name FROM country WHERE continent = 'Asia' AND population > (SELECT MAX(population) FROM country WHERE continent = 'Africa')
SELECT c1.Name FROM country AS c1 WHERE c1.Continent = 'Asia' AND c1.Population > (SELECT MAX(Population) FROM country AS c2 WHERE c2.Continent = 'Africa')
SELECT Code FROM country WHERE NOT EXISTS (SELECT 1 FROM countrylanguage WHERE countrycode = country.Code AND Language = 'English')
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT CountryCode FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT T1.CountryCode FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English'
SELECT Code FROM country WHERE GovernmentForm != 'Republic' AND Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT Code FROM country WHERE GovernmentForm != 'Republic' AND Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English');
SELECT T2.Name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Continent = 'Europe' AND T2.Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Continent = 'Europe' AND T2.Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T'
SELECT DISTINCT T2.Name FROM city AS T1 INNER JOIN country AS T2 ON T1.CountryCode = T2.Code INNER JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T'
SELECT Name ,  IndepYear ,  SurfaceArea FROM country ORDER BY Population ASC LIMIT 1
SELECT Name ,  IndepYear ,  SurfaceArea FROM country ORDER BY Population ASC LIMIT 1
SELECT T2.Population, T2.Name, T2.HeadOfState FROM city AS T1 INNER JOIN country AS T2 ON T2.Code = T1.CountryCode ORDER BY T2.SurfaceArea DESC LIMIT 1
SELECT T1.name, T1.population, T1.headofstate FROM country AS T1 ORDER BY T1.surfacearea DESC LIMIT 1
SELECT T1.Name, COUNT(*) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Percentage >= 3 GROUP BY T1.Name
SELECT T2.Name, count(*)  FROM countrylanguage AS T1  JOIN country AS T2 ON T1.CountryCode = T2.Code  GROUP BY T1.CountryCode  HAVING count(*)  >  2
SELECT District, COUNT(*) AS CityCount  FROM city  WHERE Population > (SELECT AVG(Population) FROM city)  GROUP BY District
SELECT count(*) ,  District FROM city GROUP BY District HAVING avg(Population) > (SELECT avg(Population) FROM city)
SELECT GovernmentForm ,  SUM(Population) FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72
SELECT GovernmentForm, SUM(Population) FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72
SELECT Continent, AVG(LifeExpectancy) AS AvgLifeExpectancy, SUM(Population) AS TotalPopulation FROM country GROUP BY Continent HAVING AvgLifeExpectancy < 72
SELECT continent ,  sum(population) ,  avg(lifeexpectancy) FROM country GROUP BY continent HAVING avg(lifeexpectancy) < 72
SELECT Name,SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT name ,  surfacearea FROM country ORDER BY surfacearea DESC LIMIT 5
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT count(*) FROM country WHERE Continent = 'Asia'
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'
SELECT t1.Name FROM country AS t1 JOIN city AS t2 ON t1.Code = t2.CountryCode WHERE t1.Continent = 'Europe' AND t1.Population > 80000
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT sum(T2.Population), avg(T1.SurfaceArea) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'North America' AND T1.SurfaceArea > 3000
SELECT SUM(T2.Population), AVG(T1.SurfaceArea) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'North America' AND T1.SurfaceArea > 3000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000;
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name, T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Percentage = ( SELECT MAX(T2.Percentage) FROM countrylanguage AS T2 WHERE T2.CountryCode = T1.Code )
SELECT country.Code, countrylanguage.Language FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Percentage = (SELECT MAX(Percentage) FROM countrylanguage)
SELECT COUNT(*) FROM ( SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC LIMIT 1 )
SELECT count(*) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Spanish' AND countrylanguage.Percentage > 90
SELECT T1.Code FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Spanish' AND T2.IsOfficial = 'T' ORDER BY T2.Percentage DESC LIMIT 1
SELECT Code FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND IsOfficial = 'T')
SELECT count(*) FROM conductor
SELECT count(*) FROM conductor
SELECT name FROM conductor ORDER BY age ASC;
SELECT Name FROM conductor ORDER BY Age
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT name FROM conductor WHERE nationality != 'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC;
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT AVG(Attendance) FROM show;
SELECT AVG(Attendance) FROM show
SELECT max(T2.Share) ,  min(T2.Share) FROM performance AS T1 JOIN show AS T2 ON T1.Performance_ID  =  T2.Performance_ID WHERE T1.Type != 'Live final'
SELECT MAX(T3.share) ,  MIN(T3.share) FROM performance AS T1 JOIN show AS T2 ON T1.performance_id  =  T2.performance_id JOIN performance AS T3 ON T2.performance_id  =  T3.performance_id WHERE T1.Type  <>  'Live final'
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor WHERE Year_of_Work = (SELECT MAX(Year_of_Work) FROM conductor)
SELECT T1.Name FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name ORDER BY COUNT(T2.Orchestra_ID) DESC LIMIT 1
SELECT T2.Name, T3.Orchestra FROM conductor AS T2 JOIN orchestra AS T3 ON T2.Conductor_ID = T3.Conductor_ID
SELECT T3.Name, T2.Orchestra FROM performance AS T1 JOIN orchestra AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID JOIN conductor AS T3 ON T2.Conductor_ID = T3.Conductor_ID
SELECT Name FROM conductor WHERE Conductor_ID IN (SELECT Conductor_ID FROM orchestra GROUP BY Conductor_ID HAVING COUNT(*) > 1)
SELECT DISTINCT T2.name FROM orchestra AS T1 JOIN conductor AS T2 ON T1.conductor_id = T2.conductor_id GROUP BY T2.name HAVING COUNT(T1.orchestra_id) > 1
SELECT T2.Name FROM performance AS T1 JOIN orchestra AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID JOIN conductor AS T3 ON T2.Conductor_ID = T3.Conductor_ID GROUP BY T3.Name ORDER BY COUNT(T1.Orchestra_ID) DESC LIMIT 1
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008
SELECT T2.name FROM orchestra AS T1 INNER JOIN conductor AS T2 ON T1.conductor_id = T2.conductor_id WHERE T1.year_of_founded > 2008
SELECT Record_Company, COUNT(Orchestra_ID) FROM orchestra GROUP BY Record_Company
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company;
SELECT Major_Record_Format FROM orchestra ORDER BY COUNT(*) ASC
SELECT major_record_format FROM orchestra GROUP BY major_record_format ORDER BY count(*) DESC
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT DISTINCT T3.Year_of_Founded FROM performance AS T1 INNER JOIN orchestra AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID INNER JOIN conductor AS T3 ON T2.Conductor_ID = T3.Conductor_ID GROUP BY T3.Year_of_Founded HAVING COUNT(*) > 1
SELECT YEAR_OF_FOUNDED FROM ORCHESTRA WHERE Orchestra_ID IN  (SELECT Orchestra_ID FROM performance GROUP BY Orchestra_ID HAVING COUNT(Performance_ID) > 1)
SELECT count(*) FROM Highschooler
SELECT count(*) FROM Highschooler
SELECT name, grade FROM Highschooler;
SELECT name, grade FROM Highschooler
SELECT grade FROM Highschooler
SELECT name, grade FROM Highschooler;
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT name FROM Highschooler WHERE grade = 10
SELECT name FROM Highschooler WHERE grade = 10;
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle'; 
SELECT count(*) FROM Highschooler WHERE grade = 9 OR grade = 10
SELECT COUNT(*) FROM Highschooler WHERE grade = 9 OR grade = 10
SELECT grade ,  count(*) FROM Highschooler GROUP BY grade
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(ID) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1;
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*)  >=  4
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT student_id, COUNT(*) AS NumberOfFriends FROM Friend GROUP BY student_id
SELECT student_id ,  COUNT(*) FROM Friend GROUP BY student_id
SELECT name, COUNT(*) FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY name;
SELECT T1.name ,  COUNT(T2.student_id) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID  =  T2.student_id GROUP BY T2.student_id
SELECT T2.name FROM friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID GROUP BY T1.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM Highschooler WHERE ID IN (SELECT friend_id FROM Friend WHERE student_id IN (SELECT ID FROM Highschooler) GROUP BY student_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT name FROM highschooler WHERE ID IN (SELECT student_id FROM friend GROUP BY student_id HAVING COUNT(*) >= 3)
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(*) >= 3)
 SELECT T2.name FROM Highschooler AS T1  JOIN Friend AS T3 ON T1.ID = T3.student_id  JOIN Highschooler AS T2 ON T3.friend_id = T2.ID  WHERE T1.name = 'Kyle' 
SELECT T3.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.friend_id JOIN Highschooler AS T3 ON T2.student_id = T3.ID WHERE T1.name = 'Kyle';
SELECT COUNT(*) FROM Friend WHERE student_id IN (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(DISTINCT T2.Friend_id) AS num_friends FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.id = T2.student_id WHERE T1.name = 'Kyle'
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT id FROM Highschooler WHERE id NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT T1.student_id FROM friend AS T1 JOIN likes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id
SELECT T1.ID FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id JOIN Likes AS T3 ON T1.ID = T3.student_id
SELECT DISTINCT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend) INTERSECT SELECT DISTINCT name FROM Highschooler WHERE ID IN (SELECT liked_id FROM Likes)
SELECT T1.name FROM Highschooler AS T1 INNER JOIN Friend AS T2 ON T1.ID  =  T2.student_id INNER JOIN Likes AS T3 ON T1.ID  =  T3.liked_id
SELECT student_id, COUNT(*) FROM Likes GROUP BY student_id
SELECT liked_id, COUNT(*) FROM Likes GROUP BY liked_id;
SELECT T2.name, COUNT(*) FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.id GROUP BY T2.name;
SELECT T3.name ,  COUNT(*) FROM Likes AS T1 JOIN Highschooler AS T3 ON T1.student_id  =  T3.ID GROUP BY T3.name
SELECT name FROM Highschooler WHERE ID IN (SELECT liked_id FROM Likes GROUP BY liked_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT name FROM Highschooler ORDER BY (SELECT COUNT(*) FROM Likes WHERE student_id = Highschooler.ID) DESC LIMIT 1
SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.liked_id = T2.ID GROUP BY T1.liked_id HAVING COUNT(*) >= 2
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Likes GROUP BY student_id HAVING COUNT(*) >= 2)
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID  =  T2.student_id WHERE T1.grade  >  5 GROUP BY T1.ID HAVING COUNT(T2.friend_id)  >=  2
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID  =  T2.student_id GROUP BY T1.ID, T1.name HAVING T1.grade  >  5 AND COUNT(*)  >=  2
SELECT COUNT(*) FROM likes WHERE student_id = (SELECT ID FROM highschooler WHERE name = 'Kyle')
SELECT COUNT(liked_id) FROM Likes WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT AVG(T1.grade) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id
SELECT AVG(T2.grade) FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID
SELECT min(grade) FROM highschooler WHERE ID NOT IN (SELECT friend_id FROM friend)
SELECT min(grade) FROM Highschooler WHERE ID NOT IN (SELECT DISTINCT student_id FROM Friend);
SELECT DISTINCT T1.state FROM Owners AS T1 JOIN Professional_Addresses AS T2 ON T1.owner_id = T2.owner_id
SELECT DISTINCT state FROM Owners INTERSECT SELECT DISTINCT state FROM Professionals
SELECT AVG(T1.age) FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT AVG(Dogs.age) FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id
SELECT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' UNION SELECT professional_id, last_name, cell_number FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(treatment_id) > 2)
SELECT DISTINCT P.professional_id, P.last_name, P.cell_number FROM Professionals AS P INNER JOIN Treatments AS T ON P.professional_id = T.professional_id WHERE P.state = 'Indiana' OR COUNT(T.treatment_id) > 2 GROUP BY P.professional_id
SELECT T2.name FROM Treatments AS T1 INNER JOIN Dogs AS T2 ON T1.dog_id = T2.dog_id WHERE T1.cost_of_treatment <= 1000
SELECT DISTINCT T1.name FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id INNER JOIN Owners AS T3 ON T1.owner_id = T3.owner_id WHERE T3.owner_id = T1.owner_id GROUP BY T1.name HAVING SUM(T2.cost_of_treatment) <= 1000
SELECT DISTINCT first_name FROM owners WHERE first_name NOT IN (SELECT name FROM dogs) UNION SELECT DISTINCT first_name FROM professionals WHERE first_name NOT IN (SELECT name FROM dogs)
SELECT first_name FROM owners WHERE first_name NOT IN ( SELECT first_name FROM dogs UNION SELECT first_name FROM professionals ) UNION SELECT last_name FROM professionals WHERE last_name NOT IN ( SELECT first_name FROM dogs UNION SELECT last_name FROM professionals );
SELECT professional_id ,  role_code ,  email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments);
SELECT professional_id, role_code, email_address FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments)
SELECT owner_id, first_name, last_name FROM owners WHERE owner_id IN (SELECT owner_id FROM dogs GROUP BY owner_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT owner_id, first_name, last_name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id GROUP BY owner_id, first_name, last_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.professional_id ,  T2.role_code ,  T3.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id  =  T2.professional_id JOIN Professions AS T3 ON T2.professional_id  =  T3.professional_id GROUP BY T1.professional_id HAVING count(*)  >=  2
SELECT professional_id ,  role_code ,  first_name FROM Treatments INNER JOIN Professionals ON Treatments.professional_id = Professionals.professional_id GROUP BY professional_id, role_code, first_name HAVING COUNT(professional_id)  >=  2
SELECT breed_name FROM breeds ORDER BY COUNT(breed_code) DESC LIMIT 1
SELECT T1.breed_name FROM Breeds AS T1 JOIN Dogs AS T2 ON T1.breed_code  =  T2.breed_code GROUP BY T2.breed_code ORDER BY COUNT(T2.dog_id) DESC LIMIT 1
SELECT T1.owner_id ,  T3.last_name FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id JOIN Owners AS T3 ON T1.owner_id = T3.owner_id GROUP BY T1.owner_id ORDER BY SUM(T2.cost_of_treatment) DESC LIMIT 1
SELECT T1.owner_id, T2.last_name FROM Dogs AS T1 JOIN Owners AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T1.dog_id = T3.dog_id ORDER BY SUM(T3.cost_of_treatment) DESC LIMIT 1
SELECT T1.treatment_type_description FROM Treatment_Types AS T1 JOIN Treatments AS T2 ON T1.treatment_type_code  =  T2.treatment_type_code GROUP BY T1.treatment_type_code ORDER BY SUM(T2.cost_of_treatment) ASC LIMIT 1
SELECT T1.treatment_type_description FROM Treatment_Types AS T1 INNER JOIN Treatments AS T2 ON T1.treatment_type_code = T2.treatment_type_code GROUP BY T1.treatment_type_description ORDER BY SUM(T2.cost_of_treatment) ASC LIMIT 1
SELECT owner_id, zip_code FROM dogs WHERE dog_id IN (SELECT dog_id FROM treatments) GROUP BY owner_id, zip_code ORDER BY SUM(cost_of_treatment) DESC LIMIT 1
SELECT T2.owner_id ,  T2.zip_code FROM Treatments AS T1 JOIN Dogs AS T2 ON T1.dog_id = T2.dog_id GROUP BY T2.owner_id ,  T2.zip_code ORDER BY SUM(T1.cost_of_treatment) DESC LIMIT 1
SELECT professional_id, cell_number FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2
SELECT P.professional_id, P.cell_number FROM Professional P WHERE ( SELECT COUNT(T.treatment_id) FROM Treatments T WHERE T.professional_id = P.professional_id ) >= 2
SELECT first_name, last_name FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments WHERE cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments))
SELECT first_name, last_name FROM professionals WHERE professional_id IN ( SELECT professional_id FROM treatments WHERE cost_of_treatment < ( SELECT AVG(cost_of_treatment) FROM treatments ) )
SELECT Treatments.date_of_treatment, Professionals.first_name FROM Treatments INNER JOIN Professionals ON Treatments.professional_id = Professionals.professional_id
SELECT T1.date_of_treatment ,  T2.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id  =  T2.professional_id
SELECT cost_of_treatment, T1.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code  =  T2.treatment_type_code
SELECT T2.cost_of_treatment, T3.treatment_type_description FROM Treatments AS T1 JOIN Charges AS T2 ON T1.treatment_type_code = T2.charge_id JOIN Treatment_Types AS T3 ON T1.treatment_type_code = T3.treatment_type_code
SELECT T3.first_name ,  T3.last_name ,  T4.size_description FROM Dogs AS T1 INNER JOIN Owners AS T3 ON T1.owner_id = T3.owner_id INNER JOIN Sizes AS T4 ON T1.size_code = T4.size_code
SELECT O.first_name, O.last_name, D.size_code FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id
SELECT T1.first_name, T2.name FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id = T2.owner_id
SELECT O.first_name, D.name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id;
SELECT T2.name, T3.date_of_treatment FROM Dogs AS T1  JOIN Breeds AS T2 ON T1.breed_code = T2.breed_code  JOIN Treatments AS T3 ON T1.dog_id = T3.dog_id  GROUP BY T2.breed_code  ORDER BY COUNT(T1.dog_id) ASC  LIMIT 1
SELECT T2.name, T3.date_of_treatment FROM dogs AS T1 INNER JOIN treatments AS T3 ON T1.dog_id = T3.dog_id INNER JOIN breeds AS T2 ON T2.breed_code = T1.breed_code WHERE T2.breed_name = (SELECT breed_name FROM ( SELECT T1.breed_name, COUNT(*) AS cnt FROM dogs AS T1 INNER JOIN breeds AS T2 ON T2.breed_code = T1.breed_code GROUP BY T1.breed_code ORDER BY cnt ) AS T4 LIMIT 1);
SELECT T1.first_name, T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id WHERE T1.state = 'Virginia'
SELECT DISTINCT T1.first_name FROM Owners AS T1 INNER JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id WHERE T1.state = 'Virginia'
SELECT T1.date_arrived, T1.date_departed FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT T1.date_arrived, T1.date_departed FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT T3.last_name FROM Dogs AS T1 INNER JOIN Owners AS T3 ON T1.owner_id = T3.owner_id WHERE T1.date_of_birth = ( SELECT MIN(date_of_birth) FROM Dogs )
SELECT T2.last_name FROM Dogs AS T1 JOIN Owners AS T2 ON T1.owner_id = T2.owner_id ORDER BY T1.date_of_birth ASC LIMIT 1
SELECT email_address FROM Professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT email_address FROM professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT date_arrived, date_departed FROM Dogs;
SELECT date_arrived, date_departed FROM dogs
SELECT COUNT(DISTINCT T1.dog_id) FROM Treatments AS T1
SELECT COUNT(dog_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT t1.role_code, t1.street, t1.city, t1.state FROM professionals AS t1 INNER JOIN owners AS t2 ON t1.owner_id = t2.owner_id WHERE t2.city LIKE '%West%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT COUNT(*) FROM Dogs WHERE age < ( SELECT AVG(age) FROM Dogs )
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT MAX(T2.cost_of_treatment) FROM Treatments AS T1 JOIN Charges AS T2 ON T1.treatment_type_code = T2.charge_type ORDER BY T1.date_of_treatment DESC LIMIT 1
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT COUNT(*) FROM dogs WHERE dog_id NOT IN (SELECT dog_id FROM treatments)
SELECT count(*) FROM owners WHERE dog_id IS NULL
SELECT COUNT(*) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs WHERE date_departed IS NULL);
SELECT COUNT(professional_id) FROM treatments WHERE professional_id NOT IN (SELECT professional_id FROM treatments)
SELECT count(*) FROM Professional WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT name ,  age ,  weight FROM dogs WHERE abandoned_yn = '1'
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT AVG(age) FROM Dogs
SELECT AVG(age) FROM Dogs
SELECT MAX(age) FROM Dogs
SELECT MAX(age) FROM Dogs
SELECT charge_type ,  charge_amount FROM CHARGES
SELECT charge_type, charge_amount FROM Charges
SELECT MAX(charge_amount) FROM CHARGES
SELECT charge_amount FROM charges ORDER BY charge_amount DESC LIMIT 1
SELECT email_address ,  cell_number ,  home_phone FROM professionals
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT breed_code, size_code FROM Dogs
SELECT DISTINCT breed_code, size_code FROM Dogs
SELECT P.first_name, TT.treatment_type_description FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code 
SELECT P.first_name, TT.treatment_type_description FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code
SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year, Citizenship FROM singer
SELECT Birth_Year ,  Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship != 'France';
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949);
SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID  =  T2.Singer_ID WHERE T1.Birth_Year  =  1948 OR T1.Birth_Year  =  1949
SELECT name FROM singer ORDER BY net_worth_millions DESC LIMIT 1
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT COUNT(*) ,  Citizenship FROM singer GROUP BY Citizenship
SELECT citizenship, COUNT(*) FROM singer GROUP BY citizenship;
SELECT citizenship FROM singer GROUP BY citizenship ORDER BY COUNT(citizenship) DESC LIMIT 1
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship ,  MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT citizenship, max(net_worth_millions) FROM singer GROUP BY citizenship
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT s.Title ,  si.Name FROM song AS s JOIN singer AS si ON s.Singer_ID  =  si.Singer_ID
SELECT DISTINCT t1.Name FROM singer AS T1 INNER JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000
SELECT Name FROM singer WHERE Sales > 300000
SELECT T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T1.Singer_ID HAVING COUNT(*) > 1
SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID HAVING COUNT(*) > 1
SELECT T1.Name, SUM(T2.Sales) FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID
SELECT T1.Name, SUM(T2.Sales) AS Total_Sales FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT T1.name FROM singer AS T1 LEFT JOIN song AS T2 ON T1.singer_id = T2.singer_id WHERE T2.singer_id IS NULL
SELECT T1.citizenship FROM singer AS T1 JOIN song AS T2 ON T1.singer_id  =  T2.singer_id WHERE T1.birth_year  <  1945 INTERSECT SELECT T1.citizenship FROM singer AS T1 JOIN song AS T2 ON T1.singer_id  =  T2.singer_id WHERE T1.birth_year  >  1955
SELECT T2.Citizenship FROM singer AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T1.Birth_Year < 1945 AND T2.Birth_Year > 1955
SELECT COUNT(*) FROM Other_Available_Features
SELECT feature_type_name FROM Ref_Feature_Types WHERE feature_type_code = 'Amenity'
SELECT T2.property_type_description FROM Properties AS T1 JOIN Ref_Property_Types AS T2 ON T1.property_type_code = T2.property_type_code WHERE T1.property_type_code = 'House'
SELECT T2.property_name FROM Ref_Property_Types AS T1 INNER JOIN Properties AS T2 ON T1.property_type_code = T2.property_type_code WHERE T1.property_type_description IN ('House', 'Apartment') AND T2.room_count > 1;
