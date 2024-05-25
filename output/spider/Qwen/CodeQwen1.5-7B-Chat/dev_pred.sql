SELECT count(*) FROM singer
SELECT COUNT(Singer_ID) FROM singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT avg(age) as average, min(age) as minimum, max(age) as maximum FROM singer WHERE country = 'France'
SELECT avg(age), min(age), max(age) FROM singer WHERE Country = 'France'
SELECT t1.name, t1.song_release_year  FROM singer AS t1  JOIN singer_in_concert AS t2 ON t1.singer_id = t2.singer_id  WHERE t1.age = (SELECT min(age) FROM singer)
SELECT S.Name, S.Song_release_year FROM singer AS S WHERE S.Age = (SELECT min(Age) FROM singer)
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT country FROM singer WHERE age > 20
SELECT T1.Country, COUNT(T2.Singer_ID) FROM singer AS T1 INNER JOIN singer_in_concert AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T1.Country
SELECT COUNT(T1.Singer_ID) ,  T2.Country FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T2.Country
SELECT DISTINCT SINGER.Song_Name FROM singer INNER JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID WHERE singer.Age > (SELECT AVG(Age) FROM singer)
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)
SELECT location ,  name FROM stadium WHERE capacity BETWEEN 5000 AND 10000
SELECT `Location`, `Name` FROM `stadium` WHERE `Capacity` BETWEEN 5000 AND 10000
SELECT MAX(Capacity) , AVG(Average) FROM stadium
SELECT AVG(Capacity) as avg_capacity, MAX(Capacity) as max_capacity FROM stadium
SELECT T1.name ,  T1.capacity FROM stadium AS T1 JOIN singer_in_concert AS T2 ON T1.stadium_id = T2.stadium_id JOIN singer AS T3 ON T3.singer_id = T2.singer_id WHERE T3.song_name = (SELECT MAX(song_name) FROM singer)
SELECT T1.Name, T1.Capacity FROM stadium AS T1 INNER JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T2.Stadium_ID ORDER BY AVG(T2.Average) DESC LIMIT 1
SELECT COUNT(DISTINCT Year) FROM concert WHERE Year IN ('2014', '2015')
SELECT COUNT(concert_ID) FROM concert WHERE YEAR IN (2014, 2015)
SELECT t1.name, count(*) FROM stadium AS t1 JOIN concert AS t2 ON t1.stadium_id  =  t2.stadium_id GROUP BY t1.name
SELECT COUNT(*) FROM concert
SELECT name, capacity FROM stadium WHERE stadium_id IN (SELECT stadium_id FROM concert WHERE year >= 2014 GROUP BY stadium_id ORDER BY count(*) DESC LIMIT 1);
SELECT T1.Location, T1.Capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year > 2013 GROUP BY T1.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Year, COUNT(*) as Number_of_Concerts FROM concert GROUP BY Year ORDER BY Number_of_Concerts DESC LIMIT 1;
SELECT YEAR FROM concert GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT T1.Location, T1.Name FROM stadium AS T1 LEFT JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Stadium_ID IS NULL
SELECT T2.Country FROM singer AS T1 JOIN singer AS T2 ON T1.Name = T2.Name WHERE T1.Is_male = 1 AND T1.Age > 40 AND T2.Is_male = 0 AND T2.Age < 30
SELECT s.Name FROM stadium AS s JOIN concert AS c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year != '2014'
SELECT T2.name FROM stadium AS T1 LEFT JOIN concert AS T2 ON T1.stadium_id = T2.stadium_id WHERE T2.year != '2014' OR T2.stadium_id IS NULL
SELECT t1.concert_Name ,  t1.Theme ,  count(t2.Singer_ID) FROM concert AS t1 JOIN singer_in_concert AS t2 ON t1.concert_ID  =  t2.concert_ID GROUP BY t1.concert_Name ,  t1.Theme
SELECT C.concert_name, C.theme, COUNT(SI.Singer_ID) FROM concert C JOIN singer_in_concert SI ON C.concert_id = SI.concert_id GROUP BY C.concert_name, C.theme
SELECT T1.Name, COUNT(T3.concert_ID) FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID  =  T2.Singer_ID JOIN concert AS T3 ON T2.concert_ID  =  T3.concert_ID GROUP BY T1.Name
SELECT s.name, COUNT(sc.concert_id) FROM singer s JOIN singer_in_concert sc ON s.singer_id = sc.singer_id GROUP BY s.singer_id, s.name
SELECT T2.Name FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN concert AS T3 ON T1.concert_ID = T3.concert_ID WHERE T3.Year = 2014
SELECT DISTINCT s.Name  FROM singer s  JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID  JOIN concert c ON sic.concert_ID = c.concert_ID  WHERE c.Year = '2014'
SELECT Name FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT T1.Name, T1.Country FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN concert AS T3 ON T2.concert_ID = T3.concert_ID WHERE T3.concert_Name LIKE '%Hey%'
SELECT DISTINCT T1.name ,  T1.location FROM stadium AS T1 JOIN concert AS T2 ON T1.stadium_id = T2.stadium_id WHERE T2.year = '2014' INTERSECT SELECT DISTINCT T1.name ,  T1.location FROM stadium AS T1 JOIN concert AS T2 ON T1.stadium_id = T2.stadium_id WHERE T2.year = '2015'
SELECT Name, Location FROM stadium WHERE Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE Year IN ('2014', '2015') GROUP BY Stadium_ID HAVING COUNT(DISTINCT Year) = 2)
SELECT COUNT(DISTINCT C.concert_ID) FROM stadium AS S JOIN concert AS C ON S.Stadium_ID = C.Stadium_ID WHERE S.Capacity = (SELECT MAX(Capacity) FROM stadium)
SELECT COUNT(*) FROM concert AS t1 JOIN stadium AS t2 ON t1.Stadium_ID = t2.Stadium_ID WHERE t2.Capacity = (SELECT MAX(Capacity) FROM stadium)
SELECT COUNT(PetID) FROM Pets WHERE weight > 10
SELECT COUNT(*) FROM Has_Pet AS T1 JOIN Pets AS T2 ON T1.PetID = T2.PetID WHERE T2.weight > 10
SELECT weight FROM Pets WHERE PetType = 'Dog' ORDER BY pet_age ASC LIMIT 1
SELECT MIN(P.weight) FROM Pets AS P JOIN Has_Pet AS HP ON P.PetID = HP.PetID ORDER BY P.pet_age ASC
SELECT PetType, MAX(weight)  FROM Pets  GROUP BY PetType
SELECT P.PetType, max(P.weight) FROM Pets P JOIN Has_Pet HP on HP.PetID = P.PetID
SELECT COUNT(*) FROM Has_Pet INNER JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.Age > 20
SELECT COUNT(T1.StuID) FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID = T2.StuID WHERE T2.Age > 20
SELECT COUNT(p.PetID) AS num_dogs_female FROM Has_Pet hp JOIN Student s ON hp.StuID = s.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'dog' AND s.Sex = 'F'
SELECT COUNT(*) FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T1.PetID = T3.PetID WHERE T3.PetType = 'dog' AND T2.Sex = 'F'
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT StuID FROM Has_Pet AS T1 JOIN Pets AS T2 ON T1.PetID = T2.PetID WHERE T2.PetType = 'cat' OR T2.PetType = 'dog'
SELECT T3.fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T3.PetID = T2.PetID WHERE T3.PetType = 'Cat' OR T3.PetType = 'Dog'
SELECT StuID FROM Student WHERE StuID IN ( SELECT Student.StuID FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat' INTERSECT SELECT Student.StuID FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'dog' ) INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID
SELECT DISTINCT T2.Fname FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T1.PetID = T3.PetID WHERE T3.PetType IN ('Cat', 'Dog') GROUP BY T2.Fname HAVING COUNT(DISTINCT T3.PetType) = 2
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT T2.Major, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType != 'cat'
SELECT DISTINCT StuID FROM Student LEFT JOIN Has_Pet ON Student.StuID = Has_Pet.StuID LEFT JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType <> 'Cat' OR Pets.PetType IS NULL
SELECT DISTINCT s.StuID FROM Student s LEFT JOIN Has_Pet hp ON s.StuID = hp.StuID LEFT JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType IS NULL OR p.PetType <> 'cat'
SELECT T.fname, T.age FROM Student AS T  JOIN Has_Pet AS H ON T.stuid = H.stuid  JOIN Pets AS P ON H.petid = P.petid  WHERE P.pettype = 'dog' AND T.stuid NOT IN (SELECT H.stuid FROM Has_Pet AS H JOIN Pets AS P ON H.petid = P.petid WHERE P.pettype = 'cat')
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Dog')) AND StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Cat'))
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1
SELECT PetType, weight FROM ( SELECT T1.PetType, T1.weight FROM Pets AS T1 JOIN Has_Pet AS T2 ON T1.PetID = T2.PetID ORDER BY T1.weight ASC LIMIT 1 )
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age  >  1
SELECT PetType, AVG(pet_age) AS AverageAge, MAX(pet_age) AS MaxAge FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID GROUP BY PetType
SELECT PetType, AVG(pet_age) AS average_age, MAX(pet_age) AS max_age FROM Pets GROUP BY PetType
SELECT AVG(weight) FROM Pets
SELECT p.PetType, AVG(p.weight) AS avg_weight FROM Pets p JOIN Has_Pet hp ON p.PetID = hp.PetID GROUP BY p.PetType
SELECT Fname , Age FROM STUDENT  JOIN Has_Pet ON STUDENT.StuID = Has_Pet.StuID
SELECT T1.Fname, T1.age FROM STUDENT AS T1 JOIN HAS_PET AS T2 ON T1.StuID = T2.StuID
SELECT T1.StuID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.LName = 'Smith'
SELECT PetID FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE LName = 'Smith')
SELECT StuID, COUNT(Has_Pet.PetID) as PetCount FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID GROUP BY StuID;
SELECT StuID, COUNT(DISTINCT PetID)  FROM Has_Pet GROUP BY StuID
SELECT T1.Fname, T1.Sex FROM STUDENT AS T1 JOIN HAS_PET AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID HAVING COUNT(*) > 1
SELECT T1.Fname, T1.Sex FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.Fname, T1.Sex HAVING COUNT(T2.PetID) > 1
SELECT LName FROM Student WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' AND pet_age = 3)
SELECT Lname FROM student JOIN has_pet ON student.StuID = has_pet.StuID JOIN pets ON has_pet.PetID = pets.PetID WHERE pets.PetType = 'cat' AND pets.pet_age = 3
SELECT AVG(age) FROM Student WHERE StuID NOT IN (     SELECT StuID     FROM Has_Pet )
SELECT AVG(age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT COUNT(Continent) FROM continents
SELECT COUNT(ContId) FROM continents
SELECT Continent, ContinentName, COUNT(CountryId) as NumberOfCountries FROM countries JOIN continents ON countries.Continent = continents.ContId GROUP BY Continent
SELECT ContId, Continent, COUNT(CountryName) FROM countries GROUP BY ContId
SELECT COUNT(*) FROM countries
SELECT count(*) FROM countries
SELECT FullName, id, COUNT(Model) AS ModelCount FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY FullName, id
SELECT T3.id ,  T2.fullname ,  COUNT(T4.model) FROM car_makers AS T1 JOIN countries AS T2 ON T2.CountryId = T1.Country JOIN model_list AS T4 ON T4.Maker = T1.Id GROUP BY T3.id ,  T2.fullname
SELECT T2.Model FROM car_names AS T1 JOIN model_list AS T2 ON T1.MakeId = T2.ModelId ORDER BY T2.Horsepower ASC LIMIT 1
SELECT Model FROM model_list WHERE Id = ( SELECT Maker FROM car_makers WHERE Horsepower = ( SELECT MIN(Horsepower) FROM car_makers ) )
SELECT T4.Model FROM cars_data AS T1  JOIN car_names AS T2 ON T2.MakeId = T1.Id  JOIN model_list AS T3 ON T3.Model = T2.Model  JOIN car_makers AS T4 ON T4.Id = T3.Maker  WHERE T1.Weight < (SELECT AVG(T1.Weight) FROM cars_data AS T1  JOIN car_names AS T2 ON T2.MakeId = T1.Id)
SELECT car_names.Model FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Weight < (SELECT AVG(Weight) FROM cars_data)
SELECT T1.Make FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Year = 1970
SELECT Maker  FROM car_makers  WHERE Year = 1970
SELECT cn.Make, cn.Model FROM car_names AS cn INNER JOIN cars_data AS cd ON cn.MakeId = cd.Id ORDER BY cd.Year ASC LIMIT 1
SELECT Maker FROM car_makers WHERE Id IN (SELECT Maker FROM car_names GROUP BY Model ORDER BY MIN(MakeId) ASC LIMIT 1)
SELECT DISTINCT car_names.Model FROM cars_data JOIN car_names ON cars_data.MakeId = car_names.MakeId WHERE cars_data.Year > 1980
SELECT DISTINCT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model WHERE T2.Make IN ( SELECT Country FROM car_makers WHERE YEAR > 1980 )
SELECT t1.continent, count(*) FROM countries AS t1 JOIN car_makers AS t2 ON t1.countryid  =  t2.country GROUP BY t1.continent
SELECT C.Continent, COUNT(M.Id) FROM continents AS C JOIN countries AS Co ON C.ContId = Co.Continent JOIN car_makers AS M ON Co.CountryId = M.Country GROUP BY C.Continent
SELECT T2.CountryName FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName ORDER BY COUNT(T1.Id) DESC LIMIT 1
SELECT T2.CountryName FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country  =  T2.CountryId GROUP BY T2.CountryName ORDER BY COUNT(T2.CountryId) DESC LIMIT 1
SELECT Count(*), T2.FullName FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker  =  T2.Id GROUP BY T2.FullName
SELECT maker, count(*), id, fullname FROM car_makers JOIN model_list ON car_makers.id = model_list.maker JOIN car_names ON model_list.model = car_names.model GROUP BY maker
SELECT accelerate FROM cars_data WHERE Make IN (SELECT Id FROM car_makers WHERE FullName = 'amc hornet sportabout (sw)')
SELECT AVG(Accelerate) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Model = 'amc hornet sportabout' AND T2.Make = 'sw'
SELECT COUNT(DISTINCT T2.Id) FROM countries AS T1  JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE T1.Continent = 'France'
SELECT COUNT(*) FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId WHERE T2.CountryName = "France"
SELECT COUNT(Model) FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE CountryName = 'USA'))
SELECT COUNT(Model) FROM model_list WHERE Country IN (SELECT CountryId FROM countries WHERE CountryName = 'United States')
SELECT AVG(T3.MPG) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.Model WHERE T3.Cylinders = 4
SELECT AVG(cars_data.MPG) FROM cars_data INNER JOIN model_list ON cars_data.Id = model_list.Model INNER JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Country = 1 AND car_makers.FullName = 'Mazda'
SELECT Weight FROM cars_data WHERE Cylinders = 8 AND Year = 1974 ORDER BY Weight ASC LIMIT 1
SELECT MIN(t1.Weight) FROM cars_data AS t1 JOIN car_names AS t2 ON t1.Id = t2.MakeId JOIN model_list AS t3 ON t2.Model = t3.Model WHERE t1.Cylinders = 8 AND t1.Year = 1974
SELECT Maker, Model FROM model_list
SELECT Maker FROM car_makers
SELECT CountryName ,  CountryId FROM countries
SELECT DISTINCT CountryName FROM countries
SELECT count(*) FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker  =  T2.Id WHERE Horsepower  >  150
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150
SELECT AVG(T2.Weight) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId GROUP BY T1.Year
SELECT Year ,  AVG(weight) ,  AVG(Year) FROM cars_data GROUP BY Year
SELECT CountryName FROM countries WHERE Continent = (SELECT ContId FROM continents WHERE Continent = 'Europe') AND CountryId IN (SELECT Country FROM car_makers WHERE Maker IN (SELECT Id FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE Continent = (SELECT ContId FROM continents WHERE Continent = 'Europe')))) AND CountryId IN (SELECT DISTINCT Country FROM car_makers WHERE Maker IN (SELECT Id FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE Continent = (SELECT ContId FROM continents WHERE Continent = 'Europe')))) GROUP BY CountryName HAVING COUNT(DISTINCT Maker) >= 3
SELECT T1.Continent FROM continents AS T1 JOIN countries AS T2 ON T1.ContId  =  T2.Continent JOIN car_makers AS T3 ON T2.CountryId  =  T3.Country GROUP BY T1.Continent HAVING COUNT(DISTINCT T3.Maker)  >=  3
SELECT HORSEPOWER, Make FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cylinders = 3 ORDER BY HORSEPOWER DESC LIMIT 1
SELECT car_makers.Maker FROM car_makers WHERE car_makers.Country = ( SELECT countries.CountryId FROM countries WHERE countries.Continent = ( SELECT continents.ContId FROM continents WHERE continents.Continent = "North America" ) ) AND model_list.Model IN ( SELECT cars_data.Make FROM cars_data WHERE cars_data.Cylinders = 3 ) ORDER BY cars_data.Horsepower DESC LIMIT 1
SELECT Model FROM car_names WHERE MakeId IN ( SELECT Id FROM cars_data ORDER BY MPG DESC LIMIT 1 )
SELECT T4.Model FROM model_list AS T1 JOIN car_names AS T2 ON T2.Model = T1.ModelId JOIN cars_data AS T3 ON T3.MakeId = T1.Model JOIN car_makers AS T4 ON T4.Id = T1.Maker ORDER BY T3.MPG DESC LIMIT 1
SELECT AVG(T1.Horsepower) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Year < 1980
SELECT AVG(Horsepower) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Year < 1980
SELECT AVG(T1.Edispl) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Model = 'volvo'
SELECT AVG(Edispl) FROM cars_data WHERE Model IN (SELECT Model FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Maker = 'volvo'))
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT MAX(Accelerate) FROM cars_data
SELECT model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model GROUP BY model ORDER BY COUNT(T2.Make) DESC LIMIT 1
SELECT Model  FROM model_list  GROUP BY Model  ORDER BY COUNT(*) DESC  LIMIT 1
SELECT COUNT(Id) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(*) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM car_names WHERE Make IN (SELECT Id FROM car_names WHERE Year = 1980)
SELECT COUNT(model_list.ModelId)  FROM model_list  JOIN car_makers ON model_list.Maker = car_makers.Id  WHERE car_makers.FullName = 'American Motor Company'
SELECT count(T1.Model) FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker  =  T2.Id WHERE T2.Maker  =  'American Motor Company'
SELECT T1.fullname, T1.id FROM car_makers AS T1 JOIN model_list AS T2 ON T1.id = T2.maker GROUP BY T1.fullname, T1.id HAVING COUNT(*) > 3
SELECT Id, Maker FROM car_makers WHERE Id IN ( SELECT Maker FROM model_list GROUP BY Maker HAVING count(Model) > 3 )
SELECT DISTINCT model FROM model_list WHERE Maker = (SELECT Id FROM car_makers WHERE FullName = 'General Motors') AND Model IN (SELECT Model FROM cars_data WHERE Weight > 3500)
SELECT DISTINCT T3.Model FROM model_list AS T1  JOIN car_makers AS T2 ON T1.Maker = T2.Id  JOIN car_names AS T3 ON T1.Model = T3.Model  JOIN cars_data AS T4 ON T3.MakeId = T4.Id  WHERE T2.Maker IN ('General Motors')  OR T4.Weight > 3500;
SELECT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000
SELECT Year FROM cars_data WHERE Weight < 4000 UNION SELECT Year FROM cars_data WHERE Weight > 3000
SELECT MAX(Horsepower), cn.Model, cm.Maker FROM car_names cn JOIN car_makers cm ON cn.Make = cm.Maker JOIN cars_data cd ON cd.Id = cm.Id WHERE cd.Accelerate = (SELECT MAX(Accelerate) FROM cars_data)
SELECT horsepower FROM cars_data ORDER BY accelerate DESC LIMIT 1
SELECT MIN(Cars_data.Cylinders)  FROM car_makers  JOIN model_list ON car_makers.Id = model_list.Maker  JOIN cars_data ON cars_data.Id = model_list.Model  WHERE car_makers.Maker = "volvo" AND cars_data.Accelerate = (SELECT MIN(Accelerate) FROM cars_data)
SELECT cars_data.Cylinders FROM cars_data AS cars_data JOIN car_names AS car_names ON cars_data.Id = car_names.MakeId WHERE car_names.Make = 'Volvo' ORDER BY cars_data.Accelerate ASC LIMIT 1
To solve this problem, we need to find the car with the largest horsepower and then count the number of cars with an accelerate greater than this car.   Here's the SQL to do this:  ```sql SELECT COUNT(*)  FROM cars_data WHERE cars_data.Id IN (     SELECT car_names.MakeId     FROM car_names     JOIN model_list ON car_names.Model = model_list.Model     JOIN car_makers ON model_list.Maker = car_makers.Id     WHERE car_makers.Horsepower > (         SELECT MAX(car_makers.Horsepower)          FROM car_makers     ) ); ```  This SQL statement works as follows:  1. It first selects the MakeId from car_names and car_makers tables where the Horsepower is greater than the maximum Horsepower. 2. It then counts the number of rows returned by the subquery, which represents the number of cars with a horsepower greater than the highest horsepower.
SELECT COUNT(*) FROM cars_data WHERE Id IN (SELECT MakeId FROM car_names WHERE Model IN (SELECT Model FROM model_list WHERE Horsepower = (SELECT MAX(Horsepower) FROM model_list))) AND Accelerate > (SELECT MAX(Accelerate) FROM cars_data)
SELECT COUNT(DISTINCT T1.CountryName) FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId  =  T2.Country WHERE T2.Id IN ( SELECT Maker FROM model_list GROUP BY Maker HAVING COUNT(Model)  >  2 )
SELECT COUNT(*) FROM countries GROUP BY CountryName HAVING COUNT(Continent) > 2
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT T1.Model FROM model_list AS T1 JOIN cars_data AS T2 ON T1.ModelId  =  T2.Id WHERE T2.Cylinders  =  4 AND T2.Horsepower  >  0 ORDER BY T2.Horsepower DESC LIMIT 1
SELECT T4.Model, T1.Horsepower  FROM cars_data AS T1  JOIN car_names AS T2 ON T1.Id = T2.MakeId  JOIN model_list AS T3 ON T2.Model = T3.Model  JOIN car_makers AS T4 ON T3.Maker = T4.Id  WHERE T1.Cylinders = 4  ORDER BY T1.Horsepower DESC  LIMIT 1
SELECT DISTINCT T2.MakeId, T2.Make  FROM model_list AS T1  JOIN car_makers AS T2 ON T2.Id = T1.Maker  WHERE T1.Model IN (      SELECT Model      FROM cars_data      WHERE Horsepower > (          SELECT MIN(Horsepower)          FROM cars_data      )      AND Cylinders <= 3  )
SELECT id FROM cars_data WHERE Horsepower < (SELECT min(Horsepower) FROM cars_data) AND Cylinders < 4
SELECT cars_data.MPG  FROM cars_data  JOIN model_list ON cars_data.Id = model_list.Model  JOIN car_makers ON model_list.Maker = car_makers.Id  WHERE car_makers.Cylinders = 8 AND car_makers.Year < 1980  ORDER BY cars_data.MPG DESC  LIMIT 1
SELECT MAX(T1.MPG) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.Model WHERE T1.Cylinders = 8 OR T1.Year < 1980
SELECT T3.Model  FROM cars_data AS T1  JOIN car_names AS T2 ON T1.Id = T2.MakeId  JOIN model_list AS T3 ON T2.Model = T3.Model  JOIN car_makers AS T4 ON T3.Maker = T4.Id  WHERE T4.FullName != 'Ford Motor Company' AND T1.Weight < 3500
SELECT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model JOIN cars_data AS T3 ON T2.MakeId = T3.Id JOIN car_makers AS T4 ON T2.Make = T4.Maker WHERE T4.Maker != 'Ford Motor Company' AND T3.Weight < 3500
SELECT CountryName FROM countries WHERE Continent NOT IN ( SELECT ContId FROM continents JOIN countries ON continents.ContId = countries.Continent GROUP BY countries.Continent )
SELECT DISTINCT countries.CountryName FROM countries WHERE NOT EXISTS (SELECT car_makers.Id FROM car_makers WHERE countries.CountryId = car_makers.Country)
SELECT M.MakerId, M.Maker FROM car_makers AS M GROUP BY M.MakerHaving COUNT(M.Id) > 2
SELECT DISTINCT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id  =  T2.Maker WHERE T1.Maker IN ( SELECT T2.Maker FROM model_list AS T2 GROUP BY T2.Maker HAVING COUNT(T2.Model) >= 2 ) AND T1.Maker IN ( SELECT T3.Maker FROM cars_data AS T3 GROUP BY T3.Id HAVING COUNT(T3.Id) > 3 )
SELECT CountryId, CountryName FROM countries WHERE CountryId IN (SELECT Country FROM car_makers WHERE Maker IN (SELECT Id FROM car_makers WHERE Maker IN (SELECT Maker FROM model_list WHERE Model = 'fiat'))) AND CountryId IN (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(*) > 3)
1. What are the ids and names of all countries that either have more than 3 car makers or produce Fiat model?  ```sql SELECT c.CountryId, c.CountryName FROM countries c JOIN (     SELECT Country     FROM car_makers     GROUP BY Country     HAVING COUNT(Maker) > 3 ) cm ON c.CountryId = cm.Country WHERE c.CountryName IN (     SELECT cm2.CountryName     FROM car_makers cm2     JOIN model_list ml ON cm2.Id = ml.Maker     WHERE ml.Model LIKE '%Fiat%' ) ``` 2. When generating SQL, we should always consider constraints: - In `SELECT <column>`, just select needed columns in the question without any unnecessary column or value  - In `FROM <table>` or `JOIN <table>`, do not include unnecessary table  - If use max or min func, `JOIN <table>` FIRST, THEN use `SELECT MAX(<column>)` or `SELECT MIN(<column>)`  - If [Value examples] of <column> has 'None' or None, use `JOIN <table>` or `WHERE <column> is NOT NULL` is better  - If use `ORDER BY <column> ASC|DESC`, add `GROUP BY <column>` before to select distinct values
SELECT T1.country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline JOIN airports AS T3 ON T2.SourceAirport  =  T3.AirportCode WHERE T1.Airline  =  "JetBlue Airways"
SELECT T1.Country FROM airlines AS T1 INNER JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'Jetblue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT airlines.Airline ,  airlines.Abbreviation FROM airlines JOIN airports ON airlines.Country = 'USA'
SELECT Airline, Abbreviation  FROM airlines  WHERE Country = 'USA'
SELECT T1.AirportCode, T1.AirportName FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Anthony' GROUP BY T1.AirportCode, T1.AirportName
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT count(*) FROM airlines
SELECT COUNT(uid) FROM airlines
SELECT COUNT(*) FROM airports
SELECT count(*) FROM airports
SELECT COUNT(*) FROM flights
SELECT COUNT(flightno)  FROM flights
SELECT * FROM airlines WHERE Abbreviation='UAL'
SELECT DISTINCT Country FROM airlines WHERE Abbreviation = 'UAL'  The SQL statement above retrieves distinct countries from the airlines table where the abbreviation is 'UAL'. It utilizes a WHERE clause to filter results based on the condition of Abbreviation = 'UAL'. The DISTINCT keyword ensures that only unique countries are returned.
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT count(*) FROM airlines WHERE Country = 'USA'
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT Country FROM airports WHERE AirportCode = 'KALA';
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen';
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.AirportCode = 'APG'
SELECT COUNT(flights.FlightNo) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.AirportCode = 'APG'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'ATO'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'ABE'
SELECT COUNT(T2.FlightNo)  FROM airports AS T1  JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport WHERE T1.City = 'Aberdeen'
SELECT COUNT(*) FROM airports WHERE City = 'Aberdeen'
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T1.DestAirport = 'ASX' AND T2.City = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'AEY' AND DestAirport = 'SDR'
SELECT COUNT(*) FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T2.Airline = 'JetBlue Airways'
SELECT COUNT(DISTINCT t2.FlightNo) FROM airlines AS t1 JOIN flights AS t2 ON t1.uid = t2.Airline WHERE t1.Airline = 'Jetblue Airways'
SELECT COUNT(*) FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T1.Airline  =  'United Airlines' AND T2.SourceAirport  =  'ASY'
SELECT COUNT(*) FROM airlines AS airlines_1 JOIN flights AS flights_1 ON airlines_1.uid = flights_1.Airline JOIN airports AS airports_1 ON flights_1.DestAirport = airports_1.AirportCode WHERE airlines_1.Airline = 'United Airlines' AND airports_1.AirportCode = 'ASY'
SELECT COUNT(*) FROM flights AS T1 INNER JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode INNER JOIN airlines AS T3 ON T1.Airline = T3.uid WHERE T3.Airline = 'United Airlines' AND T2.AirportName = 'AHD'
SELECT COUNT(*)  FROM flights  INNER JOIN airports ON flights.SourceAirport = airports.AirportCode  INNER JOIN airlines ON flights.Airline = airlines.uid  WHERE airlines.Airline = 'United Airlines' AND airports.AirportName = 'AHD Airport'
SELECT COUNT(*) FROM flights AS t1 JOIN airports AS t2 ON t1.DestAirport = t2.AirportCode JOIN airlines AS t3 ON t3.uid = t1.Airline WHERE t2.City = 'Aberdeen' AND t3.Airline = 'United Airlines'
SELECT COUNT(FlightNo) FROM flights AS t1 JOIN airlines AS t2 ON t1.Airline = t2.uid JOIN airports AS t3 ON t1.DestAirport = t3.AirportCode WHERE t2.Airline = 'United Airlines' AND t3.City = 'Aberdeen'
SELECT t2.City FROM flights AS t1 JOIN airports AS t2 ON t1.DestAirport = t2.AirportCode GROUP BY t2.City ORDER BY COUNT(t2.City) DESC LIMIT 1
SELECT DISTINCT a.City, COUNT(f.DestAirport) AS DestAirportCount  FROM airports a  JOIN flights f ON a.AirportCode = f.DestAirport  GROUP BY a.City  ORDER BY DestAirportCount DESC  LIMIT 1
SELECT c.City FROM airports a JOIN flights f ON a.AirportCode = f.SourceAirport JOIN (     SELECT SourceAirport, COUNT(*) as flight_count     FROM flights     GROUP BY SourceAirport     ORDER BY flight_count DESC     LIMIT 1 ) as max_flights ON a.AirportCode = max_flights.SourceAirport
SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T2.SourceAirport ORDER BY COUNT(*) DESC LIMIT 1
SELECT MIN(SourceAirport)  FROM flights
SELECT AirportCode FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode GROUP BY AirportCode ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.AirportCode FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport JOIN flights AS T3 ON T1.AirportCode = T3.DestAirport GROUP BY T1.AirportCode ORDER BY COUNT(*) ASC LIMIT 1
SELECT MIN(flightno) FROM flights
SELECT airline FROM flights GROUP BY airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT Airline FROM flights GROUP BY Airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT a.Abbreviation, a.Country FROM airlines a JOIN flights f ON a.uid = f.Airline GROUP BY f.Airline ORDER BY COUNT(*) ASC LIMIT 1
SELECT a.Abbreviation, a.Country FROM airlines a JOIN flights f ON a.uid = f.Airline GROUP BY a.Abbreviation, a.Country ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid  =  T2.Airline WHERE T2.SourceAirport = 'AHD'
SELECT DISTINCT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.AirportCode = 'AHD'
SELECT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline JOIN airports ON airports.AirportCode = flights.DestAirport WHERE airports.AirportCode = 'AHD'
SELECT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.DestAirport = 'AHD'
SELECT DISTINCT t1.Airline FROM airlines AS t1 JOIN flights AS t2 ON t1.uid = t2.Airline WHERE t2.SourceAirport = 'APG' AND t2.DestAirport = 'CVO'
SELECT T2.Airline FROM airlines AS T2 JOIN flights AS T1 ON T2.uid  =  T1.Airline JOIN airports AS T3 ON T3.AirportCode  =  T1.SourceAirport WHERE T3.AirportCode = 'APG' EXCEPT SELECT T2.Airline FROM airlines AS T2 JOIN flights AS T1 ON T2.uid  =  T1.Airline JOIN airports AS T3 ON T3.AirportCode  =  T1.SourceAirport WHERE T3.AirportCode = 'CVO'
SELECT airlines.uid, airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.SourceAirport = 'CVO' AND flights.DestAirport <> 'APG'
SELECT DISTINCT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport = 'CVO' EXCEPT SELECT DISTINCT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport = 'APG'
SELECT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline GROUP BY airlines.Airline HAVING COUNT(*) >= 10
SELECT a.Airline FROM flights f JOIN airlines a ON f.Airline = a.uid GROUP BY f.Airline HAVING COUNT(f.FlightNo) >= 10
SELECT uid FROM airlines WHERE (SELECT COUNT(*) FROM flights WHERE Airline = airlines.uid) < 200
SELECT `Abbreviation` FROM `airlines` WHERE (SELECT COUNT(*) FROM `flights` WHERE `Airline`=`uid`) < 200
SELECT FlightNo FROM flights WHERE Airline IN (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE SourceAirport = "APG"
SELECT t1.FlightNo FROM flights AS t1 JOIN airports AS t2 ON t1.SourceAirport = t2.AirportCode WHERE t2.AirportCode = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = "APG"
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT FlightNo FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT DISTINCT FlightNo  FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT FlightNo FROM flights WHERE DestAirport = (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City IN ('Aberdeen', 'Abilene')
SELECT COUNT(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City IN ('Aberdeen', 'Abilene')
SELECT T2.AirportName FROM airports AS T1 LEFT JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport LEFT JOIN flights AS T3 ON T1.AirportCode = T3.DestAirport WHERE T2.SourceAirport IS NULL AND T3.DestAirport IS NULL
SELECT T1.AirportName FROM airports AS T1 LEFT JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T2.FlightNo IS NULL
SELECT COUNT(*) FROM employee
SELECT COUNT(T1.Name) FROM employee AS T1 JOIN hiring AS T2 ON T1.Employee_ID = T2.Employee_ID
SELECT Name FROM employee ORDER BY Age ASC
SELECT Name FROM employee ORDER BY Age ASC
SELECT City, COUNT(*) FROM employee GROUP BY City
SELECT count(DISTINCT T3.city) AS `Number of employees` FROM hiring AS T1 JOIN employee AS T2 ON T1.employee_id = T2.employee_id JOIN employee AS T3 ON T3.employee_id = T1.employee_id WHERE T1.is_full_time = true GROUP BY T3.city
SELECT t1.city FROM employee AS t1 JOIN hiring AS t2 ON t1.employee_id  =  t2.employee_id WHERE t1.age  <  30 GROUP BY t1.city HAVING COUNT(*)  >  1
SELECT t1.city FROM employee AS t1 JOIN hiring AS t2 ON t1.employee_id  =  t2.employee_id WHERE t1.age  <  30 GROUP BY t1.city HAVING count(*)  >  1
SELECT COUNT(*) AS number_of_shops, location FROM shop GROUP BY location
SELECT COUNT(*), location FROM shop GROUP BY location
SELECT s.Manager_name, s.District  FROM shop AS s JOIN hiring AS h ON s.Shop_ID = h.Shop_ID WHERE h.Is_full_time = 'True' ORDER BY s.Number_products DESC LIMIT 1
SELECT shop.Manager_name, shop.District FROM shop JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY shop.Shop_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT min(Number_products), max(Number_products) FROM shop
SELECT t2.Name, t2.Location, t2.District FROM hiring AS t1 JOIN shop AS t2 ON t1.Shop_ID = t2.Shop_ID ORDER BY t2.Number_products DESC
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT DISTINCT s.Name FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID WHERE h.Is_full_time = 'TRUE' AND s.Number_products > ( SELECT AVG(Number_products) FROM shop )
SELECT T2.Name FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T2.Name HAVING COUNT(*) > (SELECT COUNT(*) FROM hiring AS T3 JOIN shop AS T4 ON T3.Shop_ID = T4.Shop_ID GROUP BY T4.Name) / COUNT(*)
SELECT T3.Name FROM hiring AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID JOIN employee AS T3 ON T3.Employee_ID = T2.Employee_ID ORDER BY COUNT(T2.Employee_ID) DESC LIMIT 1
SELECT T.Name FROM ( SELECT T3.Name, T3.Age FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID JOIN employee AS T3 ON T1.Employee_ID = T3.Employee_ID JOIN evaluation AS T4 ON T3.Employee_ID = T4.Employee_ID GROUP BY T3.Name ORDER BY COUNT(T4.Employee_ID) DESC LIMIT 1 ) AS T
SELECT T.Name FROM (SELECT e.Name FROM employee e  JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID WHERE ev.Bonus =  (SELECT MAX(Bonus) FROM evaluation)) T
SELECT Name FROM employee ORDER BY Bonus DESC LIMIT 1
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT T2.Name FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID  =  T2.Shop_ID GROUP BY T2.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name FROM shop AS T1 JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T2.Shop_ID ORDER BY COUNT(T2.Employee_ID) DESC LIMIT 1
SELECT DISTINCT S.Name FROM shop S LEFT JOIN hiring H ON S.Shop_ID = H.Shop_ID WHERE H.Shop_ID IS NULL
SELECT s.name FROM shop s LEFT JOIN hiring h ON s.shop_id = h.shop_id WHERE h.shop_id IS NULL
SELECT shop.Name, COUNT(hiring.Employee_ID) FROM hiring JOIN shop ON hiring.Shop_ID = shop.Shop_ID GROUP BY shop.Name
SELECT DISTINCT shop.Name, COUNT(hiring.Employee_ID) as Number_of_Employees  FROM hiring  JOIN shop ON hiring.Shop_ID = shop.Shop_ID  GROUP BY shop.Name
SELECT sum(Bonus) FROM evaluation
SELECT SUM(Bonus) FROM evaluation
SELECT E.*  FROM employee E  JOIN hiring H ON E.Employee_ID = H.Employee_ID
SELECT Employee_ID, Start_from, Is_full_time FROM hiring
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000
SELECT DISTINCT t1.district FROM shop AS t1 JOIN hiring AS t2 ON t1.shop_id = t2.shop_id WHERE t1.Number_products < 3000 INTERSECT SELECT DISTINCT t1.district FROM shop AS t1 JOIN hiring AS t2 ON t1.shop_id = t2.shop_id WHERE t1.Number_products > 10000
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(Document_ID) FROM Documents
SELECT COUNT(Document_ID) FROM Documents
SELECT DISTINCT d.Document_ID, d.Document_Name, d.Document_Description FROM Documents d
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT T1.Document_ID ,  T2.Document_Name FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID  =  T2.Document_ID WHERE T1.Document_Description LIKE '%w%'
SELECT T2.Document_ID, T2.Template_ID, T1.Document_Description FROM Documents AS T1  INNER JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID  WHERE T1.Document_Name = 'Robbin CV'
SELECT DISTINCT T2.Document_ID, T2.Template_ID, T1.Document_Description FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Document_Name = 'Robbin CV'
SELECT COUNT(DISTINCT T.Template_ID) FROM Documents AS D JOIN Templates AS T ON D.Template_ID = T.Template_ID
SELECT COUNT(DISTINCT Template_ID) FROM Documents
SELECT COUNT(DISTINCT D.Document_ID) AS Num_of_Documents FROM Documents D JOIN Templates T ON D.Template_ID = T.Template_ID WHERE T.Template_Type_Code = 'PPT'
SELECT COUNT(*) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT')
SELECT T1.Template_ID, COUNT(T3.Document_ID) AS Num_of_Documents  FROM Templates AS T1  LEFT JOIN Documents AS T3 ON T1.Template_ID = T3.Template_ID  GROUP BY T1.Template_ID
SELECT T.Template_ID, COUNT(T.Template_ID) AS Document_Count FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID
SELECT t1.Template_ID, t3.Template_Type_Code FROM Templates AS t1 INNER JOIN Documents AS t2 ON t1.Template_ID = t2.Template_ID INNER JOIN Ref_Template_Types AS t3 ON t1.Template_Type_Code = t3.Template_Type_Code GROUP BY t1.Template_ID, t3.Template_Type_Code ORDER BY COUNT(t2.Document_ID) DESC LIMIT 1
SELECT T2.Template_Type_Code, COUNT(T3.Document_ID) AS Number_of_Documents  FROM Documents AS T1  JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID  JOIN Ref_Template_Types AS T3 ON T2.Template_Type_Code = T3.Template_Type_Code  GROUP BY T2.Template_Type_Code  ORDER BY Number_of_Documents DESC  LIMIT 1;
SELECT Templates.Template_ID FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID HAVING COUNT(Documents.Document_ID) > 1
SELECT T2.Template_ID FROM Paragraphs AS T1  JOIN Documents AS T2  ON T1.Document_ID  =  T2.Document_ID GROUP BY T2.Template_ID HAVING COUNT(T1.Document_ID)  >  1
SELECT T.Template_ID FROM Templates AS T WHERE NOT EXISTS (SELECT 1 FROM Documents AS D WHERE T.Template_ID = D.Template_ID)
SELECT T.Template_ID FROM Templates AS T  LEFT JOIN Documents AS D ON T.Template_ID = D.Template_ID  WHERE D.Document_ID IS NULL
SELECT COUNT(Template_ID) FROM Templates
SELECT COUNT(Template_ID) AS Number_of_Templates FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT T1.Template_ID, T1.Version_Number, T1.Template_Type_Code FROM Templates AS T1
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT DISTINCT Template_ID FROM Templates WHERE Template_Type_Code = 'PP' OR Template_Type_Code = 'PPT'
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT COUNT(Template_ID) FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Description = 'CV'
SELECT T1.Version_Number, T1.Template_Type_Code FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T1.Version_Number > 5
SELECT DISTINCT Version_Number ,  Template_Type_Code FROM Templates WHERE Version_Number  >  5
SELECT Template_Type_Code, COUNT(*) as Number_of_Templates FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code ,  COUNT(Template_ID) FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT t.Template_Type_Code FROM Templates t GROUP BY t.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Ref_Template_Types  WHERE Template_Type_Code NOT IN (   SELECT T1.Template_Type_Code    FROM Templates AS T1   JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID   GROUP BY T1.Template_Type_Code    HAVING COUNT(DISTINCT T2.Document_ID) >= 3 )
SELECT Template_Type_Code FROM Ref_Template_Types AS A JOIN Templates AS B ON A.Template_Type_Code = B.Template_Type_Code GROUP BY Template_Type_Code HAVING COUNT(B.Template_ID) < 3
SELECT MIN(Version_Number), Template_Type_Code FROM Templates ORDER BY Version_Number ASC LIMIT 1
SELECT min(t1.version_number), t3.template_type_code FROM templates AS t1 JOIN ref_template_types AS t3 ON t3.template_type_code = t1.template_type_code
SELECT T1.template_type_code FROM Ref_Template_types AS T1 JOIN Templates AS T2 ON T1.template_type_code = T2.template_type_code JOIN Documents AS T3 ON T2.template_id = T3.template_id WHERE T3.document_name = 'Data base'
SELECT Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = 'Data Base'
SELECT T1.Document_Name FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID JOIN Ref_Template_Types AS T3 ON T2.Template_Type_Code = T3.Template_Type_Code WHERE T3.Template_Type_Code = 'BK'
SELECT D.Document_Name FROM Documents D JOIN Templates T ON D.Template_ID = T.Template_ID JOIN Ref_Template_Types R ON T.Template_Type_Code = R.Template_Type_Code WHERE R.Template_Type_Code = 'BK'
SELECT T1.template_type_code, COUNT(DISTINCT T3.document_id) AS num_of_documents FROM Ref_Template_Types AS T1 INNER JOIN Templates AS T2 ON T1.template_type_code = T2.template_type_code INNER JOIN Documents AS T3 ON T2.template_id = T3.template_id GROUP BY T1.template_type_code
SELECT T2.Template_Type_Code, COUNT(DISTINCT T1.Document_ID) FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_Type_Code
SELECT Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Template_Type_Code ORDER BY COUNT(Document_ID) DESC LIMIT 1
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1  JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code  GROUP BY T1.Template_Type_Code  ORDER BY COUNT(*) DESC  LIMIT 1
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1 LEFT JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Code IS NULL
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1 JOIN Documents AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Document_ID IS NULL
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT T2.Template_Type_Description FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID JOIN Ref_Template_Types AS T3 ON T2.Template_Type_Code = T3.Template_Type_Code WHERE T3.Template_Type_Code = 'AD'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT DISTINCT rt.Template_Type_Description FROM Ref_Template_Types rt JOIN Templates t ON rt.Template_Type_Code = t.Template_Type_Code JOIN Documents d ON t.Template_ID = d.Template_ID
SELECT DISTINCT T2.Template_Type_Description FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID
SELECT Templates.Template_ID FROM Ref_Template_Types AS Ref_Template_Types INNER JOIN Templates AS Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Description = 'Presentation'
SELECT Templates.Template_ID FROM Ref_Template_Types INNER JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Description = 'Presentation'
SELECT COUNT(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs
SELECT COUNT(Paragraph_ID)  FROM Documents AS D  JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID  WHERE D.Document_Name = 'Summer Show'
SELECT COUNT(Paragraph_ID)  FROM Documents  JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID  WHERE Documents.Document_Name = 'Summer Show'
SELECT      Paragraph_Text,     Other_Details FROM     Paragraphs WHERE     Paragraph_Text = 'Korea'
SELECT Paragraph_Text, Other_Details FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT paragraphs.Paragraph_ID, paragraphs.Paragraph_Text FROM paragraphs JOIN documents ON paragraphs.Document_ID = documents.Document_ID WHERE documents.Document_Name = 'Welcome to NY'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Welcome to NY'
SELECT Paragraph_Text FROM Paragraphs INNER JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Document_Name = 'Customer reviews'
SELECT Paragraph_Text FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name = 'Customer reviews')
SELECT D.Document_ID, COUNT(P.Paragraph_ID) AS Paragraph_Count  FROM Documents D  JOIN Paragraphs P ON D.Document_ID = P.Document_ID  GROUP BY D.Document_ID  ORDER BY D.Document_ID
SELECT D.Document_ID, COUNT(P.Paragraph_ID) as Number_of_Paragraphs FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY D.Document_ID
SELECT    D.Document_ID,   D.Document_Name,   COUNT(P.Paragraph_ID) AS Num_Paragraphs FROM    Documents D    JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY    D.Document_ID,   D.Document_Name
SELECT d.Document_ID, d.Document_Name, COUNT(p.Paragraph_ID) AS Number_of_Paragraphs FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID, d.Document_Name
SELECT D.Document_ID FROM Documents AS D  JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID  GROUP BY D.Document_ID  HAVING COUNT(P.Paragraph_ID) >= 2
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT D.Document_ID, D.Document_Name FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name ORDER BY COUNT(P.Paragraph_ID) DESC LIMIT 1
SELECT TOP 1 Documents.Document_ID, Documents.Document_Name FROM Documents INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID, Documents.Document_Name ORDER BY COUNT(*) DESC
SELECT T2.Document_ID FROM Documents AS T2 JOIN Paragraphs AS T3 ON T2.Document_ID = T3.Document_ID GROUP BY T2.Document_ID ORDER BY COUNT(T3.Paragraph_ID) LIMIT 1
SELECT T1.document_id FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.document_id = T2.document_id GROUP BY T1.document_id ORDER BY COUNT(T2.paragraph_id) ASC LIMIT 1
SELECT T1.Document_ID FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID  =  T2.Document_ID GROUP BY T1.Document_ID HAVING COUNT(*)  >=  2
SELECT Paragraph_ID  FROM Paragraphs
SELECT Paragraph_ID FROM Paragraphs WHERE Paragraph_Text = 'Brazil'  UNION  SELECT Paragraph_ID FROM Paragraphs WHERE Paragraph_Text = 'Ireland'
SELECT DISTINCT D.Document_ID FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID WHERE P.Paragraph_Text IN ('Brazil', 'Ireland')
SELECT COUNT(DISTINCT Teacher_ID) FROM teacher
SELECT COUNT(DISTINCT Teacher_ID) FROM teacher
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Age, Hometown FROM teacher
SELECT Name, Age, Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Hometown <> 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1
SELECT Hometown FROM teacher WHERE Age = (SELECT MAX(Age) FROM teacher)
SELECT hometown, COUNT(teacher_id)  FROM teacher  GROUP BY hometown
SELECT Hometown ,  COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Hometown FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(Hometown) >= 2
SELECT Hometown FROM teacher GROUP BY Hometown HAVING count(*) >= 2
SELECT t.Name FROM teacher AS t JOIN course_arrange AS ca ON t.Teacher_ID = ca.Teacher_ID
SELECT T1.name, T3.course FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN course AS T3 ON T2.course_id = T3.course_id
SELECT T2.Name , T1.Course FROM course AS T1 JOIN course_arrange AS T3 ON T1.Course_ID  =  T3.Course_ID JOIN teacher AS T2 ON T2.Teacher_ID = T3.Teacher_ID ORDER BY T2.Name ASC
SELECT T1.name ,  T2.course FROM teacher AS T1 JOIN course_arrange AS T3 ON T1.teacher_id  =  T3.teacher_id JOIN course AS T2 ON T3.course_id  =  T2.course_id ORDER BY T1.name ASC
SELECT t.Name FROM teacher t  JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID  JOIN course c ON ca.Course_ID = c.Course_ID  WHERE c.Course = 'Math'
SELECT T1.Name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID JOIN course AS T3 ON T2.Course_ID = T3.Course_ID WHERE T3.Course = 'Math'
SELECT teacher.Name, COUNT(course_arrange.Teacher_ID) AS Number_of_Courses FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Name
SELECT Name, COUNT(*) FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Name
SELECT t.Name FROM teacher t INNER JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Name HAVING COUNT(DISTINCT ca.Course_ID) >= 2
SELECT DISTINCT teacher.Name FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Name HAVING COUNT(DISTINCT course_arrange.Course_ID) >= 2
SELECT T.Name FROM teacher AS T LEFT JOIN course_arrange AS CA ON T.Teacher_ID = CA.Teacher_ID WHERE CA.Teacher_ID IS NULL
SELECT T1.Name FROM teacher AS T1 LEFT JOIN course_arrange AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID WHERE T2.Course_ID  IS NULL
SELECT COUNT(*) FROM visitor WHERE age < 30
SELECT v.Name FROM visitor AS v WHERE v.Level_of_membership  >  4 ORDER BY v.Level_of_membership DESC
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC
SELECT M.Museum_ID, M.Name FROM museum M ORDER BY M.Num_of_Staff DESC LIMIT 1
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < 2009
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > 2010);
SELECT v.ID, v.Name, v.Age FROM visitor v JOIN visit vi ON v.ID = vi.visitor_ID GROUP BY v.ID, v.Name, v.Age HAVING COUNT(DISTINCT vi.Museum_ID) > 1
SELECT visitor_ID FROM visit ORDER BY Total_spent DESC LIMIT 1
SELECT museum.Museum_ID, museum.Name FROM museum JOIN visit ON museum.Museum_ID = visit.Museum_ID GROUP BY museum.Museum_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT T2.name ,  T2.age FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_id  =  T2.id WHERE T1.num_of_ticket  =  (SELECT MAX(T1.num_of_ticket) FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_id  =  T2.id)
SELECT AVG(Num_of_Ticket) as Avg_Tickets_Bought, MAX(Num_of_Ticket) as Max_Tickets_Bought FROM visit
SELECT SUM(v.Total_spent) FROM visit AS v JOIN visitor AS vis ON v.visitor_ID = vis.ID WHERE vis.Level_of_membership = 1
SELECT v.Name  FROM visitor v  JOIN visit vv  ON v.ID = vv.visitor_ID  JOIN museum m  ON vv.Museum_ID = m.Museum_ID  WHERE m.Open_Year < '2009'  INTERSECT  SELECT v.Name  FROM visitor v  JOIN visit vv  ON v.ID = vv.visitor_ID  JOIN museum m  ON vv.Museum_ID = m.Museum_ID  WHERE m.Open_Year > '2011'
SELECT COUNT(DISTINCT T1.Name) FROM visitor AS T1 LEFT JOIN visit AS T2 ON T1.ID  =  T2.visitor_ID WHERE T2.Museum_ID  IS  NULL OR T2.Museum_ID  NOT  IN (SELECT Museum_ID FROM museum WHERE Open_Year > 2010)
SELECT COUNT(*) FROM museum WHERE Open_Year > 2013 OR Open_Year < 2008
SELECT COUNT(DISTINCT player_id) FROM players
SELECT COUNT(*) FROM players
SELECT COUNT(match_id) FROM matches
SELECT COUNT(*) FROM matches
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT first_name, birth_date  FROM players  WHERE country_code = 'USA'
SELECT AVG(loser_age) AS average_loser_age, AVG(winner_age) AS average_winner_age FROM matches
SELECT AVG(winner_age) AS avg_winner_age, AVG(loser_age) AS avg_loser_age FROM matches
SELECT avg(winner_rank) FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT MAX(ranking) FROM rankings  INNER JOIN matches ON rankings.player_id = matches.loser_id
SELECT MAX(T1.ranking) FROM rankings AS T1 INNER JOIN matches AS T2 ON T1.player_id = T2.loser_id
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) FROM matches;
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT TOURNEY_NAME  FROM matches  GROUP BY TOURNEY_NAME  HAVING COUNT(MATCH_ID) > 10
SELECT T1.tourney_name  FROM matches AS T1  JOIN players AS T2 ON T1.winner_id = T2.player_id  JOIN players AS T3 ON T1.loser_id = T3.player_id  GROUP BY T1.tourney_name  HAVING COUNT(T1.match_num) > 10
SELECT DISTINCT p.first_name, p.last_name  FROM players p  JOIN matches m ON p.player_id = m.winner_id  WHERE m.year IN (2013, 2016)
SELECT winner_name FROM matches WHERE winner_id IN (SELECT player_id FROM players WHERE country_code = 'US') AND year IN (2013, 2016)
SELECT count(*) FROM matches WHERE year IN (2013, 2016)
SELECT COUNT(*) FROM matches WHERE YEAR IN (2013, 2016)
SELECT T1.country_code, T1.first_name FROM players AS T1 INNER JOIN matches AS T2 ON T1.player_id = T2.winner_id WHERE T2.tourney_name LIKE 'WTA Championships%' AND T2.tourney_name LIKE '%Australian Open%'
SELECT players.first_name, players.country_code FROM players INNER JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = 'WTA Championships' INTERSECT SELECT players.first_name, players.country_code FROM players INNER JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = 'Australian Open'
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1
SELECT first_name, country_code  FROM players  ORDER BY birth_date DESC  LIMIT 1
SELECT first_name, last_name FROM players ORDER BY birth_date
SELECT first_name, last_name FROM players ORDER BY birth_date
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date;
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id WHERE T2.tours = ( SELECT MAX(T3.tours) FROM rankings AS T3 )
SELECT first_name, country_code  FROM players  WHERE player_id = (     SELECT player_id      FROM (         SELECT player_id, COUNT(*) as num          FROM rankings          GROUP BY player_id          ORDER BY num DESC          LIMIT 1     ) as top_player )
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT MAX(year) FROM matches
SELECT winner_name, winner_rank_points FROM (     SELECT winner_name, MAX(COUNT(*)) as max_wins     FROM matches     GROUP BY winner_name     ) as sub JOIN matches ON matches.winner_name = sub.winner_name WHERE matches.winner_rank_points = sub.max_wins;
SELECT winner_name, ranking_points FROM players  JOIN matches ON players.player_id = matches.winner_id  JOIN rankings ON players.player_id = rankings.player_id GROUP BY winner_name, ranking_points ORDER BY COUNT(matches.match_num) DESC  LIMIT 1
SELECT w.name FROM players w  JOIN matches m ON w.id = m.winner_id  JOIN rankings r ON w.id = r.player_id  WHERE m.tourney_name = 'Australian Open'  AND r.tours = (     SELECT MAX(tours) FROM rankings WHERE player_id = w.id )
SELECT T1.winner_name FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_name = 'Australian Open' ORDER BY T2.ranking_points DESC LIMIT 1
SELECT loser_name, winner_name FROM matches ORDER BY minutes DESC LIMIT 1
SELECT T3.winner_name, T3.loser_name FROM matches AS T1 JOIN players AS T2 ON T1.loser_id = T2.player_id JOIN players AS T3 ON T1.winner_id = T3.player_id WHERE T1.match_num = ( SELECT MAX(match_num) FROM matches )
SELECT p.first_name, AVG(r.ranking) AS average_ranking  FROM players p  JOIN rankings r ON p.player_id = r.player_id  GROUP BY p.first_name
SELECT T1.first_name, AVG(T2.ranking) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id  =  T2.player_id GROUP BY T1.player_id
SELECT T1.player_id, T1.first_name, SUM(T2.ranking_points) AS total_ranking_points FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id, T1.first_name
SELECT p.first_name, SUM(r.ranking_points) as total_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name
SELECT COUNT(*) FROM players GROUP BY country_code
SELECT COUNT(*), country_code FROM players GROUP BY country_code
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(player_id) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50
SELECT COUNT(DISTINCT tourney_id), ranking_date  FROM rankings  GROUP BY ranking_date
SELECT COUNT(DISTINCT T2.tourney_id) AS total_tours, T1.ranking_date FROM rankings AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id GROUP BY T1.ranking_date
SELECT COUNT(*) FROM matches GROUP BY YEAR
SELECT COUNT(*) FROM matches WHERE YEAR IN (SELECT DISTINCT YEAR FROM matches);
SELECT w.first_name, w.last_name, r.ranking  FROM players AS w JOIN rankings AS r ON w.player_id = r.player_id WHERE w.birth_date = (SELECT MIN(birth_date) FROM players) ORDER BY r.ranking  LIMIT 3;
SELECT players.first_name, players.last_name, players.ranking  FROM players  JOIN (     SELECT winner_id, ranking      FROM rankings      WHERE player_id IN (         SELECT winner_id          FROM matches          ORDER BY winner_age ASC          LIMIT 3     )  ) AS rankings ON players.player_id = rankings.winner_id
SELECT COUNT(DISTINCT p.player_id) FROM players p INNER JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_level = 'G' AND p.hand = 'L'
SELECT COUNT(*) FROM matches  WHERE winner_hand = 'L' AND tourney_level = 'G'
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN matches m ON p.player_id = m.winner_id JOIN rankings r ON p.player_id = r.player_id WHERE r.ranking_points = ( SELECT MAX(ranking_points) FROM rankings )
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN rankings r ON p.player_id = r.player_id WHERE r.ranking_points = (     SELECT MAX(ranking_points)     FROM rankings )
SELECT hand, COUNT(*) as player_count  FROM players  GROUP BY hand
SELECT hand, COUNT(player_id) FROM players GROUP BY hand
SELECT COUNT(id) FROM ship WHERE disposition_of_ship = 'Captured'
SELECT name, tonnage FROM ship ORDER BY name DESC
SELECT name, date, result FROM battle
SELECT MAX(d.killed) AS max_killed, MIN(d.killed) AS min_killed, b.name FROM battle b JOIN ship s ON b.id = s.lost_in_battle JOIN death d ON s.id = d.caused_by_ship_id WHERE b.id IN (SELECT DISTINCT id FROM battle) GROUP BY b.name
SELECT AVG(injured) FROM death
SELECT tonnage, kille0, injured FROM ship INNER JOIN death ON ship.id = death.caused_by_ship_id WHERE tonnage = 't'
SELECT battle.name, battle.result FROM battle JOIN ship ON battle.id = ship.lost_in_battle WHERE battle.bulgarian_commander <> 'Boril'
SELECT battle.id, battle.name FROM battle JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.tonnage = 'brig'
SELECT battle.id, battle.name FROM battle JOIN ship ON battle.id = ship.lost_in_battle JOIN death ON ship.id = death.caused_by_ship_id GROUP BY battle.id, battle.name HAVING COUNT(death.killed) > 10
SELECT t1.id ,  t1.name FROM ship AS t1 JOIN death AS t2 ON t1.id  =  t2.caused_by_ship_id GROUP BY t1.id ,  t1.name ORDER BY sum(t2.injured) DESC LIMIT 1
SELECT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'
SELECT COUNT(DISTINCT result) FROM battle
SELECT COUNT(b.id)  FROM battle b  JOIN ship s ON b.id = s.lost_in_battle  WHERE s.tonnage = '225'  AND b.result <> 'lose';
SELECT T.`name`, T1.`date` FROM battle AS T JOIN ship AS T1 ON T.id = T1.lost_in_battle WHERE T1.name IN ('Lettice', 'HMS Atalanta')
SELECT T2.name , T2.result , T2.bulgarian_commander FROM ship AS T1 JOIN battle AS T2 ON T1.lost_in_battle  =  T2.id WHERE T1.location != 'English Channel'
SELECT note FROM death WHERE note LIKE '%East%'
SELECT line_1 ,  line_2 FROM addresses
SELECT `line_1`, `line_2` FROM `addresses`
SELECT COUNT(DISTINCT course_id)
SELECT COUNT(course_id) FROM Courses
SELECT course_description FROM courses WHERE course_name = 'Math'
SELECT `course_description` FROM `Courses` WHERE `course_name` = 'math'
SELECT zip_postcode FROM Addresses WHERE city = "Port Chelsea"
SELECT zip_postcode FROM Addresses WHERE line_1 LIKE '%Port Chelsea%'
SELECT d.department_id, d.department_name, COUNT(*) as number_of_degrees FROM Departments d JOIN Degree_Programs dp ON d.department_id = dp.department_id GROUP BY d.department_id, d.department_name ORDER BY number_of_degrees DESC
SELECT department_name, department_id FROM Departments ORDER BY (SELECT COUNT(*) FROM Degree_Programs WHERE department_id = Departments.department_id) DESC LIMIT 1
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT department_id)  FROM Degrees
SELECT COUNT(DISTINCT degree_program_name) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_summary_name)  FROM Degree_Programs
SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs WHERE department_id IN (SELECT department_id FROM Departments WHERE department_name = 'Engineering')
SELECT COUNT(*) FROM DEGREE_PROGRAMS WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Engineering')
SELECT course_name, course_description FROM Courses
SELECT course_id, course_name, course_description FROM Courses
SELECT T1.course_name, T1.course_id FROM Courses AS T1 INNER JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_name, T1.course_id HAVING COUNT(*) <= 2
SELECT course_id FROM Sections GROUP BY course_id HAVING COUNT(*) < 2
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM sections ORDER BY section_name DESC
SELECT semester_id, semester_name  FROM Semesters  WHERE semester_id IN (     SELECT semester_id      FROM Student_Enrolment      GROUP BY semester_id      ORDER BY COUNT(*) DESC      LIMIT 1 );
SELECT semester_id, semester_name, COUNT(student_id) as student_count FROM Students JOIN Student_Enrolment on Students.student_id = Student_Enrolment.student_id JOIN Semesters on Student_Enrolment.semester_id = Semesters.semester_id GROUP BY semester_id, semester_name ORDER BY student_count DESC LIMIT 1
SELECT T1.department_description FROM Departments AS T1 INNER JOIN Degree_programs AS T2 ON T1.department_id = T2.department_id WHERE T1.department_name LIKE '%computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%';
SELECT s.student_id, s.first_name, s.middle_name, s.last_name FROM Students s INNER JOIN Student_Enrolment se ON s.student_id = se.student_id INNER JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE se.semester_id IN (     SELECT semester_id     FROM Student_Enrolment     GROUP BY semester_id     HAVING COUNT(DISTINCT degree_program_id) = 2 )
Here's the SQL query:  ```sql SELECT DISTINCT s.student_id, s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp1 ON se.degree_program_id = dp1.degree_program_id JOIN Degree_Programs dp2 ON se.degree_program_id = dp2.degree_program_id AND dp1.degree_program_id != dp2.degree_program_id JOIN Semesters sem ON se.semester_id = sem.semester_id WHERE sem.semester_id = (SELECT semester_id FROM Student_Enrolment GROUP BY semester_id ORDER BY COUNT(*) DESC LIMIT 1) ```  This query first joins `Students` table with `Student_Enrolment` table. It then joins `Degree_Programs` table twice to ensure there are two distinct degree programs for the same semester. It also joins `Semesters` table to make sure the semester has the most enrollments. Finally, it filters out the students who are enrolled in only one degree program.
SELECT T3.first_name, T3.middle_name, T3.last_name FROM DEGREE_PROGRAMS AS T1 JOIN STUDENT_ENROLMENT AS T2 ON T1.degree_program_id = T2.degree_program_id JOIN STUDENTS AS T3 ON T3.student_id = T2.student_id WHERE T1.degree_summary_name = 'Bachelor'
SELECT first_name, middle_name, last_name FROM Students WHERE student_id IN (SELECT student_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Bachelors'))
SELECT T2.`degree_program_name` FROM `Student_Enrolment` AS T1 INNER JOIN `Degree_Programs` AS T2 ON T1.`degree_program_id` = T2.`degree_program_id` GROUP BY T1.`degree_program_id` ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.degree_summary_name  FROM Degree_Programs d  JOIN Student_Enrolment se ON d.degree_program_id = se.degree_program_id  GROUP BY d.degree_summary_name  ORDER BY COUNT(se.student_enrolment_id) DESC  LIMIT 1
SELECT D.degree_program_id, D.degree_summary_name, COUNT(S.student_id) as student_count FROM Students S JOIN Student_Enrolment SE ON S.student_id = SE.student_id JOIN Degree_Programs D ON SE.degree_program_id = D.degree_program_id GROUP BY D.degree_program_id, D.degree_summary_name ORDER BY student_count DESC LIMIT 1
Here is the SQL query to find the program id and the summary of the degree that has the most students enrolled: ```sql SELECT degree_programs.degree_program_id, degree_programs.degree_summary_name, COUNT(student_enrolment_courses.student_course_id) as num_students FROM degree_programs JOIN student_enrolment_courses ON degree_programs.degree_program_id = student_enrolment_courses.course_id GROUP BY degree_programs.degree_program_id, degree_programs.degree_summary_name ORDER BY num_students DESC LIMIT 1; ``` This query first joins the `degree_programs` and `student_enrolment_courses` tables on the `degree_program_id` column. It then groups the results by `degree_program_id` and `degree_summary_name`, and orders them by the number of students enrolled in descending order. The `LIMIT 1` clause is used to return only the program with the most students enrolled.
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(se.student_enrolment_id) as number_of_enrollments  FROM Students s  JOIN Student_Enrolment se ON s.student_id = se.student_id  GROUP BY s.student_id, s.first_name, s.middle_name, s.last_name  ORDER BY number_of_enrollments DESC  LIMIT 1
SELECT T1.student_id, T1.first_name, T1.middle_name, T1.last_name, COUNT(T2.student_enrolment_id) FROM Students AS T1 INNER JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY COUNT(T2.student_enrolment_id) DESC LIMIT 1
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (     SELECT semester_id     FROM Student_Enrolment )
SELECT course_name FROM Courses WHERE course_id IN (SELECT course_id FROM Student_Enrolment_Courses GROUP BY course_id)
SELECT DISTINCT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id  =  T2.course_id
SELECT course_id FROM Student_Enrolment_Courses GROUP BY course_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.course_name FROM Student_Enrolment_Courses AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id JOIN Courses AS T3 ON T1.course_id = T3.course_id GROUP BY T3.course_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT s.last_name  FROM Students s  WHERE s.state_province_county = 'North Carolina' AND s.date_left IS NULL
SELECT S.last_name FROM Students S LEFT JOIN Student_Enrolment SE ON S.student_id = SE.student_id WHERE S.state_province_county = 'North Carolina' AND SE.student_id IS NULL
SELECT T2.transcript_id, T2.transcript_date FROM STUDENT_ENROLMENT_COURSES AS T1  JOIN TRANSCRIPT_CONTENTS AS T2 ON T2.student_course_id = T1.student_course_id  GROUP BY T2.transcript_id, T2.transcript_date  HAVING COUNT(*) >= 2
SELECT t.transcript_id, t.transcript_date FROM Transcripts t JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id, t.transcript_date HAVING COUNT(tc.student_course_id) >= 2
SELECT cell_mobile_number FROM Students WHERE first_name = "Timmothy" AND last_name = "Ward"
SELECT `cell_mobile_number` FROM `Students` WHERE `first_name` LIKE 'Timmothy' AND `last_name` LIKE 'Ward'
SELECT T1.first_name, T1.middle_name, T1.last_name FROM Students AS T1 ORDER BY T1.date_first_registered ASC LIMIT 1
SELECT first_name, middle_name, last_name  FROM Students ORDER BY student_id ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM STUDENTS ORDER BY date_first_registered LIMIT 1
SELECT first_name, middle_name, last_name  FROM Students  WHERE date_first_registered = (     SELECT MIN(date_first_registered)      FROM Students )
SELECT first_name FROM students WHERE permanent_address_id != current_address_id
SELECT s.first_name FROM Students s WHERE s.current_address_id != s.permanent_address_id
SELECT T1.address_id, T1.line_1, T1.line_2, T1.line_3, T1.city, T1.zip_postcode, T1.state_province_county, T1.country FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.current_address_id GROUP BY T1.address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.address_id, T2.line_1, T2.line_2 FROM ( SELECT student_id, COUNT(*) AS cnt FROM Student_Enrolment GROUP BY student_id ) AS T1 JOIN Addresses AS T2 ON T2.address_id = T1.student_id ORDER BY T1.cnt DESC LIMIT 1
SELECT AVG(transcript_date) FROM Transcripts
SELECT AVG(transcript_date) FROM Transcripts
SELECT MAX(transcript_date) ,  other_details FROM Transcripts
SELECT transcript_date, MAX(transcript_date) FROM Transcripts
SELECT COUNT(*) FROM Transcripts
SELECT COUNT(transcript_id) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT MAX(COUNT(T3.student_course_id)) FROM Student_Enrolment_Courses AS T3 INNER JOIN Transcript_Contents AS T4 ON T3.student_course_id = T4.student_course_id GROUP BY T3.course_id
SELECT MAX(occurrences) as max_occurrences, course_id FROM (   SELECT COUNT(tc.transcript_id) as occurrences, tc.course_id   FROM Transcript_Contents as tc   GROUP BY tc.course_id ) AS subquery
SELECT transcript_id, transcript_date FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT T.transcript_id, T.transcript_date FROM Transcripts AS T JOIN Transcript_Contents AS TC ON T.transcript_id = TC.transcript_id GROUP BY T.transcript_id, T.transcript_date ORDER BY COUNT(TC.student_course_id) ASC LIMIT 1
SELECT semester_name FROM Semesters WHERE semester_id IN  (SELECT semester_id FROM Student_Enrolment WHERE student_id IN  (SELECT student_id FROM Students WHERE degree_program_id IN  (SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name LIKE '%Master%')) AND student_id IN  (SELECT student_id FROM Students WHERE degree_program_id IN  (SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name LIKE '%Bachelor%'))
SELECT semester_id FROM student_enrolment_courses AS sc JOIN student_enrolment AS se ON sc.student_enrolment_id = se.student_enrolment_id JOIN degree_programs AS dp ON se.degree_program_id = dp.degree_program_id JOIN courses AS c ON sc.course_id = c.course_id WHERE dp.degree_summary_name IN ('Masters', 'Bachelors') GROUP BY semester_id HAVING COUNT(DISTINCT degree_summary_name) = 2
SELECT COUNT(DISTINCT current_address_id) FROM Students
SELECT DISTINCT a.* FROM addresses AS a JOIN students AS s ON a.address_id = s.current_address_id
SELECT first_name, middle_name, last_name, cell_mobile_number, email_address, ssn, date_first_registered, date_left, other_student_details FROM Students ORDER BY last_name DESC
SELECT student_id, first_name, last_name, middle_name, cell_mobile_number, email_address, ssn, date_first_registered, date_left, current_address_id, permanent_address_id FROM Students ORDER BY first_name DESC, last_name DESC, middle_name DESC
SELECT    s.section_name,   COUNT(sc.student_course_id) AS num_students FROM    Sections s   JOIN Student_Enrolment_Courses sc ON s.section_id = sc.course_id WHERE    s.section_name LIKE 'H%' GROUP BY    s.section_name
SELECT SUM(T1.Course_Description) FROM Courses AS T1 INNER JOIN Student_Enrolment_Courses AS T2 ON T1.Course_ID = T2.Course_ID INNER JOIN Student_Enrolment AS T3 ON T3.Student_Enrolment_ID = T2.Student_Enrolment_ID INNER JOIN Sections AS T4 ON T4.Section_ID = T1.Section_ID WHERE T4.Section_Name = 'H'
SELECT first_name FROM students WHERE permanent_address_id IN (SELECT address_id FROM addresses WHERE country = 'Haiti' OR cell_mobile_number = '09700166582')
SELECT DISTINCT T1.first_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.permanent_address_id = T2.address_id WHERE T2.country = 'Haiti' OR T1.cell_mobile_number = '09700166582'
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT title FROM cartoon ORDER BY title ASC
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT COUNT(DISTINCT c.id) FROM Cartoon AS c WHERE c.Written_by = 'Joseph Kuhr'
SELECT COUNT(id) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT T2.Title, T2.Directed_by FROM TV_series AS T1 JOIN Cartoon AS T2 ON T1.Channel = T2.Channel ORDER BY T1.Air_Date
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel  =  T2.id WHERE T1.Directed_by = 'Ben Jones' OR T1.Directed_by = 'Brandon Vietti'
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT T1.Country, COUNT(T2.id) AS Num_of_TV_Channels FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel GROUP BY T1.Country ORDER BY Num_of_TV_Channels DESC LIMIT 1
SELECT COUNT(T1.id), T1.Country FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel GROUP BY T1.Country ORDER BY COUNT(T1.id) DESC LIMIT 1
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT T1.Package_Option FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.series_name = 'Sky Radio'
SELECT COUNT(DISTINCT Channel) FROM TV_Channel WHERE Language = 'English'
SELECT COUNT(DISTINCT id) FROM TV_Channel WHERE Language = 'English';
SELECT Language, COUNT(DISTINCT id) AS Number_of_TV_Channels  FROM TV_Channel  GROUP BY Language  ORDER BY Number_of_TV_Channels ASC LIMIT 1
SELECT COUNT(T1.Language), T1.Language FROM TV_Channel AS T1 INNER JOIN TV_series AS T2 ON T1.id = T2.Channel GROUP BY T1.Language ORDER BY COUNT(T1.id) ASC LIMIT 1
SELECT Language ,  COUNT(*) FROM TV_Channel GROUP BY Language
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language
SELECT series_name FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon WHERE Title = 'The Rise of the Blue Beetle!')
SELECT TV_Channel.series_name FROM TV_Channel JOIN TV_series ON TV_Channel.id = TV_series.Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Title = 'The Rise of the Blue Beetle'
SELECT Title FROM Cartoon WHERE Channel = (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio')
SELECT DISTINCT T3.title FROM TV_series AS T1 JOIN TV_channel AS T2 ON T1.channel = T2.id JOIN cartoon AS T3 ON T2.id = T3.channel WHERE T2.series_name = 'Sky Radio'
SELECT Episode FROM TV_series ORDER BY Rating
SELECT Episode FROM TV_series ORDER BY Rating
SELECT TV_series.Episode, TV_series.Rating FROM TV_series ORDER BY TV_series.Rating DESC LIMIT 3
SELECT Episode, Rating  FROM TV_series  ORDER BY Rating DESC  LIMIT 3;
SELECT MIN(T1.Share), MAX(T1.Share) FROM TV_series AS T1 JOIN TV_channel AS T2 ON T1.channel  =  T2.id
SELECT MAX(T3.Share), MIN(T3.Share) FROM TV_Channel AS T1 JOIN TV_series AS T3 ON T1.id = T3.Channel
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Episode FROM TV_series WHERE Title = 'A Love of a Lifetime'
SELECT id  FROM TV_series  WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT t1.series_name FROM TV_Channel AS t1 JOIN TV_series AS t2 ON t1.id  =  t2.Channel WHERE t2.Episode =  "A Love of a Lifetime"
SELECT T3.series_name FROM TV_series AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id JOIN Cartoon AS T3 ON T1.Channel = T3.Channel WHERE T1.Episode = 'A Love of a Lifetime'
SELECT T2.Episode FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'
SELECT T3.Episode FROM TV_Channel AS T1  JOIN TV_series AS T2 ON T2.Channel = T1.id  JOIN Cartoon AS T3 ON T3.Channel = T1.id  WHERE T1.series_name = 'Sky Radio'
SELECT COUNT(*) ,  T1.Directed_by FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel  =  T2.id GROUP BY T1.Directed_by
SELECT director, COUNT(id) as total_cartoons FROM Cartoon GROUP BY director
SELECT t1.Production_code, t1.Channel FROM Cartoon AS t1 JOIN TV_Channel AS t2 ON t1.Channel  =  t2.id ORDER BY t1.Original_air_date DESC LIMIT 1
SELECT MAX(Cartoon.Production_code), Cartoon.Channel FROM Cartoon
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV IS NOT NULL
SELECT Package_Option, series_name FROM TV_Channel INNER JOIN TV_series ON TV_Channel.id = TV_series.Channel WHERE Hight_definition_TV = 'Yes'
SELECT Country FROM TV_Channel WHERE EXISTS (SELECT 1 FROM Cartoon WHERE Written_by = 'Todd Casey' AND Channel = TV_Channel.id)
SELECT Country FROM TV_Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Written_by = 'Todd Casey'
SELECT Country FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon WHERE Directed_by != 'Todd Casey' AND Channel IN (SELECT id FROM TV_Channel))
SELECT DISTINCT T.Country FROM TV_Channel AS T LEFT JOIN Cartoon AS C ON T.id = C.Channel WHERE C.Written_by != 'Todd Casey' OR C.Written_by IS NULL
SELECT T2.series_name, T2.Country FROM Cartoon AS T1  JOIN TV_Channel AS T2 ON T1.Channel = T2.id  WHERE T1.Directed_by = 'Ben Jones' AND T1.Directed_by = 'Michael Chang'
SELECT T1.series_name, T1.Country FROM TV_channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones'
SELECT t1.Pixel_aspect_ratio_PAR, t1.Country FROM TV_Channel AS t1 JOIN TV_series AS t2 ON t1.id = t2.Channel WHERE t1.Language != 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language <> 'English';
SELECT t1.id FROM TV_Channel AS t1 JOIN TV_series AS t2 ON t1.id  =  t2.Channel GROUP BY t1.Country HAVING count(*)  >  2
SELECT id FROM TV_Channel WHERE id IN (SELECT Channel FROM TV_series GROUP BY Channel HAVING COUNT(Channel) > 2)
SELECT DISTINCT T1.id FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.id NOT IN (SELECT T1.id FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Directed_by = 'Ben Jones')
SELECT id FROM TV_Channel WHERE Directed_by != 'Ben Jones';
SELECT DISTINCT Package_Option FROM TV_Channel WHERE Channel NOT IN (SELECT id FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT t1.Package_Option FROM TV_channel AS t1 JOIN TV_series AS t2 ON t1.id = t2.Channel JOIN Cartoon AS t3 ON t2.Channel = t3.Channel WHERE t3.Directed_by != 'Ben Jones'
SELECT COUNT(*) FROM poker_player
SELECT COUNT(Poker_Player_ID) FROM poker_player
SELECT DISTINCT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT money_rank FROM poker_player ORDER BY earnings DESC LIMIT 1
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT MAX(Final_Table_Made)  FROM poker_player  JOIN people ON poker_player.People_ID = people.People_ID  WHERE Earnings < 200000
SELECT Name FROM people
SELECT Name FROM people
SELECT name FROM people WHERE people_id IN (SELECT people_id FROM poker_player WHERE earnings > 300000)
SELECT T3.name FROM poker_player AS T1 JOIN people AS T3 ON T1.people_id  =  T3.people_id WHERE T1.earnings  >  300000
SELECT Name FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID ORDER BY Final_Table_Made ASC
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Final_Table_Made ASC
SELECT Birth_Date FROM poker_player INNER JOIN people ON poker_player.People_ID = people.People_ID ORDER BY Earnings ASC LIMIT 1
SELECT Birth_Date FROM people WHERE People_ID = (SELECT People_ID FROM poker_player ORDER BY Earnings ASC LIMIT 1)
SELECT money_rank FROM poker_player ORDER BY height DESC LIMIT 1
SELECT T1.Money_Rank FROM poker_player AS T1 INNER JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1
SELECT AVG(T1.Earnings) FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height > 200
SELECT AVG(T2.Earnings) FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID  =  T2.People_ID WHERE T1.Height  >  200
SELECT P.Name  FROM poker_player P  JOIN people People ON P.People_ID = People.People_ID  ORDER BY P.Earnings DESC
SELECT T1.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality
SELECT Nationality ,  COUNT(*) FROM people GROUP BY Nationality
SELECT T1.Name, T1.Nationality FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID  =  T2.People_ID GROUP BY T1.Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Nationality FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID GROUP BY T1.Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Nationality FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID  =  T2.People_ID GROUP BY T1.Nationality HAVING COUNT(*)  >=  2
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT T1.name, T1.birth_date FROM people AS T1 JOIN poker_player AS T2 ON T1.people_id = T2.people_id ORDER BY T1.name ASC
SELECT T1.Name, T1.Birth_Date FROM people AS T1 ORDER BY T1.Name
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Nationality != 'Russia'
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT state) FROM AREA_CODE_STATE
SELECT contestant_number, contestant_name  FROM CONTESTANTS  ORDER BY contestant_name DESC
SELECT vote_id, phone_number, state FROM VOTES
SELECT MAX(area_code) FROM AREA_CODE_STATE;
SELECT MAX(created) FROM votes WHERE state = 'CA';
SELECT T1.contestant_name FROM CONTESTANTS AS T1 INNER JOIN VOTES AS T2 ON T1.contestant_number = T2.contestant_number WHERE T1.contestant_name != 'Jessie Alloway'
SELECT DISTINCT state, created FROM votes;
SELECT DISTINCT T1.contestant_number, T1.contestant_name FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T1.contestant_number HAVING COUNT(*) >= 2
SELECT MIN(c.contestant_number) AS contestant_number ,  MIN(c.contestant_name) AS contestant_name  FROM CONTESTANTS c INNER JOIN VOTES v ON c.contestant_number = v.contestant_number GROUP BY c.contestant_number ,  c.contestant_name ORDER BY COUNT(v.contestant_number) ASC LIMIT 1
SELECT COUNT(*)  FROM VOTES  WHERE state IN ('NY', 'CA')
SELECT count(*) FROM CONTESTANTS AS T1 LEFT JOIN VOTES AS T2 ON T1.contestant_number = T2.contestant_number WHERE T2.contestant_number IS NULL
SELECT T1.area_code FROM area_code_state AS T1 JOIN votes AS T2 ON T1.state = T2.state GROUP BY T1.area_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT created, state, phone_number FROM VOTES AS T1 JOIN CONTESTANTS AS T2 ON T1.contestant_number = T2.contestant_number WHERE T2.contestant_name = 'Tabatha Gehling'
SELECT T1.area_code FROM AREA_CODE_STATE AS T1 JOIN VOTES AS T2 ON T1.state = T2.state JOIN CONTESTANTS AS T3 ON T2.contestant_number = T3.contestant_number WHERE T3.contestant_name = 'Tabatha Gehling' INTERSECT SELECT T1.area_code FROM AREA_CODE_STATE AS T1 JOIN VOTES AS T2 ON T1.state = T2.state JOIN CONTESTANTS AS T3 ON T2.contestant_number = T3.contestant_number WHERE T3.contestant_name = 'Kelly Clauss'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear > 1950
SELECT t1.name FROM country AS t1 JOIN sqlite_sequence AS t2 ON t1.code = t2.name WHERE t1.indepyear > 1950
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'
SELECT COUNT(C.Code) FROM country C WHERE C.GovernmentForm = 'Republic'
SELECT SUM(T1.SurfaceArea) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Region = 'Caribbean'
SELECT sum(T2.SurfaceArea) FROM country AS T1 JOIN country AS T2 ON T1.Code = T2.Code WHERE T2.Continent = 'Caribbean'
SELECT Continent FROM country WHERE Code = (SELECT CountryCode FROM city WHERE Name = 'Anguilla')
SELECT T1.Name FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T2.Name = 'Anguilla'
SELECT Region FROM country WHERE Code = (SELECT CountryCode FROM city WHERE Name = "Kabul");
SELECT Region FROM country WHERE Name = 'Kabul';
SELECT Language FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba') ORDER BY Percentage DESC LIMIT 1
SELECT Name FROM countrylanguages WHERE CountryCode = (SELECT CountryCode FROM city WHERE Name = 'Aruba') AND IsOfficial = 'T'
SELECT Population, LifeExpectancy FROM country WHERE Code = 'BRA'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Region, Population FROM Country WHERE Code = 'ANG'
SELECT T2.Region FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T2.Name = 'Angola'
SELECT avg(T1.LifeExpectancy) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Region = 'Central Africa'
SELECT AVG(t2.LifeExpectancy) FROM country AS t1 INNER JOIN city AS t2 ON t1.Code = t2.CountryCode WHERE t1.Continent = 'Africa'
SELECT T3.Name  FROM country AS T1  JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode  JOIN city AS T3 ON T1.Code = T3.CountryCode  WHERE T2.IsOfficial = 'T' AND T1.Continent = 'Asia'  ORDER BY T1.LifeExpectancy ASC  LIMIT 1
SELECT T2.name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.Continent = 'Asia' ORDER BY T2.LifeExpectancy LIMIT 1
SELECT sum(Population), max(GNP) FROM city AS t1 JOIN country AS t2 ON t1.CountryCode = t2.Code WHERE Continent = 'Asia'
SELECT sum(population) FROM city WHERE countrycode IN (SELECT Code FROM country WHERE continent = 'Asia');
SELECT AVG(lifeexpectancy) FROM country WHERE governmentform = 'Republic' AND continent = 'Africa'
SELECT AVG(t2.LifeExpectancy) FROM country AS t1 INNER JOIN city AS t3 ON t1.Code = t3.CountryCode WHERE t1.Continent = 'Africa' AND t1.GovernmentForm = 'Republic'
SELECT sum(T1.surfacearea) FROM country AS T1 INNER JOIN continent AS T2 ON T1.continent_id = T2.id WHERE T2.name = 'Asia' OR T2.name = 'Europe'
SELECT SUM(T2.SurfaceArea) FROM country AS T1 JOIN country AS T2 ON T1.Code = T2.Code WHERE T2.Continent IN ('Asia', 'Europe')
SELECT COUNT(*) FROM city WHERE District = 'Gelderland'
SELECT SUM(T1.Population) FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.District = 'Gelderland'
SELECT AVG(t1.GNP), SUM(t1.Population) FROM country AS t1 JOIN government_type AS t2 ON t1.GovernmentForm = t2.Form WHERE t2.Type = 'US Territory'
SELECT SUM(T1.Population), AVG(T1.GNP) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T1.`IndepYear` < 1949
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT language) FROM countrylanguage
SELECT count(T2.Code) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T1.Continent  =  'Africa' AND T2.IsOfficial  =  'T'
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE CountryCode = 'ABW'
SELECT COUNT(L.Language)  FROM country C  JOIN countrylanguage L ON C.Code = L.CountryCode  WHERE C.Name = 'Aruba'
SELECT COUNT(Language) FROM countryLanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T';
SELECT COUNT(T1.Language) FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.IsOfficial = 'T' AND T2.Name = 'Afghanistan'
SELECT T1.name FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.code  =  T2.countrycode GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T2.CountryCode ORDER BY COUNT(*) DESC LIMIT 1
SELECT t3.Continent FROM country AS t1 JOIN countrylanguage AS t2 ON t1.Code = t2.CountryCode JOIN city AS t3 ON t1.Code = t3.CountryCode GROUP BY t3.CountryCode ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.continent FROM countrylanguage AS T1 JOIN country AS T2 ON T1.countrycode = T2.code GROUP BY T2.continent ORDER BY COUNT(T1.language) DESC LIMIT 1
SELECT COUNT(*) FROM (SELECT DISTINCT c1.Code FROM country c1 JOIN countrylanguage cl1 ON c1.Code = cl1.CountryCode WHERE cl1.Language = 'English') AS subquery1 JOIN (SELECT DISTINCT c2.Code FROM country c2 JOIN countrylanguage cl2 ON c2.Code = cl2.CountryCode WHERE cl2.Language = 'Dutch') AS subquery2 ON subquery1.Code = subquery2.Code
SELECT COUNT(T1.Code) FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE (T2.Language = 'English' AND T2.IsOfficial = 'T') OR (T2.Language = 'Dutch' AND T2.IsOfficial = 'T')
SELECT DISTINCT C.Name FROM country AS C JOIN countrylanguage AS CL1 ON C.Code = CL1.CountryCode JOIN countrylanguage AS CL2 ON C.Code = CL2.CountryCode WHERE CL1.Language = 'English' AND CL2.Language = 'French';
SELECT T2.Name FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'English' AND T2.Name IN (SELECT T2.Name FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'French')
SELECT T2.name FROM country AS T2 JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T3.Language = 'English' AND T3.Language = 'French'
SELECT c.Name  FROM country AS c  JOIN countrylanguage AS cl1 ON c.Code = cl1.CountryCode  JOIN countrylanguage AS cl2 ON c.Code = cl2.CountryCode  WHERE cl1.Language = 'English' AND cl2.Language = 'French'
SELECT count(DISTINCT t2.continent)  FROM countrylanguage t1  JOIN country t2 ON t1.countrycode = t2.code  WHERE t1.language = 'Chinese'
SELECT COUNT(DISTINCT Continent) FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'Chinese')
SELECT Region FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language IN ('English', 'Dutch'))
SELECT region FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE language IN ('Dutch', 'English') GROUP BY region
SELECT T2.Name FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Language = 'English' OR T1.Language = 'Dutch' AND T1.IsOfficial = 'T'
SELECT CountryCode FROM countrylanguage WHERE Language IN ('English', 'Dutch');
SELECT T2.Language FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' GROUP BY T2.Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Asia' GROUP BY T2.Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT L.Language FROM countrylanguage AS L  JOIN country AS C ON L.CountryCode = C.Code  WHERE L.IsOfficial = 'T' AND C.GovernmentForm = 'Republic'  GROUP BY L.Language  HAVING COUNT(DISTINCT C.Code) = 1
SELECT L1.Language FROM countrylanguage AS L1 JOIN country AS C ON L1.CountryCode = C.Code WHERE C.GovernmentForm = 'Republic' GROUP BY L1.Language HAVING COUNT(*) = 1
SELECT Name, Population FROM city WHERE Language = 'English' ORDER BY Population DESC LIMIT 1
SELECT city.Name FROM city JOIN country ON city.CountryCode = country.Code WHERE city.Population = (SELECT MAX(city.Population) FROM city JOIN country ON city.CountryCode = country.Code JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'T')
SELECT T1.name ,  T1.Population ,  T1.LifeExpectancy FROM country AS T1 INNER JOIN ( SELECT * FROM city GROUP BY CountryCode ORDER BY COUNT(ID) DESC LIMIT 1 ) AS T2 ON T1.Code = T2.CountryCode
SELECT Name ,  Population ,  LifeExpectancy FROM country WHERE continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1
SELECT AVG(T2.LifeExpectancy) FROM country AS T1 INNER JOIN city AS T3 ON T1.Code = T3.CountryCode INNER JOIN countrylanguage AS T4 ON T1.Code = T4.CountryCode WHERE T4.IsOfficial != 'T' AND T4.Language != 'english'
SELECT AVG(c.LifeExpectancy) FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language <> 'English'
SELECT COUNT(*) FROM country AS T1 JOIN city AS T2 ON T1.code = T2.countrycode WHERE T1.code NOT IN (SELECT countrycode FROM countrylanguage AS T3 WHERE language = 'English')
SELECT SUM(T2.Population) FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Language = 'English'
SELECT L.Language FROM country AS C INNER JOIN countrylanguage AS L ON C.Code = L.CountryCode WHERE C.HeadOfState = 'Beatrix';
SELECT L.Language  FROM country AS C INNER JOIN countrylanguage AS L ON C.Code = L.CountryCode WHERE C.HeadOfState = 'Beatrix'
SELECT COUNT(DISTINCT T1.Language) FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.IndepYear < 1930
SELECT COUNT(DISTINCT T3.Language) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode INNER JOIN countrylanguage AS T3 ON T1.Code = T3.CountryCode WHERE T1.IndepYear < 1930
SELECT t2.Code, t2.Name FROM country AS t1 INNER JOIN country AS t2 ON t1.Code = t2.Code WHERE t1.Continent = 'Europe' AND t2.SurfaceArea > t1.SurfaceArea
SELECT c1.Name  FROM country AS c1  JOIN (SELECT MAX(SurfaceArea) AS MaxSurfaceArea FROM country WHERE Continent = 'Europe') AS c2  WHERE c1.SurfaceArea > c2.MaxSurfaceArea
SELECT Code FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia')
SELECT t2.Name  FROM country t1  JOIN country t2 ON t1.Continent = 'Asia'  JOIN country t3 ON t3.Continent = 'Africa'  WHERE t1.Population > t3.Population
SELECT Name, Population  FROM country  WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population)  FROM country  WHERE Continent = 'Africa')
SELECT T2.Name FROM country AS T1 JOIN city AS T3 ON T1.Code = T3.CountryCode WHERE T1.Continent = 'Asia' AND T3.Population > ( SELECT MAX(T3.Population) FROM country AS T1 JOIN city AS T3 ON T1.Code = T3.CountryCode WHERE T1.Continent = 'Africa' )
SELECT CountryCode FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT CountryCode FROM country WHERE NOT EXISTS (SELECT NULL FROM countrylanguage WHERE CountryCode = country.Code AND Language = 'English')
SELECT T1.Code FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language != 'English' GROUP BY T1.Code
SELECT DISTINCT c.Code FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language != 'English'
SELECT Code FROM country WHERE GovernmentForm != 'Republic' AND Language != 'English'
SELECT C.Code FROM country AS C WHERE NOT EXISTS (SELECT 1 FROM countrylanguage AS CL WHERE CL.CountryCode = C.Code AND CL.Language = 'English' AND CL.IsOfficial = 'T') AND NOT EXISTS (SELECT 1 FROM country WHERE C.GovernmentForm LIKE '%Republic%')
SELECT C.Name FROM city AS C JOIN country AS Co ON C.CountryCode = Co.Code WHERE Co.Continent = 'Europe' AND NOT EXISTS (SELECT 1 FROM countrylanguage AS CL WHERE CL.CountryCode = Co.Code AND CL.Language = 'English' AND CL.IsOfficial = 'T')
SELECT c.Name FROM city AS c JOIN country AS co ON c.CountryCode = co.Code JOIN countrylanguage AS cl ON co.Code = cl.CountryCode WHERE co.Continent = 'Europe' AND cl.Language = 'English' AND cl.IsOfficial = 'F'
SELECT DISTINCT c1.Name FROM city c1 JOIN country c2 ON c1.CountryCode = c2.Code JOIN countrylanguage c3 ON c2.Code = c3.CountryCode WHERE c2.Continent = 'Asia' AND c3.IsOfficial = 'T' AND c3.Language = 'Chinese'
SELECT DISTINCT city.Name FROM city JOIN country ON city.CountryCode = country.Code JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Asia' AND countrylanguage.IsOfficial = 'T' AND countrylanguage.Language = 'Chinese'
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1
SELECT T2.Name, T2.IndepYear, T2.SurfaceArea  FROM city AS T1  INNER JOIN country AS T2  ON T1.CountryCode = T2.Code  WHERE T2.Population = (SELECT MIN(Population) FROM country)
SELECT      c.Population,     c.Name,     L.HeadOfState FROM      country c JOIN      (SELECT          HeadOfState      FROM          country      ORDER BY          SurfaceArea DESC      LIMIT 1) L ON 1=1 WHERE      c.SurfaceArea = (         SELECT              MAX(SurfaceArea)         FROM              country     );
SELECT Name , Population , HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1
SELECT T1.Name, COUNT(*) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Percentage >= 3 GROUP BY T1.Name
SELECT CountryCode ,  COUNT(Language) FROM countrylanguage GROUP BY CountryCode HAVING COUNT(Language)  > 2
SELECT COUNT(*)  FROM city  WHERE Population > (SELECT AVG(Population)                     FROM city                     WHERE District = city.District)
SELECT COUNT(*) AS NumCities, D.District  FROM city AS C  JOIN country AS Co ON C.CountryCode = Co.Code  JOIN (      SELECT District      FROM city      WHERE Population > (          SELECT AVG(Population)          FROM city      )      GROUP BY District  ) AS D ON C.District = D.District  GROUP BY D.District
SELECT GovernmentForm, SUM(Population) FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72
SELECT GovernmentForm, SUM(Population) FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72
SELECT continent, AVG(lifeexpectancy) AS avg_life_expectancy, SUM(population) AS total_population FROM country WHERE lifeexpectancy < 72 GROUP BY continent
SELECT continent, SUM(population), AVG(lifeexpectancy) FROM country WHERE lifeexpectancy < 72 GROUP BY continent
SELECT name ,  surfacearea FROM country ORDER BY surfacearea DESC LIMIT 5
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT T1.Name FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode ORDER BY T2.Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population LIMIT 3
SELECT T1.Name FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode ORDER BY T1.Population ASC LIMIT 3
SELECT COUNT(Code) FROM country WHERE Continent = 'Asia'
SELECT COUNT(Code) FROM country WHERE Continent = 'Asia'
SELECT T2.name FROM city AS T1 JOIN country AS T2 ON T1.countrycode = T2.code WHERE T2.continent = 'Europe' AND T1.population = 80000
SELECT T2.Name FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'Europe' AND T2.Population = 80000
SELECT T3.Sum_Population, T3.Average_Area FROM country AS T1 INNER JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode INNER JOIN ( SELECT T4.Continent, SUM(T1.Population) AS Sum_Population, AVG(T1.SurfaceArea) AS Average_Area FROM city AS T1 INNER JOIN country AS T4 ON T1.CountryCode = T4.Code WHERE T4.Continent = 'North America' AND T1.SurfaceArea > 3000 GROUP BY T4.Continent ) AS T3 ON T1.Continent = T3.Continent
SELECT SUM(T1.Population), AVG(T1.SurfaceArea) FROM country AS T1 INNER JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Continent = 'North America' AND T1.SurfaceArea > 3000
SELECT Name FROM city WHERE Population >= 160000 AND Population <= 900000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage GROUP BY CountryCode ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.name AS country, T4.Language AS language, T4.Percentage FROM country AS T1 JOIN countrylanguage AS T4 ON T1.Code = T4.CountryCode JOIN city AS T3 ON T1.Code = T3.CountryCode WHERE T3.Population = (SELECT MAX(Population) FROM city WHERE CountryCode = T3.CountryCode) AND T4.Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE CountryCode = T3.CountryCode)
SELECT T1.Code FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Percentage = MAX(T2.Percentage) GROUP BY T1.Code
SELECT COUNT(DISTINCT T2.CountryCode)  FROM countrylanguage AS T1  JOIN country AS T2 ON T1.CountryCode = T2.Code  WHERE T1.Language = 'Spanish' AND T1.Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE CountryCode = T2.Code)
SELECT COUNT(T1.Code) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Spanish' AND T2.Percentage >= 50 AND T2.IsOfficial = 'T';
SELECT Code FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish') AND Population = (SELECT Population FROM country WHERE Language = 'Spanish' ORDER BY Population DESC LIMIT 1)
SELECT c.Code  FROM country AS c  INNER JOIN countrylanguage AS cl ON c.Code = cl.CountryCode  WHERE cl.Language = 'Spanish' AND cl.IsOfficial = 'T'
SELECT COUNT(*) FROM conductor
SELECT COUNT(DISTINCT Name) FROM conductor
SELECT Name FROM conductor ORDER BY Age ASC
SELECT T1.Name FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID ORDER BY T1.Age
SELECT T1.Name FROM conductor AS T1 INNER JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T1.Nationality != "USA"
SELECT t1.Name  FROM conductor AS t1  JOIN orchestra AS t2 ON t1.Conductor_ID = t2.Conductor_ID  WHERE t1.Nationality <> 'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT AVG(T3.Attendance) FROM performance AS T1 JOIN show AS T2 ON T1.Performance_ID = T2.Performance_ID JOIN show AS T3 ON T2.Show_ID = T3.Show_ID
SELECT AVG(Attendance) FROM show
SELECT MAX(t3.Share)  FROM performance AS t1  INNER JOIN show AS t2 ON t1.Performance_ID = t2.Performance_ID  INNER JOIN orchestra AS t3 ON t1.Orchestra_ID = t3.Orchestra_ID  WHERE t1.Type != 'Live final'
SELECT MAX(T.Official_ratings_(millions)), MIN(T.Official_ratings_(millions)) FROM performance AS T WHERE T.Type != 'Live final'
SELECT count(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT name FROM conductor ORDER BY year_of_work DESC
SELECT Name  FROM conductor  ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Name ORDER BY COUNT(T2.Orchestra_ID) DESC LIMIT 1
SELECT T2.Name, T1.Orchestra  FROM orchestra AS T1  JOIN conductor AS T2 ON T1.Conductor_ID = T2.Conductor_ID
SELECT T.name, O.orchestra FROM conductor AS T INNER JOIN orchestra AS O ON T.conductor_id  =  O.conductor_id
SELECT DISTINCT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name HAVING COUNT(DISTINCT o.Orchestra_ID) > 1
SELECT T2.Name FROM performance AS T1 JOIN orchestra AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID WHERE T2.Orchestra IN ( SELECT T3.Orchestra FROM performance AS T1 JOIN orchestra AS T3 ON T1.Orchestra_ID = T3.Orchestra_ID GROUP BY T3.Orchestra HAVING COUNT(T3.Orchestra) > 1 )
SELECT Name FROM conductor WHERE Conductor_ID IN (SELECT Conductor_ID FROM orchestra GROUP BY Conductor_ID ORDER BY COUNT(*) DESC LIMIT 1);
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT C.Name FROM conductor C JOIN orchestra O ON C.Conductor_ID = O.Conductor_ID WHERE O.Year_of_Founded > 2008
SELECT Name FROM conductor WHERE Conductor_ID IN (SELECT Conductor_ID FROM orchestra WHERE Year_of_Founded > 2008)
SELECT Record_Company ,  COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT count(*) ,  Record_Company FROM orchestra GROUP BY Record_Company
SELECT major_record_format FROM orchestra ORDER BY major_record_format ASC
SELECT `Major_Record_Format` FROM `orchestra` GROUP BY `Major_Record_Format` ORDER BY COUNT(*) DESC
SELECT R.Record_Company  FROM orchestra AS O JOIN performance AS P ON O.Orchestra_ID = P.Orchestra_ID  JOIN conductor AS C ON O.Conductor_ID = C.Conductor_ID WHERE O.Major_Record_Format = 'CD' AND C.Nationality = 'United Kingdom' AND P.Official_ratings_millions > 100  GROUP BY R.Record_Company  ORDER BY COUNT(R.Record_Company) DESC  LIMIT 1
SELECT `Record_Company`  FROM `orchestra`  WHERE `Record_Company` IS NOT NULL  GROUP BY `Record_Company`  ORDER BY COUNT(`Orchestra_ID`) DESC  LIMIT 1
SELECT name FROM orchestra WHERE orchestra_id NOT IN (SELECT orchestra_id FROM performance)
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT COUNT(DISTINCT `Major_Record_Format`) FROM orchestra WHERE `Major_Record_Format` IN ('CD', 'DVD')
SELECT COUNT(T3.Orchestra_ID) FROM performance AS T1 INNER JOIN orchestra AS T3 ON T1.Orchestra_ID = T3.Orchestra_ID WHERE T3.Major_Record_Format IN ('CD', 'DVD')
SELECT DISTINCT Year_of_Founded FROM orchestra
SELECT Year_of_Founded  FROM orchestra  JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID  GROUP BY Year_of_Founded  HAVING COUNT(DISTINCT Performance_ID) > 1
SELECT COUNT(ID) FROM Highschooler
SELECT COUNT(DISTINCT ID) FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT DISTINCT grade FROM Highschooler
SELECT grade FROM Highschooler
SELECT grade FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T2.friend_id = 101
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT name FROM Highschooler WHERE grade = 10
SELECT name  FROM Highschooler  WHERE grade = 10;
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT COUNT(*) FROM Highschooler WHERE grade = 9 OR grade = 10
SELECT grade, COUNT(ID) FROM Highschooler GROUP BY grade
SELECT grade FROM Highschooler GROUP BY grade
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1;
SELECT grade  FROM Highschooler  GROUP BY grade  ORDER BY COUNT(ID) DESC  LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(ID) >= 4
SELECT grade  FROM Highschooler  GROUP BY grade  HAVING COUNT(ID) >= 4
SELECT h.ID, COUNT(f.student_id) AS num_friends FROM Highschooler h LEFT JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID
SELECT COUNT(friend_id) FROM Friend WHERE student_id = ID
SELECT hs.name, COUNT(*) as num_friends FROM Highschooler hs  JOIN Friend f ON hs.ID = f.student_id  GROUP BY hs.name
SELECT name ,  COUNT(*) FROM Friend JOIN Highschooler ON Friend.student_id = Highschooler.ID GROUP BY Friend.student_id
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend GROUP BY student_id ORDER BY COUNT(student_id) DESC LIMIT 1)
SELECT T3.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T2.ID = T1.student_id JOIN Highschooler AS T3 ON T3.ID = T1.friend_id GROUP BY T3.ID ORDER BY count(*) DESC LIMIT 1
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(friend_id) >= 3)
SELECT Highschooler.name FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id WHERE Highschooler.ID IN (SELECT friend_id FROM Friend WHERE student_id IN (SELECT ID FROM Highschooler) GROUP BY student_id HAVING COUNT(friend_id) >= 3)
SELECT DISTINCT T1.name  FROM Highschooler AS T1  JOIN Friend AS T2 ON T1.ID = T2.friend_id  WHERE T2.student_id = 1
SELECT T3.name  FROM Friend AS T1  JOIN Highschooler AS T2  ON T1.friend_id = T2.ID  JOIN Highschooler AS T3  ON T1.student_id = T3.ID  WHERE T2.name = 'Kyle'
SELECT COUNT(*) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T2.friend_id = 1
SELECT COUNT(DISTINCT T1.friend_id) FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID WHERE T2.name = 'Kyle'
SELECT ID FROM Highschooler EXCEPT SELECT student_id FROM Friend
SELECT student_id FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT name FROM Highschooler EXCEPT SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id = T2.ID
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT DISTINCT friend_id FROM Friend) AND ID NOT IN (SELECT DISTINCT liked_id FROM Likes)
SELECT DISTINCT h.ID FROM Highschooler h JOIN Friend f ON h.ID = f.student_id JOIN Likes l ON h.ID = l.student_id
SELECT DISTINCT T1.student_id FROM Likes AS T1 JOIN Friend AS T2 ON T1.student_id = T2.student_id WHERE T2.student_id IN (SELECT student_id FROM Likes WHERE student_id IN (SELECT student_id FROM Friend))
SELECT name FROM highschooler WHERE ID IN (SELECT student_id FROM friend GROUP BY student_id) AND ID IN (SELECT liked_id FROM likes GROUP BY liked_id);
SELECT name FROM Highschooler WHERE ID IN (SELECT liked_id FROM Likes WHERE student_id IN (SELECT student_id FROM Friend))
SELECT student_id, COUNT(*) AS total_likes FROM Likes GROUP BY student_id
SELECT student_id, COUNT(*)  FROM Likes  GROUP BY student_id
SELECT T1.name, COUNT(*) as num FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.name
SELECT highschooler.name, COUNT(*) as count FROM highschooler JOIN likes ON highschooler.ID = likes.student_id GROUP BY highschooler.ID, highschooler.name
SELECT name FROM highschooler WHERE ID IN (SELECT student_id FROM likes GROUP BY student_id ORDER BY COUNT(liked_id) DESC LIMIT 1)
SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.liked_id = T2.id GROUP BY T1.liked_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Likes GROUP BY student_id HAVING COUNT(*) >= 2)
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID  =  T2.student_id GROUP BY T2.student_id HAVING COUNT(*)  >=  2
SELECT name FROM Highschooler WHERE grade &gt; 5 AND ID IN (SELECT T1.student_id FROM Friend AS T1 JOIN Friend AS T2 ON T1.student_id = T2.friend_id WHERE T1.friend_id = T2.student_id AND T2.friend_id = T1.student_id)
SELECT name FROM Highschooler WHERE ID IN (SELECT T1.ID FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T2.student_id HAVING COUNT(friend_id) >= 2) AND grade > 5
SELECT COUNT(*) FROM Likes WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(liked_id)  FROM Likes JOIN Highschooler ON Likes.liked_id = Highschooler.ID WHERE Highschooler.name = 'Kyle'
SELECT AVG(grade)  FROM Highschooler  JOIN Friend ON Highschooler.ID = Friend.student_id  GROUP BY grade;
SELECT AVG(grade)  FROM Highschooler  WHERE ID IN (SELECT student_id FROM Friend)
SELECT MIN(grade)  FROM Highschooler  WHERE ID NOT IN (     SELECT DISTINCT student_id      FROM Friend      UNION      SELECT DISTINCT friend_id      FROM Friend )
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT DISTINCT student_id FROM Friend)
SELECT t3.state FROM Owners AS t1  JOIN Dogs AS t2 ON t1.owner_id = t2.owner_id  JOIN Professionals AS t3 ON t3.owner_id = t2.owner_id
SELECT T1.state FROM dogs AS T1 INNER JOIN owners AS T2 ON T1.owner_id = T2.owner_id INNER JOIN professionals AS T3 ON T1.dog_id = T3.dog_id GROUP BY T2.state, T3.state
SELECT AVG(T1.age) FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT AVG(T1.age) FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT professional_id, last_name, cell_number FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id  =  T2.professional_id WHERE T1.state  =  'Indiana' OR T2.professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING count(*)  >  2)
SELECT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' OR professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(treatment_id) > 2 )
SELECT name FROM dogs WHERE cost_of_treatment * (1 - 0.15) <= 1000
SELECT Dogs.name FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id GROUP BY Dogs.name HAVING SUM(Treatments.cost_of_treatment) <= 1000
SELECT DISTINCT first_name FROM owners WHERE first_name NOT IN (SELECT name FROM dogs) UNION SELECT DISTINCT first_name FROM professionals WHERE first_name NOT IN (SELECT name FROM dogs)
SELECT first_name FROM Owners WHERE first_name NOT IN (SELECT first_name FROM Dogs) UNION SELECT first_name FROM Professionals
SELECT professional_id, role_code, email_address FROM treatments WHERE professional_id IS NULL
SELECT professional_id, role_code, email_address FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT owner_id , first_name , last_name  FROM Dogs  INNER JOIN Owners ON Dogs.owner_id = Owners.owner_id  GROUP BY owner_id  ORDER BY count(*) DESC  LIMIT 1
SELECT owner_id, first_name, last_name  FROM Owners  JOIN Dogs ON Owners.owner_id = Dogs.owner_id  WHERE dog_id IN (     SELECT dog_id      FROM Dogs      GROUP BY dog_id      ORDER BY COUNT(dog_id) DESC      LIMIT 1 )
SELECT professional_id,role,first_name FROM PROFESSIONALS GROUP BY professional_id HAVING COUNT(professional_id) >= 2
SELECT p.professional_id, p.role_code, p.first_name FROM Professionals AS p JOIN Treatments AS t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.role_code, p.first_name HAVING COUNT(t.treatment_id) >= 2
SELECT breed_name  FROM Breeds  WHERE breed_code IN (     SELECT breed_code      FROM Dogs      GROUP BY breed_code      ORDER BY COUNT(*) DESC      LIMIT 1 )
SELECT b.breed_name  FROM Breeds b  JOIN Dogs d ON b.breed_code = d.breed_code  GROUP BY b.breed_code, b.breed_name  ORDER BY COUNT(*) DESC  LIMIT 1
SELECT o.owner_id, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id WHERE t.date_of_treatment IS NOT NULL GROUP BY o.owner_id, o.last_name ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1
To find the owner id and last name of the owner who spent the most on treatments of his or her dogs, you can use the following SQL query:  ```sql SELECT o.owner_id, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id WHERE t.cost_of_treatment IS NOT NULL GROUP BY o.owner_id, o.last_name ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1; ```  This query will join the `Owners`, `Dogs`, and `Treatments` tables on the relevant columns, filter out any treatments where the cost is null, group the results by owner id and last name, and then order the results in descending order based on the sum of treatment costs. Finally, the `LIMIT 1` clause will ensure that only the owner with the highest total treatment cost is returned.
SELECT description FROM treatments JOIN treatment_types ON treatments.treatment_type_code = treatment_types.treatment_type_code GROUP BY treatments.treatment_type_code ORDER BY SUM(cost_of_treatment) LIMIT 1
SELECT T3.treatment_type_description FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id JOIN Treatment_Types AS T3 ON T3.treatment_type_code = T1.treatment_type_code GROUP BY T3.treatment_type_code ORDER BY SUM(T1.cost_of_treatment) ASC LIMIT 1
SELECT T1.owner_id, T1.zip_code FROM Owners AS T1 INNER JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id WHERE T2.date_adopted IS NOT NULL GROUP BY T1.owner_id, T1.zip_code ORDER BY SUM(T2.age) DESC LIMIT 1
SELECT O.owner_id, O.zip_code  FROM Treatments AS T  JOIN Dogs AS D ON T.dog_id = D.dog_id  JOIN Owners AS O ON D.owner_id = O.owner_id  GROUP BY O.owner_id, O.zip_code  ORDER BY SUM(T.cost_of_treatment) DESC  LIMIT 1
SELECT DISTINCT P.professional_id, P.cell_number FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id GROUP BY P.professional_id HAVING COUNT(T.treatment_type_code) >= 2
SELECT professional_id, cell_number  FROM (     SELECT professional_id      FROM Treatments      GROUP BY professional_id      HAVING COUNT(treatment_type_code) >= 2 ) AS Professionals
SELECT p.first_name, p.last_name FROM professionals p JOIN treatments t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM treatments);
SELECT first_name, last_name FROM Professional WHERE professional_id IN (SELECT professional_id FROM treatments WHERE cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM treatments))
SELECT T1.date_of_treatment ,  T3.first_name FROM Treatments AS T1 JOIN Professionals AS T3 ON T1.professional_id = T3.professional_id
SELECT t.date_of_treatment, p.first_name  FROM Treatments t  JOIN Professionals p ON t.professional_id = p.professional_id
SELECT T1.cost_of_treatment ,  T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT t1.cost_of_treatment, t2.treatment_type_description FROM Treatments AS t1 JOIN Treatment_Types AS t2 ON t1.treatment_type_code = t2.treatment_type_code
SELECT t1.first_name, t1.last_name, t3.size_description FROM owners AS t1 INNER JOIN dogs AS t2 ON t1.owner_id = t2.owner_id INNER JOIN sizes AS t3 ON t2.size_code = t3.size_code
SELECT O.first_name, O.last_name, D.size_code FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id
SELECT `first_name`, `name` FROM `Owners` JOIN `Dogs` ON `owners`.`owner_id` = `dogs`.`owner_id`
SELECT T1.first_name ,  T2.name FROM owners AS T1 JOIN dogs AS T2 ON T1.owner_id = T2.owner_id
SELECT d.name, t.date_of_treatment FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id JOIN Breeds b ON d.breed_code = b.breed_code ORDER BY b.breed_name ASC LIMIT 1
SELECT T1.name, T3.date_of_treatment FROM Dogs AS T1 INNER JOIN Breeds AS T2 ON T1.breed_code = T2.breed_code INNER JOIN Treatments AS T3 ON T1.dog_id = T3.dog_id WHERE T2.breed_name = ( SELECT breed_name FROM Breeds GROUP BY breed_name ORDER BY COUNT(breed_name) ASC LIMIT 1 )
SELECT DISTINCT Dogs.name, Owners.first_name  FROM Dogs  JOIN Owners ON Dogs.owner_id = Owners.owner_id  WHERE Owners.state = 'Virginia'
SELECT O.first_name, D.name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id WHERE O.state = 'Virginia'
SELECT  	d.date_arrived,  	d.date_departed  FROM  	Dogs d  	JOIN Treatments t ON d.dog_id = t.dog_id
SELECT T1.date_arrived, T1.date_departed FROM Dogs AS T1 INNER JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT owner.last_name FROM Owners AS owner JOIN Dogs AS dog ON owner.owner_id = dog.owner_id WHERE dog.date_of_birth = (     SELECT MIN(date_of_birth)     FROM Dogs )
SELECT t3.last_name FROM dogs AS t1 JOIN sizes AS t2 ON t1.size_code = t2.size_code JOIN owners AS t3 ON t1.owner_id = t3.owner_id WHERE t1.date_of_birth = ( SELECT MIN(date_of_birth) FROM dogs )
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT date_arrived, date_departed FROM dogs
SELECT date_arrived, date_departed FROM Dogs
SELECT COUNT(DISTINCT dog_id) FROM Treatments
SELECT COUNT(t2.treatment_id)  FROM Treatments AS t2
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT T1.role_code, T1.street, T1.city, T1.state FROM professionals AS T1 JOIN dogs AS T2 ON T1.professional_id = T2.professional_id WHERE T2.city LIKE '%West%'
SELECT T4.role_code ,  T4.street ,  T4.city ,  T4.state FROM Treatments AS T1  JOIN Dogs AS T2 ON T1.dog_id = T2.dog_id  JOIN Owners AS T3 ON T2.owner_id = T3.owner_id  JOIN Professionals AS T4 ON T1.professional_id = T4.professional_id  WHERE T3.city LIKE '%West%'
SELECT first_name, last_name, email_address FROM owners WHERE state LIKE '%North%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT COUNT(DISTINCT dog_id) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT COUNT(dog_id)  FROM Dogs  WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT charge_amount FROM Treatments WHERE treatment_id = (SELECT treatment_id FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1)
SELECT cost_of_treatment  FROM Treatments  ORDER BY date_of_treatment DESC  LIMIT 1
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT COUNT(DISTINCT d.dog_id) FROM dogs AS d WHERE d.dog_id NOT IN ( SELECT DISTINCT t.dog_id FROM treatments AS t )
SELECT COUNT(*) FROM owners WHERE dog_id IS NULL
SELECT COUNT(owner_id) AS number_of_owners FROM Owners LEFT JOIN Dogs ON Owners.owner_id = Dogs.owner_id WHERE Dogs.dog_id IS NULL
SELECT COUNT(*) FROM Professionals LEFT JOIN Treatments ON Professions.professional_id = Treatments.professional_id WHERE Treatments.professional_id IS NULL
SELECT COUNT(professional_id) FROM Treatments
SELECT d.name, d.age, d.weight FROM dogs d WHERE d.abandoned_yn = 1
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT AVG(age) FROM Dogs
SELECT AVG(age) AS average_age FROM Dogs
SELECT max(t1.age)  FROM dogs AS t1
SELECT age FROM Dogs ORDER BY age DESC LIMIT 1
SELECT T2.charge_type, SUM(T1.charge_amount)  FROM charges AS T1  JOIN treatments AS T2 ON T1.charge_id = T2.treatment_type_code  GROUP BY T2.charge_type
SELECT charge_type, charge_amount FROM Charges
SELECT charge_amount FROM Charges ORDER BY charge_amount DESC LIMIT 1
SELECT MAX(t2.charge_amount) AS `Charge Amount` FROM Treatments t1 JOIN Charges t2 ON t1.treatment_id = t2.charge_id
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT breed_name, size_description FROM Breeds JOIN Sizes ON Breeds.size_code = Sizes.size_code
SELECT breed_code, size_code FROM Dogs
SELECT DISTINCT t1.first_name, t3.treatment_type_description FROM Treatments AS t1 JOIN Professionals AS t2 ON t1.professional_id = t2.professional_id JOIN Treatment_Types AS t3 ON t1.treatment_type_code = t3.treatment_type_code
SELECT P.first_name, T.treatment_type_description  FROM Treatments AS T  JOIN Professionals AS P ON T.professional_id = P.professional_id  JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code
SELECT COUNT(*) AS "Number_of_Singers" FROM singer
SELECT COUNT(*) FROM singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year, Citizenship FROM singer
SELECT Birth_Year, Citizenship FROM singer
SELECT DISTINCT T1.name FROM singer AS T1 JOIN song AS T2 ON T1.singer_id = T2.singer_id WHERE T1.citizenship != 'France'
SELECT Name FROM singer WHERE Citizenship != 'French'
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT t2.name FROM singer AS t1 JOIN song AS t2 ON t1.singer_id = t2.singer_id ORDER BY t1.net_worth_millions DESC LIMIT 1
SELECT T1.Name FROM singer AS T1 INNER JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID ORDER BY T1.Net_Worth_Millions DESC LIMIT 1
SELECT COUNT(DISTINCT Citizenship) FROM singer
SELECT COUNT(DISTINCT Singer_ID), Citizenship FROM singer GROUP BY Citizenship
SELECT citizenship  FROM singer  ORDER BY COUNT(*) DESC  LIMIT 1
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT s.Citizenship, MAX(s.Net_Worth_Millions) FROM singer AS s JOIN song AS so ON s.Singer_ID = so.Singer_ID GROUP BY s.Citizenship
SELECT DISTINCT Citizenship, MAX(Net_Worth_Millions) FROM singer
SELECT T2.Title, T1.Name FROM singer AS T1 INNER JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID
SELECT title, name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT DISTINCT s.Name FROM singer s JOIN song sn ON s.Singer_ID = sn.Singer_ID WHERE sn.Sales > 300000
SELECT Name FROM singer WHERE Sales > 300000
SELECT s.Name  FROM singer AS s  INNER JOIN song AS so ON s.Singer_ID = so.Singer_ID  GROUP BY s.Name  HAVING COUNT(*) > 1
SELECT T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID  =  T2.Singer_ID GROUP BY T2.Name HAVING COUNT(T1.Song_ID)  >  1
SELECT T1.name, SUM(T2.sales) FROM singer AS T1 JOIN song AS T2 ON T1.singer_id = T2.singer_id GROUP BY T1.name
SELECT SUM(T1.sales) FROM song AS T1 JOIN singer AS T2 ON T1.singer_id  =  T2.singer_id GROUP BY T2.name
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT DISTINCT Singer_ID FROM song)
SELECT Name  FROM singer  LEFT JOIN song  ON singer.Singer_ID = song.Singer_ID  WHERE song.Song_ID IS NULL
SELECT CITIZENSHIP FROM singer WHERE BIRTH_YEAR > 1955 INTERSECT SELECT CITIZENSHIP FROM singer WHERE BIRTH_YEAR < 1945
SELECT DISTINCT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT DISTINCT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT COUNT(*) FROM Other_Available_Features
SELECT T2.feature_type_name FROM other_property_features AS T1 JOIN ref_feature_types AS T2 ON T2.feature_type_code = T1.feature_id WHERE T1.property_feature_description = 'AirCon'
SELECT T2.property_type_description FROM Properties AS T1 JOIN Ref_Property_Types AS T2 ON T1.property_type_code = T2.property_type_code GROUP BY T2.property_type_description
SELECT property_name FROM properties WHERE property_type_code = 'House' OR property_type_code = 'Apartment' AND room_count > 1
