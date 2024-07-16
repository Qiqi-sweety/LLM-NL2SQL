SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestFreeMealRate FROM `frpm` WHERE `County Name` = 'Alameda';	california_schools
SELECT      `frpm`.`CDSCode`,      `frpm`.`Percent (%) Eligible Free (Ages 5-17)` FROM      `frpm` WHERE      `frpm`.`Educational Option Type` = 'Continuation' ORDER BY      `frpm`.`Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND s.County = 'Fresno County Office of Education';	california_schools
SELECT `schools`.`MailStreet`, `schools`.`MailStreetAbr`, `schools`.`MailCity`, `schools`.`MailZip`, `schools`.`MailState` FROM `frpm` JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `frpm`.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM `frpm`)	california_schools
SELECT s.Phone FROM `schools` s JOIN `frpm` f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`Charter Funding Type` = 'Directly funded' AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.AvgScrMath > 400 AND schools.Virtual = 'F';	california_schools
SELECT s.CDSCode, s.School FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumTstTakr > 500 AND s.Magnet = 1 UNION SELECT s.CDSCode, s.School FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds JOIN school_scores sscore ON s.CDSCode = sscore.CDSCode WHERE sscore.Subject = 'Magnet' AND ss.NumTstTakr > 500;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 IS NOT NULL ORDER BY ss.NumGE1500 DESC LIMIT 1;	california_schools
SELECT SUM(s.NumTstTakr) AS TotalSATTestTakers FROM frpm f JOIN satscores s ON f.CDSCode = s.cds WHERE f.`Percent (%) Eligible FRPM (K-12)` =      (SELECT MAX(`Percent (%) Eligible FRPM (K-12)`)      FROM frpm);	california_schools
SELECT COUNT(DISTINCT frpm.CDSCode) FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrMath > 560 AND frpm.Charter School (Y/N) = 1 AND frpm.Charter Funding Type = 'Directly funded';	california_schools
SELECT f.FRPM_Count_Ages_5_17 FROM frpm f JOIN satscores s ON f.CDSCode = s.cds WHERE s.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores)	california_schools
SELECT `frpm.CDSCode` FROM `frpm` WHERE (`frpm.`Enrollment (K-12)` + `frpm.`Enrollment (Ages 5-17)`) > 500;	california_schools
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`)  FROM `frpm`  WHERE `Percent (%) Eligible FRPM (Ages 5-17)` > 0.3;	california_schools
SELECT s.Phone FROM `schools` s JOIN `satscores` sc ON s.CDSCode = sc.cds WHERE sc.rtype = 'S' ORDER BY (sc.NumGE1500 / sc.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, f.`Enrollment (Ages 5-17)` FROM `frpm` f JOIN `schools` s ON f.CDSCode = s.CDSCode WHERE f.`Enrollment (Ages 5-17)` IS NOT NULL ORDER BY f.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT      s.District,     AVG(t.AvgScrRead) AS AvgScore FROM      schools s JOIN      satscores t ON s.CDSCode = t.cds WHERE      s.StatusType = 'Active' AND t.rtype = 'D' GROUP BY      s.District ORDER BY      AvgScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM schools WHERE `StatusType` = 'Active' AND `District` = 'Alameda' AND EXISTS (     SELECT 1     FROM satscores     WHERE satscores.cds = schools.CDSCode     AND satscores.NumTstTakr < 100 );	california_schools
SELECT      `schools.CDSCode`,      `schools.CharterNum`,      AVG(`satscores.AvgScrWrite`) AS AvgWritingScore FROM      `schools` JOIN      `satscores` ON `schools.CDSCode` = `satscores.cds` WHERE      `satscores.AvgScrWrite` > 499 AND      `schools.CharterNum` IS NOT NULL GROUP BY      `schools.CDSCode`,      `schools.CharterNum` ORDER BY      AvgWritingScore DESC;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Fresno' AND s.FundingType = 'Directly funded' AND ss.NumTstTakr <= 250;	california_schools
SELECT `schools.Phone` FROM `schools` JOIN `satscores` ON `schools.CDSCode` = `satscores.cds` WHERE `satscores.Subject` = 'Math' GROUP BY `schools.CDSCode` ORDER BY AVG(`satscores.AvgScrMath`) DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Amador' AND frpm.High_Grade = '12' AND frpm.Low_Grade = '9';	california_schools
SELECT COUNT(*) FROM frpm WHERE `District Name` = 'Los Angeles' AND `Percent (%) Eligible Free (K-12)` > 500 AND `Percent (%) Eligible Free (K-12)` < 700;	california_schools
SELECT s.School, SUM(st.NumTstTakr) AS TotalTestTakers FROM schools s JOIN satscores st ON s.CDSCode = st.cds WHERE s.County = 'Contra Costa' GROUP BY s.School ORDER BY TotalTestTakers DESC LIMIT 1;	california_schools
SELECT      s.School,      s.Street || ', ' || s.City || ', ' || s.Zip AS FullAddress,     f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)` AS EnrollmentDifference FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)` > 30	california_schools
SELECT s.School FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Percent (%) Eligible Free (K-12)` > 0.1 AND EXISTS (     SELECT 1     FROM satscores     WHERE satscores.cds = s.CDSCode     AND satscores.NumGE1500 IS NOT NULL     AND satscores.NumGE1500 >= 1500 );	california_schools
SELECT s.School, f.FundingType FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Riverside' GROUP BY s.CDSCode HAVING AVG(ss.AvgScrMath) > 400;	california_schools
SELECT      s.School,      s.Street,      s.City,      s.State,      s.Zip  FROM      schools s  JOIN      frpm f      ON s.CDSCode = f.CDSCode  WHERE      s.County = 'Monterey'      AND s.School Type = 'High Schools (Public)'      AND f.`Percent (%) Eligible Free (Ages 5-17)` > 0      AND f.`Free Meal Count (Ages 5-17)` > 800;	california_schools
SELECT      s.`School`,      ss.`Score` AS WritingScore,      s.`Phone` AS CommunicationNumber FROM      schools s JOIN      school_scores ss ON s.`CDSCode` = ss.`CDSCode` WHERE      ss.`Subject` = 'Writing' AND     (s.`OpenDate` > '1991-01-01' OR s.`ClosedDate` < '2000-01-01');	california_schools
SELECT s.School, s.DOCType FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.FundingType = 'Locally funded' GROUP BY s.CDSCode, s.School, s.DOCType HAVING ABS(f.Enrollment (K-12) - f.Enrollment (Ages 5-17)) > (     SELECT AVG(ABS(f1.Enrollment (K-12) - f1.Enrollment (Ages 5-17)))     FROM frpm f1     JOIN schools s1 ON f1.CDSCode = s1.CDSCode     WHERE s1.FundingType = 'Locally funded' )	california_schools
SELECT `schools`.`OpenDate` FROM `schools` JOIN `frpm` ON `schools`.`CDSCode` = `frpm`.`CDSCode` WHERE `frpm`.`Educational Option Type` = 'K-12 Schools (Public)' ORDER BY `frpm`.`Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT `School Name`, `City` FROM `frpm` WHERE `Enrollment (K-12)` IS NOT NULL ORDER BY `Enrollment (K-12)` ASC LIMIT 5;	california_schools
SELECT      District_Name,      School_Name,      `Percent (%) Eligible Free (K-12)` FROM      frpm WHERE      `Enrollment (K-12)` > 0 ORDER BY      `Enrollment (K-12)` DESC LIMIT 10;	california_schools
SELECT      frpm.CDSCode,     frpm.School Name,     frpm.FRPM Count (K-12) / frpm.Enrollment (K-12) AS EligibleFreeMealRate FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.EdOpsCode = '66' ORDER BY      frpm.FRPM Count (K-12) DESC LIMIT 5;	california_schools
SELECT frpm.`School Name`, schools.`Website` FROM frpm JOIN schools ON frpm.`CDSCode` = schools.`CDSCode` WHERE frpm.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT      s.CDSCode,     f.`Percent (%) Eligible Free (Ages 5-17)` FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      s.AdmLName1 = 'Gibson' AND     f.`Percent (%) Eligible Free (Ages 5-17)` IS NOT NULL;	california_schools
SELECT s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`Enrollment (K-12)` = (SELECT MIN(`Enrollment (K-12)`) FROM frpm WHERE `Charter School (Y/N)` = 1) AND f.`Low Grade` = '1' AND f.`High Grade` = '12';	california_schools
SELECT      s.NCESDist,      s.NCESSchool,      s.AdmFName1,      s.AdmLName1 FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      sc.NumGE1500 IS NOT NULL AND sc.NumGE1500 > 0 ORDER BY      sc.NumGE1500 DESC LIMIT 1;	california_schools
SELECT s.Street, s.City, s.Zip, s.State FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 / ss.NumTstTakr = (     SELECT MIN(ss2.NumGE1500 / ss2.NumTstTakr)     FROM satscores ss2     WHERE ss2.NumTstTakr > 0 ) AND s.CDSCode = (     SELECT s3.CDSCode     FROM satscores s3     WHERE s3.NumGE1500 / s3.NumTstTakr = (         SELECT MIN(s4.NumGE1500 / s4.NumTstTakr)         FROM satscores s4         WHERE s4.NumTstTakr > 0     ) );	california_schools
SELECT `schools`.`Website` FROM `schools` WHERE `schools`.`District` = 'Los Angeles Unified' AND        `schools`.`CDSCode` IN (         SELECT `satscores`.`cds`         FROM `satscores`         WHERE `satscores`.`rtype` = 'D'         GROUP BY `satscores`.`cds`         HAVING COUNT(`satscores`.`cds`) BETWEEN 2000 AND 3000       );	california_schools
SELECT AVG(test_takers) AS average_test_takers FROM schools WHERE `OpenDate` BETWEEN '1980-01-01' AND '1980-12-31' AND `County` = 'Fresno' AND EXISTS (SELECT 1 FROM test_takers WHERE test_takers.SchoolPhone = schools.Phone);	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.District = 'Fresno Unified' AND ss.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores ss2 WHERE s2.District = 'Fresno Unified') AND s.County = 'Fresno'	california_schools
SELECT s.SchoolName FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' AND s.County = ss.dname AND s.SOCType = 'School' AND ss.AvgScrRead IS NOT NULL AND EXISTS (     SELECT 1     FROM satscores ss2     WHERE ss2.dname = s.County     AND ss2.AvgScrRead > ss.AvgScrRead     AND s.SOCType = 'School'     AND s.Virtual = 'F'     AND ss2.AvgScrRead IS NOT NULL ) ORDER BY s.County, ss.AvgScrRead DESC LIMIT 5;	california_schools
SELECT `School Name`, `Educational Option Type` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE `Educational Option Type` IS NOT NULL ORDER BY `AvgScrMath` DESC LIMIT 1;	california_schools
SELECT s.County, AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) AS AvgScore FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode JOIN (     SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite) AS MinAvgScore     FROM satscores     WHERE AvgScrMath IS NOT NULL AND AvgScrRead IS NOT NULL AND AvgScrWrite IS NOT NULL ) AS MinScores WHERE s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite = MinScores.MinAvgScore GROUP BY s.County	california_schools
SELECT s.City, AVG(ss.Score) AS AvgWritingScore FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds JOIN school_scores ss ON s.CDSCode = ss.CDSCode WHERE sc.NumGE1500 IS NOT NULL GROUP BY s.CDSCode ORDER BY SUM(sc.NumGE1500) DESC LIMIT 1;	california_schools
SELECT s.`School`, AVG(ts.`Score`) AS AverageWritingScore FROM `schools` s JOIN `test_takers` tt ON s.`CDSCode` = tt.`SchoolPhone` JOIN `school_scores` ts ON s.`CDSCode` = ts.`CDSCode` WHERE s.`AdmFName1` = 'Ricci' AND s.`AdmLName1` = 'Ulrich' AND ts.`Subject` = 'Writing' GROUP BY s.`School`;	california_schools
SELECT s.State, SUM(f.Enrollment(K-12)) AS TotalEnrollment FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.DOC = '31' AND s.SOC = 'K-12 Schools (Public)' GROUP BY s.State ORDER BY TotalEnrollment DESC LIMIT 1;	california_schools
SELECT COUNT(*) / 12 AS MonthlyAverageSchoolsOpened FROM schools WHERE `DOC` = '52' AND YEAR(`OpenDate`) = 1980;	california_schools
SELECT      (SELECT COUNT(*)      FROM `schools` s      JOIN `district_closures` dc ON s.`DOC` = dc.`DOC`      WHERE s.`DOC` = '54' AND s.`StatusType` = 'Closed')     /     (SELECT COUNT(*)      FROM `schools` s      JOIN `district_closures` dc ON s.`DOC` = dc.`DOC`      WHERE s.`DOC` = '52' AND s.`StatusType` = 'Closed') AS merged_school_ratio;	california_schools
SELECT      s.County,      s.School,      s.ClosedDate FROM      schools s WHERE      s.StatusType = 'Closed' GROUP BY      s.County ORDER BY      COUNT(*) DESC LIMIT 1;	california_schools
SELECT s.School, s.Street AS PostalStreet FROM schools s JOIN (     SELECT s.CDSCode, s.School     FROM schools s     JOIN satscores ss ON s.CDSCode = ss.cds     WHERE ss.AvgScrMath IS NOT NULL     ORDER BY ss.AvgScrMath DESC ) ranked_schools ON s.CDSCode = ranked_schools.CDSCode WHERE ranked_schools.School = (     SELECT School     FROM (         SELECT s.School, s.CDSCode         FROM schools s         JOIN satscores ss ON s.CDSCode = ss.cds         WHERE ss.AvgScrMath IS NOT NULL         ORDER BY ss.AvgScrMath DESC     ) subquery     ORDER BY subquery.School DESC     LIMIT 1 OFFSET 6 );	california_schools
SELECT s.MailStreet, s.MailCity, s.MailState, sn.SchoolName FROM schools s JOIN frpm sn ON s.CDSCode = sn.CDSCode JOIN satscores st ON sn.CDSCode = st.cds WHERE st.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores WHERE rtype = 'S') AND st.rtype = 'S' ORDER BY st.AvgScrRead ASC LIMIT 1;	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Lakeport' AND EXISTS (     SELECT 1     FROM satscores     JOIN schools ON satscores.cds = schools.CDSCode     GROUP BY schools.CDSCode     HAVING SUM(satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite) >= 1500 );	california_schools
SELECT SUM(test_takers.SATScore) AS TotalTestTakers FROM schools JOIN test_takers ON schools.CDSCode = test_takers.SchoolPhone WHERE schools.MailCity = 'Fresno';	california_schools
SELECT s.CDSCode, s.Zip, s.MailZip FROM schools s JOIN (     SELECT AdmLName1     FROM schools     WHERE AdmLName1 = 'Atoian' ) admin ON s.AdmLName1 = admin.AdmLName1;	california_schools
SELECT      (SELECT COUNT(*) FROM schools WHERE `County` = 'Colusa' AND `MailState` = 'CA') /      (SELECT COUNT(*) FROM schools WHERE `County` = 'Humboldt' AND `MailState` = 'CA') AS Ratio;	california_schools
SELECT COUNT(*) FROM schools WHERE `State` = 'CA' AND `City` = 'San Joaquin' AND `StatusType` = 'Active';	california_schools
SELECT `schools.Phone`, `schools.Ext` FROM `schools` JOIN (     SELECT `schools.CDSCode`, AVG(`satscores.AvgScrWrite`) AS avg_write_score     FROM `schools`     JOIN `satscores` ON `schools.CDSCode` = `satscores.cds`     GROUP BY `schools.CDSCode`     ORDER BY avg_write_score DESC ) AS ordered_scores ON `schools.CDSCode` = ordered_scores.CDSCode WHERE ordered_scores.avg_write_score = (     SELECT AVG(`satscores.AvgScrWrite`)      FROM `schools`     JOIN `satscores` ON `schools.CDSCode` = `satscores.cds`     GROUP BY `schools.CDSCode`     ORDER BY AVG(`satscores.AvgScrWrite`) DESC     LIMIT 332, 1 );	california_schools
SELECT `schools`.`School`, `schools`.`Phone`, `schools`.`Ext` FROM `schools` WHERE `schools`.`Zip` = '95203-3704';	california_schools
SELECT `Website` FROM `schools` WHERE `AdmFName1` = 'Mike' AND `AdmLName1` = 'Larson'    OR `AdmFName2` = 'Mike' AND `AdmLName2` = 'Larson'    OR `AdmFName3` = 'Mike' AND `AdmLName3` = 'Larson'    OR `AdmFName1` = 'Dante' AND `AdmLName1` = 'Alvarez'    OR `AdmFName2` = 'Dante' AND `AdmLName2` = 'Alvarez'    OR `AdmFName3` = 'Dante' AND `AdmLName3` = 'Alvarez';	california_schools
SELECT `schools`.`Website` FROM `schools` WHERE `schools`.`Charter` = 1 AND `schools`.`Virtual` = 'P' AND `schools`.`County` = 'San Joaquin';	california_schools
SELECT COUNT(*) FROM schools WHERE Charter = 1 AND DOC = '52' AND City = 'Hickman';	california_schools
SELECT COUNT(*) FROM frpm WHERE `District Name` = 'Los Angeles Unified School District' AND `Charter School (Y/N)` = 0 AND `Percent (%) Eligible Free (K-12)` < 0.18;	california_schools
SELECT      s.School,      s.City,      a.AdmFName1,      a.AdmLName1 FROM      schools s JOIN      schools a ON s.CDSCode = a.CDSCode WHERE      s.Charter = 1 AND      s.CharterNum = '00D2';	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s WHERE s.MailCity = 'Hickman' AND s.CharterNum = '00D4';	california_schools
SELECT      (COUNT(CASE WHEN `frpm`.`Charter Funding Type` = 'Locally funded' THEN 1 END) * 100.0) /      COUNT(*) AS PercentageLocallyFunded FROM      `frpm` WHERE      `schools`.`County` = 'Santa Clara'     AND `schools`.`Charter` = 1	california_schools
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND County = 'Stanislaus';	california_schools
SELECT SUM(`DistrictClosureCount`) AS TotalClosureCount FROM `district_closures` WHERE `ClosureYear` = '1989' AND `City` = 'San Francisco';	california_schools
SELECT `County` FROM `schools` WHERE `SOC` = '11' AND `SOCTYPE` = 'CEA' AND `LastUpdate` BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY `County` ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT `schools`.`NCESDist` FROM `schools` WHERE `schools`.`SOC` = '31';	california_schools
SELECT      SUM(CASE WHEN `StatusType` = 'Active' THEN 1 ELSE 0 END) AS ActiveDistrictSchools,     SUM(CASE WHEN `StatusType` = 'Closed' THEN 1 ELSE 0 END) AS ClosedDistrictSchools FROM      schools WHERE      `District` = 'Alpine' AND      `School` IS NOT NULL AND      `School` LIKE 'District Community Day School%';	california_schools
SELECT `District Code` FROM `schools` WHERE `City` = 'Fresno' AND `Magnet` = 0;	california_schools
SELECT `Enrollment (Ages 5-17)` FROM `frpm` WHERE `CDSCode` IN (SELECT `CDSCode` FROM `schools` WHERE `EdOpsCode` = 'SSS' AND `City` = 'Fremont');	california_schools
SELECT      `frpm`.`Free Meal Count (Ages 5-17)` AS FreeMealCount FROM      `frpm` JOIN      `schools` ON      `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE      `schools`.`School` LIKE '%Youth Authority%' AND      `schools`.`MailStreet` LIKE 'PO Box 1040%'	california_schools
SELECT MIN(`StatusType`) AS `LowestGrade` FROM `schools` WHERE `EdOpsCode` = 'SPECON' AND `NCESDist` = '0613360';	california_schools
SELECT      frpm.School Name,      schools.EdOpsName AS EducationalLevel FROM      frpm JOIN      schools  ON      frpm.CDSCode = schools.CDSCode WHERE      frpm.`Educational Option Type` = 'Breakfast Provision 2'      AND frpm.`County Code` = '37';	california_schools
SELECT s.City FROM schools s WHERE s.EILCode = 'HS'   AND s.CDSCode IN (SELECT CDSCode FROM frpm WHERE High Grade = '9' AND High Grade = '12' AND Percent (%) Eligible Free (K-12) = 2)   AND s.County = 'Merced';	california_schools
SELECT      s.School Name,      f Percent__Eligible_FRPM__Ages_5_17 FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      f.Low Grade = 'K' AND f.High Grade = '9'      AND s.County = 'Los Angeles'	california_schools
SELECT `GSoffered` FROM `schools` WHERE `City` = 'Adelanto' GROUP BY `GSoffered` ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT      County,      COUNT(*) AS NumSchools FROM      schools WHERE      County BETWEEN 'San Diego' AND 'Santa Barbara'     AND Virtual = 'F' GROUP BY      County ORDER BY      NumSchools DESC LIMIT 1;	california_schools
SELECT `schools`.`School`, `schools`.`Latitude` FROM `schools` WHERE `schools`.`Latitude` = (SELECT MAX(`schools`.`Latitude`) FROM `schools`);	california_schools
SELECT      s.City,      s.School,      MIN(s.Latitude) AS LowestLatitude,      s.LastUpdate FROM      schools s WHERE      s.State = 'CA' AND      s.Latitude = (SELECT MIN(Latitude) FROM schools WHERE State = 'CA') ORDER BY      s.Latitude ASC LIMIT 1;	california_schools
SELECT      `schools`.`GSoffered` FROM      `schools` ORDER BY      ABS(`schools`.`Longitude`) DESC LIMIT 1;	california_schools
SELECT      s.City,     COUNT(DISTINCT frpm.CDSCode) AS SchoolsCount FROM      schools s JOIN      frpm ON s.CDSCode = frpm.CDSCode WHERE      s.Magnet = 1 AND      s.GSoffered = 'K-8' AND      frpm.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY      s.City;	california_schools
SELECT      AdmFName1 AS FirstName,      District AS DistrictName,      COUNT(*) AS Count FROM      schools WHERE      AdmFName1 IS NOT NULL GROUP BY      AdmFName1, District ORDER BY      Count DESC LIMIT 2;	california_schools
SELECT      frpm.`District Code`,     frpm.`Percent (%) Eligible Free (K-12)` FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode JOIN      test_takers ON schools.CDSCode = test_takers.SchoolPhone WHERE      SUBSTRING(schools.AdmFName1, 1, LENGTH('Alusine')) = 'Alusine'	california_schools
SELECT s.`AdmLName1`, f.`District Type`, f.`County Name`, f.`School Name` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School Number` = '40';	california_schools
SELECT      s.AdmEmail1,      s.AdmEmail2,      s.AdmEmail3 FROM      schools s WHERE      s.County = 'San Bernardino'      AND s.City = 'San Bernardino City Unified'     AND s.DOC = '54'     AND s.SOC = '62'     AND s.OpenDate BETWEEN '2009-01-01' AND '2010-12-31'     AND s.StatusType = 'Active'     AND s.FundingType = 'Public'	california_schools
SELECT s.AdmEmail1, frpm.School Name FROM schools s JOIN frpm ON s.CDSCode = frpm.CDSCode JOIN (     SELECT s.CDSCode, COUNT(*) AS TotalTakers     FROM schools s     JOIN satscores st ON s.CDSCode = st.cds     WHERE st.NumGE1500 IS NOT NULL AND st.NumGE1500 > 0     GROUP BY s.CDSCode     ORDER BY TotalTakers DESC     LIMIT 1 ) AS highest_takers ON s.CDSCode = highest_takers.CDSCode WHERE s.AdmEmail1 IS NOT NULL;	california_schools
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'East Bohemia' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp d1 ON a.account_id = d1.account_id WHERE d.A3 = 'Prague' AND d1.type = 'OWNER';	financial
SELECT      CASE          WHEN AVG(`district.A12`) > AVG(`district.A13`) THEN '1995'         ELSE '1996'     END AS year_with_higher_unemployment_rate,     AVG(`district.A12`) AS avg_unemployment_1995,     AVG(`district.A13`) AS avg_unemployment_1996 FROM      `account` JOIN      `district` ON `account.district_id` = `district.district_id` WHERE      `district.A10` = 1995 OR `district.A10` = 1996;	financial
SELECT COUNT(*) FROM `district` WHERE `A11` > 6000 AND `A11` < 10000 AND `A7` = 'F';	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A10 > 8000;	financial
SELECT      a.account_id,     AVG(c.birth_date) AS avg_age,     (SELECT AVG(c.birth_date) FROM client c WHERE c.gender = 'F') - AVG(c.birth_date) AS age_gap FROM      account a JOIN      client c ON a.account_id = c.account_id WHERE      c.gender = 'F' GROUP BY      a.account_id ORDER BY      avg_age DESC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.account_id = c.account_id JOIN (     SELECT district_id, AVG(amount) as avg_salary     FROM trans     GROUP BY district_id ) AS t ON a.district_id = t.district_id WHERE c.birth_date = (     SELECT MIN(birth_date)     FROM client ) ORDER BY t.avg_salary DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT DISTINCT c.client_id FROM `client` c JOIN `disp` d ON c.client_id = d.client_id JOIN `trans` t ON d.account_id = t.account_id WHERE d.type = 'DISPONENT' AND t.bank IS NOT NULL AND t.account IS NOT NULL;	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE YEAR(l.date) = 1997 AND l.status = 'A' AND a.frequency = 'POPLATEK TYDNE' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT account_id FROM loan WHERE duration > 12 AND date <= '1993-12-31' ORDER BY amount DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM `client` c  JOIN `account` a ON c.client_id = a.account_id  JOIN `district` d ON c.district_id = d.district_id  WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 = 'Sokolov';	financial
SELECT a.account_id FROM account a WHERE a.date LIKE '1995%' ORDER BY a.date ASC LIMIT 1;	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' GROUP BY a.account_id HAVING SUM(t.amount) > 3000;	financial
SELECT c.client_id FROM `client` c JOIN `disp` d ON c.client_id = d.client_id JOIN `card` crd ON d.disp_id = crd.disp_id WHERE crd.issued = '1994-03-03';	financial
SELECT a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14'	financial
SELECT a.district_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date = '1994-08-25';	financial
SELECT MAX(t.amount) AS biggest_transaction FROM trans t JOIN card c ON t.account_id = c.card_id JOIN disp d ON t.account_id = d.account_id JOIN client cl ON d.client_id = cl.client_id WHERE c.issued = '1996-10-21' AND cl.birth_date = '1970-12-13';	financial
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (     SELECT MIN(birth_date)     FROM client     JOIN district d ON client.district_id = d.district_id     WHERE d.A11 = (         SELECT MAX(A11)         FROM district     ) )	financial
SELECT t.amount FROM `trans` t JOIN `account` a ON t.account_id = a.account_id JOIN `loan` l ON a.account_id = l.account_id JOIN `client` c ON a.district_id = c.district_id WHERE t.operation = 'VKLAD' AND c.client_id = (     SELECT client_id     FROM `loan`     ORDER BY amount DESC     LIMIT 1 ) ORDER BY t.trans_id LIMIT 1;	financial
SELECT COUNT(*) FROM `client` WHERE `gender` = 'F' AND `district_id` = (SELECT `district_id` FROM `district` WHERE `A2` = 'Jesenik');	financial
SELECT d.disp_id FROM `disp` d JOIN `client` c ON d.client_id = c.client_id JOIN `account` a ON d.account_id = a.account_id JOIN `order` o ON a.account_id = o.account_id WHERE o.amount = 5100 AND o.date = '1998-09-02';	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Litomerice' AND YEAR(district.A7) = 1996;	financial
SELECT d.A2 FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dt ON c.district_id = dt.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM client c JOIN loan l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT account.account_id FROM account JOIN district ON account.district_id = district.district_id JOIN client ON account.account_id = client.account_id WHERE district.A3 = 'Prague' ORDER BY account.date LIMIT 1;	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(c.client_id) AS male_client_percentage FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A3 = 'south Bohemia' AND d.A4 = (SELECT MAX(A4) FROM district WHERE A3 = 'south Bohemia');	financial
SELECT      (MAX(T.balance) - MIN(T.balance)) / MIN(T.balance) * 100 AS balance_increase_rate FROM      `account` A JOIN      `trans` T ON A.account_id = T.account_id JOIN      `loan` L ON A.account_id = L.account_id JOIN      `client` C ON A.district_id = C.district_id WHERE      C.birth_date = '1993-07-05'     AND T.date BETWEEN '1993-03-22' AND '1998-12-27'     AND L.date <= '1993-07-05' GROUP BY      A.account_id	financial
SELECT     (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) / SUM(l.amount)) * 100 AS paid_loan_percentage FROM     loan l;	financial
SELECT      round(         (COUNT(CASE WHEN l.amount < 100000 THEN 1 END) * 100.0) / COUNT(*),          2     ) AS percentage_accounts_running_no_issue FROM      loan l WHERE      l.amount < 100000     AND l.status = 'C';	financial
SELECT a.account_id, d.A2, d.A3 FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date LIKE '1993%' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.frequency FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dt ON c.district_id = dt.district_id WHERE dt.A3 = 'East Bohemia' AND a.date BETWEEN '1995-01-01' AND '2000-12-31';	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice';	financial
SELECT d.A2, d.A3 FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2, d.A3 FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3, d.A11 FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60;	financial
SELECT d.A2 AS district,         ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment_rate FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status = 'D' AND d.A12 IS NOT NULL AND d.A13 IS NOT NULL AND YEAR(l.date) BETWEEN 1995 AND 1996;	financial
SELECT      (COUNT(CASE WHEN d.A2 = 'Decin' THEN 1 END) * 100.0) / COUNT(*) AS percentage FROM      account a JOIN      district d ON a.district_id = d.district_id WHERE      a.date BETWEEN '1993-01-01' AND '1993-12-31';	financial
SELECT DISTINCT account.account_id FROM account WHERE account.frequency = 'POPLATEK MESICNE';	financial
SELECT d.A2 AS district, COUNT(c.client_id) AS female_account_holders FROM `client` c JOIN `district` d ON c.district_id = d.district_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_account_holders DESC LIMIT 9;	financial
SELECT d.A2 AS district_name, SUM(t.amount) AS total_withdrawals FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' AND NOT EXISTS (     SELECT 1     FROM card c     JOIN disp d ON c.disp_id = d.disp_id     WHERE c.card_id = t.account_id ) GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN district d ON c.district_id = d.district_id LEFT JOIN card cr ON c.client_id = cr.disp_id WHERE d.A3 = 'South Bohemia' AND cr.card_id IS NULL;	financial
SELECT d.A3 AS District, COUNT(l.loan_id) AS ActiveLoans FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.A3 ORDER BY ActiveLoans DESC LIMIT 1;	financial
SELECT AVG(amount) AS average_loan_amount FROM loan WHERE account_id IN (     SELECT account_id     FROM account     JOIN client ON account.district_id = client.district_id     WHERE client.gender = 'M' );	financial
SELECT A2 AS branch_location, A5 AS district_name FROM district WHERE A13 = (SELECT MAX(A13) FROM district WHERE A12 = '1996');	financial
SELECT COUNT(a.account_id)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A16 = (SELECT MAX(A16) FROM district WHERE A16 IS NOT NULL) AND a.date = '1996-12-31';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND t.operation = 'VYBER KARTOU' AND t.balance < 0;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND l.amount >= 250000 AND l.date BETWEEN '1995-01-01' AND '1997-12-31' AND l.status = 'A';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id JOIN disp d ON a.account_id = d.account_id JOIN district dt ON a.district_id = dt.district_id WHERE dt.A2 = 'Hl.m. Praha' AND (l.status = 'C' OR l.status = 'D');	financial
SELECT COUNT(c.client_id) AS male_clients_count FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A15 = (     SELECT A15     FROM district     ORDER BY A15 DESC     LIMIT 1 OFFSET 1 );	financial
SELECT COUNT(*)  FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER';	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Pisek');	financial
SELECT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.date BETWEEN '1997-01-01' AND '1997-12-31' GROUP BY d.A2 HAVING SUM(t.amount) > 10000;	financial
SELECT DISTINCT o.account_id FROM `order` o JOIN `account` a ON o.account_id = a.account_id JOIN `disp` d ON a.account_id = d.account_id JOIN `client` c ON d.client_id = c.client_id JOIN `district` dt ON c.district_id = dt.district_id WHERE dt.district_id = 5 AND o.k_symbol = 'SIPO';	financial
SELECT DISTINCT a.account_id FROM account a JOIN card c ON a.account_id = c.account_id WHERE c.type = 'gold';	financial
SELECT AVG(trans.amount) AS average_credit_card_withdrawal FROM trans JOIN account ON trans.account_id = account.account_id WHERE trans.operation = 'VYBER KARTOU' AND YEAR(trans.date) = 2021;	financial
SELECT DISTINCT t1.account_id FROM `trans` t1 JOIN `account` t2 ON t1.account_id = t2.account_id WHERE t1.type = 'VYBER KARTOU' AND t1.date BETWEEN '1998-01-01' AND '1998-12-31' AND t1.amount < (SELECT AVG(amount) FROM `trans` WHERE type = 'VYBER KARTOU' AND date BETWEEN '1998-01-01' AND '1998-12-31') AND EXISTS (     SELECT 1     FROM `card`     WHERE `disp_id` IN (         SELECT `disp_id`         FROM `disp`         WHERE `account_id` = t1.account_id     )     AND `type` = 'gold' );	financial
SELECT DISTINCT c.client_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN card cr ON d.disp_id = cr.disp_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' AND cr.type = 'gold' OR cr.type = 'classic';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 LIKE '%South Bohemia%';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Tabor' AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT a.account_id, d.A11 FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.account_id NOT IN (     SELECT account_id     FROM disp     WHERE type = 'OWNER' ) AND d.A11 > 8000 AND d.A11 <= 9000;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT DISTINCT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(T.A15) AS avg_crimes FROM `district` AS D JOIN `account` AS A ON D.district_id = A.district_id WHERE D.A3 LIKE 'region_name_with_crime_percentage_above_4000%' AND A.date >= '1997-01-01' AND D.A15 > 4000;	financial
SELECT COUNT(*) FROM `account` JOIN `disp` ON `account.account_id` = `disp.account_id` JOIN `card` ON `disp.disp_id` = `card.disp_id` JOIN `client` ON `disp.client_id` = `client.client_id` WHERE `card.type` = 'classic' AND `client.district_id` = `account.district_id` AND `account.frequency` = 'OWNER';	financial
SELECT COUNT(client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'M' AND district.A2 = 'Hl.m. Praha';	financial
SELECT      (COUNT(CASE WHEN c.type = 'gold' AND c.issued < '1998-01-01' THEN 1 END) * 100.0) /      COUNT(c.card_id) AS gold_card_issue_percentage FROM      `card` c;	financial
SELECT `client.client_id`, `client_id` AS client_name FROM `client` JOIN `account` ON `client.district_id` = `account.district_id` JOIN `loan` ON `account.account_id` = `loan.account_id` WHERE `loan.amount` = (SELECT MAX(`amount`) FROM `loan`);	financial
SELECT d.A15 FROM district d JOIN account a ON d.district_id = a.district_id WHERE a.account_id = 532 AND d.A15 IS NOT NULL;	financial
SELECT a.district_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 33333;	financial
SELECT t.account_id, t.amount, t.balance FROM `trans` t JOIN `client` c ON t.account_id IN (SELECT account_id FROM `account` WHERE district_id = (SELECT district_id FROM `client` WHERE client_id = 3356)) WHERE t.operation = 'VYBER';	financial
SELECT COUNT(*) FROM account JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND loan.amount < 200000;	financial
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN client cl ON d.client_id = cl.client_id WHERE cl.client_id = 13539;	financial
SELECT d.A3 AS region FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = 3541;	financial
SELECT d.A2, COUNT(a.account_id) AS total_accounts FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.district_id ORDER BY total_accounts DESC LIMIT 1;	financial
SELECT c.client_id, c.gender, c.birth_date FROM `client` c JOIN `disp` d ON c.client_id = d.client_id JOIN `account` a ON d.account_id = a.account_id JOIN `order` o ON a.account_id = o.account_id WHERE o.order_id = 32423;	financial
SELECT t.trans_id, t.date, t.type, t.operation, t.amount, t.balance, t.k_symbol, t.bank, t.account FROM `trans` t JOIN `account` a ON t.account_id = a.account_id JOIN `district` d ON a.district_id = d.district_id WHERE d.district_id = 5;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Jesenik';	financial
SELECT c.client_id FROM client c JOIN card crd ON c.client_id = crd.disp_id WHERE crd.type = 'junior' AND crd.issued >= '1997-01-01';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(c.gender) AS percentage_female FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A11 > 10000;	financial
SELECT   ((SUM(CASE WHEN YEAR(l.date) = 1997 THEN l.amount ELSE 0 END) - SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END)) /     SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END) * 100) AS growth_rate FROM   loan l JOIN   client c ON l.account_id IN (SELECT account_id FROM account a JOIN client cl ON a.district_id = cl.district_id WHERE cl.gender = 'M') WHERE   YEAR(l.date) IN (1996, 1997);	financial
SELECT COUNT(*) FROM trans WHERE type = 'VYBER KARTOU' AND date > '1995-12-31';	financial
SELECT      (SUM(CASE WHEN d.A3 = 'North Bohemia' AND a.date = '1996-02-21' THEN d.A16 ELSE 0 END) -      SUM(CASE WHEN d.A3 = 'East Bohemia' AND a.date = '1996-02-21' THEN d.A16 ELSE 0 END)) AS crime_difference FROM      account a JOIN      district d ON a.district_id = d.district_id WHERE      a.date = '1996-02-21';	financial
SELECT COUNT(*)  FROM disp  WHERE `account_id` BETWEEN 1 AND 10  AND `type` IN ('OWNER', 'DISPONENT');	financial
SELECT      COUNT(`account_id`) AS statement_requests_count,     SUM(`amount`) AS total_debit_amount FROM      `account` WHERE      `account_id` = 3 AND      `frequency` = 'POPLATEK MESICNE' UNION ALL SELECT      0 AS statement_requests_count,     (SELECT SUM(`amount`) FROM `trans` WHERE `account_id` = 3 AND `k_symbol` = 'DEBIT 3539') AS total_debit_amount;	financial
SELECT c.birth_date  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  WHERE a.account_id = 130;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT      SUM(l.amount) AS total_debt,     SUM(l.payments) AS total_paid,     (SUM(l.amount) - SUM(l.payments)) AS remaining_debt FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      disp d ON a.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      c.client_id = 992;	financial
SELECT SUM(t.amount) AS total_sum, c.gender FROM `trans` t JOIN `account` a ON t.account_id = a.account_id JOIN `disp` d ON a.account_id = d.account_id JOIN `client` c ON d.client_id = c.client_id WHERE t.account_id = (     SELECT account_id     FROM `trans`     WHERE trans_id = 851 ) AND c.client_id = 4;	financial
SELECT c.type FROM `card` c JOIN `disp` d ON c.disp_id = d.disp_id JOIN `client` cl ON d.client_id = cl.client_id WHERE cl.client_id = 9;	financial
SELECT SUM(`amount`) AS total_payment FROM `trans` WHERE `account_id` IN (     SELECT `account_id`     FROM `disp`     WHERE `client_id` = 617 ) AND `date` BETWEEN '1998-01-01' AND '1998-12-31';	financial
SELECT c.client_id FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A3 = 'East Bohemia';	financial
SELECT c.client_id FROM client c JOIN loan l ON c.client_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.operation = 'PLATBA' AND t.type = 'SIPO' AND t.amount > 4000;	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A6 = '30' AND a.date > '1996-12-31';	financial
SELECT COUNT(DISTINCT c.client_id)  FROM `client` c JOIN `disp` d ON c.client_id = d.client_id JOIN `card` crd ON d.disp_id = crd.disp_id WHERE c.gender = 'F' AND crd.type = 'junior';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(*) AS percentage_female_customers FROM      client c JOIN      account a ON c.district_id = a.district_id JOIN      district d ON a.district_id = d.district_id WHERE      d.A9 = 3 AND c.gender = 'F';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) / COUNT(CASE WHEN a.frequency = 'POPLATEK TYDNE' THEN 1 END)) * 100 AS male_clients_percentage FROM      client c JOIN      account a ON c.district_id = a.district_id WHERE      a.frequency = 'POPLATEK TYDNE'	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.account_id = c.client_id JOIN (     SELECT client_id     FROM client     WHERE gender = 'F'     ORDER BY birth_date ASC     LIMIT 1 ) AS oldest_female ON c.client_id = oldest_female.client_id JOIN (     SELECT client_id     FROM client     WHERE gender = 'F'     GROUP BY client_id     ORDER BY AVG(CASE WHEN district_id = 1 THEN A11 ELSE 0 END) ASC     LIMIT 1 ) AS lowest_salary_female ON c.client_id = lowest_salary_female.client_id;	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE district.A3 = 'east Bohemia' AND YEAR(client.birth_date) = 1920;	financial
SELECT COUNT(*) FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration = 24 AND account.frequency = 'POPLATEK TYDNE';	financial
SELECT      T.date AS transaction_date,     AVG(L.amount) AS average_loan_amount FROM      trans T JOIN      loan L ON T.account_id = L.account_id WHERE      L.status IN ('C', 'D')     AND T.k_symbol = 'POPLATEK PO OBRATU' GROUP BY      T.date;	financial
SELECT c.client_id, c.district_id FROM client c JOIN account a ON c.account_id = a.account_id WHERE a.account_id IN (     SELECT account_id     FROM account     WHERE district_id = (         SELECT district_id         FROM district         WHERE district_id NOT IN (             SELECT district_id             FROM district             WHERE district_id NOT IN (                 SELECT DISTINCT district_id                 FROM `disp`             )         )     ) );	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card crd ON d.disp_id = crd.disp_id JOIN account acc ON d.account_id = acc.account_id JOIN loan ln ON acc.account_id = ln.account_id WHERE crd.type = 'gold' AND d.type = 'OWNER' AND ln.status != 'D';	financial
SELECT `bond_type`, COUNT(*) as frequency FROM `bond` GROUP BY `bond_type` ORDER BY frequency DESC LIMIT 1;	toxicology
SELECT COUNT(*) FROM atom WHERE `element` = 'cl' AND `molecule_id` IN (     SELECT `molecule_id`     FROM molecule     WHERE `label` = '-' );	toxicology
SELECT AVG(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) as avg_oxygen FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT AVG(CASE WHEN a.molecule_id IN (SELECT m.molecule_id FROM molecule m WHERE m.label = '+') AND b.bond_type = '-' THEN 1 ELSE 0 END)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id;	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-';	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '+';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id) AS percentage_carbon FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id WHERE      b.bond_type = '='	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element <> 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c';	toxicology
SELECT a1.element AS atom1_element, a2.element AS atom2_element FROM atom a1 JOIN atom a2 ON a1.atom_id = 'TR004_8' JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id AND b.bond_id = 'TR004_8_9' JOIN atom a3 ON a2.atom_id = a3.atom_id WHERE a3.atom_id = 'TR004_9';	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE b.bond_type = '=';	toxicology
SELECT m.label, COUNT(a.atom_id) AS count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY count DESC LIMIT 1;	toxicology
SELECT bond.bond_type FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.element = 'cl';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN connected c2 ON c1.atom_id2 = c2.atom_id JOIN molecule m ON c2.atom_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT bond_type FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE (connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20') OR       (connected.atom_id = 'TR004_20' AND connected.atom_id2 = 'TR004_8');	toxicology
SELECT DISTINCT m.label FROM molecule m WHERE m.molecule_id NOT IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element <> 'sn' )	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('i', 's') AND b.bond_type = '-';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT DISTINCT a1.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id WHERE c1.atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181') UNION SELECT DISTINCT a2.atom_id FROM atom a2 JOIN connected c2 ON a2.atom_id = c2.atom_id2 WHERE c2.atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181');	toxicology
SELECT      (SELECT COUNT(DISTINCT a.atom_id)       FROM atom a       JOIN connected c ON a.atom_id = c.atom_id       JOIN molecule m ON a.molecule_id = m.molecule_id       WHERE m.label = '+' AND a.element = 'f') * 100.0 /      (SELECT COUNT(DISTINCT a.atom_id)       FROM atom a       JOIN molecule m ON a.molecule_id = m.molecule_id       WHERE m.label = '+') AS percentage_carcinogenic_no_fluorine;	toxicology
SELECT      (SUM(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) * 100) / COUNT(bond.bond_id) AS percent FROM      bond JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      molecule.label = '+' AND bond.bond_type = '#'	toxicology
SELECT element, COUNT(*) as frequency FROM atom WHERE molecule_id = 'TR000' AND element IS NOT NULL GROUP BY element ORDER BY frequency DESC, element ASC LIMIT 3;	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR001' AND b.bond_id = 'TR001_2_6';	toxicology
SELECT      (SELECT COUNT(*) FROM molecule WHERE label = '+') -      (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5';	toxicology
SELECT bond_id FROM connected WHERE atom_id = 'TR000_2' AND atom_id2 = 'TR000_2';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id, m.label ORDER BY m.label ASC LIMIT 5;	toxicology
SELECT ROUND(DIVIDE(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END), COUNT(bond_id)) * 100, 5) AS percent FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT ROUND(DIVIDE(SUM(CASE WHEN `molecule`.`label` = '+' THEN 1 ELSE 0 END), COUNT(`molecule`.`molecule_id`)) * 100, 3) AS `percent` FROM `molecule`;	toxicology
SELECT      ROUND(DIVIDE(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END), COUNT(a.atom_id)) * 100, 4) AS percent FROM      atom a WHERE      a.molecule_id = 'TR206'	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.molecule_id = 'TR000';	toxicology
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR060';	toxicology
SELECT bond.bond_type,         CASE             WHEN bond.bond_type = '-' THEN 'Non-Carcinogenic'            ELSE 'Carcinogenic'        END AS carcinogenicity FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.molecule_id = 'TR010' GROUP BY bond.bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1;	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a1 ON m.molecule_id = a1.molecule_id JOIN atom a2 ON m.molecule_id = a2.molecule_id JOIN bond b ON a1.atom_id = b.molecule_id AND a2.atom_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-' AND a1.atom_id < a2.atom_id GROUP BY m.molecule_id ORDER BY m.molecule_id LIMIT 3;	toxicology
SELECT b.bond_id, b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.molecule_id = 'TR006' ORDER BY b.bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR009_12' OR atom_id2 = 'TR009_12';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_id = 'TR001_6_9';	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_10' AND m.label = '+';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT COUNT(bond_id) AS connection_count FROM connected WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN atom a1 ON b.molecule_id = a1.molecule_id AND b.bond_id = a1.atom_id JOIN atom a2 ON b.molecule_id = a2.molecule_id AND b.bond_id = a2.atom_id WHERE a1.element = 'p' AND a2.element = 'n' OR a1.element = 'n' AND a2.element = 'p';	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '=' GROUP BY m.molecule_id HAVING COUNT(b.bond_id) = (SELECT MAX(double_bond_count)                           FROM (SELECT m.molecule_id, COUNT(b.bond_id) AS double_bond_count                                 FROM molecule m                                 JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '='                                 GROUP BY m.molecule_id) AS max_double_bonds) WHERE m.label = '+';	toxicology
SELECT      AVG(COUNT(b.bond_id)) / COUNT(a.atom_id) AS average_bonds_per_iodine_atom FROM      atom a LEFT JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 LEFT JOIN      bond b ON c.bond_id = b.bond_id WHERE      a.element = 'i';	toxicology
SELECT bond.bond_id, bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.atom_id = 'TR000_45'	toxicology
SELECT a.element FROM atom a LEFT JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.atom_id IS NULL OR c.atom_id2 IS NULL GROUP BY a.element;	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN connected c2 ON a1.atom_id = c2.atom_id2 JOIN atom a2 ON c2.atom_id = a2.atom_id WHERE b.bond_type = '#' AND a1.molecule_id = 'TR041' AND a2.molecule_id = 'TR041';	toxicology
SELECT a.element  FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR144_8_19';	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT `element` FROM `atom` JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `molecule`.`label` = '+' GROUP BY `element` ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT DISTINCT a1.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN connected c2 ON c1.atom_id2 = c2.atom_id JOIN atom a2 ON a2.atom_id = c2.atom_id2 WHERE a1.element = 'pb' AND a2.element IS NOT NULL;	toxicology
SELECT DISTINCT a.element  FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT      (COUNT(bond_id) * 100) / SUM(CASE WHEN atom1_element = atom2_element THEN 1 ELSE 0 END) AS percentage_common_bonds FROM (     SELECT          a1.element AS atom1_element,         a2.element AS atom2_element,         b.bond_id     FROM          atom a1     JOIN          connected c ON a1.atom_id = c.atom_id     JOIN          atom a2 ON a2.atom_id = c.atom_id2     JOIN          bond b ON c.bond_id = b.bond_id     GROUP BY          a1.element, a2.element, b.bond_id ) AS bond_element_combinations WHERE      atom1_element = atom2_element;	toxicology
SELECT ROUND((SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) * 100.0) / COUNT(b.bond_id), 5) AS single_bond_carcinogenic_proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS total_atoms FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element IN ('c', 'h');	toxicology
SELECT DISTINCT c.atom_id2 FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.element = 's';	toxicology
SELECT bond.bond_type FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '-' JOIN molecule m ON a.molecule_id = m.molecule_id;	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS total_triple_bond_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'    AND (a.element = 'p' OR a.element = 'br');	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '-' JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label <> '-';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100 AS cl_percentage FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '-' AND a.element = 'cl';	toxicology
SELECT `label` FROM `molecule` WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id  FROM molecule  WHERE label = '-';	toxicology
SELECT COUNT(*)  FROM `molecule`  WHERE `molecule_id` BETWEEN 'TR000' AND 'TR030'    AND `label` = '+';	toxicology
SELECT bond.bond_type FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_10_11' OR c.atom_id2 = 'TR001_10_11';	toxicology
SELECT COUNT(bond_id)  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  WHERE atom.element = 'i';	toxicology
SELECT      m.molecule_id,      MAX(m.label) AS carcinogenicity FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.element = 'ca' GROUP BY      m.molecule_id ORDER BY      carcinogenicity DESC;	toxicology
SELECT      EXISTS (         SELECT 1          FROM atom a          JOIN connected c ON a.atom_id = c.atom_id          JOIN bond b ON c.bond_id = b.bond_id          WHERE b.bond_id = 'TR001_1_8' AND a.element = 'cl'     ) AND EXISTS (         SELECT 1          FROM atom a          JOIN connected c ON a.atom_id = c.atom_id          JOIN bond b ON c.bond_id = b.bond_id          WHERE b.bond_id = 'TR001_1_8' AND a.element = 'c'     );	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND b.bond_type = '#' AND m.label = '-';	toxicology
SELECT      SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.molecule_id) * 100 AS percentage_of_chlorine FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT m.label AS toxicology_element FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.molecule_id = 'TR001';	toxicology
SELECT `molecule_id` FROM `bond` WHERE `bond_type` = '=';	toxicology
SELECT DISTINCT c1.atom_id AS first_atom, c2.atom_id AS second_atom FROM connected c1 JOIN connected c2 ON c1.bond_id = c2.bond_id AND c1.atom_id < c2.atom_id JOIN bond b ON c1.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a.element AS element1, a2.element AS element2 FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(DISTINCT a.molecule_id) FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '-' JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT `molecule`.`label` FROM `molecule` WHERE `molecule`.`molecule_id` = (     SELECT `bond`.`molecule_id`     FROM `bond`     WHERE `bond`.`bond_id` = 'TR001_10_11' );	toxicology
SELECT bond.bond_id, molecule.label AS molecule_carcinogenicity FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '+';	toxicology
SELECT      a.element  FROM      atom a  JOIN      connected c ON a.atom_id = c.atom_id  JOIN      molecule m ON c.molecule_id = m.molecule_id  WHERE      m.label = '+'      AND a.atom_id LIKE 'TR%4'	toxicology
SELECT      m.label AS Label,      (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) AS Hydrogen_Ratio FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.molecule_id = 'TR006' GROUP BY      m.label;	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND m.label = '+';	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom AS a1 ON connected.atom_id = a1.atom_id JOIN atom AS a2 ON connected.atom_id2 = a2.atom_id WHERE a1.element = 'c' OR a2.element = 'c';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN atom a2 ON a1.atom_id = SUBSTR('TR001_10_11', 7, 2) AND a2.atom_id = SUBSTR('TR001_10_11', 10, 2) WHERE a1.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND a2.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT      (COUNT(*) FILTER (WHERE bond_type = '#'))::FLOAT / COUNT(*) * 100 AS triple_bond_percentage FROM      bond;	toxicology
SELECT      (SUM(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) * 100.0) / COUNT(bond.bond_id) AS percent FROM      bond WHERE      bond.molecule_id = 'TR047'	toxicology
SELECT      m.label AS molecule_label FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.atom_id = 'TR001_1';	toxicology
SELECT COUNT(*)  FROM `molecule`  WHERE `molecule_id` = 'TR151' AND `label` = '+';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR151' AND a.element IN ('cl', 'br', 'i', 'pb', 'te');	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.molecule_id BETWEEN 'TR010' AND 'TR050'	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT bond.bond_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND bond.bond_type = '=';	toxicology
SELECT COUNT(a.atom_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'h' AND m.label = '+';	toxicology
SELECT `molecule_id` FROM `bond` JOIN `connected` ON `bond.bond_id` = `connected.bond_id` WHERE `connected.atom_id` = 'TR000_1' AND `bond.bond_id` = 'TR000_1_2';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label <> '-';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) / COUNT(a.molecule_id)) * 100.0 AS percentage FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT m.label FROM `molecule` m WHERE m.molecule_id = 'TR124';	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.atom_id2 = 'TR186' UNION SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 WHERE c.atom_id = 'TR186';	toxicology
SELECT bond_type  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE connected.atom_id = 'TR007_4' OR connected.atom_id = 'TR007_19';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT      COUNT(*) AS double_bonds_count,     CASE          WHEN m.label = '+' THEN 'Carcinogenic'         ELSE 'Non-carcinogenic'     END AS carcinogenicity FROM      bond b JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      b.molecule_id = 'TR006' AND b.bond_type = '='	toxicology
SELECT m.molecule_id, GROUP_CONCAT(a.element ORDER BY a.element) AS elements FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') GROUP BY m.molecule_id;	toxicology
SELECT b.bond_id, a1.atom_id, a2.atom_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT m.molecule_id, GROUP_CONCAT(a.element) AS elements FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE b.bond_type = '=' GROUP BY m.molecule_id	toxicology
SELECT a1.element AS Atom1_Element, a2.element AS Atom2_Element FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(DISTINCT b.bond_id) FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 'cl';	toxicology
SELECT      a.atom_id,      COUNT(c.bond_id) AS bond_count FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id WHERE      a.molecule_id = 'TR346' GROUP BY      a.atom_id;	toxicology
SELECT COUNT(DISTINCT c.molecule_id) FROM connected AS con JOIN bond AS bo ON con.bond_id = bo.bond_id JOIN molecule AS mol ON bo.molecule_id = mol.molecule_id WHERE bo.bond_type = '=' AND mol.label = '+';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id LEFT JOIN bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '=' WHERE a.element != 's' AND b.bond_id IS NULL;	toxicology
SELECT m.label AS carcinogenic_label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4' AND m.label = '+';	toxicology
SELECT COUNT(a.atom_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT      (SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(T1.molecule_id) AS percentage FROM      molecule AS T1 JOIN      atom AS T2 ON T1.molecule_id = T2.molecule_id;	toxicology
SELECT `molecule_id` FROM `bond` WHERE `bond_id` = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element) AS element_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_3_4';	toxicology
SELECT bond_type FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2';	toxicology
SELECT m.label FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR000_2' OR a.atom_id = 'TR000_4';	toxicology
SELECT `element` FROM `atom` WHERE `atom_id` = 'TR000_1';	toxicology
SELECT      CASE          WHEN COUNT(*) > 0 THEN 'Carcinogenic'         ELSE 'Non-Carcinogenic'     END AS carcinogenicity FROM      molecule WHERE      molecule_id = 'TR000' AND label = '+';	toxicology
SELECT      CAST(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(a.atom_id) AS percentage FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT m.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND a.atom_id LIKE 'TR%' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND a.molecule_id = 'TR024';	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' AND b.bond_type = '#' THEN 1 ELSE 0 END) / COUNT(a.molecule_id)) * 100.0 AS percentage_carcinogenic_with_triple_bond_H FROM      atom a JOIN      bond b ON a.atom_id = b.atom_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*)  FROM atom  WHERE `element` = 'c' AND molecule_id = 'TR008';	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN molecule m ON c.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR004_7' AND m.label = '-';	toxicology
SELECT COUNT(DISTINCT c.molecule_id) FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a.element = 'o' AND b.bond_type = '=' AND c.bond_id IN (     SELECT bond_id     FROM bond     WHERE bond_type = '='     GROUP BY bond_id     HAVING COUNT(bond_id) = 2 );	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '=' AND m.label = '-';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR002';	toxicology
SELECT a1.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE a1.element = 'c' AND b.bond_type = '=' AND a2.element = 'c' AND a1.atom_id <> a2.atom_id AND a1.molecule_id = 'TR012' AND a2.molecule_id = 'TR012';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT * FROM `cards` WHERE `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL;	card_games
SELECT id, name, asciiName FROM cards WHERE borderColor IS NULL AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT name  FROM cards  WHERE faceConvertedManaCost = (     SELECT MAX(faceConvertedManaCost)      FROM cards );	card_games
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015';	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND c.printings LIKE '%mythic%';	card_games
SELECT l.uuid, l.status FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.type LIKE '%Artifact%' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT cards.id, cards.artist FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.power = '*' OR cards.power IS NULL AND legalities.format = 'commander' AND legalities.status = 'Legal';	card_games
SELECT c.id FROM cards c JOIN rulings r ON c.uuid = r.uuid JOIN `set_translations` st ON c.setCode = st.setCode JOIN sets s ON st.setCode = s.code WHERE c.artist = 'Stephen Daniel' AND r.text IS NOT NULL AND c.hasContentWarning = 0 AND s.name = 'Tenth Edition';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT c.name, c.artist, COUNT(r.uuid) AS ruling_count, c.isPromo FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid GROUP BY c.uuid ORDER BY ruling_count DESC LIMIT 1;	card_games
SELECT fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name = 'Annul' AND c.number = '29';	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT     (COUNT(*) FILTER (WHERE language = 'Chinese Simplified') * 100.0) / COUNT(*) FROM     cards;	card_games
SELECT st.translation, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type)  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT `keywords`  FROM `cards`  WHERE `name` = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT `promoTypes` FROM `cards` WHERE `name` = 'Duress';	card_games
SELECT `borderColor`  FROM `cards`  WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT `originalType` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT st.language FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isTextless = 0;	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT `legalities`.`status` FROM `cards` JOIN `legalities` ON `cards`.`uuid` = `legalities`.`uuid` WHERE `cards`.`name` = 'Cloudchaser Eagle';	card_games
SELECT `type` FROM `cards` WHERE `name` = 'Benalish Knight';	card_games
SELECT `rulings`.`text` FROM `rulings` JOIN `cards` ON `rulings`.`uuid` = `cards`.`uuid` WHERE `cards`.`name` = 'Benalish Knight' AND `legalities`.`uuid` = `cards`.`uuid` AND `legalities`.`format` = 'commander';	card_games
SELECT DISTINCT artist  FROM cards  WHERE asciiName = 'Phyrexian';	card_games
SELECT     (COUNT(CASE WHEN `borderColor` = 'borderless' THEN 1 END) * 100.0) / COUNT(`id`) AS percentage_borderless FROM     `cards`;	card_games
SELECT COUNT(*) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards WHERE `borderColor` = 'borderless' AND `flavorText` LIKE '%Russian%'	card_games
SELECT     (COUNT(CASE WHEN foreign_data.language = 'French' THEN 1 END) * 100.0) /      COUNT(CASE WHEN cards.isStorySpotlight = 1 THEN 1 END) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM `cards` WHERE `toughness` = '99';	card_games
SELECT `name` FROM `cards` WHERE `artist` = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'black' AND `availability` = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords LIKE '%Flying%';	card_games
SELECT COUNT(*) FROM cards WHERE originalType LIKE '%Summon - Angel%' AND subtypes NOT LIKE '%Angel%';	card_games
SELECT c.id FROM cards c WHERE c.hasFoil = 1 AND c.hasNonFoil = 1 AND c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL;	card_games
SELECT id  FROM cards  WHERE duelDeck = 'a';	card_games
SELECT `edhrecRank` FROM `cards` WHERE `frameVersion` = '2015';	card_games
SELECT artist  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE foreign_data.language = 'Chinese Simplified';	card_games
SELECT c.* FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability LIKE '%paper%' AND fd.language = 'Japanese';	card_games
SELECT COUNT(*) FROM cards WHERE status = 'Banned' AND borderColor = 'white';	card_games
SELECT      c.uuid,      fd.language FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.type LIKE '%Land%' OR c.type LIKE '%Permanent%'     AND c.setCode IN (SELECT code FROM sets WHERE type = 'core')     AND fd.language != 'en';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT COUNT(*), legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = 'future' AND legalities.status = 'legal';	card_games
SELECT c.name, c.colors FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW';	card_games
SELECT c.name, st.translation, st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT c.colors, l.format FROM cards c LEFT JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20;	card_games
SELECT c.name, c.types FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language <> 'English';	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE `borderColor` = 'white' AND `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability LIKE '%mtgo%' AND hand = '-1';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT `manaCost` FROM `cards` WHERE `layout` = 'normal' AND `frameVersion` = '2003' AND `borderColor` = 'black' AND `availability` = 'mtgo,paper';	card_games
SELECT SUM(convertedManaCost) AS totalUnconvertedManaCost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT `type`, `supertypes`, `subtypes` FROM `cards` WHERE `availability` = 'arena';	card_games
SELECT c.setCode FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.language = 'Spanish';	card_games
SELECT      ROUND(         (COUNT(CASE WHEN `cards`.frameEffects = 'legendary' AND `cards`.isOnlineOnly = 1 THEN 1 END) / COUNT(`cards`.id)) * 100,          2     ) AS percentage_legendary_online_only FROM      `cards` WHERE      `cards`.frameEffects = 'legendary';	card_games
SELECT      (SUM(CASE WHEN c.isStorySpotlight = 1 AND c.isTextless = 0 THEN 1 ELSE 0 END) / COUNT(c.id)) * 100 AS StorySpotlightTextlessPercentage FROM      cards c	card_games
SELECT cards.name,         (SUM(CASE WHEN foreign_data.language = 'Spanish' THEN 1 ELSE 0 END) * 100.0) / COUNT(cards.id) AS percentage_spanish FROM cards LEFT JOIN foreign_data ON cards.uuid = foreign_data.uuid GROUP BY cards.name ORDER BY percentage_spanish DESC;	card_games
SELECT t.language FROM set_translations t JOIN sets s ON t.setCode = s.code WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM sets WHERE block = 'Commander' AND type = 'core' AND code IN (     SELECT setCode     FROM set_translations     WHERE language = 'Portuguese (Brasil)' );	card_games
SELECT id FROM cards WHERE type = 'Creature' AND uuid IN (     SELECT uuid     FROM legalities     WHERE status = 'Legal' );	card_games
SELECT DISTINCT `subtypes`, `supertypes` FROM `cards` WHERE `subtypes` IS NOT NULL AND `supertypes` IS NOT NULL AND EXISTS (     SELECT 1     FROM `foreign_data`     WHERE `cards.uuid` = `foreign_data.uuid`     AND `language` = 'German' );	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND (text LIKE '%triggered ability%');	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'premodern' AND cards.side IS NULL AND EXISTS (     SELECT 1     FROM rulings     WHERE rulings.uuid = cards.uuid     AND rulings.text LIKE '%triggered mana ability%' );	card_games
SELECT `cards`.`id` FROM `cards` JOIN `sets` ON `cards`.`setCode` = `sets`.`code` WHERE `cards`.`artist` = 'Erica Yang' AND `sets`.`code` = '10E' AND `cards`.`availability` = 'paper';	card_games
SELECT `artist` FROM `cards` WHERE `text` LIKE '%Das perfekte Gegenmittel zu einer dichte%'	card_games
SELECT `foreign_data.name` AS foreign_name FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `cards.artist` = 'Matthew D. Wilson' AND `cards.borderColor` = 'black' AND `foreign_data.language` = 'French' AND `cards.layout` = 'normal' AND `cards.type` = 'Creature';	card_games
SELECT COUNT(*) FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.rarity = 'rare' AND rulings.date = '2007-02-01';	card_games
SELECT t.language  FROM sets s  JOIN set_translations t ON s.code = t.setCode  WHERE s.baseSetSize = 180 AND s.block = 'Ravnica';	card_games
SELECT      (COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) * 100.0) / COUNT(c.id) AS percentageWithoutContentWarning FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      c.hasContentWarning = 0     AND l.format = 'commander'     AND l.status = 'Legal';	card_games
SELECT      (COUNT(CASE WHEN `power` IS NULL OR `power` = '*' THEN 1 END AND `language` = 'French' ELSE NULL END) * 100.0) /      COUNT(CASE WHEN `power` IS NULL OR `power` = '*' THEN 1 END) AS percentage_french_no_power_cards FROM `cards`;	card_games
SELECT      ROUND((COUNT(CASE WHEN s.type = 'expansion' THEN 1 END) * 100.0) / COUNT(CASE WHEN s.type = 'expansion' AND fd.language = 'Japanese' THEN 1 END), 2) AS percentage FROM      sets s JOIN      set_translations st ON s.code = st.setCode JOIN      foreign_data fd ON st.setCode = fd.setCode WHERE      fd.language = 'Japanese';	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000 AND colors IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name, power FROM cards WHERE power IS NULL OR power = '*'   AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3;	card_games
SELECT `language` FROM `foreign_data` WHERE `multiverseid` = 149934;	card_games
SELECT id, cardKingdomFoilId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT      (COUNT(CASE WHEN `isTextless` = 1 AND `layout` = 'normal' THEN 1 END) * 100.0) / COUNT(`id`) AS proportion FROM      `cards`	card_games
SELECT `cards`.`number` FROM `cards` WHERE `cards`.`subtypes` LIKE '%Angel%' AND `cards`.`subtypes` LIKE '%Wizard%' AND `cards`.`otherFaceIds` IS NULL;	card_games
SELECT s.name, COUNT(*) as count FROM sets s LEFT JOIN cards c ON s.code = c.setCode WHERE s.mtgoCode IS NULL OR s.mtgoCode = '' GROUP BY s.name ORDER BY count DESC, s.name LIMIT 3;	card_games
SELECT language FROM set_translations WHERE setCode = 'ARC';	card_games
SELECT `name`, `translation` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `sets.id` = 5;	card_games
SELECT st.language, s.type  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.id = 206;	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.setCode = 'SHM' AND EXISTS (     SELECT 1     FROM cards c     JOIN foreign_data fd ON c.uuid = fd.uuid     JOIN set_translations st2 ON fd.multiverseid = st2.setCode     WHERE st2.setCode = 'SHM'     AND EXISTS (         SELECT 1         FROM set_translations st3         WHERE st3.setCode = st.setCode         AND st3.setCode LIKE '%it%'     ) ) ORDER BY s.name ASC LIMIT 2;	card_games
SELECT s.id FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN foreign_data fd ON fd.uuid = s.uuid WHERE s.isForeignOnly = 1   AND s.isFoilOnly = 1   AND fd.language = 'Japanese';	card_games
SELECT      s.name AS setName,      s.baseSetSize  FROM      sets s  JOIN      set_translations st ON s.code = st.setCode  WHERE      st.language = 'Russian'  ORDER BY      s.baseSetSize DESC  LIMIT 1;	card_games
SELECT      (COUNT(CASE WHEN s.isOnlineOnly = 1 THEN 1 END) * 100.0) / COUNT(*) FROM      cards c JOIN      sets s ON c.setCode = s.code JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Chinese Simplified';	card_games
SELECT COUNT(*) FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' AND id IN (SELECT id FROM set_translations WHERE language = 'Japanese');	card_games
SELECT id  FROM cards  WHERE borderColor = 'black';	card_games
SELECT `id` FROM `cards` WHERE `frameEffects` = 'extendedart';	card_games
SELECT `name`, `artist`, `asciiName`, `borderColor`, `isFullArt` FROM `cards` WHERE `borderColor` = 'black' AND `isFullArt` = 1;	card_games
SELECT `set_translations.language` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `sets.id` = 174;	card_games
SELECT `name` FROM `sets` WHERE `code` = 'ALL';	card_games
SELECT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT s.baseSetSize, s.code FROM sets s WHERE s.block = 'Masques' OR s.block = 'Mirage';	card_games
SELECT code  FROM sets  WHERE type = 'expansion';	card_games
SELECT      fd.name AS foreign_name,      c.type AS card_type FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.watermark = 'Boros';	card_games
SELECT      f.language,      f.flavorText,      c.type FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid WHERE      c.watermark = 'Color Pie';	card_games
SELECT      (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0) / COUNT(*) AS percentageOfCMC10 FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      c.name = 'Abyssal Horror';	card_games
SELECT `code` FROM `sets` WHERE `type` = 'expansion' AND `name` = 'Commander';	card_games
SELECT c.name, c.type  FROM cards c  JOIN set_translations st ON c.setCode = st.setCode  JOIN sets s ON st.setCode = s.code  WHERE s.name = 'Abzan' AND c.watermark = 'Abzan';	card_games
SELECT      f.language,      c.type FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid WHERE      c.watermark = 'Azorius'	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT `name` FROM `cards` WHERE `isTextless` = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'white' AND (`power` = '*' OR `power` IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT `artist`) FROM `cards` WHERE `borderColor` = 'black' AND `availability` LIKE '%arena,mtgo%';	card_games
SELECT      CASE          WHEN MAX(c1.convertedManaCost) > MAX(c2.convertedManaCost) THEN 'Serra Angel'         WHEN MAX(c1.convertedManaCost) < MAX(c2.convertedManaCost) THEN 'Shrine Keeper'         ELSE 'Both cards have the same converted mana cost'     END AS CardWithHigherManaCost FROM      cards c1 JOIN      cards c2 ON c1.name = 'Serra Angel' AND c2.name = 'Shrine Keeper';	card_games
SELECT artist  FROM cards  WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT st.translation FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Italian';	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  JOIN set_translations ON sets.code = set_translations.setCode  WHERE cards.name = 'Angel of Mercy';	card_games
SELECT c.name  FROM cards c  JOIN set_translations st ON c.setCode = st.setCode  WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS (     SELECT 1     FROM cards     JOIN set_translations ON cards.setCode = set_translations.setCode     WHERE cards.name = 'Ancestor''s Chosen' AND set_translations.language = 'Korean' )	card_games
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex';	card_games
SELECT `baseSetSize`  FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `set_translations`.`translation` = 'Hauptset Zehnte Edition';	card_games
SELECT translation FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Eighth Edition') AND language = 'Chinese Simplified';	card_games
SELECT sets.name  FROM sets  JOIN cards ON sets.code = cards.setCode  WHERE cards.name = 'Angel of Mercy'  AND sets.mtgoCode IS NOT NULL;	card_games
SELECT sets.releaseDate FROM sets JOIN cards ON sets.code = cards.setCode WHERE cards.name = 'Ancestor''s Chosen';	card_games
SELECT type  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian' AND set_translations.translation IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE cards.name = 'Adarkar Valkyrie' AND sets.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets WHERE baseSetSize < 10 AND EXISTS (     SELECT 1     FROM set_translations     WHERE sets.code = set_translations.setCode AND set_translations.language = 'Italian' );	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND setCode = 'Coldsnap';	card_games
SELECT name  FROM cards  WHERE setCode = 'Coldsnap'  ORDER BY convertedManaCost DESC  LIMIT 1;	card_games
SELECT DISTINCT artist FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT `number` FROM `cards` WHERE `name` = 'Coldsnap' AND `number` = '4';	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL);	card_games
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT f.language FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen' AND f.flavorText IS NOT NULL;	card_games
SELECT `type` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `cards.name` = 'Ancestor''s Chosen' AND `foreign_data.language` = 'German';	card_games
SELECT r.text AS ruling FROM rulings r JOIN cards c ON r.uuid = c.uuid JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.name = 'Coldsnap';	card_games
SELECT c.name, c.convertedManaCost FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce';	card_games
SELECT      ROUND((SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) * 100.0) / SUM(1), 2) AS percentage_with_mana_cost_7 FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Coldsnap';	card_games
SELECT      (COUNT(*) FILTER (WHERE `cards.cardKingdomFoilId` IS NOT NULL AND `cards.cardKingdomId` IS NOT NULL) / COUNT(*)) * 100 AS percentage_incredibly_powerful FROM      `cards` WHERE      `sets.name` = 'Coldsnap'	card_games
SELECT code  FROM sets  WHERE releaseDate = '2017-07-14';	card_games
SELECT `keyruneCode` FROM `sets` WHERE `code` = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%';	card_games
SELECT parentCode  FROM sets  WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text AS ruling_text, c.hasContentWarning AS has_content_warning FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' ORDER BY c.name;	card_games
SELECT s.releaseDate  FROM sets s  JOIN cards c ON s.code = c.setCode  WHERE c.name = 'Evacuation';	card_games
SELECT baseSetSize  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Rinascita di Alara';	card_games
SELECT `type` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `translation` = 'Huitième édition';	card_games
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON s.code = c.setCode JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.name = 'Tendo Ice Bridge' AND st.language = 'French';	card_games
SELECT COUNT(*) FROM set_translations WHERE translation IS NOT NULL AND setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition');	card_games
SELECT st.translation FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.name = 'Fellwar Stone' AND st.language = 'Japanese';	card_games
SELECT `name`, MAX(`convertedManaCost`) as max_cmc FROM `cards` WHERE `name` = 'Journey into Nyx Hero''s Path' GROUP BY `name` ORDER BY max_cmc DESC LIMIT 1;	card_games
SELECT `releaseDate` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `set_translations.setCode` = (SELECT `code` FROM `sets` WHERE `name` = 'Ola de frío');	card_games
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards WHERE name = 'World Championship Decks 2004' AND convertedManaCost = 3.0;	card_games
SELECT translation FROM set_translations WHERE setCode = 'MIR' AND language = 'Chinese Simplified';	card_games
SELECT      (SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100.0) /      SUM(CASE WHEN c.language = 'Japanese' THEN 1 ELSE 0 END) FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      c.language = 'Japanese';	card_games
SELECT      ROUND(         (SUM(CASE WHEN `sets`.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN `sets`.language = 'Portuguese (Brazil)' THEN 1 ELSE 0 END)     , 2) AS percentage_online_only_brazil_portuguese_cards FROM `sets` JOIN `set_translations` ON `sets`.code = `set_translations`.setCode WHERE `set_translations`.language = 'Portuguese (Brazil)';	card_games
SELECT `availability` FROM `cards` WHERE `artist` = 'Aleksi Briclot' AND `isTextless` = 1;	card_games
SELECT id  FROM sets  WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT MAX(`frameEffects`) AS most_common_frame_effect FROM `cards` WHERE `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL GROUP BY `frameEffects` ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT id  FROM sets  WHERE type = 'commander'  AND isFoilOnly = 0  AND isNonFoilOnly = 0  ORDER BY totalSetSize DESC  LIMIT 1;	card_games
SELECT      `cards`.`name`,      MAX(`cards`.`convertedManaCost`) AS `highest_mana_cost` FROM      `cards` WHERE      `cards`.`type` LIKE '%% Creature%' AND     `cards`.`availability` LIKE '%duel%' GROUP BY      `cards`.`name` ORDER BY      `highest_mana_cost` DESC LIMIT      10;	card_games
SELECT s.releaseDate, GROUP_CONCAT(DISTINCT l.format) AS legal_formats FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE c.rarity = 'mythic' AND l.status = 'legal' GROUP BY c.setCode ORDER BY s.releaseDate ASC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'rare' AND cards.types LIKE '%Enchantment%' AND cards.name = 'Abundance' AND legalities.status = 'Legal';	card_games
SELECT format, COUNT(*) AS banned_count FROM legalities WHERE status = 'Banned' GROUP BY format ORDER BY banned_count DESC LIMIT 1;	card_games
SELECT language FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.name = 'Battlebond';	card_games
SELECT `artist`, `format` FROM `cards` JOIN (     SELECT `artist`     FROM `cards`     GROUP BY `artist`     ORDER BY COUNT(*) ASC     LIMIT 1 ) AS least_cards WHERE `cards`.`artist` = least_cards.artist	card_games
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = '1997' AND cards.artist = 'D. Alexander Gregory' AND legalities.format = 'legacy' AND (cards.hasContentWarning = 1 OR cards.mcmId IS NOT NULL);	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned';	card_games
SELECT AVG(id) as average_sets_per_year, MAX(COUNT(language)) as common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(releaseDate);	card_games
SELECT DISTINCT artist  FROM cards  WHERE `borderColor` = 'black' AND `availability` = 'arena';	card_games
SELECT l.uuid FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.format = 'oldschool' AND (l.status = 'banned' OR l.status = 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT r.id, r.date, r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Hour of Devastation' AND legalities.status = 'Legal';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language != 'Japanese' AND st.language = 'Korean' AND NOT EXISTS (     SELECT 1     FROM set_translations st2     WHERE st2.setCode = s.code     AND st2.language = 'Japanese' );	card_games
SELECT DISTINCT `frameVersion` AS frame_style FROM `cards` WHERE `artist` = 'Allen Williams';  SELECT `name`, `setCode`, `releaseDate` FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `artist` = 'Allen Williams' AND `legalities.status` = 'Banned';	card_games
SELECT      CASE          WHEN u1.Reputation > u2.Reputation THEN u1.DisplayName          ELSE u2.DisplayName      END AS HigherReputationUser FROM      users u1 JOIN      users u2 ON u1.DisplayName = 'Harlan' AND u2.DisplayName = 'Jarrod Dixon'	codebase_community
SELECT `DisplayName`  FROM `users`  WHERE YEAR(`CreationDate`) = 2011;	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT `users.DisplayName` FROM `users` JOIN (     SELECT `AccountId`, SUM(`Views`) as TotalViews     FROM `users`     GROUP BY `AccountId`     ORDER BY TotalViews DESC     LIMIT 1 ) AS TopViewers ON `users.Id` = TopViewers.AccountId;	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  WHERE u.Views > 10 AND YEAR(u.CreationDate) > 2013	codebase_community
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName AS OwnerDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT SUM(c.CommentCount) AS TotalComments FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT MAX(AnswerCount)  FROM posts  WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT `LastEditorDisplayName` FROM `posts` WHERE `Title` = 'Examples for teaching: Correlation does not mean causation' AND `LastEditorUserId` IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL	codebase_community
SELECT DISTINCT p.OwnerDisplayName FROM posts p WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE Age > 65) AND Score >= 20	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'	codebase_community
SELECT p.Id, p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags) ORDER BY p.Id LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie' AND YEAR(badges.Date) = 2011;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(posts.Score) AS average_score FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT AVG(b.Count) as AverageBadges FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Views > 200;	codebase_community
SELECT      ROUND((COUNT(CASE WHEN u.Age > 65 THEN p.Id END) * 100.0) / COUNT(p.Id), 2) AS elder_user_percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 5	codebase_community
SELECT COUNT(*)  FROM votes  WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(`Id`) AS NumberOfRevivalBadges FROM `badges` WHERE `Name` = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments);	codebase_community
SELECT c.Id AS CommentCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014/04/23 20:29:39.0';	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 LIMIT 1;	codebase_community
SELECT      p.Id AS PostId,      p.Title,      p.ClosedDate  FROM      posts p  JOIN      comments c ON p.Id = c.PostId  JOIN      users u ON c.UserId = u.Id  WHERE      u.Id = 23853      AND c.CreationDate = '2013-07-12 09:08:18.0'      AND p.ClosedDate IS NULL	codebase_community
SELECT `Reputation`  FROM `users`  WHERE `Id` = (SELECT `OwnerUserId` FROM `posts` WHERE `Id` = 65041);	codebase_community
SELECT COUNT(p.Id) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Tiago Pasqualini';	codebase_community
SELECT `users.DisplayName` FROM `users` JOIN `votes` ON `users.Id` = `votes.UserId` WHERE `votes.Id` = 6347;	codebase_community
SELECT SUM(CASE WHEN p.Title LIKE '%data visualization%' THEN v.BountyAmount ELSE 0 END) AS TotalVotes FROM posts p LEFT JOIN votes v ON p.Id = v.PostId	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT      (COUNT(posts.Id) / COUNT(votes.Id)) AS PostToVoteRatio FROM      posts LEFT JOIN      votes ON posts.OwnerUserId = votes.UserId WHERE      posts.OwnerUserId = 24;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `WebsiteUrl` = 'http://stackoverflow.com';	codebase_community
SELECT Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'SilentGhost'	codebase_community
SELECT c.UserId, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93!';	codebase_community
SELECT `comments.Text` FROM `comments` JOIN `users` ON `comments.UserId` = `users.Id` WHERE `users.DisplayName` = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text AS Comment FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT p.LastEditorDisplayName FROM posts p WHERE p.Title = 'Open source tools for visualizing multi-dimensional data' AND p.LastEditorUserId IS NOT NULL;	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY p.Id;	codebase_community
SELECT c.Id AS CommentId, c.Text AS CommentText, c.CreationDate AS CommentDate, u.Id AS UserId, u.Location AS UserLocation FROM comments c JOIN users u ON c.UserId = u.Id JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(BountyAmount) AS TotalBountyAmount FROM posts WHERE Title LIKE '%data%' AND PostId IN (SELECT PostId FROM votes WHERE BountyAmount IS NOT NULL);	codebase_community
SELECT u.DisplayName FROM posts p JOIN votes v ON p.Id = v.PostId JOIN users u ON v.UserId = u.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT      p.Title,      c.Text AS Comment,      AVG(p.ViewCount) AS AvgViewCount FROM      posts p JOIN      tags t ON p.Id = t.ExcerptPostId JOIN      comments c ON p.Id = c.PostId WHERE      t.TagName = 'humor' GROUP BY      p.Id	codebase_community
SELECT COUNT(*) AS TotalComments FROM comments WHERE UserId = 13;	codebase_community
SELECT `Id`, `Reputation` FROM `users` ORDER BY `Reputation` DESC LIMIT 1;	codebase_community
SELECT `Id`, `Views` FROM `users` ORDER BY `Views` ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND YEAR(Date) = 2011;	codebase_community
SELECT `UserId`, COUNT(`Id`) AS `BadgeCount` FROM `badges` GROUP BY `UserId` HAVING `BadgeCount` > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Teacher'  AND u.Location = 'New York' AND EXISTS (     SELECT 1      FROM badges b2      WHERE b2.UserId = u.Id      AND b2.Name = 'Supporter' );	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT      u.Id AS UserId,      u.AboutMe,      u.Location FROM      users u JOIN      posts p ON u.Id = p.OwnerUserId WHERE      p.ViewCount >= 1000 GROUP BY      u.Id HAVING      COUNT(DISTINCT ph.Id) = 1 JOIN      postHistory ph ON p.Id = ph.PostId	codebase_community
SELECT u.DisplayName, b.Name AS Badge FROM users u JOIN comments c ON u.Id = c.UserId JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Teacher' GROUP BY u.Id ORDER BY COUNT(c.Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Teacher' AND u.Location = 'India';	codebase_community
SELECT      (         (COUNT(CASE WHEN badges.Date BETWEEN '2010-01-01' AND '2010-12-31' THEN badges.Id ELSE NULL END) * 100.0 /           COUNT(badges.Id)) -          (COUNT(CASE WHEN badges.Date BETWEEN '2011-01-01' AND '2011-12-31' THEN badges.Id ELSE NULL END) * 100.0 /           COUNT(badges.Id)) AS PercentageDifference FROM badges WHERE badges.Name = 'Student';	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommenters FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;	codebase_community
SELECT p.Id, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395;	codebase_community
SELECT p.Id, u.Id AS CreatorUserId FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount) AS TotalFavoriteCountGained FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Id = 686 AND YEAR(p.CreaionDate) = 2011	codebase_community
SELECT      AVG(u.UpVotes) AS avg_up_votes,     AVG(u.Age) AS avg_age FROM      users u JOIN      (SELECT           OwnerUserId      FROM           posts      GROUP BY           OwnerUserId      HAVING           COUNT(*) > 10) p ON u.Id = p.OwnerUserId;	codebase_community
SELECT COUNT(DISTINCT `UserId`) FROM `badges` WHERE `Name` = 'Announcer';	codebase_community
SELECT `Name` FROM `badges` WHERE `Date` = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*) AS PositiveCommentCount FROM comments WHERE Score > 60;	codebase_community
SELECT Text  FROM comments  WHERE CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(`Id`) AS PostCount FROM `posts` WHERE `Score` = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY' ORDER BY b.Date;	codebase_community
SELECT      ROUND((COUNT(CASE WHEN badges.Name = 'Teacher' THEN badges.UserId END) * 100.0) / COUNT(DISTINCT badges.UserId), 2) AS TeacherBadgePercentage FROM badges;	codebase_community
SELECT     (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN u.Id END) * 100.0) / COUNT(u.Id) AS PercentageOfTeenagers FROM     badges b JOIN     users u ON b.UserId = u.Id WHERE     b.Name = 'Organizer';	codebase_community
SELECT SUM(c.Score) AS TotalCommentRating FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.Id, SUM(p.ViewCount) AS TotalViews FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0' GROUP BY u.Id;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(DISTINCT b.Id)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Location = 'New York, NY';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT u.DisplayName, MAX(u.Views) AS MaxViews FROM users u GROUP BY u.DisplayName ORDER BY MaxViews DESC LIMIT 1;	codebase_community
SELECT      (COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 END) / COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 END)) AS VoteRatio FROM votes;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo');	codebase_community
SELECT COUNT(v.Id) AS TotalVotes FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT p.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT      (SELECT MAX(SUM(ViewCount))       FROM posts       WHERE OwnerDisplayName = 'Harvey Motulsky' OR OwnerDisplayName = 'Noah Snyder') -       (SELECT MAX(SUM(ViewCount))        FROM posts        WHERE OwnerDisplayName = 'Harvey Motulsky' OR OwnerDisplayName = 'Noah Snyder')	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Matt Parker')  AND Id IN (SELECT PostId FROM votes GROUP BY PostId HAVING COUNT(*) > 4);	codebase_community
SELECT COUNT(*)  FROM comments  JOIN users ON comments.UserId = users.Id  WHERE users.DisplayName = 'Neil McGuigan' AND comments.Score < 60;	codebase_community
SELECT p.Tags FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT      (COUNT(CASE WHEN p.Id = pr.PostId AND t.TagName = 'r' THEN p.Id END) * 100.0) /      COUNT(CASE WHEN p.OwnerUserId = u.Id AND u.DisplayName = 'Community' THEN p.Id END) AS percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id JOIN      votes v ON p.Id = v.PostId JOIN      tags t ON p.Id = t.ExcerptPostId WHERE      u.DisplayName = 'Community'	codebase_community
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName IN ('Mornington', 'Amos')	codebase_community
SELECT COUNT(DISTINCT `UserId`)  FROM `badges`  WHERE `Name` = 'Commentator'  AND STRFTIME('%Y', `Date`) = '2014';	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT u.DisplayName, u.Age FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts);	codebase_community
SELECT p.LastEditorUserId, p.LastEditDate FROM posts p WHERE p.Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT c.Text AS CommentText, u.DisplayName AS CommentatorDisplayName, p.Title AS PostTitle FROM comments c JOIN users u ON c.UserId = u.Id JOIN posts p ON c.PostId = p.Id WHERE c.Score > 60;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND YEAR(b.Date) = 2011;	codebase_community
SELECT      p.OwnerDisplayName,      u.WebsiteUrl FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.FavoriteCount > 150	codebase_community
SELECT      COUNT(*) AS PostHistoryCount,      MAX(`CreationDate`) AS LastEditDate FROM      `postHistory` WHERE      `Text` LIKE '%What is the best introductory Bayesian statistics textbook%'	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers';	codebase_community
SELECT p.Title AS RelatedPostTitle FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'How to tell if something happened in a data set which monitors a value over time';	codebase_community
SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(p.CreaionDate) = 2013 UNION SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013;	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts)	codebase_community
SELECT u.DisplayName, u.Location FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN users u ON p.OwnerUserId = u.Id WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?';	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.Id = (SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL);	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8);	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT `OwnerUserId` FROM `posts` ORDER BY `FavoriteCount` DESC LIMIT 1;	codebase_community
SELECT MAX(Reputation) as MaxReputation, users.Id, users.DisplayName, users.Age FROM users WHERE users.Id IN (SELECT UserId FROM votes) ORDER BY MaxReputation DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(p.CreationDate) = 2011 AND v.BountyAmount = 50;	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1;	codebase_community
SELECT SUM(Score) as TotalScoreOnDate FROM posts WHERE `LastActivityDate` LIKE '2010-07-19%';	codebase_community
SELECT      COUNT(postLinks.Id) / 12 AS avg_monthly_links FROM      postLinks JOIN      posts ON postLinks.PostId = posts.Id WHERE      YEAR(postLinks.CreationDate) = 2010 AND posts.AnswerCount <= 2	codebase_community
SELECT PostId FROM posts WHERE OwnerUserId = 1465 ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (     SELECT MIN(CreationDate)     FROM postLinks )	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(CreationDate)  FROM votes  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'chl') AND PostId IS NOT NULL;	codebase_community
SELECT MIN(`CreationDate`) AS YoungestFirstPostDate FROM `posts` WHERE `OwnerUserId` IN (     SELECT `Id`     FROM `users`     ORDER BY `Age` ASC     LIMIT 1 );	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN posts p ON u.Id = p.OwnerUserId OR u.Id = p.LastEditorUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(v.PostId) AS avg_votes_by_oldest_users FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users)	codebase_community
SELECT `DisplayName`, MAX(`Reputation`) as `MaxReputation` FROM `users` WHERE `Reputation` = (SELECT MAX(`Reputation`) FROM `users`) GROUP BY `DisplayName` ORDER BY `MaxReputation` DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT `DisplayName`  FROM `users`  WHERE `Age` BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(p.Id) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND YEAR(p.CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p WHERE p.Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT AVG(p.Score) AS AverageScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Location = 'Stephen Turner'	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName AS OwnerDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      ROUND((COUNT(CASE WHEN YEAR(posts.CreationDate) = 2011 AND users.Reputation > 1000 THEN 1 END) * 100.0) / COUNT(posts.Id), 2) AS PercentageOfPostsByHighRepUsersIn2011 FROM      posts JOIN      users ON posts.OwnerUserId = users.Id;	codebase_community
SELECT      DIVIDE(COUNT(CASE WHEN users.Age BETWEEN 13 AND 18 THEN users.Id ELSE NULL END), COUNT(users.Id)) AS percentage FROM      users	codebase_community
SELECT p.ViewCount, u.DisplayName AS LastUserDisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Body LIKE '%Computer Game Datasets%'	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183;	codebase_community
SELECT Name, MAX(Date) as LatestBadgeDate FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett') GROUP BY UserId ORDER BY LatestBadgeDate DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT      u.CreationDate AS AccountCreationDate,     b.Date AS BadgeDate,     TIMESTAMPDIFF(SECOND, u.CreationDate, b.Date) AS TimeToGetBadge FROM      badges b JOIN      users u ON b.UserId = u.Id WHERE      u.DisplayName = 'Zolomon'	codebase_community
SELECT      u.Id AS UserId,     COUNT(DISTINCT p.Id) AS PostCount,     COUNT(DISTINCT c.Id) AS CommentCount FROM      users u LEFT JOIN      posts p ON u.Id = p.OwnerUserId LEFT JOIN      comments c ON u.Id = c.UserId WHERE      u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY      u.Id;	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT `UserId`) FROM `badges` WHERE `Name` = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts JOIN tags ON posts.Id = tags.ExcerptPostId WHERE tags.TagName = 'careers';	codebase_community
SELECT u.Reputation, p.ViewCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.OwnerDisplayName = 'Jarrod Dixon';	codebase_community
SELECT      COALESCE(SUM(CASE WHEN p.PostTypeId = 1 THEN 1 ELSE 0 END), 0) AS AnswersCount,     COALESCE(SUM(CASE WHEN p.PostTypeId = 2 THEN 1 ELSE 0 END), 0) AS CommentsCount FROM      posts p WHERE      p.Title = 'Clustering 1D data'	codebase_community
SELECT CreationDate  FROM users  WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT      (COUNT(CASE WHEN p.Score > 50 THEN 1 END) * 100.0) / COUNT(p.Id) AS PercentageAbove50 FROM      posts p INNER JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Id, c.Text, c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT c.CreationDate, u.Age FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text LIKE '%http://%'	codebase_community
SELECT COUNT(DISTINCT c.PostId)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (     SELECT Id     FROM posts     WHERE CommentCount = 1 ) AND Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS TotalUsers40YearsOld FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id, c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'R is also lazy evaluated.';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0;	codebase_community
SELECT      (COUNT(CASE WHEN v.UserId IN (SELECT u.Id FROM users u WHERE u.UpVotes = 0) THEN c.UserId END) * 100.0) /      COUNT(CASE WHEN c.Score BETWEEN 5 AND 10 THEN c.UserId END) AS percentage FROM comments c JOIN votes v ON c.UserId = v.UserId WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM `superpower` sp JOIN `hero_power` hp ON sp.id = hp.power_id JOIN `superhero` sh ON hp.hero_id = sh.id WHERE sh.superhero_name = '3-D Man';	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;	superhero
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15;	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility';	superhero
SELECT superhero_name  FROM superhero  JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id  JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id  WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Blond';	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name, height_cm FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE name = 'Marvel Comics') ORDER BY height_cm DESC;	superhero
SELECT p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.superhero_name = 'Sauron';	superhero
SELECT      s.superhero_name,      c.colour,      COUNT(s.id) AS eye_colour_popularity FROM      superhero s JOIN      colour c ON s.eye_colour_id = c.id WHERE      s.publisher_id = (SELECT id FROM publisher WHERE name = 'Marvel Comics') GROUP BY      c.colour ORDER BY      eye_colour_popularity DESC;	superhero
SELECT AVG(`height_cm`)  FROM `superhero`  WHERE `publisher_id` = (SELECT `id` FROM `publisher` WHERE `publisher_name` = 'Marvel Comics')	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN publisher p ON s.publisher_id = p.id WHERE p.id = 13 AND sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE colour.id = (SELECT id FROM colour WHERE colour_name = 'Gold')  AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name FROM superhero AS sb JOIN publisher AS p ON sb.publisher_id = p.id WHERE sb.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE colour.colour = 'Blond';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT race FROM superhero WHERE superhero_name = 'Copycat';	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch';	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  JOIN gender g ON s.gender_id = g.id  WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name ORDER BY COUNT(hero_power.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT      ROUND((SUM(CASE WHEN `alignment`.`alignment` = 'Bad' THEN 1 ELSE 0 END) * 100.0) / COUNT(`superhero`.`id`), 2) AS percentage_bad_alignment,     SUM(CASE WHEN `alignment`.`alignment` = 'Bad' AND `publisher`.`publisher_name` = 'Marvel Comics' THEN 1 ELSE 0 END) AS marvel_bad_alignment_count FROM      `superhero` JOIN      `alignment` ON `superhero`.`alignment_id` = `alignment`.`id` JOIN      `publisher` ON `superhero`.`publisher_id` = `publisher`.`id`	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) -      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS diff_published	superhero
SELECT `id` FROM `publisher` WHERE `publisher_name` = 'Star Trek';	superhero
SELECT AVG(`attribute_value`)  FROM `hero_attribute`;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg)  FROM superhero  WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female');	superhero
SELECT DISTINCT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' ORDER BY sp.power_name LIMIT 5;	superhero
SELECT superhero_name  FROM superhero  WHERE race_id = 2;	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IS NULL OR eye_colour_id NOT IN (SELECT id FROM colour WHERE power_name = 'No Colour');	superhero
SELECT sp.power_name FROM `hero_power` hp JOIN `superpower` sp ON hp.power_id = sp.id WHERE hp.hero_id = 56;	superhero
SELECT `full_name` FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Demi-God') LIMIT 5;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = 2;	superhero
SELECT race FROM superhero WHERE weight_kg = 169;	superhero
SELECT s.full_name, c.colour  FROM superhero s  JOIN colour c ON s.hair_colour_id = c.id  JOIN race r ON s.race_id = r.id  WHERE s.height_cm = 185 AND r.race = 'human';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT      ROUND((SUM(CASE WHEN s.height_cm BETWEEN 150 AND 180 THEN 1 ELSE 0 END) * 100.0) / COUNT(s.id), 2) AS percentage_marvel_heroes FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics';	superhero
SELECT superhero_name  FROM superhero  WHERE gender_id = 1  AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT sp.power_name, COUNT(*) as count FROM `superpower` sp JOIN `hero_power` hp ON sp.id = hp.power_id GROUP BY sp.power_name ORDER BY count DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM `superhero` s JOIN `hero_power` hp ON s.id = hp.hero_id JOIN `superpower` sp ON hp.power_id = sp.id WHERE s.id = 1;	superhero
SELECT COUNT(hp.hero_id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'stealth';	superhero
SELECT s.full_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Strength'  AND ha.attribute_value = (SELECT MAX(attribute_value)                            FROM hero_attribute ha2                            JOIN attribute a2 ON ha2.attribute_id = a2.id                            WHERE a2.attribute_name = 'Strength');	superhero
SELECT AVG(superhero.id)  FROM superhero  WHERE superhero.skin_colour_id = (SELECT id FROM colour WHERE colour.id = 1);	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'durability') AND publisher_name = 'Dark Horse Comics';	superhero
SELECT c.colour  FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE power_name = 'Flight';	superhero
SELECT      s.superhero_name,      c.eye_name AS eyes,      h.hair_name AS hair,      sk.skin_name AS skin_colour FROM      superhero s JOIN      colour c ON s.eye_colour_id = c.id JOIN      colour h ON s.hair_colour_id = h.id JOIN      colour sk ON s.skin_colour_id = sk.id JOIN      gender g ON s.gender_id = g.id JOIN      publisher p ON s.publisher_id = p.id WHERE      g.name = 'Female' AND p.name = 'Dark Horse Comics';	superhero
SELECT      s.superhero_name,      p.publisher_name FROM      superhero s JOIN      colour c_hair ON s.hair_colour_id = c_hair.id JOIN      colour c_skin ON s.skin_colour_id = c_skin.id JOIN      colour c_eye ON s.eye_colour_id = c_eye.id JOIN      publisher p ON s.publisher_id = p.id WHERE      c_hair.id = c_skin.id AND c_hair.id = c_eye.id;	superhero
SELECT `race.race` FROM `superhero` JOIN `race` ON `superhero.race_id` = `race.id` WHERE `superhero.superhero_name` = 'A-Bomb';	superhero
SELECT      ROUND((SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) / COUNT(CASE WHEN g.gender = 'Female' THEN 1 END)) * 100, 2) AS blue_female_percentage FROM      superhero s JOIN      gender g ON s.gender_id = g.id JOIN      colour c ON s.skin_colour_id = c.id WHERE      g.gender = 'Female';	superhero
SELECT `superhero_name`, `race` FROM `superhero` WHERE `full_name` = 'Charles Chandler' AND `id` IN (     SELECT `hero_id`     FROM `superhero`     WHERE `full_name` = 'Charles Chandler' )	superhero
SELECT `gender` FROM `superhero` WHERE `superhero_name` = 'Agent 13';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Adaptation';	superhero
SELECT COUNT(power_id) AS number_of_powers FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Amazo');	superhero
SELECT sp.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.full_name = 'Hunter Zolomon';	superhero
SELECT superhero.height_cm FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Amber';	superhero
SELECT superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Black' AND hair_colour.colour = 'Black';	superhero
SELECT superhero_name, `colour.colour` AS eye_colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Gold';	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Vampire';	superhero
SELECT superhero_name  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE alignment.alignment = 'Neutral';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute     JOIN attribute ON hero_attribute.attribute_id = attribute.id     WHERE attribute.attribute_name = 'Strength' );	superhero
SELECT s.race_id, s.alignment_id FROM superhero s WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT      ROUND((SUM(CASE WHEN s.gender_id = 2 AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) /            COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 END)) * 100, 2) AS female_hero_percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics'	superhero
SELECT AVG(`weight_kg`) AS average_weight FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Alien');	superhero
SELECT      (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Emil Blonsky') -      (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;	superhero
SELECT sp.power_name FROM superhero AS sh JOIN hero_power AS hp ON sh.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sh.superhero_name = 'Abomination';	superhero
SELECT COUNT(*)  FROM superhero  JOIN race ON superhero.race_id = race.id  JOIN gender ON superhero.gender_id = gender.id  WHERE race.race = 'god/eternal' AND gender.id = 1;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' ORDER BY hero_attribute.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour eye_colour ON s.eye_colour_id = eye_colour.id AND eye_colour.name = 'Blue' JOIN colour hair_colour ON s.hair_colour_id = hair_colour.id AND hair_colour.name = 'Brown';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id != 1;	superhero
SELECT      ROUND(         (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0) / COUNT(s.id),          2     ) AS blue_eyes_percentage FROM      superhero s JOIN      colour c ON s.eye_colour_id = c.id	superhero
SELECT      (SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END)) AS male_female_ratio FROM superhero;	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT `id` FROM `superpower` WHERE `power_name` = 'cryokinesis';	superhero
SELECT superhero_name  FROM superhero  WHERE id = 294;	superhero
SELECT `superhero_name`, `full_name` FROM `superhero` WHERE `weight_kg` IS NULL OR `weight_kg` = 0;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr';	superhero
SELECT race FROM superhero WHERE weight_kg = 108 AND height_cm = 188;	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.id = 38;	superhero
SELECT s.race_id, r.race FROM superhero s JOIN race r ON s.race_id = r.id JOIN (     SELECT hero_id, MAX(attribute_value) AS max_attr_value     FROM hero_attribute     GROUP BY hero_id ) ha ON s.id = ha.hero_id ORDER BY ha.max_attr_value DESC LIMIT 1;	superhero
SELECT a.alignment, sp.power_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) AS average_attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.alignment_id = 3;	superhero
SELECT s.superhero_name, c.colour  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN colour c ON s.skin_colour_id = c.id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*)  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE gender.id = 2 AND alignment.id = 1;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute_value BETWEEN 75 AND 80;	superhero
SELECT s.full_name, r.race FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour ha ON s.hair_colour_id = ha.id JOIN race r ON s.race_id = r.id WHERE ha.colour = 'Blue' AND g.gender = 'Male';	superhero
SELECT      ROUND((SUM(CASE WHEN a.alignment_id = 2 AND g.id = 2 THEN 1 ELSE 0 END) / SUM(CASE WHEN a.alignment_id = 2 THEN 1 ELSE 0 END)) * 100, 2) AS percentage_female_bad_heroes FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN gender g ON s.gender_id = g.id WHERE a.alignment = 'Bad';	superhero
SELECT      (SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) -       SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END)) AS eye_colour_difference FROM      superhero T1 WHERE      T1.weight_kg = 0 OR T1.weight_kg IS NULL;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE a.attribute_name = 'Strength' AND s.superhero_name = 'Hulk';	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE colour.colour = 'Green' AND alignment.id = 2;	superhero
SELECT COUNT(*)  FROM superhero  WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name ASC;	superhero
SELECT s.gender FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name, weight_kg FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') ORDER BY weight_kg DESC LIMIT 1;	superhero
SELECT AVG(`superhero`.`height_cm`) AS average_height FROM `superhero` JOIN `publisher` ON `superhero`.`publisher_id` = `publisher`.`id` WHERE `race_id` NOT IN (SELECT `id` FROM `race` WHERE `name` = 'Human') AND `publisher`.`name` = 'Dark Horse Comics'	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics'))     -      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS difference;	superhero
SELECT a.attribute_name FROM attribute a JOIN hero_attribute ha ON a.id = ha.attribute_id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Black Panther' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT `colour`.`colour` FROM `superhero` JOIN `colour` ON `superhero`.`eye_colour_id` = `colour`.`id` WHERE `superhero`.`superhero_name` = 'Abomination';	superhero
SELECT superhero_name, full_name, height_cm  FROM superhero  WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name  FROM superhero  WHERE full_name = 'Charles Chandler';	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END) * 100.0) / COUNT(*),         2     ) AS percentage_female FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'George Lucas';	superhero
SELECT      ROUND(         (SUM(CASE WHEN alignment_id = 1 AND publisher_id = 13 THEN 1 ELSE 0 END) * 100.0) /          COUNT(*), 2     ) AS percentage_good_heroes FROM      superhero WHERE      publisher_id = 13 AND alignment_id = 1;	superhero
SELECT COUNT(*)  FROM superhero  WHERE `full_name` LIKE 'John%';	superhero
SELECT hero_id  FROM hero_attribute  ORDER BY attribute_value ASC  LIMIT 1;	superhero
SELECT `full_name`  FROM `superhero`  WHERE `superhero_name` = 'Alien' AND `race` = 'Alien';	superhero
SELECT s.full_name FROM superhero s JOIN colour c_eye ON s.eye_colour_id = c_eye.id WHERE s.weight_kg < 100 AND c_eye.id = 1;	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT `weight_kg`, `race`  FROM `superhero`  WHERE `id` = 40;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT h.id  FROM superhero h  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Intelligence';	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT s.superhero_name, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN (     SELECT driverId, MAX(q1) as maxQ1     FROM qualifying     WHERE raceId = 20 AND q1 IS NOT NULL     GROUP BY driverId ) AS subq ON d.driverId = subq.driverId AND q.q1 = subq.maxQ1;	formula_1
SELECT d.surname  FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19);	formula_1
SELECT DISTINCT s.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN circuits AS c2 ON c2.name = 'Shanghai International Circuit' JOIN seasons s ON r.year = s.year WHERE c.name = c2.name;	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Germany';	formula_1
SELECT c.name, cs.position FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN constructorStandings cs ON r.raceId = cs.raceId JOIN constructors con ON cs.constructorId = con.constructorId WHERE con.name = 'Renault';	formula_1
SELECT COUNT(*)  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE YEAR(races.date) = 2010  AND NOT (circuits.country = 'Malaysia' OR circuits.country = 'Bahrain' OR circuits.country = 'China' OR circuits.country = 'Singapore'          OR circuits.country = 'Japan' OR circuits.country = 'Korea' OR circuits.country = 'Turkey');	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain';	formula_1
SELECT c.lat, c.lng  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.name = 'Australian Grand Prix';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Kuala Lumpur' AND c.country = 'Malaysia';	formula_1
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Sepang' AND r.date = '2009-04-05';	formula_1
SELECT lat, lng  FROM circuits  WHERE name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.nationality FROM constructors AS c JOIN constructorResults AS cr ON c.constructorId = cr.constructorId JOIN races AS r ON cr.raceId = r.raceId WHERE cr.points = 1.0 AND r.raceId = 24;	formula_1
SELECT q1  FROM qualifying  JOIN drivers ON qualifying.driverId = drivers.driverId  WHERE drivers.forename = 'Bruno' AND drivers.surname = 'Senna' AND qualifying.raceId = 354;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '01:40:00' AND q.raceId = 355;	formula_1
SELECT q.driverId, d.number FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 903 AND q.q3 LIKE '00:01%'	formula_1
SELECT COUNT(*) FROM `driverStandings` JOIN `races` ON `driverStandings.raceId` = `races.raceId` WHERE `races.name` = 'Bahrain Grand Prix' AND `driverStandings.position` IS NULL	formula_1
SELECT s.year FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT `driverId`)  FROM `results`  WHERE `raceId` IN (     SELECT `raceId`      FROM `races`      WHERE `date` = '2015-11-29' ) AND `statusId` = 1;	formula_1
SELECT      d.driverRef,      d.surname,      d.forename,      d.dob,      MIN(d.dob) AS oldest_dob FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId JOIN      results res ON d.driverId = res.driverId AND ds.raceId = res.raceId WHERE      r.raceId = 592 AND res.time IS NOT NULL GROUP BY      d.driverId ORDER BY      oldest_dob ASC LIMIT 1;	formula_1
SELECT d.driverRef, d.url FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.raceId = 161 AND lt.time LIKE '0:01:27%'	formula_1
SELECT drivers.nationality FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.raceId = 933 AND results.fastestLap = (SELECT MAX(fastestLap) FROM results JOIN races ON results.raceId = races.raceId WHERE races.raceId = 933)	formula_1
SELECT location, lat, lng FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Malaysian Grand Prix';	formula_1
SELECT constructors.url FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId JOIN races ON constructorResults.raceId = races.raceId WHERE races.raceId = 9 AND constructorResults.points = (     SELECT MAX(constructorResults.points)     FROM constructorResults     JOIN races ON constructorResults.raceId = races.raceId     WHERE races.raceId = 9 );	formula_1
SELECT q1  FROM qualifying  WHERE driverId = (SELECT driverId FROM drivers WHERE surnname = 'di Grassi')  AND raceId = (SELECT raceId FROM races WHERE raceId = 345);	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 347 AND q.q2 = '00:01:15';	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 45 AND q.q3 LIKE '0:01:%'	formula_1
SELECT r.name AS raceName, d.forename, d.surname, r.time FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.driverRef = 'mclaren' AND r.raceId = 743;	formula_1
SELECT d.driverId, d.nationality FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2006 AND r.circuitId = 2 AND ds.position = 2;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.date = '2015-11-29' AND r.statusId = 2;	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = (SELECT raceId FROM races WHERE raceId = 348) AND lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes WHERE raceId = (SELECT raceId FROM races WHERE raceId = 348));	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLap = (SELECT MAX(fastestLap) FROM results);	formula_1
SELECT      (SUBTRACT(race853.fastestLapSpeed, race854.fastestLapSpeed) * 100) / race853.fastestLapSpeed AS percentFaster FROM     (SELECT fastestLapSpeed FROM results JOIN drivers ON results.driverId = drivers.driverId      WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta' AND results.raceId = 853) AS race853 JOIN     (SELECT fastestLapSpeed FROM results JOIN drivers ON results.driverId = drivers.driverId      WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta' AND results.raceId = 854) AS race854;	formula_1
SELECT      d.driverRef,     (COUNT(CASE WHEN lt.time IS NOT NULL THEN 1 END) * 100.0 / COUNT(d.driverId)) AS completionRate FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId WHERE      lt.raceId IN (SELECT raceId FROM races WHERE date = '1983-07-16') GROUP BY      d.driverRef;	formula_1
SELECT year FROM races WHERE name = 'Singapore Grand Prix' ORDER BY year LIMIT 1;	formula_1
SELECT COUNT(*) AS TotalRaces, name FROM races WHERE year = 2005 GROUP BY name ORDER BY name DESC;	formula_1
SELECT r.name FROM races r JOIN (SELECT MIN(date) AS earliest_date FROM races) AS m WHERE r.date = m.earliest_date;	formula_1
SELECT `name`, `date` FROM `races` WHERE `year` = 1999 ORDER BY `round` DESC LIMIT 1;	formula_1
SELECT `seasons`.`year`, COUNT(`races`.`raceId`) AS `numRaces` FROM `seasons` JOIN `races` ON `seasons`.`year` = `races`.`year` GROUP BY `seasons`.`year` ORDER BY `numRaces` DESC LIMIT 1;	formula_1
SELECT name FROM races WHERE year != 2000;	formula_1
SELECT c.name AS circuit_name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.year = (SELECT MIN(year) FROM seasons WHERE country = 'Europe') AND c.country = 'Europe';	formula_1
SELECT MAX(year)  FROM races  WHERE name = 'British Grand Prix' AND circuitId = (SELECT circuitId FROM circuits WHERE name = 'Brands Hatch');	formula_1
SELECT COUNT(DISTINCT r.year) AS numberOfSeasons FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId JOIN drivers AS d ON r.circuitId = c.circuitId WHERE c.country = 'United Kingdom' AND d.nationality = 'British';	formula_1
SELECT d.driverRef, ds.position FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Singapore Grand Prix' AND r.year = 2010 ORDER BY ds.position;	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE ds.points = (SELECT MAX(points) FROM driverStandings);	formula_1
SELECT d.forename, d.surname, ds.points FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name, MIN(l.milliseconds) AS best_milliseconds FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN races r ON l.raceId = r.raceId GROUP BY l.driverId, r.raceId ORDER BY best_milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(`milliseconds`) AS average_lap_time FROM `lapTimes` JOIN `drivers` ON `lapTimes.driverId` = `drivers.driverId` JOIN `races` ON `lapTimes.raceId` = `races.raceId` WHERE `drivers.forename` = 'Lewis' AND `drivers.surname` = 'Hamilton' AND `races.name` = 'Malaysian Grand Prix';	formula_1
SELECT      (COUNT(CASE WHEN rs.position > 1 THEN rs.raceId END) * 100.0) / COUNT(rs.raceId) AS percentage FROM      results rs JOIN      drivers d ON rs.driverId = d.driverId WHERE      d.surname = 'Hamilton'      AND rs.raceId IN (SELECT raceId FROM races WHERE year >= 2010)	formula_1
SELECT d.forename, d.surname, d.nationality, ddr.max_points FROM drivers d JOIN (     SELECT ds.driverId, MAX(ds.points) AS max_points     FROM driverStandings ds     GROUP BY ds.driverId ) ddr ON d.driverId = ddr.driverId WHERE ddr.max_points = (     SELECT MAX(points)     FROM driverStandings )	formula_1
SELECT d.forename, d.surname,         (YEAR(CURRENT_TIMESTAMP) - YEAR(d.dob)) AS age FROM drivers d WHERE d.nationality = 'Japanese' ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT c.name, COUNT(r.raceId) AS race_count FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.name HAVING COUNT(r.raceId) = 4;	formula_1
SELECT circuits.name, circuits.location, races.name AS race_name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'USA' AND races.year = 2006;	formula_1
SELECT r.name AS race_name, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT r.name AS race_name FROM races r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND ds.position < 20;	formula_1
SELECT COUNT(DISTINCT `driverStandingsId`)  FROM `driverStandings` JOIN `races` ON `driverStandings.raceId` = `races.raceId` JOIN `circuits` ON `races.circuitId` = `circuits.circuitId` JOIN `drivers` ON `driverStandings.driverId` = `drivers.driverId` WHERE `drivers.nationality` = 'German' AND `circuits.country` = 'Malaysia' AND `driverStandings.wins` = 1;	formula_1
SELECT      r.name AS race_name,      r.year AS race_year  FROM      races r  JOIN      lapTimes lt ON r.raceId = lt.raceId  JOIN      drivers d ON lt.driverId = d.driverId  JOIN      results rs ON lt.raceId = rs.raceId AND lt.driverId = rs.driverId  WHERE      d.surname = 'Schumacher'      AND lt.milliseconds = (         SELECT              MIN(lt2.milliseconds)          FROM              lapTimes lt2          JOIN              results rs2 ON lt2.raceId = rs2.raceId AND lt2.driverId = rs2.driverId          JOIN              drivers d2 ON lt2.driverId = d2.driverId          WHERE              d2.surname = 'Schumacher'      );	formula_1
SELECT AVG(`points`) AS average_points FROM `driverStandings` JOIN `races` ON `driverStandings.raceId` = `races.raceId` JOIN `seasons` ON `races.year` = `seasons.year` JOIN `drivers` ON `driverStandings.driverId` = `drivers.driverId` WHERE `drivers.url` = 'http://en.wikipedia.org/wiki/Eddie_Irvine' AND `seasons.year` = 2000;	formula_1
SELECT      MIN(r.year) AS first_race_year,      SUM(dr.points) AS points_in_first_race FROM      races r JOIN      driverStandings ds ON r.raceId = ds.raceId JOIN      drivers d ON ds.driverId = d.driverId WHERE      d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT      r.name AS RaceName,      s.year AS RaceYear,      c.location AS CircuitLocation,      MAX(r.laps) AS MostLaps FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId JOIN      seasons s ON r.year = s.year GROUP BY      r.name,      s.year,      c.location ORDER BY      MostLaps DESC LIMIT 1;	formula_1
SELECT      (COUNT(CASE WHEN c.country = 'Germany' THEN 1 END) * 100.0) / COUNT(*) AS percentage_german_races FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId WHERE      r.name = 'European Grand Prix';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT      name AS circuitName,     lat FROM      circuits WHERE      name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY      lat DESC LIMIT 1;	formula_1
SELECT circuitRef  FROM circuits  WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT `country` FROM `circuits` WHERE `alt` = (SELECT MAX(`alt`) FROM `circuits`);	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT      c.country,      d.forename,      d.surname,      d.dob  FROM      drivers d  JOIN      circuits c ON d.nationality = c.country  WHERE      d.dob = (SELECT MIN(dob) FROM drivers);	formula_1
SELECT surname  FROM drivers  WHERE nationality = 'Italian';	formula_1
SELECT url FROM drivers WHERE driverRef = 'davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT `circuitRef`, `name` FROM `circuits` JOIN `races` ON `circuits.circuitId` = `races.circuitId` WHERE `races.year` = 2009 AND `circuits.name` LIKE '%Spanish Grand Prix%';	formula_1
SELECT DISTINCT s.year FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT      c.name AS circuit_name,     c.location,     c.country,     r.year,     r.round,     r.name AS race_name,     r.date,     r.time,     r.url AS race_url FROM      circuits c JOIN      races r ON c.circuitId = r.circuitId WHERE      c.circuitRef = 'silverstone';	formula_1
SELECT r.name, r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year BETWEEN 2010 AND 2019 AND c.country = 'Abu Dhabi';	formula_1
SELECT COUNT(*) FROM races WHERE circuitId IN (     SELECT circuitId     FROM circuits     WHERE country = 'Italy' );	formula_1
SELECT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.circuitId = (SELECT circuitId FROM circuits WHERE circuitId = 1)	formula_1
SELECT url  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  JOIN seasons ON races.year = seasons.year  WHERE circuits.name = 'Circuit de Barcelona-Catalunya' AND seasons.year = 2009;	formula_1
SELECT MIN(`fastestLapTime`) AS fastestLapTime FROM `results` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `nationality` = 'British') AND `fastestLap` IS NOT NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE r.fastestLap = (SELECT MAX(fastestLap) FROM results) AND ra.name LIKE '%Grand Prix%' ORDER BY r.fastestLap DESC LIMIT 1;	formula_1
SELECT d.driverRef FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Canadian Grand Prix' AND ds.position = 1 AND YEAR(r.date) = 2007;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.nationality = 'British' AND d.name = 'Lewis Hamilton';	formula_1
SELECT r.name AS raceName FROM races r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY ds.rank ASC LIMIT 1;	formula_1
SELECT MAX(fastestLapSpeed) AS fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix'	formula_1
SELECT DISTINCT s.year FROM seasons s JOIN races r ON s.year = r.year JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.nationality = 'British' AND d.driverId = 1;	formula_1
SELECT ds.positionOrder  FROM driverStandings ds  JOIN drivers d ON ds.driverId = d.driverId  JOIN races r ON ds.raceId = r.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  AND r.name = 'Chinese Grand Prix';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 1989 AND ra.round = 1 AND r.grid = 4;	formula_1
SELECT COUNT(DISTINCT d.driverId) AS finished_drivers_count FROM driverStandings ds JOIN results r ON ds.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId JOIN seasons se ON ra.year = se.year WHERE se.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.time IS NOT NULL;	formula_1
SELECT      lt.lap AS lap_number,      lt.time AS fastest_lap_time,      lt.milliseconds AS fastest_lap_milliseconds FROM      lapTimes lt JOIN      drivers d ON lt.driverId = d.driverId JOIN      races r ON lt.raceId = r.raceId WHERE      d.driverId = 625 AND     r.year = 2008 AND     r.name = 'Australian Grand Prix';	formula_1
SELECT r.time FROM `races` AS r JOIN `driverStandings` AS ds ON r.raceId = ds.raceId JOIN `results` AS res ON ds.driverId = res.driverId AND r.raceId = res.raceId JOIN `drivers` AS d ON ds.driverId = d.driverId WHERE d.surname = 'Hamilton' AND r.name = 'Chinese Grand Prix' AND r.year = 2008 AND ds.position = 2	formula_1
SELECT      d.driverRef,      d.url FROM      `driverStandings` ds JOIN      `drivers` d ON ds.driverId = d.driverId JOIN      `races` r ON ds.raceId = r.raceId JOIN      `seasons` s ON r.year = s.year WHERE      s.year = 2008 AND      r.name = 'Australian Grand Prix' AND      ds.wins = 1 AND      d.time = 'HH:MM:SS.mmm';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.nationality = 'British' AND ra.year = 2008;	formula_1
SELECT      r.driverId,      COUNT(DISTINCT r.raceId) AS racesParticipated FROM      results r JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.name = 'Chinese Grand Prix' AND     r.position IS NOT NULL AND     r.milliseconds IS NOT NULL GROUP BY      r.driverId HAVING      COUNT(DISTINCT r.raceId) > 0;	formula_1
SELECT SUM(r.points) AS total_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE d.nationality = 'British' AND d.driverId = (     SELECT driverId FROM drivers WHERE nationality = 'British' AND dob = '1985-01-07' );	formula_1
SELECT AVG(TIMESTAMPDIFF(SECOND, '00:00:00', SUBSTRING_INDEX(SUBSTRING_INDEX(`fastestLapTime`, ':', -2), '.', 1))) AS avgFastestLapTimeInSeconds FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE driverRef = 'hamilton');	formula_1
SELECT      (SELECT COUNT(DISTINCT raceId)       FROM results       WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 AND time IS NOT NULL)     ) /      (SELECT COUNT(DISTINCT raceId)       FROM results       WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008)     ) AS completion_rate;	formula_1
SELECT     ((         (SELECT TIMEDIFF(MAX(time), MIN(time)) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 AND circuitId = (SELECT circuitId FROM circuits WHERE url = 'http://en.wikipedia.org/wiki/A1-Ring'))     ) / (         SELECT time FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE driverRef = 'hamilton') AND raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 AND circuitId = (SELECT circuitId FROM circuits WHERE url = 'http://en.wikipedia.org/wiki/A1-Ring'))     ) * 100     ) * -1 ) AS percentage_difference	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne';	formula_1
SELECT `lat`, `lng` FROM `circuits` WHERE `country` = 'USA';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND dob > '1980-01-01';	formula_1
SELECT MAX(points)  FROM constructorResults  JOIN constructors ON constructors.constructorId = constructorResults.constructorId  WHERE constructors.nationality = 'British';	formula_1
SELECT      c.constructorRef,      c.name,      SUM(cr.points) AS total_points FROM      constructors c JOIN      constructorStandings cs ON c.constructorId = cs.constructorId JOIN      constructorResults cr ON cs.constructorId = cr.constructorId GROUP BY      c.constructorId ORDER BY      total_points DESC LIMIT 1;	formula_1
SELECT c.name  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId  JOIN races r ON cr.raceId = r.raceId  WHERE r.raceId = 291 AND cr.points = 0;	formula_1
SELECT COUNT(DISTINCT cr.constructorId) FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'Japanese' AND cr.points = 0 GROUP BY cr.constructorId HAVING COUNT(cr.raceId) = 2;	formula_1
SELECT c.constructorRef, c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN constructors c ON d.driverId = c.constructorId JOIN results r ON c.constructorId = r.constructorId JOIN lapTimes lt ON r.driverId = lt.driverId WHERE c.nationality = 'French' AND lt.lap > 50;	formula_1
SELECT      (COUNT(CASE WHEN d.nationality = 'Japanese' THEN dr.driverId END AND r.time IS NOT NULL) * 100.0) /      COUNT(CASE WHEN d.nationality = 'Japanese' THEN dr.driverId END) AS race_completion_percentage FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      r.year BETWEEN 2007 AND 2009	formula_1
SELECT      r.year,     AVG(TIME_TO_SEC(t.time)) AS avg_champion_time FROM      results AS res JOIN      races AS r ON res.raceId = r.raceId JOIN      driverStandings AS ds ON res.driverId = ds.driverId AND res.raceId = ds.raceId JOIN      drivers AS d ON res.driverId = d.driverId JOIN      qualifying AS q ON res.driverId = q.driverId AND res.raceId = q.raceId WHERE      ds.position = 1     AND res.time IS NOT NULL     AND r.year < 1975 GROUP BY      r.year;	formula_1
SELECT d.forename, d.surname FROM drivers d WHERE d.dob > '1975-01-01' AND EXISTS (     SELECT 1     FROM driverStandings ds     JOIN results r ON ds.driverId = d.driverId     WHERE d.dob > '1975-01-01'     AND ds.position = 2     AND ds.raceId = r.raceId     AND d.driverId = r.driverId );	formula_1
SELECT COUNT(*)  FROM drivers  JOIN driverStandings ON drivers.driverId = driverStandings.driverId  JOIN drivers AS d ON d.driverId = driverStandings.driverId  JOIN races ON driverStandings.raceId = races.raceId  JOIN results ON driverStandings.driverId = results.driverId AND driverStandings.raceId = results.raceId  WHERE d.nationality = 'Italian' AND results.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT lt.lap FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN driverStandings ds ON lt.driverId = ds.driverId JOIN drivers d ON ds.driverId = d.driverId JOIN results rs ON d.driverId = rs.driverId WHERE r.year = 2009 AND d.driverRef = 'hamilton' AND lt.milliseconds = (     SELECT MIN(lt2.milliseconds)     FROM lapTimes lt2     JOIN races r2 ON lt2.raceId = r2.raceId     JOIN driverStandings ds2 ON lt2.driverId = ds2.driverId     JOIN drivers d2 ON ds2.driverId = d2.driverId     WHERE r2.year = 2009     AND d2.driverRef = 'hamilton' )	formula_1
SELECT AVG(`fastestLapSpeed`) AS average_speed FROM `races` JOIN `results` ON `races.raceId` = `results.raceId` WHERE `races.name` = 'Spanish Grand Prix'	formula_1
SELECT r.name, r.year FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.milliseconds IS NOT NULL ORDER BY res.milliseconds ASC LIMIT 1;	formula_1
SELECT      (COUNT(CASE WHEN d.dob < '1985-01-01' THEN 1 END) /      COUNT(DISTINCT d.driverId)) * 100 AS percentage FROM      driverStandings ds JOIN      drivers d ON ds.driverId = d.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      r.year BETWEEN 2000 AND 2005     AND d.dob < '1985-01-01';	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND SUBSTR(lt.time, 1, 2) < 2;	formula_1
SELECT code  FROM drivers  WHERE nationality = 'American';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM driverStandings  WHERE raceId = 18;	formula_1
SELECT      d.driverId,      d.number  FROM      drivers d  JOIN      (SELECT          MIN(YEAR(dob)) AS min_dob       FROM          drivers       WHERE          nationality = 'Dutch') AS youngest  ON      d.dob = youngest.min_dob  ORDER BY      d.dob DESC  LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE surnames = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND YEAR(dob) = 1980;	formula_1
SELECT d.driverId, d.forename, d.surname, MIN(lt.time) AS earliestLapTime FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN constructors c ON d.nationality = c.nationality WHERE d.dob BETWEEN '1980-01-01' AND '1990-12-31' AND c.nationality = 'German' GROUP BY d.driverId, d.forename, d.surname ORDER BY earliestLapTime ASC LIMIT 3;	formula_1
SELECT `driverRef`  FROM `drivers`  WHERE `nationality` = 'German'  ORDER BY `dob`  LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.dob BETWEEN '1971-01-01' AND '1971-12-31' AND lt.fastestLapTime = (     SELECT MIN(lt2.fastestLapTime)     FROM lapTimes lt2 );	formula_1
SELECT d.driverRef, d.forename, d.surname, MAX(lt.time) AS latestLapTime FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'Spanish' AND d.dob < '1982-01-01' GROUP BY d.driverId ORDER BY latestLapTime DESC LIMIT 10;	formula_1
SELECT r.year FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)	formula_1
SELECT `year`, MAX(`time`) AS max_time FROM `lapTimes` GROUP BY `year` ORDER BY max_time ASC LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5;	formula_1
SELECT COUNT(DISTINCT `results.driverId`)  FROM `results`  JOIN `status` ON `results.statusId` = `status.statusId`  WHERE `results.raceId` > 50 AND `results.raceId` < 100 AND `results.time` IS NULL AND `status.status` = 'Disqualified';	formula_1
SELECT      c.location,      c.lat,      c.lng,      COUNT(r.circuitId) AS race_count FROM      circuits c JOIN      races r ON c.circuitId = r.circuitId WHERE      c.country = 'Austria' GROUP BY      c.circuitId;	formula_1
SELECT      r.year,      r.round,      r.name AS race_name,      COUNT(DISTINCT res.resultId) AS finishers_count FROM      races r JOIN      results res ON r.raceId = res.raceId WHERE      res.time IS NOT NULL GROUP BY      r.raceId, r.year, r.round, r.name ORDER BY      finishers_count DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
SELECT d.forename, d.surname, r.year, r.date, r.time FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE d.dob = (SELECT MIN(dob) FROM drivers) ORDER BY r.year ASC LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN status ON results.statusId = status.statusId WHERE drivers.nationality = 'American' AND status.status = 'Puncture';	formula_1
SELECT c.constructorRef, c.name, MAX(cr.points) AS highest_points, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN constructorResults cr ON cs.constructorId = cr.constructorId WHERE c.nationality = 'Italian' GROUP BY c.constructorRef, c.name, c.url ORDER BY highest_points DESC LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN (     SELECT constructorId, SUM(wins) as total_wins     FROM constructorStandings     GROUP BY constructorId     ORDER BY total_wins DESC     LIMIT 1 ) AS topConstructor ON c.constructorId = topConstructor.constructorId;	formula_1
SELECT      d.driverRef,      d.forename,      d.surname,      lt.time FROM      lapTimes lt JOIN      drivers d ON lt.driverId = d.driverId WHERE      lt.raceId IN (         SELECT              raceId          FROM              races          WHERE              name = 'French Grand Prix'     )     AND lt.lap = 3 ORDER BY      lt.time DESC LIMIT 1;	formula_1
SELECT r.name, MIN(lt.milliseconds) as fastest_lap_milliseconds FROM `lapTimes` lt JOIN `races` r ON lt.raceId = r.raceId WHERE lt.lap = 1 AND lt.position = 1 GROUP BY r.raceId, r.name ORDER BY fastest_lap_milliseconds LIMIT 1;	formula_1
SELECT AVG(`fastestLapTime`)  FROM `results`  JOIN `races` ON `results.raceId` = `races.raceId`  WHERE `races.year` = 2006 AND `results.rank` < 11;	formula_1
SELECT      d.forename,      d.surname,      d.dob,      AVG(SUBSTRING(p.duration, 1, LENGTH(p.duration) - 2)) AS avg_duration FROM      drivers d JOIN      pitStops p ON d.driverId = p.driverId WHERE      d.nationality = 'German' AND      d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY      d.driverId ORDER BY      avg_duration ASC LIMIT 3;	formula_1
SELECT      d.driverRef,      d.forename,      d.surname,      r.time AS finishTime FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId JOIN      seasons s ON r.year = s.year WHERE      r.name = 'Canadian Grand Prix' AND      s.year = 2008 AND      ds.wins = 1;	formula_1
SELECT c.constructorRef, c.url FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE cs.position = 1 AND cs.raceId = (     SELECT raceId     FROM races     WHERE year = 2009 AND name = 'Singapore Grand Prix' );	formula_1
SELECT `forename`, `surname`, `dob` FROM `drivers` WHERE `nationality` = 'Austrian' AND YEAR(`dob`) BETWEEN 1981 AND 1991;	formula_1
SELECT CONCAT(d.forename, ' ', d.surname) AS fullName,         c.url,         d.dob FROM drivers d JOIN constructors c ON d.nationality = 'German' AND c.name = d.nationality WHERE d.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY d.dob DESC;	formula_1
SELECT location, country, lat, lng  FROM circuits  WHERE circuitRef = 'hungaroring';	formula_1
SELECT      c.name,      c.nationality,      SUM(cr.points) AS total_points FROM      constructors c JOIN      constructorResults cr ON c.constructorId = cr.constructorId JOIN      races r ON cr.raceId = r.raceId WHERE      r.year BETWEEN 1980 AND 2010     AND r.circuitId = (SELECT circuitId FROM circuits WHERE circuitId = 5) -- Assuming Monaco Grand Prix has circuitId 5 GROUP BY      c.name,      c.nationality ORDER BY      total_points DESC LIMIT 1;	formula_1
SELECT AVG(points) AS average_score FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.driverId = 452 AND races.name = 'Turkish Grand Prix';	formula_1
SELECT AVG(COUNT(raceId)) AS annual_average_races FROM races WHERE year BETWEEN 2000 AND 2010;	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT SUM(CASE WHEN ds.positionOrder = 91 THEN ds.points ELSE 0 END) AS total_points FROM driverStandings ds JOIN results r ON ds.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2009 AND ds.positionOrder = 91;	formula_1
SELECT r.name  FROM races r  JOIN results res ON r.raceId = res.raceId  JOIN lapTimes lt ON res.resultId = lt.raceId  WHERE lt.fastestLapSpeed = (     SELECT MIN(fastestLapSpeed)      FROM lapTimes );	formula_1
SELECT CONCAT(c.location, ', ', c.country) AS full_location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(date) FROM races);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE q.position = 1 AND r.round = 3 AND r.name = 'Malaysian Grand Prix' AND YEAR(r.date) = 2008;	formula_1
SELECT d.forename, d.surname, d.nationality, r.name AS raceName FROM drivers d JOIN races r ON d.driverId = (     SELECT driverId     FROM drivers     ORDER BY dob DESC     LIMIT 1 ) WHERE d.dob = (     SELECT MIN(dob)     FROM drivers );	formula_1
SELECT      d.driverId,      COUNT(*) AS accidents FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.raceId = (         SELECT              raceId          FROM              races          WHERE              name = 'Canadian Grand Prix'     )     AND r.statusId = 3 GROUP BY      d.driverId ORDER BY      accidents DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, COUNT(*) AS wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.driverId ORDER BY wins DESC LIMIT 1;	formula_1
SELECT MAX(duration) AS longest_pit_stop_time FROM `pitStops`;	formula_1
SELECT MIN(`milliseconds`) AS fastestLapTime FROM `lapTimes` WHERE `position` = 1;	formula_1
SELECT MAX(`milliseconds`) AS longest_pit_stop_time FROM `pitStops` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `nationality` = 'British');	formula_1
SELECT `pitStops`.`lap` FROM `pitStops` JOIN `drivers` ON `pitStops`.`driverId` = `drivers`.`driverId` JOIN `races` ON `pitStops`.`raceId` = `races`.`raceId` WHERE `drivers`.`nationality` = 'British' AND `races`.`year` = 2011 AND `races`.`raceId` = 18;	formula_1
SELECT      d.driverId,      d.driverRef,      d.surname,      ps.raceId,      ps.stop,      ps.lap,      ps.time,      ps.duration FROM      pitStops ps JOIN      drivers d ON ps.driverId = d.driverId JOIN      races r ON ps.raceId = r.raceId WHERE      r.year = 2011 AND r.round = 1;	formula_1
SELECT MIN(`milliseconds`) AS `fastestLapRecord` FROM `lapTimes` WHERE `driverRef` = 'hamilton';	formula_1
SELECT d.forename, d.surname, MIN(STR_TO_DATE(time, '%M:%i.%s')) AS shortest_lap_time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId GROUP BY d.driverId ORDER BY shortest_lap_time ASC LIMIT 20;	formula_1
SELECT `lapTimes`.`position` FROM `lapTimes` JOIN `races` ON `lapTimes`.`raceId` = `races`.`raceId` JOIN `drivers` ON `lapTimes`.`driverId` = `drivers`.`driverId` WHERE `drivers`.`code` = 'HAM' ORDER BY `lapTimes`.`milliseconds` ASC LIMIT 1;	formula_1
SELECT MIN(`milliseconds`) AS lap_record FROM `lapTimes` WHERE `raceId` IN (     SELECT `raceId`     FROM `races`     WHERE `name` = 'Austrian Grand Prix Circuit' );	formula_1
SELECT      c.circuitId,      c.name,      MIN(l.time) AS fastestLapTime FROM      circuits c JOIN      races r ON c.circuitId = r.circuitId JOIN      lapTimes l ON r.raceId = l.raceId WHERE      c.country = 'Italy' GROUP BY      c.circuitId, c.name ORDER BY      fastestLapTime;	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix' AND r.raceId IN (     SELECT raceId     FROM lapTimes     ORDER BY time ASC     LIMIT 1 );	formula_1
SELECT      p.driverId,     p.time,     p.duration FROM      pitStops p JOIN      races r ON p.raceId = r.raceId WHERE      r.name = 'Austrian Grand Prix' AND     (SELECT MIN(milliseconds) FROM lapTimes lt JOIN races r2 ON lt.raceId = r2.raceId WHERE r2.name = 'Austrian Grand Prix') = p.milliseconds	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN lapTimes lt ON c.circuitId = lt.raceId WHERE lt.time = '1:29.488';	formula_1
SELECT AVG(`milliseconds`) as average_pit_stop_time FROM `pitStops` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `nationality` = 'British' AND `url` = 'http://en.wikipedia.org/wiki/Lewis_Hamilton');	formula_1
SELECT AVG(milliseconds)  FROM lapTimes  WHERE circuitId IN (     SELECT circuitId      FROM circuits      WHERE country = 'Italy' );	formula_1
SELECT `player_api_id` FROM `Player_Attributes` WHERE `overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`);	european_football_2
SELECT p.player_name, p.height FROM Player p WHERE p.height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT `preferred_foot` FROM `Player_Attributes` WHERE `potential` = (SELECT MIN(`potential`) FROM `Player_Attributes`);	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating BETWEEN 60 AND 65 AND pa.defensive_work_rate = 'low' AND p.player_name IS NOT NULL;	european_football_2
SELECT pa.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id ORDER BY pa.crossing DESC LIMIT 5;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY SUM(M.home_team_goal + M.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT      M.home_team_api_id,     COUNT(*) AS losses FROM      Match M WHERE      M.season = '2015/2016' AND      M.home_team_goal < M.away_team_goal GROUP BY      M.home_team_api_id ORDER BY      losses ASC LIMIT 1;	european_football_2
SELECT p.player_name, pa.penalties FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_name ORDER BY pa.penalties DESC LIMIT 10;	european_football_2
SELECT      T.team_long_name FROM      Team AS T JOIN      Match AS M ON T.team_api_id = M.away_team_api_id WHERE      M.league_id = (SELECT id FROM League WHERE name = 'Scotland Premier League')      AND M.season = '2009/2010'     AND M.away_team_goal > M.home_team_goal GROUP BY      T.team_long_name ORDER BY      COUNT(*) DESC LIMIT 1;	european_football_2
SELECT      `team_long_name`,      `buildUpPlaySpeed` FROM      `Team_Attributes` AS ta JOIN      `Team` AS t ON ta.`team_api_id` = t.`team_api_id` WHERE      `buildUpPlaySpeed` = (SELECT MAX(`buildUpPlaySpeed`) FROM `Team_Attributes`) ORDER BY      `buildUpPlaySpeed` DESC LIMIT 4;	european_football_2
SELECT L.name  FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY SUM(CASE WHEN M.home_team_goal = M.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1;	european_football_2
SELECT     P.player_name,     TIMESTAMPDIFF(YEAR, P.birthday, CURDATE()) AS age FROM     Player P JOIN     Player_Attributes PA ON     P.player_api_id = PA.player_api_id WHERE     PA.sprint_speed >= 97     AND PA.date BETWEEN '2013-01-01' AND '2015-12-31';	european_football_2
SELECT `name`, COUNT(*) AS total_matches FROM `League` JOIN `Match` ON `League`.`id` = `Match`.`league_id` GROUP BY `League`.`name` ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id  FROM Player_Attributes  WHERE substr(date, 1, 4) = '2010'  AND overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') GROUP BY player_api_id  ORDER BY overall_rating DESC  LIMIT 1;	european_football_2
SELECT team_fifa_api_id  FROM Team_Attributes  WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > (SELECT AVG(T2.buildUpPlayPassing) FROM Team_Attributes AS T2 WHERE strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing IS NOT NULL) AND strftime('%Y', T2.date) = '2012';	european_football_2
SELECT      (SUM(CASE WHEN `Player`.`birthday` BETWEEN '1987-01-01' AND '1992-12-31' THEN 1 ELSE 0 END) * 100.0) / COUNT(`Player`.`player_fifa_api_id`) AS left_foot_birth_years_percentage FROM      `Player` WHERE      `Player`.`player_api_id` IN (SELECT `player_api_id` FROM `Player_Attributes` WHERE `preferred_foot` = 'left');	european_football_2
SELECT      League.name AS league_name,      SUM(Match.home_team_goal + Match.away_team_goal) AS total_goals FROM      League JOIN      Match ON League.id = Match.league_id GROUP BY      League.name ORDER BY      total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(long_shots) AS average_long_shots FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'Ahmed Samir Farag';	european_football_2
SELECT p.player_name, AVG(pa.heading_accuracy) AS avg_heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 GROUP BY p.player_api_id ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT team_long_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE buildUpPlayDribblingClass = 'Normal' AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY chanceCreationPassing DESC;	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2009/2010' GROUP BY League.name HAVING AVG(Match.home_team_goal) > AVG(Match.away_team_goal)	european_football_2
SELECT `team_short_name` FROM `Team` WHERE `team_long_name` = 'Queens Park Rangers';	european_football_2
SELECT player_name, birthday FROM Player WHERE SUBSTR(birthday, 1, 7) = '1970-10';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_fifa_api_id` = (SELECT `player_fifa_api_id` FROM `Player` WHERE `player_name` = 'Franco Zennaro');	european_football_2
SELECT `buildUpPlayPositioningClass` FROM `Team_Attributes` WHERE `team_long_name` = 'ADO Den Haag' AND `buildUpPlayPositioningClass` = 'High' AND `team_api_id` IN (     SELECT `team_api_id`     FROM `Team`     WHERE `team_long_name` = 'ADO Den Haag' ) AND `date` = (     SELECT MAX(`date`)     FROM `Team_Attributes`     WHERE `team_api_id` IN (         SELECT `team_api_id`         FROM `Team`         WHERE `team_long_name` = 'ADO Den Haag'     ) );	european_football_2
SELECT `heading_accuracy`  FROM `Player_Attributes` WHERE `date` = '2014-09-18 00:00:00' AND `player_api_id` IN (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Francois Affolter' );	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Gabriel Tamas' AND strftime('%Y', pa.date) = '2011';	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Scotland Premier League'  AND Match.season = '2015/2016';	european_football_2
SELECT `Player`.`player_name`, `Player_Attributes`.`preferred_foot` FROM `Player` JOIN `Player_Attributes` ON `Player`.`player_api_id` = `Player_Attributes`.`player_api_id` WHERE `Player`.`birthday` = (SELECT MIN(`birthday`) FROM `Player`) ORDER BY `Player`.`birthday` LIMIT 1;	european_football_2
SELECT p.player_name, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*) FROM `Player` WHERE `weight` < 130 AND `preferred_foot` = 'left';	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `chanceCreationPassingClass` = 'Risky';	european_football_2
SELECT defensive_work_rate  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'David Wilson';	european_football_2
SELECT p.birthday FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT `League`.`name` FROM `League` JOIN `Country` ON `League`.`country_id` = `Country`.`id` WHERE `Country`.`name` = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal)  FROM Match  JOIN Country ON Match.country_id = Country.id  JOIN League ON Match.league_id = League.id  WHERE Country.name = 'Poland' AND League.name = 'Poland Ekstraklasa' AND Match.season = '2010/2011';	european_football_2
SELECT pa.player_api_id, p.player_name, AVG(pa.finishing) as avg_finishing_rate FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.height = (SELECT MAX(height) FROM Player) OR p.height = (SELECT MIN(height) FROM Player) GROUP BY pa.player_api_id, p.player_name ORDER BY avg_finishing_rate DESC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p WHERE p.height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam %' AND weight > 170;	european_football_2
SELECT P.player_name FROM Player_Attributes PA JOIN Player P ON PA.player_api_id = P.player_api_id WHERE PA.overall_rating > 80 AND strftime('%Y', PA.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT `potential` FROM `Player_Attributes` WHERE `player_fifa_api_id` = (     SELECT `player_fifa_api_id`     FROM `Player`     WHERE `player_api_id` = 505942 );	european_football_2
SELECT `player_name` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id` WHERE `preferred_foot` = 'left';	european_football_2
SELECT `Team.team_long_name` FROM `Team` JOIN `Team_Attributes` ON `Team.team_fifa_api_id` = `Team_Attributes.team_fifa_api_id` WHERE `Team_Attributes.buildUpPlaySpeedClass` = 'Fast';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_fifa_api_id` = `Team.team_fifa_api_id` WHERE `Team.team_short_name` = 'CLB';	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `buildUpPlayPassing` > 70;	european_football_2
SELECT AVG(t2.overall_rating) as average_rating FROM Player_Attributes t1 JOIN Player t2 ON t1.player_api_id = t2.player_api_id WHERE strftime('%Y', t1.date) BETWEEN '2010' AND '2015' AND t2.height > 170;	european_football_2
SELECT player_name, MIN(height) AS shortest_height FROM Player WHERE height = (SELECT MIN(height) FROM Player) GROUP BY player_name;	european_football_2
SELECT `Country.name`  FROM `League` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `League.name` = 'Italy Serie A';	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `buildUpPlaySpeed` = 31 AND `buildUpPlayDribbling` = 53 AND `buildUpPlayPassing` = 32;	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes`  WHERE `player_api_id` IN (     SELECT `player_api_id`      FROM `Player`      WHERE `player_name` = 'Aaron Doran' );	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT t.team_short_name FROM Team t JOIN Match m ON t.team_api_id = m.home_team_api_id WHERE m.home_team_goal = 10;	european_football_2
SELECT p.player_name, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = 61 AND pa.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE player_api_id = p.player_api_id AND potential = 61);	european_football_2
SELECT      (SELECT AVG(ball_control) FROM Player_Attributes pa      JOIN Player p ON pa.player_api_id = p.player_api_id      WHERE p.player_name = 'Abdou Diallo') -      (SELECT AVG(ball_control) FROM Player_Attributes pa      JOIN Player p ON pa.player_api_id = p.player_api_id      WHERE p.player_name = 'Aaron Appindangoye') AS ball_control_difference;	european_football_2
SELECT team_long_name  FROM Team  WHERE team_short_name = 'GEN';	european_football_2
SELECT      p1.player_name AS PlayerName1,      p2.player_name AS PlayerName2,      CASE          WHEN p1.birthday > p2.birthday THEN p1.player_name          ELSE p2.player_name      END AS OlderPlayer FROM      Player p1 JOIN      Player p2 ON      p1.player_api_id < p2.player_api_id WHERE      p1.player_name = 'Aaron Lennon' OR p2.player_name = 'Aaron Lennon';	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.preferred_foot = 'left' AND pa.attacking_work_rate = 'low';	european_football_2
SELECT `Country`.`name` AS country_name FROM `League` JOIN `Country` ON `League`.`country_id` = `Country`.`id` WHERE `League`.`name` = 'Belgium Jupiler League';	european_football_2
SELECT name FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Germany');	european_football_2
SELECT p.player_name, pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.birthday < '1986-01-01' AND pa.defensive_work_rate = 'high';	european_football_2
SELECT      p.player_name, pa.crossing FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE      p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY      pa.crossing DESC LIMIT 1;	european_football_2
SELECT `heading_accuracy` FROM `Player_Attributes` WHERE `player_api_id` = (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Ariel Borysiuk' );	european_football_2
SELECT COUNT(*) FROM Player WHERE height > 180 AND player_api_id IN (     SELECT player_api_id     FROM Player_Attributes     WHERE volleys > 70 );	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2008/2009' AND country_id = (SELECT id FROM Country WHERE name = 'Belgium');	european_football_2
SELECT `Player_Attributes`.long_passing FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.player_api_id = `Player`.player_api_id ORDER BY `Player`.birthday LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Belgium Jupiler League' AND SUBSTR(`date`, 1, 7) = '2009-04';	european_football_2
SELECT `name` FROM `League` WHERE `id` IN (     SELECT `league_id`     FROM `Match`     WHERE `season` = '2008/2009' ) GROUP BY `name` ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM Player_Attributes WHERE strftime('%Y', birthday) < '1986';	european_football_2
SELECT      ((         (SELECT `overall_rating`           FROM `Player_Attributes` pa           INNER JOIN `Player` p ON pa.player_api_id = p.player_api_id           WHERE p.player_name = 'Ariel Borysiuk') -          (SELECT `overall_rating`           FROM `Player_Attributes` pa           INNER JOIN `Player` p ON pa.player_api_id = p.player_api_id           WHERE p.player_name = 'Paulin Puel')     ) /      (SELECT `overall_rating`       FROM `Player_Attributes` pa       INNER JOIN `Player` p ON pa.player_api_id = p.player_api_id       WHERE p.player_name = 'Paulin Puel')     ) * 100	european_football_2
SELECT AVG(`buildUpPlaySpeed`) AS average_build_up_play_speed FROM `Team_Attributes` WHERE `team_long_name` = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating)  FROM `Player_Attributes` AS T1  JOIN `Player` AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(`crossing`) AS total_crossing_score FROM `Player_Attributes` JOIN `Player` AS T2 ON `Player_Attributes`.`player_api_id` = T2.`player_api_id` WHERE T2.`player_name` = 'Aaron Lennox';	european_football_2
SELECT MAX(`chanceCreationPassing`) AS highest_chance_creation_passing, `chanceCreationPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Ajax' GROUP BY `chanceCreationPassingClass` ORDER BY `chanceCreationPassing` DESC LIMIT 1;	european_football_2
SELECT `preferred_foot` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Abdou Diallo';	european_football_2
SELECT MAX(`overall_rating`)  FROM `Player_Attributes`  INNER JOIN `Player` AS T2 ON `Player_Attributes`.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(`Match`.`away_team_goal`) as average_goals FROM `Match` JOIN `Team` ON `Match`.`home_team_api_id` = `Team`.`team_api_id` WHERE `Team`.`team_fifa_api_id` = 673 AND `Match`.`country_id` = (SELECT `Country`.`id` FROM `Country` WHERE `Country`.`id` = (SELECT `League`.`country_id` FROM `League` WHERE `League`.`id` = (SELECT `Team`.`team_fifa_api_id` FROM `Team` WHERE `Team`.`team_long_name` = 'Parma')));	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%' ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT `overall_rating` FROM `Player_Attributes` WHERE `player_api_id` = (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Aaron Mooy' ) AND `date` LIKE '2016-02-04%';	european_football_2
SELECT `potential` FROM `Player_Attributes` WHERE `player_api_id` IN (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Francesco Parravicini' ) AND `date` = '2010-08-30 00:00:00';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id` WHERE `Player`.`player_name` = 'Francesco Migliore' AND `Player_Attributes`.`date` LIKE '2015-05-01%';	european_football_2
SELECT `defensive_work_rate` FROM `Player_Attributes` WHERE `player_api_id` IN (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Kevin Berigaud') AND `date` = '2013-02-22 00:00:00';	european_football_2
SELECT date FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Kevin Constant' ORDER BY crossing DESC LIMIT 1;	european_football_2
SELECT `buildUpPlaySpeedClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Willem II' AND `date` = '2012-02-22';	european_football_2
SELECT `buildUpPlayDribblingClass` FROM `Team_Attributes` WHERE `team_api_id` IN (SELECT `team_api_id` FROM `Team` WHERE `team_short_name` = 'LEI') AND `date` = '2015-09-10 00:00:00';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `Team.team_long_name` = 'FC Lorient' AND `Team_Attributes.date` LIKE '2010-02-22%';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'PEC Zwolle' AND `date` = '2013-09-20 00:00:00';	european_football_2
SELECT chanceCreationCrossingClass  FROM Team_Attributes  WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00';	european_football_2
SELECT `defenceAggressionClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Hannover 96' AND `date` LIKE '2015-09-10%';	european_football_2
SELECT AVG(`overall_rating`) AS avg_overall_rating FROM `Player_Attributes` WHERE `player_name` = 'Marko Arnautovic' AND DATE(`date`) BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT      (SUBTRACT((SELECT `overall_rating` FROM `Player_Attributes` WHERE `date` = '2013-07-12' AND `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Landon Donovan')),                (SELECT `overall_rating` FROM `Player_Attributes` WHERE `date` = '2013-07-12' AND `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Jordan Bowery')))     / (SELECT `overall_rating` FROM `Player_Attributes` WHERE `date` = '2013-07-12' AND `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Landon Donovan')) * 100) AS `percentage_difference` FROM DUAL;	european_football_2
SELECT p.player_name FROM Player p ORDER BY p.height DESC LIMIT 1;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p WHERE (strftime('%Y', CURRENT_TIMESTAMP, 'localtime') - strftime('%Y', p.birthday)) > 34;	european_football_2
SELECT SUM(`home_team_goal`) AS total_home_goals FROM `Match` JOIN `Player` ON `Match.home_player_1` = `Player.player_api_id` OR `Match.home_player_2` = `Player.player_api_id` WHERE `Player.player_name` = 'Aaron Lennon';	european_football_2
SELECT SUM(M.away_team_goal) AS total_away_goals FROM `Match` M JOIN `Player` P ON M.away_player_1 = P.player_api_id OR M.away_player_2 = P.player_api_id WHERE P.player_name IN ('Daan Smith', 'Filipe Ferreira');	european_football_2
SELECT SUM(CASE WHEN TIMESTAMPDIFF(YEAR, p.birthday, CURRENT_TIMESTAMP) < 31 THEN m.home_team_goal ELSE 0 END) AS total_home_goals FROM Match m JOIN Player p ON m.home_player_X1 = p.player_api_id OR m.home_player_X2 = p.player_api_id OR m.home_player_X3 = p.player_api_id OR m.home_player_X4 = p.player_api_id OR m.home_player_X5 = p.player_api_id OR m.home_player_X6 = p.player_api_id OR m.home_player_X7 = p.player_api_id OR m.home_player_X8 = p.player_api_id OR m.home_player_X9 = p.player_api_id OR m.home_player_X10 = p.player_api_id OR m.home_player_X11 = p.player_api_id WHERE TIMESTAMPDIFF(YEAR, p.birthday, CURRENT_TIMESTAMP) < 31;	european_football_2
SELECT `Player.player_name` FROM `Player` JOIN `Player_Attributes` ON `Player.player_api_id` = `Player_Attributes.player_api_id` WHERE `Player_Attributes.overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`);	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Match m ON p.player_api_id = m.home_player_X1 OR p.player_api_id = m.away_player_X1 WHERE pa.attacking_work_rate = 'high' AND (     (m.home_player_X1 IS NOT NULL AND pa.player_api_id = m.home_player_X1)     OR (m.away_player_X1 IS NOT NULL AND pa.player_api_id = m.away_player_X1)     AND EXISTS (         SELECT 1         FROM Match m2         WHERE m2.id = m.id         AND (m2.home_player_X1 IS NOT NULL AND m2.home_player_X1 = p.player_api_id)         OR (m2.away_player_X1 IS NOT NULL AND m2.away_player_X1 = p.player_api_id)         AND m2.home_player_X1 IS NOT NULL         AND m2.away_player_X1 IS NOT NULL         AND m2.home_player_X1 = m2.away_player_X1     ) GROUP BY p.player_name;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY p.birthday LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Country c ON p.player_fifa_api_id = c.id WHERE c.name = 'Belgium';	european_football_2
SELECT p.player_name, c.name AS country_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Country c ON p.player_fifa_api_id = c.id WHERE pa.vision > 89;	european_football_2
SELECT c.name, AVG(p.weight) as avg_weight FROM Player p JOIN Country c ON p.player_fifa_api_id = c.id GROUP BY c.name ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT `team_long_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `buildUpPlaySpeedClass` = 'Slow' GROUP BY `Team.team_long_name`;	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(`height`) AS average_height FROM `Player` JOIN `Country` ON `Player`.`player_fifa_api_id` = `Country`.`id` WHERE `Country`.`name` = 'Italy';	european_football_2
SELECT p.player_name FROM Player p WHERE p.height > 180 ORDER BY p.player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-01-01';	european_football_2
SELECT      (SELECT `jumping` FROM `Player_Attributes` WHERE `id` = 6) - (SELECT `jumping` FROM `Player_Attributes` WHERE `id` = 23) AS `jumping_difference`	european_football_2
SELECT pa.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.potential = (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right')   AND pa.preferred_foot = 'right' ORDER BY pa.overall_rating ASC LIMIT 5;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes WHERE preferred_foot = 'left') AND pa.preferred_foot = 'left';	european_football_2
SELECT      (COUNT(*) FILTER (WHERE `strength` > 80 AND `stamina` > 80) * 100.0) / COUNT(*) AS percentage_with_strength_and_stamina_above_80 FROM      `Player_Attributes`;	european_football_2
SELECT `Country`.`name` FROM `Country` JOIN `League` ON `Country`.`id` = `League`.`country_id` WHERE `League`.`name` = 'Poland Ekstraklasa';	european_football_2
SELECT      m.home_team_goal AS HomeTeamScore,      m.away_team_goal AS AwayTeamScore FROM      Match m JOIN      League l ON m.league_id = l.id WHERE      m.date LIKE '2008-09-24%' AND      l.name = 'Belgium Jupiler League';	european_football_2
SELECT      `sprint_speed`,      `agility`,      `acceleration` FROM      `Player_Attributes` pa JOIN      `Player` p ON pa.`player_api_id` = p.`player_api_id` WHERE      p.`player_name` = 'Alexis Blin';	european_football_2
SELECT `buildUpPlaySpeedClass` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_fifa_api_id` = `Team.team_fifa_api_id` WHERE `Team.team_long_name` = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE id = 1729)) AND season = '2015/2016';	european_football_2
SELECT MAX(home_team_goal) AS highest_home_score FROM Match WHERE league_id = (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Netherlands')) AND home_team_goal IS NOT NULL;	european_football_2
SELECT `Player_Attributes`.finishing, `Player_Attributes`.curve FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.player_api_id = `Player`.player_api_id WHERE `Player`.weight = (SELECT MAX(weight) FROM `Player`)	european_football_2
SELECT `League`.`name`, COUNT(`Match`.`id`) AS `game_count` FROM `League` JOIN `Match` ON `League`.`id` = `Match`.`league_id` WHERE `Match`.`season` = '2015/2016' GROUP BY `League`.`name` ORDER BY `game_count` DESC LIMIT 4;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)	european_football_2
SELECT `Player.player_name` FROM `Player` JOIN `Player_Attributes` ON `Player.player_api_id` = `Player_Attributes.player_api_id` WHERE `Player_Attributes.overall_rating` = (     SELECT MAX(`overall_rating`)     FROM `Player_Attributes` );	european_football_2
SELECT      (COUNT(CASE WHEN `Player`.height < 180 AND `Player_Attributes`.overall_rating > 70 THEN 1 END) * 100.0) / COUNT(`Player_Attributes`.id) AS percentage_of_strong_players FROM      `Player_Attributes` INNER JOIN      `Player` ON `Player_Attributes`.player_api_id = `Player`.player_api_id;	european_football_2
SELECT      CASE          WHEN SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END AND Admission = '+'                      AND ID IN (SELECT ID FROM Examination)                      AND ID IN (SELECT ID FROM Patient)         END) >          SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END AND Admission = '-'                     AND ID IN (SELECT ID FROM Examination)                      AND ID IN (SELECT ID FROM Patient)         END)         THEN 'In-patients'         ELSE 'Out-patients'     END AS MorePatientType,     ROUND((SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END AND Admission = '+'                     AND ID IN (SELECT ID FROM Examination)                      AND ID IN (SELECT ID FROM Patient)         END) -          SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END AND Admission = '-'                     AND ID IN (SELECT ID FROM Examination)                      AND ID IN (SELECT ID FROM Patient)         END) /         SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END AND Admission = '-'                     AND ID IN (SELECT ID FROM Examination)                      AND ID IN (SELECT ID FROM Patient)         END) * 100, 2) AS PercentageDeviation FROM     Patient;	thrombosis_prediction
SELECT      (SELECT COUNT(*) FROM Patient WHERE YEAR(Birthday) > 1930 AND SEX = 'F') * 100.0 /      (SELECT COUNT(*) FROM Patient WHERE SEX = 'F') AS PercentageOfFemalesBornAfter1930	thrombosis_prediction
SELECT      ROUND(         (COUNT(CASE WHEN P.Birthday BETWEEN '1930-01-01' AND '1940-12-31' AND P.Admission = '+' THEN 1 END) * 100.0) /          COUNT(CASE WHEN P.Birthday BETWEEN '1930-01-01' AND '1940-12-31' THEN 1 END),          2     ) AS Inpatient_Percentage FROM      Patient P JOIN      Examination E ON P.ID = E.ID WHERE      P.Birthday BETWEEN '1930-01-01' AND '1940-12-31';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN P.Diagnosis = 'SLE' AND E.Admission = '+' THEN E.ID END) /      COUNT(CASE WHEN P.Diagnosis = 'SLE' AND E.Admission = '-' THEN E.ID END)) AS OutpatientToInpatientRatio FROM      Patient P JOIN      Examination E ON P.ID = E.ID WHERE      P.Diagnosis = 'SLE'	thrombosis_prediction
SELECT p.`Diagnosis`, l.`Date` FROM `Patient` p JOIN `Laboratory` l ON p.`ID` = l.`ID` WHERE p.`ID` = 30609;	thrombosis_prediction
SELECT      p.SEX,      p.Birthday,      e.`Examination Date`,      e.Symptoms FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.ID = 163109;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > 500;	thrombosis_prediction
SELECT p.ID, TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RVVT = '+' AND TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) > 0;	thrombosis_prediction
SELECT p.ID, p.SEX, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 2;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1937 AND l.T-CHO >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN P.SEX = 'F' AND L.TP < 6.0 OR L.TP > 8.5 THEN 1 END) * 100.0) / COUNT(P.ID) AS percentage_female_with_abnormal_TP FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID	thrombosis_prediction
SELECT AVG(`aCL IgG`) AS avg_aCL_IgG FROM `Examination` WHERE `Diagnosis` LIKE '%MCTD%' OR `Diagnosis` LIKE '%SLE%' OR `Diagnosis` LIKE '%PSS%' AND SUBSTR(`Patient.Birthday`, 6, 2) - SUBSTR(CURRENT_DATE, 6, 2) >= 50;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND YEAR(p.Description) = 1997 AND p.Admission = '-';	thrombosis_prediction
SELECT      MIN(YEAR(`First Date`) - YEAR(`Birthday`)) AS YoungestAgeAtAdmission FROM      Patient WHERE      `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 1 AND P.SEX = 'F' AND YEAR(P.Description) = 1997;	thrombosis_prediction
SELECT MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS AgeGap FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE `TG` >= 200 ) AND ID IN (     SELECT ID     FROM Patient )	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, e.Symptoms, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT     COUNT(LabPatient.ID) / 12 AS AverageMonthlyMalePatients FROM     Laboratory LabPatient JOIN     Patient Patient ON LabPatient.ID = Patient.ID WHERE     Patient.SEX = 'M'     AND LabPatient.Date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY     YEAR(LabPatient.Date);	thrombosis_prediction
SELECT p.Birthday, l.Date FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SJS' ORDER BY p.Birthday LIMIT 1;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `SEX` = 'M' AND `UA` <= 8.0 THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN `SEX` = 'F' AND `UA` <= 6.5 THEN 1 ELSE 0 END), 0)) AS male_to_female_ratio FROM      `Patient`	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE p.First_Date IS NOT NULL AND e.Examination_Date IS NULL AND DATEDIFF(year, p.First_Date, COALESCE(e.Examination_Date, CURDATE())) >= 1;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Birthday < '1974-01-01' AND E.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.T_BIL >= 2.0;	thrombosis_prediction
SELECT `Diagnosis`, COUNT(`Diagnosis`) AS DiseaseCount FROM `Examination` WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY `Diagnosis` ORDER BY DiseaseCount DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(SUBTRACT(YEAR(CURRENT_DATE), YEAR(`Birthday`))) AS AverageAge FROM `Patient` WHERE `ID` IN (     SELECT `ID`     FROM `Laboratory`     WHERE `Date` BETWEEN '1991-10-01' AND '1991-10-30' ) AND `Birthday` IS NOT NULL;	thrombosis_prediction
SELECT      p.Birthday,      (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) AS Age,      e.Diagnosis FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.HGB = (SELECT MAX(HGB) FROM Examination)	thrombosis_prediction
SELECT `ANA` FROM `Examination` WHERE `ID` = 3605340 AND `ANA Pattern` = 'P' AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT T.Laboratory.T-CHO FROM `Laboratory` AS T JOIN `Patient` AS P ON T.ID = P.ID WHERE P.ID = 2927464 AND T.Date = '1995-09-04' AND T.T-CHO < 250;	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis LIKE '%AORTITIS%' ORDER BY p.First Date LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM `Examination` WHERE `Diagnosis` = 'SLE' AND `Description` = '1994-02-19' AND `Examination.Date` = '1993-11-12'	thrombosis_prediction
SELECT P.SEX  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GPT = 9 AND L.Date = '1992-06-12';	thrombosis_prediction
SELECT      (YEAR('1991-10-21') - YEAR(P.Birthday)) AS AgeAtTest FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.UA = '8.4' AND L.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(`Laboratory`.`ID`) AS `Total_Laboratory_Tests` FROM `Laboratory` WHERE `Laboratory`.`ID` IN (     SELECT `Patient`.`ID`     FROM `Patient`     WHERE `Patient`.`First Date` = '1991-06-13' AND `Patient`.`Diagnosis` = 'SJS' ) AND `Laboratory`.`Date` BETWEEN '1995-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT p.`Diagnosis` AS Original_Diagnosis FROM `Patient` p JOIN `Examination` e ON p.`ID` = e.`ID` WHERE e.`Examination Date` = '1997-01-27' AND p.`First Date` = '1997-01-27';	thrombosis_prediction
SELECT Symptoms  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.Birthday = '1959-03-01' AND Examination.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT      (SUM(CASE WHEN L.Date LIKE '1981-11-%' THEN L.T-CHO ELSE 0 END) - SUM(CASE WHEN L.Date LIKE '1981-12-%' THEN L.T-CHO ELSE 0 END)) /      SUM(CASE WHEN L.Date LIKE '1981-11-%' THEN L.T-CHO ELSE 1 END) AS DecreaseRate FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Birthday = '1959-02-18' AND L.T-CHO IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'Behcet' AND e.Examination_Date BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.GPT > 30 AND L.ALB < 4 AND L.Date BETWEEN '1987-07-06' AND '1996-01-31' AND EXISTS (     SELECT 1     FROM Patient P     WHERE P.ID = E.ID     AND P.First Date BETWEEN '1987-07-06' AND '1996-01-31' );	thrombosis_prediction
SELECT `ID` FROM `Patient` WHERE `SEX` = 'F' AND YEAR(`Birthday`) = 1964 AND `Admission` = '+' ORDER BY `ID`;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `ANA` = 'S'    AND Thrombosis = 2    AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination);	thrombosis_prediction
SELECT      ROUND((SUM(CASE WHEN L.UA <= 6.5 AND L.U-PRO > 0 AND L.U-PRO < 30 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS Percentage FROM      Laboratory L JOIN      Examination E ON L.ID = E.ID JOIN      Patient P ON E.ID = P.ID WHERE      L.U-PRO > 0 AND L.U-PRO < 30;	thrombosis_prediction
SELECT      ROUND(         (SUM(CASE WHEN p.`Diagnosis` = 'BEHCET' THEN 1 ELSE 0 END) * 100.0) /          COUNT(*),         2     ) AS PercentageOfMalePatientsDiagnosedWithBEHCET FROM      `Patient` p WHERE      p.`SEX` = 'M'      AND YEAR(p.`First Date`) = 1981	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Description, p.First_Date, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND       l.Date LIKE '1991-10%' AND       l.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) BETWEEN 1980 AND 1989 AND ID NOT IN (SELECT ID FROM Examination WHERE `ANA Pattern` = 'P');	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'PSS' AND l.CRP > 2 AND l.CRE = 1 AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(ALB)  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Patient.SEX = 'F'  AND Laboratory.PLT > 400  AND Patient.Diagnosis = 'SLE';	thrombosis_prediction
SELECT MAX(Symptoms)  FROM Examination  WHERE `Diagnosis` = 'SLE';	thrombosis_prediction
SELECT p.Description, pa.Diagnosis FROM Patient p JOIN Examination pa ON p.ID = pa.ID WHERE p.ID = 48473 ORDER BY p.Description LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE YEAR(Laboratory.Date) = 1997  AND Laboratory.TP > 6 AND Laboratory.TP < 8.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Symptoms` LIKE '%ITP%' THEN 1 ELSE 0 END) / SUM(CASE WHEN `Diagnosis` LIKE '%SLE%' THEN 1 ELSE 0 END)) * 100 AS ProportionOfSLEWithThrombocytopenia FROM      Examination;	thrombosis_prediction
SELECT      ROUND((SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) / COUNT(SEX)) * 100, 2) AS Percentage_Women FROM      Patient WHERE      YEAR(Birthday) = 1980 AND      Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'M'  AND p.Diagnosis = 'Behcet disease'  AND e.Diagnosis LIKE '%Behcet%' AND p.Admission = '-'  AND e.Diagnosis LIKE '%1995%' OR e.Diagnosis LIKE '%1996%' OR e.Diagnosis LIKE '%1997%';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.SEX = 'F' AND Examination.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination.Date`, `Patient.First Date`) as DaysToEvaluation FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Patient.ID` = 821298 AND `Examination.Date` IS NOT NULL ORDER BY `Examination.Date` ASC LIMIT 1;	thrombosis_prediction
SELECT      CASE          WHEN p.SEX = 'M' AND l.UA > 8.0 THEN 'Yes'         WHEN p.SEX = 'F' AND l.UA > 6.5 THEN 'Yes'         ELSE 'No'     END AS IsUricAcidNormal FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID = 57266;	thrombosis_prediction
SELECT `Laboratory`.`Date` FROM `Laboratory` JOIN `Patient` ON `Laboratory`.`ID` = `Patient`.`ID` WHERE `Patient`.`ID` = 48473 AND `Laboratory`.`GOT` >= 60;	thrombosis_prediction
SELECT p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND YEAR(l.Date) = 1994;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GPT >= 60;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 60 ORDER BY p.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) AS Average_LDH FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT      p.ID,     TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.LDH BETWEEN 600 AND 800     AND TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) > 0;	thrombosis_prediction
SELECT      P.ID,      P.Admission,      L.ALP FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.ALP < 300	thrombosis_prediction
SELECT      p.ID  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      p.Birthday = '1982-04-01'      AND l.ALP < 300;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.TP < 6.0;	thrombosis_prediction
SELECT      P.ID,      P.SEX,      L.TP,      (L.TP - 8.5) AS TP_Deviation FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      P.SEX = 'F' AND      L.TP > 8.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND (l.ALB <= 3.5 OR l.ALB >= 5.5) ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      CASE          WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Range'         ELSE 'Out of Range'     END AS Albumin_Status FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      YEAR(p.Birthday) = 1982;	thrombosis_prediction
SELECT      ROUND(         (COUNT(*) * 100.0) /          (SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'F'),         2     ) AS percentage_female_with_high_UA FROM      `Patient` WHERE      `SEX` = 'F' AND      (`UA` > 6.5 OR `UA` IS NULL);	thrombosis_prediction
SELECT AVG(L.UA) AS Average_UA FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.UA <      (CASE P.SEX         WHEN 'M' THEN 8.0         ELSE 6.5     END) AND P.SEX IN ('M', 'F') AND L.Date = (     SELECT MAX(L2.Date)     FROM Laboratory L2     WHERE L2.ID = L.ID );	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN = 29;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      p.Diagnosis = 'RA' AND      e.UN < 30;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.ID = Patient.ID AND CRE >= 1.5 );	thrombosis_prediction
SELECT      (SUM(CASE WHEN p.SEX = 'M' AND l.CRE >= 1.5 THEN 1 ELSE 0 END)      >      SUM(CASE WHEN p.SEX = 'F' AND l.CRE >= 1.5 THEN 1 ELSE 0 END)) AS male_more_than_female FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.CRE >= 1.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory)	thrombosis_prediction
SELECT      GROUP_CONCAT(DISTINCT p.ID) AS PatientID,      p.SEX  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      l.T_BIL >= 2.0  GROUP BY      p.SEX;	thrombosis_prediction
SELECT `Patient.ID`, `Laboratory.T-CHO` FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Patient.Birthday` = (SELECT MIN(`Birthday`) FROM `Patient`) AND `Laboratory.T-CHO` = (SELECT MAX(`T-CHO`) FROM `Laboratory` WHERE `Patient.ID` = `Laboratory.ID`) GROUP BY `Patient.ID`, `Laboratory.T-CHO` ORDER BY `Patient.Birthday` DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(DIVIDE(SUBTRACT(YEAR(NOW()), YEAR(`Birthday`)), COUNT(`ID`)))  FROM `Patient`  WHERE `SEX` = 'M' AND `T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG > 300;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG >= 200 AND (YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.CPK < 250;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P WHERE P.SEX = 'M' AND YEAR(P.Birthday) BETWEEN 1936 AND 1956 AND P.ID IN (     SELECT L.ID     FROM Laboratory L     WHERE L.CPK >= 250 );	thrombosis_prediction
SELECT      p.ID,      p.SEX,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Birthday IS NOT NULL AND      l.GLU >= 180 AND      l.T-CHO < 250;	thrombosis_prediction
SELECT      p.ID,      l.GLU FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.GLU < 180     AND YEAR(p.Description) = 1991 ORDER BY      p.ID;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.WBC <= 3.5 OR l.WBC >= 9.0 GROUP BY      p.SEX, p.Birthday ORDER BY      p.SEX, p.Birthday ASC;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age,      e.Diagnosis FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.RBC < 3.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Admission FROM Patient p WHERE p.SEX = 'F' AND        (SUBSTR(p.Birthday, 6, 2) - EXTRACT(YEAR FROM CURRENT_DATE)) >= 50 AND        EXISTS (SELECT 1 FROM Laboratory l WHERE p.ID = l.ID AND (l.RBC <= 3.5 OR l.RBC >= 6.0))	thrombosis_prediction
SELECT Patient.ID, Patient.SEX FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.HGB < 10 AND Patient.Admission = '-';	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'SLE' AND p.Birthday IN (     SELECT MIN(Birthday)     FROM Patient     WHERE Diagnosis = 'SLE'     AND HGB > 10 AND HGB < 17 ) ORDER BY p.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID IN (         SELECT              l2.ID         FROM              Laboratory l2         WHERE              l2.HCT >= 52         GROUP BY              l2.ID         HAVING              COUNT(l2.ID) > 2     ) GROUP BY      p.ID;	thrombosis_prediction
SELECT AVG(HCT) as AverageHematocritLevel FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) AS BelowNormalCount,     SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS AboveNormalCount FROM Laboratory WHERE PLT < 100 OR PLT > 400;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = 1984 AND SUBSTR(p.Birthday, 6, 2) = '04' AND p.SEX = 'F' AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT     ROUND((SUM(CASE WHEN `PT` >= 14 AND `SEX` = 'F' THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN `PT` >= 14 THEN 1 ELSE 0 END), 2) AS Percentage_Female_Abnormal_PT FROM     `Patient` WHERE     `Birthday` <= DATE_SUB(CURDATE(), INTERVAL 55 YEAR)     AND `SEX` = 'F';	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.First_Date > '1992-12-31' AND l.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.APTT > 45 AND p.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT l.ID)  FROM Laboratory AS l  JOIN Patient AS p ON l.ID = p.ID  WHERE p.SEX = 'M'  AND l.WBC > 3.5 AND l.WBC < 9.0  AND (l.FG <= 150 OR l.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Birthday > '1980-01-01'  AND l.FG < 150 OR l.FG > 450;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.U_PRO >= 30;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.`U-PRO` BETWEEN 0 AND 30 AND Examination.Diagnosis = 'SLE';	thrombosis_prediction
SELECT DISTINCT `Patient.ID` FROM `Patient` JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE `Examination.aCL IgG` >= 2000;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`aCL IgG` BETWEEN 900 AND 2000 AND E.`Symptoms` IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.IGA BETWEEN 80 AND 500 AND e.IGA = (SELECT MAX(IGA) FROM Examination WHERE IGA BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.`First Date` >= '1990-01-01' AND e.`aCL IgA` > 80 AND e.`aCL IgA` < 500;	thrombosis_prediction
SELECT      p.Diagnosis,      COUNT(*) AS DiseaseCount FROM      Examination e JOIN      Patient p ON e.ID = p.ID WHERE      e.aCL_IgM <= 40 OR e.aCL_IgM >= 400 GROUP BY      p.Diagnosis ORDER BY      DiseaseCount DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE `Description` IS NULL AND `CRP` = '+';	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.CRE >= 1.5 AND SUBDATE(CURDATE(), INTERVAL 70 YEAR) > P.Birthday;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Diagnosis LIKE '%RA%' AND e.RF IN('-', '+-') AND e.KCT = '+';	thrombosis_prediction
SELECT p.ID, p.Diagnosis FROM Patient p WHERE p.Birthday > '1985-01-01' AND p.Diagnosis LIKE '%RA%' AND p.Diagnosis LIKE '%+-%';	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE p.SEX = 'F' AND SUBSTR(p.Birthday, 6, 2) < SUBSTR(CURDATE(), 6, 2) - 60 AND EXISTS (     SELECT 1     FROM Laboratory l     WHERE l.ID = p.ID AND l.RF < 20 )	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.RF < 20 AND p.ID NOT IN (SELECT ID FROM Examination WHERE Thrombosis = 1);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.C3 > 35 AND e.ANA_Pattern = 'P';	thrombosis_prediction
SELECT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.ID IN (     SELECT ID     FROM Patient     WHERE HCT < 29 OR HCT > 52 ) AND E.aCL_IgA = (     SELECT MAX(aCL_IgA)     FROM Examination     WHERE aCL_IgA IS NOT NULL ) ORDER BY E.aCL_IgA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`Thrombosis` = 1 AND e.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.RNP IN ('-', '+-') AND Patient.Admission = '+';	thrombosis_prediction
SELECT p.Birthday  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.RNP NOT IN('-', '+-')  ORDER BY p.Birthday  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE SM IN('-', '+-') AND Thrombosis = 0;	thrombosis_prediction
SELECT ID FROM Patient WHERE SM NOT IN ('negative', '0') ORDER BY Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`Examination Date` > '1997-01-01' AND E.SC170 IN('negative', '0');	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND e.SC170 IN ('negative', '0') AND e.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.SSA IN ('-', '+')  AND p.First_Date < '2000-01-01';	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SSA NOT IN('negative', '0') AND p.First_Date IS NOT NULL ORDER BY p.First_Date ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.ANA_Pattern LIKE '%-%' OR e.ANA_Pattern LIKE '%+-'  AND e.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.SSB IN ('negative', '0') AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CENTROMEA IN('-', '+-') AND L.SSB IN('-', '+-') AND P.SEX = 'M';	thrombosis_prediction
SELECT      P.ID,      P.Diagnosis FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.DNA < 8 AND Patient.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`IGG` BETWEEN 900 AND 2000 AND p.`Admission` = '+';	thrombosis_prediction
SELECT      ROUND((COUNT(CASE WHEN E.GOT >= 60 THEN E.ID END) / COUNT(DISTINCT P.ID)) * 100, 2) AS percentage_abnormal_GOT_SLE FROM      Examination E JOIN      Patient P ON E.ID = P.ID WHERE      E.GOT >= 60 AND P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT MIN(`Birthday`) AS Youngest_Birthday FROM `Patient` WHERE `ID` IN (     SELECT `Patient.ID`     FROM `Patient`     JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID`     WHERE `Laboratory.GPT` >= 60 ) ORDER BY `Birthday` DESC LIMIT 1;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT BETWEEN 0 AND 60 GROUP BY p.ID, p.Birthday ORDER BY AVG(l.GPT) DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT < 60 AND P.SEX = 'M';	thrombosis_prediction
SELECT p.ID, MIN(l.Date) AS FirstRecordedDate FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH < 500 GROUP BY p.ID ORDER BY l.LDH DESC, l.Date ASC LIMIT 1;	thrombosis_prediction
SELECT MAX(`Date`)  FROM `Laboratory`  WHERE `LDH` >= 500  AND `ID` IN (SELECT `ID` FROM `Examination` WHERE `ID` = (SELECT MAX(`First Date`) FROM `Patient`));	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.ALP >= 300 AND Patient.Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '-' AND l.ALP < 300;	thrombosis_prediction
SELECT DISTINCT p.Description FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  JOIN Examination E ON P.ID = E.ID  WHERE P.Diagnosis = 'SJS' AND L.TP > 6.0 AND L.TP < 8.5;	thrombosis_prediction
SELECT `Examination.Date` FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Laboratory.ALB` BETWEEN 3.5 AND 5.5 AND `Laboratory.ALB` = (SELECT MAX(`Laboratory.ALB`)                         FROM `Laboratory`                         WHERE `Laboratory.ALB` BETWEEN 3.5 AND 5.5                         AND `Laboratory.ID` = `Examination.ID`) ORDER BY `Laboratory.ALB` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT E.aCL_IgG, E.aCL_IgM, E.aCL_IgA FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.SEX = 'F' AND P.UA > 6.50 AND P.UA = (SELECT MAX(UA) FROM Patient P2 WHERE P2.SEX = 'F' AND P2.UA > 6.50);	thrombosis_prediction
SELECT MAX(`ANA`) AS HighestANACount FROM `Examination` WHERE `CRE` < 1.5;	thrombosis_prediction
SELECT `Patient`.`ID` FROM `Patient` JOIN `Examination` ON `Patient`.`ID` = `Examination`.`ID` WHERE `Laboratory`.`CRE` < 1.5 AND `Examination`.`aCL IgA` = (SELECT MAX(`aCL IgA`) FROM `Examination` WHERE `Examination`.`ID` = `Patient`.`ID`);	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.T_BIL >= 2.0 AND E.ANA_Pattern LIKE '%P%';	thrombosis_prediction
SELECT E.aCL_IgG FROM Examination E JOIN Patient P ON E.ID = P.ID JOIN (     SELECT Patient.ID     FROM Laboratory L     JOIN Patient P ON L.ID = P.ID     WHERE L.T_BIL < 2.0     GROUP BY P.ID     ORDER BY MAX(L.T_BIL) DESC     LIMIT 1 ) AS NormalBilirubinPatients ON E.ID = NormalBilirubinPatients.ID WHERE E.ANA IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.T-CHO >= 250 AND e.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.T-CHO < 250 AND e.ANA_Pattern = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.TG < 200 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG < 200 GROUP BY p.Diagnosis ORDER BY MAX(l.TG) DESC LIMIT 1;	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 0 AND E.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.CPK < 250 AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND l.GLU > 180;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GLU < 180) AND ID NOT IN (SELECT ID FROM Examination WHERE Thrombosis = 1);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RBC <= 3.5 OR l.RBC >= 6.0 AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.PLT > 100 AND e.PLT < 400 AND e.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT p.ID, l.PLT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'MCTD' AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT AVG(`PT`) AS AverageProthrombinTime FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Patient.SEX` = 'M' AND `Laboratory.PT` < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis IN (1, 2) AND l.PT < 14;	thrombosis_prediction
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design Department';	student_club
SELECT COUNT(DISTINCT m.member_id) AS student_count FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN `event` e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN `event` e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium';	student_club
SELECT e.event_name, COUNT(a.link_to_event) AS attendance_count FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' GROUP BY e.event_id, e.event_name ORDER BY attendance_count DESC LIMIT 1;	student_club
SELECT m.email, m.position, m.zip, maj.college FROM `member` m JOIN `major` maj ON m.link_to_major = maj.major_id WHERE m.position = 'Vice President';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(*)  FROM `event` e  JOIN `attendance` a ON e.event_id = a.link_to_event  JOIN `member` m ON a.link_to_member = m.member_id  WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison'  AND e.event_name LIKE '%Student_Club%' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(*)  FROM event  WHERE type = 'Meeting'  AND event_id IN (     SELECT link_to_event      FROM attendance      GROUP BY link_to_event      HAVING COUNT(link_to_member) > 10 );	student_club
SELECT event_name FROM event WHERE event_id IN (     SELECT link_to_event     FROM attendance     GROUP BY link_to_event     HAVING COUNT(link_to_member) > 20 ) AND type != 'Fundraiser';	student_club
SELECT AVG(attendee_count) AS average_attendance FROM (     SELECT e.event_id, COUNT(a.link_to_member) AS attendee_count     FROM event e     LEFT JOIN attendance a ON e.event_id = a.link_to_event     WHERE e.type = 'Meeting' AND YEAR(e.event_date) = 2020     GROUP BY e.event_id ) AS meeting_attendance;	student_club
SELECT expense_description, MAX(cost) AS highest_cost FROM expense WHERE link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event)) GROUP BY expense_description ORDER BY highest_cost DESC LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN `event` e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Law and Constitutional Studies';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN major ma ON m.link_to_major = ma.major_id WHERE m.member_id = 'rec280Sk7o31iG0Tx';	student_club
SELECT `major`.`college` FROM `major` JOIN `member` ON `major`.`major_id` = `member`.`link_to_major` WHERE `member`.`member_id` = 'rec2a03QXbFQAUZ7X';	student_club
SELECT SUM(i.amount) AS total_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT SUM(b.spent) AS total_spent_on_food FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT      z.city,      z.state FROM      member m JOIN      zip_code z ON m.zip = z.zip_code WHERE      m.position = 'President'	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM member WHERE zip IN (     SELECT zip_code     FROM zip_code     WHERE state = 'Illinois' );	student_club
SELECT SUM(b.spent) AS total_spent_on_advertisement FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Advertisement';	student_club
SELECT m.link_to_major, ma.department  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE m.first_name = 'Pierce' OR m.last_name = 'Guidi';	student_club
SELECT SUM(b.amount) AS total_budgeted_amount FROM `budget` b JOIN `event` e ON b.`link_to_event` = e.`event_id` WHERE e.`event_name` = 'October Speaker';	student_club
SELECT      e.event_name,      e.event_date,      e.type,      e.notes,      e.location,      e.status,      e.event_id,      exp.expense_id,      exp.expense_description,      exp.expense_date,      exp.cost,      exp.approved FROM      event e JOIN      expense exp ON e.event_id = exp.link_to_budget WHERE      e.event_name = 'October Meeting'      AND e.event_date = '2019-10-08'      AND exp.approved = 'true';	student_club
SELECT SUM(cost) / COUNT(*) AS average_cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Elijah' AND member.last_name = 'Allen' AND        CAST(SUBSTRING(expense.expense_date, 6, 2) AS INTEGER) IN (9, 10);	student_club
SELECT     (SUM(CASE WHEN SUBSTRING(event_date, 1, 4) = '2019' THEN spent ELSE 0 END) -      SUM(CASE WHEN SUBSTRING(event_date, 1, 4) = '2020' THEN spent ELSE 0 END)) AS total_spent_difference FROM     budget WHERE     event_status = 'Closed';	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT expense.cost  FROM expense  JOIN event ON expense.link_to_event = event.event_id  WHERE event.event_name = 'Posters' AND expense.expense_date = '2019-09-04';	student_club
SELECT `remaining` FROM `budget` WHERE `category` = 'Food' AND `amount` = (SELECT MAX(`amount`) FROM `budget` WHERE `category` = 'Food');	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND notes = 'Fundraising';	student_club
SELECT COUNT(*)  FROM major  WHERE `college` = 'College of Humanities and Social Sciences';	student_club
SELECT `phone`  FROM `member`  WHERE `first_name` = 'Carlo' AND `last_name` = 'Jacobs';	student_club
SELECT `county` FROM `zip_code` JOIN `member` ON `zip_code.zip_code` = `member.zip` WHERE `member.first_name` = 'Adela' AND `member.last_name` = 'O\'Gallagher';	student_club
SELECT COUNT(*) FROM budget WHERE link_to_event IN (     SELECT event_id     FROM event     WHERE event_name = 'November Meeting' ) AND remaining < 0;	student_club
SELECT SUM(`amount`) AS total_budget_amount FROM `budget` WHERE `event_name` = 'September Speaker';	student_club
SELECT e.event_status  FROM event e  JOIN expense ex ON e.event_id = ex.link_to_budget  WHERE ex.expense_description = 'Post Cards, Posters'  AND ex.expense_date = '2019-08-20';	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Brent' AND member.last_name = 'Thomason';	student_club
SELECT COUNT(*) FROM `member` WHERE `link_to_major` IN (     SELECT `major_id`     FROM `major`     WHERE `major_name` = 'Business' ) AND `t_shirt_size` = 'Medium';	student_club
SELECT `type` FROM `member` JOIN `zip_code` ON `member.zip` = `zip_code.zip_code` WHERE `first_name` = 'Christof' AND `last_name` = 'Nielson';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT `state` FROM `member` JOIN `zip_code` ON `member.zip` = `zip_code.zip_code` WHERE `member_id` = 'rec1x5zBFIqoOuPW8';	student_club
SELECT m.first_name, m.last_name, m.position, ma.department FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.position = 'President';	student_club
SELECT date_received FROM income WHERE source = 'Dues' AND first_name = 'Connor' AND last_name = 'Hilton' LIMIT 1;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN b.category = 'Advertisement' AND e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END)      / SUM(CASE WHEN b.category = 'Advertisement' AND e.event_name = 'October Meeting' THEN b.amount ELSE 0 END)) AS ratio FROM      budget b JOIN      event e ON b.link_to_event = e.event_id;	student_club
SELECT      (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) /       (SELECT SUM(amount) FROM budget WHERE event_name = 'November Speaker')) * 100 AS parking_budget_percentage FROM      budget b WHERE      b.event_name = 'November Speaker'	student_club
SELECT SUM(`cost`) AS total_pizza_cost FROM `expense` WHERE `expense_description` = 'Pizza';	student_club
SELECT COUNT(DISTINCT `member_id`)  FROM `member`  WHERE `zip` IN (SELECT `zip_code` FROM `zip_code` WHERE `zip_code` = 544);	student_club
SELECT `department` FROM `major` WHERE `college` = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT `expense_description`, `expense_id`, `cost` FROM `expense` WHERE `link_to_budget` = (SELECT `budget_id` FROM `budget` ORDER BY `remaining` ASC LIMIT 1);	student_club
SELECT m.member_id, m.first_name, m.last_name, m.email FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT `college` FROM `major` JOIN `member` ON `member.link_to_major` = `major.major_id` GROUP BY `college` ORDER BY COUNT(`member.member_id`) DESC LIMIT 1;	student_club
SELECT major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE phone = '809-555-3360';	student_club
SELECT `event_name`, MAX(`amount`) AS `highest_budget_amount` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` GROUP BY `event_name` ORDER BY `highest_budget_amount` DESC LIMIT 1;	student_club
SELECT e.expense_description, e.expense_date, e.cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT a.link_to_member) AS member_count FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT date_received  FROM income  WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Casey' AND last_name = 'Mason');	student_club
SELECT COUNT(*) FROM `member` WHERE `zip` IN (     SELECT `zip_code`     FROM `zip_code`     WHERE `short_state` = 'MD' );	student_club
SELECT COUNT(*) FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE member.phone = '954-555-6240';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT      `event_id`,      `event_name`,      MAX(DIVIDE(`spent`, `amount`)) AS spend_to_budget_ratio FROM      `event` JOIN      `budget` ON `event.event_id` = `budget.link_to_event` WHERE      `event.status` = 'Closed' GROUP BY      `event_id`, `event_name` ORDER BY      spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM `member`  WHERE `position` = 'President'  AND `link_to_major` IN (SELECT `major_id` FROM `major` WHERE `major_id` LIKE 'rec%');	student_club
SELECT MAX(spent) AS highest_budget_spent FROM budget;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT SUM(spent) AS total_spent_on_food FROM budget WHERE category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code zc ON m.zip = zc.zip_code WHERE zc.city = 'Georgetown' AND zc.state = 'South Carolina';	student_club
SELECT SUM(`amount`) AS total_income FROM `income` JOIN `member` ON `income`.`link_to_member` = `member`.`member_id` WHERE `member`.`member_id` = 'reccW7q1KkhSKZsea';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(cost) AS total_expense FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN event e ON m.member_id = e.event_id WHERE e.event_name = 'Yearly Kickoff' AND m.position = 'Member';	student_club
SELECT m.first_name, m.last_name, i.amount AS income_amount, i.source FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE m.position = 'Member' ORDER BY i.amount DESC LIMIT 1;	student_club
SELECT event_name, MIN(cost) AS lowest_cost FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.cost IS NOT NULL GROUP BY event_name ORDER BY lowest_cost ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.cost ELSE 0 END) / SUM(b.cost) * 100) AS percentage_cost_of_yearly_kickoff FROM      event e JOIN      budget b ON e.event_id = b.link_to_event	student_club
SELECT SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) AS finance_to_physics_ratio FROM major;	student_club
SELECT source, SUM(amount) as total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM `member` WHERE position = 'Secretary';	student_club
SELECT COUNT(*) FROM `member` m JOIN `major` ma ON m.`link_to_major` = ma.`major_id` WHERE ma.`major_name` = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Community Theater' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(a.link_to_event) AS events_attended, m.major_name FROM `attendance` a JOIN `member` m ON a.link_to_member = m.member_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi' JOIN `major` ma ON m.link_to_major = ma.major_id;	student_club
SELECT AVG(spent) AS average_spent FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT event_name  FROM `event`  JOIN `budget` ON `event`.`event_id` = `budget`.`link_to_event`  WHERE `budget`.`category` = 'Advertisement'  ORDER BY `budget`.`spent` DESC  LIMIT 1;	student_club
SELECT EXISTS (     SELECT 1      FROM event      JOIN attendance ON event.event_id = attendance.link_to_event      JOIN member ON attendance.link_to_member = member.member_id      WHERE event.event_name = 'Women''s Soccer'        AND member.first_name = 'Maya'        AND member.last_name = 'Mclean' ) AS attended;	student_club
SELECT      ROUND((SUM(CASE WHEN event.event_name LIKE '%Community Service%' THEN 1 ELSE 0 END) * 100.0) / COUNT(event.event_id), 2) AS percentage_community_service_events FROM      event WHERE      event.event_date BETWEEN '2019-01-01' AND '2019-12-31'	student_club
SELECT SUM(e.cost) AS total_poster_cost FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE e.event_name = 'September Speaker' AND ex.expense_description = 'Posters';	student_club
SELECT `t_shirt_size`, COUNT(`t_shirt_size`) as `count` FROM `member` GROUP BY `t_shirt_size` ORDER BY `count` DESC LIMIT 1;	student_club
SELECT event_name FROM event WHERE status = 'Closed' AND event_id IN (     SELECT link_to_event     FROM budget     WHERE remaining < 0     AND link_to_event IN (         SELECT link_to_event         FROM budget         ORDER BY remaining ASC         LIMIT 1     ) ) ORDER BY remaining ASC LIMIT 1;	student_club
SELECT expense.expense_description, SUM(expense.cost) AS total_value FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' AND expense.approved = 'true' GROUP BY expense.expense_description;	student_club
SELECT `category`, SUM(`amount`) AS total_budgeted FROM `budget` WHERE `link_to_event` IN (     SELECT `event_id`     FROM `event`     WHERE `event_name` = 'April Speaker' ) GROUP BY `category` ORDER BY `total_budgeted` ASC;	student_club
SELECT `budget_id`, `amount` FROM `budget` WHERE `category` = 'Food' ORDER BY `amount` DESC LIMIT 1;	student_club
SELECT `budget_id`, `amount` FROM `budget` WHERE `category` = 'Advertisement' ORDER BY `amount` DESC LIMIT 3;	student_club
SELECT SUM(cost) AS total_parking_cost FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT `expense_description` FROM `expense` JOIN `member` ON `expense.link_to_member` = `member.member_id` WHERE `member.first_name` = 'Sacha' AND `member.last_name` = 'Harrison';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50 GROUP BY m.member_id HAVING m.zip IS NOT NULL;	student_club
SELECT major_name  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE first_name = 'Phillip' AND last_name = 'Cullen';	student_club
SELECT m.position FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE department = 'Economics and Finance Department') AND t_shirt_size = 'Medium';	student_club
SELECT `event_name`, `type`, `remaining` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `remaining` > 30;	student_club
SELECT DISTINCT `type`  FROM `event`  WHERE `location` = 'MU 215';	student_club
SELECT `type` FROM `event` WHERE `event_date` = '2020-03-24T12:00:00';	student_club
SELECT m.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT      (SUM(CASE WHEN m.position = 'Member' AND m.link_to_major = (SELECT major_id FROM major WHERE major_name = 'Business') THEN 1 ELSE 0 END)      / COUNT(DISTINCT m.member_id)) * 100 AS percentage_business_members FROM      member m;	student_club
SELECT `type` FROM `event` WHERE `location` = 'MU 215';	student_club
SELECT COUNT(*)  FROM income  WHERE amount = 50;	student_club
SELECT COUNT(*) FROM `member` WHERE `position` = 'Member' AND `t_shirt_size` = 'X-Large';	student_club
SELECT COUNT(DISTINCT major_id)  FROM major  WHERE college = 'College of Agriculture and Applied Sciences'  AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, ma.major_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT `budget.category` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `event.location` = 'MU 215' AND `budget.spent` = 0 AND `event.type` = 'Guest Speaker';	student_club
SELECT m.zip.city, m.zip.state FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';	student_club
SELECT e.event_name FROM event e JOIN member m ON e.event_id IN (SELECT link_to_event FROM attendance) WHERE m.position = 'Vice President' AND m.zip = (SELECT zip_code FROM zip_code WHERE short_state = 'IN' AND zip_code = 46201);	student_club
SELECT m.last_name, m.position  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member';	student_club
SELECT      (COUNT(CASE WHEN i.amount = 50 THEN 1 END) * 100.0) / COUNT(DISTINCT m.member_id) AS percentage FROM      member m JOIN      income i ON m.member_id = i.link_to_member WHERE      m.t_shirt_size = 'Medium' AND      m.position = 'Member' AND      i.amount = 50	student_club
SELECT `state`, `short_state` FROM `zip_code` WHERE `type` = 'PO Box' GROUP BY `state`, `short_state`;	student_club
SELECT DISTINCT zc.zip_code FROM zip_code zc JOIN member m ON zc.zip_code = m.zip WHERE zc.state = 'Puerto Rico' AND zc.city = 'San Juan Municipio' AND zc.type = 'PO Box';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT e.event_id FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN expense ex ON a.link_to_event = ex.link_to_budget JOIN member m ON ex.link_to_member = m.member_id WHERE ex.cost > 50 AND m.member_id = ex.link_to_member;	student_club
SELECT      m.member_id,      m.first_name,      m.last_name,      e.event_name,      e.event_id FROM      expense e JOIN      member m ON e.link_to_member = m.member_id WHERE      e.approved = 'true'     AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19' JOIN      attendance a ON e.link_to_member = a.link_to_member JOIN      event ev ON a.link_to_event = ev.event_id;	student_club
SELECT m.zip, m.link_to_major FROM `member` m WHERE m.first_name = 'Katy' AND m.link_to_major = 'rec1N0upiVLy5esTO' JOIN `major` ma ON m.link_to_major = ma.major_id JOIN `college` co ON ma.college = co.college_id;	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Agriculture and Applied Sciences' AND ma.major_name = 'Business';	student_club
SELECT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 20 AND e.expense_date BETWEEN '2019-09-10' AND '2019-11-19';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Education' AND m.position = 'Member';	student_club
SELECT      (SUM(CASE WHEN `remaining` < 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(`event_id`)) AS over_budget_percentage FROM      `event` WHERE      `event_id` IN (SELECT `link_to_event` FROM `budget`);	student_club
SELECT `event_id`, `location`, `status` FROM `event` WHERE `event_date` BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_description FROM expense GROUP BY expense_description HAVING SUM(cost) / COUNT(expense_id) > 50;	student_club
SELECT first_name, last_name FROM `member` WHERE `t_shirt_size` = 'X-Large';	student_club
SELECT     (SUM(CASE WHEN `type` = 'PO Box' THEN 1 ELSE 0 END) / COUNT(`zip_code`)) * 100 AS percentage_po_box FROM `zip_code`;	student_club
SELECT `event_name`, `location` FROM `event` WHERE `event_id` IN (     SELECT `link_to_event`     FROM `budget`     WHERE `remaining` > 0 );	student_club
SELECT e.event_name, e.event_date FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, ma.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN major ma ON m.link_to_major = ma.major_id WHERE e.cost > 100;	student_club
SELECT z.city, z.county FROM event e JOIN income i ON e.event_id = i.link_to_member JOIN member m ON i.link_to_member = m.member_id JOIN zip_code z ON m.zip = z.zip_code GROUP BY e.event_id HAVING COUNT(i.income_id) > 40;	student_club
SELECT      m.member_id,      m.first_name,      m.last_name,      SUM(e.cost) AS total_expense FROM      member m JOIN      expense e ON m.member_id = e.link_to_member WHERE      m.member_id IN (         SELECT              link_to_member         FROM              expense         GROUP BY              link_to_member         HAVING              COUNT(DISTINCT link_to_event) > 1     ) GROUP BY      m.member_id ORDER BY      total_expense DESC LIMIT 1;	student_club
SELECT AVG(e.cost) AS average_amount_paid FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position != 'Member';	student_club
SELECT event_name FROM event WHERE cost < (SELECT SUM(cost) / COUNT(event_id)                FROM expense                JOIN budget ON expense.link_to_budget = budget.budget_id               WHERE budget.category = 'Parking')	student_club
SELECT      (SUM(CASE WHEN e.type = 'Meeting' THEN b.cost ELSE 0 END) / SUM(b.cost)) * 100 AS meeting_cost_percentage FROM      event e JOIN      budget b ON e.event_id = b.link_to_event;	student_club
SELECT `budget_id` FROM `budget` JOIN `expense` ON `budget.budget_id` = `expense.link_to_budget` WHERE `expense_description` = 'Water, chips, cookies' GROUP BY `budget.budget_id` ORDER BY SUM(`expense.cost`) DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT     (SUM(CASE WHEN `state` = 'New Jersey' THEN 1 ELSE 0 END) / COUNT(`position` = 'Member')) -     (SUM(CASE WHEN `state` = 'Vermont' THEN 1 ELSE 0 END) / COUNT(`position` = 'Member')) FROM `member` WHERE `position` = 'Member';	student_club
SELECT m.major_name, m.department FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.expense_description LIKE '%Water%' AND e.expense_description LIKE '%Veggie tray%' AND e.expense_description LIKE '%supplies%' GROUP BY m.member_id	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education';	student_club
SELECT `budget`.`category`, `budget`.`amount` FROM `event` JOIN `budget` ON `event`.`event_id` = `budget`.`link_to_event` WHERE `event`.`event_name` = 'January Speaker';	student_club
SELECT DISTINCT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT b.category FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Posters';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name, m.position, m.college FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary';	student_club
SELECT      e.event_name,      SUM(b.spent) AS total_spent FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      b.category = 'Speaker Gifts' GROUP BY      e.event_name;	student_club
SELECT `city`  FROM `member`  JOIN `zip_code` ON `member.zip` = `zip_code.zip_code`  WHERE `last_name` = 'Gerke' AND `member_id` = 'rec1x5zBFIqoOuPW8';	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name, position  FROM member  WHERE zip = (SELECT zip_code FROM zip_code WHERE city = 'Lincolnton' AND state = 'North Carolina' AND zip_code = 28092);	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR') /      (SELECT COUNT(*) FROM customers WHERE Currency = 'CZK') AS EUR_to_CZK_ratio;	debit_card_specializing
SELECT c.CustomerID, ym.Consumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' AND LEFT(ym.Date, 6) BETWEEN '201201' AND '201212' ORDER BY ym.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS AverageMonthlyConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME')  AND Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(gu.GasUsage) AS TotalConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID JOIN gas_usage gu ON ym.Date BETWEEN gu.YearMonth AND gu.YearMonth WHERE c.Currency = 'CZK' AND gu.Currency = 'CZK' AND gu.YearMonth BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT ym.CustomerID)  FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'KAM' AND ym.Consumption < 30000 AND ym.Date BETWEEN '201201' AND '201212';	debit_card_specializing
SELECT      (SELECT SUM(`Consumption`) FROM `yearmonth` WHERE `CustomerID` IN      (SELECT `CustomerID` FROM `customers` WHERE `Currency` = 'CZK') AND      LEFT(`Date`, 6) BETWEEN '201201' AND '201212') -     (SELECT SUM(`Consumption`) FROM `yearmonth` WHERE `CustomerID` IN      (SELECT `CustomerID` FROM `customers` WHERE `Currency` = 'EUR') AND      LEFT(`Date`, 6) BETWEEN '201201' AND '201212') AS `DifferenceInGasConsumption`	debit_card_specializing
SELECT `YearMonth`, SUM(`GasUsage`) as TotalGasUsage FROM `yearmonth` JOIN `customers` ON `yearmonth.CustomerID` = `customers.CustomerID` WHERE `customers.Currency` = 'EUR' GROUP BY `YearMonth` ORDER BY TotalGasUsage DESC LIMIT 1;	debit_card_specializing
SELECT Segment, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT      SUBSTR(Date, 1, 4) AS Year,      SUM(Consumption) AS TotalConsumption FROM      yearmonth WHERE      Country = 'CZE' GROUP BY      Year ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT      SUBSTRING(`Date`, 5, 6) AS `Month`,      SUM(`Consumption`) AS `TotalConsumption` FROM      `yearmonth` INNER JOIN      `customers` ON `yearmonth.CustomerID` = `customers.CustomerID` WHERE      `customers.Segment` = 'SME' AND      SUBSTRING(`yearmonth.Date`, 1, 4) = '2013' GROUP BY      `Month` ORDER BY      `TotalConsumption` DESC LIMIT 1;	debit_card_specializing
WITH AnnualConsumption AS (     SELECT          Segment,          YEAR(Date) AS Year,          SUM(Consumption) AS TotalConsumption,          COUNT(*) AS CustomerCount     FROM yearmonth     WHERE LEFT(Date, 6) BETWEEN '201301' AND '201312'     GROUP BY Segment, Year ), LowestConsumption AS (     SELECT          Segment,          MIN(TotalConsumption) AS MinConsumption     FROM AnnualConsumption     GROUP BY Segment ), SegmentAverage AS (     SELECT          A.Segment,          A.TotalConsumption / A.CustomerCount AS AvgConsumption     FROM AnnualConsumption A     JOIN LowestConsumption L ON A.Segment = L.Segment AND A.TotalConsumption = L.MinConsumption ), SegmentComparison AS (     SELECT          'SME vs LAM' AS Comparison,          (SELECT AvgConsumption FROM SegmentAverage WHERE Segment = 'SME') - (SELECT AvgConsumption FROM SegmentAverage WHERE Segment = 'LAM') AS Difference     UNION ALL     SELECT          'LAM vs KAM',          (SELECT AvgConsumption FROM SegmentAverage WHERE Segment = 'LAM') - (SELECT AvgConsumption FROM SegmentAverage WHERE Segment = 'KAM')     UNION ALL     SELECT          'KAM vs SME',          (SELECT AvgConsumption FROM SegmentAverage WHERE Segment = 'KAM') - (SELECT AvgConsumption FROM SegmentAverage WHERE Segment = 'SME') ) SELECT * FROM SegmentComparison;	debit_card_specializing
SELECT      Segment,     MAX(PercentageIncrease) AS HighestPercentageIncrease,     MIN(PercentageIncrease) AS LowestPercentageIncrease FROM (     SELECT          c.Segment,         (SUM(y3.Consumption) - SUM(y2.Consumption)) / SUM(y3.Consumption) * 100 AS PercentageIncrease     FROM          customers c     JOIN          yearmonth y2 ON c.CustomerID = y2.CustomerID AND LEFT(y2.Date, 4) = '2012'     JOIN          yearmonth y3 ON c.CustomerID = y3.CustomerID AND LEFT(y3.Date, 4) = '2013'     WHERE          c.Segment IN ('SME', 'LAM', 'KAM') AND c.Currency = 'EUR'     GROUP BY          c.Segment ) AS PercentageIncreaseTable GROUP BY      Segment;	debit_card_specializing
SELECT SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` WHERE `CustomerID` = 6 AND `Date` BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM `gasstations` WHERE `Country` = 'CZE' AND `Segment` = 'Discount') -      (SELECT COUNT(*) FROM `gasstations` WHERE `Country` = 'SVK' AND `Segment` = 'Discount') AS `DiscountGasStationsDifference`	debit_card_specializing
SELECT      (SUM(CASE WHEN ym.CustomerID = 7 THEN ym.Consumption ELSE 0 END) -       SUM(CASE WHEN ym.CustomerID = 5 THEN ym.Consumption ELSE 0 END)) AS Difference FROM      yearmonth ym WHERE      ym.Date = '201304';	debit_card_specializing
SELECT      (SELECT COUNT(*)       FROM customers c       JOIN yearmonth y ON c.CustomerID = y.CustomerID       JOIN gas_usage gu ON c.Currency = gu.Currency       WHERE gu.Currency = 'CZK') -      (SELECT COUNT(*)       FROM customers c       JOIN yearmonth y ON c.CustomerID = y.CustomerID       JOIN gas_usage gu ON c.Currency = gu.Currency       WHERE gu.Currency = 'EUR')  AS Difference;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310' ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT      c.CustomerID,      SUM(y.Consumption) AS TotalConsumption FROM      customers c JOIN      yearmonth y ON c.CustomerID = y.CustomerID WHERE      c.Segment = 'KAM' GROUP BY      c.CustomerID ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM') AND Date = '201305';	debit_card_specializing
SELECT     ROUND(         (COUNT(CASE WHEN Consumption > 46.73 THEN 1 END) * 100.0) / COUNT(*),         2     ) AS PercentageOfLAMConsumedMoreThan4673 FROM     yearmonth JOIN     customers ON yearmonth.CustomerID = customers.CustomerID WHERE     customers.Segment = 'LAM';	debit_card_specializing
SELECT `Country`, COUNT(`GasStationID`) AS `ValueForMoneyCount` FROM `gasstations` WHERE `Segment` = 'Value for money' GROUP BY `Country` ORDER BY `ValueForMoneyCount` DESC;	debit_card_specializing
SELECT      (SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) * 100.0) / COUNT(c.CustomerID) AS PercentageOfKAMInEuro FROM      customers c WHERE      c.Segment = 'KAM';	debit_card_specializing
SELECT      (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM yearmonth WHERE `Date` LIKE '201202') AS percentage FROM      yearmonth WHERE      `Date` LIKE '201202' AND `Consumption` > 528.3	debit_card_specializing
SELECT      (COUNT(CASE WHEN `GasStationID` IN (SELECT `GasStationID` FROM `gasstations` WHERE `Country` = 'CZE' AND `Segment` = 'Premium') THEN 1 END) * 100.0) /      COUNT(`GasStationID`) AS Premium_Percentage FROM      `gasstations` WHERE      `Country` = 'CZE';	debit_card_specializing
SELECT `CustomerID` FROM `yearmonth` WHERE `Date` = '201309' GROUP BY `CustomerID` ORDER BY SUM(`Consumption`) DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) as TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'SME' AND ym.Date = '201206' ORDER BY ym.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(`Consumption`) as HighestMonthlyConsumption FROM `yearmonth` WHERE SUBSTR(`Date`, 1, 4) = '2012';	debit_card_specializing
SELECT CustomerID, MAX(Consumption) AS MaxMonthlyConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR') GROUP BY CustomerID ORDER BY MaxMonthlyConsumption DESC LIMIT 1;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE SUBSTR(y.Date, 1, 6) = '201309';	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN yearmonth ym ON t.CustomerID = ym.CustomerID WHERE ym.Date LIKE '201306'	debit_card_specializing
SELECT g.`ChainID` FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY g.`ChainID`;	debit_card_specializing
SELECT p.Description FROM `transactions_1k` t JOIN `products` p ON t.ProductID = p.ProductID WHERE t.Price IS NOT NULL AND t.Currency = 'EUR';	debit_card_specializing
SELECT AVG(`Price` * `Amount`) AS `AverageTotalPrice` FROM `transactions_1k` WHERE DATE(`Date`) LIKE '2012-01%';	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.ChainID = 11;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS t JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(T.Amount * T.Price) AS AverageTotalPrice FROM `transactions_1k` T JOIN `gasstations` G ON T.GasStationID = G.GasStationID WHERE G.Country = 'CZE';	debit_card_specializing
SELECT AVG(TotalPrice) as AverageTotalPrice FROM (     SELECT          t1.Amount * t1.Price as TotalPrice     FROM          transactions_1k t1     INNER JOIN          customers t2 ON t1.CustomerID = t2.CustomerID     WHERE          t2.Currency = 'EUR' ) as PriceSum;	debit_card_specializing
SELECT      c.CustomerID,      SUM(t.Amount * t.Price) AS TotalAmount FROM      transactions_1k t JOIN      customers c ON t.CustomerID = c.CustomerID WHERE      t.Date = '2012-08-25' GROUP BY      c.CustomerID ORDER BY      TotalAmount DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '2012-08-25' AND NOT EXISTS (     SELECT 1     FROM transactions_1k t2     WHERE t2.Date < '2012-08-25'     AND t2.GasStationID = g.GasStationID ) ORDER BY t.Date LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Time = '16:25:00' AND t.Date = '2012-08-24';	debit_card_specializing
SELECT c.Segment FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Price IS NOT NULL	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers);	debit_card_specializing
SELECT g.Country  FROM transactions_1k AS t1 JOIN gasstations AS g ON t1.GasStationID = g.GasStationID WHERE t1.Date = '2012-08-24' AND t1.Time = '12:42:00';	debit_card_specializing
SELECT ProductID  FROM transactions_1k  WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT      ym.Consumption AS Expenses,      ym.Date AS ExpenseDate FROM      yearmonth ym JOIN      (         SELECT              CustomerID          FROM              transactions_1k          WHERE              Date = '2012-08-24'              AND Price = 124.05     ) t ON ym.CustomerID = t.CustomerID  WHERE      ym.Date = '201201';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Time BETWEEN '08:00:00' AND '09:00:00' AND DATE(t.Date) = '2012-08-26' AND g.Country = 'CZE';	debit_card_specializing
SELECT c.Currency FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE ym.Date = '201306' AND ym.Consumption = 214582.17;	debit_card_specializing
SELECT c.Country FROM cards c JOIN transactions_1k t ON c.CardID = t.CardID WHERE t.CardID = 667467;	debit_card_specializing
SELECT c.Country FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24' AND t.Price = 548.4;	debit_card_specializing
SELECT      ROUND(         (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 100.0) / COUNT(*),          2     ) AS PercentageOfEURCustomers FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID WHERE      t.Date = '2012-08-25';	debit_card_specializing
SELECT      (CONSUMPTION_2012 - CONSUMPTION_2013) / CONSUMPTION_2012 AS ConsumptionDecreaseRate FROM (     SELECT          c.CustomerID,         YM_2012.Consumption AS CONSUMPTION_2012,         YM_2013.Consumption AS CONSUMPTION_2013     FROM          customers c     JOIN yearmonth YM_2012 ON c.CustomerID = YM_2012.CustomerID AND LEFT(YM_2012.Date, 7) = '2012-08'     JOIN yearmonth YM_2013 ON c.CustomerID = YM_2013.CustomerID AND LEFT(YM_2013.Date, 7) = '2013-08'     JOIN transactions_1k t ON c.CustomerID = t.CustomerID     WHERE          t.Date = '2012-08-25' AND t.Amount = 634.8 ) AS RateCalculation;	debit_card_specializing
SELECT GasStationID, SUM(Amount * Price) AS TotalRevenue FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID GROUP BY GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT      (SUM(CASE WHEN g.Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Premium_Percentage FROM      gasstations AS g JOIN      transactions_1k AS t ON g.GasStationID = t.GasStationID JOIN      customers AS c ON t.CustomerID = c.CustomerID WHERE      g.Country = 'SVK' AND     c.Segment IS NOT NULL;	debit_card_specializing
SELECT SUM(t.Amount * t.Price) AS TotalAmountSpent FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.CustomerID = 38508;  SELECT SUM(y.Consumption) AS TotalSpentInJanuary2012 FROM yearmonth y WHERE y.CustomerID = 38508 AND y.Date = '201201';	debit_card_specializing
SELECT p.ProductID, p.Description, COUNT(t1k.ProductID) AS SalesCount FROM products p JOIN transactions_1k t1k ON p.ProductID = t1k.ProductID GROUP BY p.ProductID, p.Description ORDER BY SalesCount DESC LIMIT 5;	debit_card_specializing
SELECT      c.CustomerID,      AVG(t.Price) AS AvgPricePerItem,      c.Currency FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY      c.CustomerID, c.Currency ORDER BY      AVG(t.Price) DESC LIMIT 1;	debit_card_specializing
SELECT g.Country, MAX(t.Price) AS MaxPrice FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.ProductID = 2 GROUP BY g.Country ORDER BY MaxPrice DESC LIMIT 1;	debit_card_specializing
SELECT ym.CustomerID, ym.Consumption FROM yearmonth ym WHERE ym.Date = '201208' AND ym.CustomerID IN (     SELECT t1.CustomerID     FROM transactions_1k t1     JOIN customers c ON t1.CustomerID = c.CustomerID     WHERE t1.ProductID = 5     AND (t1.Price / t1.Amount) > 29.00 )	debit_card_specializing
