SELECT COUNT(*) AS "Number of Singers" FROM singer; 
SELECT COUNT(Singer_ID) AS Total_Singers FROM singer; 
SELECT s.Name, s.Country, s.Age FROM singer s ORDER BY s.Age DESC; 
SELECT s.Name, s.Country, s.Age FROM singer s ORDER BY s.Age DESC; 
SELECT AVG(`Age`) AS Average_Age, MIN(`Age`) AS Min_Age, MAX(`Age`) AS Max_Age FROM singer WHERE `Country` = 'France'; 
SELECT AVG(Age) AS Average_Age, MIN(Age) AS Minimum_Age, MAX(Age) AS Maximum_Age FROM singer WHERE Country = 'France'; 
SELECT s.Song_Name, s.Song_release_year FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE s.Age = (SELECT MIN(Age) FROM singer) 
SELECT s.Song_Name, s.Song_release_year FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE s.Age = (SELECT MIN(Age) FROM singer) 
SELECT DISTINCT Country FROM singer WHERE Age > 20;
SELECT DISTINCT Country FROM singer WHERE Age > 20; 
SELECT Country, COUNT(*) AS Singer_Count FROM singer GROUP BY Country; 
SELECT Country, COUNT(*) AS Singer_count FROM singer GROUP BY Country; 
SELECT s.Song_Name FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE s.Age > (SELECT AVG(Age) FROM singer) 
SELECT s.Song_Name FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE s.Age > (SELECT AVG(Age) FROM singer) 
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000; 
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000; 
-- Maximum capacity of all stadiums SELECT MAX("Capacity") AS max_capacity FROM stadium;  -- Average of all stadiums' capacities SELECT AVG("Capacity") AS avg_capacity FROM stadium; 
SELECT AVG(Stadium.Capacity) AS AverageCapacity, MAX(Stadium.Capacity) AS MaximumCapacity FROM stadium; 
SELECT s.Name, s.Capacity FROM stadium s JOIN (     SELECT Stadium_ID, AVG(Capacity) AS avg_capacity     FROM stadium     GROUP BY Stadium_ID     ORDER BY avg_capacity DESC     LIMIT 1 ) sc ON s.Stadium_ID = sc.Stadium_ID; 
SELECT s.Name AS Stadium_Name, s.Capacity AS Stadium_Capacity FROM stadium s JOIN (     SELECT Stadium_ID, AVG(Average) AS Average_Attendance     FROM stadium     GROUP BY Stadium_ID     ORDER BY Average_Attendance DESC     LIMIT 1 ) max_avg_stadium ON s.Stadium_ID = max_avg_stadium.Stadium_ID; 
SELECT COUNT(*) AS Total_Congress FROM concert WHERE Year IN ('2014', '2015'); 
SELECT COUNT(*) as num_concerts FROM concert WHERE Year IN ('2014', '2015'); 
SELECT stadium.Name, COUNT(concert.concert_ID) AS ConcertCount FROM stadium JOIN concert_in_concert ON stadium.Stadium_ID = concert_in_concert.Stadium_ID GROUP BY stadium.Stadium_ID, stadium.Name; 
SELECT s.Stadium_ID, COUNT(*) AS Concerts FROM stadium s JOIN singer_in_concert sic ON s.Stadium_ID = sic.Stadium_ID GROUP BY s.Stadium_ID; 
SELECT s.Name, s.Capacity FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year >= '2014' GROUP BY s.Stadium_ID, s.Name, s.Capacity ORDER BY COUNT(c.concert_ID) DESC LIMIT 1; 
SELECT s.Name, s.Capacity FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year > '2013' GROUP BY s.Stadium_ID, s.Name, s.Capacity ORDER BY COUNT(c.concert_ID) DESC LIMIT 1; 
SELECT Year, COUNT(*) as NumConcerts FROM concert GROUP BY Year ORDER BY NumConcerts DESC LIMIT 1; 
SELECT Year, COUNT(*) as Total_Concerts FROM concert GROUP BY Year ORDER BY Total_Concerts DESC LIMIT 1; 
SELECT s.Name FROM stadium s LEFT JOIN singer_in_concert sic ON s.Stadium_ID = sic.Stadium_ID WHERE sic.concert_ID IS NULL; 
SELECT s.Name FROM stadium s LEFT JOIN singer_in_concert sic ON s.Stadium_ID = sic.Stadium_ID WHERE sic.concert_ID IS NULL; 
SELECT DISTINCT s.Country FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE s.Age > 40 AND s.Age < 30; 
SELECT DISTINCT stadium.Name FROM stadium LEFT JOIN singer_in_concert ON stadium.Stadium_ID = singer_in_concert.Stadium_ID LEFT JOIN concert ON singer_in_concert.concert_ID = concert.concert_ID WHERE concert.Year != '2014'; 
SELECT s.Name AS Stadium_Name FROM stadium s LEFT JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE YEAR(c.Year) != 2014; 
SELECT concert.concert_Name, concert.Theme, COUNT(singer.Singer_ID) AS Singer_Count FROM concert JOIN singer_in_concert ON concert.concert_ID = singer_in_concert.concert_ID JOIN singer ON singer_in_concert.Singer_ID = singer.Singer_ID GROUP BY concert.concert_ID, concert.Theme; 
SELECT concert.concert_Name, concert.Theme, COUNT(singer.Singer_ID) AS Singer_Count FROM concert JOIN singer_in_concert ON concert.concert_ID = singer_in_concert.concert_ID JOIN singer ON singer_in_concert.Singer_ID = singer.Singer_ID GROUP BY concert.concert_ID, concert.concert_Name, concert.Theme; 
SELECT s.Name AS Singer_Name, COUNT(c.concert_ID) AS Concert_Count FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID GROUP BY s.Singer_ID; 
SELECT s.Name AS Singer_Name, COUNT(*) AS Concert_Count FROM singer s JOIN singer_in_concert sci ON s.Singer_ID = sci.Singer_ID GROUP BY s.Singer_ID; 
SELECT s.Name FROM singer s INNER JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID INNER JOIN concert c ON sic.concert_ID = c.concert_ID WHERE YEAR(c.Year) = 2014; 
SELECT s.Name FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE c.Year = '2014'; 
SELECT s.Name, s.Country FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE sic.Song_Name LIKE '%Hey%'; 
SELECT s.Name, s.Country FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE sic.Song_Name LIKE '%Hey%' 
SELECT s.Location, s.Name FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year IN ('2014', '2015') 
SELECT stadium.Name, stadium.Location FROM stadium INNER JOIN concert_in_concert ON stadium.Stadium_ID = concert_in_concert.Stadium_ID INNER JOIN concert ON concert_in_concert.concert_ID = concert.concert_ID WHERE concert.Year IN ('2014', '2015') 
SELECT COUNT(*) as num_concerts FROM concert JOIN stadium ON concert.Stadium_ID = stadium.Stadium_ID WHERE stadium.Capacity = (SELECT MAX(Capacity) FROM stadium); 
SELECT COUNT(*) as num_concerts FROM concert WHERE Stadium_ID IN (     SELECT Stadium_ID     FROM stadium     ORDER BY Capacity DESC     LIMIT 1 ); 
SELECT COUNT(PetID) AS Heavy_Pets FROM Pets WHERE weight > 10; 
SELECT COUNT(*) AS num_pets_greater_than_10 FROM Pets WHERE weight > 10; 
SELECT p.weight FROM Pets p JOIN Has_Pet hp ON p.PetID = hp.PetID JOIN Student s ON hp.StuID = s.StuID WHERE s.Age = (SELECT MIN(Age) FROM Student) AND p.PetType = 'dog'; 
SELECT p.pet_age FROM Pets p JOIN Has_Pet hp ON p.PetID = hp.PetID WHERE p.pet_type = 'dog' AND p.pet_age = (SELECT MIN(pet_age) FROM Pets WHERE pet_type = 'dog') 
SELECT Pets.PetType, MAX(Pets.weight) AS MaxWeight FROM Pets INNER JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID INNER JOIN Student ON Has_Pet.StuID = Student.StuID GROUP BY Pets.PetType; 
SELECT Pet.PetType, MAX(Pets.weight) AS MaxWeight FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID JOIN Student ON Has_Pet.StuID = Student.StuID GROUP BY Pet.PetType; 
SELECT COUNT(*) AS Num_Owned_Pets FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE s.Age > 20; 
SELECT COUNT(*) AS num_pets FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE s.Age > 20; 
SELECT COUNT(PetID) FROM Pets AS p JOIN Has_Pet AS hp ON p.PetID = hp.PetID JOIN Student AS s ON hp.StuID = s.StuID WHERE s.Sex = 'F' AND p.PetType = 'dog'; 
SELECT COUNT(PetID) AS Dog_Pets_Females FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID JOIN Student ON Has_Pet.StuID = Student.StuID WHERE PetType = 'dog' AND Sex = 'F'; 
SELECT COUNT(DISTINCT PetType) AS NumberOfDistinctPetTypes FROM Pets; 
SELECT COUNT(DISTINCT PetType) AS 'Number of Different Pet Types' FROM Pets; 
SELECT DISTINCT S.Fname FROM Student S INNER JOIN Has_Pet HP ON S.StuID = HP.StuID INNER JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType IN ('cat', 'dog'); 
SELECT DISTINCT S.Fname FROM Student S INNER JOIN Has_Pet HP ON S.StuID = HP.StuID INNER JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType IN ('cat', 'dog'); 
SELECT DISTINCT S.Fname FROM Student S INNER JOIN Has_Pet HP ON S.StuID = HP.StuID INNER JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' AND P.PetType = 'dog'; 
SELECT DISTINCT S.Fname, S.LName FROM Student S INNER JOIN Has_Pet HP ON S.StuID = HP.StuID INNER JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType IN ('cat', 'dog'); 
SELECT s.Major, s.Age FROM Student s LEFT JOIN Has_Pet hp ON s.StuID = hp.StuID WHERE hp.PetID NOT IN (SELECT PetID FROM Pets WHERE PetType = 'cat') 
SELECT s.Major, s.Age FROM Student s LEFT JOIN Has_Pet hp ON s.StuID = hp.StuID WHERE hp.PetID IS NULL AND s.Sex = 'F' -- Filter for female students without cats 
SELECT StuID FROM Student WHERE StuID NOT IN (     SELECT StuID     FROM Has_Pet     JOIN Pets ON Has_Pet.PetID = Pets.PetID     WHERE Pets.PetType = 'cat' ) 
SELECT StuID FROM Student WHERE StuID NOT IN (     SELECT StuID     FROM Has_Pet     JOIN Pets ON Has_Pet.PetID = Pets.PetID     WHERE Pets.PetType = 'cat' ); 
SELECT Stu.Fname, Stu.Age FROM Student Stu JOIN Has_Pet HP ON Stu.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'dog' AND P.PetID NOT IN (     SELECT PetID     FROM Has_Pet     JOIN Pets ON Has_Pet.PetID = Pets.PetID     WHERE PetType = 'cat' ) 
SELECT DISTINCT S.Fname FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'dog' AND P.PetID NOT IN (     SELECT PetID     FROM Has_Pet     WHERE PetID IN (         SELECT PetID         FROM Pets         WHERE PetType = 'cat'     ) ); 
SELECT PetType, weight FROM Pets WHERE PetID IN (     SELECT PetID     FROM Has_Pet     WHERE StuID = (         SELECT MIN(StuID)         FROM Student     ) ) ORDER BY pet_age LIMIT 1; 
SELECT Pets.PetType, Pets.weight FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.Age = (SELECT MIN(Age) FROM Student) 
SELECT p.PetID, p.weight FROM Pets p JOIN Has_Pet hp ON p.PetID = hp.PetID JOIN Student s ON hp.StuID = s.StuID WHERE p.pet_age > 1; 
SELECT p.PetID, p.weight FROM Pets p JOIN Has_Pet h ON p.PetID = h.PetID JOIN Student s ON h.StuID = s.StuID WHERE p.pet_age > 1;
SELECT PetType, AVG(pet_age) AS AverageAge, MAX(pet_age) AS MaximumAge FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID GROUP BY PetType; 
SELECT PetType, AVG(pet_age) AS AverageAge, MAX(pet_age) AS MaximumAge FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID JOIN Student ON Has_Pet.StuID = Student.StuID GROUP BY PetType; 
SELECT PetType, AVG(weight) AS AverageWeight FROM Pets GROUP BY PetType; 
SELECT PetType, AVG(weight) AS AverageWeight FROM Pets GROUP BY PetType; 
SELECT Stu.Fname, Stu.Age FROM Student Stu INNER JOIN Has_Pet HP ON Stu.StuID = HP.StuID INNER JOIN Pets P ON HP.PetID = P.PetID; 
SELECT DISTINCT S.Fname, S.Age FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID; 
SELECT DISTINCT p.PetID FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE s.LName = 'Smith'; 
SELECT DISTINCT PetID FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.LName = 'Smith'; 
SELECT StuID, COUNT(*) AS Num_Pets FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID GROUP BY StuID; 
SELECT StuID, COUNT(*) AS Num_Pets FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID GROUP BY StuID; 
SELECT Stu.Fname, Stu.Sex FROM Student Stu JOIN Has_Pet HP ON Stu.StuID = HP.StuID GROUP BY Stu.Fname, Stu.Sex HAVING COUNT(DISTINCT HP.PetID) > 1; 
SELECT S.Fname, S.Sex FROM Student S INNER JOIN Has_Pet HP ON S.StuID = HP.StuID GROUP BY S.StuID, S.Fname, S.Sex HAVING COUNT(HP.PetID) > 1; 
SELECT DISTINCT S.LName FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.pet_age = 3 AND P.PetType = 'cat'; 
SELECT DISTINCT S.LName FROM Student S INNER JOIN Has_Pet HP ON S.StuID = HP.StuID INNER JOIN Pets P ON HP.PetID = P.PetID WHERE P.pet_age = 3 AND P.PetType = 'cat'; 
SELECT AVG(Student.Age) AS Average_AgeWITHOUTPets FROM Student LEFT JOIN Has_Pet ON Student.StuID = Has_Pet.StuID WHERE Has_Pet.PetID IS NULL; 
SELECT AVG(Age) AS Average_Age_No_Pets FROM Student WHERE NOT EXISTS (     SELECT 1     FROM Has_Pet     WHERE Student.StuID = Student.StuID ); 
SELECT COUNT(*) AS ContinentCount FROM continents; 
SELECT COUNT(*) AS "Number of Continents" FROM continents; 
SELECT continents.ContId, continents.Continent, COUNT(countries.CountryId) AS CountryCount FROM continents JOIN countries ON continents.ContId = countries.Continent GROUP BY continents.ContId, continents.Continent; 
SELECT c.ContId, c.Continent, COUNT(c.CountryId) AS CountryCount FROM continents c JOIN countries co ON c.ContId = co.Continent GROUP BY c.ContId, c.Continent; 
SELECT COUNT(*) AS "Number of Countries" FROM countries; 
SELECT COUNT(*) AS CountryCount FROM countries; 
SELECT c.Maker.FullName, c.Id, COUNT(m.Model) AS ModelsProduced FROM car_makers c JOIN model_list m ON c.Id = m.Maker GROUP BY c.Id, c.FullName; 
SELECT c.FullName, c.Id, COUNT(m.Model) AS ModelCount FROM car_makers c JOIN model_list m ON c.Id = m.Maker GROUP BY c.Id, c.FullName; 
SELECT model_list.Model FROM model_list JOIN cars_data ON model_list.Id = cars_data.MakeId MINIMIZE horsepower GROUP BY model_list.Model; 
SELECT model_list.Model FROM car_names JOIN model_list ON car_names.Make = model_list.Id JOIN cars_data ON car_names.Model = cars_data.MakeId WHERE cars_data.Horsepower = (     SELECT MIN(Horsepower)     FROM cars_data ) 
SELECT m.Model FROM model_list m JOIN cars_data cd ON m.Model = cd.Model WHERE cd.Weight < (SELECT AVG(Weight) FROM cars_data) 
SELECT m.Model FROM model_list m JOIN cars_data cd ON m.Model = cd.Make WHERE cd.Weight < (     SELECT AVG(Weight)     FROM cars_data ) 
SELECT car_makers.Maker FROM car_makers INNER JOIN car_names ON car_makers.Id = car_names.MakeId INNER JOIN cars_data ON car_names.Model = cars_data.Make AND cars_data.Year = 1970 
SELECT DISTINCT car_makers.Maker FROM car_makers INNER JOIN cars_data ON car_makers.Id = cars_data.MakeId WHERE cars_data.Year = 1970; 
SELECT c.Maker, c.Year FROM car_names AS cn JOIN cars_data AS cd ON cn.Model = cd.MakeId JOIN car_makers AS cm ON cn.Maker = cm.Id JOIN continents AS cont ON cm.Country = countries.CountryId WHERE cont.Continent = (     SELECT MIN(ContId)     FROM continents ) 
SELECT car_makers.Maker, cars_data.Year FROM car_makers JOIN cars_data ON car_makers.Id = cars_data.MakeId JOIN model_list ON cars_data.Model = model_list.Model WHERE cars_data.Year = (     SELECT MIN(Year)     FROM cars_data ) 
SELECT DISTINCT Model FROM car_names JOIN cars_data ON car_names.Model = cars_data.MakeId WHERE cars_data.Year > 1980; 
SELECT DISTINCT m.Model FROM car_names AS m JOIN cars_data AS cd ON m.Model = cd.Make WHERE cd.Year > 1980;
SELECT continents.Continent, COUNT(car_makers.Id) AS MakerCount FROM continents JOIN car_makers ON continents.Continent = car_makers.Country GROUP BY continents.Continent; 
SELECT continents.Continent, COUNT(car_makers.Id) AS CarMakersCount FROM continents LEFT JOIN car_makers ON continents.Continent = car_makers.Country GROUP BY continents.Continent; 
SELECT countries.CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY countries.CountryName ORDER BY COUNT(car_makers.Id) DESC LIMIT 1; 
SELECT countries.CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY countries.CountryName ORDER BY COUNT(car_makers.Id) DESC LIMIT 1; 
SELECT c.Fullname, COUNT(m.Model) AS ModelCount FROM car_makers c JOIN model_list m ON c.Id = m.Maker GROUP BY c.Id, c.FullName; 
SELECT Maker.Id, Maker.FullName, COUNT(Model.Model) AS ModelsProduced FROM car_makers Maker JOIN model_list Model ON Maker.Id = Model.Maker GROUP BY Maker.Id, Maker.FullName; 
SELECT Accelerate FROM cars_data JOIN car_names ON cars_data.MakeId = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.FullName = 'AMC Hornet Sportabout' AND model_list.Model = 'SW'; 
SELECT Accelerate FROM cars_data WHERE Maker = (SELECT Id FROM car_makers WHERE Maker = 'amc' AND Model = 'hornet sportabout (sw)'); 
SELECT COUNT(*) AS "Number of Car Makers in France" FROM car_makers WHERE Country = 'france'; 
SELECT COUNT(DISTINCT car_makers.Country) AS "Number of Car Makers in France" FROM car_makers JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'France'; 
SELECT COUNT(Model) AS 'Number of Models' FROM model_list JOIN cars_data ON model_list.Model = cars_data.MakeId JOIN countries AS usa ON cars_data.Country = usa.CountryId WHERE usa.CountryName = 'USA'; 
SELECT COUNT(Model) AS 'Number of Car Models' FROM car_names JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'United States'; 
SELECT AVG(MPG) AS avg_mpgs FROM cars_data WHERE Cylinders = 4; 
SELECT AVG(MPG) AS avg_MPGs FROM cars_data WHERE Cylinders = 4; 
SELECT MIN(`Weight`) AS smallest_weight FROM `cars_data` WHERE `Cylinders` = 8 AND YEAR(`Year`) = 1974 AND `MakeId` IN (     SELECT `ModelId`     FROM `model_list`     WHERE `MakerId` IN (         SELECT `Id`         FROM `car_makers`         WHERE `Country` = (             SELECT `CountryId`             FROM `countries`             WHERE `Continent` = (                 SELECT `ContId`                 FROM `continents`                 WHERE `Continent` = (                     SELECT `Continent`                     FROM `countries`                     WHERE `CountryName` = 'america'                 )             )         )     ) ); 
SELECT MIN(`Weight`) AS Minimum_Weight FROM `cars_data` WHERE `Cylinders` = 8 AND `Year` = 1974; 
SELECT car_makers.Maker, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker 
SELECT car_makers.Maker, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker 
SELECT countries.CountryName, countries.CountryId FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY countries.CountryName, countries.CountryId HAVING COUNT(car_makers.Id) > 0; 
SELECT c.CountryName, c.CountryId FROM countries c INNER JOIN car_makers cm ON c.CountryId = cm.Country 
SELECT COUNT(*) AS 'Number_of_Cars' FROM cars_data WHERE Horsepower > 150; 
SELECT COUNT(*) AS 'Number of Cars' FROM cars_data WHERE Horsepower > 150; 
SELECT Year, AVG(Weight) AS AverageWeight FROM cars_data GROUP BY Year; 
SELECT Year, AVG(Weight), AVG(Year) FROM (   SELECT YEAR(CarsData.Year) AS Year, Weight, CarsData.Year   FROM cars_data ) AS yearly_data GROUP BY Year; 
SELECT countries.CountryName FROM countries INNER JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY countries.CountryId, countries.CountryName HAVING COUNT(car_makers.Id) >= 3 AND countries.Continent = 2; -- Assuming 'europe' has ContinentId 2 
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.CountryId GROUP BY c.CountryId, c.CountryName HAVING COUNT(cm.Id) >= 3 AND c.Continent = 2; 
SELECT MAX(Horsepower), Maker FROM cars_data JOIN model_list ON cars_data.Model = model_list.Model WHERE Cylinders = 3; 
SELECT MAX(Horsepower) AS Max_Horsepower, Maker FROM cars_data JOIN model_list ON cars_data.Model = model_list.Model WHERE Cylinders = 3; 
SELECT model_list.Model, MAX(car_names.MPG) AS max_MPG FROM model_list JOIN car_names ON model_list.Model = car_names.Model GROUP BY model_list.Model ORDER BY max_MPG DESC LIMIT 1; 
SELECT ModelList.Model FROM ModelList JOIN CarsData ON ModelList.Model = CarsData.MakeId ORDER BY CarsData.MPG DESC LIMIT 1; 
SELECT AVG(Horsepower) AS Average_Horsepower_Before_1980 FROM cars_data WHERE Year < 1980; 
SELECT AVG(Horsepower) AS avg_horsepower FROM cars_data WHERE Year < 1980; 
SELECT AVG(car_names.Edispl) AS average_edispl FROM car_names JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id JOIN countries ON car_makers.Country = countries.CountryId WHERE car_makers MAKER = 'volvo'; 
SELECT AVG(edispl) AS avg_edispl FROM cars_data JOIN car_names ON cars_data.MakeId = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.FullName = 'Volvo'; 
SELECT Cylinders, MAX(Accelerate) AS MaxAccelerate FROM cars_data GROUP BY Cylinders; 
SELECT MAX(accelerate) AS max_accelerate_per_cylinder FROM cars_data GROUP BY Cylinders; 
SELECT model_list.Model, COUNT(*) AS version_count FROM model_list GROUP BY model_list.Model ORDER BY version_count DESC LIMIT 1; 
SELECT m.Model, COUNT(DISTINCT ml.ModelId) AS VersionCount FROM model_list ml JOIN car_names cn ON ml.Model = cn.Model GROUP BY m.Model ORDER BY VersionCount DESC LIMIT 1; 
SELECT COUNT(*) AS cars_with_more_than_4_cylinders FROM cars_data WHERE Cylinders > 4; 
SELECT COUNT(*) AS num_cars_with_more_than_4_cylinders FROM cars_data WHERE Cylinders > 4; 
SELECT COUNT(*) AS "Number of Cars Produced in 1980" FROM cars_data WHERE YEAR = 1980; 
SELECT COUNT(*) AS "Number_of_Cars_Made_In_1980" FROM "cars_data" WHERE YEAR("Year") = 1980; 
SELECT COUNT(Model) AS 'Number of Models' FROM model_list AS m JOIN car_makers AS cm ON m.Maker = cm.Id JOIN car_names AS cn ON m.Model = cn.Make WHERE cm.FullName = 'American Motor Company'; 
SELECT COUNT(Model) AS 'Number of Models' FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id JOIN car_names ON model_list.Model = car_names.MakeId WHERE car_makers.FullName = 'American Motor Company'; 
SELECT cm.FullName, cm.Id FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.FullName HAVING COUNT(ml.Model) > 3; 
SELECT c.Maker, c.Id FROM car_makers c JOIN model_list m ON c.Id = m.Maker GROUP BY c.Id, c.Maker HAVING COUNT(m.Model) > 3; 
SELECT DISTINCT model_list.Model FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id JOIN cars_data ON car_makers.Id = cars_data.MakeId WHERE car_makers.FullName = 'General Motors' OR cars_data.Weight > 3500; 
SELECT DISTINCT m.Model FROM car_makers c JOIN model_list m ON c.Id = m.Maker JOIN cars_data cd ON m.Model = cd.Make WHERE c.Maker = 'General Motors' OR cd.Weight > 3500; 
SELECT YEAR(cars_data.Year) FROM cars_data JOIN car_names ON cars_data.MakeId = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model WHERE cars_data.Weight BETWEEN 3000 AND 4000; 
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 AND Weight > 3000; 
SELECT MAX(cars_data.Horsepower) AS Max_Horsepower FROM cars_data JOIN car_names ON cars_data.MakeId = car_names.MakeId WHERE cars_data.Accelerate = (     SELECT MAX(Accelerate)     FROM cars_data ) 
SELECT Horsepower FROM cars_data WHERE Accelerate = (     SELECT MAX(Accelerate)     FROM cars_data ) 
SELECT COUNT(cylinders) AS 'Number of Cylinders' FROM cars_data JOIN car_names ON cars_data.MakeId = car_names.Id JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers cm ON model_list.Maker = cm.Id JOIN countries c ON cm.Country = countries.CountryId WHERE car_names.Model = 'volvo' AND cars_data.accelerate = (     SELECT MIN(accelerate)     FROM cars_data     WHERE MakeId = car_names.Id ) 
SELECT COUNT(*) AS LeastAccelCylinders FROM (     SELECT m.Cylinders, c.Model     FROM model_list m     JOIN cars_data c ON m.Model = c.Model     WHERE m.Maker = 'volvo'     ORDER BY c.Accelerate ASC     LIMIT 1 ) AS min_accelerate_version 
SELECT COUNT(*) AS "Cars With Larger Accelerate" FROM cars_data WHERE Accelerate > (     SELECT MAX(Accelerate)     FROM cars_data ) 
SELECT COUNT(*) AS 'Number of Cars with Greater Accelerate' FROM cars_data WHERE Accelerate > (     SELECT MAX(Horsepower) FROM cars_data ) 
SELECT COUNT(*) AS num_countries_with_many_makers FROM countries c JOIN car_makers cm ON c.CountryId = cm.CountryId GROUP BY c.CountryId HAVING COUNT(cm.Id) > 2; 
SELECT COUNT(DISTINCT countries.CountryId) AS 'CountriesWithMultipleMakers' FROM countries JOIN car_makers ON countries.CountryId = car_makers.CountryId GROUP BY countries.CountryId HAVING COUNT(car_makers.Id) > 2; 
SELECT COUNT(*) AS cars_with_more_than_6_cylinders FROM cars_data WHERE Cylinders > 6; 
SELECT COUNT(*) AS 'Number of Cars with Over 6 Cylinders' FROM `cars_data` WHERE `Cylinders` > 6; 
SELECT ml.Model, MAX(hp.Horsepower) AS MaxHorsepower FROM model_list ml JOIN car_names cn ON ml.Model = cn.Model JOIN cars_data cd ON cn.MakeId = cd.MakeId WHERE cd.Cylinders = 4 GROUP BY ml.Model ORDER BY MaxHorsepower DESC; 
SELECT ml.Model, MAX(hp.Horsepower) AS Max_Horsepower FROM model_list ml JOIN car_names cn ON ml.Model = cn.Model JOIN cars_data cd ON cn.MakeId = cd.MakeId JOIN car_makers cm ON ml.Id = cm.Id JOIN car_names hp ON cd.Model = hp.Model AND cd.Cylinders = 4 GROUP BY ml.Model ORDER BY Max_Horsepower DESC LIMIT 1; 
WITH hp_lowest AS (   SELECT MIN(Horsepower) AS min_horsepower   FROM cars_data ), cars_with_high_horsepower AS (   SELECT CarNames.MakeId, CarNames.Model, CarMakers.Maker   FROM cars_data   JOIN car_names ON cars_data.Id = car_names.MakeId   WHERE Horsepower > (SELECT min_horsepower FROM hp_lowest) ), cars_with_three_cylinders_or_less AS (   SELECT CarNames.MakeId, CarNames.Model, CarMakers.Maker   FROM cars_data   JOIN car_names ON cars_data.Id = car_names.MakeId   JOIN model_list ON car_names.Model = model_list.Model   JOIN car_makers ON model_list.Maker = car_makers.Id   WHERE Cylinders <= 3 ) SELECT DISTINCT cars_with_high_horsepower.MakeId, CarMakers.FullName FROM cars_with_high_horsepower JOIN cars_with_three_cylinders_or_less ON cars_with_high_horsepower.MakeId = cars_with_three_cylinders_or_less.MakeId; 
SELECT c.Id AS MakeId, c.Model AS MakerName FROM car_names AS cn JOIN car_makers AS cm ON cn.Make = cm.Id JOIN model_list AS ml ON cn.Model = ml.Model WHERE ml.Cylinders < 4 AND cn.Horsepower < (     SELECT MIN(Horsepower) FROM cars_data     WHERE Model IN (         SELECT Model FROM model_list WHERE Maker = cm.Id     ) ) 
SELECT MAX(MPG) AS max_mpg FROM cars_data WHERE Cylinders = 8 AND Year < 1980; 
SELECT MAX(cars_data.MPG) AS max_mpgh FROM cars_data JOIN car_names ON cars_data.MakeId = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id JOIN countries ON car_makers.Country = countries.CountryId WHERE car_names.Cylinders = 8 OR cars_data.Year < 1980; 
SELECT ml.Model FROM model_list ml JOIN cars_data cd ON ml.Model = cd.Make WHERE ml.Maker != 'Ford Motor Company' AND cd.Weight < 3500; 
SELECT DISTINCT m.Model FROM model_list m JOIN cars_data cd ON m.Model = cd.Model JOIN car_makers cm ON m.Id = cm.Id WHERE cm.Maker != 'ford' AND cd.Weight < 3500; 
SELECT c.CountryName FROM countries c LEFT JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryId, c.CountryName HAVING COUNT(cm.Id) = 0; 
SELECT c.CountryName FROM countries c LEFT JOIN car_makers cm ON c.CountryId = cm.CountryId WHERE cm.CountryId IS NULL; 
WITH makers_with_models AS (   SELECT maker.Id, Maker   FROM car_makers maker   JOIN model_list models ON maker.Id = models.Maker   GROUP BY maker.Id, Maker   HAVING COUNT(models.Model) >= 2 ), makers_count AS (   SELECT maker.Id, Maker, COUNT(*) as model_count   FROM makers_with_models   GROUP BY maker.Id, Maker   HAVING COUNT(*) > 3 ) SELECT makers_count.Id, makers_count.Maker FROM makers_count; 
SELECT c.Id, c.Maker FROM car_makers c JOIN model_list m ON c.Id = m.Maker JOIN cars_data cd ON m.Model = cd.Make GROUP BY c.Id, c.Maker HAVING COUNT(m.Model) >= 2 AND COUNT(cd.Id) > 3; 
SELECT c.CountryId, c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryId, c.CountryName HAVING COUNT(cm.Id) > 3 OR cm.Maker = 'fiat'; 
SELECT c.CountryId, c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.CountryId JOIN model_list ml ON cm.Id = ml.Maker JOIN car_names cn ON ml.Model = cn.Model WHERE cm.Id IN (     SELECT Maker     FROM car_makers     GROUP BY Maker     HAVING COUNT(*) > 3 ) OR cn.Make = 'fiat' 
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'; 
SELECT Country FROM airlines WHERE Abbreviation = 'Jetblue'; 
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways';
SELECT Abbreviation FROM airlines JOIN flights ON airlines.Airline = flights.Airline WHERE Airline = 'Jetblue Airways'; 
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'; 
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'; 
SELECT airports.AirportCode, airports.AirportName FROM airports WHERE airports.City = 'Anthony'; 
SELECT airports.AirportCode, airports.AirportName FROM airports WHERE airports.City = 'Anthony'; 
SELECT COUNT(*) AS "Number of Airlines" FROM airlines; 
SELECT COUNT(Airline) AS TotalAirlines FROM airlines; 
SELECT COUNT(*) AS AirportCount FROM airports; 
SELECT COUNT(*) AS AirportCount FROM airports; 
SELECT COUNT(*) AS TotalFlights FROM flights; 
SELECT COUNT(*) AS flight_count FROM flights; 
SELECT * FROM airlines WHERE Abbreviation = 'UAL'; 
SELECT * FROM airlines WHERE Abbreviation = 'UAL'; 
SELECT COUNT(*) AS num_airlines_from_usa FROM airlines WHERE Country = 'USA'; 
SELECT COUNT(*) AS 'Number of Airlines in USA' FROM airlines WHERE Country = 'USA'; 
SELECT airports.City, airports.Country FROM airports WHERE AirportCode = 'ALTON'; 
SELECT airports.City, airports.Country FROM airports WHERE AirportCode = 'ALTON'; 
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'; 
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'; 
SELECT AirportName FROM airports WHERE City = 'Aberdeen'; 
SELECT AirportName FROM airports WHERE City = 'Aberdeen'; 
SELECT COUNT(*) AS DepartingFlights FROM flights WHERE SourceAirport = 'APG'; 
SELECT COUNT(*) AS flight_count FROM flights WHERE SourceAirport = 'APG'; 
SELECT COUNT(*) AS num_flights_to_ATO FROM flights WHERE DestAirport = 'ATO'; 
SELECT COUNT(*) AS flight_count FROM flights WHERE DestAirport = 'ATO'; 
SELECT COUNT(*) AS 'Flights Departing from Aberdeen' FROM flights WHERE SourceAirport = 'Aberdeen'; 
SELECT COUNT(*) AS "Number of Flights Departing from Aberdeen" FROM flights WHERE SourceAirport = 'ABE'; 
SELECT COUNT(*) as num_flights_arriving FROM flights WHERE DestAirport = 'Aberdeen'; 
SELECT COUNT(*) AS num_flights_arriving FROM flights WHERE DestAirport = 'Aberdeen'; 
SELECT COUNT(*) AS num_flights FROM flights WHERE SourceAirport = 'Aberdeen' AND DestAirport = 'Ashley'; 
SELECT COUNT(*) AS flight_count FROM flights WHERE SourceAirport = 'Aberdeen' AND DestAirport = 'Ashley'; 
SELECT COUNT(*) AS flight_count FROM flights WHERE Airline = 'JetBlue Airways'; 
SELECT COUNT(*) AS JetblueFlights FROM flights WHERE Airline = 'Jetblue Airlines'; 
SELECT COUNT(*)  FROM flights  WHERE Airline = 1 AND DestAirport = 'ASY'; 
SELECT COUNT(*)  FROM flights  WHERE Airline = 1 -- Assuming United Airlines has uid 1 AND DestAirport = 'ASY'; 
SELECT COUNT(*) AS United_Airlines_flights_from_AHD FROM flights WHERE Airline = 1 AND SourceAirport = 'AHD'; 
SELECT COUNT(*) AS United_Airlines_AHD_Flights FROM flights WHERE Airline = 1 -- United Airlines (uid 1) AND SourceAirport = 'AHD'; 
SELECT COUNT(*) AS num_flights FROM flights WHERE Airline = 1 AND SourceAirport = 'Aberdeen'; 
SELECT COUNT(*) AS United_Airlines_Arrivals_in_Aberdeen FROM flights WHERE Airline = 1 -- United Airlines (uid is 1) AND DestAirport = 'Aberdeen'; 
SELECT airports.City, COUNT(*) AS ArrivingFlights FROM airports JOIN flights ON airports.AirportCode = flights.DestAirport GROUP BY airports.City ORDER BY ArrivingFlights DESC LIMIT 1; 
SELECT airports.City, COUNT(*) AS frequency FROM airports JOIN flights ON airports.AirportCode = flights.DestAirport GROUP BY airports.City ORDER BY frequency DESC LIMIT 1; 
SELECT airports.City, COUNT(*) AS num_flights FROM airports JOIN flights ON airports.AirportCode = flights.SourceAirport GROUP BY airports.City ORDER BY num_flights DESC LIMIT 1; 
SELECT airports.City AS MostFrequentSource FROM airports WHERE airports.AirportCode IN (     SELECT SourceAirport     FROM flights     GROUP BY SourceAirport     ORDER BY COUNT(*) DESC     LIMIT 1 ); 
SELECT airports.AirportCode FROM airports JOIN flights ON airports.AirportCode = flights.SourceAirport GROUP BY airports.AirportCode ORDER BY COUNT(flights.FlightNo) DESC LIMIT 1; 
SELECT airports.AirportCode FROM airports JOIN flights ON airports.AirportCode = flights.SourceAirport GROUP BY airports.AirportCode ORDER BY COUNT(flights.FlightNo) DESC LIMIT 1; 
SELECT AirportCode FROM airports MINIMIZE COUNT(*) AS flight_count GROUP BY AirportCode; 
SELECT AirportCode FROM airports MINCOUNT(CASE WHEN flights.Airline IN (SELECT Airline FROM flights) THEN 1 END) AS flight_count GROUP BY AirportCode LIMIT 1; 
SELECT Airline, COUNT(*) AS TotalFlights FROM flights GROUP BY Airline ORDER BY TotalFlights DESC LIMIT 1; 
SELECT Airline, COUNT(*) AS TotalFlights FROM flights GROUP BY Airline ORDER BY TotalFlights DESC LIMIT 1; 
SELECT A.Abbreviation, A.Country FROM airlines AS A JOIN flights AS F ON A.uid = F.Airline GROUP BY A.uid ORDER BY COUNT(F.FlightNo) MIN LIMIT 1; 
SELECT Abbreviation, Country FROM airlines JOIN flights ON airlines.uid = flights.Airline GROUP BY Abbreviation, Country ORDER BY COUNT(*) MIN LIMIT 1; 
SELECT A.Airline FROM airlines A JOIN flights F ON A.uid = F.Airline WHERE F.SourceAirport = 'AHD'; 
SELECT Airline FROM flights WHERE SourceAirport = 'AHD'; 
SELECT A.Airline FROM airlines A INNER JOIN flights F ON A.uid = F.Airline WHERE F.DestAirport = 'AHD'; 
SELECT Airline FROM flights WHERE DestAirport = 'AHD'; 
SELECT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.SourceAirport = 'APG' AND flights.DestAirport = 'CVO'; 
SELECT A.Airline FROM airlines AS A JOIN flights AS F ON A.uid = F.Airline WHERE F.SourceAirport = 'APG' AND F.DestAirport = 'CVO'; 
SELECT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.SourceAirport = 'CVO' AND flights.DestAirport NOT IN ('APG') 
SELECT Airline FROM flights WHERE SourceAirport = 'CVO' AND DestAirport NOT IN ('APG') AND Airline IN (     SELECT Airline     FROM airports     WHERE AirportCode = 'APG' ); 
SELECT Airlines.Airline FROM airlines AS Airlines JOIN flights AS Flights ON Airlines.uid = Flights.Airline GROUP BY Airlines.Airline HAVING COUNT(Flights.FlightNo) >= 10; 
SELECT Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline GROUP BY airlines.uid HAVING COUNT(flights.FlightNo) >= 10; 
SELECT airlines.Airline FROM airlines LEFT JOIN flights ON airlines.uid = flights.Airline GROUP BY airlines.Airline HAVING COUNT(flights.FlightNo) < 200; 
SELECT Airline FROM airlines AS a JOIN flights AS f ON a.uid = f.Airline GROUP BY a.uid HAVING COUNT(f.FlightNo) < 200; 
SELECT FlightNo FROM flights WHERE Airline = 'United Airlines'; 
SELECT FlightNo FROM flights WHERE Airline = 1;
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'; 
SELECT f.FlightNo FROM flights f INNER JOIN airports a ON f.SourceAirport = a.AirportCode WHERE a.City = 'APG'; 
SELECT f.FlightNo FROM flights f JOIN airports a ON f.SourceAirport = a.AirportCode OR f.DestAirport = a.AirportCode WHERE a.AirportName = 'APG'; 
SELECT f.FlightNo FROM flights f JOIN airports a ON f.SourceAirport = a.AirportCode WHERE a.AirportName = 'APG'; 
SELECT f.FlightNo FROM flights f WHERE f.SourceAirport = 'Aberdeen'; 
SELECT f.FlightNo FROM flights f JOIN airports a ON f.SourceAirport = a.AirportCode WHERE a.City = 'Aberdeen'; 
SELECT FlightNo FROM flights WHERE DestAirport = 'Aberdeen'; 
SELECT FlightNo FROM flights WHERE DestAirport = 'Aberdeen'; 
SELECT COUNT(*) AS TotalFlights FROM flights WHERE SourceAirport IN ('Aberdeen', 'Abilene') 
SELECT COUNT(*) as TotalFlights FROM flights WHERE SourceAirport IN ('Aberdeen', 'Abilene'); 
SELECT airports.AirportName FROM airports LEFT JOIN flights ON airports.AirportCode = flights.SourceAirport LEFT JOIN flights AS dest_flights ON airports.AirportCode = dest_flights.DestAirport WHERE flights.SourceAirport IS NULL OR dest_flights.DestAirport IS NULL; 
SELECT airports.City, AirportCode, AirportName, Country, CountryAbbreviation FROM airports WHERE NOT EXISTS (     SELECT 1     FROM flights     WHERE flights.SourceAirport = airports.AirportCode OR flights.DestAirport = airports.AirportCode ) AND flights.Airline IS NULL; 
SELECT COUNT(*) AS EmployeeCount FROM employee; 
SELECT COUNT(*) AS "Total_Employees" FROM employee; 
SELECT Name, Age FROM employee ORDER BY Age ASC;
SELECT Name FROM employee ORDER BY Age ASC;
SELECT City, COUNT(Employee_ID) AS NumEmployees FROM employee GROUP BY City; 
SELECT City, COUNT(Employee_ID) AS EmployeeCount FROM employee GROUP BY City; 
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1; 
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1; 
SELECT Location, COUNT(Shop_ID) AS Number_of_Shops FROM shop GROUP BY Location; 
 SELECT Location, COUNT(Shop_ID) AS Number_of_Shops FROM shop GROUP BY Location; 
SELECT s.Name AS Manager_Name, s.District FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID JOIN employee e ON h.Employee_ID = e.Employee_ID WHERE s.Number_products = (SELECT MAX(Number_products) FROM shop) 
SELECT s.Name AS Shop_Name, s.District AS Shop_District FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID JOIN employee e ON h.Employee_ID = e.Employee_ID GROUP BY s.Shop_ID, s.District ORDER BY SUM(h.Number_products) DESC LIMIT 1; 
SELECT MIN(`Number_products`) AS Minimum_products, MAX(`Number_products`) AS Maximum_products FROM shop; 
SELECT MIN(`Number_products`) AS MinProducts, MAX(`Number_products`) AS MaxProducts FROM shop; 
SELECT s.Name, s.Location, s.District FROM shop s ORDER BY s.Number_products DESC; 
SELECT s.Name, s.Location, s.District FROM shop s ORDER BY s.Number_products DESC; 
WITH avg_products AS (   SELECT AVG(`Number_products`) AS avg_products   FROM shop ) SELECT s.Name FROM shop s JOIN avg_products ap ON s.`Number_products` > ap.avg_products; 
SELECT s.Name AS Shop_Name, s.Number_products FROM shop s JOIN (     SELECT AVG(Number_products) AS Average_Products     FROM shop ) AS avg_shop ON s.Number_products > avg_shop.Average_Products; 
SELECT e.Name FROM employee e JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID GROUP BY e.Employee_ID, e.Name HAVING COUNT(*) = (SELECT MAX(count) FROM (     SELECT Employee_ID, COUNT(*) AS count     FROM evaluation     GROUP BY Employee_ID ) AS max_counts) 
SELECT e.Name FROM employee e JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID GROUP BY e.Employee_ID, e.Name HAVING COUNT(*) = (     SELECT MAX(awards_count)     FROM (         SELECT COUNT(*) AS awards_count         FROM evaluation         GROUP BY Employee_ID     ) as max_awards_per_employee ); 
SELECT e.Name FROM employee e INNER JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID WHERE ev.Bonus = (     SELECT MAX(Bonus)     FROM evaluation ) 
SELECT e.Name FROM employee e JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID WHERE ev.Bonus = (SELECT MAX(Bonus) FROM evaluation) 
SELECT e.Name FROM employee e LEFT JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID WHERE ev.Year_awarded IS NULL; 
SELECT e.Name FROM employee e LEFT JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID WHERE ev.Employee_ID IS NULL; 
SELECT s.Name FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID, s.Name ORDER BY COUNT(h.Employee_ID) DESC LIMIT 1; 
SELECT s.Name AS Shop_Name FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID JOIN employee e ON h.Employee_ID = e.Employee_ID GROUP BY s.Shop_ID, s.Name ORDER BY COUNT(e.Employee_ID) DESC LIMIT 1; 
SELECT s.Name FROM shop s LEFT JOIN hiring h ON s.Shop_ID = h.Shop_ID WHERE h.Shop_ID IS NULL; 
SELECT s.Name FROM shop s LEFT JOIN hiring h ON s.Shop_ID = h.Shop_ID LEFT JOIN employee e ON h.Employee_ID = e.Employee_ID WHERE h.Shop_ID IS NULL; 
SELECT shop.Name, COUNT(hiring.Employee_ID) AS num_hired FROM shop JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY shop.Shop_ID; 
SELECT s.Name AS Shop_Name, COUNT(e.Employee_ID) AS Employee_Count FROM shop s LEFT JOIN hiring h ON s.Shop_ID = h.Shop_ID LEFT JOIN employee e ON h.Employee_ID = e.Employee_ID GROUP BY s.Shop_ID, s.Name; 
SELECT SUM(Bonus) AS Total_Bonus FROM evaluation; 
SELECT SUM(Bonus) AS Total_Bonus FROM evaluation; 
SELECT * FROM hiring; 
SELECT * FROM hiring; 
SELECT h.District FROM hiring h JOIN shop s ON h.Shop_ID = s.Shop_ID WHERE s.Number_products < 3000 AND s.Number_products > 10000; 
SELECT DISTINCT District FROM shop AS s1 JOIN hiring AS h1 ON s1.Shop_ID = h1.Shop_ID JOIN employee AS e1 ON h1.Employee_ID = e1.Employee_ID JOIN shop AS s2 ON s2.Shop_ID = h1.Shop_ID AND s2.Number_products > 10000 WHERE s1.Number_products < 3000; 
SELECT COUNT(DISTINCT Location) AS StoreLocations FROM shop; 
SELECT COUNT(DISTINCT shop.Location) AS Unique_StoreLocations FROM shop; 
SELECT COUNT(*) AS Total_Documents FROM Documents; 
SELECT COUNT(Document_ID) AS Document_Count FROM Documents; 
SELECT Document_ID, Document_Name, Document_Description FROM Documents; 
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT Document_Name, Template_ID FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Document_Description LIKE '%w%'; 
SELECT Document_Name, Template_ID FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Document_Description LIKE '%w%' 
SELECT Documents.Document_ID, Templates.Template_ID, Documents.Document_Description FROM Documents INNER JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Documents.Document_Name = 'Robbin CV'; 
SELECT Document_ID, Template_ID, Document_Name FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Document_Name = 'Robbin CV'; 
SELECT COUNT(DISTINCT Template_Type_Code) AS DifferentTemplates FROM Templates WHERE Template_ID IN (     SELECT Template_ID     FROM Documents     GROUP BY Template_ID     HAVING COUNT(*) = (SELECT COUNT(*) FROM Documents) ); 
SELECT COUNT(DISTINCT Template_ID) AS DifferentTemplatesUsed FROM Documents 
SELECT COUNT(*)  FROM Documents  WHERE Template_ID IN (     SELECT Template_ID      FROM Templates      WHERE Template_Type_Code = 'PPT' ); 
SELECT COUNT(Documents.Template_ID) FROM Documents JOIN Ref_Template_Types AS T ON Documents.Template_Type_Code = T.Template_Type_Code WHERE T.Template_Type_Description = 'PPT'; 
SELECT Templates.Template_ID, COUNT(Documents.Document_ID) AS Document_Count FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID; 
SELECT T.Template_ID, COUNT(*) AS UsageCount FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID; 
SELECT T.Template_ID, R.Template_Type_Code FROM Templates T JOIN Ref_Template_Types R ON T.Template_Type_Code = R.Template_Type_Code GROUP BY T.Template_ID, R.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T.Template_ID, T.Template_Type_Code FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID, T.Template_Type_Code HAVING COUNT(D.Document_ID) = (     SELECT MAX(count)     FROM (         SELECT Template_ID, COUNT(Document_ID) AS count         FROM Documents         GROUP BY Template_ID     ) AS doc_counts     WHERE doc_counts.Template_ID IN (         SELECT Template_ID         FROM Templates     ) ); 
SELECT Templates.Template_ID FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID HAVING COUNT(Documents.Document_ID) > 1; 
SELECT Templates.Template_ID FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID HAVING COUNT(DISTINCT Documents.Document_ID) > 1; 
SELECT T.Template_ID FROM Templates AS T LEFT JOIN Documents AS D ON T.Template_ID = D.Template_ID WHERE D.Template_ID IS NULL; 
SELECT Templates.Template_ID FROM Templates LEFT JOIN Documents ON Templates.Template_ID = Documents.Template_ID WHERE Documents.Template_ID IS NULL; 
SELECT COUNT(Template_ID) AS Total_Templates FROM Templates; 
SELECT COUNT(Template_ID) AS Template_Count FROM Templates; 
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates; 
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates;
SELECT DISTINCT Template_Type_Code  FROM Templates  JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code; 
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types;
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT Templates.Template_ID FROM Templates INNER JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Code IN ('PP', 'PPT') 
SELECT COUNT(Template_ID) AS Num_CVs FROM Templates WHERE Template_Type_Code = 'CV'; 
SELECT COUNT(Templates.Template_ID) AS Template_Count FROM Templates INNER JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Description = 'CV'; 
SELECT T.Version_Number, RT.Template_Type_Code FROM Templates T JOIN Ref_Template_Types RT ON T.Template_Type_Code = RT.Template_Type_Code WHERE T.Version_Number > 5; 
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5;
SELECT Template_Type_Code, COUNT(Template_ID) AS Num_Templates FROM Templates GROUP BY Template_Type_Code; 
SELECT Template_Type_Code, COUNT(Template_ID) AS Template_Count FROM Templates GROUP BY Template_Type_Code; 
SELECT Template_Type_Code, COUNT(Template_ID) AS NumTemplates FROM Templates GROUP BY Template_Type_Code ORDER BY NumTemplates DESC LIMIT 1; 
WITH TemplateCounts AS (   SELECT Template_Type_Code, COUNT(*) AS TemplateCount   FROM Templates   GROUP BY Template_Type_Code   ORDER BY TemplateCount DESC   LIMIT 1 ) SELECT TemplateCounts.Template_Type_Code FROM TemplateCounts; 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code IN (     SELECT Template_Type_Code     FROM Templates     GROUP BY Template_Type_Code     HAVING COUNT(Template_ID) < 3 ); 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code IN (     SELECT Template_Type_Code     FROM Templates     GROUP BY Template_Type_Code     HAVING COUNT(Template_ID) < 3 ); 
SELECT MIN(Version_Number), Template_Type_Code FROM Templates WHERE Version_Number = (     SELECT MIN(Version_Number)     FROM Templates ) AND Template_Type_Code IN (     SELECT Template_Type_Code     FROM Ref_Template_Types ) 
SELECT min(Template-Version_Number), Template_Type_Code FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Template_Type_Description IN ('PPT', 'CV', 'AD', 'PP', 'BK') GROUP BY Template_Type_Code ORDER BY min(Template-Version_Number) ASC LIMIT 1; 
SELECT Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID WHERE Document_Name = 'Database'; 
SELECT Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Document_Name = 'Database';
SELECT Documents.Document_Name FROM Documents INNER JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'BK'; 
SELECT Document_Name FROM Documents WHERE Template_ID IN(SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'BK');
SELECT Template_Type_Code, COUNT(Document_ID) AS DocumentCount FROM Templates GROUP BY Template_Type_Code; 
SELECT Template_Type_Code, COUNT(Document_ID) AS DocumentCount FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Template_Type_Code; 
SELECT Template_Type_Code, COUNT(*) AS DocumentCount FROM Documents JOIN Ref_Template_Types ON Documents.Template_Type_Code = Ref_Template_Types.Template_Type_Code GROUP BY Template_Type_Code ORDER BY DocumentCount DESC LIMIT 1; 
SELECT Template_Type_Code, COUNT(*) AS UsageCount FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code GROUP BY Template_Type_Code ORDER BY UsageCount DESC LIMIT 1; 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (     SELECT Template_Type_Code     FROM Templates     LEFT JOIN Documents ON Templates.Template_Type_Code = Documents.Template_Type_Code     GROUP BY Templates.Template_Type_Code     HAVING COUNT(Documents.Document_ID) = 0 ); 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (     SELECT Template_Type_Code     FROM Templates     JOIN Documents ON Templates.Template_Type_Code = Documents.Template_Type_Code ) 
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types;
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types;
SELECT Template_Type_Description  FROM Ref_Template_Types  WHERE Template_Type_Code = 'AD'; 
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'; 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'; 
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book';
SELECT DISTINCT Template_Type_Description FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code; 
SELECT DISTINCT Template_Type_Description FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code; 
SELECT Template_ID FROM Templates WHERE Template_Type_Description = 'Presentation'; 
SELECT Template_ID FROM Templates WHERE Template_Type_Description = 'Presentation'; 
SELECT COUNT(*) AS Total_Paragraphs FROM Paragraphs;
SELECT COUNT(*) AS Paragraph_Count FROM Paragraphs; 
SELECT COUNT(*) AS Paragraph_Count FROM Paragraphs WHERE Document_Name = 'Summer Show'; 
SELECT COUNT(*) AS Paragraph_Count FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Summer Show'; 
SELECT p.Paragraph_ID, d.Document_Name, p.Paragraph_Text, d.Other_Details FROM Paragraphs p INNER JOIN Documents d ON p.Document_ID = d.Document_ID WHERE p.Paragraph_Text = 'Korea'; 
SELECT Documents.Document_Name, Documents.Document_Description, Paragraphs.Paragraph_Text, Paragraphs.Other_Details FROM Documents INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID WHERE Paragraphs.Paragraph_Text LIKE '%Korea%'; 
SELECT Paragraph_ID, Paragraph_Text FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID WHERE Document_Name = 'Welcome to NY'; 
SELECT p.Paragraph_ID, p.Paragraph_Text FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Welcome to NY'; 
SELECT Paragraph_Text FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID WHERE Document_Name = 'Customer reviews'; 
SELECT Paragraph_Text FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID WHERE Document_Name = 'Customer reviews'; 
SELECT Documents.Document_ID, COUNT(Paragraphs.Paragraph_ID) AS Paragraph_Count FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Documents.Document_ID; 
SELECT Documents.Document_ID, COUNT(Paragraphs.Paragraph_ID) AS Paragraph_Count FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Documents.Document_ID; 
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS Paragraph_Count FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID, Documents.Document_Name; 
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS Paragraph_Count FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID, Documents.Document_Name;
SELECT Documents.Document_ID FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID HAVING COUNT(Paragraphs.Paragraph_ID) >= 2; 
SELECT Documents.Document_ID FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID HAVING COUNT(Paragraphs.Paragraph_ID) >= 2; 
SELECT Documents.Document_ID, Documents.Document_Name FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID, Documents.Document_Name ORDER BY COUNT(Paragraphs.Paragraph_ID) DESC LIMIT 1; 
SELECT Document_ID, Document_Name FROM Documents INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Document_ID, Document_Name ORDER BY COUNT(Paragraph_ID) DESC LIMIT 1; 
SELECT Document_ID FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Document_ID HAVING COUNT(Paragraph_ID) = MIN(COUNT(Paragraph_ID)) 
SELECT Documents.Document_ID FROM Documents INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID HAVING COUNT(Paragraphs.Paragraph_ID) = MIN(COUNT(Paragraphs.Paragraph_ID)) LIMIT 1;
SELECT Document_ID FROM Documents WHERE Document_ID IN (     SELECT Document_ID     FROM Paragraphs     GROUP BY Document_ID     HAVING COUNT(Paragraph_ID) BETWEEN 1 AND 2 ); 
SELECT Documents.Document_ID FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID HAVING COUNT(Paragraphs.Paragraph_ID) BETWEEN 1 AND 2; 
SELECT Documents.Document_ID FROM Documents INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID WHERE Paragraphs.Paragraph_Text IN ('Brazil', 'Ireland') 
SELECT Documents.Document_ID FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID WHERE Paragraphs.Paragraph_Text IN ('Brazil', 'Ireland') 
SELECT COUNT(Teacher_ID) AS Total_Teachers FROM teacher; 
SELECT COUNT(Teacher_ID) AS Total_Teachers FROM teacher; 
SELECT t.Name FROM teacher t ORDER BY t.Age ASC; 
SELECT t.Name FROM teacher t ORDER BY t.Age ASC; 
SELECT t.Age, t.Hometown FROM teacher t 
SELECT t.Age, t.Hometown FROM teacher t; 
SELECT t.Name FROM teacher t WHERE t.Hometown != 'Little Lever Urban District'; 
SELECT t.Name FROM teacher t LEFT JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID WHERE ca.Hometown != 'Little Lever Urban District' 
SELECT t.Name FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID WHERE t.Age IN ('32', '33') 
SELECT t.Name FROM teacher t WHERE t.Age IN ('32', '33');
SELECT T2.Hometown FROM `teacher` AS T1 JOIN `course_arrange` AS CA ON T1.Teacher_ID = CA.Teacher_ID JOIN `teacher` AS T2 ON CA.Youngest_Teacher_ID = T2.Teacher_ID WHERE T2.Age = (SELECT MIN(Age) FROM `teacher`) 
SELECT t.Name, t.Hometown FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID MINIMIZE t.Age GROUP BY t.Teacher_ID, t.Hometown; 
SELECT T.Hometown, COUNT(T.Teacher_ID) AS TeacherCount FROM teacher T GROUP BY T.Hometown; 
SELECT T.Hometown, COUNT(T.Teacher_ID) AS Number_of_Teachers FROM teacher T GROUP BY T.Hometown; 
SELECT T.Hometown, COUNT(*) AS Count FROM teacher T GROUP BY T.Hometown ORDER BY Count DESC LIMIT 1; 
SELECT T.Hometown, COUNT(*) AS occurrence FROM teacher T GROUP BY T.Hometown ORDER BY occurrence DESC LIMIT 1; 
SELECT DISTINCT T2.Hometown FROM course AS C JOIN course_arrange AS CA ON C.Course_ID = CA.Course_ID JOIN teacher AS T1 ON CA.Teacher_ID = T1.Teacher_ID JOIN teacher AS T2 ON CA.Teacher_ID = T2.Teacher_ID AND T1.Hometown <> T2.Hometown;
SELECT T.Hometown FROM teacher T GROUP BY T.Hometown HAVING COUNT(T.Teacher_ID) >= 2; 
SELECT t.Name, ca.Course FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID; 
SELECT t.Name, ca.Course FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID; 
SELECT t.Name, ca.Course FROM teacher t INNER JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID ORDER BY t.Name ASC; 
SELECT t.Name, c.Course FROM teacher t INNER JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID JOIN course c ON ca.Course_ID = c.Course_ID ORDER BY t.Name ASC, c.Course ASC; 
SELECT t.Name FROM `course` c JOIN `course_arrange` ca ON c.Course_ID = ca.Course_ID JOIN `teacher` t ON ca.Teacher_ID = t.Teacher_ID WHERE c.Course = 'Math'; 
SELECT t.Name FROM teacher t INNER JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID WHERE ca.Course = 'Math'; 
SELECT t.Name, COUNT(c.Course_ID) AS CourseCount FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID JOIN course c ON ca.Course_ID = c.Course_ID GROUP BY t.Teacher_ID, t.Name; 
SELECT t.Name AS Teacher_Name, COUNT(c.Course_ID) AS Course_Count FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID JOIN course c ON ca.Course_ID = c.Course_ID GROUP BY t.Teacher_ID, t.Name; 
SELECT t.Name FROM teacher t INNER JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID, t.Name HAVING COUNT(*) >= 2; 
SELECT t.Name FROM teacher t INNER JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID, t.Name HAVING COUNT(*) >= 2; 
SELECT t.Name FROM teacher t LEFT JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID WHERE ca.Course_ID IS NULL; 
SELECT t.Name FROM teacher t LEFT JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID WHERE ca.Course_ID IS NULL; 
SELECT COUNT(*) AS "Visitors_Below_30" FROM visitor WHERE Age < 30; 
SELECT v.Name FROM visitor v JOIN visit vvisit ON v.ID = vvisit.visitor_ID WHERE v.Level_of_membership > 4 ORDER BY v.Level_of_membership DESC; 
SELECT AVG(visitor.Age) AS Average_Age FROM visitor WHERE visitor.Level_of_membership <= 4; 
SELECT v.Name, v.Level_of_membership FROM visitor AS v JOIN visit AS v2 ON v.ID = v2.visitor_ID WHERE v.Level_of_membership > 4 ORDER BY v.Age ASC; 
SELECT m.Museum_ID, m.Name FROM museum m ORDER BY m.Num_of_Staff DESC LIMIT 1; 
SELECT AVG(Num_of_Staff) AS Average_Staff FROM museum WHERE Open_Year < '2009'; 
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'; 
SELECT m.Name FROM museum m WHERE m.Num_of_Staff > (     SELECT MIN(Num_of_Staff)     FROM museum     WHERE Open_Year > '2010' ); 
SELECT v.ID, v.Name, v.Age FROM visitor v JOIN visit v2 ON v.ID = v2.visitor_ID GROUP BY v.ID, v.Name, v.Age HAVING COUNT(DISTINCT v2.Museum_ID) > 1; 
SELECT v.ID, v.Name, v.Level_of_membership FROM visitor v JOIN visit v访问 ON v.ID = v访问.visitor_ID GROUP BY v.ID, v.Name, v.Level_of_membership ORDER BY SUM(v.Visit.Total_spent) DESC LIMIT 1; 
SELECT m.Museum_ID, m.Name FROM museum m JOIN visit v ON m.Museum_ID = v.Museum_ID GROUP BY m.Museum_ID, m.Name ORDER BY COUNT(v.Museum_ID) DESC LIMIT 1; 
SELECT m.Name FROM museum m LEFT JOIN visit v ON m.Museum_ID = v.Museum_ID WHERE v.ID IS NULL; 
SELECT v.Name, v.Age FROM visitor v JOIN visit v2 ON v.ID = v2.visitor_ID GROUP BY v.ID, v.Name, v.Age HAVING SUM(v2.Num_of_Ticket) = (     SELECT MAX(SUM(t.Num_of_Ticket))     FROM visit t ) 
SELECT AVG(`Num_of_Ticket`) AS Average_Tickets, MAX(`Num_of_Ticket`) AS Maximum_Tickets FROM `visit`; 
SELECT SUM(`Total_spent`) AS Total_Ticket Expense FROM visit WHERE `Level_of_membership` = 1; 
SELECT v.Name FROM visitor v JOIN visit v2 ON v.ID = v2.visitor_ID JOIN museum m1 ON v2.Museum_ID = m1.Museum_ID JOIN museum m2 ON m1.Open_Year < '2009' AND m2.Open_Year > '2011' WHERE m1.Open_Year < '2009' AND m2.Open_Year > '2011'; 
SELECT COUNT(visitor.ID) AS Non_Recent_Visitors FROM visitor LEFT JOIN visit ON visitor.ID = visit.visitor_ID WHERE visit.Museum_ID IS NULL OR visit.Open_Year < '2010'; 
SELECT COUNT(*) AS Num_Museums FROM museum WHERE Open_Year >= '2008' OR Open_Year < '2013'; 
SELECT COUNT(player_id) AS total_players FROM players; 
SELECT COUNT(*) AS "Number of Players" FROM players; 
SELECT COUNT(match_num) AS total_matches FROM matches; 
SELECT COUNT(*) AS match_count FROM matches; 
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'; 
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'; 
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches JOIN players ON matches.loser_id = players.player_id JOIN players AS winner ON matches.winner_id = winner.player_id; 
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches JOIN players ON matches.loser_id = players.player_id JOIN players AS winner ON matches.winner_id = winner.player_id; 
SELECT AVG(winner_rank) AS average_winner_rank FROM matches WHERE winner_id IN (     SELECT player_id     FROM matches     GROUP BY winner_id ) 
SELECT AVG(winner_rank) AS average_rank FROM matches WHERE winner_rank IS NOT NULL; 
SELECT MAX(loser_rank) AS highest_loser_rank FROM matches JOIN players ON matches.loser_id = players.player_id; 
SELECT MIN(winner_rank) AS best_losers_rank FROM matches WHERE winner_id IN (     SELECT player_id     FROM matches     GROUP BY loser_id     ORDER BY COUNT(*) DESC     LIMIT 1 ); 
SELECT COUNT(DISTINCT country_code) AS distinct_country_codes FROM players; 
SELECT COUNT(DISTINCT country_code) AS distinct_countries FROM players; 
SELECT COUNT(DISTINCT loser_name) AS distinct_losers FROM matches; 
SELECT COUNT(DISTINCT loser_name) AS distinct_loser_names FROM matches; 
SELECT tournament_name FROM matches GROUP BY tournament_name HAVING COUNT(*) > 10; 
SELECT tournament_name FROM matches GROUP BY tournament_name HAVING COUNT(*) > 10; 
SELECT winner_name FROM matches JOIN players ON matches.winner_id = players.player_id WHERE match_year IN (2013, 2016) 
SELECT p.first_name, p.last_name FROM players p INNER JOIN matches m ON p.player_id = m.winner_id WHERE m.year IN (2013, 2016); 
SELECT COUNT(*) AS 'Number of Matches' FROM matches WHERE year IN (2013, 2016); 
SELECT COUNT(*) AS total_matches FROM matches WHERE year IN (2013, 2016); 
SELECT p.country_code, p.first_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name IN ('WTA Championships', 'Australian Open') 
SELECT p.first_name, p.country_code FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY p.player_id, p.first_name, p.country_code HAVING COUNT(DISTINCT m.tourney_name) = 2; 
SELECT first_name, country_code FROM players WHERE birth_date = (     SELECT MIN(birth_date)     FROM players ) 
SELECT `first_name`, `country_code` FROM `players` WHERE `birth_date` = (SELECT MIN(`birth_date`) FROM `players`) 
SELECT first_name, last_name FROM players ORDER BY birth_date; 
SELECT `first_name`, `last_name` FROM players ORDER BY birth_date;
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date; 
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM players WHERE hand = 'L' ORDER BY birth_date; 
SELECT p.first_name, p.country_code FROM players p JOIN (     SELECT player_id, COUNT(*) AS tours     FROM rankings     GROUP BY player_id     ORDER BY tours DESC     LIMIT 1 ) ranked_players ON p.player_id = ranked_players.player_id; 
SELECT `first_name`, `country_code` FROM `players` JOIN `rankings` ON `players.player_id` = `rankings.player_id` GROUP BY `player_id`, `country_code` ORDER BY `tours` DESC LIMIT 1; 
SELECT year, COUNT(*) as match_count FROM matches GROUP BY year ORDER BY match_count DESC LIMIT 1; 
SELECT year, COUNT(*) as match_count FROM matches GROUP BY year ORDER BY match_count DESC LIMIT 1; 
SELECT winner_name, winner_rank_points FROM matches JOIN (     SELECT player_id, COUNT(*) AS match_wins     FROM matches     GROUP BY winner_id     ORDER BY match_wins DESC ) AS match_wins_counts ON matches.winner_id = match_wins_counts.player_id LIMIT 1; 
SELECT winner_name, SUM(ranking_points) AS total_rank_points FROM matches JOIN players ON matches.winner_id = players.player_id GROUP BY winner_name ORDER BY total_rank_points DESC LIMIT 1; 
SELECT winner_name FROM matches JOIN players ON matches.winner_id = players.player_id JOIN rankings ON players.player_id = rankings.player_id WHERE tours = 'Australian Open' AND ranking_points = (     SELECT MAX(ranking_points)     FROM rankings     WHERE tours = 'Australian Open' ) 
SELECT winner_name FROM matches JOIN rankings ON matches.winner_id = rankings.player_id WHERE tours = 'Australian Open' AND winner_ioc = 'AUS' ORDER BY ranking_points DESC LIMIT 1; 
SELECT m.loser_name AS 'Loser Name', m.winner_name AS 'Winner Name' FROM matches m JOIN players p ON m.loser_id = p.player_id AND m.winner_id = p.player_id WHERE m.minutes = (SELECT MAX(minutes) FROM matches) 
SELECT winner_name, loser_name FROM matches WHERE minutes = (SELECT MAX(minutes) FROM matches);
SELECT players.first_name, AVG(rankings.ranking) AS average_rank FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.first_name; 
SELECT players.first_name, AVG(rankings.ranking) AS average_rank FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id, players.first_name; 
SELECT players.first_name, SUM(rankings.ranking_points) AS total_ranking_points FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.first_name; 
SELECT first_name, SUM(ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY first_name; 
SELECT country_code, COUNT(*) AS player_count FROM players GROUP BY country_code; 
SELECT country_code, COUNT(*) AS player_count FROM players GROUP BY country_code; 
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50; 
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50; 
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date; 
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date; 
SELECT year, COUNT(*) AS match_count FROM matches GROUP BY year; 
SELECT year, COUNT(*) AS match_count FROM matches GROUP BY year; 
SELECT winner_name, winner_rank FROM matches JOIN players ON matches.winner_id = players.player_id WHERE winner_age = (SELECT MIN(winner_age) FROM matches) GROUP BY winner_name, winner_rank LIMIT 3; 
SELECT winner_name, winner_rank FROM matches JOIN players ON matches.winner_id = players.player_id WHERE winner_age = (     SELECT MIN(winner_age)     FROM matches     JOIN players ON matches.winner_id = players.player_id ) GROUP BY winner_name, winner_rank LIMIT 3; 
SELECT COUNT(DISTINCT winner_id) FROM matches JOIN players ON matches.winner_id = players.player_id WHERE matches.tourney_name = 'WTA Championships' AND players.hand = 'L' AND players.hand IS NOT NULL; 
SELECT COUNT(*) AS left_handed_winners FROM matches JOIN players ON matches.winner_id = players.player_id WHERE players.hand = 'L' AND tours = 'WTA Championships'; 
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.winner_rank_points = (     SELECT MAX(winner_rank_points)     FROM matches     WHERE winner_id IN (         SELECT player_id         FROM matches         GROUP BY player_id         HAVING SUM(winner_rank_points) = (             SELECT MAX(sum_rank_points)             FROM (                 SELECT player_id, SUM(winner_rank_points) as sum_rank_points                 FROM matches                 GROUP BY player_id             ) AS max_rank_points_per_player         )     ) ) 
SELECT first_name, country_code, birth_date FROM players WHERE player_id IN (   SELECT winner_id   FROM matches   GROUP BY winner_id   HAVING SUM(winner_rank_points) = (     SELECT MAX(sum_winner_rank_points)     FROM (       SELECT winner_id, SUM(winner_rank_points) as sum_winner_rank_points       FROM matches       GROUP BY winner_id     ) AS max_points_winner   ) );
SELECT hand, COUNT(*) AS player_count FROM players GROUP BY hand; 
SELECT hand, COUNT(*) AS player_count FROM players GROUP BY hand; 
SELECT COUNT(*) AS captured_ships FROM ship WHERE disposition_of_ship = 'Captured'; 
SELECT name, tonnage FROM battle JOIN ship ON battle.id = ship.lost_in_battle ORDER BY name DESC;
SELECT battle.name, battle.date, battle.result FROM battle; 
SELECT battle.name AS Battle_Name, MAX(death.injured) AS Max_Toll, MIN(death.injured) AS Min_Toll FROM battle JOIN death ON battle.id = death.caused_by_ship_id GROUP BY battle.name; 
SELECT AVG(injured) AS average_injuries FROM death; 
SELECT d.note, d.killed, d.injured FROM death d JOIN ship s ON d.caused_by_ship_id = s.id WHERE s.tonnage = 't'; 
SELECT b.name, b.result FROM battle b WHERE b.bulgarian_commander != 'Boril'; 
SELECT DISTINCT b.id, b.name FROM battle b JOIN ship s ON b.id = s.lost_in_battle WHERE s.ship_type = 'Brig'; 
SELECT b.id, b.name FROM battle b JOIN death d ON b.id = d.caused_by_ship_id GROUP BY b.id, b.name HAVING SUM(d.killed) > 10; 
SELECT s.id, s.name FROM ship s JOIN death d ON s.id = d.caused_by_ship_id GROUP BY s.id, s.name ORDER BY SUM(d.injured) DESC LIMIT 1; 
SELECT DISTINCT battle.name FROM battle WHERE battle.bulgarian_commander = 'Kaloyan' AND battle.latin_commander = 'Baldwin I'; 
SELECT COUNT(DISTINCT result) AS distinct_results FROM battle; 
SELECT COUNT(*) AS battles_no_ship_225 FROM battle WHERE NOT EXISTS (     SELECT 1     FROM ship     WHERE ship.id = battle.lost_in_battle         AND ship.tonnage = '225' ); 
SELECT b.name, b.date FROM battle b JOIN ship s ON b.id = s.lost_in_battle WHERE s.name IN ('Lettice', 'HMS Atalanta') 
SELECT b.name, b.result, b.bulgarian_commander FROM battle b WHERE b.lost_in_battle IS NULL AND b.location NOT LIKE '%English Channel%' 
SELECT d.note FROM death d JOIN ship s ON d.caused_by_ship_id = s.id WHERE d.note LIKE '%East%' 
SELECT Addresses.line_1, Addresses.line_2 FROM Addresses; 
SELECT      a.line_1 AS FirstLine,      a.line_2 AS SecondLine FROM      Addresses a 
SELECT COUNT(*) AS total_courses FROM Courses; 
SELECT COUNT(course_id) AS total_courses FROM Courses; 
SELECT c.course_description FROM Courses c WHERE c.course_name = 'Math'; 
SELECT Courses.course_description FROM Courses JOIN Student_Enrolment_Courses ON Courses.course_id = Student_Enrolment_Courses.course_id JOIN Student_Enrolment ON Student_Enrolment_Courses.student_enrolment_id = Student_Enrolment.student_enrolment_id WHERE Courses.degree_summary_name LIKE '%Math%'; 
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'; 
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'; 
SELECT Departments.department_name, Departments.department_id FROM Departments JOIN Degree_Programs ON Departments.department_id = Degree_Programs.department_id GROUP BY Departments.department_id, Departments.department_name ORDER BY COUNT(Degree_Programs.degree_program_id) DESC LIMIT 1; 
SELECT d.department_name, d.department_id FROM Departments d JOIN Degree_Programs dp ON d.department_id = dp.department_id GROUP BY d.department_id, d.department_name ORDER BY COUNT(dp.degree_program_id) DESC LIMIT 1; 
SELECT COUNT(DISTINCT Departments.department_id) AS num_departments FROM Degrees_Programs JOIN Departments ON Degrees_Programs.department_id = Departments.department_id; 
SELECT COUNT(DISTINCT Departments.department_id) AS different_departments FROM Degrees_Programs JOIN Departments ON Degrees_Programs.department_id = Departments.department_id; 
SELECT COUNT(DISTINCT degree_summary_name) AS DifferentDegreeNames FROM Degree_Programs; 
SELECT COUNT(DISTINCT Degree_Programs.degree_summary_name) AS Different_Degree_Programs FROM Degree_Programs 
SELECT COUNT(*)  FROM Degree_Programs dp WHERE dp.department_id IN (     SELECT department_id      FROM Departments      WHERE department_name = 'Engineering' ); 
SELECT COUNT(*) AS engineering_degrees FROM Degree_Programs dp JOIN Departments d ON dp.department_id = d.department_id WHERE d.department_name = 'Engineering'; 
SELECT Sections.section_name, Sections.section_description FROM Sections 
SELECT section_name, section_description FROM Sections; 
SELECT Courses.course_name, Courses.course_id FROM Courses JOIN Student_Enrolment_Courses ON Courses.course_id = Student_Enrolment_Courses.course_id GROUP BY Courses.course_id HAVING COUNT(Student_Enrolment_Courses.student_enrolment_id) <= 2; 
SELECT c.course_name, c.course_id FROM Courses c LEFT JOIN Student_Enrolment_courses sc ON c.course_id = sc.course_id GROUP BY c.course_id HAVING COUNT(sc.student_enrolment_id) < 2; 
SELECT section_name FROM Sections ORDER BY section_name DESC; 
SELECT section_name FROM Sections ORDER BY section_name DESC; 
SELECT s.semester_name, s.semester_id FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id GROUP BY s.semester_id, s.semester_name ORDER BY COUNT(se.student_id) DESC LIMIT 1; 
SELECT Semesters.semester_name, Semesters.semester_id, Courses.course_name AS most_students_course_name, MAX(Students.student_id) AS max_students FROM Semesters JOIN Student_Enrolment ON Semesters.semester_id = Student_Enrolment.semester_id JOIN Courses ON Student_Enrolment.course_id = Courses.course_id GROUP BY Semesters.semester_id, Semesters.semester_name, Courses.course_name ORDER BY max_students DESC LIMIT 1; 
SELECT d.department_description FROM Departments d WHERE d.department_name LIKE '%computer%'; 
SELECT d.department_description FROM Departments d WHERE d.department_name LIKE '%computer%'; 
SELECT s.first_name, s.middle_name, s.last_name, se.student_id FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id JOIN Semesters sm ON se.semester_id = sm.semester_id GROUP BY s.student_id HAVING COUNT(dp.degree_program_id) = 2; 
SELECT s.first_name, s.middle_name, s.last_name, s.student_id, de.degree_summary_name AS degree_program FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs de ON se.degree_program_id = de.degree_program_id JOIN Semesters sem ON se.semester_id = sem.semester_id GROUP BY s.student_id, de.degree_summary_name HAVING COUNT(de.degree_summary_name) = 2; 
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name = 'Bachelor'; 
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.department_name LIKE '%Bachelor%' 
SELECT dp.degree_summary_name, COUNT(*) AS student_count FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.department_id = se.degree_program_id GROUP BY dp.degree_summary_name ORDER BY student_count DESC LIMIT 1; 
SELECT dp.degree_summary_name, COUNT(*) AS num_students FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.department_id = se.degree_program_id GROUP BY dp.degree_summary_name ORDER BY num_students DESC LIMIT 1; 
SELECT dp.degree_program_id, dp.degree_summary_name AS Summary FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.department_id = se.degree_program_id GROUP BY dp.degree_program_id, dp.degree_summary_name ORDER BY COUNT(se.student_id) DESC LIMIT 1; 
SELECT dp.degree_program_id, dp.degree_summary_name, COUNT(*) AS total_students FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.department_id = se.degree_program_id GROUP BY dp.degree_program_id, dp.degree_summary_name ORDER BY total_students DESC LIMIT 1; 
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(*) AS enrollment_count FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id, s.first_name, s.middle_name, s.last_name ORDER BY enrollment_count DESC LIMIT 1; 
SELECT s.first_name, s.middle_name, s.last_name, s.student_id, COUNT(se.student_enrolment_id) AS enrollment_count FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id ORDER BY enrollment_count DESC LIMIT 1; 
SELECT s.semester_name FROM Semesters s LEFT JOIN Student_Enrolment se ON s.semester_id = se.semester_id WHERE se.student_enrolment_id IS NULL; 
SELECT s.semester_name FROM Semesters s LEFT JOIN Student_Enrolment se ON s.semester_id = se.semester_id WHERE se.student_id IS NULL; 
SELECT DISTINCT Courses.course_name FROM Courses INNER JOIN Student_Enrolment_Courses ON Courses.course_id = Student_Enrolment_Courses.course_id INNER JOIN Student_Enrolment ON Student_Enrolment_Courses.student_enrolment_id = Student_Enrolment.student_enrolment_id 
SELECT DISTINCT Courses.course_name FROM Courses INNER JOIN Student_Enrolment_Courses ON Courses.course_id = Student_Enrolment_Courses.course_id GROUP BY Courses.course_id HAVING COUNT(Student_Enrolment_Courses.student_enrolment_id) > 0; 
SELECT Courses.course_name, COUNT(*) AS enrollment_count FROM Student_Enrolment JOIN Courses ON Student_Enrolment.course_id = Courses.course_id GROUP BY Courses.course_id, Courses.course_name ORDER BY enrollment_count DESC LIMIT 1; 
SELECT Courses.course_name, COUNT(Student_Enrolment.student_id) AS enrolled_students FROM Courses JOIN Student_Enrolment ON Courses.course_id = Student_Enrolment.course_id GROUP BY Courses.course_id, Courses.course_name ORDER BY enrolled_students DESC LIMIT 1; 
SELECT DISTINCT last_name  FROM Students  WHERE current_address_id IN (     SELECT address_id      FROM Addresses      WHERE state_province_county = 'North Carolina' ) AND degree_program_id IS NULL; 
SELECT DISTINCT S.last_name FROM Students S INNER JOIN Addresses A ON S.permanent_address_id = A.address_id WHERE A.country = 'North Carolina' AND S.student_enrolment_id IS NULL; 
SELECT t.transcript_date, t.transcript_id FROM Transcripts t JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id HAVING COUNT(DISTINCT tc.student_course_id) >= 2; 
SELECT T1.transcript_date, T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(T2.student_course_id) >= 2; 
SELECT s.cell_mobile_number FROM Students s WHERE s.first_name = 'Timmothy' AND s.last_name = 'Ward'; 
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'; 
SELECT s.first_name, s.middle_name, s.last_name FROM Students s WHERE date_first_registered = (     SELECT MIN(date_first_registered)     FROM Students ); 
SELECT s.first_name, s.middle_name, s.last_name FROM Students s WHERE s.date_first_registered = (     SELECT MIN(date_first_registered)     FROM Students ) 
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id JOIN Semesters se2 ON se.semester_id = se2.semester_id JOIN Transcripts t ON se.student_enrolment_id = t.student_enrolment_id WHERE t.transcript_date = (     SELECT MIN(transcript_date) AS earliest_transcript_date     FROM Transcripts ) 
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id JOIN Semesters sem ON se.semester_id = sem.semester_id JOIN Transcripts t ON se.student_enrolment_id = t.student_enrolment_id WHERE t.transcript_date = (     SELECT MIN(transcript_date)     FROM Transcripts ) 
SELECT Students.first_name, Students.last_name FROM Students WHERE Students.permanent_address_id <> Students.current_address_id; 
SELECT s.first_name  FROM Students s WHERE s.permanent_address_id <> s.current_address_id; 
SELECT a.address_id, GROUP_CONCAT(a.line_1, ', ', a.line_2, ', ', COALESCE(a.line_3, ''), ', ', a.city, ', ', a.zip_postcode) AS full_address FROM Addresses a JOIN Students s ON a.current_address_id = s.current_address_id GROUP BY a.address_id ORDER BY COUNT(s.student_id) DESC LIMIT 1; 
SELECT a.address_id, a.line_1, a.line_2 FROM Addresses a JOIN Students s ON a.address_id = s.current_address_id JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id GROUP BY a.address_id, a.line_1, a.line_2 ORDER BY COUNT(se.student_id) DESC LIMIT 1; 
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts; 
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts; 
SELECT t.transcript_date, tc.student_course_id, c.course_name, c.course_description FROM Transcripts t JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id JOIN Student_Enrolment_Courses sc ON tc.student_course_id = sc.student_course_id JOIN Courses c ON sc.course_id = c.course_id WHERE t.transcript_date = (     SELECT MIN(transcript_date)     FROM Transcripts     WHERE student_enrolment_id IN (         SELECT se.student_enrolment_id         FROM Student_Enrolment se         GROUP BY se.student_id         LIMIT 1     ) ) 
SELECT MIN(transcript_date) AS earliest_transcript_date,         T2.student_id,         T2.first_name,         T2.middle_name,         T2.last_name,         T1.course_id,         T1.section_name,         T1.transcript_date FROM Transcripts T1 JOIN Student_Enrolment_Courses T2 ON T1.student_course_id = T2.student_course_id GROUP BY T1.student_id, T1.course_id, T1.section_name, T1.transcript_date; 
SELECT COUNT(*) AS total_transcripts FROM Transcripts; 
SELECT COUNT(*) AS transcript_count FROM Transcripts; 
SELECT MAX(transcript_date) AS last_transcript_release_date FROM Transcripts; 
SELECT MAX(transcript_date) AS last_transcript_date FROM Transcripts; 
SELECT s.student_enrolment_id, COUNT(*) AS max_transcripts FROM Student_Enrolment se JOIN Student_Enrolment_Courses sce ON se.student_enrolment_id = sce.student_enrolment_id JOIN Transcripts t ON sce.course_id = t.course_id GROUP BY s.student_enrolment_id 
SELECT c.course_id, MAX(te.student_enrolment_id) AS max_enrollment_id FROM Courses c JOIN Student_Enrolment_Courses sce ON c.course_id = sce.course_id JOIN Transcripts t ON sce.student_course_id = t.student_course_id GROUP BY c.course_id 
SELECT t.transcript_date, transcript_id FROM Transcripts t JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id MIN_COUNT = COUNT(tc.student_course_id) ORDER BY MIN_COUNT ASC LIMIT 1; 
SELECT t.transcript_date, t.transcript_id FROM Transcripts t INNER JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id, t.transcript_date HAVING COUNT(tc.student_course_id) = (     SELECT MIN(count)     FROM (         SELECT COUNT(*) AS count         FROM Transcript_Contents         GROUP BY transcript_id     ) AS min_counts ) ORDER BY count ASC LIMIT 1; 
SELECT Semesters.semester_name FROM Students JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Students.degrees = 'Bachelor' AND EXISTS (     SELECT 1 FROM Students AS bachelor_students     JOIN Student_Enrolment AS bachelor_enrolment ON bachelor_students.student_id = bachelor_enrolment.student_id     JOIN Degree_Programs AS bachelor_degrees ON bachelor_enrolment.degree_program_id = bachelor_degrees.degree_program_id     WHERE bachelor_students.degrees = 'Master' AND bachelor_enrolment.semester_id = Student_Enrolment.semester_id ) 
SELECT Semesters.semester_id FROM Semesters JOIN Student_Enrolment AS se ON Semesters.semester_id = se.semester_id JOIN Degree_Programs AS dp ON se.degree_program_id = dp.degree_program_id JOIN Courses AS c ON dp.department_id = Courses.department_id WHERE dp.degree_summary_name IN ('Bachelor', 'Master') AND EXISTS (     SELECT 1     FROM Student_Enrolment AS se2     JOIN Courses AS c2 ON se2.course_id = c2.course_id     WHERE se2.student_id != se.student_id AND c2.course_name IN ('Bachelor Program', 'Bachelor Course', 'Master Program', 'Master Course') ); 
SELECT COUNT(DISTINCT current_address_id) AS distinct_current_addresses FROM Students; 
SELECT DISTINCT Addresses.address_id, line_1, city, country FROM Addresses JOIN Students ON Addresses.address_id = Students.current_address_id OR Addresses.address_id = Students.permanent_address_id; 
SELECT * FROM Students ORDER BY last_name, middle_name, first_name ASC; 
SELECT other_student_details FROM Students ORDER BY last_name DESC;
SELECT * FROM Sections; 
SELECT section_description FROM Sections WHERE section_name = 'h'; 
SELECT s.first_name FROM Students s JOIN Addresses pa ON s.permanent_address_id = pa.address_id JOIN Countries c ON pa.country = c.country WHERE c.country = 'Haiti' OR s.cell_mobile_number = '09700166582'; 
SELECT DISTINCT s.first_name  FROM Students s JOIN Addresses pa ON s.permanent_address_id = pa.address_id JOIN Countries c ON pa.country = c.country WHERE c.country = 'Haiti' OR s.cell_mobile_number = '09700166582'; 
SELECT Title FROM Cartoon ORDER BY Title ASC;
SELECT Title FROM Cartoon ORDER BY Title ASC; 
SELECT * FROM Cartoon WHERE Directed_by = 'Ben Jones'; 
SELECT Cartoon.Title FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Directed_by = 'Ben Jones'; 
SELECT COUNT(*)  FROM Cartoon WHERE Written_by = 'Joseph Kuhr'; 
SELECT COUNT(*) AS cartoon_count FROM Cartoon WHERE Written_by = 'Joseph Kuhr'; 
SELECT Cartoon.Title, Cartoon.Directed_by FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id ORDER BY Cartoon.Original_air_date; 
SELECT Cartoon.Title, Directed_by FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id ORDER BY Cartoon.Original_air_date; 
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti'); 
SELECT Cartoon.Title FROM Cartoon INNER JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Cartoon DIRECTED_BY 'Ben Jones' OR Cartoon.Written_by 'Brandon Vietti'; 
SELECT Country, COUNT(*) AS NumChannels FROM TV_Channel GROUP BY Country ORDER BY NumChannels DESC LIMIT 1; 
SELECT Country, COUNT(*) AS ChannelCount FROM TV_Channel GROUP BY Country ORDER BY ChannelCount DESC LIMIT 1; 
SELECT COUNT(DISTINCT `series_name`, `Content`) AS 'Number_of_Different_Series' FROM TV_Channel; 
SELECT COUNT(DISTINCT tv.Channel), COUNT(DISTINCT tv.Content) FROM TV_Channel tv; 
SELECT `Content`  FROM `TV_Channel`  WHERE `series_name` = 'Sky Radio'; 
SELECT Content FROM TV_series WHERE Channel = 'Sky Radio'; 
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'; 
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'; 
SELECT COUNT(*) AS "Number of English Channels" FROM TV_Channel WHERE Language = 'English'; 
SELECT COUNT(*) AS EnglishChannels FROM TV_Channel WHERE Language = 'English'; 
SELECT Language, COUNT(*) AS ChannelCount FROM TV_Channel GROUP BY Language ORDER BY ChannelCount ASC LIMIT 1; 
SELECT Language, COUNT(*) AS ChannelCount FROM TV_Channel GROUP BY Language ORDER BY ChannelCount ASC LIMIT 1; 
SELECT Language, COUNT(*) AS ChannelCount FROM TV_Channel GROUP BY Language; 
SELECT Language, COUNT(*) AS ChannelCount FROM TV_Channel GROUP BY Language; 
SELECT TV_Channel.series_name FROM TV_Channel INNER JOIN TV_series ON TV_Channel.id = TV_series.Channel WHERE TV_series.Title = 'The Rise of the Blue Beetle!';
SELECT T2.series_name FROM `TV_Channel` AS T1 INNER JOIN `TV_series` AS T2 ON T1.id = T2.Channel WHERE T2.title = 'The Rise of the Blue Beetle';
SELECT Title FROM Cartoon WHERE Channel = (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio'); 
SELECT Title FROM Cartoon WHERE Channel IN (     SELECT id     FROM TV_Channel     WHERE series_name = 'Sky Radio' ); 
SELECT Episode, Rating FROM TV_series ORDER BY Rating; 
SELECT * FROM TV_series ORDER BY Rating; 
SELECT T2.Episode, T2.Rating FROM TV_series AS T1 JOIN TV_series AS T2 ON T1.Channel = T2.Channel WHERE T1.Rating = (     SELECT MAX(Rating)     FROM TV_series     WHERE Channel = T1.Channel ) ORDER BY T2.Rating DESC LIMIT 3; 
SELECT TOP 3 T2.Episode, T2.Rating FROM TV_series AS T1 INNER JOIN TV_Channel AS T2 ON T1.Channel = T2.id ORDER BY T2.Rating DESC; 
SELECT MIN(Share), MAX(Share) FROM TV_series; 
SELECT MIN(`Share`) AS MinimumShare, MAX(`Share`) AS MaximumShare FROM `TV_series`; 
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime';
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT TV_Channel.series_name FROM TV_Channel JOIN TV_series ON TV_Channel.id = TV_series.Channel WHERE TV_series.Episode = 'A Love of a Lifetime'; 
SELECT Series_Name FROM TV_series WHERE Episode = 'A Love of a Lifetime'; 
SELECT TV_series.Episode FROM TV_series INNER JOIN TV_Channel ON TV_series.Channel = TV_Channel.id WHERE TV_Channel.series_name = 'Sky Radio'; 
SELECT Episode FROM TV_series WHERE Channel = 'Sky Radio'; 
SELECT Directed_by, COUNT(*) AS 'Number_of_Cartoons' FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Channel IN (700, 701, 703, 704) -- List of directors' channels GROUP BY Directed_by; 
SELECT Directed_by, COUNT(*) AS Number_of_Cartoons FROM Cartoon GROUP BY Directed_by; 
SELECT Production_code, Channel FROM Cartoon WHERE Original_air_date = (SELECT MAX(Original_air_date) FROM Cartoon);
SELECT Cartoon.production_code, Cartoon.Channel FROM Cartoon INNER JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.id IN (     SELECT MAX(id) AS MaxId     FROM Cartoon ) 
SELECT Package_Option, Series_name FROM TV_Channel WHERE Hight_definition_TV = 'yes'; 
SELECT Package_Option, `Series_name` FROM TV_Channel WHERE Hight_definition_TV = 'yes'; 
SELECT DISTINCT T2.Country FROM TV_Channel T1 JOIN TV_series T2 ON T1.id = T2.Channel JOIN Cartoon C ON T2.id = C.Channel WHERE C.Written_by = 'Todd Casey'; 
SELECT DISTINCT T2.Country FROM TV_series AS T1 JOIN Cartoon AS T2 ON T1.Channel = T2.Channel WHERE T2.Written_by = 'Todd Casey'; 
SELECT DISTINCT T2.Country FROM TV_Channel T1 JOIN TV_series T2 ON T1.id = T2.Channel JOIN Cartoon C ON T2.id = C.Channel WHERE C.Written_by = 'Todd Casey' AND T1.id IS NULL; 
SELECT DISTINCT T2.Country FROM TV_Channel AS T1 JOIN TV_series AS T3 ON T1.id = T3.Channel JOIN Cartoon AS T4 ON T3.id = T4.id WHERE T4.Written_by = 'Todd Casey' EXCEPT SELECT DISTINCT T2.Country FROM TV_Channel AS T1 JOIN TV_series AS T3 ON T1.id = T3.Channel; 
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 INNER JOIN Cartoon AS C ON T1.id = C.Channel WHERE C.Directed_by IN ('Ben Jones', 'Michael Chang') 
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.directed_by IN ('Ben Jones', 'Michael Chang') 
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'; 
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'; 
SELECT TV_Channel.id FROM TV_Channel GROUP BY Country HAVING COUNT(*) > 2; 
SELECT c.id FROM TV_Channel c JOIN TV_Channel cc ON c.id = cc.id GROUP BY c.id HAVING COUNT(*) > 2;
SELECT TV_Channel.id FROM TV_Channel LEFT JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon Directed_by = 'Ben Jones' IS NULL; 
SELECT TV_Channel.id FROM TV_Channel LEFT JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon Directed_by = 'Ben Jones' IS NULL; 
SELECT Package_Option FROM TV_Channel WHERE Channel NOT IN (     SELECT Channel     FROM Cartoon     WHERE Directed_by = 'Ben Jones' ) 
SELECT Package_Option FROM TV_Channel WHERE Channel NOT IN (     SELECT Channel     FROM Cartoon     WHERE Directed_by = 'Ben Jones' ) 
SELECT COUNT(*) FROM poker_player;
SELECT COUNT(*) AS "Number_of_Poker_Players" FROM poker_player; 
SELECT Earnings FROM poker_player ORDER BY Earnings DESC; 
SELECT Earnings FROM poker_player ORDER BY Earnings DESC; 
SELECT p.Poker_Player_ID, p.Final_Table_Made, p.Best_Finish FROM poker_player p JOIN people pe ON p.People_ID = pe.People_ID; 
SELECT p.Poker_Player_ID, p.Final_Table_Made, p.Best_Finish FROM poker_player p JOIN people pe ON p.People_ID = pe.People_ID; 
SELECT AVG(`Earnings`) AS Average_Earnings FROM poker_player; 
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player; 
SELECT Money_Rank FROM poker_player WHERE Earnings = (SELECT MAX(Earnings) FROM poker_player);
SELECT Money_Rank FROM poker_player WHERE Earnings = (SELECT MAX(Earnings) FROM poker_player);
SELECT COUNT("Poker_Player_ID") AS Max_Final_Tables_Made FROM poker_player WHERE "Earnings" < 200000 GROUP BY "Poker_Player_ID" ORDER BY Max_Final_Tables_Made DESC LIMIT 1; 
SELECT MAX("Final_Table_Made") AS max_final_tables FROM poker_player WHERE "Earnings" < 200000; 
SELECT Name FROM poker_player;
SELECT `Poker_Player_Name` FROM `poker_player` JOIN `people` ON `poker_player.People_ID` = `people.People_ID`;
SELECT Name FROM poker_player WHERE Earnings > 300000;
SELECT p.Name FROM poker_player p JOIN people pe ON p.People_ID = pe.People_ID WHERE p.Earnings > 300000; 
SELECT `Name` FROM `poker_player` ORDER BY `Final_Table_Made` ASC;
SELECT `Name` FROM `poker_player` JOIN `people` ON `poker_player.People_ID` = `people.People_ID` ORDER BY `Final_Table_Made` ASC;
SELECT Birth_Date FROM poker_player INNER JOIN people ON poker_player.People_ID = people.People_ID WHERE Earnings = (SELECT MIN(Earnings) FROM poker_player) 
SELECT `Birth_Date` FROM `people` AS p JOIN `poker_player` AS pp ON p.`People_ID` = pp.`People_ID` WHERE pp.`Earnings` = (SELECT MIN(`Earnings`) FROM `poker_player`) 
SELECT Money_Rank FROM poker_player WHERE People_ID IN (     SELECT People_ID     FROM people     ORDER BY Height DESC     LIMIT 1 ) 
SELECT Money_Rank FROM poker_player WHERE People_ID IN (SELECT People_ID FROM people WHERE Height = (SELECT MAX(Height) FROM people)) ORDER BY Money_Rank DESC LIMIT 1;
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE people.Height > 200; 
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE people.Height > 200; 
SELECT Name FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID ORDER BY Earnings DESC; 
SELECT Name FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID ORDER BY Earnings DESC; 
SELECT Nationality, COUNT(*) AS NumberOfPeople FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID GROUP BY Nationality; 
SELECT Nationality, COUNT(*) AS NumberOfPeople FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID GROUP BY Nationality; 
SELECT Nationality, COUNT(*) AS nation_count FROM people GROUP BY Nationality ORDER BY nation_count DESC LIMIT 1; 
SELECT Nationality, COUNT(*) AS MostCommonNationalityCount FROM people GROUP BY Nationality ORDER BY MostCommonNationalityCount DESC LIMIT 1; 
SELECT DISTINCT Nationality FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID GROUP BY Nationality HAVING COUNT(DISTINCT poker_player.People_ID) >= 2; 
SELECT Nationality FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID GROUP BY Nationality HAVING COUNT(*) > 1;
SELECT Name, Birth_Date FROM people ORDER BY Name ASC; 
SELECT Name, Birth_Date FROM people ORDER BY Name ASC;
SELECT Name FROM people WHERE Nationality != 'Russia'; 
SELECT Name FROM people WHERE Nationality != 'Russia';
SELECT p.Name FROM people p LEFT JOIN poker_player pp ON p.People_ID = pp.People_ID WHERE pp.Poker_Player_ID IS NULL; 
SELECT Name FROM people WHERE People_ID NOT IN (SELECT Poker_Player_ID FROM poker_player); 
SELECT COUNT(DISTINCT Nationality) FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID; 
SELECT COUNT(DISTINCT Nationality) AS 'Number of Different Nationalities' FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID; 
SELECT COUNT(*) AS 'Number of States' FROM AREA_CODE_STATE; 
SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC; 
SELECT vote_id, phone_number, state FROM VOTES; 
SELECT MIN(area_code) AS Minimum_Area_Code, MAX(area_code) AS Maximum_Area_Code FROM AREA_CODE_STATE; 
SELECT MAX(created) AS last_date_created FROM VOTES WHERE state = 'CA'; 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'; 
SELECT DISTINCT state, created FROM VOTES; 
SELECT c.contestant_number, c.contestant_name FROM Contestants c JOIN Votes v ON c.contestant_number = v.contestant_number GROUP BY c.contestant_number, c.contestant_name HAVING COUNT(v.vote_id) >= 2; 
SELECT contestant_number, contestant_name FROM CONTESTANTS JOIN VOTES ON CONTESTANTS.contestant_number = VOTES.contestant_number GROUP BY contestant_number, contestant_name ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT COUNT(*) AS vote_count FROM VOTES WHERE state IN ('NY', 'CA'); 
SELECT COUNT(*) AS unvoted_contestants FROM CONTESTANTS LEFT JOIN VOTES ON CONTESTANTS.contestant_number = VOTES.contestant_number WHERE VOTES.vote_id IS NULL; 
SELECT a.area_code AS Most_Voted_Area FROM AREA_CODE_STATE a JOIN VOTES v ON a.state = v.state GROUP BY a.area_code ORDER BY COUNT(v.vote_id) DESC LIMIT 1; 
SELECT created, state, phone_number FROM VOTES WHERE contestant_name = 'Tabatha Gehling'; 
SELECT DISTINCT area_code FROM VOTES WHERE contestant_number IN (     SELECT contestant_number     FROM CONTESTANTS     WHERE contestant_name IN ('Tabatha Gehling', 'Kelly Clauss') ) 
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'; 
SELECT Name FROM country WHERE IndepYear > 1950; 
SELECT Name FROM country WHERE IndepYear > 1950; 
SELECT COUNT(*)  FROM country  WHERE GovernmentForm = 'Republic'; 
SELECT COUNT(*)  FROM country  WHERE GovernmentForm = 'Republic'; 
SELECT SUM(`SurfaceArea`) AS Total_Surface_Area FROM country WHERE `Continent` = 'Caribbean'; 
SELECT SUM(`SurfaceArea`) AS TotalSurfaceArea FROM country WHERE Continent = 'Caribbean'; 
SELECT Continent FROM country WHERE Code = 'VGB'; -- Assuming 'VGB' is the code for Anguilla (it might be different if it uses a different ISO code) 
SELECT c.Name AS Continent FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' -- Assuming Anguilla's official language is English AND c.Code = 'AIA' -- Country code for Anguilla (which is not in the provided schema, but assuming it's correct) 
SELECT Region FROM city WHERE Name = 'Kabul'; 
SELECT Region  FROM city  WHERE Name = 'Kabul' AND CountryCode = (SELECT Code FROM country WHERE Name = 'Afghanistan'); 
SELECT Language, SUM(Percentage) AS TotalPercentage FROM countrylanguage WHERE CountryCode = 'AWA' -- Aruba's country code (replace 'AWA' with 'SUR' for Suriname, if needed) GROUP BY Language ORDER BY TotalPercentage DESC LIMIT 1; 
SELECT Language  FROM countrylanguage  WHERE CountryCode = 'AWU' -- Assuming 'AWU' is the abbreviation for Aruba (assuming it's in the countrycode column) AND IsOfficial = 'T' -- T for 'official' LIMIT 1; 
SELECT c.Population, c.LifeExpectancy FROM country AS c WHERE c.Name = 'Brazil'; 
SELECT c.Population, c.LifeExpectancy FROM country AS c WHERE c.Name = 'Brazil'; 
SELECT Region, Population FROM country WHERE Code = 'AGO'; 
SELECT Region, Population FROM country WHERE Code = 'AGO'; 
SELECT AVG(`LifeExpectancy`) AS AverageLifeExpectancy FROM country WHERE `Continent` = 'Central Africa'; 
SELECT AVG(`LifeExpectancy`) AS AverageLifeExpectancy FROM `country` WHERE `Continent` = 'Central Africa'; 
SELECT `Name` FROM `country` WHERE `Continent` = 'Asia' AND `LifeExpectancy` = (SELECT MIN(`LifeExpectancy`) FROM `country` WHERE `Continent` = 'Asia') 
SELECT `Name`  FROM `country`  WHERE `Continent` = 'Asia'  ORDER BY `LifeExpectancy` ASC  LIMIT 1; 
SELECT SUM(`Population`) AS TotalPopulation, MAX(`GNP`) AS MaxGNP FROM city c JOIN country c2 ON c.CountryCode = c2.Code WHERE c2.Continent = 'Asia'; 
SELECT COUNT(*) AS total_people_in_Asia, MAX(GNP) AS largest_GNP FROM city c JOIN country co ON c.CountryCode = co.Code WHERE co.Continent = 'Asia'; 
SELECT AVG(`LifeExpectancy`) AS avg_life_expectancy FROM `country` WHERE `Continent` = 'Africa' AND `GovernmentForm` = 'Republic'; 
SELECT AVG(`LifeExpectancy`) AS avg_life_expectancy FROM country WHERE `Continent` = 'Africa' AND `GovernmentForm` = 'Republic'; 
SELECT SUM(`SurfaceArea`) AS TotalSurfaceArea FROM `country` WHERE `Continent` IN ('Asia', 'Europe'); 
SELECT SUM(`SurfaceArea`) AS TotalSurfaceArea FROM country WHERE `Continent` IN ('Asia', 'Europe'); 
SELECT SUM(`Population`) AS PopulationInGelderland FROM city WHERE `District` = 'Gelderland'; 
SELECT SUM(`Population`) AS TotalPopulation FROM `city` WHERE `District` = 'Gelderland'; 
SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm = 'US'; 
SELECT AVG(GNP) AS MeanGNP, SUM(Population) AS TotalPopulation FROM country WHERE GovernmentForm = 'US Territory'; 
SELECT COUNT(DISTINCT Language) FROM countrylanguage; 
SELECT COUNT(DISTINCT Language)  FROM countrylanguage; 
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'; 
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'; 
SELECT SUM(`Percentage`) AS TotalLanguagesUsedInAruba FROM countrylanguage WHERE `CountryCode` = 'AWU' -- Assuming Aruba's code is 'AWU' 
SELECT COUNT(*) AS LanguageCount FROM countrylanguage WHERE CountryCode = 'AWU' -- Assuming 'AWU' is the code for Aruba 
SELECT COUNT(*) AS OfficialLanguages FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'; 
SELECT COUNT(*) AS OfficialLanguages FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'; 
SELECT c.Name AS CountryName FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Code, c.Name ORDER BY SUM(cl.Percentage) DESC LIMIT 1; 
SELECT c.Name AS NationName, COUNT(*) AS LanguageCount FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name ORDER BY LanguageCount DESC LIMIT 1; 
SELECT c.Continent, SUM(c.Language != '官方语言' OR c.Percentage <> 100) AS LanguageDiversity FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode GROUP BY c.Continent ORDER BY LanguageDiversity DESC LIMIT 1; 
SELECT `Continent`, SUM(`Percentage`) AS TotalPercentage FROM `countrylanguage` GROUP BY `Continent` ORDER BY TotalPercentage DESC LIMIT 1; 
SELECT COUNT(*)  FROM countrylanguage  WHERE CountryCode IN (     SELECT CountryCode      FROM countrylanguage      WHERE Language = 'English'      AND CountryCode IN (         SELECT CountryCode          FROM countrylanguage          WHERE Language = 'Dutch'     ) ); 
SELECT COUNT(DISTINCT c.Code) AS NumCountriesEnglishDutch FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'Dutch'); 
SELECT c.Name AS NationName FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'French') AND cl.IsOfficial = 'T'; 
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'French') AND cl.IsOfficial = 'T'; 
SELECT c.Name  FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' AND cl.Language = 'French' AND cl.IsOfficial = 'T' 
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'French') AND cl.IsOfficial = 'T'; 
SELECT COUNT(DISTINCT Continent)  FROM countrylanguage AS cl  JOIN country AS c ON cl.CountryCode = c.Code  WHERE Language = 'Chinese'; 
SELECT COUNT(*) AS 'Number of Continents' FROM countrylanguage WHERE Language = 'Chinese'; 
SELECT Region FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE Language IN ('English', 'Dutch') 
SELECT Region FROM country WHERE CountryCode IN (     SELECT CountryCode     FROM countrylanguage     WHERE Language IN ('Dutch', 'English') ) 
SELECT c.Name AS Country, c.Language AS OfficialLanguage FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.IsOfficial IN ('T', 'F') -- 'T' for English, 'F' for Dutch 
SELECT c.Code, c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'Dutch') AND cl.IsOfficial = 'T'; 
SELECT Language, SUM(Percentage) AS TotalPercentage FROM countrylanguage WHERE Continent = 'Asia' AND IsOfficial = 'T' GROUP BY Language ORDER BY TotalPercentage DESC LIMIT 1; 
SELECT Language, SUM(Percentage) AS TotalPercentage FROM countrylanguage WHERE Continent = 'Asia' AND IsOfficial = 'T' GROUP BY Language ORDER BY TotalPercentage DESC LIMIT 1; 
SELECT Language FROM countrylanguage WHERE CountryCode IN (     SELECT Code     FROM country     WHERE GovernmentForm = 'Republic' AND HeadOfState IS NOT NULL ) GROUP BY Language HAVING COUNT(*) = 1; 
SELECT Language  FROM countrylanguage  WHERE CountryCode IN (     SELECT Code      FROM country      WHERE GovernmentForm = 'Republic'      GROUP BY Code      HAVING COUNT(*) = 1 ) 
SELECT c.Name AS City_Name, c.Population AS Population FROM city c JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode WHERE cl.Language = 'English' AND c.Population = (SELECT MAX(Population) FROM city) 
SELECT c.Name AS CityName, c.Population AS Population FROM city c JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode WHERE cl.Language = 'English' AND c.Population = (SELECT MAX(Population) FROM city) 
SELECT c.Name, c.Population, c.LifeExpectancy FROM country c WHERE c.Continent = 'Asia' AND c.SurfaceArea = (     SELECT MAX(SurfaceArea)     FROM country     WHERE Continent = 'Asia' ) 
SELECT c.Name AS CountryName, c.Population, c.LifeExpectancy FROM country c WHERE c.Continent = 'Asia' AND c.SurfaceArea = (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Asia') 
SELECT AVG(`LifeExpectancy`) AS AverageLifeExpectancy FROM country WHERE `Language` != 'English' AND `IsOfficial` = 'F'; 
SELECT AVG(`LifeExpectancy`) AS MeanLifeExpectancy FROM `country` WHERE `IsOfficial` != 'T' AND `Language` LIKE '%English%'; 
SELECT SUM(T2.Population) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language <> 'English'; 
SELECT SUM(c.Population) FROM country c LEFT JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language <> 'English'; 
SELECT Language FROM countrylanguage WHERE CountryCode IN (     SELECT Code     FROM country     WHERE HeadOfState = 'Beatrix' ) AND IsOfficial = 'T'; 
SELECT Language FROM countrylanguage WHERE CountryCode IN (     SELECT Code     FROM country     WHERE HeadOfState = 'Beatrix' ) AND IsOfficial = 'T'; 
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE CountryCode IN (     SELECT Code     FROM country     WHERE IndepYear < 1930 ) AND IsOfficial = 'T'; 
SELECT SUM(CASE WHEN T2.IndepYear < 1930 THEN 1 ELSE 0 END) AS TotalDistinctOfficialLanguages FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.IsOfficial = 'T'; 
SELECT c.Name AS Country FROM country c WHERE c.Continent = 'Asia' AND c.SurfaceArea > (     SELECT MAX(SurfaceArea) AS MaxSurfaceArea     FROM country WHERE Continent = 'Europe' ); 
SELECT c.Code FROM country c WHERE c.Continent = 'Asia' AND c.SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe'); 
SELECT c.Name AS Country FROM country c WHERE c.Continent = 'Africa' AND c.Population < (     SELECT MIN(Population)     FROM country     WHERE Continent = 'Asia' ); 
SELECT c.CountryCode FROM country AS c WHERE c.Continent = 'Africa' AND c.Population < (     SELECT MAX(c2.Population)     FROM country AS c2     WHERE c2.Continent = 'Asia' ); 
SELECT c.Name, c.Continent FROM country c JOIN (     SELECT MAX(Population) AS MaxPop_Africa     FROM country     WHERE Continent = 'Africa' ) af_max ON c.Population > af_max.MaxPop_Africa WHERE c.Continent = 'Asia' 
SELECT c.CountryCode, c.Name AS Country FROM country c WHERE c.Continent = 'Asia' AND c.Population > (     SELECT MAX(Population)     FROM country d     WHERE d.Continent = 'Africa' ); 
SELECT CountryCode FROM countrylanguage WHERE Language = 'English' IS FALSE; 
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'; 
SELECT CountryCode FROM country WHERE CountryCode IN (     SELECT CountryCode     FROM countrylanguage     WHERE Language != 'English' AND IsOfficial = 'T' ) 
SELECT c.Code FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language != 'English'; 
SELECT c.Code FROM country c WHERE c.Language != 'English' AND c.GovernmentForm != 'Republic'; 
SELECT c.Code FROM country c WHERE c.GovernmentForm != 'Republic' AND c.Language NOT LIKE 'Eng%' ; 
SELECT c.Name AS City FROM city c JOIN country c2 ON c.CountryCode = c2.Code JOIN countrylanguage cl ON c2.Code = cl.CountryCode AND cl.Language != 'English' WHERE c2.Continent = 'Europe'; 
SELECT c.Name  FROM city c JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode WHERE cl.Language <> 'English' AND cl.IsOfficial = 'F' AND cl.Continent = 'Europe'; 
SELECT DISTINCT city.Name FROM city INNER JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Chinese' AND country.Continent = 'Asia'; 
SELECT DISTINCT c.Name FROM city c JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode WHERE c.Continent = 'Asia' AND cl.Language = 'Chinese' AND cl.IsOfficial = 'T'; 
SELECT Name, IndepYear, SurfaceArea FROM country WHERE Population = (SELECT MIN(Population) FROM country) 
SELECT c.Name, c.IndepYear, c.SurfaceArea FROM country c WHERE c.Population = (SELECT MIN(Population) FROM country) 
SELECT c.Population, c.Name, c.HeadOfState FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE c.SurfaceArea = (SELECT MAX(SurfaceArea) FROM country) 
SELECT c.Name, c.Population, c.HeadOfState FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE c.SurfaceArea = (SELECT MAX(SurfaceArea) FROM country) 
SELECT c.Name, COUNT(*) AS LanguageCount FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Code HAVING COUNT(*) >= 3; 
SELECT c.Name AS CountryName, COUNT(*) AS LanguagesSpoken FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Code HAVING COUNT(*) > 2; 
SELECT c.District, COUNT(*) AS CityCount FROM city c JOIN country c2 ON c.CountryCode = c2.Code GROUP BY c.District HAVING AVG(c.Population) > (SELECT AVG(Population) FROM city) 
SELECT c.District, COUNT(*) AS AboveAverageCities FROM city c JOIN (   SELECT AVG(Population) AS AvgPopulation   FROM city ) avg ON c.Population > avg.AvgPopulation GROUP BY c.District; 
SELECT c.Name AS GovernmentForm, SUM(cl.Population) AS TotalPopulation FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.GovernmentForm HAVING AVG(cl.LifeExpectancy) > 72; 
SELECT c.GovernmentForm, SUM(c.Population) AS TotalPopulation FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = ' Official' -- Assuming 'Official' is the column for 'IsOfficial' being true GROUP BY c.GovernmentForm HAVING AVG(c.LifeExpectancy) > 72 
SELECT Continent, AVG(LifeExpectancy) AS AvgLifeExpectancy, SUM(Population) AS TotalPopulation FROM (   SELECT c.CountryCode, c.Continent, cl.LifeExpectancy, c.Population   FROM country c   JOIN countrylanguage cl ON c.Code = cl.CountryCode   WHERE cl.Percentage < 0.72 ) subquery GROUP BY Continent HAVING AVG(LifeExpectancy) < 72; 
SELECT Continent, SUM(Country.Population) AS TotalPopulation, AVG(LifeExpectancy) AS AverageLifeExpectancy FROM country JOIN city ON country.Code = city.CountryCode JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY Continent HAVING AVG(LifeExpectancy) < 72; 
SELECT c.Name, c.SurfaceArea FROM country AS c ORDER BY c.SurfaceArea DESC LIMIT 5; 
SELECT c.Name, c.SurfaceArea FROM country AS c ORDER BY c.Population DESC LIMIT 5; 
SELECT c.Name  FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Percentage = (SELECT MAX(Percentage) FROM countrylanguage) ORDER BY Population DESC LIMIT 3; 
SELECT Name FROM country WHERE Population = (SELECT MAX(Population) FROM country) LIMIT 3; 
SELECT Name  FROM country  WHERE Population IN (SELECT MIN(Population)                       FROM country                       ORDER BY Population ASC                       LIMIT 3); 
SELECT c.Name FROM country c INNER JOIN (     SELECT CountryCode, MIN(Population) AS MinPopulation     FROM city     GROUP BY CountryCode ) AS min_pop_cities ON c.Code = min_pop_cities.CountryCode ORDER BY MinPopulation ASC LIMIT 3; 
SELECT COUNT(*) AS "Number of Countries in Asia" FROM country WHERE Continent = 'Asia'; 
SELECT COUNT(*)  FROM country  WHERE Continent = 'Asia'; 
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE c.Continent = 'Europe' AND c.Population = 80000; 
SELECT Name  FROM country  WHERE Continent = 'Europe' AND Population = 80000; 
SELECT SUM(`Population`) AS TotalPopulation, AVG(`SurfaceArea`) AS AverageArea FROM country WHERE Continent = 'North America' AND `SurfaceArea` > 3000; 
SELECT c.CountryCode, SUM(cl.Population) AS TotalPopulation, AVG(c.SurfaceArea) AS AverageSurfaceArea FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE c.Continent = 'North America' AND c.SurfaceArea > 3000 GROUP BY c.CountryCode; 
SELECT c.Name AS City FROM city c INNER JOIN country ctry ON c.CountryCode = ctry.Code WHERE c.Population BETWEEN 160000 AND 900000; 
SELECT `City.Name` FROM `city` WHERE `Population` BETWEEN 160000 AND 900000; 
SELECT Language, SUM(Percentage) AS TotalPercentage FROM countrylanguage GROUP BY Language ORDER BY TotalPercentage DESC LIMIT 1; 
SELECT Language FROM countrylanguage GROUP BY Language HAVING SUM(Percentage) = (     SELECT MAX(Percentage)     FROM countrylanguage ) 
SELECT c.Code, cl.Language, cl.Percentage AS 'Percentage Spoken' FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode GROUP BY c.Code, cl.Language ORDER BY cl.Percentage DESC; 
SELECT Country.Code, Language.Language, MAX(Percentage) AS MaxPercentage FROM countrylanguage GROUP BY Country.Code, Language ORDER BY MaxPercentage DESC; 
SELECT COUNT(*) as TotalCountries FROM countrylanguage WHERE Language = 'spa' -- Assuming Spanish is represented as 'spa' GROUP BY CountryCode ORDER BY Percentage DESC LIMIT 1; 
SELECT COUNT(*) AS num_countries_with_spain AS西班牙为主语的国家数量 FROM countrylanguage WHERE Language = 'spa' AND Percentage = (     SELECT MAX(Percentage)     FROM countrylanguage AS cl     WHERE cl.CountryCode = countrylanguage.CountryCode ) 
SELECT `CountryCode` FROM `countrylanguage` WHERE `Language` = 'Spanish' AND `Percentage` = (SELECT MAX(`Percentage`) FROM `countrylanguage` WHERE `Language` = 'Spanish')
SELECT CountryCode  FROM countrylanguage  WHERE Language = 'Spanish' AND IsOfficial = 'T'; 
SELECT COUNT(*) AS "Number of Conductors" FROM conductor; 
SELECT COUNT(*) AS "Number of Conductors" FROM conductor; 
SELECT Name FROM conductor ORDER BY Age ASC; 
SELECT Name FROM conductor ORDER BY Age; 
SELECT Name FROM conductor WHERE Nationality != 'USA'; 
SELECT Name FROM conductor WHERE Nationality != 'USA'; 
SELECT Record_Company, Year_of_Founded FROM orchestra JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID GROUP BY Record_Company, Year_of_Founded ORDER BY Year_of_Founded DESC; 
SELECT Record_Company, Year_of_Founded FROM orchestra JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID JOIN conductor ON orchestra.Conductor_ID = conductor.Conductor_ID ORDER BY Year_of_Founded DESC; 
SELECT AVG(Attendance) AS Average_Attendance FROM show; 
SELECT AVG(Attendance) AS Average_Attendance FROM show; 
SELECT MIN(Share) AS MinShare, MAX(Share) AS MaxShare FROM performance WHERE Type != 'Live final'; 
SELECT MIN(Share), MAX(Share) FROM performance WHERE Type != 'Live final'; 
SELECT COUNT(DISTINCT Nationality) AS Different_Nationalities FROM conductor; 
SELECT COUNT(DISTINCT Nationality) AS Different_Nationalities FROM conductor; 
SELECT Name FROM conductor ORDER BY Year_of_Work DESC; 
SELECT Name FROM conductor ORDER BY Year_of_Work DESC; 
SELECT Name FROM conductor WHERE Year_of_Work = (SELECT MAX(Year_of_Work) FROM conductor); 
SELECT c.Name FROM conductor c JOIN performance p ON c.Conductor_ID = p.Conductor_ID GROUP BY c.Name, c.Year_of_Work ORDER BY SUM(p.Year_of_Founded) DESC LIMIT 1; 
SELECT c.Name AS Conductor_Name, o.Orchestra FROM conductor c JOIN performance p ON c.Conductor_ID = p.Conductor_ID JOIN orchestra o ON p.Orchestra_ID = o.Orchestra_ID; 
SELECT c.Name AS Conductor_Name, o.Orchestra FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID; 
SELECT DISTINCT c.Name FROM conductor c JOIN performance p ON c.Conductor_ID = p.Conductor_ID GROUP BY c.Name HAVING COUNT(p.Orchestra_ID) > 1; 
SELECT c.Name FROM conductor c WHERE EXISTS (     SELECT 1     FROM orchestra o     WHERE c.Conductor_ID = o.Conductor_ID     GROUP BY c.Conductor_ID     HAVING COUNT(o.Orchestra_ID) > 1 ) 
SELECT c.Name FROM conductor c JOIN performance p ON c.Conductor_ID = p.Conductor_ID GROUP BY c.Name ORDER BY COUNT(p.Orchestra_ID) DESC LIMIT 1; 
SELECT c.Name FROM conductor c GROUP BY c.Conductor_ID, c.Name HAVING COUNT(*) = (     SELECT MAX(Count_Orchestras)     FROM (         SELECT COUNT(*) AS Count_Orchestras         FROM performance p         JOIN conductor c ON p.Conductor_ID = c.Conductor_ID         GROUP BY p.Conductor_ID     ) as max_count_per_conductor ); 
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID WHERE o.Year_of_Founded > 2008; 
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID WHERE o.Year_of_Founded > 2008; 
SELECT Record_Company, COUNT(Orchestra_ID) AS NumberOfOrchestras FROM orchestra GROUP BY Record_Company; 
SELECT Record_Company, COUNT(Orchestra_ID) AS Number_of_Orchestras FROM orchestra GROUP BY Record_Company; 
SELECT Major_Record_Format, COUNT(*) AS Record_Count FROM orchestra GROUP BY Major_Record_Format ORDER BY Record_Count ASC; 
SELECT Major_Record_Format, COUNT(*) AS Frequency FROM orchestra JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID GROUP BY Major_Record_Format ORDER BY Frequency DESC; 
SELECT Record_Company, COUNT(*) AS num_orchestras FROM orchestra JOIN performance ON orchestra.Conductor_ID = performance.Orchestra_ID JOIN show ON performance.Performance_ID = show.Performance_ID GROUP BY Record_Company ORDER BY num_orchestras DESC LIMIT 1; 
SELECT Record_Company, COUNT(*) AS orchestra_count FROM orchestra GROUP BY Record_Company ORDER BY orchestra_count DESC LIMIT 1; 
SELECT Orchestra.Organization FROM orchestra LEFT JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID WHERE performance.Performance_ID IS NULL; 
SELECT o.Orchestra_ID, o. Orchestra FROM orchestra o LEFT JOIN performance p ON o. Orchestra_ID = p. Orchestra_ID WHERE p.Performance_ID IS NULL; 
SELECT Record_Company FROM orchestra JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID WHERE Year_of_Founded < 2003 OR Year_of_Founded > 2003; 
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003;
SELECT COUNT(*) AS num_orchestras FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD'); 
SELECT COUNT(*) AS Num_Orchestras FROM orchestra JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID JOIN show ON performance.Performance_ID = show.Performance_ID WHERE performance.Major_Record_Format IN ('CD', 'DVD'); 
SELECT DISTINCT Year_of_Founded FROM orchestra WHERE Orchestra_ID IN (     SELECT Orchestra_ID     FROM performance     GROUP BY Orchestra_ID     HAVING COUNT(*) > 1 ) 
SELECT o.Year_of_Founded FROM orchestra o JOIN performance p ON o.Orchestra_ID = p.Orchestra_ID GROUP BY o.Orchestra_ID HAVING COUNT(p.Performance_ID) > 1; 
SELECT COUNT(*) AS total_highschoolers FROM Highschooler; 
SELECT COUNT(*) AS TotalHighSchoolers FROM Highschooler; 
SELECT name, grade FROM Highschooler; 
SELECT h.name, h.grade FROM Highschooler h; 
SELECT DISTINCT grade FROM Highschooler; 
SELECT grade FROM Highschooler; 
SELECT grade  FROM Highschooler h  WHERE h.ID = (SELECT friend_id FROM Friend WHERE student_id = 1934); 
SELECT grade FROM Highschooler WHERE name = 'Kyle'; 
SELECT name FROM Highschooler WHERE grade = 10; 
SELECT name FROM Highschooler WHERE grade = 10; 
SELECT ID FROM Highschooler WHERE name = 'Kyle'; 
SELECT ID FROM Highschooler WHERE name = 'Kyle'; 
SELECT COUNT(*) AS Total_Students FROM Highschooler WHERE grade IN (9, 10); 
SELECT COUNT(*) AS count_grade_9_or_10 FROM Highschooler WHERE grade IN (9, 10); 
SELECT grade, COUNT(*) AS num_students FROM Highschooler GROUP BY grade; 
SELECT grade, COUNT(*) AS num_highschoolers FROM Highschooler GROUP BY grade; 
SELECT grade, COUNT(*) AS total_students FROM Highschooler GROUP BY grade ORDER BY total_students DESC LIMIT 1; 
SELECT grade, COUNT(*) AS num_students FROM Highschooler GROUP BY grade ORDER BY num_students DESC LIMIT 1; 
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4; 
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4; 
SELECT Highschooler.ID, COUNT(*) AS num_friends FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID; 
SELECT Highschooler.name, COUNT(Friend.student_id) AS num_friends FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID; 
SELECT h.name AS StudentName, COUNT(f.student_id) AS Number_of_friends FROM Highschooler h LEFT JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID; 
SELECT h.name AS high_schooler_name, COUNT(f.student_id) AS num_friends FROM Highschooler h LEFT JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID; 
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID, h.name HAVING COUNT(f.friend_id) = (     SELECT MAX(count_friends)     FROM (         SELECT student_id, COUNT(*) AS count_friends         FROM Friend         GROUP BY student_id     ) AS friend_counts     WHERE friend_counts.student_id = h.ID ); 
SELECT h.name AS student_name, COUNT(f.student_id) AS friend_count FROM Highschooler h JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID, h.name ORDER BY friend_count DESC LIMIT 1; 
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID, h.name HAVING COUNT(*) >= 3; 
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID, h.name HAVING COUNT(*) >= 3; 
SELECT DISTINCT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id WHERE Friend.friend_id = 1934; 
SELECT DISTINCT h.name FROM Highschooler h INNER JOIN Friend f ON h.ID = f.student_id WHERE f.friend_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle'); 
SELECT COUNT(*) AS num_friends FROM Friend WHERE student_id = 1934; 
SELECT COUNT(*) AS num_friends FROM Friend WHERE student_id = 1934; 
SELECT h.ID FROM Highschooler h LEFT JOIN Friend f ON h.ID = f.student_id OR h.ID = f.friend_id WHERE f.student_id IS NULL AND f.friend_id IS NULL; 
SELECT h.ID FROM Highschooler h LEFT JOIN Friend f ON h.ID = f.student_id OR h.ID = f.friend_id WHERE f.student_id IS NULL OR f.friend_id IS NULL; 
SELECT h.name FROM Highschooler h WHERE NOT EXISTS (     SELECT 1     FROM Friend f     WHERE f.student_id = h.ID OR f.friend_id = h.ID ); 
SELECT h.name FROM Highschooler h LEFT JOIN Friend f ON h.ID = f.student_id OR h.ID = f.friend_id WHERE f.student_id IS NULL AND f.friend_id IS NULL; 
SELECT h.ID FROM Highschooler h JOIN Friend f ON h.ID = f.student_id OR h.ID = f.friend_id JOIN Likes l ON h.ID = l.student_id OR h.ID = l.liked_id WHERE h.ID IS NOT NULL; 
SELECT DISTINCT h.ID FROM Highschooler h JOIN Friend f ON h.ID = f.student_id JOIN Likes l ON h.ID = l.student_id 
SELECT h.name FROM Highschooler h WHERE EXISTS (     SELECT 1     FROM Friend f     WHERE h.ID = f.student_id     OR h.ID = f.friend_id ) AND EXISTS (     SELECT 1     FROM Likes l     WHERE h.ID = l.student_id OR h.ID = l.liked_id ); 
SELECT DISTINCT h.name FROM Highschooler h INNER JOIN Friend f ON h.ID = f.student_id INNER JOIN Likes l ON h.ID = l.liked_id; 
SELECT student_id, COUNT(*) AS num_likes FROM Likes GROUP BY student_id; 
SELECT h.ID, COUNT(*) AS num_likes FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.ID; 
SELECT h.name, COUNT(*) AS num_likes FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.ID, h.name; 
SELECT h.name, COUNT(l.liked_id) AS num_likes FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.ID, h.name; 
SELECT h.name FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.ID, h.name ORDER BY COUNT(l.liked_id) DESC LIMIT 1; 
SELECT h.name AS student_name, COUNT(*) AS total_likes FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.ID, h.name ORDER BY total_likes DESC LIMIT 1; 
SELECT h.name FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.ID, h.name HAVING COUNT(l.liked_id) >= 2; 
SELECT h.name FROM Highschooler h JOIN Likes l ON h.ID = l.student_id GROUP BY h.ID, h.name HAVING COUNT(*) >= 2; 
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id OR h.ID = f.friend_id GROUP BY h.ID, h.name HAVING h.grade > 5 AND COUNT(DISTINCT CASE WHEN f.student_id = h.ID THEN f.friend_id END) >= 2; 
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id WHERE h.grade > 5 AND (     SELECT COUNT(*)      FROM Friend f2      WHERE f2.student_id = h.ID ) >= 2; 
SELECT COUNT(*) AS total_likes FROM Likes WHERE liked_id = 1934 AND student_id = 12; 
SELECT COUNT(*) AS num_likes FROM Likes l JOIN Highschooler h ON l.student_id = h.ID AND h.name = 'Kyle' 
SELECT AVG(grade) as average_grade FROM Highschooler WHERE EXISTS (     SELECT 1     FROM Friend     WHERE Highschooler.ID = Friend.student_id     OR Highschooler.ID = Friend.friend_id ); 
SELECT AVG(h.grade) AS average_grade_with_friends FROM Highschooler h JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID HAVING COUNT(f.student_id) > 0; 
SELECT MIN(grade) AS min_grade_no_friends FROM Highschooler WHERE NOT EXISTS (     SELECT 1     FROM Friend     WHERE Highschooler.ID = Friend.student_id OR Highschooler.ID = Friend.friend_id ) 
SELECT MIN(grade) AS lowest_grade_without_friends FROM Highschooler WHERE NOT EXISTS (     SELECT 1     FROM Friend     WHERE Highschooler.ID = Friend.student_id OR Highschooler.ID = Friend.friend_id ); 
SELECT DISTINCT state FROM Owners o JOIN Professionals p ON o.owner_id = p.professional_id; 
SELECT DISTINCT o.state, p.state FROM Owners o JOIN Professionals p ON o.owner_id = p.professional_id; 
SELECT AVG(d.age) AS average_age_of_treated_dogs FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY d.dog_id; 
SELECT AVG(Dogs.age) AS Average_Age FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id; 
SELECT p.professional_id, p.last_name, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE p.state = 'Indiana' OR EXISTS (     SELECT 1     FROM Treatments t2     WHERE t2.professional_id = p.professional_id AND t2.treatment_id > (SELECT COUNT(*) FROM Treatments WHERE professional_id = p.professional_id) ) 
SELECT p.professional_id, p.last_name, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE p.state IN ('Indiana') OR EXISTS (     SELECT 1     FROM Treatments t2     WHERE t2.professional_id = p.professional_id AND t2.treatment_id > (SELECT COUNT(*) - 2 FROM Treatments WHERE professional_id = p.professional_id) ) 
SELECT d.name FROM Dogs d LEFT JOIN Treatments t ON d.dog_id = t.dog_id WHERE t.cost_of_treatment <= 1000 
SELECT D.dog_name FROM Dogs D LEFT JOIN Treatments T ON D.dog_id = T.dog_id WHERE T.cost_of_treatment < 1000 AND T.professional_id IS NULL; 
SELECT DISTINCT first_name FROM Owners UNION SELECT DISTINCT first_name FROM Professionals EXCEPT SELECT DISTINCT first_name FROM Dogs; 
SELECT DISTINCT T1.first_name FROM Owners AS T1 JOIN Professionals AS T2 ON T1.first_name = T2.first_name LEFT JOIN Dogs AS T3 ON T1.first_name != T3.name WHERE T1.first_name IS NOT NULL AND T2.first_name IS NOT NULL AND T3.name IS NULL; 
SELECT p.professional_id, p.role_code, p.email_address FROM Professionals p LEFT JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.professional_id IS NULL; 
SELECT p.professional_id, p.role_code, p.email_address FROM Professionals p LEFT JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.professional_id IS NULL; 
SELECT o.owner_id, o.first_name, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id GROUP BY o.owner_id, o.first_name, o.last_name ORDER BY COUNT(d.dog_id) DESC LIMIT 1; 
SELECT Owners.owner_id, Owners.first_name, Owners.last_name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id GROUP BY Owners.owner_id ORDER BY COUNT(Dogs.dog_id) DESC LIMIT 1; 
SELECT p.professional_id, p.role_code, p.first_name FROM Professionals p JOIN Treatments t1 ON p.professional_id = t1.professional_id JOIN Treatments t2 ON p.professional_id = t2.professional_id AND t2.treatment_id > t1.treatment_id GROUP BY p.professional_id, p.role_code, p.first_name HAVING COUNT(t2.treatment_id) >= 2; 
SELECT p.professional_id, p.role_code, p.first_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.role_code, p.first_name HAVING COUNT(t.treatment_id) >= 2; 
SELECT `Breeds.breed_name` FROM `Dogs` JOIN `Breeds` ON `Dogs.breed_code` = `Breeds.breed_code` GROUP BY `Breeds.breed_code` ORDER BY COUNT(`Dogs.dog_id`) DESC LIMIT 1; 
SELECT `breed_name` AS MostCommonBreed FROM `Dogs` GROUP BY `breed_code` ORDER BY COUNT(`dog_id`) DESC LIMIT 1; 
SELECT Owners.owner_id, Owners.last_name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id JOIN Treatments ON Dogs.dog_id = Treatments.dog_id GROUP BY Owners.owner_id, Owners.last_name ORDER BY SUM(Treatments.cost_of_treatment) DESC LIMIT 1; 
SELECT o.owner_id, o.last_name FROM Owners o JOIN Treatments t ON o.owner_id = t.dog_id GROUP BY o.owner_id, o.last_name ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1; 
SELECT `treatment_type_description`, SUM(`cost_of_treatment`) AS total_cost FROM `Treatments` JOIN `Treatment_Types` ON `treatment_type_code` = `treatment_type_code` GROUP BY `treatment_type_description` ORDER BY total_cost ASC LIMIT 1; 
SELECT t.treatment_type_description, SUM(t.cost_of_treatment) AS total_cost FROM Treatments t GROUP BY t.treatment_type_code ORDER BY total_cost ASC LIMIT 1; 
SELECT `owner_id`, `zip_code` FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Charges c ON d.dog_id = c.dog_id GROUP BY o.owner_id, o.zip_code ORDER BY SUM(c.charge_amount) DESC LIMIT 1; 
SELECT o.owner_id, o.zip_code FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.zip_code ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1; 
SELECT p.professional_id, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.cell_number HAVING COUNT(DISTINCT t.treatment_type_code) > 1; 
SELECT p.professional_id, p.cell_number FROM Professionals p JOIN Treatments t1 ON p.professional_id = t1.professional_id GROUP BY p.professional_id HAVING COUNT(DISTINCT t1.treatment_type_code) > 1; 
WITH avg_cost AS (   SELECT AVG(cost_of_treatment) AS avg_cost   FROM Treatments ) SELECT T.professional_id, T.first_name, T.last_name FROM Treatments T JOIN avg_cost AC ON T.cost_of_treatment < AC.avg_cost; 
SELECT T.professional_id, T.first_name, T.last_name FROM Treatments T JOIN Professionals P ON T.professional_id = P.professional_id WHERE T.cost_of_treatment < (     SELECT AVG(cost_of_treatment)     FROM Treatments ) 
SELECT t.date_of_treatment, p.first_name FROM Treatments t JOIN Professionals p ON t.professional_id = p.professional_id; 
SELECT date_of_treatment, first_name FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id;
SELECT Treatments.treatment_type_description, Costs.cost_of_treatment FROM Treatments JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code JOIN Professionals ON Treatments.professional_id = Professionals.professional_id JOIN Charges ON Costs.cost_of_treatment = Charges.charge_amount 
SELECT t.cost_of_treatment, tt.treatment_type_description FROM Treatments t JOIN Treatment_Types tt ON t.treatment_type_code = tt.treatment_type_code; 
SELECT Owners.first_name, Owners.last_name, Sizes.size_description FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id JOIN Sizes ON Dogs.size_code = Sizes.size_code; 
SELECT `first_name`, `last_name`, `size_code` FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id;
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id; 
SELECT Owners.first_name AS Owner_First_Name, Dogs.name AS Dog_Name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id; 
SELECT d.name, t.date_of_treatment FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id JOIN (     SELECT breed_code, MIN(breed_count) AS min_breed_count     FROM (         SELECT breed_code, COUNT(*) AS breed_count         FROM Dogs         GROUP BY breed_code     ) AS breed_counts     WHERE breed_count = (         SELECT MIN(count)         FROM (             SELECT COUNT(*) AS count             FROM Dogs         ) AS dog_counts     ) ) AS rarest_breed ON d.breed_code = rarest_breed.breed_code 
SELECT d.name, t.date_of_treatment FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id JOIN Breeds b ON d.breed_code = b.breed_code GROUP BY d.dog_id, d.name, t.date_of_treatment HAVING COUNT(DISTINCT b.breed_code) = (SELECT MIN(count) FROM (     SELECT COUNT(*) AS count     FROM Breeds ) AS min_breeds) ORDER BY COUNT(DISTINCT b.breed_code) ASC; 
SELECT o.first_name, d.name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE o.state = 'Virginia';
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id WHERE Owners.state = 'Virginia'; 
SELECT d.date_arrived, d.date_departed FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id WHERE t.cost_of_treatment IS NOT NULL; 
SELECT d.date_arrived, d.date_departed FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id WHERE t.cost_of_treatment IS NOT NULL; 
SELECT DISTINCT o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE d.age = (SELECT MIN(age) FROM Dogs) 
SELECT DISTINCT T2.last_name FROM Dogs AS D JOIN Owners AS T1 ON D.owner_id = T1.owner_id JOIN (     SELECT dog_id, MIN(date_of_birth) AS min dob     FROM Dogs     GROUP BY dog_id ) AS YOUNGEST_DOG ON D.dog_id = YOUNGEST_DOG.dog_id JOIN Owners AS T2 ON T2.owner_id = YOUNGEST_DOG.owner_id ORDER BY YOUNGEST_DOG.min dob ASC; 
SELECT Professionals.email_address FROM Professionals WHERE state IN ('Hawaii', 'Wisconsin'); 
SELECT Professionals.email_address FROM Professionals WHERE state IN ('Hawaii', 'Wisconsin'); 
SELECT d.date_arrived, d.date_departed FROM Dogs d; 
SELECT d.date_arrived, d.date_departed FROM Dogs d; 
SELECT COUNT(DISTINCT Dogs.dog_id) FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id; 
SELECT COUNT(*) AS dogs_with_treatment FROM Treatments; 
SELECT COUNT(*) AS num_profs_with_treatments FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id; 
SELECT COUNT(DISTINCT Professionals.professional_id) FROM Professionals JOIN Treatments ON Professionals.professional_id = Treatments.professional_id; 
SELECT p.role_code, p.street, p.city, p.state FROM Professionals p WHERE p.city LIKE '%West%'; 
 SELECT r.role_code, r.street, r.city, r.state FROM Professionals r WHERE r.city LIKE '%West%'; 
SELECT o.first_name, o.last_name, o.email_address FROM Owners o WHERE o.state LIKE '%North%'; 
SELECT Owners.first_name, Owners.last_name, Owners.email_address FROM Owners WHERE Owners.state LIKE '%North%'; 
SELECT COUNT(Dogs.dog_id) FROM Dogs WHERE Dogs.age < (SELECT AVG(age) FROM Dogs); 
SELECT COUNT(Dogs.dog_id) FROM Dogs WHERE Dogs.age < (     SELECT AVG(Dogs.age)     FROM Dogs ); 
SELECT MAX(t.cost_of_treatment) AS MostRecentTreatmentCost FROM Treatments t WHERE t.date_of_treatment = (     SELECT MAX(date_of_treatment)     FROM Treatments ); 
SELECT MAX(`cost_of_treatment`) AS MostRecentTreatmentCost FROM Treatments WHERE `date_of_treatment` = (     SELECT MAX(`date_of_treatment`)     FROM Treatments ) 
SELECT COUNT(Dogs.dog_id) FROM Dogs LEFT JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Treatments.dog_id IS NULL; 
SELECT COUNT(Dogs.dog_id) AS un-treated_dogs FROM Dogs LEFT JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Treatments.treatment_id IS NULL; 
SELECT COUNT(DISTINCT Owners.owner_id) AS owners_without_dogs FROM Owners LEFT JOIN Dogs ON Owners.owner_id = Dogs.owner_id WHERE Dogs.dog_id IS NULL; 
SELECT COUNT(*) AS owner_without_dogs FROM Owners LEFT JOIN Dogs ON Owners.owner_id = Dogs.owner_id WHERE Dogs.dog_id IS NULL; 
SELECT COUNT(*) AS ProfessionalsWithoutTreatments FROM Professionals LEFT JOIN Treatments ON Professionals.professional_id = Treatments.professional_id WHERE Treatments.treatment_id IS NULL; 
SELECT COUNT(*) AS untrained_professionals FROM Professionals LEFT JOIN Treatments ON Professionals.professional_id = Treatments.professional_id WHERE Treatments.dog_id IS NULL; 
SELECT d.name, d.age, d.weight FROM Dogs d WHERE d.abandoned_yn = '1';
SELECT d.name, d.age, d.weight FROM Dogs d WHERE d.abandoned_yn = '1'; 
SELECT AVG(`age`) AS average_age FROM `Dogs`; 
SELECT AVG(`age`) AS average_age FROM `Dogs`; 
SELECT MAX(d.age) AS Oldest_Dog_Age FROM Dogs d 
SELECT MAX(`age`) AS oldest_age FROM `Dogs`; 
SELECT Charges.charge_type, Charges.charge_amount FROM Charges; 
SELECT `charge_type`, `charge_amount` FROM `Charges`; 
SELECT MAX(`charge_amount`) AS most_expensive_charge, `charge_type` FROM Charges WHERE `charge_amount` = (     SELECT MAX(`charge_amount`)     FROM Charges ) 
SELECT MAX(`charge_amount`) AS most_expensive_charge_amount FROM Charges; 
SELECT email_address, cell_number, home_phone FROM Professionals; 
SELECT `email_address`, `cell_number`, `home_phone` FROM `Professionals`;
SELECT DISTINCT T1.breed_name AS breed_type, T2.size_description AS size_type FROM Breeds T1 JOIN Sizes T2 ON T1.breed_code = T2.size_code; 
SELECT DISTINCT T1.breed_code, T2.size_code FROM Dogs AS T1 JOIN Sizes AS T2 ON T1.size_code = T2.size_code 
SELECT T.professional_id, P.first_name, T.treatment_type_description FROM Professionals P JOIN Treatments T ON P.professional_id = T.professional_id 
SELECT T.professionals.first_name, T.treatment_type_description FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id 
SELECT COUNT(*) FROM "singer";
SELECT COUNT(*) AS Singer_Count FROM singer; 
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC;
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC; 
SELECT Birth_Year, Citizenship FROM singer;
SELECT Birth_Year, Citizenship FROM singer; 
SELECT Name FROM singer WHERE Citizenship != 'France'; 
SELECT `Name` FROM `singer` WHERE `Citizenship` != 'France';
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949); 
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949); 
SELECT `Name` FROM `singer` WHERE `Net_Worth_Millions` = (SELECT MAX(`Net_Worth_Millions`) FROM `singer`) 
SELECT `Name` FROM `singer` WHERE `Net_Worth_Millions` = (SELECT MAX(`Net_Worth_Millions`) FROM `singer`) 
SELECT Citizenship, COUNT(*) AS Singer_Count FROM singer GROUP BY Citizenship; 
SELECT Citizenship, COUNT(*) AS Singer_Count FROM singer GROUP BY Citizenship; 
SELECT Citizenship, COUNT(*) AS SingerCount FROM singer GROUP BY Citizenship ORDER BY SingerCount DESC LIMIT 1; 
SELECT Citizenship, COUNT(*) AS Count FROM singer GROUP BY Citizenship ORDER BY Count DESC LIMIT 1; 
SELECT Citizenship, MAX(Net_Worth_Millions) AS Max_Net_Worth FROM singer GROUP BY Citizenship; 
SELECT Citizenship, MAX(Net_Worth_Millions) AS Maximum_Net_Worth FROM singer GROUP BY Citizenship; 
SELECT song.Title, singer.Name FROM song INNER JOIN singer ON song.Singer_ID = singer.Singer_ID; 
SELECT Song.Title, Singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID; 
SELECT DISTINCT Singer_Name FROM singer INNER JOIN song ON singer.Singer_ID = song.Singer_ID WHERE song.Sales > 300000; 
SELECT DISTINCT Name FROM singer WHERE Sales > 300000;
SELECT s.Name FROM singer s JOIN song s2 ON s.Singer_ID = s2.Singer_ID GROUP BY s.Name HAVING COUNT(s2.Song_ID) > 1; 
SELECT s.Name FROM singer s INNER JOIN song s2 ON s.Singer_ID = s2.Singer_ID GROUP BY s.Name HAVING COUNT(s.Song_ID) > 1; 
SELECT Singer_Name, SUM(Sales) AS Total_Sales FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY Singer_Name; 
SELECT Singer_Name, SUM(Sales) AS Total_Sales FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY Singer_Name; 
SELECT s.Name FROM singer s LEFT JOIN song s2 ON s.Singer_ID = s2.Singer_ID WHERE s2.Song_ID IS NULL; 
SELECT s.Name FROM singer s LEFT JOIN song s2 ON s.Singer_ID = s2.Singer_ID WHERE s2.Song_ID IS NULL; 
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 OR Birth_Year > 1955; 
SELECT DISTINCT Citizenship FROM singer WHERE Birth_Year < 1945 OR Birth_Year > 1955;
SELECT COUNT(*) AS Total_Available_Features FROM Other_Available_Features; 
SELECT R.feature_type_name FROM Ref_Feature_Types R INNER JOIN Other_Available_Features OAF ON R.feature_type_code = OAF.feature_type_code WHERE OAF.feature_name = 'AirCon'; 
SELECT p.property_type_description FROM Properties p JOIN Ref_Property_Types r ON p.property_type_code = r.property_type_code WHERE r.property_type_code = 'Apartment'; 
SELECT p.property_name FROM Properties p WHERE p.property_type_code IN ('House', 'Apartment') AND p.room_count > 1; 
