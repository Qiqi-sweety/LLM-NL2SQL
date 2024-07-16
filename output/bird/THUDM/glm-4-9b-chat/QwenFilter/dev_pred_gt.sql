SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda'	california_schools
SELECT `CDSCode`,         `Percent (%) Eligible Free (Ages 5-17)` FROM `frpm` ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND s.District = 'Fresno County Office of Education';	california_schools
SELECT s.MailingStreet, s.MailingStreetAbr, s.MailingCity, s.MailingZip, s.MailingState FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm) ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 1;	california_schools
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.CharterSchool (Y/N) = 1 AND f.Charter Funding Type = 'Directly funded' AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.AvgScrMath > 400 AND schools.Virtual = 'F';	california_schools
SELECT s.CDSCode, s.NCESDist, s.Charter, s.GSoffered, s.Magnet, s.AdmLName1 FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumTstTakr > 500 AND (s.Magnet = 1 OR s.GSoffered LIKE '%Magnet%');	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumGE1500 IS NOT NULL ORDER BY sc.NumGE1500 DESC LIMIT 1;	california_schools
SELECT satscores.NumTstTakr FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm)	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.AvgScrMath > 560 AND s.FundingType = 'Directly funded';	california_schools
SELECT frpm.FRPM_Count_Ages_5_17 FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrRead = (     SELECT MAX(AvgScrRead)     FROM satscores     WHERE rtype = 'S' )	california_schools
SELECT frpm.CDSCode FROM frpm WHERE frpm.`Enrollment (K-12)` + frpm.`Enrollment (Ages 5-17)` > 500;	california_schools
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`) AS Highest_Eligible_Free_Rate FROM frpm WHERE `Percent (%) Eligible FRPM (Ages 5-17)` > 0.3 AND `Enrollment (Ages 5-17)` > 0 AND `Percent (%) Eligible Free (Ages 5-17)` IS NOT NULL;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.StatusType = 'Active' ORDER BY (ss.NumGE1500 / ss.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, f.`Enrollment (Ages 5-17)` FROM `frpm` f JOIN `schools` s ON f.CDSCode = s.CDSCode ORDER BY f.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT s.District, AVG(sc.AvgScrRead) AS AvgReadingScore FROM satscores sc JOIN schools s ON sc.cds = s.CDSCode WHERE sc.AvgScrRead IS NOT NULL AND s.District IS NOT NULL GROUP BY s.District ORDER BY AvgReadingScore DESC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT s.CDSCode)  FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.CDSCode IN (SELECT CDSCode FROM satscores WHERE NumTstTakr < 100);	california_schools
SELECT      s.`CharterNum`,      AVG(sat.`AvgScrWrite`) AS AvgWriteScore FROM      `satscores` sat JOIN      `schools` s ON sat.cds = s.CDSCode WHERE      sat.AvgScrWrite > 499     AND s.`Charter` = 1     AND s.`CharterNum` IS NOT NULL GROUP BY      s.`CharterNum` ORDER BY      AvgWriteScore DESC;	california_schools
SELECT COUNT(DISTINCT frpm.CDSCode) FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.City = 'Fresno' AND schools.FundingType = 'Directly Funded' AND satscores.NumTstTakr <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores) AND s.CDSCode = (SELECT CDSCode FROM satscores WHERE AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores))	california_schools
SELECT COUNT(*) FROM school_scores JOIN schools ON school_scores.CDSCode = schools.CDSCode WHERE schools.District = 'Amador' AND school_scores.LowGrade = 9 AND school_scores.HighGrade = 12;	california_schools
SELECT COUNT(*) FROM frpm WHERE `CDSCode` IN (SELECT `CDSCode` FROM schools WHERE City = 'Los Angeles') AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700;	california_schools
SELECT      s.County,      s.CDSCode,      s.NCESDist,      ts.NumTstTakr FROM      schools s JOIN      satscores ts ON s.CDSCode = ts.cds WHERE      s.County = 'Contra Costa' ORDER BY      ts.NumTstTakr DESC LIMIT 1;	california_schools
SELECT      s.School,      s.Street,      s.StreetAbr,      s.City,      s.Zip  FROM      frpm f  JOIN      schools s ON f.CDSCode = s.CDSCode  WHERE      ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT frpm.School Name FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.`Percent (%) Eligible Free (K-12)` > 0.1 AND EXISTS (     SELECT 1     FROM satscores     WHERE satscores.cds = schools.CDSCode     AND satscores.NumGE1500 IS NOT NULL     AND satscores.NumGE1500 >= 1500 );	california_schools
SELECT s.SchoolName, sch.FundingType FROM frpm f JOIN schools sch ON f.CDSCode = sch.CDSCode WHERE f.SchoolType LIKE '%Riverside%' AND sch.FundingType IS NOT NULL AND (     SELECT AVG(CASE WHEN ss.Subject = 'Math' THEN ss.Score ELSE NULL END)     FROM school_scores ss     WHERE ss.CDSCode = f.CDSCode ) > 400;	california_schools
SELECT s.County, s.Zip, s.State, s.MailZip, s.MailState, s.Street, s.City FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Monterey' AND (f.Free_Meal_Count__Ages_5_17 > 800 OR f.FRPM_Count__Ages_5_17 > 800);	california_schools
SELECT      s.NCESSchool AS SchoolName,     s.Phone AS CommunicationNumber,     COALESCE(satscores.AvgScrWrite, 0) AS AvgScoreWrite FROM      schools s LEFT JOIN      satscores ON s.CDSCode = satscores.cds WHERE      (s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01')	california_schools
WITH SchoolEnrollmentDifferences AS (     SELECT          frpm.CDSCode,         frpm.School,         frpm.`DOCType`,         (frpm.`Enrollment (K-12)` - frpm.`Enrollment (Ages 5-17)`) AS EnrollmentDifference     FROM frpm     JOIN schools ON frpm.CDSCode = schools.CDSCode     WHERE schools.FundingType = 'Directly funded' ), AverageDifference AS (     SELECT AVG(EnrollmentDifference) AS AvgDiff     FROM SchoolEnrollmentDifferences ), AboveAverageSchools AS (     SELECT          sed.CDSCode,         sed.School,         sed.DOCType     FROM SchoolEnrollmentDifferences sed     JOIN AverageDifference ad ON sed.EnrollmentDifference > ad.AvgDiff ) SELECT CDSCode, School, DOCType FROM AboveAverageSchools;	california_schools
SELECT OpenDate  FROM schools  WHERE School IS NOT NULL  AND `Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM frpm) ORDER BY OpenDate  LIMIT 1;	california_schools
SELECT s.City, MIN(f.`Enrollment (K-12)`) AS LowestEnrollment FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode GROUP BY s.City ORDER BY LowestEnrollment ASC LIMIT 5;	california_schools
SELECT Percent_Eligible_Free_K_12  FROM frpm  WHERE `Enrollment (K-12)` IN (     SELECT `Enrollment (K-12)`     FROM frpm      ORDER BY `Enrollment (K-12)` DESC      LIMIT 10, 2 );	california_schools
SELECT      frpm.CDSCode,     frpm.School Name,     frpm.`Percent (%) Eligible FRPM (K-12)` AS Eligible_FRPM_Rate FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.FundingType = 'Directly funded' AND     frpm.`Percent (%) Eligible FRPM (K-12)` IS NOT NULL AND     frpm.`FRPM Count (K-12)` IS NOT NULL AND     frpm.`Enrollment (K-12)` IS NOT NULL AND     frpm.`Percent (%) Eligible FRPM (K-12)` > 0 ORDER BY      frpm.`FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT s.Website, s.GSserved FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000 AND f.`Enrollment (Ages 5-17)` > 0;	california_schools
SELECT      Percent_Eligible_Free__Ages_5_17  FROM      frpm  WHERE      CDSCode IN (         SELECT              CDSCode          FROM              schools          WHERE              Principal = 'Kacey Gibson'     );	california_schools
SELECT s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 ORDER BY f.`Enrollment (K-12)` LIMIT 1;	california_schools
SELECT s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3 FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 = (SELECT MAX(ss2.NumGE1500) FROM satscores ss2) ORDER BY s.NumGE1500 DESC LIMIT 1;	california_schools
SELECT s.Street, s.City, s.Zip, s.State FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds JOIN (     SELECT cds, MIN(sc.Score * 100.0 / st.NumGE1500) AS ExcellenceRate     FROM satscores sc     JOIN test_takers st ON sc.cds = st.SchoolPhone     GROUP BY sc.cds ) AS min_rate ON s.CDSCode = min_rate.cds WHERE s.StatusType = 'Active';	california_schools
SELECT s.CDSCode FROM schools s JOIN school_scores ss ON s.CDSCode = ss.CDSCode JOIN (     SELECT SchoolPhone, COUNT(*) AS total_test_takers     FROM test_takers     GROUP BY SchoolPhone ) tt ON s.CDSCode = tt.SchoolPhone WHERE s.County = 'Los Angeles' AND tt.total_test_takers BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(NumTstTakr) AS AverageTestTakers FROM satscores WHERE YEAR(`schools.OpenDate`) = 1980 AND `schools.CDSCode` IN (SELECT `frpm.CDSCode` FROM `frpm` WHERE `frpm.School Name` LIKE 'Fresno%');	california_schools
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.District Name = 'Fresno Unified' AND f.School Name IN (     SELECT f2.School Name     FROM frpm f2     JOIN school_scores ss ON f2.CDSCode = ss.CDSCode     WHERE ss.Subject = 'Reading'     GROUP BY f2.School Name     ORDER BY AVG(ss.Score) ASC     LIMIT 1 );	california_schools
SELECT sname FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' AND s.County IN (     SELECT County     FROM (         SELECT County, AVG(AvgScrRead) as AvgScore         FROM satscores         GROUP BY County         ORDER BY AvgScore DESC         LIMIT 5     ) AS TopCounties     WHERE s.County = TopCounties.County ) ORDER BY ss.AvgScrRead DESC;	california_schools
SELECT s.`School Type` FROM frpm f JOIN satscores ss ON f.CDSCode = ss.cds JOIN schools s ON f.CDSCode = s.CDSCode WHERE ss.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)	california_schools
SELECT s.County, (ss.AvgScrMath + ss.AvgScrRead + ss.AvgScrWrite) AS TotalAvgScore FROM schools s JOIN (     SELECT cds, (AvgScrMath + AvgScrRead + AvgScrWrite) AS TotalAvgScore     FROM satscores     WHERE AvgScrMath IS NOT NULL AND AvgScrRead IS NOT NULL AND AvgScrWrite IS NOT NULL     GROUP BY cds     ORDER BY TotalAvgScore ASC     LIMIT 1 ) ss ON s.CDSCode = ss.cds	california_schools
SELECT sname, city, AVG(AvgScrWrite) as AvgWritingScore FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.NumGE1500 = (     SELECT MAX(NumGE1500)     FROM satscores     WHERE NumGE1500 >= 1500 ) GROUP BY sname, city;	california_schools
SELECT s.CDSCode, AVG(ss.Score) AS AvgScrWrite FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.CDSCode;	california_schools
SELECT      s.State,      SUM(f.Enrollment (K-12)) AS TotalEnrollment FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      s.DOC = '31' AND s.GSoffered LIKE '%K-12%' GROUP BY      s.State ORDER BY      TotalEnrollment DESC LIMIT 1;	california_schools
SELECT      COUNT(*) / 12 AS MonthlyAverageOpenings FROM      schools WHERE      `DOC` = '52'     AND `OpenDate` BETWEEN '1980-01-01' AND '1980-12-31'     AND `County` = 'Alameda'	california_schools
SELECT      (SELECT COUNT(*) FROM `schools` s JOIN `district_closures` dc ON s.DOC = '54' WHERE s.CDSCode IN (SELECT CDSCode FROM `frpm` WHERE `School Type` = 'Unified School District'))     /     (SELECT COUNT(*) FROM `schools` s JOIN `district_closures` dc ON s.DOC = '52' WHERE s.CDSCode IN (SELECT CDSCode FROM `frpm` WHERE `School Type` = 'Elementary School District'))     AS RatioOfMergedUnifiedToMergedElementarySchools	california_schools
SELECT s.County, s.CDSCode, s.ClosedDate FROM schools s JOIN (     SELECT County, COUNT(*) as ClosedSchoolsCount     FROM schools     WHERE StatusType = 'Closed'     GROUP BY County     ORDER BY ClosedSchoolsCount DESC     LIMIT 1 ) AS most_closed ON s.County = most_closed.County WHERE s.StatusType = 'Closed';	california_schools
SELECT s.`School Name`, s.`Street` || ', ' || s.`City` || ', ' || s.`Zip` AS PostalAddress FROM `schools` s JOIN (     SELECT `CDSCode`, AVG(`Subject`) AS MathAverage     FROM `school_scores`     WHERE `Subject` = 'Math'     GROUP BY `CDSCode`     ORDER BY MathAverage DESC ) AS ss ON s.`CDSCode` = ss.`CDSCode` WHERE ss.MathAverage = (     SELECT AVG(`Subject`) AS MathAverage     FROM `school_scores`     WHERE `Subject` = 'Math'     GROUP BY `CDSCode`     ORDER BY MathAverage DESC     LIMIT 6, 1 );	california_schools
SELECT s.`MailStreet`, s.`MailStrAbr`, s.`MailCity`, s.`MailZip`, s.`School Name` FROM `schools` s JOIN `frpm` f ON s.`CDSCode` = f.`CDSCode` JOIN `satscores` sc ON s.`CDSCode` = sc.`cds` WHERE sc.`AvgScrRead` = (SELECT MIN(`AvgScrRead`) FROM `satscores` WHERE `AvgScrRead` IS NOT NULL)	california_schools
SELECT COUNT(*) FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.MailCity = 'Lakeport' AND satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite >= 1500;	california_schools
SELECT COUNT(s.`CDSCode`) AS NumberOfTestTakers FROM `frpm` f JOIN `schools` s ON f.`CDSCode` = s.`CDSCode` JOIN `satscores` sc ON f.`CDSCode` = sc.`cds` WHERE s.`MailCity` = 'Fresno';	california_schools
SELECT      s.`School Name`,      s.`Zip`  FROM      `schools` s  JOIN      `frpm` f ON s.`CDSCode` = f.`CDSCode`  JOIN      (SELECT           `AdmFName1`,           `AdmLName1`        FROM           `schools`        WHERE           `AdmLName1` = 'Atoian') a ON s.`AdmLName1` = a.`AdmLName1` AND s.`AdmFName1` = a.`AdmFName1` WHERE      f.`Charter School (Y/N)` = 1;	california_schools
SELECT      (COUNT(CASE WHEN s.County = 'Colusa' THEN 1 END) / COUNT(CASE WHEN s.County = 'Humboldt' THEN 1 END)) AS ratio FROM      schools s;	california_schools
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND City = 'San Joaquin';	california_schools
SELECT s.Phone, s.CharterNum FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrWrite = (     SELECT AvgScrWrite     FROM satscores     ORDER BY AvgScrWrite DESC     LIMIT 1 OFFSET 332 ) ORDER BY ss.AvgScrWrite DESC LIMIT 1;	california_schools
SELECT `schools`.`Phone`, `schools`.`Ext`, `schools`.`School Name` FROM `schools` WHERE `schools`.`Zip` = '95203-3704';	california_schools
SELECT s.Website FROM schools s JOIN (     SELECT CDSCode     FROM schools     WHERE AdmFName1 = 'Mike' AND AdmLName1 = 'Larson'     OR AdmFName2 = 'Mike' AND AdmLName2 = 'Larson'     OR AdmFName3 = 'Mike' AND AdmLName3 = 'Larson'     OR AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez'     OR AdmFName2 = 'Dante' AND AdmLName2 = 'Alvarez'     OR AdmFName3 = 'Dante' AND AdmLName3 = 'Alvarez' ) admin_schools ON s.CDSCode = admin_schools.CDSCode;	california_schools
SELECT s.Website FROM schools s WHERE s.Charter = 1 AND s.Virtual = 'P' AND s.District = 'San Joaquin';	california_schools
SELECT COUNT(*) FROM schools WHERE `City` = 'Hickman' AND `DOC` = '52' AND `Charter` = 1;	california_schools
SELECT COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Los Angeles' AND schools.Charter = 0 AND (frpm.`Free Meal Count (K-12)` * 100 / frpm.`Enrollment (K-12)`) < 0.18;	california_schools
SELECT s.`School Name`, s.City, a1.AdmFName1, a1.AdmLName1, a2.AdmFName2, a2.AdmLName2, a3.AdmFName3, a3.AdmLName3 FROM schools s LEFT JOIN schools a1 ON s.CDSCode = a1.CDSCode LEFT JOIN schools a2 ON s.CDSCode = a2.CDSCode LEFT JOIN schools a3 ON s.CDSCode = a3.CDSCode WHERE s.Charter = 1 AND s.CharterNum = '00D2';	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT     (COUNT(CASE WHEN s.FundingType = 'Locally funded' THEN 1 END) * 100.0) / COUNT(*) AS locally_funded_ratio FROM     schools s WHERE     s.County = 'Santa Clara'	california_schools
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND County = 'Stanislaus';	california_schools
SELECT SUM(`DistrictClosureCount`) as TotalClosureCount FROM `district_closures` WHERE `ClosureYear` = '1989' AND `City` = 'San Francisco';	california_schools
SELECT      `schools.County` AS County,     COUNT(`schools.CDSCode`) AS ClosureCount FROM      `schools` JOIN      `district_closures` ON `schools.County` = `district_closures.City` WHERE      `schools.SOC` = '11'     AND `schools.ClosedDate` BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY      `schools.County` ORDER BY      ClosureCount DESC LIMIT 1;	california_schools
SELECT `schools.NCESDist` FROM `schools` JOIN `frpm` ON `schools.CDSCode` = `frpm.CDSCode` WHERE `schools.SOC` = '31';	california_schools
SELECT      SUM(CASE WHEN s.ClosedDate IS NULL THEN 1 ELSE 0 END) AS ActiveSchools,     SUM(CASE WHEN s.ClosedDate IS NOT NULL THEN 1 ELSE 0 END) AS ClosedSchools FROM      schools s JOIN      district_closures dc ON s.County = dc.County WHERE      s.County = 'Alpine';	california_schools
SELECT `District Code` FROM `frpm` JOIN `schools` ON `frpm.CDSCode` = `schools.CDSCode` WHERE `schools.City` = 'Fresno' AND `schools.Magnet` = 0;	california_schools
SELECT `Enrollment (Ages 5-17)` FROM `frpm` WHERE `Academic Year` = '2014-2015'  AND `EdOpsCode` = 'SSS';	california_schools
SELECT `Free Meal Count (Ages 5-17)` FROM `frpm` WHERE `CDSCode` IN (SELECT `CDSCode` FROM `schools` WHERE `MailStreet` = 'PO Box 1040' AND `County` = 'Alameda') AND `Charter School (Y/N)` = 1;	california_schools
SELECT MIN(`GSoffered`) AS LowestGrade FROM `schools` WHERE `EdOpsCode` = 'SPECON' AND `NCESSchool` = '0613360';	california_schools
SELECT      frpm.`School Name`,      schools.`EILName` AS Educational_Level_Name FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      frpm.`County Code` = '37'      AND frpm.`NSLP Provision Status` = 'Breakfast Provision 2';	california_schools
SELECT s.City FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Merced' AND s.EILCode = 'HS' AND f.Free Meal Count (K-12) = 2 AND f.CDSCode IN (     SELECT CDSCode     FROM school_scores     WHERE Subject = 'Grade Level'     AND MIN(Grade) = 9 AND MAX(Grade) = 12 );	california_schools
SELECT      frpm.CDSCode,      frpm.School Name,      frpm.`Percent (%) Eligible FRPM (Ages 5-17)` FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      frpm.Low Grade = 'K' AND frpm.High Grade = '9'      AND schools.County = 'Los Angeles'	california_schools
SELECT `GradeSpan`, COUNT(*) as `Frequency` FROM `school_scores` WHERE `CDSCode` IN (SELECT `CDSCode` FROM `schools` WHERE `City` = 'Adelanto') GROUP BY `GradeSpan` ORDER BY `Frequency` DESC LIMIT 1;	california_schools
SELECT      County,      COUNT(*) AS NumberOfSchools FROM      schools WHERE      Virtual = 'F' AND      County IN ('San Diego', 'Santa Barbara') GROUP BY      County ORDER BY      NumberOfSchools DESC LIMIT 1;	california_schools
SELECT s.`School Name`, s.Latitude, s.`School Type` FROM schools s JOIN (     SELECT MAX(Latitude) AS MaxLatitude     FROM schools ) maxLat ON s.Latitude = maxLat.MaxLatitude;	california_schools
SELECT      s.City,      s.NCESSchool AS Lowest_Grade,      sch.School_Name FROM      schools s JOIN      (SELECT           MIN(Latitude) AS MinLatitude      FROM           schools      WHERE           State = 'CA'     ) AS minLat ON      s.Latitude = minLat.MinLatitude JOIN      frpm sch ON      s.CDSCode = sch.CDSCode WHERE      s.State = 'CA';	california_schools
SELECT `schools`.`GSoffered` FROM `schools` ORDER BY ABS(`Longitude`) DESC LIMIT 1;	california_schools
SELECT      s.City,     COUNT(DISTINCT s.CDSCode) AS NumberOfSchools FROM      schools s JOIN      school_scores ss ON s.CDSCode = ss.CDSCode WHERE      s.Magnet = 1     AND s.GSserved LIKE '%K-8%' GROUP BY      s.City HAVING      s.NSLP_Provision_Status = 'Multiple Provision Types';	california_schools
SELECT s.District, a1.AdmFName1 AS First_Name, COUNT(a1.AdmFName1) AS Name_Count FROM schools s LEFT JOIN schools a1 ON s.CDSCode = a1.CDSCode LEFT JOIN schools a2 ON s.CDSCode = a2.CDSCode LEFT JOIN schools a3 ON s.CDSCode = a3.CDSCode WHERE a1.AdmFName1 IS NOT NULL OR a2.AdmFName1 IS NOT NULL OR a3.AdmFName1 IS NOT NULL GROUP BY s.District, a1.AdmFName1 ORDER BY Name_Count DESC LIMIT 2;	california_schools
SELECT frpm.`District Code`, frpm.`Percent (%) Eligible Free (K-12)` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode JOIN (     SELECT CDSCode     FROM schools     WHERE AdmFName1 = 'Alusine' OR AdmLName1 = 'Alusine' OR           AdmFName2 = 'Alusine' OR AdmLName2 = 'Alusine' OR           AdmFName3 = 'Alusine' OR AdmLName3 = 'Alusine' ) AS adm ON frpm.CDSCode = adm.CDSCode;	california_schools
SELECT s.`AdmLName1`, s.District, s.County, s.EdOpsName FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.CharterSchoolNumber = '40';	california_schools
SELECT s.AdmEmail1, s.AdmEmail2, s.AdmEmail3 FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'San Bernardino' AND s.District = 'San Bernardino City Unified' AND s.OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND f.School Type = 'Intermediate/Middle Schools' AND s.SOCType = '62' AND f.School Type = 'Unified Schools' AND s.DOCType = '54';	california_schools
SELECT      s.AdmEmail1 AS AdminEmail,      s.AdmFName1 || ' ' || s.AdmLName1 AS SchoolName FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      sc.NumGE1500 IS NOT NULL AND      sc.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores WHERE NumGE1500 IS NOT NULL)	california_schools
SELECT COUNT(DISTINCT a.account_id)  FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'East Bohemia' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT account.account_id) FROM account JOIN loan ON account.account_id = loan.account_id JOIN region ON account.account_id = region.account_id WHERE region.region_name = 'Prague';	financial
SELECT      CASE          WHEN AVG(A12) > AVG(A13) THEN '1995'         ELSE '1996'     END AS higher_unemployment_year FROM unemployment_data;	financial
SELECT COUNT(*) FROM district WHERE `A11` > 6000 AND `A11` < 10000 AND `A12` = 'F';	financial
SELECT COUNT(client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'M'  AND district.A3 = 'North Bohemia'  AND district.A11 > 8000;	financial
WITH FemaleClients AS (     SELECT c.client_id, a.account_id, c.birth_date     FROM client c     JOIN account a ON c.district_id = a.district_id     WHERE c.gender = 'F' ), OldestFemaleClients AS (     SELECT account_id     FROM FemaleClients     ORDER BY birth_date ASC     LIMIT 1 ), AverageSalaries AS (     SELECT c.client_id, AVG(a.account_id) AS avg_salary     FROM client c     JOIN account a ON c.district_id = a.district_id     WHERE c.gender = 'F'     GROUP BY c.client_id ), SalaryStats AS (     SELECT MAX(avg_salary) AS MaxSalary, MIN(avg_salary) AS MinSalary     FROM AverageSalaries ), SalaryGap AS (     SELECT (SELECT MaxSalary FROM SalaryStats) - (SELECT MinSalary FROM SalaryStats) AS SalaryDifference ) SELECT      (SELECT account_id FROM OldestFemaleClients) AS OldestFemaleAccount,     (SELECT SalaryDifference FROM SalaryGap) AS SalaryDifference	financial
SELECT c.client_id FROM client c JOIN (     SELECT district_id     FROM client     ORDER BY birth_date DESC     LIMIT 1 ) youngest_client ON c.district_id = youngest_client.district_id JOIN account a ON c.client_id = a.account_id JOIN (     SELECT account_id     FROM account     GROUP BY account_id     ORDER BY AVG(CASE WHEN `frequency` = 'A11' THEN 1 ELSE 0 END) DESC     LIMIT 1 ) highest_salary_account ON a.account_id = highest_salary_account.account_id;	financial
SELECT COUNT(DISTINCT c.client_id) AS owner_count FROM `account` a JOIN `client` c ON a.account_id = c.client_id WHERE a.frequency = 'POPLATEK TYDNE' AND c.client_id IN (     SELECT client_id     FROM `client`     WHERE client_id IN (         SELECT DISTINCT account_id         FROM `account`     ) );	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN trans t ON d.disp_id = t.account_id WHERE t.operation = 'POPLATEK PO OBRATU' AND d.type = 'DISPONENT';	financial
SELECT account_id FROM loan WHERE date BETWEEN '1997-01-01' AND '1997-12-31' AND status = 'A' AND amount = (SELECT MIN(amount)               FROM loan               WHERE date BETWEEN '1997-01-01' AND '1997-12-31'               AND status = 'A'               AND frequency = 'POPLATEK TYDNE') AND frequency = 'POPLATEK TYDNE' GROUP BY account_id;	financial
SELECT account_id FROM loan WHERE duration > 12 AND account_id IN (     SELECT account_id     FROM account     WHERE date BETWEEN '1993-01-01' AND '1993-12-31' ) ORDER BY amount DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 = 'Sokolov';	financial
SELECT a.account_id FROM account a WHERE a.date = (SELECT MIN(date) FROM account WHERE YEAR(date) = 1995)	financial
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' GROUP BY a.account_id HAVING SUM(t.account) > 3000;	financial
SELECT `client_id` FROM `client` WHERE `birth_date` BETWEEN '1994-03-03' AND '1994-03-03';	financial
SELECT a.account_id, a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14'	financial
SELECT d.A4 AS district_id FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.date = '1994-08-25';	financial
SELECT MAX(t.amount) AS biggest_amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN card c ON a.account_id = c.disp_id JOIN client cl ON a.district_id = cl.district_id WHERE c.issued = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN account a ON c.account_id = a.account_id JOIN branch b ON a.branch_id = b.branch_id WHERE b.branch_salary_avg = (SELECT MAX(branch_salary_avg) FROM branch) AND c.birth_date = (SELECT MIN(birth_date) FROM client)	financial
SELECT t1.amount FROM `loan` AS l JOIN `client` AS c ON l.account_id = c.client_id JOIN `trans` AS t1 ON c.client_id = t1.account_id WHERE l.amount = (SELECT MAX(amount) FROM `loan`) ORDER BY t1.trans_id ASC LIMIT 1;	financial
SELECT COUNT(*) FROM `client` WHERE `gender` = 'F' AND `district_id` = (SELECT `district_id` FROM `district` WHERE `region_name` = 'Jesenik');	financial
SELECT c.disp_id FROM client c JOIN trans t ON c.client_id = t.account_id WHERE t.amount = 5100 AND t.date = '1998-09-02'	financial
SELECT COUNT(DISTINCT account_id)  FROM account  JOIN order ON account.account_id = order.account_id  JOIN district ON district.A2 = 'Litomerice'  WHERE YEAR(order_date) = 1996;	financial
SELECT d.A2 FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM client c JOIN loan l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT o.account_id FROM `order` o JOIN `account` a ON o.account_id = a.account_id JOIN `district` d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' ORDER BY a.account_open_date ASC LIMIT 1;	financial
SELECT      (SELECT COUNT(CASE WHEN c.gender = 'M' THEN 1 END)       FROM client c       JOIN district d ON c.district_id = d.district_id       WHERE d.region_name = 'South Bohemia') * 100.0 /      (SELECT COUNT(*)       FROM client c       JOIN district d ON c.district_id = d.district_id       WHERE d.region_name = 'South Bohemia') AS male_client_percentage FROM      (SELECT region_name, district_id, MAX(inhabitants) AS max_inhabitants      FROM district      WHERE region_name = 'South Bohemia'      GROUP BY region_name) AS max_inhabitants_branch JOIN      district ON max_inhabitants_branch.district_id = district.district_id	financial
WITH InitialBalance AS (     SELECT a.account_id, a.date, SUM(t.account) AS initial_balance     FROM account a     JOIN trans t ON a.account_id = t.account_id     WHERE a.date = '1993-03-22'     GROUP BY a.account_id, a.date ), FinalBalance AS (     SELECT a.account_id, a.date, SUM(t.account) AS final_balance     FROM account a     JOIN trans t ON a.account_id = t.account_id     WHERE a.date = '1998-12-27'     GROUP BY a.account_id, a.date ), FirstLoanDate AS (     SELECT cl.client_id     FROM client cl     JOIN loan l ON cl.client_id = l.account_id     WHERE l.date = (         SELECT MIN(date)         FROM loan         WHERE date <= '1993-07-05'     ) ), AccountBalances AS (     SELECT fld.client_id, ib.initial_balance, fb.final_balance     FROM FirstLoanDate fld     JOIN InitialBalance ib ON fld.client_id = ib.account_id     JOIN FinalBalance fb ON fld.client_id = fb.account_id ) SELECT (fb.final_balance - ib.initial_balance) / ib.initial_balance * 100 AS increase_rate FROM AccountBalances ib, FinalBalance fb WHERE ib.client_id = fb.account_id;	financial
SELECT      (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) / SUM(l.amount)) * 100 AS percentage_paid FROM      loan l;	financial
SELECT      ROUND((COUNT(CASE WHEN l.amount < 100000 AND l.status = 'C' THEN 1 END) * 100.0) / COUNT(DISTINCT a.account_id), 2) AS percentage_running_no_issue FROM      loan l JOIN      account a ON l.account_id = a.account_id	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date BETWEEN '1993-01-01' AND '1993-12-31' AND a.account_id IN (     SELECT account_id     FROM trans     WHERE date > (SELECT issued FROM card WHERE card_id = (         SELECT card_id         FROM card         WHERE account_id = a.account_id         ORDER BY issued DESC         LIMIT 1     ))     AND `bank` IS NULL     AND `account` IS NULL     AND `date` = (SELECT MAX(date) FROM trans WHERE account_id = a.account_id) );	financial
SELECT a.account_id, a.frequency FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.name = 'east Bohemia' AND YEAR(a.date) BETWEEN 1995 AND 2000;	financial
SELECT `account`.account_id, `account`.date FROM `account` JOIN `district` ON `account`.district_id = `district`.district_id WHERE `district`.A2 = 'Prachatice';	financial
SELECT d.A2, d.A3 FROM district d JOIN card c ON d.district_id = c.disp_id JOIN loan l ON c.card_id = l.account_id WHERE l.loan_id = 4990;	financial
SELECT l.account_id, a2.district, a3.region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district a2 ON a.district_id = a2.district_id JOIN region a3 ON a2.region_id = a3.region_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3, d.A11 FROM loan l JOIN district d ON l.account_id = d.A9 WHERE l.duration = 60;	financial
SELECT      d.district,     d.state,     ((d.unemployment_rate_2016 - d.unemployment_rate_2015) / d.unemployment_rate_2015) * 100 AS unemployment_increment_rate FROM      (SELECT          district,          state,          (SELECT unemployment_rate FROM unemployment WHERE year = 2016 AND district = d.district) AS unemployment_rate_2016,         (SELECT unemployment_rate FROM unemployment WHERE year = 2015 AND district = d.district) AS unemployment_rate_2015     FROM          district d     INNER JOIN          account a ON d.district = a.district     INNER JOIN          loan l ON a.account_id = l.account_id     WHERE          l.status = 'D'     ) AS subquery	financial
SELECT      (COUNT(*) FILTER (WHERE a.district_id = (SELECT district_id FROM district WHERE A2 = 'Decin' AND YEAR(a.date) = 1993)) * 100.0) /      COUNT(*) FROM      account a WHERE      YEAR(a.date) = 1993;	financial
SELECT DISTINCT account_id FROM account WHERE `frequency` = 'POPLATEK MESICNE';	financial
SELECT d.district_id, d.A2, COUNT(a.account_id) AS female_account_holders FROM district d JOIN account a ON d.A8 = a.gender AND d.district_id = a.district WHERE d.A8 = 'F' GROUP BY d.district_id, d.A2 ORDER BY female_account_holders DESC LIMIT 9;	financial
SELECT d.A2, SUM(t.amount) AS total_withdrawals FROM `account` a JOIN `trans` t ON a.account_id = t.account_id JOIN `district` d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT a.account_id) AS accounts_without_cards FROM account a LEFT JOIN card c ON a.account_id = c.disp_id LEFT JOIN disp d ON c.disp_id = d.disp_id LEFT JOIN region r ON d.region_id = r.region_id WHERE r.region_name = 'South Bohemia' AND c.card_id IS NULL;	financial
SELECT d.A3 AS district_name, COUNT(l.loan_id) AS active_loans_count FROM district d JOIN loan l ON d.district_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.district_id ORDER BY active_loans_count DESC LIMIT 1;	financial
SELECT AVG(amount) AS average_loan_amount FROM loan WHERE status = 'A' AND client_id IN (     SELECT client_id     FROM client     WHERE gender = 'M' );	financial
SELECT      d.A2 AS branch_location,      d.A13 AS unemployment_rate FROM      district d WHERE      d.A13 = (SELECT MAX(A13) FROM district WHERE A13 IS NOT NULL AND A12 = 1996)     AND d.A12 = 1996 ORDER BY      d.A13 DESC;	financial
;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.operation = 'VYBER KARTOU' AND a.frequency = 'POPLATEK MESICNE' AND t.balance < 0;	financial
SELECT COUNT(DISTINCT l.account_id) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.amount >= 250000 AND a.frequency = 'POPLATEK MESICNE' AND l.date BETWEEN '1995-01-01' AND '1997-12-31' AND l.status = 'A';	financial
SELECT COUNT(DISTINCT l.account_id) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE a.branch = 1 AND (l.status = 'C' OR l.status = 'D');	financial
SELECT COUNT(c.client_id) AS male_clients_count FROM client c JOIN crime cr ON c.district_id = cr.district_id WHERE c.gender = 'M' AND cr.year = 1995 AND cr.crime_category = 'A15' AND c.district_id = (     SELECT district_id     FROM (         SELECT district_id, COUNT(*) AS crime_count         FROM crime         WHERE year = 1995 AND crime_category = 'A15'         GROUP BY district_id         ORDER BY crime_count DESC         LIMIT 2, 1     ) AS subquery );	financial
SELECT COUNT(*) FROM card JOIN disp ON card.disp_id = disp.disp_id WHERE card.type = 'gold' AND disp.type = 'OWNER';	financial
SELECT COUNT(DISTINCT `account_id`)  FROM `account` JOIN `order` ON `account.account_id` = `order.account_id` JOIN `district` ON `account.district_id` = `district.district_id` WHERE `district.A2` = 'Pisek';	financial
SELECT t.district FROM trans t WHERE t.date BETWEEN '1997-01-01' AND '1997-12-31' GROUP BY t.district HAVING SUM(t.amount) > 10000;	financial
SELECT DISTINCT o.account_id FROM order o JOIN account a ON o.account_id = a.account_id WHERE o.k_symbol = 'SIPO' AND a.city = 'Pisek';	financial
SELECT DISTINCT t.account_id FROM `card` c JOIN `disp` d ON c.disp_id = d.disp_id JOIN `trans` t ON c.card_id = d.card_id WHERE c.type = 'gold';	financial
SELECT AVG(amount) AS average_credit_card_withdrawn FROM `trans` WHERE operation = 'VYBER KARTOU' AND date >= '2021-01-01' AND date <= '2021-12-31' AND account_id IN (     SELECT account_id     FROM `account`     WHERE date >= '2021-01-01' AND date <= '2021-12-31' );	financial
SELECT DISTINCT t1.account_id FROM `trans` t1 WHERE t1.type = 'VYBER KARTOU' AND YEAR(t1.date) = 1998 AND t1.amount <      (SELECT AVG(t2.amount) FROM `trans` t2 WHERE t2.type = 'VYBER KARTOU' AND YEAR(t2.date) = 1998);	financial
SELECT c.client_id FROM client c JOIN card crd ON c.client_id = crd.disp_id JOIN account acc ON crd.disp_id = acc.account_id JOIN loan l ON acc.account_id = l.account_id WHERE c.gender = 'F';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND d.region = 'South Bohemia';	financial
SELECT DISTINCT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.A2 = 'Tabor' AND account.account_type = 'OWNER';	financial
SELECT DISTINCT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency = 'OWNER' AND d.A11 > 8000 AND d.A11 <= 9000;	financial
SELECT COUNT(DISTINCT o.account_id) FROM `trans` t JOIN `account` a ON t.account_id = a.account_id WHERE a.region = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(A15) AS average_crimes FROM crime WHERE A3 IN (SELECT region              FROM region              WHERE A15 > 4000 AND year_opened >= 1997)	financial
SELECT COUNT(c.card_id) FROM card c JOIN account a ON c.disp_id = a.account_id WHERE c.type = 'classic' AND a.frequency = 'OWNER';	financial
SELECT COUNT(c.client_id)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A2 = 'Hl.m. Praha';	financial
SELECT      (COUNT(CASE WHEN c.type = 'gold' AND c.issued < '1998-01-01' THEN 1 END) * 100.0) /      COUNT(c.card_id) AS gold_cards_issued_before_1998_percentage FROM      card c;	financial
SELECT `account`.account_id, `account`.name FROM `account` JOIN `loan` ON `account`.account_id = `loan`.account_id WHERE `loan`.amount = (SELECT MAX(amount) FROM `loan`);	financial
SELECT d.A15  FROM district d  JOIN account a ON d.district_id = a.district_id  WHERE a.account_id = 532 AND a.date = '1995-01-01';	financial
SELECT a.district_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 33333;	financial
SELECT trans_id, date, amount, balance FROM trans WHERE account_id IN (     SELECT account_id     FROM disp     WHERE client_id = 3356 ) AND operation = 'VYBER';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT c.type FROM card c JOIN client cl ON c.disp_id = cl.district_id WHERE cl.client_id = 13539;	financial
SELECT `A3`  FROM `district`  WHERE `district_id` = (     SELECT `disp_id`      FROM `card`      WHERE `card_id` = (         SELECT `account_id`          FROM `account`          WHERE `account_id` = 3541     ) );	financial
SELECT d.district_id, d.A2, COUNT(l.loan_id) AS loan_count FROM district d JOIN loan l ON d.district_id = l.account_id WHERE l.status = 'A' GROUP BY d.district_id ORDER BY loan_count DESC LIMIT 1;	financial
SELECT `account_id` FROM `order` WHERE `order_id` = 32423;	financial
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A5 = '65';	financial
SELECT COUNT(*) FROM account WHERE district_id = 18;	financial
SELECT c.client_id FROM client c JOIN card cd ON c.client_id = cd.disp_id WHERE cd.type = 'junior' AND cd.issued >= '1997-01-01';	financial
SELECT     ROUND((COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage_female FROM     client c JOIN     district d ON c.district_id = d.district_id WHERE     d.average_salary > 10000;	financial
SELECT      (SUM(CASE WHEN YEAR(l.date) = 1997 THEN l.amount ELSE 0 END) -       SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END)) /      SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END) * 100 AS growth_rate FROM      loan l JOIN      client c ON l.account_id = (SELECT account_id FROM account WHERE district_id = c.district_id) WHERE      c.gender = 'M'     AND l.date BETWEEN '1996-01-01' AND '1997-12-31';	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND bank IS NOT NULL AND issued > '1995-12-31';	financial
SELECT (SUM(CASE WHEN A3 = 'North Bohemia' THEN A16 ELSE 0 END) -        SUM(CASE WHEN A3 = 'East Bohemia' THEN A16 ELSE 0 END)) AS diff_crimes FROM crime_data WHERE year = 1996;	financial
SELECT COUNT(DISTINCT o.account_id) AS owner_dispositions,         COUNT(DISTINCT t.account) AS disponent_dispositions FROM `order` o LEFT JOIN `trans` t ON o.account_id = t.account_id AND o.account_id BETWEEN 1 AND 10 WHERE o.account_id BETWEEN 1 AND 10;	financial
SELECT      COUNT(`trans_id`) AS statement_requests,     SUM(CASE WHEN `k_symbol` = '3539' THEN 1 ELSE 0 END) AS total_debits_3539 FROM      `trans` WHERE      `account_id` = 3 AND `k_symbol` = 'SIPO';	financial
SELECT YEAR(birth_date) AS birth_year FROM client WHERE client_id = 130;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN trans t ON a.account_id = t.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU' AND t.operation = 'VKLAD';	financial
SELECT SUM(l.amount) AS total_debt,         SUM(l.amount) - SUM(l.payments) AS remaining_debt FROM loan l WHERE l.account_id = 992;	financial
SELECT SUM(t.amount) AS total_amount, c.gender FROM `trans` t JOIN `account` a ON t.account_id = a.account_id JOIN `client` c ON a.district_id = c.district_id WHERE a.account_id IN (     SELECT account_id     FROM `order`     WHERE account_id = 1 OR account_to = 1 ) AND t.trans_id = 851 GROUP BY c.gender;	financial
SELECT c.type FROM card c WHERE c.disp_id = (SELECT disp_id FROM client WHERE client_id = 9);	financial
SELECT SUM(amount) AS total_payment FROM `trans` WHERE `account_id` = 617;	financial
SELECT c.client_id FROM client c JOIN card card ON c.client_id = card.disp_id JOIN `disp` disp ON disp.disp_id = card.disp_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND disp.district_name = 'East Bohemia';	financial
SELECT c.client_id FROM client c JOIN loan l ON c.client_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN trans t ON c.client_id = t.account_id JOIN `order` o ON t.account_id = o.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND o.order_id IN (     SELECT o2.order_id     FROM `order` o2     JOIN trans t2 ON o2.account_id = t2.account_id     WHERE t2.account_id = c.client_id     AND t2.trans_id IN (         SELECT trans_id         FROM trans         WHERE account_id = c.client_id         AND amount > 4000     ) );	financial
SELECT COUNT(DISTINCT `account_id`)  FROM `account`  WHERE `account_city` = 'Beroun' AND `account_open_date` > '1996-12-31';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN card crd ON c.client_id = crd.disp_id WHERE c.gender = 'F' AND crd.type = 'junior';	financial
SELECT     (SELECT COUNT(*) FROM `client` c      INNER JOIN `disp` d ON c.district_id = d.district_id      WHERE d.district_name = 'Prague' AND c.gender = 'F') * 100.0 /      (SELECT COUNT(*) FROM `client` c      INNER JOIN `disp` d ON c.district_id = d.district_id      WHERE d.district_name = 'Prague') AS female_percentage	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(DISTINCT o.account_id) AS male_clients_percentage FROM      client c JOIN      account a ON c.district_id = a.district_id JOIN      `order` o ON a.account_id = o.account_id WHERE      a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(DISTINCT c.client_id) AS owner_count FROM client c JOIN account a ON c.district_id = a.district_id WHERE a.frequency = 'POPLATEK TYDNE' AND c.client_id = (SELECT client_id FROM client WHERE district_id = c.district_id AND client_id = (SELECT client_id FROM account WHERE frequency = 'POPLATEK TYDNE'));	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT c.client_id, c.birth_date FROM client c JOIN (     SELECT district_id     FROM client     WHERE gender = 'F'     ORDER BY birth_date ASC     LIMIT 1 ) AS oldest_female ON c.district_id = oldest_female.district_id JOIN (     SELECT district_id, AVG(salary) AS avg_salary     FROM client c     JOIN A11 a ON c.client_id = a.client_id     WHERE c.gender = 'F'     GROUP BY district_id     ORDER BY avg_salary ASC     LIMIT 1 ) AS lowest_salary ON c.district_id = lowest_salary.district_id WHERE c.gender = 'F';	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE client.birth_date BETWEEN '1920-01-01' AND '1920-12-31' AND A3 = 'East Bohemia';	financial
SELECT COUNT(*) FROM loan WHERE duration = 24 AND status = 'A' AND       (SELECT frequency        FROM account        WHERE account.account_id = loan.account_id) = 'POPLATEK TYDNE';	financial
SELECT      T.date AS transaction_date,     AVG(L.amount) AS average_loan_amount FROM      trans T JOIN      loan L ON T.account_id = L.account_id WHERE      L.status IN ('C', 'D')     AND T.operation = 'POPLATEK PO OBRATU' GROUP BY      T.date;	financial
SELECT a.account_id, a.district FROM account a JOIN card c ON a.account_id = c.account_id WHERE a.account_type = 'owner' AND c.disp_id IS NOT NULL;	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN card crd ON c.client_id = crd.disp_id JOIN disp ON crd.disp_id = disp.disp_id WHERE crd.type = 'gold' AND disp.type = 'OWNER';	financial
SELECT `bond_type`, COUNT(*) AS bond_count FROM `bond` GROUP BY `bond_type` ORDER BY bond_count DESC LIMIT 1;	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' AND atom.element = 'cl';	toxicology
SELECT AVG(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(CASE WHEN bond_type = '-' THEN 1 END) / COUNT(*) AS average_single_bonded FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.label = '+';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-';	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id), 2) AS percentage_of_carbon FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '=' WHERE      a.element = 'c'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c';	toxicology
SELECT a.element FROM atom a JOIN bond b ON a.atom_id = CONCAT(b.molecule_id, '_', b.bond_id) WHERE b.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN bond b ON a.atom_id = CONCAT(b.molecule_id, '_', b.bond_id) WHERE b.bond_type = '=';	toxicology
SELECT m.label, COUNT(a.atom_id) AS count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY count DESC LIMIT 1;	toxicology
SELECT b.bond_type FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id AND a.element = 'cl' WHERE b.bond_type IS NOT NULL;	toxicology
SELECT a1.atom_id AS atom1, a2.atom_id AS atom2 FROM atom a1 JOIN bond b ON a1.molecule_id = b.molecule_id AND b.bond_id LIKE 'TR000_%' JOIN atom a2 ON a2.molecule_id = b.molecule_id AND a2.atom_id != a1.atom_id WHERE b.bond_type = '-';	toxicology
SELECT m1.molecule_id AS MoleculeID1, m2.molecule_id AS MoleculeID2 FROM molecule m1 JOIN molecule m2 ON m1.molecule_id < m2.molecule_id WHERE m1.label = '-' AND m2.label = '-';	toxicology
SELECT element, MIN(COUNT(element))  FROM atom  WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1;	toxicology
SELECT `bond_type` FROM `bond` WHERE (`bond_id` = 'TR004_8' AND `atom_id2` = 'TR004_20') OR (`bond_id` = 'TR004_20' AND `atom_id2` = 'TR004_8');	toxicology
SELECT m.label  FROM molecule m  WHERE m.molecule_id NOT IN (     SELECT a.molecule_id      FROM atom a      WHERE a.element != 'sn' ) OR m.label IS NULL;	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.element IN ('i', 's') AND b.bond_type = '-';	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN bond b1 ON a1.molecule_id = b1.molecule_id AND a1.atom_id < b1.bond_id JOIN bond b2 ON b1.molecule_id = b2.molecule_id AND b1.bond_id < b2.bond_id JOIN bond b3 ON b2.molecule_id = b3.molecule_id AND b2.bond_id < b3.bond_id JOIN atom a2 ON a2.molecule_id = b3.molecule_id AND a2.atom_id = b3.bond_id WHERE b1.bond_type = '#' AND b2.bond_type = '#' AND b3.bond_type = '#';	toxicology
SELECT a1.atom_id FROM atom a1 JOIN atom a2 ON a1.molecule_id = a2.molecule_id WHERE a2.molecule_id = 'TR181';	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'f' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT a.atom_id), 2) AS percentage_fluorine_free_carcinogens FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+' AND a.element <> 'f';	toxicology
SELECT      ROUND((SUM(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) * 100.0) / COUNT(bond.bond_id), 2) AS percentage_carcinogenic_triple_bonds FROM      bond JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      molecule.label = '+'	toxicology
SELECT `element`, COUNT(`element`) as count FROM `atom` WHERE `molecule_id` = 'TR000' GROUP BY `element` ORDER BY `element` ASC LIMIT 3;	toxicology
SELECT a1.element AS atom1, a2.element AS atom2 FROM atom a1 JOIN bond b ON a1.atom_id = CONCAT(b.molecule_id, '_', b.bond_id, '_1') JOIN atom a2 ON a1.atom_id = CONCAT(a2.molecule_id, '_', b.bond_id, '_2') WHERE b.bond_id = 'TR001_2_6' AND b.molecule_id = 'TR001';	toxicology
SELECT (SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END)) AS difference FROM molecule;	toxicology
SELECT a.atom_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_id = 'TR000_2_5';	toxicology
SELECT b.bond_id FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.atom_id = 'TR000_2';	toxicology
SELECT m.molecule_id, COUNT(b.bond_id) AS double_bond_count FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY m.molecule_id ASC LIMIT 5;	toxicology
SELECT ROUND((SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) * 100.0) / COUNT(bond_id), 5) AS percent FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT ROUND((SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) / COUNT(molecule_id)) * 100, 3) AS percent_carcinogenic FROM molecule;	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id), 4) AS hydrogen_percentage FROM      atom a WHERE      a.molecule_id = 'TR206'	toxicology
SELECT `bond_type` FROM `bond` WHERE `molecule_id` = 'TR000';	toxicology
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR060';	toxicology
SELECT      bond_type,      COUNT(bond_type) AS bond_count,     CASE          WHEN COUNT(bond_type) = (SELECT MAX(bond_count) FROM (SELECT bond_type, COUNT(bond_type) AS bond_count FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type) AS bond_counts) THEN 'Majority'         ELSE 'Minority'     END AS majority_status,     CASE          WHEN m.label = '+' THEN 'Carcinogenic'         ELSE 'Non-carcinogenic'     END AS carcinogenic_status FROM      bond JOIN      molecule AS m ON bond.molecule_id = m.molecule_id WHERE      bond.molecule_id = 'TR010' GROUP BY      bond_type ORDER BY      bond_count DESC LIMIT 1;	toxicology
SELECT b.molecule_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.label = '-' GROUP BY b.molecule_id ORDER BY b.molecule_id ASC LIMIT 3;	toxicology
SELECT bond_id, bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR009' AND (bond_id LIKE 'TR009_12%' OR bond_id LIKE '%TR009_12%');	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id LIKE '%br%';	toxicology
SELECT b.bond_type, a1.atom_id AS atom_id1, a2.atom_id AS atom_id2 FROM bond b JOIN atom a1 ON b.bond_id = CONCAT(b.molecule_id, '_', a1.atom_id) JOIN atom a2 ON b.bond_id = CONCAT(b.molecule_id, '_', a2.atom_id) WHERE b.bond_id = 'TR001_6_9';	toxicology
SELECT m.label, CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(DISTINCT bond_id) AS connections_count FROM bond WHERE atom_id LIKE 'TR%_19';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR004';	toxicology
SELECT COUNT(*)  FROM `molecule`  WHERE `label` = '-';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN atom a2 ON a1.molecule_id = a2.molecule_id AND a1.atom_id < a2.atom_id WHERE a1.element = 'p' AND a2.element = 'n';	toxicology
SELECT m.molecule_id, COUNT(b.bond_id) AS double_bond_count FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT      AVG(bond_count) AS average_bonds FROM (     SELECT          a.atom_id,         COUNT(b.bond_id) AS bond_count     FROM          atom a     LEFT JOIN          bond b ON a.atom_id = CONCAT(b.molecule_id, '_', SUBSTRING_INDEX(a.atom_id, '_', -1))     WHERE          a.element = 'i'     GROUP BY          a.atom_id ) AS bond_counts;	toxicology
SELECT b.bond_id, b.bond_type FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) + 0 = 45;	toxicology
SELECT a.element FROM atom a WHERE NOT EXISTS (     SELECT 1     FROM atom a2     WHERE a2.molecule_id = a.molecule_id AND a2.atom_id <> a.atom_id ) AND a.molecule_id IS NOT NULL;	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id AND a.atom_id < b.bond_id JOIN bond c ON a.molecule_id = c.molecule_id AND c.bond_id < a.atom_id JOIN bond d ON a.molecule_id = d.molecule_id AND d.bond_id < c.bond_id WHERE b.bond_type = '#' AND c.bond_type = '#' AND d.bond_type = '#' AND a.molecule_id = 'TR041';	toxicology
SELECT a.element FROM atom a JOIN bond b ON a.atom_id = CONCAT(b.molecule_id, '_', b.bond_id) WHERE b.bond_id = 'TR144_8_19';	toxicology
SELECT `molecule_id` FROM `molecule` WHERE `label` = '+' AND `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `bond_type` = ' = ') GROUP BY `molecule_id` ORDER BY COUNT(`bond_type`) DESC LIMIT 1;	toxicology
SELECT label FROM molecule WHERE label = '+' GROUP BY label ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT DISTINCT a1.atom_id FROM atom a1 JOIN bond b1 ON a1.atom_id = CONCAT(b1.molecule_id, '_', SUBSTRING_INDEX(b1.bond_id, '_', -1)) JOIN atom a2 ON a2.atom_id = SUBSTRING_INDEX(b1.bond_id, '_', 1) WHERE a1.element = 'pb' AND a2.element IS NOT NULL;	toxicology
SELECT a.element FROM atom a JOIN bond b ON a.atom_id = CONCAT(SUBSTRING_INDEX(b.bond_id, '_', 1), '_', SUBSTRING_INDEX(b.bond_id, '_', -1)) WHERE b.bond_type = '#';	toxicology
SELECT      bond_type,      (COUNT(bond_id) * 100.0) /      (SELECT COUNT(DISTINCT atom_id)       FROM atom       WHERE element =          (SELECT element           FROM atom           WHERE atom_id =              (SELECT atom_id               FROM atom               GROUP BY element               ORDER BY COUNT(atom_id) DESC               LIMIT 1))) AS percentage FROM bond GROUP BY bond_type ORDER BY percentage DESC LIMIT 1;	toxicology
SELECT      ROUND((SUM(CASE WHEN bond.`bond_type` = '-' THEN 1 ELSE 0 END) * 100) / COUNT(bond.bond_id), 5) AS single_bond_carcinogenic_proportion FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.`bond_type` = '-' AND molecule.label = '+';	toxicology
SELECT SUM(CASE WHEN `element` IN ('c', 'h') THEN 1 ELSE 0 END) AS total_carbon_hydrogen_atoms FROM `atom`;	toxicology
SELECT atom_id FROM atom WHERE element = 's';	toxicology
SELECT bond.bond_type FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element) FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '-' JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT COUNT(a.atom_id) AS total_triple_bond_atoms FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id AND a.atom_id < b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#'  AND (a.element = 'p' OR a.element = 'br') AND m.label = '+';	toxicology
SELECT `molecule_id` FROM `molecule` WHERE `label` = '+';	toxicology
SELECT b.molecule_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.label = '+';	toxicology
SELECT      ROUND(         (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100,          2     ) AS cl_percentage FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id WHERE      b.bond_type = '-' GROUP BY      b.molecule_id;	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT `molecule_id`  FROM `molecule`  WHERE `label` = '-';	toxicology
SELECT COUNT(*) AS total_carcinogenic_molecules FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN bond b ON a1.atom_id = SUBSTRING_INDEX(b.bond_id, '_', 1) JOIN atom a2 ON a1.molecule_id = a2.molecule_id AND a2.atom_id = SUBSTRING_INDEX(b.bond_id, '_', -1) WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(*)  FROM atom  WHERE element = 'i';	toxicology
SELECT     MAX(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_count,     MAX(CASE WHEN m.label = '-' THEN 1 ELSE 0 END) AS non_carcinogenic_count FROM     atom a JOIN     molecule m ON a.molecule_id = m.molecule_id WHERE     a.element = 'ca';	toxicology
SELECT COUNT(*)  FROM atom AS a  JOIN bond AS b ON a.atom_id = CONCAT(b.molecule_id, '_', b.bond_id) WHERE a.element = 'cl' AND b.bond_id = 'TR001_1_8'  AND EXISTS (     SELECT 1      FROM atom AS c      JOIN bond AS d ON c.atom_id = CONCAT(d.molecule_id, '_', d.bond_id)     WHERE c.element = 'c' AND d.bond_id = 'TR001_1_8' );	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '#' AND m.label = '-' AND b.bond_type = '#' AND m.molecule_id IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element = 'c' ) GROUP BY m.molecule_id HAVING COUNT(DISTINCT a.atom_id) > 2;	toxicology
SELECT      (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.molecule_id)) * 100 AS percentage_of_chlorine_in_carcinogens FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+'	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR001';	toxicology
SELECT `molecule_id` FROM `bond` WHERE `bond_type` = '=';	toxicology
SELECT a1.atom_id AS first_atom_id, a2.atom_id AS second_atom_id FROM `atom` a1 JOIN `bond` b ON a1.atom_id = b.bond_id JOIN `atom` a2 ON a2.atom_id = SUBSTRING(b.bond_id, LENGTH(a1.atom_id) + 1) WHERE b.bond_type = '#' AND a1.atom_id < a2.atom_id ORDER BY a1.atom_id, a2.atom_id;	toxicology
SELECT a.element  FROM atom a  JOIN bond b ON a.atom_id = CONCAT(b.molecule_id, '_', b.bond_id)  WHERE b.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(*) FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-';	toxicology
SELECT `label`  FROM `molecule`  WHERE `molecule_id` = (SELECT `molecule_id` FROM `bond` WHERE `bond_id` = 'TR001_10_11');	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT      a.molecule_id,      a.element FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+'      AND SUBSTR(a.atom_id, 7, 1) = '4'	toxicology
SELECT      m.label AS label,     (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 1.0) / COUNT(a.atom_id) AS ratio FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.molecule_id = 'TR006' GROUP BY      m.label;	toxicology
SELECT      chemical_compound,     carcinogenic_label FROM      chemical_data WHERE      element = 'ca' AND      carcinogenic_label = '+';	toxicology
SELECT bond_type  FROM bond  WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'c');	toxicology
SELECT a1.element, a2.element FROM atom a1 JOIN atom a2 ON a1.atom_id = CONCAT(SUBSTR('TR001_10_11', 1, 5), '_', SUBSTR('TR001_10_11', 7, 2)) AND a2.atom_id = CONCAT(SUBSTR('TR001_10_11', 1, 5), '_', SUBSTR('TR001_10_11', 10, 2)) WHERE a1.atom_id = CONCAT(SUBSTR('TR001_10_11', 1, 5), '_', SUBSTR('TR001_10_11', 7, 2)) AND a2.atom_id = CONCAT(SUBSTR('TR001_10_11', 1, 5), '_', SUBSTR('TR001_10_11', 10, 2)) AND a1.element != a2.element;	toxicology
SELECT      (COUNT(CASE WHEN b.bond_type = '#' THEN 1 END) * 100.0) / COUNT(*) AS triple_bond_percentage FROM      bond b JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT      COUNT(CASE WHEN b.`bond_type` = '=' THEN 1 END) / COUNT(b.`bond_id`) * 100 AS percent_double_bond FROM      bond b WHERE      b.`molecule_id` = 'TR047'	toxicology
SELECT      m.label AS MoleculeLabel,     CASE          WHEN a.atom_id = 'TR001_1' THEN 'Carcinogenic'         ELSE 'Not Carcinogenic'     END AS CarcinogenicStatus FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.atom_id = 'TR001_1';	toxicology
SELECT COUNT(*)  FROM `molecule`  WHERE `molecule_id` = 'TR151' AND `label` = '+';	toxicology
SELECT DISTINCT `element` FROM `atom` WHERE `molecule_id` = 'TR151' AND `element` IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND `element` IS NOT NULL;	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id BETWEEN 'TR010' AND 'TR050'   AND a.element = 'c';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+' AND b.bond_type = '=';	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+';	toxicology
SELECT b.molecule_id  FROM bond b JOIN atom a1 ON b.molecule_id = a1.molecule_id JOIN atom a2 ON b.molecule_id = a2.molecule_id WHERE a1.atom_id = 'TR000_1' AND a2.atom_id = 'TR000_2' AND b.bond_id = 'TR000_1_2';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label != '-';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' AND m.label = '+' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.molecule_id)  FROM      atom a  JOIN      molecule m ON a.molecule_id = m.molecule_id;	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` = 'TR124' AND `label` = '+';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR186';	toxicology
SELECT `bond_type`  FROM `bond`  WHERE `bond_id` = 'TR007_4_19';	toxicology
SELECT DISTINCT `element` FROM `atom` WHERE `atom_id` IN (     SELECT `atom_id`     FROM `atom`     WHERE `molecule_id` = (         SELECT `molecule_id`         FROM `atom`         WHERE `atom_id` = 'TR001_2_4'     ) );	toxicology
SELECT COUNT(*) AS double_bonds_count,         CASE WHEN `molecule`.`label` = '+' THEN 'Yes' ELSE 'No' END AS carcinogenic FROM `molecule` JOIN `bond` ON `molecule`.`molecule_id` = `bond`.`molecule_id` WHERE `bond`.`bond_type` = ' = ' AND `molecule`.`molecule_id` = 'TR006';	toxicology
SELECT m.molecule_id, GROUP_CONCAT(a.element ORDER BY a.element) AS elements FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.molecule_id;	toxicology
SELECT b.bond_id, a1.atom_id AS atom_id_1, a2.atom_id AS atom_id_2 FROM bond b JOIN atom a1 ON b.molecule_id = a1.molecule_id AND b.bond_id LIKE CONCAT('%', a1.atom_id) JOIN atom a2 ON b.molecule_id = a2.molecule_id AND b.bond_id LIKE CONCAT('%', a2.atom_id) WHERE b.bond_type = '-' AND a1.atom_id != a2.atom_id;	toxicology
SELECT m.molecule_id, GROUP_CONCAT(DISTINCT a.element ORDER BY a.element) AS elements FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '#' JOIN molecule m ON a.molecule_id = m.molecule_id GROUP BY m.molecule_id;	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN atom a2 ON a1.atom_id = CONCAT('TR000_', SUBSTR(a2.atom_id, 5, 2)) WHERE a1.molecule_id = 'TR000' AND a2.molecule_id = 'TR000' AND a1.atom_id < a2.atom_id AND a1.atom_id = 'TR000_2' AND a2.atom_id = 'TR000_3';	toxicology
SELECT COUNT(DISTINCT a1.atom_id)  FROM atom a1 JOIN atom a2 ON a1.molecule_id = a2.molecule_id WHERE a1.element = 'cl' AND a2.element = 'cl' AND a1.atom_id != a2.atom_id;	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR346';  SELECT COUNT(DISTINCT bond_type) AS bond_types_count FROM bond WHERE molecule_id = 'TR346';	toxicology
SELECT COUNT(DISTINCT b.molecule_id) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` NOT IN (     SELECT `molecule_id`     FROM `atom`     WHERE `element` = 's' ) AND `molecule_id` NOT IN (     SELECT `molecule_id`     FROM `bond`     WHERE `bond_type` = '=' );	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT molecule_id FROM molecule WHERE label = '+' AND label LIKE '%cl%'	toxicology
SELECT `molecule_id` FROM `molecule` WHERE `label` = '-' AND `label` LIKE '%c%'	toxicology
SELECT      (SUM(CASE WHEN `label` = '+' AND `element` = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(`atom_id`) AS percentage FROM      `atom` WHERE      EXISTS (SELECT 1 FROM `molecule` WHERE `molecule`.`molecule_id` = `atom`.`molecule_id` AND `label` = '+');	toxicology
SELECT `molecule_id`  FROM `bond`  WHERE `bond_id` = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN bond b ON a.atom_id = CONCAT(b.molecule_id, '_', SUBSTRING_INDEX(b.bond_id, '_', -1))  WHERE b.bond_id = 'TR001_3_4';	toxicology
SELECT bond_type  FROM bond  WHERE bond_id IN (     SELECT bond_id      FROM bond      WHERE molecule_id = (SELECT molecule_id FROM atom WHERE atom_id = 'TR000_1')      AND bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = (SELECT molecule_id FROM atom WHERE atom_id = 'TR000_2')) );	toxicology
SELECT m.label AS molecule FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id IN ('TR000_2', 'TR000_4');	toxicology
SELECT element  FROM atom  WHERE atom_id = 'TR000_1';	toxicology
SELECT `label` FROM `molecule` WHERE `molecule_id` = 'TR000'	toxicology
SELECT      (SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id) AS percentage FROM      atom a JOIN      bond b ON a.atom_id = CONCAT(b.molecule_id, '_', b.bond_id) WHERE      b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id LIKE '%N%';	toxicology
SELECT m.molecule_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' AND COUNT(a.atom_id) > 5 GROUP BY m.molecule_id	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR024' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') GROUP BY a.element HAVING COUNT(a.atom_id) = 2;	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' AND m.label = '+' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.molecule_id)  FROM      atom a  JOIN      molecule m ON a.molecule_id = m.molecule_id	toxicology
SELECT COUNT(*)  FROM `molecule`  WHERE `label` = '+';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR004_7' AND m.label = '-';	toxicology
SELECT COUNT(*) FROM `atom` a JOIN `bond` b ON a.molecule_id = b.molecule_id WHERE a.element = 'o' AND b.bond_type = ' = ';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' AND m.label = '-';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN bond b ON a.atom_id = b.bond_id WHERE a.molecule_id = 'TR002';	toxicology
SELECT a.atom_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id AND a.atom_id LIKE CONCAT(SUBSTRING(b.bond_id, 1, 6), '%') WHERE a.element = 'c' AND b.bond_type = '=' AND a.molecule_id = 'TR012';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT id, artist, asciiName, name, cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id, name, artist, availability, scryfallId FROM cards WHERE borderColor IS NULL AND cardKingdomFoilId IS NULL AND cardKingdomId IS NULL;	card_games
SELECT name FROM cards WHERE faceConvertedManaCost = (     SELECT MAX(faceConvertedManaCost)     FROM cards )	card_games
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.mtgoId = s.mtgoCode WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND s.format = 'gladiator';	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power = '*' OR c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT c.id FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel' AND r.text LIKE '%ruling%' AND EXISTS (     SELECT 1     FROM cards     WHERE uuid = c.uuid     AND (hasContentWarning = 1 OR hasFoil = 0 OR hasNonFoil = 0 OR isFullArt = 0 OR isOversized = 1 OR isReprint = 1 OR isStarter = 1 OR isTextless = 1) );	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT c.name, c.artist, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.name, c.artist, c.isPromo ORDER BY COUNT(r.uuid) DESC LIMIT 1;	card_games
SELECT fd.language, fd.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name = 'Annul' AND c.number = '29';	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN t.language = 'Chinese Simplified' THEN 1 ELSE 0 END) * 100.0) / COUNT(c.id) AS percentage_of_cards_in_Chinese_Simplified FROM      cards c JOIN      set_translations t ON c.setCode = t.setCode WHERE      t.language = 'Chinese Simplified';	card_games
SELECT      st.translation AS setName,     s.totalSetSize AS totalCardsInSet FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT `type`)  FROM `cards`  WHERE `artist` = 'Aaron Boyd';	card_games
SELECT `keywords` FROM `cards` WHERE `name` = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT `promoTypes` FROM `cards` WHERE `name` = 'Duress';	card_games
SELECT `borderColor` FROM `cards` WHERE `name` = 'Ancestor''s Chosen' LIMIT 1;	card_games
SELECT `originalType`  FROM `cards`  WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT t.language FROM foreign_data AS fd JOIN cards AS c ON fd.uuid = c.uuid JOIN sets AS s ON c.setCode = s.code JOIN set_translations AS t ON s.code = t.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM `cards` JOIN `legalities` ON `cards.uuid` = `legalities.uuid` WHERE `legalities.status` = 'restricted' AND `cards.isTextless` = 0;	card_games
SELECT r.text AS ruling_description FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT      c.name,      f.id AS foreign_data_id,      l.id AS legalities_id,      r.id AS rulings_id FROM      cards c LEFT JOIN      foreign_data f ON c.uuid = f.uuid LEFT JOIN      legalities l ON c.uuid = l.uuid LEFT JOIN      rulings r ON c.uuid = r.uuid WHERE      c.name = 'Cloudchaser Eagle';	card_games
SELECT `type` FROM `cards` WHERE `name` = 'Benalish Knight';	card_games
SELECT rulings.text FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.name = 'Benalish Knight';	card_games
SELECT cards.artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Phyrexian';	card_games
SELECT     (SELECT COUNT(*) FROM cards WHERE `borderColor` = 'borderless') * 100.0 / COUNT(*) AS borderless_percentage FROM cards;	card_games
SELECT COUNT(*) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.isReprint = 1;	card_games
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'borderless' AND EXISTS (     SELECT 1     FROM `foreign_data`     WHERE `cards.uuid` = `foreign_data.uuid`     AND `language` = 'Russian' );	card_games
SELECT      (COUNT(CASE WHEN fd.language = 'French' THEN 1 END) * 100.0) / COUNT(CASE WHEN c.isStorySpotlight = 1 THEN 1 END) AS percentage_french_story_spotlight_cards FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE `borderColor` = 'black' AND `availability` = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords LIKE '%Flying%';	card_games
SELECT COUNT(*) FROM cards WHERE `originalType` = 'Summon - Angel' AND `subtypes` NOT LIKE '%Angel%'	card_games
SELECT c.id FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.hasFoil = 1 AND (c.cardKingdomFoilId IS NOT NULL OR c.cardKingdomId IS NOT NULL) AND c.hasNonFoil = 1;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT `edhrecRank` FROM `cards` WHERE `frameVersion` = '2015';	card_games
SELECT cards.artist FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = '核心系列第十版' AND set_translations.language = 'Chinese Simplified';	card_games
SELECT c.* FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability LIKE '%paper%' AND fd.language = 'Japanese';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND uuid IN (SELECT uuid FROM legalities WHERE status = 'Banned');	card_games
SELECT c.uuid, fd.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data fd ON c.uuid = fd.uuid WHERE l.format = 'legacy';	card_games
SELECT rulings.text FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.name = 'Beacon of Immortality';	card_games
SELECT COUNT(*) AS total_cards_with_future_frame, l.status AS legality_status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'legal';	card_games
SELECT cards.name, cards.colors FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.setCode = 'OGW';	card_games
SELECT c.name, c.convertedManaCost, st.translation, st.language FROM cards c JOIN set_translations st ON c.uuid = st.uuid WHERE c.convertedManaCost = 5 AND c.setCode = '10E';	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT `colors`, `layout`  FROM `cards` WHERE `id` BETWEEN 1 AND 20;	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language != 'English';	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND hand = '-1' AND mtgoId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability LIKE '%paper%' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal'   AND frameVersion = '2003'   AND borderColor = 'black'   AND availability LIKE '%mtgo%'   AND availability LIKE '%paper%';	card_games
SELECT SUM(faceConvertedManaCost) AS totalUnconvertedManaCost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT `type`  FROM `cards`  WHERE `availability` LIKE '%arena%';	card_games
SELECT s.setCode FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Spanish';	card_games
SELECT      ROUND((SUM(CASE WHEN `cards`.frameEffects = 'legendary' AND `cards`.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) /            COUNT(`cards`.id), 2) AS legendary_frame_effect_cards_percentage FROM `cards` WHERE `cards`.frameEffects = 'legendary';	card_games
SELECT      (SUM(CASE WHEN c.isStorySpotlight = 1 AND c.isTextless = 0 THEN 1 ELSE 0 END) * 100.0) /      (SUM(CASE WHEN c.isStorySpotlight = 1 THEN 1 ELSE 0 END)) AS percentage FROM      cards c ORDER BY      c.id;	card_games
SELECT cards.name,         (SUM(CASE WHEN foreign_data.language = 'Spanish' THEN 1 ELSE 0 END) * 100.0) / COUNT(cards.id) AS percentage_spanish FROM cards LEFT JOIN foreign_data ON cards.uuid = foreign_data.uuid GROUP BY cards.name ORDER BY percentage_spanish DESC;	card_games
SELECT DISTINCT t.language FROM sets s JOIN set_translations t ON s.code = t.setCode WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT id FROM cards WHERE type LIKE '%Creature%' AND uuid IN (     SELECT uuid     FROM legalities     WHERE status = 'Legal' );	card_games
SELECT subtypes, supertypes FROM cards WHERE subtypes IS NOT NULL AND supertypes IS NOT NULL AND language = 'German';	card_games
SELECT COUNT(*) FROM `cards` WHERE `power` IS NULL OR `power` = '*' AND `text` LIKE '%triggered ability%';	card_games
SELECT COUNT(*) FROM cards WHERE type LIKE '%Mana%' AND       side IS NULL AND       id IN (SELECT uuid FROM legalities)	card_games
SELECT id  FROM cards  WHERE artist = 'Erica Yang'  AND availability LIKE '%paper%' AND id IN (SELECT uuid FROM legalities);	card_games
SELECT `artist` FROM `cards` WHERE `text` = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT `name`  FROM `cards` c  JOIN `foreign_data` fd ON c.uuid = fd.uuid  WHERE c.artist = 'Matthew D. Wilson'  AND c.borderColor = 'black'  AND c.layout = 'normal'  AND c.type = 'Creature'  AND fd.language = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.rarity = 'rare' AND rulings.date = '2007-02-01';	card_games
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 180 AND s.block = 'Ravnica';	card_games
SELECT      ROUND((COUNT(CASE WHEN `hasContentWarning` = 0 THEN 1 END) * 100.0) / COUNT(`id`), 2) AS percentage_no_content_warning FROM      `cards` JOIN      `legalities` ON `cards.uuid` = `legalities.uuid` WHERE      `legalities.format` = 'commander'      AND `legalities.status` = 'Legal';	card_games
SELECT      ROUND((COUNT(CASE WHEN `power` IS NULL OR `power` = '*' THEN 1 END AND `language` = 'French') * 100.0) / COUNT(CASE WHEN `power` IS NULL OR `power` = '*' THEN 1 END), 2) AS percentage_of_french_cards_without_power FROM `cards`;	card_games
SELECT      (COUNT(CASE WHEN s.type = 'expansion' THEN 1 END) * 100.0) / COUNT(CASE WHEN t.language = 'Japanese' THEN 1 END) AS percentage_japanese_expansion_sets FROM      sets s JOIN      set_translations t ON s.code = t.setCode WHERE      t.language = 'Japanese';	card_games
SELECT type FROM cards WHERE artist = 'Daren Bader'	card_games
SELECT COUNT(*) FROM cards WHERE colorIdentity IS NOT NULL AND borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name, power FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3;	card_games
SELECT language  FROM foreign_data  WHERE multiverseid = 149934;	card_games
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT      (COUNT(CASE WHEN `cards`.isTextless = 1 AND `cards`.layout = 'normal' THEN 1 END) / COUNT(`cards`.isTextless)) * 100 AS proportion FROM      `cards`	card_games
SELECT number FROM cards WHERE subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%' AND otherFaceIds IS NULL;	card_games
SELECT s.name, s.code FROM sets s WHERE s.mtgoCode IS NULL OR s.mtgoCode = '' ORDER BY s.name ASC LIMIT 3;	card_games
SELECT DISTINCT t1.name FROM sets AS t1 JOIN set_translations AS t2 ON t1.code = t2.setCode WHERE t1.mcmName = 'Archenemy' AND t1.setCode = 'ARC';	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5;	card_games
SELECT st.language, s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206;	card_games
SELECT s.id, s.code FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.code = 'SHM' ORDER BY s.id DESC LIMIT 2;	card_games
SELECT s.id FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON c.uuid IN (SELECT fd.uuid FROM foreign_data fd WHERE fd.language = 'Japanese') WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1;	card_games
SELECT      s.name AS setName,      s.baseSetSize AS totalCards FROM      sets s WHERE      EXISTS (         SELECT 1          FROM set_translations st          WHERE              st.setCode = s.code AND              st.language = 'Russian'     ) ORDER BY      s.baseSetSize DESC  LIMIT 1;	card_games
SELECT      (SELECT COUNT(*)       FROM cards       WHERE id IN (SELECT id FROM cards WHERE `isOnlineOnly` = 1)      AND id IN (SELECT id FROM foreign_data WHERE language = 'Chinese Simplified')      AND id IN (SELECT id FROM sets WHERE code = '10E')) /      (SELECT COUNT(*)       FROM cards       WHERE id IN (SELECT id FROM foreign_data WHERE language = 'Chinese Simplified')      AND id IN (SELECT id FROM sets WHERE code = '10E')) * 100 AS percentage	card_games
SELECT COUNT(*) FROM sets WHERE code IN (     SELECT setCode     FROM set_translations     WHERE language = 'Japanese' ) AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT name, borderColor FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE id = 174);	card_games
SELECT `name` FROM `sets` WHERE `code` = 'ALL';	card_games
SELECT DISTINCT `language` FROM `foreign_data` WHERE `name` = 'A Pedra Fellwar';	card_games
SELECT `code` FROM `sets` WHERE `releaseDate` = '2007-07-13';	card_games
SELECT s.baseSetSize, s.code FROM sets s WHERE s.block IN ('Masques', 'Mirage');	card_games
SELECT `code` FROM `sets` WHERE `type` = 'expansion';	card_games
SELECT      cards.name AS cardName,      cards.type FROM      cards JOIN      sets ON cards.mtgoFoilId = sets.id WHERE      sets.code = '10E' AND     cards.watermark = 'Boros';	card_games
SELECT c.name, fd.flavorText, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN cards c2 ON c.uuid = c2.uuid WHERE c.watermark = 'colorpie';	card_games
SELECT      ROUND(         (COUNT(CASE WHEN cards.convertedManaCost = 10 THEN 1 END) * 100.0) / COUNT(*),          2     ) AS percentage_of_10_mana FROM      cards WHERE      cards.name = 'Abyssal Horror';	card_games
SELECT `sets`.`code` FROM `sets` WHERE `sets`.`type` = 'expansion' AND `sets`.`isFoilOnly` = 0 AND `sets`.`isForeignOnly` = 0 AND `sets`.`isNonFoilOnly` = 0 AND `sets`.`isOnlineOnly` = 0 AND `sets`.`isPartialPreview` = 0;	card_games
SELECT      cards.name AS card_name,      cards.type AS card_type FROM      cards JOIN      foreign_data ON cards.uuid = foreign_data.uuid JOIN      sets ON cards.cardKingdomId = sets.code WHERE      cards.watermark = 'Abzan';	card_games
SELECT fd.language, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Azorius';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT `name` FROM `cards` WHERE `isTextless` = 0;	card_games
SELECT unconvertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE `borderColor` = 'white' AND (`power` = '*' OR `power` IS NULL);	card_games
SELECT c.name FROM cards c WHERE c.isPromo = 1 AND c.side IS NOT NULL;	card_games
SELECT `subtypes`, `supertypes` FROM `cards` WHERE `name` = 'Molimo, Maro-Sorcerer';	card_games
SELECT DISTINCT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE `availability` LIKE '%arena,mtgo%' AND `borderColor` = 'black';	card_games
SELECT      CASE          WHEN MAX(c1.convertedManaCost) > MAX(c2.convertedManaCost) THEN 'Serra Angel costs more converted mana'         WHEN MAX(c1.convertedManaCost) < MAX(c2.convertedManaCost) THEN 'Shrine Keeper costs more converted mana'         ELSE 'Both cards cost the same converted mana'     END as CostComparison FROM      cards c1 JOIN      cards c2 ON      c1.name = 'Serra Angel' AND c2.name = 'Shrine Keeper'	card_games
SELECT `artist` FROM `cards` WHERE `flavorName` = 'Battra, Dark Destroyer';	card_games
SELECT name, convertedManaCost FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT t.translation  FROM sets s  JOIN set_translations t ON s.code = t.setCode  WHERE s.name = (SELECT name FROM cards WHERE name = 'Ancestor''s Chosen')  AND t.language = 'Italian';	card_games
SELECT COUNT(*) FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `cards.name` = 'Angel of Mercy'	card_games
SELECT c.name  FROM cards c  JOIN sets s ON c.setCode = s.code  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS (     SELECT 1     FROM cards     JOIN foreign_data ON cards.uuid = foreign_data.uuid     WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'Korean' ) AS has_korean_version;	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.mtgoId = sets.code JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex';	card_games
SELECT baseSetSize  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT translation FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Eighth Edition') AND language = 'Chinese Simplified';	card_games
SELECT s.name FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT sets.releaseDate FROM cards JOIN sets ON cards.mcmId = sets.code WHERE cards.name = 'Ancestor''s Chosen';	card_games
SELECT `type` FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `translation` = 'Hauptset Zehnte Edition' LIMIT 1;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian' AND set_translations.translation IS NOT NULL;	card_games
SELECT name FROM cards JOIN sets ON cards.uuid = sets.uuid WHERE cards.name = 'Adarkar Valkyrie' AND sets.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.language = 'Italian' AND sets.baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND setCode = (SELECT code FROM sets WHERE name = 'Coldsnap');	card_games
SELECT c.name, c.convertedManaCost FROM cards c JOIN sets s ON c.mtgjsonV4Id = s.mtgoCode WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT artist FROM cards WHERE artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy') AND name = 'Coldsnap';	card_games
SELECT number  FROM cards  WHERE name = 'Coldsnap' AND number = '4';	card_games
SELECT COUNT(*) FROM cards AS C JOIN sets AS S ON C.mcmId = S.mcmId WHERE S.name = 'Coldsnap' AND C.convertedManaCost > 5 AND (C.power = '*' OR C.power IS NULL)	card_games
SELECT fd.flavorText FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Italian';	card_games
SELECT fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.flavorText IS NOT NULL;	card_games
SELECT type FROM cards WHERE name = 'Ancestor''s Chosen' AND flavorText LIKE '%German%'	card_games
SELECT c.name, rt.translation FROM cards c JOIN set_translations st ON c.setCode = st.setCode JOIN sets s ON st.setCode = s.code WHERE s.name = 'Coldsnap' AND st.language = 'Italian';	card_games
SELECT c.name, c.convertedManaCost FROM cards c JOIN sets s ON c.mcmMetaId = s.mcmName JOIN set_translations st ON s.code = st.setCode AND st.language = 'Italian' WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce';	card_games
SELECT      (SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) * 100.0) /      SUM(1) AS percentage_with_mana_cost_7 FROM      cards c JOIN      sets s ON c.cardKingdomId = s.id WHERE      s.name = 'Coldsnap';	card_games
SELECT      (COUNT(CASE WHEN card.cardKingdomFoilId IS NOT NULL AND card.cardKingdomId IS NOT NULL THEN 1 END) * 100.0) / COUNT(*) AS percentage_incredibly_powerful FROM      cards card JOIN      sets set_info ON card.name = set_info.name WHERE      set_info.name = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14'	card_games
SELECT `keyruneCode` FROM `sets` WHERE `code` = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName  FROM sets  WHERE releaseDate = '2017-06-09';	card_games
SELECT s.type  FROM sets s  WHERE s.name = 'From the Vault: Lore';	card_games
SELECT parentCode  FROM sets  WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text AS ruling_text, c.hasContentWarning AS has_content_warning FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' AND (r.text IS NOT NULL OR c.hasContentWarning = 1);	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.cardKingdomId WHERE c.name = 'Evacuation';	card_games
SELECT baseSetSize  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Rinascita di Alara';	card_games
SELECT `type` FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `translation` = 'Huitième édition';	card_games
SELECT st.translation FROM `cards` c JOIN `foreign_data` fd ON c.uuid = fd.uuid JOIN `set_translations` st ON fd.multiverseid = st.setCode WHERE c.name = 'Tendo Ice Bridge' AND st.language = 'French';	card_games
SELECT COUNT(*) FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `sets.name` = 'Tenth Edition' AND `set_translations.translation` IS NOT NULL;	card_games
SELECT t.translation  FROM sets s  JOIN set_translations t ON s.code = t.setCode  JOIN cards c ON s.code = c.mcmMetaId  WHERE c.name = 'Fellwar Stone' AND t.language = 'Japanese';	card_games
SELECT name, MAX(convertedManaCost) as maxManaCost FROM cards WHERE name = 'Journey into Nyx Hero''s Path' GROUP BY name ORDER BY maxManaCost DESC LIMIT 1;	card_games
SELECT `releaseDate` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `translation` = 'Ola de frío';	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON st.setCode = s.code WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards WHERE `name` = 'World Championship Decks 2004' AND `convertedManaCost` = 3.0;	card_games
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND name = 'Mirrodin';	card_games
SELECT      (SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100.0) /      SUM(CASE WHEN f.language = 'Japanese' THEN 1 ELSE 0 END)  FROM      cards c  JOIN      sets s ON c.cardKingdomId = s.code  JOIN      foreign_data f ON c.uuid = f.uuid  WHERE      f.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN sets.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) /      SUM(CASE WHEN sets.isOnlineOnly = 1 OR sets.isForeignOnly = 1 THEN 1 ELSE 0 END) AS percentage_online_only_brazil_portuguese FROM      cards JOIN      sets ON cards.code = sets.code JOIN      set_translations ON sets.code = set_translations.setCode WHERE      set_translations.language = 'Portuguese (Brazil)'	card_games
SELECT DISTINCT c.availability FROM cards c WHERE c.artist = 'Aleksi Briclot' AND c.isTextless = 1;	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1;	card_games
SELECT `artist` AS Illustrator, MAX(`convertedManaCost`) AS MaxConvertedManaCost FROM `cards` WHERE `side` IS NULL GROUP BY `artist` ORDER BY MaxConvertedManaCost DESC LIMIT 1;	card_games
SELECT MAX(`frameEffects`) AS most_common_frame_effect FROM `cards` WHERE `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL AND `frameEffects` IS NOT NULL GROUP BY `frameEffects` ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT      id,      asciiName,      cardKingdomId,      manaCost,      convertedManaCost  FROM      cards  WHERE      hand = 'duel'  ORDER BY      convertedManaCost DESC  LIMIT 10;	card_games
SELECT MIN(originalReleaseDate), s.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.cardKingdomId = s.code WHERE c.rarity = 'mythic' AND l.format = 'legal' GROUP BY s.format ORDER BY MIN(originalReleaseDate) LIMIT 1;	card_games
SELECT COUNT(c.id) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'rare' AND cards.types LIKE '%Enchantment%' AND cards.name = 'Abundance' AND legalities.format = 'Legal';	card_games
SELECT `format`, COUNT(`uuid`) AS `banned_count` FROM `legalities` WHERE `status` = 'Banned' GROUP BY `format` ORDER BY `banned_count` DESC LIMIT 1;	card_games
SELECT language FROM sets WHERE name = 'Battlebond';	card_games
SELECT artist, layout FROM cards GROUP BY artist, layout HAVING COUNT(*) = (SELECT MIN(count) FROM (SELECT COUNT(*) AS count FROM cards GROUP BY artist) AS min_counts) ORDER BY COUNT(*) ASC;	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND l.format = 'legacy' AND (c.hasContentWarning = 1 OR c.name LIKE '%Wizards of the Coast%');	card_games
SELECT c.name, s.format FROM cards c JOIN set_translations st ON c.setCode = st.setCode JOIN sets s ON st.setCode = s.code WHERE c.edhrecRank = 1 AND s.format = 'Banned';	card_games
SELECT AVG(TotalSetSize) AS AnnualAverageSets, MAX(language) AS CommonLanguage FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31';	card_games
SELECT DISTINCT artist FROM cards WHERE `availability` LIKE '%arena%' AND `borderColor` = 'black';	card_games
SELECT cards.uuid FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'oldschool' AND (legalities.status = 'banned' OR legalities.status = 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability LIKE '%paper%'	card_games
SELECT r.id, r.date, r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid JOIN sets ON cards.cardKingdomId = sets.code WHERE sets.name = 'Hour of Devastation' AND legalities.format = 'Legal';	card_games
SELECT s.name FROM sets s LEFT JOIN set_translations st_japanese ON s.code = st_japanese.setCode AND st_japanese.language = 'Japanese' LEFT JOIN set_translations st_korean ON s.code = st_korean.setCode AND st_korean.language = 'Korean' WHERE st_japanese.translation IS NULL AND st_korean.translation IS NOT NULL;	card_games
SELECT DISTINCT frameVersion FROM cards WHERE artist = 'Allen Williams';  SELECT name FROM cards WHERE artist = 'Allen Williams' AND availability = 'Banned';	card_games
SELECT      CASE WHEN u.DisplayName = 'Harlan' THEN 'Harlan' ELSE 'Jarrod Dixon' END AS UserDisplayName,     MAX(u.Reputation) AS MaxReputation FROM      users u WHERE      u.DisplayName = 'Harlan' OR u.DisplayName = 'Jarrod Dixon' GROUP BY      UserDisplayName ORDER BY      MaxReputation DESC LIMIT 1;	codebase_community
SELECT `DisplayName` FROM `users` WHERE YEAR(`CreationDate`) = 2011;	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT `DisplayName`  FROM `users`  WHERE `Views` = (SELECT MAX(`Views`) FROM `users`);	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u WHERE u.Views > 10 AND YEAR(u.CreationDate) > 2013;	codebase_community
SELECT COUNT(p.Id) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName AS OwnerDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT `users.DisplayName` FROM `posts` JOIN `users` ON `posts.OwnerUserId` = `users.Id` WHERE `posts.FavoriteCount` = (SELECT MAX(`FavoriteCount`) FROM `posts`)	codebase_community
SELECT SUM(CommentCount) AS TotalComments FROM posts WHERE OwnerDisplayName = 'csgillespie';	codebase_community
SELECT p.AnswerCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT `users.DisplayName` FROM `posts` JOIN `users` ON `posts.LastEditorUserId` = `users.Id` WHERE `posts.Title` = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL;	codebase_community
SELECT DISTINCT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20;	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Id = 1;	codebase_community
SELECT p.Id, p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags) ORDER BY p.Id LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Teacher' AND UserId = (     SELECT Id     FROM users     WHERE DisplayName = 'csgillespie' );	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Teacher' AND YEAR(Date) = 2011 AND UserId = (     SELECT Id     FROM users     WHERE DisplayName = 'csgillespie' );	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score) AS average_score FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT AVG(b.Count) AS avg_badges FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Views > 200;	codebase_community
SELECT      (COUNT(CASE WHEN u.Age > 65 THEN p.Id END) * 100.0) / COUNT(p.Id) AS ElderUserOwnershipPercentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 5	codebase_community
SELECT COUNT(*)  FROM votes  WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(*) AS NumRevivalBadges FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39.0'	codebase_community
SELECT Text  FROM comments  WHERE PostId = 107829  LIMIT 1;	codebase_community
SELECT      p.Id AS PostId,     p.CreationDate,     p.ClosedDate FROM      posts p JOIN      comments c ON p.Id = c.PostId WHERE      c.UserId = 23853 AND      c.CreationDate = '2013-07-12 09:08:18.0' AND      p.ClosedDate IS NULL;	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Tiago Pasqualini';	codebase_community
SELECT `users.DisplayName`  FROM `users`  JOIN `votes` ON `users.Id` = `votes.UserId`  WHERE `votes.Id` = 6347;	codebase_community
SELECT SUM(v.BountyAmount) AS TotalVotes FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = 24) /      (SELECT COUNT(*) FROM votes WHERE UserId = 24) AS postVoteRatio FROM      dual;	codebase_community
SELECT p.ViewCount FROM posts p WHERE p.Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT `Text` FROM `comments` WHERE `Score` = 17;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `WebsiteUrl` = 'http://stackoverflow.com';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT UserDisplayName  FROM comments  WHERE Text = 'thank you user93'	codebase_community
SELECT c.Id, c.PostId, c.Score, c.Text, c.CreationDate, c.UserId, c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT DISTINCT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT p.LastEditorDisplayName AS EditorDisplayName FROM posts p WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT p.Title FROM posts p WHERE p.LastEditorUserId = (     SELECT u.Id     FROM users u     WHERE u.DisplayName = 'Vebjorn Ljosa' )	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY p.Id, u.WebsiteUrl;	codebase_community
SELECT c.Id AS CommentId, c.Text AS CommentText, c.UserId, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(v.BountyAmount) AS TotalBountyAmount FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data%';	codebase_community
SELECT u.DisplayName FROM votes v JOIN posts p ON v.PostId = p.Id JOIN users u ON v.UserId = u.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT p.Title, p.Text, AVG(p.ViewCount) AS AverageViewCount FROM posts p JOIN tags t ON p.Tags LIKE '%<humor>%' GROUP BY p.Id;	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13;	codebase_community
SELECT `Id` FROM `users` ORDER BY `Reputation` DESC LIMIT 1;	codebase_community
SELECT `UserId` FROM `users` WHERE `Views` IS NOT NULL ORDER BY `Views` ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT `UserId`)  FROM `badges`  WHERE `Name` = 'Supporter' AND YEAR(`Date`) = 2011;	codebase_community
SELECT UserId, COUNT(Name) as BadgeCount FROM badges GROUP BY UserId HAVING BadgeCount > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name IN ('Teacher', 'Supporter') AND u.Location = 'New York';	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT p.OwnerUserId FROM posts p JOIN (     SELECT PostId, COUNT(*) as history_count     FROM postHistory     GROUP BY PostId     HAVING history_count = 1 ) ph ON p.Id = ph.PostId WHERE p.ViewCount >= 1000;	codebase_community
SELECT      c.UserId,     u.DisplayName,     b.Name AS Badge FROM      comments c JOIN      users u ON c.UserId = u.Id LEFT JOIN      badges b ON u.Id = b.UserId WHERE      (SELECT COUNT(*)       FROM comments       WHERE UserId = c.UserId) = (SELECT MAX(comment_count)                                    FROM (SELECT UserId, COUNT(*) AS comment_count                                          FROM comments                                          GROUP BY UserId) AS comment_counts)	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UsersWithTeacherBadgeFromIndia FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT     (         (COUNT(CASE WHEN Year(b.Date) = 2010 THEN 1 END) - COUNT(CASE WHEN Year(b.Date) = 2011 THEN 1 END)         * 100.0     ) /      (         COUNT(CASE WHEN Year(b.Date) = 2010 THEN 1 END) + COUNT(CASE WHEN Year(b.Date) = 2011 THEN 1 END)     ) AS percentage_difference FROM badges b WHERE b.Name = 'Student';	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommenters FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;	codebase_community
SELECT p.Id, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT p.ViewCount AS Score, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Id = 395;	codebase_community
SELECT p.Id, p.OwnerUserId FROM posts p WHERE p.Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount) as TotalFavoriteCount FROM posts p WHERE p.LastEditDate BETWEEN '2011-01-01 00:00:00.0' AND '2011-12-31 23:59:59.0' AND p.LastEditorUserId = 686	codebase_community
SELECT AVG(u.UpVotes) + AVG(u.Age) AS avg_upvotes_and_age FROM users u JOIN posts p ON u.Id = p.OwnerUserId GROUP BY u.Id HAVING COUNT(p.Id) > 10;	codebase_community
SELECT COUNT(DISTINCT `UserId`)  FROM `badges`  WHERE `Name` = 'Announcer';	codebase_community
SELECT `Name` FROM `badges` WHERE `Date` = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE Score > 60;	codebase_community
SELECT Text  FROM comments  WHERE CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT u.CreationDate FROM users u WHERE u.Location = 'Rochester, NY' AND u.Id IN (SELECT b.UserId FROM badges b)	codebase_community
SELECT      (COUNT(DISTINCT CASE WHEN b.Name = 'Teacher' THEN b.UserId ELSE NULL END) /       COUNT(DISTINCT b.UserId)) * 100 AS TeacherBadgePercentage FROM badges b;	codebase_community
SELECT      ROUND((COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN u.Id END) * 100.0) / COUNT(DISTINCT b.UserId), 2) AS Teenager_Percentage FROM      badges b JOIN      users u ON b.UserId = u.Id WHERE      b.Name = 'Organizer'	codebase_community
SELECT c.Score  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.Id, u.Views FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(DISTINCT b.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Id` = 30;	codebase_community
SELECT COUNT(DISTINCT `users`.`Id`) AS `usersFromNewYork` FROM `users` WHERE `Location` = 'New York, NY';	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) AS AdultUsersCount FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT `users.DisplayName`, MAX(`users.Views`) as MaxViews FROM `users` GROUP BY `users.DisplayName` ORDER BY MaxViews DESC LIMIT 1;	codebase_community
SELECT      DIVIDE(COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 END), COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 END)) FROM      votes;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (     SELECT Id     FROM users     WHERE DisplayName = 'Daniel Vassallo' );	codebase_community
SELECT COUNT(*)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.DisplayName = 'Harlan';	codebase_community
SELECT p.Id  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'slashnick'  ORDER BY p.AnswerCount DESC  LIMIT 1;	codebase_community
SELECT      CASE          WHEN MAX(SUM(p.ViewCount)) OVER (PARTITION BY u.DisplayName) =               (SELECT MAX(SUM(ViewCount))                FROM posts p                JOIN users u ON p.OwnerUserId = u.Id                WHERE u.DisplayName = 'Harvey Motulsky') THEN 'Harvey Motulsky'         ELSE 'Noah Snyder'     END AS MorePopularUser,     MAX(SUM(p.ViewCount)) OVER (PARTITION BY u.DisplayName) AS PopularityScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' OR u.DisplayName = 'Noah Snyder' GROUP BY u.DisplayName;	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Matt Parker'  AND (SELECT COUNT(*) FROM votes WHERE votes.PostId = posts.Id) > 4;	codebase_community
SELECT COUNT(*)  FROM comments  JOIN posts ON comments.PostId = posts.Id  JOIN users ON comments.UserId = users.Id  WHERE users.DisplayName = 'Neil McGuigan' AND comments.Score < 60;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.Id = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer';	codebase_community
SELECT      (SELECT COUNT(`PostId`) FROM `posts` p      INNER JOIN `tags` t ON p.`Tags` LIKE CONCAT('%<r>%') AND t.`TagName` = 'r')      /      (SELECT COUNT(`Id`) FROM `posts` WHERE `OwnerUserId` IS NULL) * 100 AS percentage FROM DUAL;	codebase_community
SELECT      (SUM(CASE WHEN p.OwnerDisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN p.OwnerDisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Commentator' AND YEAR(b.Date) = 2014;	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT u.DisplayName, u.Age  FROM users u  ORDER BY u.Views DESC  LIMIT 1;	codebase_community
SELECT p.LastEditDate, p.LastEditorUserId FROM posts p WHERE p.Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score > 60;	codebase_community
SELECT b.Name AS BadgeName FROM badges b JOIN users u ON b.UserId = u.Id WHERE YEAR(b.Date) = 2011 AND u.Location = 'North Pole';	codebase_community
SELECT      u.DisplayName,      u.WebsiteUrl FROM      users u JOIN      posts p ON u.Id = p.OwnerUserId WHERE      p.FavoriteCount > 150;	codebase_community
SELECT      COUNT(*) AS PostHistoryCount,     MAX(`CreationDate`) AS LastEditDate FROM      postHistory JOIN      posts ON postHistory.PostId = posts.Id WHERE      posts.Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT u.LastAccessDate, u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers' ORDER BY u.LastAccessDate DESC;	codebase_community
SELECT p.Title AS RelatedPostTitle FROM posts AS p JOIN postLinks AS pl ON p.Id = pl.RelatedPostId JOIN posts AS related_p ON related_p.Id = pl.PostId WHERE related_p.Title = 'How to tell if something happened in a data set which monitors a value over time';	codebase_community
SELECT p.Id, b.Name FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013;	codebase_community
SELECT OwnerDisplayName  FROM posts  WHERE ViewCount = (SELECT MAX(ViewCount) FROM posts);	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?'	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.Id = (SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL) AND p.ParentId IS NOT NULL;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8)	codebase_community
SELECT `Title` FROM `posts` ORDER BY `ViewCount` DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT `OwnerUserId` FROM `posts` ORDER BY `FavoriteCount` DESC LIMIT 1;	codebase_community
SELECT MAX(Reputation) AS MaxReputation, Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM posts JOIN votes ON posts.Id = votes.PostId WHERE YEAR(posts.CreaionDate) = 2011 AND votes.BountyAmount = 50;	codebase_community
SELECT `Id` FROM `users` ORDER BY `Age` ASC LIMIT 1;	codebase_community
SELECT SUM(Score) AS TotalScore FROM posts WHERE LastActivityDate LIKE '2010-07-19%';	codebase_community
SELECT      COUNT(pl.Id) / 12 AS avg_monthly_links FROM      `postLinks` pl JOIN      `posts` p ON pl.PostId = p.Id WHERE      YEAR(pl.CreationDate) = 2010     AND p.AnswerCount <= 2;	codebase_community
SELECT PostId  FROM posts  WHERE OwnerUserId = 1465  ORDER BY FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks)	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(CreationDate)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.DisplayName = 'chl'	codebase_community
SELECT MIN(CreationDate) as YoungestUserFirstPost FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' AND b.Date = (SELECT MIN(Date) FROM badges WHERE Name = 'Autobiographer');	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(v.PostId) as AverageVotedPosts FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users)	codebase_community
SELECT `DisplayName`, `Reputation` FROM `users` ORDER BY `Reputation` DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Age` BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens') AND YEAR(CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title, MAX(p.ViewCount) as MaxViews FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' GROUP BY p.Id, p.Title ORDER BY MaxViews DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p WHERE p.Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT AVG(p.Score) AS AverageScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Stephen Turner';	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000 AND YEAR(p.CreaionDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName AS OwnerDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.CreationDate BETWEEN '2010-01-01' AND '2010-12-31' ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      (COUNT(CASE WHEN YEAR(posts.CreationDate) = 2011 AND users.Reputation > 1000 THEN posts.Id END) * 100.0) / COUNT(posts.Id) AS ReputationOver1000Percentage FROM      posts JOIN      users ON posts.OwnerUserId = users.Id	codebase_community
SELECT      (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN u.Id END) * 100.0) / COUNT(u.Id) AS percentage FROM      users u	codebase_community
SELECT p.ViewCount, u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Body LIKE '%Computer Game Datasets%'	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(c.Id)  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON p.LastEditorUserId = u.Id WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett') ORDER BY Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT      DATEDIFF(b.Date, u.CreationDate) AS TimeToGetBadge FROM      badges b JOIN      users u ON b.UserId = u.Id WHERE      u.DisplayName = 'Zolomon'	codebase_community
SELECT      u.Id AS UserId,     (SELECT COUNT(*) FROM posts WHERE posts.OwnerUserId = u.Id) AS PostCount,     (SELECT COUNT(*) FROM comments WHERE comments.UserId = u.Id) AS CommentCount FROM      users u WHERE      u.CreationDate = (SELECT MAX(CreationDate) FROM users);	codebase_community
SELECT c.Text AS CommentText, u.DisplayName AS UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT `UserId`) FROM `badges` WHERE `Name` = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts WHERE Id IN (     SELECT ExcerptPostId     FROM tags     WHERE TagName = 'careers' );	codebase_community
SELECT u.Reputation, p.ViewCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Jarrod Dixon';	codebase_community
SELECT SUM(CASE WHEN p.Title = 'Clustering 1D data' THEN 1 ELSE 0 END) AS TotalComments,        SUM(CASE WHEN p.Title = 'Clustering 1D data' THEN 1 ELSE 0 END) AS TotalAnswers FROM posts p JOIN comments c ON p.Id = c.PostId LEFT JOIN posts pa ON p.Id = pa.ParentId AND pa.PostTypeId = 1 WHERE p.Title = 'Clustering 1D data';	codebase_community
SELECT CreationDate  FROM users  WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT      (COUNT(CASE WHEN p.Score > 50 THEN p.Id END) * 100.0) / COUNT(p.Id) AS PercentageOfHighScorePosts FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Id, c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT u.CreationDate, u.Age FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.UserDisplayName LIKE '%http://%'	codebase_community
SELECT COUNT(DISTINCT c.PostId) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*)  FROM comments  JOIN posts ON comments.PostId = posts.Id  WHERE posts.CommentCount = 1 AND comments.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.PostId IN (     SELECT p.Id      FROM posts p     JOIN votes v ON p.Id = v.PostId     WHERE v.Score = 0 ) AND u.Age = 40;	codebase_community
SELECT c.PostId, c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.UserDisplayName = 'R is also lazy evaluated.';	codebase_community
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0;	codebase_community
SELECT      (COUNT(DISTINCT c.UserId) FILTER (WHERE u.UpVotes = 0)) * 100.0 /      COUNT(DISTINCT c.UserId) AS PercentageUsersWith0UpVotes FROM      comments c JOIN      users u ON c.UserId = u.Id WHERE      c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM superpower sp JOIN hero_attribute ha ON sp.id = ha.attribute_id JOIN superhero sh ON ha.hero_id = sh.id WHERE sh.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN superpower sp ON ha.attribute_id = sp.id WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero WHERE id IN (     SELECT hero_id     FROM hero_attribute     JOIN superpower ON hero_attribute.attribute_id = superpower.id     WHERE superpower.power_name = 'Super Strength' ) AND height_cm > 200;	superhero
SELECT superhero.full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN superpower ON hero_attribute.attribute_id = superpower.id GROUP BY superhero.full_name HAVING COUNT(superpower.id) > 15;	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN superpower sp ON ha.attribute_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility';	superhero
SELECT superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Blond';	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT superhero_name, height_cm FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC;	superhero
SELECT p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.superhero_name = 'Sauron';	superhero
SELECT      c.name AS EyeColor,      COUNT(s.id) AS Popularity FROM      superhero s JOIN      colour c ON s.eye_colour_id = c.id JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics' GROUP BY      c.name ORDER BY      Popularity DESC;	superhero
SELECT AVG(`height_cm`)  FROM `superhero`  WHERE `publisher_id` = (SELECT `id` FROM `publisher` WHERE `publisher_name` = 'Marvel Comics');	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN superpower sp ON ha.attribute_id = sp.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name, a.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Speed' AND a.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Speed')	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE colour.colour_name = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE colour.colour = 'Blond';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT race FROM race JOIN superhero ON race.id = superhero.race_id WHERE superhero.superhero_name = 'Copycat';	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50;	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN superpower sp ON ha.attribute_id = sp.id  WHERE sp.power_name = 'Death Touch';	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Strength' AND a.attribute_value = 100 AND s.gender_id = 2;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id GROUP BY superhero_name ORDER BY COUNT(hero_attribute.hero_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT      ROUND(         (SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) * 100) / COUNT(*), 2     ) AS percentage_of_bad_marvel_heroes FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      s.alignment_id = (SELECT id FROM alignment WHERE alignment_name = 'Bad');	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))      -      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superhero su JOIN superpower sp ON su.id = sp.hero_id WHERE su.superhero_name = 'Deathlok';	superhero
SELECT AVG(`weight_kg`) AS average_weight FROM `superhero` WHERE `gender_id` = (SELECT `id` FROM `gender` WHERE `name` = 'Female');	superhero
SELECT sp.power_name FROM superhero s JOIN superpower sp ON s.id = sp.hero_id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT superhero_name FROM superhero WHERE race_id IN (SELECT id FROM race WHERE name = 'Alien');	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm BETWEEN 170 AND 190  AND eye_colour_id IS NULL OR (SELECT colour FROM colour WHERE id = superhero.eye_colour_id AND colour = 'No Colour');	superhero
SELECT `power_name` FROM `superhero` JOIN `hero_attribute` ON `superhero.id` = `hero_attribute.hero_id` JOIN `superpower` ON `hero_attribute.attribute_id` = `superpower.id` WHERE `superhero.id` = 56;	superhero
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment_name = 'Bad');	superhero
SELECT `race_id` FROM `superhero` WHERE `weight_kg` = 169;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE s.race_id = (SELECT id FROM colour WHERE colour = 'human') AND s.height_cm = 185;	superhero
SELECT c.colour  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.height_cm BETWEEN 150 AND 180 THEN 1 ELSE 0 END) * 100.0) /          COUNT(s.id),          2     ) AS percentage_of_marvel_heroes FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      s.height_cm BETWEEN 150 AND 180 AND      p.name = 'Marvel Comics';	superhero
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT sp.power_name, COUNT(*) as count FROM superhero su JOIN superpower sp ON su.id = sp.id GROUP BY sp.power_name ORDER BY count DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN superpower sp ON ha.attribute_id = sp.id WHERE s.id = 1;	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s  JOIN superpower sp ON s.id = sp.id  WHERE sp.power_name = 'stealth';	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Strength' )	superhero
SELECT AVG(sup.id) AS average_superheroes_no_skin FROM superhero sup JOIN colour col ON sup.skin_colour_id = col.id WHERE col.id = 1;	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT superhero_name, MAX(attribute_value) as MaxDurability FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE attribute.attribute_name = 'Durability' AND publisher.publisher_name = 'Dark Horse Comics' GROUP BY superhero_name ORDER BY MaxDurability DESC LIMIT 1;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  JOIN superpower ON attribute.id = superpower.id  WHERE superpower.power_name = 'Flight';	superhero
SELECT s.superhero_name, c.eye_colour, c.hair_colour, c.skin_colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN colour h ON s.hair_colour_id = h.id JOIN colour sk ON s.skin_colour_id = sk.id JOIN publisher p ON s.publisher_id = p.id WHERE s.gender_id = 2 AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT      s1.superhero_name,     p.publisher_name FROM      superhero s1 JOIN      superhero s2 ON s1.eye_colour_id = s2.eye_colour_id AND s1.hair_colour_id = s2.hair_colour_id AND s1.skin_colour_id = s2.skin_colour_id JOIN      publisher p ON s1.publisher_id = p.id WHERE      s1.id != s2.id;	superhero
SELECT r.name  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.superhero_name = 'A-Bomb';	superhero
SELECT      ROUND((SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) / COUNT(CASE WHEN s.gender_id = 2 THEN 1 END)) * 100, 2) AS blue_female_percentage FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.gender_id = 2;	superhero
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler' AND race_id = 1;	superhero
SELECT g.gender FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE s.superhero_name = 'Agent 13';	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN superpower ON attribute.attribute_name = superpower.power_name WHERE superpower.power_name = 'Adaptation';	superhero
SELECT COUNT(*)  FROM `superpower` sp JOIN `superhero` sh ON sp.id = sh.alignment_id WHERE sh.superhero_name = 'Amazo';	superhero
SELECT sp.power_name FROM superhero s JOIN superpower sp ON s.id = sp.id WHERE s.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Black' AND hair_colour.colour = 'Black';	superhero
SELECT c.colour  FROM colour c  JOIN hero_attribute ha ON ha.hero_id = (SELECT hero_id FROM superhero WHERE skin_colour_id = c.id)  WHERE c.colour = 'Gold';	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.name = 'Vampire';	superhero
SELECT superhero_name FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT COUNT(*) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Strength');	superhero
SELECT s.race_id, a.alignment_id  FROM superhero s  JOIN alignment a ON s.alignment_id = a.id  WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT      ROUND((SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS female_hero_percentage FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(weight_kg) AS average_weight FROM superhero WHERE race_id = (SELECT id FROM race WHERE name = 'Alien');	superhero
SELECT (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Emil Blonsky') -         (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN superpower sp ON a.attribute_name = sp.power_name WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' ORDER BY hero_attribute.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id AND eye_colour.name = 'Blue' JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id AND hair_colour.name = 'Brown';	superhero
SELECT p.publisher_name FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT      ROUND((SUM(CASE WHEN c.color = 'Blue' THEN 1 ELSE 0 END) * 100.0) / COUNT(s.id), 2) AS blue_eye_percentage FROM superhero s JOIN colour c ON s.eye_colour_id = c.id;	superhero
SELECT      (SUM(CASE WHEN s.gender_id = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END)) AS male_female_ratio FROM      superhero s JOIN      gender g ON s.gender_id = g.id;	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT id FROM `superpower` WHERE `power_name` = 'cryokinesis';	superhero
SELECT superhero_name  FROM superhero  WHERE id = 294;	superhero
SELECT `full_name` FROM `superhero` WHERE `weight_kg` IS NULL OR `weight_kg` = 0;	superhero
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero s JOIN superpower sp ON s.id = sp.hero_id WHERE s.full_name = 'Helen Parr';	superhero
SELECT `race_id` FROM `superhero` WHERE `weight_kg` = 108 AND `height_cm` = 188;	superhero
SELECT p.publisher_name  FROM superhero AS s  JOIN publisher AS p ON s.publisher_id = p.id  WHERE s.id = 38;	superhero
SELECT s.race_id FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute );	superhero
SELECT a.alignment, sp.power_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN superpower sp ON s.id = sp.hero_id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) as average_attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.alignment_id = 3;	superhero
SELECT s.full_name, c.colour FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN colour c ON s.skin_colour_id = c.id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND alignment_id = 1;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_value BETWEEN 75 AND 80;	superhero
SELECT superhero_name, full_name, race_id FROM superhero JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id JOIN gender ON superhero.gender_id = gender.id WHERE hair_colour.colour = 'blue' AND gender.id = 1 JOIN race ON superhero.race_id = race.id;	superhero
SELECT      ROUND((SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_female_bad_heroes FROM      superhero WHERE      alignment_id = 2;	superhero
SELECT      (SUM(CASE WHEN c.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN c.id = 1 THEN 1 ELSE 0 END)) AS eye_colours_difference FROM      superhero s JOIN      colour c ON s.eye_colour_id = c.id WHERE      s.weight_kg IS NULL OR s.weight_kg = 0;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE a.attribute_name = 'Strength' AND s.superhero_name = 'Hulk';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN superpower sp ON a.attribute_name = sp.power_name WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero WHERE skin_colour_id = (SELECT id FROM colour WHERE colour = 'Green') AND alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT COUNT(*)  FROM superhero  WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name FROM superhero JOIN superpower ON superhero.id = hero_id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero_name ASC;	superhero
SELECT s.full_name, g.gender FROM superhero s JOIN superpower sp ON s.id = sp.id JOIN gender g ON s.gender_id = g.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name, MAX(weight_kg) AS max_weight FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher_name = 'DC Comics' GROUP BY superhero_name ORDER BY max_weight DESC LIMIT 1;	superhero
SELECT AVG(height_cm)  FROM superhero  WHERE race_id IN (SELECT id FROM race WHERE name = 'Human')  AND publisher_id IN (SELECT id FROM publisher WHERE name = 'Dark Horse Comics');	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100;	superhero
SELECT     (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics'))     - (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS difference;	superhero
SELECT a.attribute_name FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Black Panther' ORDER BY ha.attribute_value LIMIT 1;	superhero
SELECT c.colour  FROM superhero AS s  JOIN colour AS c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT      ROUND(         (SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) / COUNT(*)) * 100.0,          2     ) AS female_percentage FROM      superhero WHERE      publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'George Lucas');	superhero
SELECT      ROUND((SUM(CASE WHEN s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND a.alignment_id = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS percentage_good_heroes FROM      superhero s JOIN      alignment a ON s.alignment_id = a.id WHERE      s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name LIKE 'John%';	superhero
SELECT hero_id  FROM hero_attribute  WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);	superhero
SELECT `full_name` FROM `superhero` WHERE `superhero_name` = 'Alien';	superhero
SELECT s.full_name FROM superhero s WHERE s.weight_kg < 100 AND s.eye_colour_id = (     SELECT id     FROM colour     WHERE name = 'Brown' );	superhero
SELECT ha.attribute_value  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT `weight_kg`, `race_id` FROM `superhero` WHERE `id` = 40;	superhero
SELECT AVG(`height_cm`) AS avg_height FROM `superhero` WHERE `alignment_id` = (SELECT `id` FROM `alignment` WHERE `name` = 'Neutral');	superhero
SELECT ha.hero_id FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superpower sp ON a.attribute_name = sp.power_name WHERE sp.power_name = 'Intelligence';	superhero
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superhero s JOIN superpower sp ON s.id = sp.hero_id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q1 = (SELECT MAX(q1) FROM qualifying WHERE raceId = 20) AND q.raceId = 20;	formula_1
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19) AND q.raceId = 19;	formula_1
SELECT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Shanghai';	formula_1
SELECT `url` FROM `races` WHERE `name` = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.country = 'Germany';	formula_1
SELECT c.name AS circuit_name, cs.positionText AS circuit_position FROM circuits c JOIN constructorStandings cs ON c.circuitId = cs.raceId JOIN constructors con ON cs.constructorId = con.constructorId WHERE con.name = 'Renault';	formula_1
SELECT COUNT(*) FROM races WHERE YEAR(date) = 2010 AND circuit.circuitId NOT IN (     SELECT circuitId     FROM circuits     WHERE continent IN ('Asia', 'Europe') );	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain';	formula_1
SELECT `lat`, `lng` FROM `circuits` WHERE `name` = 'Australian Grand Prix';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.nationality FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.points = 1.0 AND cr.raceId = 24;	formula_1
SELECT q.q1 FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE d.forename = 'Bruno' AND d.surname = 'Senna' AND q.raceId = 354;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '00:01:40' AND q.raceId = 355;	formula_1
SELECT drivers.number FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.raceId = 903 AND qualifying.q3 LIKE '00:01%'	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Bahrain Grand Prix' AND ds.position IS NULL AND ds.wins = 0;	formula_1
SELECT seasons.url FROM races JOIN seasons ON races.year = seasons.year WHERE races.raceId = 901;	formula_1
SELECT COUNT(DISTINCT ds.driverId) FROM driverStandings ds JOIN races r ON ds.raceId = r.raceId WHERE r.date = '2015-11-29' AND ds.position IS NOT NULL;	formula_1
SELECT d.forename, d.surname, d.dob FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.raceId = 592 AND ds.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT d.driverId, d.url FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.time LIKE '0:01:27%' AND lt.raceId = 161;	formula_1
SELECT d.nationality FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId = 933 AND r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933);	formula_1
SELECT r.name AS race_name, r.latitude AS latitude, r.longitude AS longitude FROM races r WHERE r.name = 'Malaysian Grand Prix';	formula_1
SELECT c.url  FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.raceId = 9 AND cr.points = (SELECT MAX(points) FROM constructorResults WHERE raceId = 9)	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE driverRef = 'di Grassi') AND raceId = 345;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE q.q2 = '00:01:15' AND r.raceId = 347;	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 45 AND q.q3 LIKE '0:01%'	formula_1
SELECT      r.fastestLapTime FROM      results r JOIN      drivers d ON r.driverId = d.driverId WHERE      d.name = 'Bruce McLaren' AND      r.raceId = 743;	formula_1
SELECT c.name FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE cs.position = 2 AND cs.raceId = (SELECT raceId FROM races WHERE name = 'San Marino Grand Prix' AND year = 2006);	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.date = '2015-11-29' AND ds.points = 0;	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.raceId = 872 ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = 348 ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT      (SUBTRACT(fastestLapSpeed(raceId = 853), fastestLapSpeed(raceId = 854)) * 100) / fastestLapSpeed(raceId = 853) AS percent_faster FROM      (SELECT fastestLapSpeed(raceId = 853) AS race853_speed, fastestLapSpeed(raceId = 854) AS race854_speed      FROM results      WHERE driverId IN (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')      AND raceId IN (SELECT raceId FROM races WHERE raceId = 853 OR raceId = 854)) AS subquery;	formula_1
SELECT      d.driverId,     d.forename,     d.surname,     (COUNT(CASE WHEN r.time IS NOT NULL THEN 1 END) / COUNT(r.driverId)) * 100 AS completionRate FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      r.date = '1983-07-16' GROUP BY      d.driverId, d.forename, d.surname;	formula_1
SELECT MIN(year) AS first_singapore_grand_prix_year FROM races WHERE `url` LIKE '%Singapore Grand Prix%';	formula_1
SELECT COUNT(*) AS TotalRaces, `name` FROM races WHERE year = 2005 GROUP BY `name` ORDER BY `name` DESC;	formula_1
SELECT `name` FROM `races` WHERE `year` = (SELECT MIN(`year`) FROM `races`) AND MONTH(`date`) = (SELECT MIN(MONTH(`date`)) FROM `races`);	formula_1
SELECT `r`.name, `r`.`date` FROM `races` AS `r` WHERE `r`.`year` = 1999 ORDER BY `r`.`round` DESC LIMIT 1;	formula_1
SELECT year, COUNT(*) as race_count FROM races GROUP BY year ORDER BY race_count DESC LIMIT 1;	formula_1
SELECT DISTINCT r.name  FROM races r WHERE r.year = 2017 AND r.raceId NOT IN (     SELECT r2.raceId      FROM races r2      WHERE r2.year = 2000 );	formula_1
SELECT c.name AS circuit_name, c.country AS country_name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = (SELECT MIN(year) FROM races WHERE name = 'European Grand Prix');	formula_1
SELECT MAX(year) AS last_british_grand_prix_year FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE circuitName = 'Brands Hatch') AND raceName = 'British Grand Prix';	formula_1
SELECT COUNT(DISTINCT raceId)  FROM races  WHERE name = 'British Grand Prix';	formula_1
SELECT      d.driverRef,      ds.positionText  FROM      driverStandings ds  JOIN      drivers d ON ds.driverId = d.driverId  WHERE      ds.raceId = (SELECT raceId FROM races WHERE name = '2010 Singapore Grand Prix')  ORDER BY      ds.position;	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE ds.points = (SELECT MAX(points) FROM driverStandings);	formula_1
SELECT d.surname, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE ds.raceId = (SELECT raceId FROM races WHERE name = 'Chinese Grand Prix') ORDER BY ds.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name, MIN(l.milliseconds) AS best_lap_milliseconds FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN races r ON l.raceId = r.raceId GROUP BY d.driverId, r.raceId ORDER BY best_lap_milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(`milliseconds`) AS average_lap_time FROM `lapTimes` JOIN `drivers` ON `lapTimes.driverId` = `drivers.driverId` JOIN `races` ON `lapTimes.raceId` = `races.raceId` WHERE `drivers.forename` = 'Lewis' AND `drivers.surname` = 'Hamilton' AND `races.name` = 'Malaysian Grand Prix';	formula_1
SELECT      ROUND(         (COUNT(CASE WHEN rs.position > 1 THEN 1 END) / COUNT(rs.raceId)) * 100, 2     ) AS percentage_not_first_track FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      d.surname = 'Hamilton'      AND r.year >= 2010	formula_1
SELECT      d.forename,      d.surname,      d.nationality,      ds.max_points FROM      drivers d JOIN (     SELECT          driverId,          MAX(points) AS max_points     FROM          driverStandings     GROUP BY          driverId ) ds ON d.driverId = ds.driverId WHERE      ds.max_points = (         SELECT              MAX(points)          FROM              driverStandings     ) ORDER BY      ds.max_points DESC LIMIT 1;	formula_1
SELECT      d.forename,      d.surname,      (YEAR(CURRENT_TIMESTAMP) - YEAR(d.dob)) AS age  FROM      drivers d  WHERE      d.nationality = 'Japanese'  ORDER BY      d.dob DESC  LIMIT 1;	formula_1
SELECT DISTINCT c.circuitId, c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.circuitId, c.name HAVING COUNT(r.raceId) = 4;	formula_1
SELECT c.location, c.country FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND YEAR(r.raceDate) = 2006;	formula_1
SELECT r.name AS RaceName, c.name AS CircuitName, c.location AS CircuitLocation FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT r.name AS RaceName FROM races r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND ds.position < 20;	formula_1
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.name = 'Michael Schumacher' AND races.name = 'Sepang International Circuit' AND results.statusId = 1;	formula_1
SELECT r.raceId, YEAR(r.raceId) AS raceYear FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Schumacher' AND r.fastestLapTime = (     SELECT MIN(fastestLapTime)     FROM results     WHERE driverId = (         SELECT driverId         FROM drivers         WHERE surname = 'Schumacher'     ) )	formula_1
SELECT AVG(points)  FROM driverStandings  WHERE driverId = (SELECT driverId FROM drivers WHERE name = 'Eddie Irvine')  AND raceId IN (SELECT raceId FROM races WHERE year = 2000);	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY ds.raceId LIMIT 1;	formula_1
SELECT r.name, r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT      races.name AS race_name,     races.year,     circuits.location FROM      races JOIN      results ON races.raceId = results.raceId JOIN      (SELECT           raceId,           COUNT(*) AS total_laps      FROM           lapTimes      GROUP BY           raceId      ORDER BY           total_laps DESC      LIMIT 1) AS lap_counts ON races.raceId = lap_counts.raceId JOIN      circuits ON races.circuitId = circuits.circuitId;	formula_1
SELECT      (COUNT(CASE WHEN races.name = 'European Grand Prix' AND circuits.country = 'Germany' THEN 1 END) * 100.0) /      COUNT(CASE WHEN races.name = 'European Grand Prix' THEN 1 END) AS percentage FROM      races JOIN      circuits ON races.circuitId = circuits.circuitId;	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT `location` FROM `circuits` WHERE `lat` = (SELECT MAX(`lat`) FROM `circuits` WHERE `location` IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')) AND `location` IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring');	formula_1
SELECT circuitRef  FROM circuits  WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT `country`, MAX(`alt`) AS `max_altitude` FROM `circuits` WHERE `alt` IS NOT NULL GROUP BY `country` ORDER BY `max_altitude` DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT nationality, MIN(dob) as oldest_driver_dob FROM drivers GROUP BY nationality ORDER BY oldest_driver_dob LIMIT 1;	formula_1
SELECT d.surname FROM drivers d JOIN constructors c ON d.nationality = c.nationality WHERE c.nationality = 'Italian';	formula_1
SELECT url  FROM drivers  WHERE driverId = (SELECT driverId FROM drivers WHERE name = 'Anthony Davidson');	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surnname = 'Hamilton';	formula_1
SELECT `circuitName` FROM `races` WHERE `raceName` = 'Spanish Grand Prix' AND `raceYear` = 2009;	formula_1
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT r.raceId, r.year, r.round, r.date, r.time, r.url, c.url AS circuit_url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.url = 'http://en.wikipedia.org/wiki/Silverstone_Circuit';	formula_1
SELECT races.raceDate FROM races JOIN racesOnCircuit ON races.raceId = racesOnCircuit.raceId JOIN circuit ON racesOnCircuit.circuitId = circuit.circuitId WHERE circuit.name = 'Abu Dhabi Circuit' AND YEAR(races.raceDate) BETWEEN 2010 AND 2019;	formula_1
SELECT COUNT(DISTINCT raceId)  FROM races  WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy');	formula_1
SELECT date FROM races WHERE circuitId = 4;	formula_1
SELECT races.raceName, races.circuitUrl FROM races WHERE races.raceName = 'Spanish Grand Prix' AND YEAR(races.raceDate) = 2009;	formula_1
SELECT MIN(`fastestLapTime`) AS `fastestLapTime` FROM `results` JOIN `drivers` ON `results.driverId` = `drivers.driverId` WHERE `drivers.name` = 'Lewis Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLap IS NOT NULL ORDER BY CAST(r.fastestLapSpeed AS REAL) DESC LIMIT 1;	formula_1
SELECT d.driverRef FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2007 AND r.name = 'Canadian Grand Prix' AND ds.position = 1;	formula_1
SELECT r.raceId, r.year, r.circuitId, r.url FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.driverId = 1 AND d.name = 'Lewis Hamilton';	formula_1
SELECT r.name AS race_name FROM races r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY ds.rank ASC LIMIT 1;	formula_1
SELECT MAX(`fastestLapSpeed`) AS fastest_lap_speed FROM `results` WHERE `laps` = (SELECT `laps` FROM `results` r JOIN `races` ON r.raceId = `races.raceId` WHERE `races.name` = 'Spanish Grand Prix');	formula_1
SELECT DISTINCT YEAR(r.year) AS participation_years FROM races r JOIN results rs ON r.raceId = rs.raceId JOIN drivers d ON rs.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname, ds.positionText FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.name = 'Chinese Grand Prix';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = (SELECT raceId FROM races WHERE year = 1989 AND circuit = 'Australian Grand Prix') AND q.grid = 4;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.circuitId = 1 AND r.time IS NOT NULL;	formula_1
SELECT `fastestLapTime` FROM `results` JOIN `drivers` ON `results.driverId` = `drivers.driverId` WHERE `drivers.name` = 'Lewis Hamilton' AND `raceId` = (SELECT `raceId` FROM `races` WHERE `name` = '2008 Australian Grand Prix') ORDER BY `fastestLapTime` ASC LIMIT 1;	formula_1
SELECT r.time  FROM races r  JOIN driverStandings ds ON r.raceId = ds.raceId  JOIN drivers d ON ds.driverId = d.driverId  WHERE ds.positionText = '2'  AND d.driverRef = 'alonso'  AND r.name = 'Chinese Grand Prix'  AND r.year = 2008;	formula_1
SELECT      d.surname AS champion_name,     CONCAT('https://en.wikipedia.org/wiki/', d.surname) AS more_info_url FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      r.year = 2008 AND r.circuitId = 1 AND ds.positionText = '1';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'British' AND r.raceId = 18;	formula_1
SELECT      DS.driverId,     D.driverRef,     COUNT(DISTINCT R.raceId) AS racesParticipated FROM      driverStandings DS JOIN      drivers D ON DS.driverId = D.driverId JOIN      races R ON DS.raceId = R.raceId WHERE      R.year = 2008 AND R.circuitId = 17 AND DS.position IS NOT NULL GROUP BY      DS.driverId, D.driverRef HAVING      COUNT(DISTINCT R.raceId) > 0;	formula_1
SELECT SUM(points) AS total_points FROM driverStandings JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.name = 'Lewis Hamilton';	formula_1
SELECT AVG(TIME_TO_SEC(`fastestLapTime`)) AS avgFastestLapTimeInSeconds FROM `lapTimes` JOIN `drivers` ON `lapTimes.driverId` = `drivers.driverId` WHERE `drivers.surname` = 'Hamilton';	formula_1
SELECT      (COUNT(CASE WHEN r.`raceId` = 1 AND rt.time IS NOT NULL THEN 1 END) * 1.0) /      COUNT(CASE WHEN r.`raceId` = 1 THEN 1 END) AS completion_rate FROM      results r JOIN      lapTimes rt ON r.driverId = rt.driverId AND r.raceId = rt.raceId WHERE      r.raceId = 1	formula_1
SELECT      ((         (TIME_TO_SEC(TIMEDIFF(T2.fastestLapTime, T3.fastestLapTime)) / TIME_TO_SEC(T3.fastestLapTime)     ) * 100) AS faster_percentage FROM      driverStandings AS DS1 JOIN      drivers AS D1 ON DS1.driverId = D1.driverId JOIN      results AS R1 ON DS1.driverId = R1.driverId JOIN      races AS R2 ON DS1.raceId = R2.raceId AND R2.year = 2008 AND R2.round = 1 JOIN      driverStandings AS DS2 ON DS2.raceId = R2.raceId AND DS2.position = (SELECT MAX(position) FROM driverStandings DS3 WHERE DS3.raceId = R2.raceId AND DS3.position IS NOT NULL) JOIN      results AS R3 ON DS2.driverId = R3.driverId WHERE      DS1.position = 1 AND DS1.raceId = R2.raceId	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne';	formula_1
SELECT `lat`, `lng` FROM `circuits` WHERE `country` = 'USA';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND dob > '1980-01-01';	formula_1
SELECT MAX(points)  FROM constructors  JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId  WHERE constructors.nationality = 'British';	formula_1
SELECT `constructorId`, SUM(`points`) AS total_points FROM `constructorStandings` GROUP BY `constructorId` ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.raceId = 291 AND cr.points = 0;	formula_1
SELECT COUNT(DISTINCT c.constructorId)  FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE c.nationality = 'Japanese' AND cr.points = 0 AND COUNT(DISTINCT r.raceId) = 2;	formula_1
SELECT DISTINCT c.constructorId, c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(*) FROM constructors AS c JOIN constructorResults AS cr ON c.constructorId = cr.constructorId JOIN lapTimes AS lt ON cr.constructorResultsId = lt.constructorResultsId WHERE c.nationality = 'French' AND lt.lap > 50;	formula_1
SELECT      (COUNT(DISTINCT d.driverId) - COUNT(DISTINCT CASE WHEN lt.milliseconds IS NULL THEN d.driverId ELSE NULL END)) * 100.0 /      COUNT(DISTINCT d.driverId) FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId JOIN      races r ON lt.raceId = r.raceId WHERE      d.nationality = 'Japanese' AND      r.year BETWEEN 2007 AND 2009;	formula_1
SELECT     r.year,     AVG(UNIX_TIMESTAMP(SUBSTRING_INDEX(SUBSTRING_INDEX(results.time, ':', 2), ' ', 1)) * 3600 +        UNIX_TIMESTAMP(SUBSTRING_INDEX(SUBSTRING_INDEX(results.time, ':', 3), ' ', 1)) * 60 +        UNIX_TIMESTAMP(SUBSTRING_INDEX(SUBSTRING_INDEX(results.time, ':', 4), '.', 1))) AS avg_seconds FROM     results JOIN     races r ON results.raceId = r.raceId WHERE     results.time IS NOT NULL     AND r.year < 1975     AND EXISTS (         SELECT 1         FROM constructorStandings cs         JOIN constructors c ON cs.constructorId = c.constructorId         WHERE cs.raceId = results.raceId         AND cs.constructorId = results.constructorId         AND cs.constructorStandingsId = (             SELECT MAX(cs2.constructorStandingsId)             FROM constructorStandings cs2             WHERE cs2.raceId = results.raceId         )     ) GROUP BY     r.year;	formula_1
SELECT d.forename, d.surname FROM drivers d WHERE d.dob > '1975-01-01' AND EXISTS (     SELECT 1     FROM driverStandings ds     WHERE ds.driverId = d.driverId     AND ds.positionText = '2' );	formula_1
SELECT COUNT(DISTINCT d.driverId) AS UnfinishedItalianDrivers FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.nationality = 'Italian' AND ds.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes );	formula_1
SELECT lap FROM lapTimes WHERE `raceId` IN (     SELECT raceId     FROM races     WHERE year = 2009 ) AND position = 1 AND time = (     SELECT MIN(time)     FROM lapTimes     WHERE `raceId` IN (         SELECT raceId         FROM races         WHERE year = 2009     )     AND position = 1 ) LIMIT 1;	formula_1
SELECT AVG(`fastestLapSpeed`) AS average_speed FROM `results` WHERE `raceId` IN (     SELECT `raceId`     FROM `races`     WHERE `name` = 'Spanish Grand Prix' );	formula_1
SELECT r.year, r.raceId, MIN(r.milliseconds) AS shortestTime FROM races r JOIN results rs ON r.raceId = rs.raceId WHERE rs.milliseconds IS NOT NULL GROUP BY r.year, r.raceId ORDER BY shortestTime LIMIT 1;	formula_1
SELECT     (SELECT COUNT(DISTINCT d.driverId)      FROM drivers d      WHERE YEAR(d.dob) < 1985 AND d.driverId IN (          SELECT lt.driverId          FROM lapTimes lt          WHERE lt.lap > 50      )     )     /     (SELECT COUNT(DISTINCT d.driverId)      FROM drivers d      WHERE YEAR(d.dob) BETWEEN 2000 AND 2005     ) * 100 AS percentage	formula_1
SELECT COUNT(*) FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.nationality = 'French' AND CAST(SUBSTRING_INDEX(lapTimes.time, ':', 1) AS UNSIGNED) * 3600 + CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(lapTimes.time, ':', -2), ':', 1) AS UNSIGNED) * 60 + CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(lapTimes.time, ':', -1), '.', 1) AS UNSIGNED) < 120;	formula_1
SELECT `code`  FROM `drivers`  WHERE `nationality` = 'American';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM driverStandings  WHERE raceId = 18;	formula_1
SELECT      d.code,     (YEAR(CURRENT_DATE) - YEAR(d.dob)) AS age,     CASE         WHEN d.nationality = 'Dutch' THEN 'Netherlandic'         ELSE 'Non-Netherlandic'     END AS nationality_type FROM      drivers d WHERE      (YEAR(CURRENT_DATE) - YEAR(d.dob)) = (         SELECT              MIN(YEAR(CURRENT_DATE) - YEAR(dob))          FROM              drivers     ) ORDER BY      age  LIMIT 3;	formula_1
SELECT driverRef  FROM drivers  WHERE `surname` = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND SUBSTR(dob, 1, 4) = '1980';	formula_1
SELECT      d.driverId,      d.forename,      d.surname,      MIN(lt.time) AS EarliestLapTime FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId WHERE      d.nationality = 'German'      AND YEAR(d.dob) BETWEEN 1980 AND 1990 GROUP BY      d.driverId, d.forename, d.surname ORDER BY      EarliestLapTime ASC LIMIT 3;	formula_1
SELECT d.driverRef  FROM drivers d  JOIN constructors c ON d.nationality = c.nationality  WHERE c.nationality = 'German'  ORDER BY STR_TO_DATE(d.dob, '%Y-%m-%d')  LIMIT 1;	formula_1
SELECT d.driverId, d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE YEAR(d.dob) = 1971 AND r.fastestLapTime = (     SELECT MIN(fastestLapTime)     FROM results     WHERE raceId = r.raceId );	formula_1
SELECT      d.driverRef,      d.forename,      d.surname,      d.dob,      lt.time AS latest_lap_time FROM      drivers d JOIN      (SELECT          driverId,          MAX(time) AS max_time      FROM          lapTimes      GROUP BY          driverId) lt ON d.driverId = lt.driverId WHERE      d.nationality = 'Spanish'      AND d.dob < '1982-01-01' ORDER BY      lt.max_time DESC LIMIT 10;	formula_1
SELECT `year` FROM `races` JOIN `lapTimes` ON `races.raceId` = `lapTimes.raceId` WHERE `lapTimes.fastestLapTime` IS NOT NULL ORDER BY `lapTimes.fastestLapTime` ASC LIMIT 1;	formula_1
SELECT      YEAR(raceId) AS race_year,     MAX(TIMESTAMPDIFF(SECOND, '00:00:00', time)) AS max_lap_time FROM      lapTimes GROUP BY      race_year ORDER BY      max_lap_time ASC LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5;	formula_1
SELECT COUNT(DISTINCT r.driverId)  FROM results r  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.raceId BETWEEN 50 AND 100  AND r.statusId = 2  AND r.fastestLap IS NULL;	formula_1
SELECT `location`, `lat`, COUNT(*) AS circuit_count FROM `circuits` WHERE `country` = 'Austria' GROUP BY `location`, `lat`;	formula_1
SELECT raceId, COUNT(*) AS finisher_count FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY finisher_count DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
SELECT      d.driverId,     d.forename,     d.surname,     r.year,     r.date FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      d.dob = (SELECT MIN(dob) FROM drivers) ORDER BY      r.year ASC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.code = 'AMR' AND s.status = 'Puncture';	formula_1
SELECT c.nationality, c.constructorId, SUM(cr.points) AS total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'Italian' GROUP BY c.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN (     SELECT constructorId, SUM(wins) AS total_wins     FROM constructorStandings     GROUP BY constructorId     ORDER BY total_wins DESC     LIMIT 1 ) AS topConstructor ON c.constructorId = topConstructor.constructorId;	formula_1
SELECT d.driverRef, MAX(lt.time) AS slowest_time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.raceId = 18 AND lt.lap = 3 GROUP BY d.driverRef ORDER BY MAX(lt.time) DESC LIMIT 1;	formula_1
SELECT raceId, MIN(milliseconds) AS fastestLapTime FROM lapTimes WHERE lap = 1 GROUP BY raceId ORDER BY fastestLapTime ASC LIMIT 1;	formula_1
SELECT AVG(`fastestLapTime`) AS avgFastestLapTime FROM `results` WHERE `raceId` = (SELECT `raceId` FROM `races` WHERE `name` = '2006 United States Grand Prix') AND `fastestLap` = 1 AND `position` <= 10;	formula_1
SELECT      d.forename,      d.surname,      AVG(T3.duration) AS avg_pit_stop_duration FROM      drivers d JOIN      pitStops p ON d.driverId = p.driverId JOIN      (SELECT           driverId,           AVG(duration) AS duration      FROM           pitStops      WHERE           driverId IN (SELECT driverId FROM drivers WHERE nationality = 'German' AND dob BETWEEN '1980-01-01' AND '1985-12-31')      GROUP BY           driverId      ORDER BY           avg_pit_stop_duration ASC      LIMIT 3) T3 ON d.driverId = T3.driverId WHERE      d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY      d.driverId ORDER BY      avg_pit_stop_duration ASC LIMIT 3;	formula_1
SELECT r.driverId, r.fastestLapTime FROM results r JOIN races r2 ON r.raceId = r2.raceId WHERE r2.name = 'Canadian Grand Prix' AND YEAR(r2.date) = 2008 AND r.statusId = (SELECT MIN(statusId) FROM results WHERE raceId = r.raceId)	formula_1
SELECT c.constructorRef, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN (     SELECT raceId, MAX(TO_TIMESTAMP(fastestLapTime, 'MM:ss.SSS')) AS max_time     FROM results     WHERE raceId = (SELECT raceId FROM races WHERE name = '2009 Singapore Grand Prix')     GROUP BY raceId ) AS max_time_race ON cs.raceId = max_time_race.raceId JOIN results r ON cs.raceId = r.raceId AND r.fastestLapTime = max_time_race.max_time JOIN constructors c ON r.constructorId = c.constructorId;	formula_1
SELECT d.forename, d.surname, d.dob FROM drivers d JOIN constructors c ON d.nationality = c.nationality WHERE c.nationality = 'Austrian' AND d.dob BETWEEN '1981-01-01' AND '1991-12-31';	formula_1
SELECT d.forename, d.surname, d.dob, d.url FROM drivers d WHERE d.nationality = 'German' AND d.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY d.dob DESC;	formula_1
SELECT location, lat, lng FROM circuits WHERE location = 'Hungaroring';	formula_1
SELECT c.constructorId, c.name, c.nationality, SUM(cr.points) AS total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010 GROUP BY c.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(points) AS average_score FROM driverStandings JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' AND raceId = (SELECT raceId FROM races WHERE name = 'Turkish Grand Prix');	formula_1
SELECT AVG(COUNT(raceId)) AS avg_races_per_year FROM races WHERE year BETWEEN 2000 AND 2010 GROUP BY year;	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT SUM(CASE WHEN ds.position = 1 THEN 1 ELSE 0 END) AS victories FROM driverStandings ds WHERE ds.points = 91;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results) ORDER BY res.fastestLapTime ASC LIMIT 1;	formula_1
SELECT r.name, c.location, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.date = (SELECT MAX(date) FROM races);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.year = 2008 AND r.circuitId = 17 AND q.position = 1 AND q.q3 = (SELECT MIN(q3) FROM qualifying WHERE raceId = r.raceId)	formula_1
SELECT d.forename, d.surname, d.nationality, r.name AS raceName FROM drivers d JOIN races r ON d.driverId = (     SELECT driverId     FROM results     WHERE driverId = d.driverId     ORDER BY raceId ASC     LIMIT 1 ) WHERE d.dob = (     SELECT MIN(dob)     FROM drivers )	formula_1
SELECT COUNT(*)  FROM driverStandings ds JOIN results r ON ds.driverId = r.driverId AND ds.raceId = r.raceId WHERE r.statusId = 3 AND r.raceId = (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix') AND ds.driverId = (     SELECT driverId      FROM driverStandings      WHERE raceId = (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix')      GROUP BY driverId      ORDER BY COUNT(*) DESC      LIMIT 1 );	formula_1
SELECT d.forename, d.surname, COUNT(*) AS wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.driverId = (SELECT driverId FROM drivers ORDER BY dob ASC LIMIT 1) GROUP BY d.driverId;	formula_1
SELECT `driverId`, MAX(`duration`) AS max_duration FROM `pitStops` GROUP BY `driverId` ORDER BY max_duration DESC LIMIT 1;	formula_1
SELECT MIN(time) AS fastestLapTime FROM lapTimes WHERE time = (SELECT MIN(time) FROM lapTimes);	formula_1
SELECT MAX(duration) AS longest_pit_stop_time FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE name = 'Lewis Hamilton');	formula_1
SELECT `lap` FROM `pitStops` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `name` = 'Lewis Hamilton') AND `raceId` = (SELECT `raceId` FROM `races` WHERE `name` = '2011 Australian Grand Prix');	formula_1
SELECT d.driverRef, d.surname, p.driverId, p.stop, p.lap, p.duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId JOIN races r ON p.raceId = r.raceId WHERE r.year = 2011 AND r.circuitId = 1;	formula_1
SELECT MIN(`time`) AS lap_record FROM `lapTimes` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `name` = 'Lewis Hamilton') ORDER BY `time` ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes ) LIMIT 20;	formula_1
SELECT      c.position  FROM      lapTimes lt  JOIN      results r ON lt.driverId = r.driverId AND lt.raceId = r.raceId  JOIN      races ra ON lt.raceId = ra.raceId  JOIN      drivers d ON lt.driverId = d.driverId  WHERE      d.driverId = 1      AND ra.name = 'Formula_1'     AND lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes lt2 WHERE lt2.driverId = lt.driverId AND lt2.raceId = lt.raceId)	formula_1
SELECT MIN(time) AS lap_record FROM lapTimes WHERE raceId = (SELECT raceId FROM races WHERE name = 'Austrian Grand Prix Circuit');	formula_1
SELECT circuitId, MIN(time) AS fastestLapTime FROM lapTimes WHERE circuitId IN (     SELECT circuitId     FROM circuits     WHERE country = 'Italy' ) GROUP BY circuitId ORDER BY circuitId;	formula_1
SELECT r.name AS race_name FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'Austrian Grand Prix Circuit' ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT ps.duration FROM pitStops ps JOIN lapTimes lt ON ps.raceId = lt.raceId AND ps.driverId = lt.driverId WHERE lt.milliseconds = (     SELECT MIN(lt2.milliseconds)     FROM lapTimes lt2     WHERE lt2.raceId = lt.raceId ) AND ps.raceId IN (     SELECT r.raceId     FROM races r     JOIN circuits c ON r.circuitId = c.circuitId     WHERE c.name = 'Austrian Grand Prix Circuit' );	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN lapTimes lt ON c.circuitId = lt.raceId WHERE lt.time = '1:29.488';	formula_1
SELECT AVG(`milliseconds`) AS average_pit_stop_time FROM `pitStops` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `name` = 'Lewis Hamilton');	formula_1
SELECT AVG(`milliseconds`) AS average_lap_time FROM `lapTimes` WHERE EXISTS (     SELECT 1     FROM `races`     WHERE `races.raceId` = `lapTimes.raceId`     AND `races.circuitId` = (SELECT `circuitId` FROM `circuits` WHERE `name` = 'Italy') );	formula_1
SELECT player_api_id  FROM Player_Attributes  WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT `Player.player_name`, `Player.height` FROM `Player` WHERE `Player.height` = (SELECT MAX(`Player.height`) FROM `Player`);	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating BETWEEN 60 AND 65 AND pa.defensive_work_rate = 'low';	european_football_2
SELECT pa.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes) ORDER BY pa.crossing DESC LIMIT 5;	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY SUM(Match.home_team_goal + Match.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT home_team_api_id, COUNT(*) as losses FROM Match WHERE season = '2015/2016' AND (home_team_goal < away_team_goal) GROUP BY home_team_api_id ORDER BY losses ASC LIMIT 1;	european_football_2
SELECT P.player_name, SUM(PA.penalties) AS total_penalties FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id GROUP BY P.player_api_id ORDER BY total_penalties DESC LIMIT 10;	european_football_2
SELECT Team.team_long_name, COUNT(*) as wins FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id WHERE Match.season = '2009/2010'  AND Match.away_team_goal > Match.home_team_goal AND (SELECT name FROM League WHERE League.id = Match.league_id) = 'Scotland Premier League' GROUP BY Team.team_long_name ORDER BY wins DESC LIMIT 1;	european_football_2
SELECT `team_fifa_api_id`, MAX(`buildUpPlaySpeed`) AS max_build_up_play_speed FROM `Team_Attributes` GROUP BY `team_fifa_api_id` ORDER BY max_build_up_play_speed DESC LIMIT 4;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY SUM(CASE WHEN M.home_team_goal = M.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1;	european_football_2
SELECT      p.player_api_id,     p.player_fifa_api_id,     TIMESTAMPDIFF(YEAR, p.birthday, CURDATE()) AS age,     pa.sprint_speed FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE      pa.sprint_speed >= 97     AND pa.date BETWEEN '2013-01-01' AND '2015-12-31'	european_football_2
SELECT `League`.`name`, COUNT(`Match`.`id`) AS `matches_played` FROM `League` JOIN `Match` ON `League`.`id` = `Match`.`league_id` GROUP BY `League`.`id` ORDER BY `matches_played` DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT pa.player_api_id FROM Player_Attributes pa WHERE pa.overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') AND substr(pa.date, 1, 4) = '2010' GROUP BY pa.player_api_id ORDER BY pa.overall_rating DESC LIMIT 1;	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT T1.team_long_name FROM Team T1 JOIN Team_Attributes T2 ON T1.team_api_id = T2.team_api_id OR T1.team_fifa_api_id = T2.team_fifa_api_id WHERE strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing > (     SELECT AVG(T2.buildUpPlayPassing)     FROM Team_Attributes T2     JOIN Team T1 ON T2.team_api_id = T1.team_api_id OR T2.team_fifa_api_id = T1.team_fifa_api_id     WHERE strftime('%Y', T2.date) = '2012'     AND T2.buildUpPlayPassing IS NOT NULL )	european_football_2
SELECT      ROUND((SUM(CASE WHEN pa.preferred_foot = 'left' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT pa.player_fifa_api_id), 2) AS left_foot_percentage FROM      Player_Attributes pa JOIN      Player p ON pa.player_api_id = p.player_api_id WHERE      p.birthday BETWEEN '1987-01-01' AND '1992-12-31';	european_football_2
SELECT      League.name,      SUM(Match.home_team_goal + Match.away_team_goal) AS total_goals FROM      League JOIN      Match ON League.id = Match.league_id GROUP BY      League.name ORDER BY      total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(SUM(long_shots)) / COUNT(player_fifa_api_id) AS average_long_shots FROM Player_Attributes JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id WHERE Player.player_api_id = 505942;	european_football_2
SELECT P.player_name, AVG(PA.heading_accuracy) AS avg_heading_accuracy FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 GROUP BY P.player_api_id, P.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND T1.chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes AS T3 WHERE T3.buildUpPlayDribblingClass = 'Normal' AND T3.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY T1.chanceCreationPassing DESC;	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2009/2010' GROUP BY League.name HAVING AVG(Match.home_team_goal) > AVG(Match.away_team_goal);	european_football_2
SELECT `team_short_name` FROM `Team` WHERE `team_long_name` = 'Queens Park Rangers'	european_football_2
SELECT p.player_api_id, p.player_fifa_api_id, p.birthday FROM Player p WHERE SUBSTR(p.birthday, 1, 7) = '1970-10';	european_football_2
SELECT pa.attacking_work_rate FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_fifa_api_id = 218353;	european_football_2
SELECT      T3.buildUpPlayPositioningClass AS freedom_of_movement FROM      `Team` AS T1 JOIN      `Team_Attributes` AS T2 ON T1.team_api_id = T2.team_api_id JOIN      `Match` AS T3 ON T1.team_api_id = T3.home_team_api_id OR T1.team_api_id = T3.away_team_api_id WHERE      T1.team_long_name = 'ADO Den Haag' AND      T3.id = 1 OR T3.id = 2;	european_football_2
SELECT `heading_accuracy` FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `name` = 'Francois Affolter') AND `date` = '2014-09-18 00:00:00';	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_fifa_api_id = 218353 AND strftime('%Y', pa.date) = '2011';	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016';	european_football_2
SELECT pa.preferred_foot FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.birthday = (     SELECT MIN(birthday)     FROM Player )	european_football_2
SELECT p.player_name, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.weight < 130 AND pa.preferred_foot = 'left';	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes`.`team_api_id` = `Team`.`team_api_id` WHERE `chanceCreationPassingClass` = 'Risky';	european_football_2
SELECT pa.attacking_work_rate, pa.defensive_work_rate FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_fifa_api_id = 218353;	european_football_2
SELECT `Player`.`birthday` FROM `Player` JOIN `Player_Attributes` ON `Player`.`player_api_id` = `Player_Attributes`.`player_api_id` WHERE `Player_Attributes`.`overall_rating` = (     SELECT MAX(`overall_rating`)     FROM `Player_Attributes` )	european_football_2
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal) AS avg_home_team_goal FROM Match JOIN Country ON Match.country_id = Country.id WHERE Country.id = 1 AND season = '2010/2011';	european_football_2
SELECT pa.player_fifa_api_id, pa.player_api_id, AVG(pa.finishing) AS avg_finishing FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.height = (SELECT MAX(height) FROM Player) OR p.height = (SELECT MIN(height) FROM Player) GROUP BY pa.player_fifa_api_id, pa.player_api_id ORDER BY avg_finishing DESC LIMIT 1;	european_football_2
SELECT `player_name` FROM `Player` WHERE `height` > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM `Player` WHERE `player_name` LIKE 'Adam%' AND `weight` > 170;	european_football_2
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT pa.potential  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_fifa_api_id = 218353 AND p.player_api_id = 505942;	european_football_2
SELECT DISTINCT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.preferred_foot = 'left';	european_football_2
SELECT `Team.team_long_name` FROM `Team` JOIN `Team_Attributes` ON `Team.team_api_id` = `Team_Attributes.team_api_id` WHERE `Team_Attributes.buildUpPlaySpeedClass` = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_short_name = 'CLB';	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.buildUpPlayPassing > 70;	european_football_2
SELECT AVG(t2.overall_rating) AS avg_rating FROM Player_Attributes t2 JOIN Player t1 ON t2.player_api_id = t1.player_api_id WHERE strftime('%Y', t2.date) BETWEEN '2010' AND '2015' AND t1.height > 170;	european_football_2
SELECT `Player`, MIN(`height`) AS shortest_height FROM `Player` WHERE `height` = (SELECT MIN(`height`) FROM `Player`) GROUP BY `Player` ORDER BY shortest_height ASC LIMIT 1;	european_football_2
SELECT `Country.name`  FROM `League` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `League.name` = 'Italy Serie A';	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `buildUpPlaySpeed` = 31 AND `buildUpPlayDribbling` = 53 AND `buildUpPlayPassing` = 32;	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes`  JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id`  WHERE `Player.player_name` = 'Aaron Doran';	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT T.team_short_name FROM Team T JOIN Match M ON T.team_api_id = M.home_team_api_id WHERE M.home_team_goal = 10;	european_football_2
SELECT p.player_name, pa.balance, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = 61 ORDER BY pa.balance DESC LIMIT 1;	european_football_2
SELECT     (AVG(PA1.ball_control) - AVG(PA2.ball_control)) AS Ball_Control_Difference FROM     Player_Attributes PA1 JOIN     Player P1 ON PA1.player_api_id = P1.player_api_id AND P1.player_name = 'Abdou Diallo' JOIN     Player_Attributes PA2 ON PA2.player_api_id = P2.player_api_id AND P2.player_name = 'Aaron Appindangoye'	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT      P1.player_api_id AS Lennon_API_ID,      P1.birthday AS Lennon_Birthday,      P2.player_api_id AS Barrada_API_ID,      P2.birthday AS Barrada_Birthday FROM      Player P1 JOIN      Player P2 ON P1.player_api_id = 505942 AND P2.player_api_id = 23780	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.preferred_foot = 'left' AND pa.attacking_work_rate = 'low';	european_football_2
SELECT `Country`.`name` FROM `League` JOIN `Country` ON `League`.`country_id` = `Country`.`id` WHERE `League`.`name` = 'Belgium Jupiler League';	european_football_2
SELECT `name` FROM `League` JOIN `Country` ON `League`.`country_id` = `Country`.`id` WHERE `Country`.`name` = 'Germany';	european_football_2
SELECT p.player_name, pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT DISTINCT pa.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high';	european_football_2
SELECT p.player_fifa_api_id, p.player_api_id FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_fifa_api_id IN (218353, 189615, 186170) ORDER BY pa.crossing DESC LIMIT 1;	european_football_2
SELECT pa.heading_accuracy FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_fifa_api_id = 218353;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.height > 180 AND pa.volleys > 70;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2008/2009' AND country_id = (SELECT id FROM Country WHERE name = 'Belgium');	european_football_2
SELECT pa.long_passing FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League') AND SUBSTR(date, 1, 7) = '2009-04'	european_football_2
SELECT `name`  FROM `League`  WHERE `id` IN (SELECT `league_id` FROM `Match` WHERE `season` = '2008/2009') GROUP BY `name` ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE strftime('%Y', Player.birthday) < '1986';	european_football_2
SELECT      (PA1.overall_rating - PA2.overall_rating) * 100.0 / PA2.overall_rating FROM      Player_Attributes PA1 JOIN      Player_Attributes PA2 ON PA1.player_api_id = PA2.player_api_id WHERE      PA1.player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Ariel Borysiuk')     AND PA2.player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Paulin Puel')	european_football_2
SELECT AVG(`buildUpPlaySpeed`) AS average_build_up_play_speed FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes`.`team_api_id` = `Team`.`team_api_id` WHERE `Team`.`team_long_name` = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating)  FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(`Player_Attributes.crossing`) AS total_crossing_score FROM `Player_Attributes` JOIN `Player` AS T2 ON `Player_Attributes.player_api_id` = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'	european_football_2
SELECT MAX(`chanceCreationPassing`) AS HighestChanceCreationPassing, `chanceCreationPassingClass` FROM `Team_Attributes` T JOIN `Team` TM ON T.`team_api_id` = TM.`team_api_id` WHERE TM.`team_long_name` = 'Ajax' GROUP BY `chanceCreationPassingClass` ORDER BY `chanceCreationPassing` DESC LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(`overall_rating`)  FROM `Player_Attributes`  JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id`  WHERE `Player`.`player_name` = 'Dorlan Pabon'	european_football_2
SELECT AVG(`Match.away_team_goal`)  FROM `Match`  JOIN `Team` ON `Match.away_team_api_id` = `Team.team_api_id`  WHERE `Team.team_long_name` = 'Parma'  AND `Match.country_id` = (SELECT `Country.id` FROM `Country` JOIN `League` ON `Country.id` = `League.country_id` WHERE `League.id` = (SELECT `Team.country_id` FROM `Team` WHERE `Team.team_long_name` = 'Parma'));	european_football_2
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%' ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT `overall_rating` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Aaron Mooy' AND `Player_Attributes.date` LIKE '2016-02-04%'	european_football_2
SELECT `potential` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id` WHERE `Player.player_name` = 'Francesco Parravicini' AND `Player_Attributes.date` = '2010-08-30 00:00:00';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id` WHERE `Player`.`player_name` = 'Francesco Migliore' AND `Player_Attributes`.`date` LIKE '2015-05-01%';	european_football_2
SELECT `defensive_work_rate` FROM `Player_Attributes` INNER JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id` WHERE `Player.player_name` = 'Kevin Berigaud' AND `Player_Attributes.date` = '2013-02-22 00:00:00';	european_football_2
SELECT `date` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Kevin Constant' ORDER BY `crossing` DESC LIMIT 1;	european_football_2
SELECT `buildUpPlaySpeedClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Willem II' AND `date` = '2012-02-22'	european_football_2
SELECT `buildUpPlayDribblingClass` FROM `Team_Attributes` WHERE `team_short_name` = 'LEI' AND `date` = '2015-09-10 00:00:00';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'FC Lorient' AND Team_Attributes.date LIKE '2010-02-22%'	european_football_2
SELECT `chanceCreationPassingClass` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_fifa_api_id` = `Team.team_fifa_api_id` WHERE `Team.team_long_name` = 'PEC Zwolle' AND `Team_Attributes.date` = '2013-09-20 00:00:00'	european_football_2
SELECT chanceCreationCrossingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Hull City' AND Team_Attributes.date = '2010-02-22 00:00:00'	european_football_2
SELECT `defenceAggressionClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Hannover 96' AND `date` LIKE '2015-09-10%'	european_football_2
SELECT AVG(`overall_rating`) AS avg_overall_rating FROM `Player_Attributes` WHERE `player_name` = 'Marko Arnautovic' AND DATE(`date`, 'unixepoch', 'start of day') BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT      (SUBTRACT(P1.overall_rating, P2.overall_rating) / P1.overall_rating) * 100 AS percentage_difference FROM      Player_Attributes AS P1 JOIN      Player AS P2 ON P1.player_api_id = P2.player_api_id WHERE      P1.date = '2013-07-12' AND      P1.player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan') AND      P2.player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.height DESC LIMIT 1;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT `player_name` FROM `Player` WHERE DATEDIFF(CURRENT_TIMESTAMP, datetime(`birthday`, 'localtime')) > 34 * 365;	european_football_2
SELECT SUM(`home_team_goal`) AS total_home_goals FROM `Match` JOIN `Player` ON `Match.home_player_1` = `Player.player_api_id` WHERE `Player.player_name` = 'Aaron Lennon';	european_football_2
SELECT SUM(a.away_team_goal) AS total_away_goals FROM Match a JOIN Player p ON a.away_player_1 = p.player_api_id OR a.away_player_2 = p.player_api_id WHERE p.player_name IN ('Daan Smith', 'Filipe Ferreira');	european_football_2
SELECT SUM(CASE WHEN TIMESTAMPDIFF(YEAR, `Player.birthday`, CURRENT_TIMESTAMP) < 31 THEN `Match.home_team_goal` ELSE 0 END) AS total_home_goals_by_young_players FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` JOIN `Match` ON `Player_Attributes.player_fifa_api_id` = `Match.home_player_1` WHERE TIMESTAMPDIFF(YEAR, `Player.birthday`, CURRENT_TIMESTAMP) < 31 GROUP BY `Player_Attributes.player_api_id`;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.strength = (SELECT MAX(strength) FROM Player_Attributes);	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Match m ON p.player_api_id = m.home_player_X1 OR p.player_api_id = m.home_player_X2 OR p.player_api_id = m.home_player_X3 OR p.player_api_id = m.home_player_X4 OR p.player_api_id = m.home_player_X5 OR p.player_api_id = m.home_player_X6 OR p.player_api_id = m.home_player_X7 OR p.player_api_id = m.home_player_X8 OR p.player_api_id = m.home_player_X9 OR p.player_api_id = m.home_player_X10 OR p.player_api_id = m.home_player_X11 OR p.player_api_id = m.away_player_X1 OR p.player_api_id = m.away_player_X2 OR p.player_api_id = m.away_player_X3 OR p.player_api_id = m.away_player_X4 OR p.player_api_id = m.away_player_X7 OR p.player_api_id = m.away_player_X9 OR p.player_api_id = m.away_player_X10 OR p.player_api_id = m.away_player_X11 WHERE pa.attacking_work_rate = 'high' AND m.possession = 'Home Team' UNION SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Match m ON p.player_api_id = m.home_player_X1 OR p.player_api_id = m.home_player_X2 OR p.player_api_id = m.home_player_X3 OR p.player_api_id = m.home_player_X4 OR p.player_api_id = m.home_player_X5 OR p.player_api_id = m.home_player_X6 OR p.player_api_id = m.home_player_X7 OR p.player_api_id = m.home_player_X8 OR p.player_api_id = m.home_player_X9 OR p.player_api_id = m.home_player_X10 OR p.player_api_id = m.home_player_X11 OR p.player_api_id = m.away_player_X1 OR p.player_api_id = m.away_player_X2 OR p.player_api_id = m.away_player_X3 OR p.player_api_id = m.away_player_X4 OR p.player_api_id = m.away_player_X7 OR p.player_api_id = m.away_player_X9 OR p.player_api_id = m.away_player_X10 OR p.player_api	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY p.birthday LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Country c ON p.player_fifa_api_id = c.id WHERE c.name = 'Belgium';	european_football_2
SELECT p.player_api_id, c.name AS country_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id JOIN Country c ON p.player_fifa_api_id = c.id WHERE pa.vision > 89;	european_football_2
SELECT `Country`.id AS country_id, `Country`.name AS country_name, AVG(`Player`.weight) AS average_weight FROM `Player` JOIN `Player_Attributes` ON `Player`.player_api_id = `Player_Attributes`.player_api_id JOIN `Country` ON `Player`.player_fifa_api_id = `Country`.id GROUP BY `Country`.id, `Country`.name ORDER BY average_weight DESC LIMIT 1;	european_football_2
SELECT `team_long_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `Team_Attributes.buildUpPlaySpeedClass` = 'Slow';	european_football_2
SELECT `Team.team_short_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `Team_Attributes.chanceCreationPassingClass` = 'Safe'	european_football_2
SELECT AVG(height) AS average_height FROM Player JOIN Country ON Player.player_fifa_api_id = Country.id WHERE Country.name = 'Italy';	european_football_2
SELECT p.player_name FROM Player p WHERE p.height > 180 ORDER BY p.player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT     (SELECT `jumping` FROM `Player_Attributes` WHERE `id` = 6) - (SELECT `jumping` FROM `Player_Attributes` WHERE `id` = 23) AS jumping_difference;	european_football_2
SELECT pa.player_api_id FROM Player_Attributes pa WHERE pa.potential = (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right')   AND pa.preferred_foot = 'right' ORDER BY pa.overall_rating ASC LIMIT 5;	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = 'left') AND preferred_foot = 'left';	european_football_2
SELECT      (COUNT(*) FILTER (WHERE `stamina` > 80 AND `strength` > 80) * 100.0) / COUNT(*) AS percentage_with_high_strength_and_stamina FROM `Player_Attributes`;	european_football_2
SELECT `name` FROM `League` WHERE `name` = 'Poland Ekstraklasa';	european_football_2
SELECT      M.home_team_goal AS home_final_score,      M.away_team_goal AS away_final_score FROM      Match M JOIN      League L ON M.league_id = L.id WHERE      M.date LIKE '2008-09-24%' AND      L.name = 'Belgium Jupiler League' ORDER BY      M.id;	european_football_2
SELECT `sprint_speed`, `agility`, `acceleration` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Alexis Blin';	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE Team.team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A') AND season = '2015/2016';	european_football_2
SELECT MAX(home_team_goal) AS highest_score FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie');	european_football_2
SELECT `Player_Attributes`.finishing, `Player_Attributes`.curve FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.player_api_id = `Player`.player_api_id WHERE `Player`.weight = (SELECT MAX(`weight`) FROM `Player`)	european_football_2
SELECT      League.name,     COUNT(Match.id) AS total_games FROM      League JOIN      Match ON League.id = Match.league_id WHERE      Match.season = '2015/2016' GROUP BY      League.name ORDER BY      total_games DESC LIMIT 4;	european_football_2
SELECT T2.team_long_name FROM Match AS M JOIN Team AS T1 ON M.away_team_api_id = T1.team_api_id WHERE M.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)	european_football_2
SELECT p.player_name, pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT      (COUNT(CASE WHEN `Player`.`height` < 180 AND `Player_Attributes`.`overall_rating` > 70 THEN 1 END) * 100.0) / COUNT(`Player_Attributes`.`id`) AS under_180_strength_over_70_percentage FROM      `Player_Attributes` JOIN      `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id`	european_football_2
SELECT      CASE          WHEN SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END)               > SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END)          THEN 'In-patient'         ELSE 'Outpatient'     END AS MajorityType,     (SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END)       - SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END))      * 100.0 /      (SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END) * 2) AS PercentageDeviation FROM      Patient;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `Birthday` > '1930' THEN `ID` END) * 100.0) / COUNT(`ID`) AS PercentageOfFemalesBornAfter1930 FROM      `Patient` WHERE      `SEX` = 'F';	thrombosis_prediction
SELECT      ROUND((COUNT(*) * 100.0) / SUM(CASE WHEN p.Admission = '+' THEN 1 ELSE 0 END), 2) AS PercentageInpatients FROM      Patient p WHERE      p.Birthday BETWEEN '1930-01-01' AND '1940-12-31'	thrombosis_prediction
SELECT      (COUNT(CASE WHEN p.Admission = '+' THEN e.ID END) * 1.0) /      COUNT(CASE WHEN p.Admission = '-' THEN e.ID END) AS Outpatient_to_Inpatient_Ratio FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Diagnosis = 'SLE';	thrombosis_prediction
SELECT      P.Diagnosis,      L.Date  FROM      Patient P  JOIN      Laboratory L  ON      P.ID = L.ID  WHERE      P.ID = 30609;	thrombosis_prediction
SELECT p.SEX, p.Birthday, e.`Examination Date`, e.Symptoms FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 163109;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 500;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURDATE()) - YEAR(p.Birthday)) - (RIGHT(CURDATE(), 5) < RIGHT(p.Birthday, 5)) AS Age FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.RVVT = '+'	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 2;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1937 AND l.T-CHO >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Patient`.SEX = 'F' AND `Laboratory`.TP < 6.0 OR `Laboratory`.TP > 8.5 THEN 1 ELSE 0 END) * 100.0) / COUNT(`Patient`.ID) AS Percentage_Female_Outside_Normal_TP FROM      `Patient` JOIN      `Laboratory` ON `Patient`.ID = `Laboratory`.ID	thrombosis_prediction
SELECT AVG(`aCL IgG`) AS avg_anti_cardiolipin_igG FROM `Examination` WHERE `ID` IN (     SELECT `ID`     FROM `Patient`     WHERE SUBSTR(`Birthday`, 6, 2) + 50 <= MONTH(CURRENT_DATE) )	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Description) = 1997 AND Admission = '-';	thrombosis_prediction
SELECT MIN(YEAR(`First Date`) - YEAR(`Birthday`)) AS YoungestAge FROM `Patient` WHERE `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Thrombosis = 1 AND YEAR(L.Date) = 1997 AND P.sex = 'F';	thrombosis_prediction
SELECT      MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS AgeGap FROM      Patient WHERE      ID IN (SELECT ID FROM Laboratory WHERE tg >= 200)	thrombosis_prediction
SELECT      P.Birthday,      E.Diagnosis,      E.Symptoms  FROM      Patient P  JOIN      Examination E ON P.ID = E.ID  WHERE      P.Birthday = (SELECT MIN(Birthday) FROM Patient)      AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT     CASE          WHEN MONTH('1998-01-01') = MONTH(L.Date) THEN 1         ELSE 0      END AS IsFirstMonth,     COUNT(DISTINCT P.ID) AS TotalPatients FROM     Laboratory L JOIN     Patient P ON L.ID = P.ID WHERE     P.SEX = 'M'     AND L.Date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY     IsFirstMonth HAVING     IsFirstMonth = 1 UNION ALL SELECT     0 AS IsFirstMonth,     COUNT(DISTINCT P.ID) AS TotalPatients FROM     Laboratory L JOIN     Patient P ON L.ID = P.ID WHERE     P.SEX = 'M'     AND L.Date BETWEEN '1998-02-01' AND '1998-12-31' GROUP BY     IsFirstMonth UNION ALL SELECT     0 AS IsFirstMonth,     COUNT(DISTINCT P.ID) AS TotalPatients FROM     Laboratory L JOIN     Patient P ON L.ID = P.ID WHERE     P.SEX = 'M'     AND L.Date BETWEEN '1998-03-01' AND '1998-12-31' GROUP BY     IsFirstMonth UNION ALL SELECT     0 AS IsFirstMonth,     COUNT(DISTINCT P.ID) AS TotalPatients FROM     Laboratory L JOIN     Patient P ON L.ID = P.ID WHERE     P.SEX = 'M'     AND L.Date BETWEEN '1998-04-01' AND '1998-12-31' GROUP BY     IsFirstMonth UNION ALL SELECT     0 AS IsFirstMonth,     COUNT(DISTINCT P.ID) AS TotalPatients FROM     Laboratory L JOIN     Patient P ON L.ID = P.ID WHERE     P.SEX = 'M'     AND L.Date BETWEEN '1998-05-01' AND '1998-12-31' GROUP BY     IsFirstMonth UNION ALL SELECT     0 AS IsFirstMonth,     COUNT(DISTINCT P.ID) AS TotalPatients FROM     Laboratory L JOIN     Patient P ON L.ID = P.ID WHERE     P.SEX = 'M'	thrombosis_prediction
SELECT      p.Birthday,      l.Date AS LabWorkDate,      (YEAR(l.Date) - YEAR(p.Birthday)) AS AgeAtArrival FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID = (         SELECT              ID          FROM              Patient          ORDER BY              Birthday DESC          LIMIT 1     );	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Patient.SEX` = 'M' AND `Examination.ANA` <= 8 THEN 1 ELSE 0 END) /       SUM(CASE WHEN `Patient.SEX` = 'F' AND `Examination.ANA` <= 6.5 THEN 1 ELSE 0 END)) AS Male_to_Female_Ratio FROM      `Examination` JOIN      `Patient` ON `Examination.ID` = `Patient.ID`;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE p.First_Date IS NOT NULL AND e.Examination_Date IS NULL AND (p.First_Date + INTERVAL 1 YEAR) < COALESCE(e.Examination_Date, '1000-01-01');	thrombosis_prediction
SELECT COUNT(*) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE YEAR(Patient.Birthday) < 1975 AND YEAR(Examination.Examination Date) BETWEEN 1990 AND 1993;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'M' AND Laboratory.T_BIL >= 2.0;	thrombosis_prediction
SELECT      E.Diagnosis,      COUNT(*) as frequency FROM      Examination E JOIN      Laboratory L ON E.ID = L.ID WHERE      L.Date BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY      E.Diagnosis ORDER BY      frequency DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(SUBTRACT(YEAR(CURDATE()), YEAR(`Birthday`))) AS average_age FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.Date` BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
SELECT      p.Birthday,      TIMESTAMPDIFF(YEAR, p.Birthday, e.Date) AS AgeAtExamination,      p.Diagnosis AS PatientDiagnosis FROM      Patient p JOIN      Examination e ON p.ID = e.ID JOIN      Laboratory l ON p.ID = l.ID WHERE      l.HGB = (SELECT MAX(HGB) FROM Laboratory)	thrombosis_prediction
SELECT `aCL IgG`, `aCL IgM`, `ANA`, `aCL IgA` FROM Examination WHERE `ID` = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory  WHERE `ID` = 2927464 AND `Date` = '1995-09-04' AND TotalCholesterol < 250;	thrombosis_prediction
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY First Date ASC LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM `Examination` WHERE `Examination Date` = '1993-11-12' AND `ID` IN (SELECT `ID` FROM `Patient` WHERE `Description` = '1994-02-19' AND `Diagnosis` = 'SLE');	thrombosis_prediction
SELECT `Patient`.SEX FROM `Patient` JOIN `Laboratory` ON `Patient`.ID = `Laboratory`.ID WHERE `Laboratory`.Date = '1992-06-12' AND `Laboratory`.GPT = '9' AND `Patient`.SEX IN ('M', 'F');	thrombosis_prediction
SELECT   TIMESTAMPDIFF(YEAR, p.Birthday, '1991-10-21') AS AgeAtTest FROM   Laboratory l JOIN   Patient p ON l.ID = p.ID WHERE   l.Date = '1991-10-21'   AND l.UA = '8.4';	thrombosis_prediction
SELECT COUNT(`Laboratory.ID`)  FROM `Laboratory` JOIN `Patient` ON `Laboratory.ID` = `Patient.ID` WHERE `Patient.First Date` = '1991-06-13'  AND `Patient.Diagnosis` = 'SJS'  AND YEAR(`Laboratory.Date`) = 1995;	thrombosis_prediction
SELECT p.`Diagnosis` AS OriginalDiagnosis FROM `Patient` p JOIN `Examination` e ON p.`ID` = e.`ID` WHERE p.`First Date` = '1997-01-27' AND e.`Diagnosis` = 'SLE';	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE `Examination Date` = '1993-09-27' AND ID = (     SELECT ID     FROM Patient     WHERE Birthday = '1959-03-01' );	thrombosis_prediction
SELECT      (SUM(CASE WHEN P.Birthday = '1959-02-18' AND L.Date LIKE '1981-11-%' THEN L.T-CHO ELSE 0 END) -       SUM(CASE WHEN P.Birthday = '1959-02-18' AND L.Date LIKE '1981-12-%' THEN L.T-CHO ELSE 0 END)) /      SUM(CASE WHEN P.Birthday = '1959-02-18' AND L.Date LIKE '1981-11-%' THEN L.T-CHO ELSE 1 END) AS DecreaseRate FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      P.Birthday = '1959-02-18' AND      L.Date BETWEEN '1981-11-01' AND '1981-12-31';	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'Behcet' AND e.Examination_Date BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.Examination_Date BETWEEN '1987-07-06' AND '1996-01-31' AND E.aCL_IgG > 30 AND L.ALB < 4 ORDER BY E.ID;	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' ORDER BY ID;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 2 AND ANA = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination);	thrombosis_prediction
SELECT      ROUND(         (SUM(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 AND UA <= 6.5 THEN 1 ELSE 0 END)           / SUM(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN 1 ELSE 0 END)) * 100,          2     ) AS percentage_within_normal_proteinuria_with_low_uric_acid FROM Laboratory	thrombosis_prediction
SELECT     (SUM(CASE WHEN `Diagnosis` = 'BEHCET' AND YEAR(`First Date`) = '1981' THEN 1 ELSE 0 END) /      (COUNT(CASE WHEN `Diagnosis` = 'BEHCET' AND YEAR(`First Date`) = '1981' THEN 1 END)) * 100) AS PercentageOfMalePatientsDiagnosedWithBEHCET FROM `Patient` WHERE `SEX` = 'M'	thrombosis_prediction
SELECT DISTINCT L.ID FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM `Patient`  WHERE `SEX` = 'F' AND YEAR(`BIRTHDAY`) BETWEEN 1980 AND 1989  AND `ID` NOT IN (     SELECT `E.ID`     FROM `Examination` AS E     JOIN `Patient` AS P ON E.ID = P.ID     WHERE E.`ANA Pattern` = 'P' ) AND `ID` IN (     SELECT `E.ID`     FROM `Examination` AS E     JOIN `Patient` AS P ON E.ID = P.ID     WHERE E.`ANA Pattern` != 'P' OR E.`ANA Pattern` IS NULL );	thrombosis_prediction
SELECT p.SEX  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Diagnosis = 'PSS'  AND l.CRP > 2  AND l.CRE = 1  AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(ALB)  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Patient.SEX = 'F'  AND Patient.PLT > 400  AND Patient.Diagnosis = 'SLE';	thrombosis_prediction
SELECT `Examination.aCL_IgG`, COUNT(`Examination.aCL_IgG`) AS frequency FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Patient.Diagnosis` = 'SLE' GROUP BY `Examination.aCL_IgG` ORDER BY frequency DESC LIMIT 1;	thrombosis_prediction
SELECT p.Description, p.Diagnosis FROM Patient p WHERE p.ID = 48473 ORDER BY p.First_Date ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE YEAR(Date) = 1997 AND tp > 6 AND tp < 8.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Examination`.`Diagnosis` LIKE '%SLE%' THEN 1 ELSE 0 END)      / SUM(CASE WHEN `Examination`.`Thrombosis` = 1 THEN 1 ELSE 0 END)) * 100 AS Proportion_SLE_with_Thrombocytopenia FROM      `Examination`;	thrombosis_prediction
SELECT      (SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Percentage_Female_RA FROM      Patient WHERE      YEAR(Birthday) = 1980 AND      Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND e.Diagnosis LIKE '%Behcet%' AND e.RVVT IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination.Date`, `Patient.First Date`)  FROM `Patient`  JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE `Patient.ID` = 821298;	thrombosis_prediction
SELECT      Lab.ID,     Lab.Date,     Lab.UA FROM      Laboratory AS Lab JOIN      Patient AS Pat ON Lab.ID = Pat.ID WHERE      Lab.ID = 57266 AND      ((Pat.SEX = 'M' AND Lab.UA > 8.0) OR       (Pat.SEX = 'F' AND Lab.UA > 6.5));	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ID = (SELECT ID FROM Patient WHERE ID = 48473) AND GOT >= 60;	thrombosis_prediction
SELECT p.Sex, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND YEAR(l.Date) = 1994;	thrombosis_prediction
SELECT Patient.ID FROM Patient WHERE Patient.SEX = 'M' AND EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.ID = Patient.ID     AND Laboratory.GPT >= 60 );	thrombosis_prediction
SELECT Patient.ID, Patient.DateOfBirth FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GPT > 60 ORDER BY Patient.DateOfBirth ASC;	thrombosis_prediction
SELECT AVG(LDH) as Average_LDH FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT `Patient.ID`, (YEAR(CURRENT_TIMESTAMP) - `Patient.Birthday`) AS `Age` FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.LDH` BETWEEN 600 AND 800;	thrombosis_prediction
SELECT PatientType, COUNT(*) AS TotalPatients FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE ALP < 300) GROUP BY PatientType;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01' AND l.ALP < 300;	thrombosis_prediction
SELECT `Patient`.`ID`, `Patient`.`sex`, `Patient`.`DateOfBirth` FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`TP` < 6.0;	thrombosis_prediction
SELECT      P.ID,      L.TP,      L.TP - 8.5 AS TP_Deviation FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      P.SEX = 'F' AND      L.TP > 8.5;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB < 3.5 OR l.ALB >= 5.5 ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT      ID,     CASE          WHEN ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range'         ELSE 'Not Within Normal Range'     END AS Albumin_Status FROM      Laboratory WHERE      YEAR(`Date`) = 1982     AND ALB BETWEEN 3.5 AND 5.5;	thrombosis_prediction
SELECT     (COUNT(*) FILTER (WHERE `Sex` = 'F' AND `UA` > 6.5) * 100.0) / COUNT(*) FROM     Laboratory JOIN     Patient ON Laboratory.ID = Patient.ID WHERE     `Sex` = 'F';	thrombosis_prediction
SELECT AVG(UA) AS Average_UA_Index FROM Laboratory WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE (UA < 8.0 AND SEX = 'M') OR (UA < 6.5 AND SEX = 'F')     GROUP BY ID     HAVING MAX(Date) = Date );	thrombosis_prediction
SELECT p.ID, p.sex, p.birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.ANA = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'RA' AND e.Diagnosis LIKE '%UN < 30%'	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.CRE > 1.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END)) AS MaleVsFemaleAboveNormal FROM      Laboratory WHERE      CRE >= 1.5;	thrombosis_prediction
SELECT p.ID, p.sex, p.birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory);	thrombosis_prediction
SELECT      `Patient`.SEX,      GROUP_CONCAT(DISTINCT `Patient`.ID) AS PatientIDs FROM      `Patient` JOIN      `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE      `Laboratory.T-BIL` >= 2.0 GROUP BY      `Patient`.SEX;	thrombosis_prediction
SELECT p.ID, MAX(l.T-CHO) AS T_CHO FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND l.T-CHO = (SELECT MAX(T-CHO) FROM Laboratory)	thrombosis_prediction
SELECT AVG(DATEDIFF(CURRENT_DATE, `Birthday`) / 365) AS average_age FROM `Patient` p JOIN `Laboratory` l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.T-CHO >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT `Patient`.`ID`)  FROM `Patient`  JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID`  WHERE `Laboratory`.`TG` >= 200  AND (YEAR(CURDATE()) - YEAR(`Patient`.`Birthday`)) > 50;	thrombosis_prediction
SELECT DISTINCT `ID` FROM `Laboratory` WHERE `CPK` < 250 AND `CRP` = '0.6';	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday BETWEEN '1936-01-01' AND '1956-12-31' AND p.SEX = 'M' AND l.CPK >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU >= 180 AND l.T_Cho > 0 AND l.T_Cho < 250;	thrombosis_prediction
SELECT `Patient.ID`, `Laboratory.GLU` FROM `Laboratory` JOIN `Patient` ON `Laboratory.ID` = `Patient.ID` WHERE `Laboratory.GLU` < 180 AND YEAR(`Laboratory.Date`) = 1991 AND NOT EXISTS (     SELECT 1     FROM `Laboratory` AS Lab2     WHERE Lab2.ID = `Laboratory.ID`     AND YEAR(Lab2.Date) < 1991 ) GROUP BY `Patient.ID`, `Laboratory.GLU` ORDER BY `Patient.ID`, `Laboratory.Date`;	thrombosis_prediction
SELECT p.ID, p.SEX, p.ID AS Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE (l.WBC <= 3.5 OR l.WBC >= 9.0) GROUP BY p.SEX ORDER BY p.ID;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age,      p.Diagnosis FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Diagnosis IS NOT NULL AND      l.RBC < 3.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Admission FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND p.Admission = '+' AND (l.RBC <= 3.5 OR l.RBC >= 6.0) AND (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Admission)) >= 50;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.HGB < 10;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.HGB BETWEEN 10 AND 17 ORDER BY p.ID LIMIT 1;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID IN (         SELECT              e.ID          FROM              Examination e          GROUP BY              e.ID          HAVING              COUNT(e.ID) > 2 AND MAX(l.HCT) >= 52     ) GROUP BY      p.ID;	thrombosis_prediction
SELECT AVG(HCT) AS average_hematocrit_below_normal FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) AS 'BelowNormalRange',     SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS 'AboveNormalRange',     (SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END)) AS 'Difference' FROM Laboratory;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = 1984 AND SUBDATE(YEAR(CURDATE()), 50) > YEAR(p.Birthday) AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT     (SUM(CASE WHEN L.PT >= 14 AND P.SEX = 'F' THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN L.PT >= 14 THEN 1 ELSE 0 END) FROM     Patient P JOIN     Laboratory L ON P.ID = L.ID WHERE     (YEAR(CURRENT_TIMESTAMP) - YEAR(P.ID)) > 55;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.FirstDate > '1992-12-31' AND L.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Examination_Date > '1997-01-01' AND RVVT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT l.ID) FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.APTT > 45 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT L1.ID) FROM Laboratory L1 JOIN Patient P ON L1.ID = P.ID WHERE P.SEX = 'M' AND L1.WBC BETWEEN 3.5 AND 9.0 AND NOT EXISTS (     SELECT 1     FROM Laboratory L2     WHERE L2.ID = L1.ID     AND (L2.FG <= 150 OR L2.FG >= 450) );	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday > '1980-01-01' AND l.FG BETWEEN 150 AND 450;	thrombosis_prediction
SELECT e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.U-PRO >= 30;	thrombosis_prediction
SELECT `Patient.ID` FROM `Patient` JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE `Examination.aCL IgA` BETWEEN 0 AND 30 AND `Examination.Diagnosis` LIKE '%SLE%' AND `Patient.Diagnosis` LIKE '%SLE%';	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e WHERE e.aCL_IgG >= 2000;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.aCL_IgG > 900 AND E.aCL_IgG < 2000 AND E.aCL_IgA IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.aCL_IgA BETWEEN 80 AND 500 AND e.aCL_IgA = (SELECT MAX(aCL_IgA) FROM Examination WHERE aCL_IgA BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.aCL_IgA > 80 AND e.aCL_IgA < 500 AND l.Date > '1990-01-01';	thrombosis_prediction
SELECT      d.Diagnosis,      COUNT(d.Diagnosis) AS DiseaseCount FROM      Examination e JOIN      Diagnosis d ON e.ID = d.ID WHERE      e.aCL_IgM <= 40 OR e.aCL_IgM >= 400 GROUP BY      d.Diagnosis ORDER BY      DiseaseCount DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID AND l.CRP = '+' WHERE p.Description IS NULL AND l.CRP IS NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE L.CRE >= 1.5 AND SUBDATE(YEAR(CURDATE()), YEAR(P.Birthday)) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE e.aCL_IgG IN('-', '+-') AND l.KCT = '+';	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday > '1985-01-01' AND RA IN('-', '+-');	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.RF < 20 AND (YEAR(CURDATE()) - YEAR(Patient.ID)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.Thrombosis = 0 AND EXISTS (     SELECT 1     FROM Laboratory l     WHERE e.ID = l.ID     AND l.Date = (         SELECT MAX(l2.Date)         FROM Laboratory l2         WHERE l2.ID = e.ID     )     AND NOT EXISTS (         SELECT 1         FROM Examination e2         WHERE e2.ID = l.ID         AND e2.Thrombosis = 1     ) ) AND NOT EXISTS (     SELECT 1     FROM Examination e2     WHERE e2.ID = e.ID     AND e2.Thrombosis = 1 );	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.ANA = 256 AND e.ANA_Pattern = 'P' AND e.aCL_IgG > 35;	thrombosis_prediction
SELECT E.ID  FROM Examination E  WHERE E.aCL_IgG IS NOT NULL AND E.aCL_IgM IS NOT NULL AND E.aCL_IgA IS NOT NULL  AND E.aCL_IgA = (SELECT MAX(aCL_IgA) FROM Examination E2 WHERE E2.aCL_IgG IS NOT NULL AND E2.aCL_IgM IS NOT NULL AND E2.aCL_IgA IS NOT NULL) AND EXISTS (     SELECT 1      FROM Laboratory L      WHERE L.ID = E.ID AND (L.HCT < 29 OR L.HCT > 52) ) ORDER BY E.aCL_IgA DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 1 AND E.aCL_IgG > 10;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RNP IN ('-', '+-') AND P.Admission = '+';	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RNP NOT IN('-', '+-') ORDER BY p.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.`aCL IgG` IN('-', '+-') AND E.Thrombosis = 0;	thrombosis_prediction
SELECT      p.ID  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      e.ANA IS NOT NULL      AND e.ANA NOT IN (0, 256)      AND p.Birthday = (         SELECT              MAX(Birthday)          FROM              Patient          WHERE              e.ANA IS NOT NULL              AND e.ANA NOT IN (0, 256)     )  ORDER BY      p.Birthday DESC  LIMIT 3;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.`Examination Date` > '1997-01-01' AND l.SC170 IN('negative','0');	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'F' AND E.aCL_IgG IN ('negative', '0') AND E.aCL_IgM IN ('negative', '0') AND E.aCL_IgA IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT `Examination.ID`)  FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `aCL IgG` IN('-','+-')  AND `Laboratory.Date` < '2000-01-01';	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SSA NOT IN ('negative', '0') ORDER BY p.FirstDate ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.SSB IN('-', '+-') AND Patient.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.SSB IN ('negative', '0') AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M'  AND Laboratory.CENTROMEA IN('-', '+-')  AND Laboratory.SSB IN('-', '+-');	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.ANA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT `Patient.ID`)  FROM `Patient`  WHERE `Patient.ID` NOT IN (SELECT `ID` FROM `Laboratory` WHERE `Description` IS NULL AND `DNA` < 8);	thrombosis_prediction
SELECT COUNT(p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '+'  AND EXISTS (SELECT 1 FROM Laboratory WHERE ID = p.ID AND IGG BETWEEN 900 AND 2000);	thrombosis_prediction
SELECT      ROUND(         (COUNT(DISTINCT e.ID) / NULLIF(COUNT(DISTINCT CASE WHEN e.aCL_IgG >= 60 THEN e.ID ELSE NULL END), 0)) * 100,          2     ) AS percentage FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.aCL_IgG >= 60 AND p.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN (     SELECT ID     FROM Laboratory     WHERE GOT < 60 );	thrombosis_prediction
SELECT `Patient`.`Birthday` FROM `Patient` WHERE `Patient`.`ID` IN (     SELECT `Laboratory`.`ID`     FROM `Laboratory`     WHERE `Laboratory`.`GOT` >= 60 ) ORDER BY `Patient`.`Birthday` DESC LIMIT 1;	thrombosis_prediction
SELECT `Patient.ID`, `Patient.Birthday`, MAX(`Laboratory.GPT`) as HighestGPT FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.GPT` < 60 GROUP BY `Patient.ID`, `Patient.Birthday` ORDER BY `HighestGPT` DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*)  FROM `Patient` P  JOIN `Laboratory` L ON P.ID = L.ID  WHERE L.GOT < 60 AND P.SEX = 'M';	thrombosis_prediction
SELECT MIN(`Date`)  FROM `Laboratory`  WHERE `LDH` IS NOT NULL AND `LDH` < 500  ORDER BY `Date` ASC  LIMIT 1;	thrombosis_prediction
SELECT MAX(`Date`)  FROM `Laboratory`  WHERE `LDH` >= 500  AND `ID` IN (SELECT `ID` FROM `Patient` WHERE `First Date` = (SELECT MAX(`First Date`) FROM `Patient`));	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.ALP >= 300 AND Patient.Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT `Patient.ID`) FROM `Laboratory` JOIN `Patient` ON `Laboratory.ID` = `Patient.ID` WHERE `Laboratory.ALP` < 300 AND `Patient.Admission` = '-';	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SJS' AND EXISTS (     SELECT 1     FROM Laboratory L2     WHERE L2.ID = P.ID     AND L2.TP > 6.0 AND L2.TP < 8.5 )	thrombosis_prediction
SELECT Examination.Examination_Date FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.ALB = (SELECT MAX(ALB) FROM Laboratory WHERE ALB > 3.5 AND ALB < 5.5) GROUP BY Examination.Examination_Date;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN (     SELECT L.ID     FROM Laboratory L     WHERE L.ALB BETWEEN 3.5 AND 5.5     AND L.T_BIL BETWEEN 6.0 AND 8.5 )	thrombosis_prediction
SELECT E.`aCL IgG`, E.`aCL IgM`, E.`aCL IgA` FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Sex = 'F' AND E.`aCL IgG` > 0 AND E.`aCL IgM` > 0 AND E.`aCL IgA` > 0 AND P.UA > 6.50 ORDER BY P.UA DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(`ANA`) AS Highest_ANA FROM `Examination` WHERE `aCL IgG` < 1.5;	thrombosis_prediction
SELECT      Examination.ID FROM      Examination JOIN      (SELECT MAX(`aCL IgA`) as MaxACLIgA FROM Examination) as MaxACLIgA WHERE      Examination.aCL IgA = MaxACLIgA.MaxACLIgA     AND Examination.CRE < 1.5;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.T_BIL >= 2.0 AND E.ANA_Pattern LIKE '%P%';	thrombosis_prediction
SELECT E.ANA FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory WHERE T_BIL < 2.0) AND L.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE P.T_Cho > 250 AND P.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.T-CHO < 250 AND e.ANA_Pattern = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT Laboratory.ID) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.TG < 200 AND Patient.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT d.DiseaseName FROM Laboratory l JOIN Patient p ON l.ID = p.ID JOIN Diagnosis d ON p.ID = d.PatientID WHERE l.TG < 200 AND l.TG = (SELECT MAX(TG) FROM Laboratory WHERE TG < 200) GROUP BY p.ID ORDER BY MAX(l.TG) DESC LIMIT 1;	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.Thrombosis = 0 AND L.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.CPK < 250 AND (L.CRP = '+' OR L.RVVT = '+' OR L.LAC = '+');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU > 180 ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT l.ID) FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.GLU < 180 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '+' AND L.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT `ID` FROM `Laboratory` WHERE `RBC` <= 3.5 OR `RBC` >= 6.0 AND EXISTS (     SELECT 1     FROM `Patient`     WHERE `Laboratory.ID` = `Patient.ID`     AND `Admission` = '-' );	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis IS NOT NULL AND l.PLT > 100 AND l.PLT < 400;	thrombosis_prediction
SELECT `Laboratory.PLT` FROM `Laboratory` JOIN `Patient` ON `Laboratory.ID` = `Patient.ID` WHERE `Laboratory.PLT` BETWEEN 100 AND 400 AND `Patient.Diagnosis` = 'MCTD';	thrombosis_prediction
SELECT AVG(PT)  FROM Laboratory  WHERE EXISTS (SELECT 1 FROM Patient WHERE Laboratory.ID = Patient.ID AND Patient.Sex = 'M' AND PT < 14);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis IN (1, 2) AND l.PT < 14;	thrombosis_prediction
SELECT `major_name` FROM `member` JOIN `major` ON `member.link_to_major` = `major.major_id` WHERE `member.first_name` = 'Angela' AND `member.last_name` = 'Sanders';	student_club
SELECT COUNT(*)  FROM Student_Club  WHERE College = 'Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Outdoor Product Design and Development';	student_club
SELECT COUNT(DISTINCT e.event_id) FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget JOIN budget b ON ex.link_to_budget = b.budget_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN event e ON m.member_id = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*)  FROM member m  JOIN event e ON m.member_id = (SELECT member_id FROM expense WHERE link_to_member = m.member_id AND link_to_budget IN (SELECT budget_id FROM event WHERE event_name = 'Women''s Soccer')) WHERE m.t_shirt_size = 'Medium';	student_club
SELECT event_name FROM event JOIN (     SELECT event_id, COUNT(*) AS attendance     FROM event     JOIN expense ON event.event_id = expense.link_to_event     GROUP BY event_id ) AS event_attendance ON event.event_id = event_attendance.event_id ORDER BY event_attendance.attendance DESC LIMIT 1;	student_club
SELECT m.position, m.link_to_major, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President' AND m.member_id IN (     SELECT member_id     FROM member     WHERE position = 'Vice President'     AND link_to_major IS NOT NULL );	student_club
SELECT e.event_name FROM event e JOIN expense ex ON e.event_id = ex.link_to_member JOIN member m ON ex.link_to_member = m.member_id WHERE m.member_name = 'Maya McLean';	student_club
SELECT COUNT(*)  FROM event  JOIN expense ON event.event_id = expense.link_to_member  JOIN member ON expense.link_to_member = member.member_id  WHERE member.name = 'Sacha Harrison'  AND YEAR(event.event_date) = 2019;	student_club
SELECT COUNT(*)  FROM (     SELECT event_id      FROM event      JOIN expense ON event.event_id = expense.link_to_budget      JOIN member ON expense.link_to_member = member.member_id      WHERE event.type = 'Meeting'      GROUP BY event.event_id      HAVING COUNT(DISTINCT member.member_id) > 10 ) AS meetings_with_more_than_10_members;	student_club
SELECT e.event_name FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE e.type != 'Fundraiser' GROUP BY e.event_id HAVING COUNT(ex.expense_id) > 20;	student_club
SELECT AVG(COUNT(e.event_id)) / COUNT(DISTINCT e.event_name) AS average_attendance FROM event e WHERE e.type = 'Meeting' AND YEAR(e.event_date) = 2020;	student_club
SELECT MAX(cost) as highest_cost, expense_description FROM expense WHERE expense_description LIKE '%Club Event%' GROUP BY expense_description ORDER BY highest_cost DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM `member` m JOIN `major` ma ON m.`link_to_major` = ma.`major_id` WHERE ma.`major_name` = 'Environmental Engineering' AND m.`position` = 'Member';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN event e ON m.member_id = e.link_to_member WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Law and Constitutional Studies';	student_club
SELECT county FROM member WHERE name = 'Sherri Ramsey';	student_club
SELECT m.college FROM major m JOIN member mbr ON m.major_id = mbr.major_id WHERE mbr.member_name = 'Tyler Hewitt';	student_club
SELECT SUM(i.amount) AS total_funds_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT SUM(b.spent) AS total_spent_on_food FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT `city`, `state` FROM `student_club` WHERE position = 'President' AND `link_to_member` IN (SELECT `member_id` FROM `member` WHERE `city` IS NOT NULL AND `state` IS NOT NULL);	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM `member` WHERE zip IN (SELECT zip_code FROM `zip_code` WHERE state = 'Illinois');	student_club
SELECT SUM(b.spent) AS total_spent_on_advertisement FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Advertisement';	student_club
SELECT major.department FROM major WHERE major_name = 'Outdoor Product Design and Development' OR major_name = 'Agricultural Communication';	student_club
SELECT SUM(b.amount) AS total_budgeted_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker';	student_club
SELECT expense.expense_id, expense.expense_description, expense.approved FROM expense JOIN event ON expense.link_to_budget IN (     SELECT budget.budget_id     FROM budget     JOIN event ON budget.link_to_event = event.event_id     WHERE event.event_name = 'October Meeting' AND event.event_date = '2019-10-08' ) WHERE expense.approved = 'true';	student_club
SELECT AVG(cost) AS average_cost FROM expense WHERE link_to_member = (     SELECT member_id     FROM member     WHERE first_name = 'Elijah' AND last_name = 'Allen' ) AND      SUBSTR(expense_date, 6, 2) IN ('09', '10');	student_club
SELECT      (SUM(CASE WHEN LEFT(event_date, 4) = '2019' THEN expense ELSE 0 END) -      SUM(CASE WHEN LEFT(event_date, 4) = '2020' THEN expense ELSE 0 END)) AS total_difference FROM      (SELECT          SUM(e.amount) AS expense     FROM          event e     INNER JOIN          expense ex ON e.event_id = ex.link_to_event     GROUP BY          e.event_id) AS expenses;	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT SUM(e.expense_description) AS total_cost FROM expense e JOIN event ev ON e.link_to_event = ev.event_id WHERE ev.event_date = '2019-09-04' AND e.expense_description LIKE '%Posters%'	student_club
SELECT `remaining` FROM `budget` WHERE `category` = 'Food' ORDER BY `amount` DESC LIMIT 1;	student_club
SELECT notes  FROM income  WHERE date_received = '2019-09-14' AND notes LIKE '%Fundraising%';	student_club
SELECT COUNT(*)  FROM `major`  WHERE `college` = 'College of Humanities and Social Sciences';	student_club
SELECT `phone`  FROM `member`  WHERE `first_name` = 'Carlo' AND `last_name` = 'Jacobs';	student_club
SELECT `county`  FROM `zip_code`  JOIN `member` ON `zip_code.zip_code` = `member.hometown_zip_code` WHERE `member.name` = 'Adela O''Gallagher';	student_club
SELECT COUNT(*) FROM budget WHERE link_to_event IN (     SELECT event_id     FROM event     WHERE event_name = 'November Meeting' ) AND remaining < 0;	student_club
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'September Speaker';	student_club
SELECT e.event_status FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Brent' AND m.last_name = 'Thomason';	student_club
SELECT COUNT(*) FROM `member` JOIN `major` ON `member.link_to_major` = `major.major_id` WHERE `major.major_name` = 'Business' AND `member.t_shirt_size` = 'Medium';	student_club
SELECT `zip_code`.`type` FROM `zip_code` JOIN `member` ON `zip_code`.`zip_code` = `member`.`zip_code` WHERE `member`.`name` = 'Christof Nielson';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT hometown_state  FROM member  WHERE name = 'Sacha Harrison';	student_club
SELECT m.link_to_major, m.first_name, ma.department FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'President';	student_club
SELECT i.date_received  FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name = 'Connor' AND m.last_name = 'Hilton' AND i.date_received LIKE '%Dues%';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = (SELECT MIN(date_received) FROM income WHERE source = 'Dues') AND i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /       SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END)) AS ratio FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      b.category = 'Advertisement';	student_club
SELECT      (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) /      (SELECT SUM(amount) FROM budget b WHERE b.event_name = 'November Speaker')) * 100 AS parking_percentage FROM      budget b WHERE      b.event_name = 'November Speaker'	student_club
SELECT SUM(e.cost) AS total_pizza_cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Women''s Soccer' AND e.expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city)  FROM location  WHERE county = 'Orange' AND state = 'Virginia';	student_club
SELECT department FROM major WHERE department = 'College of Humanities and Social Sciences';	student_club
SELECT hometown FROM member WHERE member_name = 'Amy Firth';	student_club
SELECT e.expense_description, e.cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE b.remaining = (SELECT MIN(remaining) FROM budget) ORDER BY e.expense_date;	student_club
SELECT DISTINCT m.member_id, m.first_name, m.last_name FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN event ev ON ev.event_id = e.link_to_budget WHERE ev.event_name = 'October Meeting';	student_club
SELECT `college`, COUNT(`member_id`) AS member_count FROM `member` JOIN `major` ON `member.link_to_major` = `major.major_id` GROUP BY `college` ORDER BY member_count DESC LIMIT 1;	student_club
SELECT m.link_to_major, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.phone = '809-555-3360';	student_club
SELECT `event_name`, MAX(`amount`) AS highest_budget_amount FROM `event` JOIN `budget` ON `event`.`event_id` = `budget`.`link_to_event` GROUP BY `event`.`event_id` ORDER BY `highest_budget_amount` DESC LIMIT 1;	student_club
SELECT e.expense_description, e.expense_date, e.cost FROM expense e JOIN member m ON e.link_to_member = m.member_id JOIN position p ON m.member_id = p.member_id WHERE p.position_title = 'Vice President';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN event ev ON e.link_to_budget = ev.event_id WHERE ev.event_name = 'Women''s Soccer';	student_club
SELECT date_received FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Casey' AND member.last_name = 'Mason';	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE m.state = 'Maryland' UNION SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN income i ON m.member_id = i.link_to_member  WHERE m.state = 'Maryland';	student_club
SELECT COUNT(*)  FROM event  WHERE `link_to_member` IN (     SELECT `member_id`      FROM `member`      WHERE `phone` = '954-555-6240' );	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'School of Applied Sciences, Technology and Education';	student_club
SELECT      e.event_name,      b.spent / b.amount AS spend_to_budget_ratio FROM      event e JOIN      budget b ON e.event_id = b.link_to_event WHERE      e.status = 'Closed' ORDER BY      spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'President' AND link_to_major IS NOT NULL;	student_club
SELECT MAX(spent) AS highest_spent FROM budget WHERE event_status = 'Closed';	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT SUM(b.spent) as total_spent_on_food FROM budget b WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id HAVING COUNT(e.link_to_event) > 7;	student_club
SELECT DISTINCT m.member_id FROM member m JOIN major ma ON m.major_id = ma.major_id JOIN event e ON m.member_id = e.link_to_member WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT first_name, last_name FROM student WHERE city = 'Georgetown' AND state = 'South Carolina';	student_club
SELECT SUM(amount) AS total_income FROM income WHERE source = 'Grant Gilmour';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN budget b ON m.member_id = b.link_to_member JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name, i.source FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount = (SELECT MAX(amount) FROM income)	student_club
SELECT `event_name`, MIN(`cost`) as lowest_cost FROM `event` JOIN `expense` ON `event.event_id` = `expense.link_to_budget` GROUP BY `event_name` ORDER BY `lowest_cost` ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.budget_id ELSE 0 END) * 100.0) / SUM(b.budget_id) AS percentage_cost_yearly_kickoff FROM      event e JOIN      budget b ON e.event_id = b.link_to_event	student_club
SELECT SUM(CASE WHEN m.major_name = 'Finance' THEN 1 ELSE 0 END) / SUM(CASE WHEN m.major_name = 'Physics' THEN 1 ELSE 0 END) AS finance_to_physics_ratio FROM major m;	student_club
SELECT `source`, SUM(`amount`) AS total_amount FROM `income` WHERE `date_received` BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY `source` ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email  FROM `member`  WHERE position = 'Secretary';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM event e  JOIN member m ON e.event_id = m.member_id  WHERE e.event_name = 'Community Theater' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(e.event_id) AS num_events_attended, m.major_name FROM event e JOIN member m ON e.link_to_member = m.member_id WHERE m.member_name = 'Luisa Guidi';	student_club
SELECT AVG(b.spent) / COUNT(b.spent) AS avg_spent_per_event FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Food' AND e.event_status = 'Closed' GROUP BY e.event_id;	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Advertisement' ORDER BY budget.spent DESC LIMIT 1;	student_club
SELECT EXISTS (     SELECT 1      FROM `event` e     JOIN `member` m ON e.event_name = 'Women''s Soccer' AND m.first_name = 'Maya' AND m.last_name = 'Mclean' ) AS Maya_Attended;	student_club
SELECT      (SUM(CASE WHEN `type` = 'Community Service' THEN 1 ELSE 0 END) / COUNT(`event_id`)) * 100 AS percentage_community_service FROM      `event` WHERE      `event_date` BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT SUM(e.cost) AS total_poster_cost FROM expense e JOIN event ev ON e.link_to_budget = (SELECT budget_id FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'September Speaker')) WHERE e.expense_description = 'Posters';	student_club
SELECT `t_shirt_size`, COUNT(`t_shirt_size`) AS size_count FROM `member` GROUP BY `t_shirt_size` ORDER BY size_count DESC LIMIT 1;	student_club
SELECT `event_name` FROM `event` WHERE `status` = 'Closed' AND EXISTS (     SELECT 1     FROM `budget`     WHERE `event_status` = 'Closed'     AND `link_to_event` = `event.event_id`     AND `remaining` < 0 ) ORDER BY ABS(`budget.remaining`) DESC LIMIT 1;	student_club
SELECT e.expense_description, SUM(e.cost) AS total_value FROM expense e JOIN event ev ON e.link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'October Meeting')) WHERE e.approved = 'true' GROUP BY e.expense_description;	student_club
SELECT category, SUM(amount) AS total_budgeted FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'April Speaker' GROUP BY category ORDER BY total_budgeted ASC;	student_club
SELECT `budget_id`, MAX(`amount`)  FROM `budget`  WHERE `category` = 'Food'  GROUP BY `budget_id` ORDER BY `amount` DESC  LIMIT 1;	student_club
SELECT budget_id, category, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(`cost`) AS total_parking_cost FROM `expense` WHERE `expense_description` = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.expense_date) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50 GROUP BY m.member_id HAVING COUNT(e.expense_id) > 0;	student_club
SELECT major_name FROM major WHERE major_id = (     SELECT major_id     FROM member     WHERE name = 'Phillip Cullen' );	student_club
SELECT m.position FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business';	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;	student_club
SELECT `type` FROM `event` WHERE `location` = 'MU 215';	student_club
SELECT type  FROM event  WHERE event_date = '2020-03-24T12:00:00';	student_club
SELECT m.major_name FROM major m JOIN member me ON m.major_id = me.link_to_major WHERE me.position = 'Vice President';	student_club
SELECT      (SUM(CASE WHEN m.position = 'Member' AND ma.major_name = 'Business' THEN 1 ELSE 0 END) * 100.0) / COUNT(m.member_id) AS percentage_business_members FROM      member m JOIN      major ma ON m.link_to_major = ma.major_id;	student_club
SELECT `type` FROM `event` WHERE `location` = 'MU 215';	student_club
SELECT COUNT(*)  FROM income  WHERE amount = 50;	student_club
SELECT COUNT(*) FROM `member` WHERE `position` = 'Member' AND `t_shirt_size` = 'X-Large';	student_club
SELECT COUNT(*) FROM major WHERE `college` = 'College of Agriculture and Applied Sciences' AND `department` = 'School of Applied Sciences, Technology and Education';	student_club
SELECT      m.last_name,      m.major.link_to_department,      m.major.college FROM      member m JOIN      major mjr ON m.link_to_major = mjr.major_id WHERE      mjr.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0;	student_club
SELECT `zip_code.city`, `zip_code.state` FROM `member` JOIN `zip_code` ON `member.zip` = `zip_code.zip_code` JOIN `major` ON `member.link_to_major` = `major.major_id` WHERE `major.major_name` = 'Electrical and Computer Engineering' AND `member.position` = 'Member';	student_club
SELECT e.event_name FROM event e JOIN member m ON e.event_id = m.event_id JOIN position p ON m.position = p.position_id WHERE p.position_name = 'Vice President' AND e.location = '900 E. Washington St.' AND e.type = 'Social';	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN event e ON m.member_id = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member';	student_club
SELECT      (COUNT(CASE WHEN amount = 50 THEN 1 END) * 100.0) / COUNT(member_id) AS percentage_of_50 FROM      expense  JOIN      member ON expense.link_to_member = member.member_id WHERE      member.t_shirt_size = 'Medium'      AND member.position = 'Member'	student_club
SELECT DISTINCT `state` FROM `zip_code` WHERE `type` = 'PO Box';	student_club
SELECT `zip_code` FROM `zip_code` WHERE `type` = 'PO Box' AND `city` = 'San Juan' AND `county` = 'San Juan Municipio' AND `state` = 'Puerto Rico';	student_club
SELECT event_name  FROM event  WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT e.event_id FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget JOIN budget b ON ex.link_to_budget = b.budget_id JOIN income i ON i.link_to_member = b.budget_id WHERE ex.cost > 50 GROUP BY e.event_id;	student_club
SELECT m.first_name, m.last_name, e.event_name, e.event_id FROM member m JOIN expense ex ON m.member_id = ex.link_to_member JOIN budget b ON ex.link_to_budget = b.budget_id JOIN event e ON b.link_to_event = e.event_id WHERE ex.approved = 'true' AND ex.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT m.college FROM major m JOIN member mbr ON m.major_id = mbr.link_to_major WHERE mbr.first_name = 'Katy' AND m.major_id = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Agriculture and Applied Sciences' AND ma.major_name = 'Business';	student_club
SELECT e.email FROM member AS m JOIN expense AS ex ON m.member_id = ex.link_to_member WHERE ex.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND ex.cost > 20;	student_club
SELECT COUNT(*) FROM `member` WHERE `link_to_major` IN (     SELECT `major_id`     FROM `major`     WHERE `major_name` = 'Education' AND `college` = 'College of Education & Human Services' );	student_club
SELECT CAST(SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) AS REAL) / COUNT(e.event_id) * 100 AS over_budget_percentage FROM event e JOIN budget b ON e.event_id = b.link_to_event;	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_id, expense_description, expense_date, cost FROM expense WHERE cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT first_name, last_name FROM `member` WHERE `t_shirt_size` = 'X-Large';	student_club
SELECT DIVIDE(SUM(CASE WHEN `type` = 'PO Box' THEN 1 ELSE 0 END), COUNT(`zip_code`)) * 100 AS percentage_po_box FROM `zip_code`;	student_club
SELECT e.event_name, e.location FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 0;	student_club
SELECT e.event_name, e.event_date FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, ma.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN major ma ON m.link_to_major = ma.major_id WHERE e.cost > 100;	student_club
SELECT      z.city,      z.state FROM      event e JOIN      income i ON e.event_id = i.link_to_member JOIN      zip_code z ON e.location = z.zip_code GROUP BY      e.event_id HAVING      COUNT(i.income_id) > 40;	student_club
SELECT      e.link_to_member,     MAX(e.cost) AS max_cost FROM      expense e JOIN      (         SELECT              link_to_budget,              COUNT(*) AS event_count         FROM              expense         GROUP BY              link_to_budget         HAVING              COUNT(*) > 1     ) ec ON e.link_to_budget = ec.link_to_budget GROUP BY      e.link_to_member ORDER BY      max_cost DESC LIMIT 1;	student_club
SELECT AVG(CASE WHEN m.position != 'Member' THEN e.cost END) AS avg_amount_paid FROM expense e JOIN member m ON e.link_to_member = m.member_id;	student_club
SELECT event_name FROM event JOIN expense ON event.event_id = expense.link_to_budget WHERE expense_description = 'Parking' GROUP BY event_name HAVING SUM(CASE WHEN expense_description = 'Parking' THEN 1 ELSE 0 END) * 1.0 / COUNT(event.event_id) <      (SELECT SUM(CASE WHEN expense_description = 'Parking' THEN cost ELSE 0 END) * 1.0 / COUNT(event.event_id)      FROM expense      JOIN event ON expense.link_to_budget = event.event_id      WHERE expense_description = 'Parking');	student_club
SELECT      (SUM(CASE WHEN e.type = 'Meeting' THEN b.cost ELSE 0 END) / SUM(b.cost)) * 100 AS meeting_cost_percentage FROM      event e JOIN      budget b ON e.event_id = b.link_to_event WHERE      e.type = 'Meeting';	student_club
SELECT b.budget_id FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Water, chips, cookies' GROUP BY b.budget_id ORDER BY SUM(e.cost) DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id, m.first_name, m.last_name ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense) GROUP BY m.member_id;	student_club
SELECT      SUBSTR((SUM(CASE WHEN m.zip = 55108 THEN 1 ELSE 0 END), COUNT(CASE WHEN m.position = 'Member' THEN 1 END)) * 100 / NULLIF(COUNT(CASE WHEN m.position = 'Member' THEN 1 END), 0) -      SUBSTR((SUM(CASE WHEN m.zip = 8021 THEN 1 ELSE 0 END), COUNT(CASE WHEN m.position = 'Member' THEN 1 END)) * 100 / NULLIF(COUNT(CASE WHEN m.position = 'Member' THEN 1 END), 0)) AS percentage_difference FROM member m;	student_club
SELECT `major_name`, `department` FROM `major` WHERE `major_name` = 'Garrett Gerke';	student_club
SELECT      CONCAT(m.first_name, ' ', m.last_name) AS full_name,      e.cost FROM      expense e JOIN      member m ON e.link_to_member = m.member_id WHERE      e.expense_description = 'Water, Veggie tray, supplies';	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education';	student_club
SELECT `budget`.`category`, `budget`.`amount` FROM `budget` INNER JOIN `event` ON `budget`.`link_to_event` = `event`.`event_id` WHERE `event`.`event_name` = 'Officers meeting - January';	student_club
SELECT DISTINCT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT b.category FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Posters';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name, m.position, ma.college FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary';	student_club
SELECT SUM(b.spent) AS total_spent, e.event_name FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT hometown FROM member WHERE name = 'Garrett Gerke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code z ON m.hometown_zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND z.zip_code = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR') /      (SELECT COUNT(*) FROM customers WHERE Currency = 'CZK') AS EUR_to_CZK_ratio	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' ORDER BY Consumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS AverageMonthlyConsumption FROM `yearmonth` WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE CustomerID LIKE 'SME%') AND Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT ym.CustomerID FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE ym.Consumption IS NOT NULL AND ym.Date BETWEEN '201101' AND '201112' ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT `CustomerID`)  FROM `yearmonth`  WHERE `Date` BETWEEN '201201' AND '201212'  AND `Consumption` < 30000;	debit_card_specializing
SELECT      (SUM(CASE WHEN SUBSTR(y.Date, 1, 6) BETWEEN '201201' AND '201212' THEN y.Consumption ELSE 0 END) -      SUM(CASE WHEN SUBSTR(y.Date, 1, 6) BETWEEN '201201' AND '201212' THEN c.Consumption ELSE 0 END)) AS ConsumptionDifference FROM      `yearmonth` y LEFT JOIN      `yearmonth` c ON y.CustomerID = c.CustomerID AND SUBSTR(y.Date, 1, 6) BETWEEN '201201' AND '201212' WHERE      (y.Consumption IS NOT NULL AND y.Consumption LIKE '%CZK%')      AND (c.Consumption IS NOT NULL AND c.Consumption LIKE '%EUR%')	debit_card_specializing
SELECT `YearMonth`, SUM(`GasUsage`) as TotalGasUsage FROM `yearmonth` JOIN `gas_usage` ON `yearmonth`.`Date` = CONCAT(SUBSTRING(`YearMonth`, 1, 4), '-', SUBSTRING(`YearMonth`, 5, 2)) WHERE `gas_usage`.`Currency` = 'EUR' GROUP BY `YearMonth` ORDER BY TotalGasUsage DESC LIMIT 1;	debit_card_specializing
SELECT `Segment`, MIN(`Consumption`) AS `MinConsumption` FROM `yearmonth` y JOIN `customers` c ON y.`CustomerID` = c.`CustomerID` JOIN `gasstations` g ON y.`CustomerID` = g.`GasStationID` GROUP BY `Segment` ORDER BY `MinConsumption` LIMIT 1;	debit_card_specializing
SELECT LEFT(Date, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT `Date` AS PeakMonth FROM `yearmonth` WHERE `CustomerID` = 5 AND `Date` BETWEEN '201301' AND '201312' ORDER BY `Consumption` DESC LIMIT 1;	debit_card_specializing
SELECT      (SUM(CASE WHEN Segment = 'SME' THEN Consumption ELSE 0 END) / COUNT(CASE WHEN Segment = 'SME' THEN CustomerID ELSE NULL END)) -      (SUM(CASE WHEN Segment = 'LAM' THEN Consumption ELSE 0 END) / COUNT(CASE WHEN Segment = 'LAM' THEN CustomerID ELSE NULL END)) AS SME_LAM_Diff,     (SUM(CASE WHEN Segment = 'LAM' THEN Consumption ELSE 0 END) / COUNT(CASE WHEN Segment = 'LAM' THEN CustomerID ELSE NULL END)) -      (SUM(CASE WHEN Segment = 'KAM' THEN Consumption ELSE 0 END) / COUNT(CASE WHEN Segment = 'KAM' THEN CustomerID ELSE NULL END)) AS LAM_KAM_Diff,     (SUM(CASE WHEN Segment = 'KAM' THEN Consumption ELSE 0 END) / COUNT(CASE WHEN Segment = 'KAM' THEN CustomerID ELSE NULL END)) -      (SUM(CASE WHEN Segment = 'SME' THEN Consumption ELSE 0 END) / COUNT(CASE WHEN Segment = 'SME' THEN CustomerID ELSE NULL END)) AS KAM_SME_Diff FROM      yearmonth WHERE      Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT      segment,     MAX(percentage_increase) AS max_increase,     MIN(percentage_increase) AS min_increase FROM (     SELECT          CASE              WHEN SUBSTR(Date, 1, 4) = '2012' THEN 'SME'             WHEN SUBSTR(Date, 1, 4) = '2013' THEN 'LAM'         END AS segment,         (SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END) -           SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END)) /          SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 1 END) * 100 AS percentage_increase     FROM yearmonth     GROUP BY segment ) AS segment_consumption_changes GROUP BY segment ORDER BY max_increase DESC, min_increase ASC LIMIT 1;	debit_card_specializing
SELECT SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` WHERE `CustomerID` = 6 AND `Date` BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM `gasstations` WHERE `Country` = 'CZE' AND `Segment` = 'Discount')     -     (SELECT COUNT(*) FROM `gasstations` WHERE `Country` = 'SVK' AND `Segment` = 'Discount') AS discount_station_difference;	debit_card_specializing
SELECT      (SUM(CASE WHEN c.CustomerID = 7 AND ym.Date = '201304' THEN ym.Consumption ELSE 0 END) -      SUM(CASE WHEN c.CustomerID = 5 AND ym.Date = '201304' THEN ym.Consumption ELSE 0 END)) AS ConsumptionDifference FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      c.CustomerID IN (5, 7) AND      ym.Date = '201304';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM customers WHERE Currency = 'CZK') -      (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR') AS MoreSMEsCZKvsEUR	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201310' AND c.Currency = 'EUR' ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount) AS TotalConsumed FROM customers c JOIN transactions t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID ORDER BY TotalConsumed DESC LIMIT 1;	debit_card_specializing
SELECT SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` WHERE `Date` = '201305' AND `CustomerID` IN (SELECT `CustomerID` FROM `customers` WHERE `CustomerID` LIKE 'K%');	debit_card_specializing
SELECT     (COUNT(CASE WHEN Consumption > 46.73 THEN 1 END) * 100.0 / COUNT(*)) AS PercentageOfLAMConsumedMoreThan4673 FROM yearmonth WHERE CustomerID = (SELECT CustomerID FROM customers WHERE CustomerID = 5);	debit_card_specializing
SELECT g.Country, COUNT(g.GasStationID) AS TotalValueForMoneyStations FROM gasstations g WHERE g.Segment = 'Value for money' GROUP BY g.Country;	debit_card_specializing
SELECT      (SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT c.CustomerID) AS EuroPaymentPercentage FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      ym.CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR')	debit_card_specializing
SELECT      (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM yearmonth WHERE `Date` LIKE '201202') AS percentage FROM      yearmonth WHERE      `Date` LIKE '201202' AND `Consumption` > 528.3;	debit_card_specializing
SELECT     (COUNT(CASE WHEN G.Country = 'SLO' AND G.Segment = 'Premium' THEN 1 END) * 100.0) / COUNT(G.GasStationID) AS PercentageOfPremiumGasStations FROM     gasstations G WHERE     G.Country = 'SLO';	debit_card_specializing
SELECT `CustomerID` FROM `yearmonth` WHERE `Date` = '201309' ORDER BY `Consumption` DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT CustomerID, MIN(Consumption) as MinConsumption FROM yearmonth WHERE Segment = 'SME' AND Date = '201206' GROUP BY CustomerID ORDER BY MinConsumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) AS HighestMonthlyConsumption2012 FROM `yearmonth` WHERE SUBSTR(`Date`, 1, 4) = '2012';	debit_card_specializing
SELECT CustomerID, MAX(`Consumption`) AS MaxMonthlyConsumption FROM `yearmonth` WHERE `Currency` = 'EUR' GROUP BY CustomerID ORDER BY MaxMonthlyConsumption DESC LIMIT 1;	debit_card_specializing
SELECT p.Description FROM products p JOIN yearmonth ym ON p.ProductID = ym.ProductID WHERE ym.Date LIKE '201309%'	debit_card_specializing
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN yearmonth ym ON ym.CustomerID = t.GasStationID WHERE LEFT(ym.Date, 6) = '201306';	debit_card_specializing
SELECT DISTINCT g.`ChainID` FROM `gasstations` g JOIN `transactions_1k` t ON g.`GasStationID` = t.`GasStationID` JOIN `customers` c ON t.`CardID` = c.`CustomerID` WHERE c.`Currency` = 'EUR' AND g.`ChainID` IS NOT NULL;	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(`Price`) AS `AverageTotalPrice` FROM `transactions_1k` WHERE `Date` LIKE '2012-01%';	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT p.ProductID, p.Description FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT T1.Time FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM `transactions_1k` JOIN `yearmonth` ON `transactions_1k`.CardID = `yearmonth`.CustomerID JOIN `gasstations` ON `transactions_1k`.GasStationID = `gasstations`.GasStationID WHERE `gasstations`.Country = 'CZE' AND `yearmonth`.Date > '20120101';	debit_card_specializing
SELECT AVG(T.Price) AS AverageTotalPrice FROM `transactions_1k` AS T JOIN `gasstations` AS G ON T.GasStationID = G.GasStationID WHERE G.Country = 'CZE';	debit_card_specializing
SELECT AVG(`Price`) AS `AverageTotalPrice` FROM `transactions_1k` WHERE `CustomerID` IN (SELECT `CustomerID` FROM `customers` WHERE `Currency` = 'EUR')	debit_card_specializing
SELECT t.CustomerID, SUM(t.Amount) AS TotalPaid FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-25' AND c.Segment IS NOT NULL GROUP BY t.CustomerID ORDER BY TotalPaid DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN yearmonth ym ON ym.CustomerID = t.CustomerID WHERE ym.Date = '2012-08-25' AND ym.Consumption IS NOT NULL ORDER BY t.TransactionID ASC LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Time = '16:25:00' AND t.Date = '2012-08-24';	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-23';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Amount = 1 AND Price = 120.74;	debit_card_specializing
SELECT `Segment` FROM `customers` WHERE `CustomerID` = (     SELECT MIN(`CustomerID`)     FROM `customers` )	debit_card_specializing
SELECT c.Country FROM customers AS c JOIN transactions_1k AS t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00';	debit_card_specializing
SELECT ProductID  FROM transactions_1k  WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT      ym.Consumption AS Jan_2012_Expense,      ym.Date AS Jan_2012_Date FROM      yearmonth ym WHERE      ym.CustomerID = (         SELECT              c.CustomerID          FROM              customers c          JOIN              yearmonth ym ON c.CustomerID = ym.CustomerID          WHERE              ym.Date = '2012-08-24' AND              ym.Consumption = 124.05     ) AND      ym.Date = '201201';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS t JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Time BETWEEN '08:00:00' AND '09:00:00' AND t.Date = '2012-08-26';	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201306' AND ym.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN customers c ON t.CardID = c.CustomerID JOIN yearmonth y ON c.CustomerID = y.CustomerID JOIN gasstations g ON t.TransactionID = g.GasStationID WHERE t.TransactionID = 667467;	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Consumption = 548.4 AND ym.Date = '2012-08-24';	debit_card_specializing
SELECT     (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 100.0) / COUNT(*) AS percentage_eur_users FROM     customers c JOIN     yearmonth ym ON c.CustomerID = ym.CustomerID WHERE     ym.Date = '2012-08-25';	debit_card_specializing
SELECT      (SUM(CASE WHEN ym.Date BETWEEN '20120801' AND '20120831' THEN ym.Consumption ELSE 0 END) -      SUM(CASE WHEN ym.Date BETWEEN '20121201' AND '20121231' THEN ym.Consumption ELSE 0 END)) /       SUM(CASE WHEN ym.Date BETWEEN '20120801' AND '20120831' THEN ym.Consumption ELSE 0 END) AS ConsumptionDecreaseRate FROM      `yearmonth` ym WHERE      ym.CustomerID = (SELECT c.CustomerID FROM `customers` c WHERE c.CustomerID = (SELECT ym.CustomerID FROM `yearmonth` ym WHERE ym.Date = '20120825' AND ym.Consumption = 634.8));	debit_card_specializing
SELECT g.GasStationID, SUM(gu.GasUsage) AS TotalGasUsage FROM gas_usage gu JOIN transactions_1k t ON gu.CustomerID = t.CustomerID JOIN gasstations g ON t.GasStationID = g.GasStationID GROUP BY g.GasStationID ORDER BY TotalGasUsage DESC LIMIT 1;	debit_card_specializing
SELECT      ROUND(         (SUM(CASE WHEN g.Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),         2     ) AS Premium_Percentage FROM      gasstations g JOIN      yearmonth ym ON      g.GasStationID = ym.CustomerID WHERE      g.Segment = 'Premium'     AND ym.CustomerID IN (SELECT CustomerID FROM customers);	debit_card_specializing
SELECT SUM(t.Amount) AS TotalAmountSpent FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.CustomerID = 38508;  SELECT SUM(t.Amount) AS AmountSpentInJanuary2012 FROM transactions_1k t JOIN yearmonth ym ON t.CustomerID = ym.CustomerID WHERE ym.Date = '201201';	debit_card_specializing
SELECT      p.ProductID,      p.Description AS ProductName,      COUNT(*) AS TotalSales FROM      transactions_1k t JOIN      yearmonth y ON t.TransactionID = y.TransactionID JOIN      products p ON t.ProductID = p.ProductID GROUP BY      p.ProductID,      p.Description ORDER BY      TotalSales DESC LIMIT 5;	debit_card_specializing
SELECT c.CustomerID, AVG(t.Price) AS AvgPricePerItem, c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID ORDER BY SUM(t.Amount * t.Price) DESC LIMIT 1;	debit_card_specializing
SELECT `gasstations.Country`, SUM(`transactions_1k.Quantity`) AS TotalQuantity FROM `gasstations` JOIN `transactions_1k` ON `gasstations.GasStationID` = `transactions_1k.GasStationID` JOIN `products` ON `transactions_1k.ProductID` = `products.ProductID` WHERE `products.ProductID` = 2 GROUP BY `gasstations.Country` ORDER BY TotalQuantity DESC LIMIT 1;	debit_card_specializing
SELECT ym.CustomerID, ym.Consumption FROM yearmonth ym WHERE ym.Date = '201208' AND ym.CustomerID IN (     SELECT t1.CustomerID     FROM `transactions_1k` t1     JOIN products p ON t1.ProductID = p.ProductID     WHERE t1.Date = '201208' AND p.ProductID = 5     AND t1.ProductID * t1.Consumption / t1.Consumption > 29.00 );	debit_card_specializing
