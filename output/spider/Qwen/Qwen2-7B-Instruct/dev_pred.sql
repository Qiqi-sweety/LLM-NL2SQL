SELECT COUNT(*) FROM singer; 
SELECT COUNT(*) FROM singer; 
SELECT Name, Country, Age  FROM singer  ORDER BY Age DESC; 
SELECT Name, Country, Age FROM singer ORDER BY Age DESC; 
SELECT AVG(Age) AS Average_Age, MIN(Age) AS Minimum_Age, MAX(Age) AS Maximum_Age FROM singer WHERE Country = 'France'; 
SELECT AVG(Age) AS Average_Age, MIN(Age) AS Minimum_Age, MAX(Age) AS Maximum_Age FROM singer WHERE Country = 'France'; 
SELECT Song_Name, Song_release_year  FROM singer  WHERE Age = (SELECT MIN(Age) FROM singer); 
SELECT Song_Name, Song_release_year  FROM singer  WHERE Age = (SELECT MIN(Age) FROM singer); 
SELECT DISTINCT Country  FROM singer  WHERE Age > 20; 
SELECT DISTINCT Country  FROM singer  WHERE Age > 20; 
SELECT Country, COUNT(*) AS NumberOfSingers FROM singer GROUP BY Country; 
SELECT Country, COUNT(*) AS NumberOfSingers FROM singer GROUP BY Country; 
SELECT Song_Name  FROM singer  WHERE Age > (SELECT AVG(Age) FROM singer) 
SELECT Song_Name  FROM singer  WHERE Age > (SELECT AVG(Age) FROM singer) 
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000; 
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000;
SELECT MAX(Capacity), AVG(Capacity) FROM stadium; 
SELECT AVG(Capacity) AS Average_Capacity, MAX(Capacity) AS Maximum_Capacity FROM stadium; 
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium); 
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium); 
SELECT COUNT(*)  FROM concert  WHERE Year IN ('2014', '2015'); 
SELECT COUNT(*)  FROM concert  WHERE Year IN ('2014', '2015') 
SELECT T1.Name, COUNT(T2.concert_ID) AS NumberOfConcerts FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T1.Stadium_ID; 
SELECT      s.Stadium_ID,     COUNT(c.concert_ID) AS Number_of_Concerts FROM      stadium s JOIN      concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY      s.Stadium_ID; 
SELECT S.Name, S.Capacity FROM stadium S JOIN concert C ON S.Stadium_ID = C.Stadium_ID WHERE C.Year >= '2014' GROUP BY S.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T1.Name, T1.Capacity  FROM stadium AS T1  JOIN concert AS T2  ON T1.Stadium_ID = T2.Stadium_ID  WHERE T2.Year > 2013  GROUP BY T1.Stadium_ID  ORDER BY COUNT(T2.concert_ID) DESC  LIMIT 1; 
SELECT Year  FROM concert  WHERE Year IN (     SELECT Year      FROM concert      GROUP BY Year      ORDER BY COUNT(*) DESC      LIMIT 1 ) 
SELECT Year  FROM concert  WHERE      (SELECT COUNT(*) FROM singer_in_concert sc WHERE concert.concert_ID = sc.concert_ID)      = (SELECT MAX(concert_count) FROM          (SELECT COUNT(*) AS concert_count, concert_Year          FROM concert          GROUP BY concert_Year) sub_query); 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert) 
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert) 
SELECT Country  FROM singer  WHERE Age > 40  UNION  SELECT Country  FROM singer  WHERE Age < 30; 
SELECT Name  FROM stadium  WHERE Stadium_ID NOT IN (     SELECT Stadium_ID      FROM concert      WHERE Year = '2014' ) 
SELECT Name  FROM stadium  WHERE Stadium_ID NOT IN (     SELECT Stadium_ID      FROM concert      WHERE Year = '2014' ) 
SELECT c.concert_Name, c.Theme, COUNT(sc.Singer_ID) AS NumberOfSingers FROM concert c JOIN singer_in_concert sc ON c.concert_ID = sc.concert_ID GROUP BY c.concert_ID, c.concert_Name, c.Theme; 
SELECT      concert.concert_Name,      concert.Theme,      COUNT(singer_in_concert.Singer_ID) AS Number_of_Singers FROM      concert JOIN      singer_in_concert ON concert.concert_ID = singer_in_concert.concert_ID GROUP BY      concert.concert_ID; 
SELECT s.Name, COUNT(ci.concert_ID) AS NumberOfConcerts FROM singer s JOIN singer_in_concert ci ON s.Singer_ID = ci.Singer_ID GROUP BY s.Name; 
SELECT s.Name, COUNT(*) AS NumberOfConcerts FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID GROUP BY s.Name; 
SELECT DISTINCT T3.Name  FROM concert AS T1  JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID  JOIN singer AS T3 ON T2.Singer_ID = T3.Singer_ID  WHERE T1.Year = '2014'; 
SELECT s.Name  FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE c.Year = '2014'; 
SELECT Name, Country  FROM singer  WHERE Song_Name LIKE '%Hey%'; 
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'; 
SELECT s.Name, s.Location FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year IN ('2014', '2015') GROUP BY s.Stadium_ID HAVING COUNT(c.Year) > 1; 
SELECT T1.Name, T1.Location  FROM stadium AS T1  JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID  WHERE T2.Year IN ('2014', '2015')  GROUP BY T1.Stadium_ID  HAVING COUNT(T2.Year) = 2; 
SELECT COUNT(*)  FROM concert  JOIN stadium ON concert.Stadium_ID = stadium.Stadium_ID  WHERE stadium.Capacity = (SELECT MAX(Capacity) FROM stadium); 
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1); 
SELECT COUNT(*)  FROM Pets  WHERE weight > 10; 
SELECT COUNT(*)  FROM Pets  WHERE weight > 10; 
SELECT weight  FROM Pets  WHERE PetType = 'dog'  ORDER BY pet_age ASC  LIMIT 1; 
SELECT weight  FROM Pets  WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog') 
SELECT PetType, MAX(weight) AS MaxWeight FROM Pets GROUP BY PetType; 
SELECT PetType, MAX(weight) AS MaxWeight FROM Pets GROUP BY PetType; 
SELECT COUNT(*)  FROM Student  JOIN Has_Pet ON Student.StuID = Has_Pet.StuID  JOIN Pets ON Has_Pet.PetID = Pets.PetID  WHERE Student.Age > 20; 
SELECT COUNT(*) FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Student.Age > 20; 
SELECT COUNT(*)  FROM Student s  JOIN Has_Pet hp ON s.StuID = hp.StuID  JOIN Pets p ON hp.PetID = p.PetID  WHERE s.Sex = 'F' AND p.PetType = 'dog' 
SELECT COUNT(*)  FROM Student  JOIN Has_Pet ON Student.StuID = Has_Pet.StuID  JOIN Pets ON Has_Pet.PetID = Pets.PetID  WHERE Student.Sex = 'F' AND Pets.PetType = 'dog' 
SELECT COUNT(DISTINCT PetType) FROM Pets; 
SELECT COUNT(DISTINCT PetType) FROM Pets; 
SELECT DISTINCT T1.Fname  FROM Student AS T1  JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID  JOIN Pets AS T3 ON T2.PetID = T3.PetID  WHERE T3.PetType IN ('cat', 'dog') 
SELECT DISTINCT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType IN ('cat', 'dog') 
SELECT S.Fname FROM Student S JOIN Has_Pet HP1 ON S.StuID = HP1.StuID JOIN Has_Pet HP2 ON S.StuID = HP2.StuID JOIN Pets P1 ON HP1.PetID = P1.PetID JOIN Pets P2 ON HP2.PetID = P2.PetID WHERE P1.PetType = 'cat' AND P2.PetType = 'dog' 
SELECT s.Fname  FROM Student s JOIN Has_Pet hp1 ON s.StuID = hp1.StuID JOIN Pets p1 ON hp1.PetID = p1.PetID JOIN Has_Pet hp2 ON s.StuID = hp2.StuID JOIN Pets p2 ON hp2.PetID = p2.PetID WHERE p1.PetType = 'cat' AND p2.PetType = 'dog' 
SELECT S.Major, S.Age  FROM Student S  JOIN Has_Pet HP ON S.StuID = HP.StuID  JOIN Pets P ON HP.PetID = P.PetID  WHERE P.PetType <> 'cat' 
SELECT      S.Fname, S.LName, S.Age, ST.Major FROM      Student S JOIN      Has_Pet HP ON S.StuID = HP.StuID JOIN      Pets P ON HP.PetID = P.PetID WHERE      NOT EXISTS (         SELECT 1 FROM Pets P2 WHERE P2.PetType = 'cat' AND P2.PetID IN (SELECT PetID FROM Has_Pet WHERE StuID = S.StuID)     ) ORDER BY      S.Fname, S.LName; 
SELECT DISTINCT StuID  FROM Student  WHERE StuID NOT IN (     SELECT StuID      FROM Has_Pet      JOIN Pets ON Has_Pet.PetID = Pets.PetID      WHERE PetType = 'cat' ) 
SELECT s.StuID  FROM Student s  JOIN Has_Pet hp ON s.StuID = hp.StuID  JOIN Pets p ON hp.PetID = p.PetID  WHERE p.PetType <> 'cat' 
SELECT S.Fname, S.Age FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'dog' AND NOT EXISTS (     SELECT 1 FROM Has_Pet HP2 JOIN Pets P2 ON HP2.PetID = P2.PetID     WHERE HP2.StuID = S.StuID AND P2.PetType = 'cat' ) 
SELECT S.Fname  FROM Student S  JOIN Has_Pet HP ON S.StuID = HP.StuID  JOIN Pets P ON HP.PetID = P.PetID  WHERE P.PetType = 'dog'  AND NOT EXISTS (     SELECT 1 FROM Has_Pet HP2 JOIN Pets P2 ON HP2.PetID = P2.PetID      WHERE HP2.StuID = HP.StuID AND P2.PetType = 'cat' ); 
SELECT PetType, weight  FROM Pets  WHERE pet_age = (SELECT MIN(pet_age) FROM Pets); 
SELECT PetType, weight  FROM Pets  WHERE pet_age = (SELECT MIN(pet_age) FROM Pets); 
SELECT P.PetID, P.weight  FROM Pets P  JOIN Has_Pet HP ON P.PetID = HP.PetID  WHERE P.pet_age > 1; 
SELECT P.PetID, P.weight FROM Pets P WHERE P.pet_age > 1; 
SELECT PetType, AVG(pet_age) AS AverageAge, MAX(pet_age) AS MaxAge FROM Pets GROUP BY PetType; 
SELECT PetType, AVG(pet_age) AS AverageAge, MAX(pet_age) AS MaxAge FROM Pets GROUP BY PetType; 
SELECT PetType, AVG(weight) AS AverageWeight FROM Pets GROUP BY PetType; 
SELECT PetType, AVG(weight) AS AverageWeight FROM Pets GROUP BY PetType; 
SELECT S.Fname, S.Age  FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID; 
SELECT DISTINCT S.Fname, S.Age FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID; 
SELECT H.PetID FROM Has_Pet H JOIN Student S ON H.StuID = S.StuID WHERE S.LName = 'Smith' 
SELECT P.PetID FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE S.LName = 'Smith'; 
SELECT Student.StuID, COUNT(Has_Pet.PetID) AS Num_of_Pets FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID GROUP BY Student.StuID; 
SELECT StuID, COUNT(*) AS NumberOfPets FROM Has_Pet GROUP BY StuID; 
SELECT S.Fname, S.Sex  FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID GROUP BY S.StuID HAVING COUNT(*) > 1; 
SELECT S.Fname, S.Sex FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID GROUP BY S.StuID HAVING COUNT(*) > 1; 
SELECT T1.LName  FROM Student AS T1  JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID  JOIN Pets AS T3 ON T2.PetID = T3.PetID  WHERE T3.pet_age = 3 AND T3.PetType = 'cat' 
SELECT T1.LName FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' AND T3.pet_age = 3; 
SELECT AVG(Student.Age)  FROM Student  WHERE StuID NOT IN (SELECT StuID FROM Has_Pet) 
SELECT AVG(Student.Age)  FROM Student  WHERE Student.StuID NOT IN (SELECT StuID FROM Has_Pet) 
SELECT COUNT(*) FROM continents; 
SELECT COUNT(*) FROM continents; 
SELECT c.ContId, c.Continent, COUNT(co.CountryId) AS NumberOfCountries FROM continents c JOIN countries co ON c.ContId = co.Continent GROUP BY c.ContId, c.Continent; 
SELECT c.ContId, c.Continent, COUNT(co.CountryId) AS NumberOfCountries FROM continents c JOIN countries co ON c.ContId = co.Continent GROUP BY c.ContId, c.Continent; 
SELECT COUNT(*) FROM countries; 
SELECT COUNT(*) FROM countries; 
SELECT cm.FullName, cm.Id, COUNT(DISTINCT cn.Model) AS NumberOfModelsProduced FROM car_makers cm JOIN car_names cn ON cm.Id = cn.MakeId GROUP BY cm.Id, cm.FullName ORDER BY NumberOfModelsProduced DESC; 
SELECT Id, Maker, COUNT(Model) AS NumberOfModels FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY Id, Maker; 
SELECT Model FROM car_names WHERE MakeId = (SELECT Id FROM car_makers WHERE Maker IN (SELECT Maker FROM cars_data WHERE Horsepower = (SELECT MIN(Horsepower) FROM cars_data))) 
SELECT Model FROM car_names WHERE MakeId = (     SELECT Id FROM cars_data ORDER BY Horsepower ASC LIMIT 1 ) 
SELECT Model FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data) 
SELECT Model FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data); 
SELECT DISTINCT T1.FullName FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Year = 1970; 
SELECT DISTINCT T1.FullName FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Year = 1970; 
SELECT T1.Make, MIN(T4.Year) AS EarliestYear FROM car_names AS T1 JOIN car_makers AS T2 ON T1.Model = T3.Model AND T1.Maker = T2.Id JOIN model_list AS T3 ON T1.Model = T3.ModelId JOIN cars_data AS T4 ON T1.MakeId = T4.Id GROUP BY T1.Make ORDER BY EarliestYear ASC LIMIT 1; 
SELECT T2.FullName, T3.Year FROM cars_data AS T3 JOIN car_names AS T2 ON T3.Id = T2.MakeId JOIN car_makers AS T1 ON T2.Country = T1.Country WHERE T3.Year = (SELECT MIN(Year) FROM cars_data) LIMIT 1; 
SELECT DISTINCT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Year > 1980); 
SELECT DISTINCT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Year > 1980); 
SELECT c.Continent, COUNT(cm.Id) AS NumberOfCarMakers FROM continents c JOIN countries co ON c.ContId = co.Continent JOIN car_makers cm ON co.CountryId = cm.Country GROUP BY c.Continent; 
SELECT c.Continent, COUNT(cm.Id) AS NumberOfMakers FROM continents c JOIN countries co ON c.ContId = co.Continent JOIN car_makers cm ON co.CountryId = cm.Country GROUP BY c.Continent; 
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryName ORDER BY COUNT(cm.Id) DESC LIMIT 1; 
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryId, c.CountryName ORDER BY COUNT(cm.Id) DESC LIMIT 1; 
SELECT COUNT(T2.Model), T1.FullName FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.FullName; 
SELECT c.Id, c.FullName, COUNT(m.ModelId) AS NumberOfModels FROM car_makers c JOIN model_list m ON c.Id = m.Maker GROUP BY c.Id, c.FullName; 
SELECT `Accelerate` FROM `cars_data` WHERE `MakeId` = (     SELECT `MakeId` FROM `car_names` WHERE `Model` = 'hornet sportabout' AND `Make` = 'amc' ) 
SELECT Accelerate FROM cars_data WHERE MakeId = (SELECT Id FROM car_names WHERE Model = 'amc hornet sportabout (sw)'); 
SELECT COUNT(*) FROM car_makers WHERE Country = 'france'; 
SELECT COUNT(*)  FROM car_makers  WHERE Country = 'France'; 
SELECT COUNT(*)  FROM car_makers  WHERE Country = 'usa'; 
SELECT COUNT(*)  FROM car_makers  JOIN countries ON car_makers.Country = countries.CountryId  WHERE countries.Continent = 2; -- Europe's ContId is 2 based on the given schema 
SELECT AVG(T1.MPG)  FROM cars_data AS T1  JOIN car_names AS T2 ON T1.Id = T2.MakeId  WHERE T2.Model = '4 cylinders' 
SELECT AVG(`MPG`)  FROM `cars_data`  WHERE `Cylinders` = 4; 
SELECT Weight FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON car_names.Maker = car_makers.Id WHERE Cylinders = 8 AND Year = 1974 ORDER BY Weight ASC LIMIT 1; 
SELECT MIN(`Weight`) FROM `cars_data` JOIN `car_names` ON `cars_data.Id` = `car_names.MakeId` JOIN `model_list` ON `car_names.Model` = `model_list.Model` JOIN `car_makers` ON `car_names.Make` = `car_makers.FullName` JOIN `countries` ON `car_makers.Country` = `countries.CountryName` JOIN `continents` ON `countries.Continent` = `continents.ContId` WHERE `model_list.Cylinders` = 8 AND `cars_data.Year` = 1974; 
SELECT Maker, Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker;
SELECT car_makers.Maker, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker; 
SELECT c.CountryName, c.CountryId  FROM countries c  JOIN car_makers cm ON c.CountryId = cm.Country; 
SELECT CountryName, CountryId FROM countries WHERE CountryId IN (SELECT Country FROM car_makers) 
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150; 
SELECT COUNT(*)  FROM cars_data  WHERE Horsepower > 150; 
SELECT Year, AVG(Weight) AS AverageWeight FROM cars_data; 
SELECT Year, AVG(Weight), AVG(`Year`) FROM cars_data GROUP BY Year; 
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country WHERE c.Continent = (SELECT ContId FROM continents WHERE Continent = 'europe') GROUP BY c.CountryName HAVING COUNT(cm.Id) >= 3; 
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryName HAVING COUNT(cm.Id) >= 3 WHERE c.Continent = (SELECT ContId FROM continents WHERE Continent = 'europe') 
SELECT T2.Horsepower, T1.Make FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Cylinders = 3 ORDER BY T2.Horsepower DESC LIMIT 1; 
SELECT T2.Horsepower, T1.FullName FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.ModelId IN (     SELECT ModelId     FROM cars_data     WHERE Cylinders = 3 ) ORDER BY T2.Horsepower DESC LIMIT 1; 
SELECT Model FROM cars_data WHERE MPG = (SELECT MAX(MPG) FROM cars_data) 
SELECT Model FROM car_names WHERE MakeId = (SELECT Id FROM cars_data ORDER BY MPG DESC LIMIT 1) 
SELECT AVG(T1.Horsepower)  FROM cars_data AS T1  JOIN car_names AS T2 ON T1.Id = T2.MakeId  JOIN model_list AS T3 ON T2.Model = T3.ModelId  WHERE T3.Year < 1980 
SELECT AVG(T1.Horsepower)  FROM cars_data AS T1  JOIN car_names AS T2 ON T1.Id = T2.MakeId  WHERE T1.Year < 1980; 
SELECT AVG(T2.Edispl)  FROM car_names AS T1  JOIN cars_data AS T2 ON T1.MakeId = T2.Id  JOIN model_list AS T3 ON T3.ModelId = T1.Model  JOIN car_makers AS T4 ON T4.Id = T3.Maker  WHERE T4.FullName = 'volvo' 
SELECT AVG(T1.Edispl) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.Model JOIN car_makers AS T4 ON T4.Id = T2.Maker WHERE T4.FullName = 'volvo' 
SELECT Cylinders, MAX(Accelerate)  FROM cars_data  GROUP BY Cylinders; 
SELECT MAX(T1.Accelerate), T1.Cylinders FROM cars_data AS T1 GROUP BY T1.Cylinders; 
SELECT Model FROM car_names GROUP BY Model ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT ModelId, COUNT(*) AS version_count FROM cars_data GROUP BY ModelId ORDER BY version_count DESC LIMIT 1; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4; 
SELECT COUNT(*)  FROM cars_data  WHERE Year = 1980; 
SELECT COUNT(*)  FROM cars_data  WHERE Year = 1980; 
SELECT COUNT(*)  FROM car_makers cm  JOIN model_list ml ON cm.Id = ml.Maker  WHERE cm.FullName = 'American Motor Company'; 
SELECT COUNT(*) FROM car_makers cm JOIN car_names cn ON cm.Id = cn.MakeId WHERE cm.FullName = 'American Motor Company'; 
SELECT cm.FullName, cm.Id FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id HAVING COUNT(ml.Model) > 3; 
SELECT MakeId, Model FROM car_names JOIN car_makers ON car_names.Make = car_makers.FullName GROUP BY MakeId HAVING COUNT(Model) > 3; 
SELECT DISTINCT T3.Model  FROM cars_data AS T1  JOIN car_names AS T2 ON T1.Id = T2.MakeId  JOIN car_makers AS T3 ON T2.Maker = T3.Id  WHERE T3.FullName = 'General Motors' OR T1.Weight > 3500 
SELECT DISTINCT T3.Model FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.ModelId WHERE T3.FullName = 'General Motors' OR T1.Weight > 3500 
SELECT Year  FROM cars_data  WHERE Weight BETWEEN 3000 AND 4000; 
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 UNION SELECT DISTINCT Year FROM cars_data WHERE Weight > 3000; 
SELECT T1.Horsepower FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId ORDER BY T1.Accelerate DESC LIMIT 1 
SELECT T1.Horsepower FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId ORDER BY T1.Accelerate DESC LIMIT 1 
SELECT MIN(T1.Cylinders) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.Model JOIN car_makers AS T4 ON T3.Maker = T4.Id WHERE T4.FullName = 'Volvo' 
SELECT MIN(T3.Cylinders) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.ModelId WHERE T3.FullName = 'Volvo' 
SELECT COUNT(*) FROM cars_data c WHERE c.Accelerate > (SELECT MAX(Horsepower) FROM cars_data cd) 
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Horsepower) FROM cars_data) 
SELECT COUNT(*) FROM (     SELECT CountryId FROM car_makers GROUP BY CountryId HAVING COUNT(Id) > 2 ) AS subquery; 
SELECT COUNT(*) FROM (     SELECT CountryId FROM car_makers     GROUP BY CountryId     HAVING COUNT(Id) > 2 ) AS subquery; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6; 
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6; 
SELECT Model FROM car_names WHERE MakeId IN (     SELECT Id FROM cars_data WHERE Cylinders = 4     ORDER BY Horsepower DESC LIMIT 1 ) 
SELECT T1.Model FROM `car_names` AS T1 JOIN `cars_data` AS T2 ON T1.MakeId = T2.Id WHERE T2.Cylinders = 4 ORDER BY T2.Horsepower DESC LIMIT 1; 
SELECT T1.MakeId, T2.FullName FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.Model WHERE T3.Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND T1.Cylinders <= 3; 
SELECT T1.MakeId, T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Horsepower != 'min' AND T2.Cylinders < 4 
SELECT MAX(MPG)  FROM cars_data  WHERE Cylinders = 8 OR Year < 1980; 
SELECT MAX(T1.MPG)  FROM cars_data AS T1  JOIN car_names AS T2 ON T1.Id = T2.MakeId  WHERE T2.Model LIKE '%8cyl%' OR T2.Year < 1980; 
SELECT T3.Model FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.ModelId WHERE T1.Weight < 3500 AND T2.FullName != 'Ford Motor Company' 
SELECT T1.Model  FROM cars_data AS T1  JOIN car_names AS T2 ON T1.Id = T2.MakeId  JOIN model_list AS T3 ON T2.Model = T3.ModelId  JOIN car_makers AS T4 ON T4.Id = T3.Maker  WHERE T1.Weight < 3500 AND T4.FullName = 'Ford Motor Company' GROUP BY T1.Model; 
SELECT c.CountryName FROM countries c LEFT JOIN car_makers cm ON c.CountryId = cm.Country WHERE cm.Id IS NULL; 
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers) 
SELECT Id, Maker FROM car_makers WHERE Id IN (     SELECT Model FROM model_list GROUP BY Model HAVING COUNT(*) >= 2 ) AND Id IN (     SELECT DISTINCT MakerId FROM car_names GROUP BY MakerId HAVING COUNT(*) > 3 ) 
SELECT T1.Id, T1.Maker FROM car_makers AS T1  JOIN model_list AS T2 ON T1.Id = T2.Maker  GROUP BY T1.Id, T1.Maker  HAVING COUNT(T2.Model) >= 2  AND COUNT(T2.Model) <= 3; 
SELECT c.CountryId, c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryId, c.CountryName HAVING COUNT(cm.Id) > 3 UNION SELECT cn.CountryId, cn.CountryName FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker JOIN car_names cn ON ml.ModelId = cn.MakeId WHERE cn.Model = 'fiat'; 
SELECT c.CountryId, c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryId, c.CountryName HAVING COUNT(cm.Id) > 3 UNION SELECT cd.MakeId, cn.Model || ' (' || cm.FullName || ')' FROM car_names cn JOIN car_makers cm ON cn.Make = cm.FullName JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cn.Model = 'fiat' 
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways';
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways';
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways';
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways';
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'; 
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'; 
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'; 
SELECT AirportCode, AirportName  FROM airports  WHERE City = 'Anthony'; 
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
SELECT City, Country FROM airports WHERE AirportCode = 'Alton';
SELECT City, Country FROM airports WHERE AirportCode = 'Alton' 
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'; 
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'; 
SELECT AirportName FROM airports WHERE City = 'Aberdeen' 
SELECT AirportName FROM airports WHERE City = 'Aberdeen'; 
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.SourceAirport = airports.AirportCode  WHERE airports.City = 'APG' 
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'; 
SELECT COUNT(*)  FROM flights  WHERE DestAirport = 'ATO'; 
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airports.City = 'ATO' 
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'; 
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.SourceAirport = airports.AirportCode  WHERE airports.City = 'Aberdeen' 
SELECT COUNT(*)  FROM flights f JOIN airports a ON f.DestAirport = a.AirportCode WHERE a.City = 'Aberdeen' 
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airports.City = 'Aberdeen' 
SELECT COUNT(*)  FROM flights f  JOIN airports s ON f.SourceAirport = s.AirportCode  JOIN airports d ON f.DestAirport = d.AirportCode  WHERE s.City = 'Aberdeen' AND d.City = 'Ashley'; 
SELECT COUNT(*)  FROM flights  JOIN airports AS source ON flights.SourceAirport = source.AirportCode  JOIN airports AS dest ON flights.DestAirport = dest.AirportCode  WHERE source.City = 'Aberdeen' AND dest.City = 'Ashley' 
SELECT COUNT(*)  FROM flights  WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'JetBlue Airways') 
SELECT COUNT(*) FROM flights WHERE Airline = 4;
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.uid  JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airlines.Airline = 'UAL' AND airports.AirportCode = 'ASY' 
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airlines.Airline = 'UAL' AND airports.AirportCode = 'ASY'; 
SELECT COUNT(*)  FROM flights  JOIN airlines ON airlines.uid = flights.Airline  JOIN airports ON airports.AirportCode = flights.SourceAirport  WHERE airlines.Airline = 'United Airlines' AND airports.AirportCode = 'AHD'; 
SELECT COUNT(*)  FROM flights  JOIN airlines ON airlines.uid = flights.Airline  JOIN airports ON airports.AirportCode = flights.SourceAirport  WHERE airlines.Airline = 'United Airlines' AND airports.City = 'AHD'; 
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.uid  JOIN airports ON flights.SourceAirport = airports.AirportCode  WHERE airlines.Airline = 'United Airlines' AND airports.City = 'Aberdeen' 
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE flights.Airline = 1 AND airports.City = 'Aberdeen' 
SELECT T3.City FROM flights AS T1  JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode  JOIN airports AS T3 ON T1.DestAirport = T3.AirportCode  GROUP BY T3.City  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT T2.City FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode GROUP BY T1.DestAirport ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T3.City FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode JOIN airports AS T3 ON T1.DestAirport = T3.AirportCode GROUP BY T3.City ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT City FROM airports WHERE AirportCode IN (SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1) 
SELECT AirportCode FROM airports WHERE AirportCode IN (     SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) DESC LIMIT 1 ) UNION SELECT AirportCode FROM airports WHERE AirportCode IN (     SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1 ) 
SELECT AirportCode FROM airports WHERE AirportCode IN (     SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) DESC LIMIT 1 ) UNION SELECT AirportCode FROM airports WHERE AirportCode IN (     SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1 ) 
SELECT AirportCode FROM airports WHERE AirportCode IN (     SELECT DestAirport     FROM flights     GROUP BY DestAirport     ORDER BY COUNT(*) ASC     LIMIT 1 ) UNION SELECT AirportCode FROM airports WHERE AirportCode IN (     SELECT SourceAirport     FROM flights     GROUP BY SourceAirport     ORDER BY COUNT(*) ASC     LIMIT 1 ) ORDER BY 1 LIMIT 1; 
SELECT AirportCode  FROM airports  WHERE AirportCode IN (     SELECT DestAirport      FROM flights      GROUP BY DestAirport      ORDER BY COUNT(*) ASC      LIMIT 1 ) UNION SELECT AirportCode  FROM airports  WHERE AirportCode IN (     SELECT SourceAirport      FROM flights      GROUP BY SourceAirport      ORDER BY COUNT(*) ASC      LIMIT 1 ) ORDER BY 1 LIMIT 1; 
SELECT Airline, COUNT(*) AS NumberOfFlights FROM flights GROUP BY Airline ORDER BY NumberOfFlights DESC LIMIT 1; 
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN (     SELECT Airline, COUNT(*) AS flight_count     FROM flights     GROUP BY Airline     ORDER BY flight_count ASC     LIMIT 1 ) AS T2 ON T1.uid = T2.Airline; 
SELECT A.Abbreviation, C.Country FROM airlines A JOIN (     SELECT Airline, COUNT(*) AS flight_count     FROM flights     GROUP BY Airline     ORDER BY flight_count ASC     LIMIT 1 ) B ON A.uid = B.Airline JOIN airlines C ON A.uid = C.uid; 
SELECT DISTINCT T1.Airline  FROM airlines AS T1  JOIN flights AS T2 ON T1.uid = T2.Airline  JOIN airports AS T3 ON T3.AirportCode = T2.SourceAirport  WHERE T3.AirportCode = 'AHD'; 
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD' 
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'; 
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'; 
SELECT DISTINCT Airline FROM flights WHERE SourceAirport = 'APG' INTERSECT SELECT DISTINCT Airline FROM flights WHERE DestAirport = 'CVO' 
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline JOIN airports AS T3 ON T3.AirportCode = T2.SourceAirport WHERE T3.City IN ('APG', 'CVO') GROUP BY T1.Airline HAVING COUNT(T3.City) = 2; 
SELECT DISTINCT Airline FROM flights WHERE SourceAirport = 'CVO' AND DestAirport NOT IN (SELECT AirportCode FROM airports WHERE City = 'APG') 
SELECT DISTINCT A.Airline  FROM airlines A  JOIN flights F ON A.uid = F.Airline  JOIN airports S ON F.SourceAirport = S.AirportCode  JOIN airports D ON F.DestAirport = D.AirportCode  WHERE S.City = 'CVO' AND D.City != 'APG' 
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(T2.Airline) >= 10 
SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(*) >= 10; 
SELECT DISTINCT Airline FROM airlines WHERE Airline IN (     SELECT T1.Airline FROM airlines AS T1     JOIN flights AS T2 ON T1.uid = T2.Airline     GROUP BY T1.Airline     HAVING COUNT(T2.FlightNo) < 200 ) 
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(*) < 200 
SELECT f.FlightNo FROM flights f JOIN airlines a ON f.Airline = a.uid WHERE a.Airline = 'United Airlines' 
SELECT T2.FlightNo FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'United Airlines' 
SELECT T2.FlightNo FROM `flights` AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.AirportName = 'APG' 
SELECT f.FlightNo FROM flights f JOIN airports a ON f.SourceAirport = a.AirportCode WHERE a.City = 'APG' 
SELECT T2.FlightNo FROM `flights` AS T2 JOIN airports AS T1 ON T2.DestAirport = T1.AirportCode WHERE T1.AirportName = "APG" 
SELECT T2.FlightNo FROM `flights` AS T2 JOIN airports AS T1 ON T2.DestAirport = T1.AirportCode WHERE T1.AirportCode = 'APG' 
SELECT T2.FlightNo FROM `airports` AS T1 JOIN `flights` AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen' 
SELECT T2.FlightNo FROM `flights` AS T1 JOIN `airports` AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.City = 'Aberdeen' 
SELECT T3.FlightNo FROM airports AS T1 JOIN flights AS T3 ON T1.AirportCode = T3.DestAirport WHERE T1.City = 'Aberdeen' 
SELECT T2.FlightNo FROM `airports` AS T1 JOIN `flights` AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen' 
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airports.City IN ('Aberdeen', 'Abilene') 
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airports.City IN ('Aberdeen', 'Abilene') 
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights); 
SELECT AirportCode FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights); 
SELECT COUNT(*) FROM employee;
SELECT COUNT(*) FROM employee; 
SELECT Name  FROM employee  ORDER BY Age ASC; 
SELECT Name FROM employee ORDER BY Age ASC; 
SELECT City, COUNT(*) AS Number_of_Employees FROM employee GROUP BY City; 
SELECT City, COUNT(*) AS NumberOfEmployees FROM employee GROUP BY City; 
SELECT City  FROM employee  WHERE Age < 30  GROUP BY City  HAVING COUNT(Employee_ID) > 1; 
SELECT City  FROM employee  WHERE Age < 30  GROUP BY City  HAVING COUNT(Employee_ID) > 1; 
SELECT Location, COUNT(*) AS Number_of_Shops FROM shop GROUP BY Location; 
SELECT Location, COUNT(*) AS Number_of_Shops FROM shop GROUP BY Location; 
SELECT T2.Manager_name, T2.District  FROM shop AS T2  JOIN  (SELECT Shop_ID, MAX(Number_products) AS MaxProducts   FROM shop   GROUP BY Shop_ID) AS T1  ON T2.Shop_ID = T1.Shop_ID  ORDER BY T1.MaxProducts DESC  LIMIT 1; 
SELECT s.Manager_name, s.District  FROM shop s  WHERE s.Number_products = (SELECT MAX(Number_products) FROM shop); 
SELECT MIN(Number_products) AS Min_Products, MAX(Number_products) AS Max_Products FROM shop; 
SELECT MIN(Number_products), MAX(Number_products) FROM shop; 
SELECT Name, Location, District  FROM shop  ORDER BY Number_products DESC; 
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC; 
SELECT s.Name  FROM shop s  WHERE s.Number_products > (SELECT AVG(Number_products) FROM shop) 
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop) 
SELECT Name  FROM employee  WHERE Employee_ID IN (     SELECT Employee_ID      FROM evaluation      GROUP BY Employee_ID      ORDER BY COUNT(*) DESC      LIMIT 1 ) 
SELECT T1.Name  FROM employee AS T1  JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID  GROUP BY T1.Employee_ID, T1.Name  ORDER BY COUNT(T2.Year_awarded) DESC  LIMIT 1; 
SELECT Name  FROM employee  WHERE Employee_ID = (SELECT Employee_ID FROM evaluation ORDER BY Bonus DESC LIMIT 1); 
SELECT Name FROM employee WHERE Employee_ID = (SELECT Employee_ID FROM evaluation ORDER BY Bonus DESC LIMIT 1);
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation); 
SELECT Name  FROM employee  WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation); 
SELECT T2.Name FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Shop_ID ORDER BY COUNT(T1.Employee_ID) DESC LIMIT 1; 
SELECT T2.Name FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Shop_ID ORDER BY COUNT(T1.Employee_ID) DESC LIMIT 1; 
SELECT s.Name FROM shop s WHERE s.Shop_ID NOT IN (SELECT h.Shop_ID FROM hiring h); 
SELECT s.Name FROM shop s WHERE s.Shop_ID NOT IN (SELECT h.Shop_ID FROM hiring h); 
SELECT s.Name, COUNT(h.Shop_ID) AS Number_of_employees_hired FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Name; 
SELECT COUNT(h.Shop_ID) AS NumberOfEmployees, s.Name AS ShopName FROM hiring h JOIN shop s ON h.Shop_ID = s.Shop_ID GROUP BY h.Shop_ID, s.Name; 
SELECT SUM(`Bonus`) FROM `evaluation`;
SELECT SUM(Bonus) FROM evaluation; 
SELECT * FROM hiring; 
SELECT * FROM hiring;
SELECT District  FROM shop  WHERE Number_products < 3000  UNION  SELECT District  FROM shop  WHERE Number_products > 10000; 
SELECT DISTINCT District  FROM shop  WHERE Number_products < 3000  UNION  SELECT DISTINCT District  FROM shop  WHERE Number_products > 10000; 
SELECT COUNT(DISTINCT Location) FROM shop; 
SELECT COUNT(DISTINCT Location) FROM shop; 
SELECT COUNT(*) FROM Documents;
SELECT COUNT(*) FROM Documents;
SELECT Document_ID, Document_Name, Document_Description FROM Documents; 
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT d.Document_Name, t.Template_ID FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID WHERE d.Document_Description LIKE '%w%'; 
SELECT Document_Name, Document_ID  FROM Documents  WHERE Document_Description LIKE '%w%'; 
SELECT Documents.Document_ID, Templates.Template_ID, Templates.Template_Type_Code, Templates.Template_Details  FROM Documents  JOIN Templates ON Documents.Template_ID = Templates.Template_ID  WHERE Templates.Template_Type_Code = 'CV' AND Documents.Document_Name = 'Robbin CV'; 
SELECT D.Document_ID, T.Template_ID, D.Document_Description  FROM Documents D  JOIN Templates T ON D.Template_ID = T.Template_ID  WHERE D.Document_Name = 'Robbin CV'; 
SELECT COUNT(DISTINCT Template_ID)  FROM Documents; 
SELECT COUNT(DISTINCT Template_ID)  FROM Documents; 
SELECT COUNT(*)  FROM Templates  JOIN Documents ON Templates.Template_ID = Documents.Template_ID  WHERE Template_Type_Code = 'PPT'; 
SELECT COUNT(*)  FROM Templates  JOIN Documents ON Templates.Template_ID = Documents.Template_ID  WHERE Templates.Template_Type_Code = 'PPT'; 
SELECT      T.Template_ID,     COUNT(D.DOCUMENT_ID) AS Number_of_Documents FROM      Templates T LEFT JOIN      Documents D ON T.Template_ID = D.Template_ID GROUP BY      T.Template_ID; 
SELECT Template_ID, COUNT(*) AS Usage_Counter FROM Documents GROUP BY Template_ID ORDER BY Usage_Counter DESC; 
SELECT T2.Template_ID, T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_Type_Code, T2.Template_ID ORDER BY COUNT(T2.Document_ID) DESC LIMIT 1; 
SELECT T1.Template_ID, T2.Template_Type_Code FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code JOIN Documents AS T3 ON T1.Template_ID = T3.Template_ID GROUP BY T1.Template_ID, T2.Template_Type_Code ORDER BY COUNT(T3.Document_ID) DESC LIMIT 1; 
SELECT Template_ID  FROM Templates  JOIN Documents ON Templates.Template_ID = Documents.Template_ID  GROUP BY Template_ID  HAVING COUNT(DISTINCT Document_ID) > 1; 
SELECT DISTINCT T.Template_ID FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID HAVING COUNT(D.Document_ID) > 1; 
SELECT Template_ID  FROM Templates  WHERE Template_ID NOT IN (     SELECT Template_ID      FROM Documents ) 
SELECT Template_ID  FROM Templates  WHERE Template_ID NOT IN (     SELECT Template_ID      FROM Documents ) 
SELECT COUNT(*) FROM Templates;
SELECT COUNT(*) FROM Templates;
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates; 
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates; 
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types; 
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types;
SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PP' OR Template_Type_Code = 'PPT'; 
SELECT Template_ID  FROM Templates  WHERE Template_Type_Code = 'PP' OR Template_Type_Code = 'PPT'; 
SELECT COUNT(*)  FROM Templates  WHERE Template_Type_Code = 'CV'; 
SELECT COUNT(*)  FROM Templates  WHERE Template_Type_Code = 'CV'; 
SELECT T2.Version_Number, T1.Template_Type_Code FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Version_Number > 5; 
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5; 
SELECT Template_Type_Code, COUNT(Template_ID) AS Number_of_Templates FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code GROUP BY Template_Type_Code; 
SELECT Template_Type_Code, COUNT(Template_ID) AS Number_of_Templates FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code GROUP BY Template_Type_Code; 
SELECT Template_Type_Code  FROM Templates  GROUP BY Template_Type_Code  ORDER BY COUNT(Template_ID) DESC  LIMIT 1; 
SELECT Template_Type_Code  FROM Templates  GROUP BY Template_Type_Code  ORDER BY COUNT(Template_ID) DESC  LIMIT 1; 
SELECT Template_Type_Code  FROM Ref_Template_Types  WHERE Template_Type_Code NOT IN (     SELECT Template_Type_Code      FROM Templates      GROUP BY Template_Type_Code      HAVING COUNT(Template_ID) >= 3 ) 
SELECT Template_Type_Code  FROM Ref_Template_Types  WHERE Template_Type_Code IN (     SELECT Template_Type_Code      FROM Templates      GROUP BY Template_Type_Code      HAVING COUNT(Template_ID) < 3 ) 
SELECT MIN(Templates.Version_Number), Ref_Template_Types.Template_Type_Code FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code; 
SELECT MIN(T.version_number), RT.Template_Type_Code FROM Templates T JOIN Ref_Template_Types RT ON T.Template_Type_Code = RT.Template_Type_Code GROUP BY RT.Template_Type_Code ORDER BY T.version_number ASC LIMIT 1; 
SELECT t.Template_Type_Code  FROM Templates t  JOIN Documents d ON t.Template_ID = d.Template_ID  WHERE d.Document_Name = 'Data base'; 
SELECT t.Template_Type_Code FROM Templates t JOIN Documents d ON t.Template_ID = d.Template_ID WHERE d.Document_Name = 'Data base'; 
SELECT Documents.Document_Name  FROM Documents  JOIN Templates ON Documents.Template_ID = Templates.Template_ID  JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code  WHERE Ref_Template_Types.Template_Type_Code = 'BK'; 
SELECT d.Document_Name  FROM Documents d  JOIN Templates t ON d.Template_ID = t.Template_ID  JOIN Ref_Template_Types rtt ON t.Template_Type_Code = rtt.Template_Type_Code  WHERE rtt.Template_Type_Code = 'BK'
SELECT Template_Type_Code, COUNT(*) AS NumberOfDocuments FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Template_Type_Code; 
SELECT      Ref_Template_Types.Template_Type_Code,     COUNT(DISTINCT Templates.Template_ID) AS Number_of_Documents FROM      Ref_Template_Types JOIN      Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN      Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY      Ref_Template_Types.Template_Type_Code; 
SELECT Template_Type_Code  FROM Templates  JOIN Documents ON Templates.Template_ID = Documents.Template_ID  GROUP BY Template_Type_Code  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT t.Template_Type_Code FROM Templates t JOIN Documents d ON t.Template_ID = d.Template_ID GROUP BY t.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT Template_Type_Code  FROM Ref_Template_Types  WHERE Template_Type_Code NOT IN (SELECT DISTINCT Template_Type_Code FROM Templates) 
SELECT Template_Type_Code  FROM Ref_Template_Types  WHERE Template_Type_Code NOT IN (     SELECT DISTINCT Template_Type_Code      FROM Templates ) 
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types; 
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types; 
SELECT Template_Type_Description  FROM Ref_Template_Types  WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD';
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book';
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'; 
SELECT DISTINCT Template_Type_Description  FROM Ref_Template_Types  JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code; 
SELECT DISTINCT t.Template_Type_Description  FROM Templates t  JOIN Documents d ON t.Template_ID = d.Template_ID; 
SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT'; 
SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT'; 
SELECT COUNT(*) FROM Paragraphs; 
SELECT COUNT(*) FROM Paragraphs; 
SELECT COUNT(*)  FROM Paragraphs  JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID  WHERE Documents.Document_Name = 'Summer Show' 
SELECT COUNT(*)  FROM Paragraphs  JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID  WHERE Documents.Document_Name = 'Summer Show' 
SELECT Paragraph_ID, Paragraph_Text, Other_Details  FROM Paragraphs  WHERE Paragraph_Text LIKE '%Korea %'; 
SELECT p.Paragraph_Text  FROM Paragraphs p  JOIN Documents d ON p.Document_ID = d.Document_ID  WHERE p.Paragraph_Text LIKE '%Korea %'; 
SELECT Paragraph_ID, Paragraph_Text  FROM Paragraphs  JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID  WHERE Documents.Document_Name = 'Welcome to NY'; 
SELECT Paragraph_ID, Paragraph_Text  FROM Paragraphs  JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID  WHERE Documents.Document_Name = 'Welcome to NY'; 
SELECT Paragraph_Text  FROM Paragraphs  JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID  WHERE Document_Name = 'Customer reviews'; 
SELECT Paragraphs.Paragraph_Text  FROM Documents  JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID  WHERE Documents.Document_Name = 'Customer reviews'; 
SELECT Document_ID, COUNT(Paragraph_ID) AS NumberOfParagraphs FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID; 
SELECT Document_ID, COUNT(Paragraph_ID) AS NumParagraphs FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID; 
SELECT      d.Document_ID,      d.Document_Name,      COUNT(p.Paragraph_ID) AS Number_of_Paragraphs FROM      Documents d JOIN      Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY      d.Document_ID,      d.Document_Name; 
SELECT      D.Document_ID,      D.Document_Name,      COUNT(P.Paragraph_ID) AS NumberOfParagraphs FROM      Documents D JOIN      Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY      D.Document_ID, D.Document_Name; 
SELECT Document_ID  FROM Paragraphs  GROUP BY Document_ID  HAVING COUNT(*) >= 2 
SELECT Document_ID  FROM Paragraphs  GROUP BY Document_ID  HAVING COUNT(*) >= 2 
SELECT Document_ID, Document_Name  FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Document_ID, Document_Name ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT d.Document_ID, d.Document_Name  FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID, d.Document_Name ORDER BY COUNT(p.Paragraph_ID) DESC LIMIT 1; 
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT Document_ID FROM Documents JOIN (     SELECT Document_ID, COUNT(*) AS paragraph_count     FROM Paragraphs     GROUP BY Document_ID ) AS subquery ON Documents.Document_ID = subquery.Document_ID WHERE subquery.paragraph_count = (     SELECT MIN(paragraph_count)     FROM (         SELECT COUNT(*) AS paragraph_count         FROM Paragraphs         GROUP BY Document_ID     ) AS subquery2 ); 
SELECT D.Document_ID FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID HAVING COUNT(P.Paragraph_ID) BETWEEN 1 AND 2 
SELECT Document_ID  FROM Paragraphs  GROUP BY Document_ID  HAVING COUNT(*) BETWEEN 1 AND 2 
SELECT D.Document_ID FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID WHERE P.Paragraph_Text = 'Brazil' UNION SELECT D.Document_ID FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID WHERE P.Paragraph_Text = 'Ireland'; 
SELECT DISTINCT d.Document_ID  FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID WHERE p.Paragraph_Text LIKE '%Brazil%' AND p.Paragraph_Text LIKE '%Ireland%' 
SELECT COUNT(DISTINCT Teacher_ID) FROM teacher; 
SELECT COUNT(Teacher_ID) FROM teacher; 
SELECT Name FROM teacher ORDER BY Age ASC; 
SELECT Name FROM teacher ORDER BY Age ASC; 
SELECT Name, Age, Hometown FROM teacher; 
SELECT Name, Age, Hometown FROM teacher; 
SELECT teacher.Name  FROM teacher  WHERE teacher.Hometown != 'Little Lever Urban District'; 
SELECT teacher.Name  FROM teacher  WHERE teacher.Hometown != 'Little Lever Urban District'; 
SELECT Name FROM teacher WHERE Age IN ('32', '33'); 
SELECT teacher.Name  FROM teacher  WHERE teacher.Age IN ('32', '33'); 
SELECT T2.Hometown  FROM teacher AS T2  JOIN course_arrange AS T3 ON T2.Teacher_ID = T3.Teacher_ID  ORDER BY T2.Age  LIMIT 1; 
SELECT T2.Hometown  FROM teacher AS T2 JOIN course_arrange AS T3 ON T2.Teacher_ID = T3.Teacher_ID WHERE T2.Age = (SELECT MIN(Age) FROM teacher); 
SELECT Hometown, COUNT(*) AS NumberOfTeachers FROM teacher GROUP BY Hometown; 
SELECT T2.Hometown, COUNT(*) AS NumberOfTeachers FROM teacher AS T2 JOIN course_arrange AS T1 ON T2.Teacher_ID = T1.Teacher_ID GROUP BY T2.Hometown; 
SELECT T2.Hometown, COUNT(*) AS Frequency  FROM course_arrange AS T1  JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID  GROUP BY T2.Hometown  ORDER BY Frequency DESC  LIMIT 1; 
SELECT T2.Hometown  FROM course_arrange AS T1  JOIN teacher AS T2  ON T1.Teacher_ID = T2.Teacher_ID  GROUP BY T2.Hometown  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT T2.Hometown  FROM teacher AS T1  JOIN teacher AS T2  ON T1.Hometown = T2.Hometown  AND T1.Teacher_ID < T2.Teacher_ID  GROUP BY T1.Hometown  HAVING COUNT(T1.Teacher_ID) > 1; 
SELECT T.Hometown  FROM teacher T  WHERE (T.Teacher_ID, T.Hometown) IN (     SELECT Teacher_ID, Hometown      FROM (         SELECT Teacher_ID, Hometown, COUNT(*) AS Count_Hometown          FROM teacher          GROUP BY Teacher_ID, Hometown          HAVING COUNT(Hometown) >= 2     ) subquery ) GROUP BY T.Hometown; 
SELECT teacher.Name, course.Course  FROM teacher  JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID  JOIN course ON course_arrange.Course_ID = course.Course_ID; 
SELECT T2.Name, T1.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID JOIN course AS T3 ON T1.Course_ID = T3.Course_ID; 
SELECT T.Name, C.Course  FROM teacher T  JOIN course_arrange CA ON T.Teacher_ID = CA.Teacher_ID  JOIN course C ON CA.Course_ID = C.Course_ID  ORDER BY T.Name ASC; 
SELECT teacher.Name, course.Course FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course.Course_ID = course_arrange.Course_ID ORDER BY teacher.Name ASC; 
SELECT t.Name  FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID JOIN course c ON ca.Course_ID = c.Course_ID WHERE c.Course = 'Math'; 
SELECT T2.Name FROM course AS T1 JOIN course_arrange AS T3 ON T1.Course_ID = T3.Course_ID JOIN teacher AS T2 ON T3.Teacher_ID = T2.Teacher_ID WHERE T1.Course = 'Math'; 
SELECT teacher.Name, COUNT(course.Course_ID) AS NumberOfCourses FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Teacher_ID, teacher.Name; 
SELECT teacher.Name, COUNT(course.Course_ID) AS NumberOfCourses FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Teacher_ID; 
SELECT t.Name  FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID, t.Name HAVING COUNT(DISTINCT ca.Course_ID) >= 2; 
SELECT T2.Name  FROM course_arrange AS T1  JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID  GROUP BY T1.Teacher_ID  HAVING COUNT(T1.Course_ID) >= 2; 
SELECT t.Name  FROM teacher t  LEFT JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID  WHERE ca.Course_ID IS NULL; 
SELECT t.Name  FROM teacher t LEFT JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID WHERE ca.Course_ID IS NULL; 
SELECT COUNT(*) FROM visitor WHERE Age < 30; 
SELECT v.Name  FROM visitor v  WHERE v.Level_of_membership > 4  ORDER BY v.Level_of_membership DESC; 
SELECT AVG(T2.Age)  FROM visit AS T1  JOIN visitor AS T2 ON T1.visitor_ID = T2.ID  WHERE T2.Level_of_membership <= 4; 
SELECT v.Name, v.Level_of_membership  FROM visitor v  WHERE v.Level_of_membership > 4  ORDER BY v.Age DESC; 
SELECT Museum_ID, Name  FROM museum  WHERE Num_of_Staff = (SELECT MAX(Num_of_Staff) FROM museum); 
SELECT AVG(Num_of_Staff)  FROM museum  WHERE Open_Year < '2009'; 
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'; 
SELECT M.Name  FROM museum M  WHERE M.Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > '2010') AND M.Open_Year > '2010' 
SELECT v.ID, v.Name, v.Age FROM visitor v JOIN (     SELECT Museum_ID, visitor_ID     FROM visit     GROUP BY Museum_ID, visitor_ID     HAVING COUNT(*) > 1 ) subquery ON v.ID = subquery.visitor_ID; 
SELECT v.ID, v.Name, v.Level_of_membership FROM visitor v JOIN (     SELECT Museum_ID, SUM(Total_spent) as TotalSpent     FROM visit     GROUP BY Museum_ID     ORDER BY TotalSpent DESC     LIMIT 1 ) AS max_spending_museums ON v.ID IN (     SELECT visitor_ID     FROM visit     WHERE Museum_ID = max_spending_museums.Museum_ID ) ORDER BY v.Level_of_membership ASC; 
SELECT M.Museum_ID, M.Name  FROM museum M  JOIN (     SELECT Museum_ID, COUNT(*) AS Visit_Count      FROM visit      GROUP BY Museum_ID      ORDER BY Visit_Count DESC      LIMIT 1 ) V ON M.Museum_ID = V.Museum_ID; 
SELECT M.Name  FROM museum M  LEFT JOIN visit V ON M.Museum_ID = V.Museum_ID  WHERE V.visitor_ID IS NULL; 
SELECT v.Name, v.Age  FROM visitor v JOIN visit vt ON v.ID = vt.visitor_ID WHERE vt.Num_of_Ticket = (SELECT MAX(Num_of_Ticket) FROM visit) 
SELECT AVG(Num_of_Ticket) AS Average_Tickets, MAX(Num_of_Ticket) AS Maximum_Tickets FROM visit; 
SELECT SUM(T2.Total_spent)  FROM visitor AS T1  JOIN visit AS T2 ON T1.ID = T2.visitor_ID  WHERE T1.Level_of_membership = 1; 
SELECT v.Name  FROM visitor v  JOIN visit v1 ON v.ID = v1.visitor_ID  JOIN museum m1 ON v1.Museum_ID = m1.Museum_ID AND m1.Open_Year < '2009'  JOIN visit v2 ON v.ID = v2.visitor_ID  JOIN museum m2 ON v2.Museum_ID = m2.Museum_ID AND m2.Open_Year > '2011'; 
SELECT COUNT(DISTINCT v.ID)  FROM visitor v LEFT JOIN visit vist ON v.ID = vist.visitor_ID JOIN museum m ON vist.Museum_ID = m.Museum_ID WHERE m.Open_Year < '2010' AND vist.Museum_ID IS NULL; 
SELECT COUNT(*) FROM museum WHERE Open_Year NOT BETWEEN '2008' AND '2013';
SELECT COUNT(*) FROM players;
SELECT COUNT(*) FROM players; 
SELECT COUNT(*) FROM matches; 
SELECT COUNT(*) FROM matches; 
SELECT `first_name`, `birth_date`  FROM players  WHERE `country_code` = 'USA'; 
SELECT first_name, birth_date  FROM players  WHERE country_code = 'USA'; 
SELECT AVG(T1.loser_age), AVG(T1.winner_age)  FROM (   SELECT m.loser_age, m.winner_age    FROM matches m ) T1 
SELECT AVG(CASE WHEN loser_id IS NOT NULL THEN loser_age ELSE winner_age END) AS average_age_loser,        AVG(CASE WHEN winner_id IS NOT NULL THEN winner_age END) AS average_age_winner FROM matches; 
SELECT AVG(winner_rank) AS average_winner_rank FROM matches; 
SELECT AVG(winner_rank) AS avg_winner_rank FROM matches; 
SELECT MAX(loser_rank) AS Highest_Loser_Rank FROM matches; 
SELECT MAX(winner_rank) AS Best_Loser_Rank FROM matches; 
SELECT COUNT(DISTINCT country_code) FROM players; 
SELECT COUNT(DISTINCT country_code) FROM players; 
SELECT COUNT(DISTINCT loser_name) FROM matches; 
SELECT COUNT(DISTINCT loser_name) FROM matches; 
SELECT t.tourney_name  FROM matches t  GROUP BY t.tourney_id  HAVING COUNT(*) > 10 
SELECT DISTINCT tourney_name  FROM matches  WHERE match_num >= 10; 
SELECT DISTINCT winner_name  FROM matches  WHERE year IN (2013, 2016); 
SELECT DISTINCT winner_name  FROM matches  WHERE year = 2013  INTERSECT  SELECT DISTINCT winner_name  FROM matches  WHERE year = 2016; 
SELECT COUNT(*)  FROM matches  WHERE year IN (2013, 2016) 
SELECT COUNT(*)  FROM matches  WHERE year = 2013 OR year = 2016; 
SELECT p.country_code, p.first_name  FROM players p  JOIN (     SELECT winner_id      FROM matches      WHERE tournament_name = 'WTA Championships'     INTERSECT     SELECT winner_id      FROM matches      WHERE tournament_name = 'Australian Open' ) winners ON p.player_id = winners.winner_id; 
SELECT p.first_name, p.country_code FROM players p JOIN (     SELECT winner_id     FROM matches     WHERE tourney_name = 'WTA Championships'     INTERSECT     SELECT winner_id     FROM matches     WHERE tourney_name = 'Australian Open' ) w ON p.player_id = w.winner_id; 
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT MIN(birth_date) FROM players) 
SELECT first_name, country_code  FROM players  WHERE birth_date = (SELECT MIN(birth_date) FROM players); 
SELECT first_name, last_name  FROM players  ORDER BY birth_date; 
SELECT first_name, last_name FROM players ORDER BY birth_date; 
SELECT first_name, last_name  FROM players  WHERE hand = 'L'  ORDER BY birth_date; 
SELECT first_name, last_name  FROM players  WHERE hand = 'L'  ORDER BY birth_date; 
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN (     SELECT player_id, COUNT(*) AS tour_count     FROM rankings     GROUP BY player_id     ORDER BY tour_count DESC     LIMIT 1 ) AS T2 ON T1.player_id = T2.player_id; 
SELECT T1.first_name, T1.country_code  FROM players AS T1  JOIN (     SELECT player_id, COUNT(*) AS tours      FROM rankings      GROUP BY player_id      ORDER BY tours DESC      LIMIT 1 ) AS T2  ON T1.player_id = T2.player_id; 
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT `year`  FROM matches  GROUP BY `year`  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT w.player_name, MAX(w.winner_rank_points) FROM (     SELECT m.winner_id, SUM(1) as win_count, w.winner_rank_points     FROM matches m     JOIN players w ON m.winner_id = w.player_id     GROUP BY m.winner_id, w.winner_rank_points ) w ORDER BY w.win_count DESC, w.winner_rank_points DESC LIMIT 1; 
SELECT p1.winner_name, MAX(r.ranking_points) FROM (     SELECT winner_id FROM matches GROUP BY winner_id ORDER BY COUNT(*) DESC LIMIT 1 ) AS m JOIN players AS p1 ON m.winner_id = p1.player_id JOIN rankings AS r ON p1.player_id = r.player_id 
SELECT w.winner_name  FROM matches m  JOIN players p ON m.winner_id = p.player_id  JOIN rankings r ON r.player_id = p.player_id  WHERE m.tourney_name = 'Australian Open' AND r.ranking_points = (SELECT MAX(ranking_points) FROM rankings) 
SELECT p1.winner_name  FROM matches  JOIN players AS p1 ON matches.winner_id = p1.player_id  JOIN tournaments AS t ON matches.tourney_id = t.tourney_id  WHERE t.tourney_name = 'Australian Open'  ORDER BY p1.winner_rank_points DESC  LIMIT 1; 
SELECT p1.name AS loser_name, p2.name AS winner_name FROM matches m JOIN players p1 ON m.loser_id = p1.player_id JOIN players p2 ON m.winner_id = p2.player_id WHERE m.minutes = (SELECT MAX(minutes) FROM matches); 
SELECT      m.winner_name,      m.loser_name  FROM      matches m  WHERE      m.minutes = (SELECT MAX(minutes) FROM matches); 
SELECT p.first_name, AVG(r.ranking) AS average_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name; 
SELECT p.first_name, AVG(r.ranking) AS average_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.first_name; 
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name; 
SELECT T1.first_name, SUM(T2.ranking_points) AS total_ranking_points FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id, T1.first_name; 
SELECT country_code, COUNT(DISTINCT player_id) AS num_players FROM players GROUP BY country_code; 
SELECT country_code, COUNT(*) AS num_players FROM players GROUP BY country_code; 
SELECT country_code  FROM players  GROUP BY country_code  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT country_code  FROM players  GROUP BY country_code  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT country_code  FROM players  GROUP BY country_code  HAVING COUNT(player_id) > 50; 
SELECT country_code  FROM players  GROUP BY country_code  HAVING COUNT(*) > 50; 
SELECT ranking_date, COUNT(*) AS total_tours FROM rankings GROUP BY ranking_date; 
SELECT ranking_date, COUNT(DISTINCT tours) AS total_tours FROM rankings GROUP BY ranking_date; 
SELECT `year`, COUNT(*) AS matches_per_year FROM matches GROUP BY `year`; 
SELECT year, COUNT(*) AS matches_played FROM matches GROUP BY year; 
SELECT winner_name, winner_rank FROM (     SELECT winner_name, winner_rank, ROW_NUMBER() OVER (ORDER BY winner_age ASC) as rank_order     FROM matches     JOIN players ON matches.winner_id = players.player_id ) ranked_winners WHERE rank_order <= 3 
SELECT winner_name, winner_rank  FROM matches  WHERE year IS NOT NULL  ORDER BY winner_age ASC  LIMIT 3; 
SELECT COUNT(DISTINCT winner_id) FROM matches WHERE tourney_name = 'WTA Championships' AND winner_hand = 'L'; 
SELECT COUNT(*)  FROM matches  JOIN players ON matches.winner_id = players.player_id  WHERE players.hand = 'L' AND matches.tourney_name = 'WTA Championships' 
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN (     SELECT winner_id, MAX(winner_rank_points) as max_rank_points     FROM matches     GROUP BY winner_id ) m ON p.player_id = m.winner_id WHERE p.player_id IN (     SELECT winner_id     FROM matches     WHERE winner_rank_points = m.max_rank_points ) ORDER BY m.max_rank_points DESC LIMIT 1; 
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN (     SELECT winner_id, SUM(winner_rank_points) AS total_points     FROM matches     GROUP BY winner_id     ORDER BY total_points DESC     LIMIT 1 ) AS T2 ON T1.player_id = T2.winner_id; 
SELECT hand, COUNT(*) AS num_players FROM players GROUP BY hand; 
SELECT `hand`, COUNT(*) AS player_count FROM players GROUP BY `hand`; 
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'; 
SELECT name, tonnage FROM ship ORDER BY name DESC; 
SELECT name, date, result FROM battle; 
SELECT MIN(injured + killed) AS min_death_toll, MAX(injured + killed) AS max_death_toll FROM death; 
SELECT AVG(injured) AS average_injuries FROM death; 
SELECT d.note, d.killed, d.injured FROM death AS d JOIN ship AS s ON d.caused_by_ship_id = s.id WHERE s.tonnage = 't'; 
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril'; 
SELECT DISTINCT T1.id, T1.name  FROM battle AS T1  JOIN ship AS T2 ON T1.id = T2.lost_in_battle  WHERE T2.ship_type = 'Brig'; 
SELECT T1.id, T1.name FROM battle AS T1 JOIN death AS T2 ON T1.id = T2.caused_by_ship_id GROUP BY T1.id, T1.name HAVING SUM(T2.killed) > 10 
SELECT s.id, s.name  FROM ship s  JOIN death d ON s.id = d.caused_by_ship_id  GROUP BY s.id, s.name  ORDER BY SUM(d.injured) DESC  LIMIT 1; 
SELECT DISTINCT name  FROM battle  WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'; 
SELECT COUNT(DISTINCT result) FROM battle; 
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = '225'); 
SELECT b.name, b.date FROM battle AS b JOIN ship AS s1 ON b.id = s1.lost_in_battle JOIN ship AS s2 ON b.id = s2.lost_in_battle AND s2.name IN ('Lettice', 'HMS Atalanta') WHERE s2.name IN ('Lettice', 'HMS Atalanta') GROUP BY b.name, b.date HAVING COUNT(DISTINCT s2.name) = 2; 
SELECT b.name, b.result, b.bulgarian_commander FROM battle b WHERE NOT EXISTS (     SELECT 1     FROM ship s     WHERE s.lost_in_battle = b.id AND location = 'English Channel' ) 
SELECT d.note  FROM death d  WHERE d.note LIKE '%East%'; 
SELECT `line_1`, `line_2` FROM Addresses; 
SELECT `line_1`, `line_2` FROM Addresses; 
SELECT COUNT(*) FROM Courses; 
SELECT COUNT(*) FROM Courses; 
SELECT course_description  FROM Courses  WHERE course_name = 'Math'; 
SELECT course_description  FROM Courses  WHERE course_name LIKE '%Math%' 
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'; 
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'; 
SELECT d.department_name, d.department_id FROM Departments d JOIN Degree_Programs dp ON d.department_id = dp.department_id WHERE dp.degree_program_id IN (     SELECT degree_program_id     FROM Student_Enrolment     GROUP BY degree_program_id     ORDER BY COUNT(*) DESC     LIMIT 1 ) 
SELECT department_name, department_id  FROM Departments  WHERE department_id = (     SELECT department_id      FROM Degree_Programs      GROUP BY department_id      ORDER BY COUNT(degree_program_id) DESC      LIMIT 1 ); 
SELECT COUNT(DISTINCT department_id)  FROM Degree_Programs; 
SELECT COUNT(DISTINCT department_id)  FROM Degree_Programs; 
SELECT COUNT(DISTINCT degree_summary_name) AS number_of_degrees FROM Degree_Programs; 
SELECT COUNT(DISTINCT degree_summary_name) AS number_of_degrees FROM Degree_Programs; 
SELECT COUNT(*)  FROM Degree_Programs  WHERE department_id IN      (SELECT department_id       FROM Departments       WHERE department_name = 'Engineering'); 
SELECT COUNT(*)  FROM Degree_Programs  JOIN Departments ON Degree_Programs.department_id = Departments.department_id  WHERE Departments.department_name = 'Engineering'; 
SELECT section_name, section_description FROM Sections; 
SELECT section_name, section_description FROM Sections; 
SELECT course_name, course_id  FROM Courses  WHERE course_id IN (     SELECT course_id      FROM Sections      GROUP BY course_id      HAVING COUNT(*) <= 2 ) 
SELECT c.course_name, c.course_id FROM Courses c WHERE c.course_id NOT IN (     SELECT sc.student_course_id     FROM Sections s     JOIN Student_Enrolment_Courses sc ON s.section_id = sc.student_course_id     GROUP BY s.section_id     HAVING COUNT(s.section_id) >= 2 ); 
SELECT section_name FROM Sections ORDER BY section_name DESC; 
SELECT section_name FROM Sections ORDER BY section_name DESC; 
SELECT semester_name, semester_id  FROM Semesters  WHERE semester_id IN (     SELECT semester_id      FROM Student_Enrolment      GROUP BY semester_id      ORDER BY COUNT(student_id) DESC      LIMIT 1 ); 
SELECT s.semester_name, s.semester_id  FROM Semesters s  JOIN Student_Enrolment se ON s.semester_id = se.semester_id  WHERE (s.semester_id, COUNT(se.student_id)) IN  (SELECT semester_id, COUNT(student_id)   FROM Student_Enrolment se   GROUP BY semester_id   ORDER BY COUNT(student_id) DESC   LIMIT 1); 
SELECT department_description  FROM Departments  WHERE department_name LIKE '%the computer%'; 
SELECT department_description  FROM Departments  WHERE department_name LIKE '%computer%'; 
SELECT s.first_name, s.middle_name, s.last_name, se.student_id FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id GROUP BY se.student_id, s.first_name, s.middle_name, s.last_name HAVING COUNT(dp.degree_program_id) > 1 AND MAX(se.semester_id) = MIN(se.semester_id) 
SELECT s.student_id, s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id GROUP BY s.student_id, s.first_name, s.middle_name, s.last_name HAVING COUNT(dp.degree_program_id) = 2; 
SELECT S.first_name, S.middle_name, S.last_name FROM Students S JOIN Student_Enrolment SE ON S.student_id = SE.student_id JOIN Degree_Programs DP ON SE.degree_program_id = DP.degree_program_id WHERE DP.degree_summary_name = 'Bachelor'; 
SELECT S.first_name, S.middle_name, S.last_name FROM Students S JOIN Student_Enrolment SE ON S.student_id = SE.student_id JOIN Degree_Programs DP ON SE.degree_program_id = DP.degree_program_id WHERE DP.degree_summary_name = 'Bachelors'; 
SELECT      Degree_Programs.degree_summary_name  FROM      Student_Enrolment  JOIN      Degree_Programs  ON      Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id  GROUP BY      Degree_Programs.degree_summary_name  ORDER BY      COUNT(Student_Enrolment.student_id) DESC  LIMIT 1; 
SELECT dp.degree_summary_name  FROM Degree_Programs dp  JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id  GROUP BY dp.degree_summary_name  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT dp.degree_program_id, dp.degree_summary_name  FROM Degree_Programs dp  JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id  GROUP BY dp.degree_program_id, dp.degree_summary_name  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT dp.degree_program_id, dp.degree_summary_name  FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_program_id, dp.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT S.student_id, S.first_name, S.middle_name, S.last_name, COUNT(SE.student_enrolment_id) AS number_of_enrollments FROM Students S JOIN Student_Enrolment SE ON S.student_id = SE.student_id GROUP BY S.student_id, S.first_name, S.middle_name, S.last_name ORDER BY number_of_enrollments DESC LIMIT 1; 
SELECT s.student_id, COUNT(se.student_id) AS num_enrollments,         s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id ORDER BY num_enrollments DESC LIMIT 1; 
SELECT s.semester_name FROM Semesters s LEFT JOIN Student_Enrolment se ON s.semester_id = se.semester_id WHERE se.student_id IS NULL; 
SELECT semester_name  FROM Semesters  WHERE semester_id NOT IN (     SELECT DISTINCT semester_id      FROM Student_Enrolment ); 
SELECT DISTINCT c.course_name  FROM Courses c  JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id; 
SELECT c.course_name FROM Courses c JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id; 
SELECT c.course_name  FROM Courses c  JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id  GROUP BY c.course_id  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT c.course_name FROM Courses c JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id GROUP BY c.course_id ORDER BY COUNT(sec.student_course_id) DESC LIMIT 1; 
SELECT s.last_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id WHERE a.state_province_county = 'North Carolina' AND s.student_id NOT IN (     SELECT student_id     FROM Student_Enrolment se ) 
SELECT s.last_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id WHERE a.state_province_county = 'North Carolina' AND s.student_id NOT IN (     SELECT se.student_id     FROM Student_Enrolment se ) 
SELECT T.transcript_date, T.transcript_id  FROM Transcripts T JOIN Transcript_Contents TC ON T.transcript_id = TC.transcript_id GROUP BY T.transcript_id HAVING COUNT(*) >= 2; 
SELECT T.transcript_id, T.transcript_date FROM Transcripts T JOIN Transcript_Contents TC ON T.transcript_id = TC.transcript_id GROUP BY T.transcript_id, T.transcript_date HAVING COUNT(*) >= 2; 
SELECT cell_mobile_number  FROM Students  WHERE first_name = 'Timmothy' AND last_name = 'Ward'; 
SELECT cell_mobile_number  FROM Students  WHERE first_name = 'Timmothy' AND last_name = 'Ward'; 
SELECT first_name, middle_name, last_name  FROM Students  WHERE date_first_registered = (SELECT MIN(date_first_registered) FROM Students); 
SELECT first_name, middle_name, last_name  FROM Students  WHERE date_first_registered = (SELECT MIN(date_first_registered) FROM Students); 
SELECT first_name, middle_name, last_name  FROM Students  WHERE date_left IS NOT NULL  ORDER BY date_left ASC  LIMIT 1; 
SELECT first_name, middle_name, last_name  FROM Students  WHERE date_first_registered <= (SELECT MIN(date_first_registered) FROM Students WHERE date_left IS NOT NULL) LIMIT 1; 
SELECT s.first_name FROM Students s WHERE s.current_address_id != s.permanent_address_id; 
SELECT S.first_name FROM Students S WHERE S.current_address_id != S.permanent_address_id; 
SELECT A.address_id, A.line_1, A.line_2, A.line_3 FROM Addresses A JOIN Student_Enrolment SE ON A.address_id = SE.current_address_id GROUP BY A.address_id, A.line_1, A.line_2, A.line_3 ORDER BY COUNT(SE.student_id) DESC LIMIT 1; 
SELECT A.address_id, A.line_1, A.line_2 FROM Addresses A JOIN (     SELECT current_address_id, COUNT(*) AS student_count     FROM Students     GROUP BY current_address_id ) S ON A.address_id = S.current_address_id WHERE S.student_count = (     SELECT MAX(student_count)     FROM (         SELECT COUNT(*) AS student_count         FROM Students         GROUP BY current_address_id     ) ) ORDER BY S.student_count DESC LIMIT 1; 
SELECT AVG(transcript_date) FROM Transcripts; 
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts; 
SELECT transcript_date FROM Transcripts ORDER BY transcript_id LIMIT 1; 
SELECT MIN(transcript_date) AS earliest_transcript_date,         other_details  FROM Transcripts; 
SELECT COUNT(*) FROM Transcripts; 
SELECT COUNT(transcript_id) AS total_transcripts FROM Transcripts; 
SELECT `transcript_date`  FROM `Transcripts` ORDER BY `transcript_date` DESC LIMIT 1;
SELECT MAX(transcript_date) AS last_transcript_released FROM Transcripts; 
SELECT COUNT(DISTINCT student_course_id) AS max_times_in_transcripts, student_course_id FROM Transcript_Contents GROUP BY student_course_id ORDER BY max_times_in_transcripts DESC LIMIT 1; 
SELECT MAX(TC.student_course_id) AS max_course_enrollment_id, C.course_id FROM Student_Enrolment_Courses AS SC JOIN Courses AS C ON SC.course_id = C.course_id JOIN Transcript_Contents AS TC ON SC.student_course_id = TC.student_course_id GROUP BY C.course_id ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT t.transcript_id, t.transcript_date FROM Transcripts t JOIN (     SELECT student_course_id, COUNT(*) AS count_results     FROM Transcript_Contents     GROUP BY student_course_id ) tc ON t.transcript_id = tc.student_course_id WHERE tc.count_results = (     SELECT MIN(count_results)     FROM (         SELECT COUNT(*) AS count_results         FROM Transcript_Contents         GROUP BY transcript_id     ) ); 
SELECT t.transcript_id, t.transcript_date FROM Transcripts t JOIN (     SELECT student_course_id, COUNT(*) AS result_count     FROM Transcript_Contents     GROUP BY student_course_id ) tc ON t.transcript_id = tc.student_course_id WHERE tc.result_count = (     SELECT MIN(result_count)     FROM (         SELECT COUNT(*) AS result_count         FROM Transcript_Contents         GROUP BY student_course_id     ) ) ORDER BY t.transcript_date ASC LIMIT 1; 
SELECT DISTINCT s.semester_id  FROM Student_Enrolment se1  JOIN Students s1 ON se1.student_id = s1.student_id  JOIN Degree_Programs dp1 ON se1.degree_program_id = dp1.degree_program_id  WHERE dp1.degree_summary_name = 'Master' UNION SELECT DISTINCT s.semester_id  FROM Student_Enrolment se2 JOIN Students s2 ON se2.student_id = s2.student_id  JOIN Degree_Programs dp2 ON se2.degree_program_id = dp2.degree_program_id  WHERE dp2.degree_summary_name = 'Bachelor'; 
SELECT s.semester_id  FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name IN ('Masters', 'Bachelors') GROUP BY s.semester_id HAVING COUNT(DISTINCT se.student_id) > 1; 
SELECT COUNT(DISTINCT current_address_id) AS number_of_addresses FROM Students; 
SELECT DISTINCT T1.line_1, T1.line_2, T1.line_3, T1.city, T1.zip_postcode, T1.state_province_county, T1.country FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.current_address_id OR T1.address_id = T2.permanent_address_id; 
SELECT * FROM Students ORDER BY last_name DESC, first_name DESC; 
SELECT `other_student_details` FROM `Students` ORDER BY `last_name` DESC, `first_name` DESC; 
SELECT *  FROM Sections  WHERE section_name = 'h'; 
SELECT section_description  FROM Sections  WHERE section_name = 'h'; 
SELECT s.first_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id OR s.permanent_address_id = a.address_id WHERE a.country = 'Haiti' OR s.cell_mobile_number = '09700166582'; 
SELECT s.first_name  FROM Students s  JOIN Addresses a ON s.current_address_id = a.address_id  JOIN Addresses pa ON s.permanent_address_id = pa.address_id  WHERE a.country = 'Haiti' OR s.cell_mobile_number = '09700166582'; 
SELECT Title FROM Cartoon ORDER BY Title ASC; 
SELECT Title FROM Cartoon ORDER BY Title ASC; 
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'; 
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' 
SELECT COUNT(*)  FROM Cartoon  WHERE Written_by = 'Joseph Kuhr'; 
SELECT COUNT(*)  FROM Cartoon  WHERE Written_by = 'Joseph Kuhr'; 
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date; 
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date; 
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'; 
SELECT Title  FROM Cartoon  WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'; 
SELECT Country, COUNT(*) AS NumberOfChannels FROM TV_Channel GROUP BY Country ORDER BY NumberOfChannels DESC LIMIT 1; 
SELECT Country, COUNT(*) AS NumberOfChannels FROM TV_Channel GROUP BY Country ORDER BY NumberOfChannels DESC LIMIT 1; 
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel; 
SELECT COUNT(DISTINCT id) AS series_count, COUNT(DISTINCT Content) AS content_count FROM TV_Channel;
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT Content FROM TV_Channel WHERE id = '700';
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT TV_Channel.Package_Option  FROM TV_Channel  JOIN TV_series ON TV_Channel.id = TV_series.Channel  WHERE TV_series.Series_name = 'Sky Radio' 
SELECT COUNT(*)  FROM TV_Channel  WHERE Language = 'English'; 
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'; 
SELECT Language, COUNT(*) AS NumberOfChannels FROM TV_Channel GROUP BY Language ORDER BY NumberOfChannels ASC LIMIT 1; 
SELECT Language, COUNT(*) AS ChannelCount FROM TV_Channel GROUP BY Language ORDER BY ChannelCount ASC LIMIT 1; 
SELECT Language, COUNT(*) AS NumChannels FROM TV_Channel GROUP BY Language; 
SELECT Language, COUNT(*) AS NumChannels FROM TV_Channel GROUP BY Language; 
SELECT `TV_Channel`.`series_name` FROM `TV_Channel` JOIN `Cartoon` ON `TV_Channel`.`id` = `Cartoon`.`Channel` WHERE `Cartoon`.`Title` = 'The Rise of the Blue Beetle!'; 
SELECT TV_Channel.series_name FROM TV_Channel  JOIN Cartoon ON TV_Channel.id = Cartoon.Channel  WHERE Cartoon.Title = 'The Rise of the Blue Beetle'; 
SELECT Cartoon.Title  FROM Cartoon  JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id  WHERE TV_Channel.series_name = 'Sky Radio'; 
SELECT c.Title  FROM Cartoon c  JOIN TV_Channel tc ON c.Channel = tc.id  WHERE tc.series_name = 'Sky Radio' 
SELECT Episode FROM TV_series ORDER BY Rating; 
SELECT Episode FROM TV_series ORDER BY Rating ASC; 
SELECT Episode, Rating  FROM TV_series  ORDER BY Rating DESC  LIMIT 3; 
SELECT Episode, Rating  FROM TV_series  ORDER BY Rating DESC  LIMIT 3; 
SELECT MIN(Share), MAX(Share) FROM TV_series;
SELECT MAX(Share), MIN(Share) FROM TV_series;
SELECT `Original_air_date` FROM `Cartoon` WHERE `Title` = 'A Love of a Lifetime';
SELECT `Original_air_date` FROM `Cartoon` WHERE `Title` = 'A Love of a Lifetime';
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT t2.series_name FROM TV_series AS t1 JOIN TV_Channel AS t2 ON t1.Channel = t2.id WHERE t1.Episode = 'A Love of a Lifetime' 
SELECT `series_name` FROM `TV_Channel` JOIN `TV_series` ON `TV_Channel.id` = `TV_series.Channel` WHERE `Episode` = 'A Love of a Lifetime';
SELECT T2.Episode  FROM TV_Channel AS T1  JOIN TV_series AS T2 ON T1.id = T2.Channel  WHERE T1.series_name = 'Sky Radio' 
SELECT Episode FROM TV_series WHERE Channel = 'Sky Radio';
SELECT Directed_by, COUNT(*) AS Number_of_Cartoons FROM Cartoon GROUP BY Directed_by; 
SELECT Directed_by, COUNT(*) AS Number_of_Cartoons FROM Cartoon GROUP BY Directed_by; 
SELECT `Production code`, `Channel` FROM `Cartoon` WHERE `Original_air_date` = (SELECT MAX(`Original_air_date`) FROM `Cartoon`); 
SELECT `Production code`, `Channel` FROM Cartoon ORDER BY `Original_air_date` DESC LIMIT 1;
SELECT TV_Channel.Package_Option, TV_series.series_name  FROM TV_Channel  JOIN TV_series ON TV_Channel.id = TV_series.Channel  WHERE TV_Channel.Hight_definition_TV = 'yes'; 
SELECT TV_Channel.Package_Option, TV_series.series_name  FROM TV_Channel  JOIN TV_series ON TV_Channel.id = TV_series.Channel  WHERE TV_Channel.Hight_definition_TV = 'yes'; 
SELECT T1.Country  FROM TV_Channel AS T1  JOIN Cartoon AS T2 ON T1.id = T2.Channel  WHERE T2.Written_by = 'Todd Casey' 
SELECT T1.Country  FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey' 
SELECT T1.Country  FROM TV_Channel AS T1  JOIN Cartoon AS T2 ON T1.id = T2.Channel  WHERE T2.Written_by = 'Todd Casey' AND T2.Channel NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey') GROUP BY T1.Country 
SELECT Country  FROM TV_Channel  WHERE id IN (     SELECT Channel      FROM Cartoon      WHERE Written_by != 'Todd Casey' ) AND Country NOT IN (     SELECT Country      FROM TV_Channel      WHERE id IN (         SELECT Channel          FROM Cartoon          WHERE Written_by = 'Todd Casey'     ) ) 
SELECT TV_Channel.series_name, TV_Channel.Country  FROM TV_Channel  JOIN TV_series ON TV_Channel.id = TV_series.Channel  JOIN Cartoon ON TV_series.Channel = Cartoon.Channel  WHERE Cartoon.Directed_by IN ('Ben Jones', 'Michael Chang') 
SELECT c.series_name, c.Country FROM TV_Channel c JOIN TV_series ts ON c.id = ts.Channel JOIN Cartoon ca ON c.id = ca.Channel WHERE ca.Directed_by IN ('Ben Jones', 'Michael Chang') 
SELECT Pixel_aspect_ratio_PAR, Country  FROM TV_Channel  WHERE Language != 'English' 
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English' 
SELECT T.id  FROM TV_Channel T  JOIN (     SELECT Country, COUNT(*) AS ChannelCount      FROM TV_Channel      GROUP BY Country      HAVING ChannelCount > 2 ) C ON T.Country = C.Country; 
SELECT id FROM TV_Channel GROUP BY id HAVING COUNT(*) > 2; 
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones') 
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones'); 
SELECT TV_Channel.Package_Option  FROM TV_Channel  WHERE TV_Channel.id NOT IN (     SELECT Channel      FROM Cartoon      WHERE Directed_by = 'Ben Jones' ) 
SELECT T2.Package_Option  FROM Cartoon AS T1  JOIN TV_Channel AS T2 ON T1.Channel = T2.id  WHERE T1.Directed_by != 'Ben Jones' AND T1.Channel NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones') 
SELECT COUNT(*) FROM poker_player;
SELECT COUNT(*) FROM poker_player; 
SELECT Earnings  FROM poker_player  ORDER BY Earnings DESC; 
SELECT T1.Earnings  FROM poker_player AS T1  ORDER BY T1.Earnings DESC; 
SELECT Poker_Player_ID, Final_Table_Made, Best_Finish FROM poker_player; 
SELECT Poker_Player_ID, Final_Table_Made, Best_Finish FROM poker_player; 
SELECT AVG(Earnings) FROM poker_player; 
SELECT AVG(Earnings) FROM poker_player; 
SELECT Money_Rank FROM poker_player WHERE Earnings = (SELECT MAX(Earnings) FROM poker_player); 
SELECT Money_Rank FROM poker_player WHERE Earnings = (SELECT MAX(Earnings) FROM poker_player); 
SELECT MAX(`Final_Table_Made`)  FROM poker_player  WHERE `Earnings` < 200000; 
SELECT MAX(`Final_Table_Made`)  FROM poker_player  WHERE `Earnings` < 200000; 
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.Poker_Player_ID; 
SELECT Name FROM poker_player; 
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Earnings > 300000; 
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.Poker_Player_ID WHERE T2.Earnings > 300000; 
SELECT T1.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC; 
SELECT T1.Name  FROM poker_player AS T1  JOIN people AS T2 ON T1.People_ID = T2.People_ID  ORDER BY T1.Final_Table_Made ASC; 
SELECT T2.Birth_Date FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings ASC LIMIT 1; 
SELECT `Birth_Date` FROM `people` JOIN `poker_player` ON `poker_player`.`People_ID` = `people`.`People_ID` WHERE `Earnings` = (SELECT MIN(`Earnings`) FROM `poker_player`); 
SELECT T2.Money_Rank FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.Poker_Player_ID ORDER BY T1.Height DESC LIMIT 1; 
SELECT Money_Rank  FROM poker_player  WHERE Poker_Player_ID IN (     SELECT Poker_Player_ID      FROM people      ORDER BY Height DESC      LIMIT 1 ) 
SELECT AVG(T1.Earnings)  FROM poker_player AS T1  JOIN people AS T2 ON T1.People_ID = T2.People_ID  WHERE T2.Height > 200; 
SELECT AVG(T1.Earnings)  FROM poker_player AS T1  JOIN people AS T2 ON T1.People_ID = T2.People_ID  WHERE T2.Height > 200; 
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.Poker_Player_ID ORDER BY T2.Earnings DESC; 
SELECT T1.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC; 
SELECT Nationality, COUNT(*) AS NumberOfPeople FROM people GROUP BY Nationality; 
SELECT Nationality, COUNT(*) AS NumberOfPeople FROM people GROUP BY Nationality; 
SELECT Nationality, COUNT(*) AS Count FROM people GROUP BY Nationality ORDER BY Count DESC LIMIT 1; 
SELECT Nationality  FROM people  GROUP BY Nationality  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT Nationality  FROM people  GROUP BY Nationality  HAVING COUNT(*) >= 2; 
SELECT Nationality  FROM people  GROUP BY Nationality  HAVING COUNT(*) >= 2; 
SELECT Name, Birth_Date FROM people ORDER BY Name ASC; 
SELECT Name, Birth_Date FROM people ORDER BY Name ASC; 
SELECT Name FROM people WHERE Nationality <> 'Russia'; 
SELECT Name FROM people WHERE Nationality <> 'Russia'; 
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player); 
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT COUNT(DISTINCT Nationality) FROM people; 
SELECT COUNT(DISTINCT Nationality) FROM people; 
SELECT COUNT(DISTINCT state) FROM AREA_CODE_STATE; 
SELECT c.contestant_number, c.contestant_name  FROM CONTESTANTS c  ORDER BY c.contestant_name DESC; 
SELECT vote_id, phone_number, state FROM VOTES; 
SELECT MAX(area_code), MIN(area_code) FROM AREA_CODE_STATE; 
SELECT MAX(created) FROM VOTES WHERE state = 'CA'; 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'; 
SELECT DISTINCT state, created FROM VOTES; 
SELECT c.contestant_number, c.contestant_name  FROM CONTESTANTS c  JOIN (     SELECT contestant_number      FROM VOTES      GROUP BY contestant_number      HAVING COUNT(*) >= 2 ) v ON c.contestant_number = v.contestant_number; 
SELECT T2.contestant_number, T2.contestant_name  FROM VOTES AS T1  JOIN CONTESTANTS AS T2  ON T1.contestant_number = T2.contestant_number  WHERE T1.vote_id = (SELECT MIN(vote_id) FROM VOTES) 
SELECT COUNT(*)  FROM VOTES  JOIN AREA_CODE_STATE ON VOTES.state = AREA_CODE_STATE.state  WHERE AREA_CODE_STATE.state IN ('NY', 'CA') 
SELECT COUNT(*)  FROM CONTESTANTS  WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES); 
SELECT area_code  FROM AREA_CODE_STATE  WHERE state = (     SELECT state      FROM VOTES      GROUP BY state      ORDER BY COUNT(*) DESC      LIMIT 1 ); 
SELECT V.created, A.state, V.phone_number FROM VOTES V JOIN CONTESTANTS C ON V.contestant_number = C.contestant_number JOIN AREA_CODE_STATE A ON V.state = A.state WHERE C.contestant_name = 'Tabatha Gehling'; 
SELECT DISTINCT a.area_code FROM AREA_CODE_STATE a JOIN VOTES v ON a.state = v.state JOIN CONTESTANTS c1 ON v.contestant_number = c1.contestant_number JOIN CONTESTANTS c2 ON v.contestant_number IN (SELECT contestant_number FROM CONTESTANTS WHERE contestant_name = 'Tabatha Gehling') AND c1.contestant_number != c2.contestant_number WHERE c1.contestant_name = 'Kelly Clauss' ORDER BY a.area_code; 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'; 
SELECT Name  FROM country  WHERE IndepYear > 1950; 
SELECT Name  FROM country  WHERE IndepYear > 1950; 
SELECT COUNT(DISTINCT Code)  FROM country  WHERE GovernmentForm = 'Republic'; 
SELECT COUNT(DISTINCT Code) FROM country WHERE GovernmentForm = 'Republic'; 
SELECT SUM(`SurfaceArea`)  FROM `country`  WHERE `Region` = 'Caribbean'; 
SELECT SUM(`SurfaceArea`)  FROM country  WHERE `Region` = 'Caribbean'; 
SELECT Continent FROM country WHERE Code = 'AIA'; 
SELECT Continent FROM country WHERE Name = 'Anguilla'
SELECT `Region` FROM `country` WHERE `Code` = (SELECT `CountryCode` FROM `city` WHERE `Name` = 'Kabul'); 
SELECT Region  FROM country  WHERE Code = (SELECT CountryCode FROM city WHERE Name = 'Kabul'); 
SELECT Language  FROM countrylanguage  JOIN country ON countrylanguage.CountryCode = country.Code  WHERE country.Name = 'Aruba'  ORDER BY Percentage DESC  LIMIT 1; 
SELECT T2.Language  FROM country AS T1  JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode  JOIN city AS T3 ON T1.Code = T3.CountryCode  WHERE T1.Name = 'Aruba' AND T2.IsOfficial = 'T' AND T2.Percentage = (SELECT MAX(T2.Percentage) FROM countrylanguage AS T2 WHERE T2.CountryCode = T1.Code) 
SELECT `Population`, `LifeExpectancy` FROM `country` WHERE `Name` = 'Brazil'; 
SELECT `Population`, `LifeExpectancy` FROM `country` WHERE `Name` = 'Brazil'; 
SELECT Region, Population FROM country WHERE Name = 'Angola'; 
SELECT Region, Population  FROM country  WHERE Code = 'AGO'; 
SELECT AVG(T2.LifeExpectancy)  FROM country AS T1  JOIN city AS T2 ON T1.Code = T2.CountryCode  JOIN countrylanguage AS T3 ON T1.Code = T3.CountryCode  WHERE T1.Region = 'Central Africa'; 
SELECT AVG(`LifeExpectancy`)  FROM `country`  WHERE `Region` = 'Central Africa'; 
SELECT T1.Name  FROM country AS T1  JOIN city AS T2 ON T1.Code = T2.CountryCode  WHERE T1.Continent = 'Asia'  ORDER BY T1.LifeExpectancy ASC  LIMIT 1; 
SELECT Name  FROM country  WHERE Continent = 'Asia'  ORDER BY LifeExpectancy ASC  LIMIT 1; 
SELECT SUM(city.Population) AS TotalPopulation, MAX(country.GNP) AS MaxGNP FROM city JOIN country ON city.CountryCode = country.Code WHERE country.Continent = 'Asia'; 
SELECT COUNT(*) AS PopulationInAsia, MAX(Country.GNP) AS LargestGNPAmongAsia FROM country WHERE Continent = 'Asia'; 
SELECT AVG(T2.LifeExpectancy)  FROM countrylanguage AS T1  JOIN country AS T2 ON T1.CountryCode = T2.Code  JOIN city AS T3 ON T3.CountryCode = T2.Code  WHERE T1.IsOfficial = 'T'  AND T2.Continent = 'Africa'  AND T2.GovernmentForm = 'Republic'; 
SELECT AVG(`LifeExpectancy`)  FROM `country`  WHERE `Continent` = 'Africa' AND `GovernmentForm` = 'Republic'; 
SELECT SUM(`SurfaceArea`)  FROM `country`  WHERE `Continent` IN ('Asia', 'Europe'); 
SELECT SUM(`SurfaceArea`)  FROM `country`  WHERE `Continent` IN ('Asia', 'Europe'); 
SELECT COUNT(*)  FROM city  JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode  JOIN country ON country.Code = city.CountryCode  WHERE city.District = 'Gelderland' AND countrylanguage.IsOfficial = 'T' 
SELECT SUM(city.Population)  FROM city  JOIN country ON city.CountryCode = country.Code  WHERE country.Region = 'Netherlands' AND city.District = 'Gelderland'; 
SELECT AVG(Country.GNP), SUM(Country.Population) FROM country WHERE Country.GovernmentForm = 'US territory'; 
SELECT AVG(CASE WHEN T2.Continent = 'North America' AND T2.Region = 'United States' THEN T2.Population END) AS MeanGNP,        SUM(CASE WHEN T2.Continent = 'North America' AND T2.Region = 'United States' THEN T2.Population END) AS TotalPopulation FROM country AS T2 JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T3.Language = 'English' AND T3.IsOfficial = 'T' 
SELECT COUNT(DISTINCT Language)  FROM countrylanguage; 
SELECT COUNT(DISTINCT Language) FROM countrylanguage; 
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'; 
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'; 
SELECT SUM(T3.Percentage) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode JOIN countrylanguage AS T3 ON T1.Code = T3.CountryCode WHERE T1.Name = 'Aruba' 
SELECT COUNT(*)  FROM countrylanguage  JOIN country ON countrylanguage.CountryCode = country.Code  WHERE country.Name = 'Aruba'  AND countrylanguage.IsOfficial = 'T'; 
SELECT COUNT(*)  FROM countrylanguage  WHERE CountryCode = 'AFG' AND IsOfficial = 'T' 
SELECT COUNT(*)  FROM countrylanguage  WHERE CountryCode = 'AFG' AND IsOfficial = 'T' 
SELECT c.Name  FROM country c JOIN (     SELECT cl.CountryCode, COUNT(DISTINCT cl.Language) AS LanguageCount     FROM countrylanguage cl     GROUP BY cl.CountryCode     ORDER BY LanguageCount DESC     LIMIT 1 ) AS lang_count ON c.Code = lang_count.CountryCode 
SELECT c.Name  FROM country c  JOIN (     SELECT CountryCode, COUNT(*) AS LanguageCount      FROM countrylanguage      GROUP BY CountryCode      ORDER BY LanguageCount DESC      LIMIT 1 ) AS lang_count ON c.Code = lang_count.CountryCode; 
SELECT Continent  FROM country  JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  GROUP BY Continent  ORDER BY COUNT(DISTINCT Language) DESC  LIMIT 1; 
SELECT Continent FROM country WHERE Code IN (     SELECT CountryCode     FROM countrylanguage     GROUP BY CountryCode     HAVING COUNT(DISTINCT Language) >= ALL (         SELECT COUNT(DISTINCT Language)         FROM countrylanguage         GROUP BY CountryCode     ) ) ORDER BY Continent ASC LIMIT 1; 
SELECT COUNT(DISTINCT country.Code) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'T' AND EXISTS (     SELECT 1     FROM countrylanguage AS dutch_lang     WHERE dutch_lang.CountryCode = country.Code     AND dutch_lang.Language = 'Dutch'     AND dutch_lang.IsOfficial = 'T' ); 
SELECT COUNT(DISTINCT country.Code) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE (countrylanguage.Language = 'English' OR countrylanguage.Language = 'Dutch') AND (countrylanguage.IsOfficial = 'T'); 
SELECT c.Name  FROM country c  JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode AND cl1.Language = 'English' AND cl1.IsOfficial = 'T'  JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode AND cl2.Language = 'French' AND cl2.IsOfficial = 'T' WHERE cl1.CountryCode = cl2.CountryCode 
SELECT DISTINCT c.Name  FROM country c  JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode AND cl1.Language = 'English' AND cl1.IsOfficial = 'T'  JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode AND cl2.Language = 'French' AND cl2.IsOfficial = 'T'; 
SELECT c.Name  FROM country c JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode AND cl1.Language = 'English' AND cl1.IsOfficial = 'T' JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode AND cl2.Language = 'French' AND cl2.IsOfficial = 'T' WHERE cl1.CountryCode = cl2.CountryCode; 
SELECT c.Name  FROM country c  JOIN countrylanguage cl ON c.Code = cl.CountryCode  WHERE cl.Language IN ('English', 'French') AND cl.IsOfficial = 'T' 
SELECT COUNT(DISTINCT c.Continent) FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'Chinese' AND cl.IsOfficial = 'T'; 
SELECT COUNT(DISTINCT c.Continent) FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode JOIN city AS ct ON c.Code = ct.CountryCode WHERE cl.Language = 'Chinese' AND c.GovernmentForm LIKE '%Chinese%'; 
SELECT DISTINCT c.Region  FROM country AS c  JOIN countrylanguage AS cl ON c.Code = cl.CountryCode  WHERE cl.Language IN ('English', 'Dutch') AND cl.IsOfficial = 'T' 
SELECT DISTINCT c.Region FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('Dutch', 'English') AND cl.IsOfficial = 'T' 
SELECT DISTINCT T1.Name  FROM country AS T1  JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode  WHERE T2.Language IN ('English', 'Dutch') AND T2.IsOfficial = 'T' 
SELECT DISTINCT T1.Name  FROM country AS T1  JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode  WHERE T2.Language IN ('English', 'Dutch') AND T2.IsOfficial = 'T' 
SELECT Language  FROM countrylanguage  JOIN country ON countrylanguage.CountryCode = country.Code  WHERE Continent = 'Asia'  GROUP BY Language  ORDER BY Percentage DESC  LIMIT 1; 
SELECT Language  FROM countrylanguage  JOIN country ON countrylanguage.CountryCode = country.Code  WHERE Continent = 'Asia'  GROUP BY Language  ORDER BY SUM(CASE WHEN IsOfficial = 'T' THEN Percentage ELSE 0 END) DESC  LIMIT 1; 
SELECT cl.Language  FROM countrylanguage cl  JOIN country c ON cl.CountryCode = c.Code  WHERE c.GovernmentForm = 'Republic' AND cl.IsOfficial = 'T'  GROUP BY cl.Language  HAVING COUNT(DISTINCT cl.CountryCode) = 1; 
SELECT Language FROM countrylanguage WHERE IsOfficial = 'T' AND CountryCode IN (     SELECT Code     FROM country     WHERE GovernmentForm = 'Republic'     GROUP BY Code     HAVING COUNT(*) = 1 ) 
SELECT c.Name  FROM city c  JOIN countrylang cl ON c.CountryCode = cl.CountryCode  WHERE cl.Language = 'English' AND c.Population = (SELECT MAX(Population) FROM city) 
SELECT c.Name AS MostPopulousCity, COUNT(*) AS EnglishSpeakersCount FROM city c JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode WHERE cl.Language = 'English' AND cl.IsOfficial = 'T' GROUP BY c.ID ORDER BY EnglishSpeakersCount DESC LIMIT 1; 
SELECT c.Name, c.Population, COALESCE(cl.LifeExpectancy, 0) AS LifeExpectancy  FROM country c  JOIN city ci ON c.Code = ci.CountryCode  JOIN countrylanguage cl ON c.Code = cl.CountryCode  WHERE c.Continent = 'Asia'  ORDER BY c.SurfaceArea DESC  LIMIT 1; 
SELECT c.Name, c.Population, c.LifeExpectancy  FROM country c  WHERE c.Continent = 'Asia'  ORDER BY c.Population DESC  LIMIT 1; 
SELECT AVG(c.LifeExpectancy) FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' AND cl.IsOfficial <> 'T' 
SELECT AVG(T2.LifeExpectancy) FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN city AS T3 ON T3.CountryCode = T2.Code WHERE T1.Language = 'English' AND T1.IsOfficial = 'F' 
SELECT SUM(city.Population)  FROM city  JOIN country ON city.CountryCode = country.Code  JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'F' 
SELECT COUNT(*)  FROM country c  WHERE c.Code NOT IN (     SELECT cl.CountryCode      FROM countrylanguage cl      WHERE cl.Language = 'English' AND cl.IsOfficial = 'T' ) 
SELECT T2.Language  FROM country AS T1  JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode  WHERE T1.HeadOfState = 'Beatrix' AND T2.IsOfficial = 'T' 
SELECT T3.Language FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode JOIN countrylanguage AS T3 ON T1.Code = T3.CountryCode WHERE T1.HeadOfState = 'Beatrix' AND T3.IsOfficial = 'T'; 
SELECT COUNT(DISTINCT Language) FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.IndepYear < 1930 AND countrylanguage.IsOfficial = 'T'; 
SELECT COUNT(DISTINCT Language) FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.IndepYear < 1930 AND countrylanguage.IsOfficial = 'T'; 
SELECT c.Name  FROM country c  WHERE c.Continent <> 'Europe' AND c.SurfaceArea > (     SELECT MAX(c2.SurfaceArea)      FROM country c2      WHERE c2.Continent = 'Europe' ) 
SELECT Name FROM country WHERE Continent != 'Europe' AND SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe'); 
SELECT c.Name  FROM country c  JOIN city ci ON c.Code = ci.CountryCode  WHERE c.Continent = 'Africa' AND ci.Population < (SELECT MAX(Population) FROM city WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Asia')) 
SELECT c.Name  FROM country c  JOIN city ci ON c.Code = ci.CountryCode  WHERE c.Continent = 'Africa' AND ci.Population <      (SELECT MIN(Population) FROM city WHERE CountryCode IN          (SELECT Code FROM country WHERE Continent = 'Asia')) 
SELECT Country.Name  FROM country  WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa') 
SELECT c.Name FROM country c JOIN city ci ON c.Code = ci.CountryCode WHERE c.Continent = 'Asia' AND ci.Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa') ORDER BY c.Population DESC; 
SELECT T1.Code  FROM country AS T1  JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode  WHERE T2.Language = 'English' AND T2.IsOfficial = 'F'  LIMIT 1; -- Adjust LIMIT based on expected number of results 
SELECT T2.Code  FROM countrylanguage AS T1  JOIN country AS T2 ON T1.CountryCode = T2.Code  WHERE T1.Language = 'English' AND T1.IsOfficial = 'T'  EXCEPT  SELECT T2.Code  FROM countrylanguage AS T1  JOIN country AS T2 ON T1.CountryCode = T2.Code  WHERE T1.Language = 'English' AND T1.IsOfficial = 'F'; 
SELECT T2.Code  FROM countrylanguage AS T1  JOIN country AS T2 ON T1.CountryCode = T2.Code  WHERE T1.Language != 'English' AND T1.IsOfficial = 'T' 
SELECT T1.Code  FROM country AS T1  JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode  WHERE T2.Language <> 'English' AND T2.IsOfficial = 'T' 
SELECT T1.Code  FROM country AS T1  JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode  WHERE T2.Language = 'English' AND T2.IsOfficial = 'T' AND T1.GovernmentForm != 'Republic' 
SELECT DISTINCT c.Code  FROM country AS c WHERE NOT EXISTS (     SELECT 1      FROM countrylanguage AS cl      WHERE cl.CountryCode = c.Code AND cl.Language = 'English' AND cl.IsOfficial = 'T' ) AND c.GovernmentForm != 'Republic' 
SELECT c.Name  FROM city c  JOIN country co ON c.CountryCode = co.Code  JOIN countrylanguage cl ON co.Code = cl.CountryCode  WHERE co.Continent = 'Europe' AND cl.Language = 'English' AND cl.IsOfficial = 'F' 
SELECT c.Name  FROM city c  JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode  JOIN country co ON c.CountryCode = co.Code  WHERE co.Continent = 'Europe' AND cl.Language = 'English' AND cl.IsOfficial = 'F' 
SELECT DISTINCT c.Name  FROM city c  JOIN country co ON c.CountryCode = co.Code  JOIN countrylanguage cl ON co.Code = cl.CountryCode  WHERE co.Region = 'Asia' AND cl.Language = 'Chinese' AND cl.IsOfficial = 'T'; 
SELECT DISTINCT T1.Name  FROM city AS T1  JOIN country AS T2 ON T1.CountryCode = T2.Code  JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode  WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T' 
SELECT Name, IndepYear, SurfaceArea  FROM country  WHERE Population = (SELECT MIN(Population) FROM country); 
SELECT Name, IndepYear, SurfaceArea FROM country WHERE Population = (SELECT MIN(Population) FROM country); 
SELECT c.Population, c.Name, cs.HeadOfState FROM country c JOIN city ci ON c.Code = ci.CountryCode JOIN countrylanguage cl ON c.Code = cl.CountryCode JOIN (SELECT Code FROM country ORDER BY SurfaceArea DESC LIMIT 1) AS max_area_country ON c.Code = max_area_country.Code WHERE c.Code = max_area_country.Code; 
SELECT c.Name, c.Population, COALESCE(h.HeadOfState, 'Unknown')  FROM country c  JOIN (     SELECT Code, MAX(SurfaceArea) AS max_area      FROM country  ) m ON c.SurfaceArea = m.max_area AND c.Code = m.Code  LEFT JOIN country AS h ON c.Code = h.Code  WHERE m.max_area IS NOT NULL; 
SELECT c.Name, COUNT(DISTINCT cl.Language) AS NumberOfLanguages FROM country c JOIN city ci ON c.Code = ci.CountryCode JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Code HAVING COUNT(DISTINCT cl.Language) >= 3; 
SELECT c.Name, COUNT(DISTINCT cl.Language) AS NumberOfLanguages FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Code, c.Name HAVING COUNT(DISTINCT cl.Language) > 2; 
SELECT District, COUNT(*) AS NumberOfCities FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District; 
SELECT District, COUNT(*) AS NumberOfCities FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District; 
SELECT GovernmentForm, AVG(LifeExpectancy) AS AverageLifeExpectancy, SUM(Population) AS TotalPopulation FROM country WHERE LifeExpectancy > 72 GROUP BY GovernmentForm; 
SELECT      GovernmentForm,      SUM(Population) AS TotalPopulation FROM      country WHERE      LifeExpectancy > 72 GROUP BY      GovernmentForm; 
SELECT Continent, AVG(LifeExpectancy), SUM(Population) FROM country WHERE LifeExpectancy < 72 GROUP BY Continent; 
SELECT Continent, SUM(Population) AS TotalPopulation, AVG(CASE WHEN LifeExpectancy IS NOT NULL THEN LifeExpectancy ELSE 0 END) AS AverageLifeExpectancy FROM country WHERE Continent IN (SELECT Continent FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72) GROUP BY Continent; 
SELECT Name, SurfaceArea  FROM country  ORDER BY SurfaceArea DESC  LIMIT 5; 
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5; 
SELECT Name FROM country ORDER BY Population DESC LIMIT 3 
SELECT Name FROM country ORDER BY Population DESC LIMIT 3 
SELECT Name  FROM country  WHERE Population IN (SELECT MIN(Population), Code FROM country ORDER BY Population ASC LIMIT 3) 
SELECT Name  FROM country  ORDER BY Population ASC  LIMIT 3; 
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'; 
SELECT COUNT(DISTINCT Code) FROM country WHERE Continent = 'Asia'; 
SELECT c.Name  FROM country c  JOIN city ci ON c.Code = ci.CountryCode  WHERE c.Continent = 'Europe' AND ci.Population >= 80000; 
SELECT c.Name  FROM country c  JOIN city ci ON c.Code = ci.CountryCode  WHERE c.Continent = 'Europe' AND ci.Population = 80000; 
SELECT SUM(country.Population) AS TotalPopulation, AVG(country.SurfaceArea) AS AverageArea FROM country JOIN city ON country.Code = city.CountryCode WHERE country.Continent = 'North America' AND country.SurfaceArea > 3000; 
SELECT SUM(country.Population) AS TotalPopulation, AVG(country.SurfaceArea) AS AverageSurfaceArea FROM country WHERE country.Continent = 'North America' AND country.SurfaceArea > 3000; 
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000; 
SELECT Name  FROM city  WHERE Population BETWEEN 160000 AND 900000; 
SELECT Language  FROM countrylanguage  GROUP BY Language  ORDER BY COUNT(DISTINCT CountryCode) DESC  LIMIT 1; 
SELECT Language  FROM countrylanguage  GROUP BY Language  ORDER BY COUNT(DISTINCT CountryCode) DESC  LIMIT 1; 
SELECT      c.Name AS Country,     cl.Language,     cl.Percentage * 100 AS PercentageInCountry FROM      country c JOIN      (SELECT          cl.CountryCode,         cl.Language,         MAX(cl.Percentage) AS MaxPercentage      FROM           countrylanguage cl      GROUP BY           cl.CountryCode) subq ON      c.Code = subq.CountryCode JOIN      countrylanguage cl ON      subq.CountryCode = cl.CountryCode AND      subq.MaxPercentage = cl.Percentage ORDER BY      c.Name,      cl.Percentage DESC; 
SELECT      cl.CountryCode,     l.Language,     MAX(cl.Percentage) AS MaxPercentage FROM      countrylanguage cl GROUP BY      cl.CountryCode HAVING      cl.Percentage = (         SELECT              MAX(p.Percentage)         FROM              (SELECT                   cl.Percentage              FROM                   countrylanguage cl              WHERE                   cl.CountryCode = clg.CountryCode              ORDER BY                   cl.Percentage DESC              LIMIT 1) p     ); 
SELECT COUNT(*)  FROM countrylanguage  WHERE Language = 'Spanish' AND Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish') 
SELECT COUNT(DISTINCT CountryCode) FROM countrylanguage WHERE Language = 'Spanish' AND IsOfficial = 'T'; 
SELECT T1.Code FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Spanish' AND T2.Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish') 
SELECT cl.CountryCode  FROM countrylanguage cl  JOIN country c ON cl.CountryCode = c.Code  WHERE cl.Language = 'Spanish' AND cl.Percentage >= 50; 
SELECT COUNT(*) FROM conductor; 
SELECT COUNT(*) FROM conductor; 
SELECT Name FROM conductor ORDER BY Age ASC; 
SELECT Name FROM conductor ORDER BY Age; 
SELECT Name FROM conductor WHERE Nationality != 'USA'; 
SELECT Name FROM conductor WHERE Nationality != 'USA'; 
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC; 
SELECT Record_Company  FROM orchestra  ORDER BY Year_of_Founded DESC; 
SELECT AVG(Attendance) FROM show; 
SELECT AVG(Attendance) FROM show; 
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'; 
SELECT MAX("Share") AS max_share, MIN("Share") AS min_share FROM "performance" WHERE "Type" <> 'Live final'; 
SELECT COUNT(DISTINCT Nationality) FROM conductor; 
SELECT COUNT(DISTINCT Nationality) FROM conductor; 
SELECT Name FROM conductor ORDER BY Year_of_Work DESC; 
SELECT Name  FROM conductor  ORDER BY Year_of_Work DESC; 
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1; 
SELECT Name  FROM conductor  WHERE Year_of_Work = (SELECT MAX(Year_of_Work) FROM conductor) 
SELECT c.Name, o.Orchestra  FROM conductor c  JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID; 
SELECT c.Name, o.Orchestra  FROM conductor c  JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID; 
SELECT T1.Name  FROM conductor AS T1  JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID  GROUP BY T1.Conductor_ID  HAVING COUNT(T2.Orchestra_ID) > 1; 
SELECT T1.Name  FROM conductor AS T1  JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID  GROUP BY T1.Conductor_ID  HAVING COUNT(T2.Orchestra_ID) > 1; 
SELECT Name  FROM conductor  WHERE Conductor_ID IN (     SELECT Conductor_ID      FROM orchestra      GROUP BY Conductor_ID      ORDER BY COUNT(*) DESC      LIMIT 1 ) 
SELECT c.Name  FROM conductor c  JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID  GROUP BY c.Conductor_ID, c.Name  ORDER BY COUNT(o.Orchestra_ID) DESC  LIMIT 1; 
SELECT c.Name  FROM conductor c  JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID  WHERE o.Year_of_Founded > 2008; 
SELECT c.Name  FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID WHERE o.Year_of_Founded > 2008; 
SELECT Record_Company, COUNT(*) AS Num_of_Orchestras FROM orchestra GROUP BY Record_Company; 
SELECT Record_Company, COUNT(*) AS Number_of_Orchestras FROM orchestra GROUP BY Record_Company; 
SELECT Major_Record_Format, COUNT(*) AS Count FROM orchestra GROUP BY Major_Record_Format ORDER BY Count ASC; 
SELECT Major_Record_Format, COUNT(*) AS Frequency FROM orchestra GROUP BY Major_Record_Format ORDER BY Frequency DESC; 
SELECT Record_Company  FROM orchestra  GROUP BY Record_Company  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT Record_Company  FROM orchestra  GROUP BY Record_Company  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance) 
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance) 
SELECT Record_Company  FROM orchestra WHERE Year_of_Founded < 2003 UNION SELECT Record_Company  FROM orchestra WHERE Year_of_Founded > 2003; 
SELECT DISTINCT Record_Company  FROM orchestra  WHERE Year_of_Founded < 2003  INTERSECT  SELECT Record_Company  FROM orchestra  WHERE Year_of_Founded > 2003; 
SELECT COUNT(*)  FROM orchestra  WHERE Major_Record_Format IN ('CD', 'DVD') 
SELECT COUNT(*)  FROM orchestra  WHERE Major_Record_Format IN ('CD', 'DVD'); 
SELECT DISTINCT Year_of_Founded  FROM orchestra  WHERE Orchestra_ID IN (     SELECT Orchestra_ID      FROM performance      GROUP BY Orchestra_ID      HAVING COUNT(Performance_ID) > 1 ) 
SELECT T2.Year_of_Founded  FROM performance AS T1  JOIN orchestra AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID  GROUP BY T1.Orchestra_ID  HAVING COUNT(T1.Performance_ID) > 1; 
SELECT COUNT(*) FROM Highschooler; 
SELECT COUNT(*) FROM Highschooler; 
SELECT name, grade FROM Highschooler; 
SELECT name, grade FROM Highschooler;
SELECT grade FROM Highschooler;
SELECT name, grade FROM Highschooler;
SELECT grade FROM Highschooler WHERE name = 'Kyle';
SELECT grade FROM Highschooler WHERE name = 'Kyle'; 
SELECT name FROM Highschooler WHERE grade = 10;
SELECT name FROM Highschooler WHERE grade = 10;
SELECT ID FROM Highschooler WHERE name = 'Kyle'; 
SELECT ID FROM Highschooler WHERE name = 'Kyle';
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10); 
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10); 
SELECT grade, COUNT(*) AS num_highschoolers FROM Highschooler GROUP BY grade; 
SELECT grade, COUNT(*) AS num_highschoolers FROM Highschooler GROUP BY grade; 
SELECT grade, COUNT(*) AS num_highschoolers FROM Highschooler GROUP BY grade ORDER BY num_highschoolers DESC LIMIT 1; 
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT grade  FROM Highschooler  GROUP BY grade  HAVING COUNT(*) >= 4 
SELECT grade  FROM Highschooler  GROUP BY grade  HAVING COUNT(*) >= 4 
SELECT student_id, COUNT(*) AS num_friends FROM Friend GROUP BY student_id; 
SELECT ID, COUNT(friend_id) AS num_friends FROM Friend GROUP BY ID; 
SELECT Highschooler.name, COUNT(Friend.friend_id) AS num_friends FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID; 
SELECT H.name, COUNT(F.friend_id) AS num_friends FROM Highschooler H JOIN Friend F ON H.ID = F.student_id GROUP BY H.ID, H.name; 
SELECT name FROM Highschooler WHERE ID IN (     SELECT friend_id FROM Friend GROUP BY friend_id ORDER BY COUNT(*) DESC LIMIT 1 ) UNION SELECT name FROM Highschooler WHERE ID IN (     SELECT student_id FROM Friend GROUP BY student_id ORDER BY COUNT(*) DESC LIMIT 1 ) 
SELECT name  FROM Highschooler  WHERE ID IN (     SELECT student_id      FROM Friend      GROUP BY student_id      ORDER BY COUNT(*) DESC      LIMIT 1 ) 
SELECT name  FROM Highschooler  WHERE ID IN (     SELECT student_id      FROM Friend      GROUP BY student_id      HAVING COUNT(*) >= 3 ) UNION SELECT name  FROM Highschooler  WHERE ID IN (     SELECT friend_id      FROM Friend      GROUP BY friend_id      HAVING COUNT(*) >= 3 ) 
SELECT name  FROM Highschooler  WHERE ID IN (     SELECT student_id      FROM Friend      GROUP BY student_id      HAVING COUNT(*) >= 3 ) UNION SELECT name  FROM Highschooler  WHERE ID IN (     SELECT friend_id      FROM Friend      GROUP BY friend_id      HAVING COUNT(*) >= 3 ) 
SELECT DISTINCT Highschooler.name  FROM Highschooler  JOIN Friend ON Highschooler.ID = Friend.student_id  WHERE Friend.friend_id IN (     SELECT ID      FROM Highschooler      WHERE name = 'Kyle' ) 
SELECT name FROM Highschooler WHERE ID IN (     SELECT friend_id FROM Friend WHERE student_id = (         SELECT ID FROM Highschooler WHERE name = 'Kyle'     ) ) 
SELECT COUNT(*)  FROM Friend  WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle') 
SELECT COUNT(*)  FROM Friend  WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle') 
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) UNION SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT liked_id FROM Likes) 
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) UNION SELECT DISTINCT ID FROM Highschooler WHERE ID NOT IN (SELECT liked_id FROM Likes) 
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) UNION SELECT name FROM Highschooler WHERE ID NOT IN (SELECT liked_id FROM Likes); 
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) 
SELECT DISTINCT H.ID FROM Highschooler H JOIN Friend F ON H.ID = F.student_id OR H.ID = F.friend_id JOIN Likes L ON H.ID = L.student_id OR H.ID = L.liked_id; 
SELECT DISTINCT H.ID FROM Highschooler H JOIN Friend F ON H.ID = F.student_id OR H.ID = F.friend_id JOIN Likes L ON H.ID = L.student_id OR H.ID = L.liked_id; 
SELECT DISTINCT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id OR h.ID = f.friend_id JOIN Likes l ON h.ID = l.student_id OR h.ID = l.liked_id 
SELECT DISTINCT H.name  FROM Highschooler H  JOIN Friend F ON H.ID = F.student_id  JOIN Likes L ON H.ID = L.liked_id; 
SELECT student_id, COUNT(liked_id) AS number_of_likes FROM Likes GROUP BY student_id; 
SELECT student_id, COUNT(*) AS num_likes FROM Likes GROUP BY student_id; 
SELECT H.name, COUNT(L.liked_id) AS num_likes FROM Highschooler H JOIN Likes L ON H.ID = L.liked_id GROUP BY H.ID, H.name; 
SELECT T1.name, COUNT(*) AS num_likes FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID, T1.name; 
SELECT name  FROM Highschooler  WHERE ID = (     SELECT student_id      FROM Likes      GROUP BY student_id      ORDER BY COUNT(*) DESC      LIMIT 1 ) 
SELECT name  FROM Highschooler  WHERE ID = (     SELECT liked_id      FROM Likes      GROUP BY liked_id      ORDER BY COUNT(*) DESC      LIMIT 1 ) 
SELECT DISTINCT name FROM Highschooler WHERE ID IN (     SELECT liked_id FROM Likes GROUP BY liked_id HAVING COUNT(*) >= 2 ) 
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID HAVING COUNT(T2.liked_id) >= 2 
SELECT name FROM Highschooler WHERE grade > 5 AND ID IN (     SELECT student_id     FROM Friend     GROUP BY student_id     HAVING COUNT(*) >= 2 ) 
SELECT name  FROM Highschooler  WHERE grade > 5  AND ID IN (     SELECT student_id      FROM Friend      GROUP BY student_id      HAVING COUNT(*) >= 2 ) 
SELECT COUNT(*)  FROM Likes  WHERE liked_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(*)  FROM Likes  WHERE liked_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle'); 
SELECT AVG(grade) FROM Highschooler WHERE ID IN (     SELECT student_id FROM Friend ) UNION ALL SELECT AVG(grade) FROM Highschooler WHERE ID IN (     SELECT friend_id FROM Friend ) 
SELECT AVG(grade) AS average_grade FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id OR Highschooler.ID = Friend.friend_id; 
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) 
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) 
SELECT DISTINCT `state` FROM Owners UNION SELECT DISTINCT `state` FROM Professionals 
SELECT DISTINCT O.state, P.state  FROM Owners O  JOIN Professionals P ON O.first_name = P.first_name AND O.last_name = P.last_name; 
SELECT AVG(DATEDIFF(CURRENT_DATE, Dogs.date_of_birth)) AS average_age FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id; 
SELECT AVG(DATE_PART('year', AGE(date_departed, date_arrived))) AS avg_age FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id 
SELECT p.professional_id, p.last_name, p.cell_number  FROM Professionals p  JOIN Treatments t ON p.professional_id = t.professional_id  WHERE p.state = 'Indiana' OR (SELECT COUNT(*) FROM Treatments WHERE professional_id = p.professional_id) > 2; 
SELECT p.professional_id, p.last_name, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.last_name, p.cell_number HAVING COUNT(t.treatment_id) > 2 OR p.state = 'Indiana' 
SELECT D.name FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id WHERE T.cost_of_treatment < 1000; 
SELECT D.name FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id WHERE T.cost_of_treatment <= 1000 
SELECT `first_name` FROM `Professionals` UNION SELECT `first_name` FROM `Owners` EXCEPT SELECT `name` FROM `Dogs` 
SELECT DISTINCT first_name  FROM Professionals  UNION  SELECT DISTINCT first_name  FROM Owners  EXCEPT  SELECT DISTINCT name  FROM Dogs; 
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (     SELECT professional_id     FROM Treatments ) 
SELECT professional_id, role_code, email_address  FROM Professionals  WHERE professional_id NOT IN (SELECT professional_id FROM Treatments); 
SELECT `owner_id`, `first_name`, `last_name` FROM `Owners` JOIN `Dogs` ON `Owners.owner_id` = `Dogs.owner_id` GROUP BY `owner_id`, `first_name`, `last_name` ORDER BY COUNT(`Dogs.dog_id`) DESC LIMIT 1; 
SELECT T1.owner_id, T1.first_name, T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id GROUP BY T1.owner_id, T1.first_name, T1.last_name ORDER BY COUNT(T2.dog_id) DESC LIMIT 1; 
SELECT p.professional_id, p.role_code, p.first_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.role_code, p.first_name HAVING COUNT(t.treatment_id) >= 2; 
SELECT p.professional_id, p.role_code, p.first_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.role_code, p.first_name HAVING COUNT(t.treatment_id) >= 2; 
SELECT T1.breed_name  FROM Breeds AS T1  JOIN Dogs AS T2 ON T1.breed_code = T2.breed_code  GROUP BY T1.breed_name  ORDER BY COUNT(T2.dog_id) DESC  LIMIT 1; 
SELECT T1.breed_name FROM Breeds AS T1 JOIN Dogs AS T2 ON T1.breed_code = T2.breed_code GROUP BY T1.breed_name ORDER BY COUNT(T2.dog_id) DESC LIMIT 1; 
SELECT T1.owner_id, T2.last_name FROM Dogs AS T1 JOIN Owners AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T1.dog_id = T3.dog_id GROUP BY T1.owner_id, T2.last_name ORDER BY SUM(T3.cost_of_treatment) DESC LIMIT 1; 
SELECT T.Owner_id, T.Last_name FROM Owners O JOIN (     SELECT Dog_id, SUM(Cost_of_treatment) AS Total_spent     FROM Treatments     GROUP BY Dog_id ) TT ON O.Owner_id = TT.Dog_id JOIN Dogs D ON D.Owner_id = O.Owner_id WHERE TT.Total_spent = (     SELECT MAX(Total_spent)     FROM (         SELECT SUM(Cost_of_treatment) AS Total_spent         FROM Treatments T2         JOIN Dogs D2 ON D2.Owner_id = T2.Dog_id         GROUP BY D2.Owner_id     ) ) 
SELECT t.treatment_type_description  FROM Treatment_Types t  JOIN Treatments tr ON t.treatment_type_code = tr.treatment_type_code  GROUP BY t.treatment_type_code  ORDER BY SUM(tr.cost_of_treatment) ASC  LIMIT 1; 
SELECT t.treatment_type_description  FROM Treatment_Types t  JOIN Treatments tr ON t.treatment_type_code = tr.treatment_type_code  GROUP BY t.treatment_type_code, t.treatment_type_description  ORDER BY SUM(tr.cost_of_treatment) ASC  LIMIT 1; 
SELECT `Owners`.`owner_id`, `Owners`.`zip_code` FROM `Owners` JOIN `Dogs` ON `Owners`.`owner_id` = `Dogs`.`owner_id` JOIN `Treatments` ON `Dogs`.`dog_id` = `Treatments`.`dog_id` GROUP BY `Owners`.`owner_id`, `Owners`.`zip_code` ORDER BY SUM(`Treatments`.`cost_of_treatment`) DESC LIMIT 1; 
SELECT O.owner_id, O.zip_code FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY O.owner_id, O.zip_code ORDER BY SUM(T.cost_of_treatment) DESC LIMIT 1; 
SELECT T.Professional_id, T.Cell_number FROM Treatments AS T JOIN Treatment_Types AS TT ON T.Treatment_type_code = TT.Treatment_type_code GROUP BY T.Professional_id HAVING COUNT(TT.Treatment_type_code) >= 2; 
SELECT p.professional_id, p.cell_number FROM Professionals p JOIN (     SELECT treatment_type_code, COUNT(*) AS treatment_count     FROM Treatments     GROUP BY treatment_type_code     HAVING COUNT(*) >= 2 ) t ON p.professional_id = t.treatment_type_code GROUP BY p.professional_id, p.cell_number HAVING COUNT(DISTINCT t.treatment_type_code) >= 2; 
SELECT P.first_name, P.last_name FROM Professionals P JOIN Treatments T ON P.professional_id = T.professional_id WHERE T.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments) 
SELECT p.first_name, p.last_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments) 
SELECT T.date_of_treatment, P.first_name FROM Treatments AS T JOIN Professionals AS P ON T.professional_id = P.professional_id; 
SELECT t.date_of_treatment, p.first_name FROM Treatments t JOIN Professionals p ON t.professional_id = p.professional_id; 
SELECT t.cost_of_treatment, tt.treatment_type_description  FROM Treatments t  JOIN Treatment_Types tt ON t.treatment_type_code = tt.treatment_type_code; 
SELECT T.cost_of_treatment, TT.treatment_type_description FROM Treatments T JOIN Treatment_Types TT ON T.treatment_type_code = TT.treatment_type_code; 
SELECT O.first_name, O.last_name, S.size_description FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Sizes S ON D.size_code = S.size_code; 
SELECT O.first_name, O.last_name, D.size_code FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id 
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id; 
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id; 
SELECT D.name, T.date_of_treatment FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id JOIN Breeds B ON D.breed_code = B.breed_code WHERE B.breed_name IN (     SELECT breed_name     FROM Breeds     GROUP BY breed_name     ORDER BY COUNT(*) DESC     LIMIT 1 ) ORDER BY T.date_of_treatment; 
SELECT D.name, T.date_of_treatment FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id JOIN Breeds B ON D.breed_code = B.breed_code WHERE B.breed_name IN (     SELECT breed_name     FROM Breeds     GROUP BY breed_name     HAVING COUNT(*) < 2 ) ORDER BY T.date_of_treatment ASC; 
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id WHERE Owners.state = 'Virginia'; 
SELECT O.first_name, D.name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id WHERE O.state = 'Virginia' 
SELECT D.date_arrived, D.date_departed FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id; 
SELECT T.Dogs.date_arrived, T.Dogs.date_departed FROM Treatments T JOIN Dogs D ON T.Dog_id = D.dog_id; 
SELECT T2.last_name FROM Dogs AS T1 JOIN Owners AS T2 ON T1.owner_id = T2.owner_id WHERE T1.age = (SELECT MIN(age) FROM Dogs) 
SELECT `last_name` FROM `Owners` JOIN `Dogs` ON `Owners.owner_id` = `Dogs.owner_id` WHERE `age` = (SELECT MIN(`age`) FROM `Dogs`); 
SELECT email_address  FROM Professionals  WHERE state = 'Hawaii' OR state = 'Wisconsin'; 
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'; 
SELECT date_arrived, date_departed FROM Dogs; 
SELECT date_arrived, date_departed FROM Dogs; 
SELECT COUNT(*) FROM Treatments; 
SELECT COUNT(*) FROM Treatments; 
SELECT COUNT(DISTINCT professional_id) AS number_of_professionals FROM Treatments; 
SELECT COUNT(DISTINCT professional_id)  FROM Treatments; 
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'; 
SELECT      Professionals.role_code,     Professionals.street,     Professionals.city,     Professionals.state FROM      Professionals WHERE      Professionals.city LIKE '%West%'; 
SELECT O.first_name, O.last_name, O.email_address FROM Owners O WHERE O.state LIKE '%North%' 
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%' 
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs); 
SELECT COUNT(*)  FROM Dogs  WHERE age < (SELECT AVG(age) FROM Dogs) 
SELECT MAX(cost_of_treatment) AS max_treatment_cost FROM Treatments; 
SELECT MAX(cost_of_treatment) AS max_cost FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1; 
SELECT COUNT(*)  FROM Dogs  WHERE dog_id NOT IN (SELECT dog_id FROM Treatments) 
SELECT COUNT(*)  FROM Dogs  WHERE dog_id NOT IN (SELECT dog_id FROM Treatments); 
SELECT COUNT(*)  FROM Owners  WHERE owner_id NOT IN (SELECT DISTINCT owner_id FROM Dogs WHERE abandoned_yn = 'N') AND owner_id NOT IN (SELECT DISTINCT owner_id FROM Dogs WHERE abandoned_yn = 'Y') 
SELECT COUNT(*)  FROM Owners  WHERE owner_id NOT IN (SELECT owner_id FROM Dogs) 
SELECT COUNT(*)  FROM Professionals  WHERE professional_id NOT IN (     SELECT professional_id      FROM Treatments ) 
SELECT COUNT(*)  FROM Professionals  WHERE professional_id NOT IN (     SELECT professional_id      FROM Treatments ) 
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'; 
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'; 
SELECT AVG(DATEDIFF(CURRENT_DATE, date_of_birth) / 365) AS average_age FROM Dogs; 
SELECT AVG(DATEDIFF(CURRENT_DATE, date_of_birth) / 365) AS average_age FROM Dogs; 
SELECT MAX(age) AS oldest_age FROM Dogs;
SELECT MAX(age) AS oldest_age FROM Dogs; 
SELECT `charge_type`, `charge_amount` FROM `Charges`; 
SELECT charge_type, charge_amount FROM Charges; 
SELECT MAX(`charge_amount`) AS max_charge FROM `Charges` WHERE `charge_amount` IS NOT NULL; 
SELECT MAX(`charge_amount`) AS `most_expensive_charge` FROM `Charges` WHERE `charge_amount` = (SELECT MAX(`charge_amount`) FROM `Charges`); 
SELECT email_address, cell_number, home_phone FROM Professionals; 
SELECT email_address, home_phone, cell_number FROM Professionals; 
SELECT DISTINCT      B.breed_name,     S.size_description FROM      Breeds B JOIN      Sizes S ON B.breed_code = S.size_code; 
SELECT DISTINCT D.breed_code, S.size_code  FROM Dogs D  JOIN Breeds B ON D.breed_code = B.breed_code  JOIN Sizes S ON D.size_code = S.size_code; 
SELECT P.first_name, T.treatment_type_description FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id; 
SELECT P.first_name, TT.treatment_type_description FROM Professionals P JOIN Treatments T ON P.professional_id = T.professional_id JOIN Treatment_Types TT ON T.treatment_type_code = TT.treatment_type_code; 
SELECT COUNT(*) FROM singer;
SELECT COUNT(*) FROM singer; 
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC; 
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC; 
SELECT Birth_Year, Citizenship FROM singer;
SELECT Birth_Year, Citizenship FROM singer; 
SELECT Name FROM singer WHERE Citizenship <> 'France'; 
SELECT Name  FROM singer  WHERE Citizenship <> 'France' 
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949); 
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949); 
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1;
SELECT Name FROM singer WHERE Net_Worth_Millions = (SELECT MAX(Net_Worth_Millions) FROM singer) 
SELECT Citizenship, COUNT(*) AS NumberOfSingers FROM singer GROUP BY Citizenship; 
SELECT Citizenship, COUNT(*) AS NumberOfSingers FROM singer GROUP BY Citizenship; 
SELECT Citizenship, COUNT(*) AS Count  FROM singer  GROUP BY Citizenship  ORDER BY Count DESC  LIMIT 1; 
SELECT Citizenship  FROM singer  GROUP BY Citizenship  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT Citizenship, MAX(Net_Worth_Millions) AS Max_Net_Worth FROM singer GROUP BY Citizenship; 
SELECT Citizenship, MAX(Net_Worth_Millions)  FROM singer  GROUP BY Citizenship; 
SELECT song.Title, singer.Name  FROM song  JOIN singer ON song.Singer_ID = singer.Singer_ID; 
SELECT s.Title, sn.Name  FROM song s JOIN singer sn ON s.Singer_ID = sn.Singer_ID; 
SELECT DISTINCT T1.Name  FROM singer AS T1  JOIN song AS T2  ON T1.Singer_ID = T2.Singer_ID  WHERE T2.Sales > 300000; 
SELECT DISTINCT Name  FROM singer  JOIN song ON singer.Singer_ID = song.Singer_ID  WHERE song.Sales > 300000; 
SELECT s.Name  FROM singer s JOIN song sg ON s.Singer_ID = sg.Singer_ID GROUP BY s.Singer_ID HAVING COUNT(*) > 1; 
SELECT s.Name  FROM singer s JOIN song sg ON s.Singer_ID = sg.Singer_ID GROUP BY s.Singer_ID HAVING COUNT(sg.Song_ID) > 1; 
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name; 
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name; 
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song); 
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song); 
SELECT Citizenship  FROM singer  WHERE Birth_Year < 1945 AND Birth_Year > 1955; 
SELECT Citizenship  FROM singer  WHERE Birth_Year < 1945 AND Birth_Year > 1955; 
SELECT COUNT(*) FROM Other_Available_Features;
SELECT feature_type_name FROM Ref_Feature_Types WHERE feature_type_code = 'Amenity'; 
SELECT `property_type_description` FROM `Ref_Property_Types` WHERE `property_type_code` IN (SELECT `property_type_code`                                FROM `Properties`); 
SELECT p.property_name  FROM Properties p JOIN Ref_Property_Types rtp ON p.property_type_code = rtp.property_type_code WHERE rtp.property_type_description IN ('House', 'Apartment') AND p.room_count > 1; 
