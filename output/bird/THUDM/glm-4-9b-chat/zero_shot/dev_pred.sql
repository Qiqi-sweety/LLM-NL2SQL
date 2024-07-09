SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda' 
SELECT      `School Name`,      `Percent (%) Eligible Free (Ages 5-17)` AS EligibleFreeRate FROM      frpm WHERE      `Educational Option Type` = 'Continuation School' ORDER BY      `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3; 
SELECT frpm.Zip FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.`Charter School (Y/N)` = 1 AND schools.County = 'Fresno County Office of Education'; 
SELECT s.Street, s.StreetAbr, s.City, s.Zip, s.State FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`FRPM Count (K-12)` = (     SELECT MAX(`FRPM Count (K-12)`)     FROM frpm ) 
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND s.FundingType = 'Direct' AND s.OpenDate > '2000-01-01' 
SELECT COUNT(*) FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE s.AvgScrMath < 400 AND sch.Virtual = 'F'; 
SELECT s.CDSCode, s.School, s.Magnet FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.NumTstTakr > 500 AND s.Magnet = 1; 
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumGE1500 IS NOT NULL AND sc.NumGE1500 > 0 ORDER BY sc.NumGE1500 DESC LIMIT 1; 
SELECT satscores.NumTstTakr FROM satscores JOIN frpm ON satscores.cds = frpm.CDSCode WHERE frpm.`FRPM Count (K-12)` = (     SELECT MAX(`FRPM Count (K-12)`)     FROM frpm ) 
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.AvgScrMath > 560 AND s.Charter = 1 AND s.FundingType = 'Direct'; 
SELECT frpm.FRPM_Count__Ages_5_17__ FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores) AND frpm.FRPM_Count__Ages_5_17__ IS NOT NULL; 
SELECT s.CDSCode FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode WHERE frpm.`Enrollment (K-12)` + frpm.`Enrollment (Ages 5-17)` > 500; 
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`) AS HighestEligibleFreeRate FROM frpm WHERE `Percent (%) Eligible FRPM (Ages 5-17)` > 0.3 AND `Enrollment (Ages 5-17)` > 0 AND `Free Meal Count (Ages 5-17)` > 0 AND `Percent (%) Eligible Free (Ages 5-17)` IS NOT NULL AND `Percent (%) Eligible FRPM (Ages 5-17)` IS NOT NULL AND EXISTS (     SELECT 1     FROM satscores     WHERE frpm.CDSCode = satscores.cds     AND satscores.AvgScrRead IS NOT NULL     AND satscores.AvgScrMath IS NOT NULL     AND satscores.AvgScrWrite IS NOT NULL     AND (satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite) / 3 > 1500 ) 
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.rtype = 'Overall' AND sc.AvgScrRead IS NOT NULL AND sc.AvgScrMath IS NOT NULL AND sc.AvgScrWrite IS NOT NULL ORDER BY (sc.NumGE1500 / sc.NumTstTakr) DESC LIMIT 3; 
SELECT s.NCESSchool, frpm.`Enrollment (Ages 5-17)` FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode ORDER BY frpm.`Enrollment (Ages 5-17)` DESC LIMIT 5; 
SELECT      District,     AVG(AvgScrRead) AS AvgReadingScore FROM      satscores JOIN      schools ON satscores.cds = schools.CDSCode WHERE      schools.StatusType = 'Active' GROUP BY      District ORDER BY      AvgReadingScore DESC LIMIT 1; 
SELECT COUNT(*) FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.County = 'Alameda' AND satscores.NumTstTakr < 100; 
SELECT s.CharterNum FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.AvgScrWrite = 499 
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Contra Costa' AND schools.FundingType = 'Directly Funded' AND satscores.NumTstTakr <= 250; 
SELECT s.Phone FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.AvgScrMath IS NOT NULL AND sat.AvgScrMath = (     SELECT MAX(AvgScrMath)     FROM satscores     WHERE AvgScrMath IS NOT NULL ) 
SELECT COUNT(*) FROM frpm WHERE `Low Grade` = '09' AND `High Grade` = '12' AND `County Name` = 'Amador'; 
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles'   AND `Free Meal Count (K-12)` > 500   AND `Free Meal Count (K-12)` < 700; 
SELECT s.School, s.County, SUM(satscores.NumTstTakr) AS TotalTestTakers FROM satscores JOIN schools s ON s.CDSCode = satscores.cds WHERE s.County = 'Contra Costa' GROUP BY s.School, s.County ORDER BY TotalTestTakers DESC LIMIT 1; 
SELECT      s.School,      s.Street,      s.StreetAbr,      s.City,      s.Zip FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30 
SELECT s.School FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores sc ON s.CDSCode = sc.cds WHERE f.`Percent (%) Eligible Free (K-12)` > 0.1 AND sc.AvgScrRead >= 1500 AND sc.AvgScrMath >= 1500 AND sc.AvgScrWrite >= 1500; 
SELECT s.CDSCode, s.FundingType FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Riverside' GROUP BY s.CDSCode, s.FundingType HAVING AVG(ss.AvgScrMath) > 400; 
SELECT      `School Name`,      `Street`,      `City`,      `State`,      `Zip` FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      `School Type` = 'High School'      AND `County Name` = 'Monterey'      AND `Free Meal Count (Ages 5-17)` > 800 
SELECT s.School, s.Phone, satscores.AvgScrWrite FROM schools s JOIN satscores ON s.CDSCode = satscores.cds WHERE (s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01') 
SELECT      s.School,      s.DOCType  FROM      schools s  JOIN      frpm f ON s.CDSCode = f.CDSCode  WHERE      s.FundingType = 'Local'      AND f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)` >      (SELECT AVG(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`)       FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode       WHERE s.FundingType = 'Local') 
SELECT      s.OpenDate FROM      frpm  JOIN      schools s ON frpm.CDSCode = s.CDSCode WHERE      frpm.`Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM frpm)     AND frpm.`Enrollment (K-12)` > 0 ORDER BY      s.OpenDate ASC LIMIT 1; 
SELECT      City,      `Enrollment (K-12)`  FROM      frpm  WHERE      `Enrollment (K-12)` IS NOT NULL  ORDER BY      `Enrollment (K-12)` ASC  LIMIT 5; 
SELECT Percent_Eligible_Free_K_12 FROM (     SELECT `Percent (%) Eligible Free (K-12)` AS Percent_Eligible_Free_K_12,            Enrollment_K_12,            RANK() OVER (ORDER BY Enrollment_K_12 DESC) AS Rank     FROM frpm     WHERE `Enrollment (K-12)` IS NOT NULL ) AS Ranked_Schools WHERE Rank IN (10, 11) 
SELECT      frpm.CDSCode,     frpm.County Name,     frpm.District Name,     frpm.School Name,     (frpm.FRPM Count (K-12) / frpm.Enrollment (K-12)) AS EligibleFreeMealRate FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.Ownership Code = '66' ORDER BY      frpm.FRPM Count (K-12) DESC LIMIT 5; 
SELECT s.SchoolName, s.Website FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode WHERE frpm.FreeMealCount_Ages517 BETWEEN 1900 AND 2000 
SELECT      f.`Percent (%) Eligible Free (Ages 5-17)`  FROM      frpm f  JOIN      schools s  ON      f.CDSCode = s.CDSCode  WHERE      s.AdmFName1 = 'Kacey Gibson' AND      s.AdmLName1 = 'Gibson' 
SELECT s.AdmEmail1, s.AdmEmail2, s.AdmEmail3 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 ORDER BY f.`Enrollment (K-12)` ASC LIMIT 1; 
SELECT      s.AdmFName1,      s.AdmLName1,      s.AdmFName2,      s.AdmLName2,      s.AdmFName3,      s.AdmLName3 FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      sc.NumGE1500 IS NOT NULL AND sc.NumGE1500 > 0     AND s.Charter = 0 ORDER BY      sc.NumGE1500 DESC LIMIT 1; 
SELECT Street, City, Zip, State FROM schools WHERE CDSCode = (     SELECT CDSCode     FROM (         SELECT CDSCode, (NumGE1500 * 1.0) / NumTstTakr AS ExcellenceRate         FROM satscores     ) AS Rate     ORDER BY ExcellenceRate ASC     LIMIT 1 ) 
SELECT s.Website FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles County' AND s.District = 'Los Angeles Unified School District' AND s.StatusType = 'Active' AND s.NCESDist = '0530' AND s.NCESSchool = '000000' AND s.School = 'Los Angeles Unified School District' AND s.Charter = 0 AND s.FundingType = 'Public' AND s.GSoffered = 'Yes' AND s.GSserved = 'Yes' AND s.Virtual = 'No' AND s.Magnet = 0 AND s.Latitude IS NOT NULL AND s.Longitude IS NOT NULL AND s.OpenDate IS NOT NULL AND s.ClosedDate IS NULL AND EXISTS (     SELECT 1     FROM satscores sc     WHERE sc.cds = s.CDSCode     AND sc.enroll12 BETWEEN 2000 AND 3000 ) 
SELECT AVG(NumTstTakr) AS AverageTestTakers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.OpenDate BETWEEN '1980-01-01' AND '1980-12-31' AND schools.County = 'Fresno'; 
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN (     SELECT CDSCode, MIN(AvgScrRead) AS MinAvgRead     FROM satscores     WHERE dname = 'Fresno Unified'     GROUP BY CDSCode ) min_scores ON s.CDSCode = min_scores.CDSCode WHERE s.District = 'Fresno Unified'; 
SELECT s.CDSCode, s.NCESSchool, AVG(satscores.AvgScrRead) AS AvgReadScore FROM schools s JOIN satscores ON s.CDSCode = satscores.cds WHERE s.Virtual = 'F' GROUP BY s.CDSCode, s.NCESSchool ORDER BY AvgReadScore DESC LIMIT 5; 
SELECT s.EdOpsCode, s.EdOpsName FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores) 
WITH AvgScores AS (     SELECT         s.CDSCode,         (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) AS TotalAvgScore     FROM         satscores s     JOIN schools sch ON s.cds = sch.CDSCode     GROUP BY         s.CDSCode ), LowestAvgScore AS (     SELECT         MIN(TotalAvgScore) AS MinAvgScore     FROM         AvgScores ), SchoolWithLowestAvg AS (     SELECT         a.CDSCode,         (a.AvgScrRead + a.AvgScrMath + a.AvgScrWrite) AS TotalAvgScore,         sch.County     FROM         AvgScores a     JOIN schools sch ON a.CDSCode = sch.CDSCode     WHERE         a.TotalAvgScore = (SELECT MinAvgScore FROM LowestAvgScore) ) SELECT     TotalAvgScore,     County FROM     SchoolWithLowestAvg 
SELECT s.City, AVG(satscores.AvgScrWrite) AS AvgWritingScore FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.NumGE1500 IS NOT NULL AND satscores.NumGE1500 = (     SELECT MAX(s2.NumGE1500)     FROM satscores s2     WHERE s2.NumGE1500 IS NOT NULL ) GROUP BY s.City; 
SELECT      s.School,      AVG(satscores.AvgScrWrite) AS AvgWritingScore FROM      satscores JOIN      schools ON satscores.cds = schools.CDSCode JOIN      frpm ON schools.CDSCode = frpm.CDSCode JOIN      (SELECT           AdmLName1,           AdmLName2,           AdmLName3       FROM           schools       WHERE           (AdmLName1 = 'Ulrich' OR AdmLName2 = 'Ulrich' OR AdmLName3 = 'Ulrich')     ) AS ulrich_admin ON schools.CDSCode = ulrich_admin.CDSCode GROUP BY      s.School 
SELECT s.State, SUM(f.Enrollment(K-12)) AS TotalEnrollment FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.DOC = 31 AND f.Low_Grade = '1' AND f.High_Grade = '12' GROUP BY s.State ORDER BY TotalEnrollment DESC LIMIT 1; 
SELECT      COUNT(*) / 12 AS MonthlyAverageOpenedSchools FROM      schools WHERE      County = 'Alameda'      AND District = 'Elementary School District'      AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31' 
SELECT      (COUNT(CASE WHEN s.DOC = '54' THEN 1 END) * 1.0) /      COUNT(CASE WHEN s.DOC = '52' THEN 1 END) AS RatioOfUnifiedToElementary FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      f.County = 'Orange County' AND     s.DOC IN ('52', '54') 
SELECT      County,      COUNT(*) AS ClosedSchoolsCount,      GROUP_CONCAT(School ORDER BY ClosedDate DESC) AS ClosedSchoolNames,      GROUP_CONCAT(ClosedDate ORDER BY ClosedDate DESC) AS ClosureDates FROM      schools WHERE      StatusType = 'Closed' GROUP BY      County ORDER BY      ClosedSchoolsCount DESC LIMIT      1; 
SELECT s.Street AS Postal_Street, s.School AS School_Name FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath IS NOT NULL ORDER BY ss.AvgScrMath DESC LIMIT 1 OFFSET 5; 
SELECT s.MailStreet, s.MailCity, s.MailState, frpm.SchoolName FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode JOIN satscores sat ON frpm.CDSCode = sat.cds WHERE sat.AvgScrRead IS NOT NULL AND sat.AvgScrRead = (     SELECT MIN(AvgScrRead)     FROM satscores     WHERE AvgScrRead IS NOT NULL ) 
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Lakeport' AND (satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite) >= 1500; 
SELECT SUM(satscores.NumTstTakr) AS TotalTestTakers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Fresno'; 
SELECT s.CDSCode, s.MailZip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.AdmFName1 = 'Avetik' AND s.AdmLName1 = 'Atoian' 
SELECT      (COUNT(CASE WHEN s.County = 'Colusa' THEN 1 END) / NULLIF(COUNT(CASE WHEN s.County = 'Humboldt' THEN 1 END), 0)) AS Ratio FROM      schools s WHERE      s.State = 'CA' 
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND District = 'San Joaquin' AND StatusType = 'Active' 
SELECT s.Phone, s.Ext FROM satscores AS s JOIN schools AS sch ON s.cds = sch.CDSCode JOIN (     SELECT cds, AVG(AvgScrWrite) AS avg_write_score     FROM satscores     GROUP BY cds     ORDER BY avg_write_score DESC ) AS top_scores ON s.cds = top_scores.cds WHERE top_scores.avg_write_score = (     SELECT AVG(AvgScrWrite) FROM satscores     ORDER BY AVG(AvgScrWrite) DESC     LIMIT 332, 1 ) LIMIT 1; 
SELECT `School`, Phone, `Ext` FROM schools WHERE Zip = '95203-3704' 
SELECT s.Website FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE (s.AdmFName1 = 'Mike Larson' OR s.AdmFName2 = 'Mike Larson' OR s.AdmFName3 = 'Mike Larson' OR        s.AdmLName1 = 'Mike Larson' OR s.AdmLName2 = 'Mike Larson' OR s.AdmLName3 = 'Mike Larson' OR        s.AdmEmail1 = 'Mike Larson' OR s.AdmEmail2 = 'Mike Larson' OR s.AdmEmail3 = 'Mike Larson') AND       (s.AdmFName1 = 'Dante Alvarez' OR s.AdmFName2 = 'Dante Alvarez' OR s.AdmFName3 = 'Dante Alvarez' OR        s.AdmLName1 = 'Dante Alvarez' OR s.AdmLName2 = 'Dante Alvarez' OR s.AdmLName3 = 'Dante Alvarez' OR        s.AdmEmail1 = 'Dante Alvarez' OR s.AdmEmail2 = 'Dante Alvarez' OR s.AdmEmail3 = 'Dante Alvarez') 
SELECT Website FROM schools WHERE County = 'San Joaquin' AND Charter = 1 AND Virtual = 'P' 
SELECT COUNT(*) FROM schools WHERE County = 'Hickman'   AND DOC = '52'   AND Charter = 1; 
SELECT COUNT(*)  FROM frpm  WHERE `County Name` = 'Los Angeles'    AND `Charter School (Y/N)` = 0    AND (`Free Meal Count (K-12)` * 100 / `Enrollment (K-12)`) < 0.18; 
SELECT      s.School,      s.City,      adm.FName AS AdmFName,      adm.LName AS AdmLName FROM      schools s JOIN      schools adm ON s.CDSCode = adm.CDSCode WHERE      s.Charter = 1 AND s.CharterNum = '00D2' AND adm.FName IS NOT NULL AND adm.LName IS NOT NULL; 
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'; 
SELECT      (COUNT(CASE WHEN frpm.CharterSchool (Y/N) = 1 AND frpm.Charter Funding Type = 'Local' THEN 1 END) * 100.0) /      COUNT(CASE WHEN frpm.CharterSchool (Y/N) = 1 THEN 1 END) AS PercentageLocallyFunded FROM      frpm WHERE      frpm.County Name = 'Santa Clara' 
SELECT COUNT(*) FROM schools WHERE StatusType = 'Open' AND FundingType = 'Directly Funded' AND County = 'Stanislaus' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'; 
SELECT COUNT(*) FROM schools WHERE StatusType = 'Closed'    AND YEAR(ClosedDate) = 1989    AND City = 'San Francisco'   AND District LIKE 'Community College District%'; 
SELECT County, COUNT(*) as ClosureCount FROM schools WHERE SOC = '11' AND OpenDate BETWEEN '1980-01-01' AND '1989-12-31' AND StatusType = 'Closed' GROUP BY County ORDER BY ClosureCount DESC LIMIT 1; 
SELECT NCESDist FROM schools WHERE SOC = '31'; 
SELECT     COUNT(*) AS TotalDistrictCommunityDaySchools FROM     frpm WHERE     `District Name` IS NOT NULL     AND `District Code` IS NOT NULL     AND `School Type` = 'District Community Day School'     AND (StatusType = 'Active' OR StatusType = 'Closed')     AND `County Name` = 'Alpine' 
SELECT DistrictCode FROM schools WHERE City = 'Fresno' AND Magnet = 0 
SELECT frpm.`Enrollment (Ages 5-17)` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.Academic Year = '2014-2015' AND schools.EdOpsCode = 'SSS' AND schools.County = 'Fremont' 
SELECT      frpm.Free_Meal_Count__Ages_5_17 FROM      frpm JOIN      schools ON      frpm.CDSCode = schools.CDSCode WHERE      schools.StatusType = 'Youth Authority School'     AND schools.MailingStreet LIKE 'PO Box 1040' 
SELECT MIN(`Low Grade`) AS Lowest_Grade FROM frpm WHERE `School Type` = 'SPECON' AND NCESSchool = '613360'; 
SELECT frpm.SchoolName, schools.SOCName FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.CountyCode = '37' AND frpm.NSLP Provision Status = 'Breakfast Provision 2' 
SELECT s.City FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Educational Option Type` = 'High School' AND f.`Low Grade` = '09' AND f.`High Grade` = '12' AND f.`NSLP Provision Status` = '2' AND s.County = 'Merced' AND f.EILCode = 'HS'; 
SELECT      frpm.SchoolName,      frpm.`Percent (%) Eligible FRPM (Ages 5-17)` FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      frpm.`Low Grade` = 'K' AND frpm.`High Grade` = '9'      AND schools.County = 'Los Angeles' 
SELECT      GSoffered,      COUNT(*) AS GSoffered_Count FROM      schools WHERE      City = 'Adelanto' GROUP BY      GSoffered ORDER BY      GSoffered_Count DESC LIMIT 1; 
SELECT      County,      COUNT(*) AS NumberOfSchools FROM      schools WHERE      County IN ('San Diego', 'Santa Barbara') AND      Virtual = 'F' GROUP BY      County ORDER BY      NumberOfSchools DESC LIMIT 1; 
SELECT School, Latitude, `School Type` FROM schools ORDER BY Latitude DESC LIMIT 1; 
SELECT s.City, s.School, MIN(s.Latitude) as MinLatitude FROM schools s WHERE s.State = 'CA' AND s.Latitude IS NOT NULL GROUP BY s.City ORDER BY MinLatitude ASC LIMIT 1; 
SELECT      s.CDSCode,     MAX(s.HighGrade) - MIN(s.LowGrade) AS GradeSpan FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.Longitude = (SELECT MAX(Longitude) FROM schools) GROUP BY      s.CDSCode ORDER BY      GradeSpan DESC LIMIT 1; 
SELECT      COUNT(DISTINCT frpm.CDSCode) AS NumberOfSchools,     frpm.City,     COUNT(DISTINCT frpm.CDSCode) OVER (PARTITION BY frpm.City) AS SchoolsPerCity FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      frpm.Magnet = 1     AND frpm.`Low Grade` = 'K'     AND frpm.`High Grade` = '8' GROUP BY      frpm.City HAVING      COUNT(DISTINCT frpm.NSLP Provision Status) > 1; 
SELECT      AdmFName1,      District,      COUNT(AdmFName1) AS NameCount,     RANK() OVER (PARTITION BY AdmFName1 ORDER BY COUNT(AdmFName1) DESC) as Rank FROM      schools WHERE      AdmFName1 IS NOT NULL GROUP BY      AdmFName1,      District ORDER BY      NameCount DESC,      Rank LIMIT 2; 
SELECT      frpm.`Percent (%) Eligible Free (K-12)`,      frpm.`District Code` FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode JOIN      (         SELECT              CDSCode         FROM              schools         WHERE              AdmFName1 = 'Alusine'     ) AS adm ON frpm.CDSCode = adm.CDSCode; 
SELECT      s.AdmLName1 AS AdminLastName,     frpm.District Name AS DistrictName,     frpm.County Name AS CountyName,     frpm.School Name AS SchoolName FROM      frpm JOIN      schools ON      frpm.CDSCode = schools.CDSCode WHERE      schools.CharterNum = '40' 
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (DOC = '54' OR SOC = '62') AND (SchoolType = 'Intermediate/Middle Schools' OR SchoolType = 'Unified Schools') AND StatusType = 'Public'; 
SELECT      s.AdmEmail1,      s.AdmEmail2,      s.AdmEmail3,      sname FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      sc.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores WHERE NumGE1500 > 0) ORDER BY      sc.NumTstTakr DESC LIMIT 1; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'East Bohemia' AND t.type = 'issuance' AND t.operation = 'POPLATEK PO OBRATU'; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' AND EXISTS (     SELECT 1     FROM loan l     WHERE l.account_id = a.account_id ); 
SELECT     CASE          WHEN A12 > A13 THEN '1995'         ELSE '1996'     END AS YearWithHigherUnemploymentRate,     MAX(CASE WHEN A12 > A13 THEN A12 ELSE A13 END) AS HighestUnemploymentRate FROM     district WHERE     A12 IS NOT NULL AND A13 IS NOT NULL; 
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000 AND EXISTS (     SELECT 1     FROM client     JOIN disp ON client.client_id = disp.client_id     JOIN district ON client.district_id = district.district_id     WHERE district.district_id = district.district_id AND client.gender = 'F' ) 
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M'  AND d.A3 = 'North Bohemia'  AND d.A11 > 8000; 
SELECT a.account_id FROM account JOIN client ON account.account_id = client.account_id WHERE client.gender = 'F' ORDER BY client.birth_date ASC LIMIT 1;  SELECT a.account_id FROM account JOIN client ON account.account_id = client.account_id JOIN district ON account.district_id = district.district_id ORDER BY district.A11 DESC LIMIT 1;  SELECT MAX(district.A11) - MIN(district.A11) AS salary_gap FROM district; 
SELECT a.account_id FROM account a JOIN client c ON a.account_id = c.account_id JOIN district d ON a.district_id = d.district_id WHERE c.birth_date = (SELECT MIN(birth_date) FROM client) ORDER BY d.A11 DESC LIMIT 1; 
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'Owner'; 
SELECT DISTINCT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN trans t ON d.account_id = t.account_id WHERE t.operation = 'POPLATEK PO OBRATU' 
SELECT a.account_id, MIN(l.amount) AS min_approved_amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date BETWEEN '1997-01-01' AND '1997-12-31' AND l.status = 'APPROVED' GROUP BY a.account_id ORDER BY min_approved_amount ASC LIMIT 1; 
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND EXTRACT(YEAR FROM a.date) = 1993 ORDER BY l.amount DESC LIMIT 1; 
SELECT COUNT(DISTINCT c.client_id) AS female_customers_count FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 = 'Slokolov'; 
SELECT a.account_id FROM account a WHERE a.date = (SELECT MIN(date) FROM account WHERE EXTRACT(YEAR FROM date) = 1995) 
SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE a.date < '1997-01-01' AND a.balance > 3000 
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card crd ON d.client_id = crd.disp_id WHERE crd.issued = '1994-03-03'; 
SELECT a.date  FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14' 
SELECT d.district_id FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE l.date = '1994-08-25' AND d.type = 'branch'; 
SELECT MAX(t.amount) AS max_transaction_amount FROM trans t JOIN disp d ON t.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN card crd ON d.card_id = crd.card_id WHERE crd.issued = '1996-10-21' 
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id JOIN account a ON c.district_id = a.district_id WHERE d.A11 = (SELECT MAX(A11) FROM district) AND c.birth_date = (SELECT MIN(birth_date) FROM client) 
SELECT      c.client_id,      c.gender,      c.birth_date,      t.amount AS first_transaction_amount FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      account a ON d.account_id = a.account_id JOIN      loan l ON a.account_id = l.account_id JOIN      trans t ON a.account_id = t.account_id WHERE      l.amount = (SELECT MAX(amount) FROM loan)     AND t.date = (SELECT MIN(date) FROM trans WHERE account_id = a.account_id) 
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN district dt ON d.district_id = dt.district_id WHERE dt.A2 = 'Jesenik' AND c.gender = 'F'; 
SELECT disp.disp_id FROM disp JOIN client ON disp.client_id = client.client_id JOIN account ON disp.account_id = account.account_id JOIN trans ON account.account_id = trans.account_id WHERE trans.date = '1998-09-02' AND trans.amount = 5100 
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Litomerice' AND YEAR(account.date) = 1996; 
SELECT d.A2 AS district_name FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dt ON a.district_id = dt.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29'; 
SELECT c.birth_date FROM loan l JOIN disp d ON l.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE l.amount = 98832 AND l.date = '1996-01-03' AND l.status = 'APPLIED'; 
SELECT a.account_id FROM account a JOIN client c ON a.account_id = c.account_id JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'Prague' ORDER BY a.date ASC LIMIT 1; 
SELECT     (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(c.gender) AS male_clients_percentage FROM     client c JOIN     district d ON c.district_id = d.district_id WHERE     d.A3 = 'South Bohemia' ORDER BY     d.A8 DESC LIMIT 1; 
SELECT     ((b.balance - a.balance) / a.balance) * 100 AS increase_rate FROM     (SELECT account_id, balance      FROM trans      WHERE account_id IN (SELECT account_id FROM loan                           WHERE date = '1993-07-05')        AND date = '1993-03-22'        ORDER BY date DESC LIMIT 1) a,     (SELECT account_id, balance      FROM trans      WHERE account_id IN (SELECT account_id FROM loan                           WHERE date = '1993-07-05')        AND date = '1998-12-27'        ORDER BY date DESC LIMIT 1) b WHERE     a.account_id = b.account_id; 
SELECT      (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) / SUM(l.amount)) * 100 AS percentage_paid FROM      loan l 
SELECT     ROUND((COUNT(CASE WHEN l.amount < 100000 THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage_of_accounts_running_no_issue FROM     loan l WHERE     l.status = 'C' 
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date LIKE '1993%' AND a.frequency = 'POPLATEK PO OBRATU' 
SELECT a.account_id, a.frequency FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dt ON d.district_id = dt.district_id WHERE dt.A5 = 'East Bohemia' AND a.date BETWEEN '1995-01-01' AND '2000-12-31' JOIN client c ON d.client_id = c.client_id 
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice'; 
SELECT d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE l.loan_id = 4990; 
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount > 300000; 
SELECT l.loan_id, d.A3, d.A11 FROM loan AS l JOIN account AS a ON l.account_id = a.account_id JOIN disp AS d ON a.account_id = d.account_id WHERE l.duration = 60; 
SELECT d.A5 AS district,         ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment_percentage FROM district d JOIN client c ON d.district_id = c.district_id JOIN disp disp ON c.client_id = disp.client_id JOIN account acc ON disp.account_id = acc.account_id JOIN loan l ON acc.account_id = l.account_id WHERE l.status = 'D' AND d.A14 = 1996 AND d.A15 = 1995; 
SELECT      (COUNT(CASE WHEN d.A2 = 'Decin' AND a.date BETWEEN '1993-01-01' AND '1993-12-31' THEN 1 END) * 100.0) / COUNT(a.account_id) AS percentage_of_accounts_opened_in_1993 FROM      account a JOIN      district d ON a.district_id = d.district_id; 
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE' GROUP BY account_id; 
SELECT      d.A2 AS district,     COUNT(c.client_id) AS female_account_holders FROM      district d JOIN      client c ON d.district_id = c.district_id WHERE      c.gender = 'F' GROUP BY      d.A2 ORDER BY      female_account_holders DESC LIMIT      10; 
SELECT d.A2 AS district_name, SUM(t.amount) AS total_withdrawals FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10; 
SELECT      COUNT(DISTINCT a.account_id)  FROM      account a  JOIN      district d ON a.district_id = d.district_id  LEFT JOIN      disp ON a.account_id = disp.account_id  WHERE      d.A3 = 'South Bohemia'      AND disp.account_id IS NULL; 
SELECT d.A3 AS district_name, COUNT(l.loan_id) AS active_loan_count FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.A3 ORDER BY active_loan_count DESC LIMIT 1; 
SELECT AVG(loan.amount) AS average_loan_amount FROM loan JOIN client ON loan.account_id = client.client_id WHERE client.gender = 'M' 
SELECT d.A2 AS branch_location, d.A5 AS district_name, d.A13 AS unemployment_rate FROM district d WHERE d.A5 IS NOT NULL AND d.A13 IS NOT NULL AND d.A13 > 0 ORDER BY d.A13 DESC LIMIT 10; 
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A16 = (SELECT MAX(A16) FROM district WHERE A16 IS NOT NULL) 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYBER KARTOU' AND t.balance < 0 AND a.frequency = 'POPLATEK MESICNE'; 
SELECT COUNT(DISTINCT l.account_id) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.amount >= 250000 AND l.date BETWEEN '1995-01-01' AND '1997-12-31' AND a.frequency = 'POPLATEK MESICNE' AND l.status = 'APPROVED'; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dt ON d.district_id = dt.district_id WHERE dt.A8 = 1 AND (l.status = 'C' OR l.status = 'D') JOIN loan l ON a.account_id = l.account_id; 
SELECT COUNT(c.client_id) AS male_clients_count FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A15 = (     SELECT A15     FROM district     WHERE A15 = (         SELECT MAX(A15)         FROM district         WHERE A15 < (SELECT MAX(A15) FROM district)     ) ) AND d.A4 = '1995'; 
SELECT COUNT(c.card_id)  FROM card c  JOIN disp d ON c.disp_id = d.disp_id  WHERE c.type = 'gold' AND d.type = 'disponent'; 
SELECT COUNT(a.account_id) AS account_count FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek'; 
SELECT d.A2 FROM district d JOIN trans t ON d.district_id = t.account_id WHERE t.date BETWEEN '1997-01-01' AND '1997-12-31' GROUP BY d.A2 HAVING SUM(t.amount) > 10000; 
SELECT DISTINCT a.account_id FROM account a JOIN `order` o ON a.account_id = o.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek' AND o.k_symbol = 'SIPO'; 
SELECT DISTINCT a.account_id FROM account JOIN disp ON account.account_id = disp.account_id JOIN card ON disp.card_id = card.card_id WHERE card.type = 'gold' INTERSECT SELECT DISTINCT a.account_id FROM account JOIN disp ON account.account_id = disp.account_id JOIN card ON disp.card_id = card.card_id WHERE card.type = 'junior'; 
SELECT AVG(amount) AS average_credit_card_amount FROM trans WHERE type = 'credit'   AND date >= '2021-01-01'   AND date < '2022-01-01'   AND operation = 'VYBER KARTOU'; 
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.date BETWEEN '1998-01-01' AND '1998-12-31' AND t.operation = 'VYBER KARTOU' GROUP BY a.account_id HAVING SUM(t.amount) < (     SELECT AVG(monthly_spending)     FROM (         SELECT a.account_id, SUM(t.amount) AS monthly_spending         FROM account a         JOIN trans t ON a.account_id = t.account_id         WHERE t.date BETWEEN '1998-01-01' AND '1998-12-31'         AND t.operation = 'VYBER KARTOU'         GROUP BY a.account_id     ) AS subquery ) 
SELECT DISTINCT c.client_id, c.gender FROM client c JOIN account a ON c.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN card cr ON d.card_id = cr.card_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' AND cr.type = 'credit'; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 = 'South Bohemia'; 
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Tabor' AND a.frequency = 'OWNER'; 
SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dt ON d.district_id = dt.district_id WHERE a.frequency = 'OWNER' AND dt.A11 BETWEEN 8000 AND 9000 EXCEPT SELECT DISTINCT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB'; 
SELECT DISTINCT d.A2 AS district_name FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ'; 
SELECT AVG(trans.A15) as avg_crimes FROM trans JOIN district ON trans.account_id = district.district_id WHERE district.A3 IN (SELECT A3 FROM district WHERE A15 > 4000) AND YEAR(account.date) >= 1997 AND YEAR(trans.date) = 1995; 
SELECT COUNT(*) FROM card JOIN disp ON card.disp_id = disp.disp_id JOIN account ON disp.account_id = account.account_id WHERE card.type = 'classic' AND account.frequency = 'OWNER'; 
SELECT COUNT(client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M'; 
SELECT     (COUNT(CASE WHEN card.type = 'Gold' AND card.issued < '1998-01-01' THEN 1 END) * 100.0) / COUNT(*) AS gold_card_percentage FROM     card; 
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = (SELECT MAX(amount) FROM loan) 
SELECT d.A15 FROM district d JOIN account a ON d.district_id = a.district_id WHERE a.account_id = 532 AND d.A16 = '1995'; 
SELECT d.account_id FROM `order` o JOIN account a ON o.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE o.order_id = 33333; 
SELECT t.account_id, t.date, t.amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id WHERE c.client_id = 3356 AND t.operation = 'VYBER'; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000; 
SELECT card.type FROM card JOIN disp ON card.disp_id = disp.disp_id JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 13539; 
SELECT d.A3 FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = 3541; 
SELECT d.A2, COUNT(a.account_id) AS total_accounts FROM account a JOIN disp d ON a.account_id = d.account_id JOIN loan l ON a.account_id = l.account_id JOIN district dt ON a.district_id = dt.district_id WHERE l.status = 'A' GROUP BY d.A2 ORDER BY total_accounts DESC LIMIT 1; 
SELECT c.client_id FROM `order` o JOIN account a ON o.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE o.order_id = 32423; 
SELECT t.account_id, t.date, t.type, t.amount, t.balance FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A5 = '5'; 
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Jesenik'; 
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN card cr ON d.account_id = cr.disp_id WHERE cr.issued >= '1997-01-01' AND cr.type = 'junior'; 
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(c.client_id) AS percentage_female_clients FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A11 > 10000 
SELECT      (SUM(loan.amount) FILTER (WHERE loan.date BETWEEN '1997-01-01' AND '1997-12-31') -       SUM(loan.amount) FILTER (WHERE loan.date BETWEEN '1996-01-01' AND '1996-12-31')) /       SUM(loan.amount) FILTER (WHERE loan.date BETWEEN '1996-01-01' AND '1996-12-31') * 100 AS growth_rate FROM      loan JOIN      client ON loan.account_id IN (SELECT account_id FROM account JOIN client ON account.district_id = client.district_id WHERE client.gender = 'M') WHERE      loan.date BETWEEN '1996-01-01' AND '1997-12-31' 
SELECT COUNT(*)  FROM trans  WHERE operation = 'VYBER KARTOU'  AND date > '1995-01-01'; 
SELECT      (SUM(CASE WHEN d.A3 = 'North Bohemia' THEN d.A16 ELSE 0 END) -      SUM(CASE WHEN d.A3 = 'East Bohemia' THEN d.A16 ELSE 0 END)) AS crime_difference FROM district d WHERE d.A3 IN ('North Bohemia', 'East Bohemia') AND d.A12 = '1996'; 
SELECT COUNT(DISTINCT d.client_id) AS owners_count,         COUNT(DISTINCT d.account_id) AS dispensers_count FROM disp d WHERE d.account_id BETWEEN 1 AND 10; 
SELECT      COUNT(*) AS statement_requests FROM      account a JOIN      trans t ON a.account_id = t.account_id WHERE      a.account_id = 3 AND t.type = 'request' AND t.k_symbol = 'account statement';  SELECT      SUM(CASE WHEN t.k_symbol = 'debit' THEN t.amount ELSE 0 END) AS total_debits FROM      account a JOIN      trans t ON a.account_id = t.account_id WHERE      a.account_id = 3 AND t.k_symbol = 'debit'; 
SELECT client.birth_date  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  WHERE account.account_id = 130 AND YEAR(client.birth_date) = YEAR(CURDATE()) 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN trans t ON a.account_id = t.account_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND t.type = 'Request' AND t.operation = 'Statement'; 
SELECT     SUM(l.amount) AS total_debt,     AVG(l.payments) AS average_payments_per_loan FROM     loan l JOIN     account a ON l.account_id = a.account_id JOIN     disp d ON a.account_id = d.account_id JOIN     client c ON d.client_id = c.client_id WHERE     c.client_id = 992 
SELECT SUM(t.amount) AS total_sum,        CASE c.gender            WHEN 'M' THEN 'Man'            WHEN 'F' THEN 'Woman'            ELSE 'Unknown'        END AS account_owner_gender FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE t.trans_id = 851 AND c.client_id = 4; 
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN client cl ON d.client_id = cl.client_id WHERE cl.client_id = 9 AND c.type LIKE 'Credit%'; 
SELECT SUM(trans.amount) AS total_paid FROM trans JOIN client ON trans.account_id = client.client_id WHERE client.client_id = 617 AND trans.date BETWEEN '1998-01-01' AND '1998-12-31'; 
SELECT c.client_id FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A5 = 'East Bohemia'; 
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3; 
SELECT COUNT(DISTINCT c.client_id) AS male_customers_with_home_payments FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.type = 'SIPO' AND t.amount > 4000; 
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A5 = 'Beroun' AND account.date > '1996-12-31'; 
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN card crd ON a.account_id = crd.account_id WHERE c.gender = 'F' AND crd.type = 'junior'; 
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(c.client_id) AS percentage_female_clients FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      district dt ON d.district_id = dt.district_id WHERE      dt.A3 = 'Prague'; 
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(CASE WHEN c.gender = 'M' THEN 1 END + COUNT(CASE WHEN a.frequency = 'POPLATEK TYDNE' THEN 1 END - COUNT(CASE WHEN c.gender = 'M' THEN 1 END AND a.frequency = 'POPLATEK TYDNE' THEN 1 END)) AS male_clients_percentage FROM      client c JOIN      account a ON c.client_id = a.account_id WHERE      a.frequency = 'POPLATEK TYDNE' 
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE'; 
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1; 
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.gender = 'F' ORDER BY c.birth_date, c.A11 LIMIT 1; 
SELECT COUNT(c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1920-01-01' AND '1920-12-31' AND d.A3 = 'East Bohemia'; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration = 24 AND a.frequency = 'POPLATEK TYDNE' 
SELECT AVG(l.amount) AS average_loan_amount FROM loan l JOIN trans t ON l.account_id = t.account_id WHERE l.status IN ('C', 'D') AND t.k_symbol = 'POPLATEK PO OBRATU' GROUP BY t.date; 
SELECT c.client_id, d.A2 FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'owner'; 
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.disp_id = cd.disp_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE cd.type = 'gold' AND l.status = 'eligible'; 
SELECT bond_type, COUNT(*) AS bond_count FROM bond GROUP BY bond_type ORDER BY bond_count DESC LIMIT 1; 
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id WHERE m.label = '-' AND a.element = 'cl'; 
SELECT AVG(CASE WHEN a.element = 'O' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-' AND a.element = 'O' GROUP BY a.molecule_id; 
SELECT AVG(CASE WHEN m.label = '+' THEN COUNT(c.bond_id) ELSE 0 END) / COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-'; 
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-'; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+' JOIN connected c1 ON m.molecule_id = c1.molecule_id JOIN connected c2 ON m.molecule_id = c2.molecule_id JOIN connected c3 ON m.molecule_id = c3.molecule_id WHERE c1.atom_id != c2.atom_id AND c2.atom_id != c3.atom_id AND c1.atom_id != c3.atom_id 
SELECT      ROUND((SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id), 2) AS percentage_of_carbon FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = ' = ' 
SELECT COUNT(*) FROM bond WHERE bond_type = '#'; 
SELECT COUNT(DISTINCT a.atom_id) FROM atom a LEFT JOIN connected c ON a.atom_id = c.atom_id LEFT JOIN bond b ON c.bond_id = b.bond_id LEFT JOIN atom b_atom ON b_atom.atom_id = b.atom_id2 WHERE b_atom.element <> 'br' 
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'si'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR004_8_9' AND a.element IN ('c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca'); 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = ' = ' AND (a.element = 'c' OR a.element = 'o' OR a.element = 's' OR a.element = 'n' OR a.element = 'p' OR a.element = 'br' OR a.element = 'f' OR a.element = 'i' OR a.element = 'sn' OR a.element = 'pb' OR a.element = 'te' OR a.element = 'ca') 
SELECT m.label, COUNT(a.atom_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY atom_count DESC LIMIT 1; 
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'te' AND EXISTS (     SELECT 1     FROM atom a2     JOIN connected c2 ON a2.atom_id = c2.atom_id2     WHERE c2.bond_id = b.bond_id     AND a2.element = 'te' ) 
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-'; 
SELECT DISTINCT a1.atom_id AS atom1, a2.atom_id AS atom2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN connected c2 ON c.atom_id2 = c2.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id JOIN atom a2 ON c2.atom_id2 = a2.atom_id WHERE m.label = '-'; 
SELECT a.element, COUNT(a.atom_id) AS count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') GROUP BY a.element ORDER BY count ASC LIMIT 1; 
SELECT bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE (connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20') OR       (connected.atom_id = 'TR004_20' AND connected.atom_id2 = 'TR004_8'); 
SELECT DISTINCT m.label FROM molecule m WHERE m.molecule_id NOT IN (     SELECT c.molecule_id     FROM connected c     JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id     WHERE a.element <> 'sn' ) AND m.label = '+' UNION SELECT DISTINCT m.label FROM molecule m WHERE m.molecule_id NOT IN (     SELECT c.molecule_id     FROM connected c     JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id     WHERE a.element <> 'sn' ) AND m.label = '-'; 
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('i', 's') AND b.bond_type = '-'; 
SELECT DISTINCT a1.atom_id AS atom1, a2.atom_id AS atom2 FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b1 ON c1.bond_id = b1.bond_id AND b1.bond_type = '#' JOIN connected c2 ON a1.atom_id = c2.atom_id2 JOIN connected c3 ON a2.atom_id = c3.atom_id2 WHERE c1.bond_id <> c2.bond_id AND c2.bond_id <> c3.bond_id AND c1.bond_id <> c3.bond_id; 
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON c.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR181'; 
SELECT      ROUND(         (SUM(CASE WHEN a.element = 'f' THEN 1 ELSE 0 END) / COUNT(mol.molecule_id)) * 100, 2     ) AS percent_carcinogenic_no_fluorine FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      molecule mol ON c.molecule_id = mol.molecule_id WHERE      mol.label = '+' 
SELECT      (SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END) / COUNT(b.bond_id)) * 100 AS percent_carcinogenic_triple_bonds FROM      bond b JOIN      connected c ON b.bond_id = c.bond_id JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      m.label = '+' 
SELECT a.element, COUNT(a.element) AS element_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON c.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR000' GROUP BY a.element ORDER BY element_count DESC, a.element ASC LIMIT 3; 
SELECT a1.atom_id AS atom1, a2.atom_id AS atom2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_id = 'TR001_2_6' AND b.molecule_id = 'TR001'; 
SELECT (SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN m.label = '-' THEN 1 ELSE 0 END)) AS difference FROM molecule m; 
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR_000_2_5' 
SELECT bond_id  FROM connected  WHERE atom_id = 'TR000_2' AND atom_id2 = (SELECT atom_id FROM connected WHERE bond_id = (SELECT bond_id FROM connected WHERE atom_id = 'TR000_2')) 
SELECT m.molecule_id, m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = ' = ' GROUP BY m.molecule_id, m.label ORDER BY m.label ASC LIMIT 5; 
SELECT      (SUM(CASE WHEN b.bond_type = ' = ' THEN 1 ELSE 0 END) / COUNT(b.bond_id)) * 100 AS percent_double_bonds FROM      bond b JOIN      connected c ON b.bond_id = c.bond_id WHERE      b.molecule_id = 'TR008' 
SELECT     COUNT(CASE WHEN m.label = '+' THEN 1 END) AS carcinogenic_count,     COUNT(m.molecule_id) AS total_molecules,     (COUNT(CASE WHEN m.label = '+' THEN 1 END) * 100.0) / COUNT(m.molecule_id) AS percent_carcinogenic FROM     molecule m 
SELECT      (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100 AS percent_hydrogen FROM      atom a WHERE      a.molecule_id = 'TR206' 
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = 'TR000'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR060' AND m.label = '+' UNION SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR060' AND m.label = '-'; 
SELECT      b.bond_type,      CASE WHEN COUNT(b.bond_type) * 2 > (SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR018') THEN 'Majority'          ELSE 'Not Majority' END AS is_majority,     m.label AS molecule_carcinogenicity FROM      bond AS b JOIN      molecule AS m ON b.molecule_id = m.molecule_id WHERE      b.molecule_id = 'TR018' GROUP BY      b.bond_type, m.label ORDER BY      COUNT(b.bond_type) DESC LIMIT 1; 
SELECT m.label, COUNT(DISTINCT c.atom_id) AS single_bond_count FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-' AND m.label = '-' GROUP BY m.molecule_id ORDER BY single_bond_count DESC, m.label ASC LIMIT 3; 
SELECT b.bond_id, b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR006' ORDER BY b.bond_id ASC LIMIT 2; 
SELECT COUNT(*) FROM bond WHERE molecule_id LIKE 'TR009_%' AND (bond_id IN (     SELECT bond_id     FROM connected     WHERE atom_id = 'TR009_12' OR atom_id2 = 'TR009_12' ) OR bond_id IN (     SELECT bond_id     FROM connected     WHERE atom_id = 'TR009_12' OR atom_id2 = 'TR009_12' )); 
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br'; 
SELECT b.bond_type, c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.bond_id = 'TR001_6_9' 
SELECT m.label AS molecule_label, CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Non-carcinogenic' END AS carcinogenicity FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON c.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10'; 
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#'; 
SELECT COUNT(bond_id) AS connection_count FROM connected WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR004' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') 
SELECT COUNT(*) FROM molecule WHERE label = '-'; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE SUBSTRING(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+'; 
SELECT b.bond_id FROM bond b JOIN connected c1 ON b.bond_id = c1.bond_id JOIN atom a1 ON c1.atom_id = a1.atom_id AND a1.element = 'p' JOIN connected c2 ON b.bond_id = c2.bond_id JOIN atom a2 ON c2.atom_id = a2.atom_id AND a2.element = 'n'; 
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = ' = ' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1 UNION SELECT m.molecule_id FROM molecule m WHERE m.label = '+' ORDER BY double_bond_count DESC LIMIT 1 
SELECT AVG(COUNT(b.bond_id) / COUNT(a.atom_id)) AS average_bonds_per_iodine_atom FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'i' GROUP BY a.atom_id; 
SELECT bond.bond_id, bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.atom_id = '45' OR atom.atom_id = '0045' AND bond.bond_type IN ('=', '-', '#'); 
SELECT a.atom_id, a.element FROM atom a WHERE a.atom_id NOT IN (SELECT c.atom_id FROM connected c) AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca'); 
SELECT a1.atom_id, a2.atom_id FROM connected AS c1 JOIN connected AS c2 ON c1.atom_id = c2.atom_id2 AND c1.bond_id = c2.bond_id JOIN bond AS b ON b.bond_id = c1.bond_id JOIN atom AS a1 ON a1.atom_id = c1.atom_id JOIN atom AS a2 ON a2.atom_id = c2.atom_id2 JOIN molecule AS m ON m.molecule_id = b.molecule_id WHERE m.molecule_id = 'TR447' AND b.bond_type = '#' 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR144_8_19' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') 
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = ' = ' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1; 
SELECT element, COUNT(element) AS frequency FROM atom JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 JOIN molecule ON connected.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY element ORDER BY frequency LIMIT 1; 
SELECT DISTINCT a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'pb'; 
SELECT DISTINCT a.element FROM atom a JOIN bond b ON a.atom_id = b.atom_id WHERE b.bond_type = '#' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca'); 
SELECT      (COUNT(bond_id) /       (SELECT COUNT(DISTINCT atom_id)        FROM connected        WHERE (SELECT COUNT(*)               FROM connected               WHERE connected.atom_id = c.atom_id AND connected.atom_id2 = c.atom_id2) =               (SELECT MAX(COUNT(*))                FROM connected                GROUP BY atom_id, atom_id2))) * 100 AS percentage FROM connected JOIN bond ON connected.bond_id = bond.bond_id JOIN atom AS a1 ON connected.atom_id = a1.atom_id JOIN atom AS a2 ON connected.atom_id2 = a2.atom_id GROUP BY bond.bond_type; 
SELECT      SUM(CASE WHEN `bond_type` = '-' THEN 1 ELSE 0 END) AS single_bond_count,     SUM(CASE WHEN `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '+') AND `bond_type` = '-' THEN 1 ELSE 0 END) AS carcinogenic_single_bond_count FROM      `bond` WHERE      `bond_type` = '-' UNION ALL SELECT      1 AS single_bond_count,     SUM(CASE WHEN `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '+') THEN 1 ELSE 0 END) AS carcinogenic_single_bond_count FROM      `molecule` WHERE      `molecule_id` IN (SELECT `molecule_id` FROM `bond` WHERE `bond_type` = '-') ORDER BY      single_bond_count; 
SELECT COUNT(a.atom_id) AS total_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.element IN ('C', 'H') GROUP BY a.atom_id; 
SELECT DISTINCT c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 's'; 
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'sn' UNION SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id2 = a.atom_id WHERE a.element = 'sn' 
SELECT COUNT(DISTINCT a.element)  FROM atom a JOIN bond b ON a.atom_id = b.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.molecule_id IS NOT NULL; 
SELECT COUNT(DISTINCT a.atom_id) AS total_triple_bond_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br') 
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+'; 
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-' GROUP BY m.molecule_id HAVING COUNT(b.bond_id) = (SELECT COUNT(*) FROM bond WHERE bond_type = '-'); 
SELECT      ROUND(         (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id),         2     ) AS percent_chlorine FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '-' AND      a.element = 'cl' 
SELECT `label`  FROM `molecule`  WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002'); 
SELECT DISTINCT c.molecule_id FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON c.molecule_id = m.molecule_id WHERE m.label = '-' 
SELECT COUNT(DISTINCT m.molecule_id) AS total_carcinogenic_molecules FROM molecule m WHERE m.molecule_id BETWEEN 'TR000' AND 'TR030' AND m.label = '+'; 
SELECT b.bond_type FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id BETWEEN 'TR000' AND 'TR050'; 
SELECT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN bond b ON b.bond_id = c.bond_id WHERE b.bond_id = 'TR001_10_11' AND a1.element IN ('c', 'h', 'o', 'n', 'p', 's', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND a2.element IN ('c', 'h', 'o', 'n', 'p', 's', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') 
SELECT COUNT(DISTINCT bond.bond_id)  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  JOIN atom ON connected.atom_id = atom.atom_id  WHERE atom.element = 'i'  OR atom.element = 'i'; 
SELECT m.molecule_id,         CASE             WHEN COUNT(CASE WHEN a.element = 'ca' AND mo.label = '+' THEN 1 END)                  > COUNT(CASE WHEN a.element = 'ca' AND mo.label = '-' THEN 1 END)            THEN 'Carcinogenic'            ELSE 'Non-Carcinogenic'        END AS carcinogenicity FROM molecule mo JOIN atom a ON mo.molecule_id = a.molecule_id GROUP BY m.molecule_id 
SELECT      COUNT(DISTINCT c1.atom_id) AS chlorine_count,      COUNT(DISTINCT c2.atom_id) AS carbon_count FROM      connected AS c1 JOIN      connected AS c2 ON c1.bond_id = c2.bond_id AND c1.atom_id != c2.atom_id JOIN      atom AS a1 ON c1.atom_id = a1.atom_id AND a1.element = 'cl' JOIN      atom AS a2 ON c2.atom_id = a2.atom_id AND a2.element = 'c' WHERE      c1.bond_id = 'TR001_1_8' AND c2.bond_id = 'TR001_1_8' GROUP BY      c1.bond_id HAVING      chlorine_count > 0 AND carbon_count > 0 
SELECT DISTINCT m1.molecule_id, m2.molecule_id FROM molecule m1 JOIN connected c1 ON m1.molecule_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN connected c2 ON c1.atom_id2 = c2.atom_id JOIN atom a1 ON c1.atom_id = a1.atom_id JOIN atom a2 ON c1.atom_id2 = a2.atom_id WHERE b.bond_type = '#' AND a1.element = 'c' AND a2.element = 'c' AND m1.label = '-' AND m2.label = '-' AND m1.molecule_id != m2.molecule_id; 
SELECT      SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT m.molecule_id) AS percentage FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      molecule m ON c.molecule_id = m.molecule_id WHERE      m.label = '+' 
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON c.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR001' AND a.element IS NOT NULL 
SELECT DISTINCT c.molecule_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = ' = '; 
SELECT a1.atom_id AS first_atom_id, a2.atom_id AS second_atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '#' AND c.atom_id < c.atom_id2; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR005_16_26'; 
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'; 
SELECT m.label FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11' 
SELECT b.bond_id, m.label AS carcinogenicity FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+'; 
SELECT   m.molecule_id,   a.element FROM   molecule m JOIN   atom a ON m.molecule_id = a.molecule_id JOIN   connected c ON a.atom_id = c.atom_id WHERE   m.label = '+'   AND c.atom_id2 = SUBSTR(a.atom_id, 7, 1) = '4'   AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') 
SELECT      m.label,     (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 1.0) / COUNT(a.atom_id) AS hydrogen_ratio FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.molecule_id = 'TR006' GROUP BY      m.label; 
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND m.label = '+'; 
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE atom.element = 'te'; 
SELECT DISTINCT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE b.bond_id = 'TR001_10_11' AND a1.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND a2.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca'); 
SELECT      ROUND((COUNT(CASE WHEN b.bond_type = '#' THEN 1 ELSE NULL END) * 100.0) / COUNT(*), 2) AS triple_bond_percentage FROM      molecule m JOIN      connected c ON m.molecule_id = c.molecule_id JOIN      bond b ON c.bond_id = b.bond_id 
SELECT      (SUM(CASE WHEN b.bond_type = ' = ' THEN 1 ELSE 0 END) * 100.0) / COUNT(b.bond_id) AS percent FROM      bond b JOIN      connected c ON b.bond_id = c.bond_id WHERE      b.molecule_id = 'TR047' 
SELECT m.label AS is_carcinogenic FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON c.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_1' AND m.label = '+'; 
SELECT      CASE WHEN COUNT(*) > 0 THEN 'Yes'          ELSE 'No'     END AS carcinogenicity FROM      molecule WHERE      label = '+' AND molecule_id = 'TR151'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON c.molecule_id = m.molecule_id WHERE m.label = 'TR151' AND a.element IN ('cl', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') 
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m WHERE m.label = '+'; 
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON c.molecule_id = m.molecule_id WHERE m.molecule_id BETWEEN 'TR010' AND 'TR050' AND a.element = 'c' 
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN molecule m ON c.molecule_id = m.molecule_id  WHERE m.label = '+'; 
SELECT bond.bond_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN molecule ON connected.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND bond.bond_type = ' = '; 
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+'; 
SELECT m.molecule_id FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id JOIN atom AS a1 ON c.atom_id = a1.atom_id JOIN atom AS a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_id = 'TR00_1_2' AND a1.element = 'TR00_1'; 
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label <> '-' GROUP BY a.atom_id HAVING COUNT(DISTINCT a.molecule_id) = (SELECT COUNT(DISTINCT a2.molecule_id) FROM atom a2 JOIN molecule m2 ON a2.molecule_id = m2.molecule_id WHERE a2.element = 'c' AND m2.label <> '-'); 
SELECT      (SUM(CASE WHEN a.element = 'h' AND m.label = '+' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT m.molecule_id) AS percentage_carcinogenic_with_hydrogen FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      molecule m ON c.molecule_id = m.molecule_id 
SELECT COUNT(*) > 0 AS is_carcinogenic FROM molecule WHERE molecule_id = 'TR124' AND label = '+'; 
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.molecule_id = 'TR186'; 
SELECT bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR007_4_19' OR connected.atom_id2 = 'TR007_4_19'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_2_4' 
SELECT   COUNT(c.bond_id) AS double_bond_count,   CASE     WHEN m.label = '+' THEN 'Carcinogenic'     ELSE 'Non-carcinogenic'   END AS carcinogenicity FROM   connected c JOIN   bond b ON c.bond_id = b.bond_id JOIN   molecule m ON c.molecule_id = m.molecule_id WHERE   c.molecule_id = 'TR006'   AND b.bond_type = ' = '; 
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND (a.element = 'cl' OR a.element = 'c' OR a.element = 'h' OR a.element = 'o' OR a.element = 's' OR a.element = 'n' OR a.element = 'p' OR a.element = 'na' OR a.element = 'br' OR a.element = 'f' OR a.element = 'i' OR a.element = 'sn' OR a.element = 'pb' OR a.element = 'te' OR a.element = 'ca') 
SELECT b.bond_id, a1.atom_id AS atom1, a2.atom_id AS atom2 FROM bond b JOIN connected c1 ON b.bond_id = c1.bond_id JOIN connected c2 ON c1.atom_id2 = c2.atom_id AND c2.atom_id2 = c1.atom_id JOIN atom a1 ON c1.atom_id = a1.atom_id JOIN atom a2 ON c2.atom_id = a2.atom_id WHERE b.bond_type = '-' AND b.molecule_id IS NOT NULL; 
SELECT DISTINCT m.molecule_id, GROUP_CONCAT(DISTINCT a.element ORDER BY a.element) AS elements FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN atom a ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#' GROUP BY m.molecule_id 
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR000_2_3'; 
SELECT COUNT(c.bond_id) FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'cl' UNION SELECT COUNT(c.bond_id) FROM connected c JOIN atom a ON c.atom_id2 = a.atom_id WHERE a.element = 'cl' 
SELECT      a.atom_id,     COUNT(DISTINCT b.bond_type) AS bond_types_count FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.molecule_id = 'TR346' GROUP BY      a.atom_id; 
SELECT COUNT(DISTINCT m.molecule_id) AS double_bond_molecules,        SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_double_bond_molecules FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = ' = '; 
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id LEFT JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 LEFT JOIN bond b ON c.bond_id = b.bond_id WHERE a.element != 's' AND b.bond_type != ' = '; 
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4' AND m.label = '+'; 
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005'; 
SELECT COUNT(*) FROM bond WHERE bond_type = '-'; 
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'Cl' AND m.label = '+' 
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label <> '-' 
SELECT      COUNT(CASE WHEN T1.label = '+' AND T2.element = 'Cl' THEN 1 END) * 100.0 / COUNT(T1.molecule_id) AS percentage FROM      molecule AS T1 JOIN      connected AS T3 ON T1.molecule_id = T3.molecule_id JOIN      atom AS T2 ON T3.atom_id = T2.atom_id 
SELECT molecule_id  FROM bond  WHERE bond_id = 'TR001_1_7'; 
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  WHERE c.bond_id = 'TR001_3_4' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca'); 
SELECT bond.bond_type FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2' OR connected.atom_id = 'TR000_2' AND connected.atom_id2 = 'TR000_1'; 
SELECT m.label FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c1.atom_id2 JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE a1.atom_id = 'TR000_2' UNION SELECT m.label FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id2 JOIN bond b ON c1.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c1.atom_id JOIN molecule m ON a2.molecule_id = m.molecule_id WHERE a2.atom_id = 'TR000_4' 
SELECT `element` FROM `atom` WHERE `atom_id` = 'TR000_1'; 
SELECT CASE WHEN COUNT(*) > 0 THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule WHERE molecule_id = 'TR000' AND label = '+'; 
SELECT      ROUND(         (SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT a.atom_id),          2     ) AS percentage_of_single_bonds FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      bond b ON c.bond_id = b.bond_id; 
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'n' AND m.label = '+'; 
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id AND a.element = 's' JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id AND b.bond_type = ' = ' GROUP BY m.molecule_id; 
SELECT m.molecule_id FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5; 
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.element IN ('c', 'o', 's', 'n', 'p', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND a.molecule_id = (SELECT molecule_id FROM molecule WHERE label = 'TR024'); 
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1; 
SELECT      (SUM(CASE WHEN `label` = '+' THEN 1 ELSE 0 END) * 100.0) / COUNT(`molecule_id`) AS percentage_carcinogenic_with_triple_bonded_H FROM      `molecule` WHERE      EXISTS (         SELECT 1          FROM `atom` AS a1         JOIN `connected` AS c ON a1.atom_id = c.atom_id OR a1.atom_id = c.atom_id2         JOIN `bond` AS b ON c.bond_id = b.bond_id         WHERE              a1.element = 'h' AND              b.bond_type = '#'     ) AND      `molecule`.`label` = '+'; 
SELECT COUNT(*) FROM molecule WHERE label = '+'; 
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.molecule_id BETWEEN 'TR004' AND 'TR010'    AND b.bond_type = '-'; 
SELECT COUNT(a.atom_id)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE m.label = 'TR008' AND a.element = 'c' 
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON c.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label = '-' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') 
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'o' AND b.bond_type = ' = '; 
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '-' 
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR016' 
SELECT DISTINCT c1.atom_id FROM atom c1 JOIN connected con1 ON c1.atom_id = con1.atom_id JOIN bond b1 ON con1.bond_id = b1.bond_id JOIN atom c2 ON c2.atom_id = con1.atom_id2 WHERE c1.element = 'c' AND b1.bond_type = ' = ' AND c2.element = 'c' AND c1.molecule_id = 'TR012' AND c2.molecule_id = 'TR012' 
SELECT DISTINCT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o' 
SELECT c.name, c.artist, c.rarity, c.scryfallId FROM cards c WHERE c.cardKingdomFoilId = c.cardKingdomId   AND c.cardKingdomId IS NOT NULL   AND c.isFoil = 1; 
SELECT c.name FROM cards c WHERE c.borderColor = 'borderless' AND c.cardKingdomFoilId IS NULL AND c.cardKingdomId IS NULL; 
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards); 
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015'; 
SELECT c.name, c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator'; 
SELECT l.uuid, l.format, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Artifact'   AND c.side IS NULL   AND l.format = 'vintage'; 
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power = '*' OR c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal'; 
SELECT      c.name,     r.text AS ruling_text,     c.hasContentWarning AS has_content_warning FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid JOIN      rulings r ON c.uuid = r.uuid WHERE      c.artist = 'Stephen Daniel'     AND fd.language = 'en'     AND r.language = 'en'; 
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s'; 
SELECT c.name, c.artist, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.name, c.artist, c.isPromo ORDER BY COUNT(r.uuid) DESC LIMIT 1; 
SELECT language, translation FROM foreign_data WHERE name = 'Annul' AND number = '29'; 
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese' 
SELECT      (SUM(CASE WHEN f.language = 'Chinese Simplified' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage_of_chinese_simplified_cards FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid 
SELECT      s.code,      s.name,      s.totalSetSize FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Italian'; 
SELECT COUNT(DISTINCT type)  FROM cards  WHERE artist = 'Aaron Boyd'; 
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'; 
SELECT COUNT(*) FROM cards WHERE power = '*'; 
SELECT promoTypes  FROM cards  WHERE name = 'Duress'; 
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen' 
SELECT originalType  FROM cards  WHERE name = 'Ancestor''s Chosen'  AND setCode IN (SELECT code FROM sets WHERE name = 'Original Set') 
SELECT DISTINCT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON s.code = c.setCode WHERE c.name = 'Angel of Mercy'; 
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isTextless = 0; 
SELECT rulings.text FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.name = 'Condemn' 
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1; 
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Cloudchaser Eagle'; 
SELECT type FROM cards WHERE name = 'Benalish Knight'; 
SELECT r.text AS ruling_text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Benalish Knight'; 
SELECT artist  FROM cards  WHERE asciiName = 'Phyrexian'; 
SELECT     (SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless') * 100.0 /      (SELECT COUNT(*) FROM cards) AS borderless_percentage 
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN sets s ON c.setCode = s.code WHERE fd.language = 'German' AND c.isReprint = 1 
SELECT COUNT(c.id) AS borderlessCardsCount FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.borderColor = 'borderless' AND fd.language = 'Russian'; 
SELECT      (COUNT(CASE WHEN fd.language = 'French' THEN c.id END) * 100.0) / COUNT(CASE WHEN c.isStorySpotlight = 1 THEN c.id END) AS percentage_French_Story_Spotlight FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.isStorySpotlight = 1 
SELECT COUNT(*) FROM cards WHERE toughness = '99'; 
SELECT DISTINCT name FROM cards WHERE artist = 'Aaron Boyd' 
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo' 
SELECT id FROM cards WHERE convertedManaCost = 0; 
SELECT layout FROM cards WHERE uuid IN (     SELECT uuid     FROM cards     WHERE keywords LIKE '%flying%' ) 
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND id NOT IN (SELECT id FROM cards WHERE subtypes LIKE '%Angel%') 
SELECT c.id FROM cards c WHERE c.hasFoil = 1 AND (c.cardKingdomFoilId IS NOT NULL OR c.cardKingdomId IS NOT NULL) AND EXISTS (     SELECT 1     FROM cards c2     WHERE c2.id != c.id     AND c2.hasNonFoil = 1     AND (c2.cardKingdomFoilId IS NOT NULL OR c2.cardKingdomId IS NOT NULL) ); 
SELECT id FROM cards WHERE duelDeck = 'a'; 
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'; 
SELECT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Chinese Simplified'; 
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.availability = 'paper' AND l.format = 'Paper' AND c.uuid IN (     SELECT fd.uuid     FROM foreign_data fd     WHERE fd.language = 'Japanese' ) 
SELECT COUNT(*) FROM cards WHERE status = 'Banned' AND borderColor = 'white' 
SELECT c.uuid, fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'legacy' AND fd.language <> c.name; 
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Beacon of Immortality'; 
SELECT      COUNT(*) AS total_cards_with_future_frame_version,     l.status AS legality_status FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      c.frameVersion = 'future' AND      l.status = 'legal' GROUP BY      l.status; 
SELECT c.name, c.colorIdentity FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW'; 
SELECT c.name, c.asciiName, st.language, st.translation FROM cards c JOIN set_translations st ON c.uuid = st.uuid JOIN sets s ON st.setCode = s.code WHERE s.code = '10E' AND c.convertedManaCost = 5; 
SELECT cards.name, rulings.date FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.originalType = 'Creature - Elf'; 
SELECT c.colors, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20; 
SELECT c.name, c.types FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language != 'en'; 
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3; 
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL 
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*) FROM cards WHERE artist = 'UDON'   AND availability = 'mtgo'   AND hand = '-1'; 
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1; 
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability IN ('paper', 'mtgo') 
SELECT SUM(CAST(manaCost AS REAL)) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander'; 
SELECT DISTINCT type, supertypes, subtypes FROM cards WHERE availability = 'arena'; 
SELECT s.code FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Spanish'; 
SELECT      ROUND(         (COUNT(CASE WHEN c.hand = '+3' THEN 1 END) * 100.0) / COUNT(c.id),         2     ) AS percentage FROM      cards c WHERE      c.frameEffects = 'legendary'; 
SELECT     c.id,     ROUND((COUNT(c.id) * 100.0) / SUM(CASE WHEN c.isStorySpotlight = 1 AND c.isTextless = 0 THEN 1 ELSE 0 END), 2) AS percentage FROM     cards c WHERE     c.isStorySpotlight = 1 GROUP BY     c.id ORDER BY     percentage DESC; 
SELECT      c.name,      ROUND((SUM(CASE WHEN fd.language = 'Spanish' THEN 1 ELSE 0 END) * 100.0) / COUNT(c.id), 2) AS percentage_spanish FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid GROUP BY      c.name ORDER BY      percentage_spanish DESC; 
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 309; 
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Commander' AND st.language = 'Portuguese (Brasil)'; 
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'legal' AND c.types LIKE '%Creature%' AND c.types LIKE '%Goblin%'; 
SELECT DISTINCT c.type || ' ' || c.subtypes AS cardType FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.language = 'German' AND c.subtypes IS NOT NULL AND c.supertypes IS NOT NULL; 
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND       (text LIKE '%trigger%' OR text LIKE '%Triggers%'); 
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'Premodern' AND legalities.status = 'Legal' AND cards.side IS NULL AND EXISTS (     SELECT 1     FROM rulings     WHERE rulings.uuid = cards.uuid     AND rulings.text LIKE '%triggered mana ability%' ) 
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability = 'paper'; 
SELECT artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.text = 'Das perfekte Gegenmittel zu einer dichten Formation' 
SELECT fd.name AS foreign_name FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.language = 'French' AND c.type LIKE '%Creature%' AND c.layout = 'normal' AND c.borderColor = 'black' AND c.artist = 'Matthew D. Wilson'; 
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.rarity = 'rare' AND rulings.date = '2009-01-10'; 
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 180 AND s.block = 'Ravnica'; 
SELECT      ROUND((COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) * 100.0) / COUNT(c.id), 2) AS percentageWithoutContentWarning FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      c.type LIKE '%Commander%'     AND l.status = 'legal' 
SELECT      (COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 END AND fd.language = 'French') * 100.0) /      COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 END) AS percentage_of_french_cards_without_power FROM      cards c LEFT JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.power IS NULL OR c.power = '*' 
SELECT      ROUND((COUNT(CASE WHEN s.type = 'expansion' THEN 1 END) * 100.0) / COUNT(s.code), 2) AS percentage_japanese_expansion_sets FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Japanese' 
SELECT c.availability FROM cards c WHERE c.artist = 'Daren Bader' 
SELECT COUNT(*) FROM cards WHERE colorIdentity != '' AND borderColor = 'borderless' AND edhrecRank > 12000; 
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1; 
SELECT name, power FROM cards WHERE (power IS NULL OR power = '*')   AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3; 
SELECT language FROM foreign_data WHERE multiverseid = 149934; 
SELECT c1.id FROM cards c1 JOIN cards c2 ON c1.cardKingdomFoilId = c2.cardKingdomId WHERE c1.cardKingdomFoilId IS NOT NULL AND c1.cardKingdomId IS NOT NULL ORDER BY c1.cardKingdomFoilId LIMIT 3; 
SELECT      (COUNT(CASE WHEN c.isTextless = 1 AND c.layout = 'normal' THEN 1 END) / COUNT(c.isTextless)) * 100 AS proportion FROM      cards c 
SELECT c.name, c.number FROM cards c WHERE c.subtypes LIKE '%Angel%' AND c.subtypes LIKE '%Wizard%' AND c.otherFaceIds IS NULL 
SELECT s.name, COUNT(c.id) AS card_count FROM sets s LEFT JOIN cards c ON s.code = c.setCode WHERE s.mtgoCode IS NULL OR s.mtgoCode = '' GROUP BY s.code, s.name ORDER BY card_count DESC, s.name ASC LIMIT 3; 
SELECT DISTINCT language FROM set_translations JOIN sets ON sets.code = set_translations.setCode WHERE sets.mcmName = 'Archenemy' AND sets.code = 'ARC'; 
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5; 
SELECT st.language, s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206; 
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2; 
SELECT s.id FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese' AND s.isForeignOnly = 1 AND s.isFoilOnly = 1; 
SELECT s.name, SUM(s.baseSetSize) AS total_cards FROM sets s JOIN set_translations st ON s.code = st.setCode AND st.language = 'Russian' GROUP BY s.name ORDER BY total_cards DESC LIMIT 1 
SELECT      (SELECT COUNT(*)       FROM cards       WHERE language = 'Chinese Simplified' AND isOnlineOnly = 1) * 100.0 /      (SELECT COUNT(*)       FROM cards       WHERE language = 'Chinese Simplified') AS percentage_of_cards 
SELECT COUNT(DISTINCT s.code) AS set_count FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese' AND (s.mtgoCode IS NULL OR s.mtgoCode = '') 
SELECT id FROM cards WHERE borderColor = 'black' 
SELECT id FROM cards WHERE frameEffects = 'extendedart' 
SELECT c.name FROM cards c WHERE c.borderColor = 'black'   AND c.isFullArt = 1; 
SELECT language FROM set_translations WHERE setCode = '174'; 
SELECT name  FROM sets  WHERE code = 'ALL'; 
SELECT f.language FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE c.name = 'A Pedra Fellwar' 
SELECT code FROM sets WHERE releaseDate = '2007-07-13' 
SELECT s.baseSetSize, s.code FROM sets s WHERE s.block IN ('Masques', 'Mirage') 
SELECT code  FROM sets  WHERE type = 'expansion'; 
SELECT fd.name AS foreignName, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.watermark = 'Boros' 
SELECT      f.language,      f.flavorText,      c.type FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid WHERE      c.watermark = 'Colorpie' 
SELECT      ROUND((COUNT(CASE WHEN cards.convertedManaCost = 10 THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage_of_mana_cost_10 FROM      cards JOIN      sets ON cards.setCode = sets.code WHERE      sets.name = 'Abyssal Horror'; 
SELECT DISTINCT sets.code FROM sets JOIN cards ON sets.code = cards.setCode WHERE cards.type LIKE '%Expansion%Commander%' 
SELECT fd.name AS foreign_name, c.type FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.watermark = 'Abzan'; 
SELECT      fd.language,      c.type FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      fd.watermark = 'Azorius'; 
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand LIKE '+%' 
SELECT name FROM cards WHERE isTextless = 0; 
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen'; 
SELECT COUNT(*) FROM cards WHERE borderColor = 'W' AND (power = '*' OR power IS NULL); 
SELECT c.name FROM cards c WHERE c.isPromo = 1 AND c.side IS NOT NULL AND EXISTS (     SELECT 1     FROM cards c2     WHERE c2.uuid = c.uuid     AND c2.side <> c.side ); 
SELECT     c.subtypes,     c.supertypes FROM     cards c WHERE     c.name = 'Molimo, Maro-Sorcerer'; 
SELECT purchaseUrls FROM cards WHERE promoTypes LIKE '%bundle%' 
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'; 
SELECT      CASE          WHEN MAX(c1.convertedManaCost) > MAX(c2.convertedManaCost) THEN 'Serra Angel'         WHEN MAX(c1.convertedManaCost) < MAX(c2.convertedManaCost) THEN 'Shrine Keeper'         ELSE 'Equal'     END AS CardWithHigherManaCost FROM      cards c1 JOIN      cards c2 ON c1.name = 'Serra Angel' AND c2.name = 'Shrine Keeper' 
SELECT cards.artist FROM cards WHERE cards.flavorName = 'Battra, Dark Destroyer'; 
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3; 
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON s.code = c.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Italian'; 
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code JOIN set_translations ON sets.code = set_translations.setCode WHERE cards.name = 'Angel of Mercy' 
SELECT cards.name FROM cards JOIN set_translations ON cards.uuid = set_translations.uuid JOIN sets ON sets.code = set_translations.setCode WHERE sets.name = 'Hauptset Zehnte Edition' AND set_translations.language = 'de'; 
SELECT c.name, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.name = 'Ancestor''s Chosen' AND f.language = 'Korean'; 
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex' 
SELECT SUM(baseSetSize) AS total_cards_in_base_set FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition' 
SELECT translation FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.name = 'Eighth Edition' AND set_translations.language = 'Chinese' 
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE cards.name = 'Angel of Mercy'  AND sets.mtgoCode IS NOT NULL; 
SELECT sets.releaseDate FROM sets JOIN cards ON sets.code = cards.setCode WHERE cards.name = 'Ancestor''s Chosen'; 
SELECT sets.type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition' 
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian' 
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE cards.name = 'Adarkar Valkyrie' AND sets.isForeignOnly = 1; 
SELECT COUNT(*) FROM sets WHERE code IN (     SELECT s.code     FROM sets s     JOIN set_translations st ON s.code = st.setCode     WHERE st.language = 'Italian' AND s.baseSetSize < 10 ) 
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND name = 'Coldsnap'; 
SELECT name FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' ORDER BY convertedManaCost DESC LIMIT 1; 
SELECT DISTINCT artist FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy') 
SELECT c.* FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.number = '4' 
SELECT COUNT(*) FROM cards AS C JOIN sets AS S ON C.setCode = S.code WHERE S.name = 'Coldsnap'  AND C.convertedManaCost > 5 AND (C.power = '*' OR C.power IS NULL); 
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen'; 
SELECT DISTINCT foreign_data.language FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.flavorText IS NOT NULL; 
SELECT t.translation FROM cards c JOIN set_translations st ON c.setCode = st.setCode JOIN sets s ON st.setCode = s.code JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'German' AND fd.language = 'German' 
SELECT c.name, st.translation FROM cards c JOIN set_translations st ON c.setCode = st.setCode JOIN sets s ON st.setCode = s.code WHERE s.name = 'Coldsnap' AND st.language = 'Italian' AND st.translation IS NOT NULL; 
SELECT foreign_data.name AS ItalianName FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND foreign_data.language = 'Italian' ORDER BY cards.convertedManaCost DESC LIMIT 10; 
SELECT date  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Reminisce'; 
SELECT      ROUND(         (SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) * 100.0) /          COUNT(*),         2     ) AS percentage_with_mana_cost_7 FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Coldsnap'; 
SELECT      (SUM(CASE WHEN c.cardKingdomFoilId = c.cardKingdomId AND c.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) * 100.0) / COUNT(c.id) AS incredibly_powerful_percentage FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      c.name = 'Coldsnap' 
SELECT code  FROM sets  WHERE releaseDate = '2017-07-14' 
SELECT keyruneCode FROM sets WHERE code = 'PKHC'; 
SELECT mcmId FROM sets WHERE code = 'SS2' 
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'; 
SELECT type  FROM sets  WHERE name LIKE 'From the Vault: Lore%' 
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'; 
SELECT c.name, r.text AS ruling_text, c.hasContentWarning AS has_content_warning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' UNION SELECT c.name, NULL AS ruling_text, c.hasContentWarning AS has_content_warning FROM cards c WHERE c.artist = 'Jim Pavelec' AND c.uuid NOT IN (SELECT uuid FROM rulings); 
SELECT s.releaseDate FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Evacuation'; 
SELECT s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Rinascita di Alara' 
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Huitième édition'; 
SELECT st.translation FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN set_translations st ON c.setCode = st.setCode AND fd.language = st.language WHERE fd.name = 'Tendo Ice Bridge' AND st.language = 'French'; 
SELECT COUNT(*) FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Salvat 2011' AND code IS NOT NULL) AND translation IS NOT NULL; 
SELECT s.translation  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Japanese'  AND s.code IN (     SELECT setCode      FROM cards      WHERE name = 'Fellwar Stone' ) 
SELECT name, MAX(convertedManaCost) AS max_mana_cost FROM cards WHERE name = 'Journey into Nyx Hero''s Path' GROUP BY name ORDER BY max_mana_cost DESC LIMIT 1; 
SELECT sets.releaseDate FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Ola de frío' 
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim'; 
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3; 
SELECT translation FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.name = 'Mirrodin' AND set_translations.language = 'Chinese Simplified'; 
SELECT      ROUND((SUM(CASE WHEN c.isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN c.language = 'Japanese' THEN 1 ELSE 0 END), 2) AS percentage_japanese_non_foil FROM      cards c JOIN      set_translations st ON c.uuid = st.uuid WHERE      c.language = 'Japanese' AND      st.language = 'Japanese' 
SELECT     (SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM     cards c JOIN     set_translations st ON c.uuid = st.uuid JOIN     sets s ON st.setCode = s.code WHERE     st.language = 'Portuguese (Brazil)'; 
SELECT DISTINCT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1; 
SELECT s.id FROM sets s WHERE s.baseSetSize = (SELECT MAX(baseSetSize) FROM sets) 
SELECT      artist,      MAX(convertedManaCost) AS max_cost FROM      cards WHERE      side IS NULL GROUP BY      artist ORDER BY      max_cost DESC LIMIT 1; 
SELECT MAX(frameEffects) AS MostCommonFrameEffect FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a'; 
SELECT id FROM sets WHERE type = 'commander' AND totalSetSize IS NOT NULL AND code NOT LIKE '%Alchemy%' ORDER BY totalSetSize DESC LIMIT 1; 
SELECT c.name, c.manaCost FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY c.convertedManaCost DESC LIMIT 10; 
SELECT      MIN(originalReleaseDate) AS oldestMythicReleaseDate,     GROUP_CONCAT(DISTINCT legalities.format ORDER BY legalities.format) AS legalPlayFormats FROM      cards JOIN      legalities ON cards.uuid = legalities.uuid WHERE      cards.rarity = 'mythic' AND     legalities.status = 'legal' GROUP BY      cards.uuid ORDER BY      oldestMythicReleaseDate LIMIT      1 
SELECT COUNT(c.id) AS NumberOfCards FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baga' AND fd.language = 'French'; 
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'rare' AND cards.types LIKE '%Enchantment%' AND cards.name = 'Abundance' AND legalities.status = 'Legal'; 
SELECT legalities.format, cards.name FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.status = 'banned' GROUP BY legalities.format, cards.name ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Battlebond' 
SELECT artist, COUNT(*) AS card_count FROM cards GROUP BY artist ORDER BY card_count ASC LIMIT 1 
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND l.format = 'legacy' AND (c.hasContentWarning = 1 OR l.status = 'Legal') 
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.edhrecRank = 1 AND legalities.status = 'banned'; 
SELECT AVG(COUNT(set_code)) AS annual_avg_sets_released,        MAX(COUNT(DISTINCT language)) AS common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(releaseDate); 
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena'; 
SELECT l.uuid FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.format = 'oldschool' AND (l.status = 'banned' OR l.status = 'restricted'); 
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'; 
SELECT r.text, r.date FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC; 
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'legal'; 
SELECT s.name FROM sets s LEFT JOIN set_translations st_japanese ON s.code = st_japanese.setCode AND st_japanese.language = 'Japanese' LEFT JOIN set_translations st_korean ON s.code = st_korean.setCode AND st_korean.language = 'Korean' WHERE st_japanese.id IS NULL AND st_korean.id IS NOT NULL; 
SELECT DISTINCT c.frameVersion AS FrameStyle FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN sets s ON c.setCode = s.code WHERE c.artist = 'Allen Williams' UNION SELECT c.frameVersion AS FrameStyle FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'banned' 
SELECT     CASE         WHEN u1.Reputation > u2.Reputation THEN u1.DisplayName         ELSE u2.DisplayName     END AS UserWithHigherReputation FROM     users u1 JOIN     users u2 ON u1.DisplayName = 'Harlan' OR u2.DisplayName = 'Harlan' WHERE     u1.DisplayName = 'Harlan' AND u2.DisplayName = 'Jarrod Dixon' 
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2014; 
SELECT COUNT(DISTINCT Id)  FROM users  WHERE LastAccessDate > '2014-09-01 00:00:00' 
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1 
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 1 AND v.BountyAmount IS NULL GROUP BY u.Id HAVING SUM(v.BountyAmount) > 100 AND COUNT(CASE WHEN v.VoteTypeId = 2 THEN 1 END) > 1 
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013 
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') 
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' 
SELECT u.DisplayName AS OwnerDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts' 
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1; 
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts) 
SELECT SUM(c.CommentCount) AS TotalComments FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' 
SELECT p.AnswerCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.AnswerCount DESC LIMIT 1; 
SELECT LastEditorDisplayName  FROM posts  WHERE Title = 'Examples for teaching: Correlation does not mean causation'  AND LastEditorUserId IS NOT NULL; 
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND ParentId IS NULL 
SELECT DISTINCT p.OwnerDisplayName FROM posts p WHERE p.ClosedDate IS NOT NULL; 
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (     SELECT Id     FROM users     WHERE Age > 65 ) AND Score >= 20; 
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts'; 
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian' 
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags) 
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie' 
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011 
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY b.UserId ORDER BY COUNT(b.Id) DESC LIMIT 1; 
SELECT AVG(posts.Score) AS average_score FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie' 
SELECT AVG(badge_count) AS average_badges FROM (     SELECT COUNT(b.Id) AS badge_count     FROM badges b     JOIN users u ON b.UserId = u.Id     WHERE u.Views > 200     GROUP BY b.UserId ) AS subquery; 
SELECT     (SELECT COUNT(*) FROM posts WHERE Score > 20 AND OwnerUserId IN (SELECT Id FROM users WHERE Age > 65)) * 100.0 /      (SELECT COUNT(*) FROM posts WHERE Score > 20) AS ElderUserOwnershipPercentage 
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19' 
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1; 
SELECT COUNT(*) FROM badges WHERE Name = 'Revival' 
SELECT p.Title FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = (SELECT MAX(Score) FROM comments) 
SELECT COUNT(c.Id) AS CommentCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount = 1910 
SELECT SUM(p.FavoriteCount) AS TotalFavoriteCount FROM posts p WHERE p.Id = (     SELECT c.PostId     FROM comments c     WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39.0' ) 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ParentId = 107829 AND c.CommentCount = 1 LIMIT 1; 
SELECT      p.Id,     p.Title,     p.ClosedDate,     CASE          WHEN p.ClosedDate IS NULL THEN 'Not well-finished'         ELSE 'Well-finished'     END AS PostStatus FROM      posts p JOIN      comments c ON p.Id = c.PostId JOIN      users u ON c.UserId = u.Id WHERE      c.CreationDate = '2013-07-12 09:08:18.0' AND     u.Id = 23853 
SELECT Reputation  FROM users  WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041); 
SELECT COUNT(p.Id) AS NumberOfPosts FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Tiago Pasqualini' 
SELECT u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.Id = 6347; 
SELECT COUNT(v.Id) as VoteCount FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%'; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms' 
SELECT      CAST(COUNT(p.Id) AS REAL) / COUNT(v.Id) AS PostToVoteRatio FROM      posts p LEFT JOIN      votes v ON p.OwnerUserId = 24 WHERE      p.OwnerUserId = 24 
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'; 
SELECT Text FROM comments WHERE Score = 17; 
SELECT DisplayName  FROM users  WHERE WebsiteUrl = 'http://stackoverflow.com' 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost'; 
SELECT c.UserId, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93!' 
SELECT c.Id, c.Text, c.CreationDate, c.UserId, c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion' 
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?' 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?' 
SELECT DISTINCT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' LIMIT 10; 
SELECT u.DisplayName AS EditorDisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data'; 
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa'; 
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.WebsiteUrl; 
SELECT c.Id, c.Text, c.CreationDate, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND EXISTS (     SELECT 1     FROM postHistory ph     WHERE ph.PostId = p.Id     AND ph.UserId = c.UserId ) 
SELECT SUM(v.BountyAmount) AS TotalBountyAmount FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data%' 
SELECT u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%' 
SELECT AVG(p.ViewCount) AS AverageViewCount, p.Title, c.Text AS Comment, c.Score FROM posts p LEFT JOIN tags t ON p.Id = t.ExcerptPostId LEFT JOIN comments c ON p.Id = c.PostId WHERE t.TagName = 'humor' GROUP BY p.Id, p.Title, c.Text, c.Score; 
SELECT COUNT(c.Id) AS TotalComments FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.Id = 13; 
SELECT Id AS UserId, MAX(Reputation) AS MaxReputation FROM users GROUP BY Id ORDER BY MaxReputation DESC LIMIT 1; 
SELECT Id FROM users ORDER BY Views ASC LIMIT 1; 
SELECT COUNT(DISTINCT badges.UserId)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE badges.Name = 'Supporter' AND YEAR(badges.Date) = 2011; 
SELECT COUNT(DISTINCT b.UserId)  FROM badges b WHERE b.Name IN (     SELECT Name      FROM badges      GROUP BY Name      HAVING COUNT(*) > 5 ) 
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name IN ('Teacher', 'Supporter') AND u.Location = 'New York' 
SELECT      u.DisplayName,      u.Reputation  FROM      users u  JOIN      posts p ON u.Id = p.OwnerUserId  WHERE      p.Id = 1 
SELECT u.DisplayName, p.Id AS PostId FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount >= 1000 AND (     SELECT COUNT(*)     FROM postHistory ph     WHERE ph.UserId = u.Id AND ph.PostId = p.Id ) = 1 
SELECT u.DisplayName, b.Name FROM users u JOIN comments c ON u.Id = c.UserId JOIN badges b ON u.Id = b.UserId WHERE c.UserId = (     SELECT UserId     FROM comments     GROUP BY UserId     ORDER BY COUNT(Id) DESC     LIMIT 1 ) ORDER BY b.Name DESC; 
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Teacher' AND u.Location = 'India' 
SELECT      (SUM(CASE WHEN YEAR(Date) = 2010 THEN 1 ELSE 0 END) /       (SELECT COUNT(*) FROM badges)) * 100 AS Percentage2010,     (SUM(CASE WHEN YEAR(Date) = 2011 THEN 1 ELSE 0 END) /       (SELECT COUNT(*) FROM badges)) * 100 AS Percentage2011,     ((SUM(CASE WHEN YEAR(Date) = 2010 THEN 1 ELSE 0 END) /        (SELECT COUNT(*) FROM badges)) -       (SUM(CASE WHEN YEAR(Date) = 2011 THEN 1 ELSE 0 END) /        (SELECT COUNT(*) FROM badges))) * 100 AS PercentageDifference FROM badges WHERE Name = 'Students' 
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommenters FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId; 
SELECT p.Id, p.ViewCount AS Popularity FROM posts p WHERE p.Id = 61217 UNION ALL SELECT p.Id, p.ViewCount AS Popularity FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE pl.RelatedPostId = 61217; 
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395; 
SELECT p.Id, p.OwnerUserId FROM posts p WHERE p.Score > 60; 
SELECT SUM(p.FavoriteCount) AS TotalFavoriteCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Id = 686 AND YEAR(p.CreationDate) = 2011; 
SELECT      AVG(u.UpVotes) AS UpVotesAverage,     AVG(u.Age) AS AgeAverage FROM      users u JOIN      posts p ON u.Id = p.OwnerUserId WHERE      p.OwnerUserId IS NOT NULL GROUP BY      u.Id HAVING      COUNT(p.Id) > 10 
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer'; 
SELECT b.Name FROM badges b WHERE b.Date = '2010-07-19 19:39:08'; 
SELECT COUNT(*) FROM comments WHERE Score > 60 
SELECT Text  FROM comments  WHERE CreationDate = '2010-07-19 19:16:14.0'; 
SELECT COUNT(*)  FROM posts  WHERE Score = 10 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users) 
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0' 
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Pierre'; 
SELECT badges.Date FROM badges JOIN users ON badges.UserId = users.Id WHERE users.Location = 'Rochester, NY'; 
SELECT     ROUND((COUNT(DISTINCT badges.UserId) / (SELECT COUNT(DISTINCT Id) FROM users)) * 100, 2) AS PercentageOfUsersWithTeacherBadge FROM     badges WHERE     badges.Name = 'Teacher' 
SELECT      ROUND((COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN u.Id END) * 100.0) / COUNT(u.Id), 2) AS Teenager_Percentage FROM      badges b JOIN      users u ON b.UserId = u.Id WHERE      b.Name = 'Organizer' 
SELECT SUM(CASE WHEN c.Score > 0 THEN 1 ELSE 0 END) - SUM(CASE WHEN c.Score < 0 THEN 1 ELSE 0 END) AS CommentRatingScore FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '2010-07-19 19:19:56.0' 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '2010-07-19 19:37:33.0' 
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria' 
SELECT COUNT(DISTINCT u.Id) AS NumberOfAdultSupporters FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65 
SELECT SUM(u.Views) AS TotalViews FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0' 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users) 
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Sharpie') 
SELECT COUNT(DISTINCT b.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65; 
SELECT DisplayName FROM users WHERE Id = 30; 
SELECT COUNT(*) FROM users WHERE Location = 'New York' 
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010 
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65; 
SELECT DisplayName, MAX(Views) as MaxViews FROM users GROUP BY DisplayName ORDER BY MaxViews DESC 
SELECT      DIVIDE(COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 END), COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 END)) AS VoteRatio FROM votes 
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Stauffer'; 
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (     SELECT Id     FROM users     WHERE DisplayName = 'Daniel Vassallo' ) 
SELECT COUNT(*)  FROM votes  WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'Harlan') 
SELECT p.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1; 
SELECT      CASE          WHEN SUM(PC.ViewCount) > NS.ViewCount THEN 'Harvey Motulsky'         ELSE 'Noah Snyder'     END AS MorePopularAuthor,     SUM(PC.ViewCount) AS HarveyMotulskyViewCount,     NS.ViewCount AS NoahSnyderViewCount FROM      posts AS PM JOIN      users AS UM ON PM.OwnerUserId = UM.Id AND UM.DisplayName = 'Harvey Motulsky' JOIN      (SELECT SUM(ViewCount) AS ViewCount FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Noah Snyder')) AS NS WHERE      PM.OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky') GROUP BY      PM.OwnerUserId 
SELECT COUNT(p.Id) AS PostsWithMoreThanFourVotes FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND p.Id IN (     SELECT v.PostId     FROM votes v     GROUP BY v.PostId     HAVING COUNT(v.Id) > 4 ); 
SELECT COUNT(*)  FROM comments  JOIN users ON comments.UserId = users.Id  WHERE users.DisplayName = 'Neil McGuigan'  AND comments.Score < 60; 
SELECT t.TagName FROM tags t JOIN posts p ON t.Id = p.Tags JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND NOT EXISTS (     SELECT 1     FROM comments c     WHERE c.PostId = p.Id ) 
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer'; 
SELECT      CAST(COUNT(DISTINCT p.Id) AS REAL) / COUNT(DISTINCT CASE WHEN u.DisplayName = 'Community' THEN p.Id ELSE NULL END) AS percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id JOIN      tags t ON p.Id = t.ExcerptPostId WHERE      t.TagName = 'r' AND      u.DisplayName = 'Community' 
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName IN ('Mornington', 'Amos') 
SELECT COUNT(DISTINCT badges.UserId) AS UsersReceivedCommentatorBadge FROM badges WHERE badges.Name = 'commentator' AND EXTRACT(YEAR FROM badges.Date) = 2014; 
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59'; 
SELECT u.DisplayName, u.Age FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts) 
SELECT p.LastEditDate, p.LastEditorUserId FROM posts p WHERE p.Title = 'Detecting a given face in a database of facial images'; 
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60 
SELECT p.Title, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score > 60; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND YEAR(b.Date) = 2011; 
SELECT u.DisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150; 
SELECT      COUNT(*) AS PostHistoryCount,     MAX(postHistory.CreationDate) AS LastEditDate FROM      postHistory INNER JOIN      posts ON postHistory.PostId = posts.Id WHERE      posts.Title = 'What is the best introductory Bayesian statistics textbook?' 
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers' ORDER BY u.LastAccessDate DESC LIMIT 10; 
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'How to tell if something happened in a data set which monitors a value over time' AND pl.RelatedPostId IS NOT NULL; 
SELECT p.Id AS PostId, b.Name AS BadgeName FROM badges b JOIN posts p ON b.UserId = p.OwnerUserId JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013 UNION SELECT p.Id AS PostId, b.Name AS BadgeName FROM badges b JOIN comments c ON b.UserId = c.UserId JOIN posts p ON c.PostId = p.Id JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(c.CreationDate) = 2013 UNION SELECT ph.PostId AS PostId, b.Name AS BadgeName FROM postHistory ph JOIN badges b ON ph.BadgeId = b.Id JOIN users u ON ph.UserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(ph.CreationDate) = 2013 UNION SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(p.CreaionDate) = 2013 
SELECT p.OwnerDisplayName FROM posts p WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts) 
SELECT u.DisplayName, u.Location FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN users u ON p.OwnerUserId = u.Id WHERE t.TagName = 'hypothesis-testing'; 
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?' 
SELECT p.OwnerDisplayName FROM posts AS p WHERE p.ParentId IS NOT NULL AND p.Score = (SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL) 
SELECT u.DisplayName, u.WebsiteUrl FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8) 
SELECT p.Title FROM posts p ORDER BY p.ViewCount DESC LIMIT 5; 
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000; 
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1 
SELECT      u.DisplayName,      TIMESTAMPDIFF(YEAR, u.CreationDate, CURDATE()) AS Age FROM      users u ORDER BY      u.Reputation DESC LIMIT 1; 
SELECT COUNT(*) FROM posts JOIN votes ON posts.Id = votes.PostId WHERE YEAR(posts.CreationDate) = 2011 AND votes.BountyAmount = 50; 
SELECT Id FROM users ORDER BY Age ASC LIMIT 1 
SELECT p.Score FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags) ORDER BY p.Score DESC LIMIT 1; 
SELECT      COUNT(pl.Id) / 12 AS average_monthly_links FROM      postLinks pl JOIN      posts p ON pl.PostId = p.Id WHERE      YEAR(pl.CreationDate) = 2010 AND      p.AnswerCount <= 2 GROUP BY      MONTH(pl.CreationDate) 
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId AND v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1; 
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (     SELECT MIN(CreationDate)     FROM postLinks ) 
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1; 
SELECT MIN(CreationDate) FROM votes WHERE UserId = (     SELECT Id     FROM users     WHERE DisplayName = 'chl' ) AND PostId IS NOT NULL; 
SELECT MIN(u.CreationDate) AS FirstPostDate FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Age = (SELECT MIN(Age) FROM users) 
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1; 
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4; 
SELECT AVG(Votes.PostId) AS AverageVotesPerOldestUser FROM votes JOIN users ON votes.UserId = users.Id WHERE users.Age = (SELECT MAX(Age) FROM users) 
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1; 
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000 
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65; 
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (     SELECT Id     FROM users     WHERE DisplayName = 'Jay Stevens' ) AND YEAR(CreationDate) = 2010; 
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1; 
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score = (SELECT MAX(Score) FROM posts) 
SELECT AVG(posts.Score) AS AverageScore FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Stephen Turner'; 
SELECT DISTINCT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011 
SELECT p.Id, u.DisplayName AS OwnerDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1 
SELECT      (COUNT(CASE WHEN p.CreationDate BETWEEN '2011-01-01' AND '2011-12-31' AND u.Reputation > 1000 THEN 1 END) * 100.0) / COUNT(p.Id) AS percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id 
SELECT      DIVIDE(COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 END), COUNT(u.Id)) AS percentage FROM      users u 
SELECT p.ViewCount, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Computer Game Datasets' ORDER BY p.LastEditDate DESC LIMIT 1; 
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts) 
SELECT COUNT(c.Id) AS CommentCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Score = (SELECT MAX(Score) FROM posts) 
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0 
SELECT      u.DisplayName,      u.Location  FROM      users u  JOIN      posts p ON u.Id = p.LastEditorUserId  WHERE      p.Id = 183 ORDER BY      p.LastEditDate DESC  LIMIT 1 
SELECT Name FROM badges WHERE UserId = (     SELECT Id     FROM users     WHERE DisplayName = 'Emmett' ) ORDER BY Date DESC LIMIT 1; 
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000; 
SELECT      DATEDIFF(b.Date, u.CreationDate) AS TimeToGetBadge FROM      badges b JOIN      users u ON b.UserId = u.Id WHERE      u.DisplayName = 'Zolomon' AND b.Name = 'YourBadgeName'; 
SELECT      u.Id AS UserId,     COUNT(DISTINCT p.Id) AS PostCount,     COUNT(DISTINCT c.Id) AS CommentCount FROM      users u LEFT JOIN      posts p ON u.Id = p.OwnerUserId LEFT JOIN      comments c ON u.Id = c.UserId WHERE      u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY      u.Id 
SELECT c.Text, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 1; 
SELECT COUNT(DISTINCT badges.UserId) FROM badges WHERE badges.Name = 'Citizen Patrol'; 
SELECT COUNT(*) FROM posts JOIN tags ON posts.Id = tags.ExcerptPostId WHERE tags.TagName = 'careers'; 
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'; 
SELECT      SUM(CASE WHEN c.PostId IS NOT NULL THEN 1 ELSE 0 END) AS CommentCount,     SUM(CASE WHEN p.PostId IS NOT NULL THEN 1 ELSE 0 END) AS AnswerCount FROM      posts p LEFT JOIN      comments c ON p.Id = c.PostId LEFT JOIN      postHistory ph ON p.Id = ph.PostId AND ph.Text IS NOT NULL WHERE      p.Title = 'Clustering 1D data' 
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat' 
SELECT COUNT(*) FROM votes WHERE VoteTypeId = 2 AND BountyAmount >= 30; 
SELECT     (COUNT(CASE WHEN posts.Score >= 50 THEN posts.Id END) * 100.0) / COUNT(posts.Id) AS PercentageOfHighScorePosts FROM     posts INNER JOIN     users ON posts.OwnerUserId = users.Id WHERE     users.Reputation = (SELECT MAX(Reputation) FROM users) 
SELECT COUNT(*) FROM posts WHERE Score < 20; 
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20; 
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample' 
SELECT u.Reputation, u.UpVotes FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'fine, you win :)' 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How can I adapt ANOVA for binary data?' AND EXISTS (     SELECT 1     FROM tags t     JOIN posts p2 ON t.ExcerptPostId = p2.Id     WHERE t.TagName = 'linear-regression'     AND p2.Id = c.PostId ); 
SELECT MAX(Score) AS HighestCommentScore, c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 GROUP BY c.Text ORDER BY HighestCommentScore DESC LIMIT 1 
SELECT c.CreationDate, u.Age FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text LIKE '%http://%' 
SELECT COUNT(DISTINCT p.Id)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5; 
SELECT COUNT(c.Id)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score IS NULL 
SELECT COUNT(DISTINCT u.Id) AS TotalUsersAged40 FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40 
SELECT p.Id AS PostId, c.Text AS CommentText FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'; 
SELECT u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'R is also lazy evaluated.'; 
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' 
SELECT DISTINCT c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0 
SELECT      (COUNT(CASE WHEN v.UserId IS NOT NULL THEN c.UserId END) / COUNT(c.UserId)) * 100 AS percentage FROM      comments c LEFT JOIN      votes v ON c.UserId = v.UserId AND v.VoteTypeId = 1 WHERE      c.Score BETWEEN 5 AND 10 AND v.UpVotes = 0 
SELECT sp.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.superhero_name = '3-D Man'; 
SELECT COUNT(DISTINCT hp.hero_id)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength'; 
SELECT COUNT(*) FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200; 
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15 
SELECT COUNT(DISTINCT superhero.id)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue'; 
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse'; 
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN superpower sp ON s.id = sp.hero_id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility'; 
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue') AND hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond'); 
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics'; 
SELECT superhero.full_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' ORDER BY superhero.height_cm DESC LIMIT 1; 
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Sauron'; 
SELECT COUNT(DISTINCT superhero.id) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' AND superhero.publisher_id = (     SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics' ) 
SELECT AVG(height_cm)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'); 
SELECT      ROUND((SUM(CASE WHEN sp.power_name = 'Super Strength' THEN 1 ELSE 0 END) / COUNT(s.id)) * 100, 2) AS percentage_of_marvel_heroes_with_super_strength FROM      superhero s JOIN      hero_power hp ON s.id = hp.hero_id JOIN      superpower sp ON hp.power_id = sp.id JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics' 
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') 
SELECT p.publisher_name, a.attribute_value FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND a.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Speed' AND ha2.hero_id = s.id) GROUP BY p.publisher_name, a.attribute_value ORDER BY a.attribute_value ASC LIMIT 1; 
SELECT COUNT(*) FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Gold') AND publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') 
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II'; 
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond' 
SELECT superhero_name, full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Intelligence' AND attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Intelligence') 
SELECT race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'Copycat' 
SELECT COUNT(DISTINCT h.id) FROM superhero h JOIN hero_attribute ha ON h.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50; 
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch'; 
SELECT COUNT(DISTINCT s.id)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100; 
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name ORDER BY COUNT(hero_power.power_id) DESC LIMIT 1; 
SELECT COUNT(*) FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race = 'Vampire') 
SELECT      ROUND((SUM(CASE WHEN s.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') THEN 1 ELSE 0 END) * 100.0) / COUNT(s.id), 2) AS percentage_bad_alignment,     COUNT(CASE WHEN s.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') AND p.publisher_name = 'Marvel Comics' THEN 1 END) AS marvel_bad_hero_count FROM superhero s LEFT JOIN publisher p ON s.publisher_id = p.id 
SELECT      (SUM(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) -       SUM(CASE WHEN publisher.publisher_name = 'DC Comics' THEN 1 ELSE 0 END)) AS diff_heroes_published FROM      superhero JOIN      publisher ON superhero.publisher_id = publisher.id 
SELECT id FROM publisher WHERE publisher_name = 'Star Trek' 
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute; 
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL; 
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.id = 75; 
SELECT sp.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.superhero_name = 'Deathlok'; 
SELECT AVG(weight_kg) AS average_weight FROM superhero WHERE gender_id = 2; 
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' GROUP BY sp.power_name ORDER BY COUNT(sp.power_name) DESC LIMIT 5; 
SELECT superhero_name FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race = 'Alien'); 
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IS NULL; 
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.id = 56; 
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God') AND superhero_name IS NOT NULL LIMIT 5; 
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad'); 
SELECT race FROM superhero WHERE weight_kg = 169; 
SELECT c.colour  FROM superhero s  JOIN colour c ON s.hair_colour_id = c.id  WHERE s.height_cm = 185 AND s.race_id = (SELECT id FROM race WHERE race = 'human'); 
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero) 
SELECT      ROUND(         (SUM(CASE WHEN p.publisher_id = 13 THEN 1 ELSE 0 END) * 100.0) / COUNT(*),         2     ) AS percentage_marvel_heroes FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      s.height_cm BETWEEN 150 AND 180 
SELECT superhero.full_name FROM superhero WHERE superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Male') AND superhero.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero) 
SELECT sp.power_name, COUNT(hp.power_id) as power_count FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id GROUP BY sp.power_name ORDER BY power_count DESC LIMIT 1; 
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Abomination'; 
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 1; 
SELECT COUNT(DISTINCT h.id)  FROM superhero h  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'stealth'; 
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'strength' AND ha.attribute_value = (     SELECT MAX(ha2.attribute_value)     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'strength' ) 
SELECT AVG(suphero.id) / COUNT(CASE WHEN c.id = 1 THEN 1 ELSE NULL END) as avg_no_skin_coloured_heroes FROM superhero s LEFT JOIN colour c ON s.skin_colour_id = c.id WHERE c.id IS NULL; 
SELECT COUNT(*)  FROM superhero  WHERE publisher_id IN (     SELECT id      FROM publisher      WHERE publisher_name = 'Dark Horse Comics' ) 
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE attribute_name = 'durability' AND publisher_name = 'Dark Horse Comics' GROUP BY superhero_name ORDER BY MAX(attribute_value) DESC LIMIT 1; 
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien'; 
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight'; 
SELECT s.superhero_name, c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics'; 
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN colour hcc ON s.hair_colour_id = hcc.id JOIN colour hsc ON s.skin_colour_id = hsc.id JOIN colour ecc ON s.eye_colour_id = ecc.id JOIN publisher p ON s.publisher_id = p.id WHERE hcc.colour = hsc.colour AND hsc.colour = ecc.colour; 
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'A-Bomb' 
SELECT      ROUND(         (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) / COUNT(CASE WHEN s.gender = 'Female' THEN 1 ELSE NULL END)) * 100,          2     ) AS percentage_of_blue_female_superheroes FROM      superhero s JOIN      colour c ON s.skin_colour_id = c.id WHERE      s.gender = 'Female'; 
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler' AND superhero_name = 'Charles Chandler'; 
SELECT gender.gender FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13' 
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation'; 
SELECT COUNT(*)  FROM hero_power  JOIN superhero ON hero_power.hero_id = superhero.id  WHERE superhero.superhero_name = 'Amazo'; 
SELECT sp.power_name FROM superhero AS sz JOIN hero_power AS hp ON sz.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sz.full_name = 'Hunter Zolomon'; 
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber'; 
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Black' AND hair_colour.colour = 'Black'; 
SELECT s.superhero_name, c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE c.colour = 'Gold' JOIN colour eye_colours ON s.eye_colour_id = eye_colours.id 
SELECT superhero.full_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire' 
SELECT superhero_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral' 
SELECT COUNT(*)  FROM hero_attribute ha  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Strength'  AND ha.attribute_value = (SELECT MAX(attribute_value)                             FROM hero_attribute                             WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')); 
SELECT      s.race_id,      r.race,      a.alignment FROM superhero s JOIN race r ON s.race_id = r.id JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks' 
SELECT      ROUND((SUM(CASE WHEN s.gender_id = g.id THEN 1 ELSE 0 END) * 100.0) / COUNT(s.id), 2) AS percentage_female_marvel_heroes FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics'; 
SELECT AVG(weight_kg)  FROM superhero  WHERE race_id = (SELECT id FROM race WHERE race = 'Alien') 
SELECT      (SUM(CASE WHEN s.full_name = 'Emil Blonsky' THEN s.weight_kg ELSE 0 END) -       SUM(CASE WHEN s.full_name = 'Charles Chandler' THEN s.weight_kg ELSE 0 END)) AS weight_difference FROM superhero s; 
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name; 
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination'; 
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1 
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed' AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed') 
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3; 
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man'; 
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'blue') AND hair_colour_id = (SELECT id FROM colour WHERE colour = 'brown'); 
SELECT publisher_name FROM publisher JOIN superhero ON superhero.publisher_id = publisher.id WHERE superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy') GROUP BY publisher_name; 
SELECT COUNT(*) FROM superhero WHERE publisher_id IS NULL OR publisher_id = 1; 
SELECT      ROUND((SUM(CASE WHEN eye_colour_id = 7 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_of_blue_eyed_superheroes FROM superhero; 
SELECT     (SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END)) AS male_female_ratio FROM superhero WHERE gender_id IN (1, 2); 
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero); 
SELECT id FROM superpower WHERE power_name = 'cryokinesis'; 
SELECT superhero_name FROM superhero WHERE id = 294; 
SELECT superhero.full_name FROM superhero WHERE superhero.weight_kg = 0 OR superhero.weight_kg IS NULL; 
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan'; 
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr'; 
SELECT race FROM superhero WHERE weight_kg = 108 AND height_cm = 188 AND race_id = (     SELECT id     FROM race     WHERE race = 'Specific Race Name' -- Replace 'Specific Race Name' with the actual race name you are looking for ) 
SELECT p.publisher_name FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE s.id = 38; 
SELECT s.race FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute) 
SELECT a.alignment, GROUP_CONCAT(sp.power_name SEPARATOR ', ') AS superpowers FROM superhero su JOIN alignment a ON su.alignment_id = a.id JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.superhero_name = 'Atom IV' GROUP BY a.alignment 
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' LIMIT 5; 
SELECT AVG(ha.attribute_value) FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.alignment_id = 3 
SELECT s.superhero_name, c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = 100 GROUP BY s.superhero_name, c.colour 
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND alignment_id = 1; 
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value BETWEEN 75 AND 80 
SELECT s.race_id FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour h ON s.hair_colour_id = h.id WHERE g.gender = 'male' AND h.colour = 'blue'; 
SELECT      ROUND(         (SUM(CASE WHEN gender.id = 2 THEN 1 ELSE 0 END) / SUM(CASE WHEN alignment.id = 2 THEN 1 ELSE 0 END)) * 100.0,          2     ) AS percentage_female_bad_heroes FROM      superhero JOIN      gender ON superhero.gender_id = gender.id JOIN      alignment ON superhero.alignment_id = alignment.id WHERE      alignment.id = 2; 
SELECT      (SUM(CASE WHEN c.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN c.id = 1 THEN 1 ELSE 0 END)) AS eye_difference FROM      superhero s LEFT JOIN      colour c ON s.eye_colour_id = c.id WHERE      s.weight_kg IS NULL OR s.weight_kg = 0; 
SELECT attribute_value FROM hero_attribute JOIN attribute ON attribute.id = hero_attribute.attribute_id JOIN superhero ON superhero.id = hero_attribute.hero_id WHERE attribute_name = 'Strength' AND superhero_name = 'Hulk' 
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Ajax'; 
SELECT COUNT(*) FROM superhero WHERE skin_colour_id IN (SELECT id FROM colour WHERE colour = 'Green') AND alignment_id IN (SELECT id FROM alignment WHERE alignment = 'Bad'); 
SELECT COUNT(*)  FROM superhero  WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') 
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero_name ASC; 
SELECT s.gender FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force'; 
SELECT superhero_name FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') ORDER BY weight_kg DESC LIMIT 1; 
SELECT AVG(height_cm) AS average_height FROM superhero WHERE race <> 'Human' AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics'); 
SELECT superhero_name, full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed' AND attribute_value = 100 ORDER BY superhero.height_cm DESC, superhero.weight_kg ASC LIMIT 1; 
SELECT      CASE          WHEN SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) >               SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)          THEN SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) -               SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)         ELSE SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) -               SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END)     END AS difference FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id 
SELECT attribute.attribute_name, MIN(hero_attribute.attribute_value) as min_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero.superhero_name = 'Black Panther' GROUP BY attribute.attribute_name ORDER BY min_value LIMIT 1; 
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Abomination' 
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1; 
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'; 
SELECT      ROUND(         (SUM(CASE WHEN s.gender_id = (SELECT id FROM gender WHERE gender = 'Female')                    AND p.publisher_name = 'George Lucas' THEN 1 ELSE 0 END)           / COUNT(*)) * 100, 2) AS percentage_female_superheroes FROM superhero s JOIN publisher p ON s.publisher_id = p.id 
SELECT      ROUND(         (SUM(CASE WHEN alignment_id = (SELECT id FROM alignment WHERE alignment = 'Good') THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2     ) AS percentage_good_heroes FROM      superhero WHERE      publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') 
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'; 
SELECT hero_id FROM hero_attribute ORDER BY attribute_value LIMIT 1; 
SELECT full_name FROM superhero WHERE superhero_name = 'Alien' 
SELECT superhero.full_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id WHERE superhero.weight_kg < 100 AND eye_colour.colour = 'brown'; 
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy'; 
SELECT weight_kg, race FROM superhero WHERE id = 40; 
SELECT AVG(height_cm) AS average_height FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral'); 
SELECT hp.hero_id FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Intelligence'; 
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Blackwulf' 
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero) 
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 18 AND q.q1 = (     SELECT MAX(q1)     FROM qualifying q2     WHERE q2.raceId = r.raceId AND q2.q1 IS NOT NULL     GROUP BY q2.raceId     ORDER BY MAX(q2.q1) DESC     LIMIT 5 ) 
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19) 
SELECT DISTINCT s.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN seasons s ON r.year = s.year WHERE c.name = 'Shanghai'; 
SELECT c.url FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya' 
SELECT r.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'Germany' 
SELECT c.name, r.position, r.positionText FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN constructorResults cr ON r.raceId = cr.raceId JOIN constructors cs ON cr.constructorId = cs.constructorId WHERE cs.name = 'Renault'; 
SELECT COUNT(raceId) AS NumberOfRaces FROM races WHERE year = 2010 AND circuitRef NOT IN (     SELECT circuitRef     FROM circuits     WHERE country = 'Asia' OR country = 'Europe' ) 
SELECT DISTINCT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain' 
SELECT lat, lng FROM circuits WHERE name = 'Australian Grand Prix' 
SELECT races.url FROM races JOIN circuits ON circuits.circuitId = races.circuitId WHERE circuits.name = 'Sepang International Circuit'; 
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit'; 
SELECT lat, lng  FROM circuits  WHERE name = 'Abu Dhabi Grand Prix'; 
SELECT constructors.country FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId JOIN races ON constructorResults.raceId = races.raceId WHERE constructorResults.points = 1 AND races.raceId = 24; 
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Senna' AND forename = 'Bruno') AND raceId = (SELECT raceId FROM races WHERE raceId = 354 AND year = (SELECT year FROM races WHERE raceId = 354)) AND position = 1; 
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '0:01:40' AND q.raceId = 355; 
SELECT d.number FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q3 = '0:01:54' AND q.raceId = 903; 
SELECT COUNT(DISTINCT r.driverId) FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Bahrain Grand Prix' AND ra.year = 2007 AND r.statusId = (SELECT statusId FROM status WHERE status = 'Not Classified') AND r.position IS NULL; 
SELECT s.year, s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901; 
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29' AND time IS NOT NULL) 
SELECT d.driverId, d.surname, d.forename, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1; 
SELECT d.driverRef, d.url FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE lt.milliseconds = 8727 AND r.raceId = 161; 
SELECT drivers.nationality FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN (     SELECT raceId, MAX(fastestLapSpeed) AS max_speed     FROM results     WHERE raceId = 933     GROUP BY raceId ) AS fastest_lap ON results.raceId = fastest_lap.raceId AND results.fastestLapSpeed = fastest_lap.max_speed WHERE results.resultId = (     SELECT resultId     FROM results     WHERE raceId = 933     ORDER BY fastestLapSpeed DESC     LIMIT 1 ); 
SELECT c.name, c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Malaysian Grand Prix'; 
SELECT constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId JOIN races ON constructorStandings.raceId = races.raceId WHERE races.raceId = 9 AND constructorStandings.points = (     SELECT MAX(points)     FROM constructorStandings     JOIN races ON constructorStandings.raceId = races.raceId     WHERE races.raceId = 9 ) 
SELECT q1 FROM qualifying JOIN drivers ON drivers.driverId = qualifying.driverId WHERE drivers.surname = 'di Grassi' AND drivers.forename = 'Lucas' AND qualifying.raceId = (SELECT raceId FROM races WHERE raceId = 345) AND qualifying.q1 IS NOT NULL; 
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '00:01:15' AND q.raceId = (SELECT raceId FROM races WHERE raceId = 347); 
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 45 AND q.q3 = '0:01:33'; 
SELECT      r.positionText AS finish_position,      res.time AS finish_time,      res.milliseconds AS finish_milliseconds FROM      results res JOIN      drivers d ON res.driverId = d.driverId WHERE      d.surname = 'McLaren' AND      d.forename = 'Bruce' AND      res.raceId = (SELECT raceId FROM races WHERE raceId = 743); 
SELECT d.surname, d.forename FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2; 
SELECT seasons.year FROM races JOIN seasons ON races.year = seasons.year WHERE races.raceId = 901; 
SELECT COUNT(DISTINCT driverId) AS finished_drivers FROM results WHERE raceId IN (     SELECT raceId     FROM races     WHERE date = '2015-11-29' ) AND positionText NOT IN ('Did Not Start', 'Did Not Qualify', 'Retired') 
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId = 872 AND r.milliseconds IS NOT NULL ORDER BY d.dob DESC LIMIT 1; 
SELECT d.surname || ' ' || d.forename AS driver_full_name FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.raceId = 348 AND lt.time = (SELECT MIN(time) FROM lapTimes WHERE raceId = 348) 
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLap IS NOT NULL AND r.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)     FROM results     WHERE raceId = (SELECT raceId FROM results WHERE resultId = 348) ) 
SELECT      (SUBTRACT(race_853.fastestLapSpeed, race_854.fastestLapSpeed) / race_853.fastestLapSpeed) * 100 AS percentage FROM      (         SELECT              fastestLapSpeed          FROM              results          JOIN races ON results.raceId = races.raceId          WHERE              results.driverId = (SELECT driverId FROM drivers WHERE name = 'Paul di Resta')              AND races.raceId = (SELECT raceId FROM races WHERE number = 853)     ) AS race_853,     (         SELECT              fastestLapSpeed          FROM              results          JOIN races ON results.raceId = races.raceId          WHERE              results.driverId = (SELECT driverId FROM drivers WHERE name = 'Paul di Resta')              AND races.raceId = (SELECT raceId FROM races WHERE number = 854)     ) AS race_854; 
SELECT      (COUNT(DISTINCT r.driverId) FILTER (WHERE r.time IS NOT NULL) /       COUNT(DISTINCT r.driverId)) * 100 AS raceCompletionRate FROM      results r JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.date = '1983-07-16' 
SELECT MIN(year) AS first_Singapore_Grand_Prix_year FROM races WHERE name = 'Singapore Grand Prix'; 
SELECT COUNT(*) AS total_races,         GROUP_CONCAT(name ORDER BY name DESC SEPARATOR ', ') AS races_list FROM races WHERE year = 2005 
SELECT r.name AS FirstRaceName,         r.year,         r.month,         r.date,         r.name AS OtherRaceName FROM races AS r1 JOIN (     SELECT year, month, MIN(date) AS MinDate     FROM races     GROUP BY year, month ) AS MinDateRace ON r1.year = MinDateRace.year AND r1.month = MinDateRace.month AND r1.date = MinDateRace.MinDate UNION SELECT r.name,         r.year,         r.month,         r.date,         r.name FROM races AS r WHERE r.year = MinDateRace.year AND r.month = MinDateRace.month AND r.date != MinDateRace.MinDate ORDER BY r.year, r.month, r.date; 
SELECT c.name, r.date  FROM races AS r  JOIN circuits AS c ON r.circuitId = c.circuitId  WHERE r.year = 1999 AND r.round = (SELECT MAX(round) FROM races WHERE year = 1999); 
SELECT s.year, COUNT(r.round) AS race_count FROM seasons s JOIN races r ON s.year = r.year GROUP BY s.year ORDER BY race_count DESC LIMIT 1; 
SELECT r.name FROM races r WHERE r.year = 2017 AND NOT EXISTS (     SELECT 1     FROM races r2     WHERE r2.year = 2000     AND r.circuitId = r2.circuitId ) 
SELECT circuits.name AS CircuitName, circuits.location AS CircuitLocation FROM circuits JOIN races ON circuits.circuitId = races.circuitId JOIN seasons ON races.year = seasons.year WHERE seasons.url = 'european-grand-prix' ORDER BY seasons.year LIMIT 1; 
SELECT MAX(year) as lastSeason FROM races WHERE name = 'British Grand Prix' AND circuitRef = 'Brands Hatch'; 
SELECT COUNT(DISTINCT s.year) AS numberOfSeasons FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE c.name = 'Silverstone Circuit' AND r.name = 'British Grand Prix'; 
SELECT d.surname, d.forename, ds.position FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2010 AND r.name = 'Singapore Grand Prix' ORDER BY ds.position; 
SELECT d.forename, d.surname, ds.points FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId WHERE ds.points = (SELECT MAX(points) FROM driverStandings) 
SELECT d.surname, d.forename, ds.points FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3; 
SELECT d.surname AS driver, r.name AS race_name, lt.time AS lap_time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes ) 
SELECT AVG(milliseconds) as average_lap_time FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Vettel' AND forename = 'Sebastian') AND raceId IN (SELECT raceId FROM races WHERE year = 2009 AND name = 'Chinese Grand Prix'); 
SELECT      (COUNT(CASE WHEN d.surname = 'Hamilton' AND r.position > 1 THEN r.raceId END) * 100.0) /      COUNT(CASE WHEN d.surname = 'Hamilton' THEN r.raceId END) AS percentage FROM      results r JOIN      drivers d ON r.driverId = d.driverId WHERE      r.position > 1 AND d.surname = 'Hamilton' AND r.year >= 2010; 
SELECT d.surname, d.nationality, AVG(dr.points) AS average_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN (     SELECT driverId, SUM(wins) AS total_wins     FROM driverStandings     GROUP BY driverId     ORDER BY total_wins DESC     LIMIT 1 ) AS most_wins ON d.driverId = most_wins.driverId JOIN results r ON d.driverId = r.driverId WHERE ds.points IS NOT NULL GROUP BY d.driverId ORDER BY total_wins DESC LIMIT 1; 
SELECT      d.surname,      d.forename,      (2022 - EXTRACT(YEAR FROM d.dob) - (CASE WHEN EXTRACT(MONTH FROM d.dob) > 7 THEN 1 ELSE 0 END)) AS age FROM      drivers d WHERE      d.nationality = 'Japanese' ORDER BY      d.dob ASC LIMIT 1; 
SELECT DISTINCT c.circuitRef, c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.circuitRef, c.name HAVING COUNT(r.raceId) = 4; 
SELECT c.name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006; 
SELECT r.name AS raceName, c.name AS circuitName, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005; 
SELECT r.name AS race_name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Yoong' AND d.forename = 'Alex' AND res.position < 10; 
SELECT COUNT(*) FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId JOIN circuits ci ON cs.raceId IN (SELECT raceId FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit')) JOIN drivers d ON c.constructorId = d.constructorId WHERE d.surname = 'Schumacher' AND cs.wins > 0 
SELECT r.name AS race_name, r.year AS race_year FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Schumacher' AND res.milliseconds = (     SELECT MIN(milliseconds)     FROM results     WHERE driverId = d.driverId ) 
SELECT AVG(points) FROM driverStandings JOIN drivers ON driverStandings.driverId = drivers.driverId JOIN races ON driverStandings.raceId = races.raceId WHERE drivers.surname = 'Irvine' AND drivers.forename = 'Eddie' AND races.year = 2000; 
SELECT r.name AS raceName, rs.points FROM races r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId JOIN constructors c ON ds.constructorId = c.constructorId WHERE d.surname = 'Hamilton' AND d.forename = 'Lewis' AND ds.points IS NOT NULL ORDER BY r.year ASC LIMIT 1; 
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date; 
SELECT r.name AS raceName, s.year AS raceYear, c.location AS circuitLocation, MAX(r.laps) AS maxLaps FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN (     SELECT raceId, SUM(laps) AS laps     FROM results     GROUP BY raceId ) AS maxLapsRaces ON r.raceId = maxLapsRaces.raceId WHERE maxLapsRaces.laps = (     SELECT MAX(laps)     FROM results     GROUP BY raceId ) 
SELECT      (COUNT(CASE WHEN c.name = 'Germany' THEN 1 END) * 100.0) / COUNT(c.name) AS percentage_of_german_grand_prix FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId WHERE      r.name = 'European Grand Prix' AND      c.country = 'Germany' 
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit' 
SELECT      c1.name AS CircuitName,     c1.lat AS Latitude FROM      circuits c1 WHERE      c1.name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY      c1.lat DESC LIMIT 1; 
SELECT circuitRef  FROM circuits  WHERE name = 'Marina Bay Street Circuit'; 
SELECT c.country FROM circuits c WHERE c.alt = (SELECT MAX(alt) FROM circuits); 
SELECT COUNT(*) FROM drivers WHERE code IS NULL; 
SELECT d.nationality FROM drivers d JOIN (     SELECT MIN(dob) AS min_dob     FROM drivers ) AS oldest_driver ON d.dob = oldest_driver.min_dob 
SELECT surname FROM drivers WHERE nationality = 'italian' 
SELECT url  FROM drivers  WHERE surname = 'Davidson' AND forename = 'Anthony'; 
SELECT driverRef FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis'; 
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.year = 2009 AND r.name = 'Spanish Grand Prix'; 
SELECT DISTINCT s.year FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId JOIN seasons AS s ON r.year = s.year WHERE c.name = 'Silverstone Circuit'; 
SELECT      c.name AS circuit_name,      c.url AS circuit_url,      r.year,      r.round,      r.name AS race_name,      r.date,      r.time,      r.url AS race_url FROM      circuits c JOIN      races r ON c.circuitId = r.circuitId WHERE      c.name = 'Silverstone Circuit' 
SELECT r.name, r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year BETWEEN 2010 AND 2019 AND c.name = 'Abu Dhabi Circuit'; 
SELECT COUNT(DISTINCT r.raceId) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy'; 
SELECT DISTINCT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Barcelona-Catalunya' 
SELECT url FROM circuits WHERE name = 'Spanish Grand Prix' AND year = 2009 
SELECT MIN(fastestLapTime) AS fastestLapTime FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' 
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN qualifying q ON r.driverId = q.driverId WHERE q.fastestLapTime = (SELECT MIN(q2) FROM qualifying WHERE q2 IS NOT NULL) 
SELECT d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND r.position = 1; 
SELECT DISTINCT r.name AS race_name, r.date, r.time FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Hamilton' AND d.forename = 'Lewis'; 
SELECT r.name AS raceName, d.surname AS driverSurname, MIN(r.rank) AS lowestRank FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Hamilton' GROUP BY r.name ORDER BY lowestRank ASC LIMIT 1; 
SELECT MAX(fastestLapSpeed) AS fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix' 
SELECT DISTINCT s.year FROM seasons s JOIN races r ON s.year = r.year JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Hamilton' AND d.forename = 'Lewis' 
SELECT      r.rank  FROM      results r  JOIN      drivers d ON r.driverId = d.driverId  JOIN      races ra ON r.raceId = ra.raceId  WHERE      d.surname = 'Hamilton'      AND d.forename = 'Lewis'      AND ra.year = 2008      AND ra.name = 'Australian Grand Prix'      AND r.positionOrder = (         SELECT MAX(positionOrder)          FROM results          WHERE raceId = r.raceId          AND driverId = r.driverId     ) 
SELECT d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.grid = 4 AND r.raceId IN (     SELECT raceId     FROM races     WHERE year = 2008 AND name = 'Australian Grand Prix' ) 
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix'  AND r.time IS NOT NULL; 
SELECT MIN(milliseconds) AS fastestLapTime FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE drivers.surname = 'Hamilton' AND drivers.forename = 'Lewis' AND races.year = 2008 AND races.name = 'Australian Grand Prix' 
SELECT r.time FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.positionOrder = 2 ORDER BY r.positionOrder ASC LIMIT 1; 
SELECT d.surname, d.forename, d.url FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND s.status = 'Finished' AND r.time LIKE 'HH:%' 
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE d.nationality = 'American' AND r.year = 2008 AND r.name = 'Australian Grand Prix'; 
SELECT      r.driverId,      d.name AS driverName,      COUNT(DISTINCT r.raceId) AS totalRacesParticipated FROM      results r JOIN      drivers d ON r.driverId = d.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.year = 2008 AND      ra.name = 'Australian Grand Prix' AND      r.positionText IS NOT NULL GROUP BY      r.driverId, d.name HAVING      COUNT(DISTINCT r.raceId) > 0 
SELECT SUM(points) as total_points FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' AND drivers.forename = 'Lewis'; 
SELECT AVG(     EXTRACT(EPOCH FROM TIMESTAMP('00:00:00' || SUBSTR(fastestLapTime, 3, 2) || ':' || SUBSTR(fastestLapTime, 6, 2) || '.' || SUBSTR(fastestLapTime, 9, 3))) ) AS average_fastest_lap_time_seconds FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' AND drivers.forename = 'Lewis'; 
SELECT      (COUNT(CASE WHEN r.time IS NOT NULL THEN r.raceId END) * 1.0) / COUNT(r.raceId) AS completion_rate FROM      results r JOIN      races r2 ON r.raceId = r2.raceId WHERE      r2.year = 2008 AND      r2.name = 'Australian Grand Prix'; 
SELECT     ((         (TIME_TO_SEC(T2.time) - TIME_TO_SEC(T1.time)) / TIME_TO_SEC(T1.time)     ) * 100) AS percentage_faster FROM     results T1 JOIN     results T2 ON T1.raceId = T2.raceId JOIN     races T3 ON T1.raceId = T3.raceId WHERE     T3.year = 2008 AND     T3.name = 'Australian Grand Prix' AND     T1.positionOrder = 1 AND     T2.positionOrder = (         SELECT MAX(positionOrder)         FROM results         WHERE raceId = T1.raceId     ) AND     T1.time IS NOT NULL 
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne'; 
SELECT c.name, c.lat, c.lng FROM circuits c WHERE c.country = 'USA'; 
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-01-01' 
SELECT AVG(points) as average_points FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE c.nationality = 'British' 
SELECT c.name, SUM(cr.points) AS total_points FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId GROUP BY c.name ORDER BY total_points DESC LIMIT 1; 
SELECT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId WHERE cs.points = 0 AND r.raceId = 291; 
SELECT COUNT(DISTINCT c.constructorId) FROM constructors AS c JOIN constructorStandings AS cs ON c.constructorId = cs.constructorId JOIN races AS r ON cs.raceId = r.raceId WHERE c.nationality = 'Japanese' AND cs.points = 0 GROUP BY c.constructorId HAVING COUNT(DISTINCT cs.raceId) = 2 
SELECT c.name AS ConstructorName FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1; 
SELECT COUNT(DISTINCT c.constructorId) FROM constructors c JOIN driverStandings ds ON c.constructorId = ds.constructorId JOIN drivers d ON ds.driverId = d.driverId WHERE d.nationality = 'French' AND ds.laps > 50; 
SELECT     (COUNT(CASE WHEN drivers.nationality = 'Japanese' THEN results.driverId END AND results.time IS NOT NULL) * 100.0) /      COUNT(CASE WHEN drivers.nationality = 'Japanese' THEN results.driverId END) FROM     results JOIN drivers ON results.driverId = drivers.driverId WHERE     results.raceId IN (         SELECT raceId         FROM races         WHERE year BETWEEN 2007 AND 2009     ) 
SELECT      r.year,      AVG(TIME_TO_SEC(time)) AS avg_time_seconds FROM      results AS res JOIN      races AS r ON res.raceId = r.raceId JOIN      driverStandings AS ds ON res.driverId = ds.driverId AND res.raceId = ds.raceId WHERE      res.positionText = '1' AND     ds.position = 1 AND     res.time IS NOT NULL GROUP BY      r.year; 
SELECT d.forename, d.surname FROM drivers d WHERE d.dob > '1975-01-01' AND EXISTS (     SELECT 1     FROM driverStandings ds     WHERE ds.driverId = d.driverId     AND ds.position = 2 ) 
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN constructors c ON ds.constructorId = c.constructorId WHERE d.nationality = 'Italian' AND ds.position IS NULL; 
SELECT d.forename, d.surname, MIN(lt.milliseconds) as fastest_lap_time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId GROUP BY d.driverId ORDER BY fastest_lap_time LIMIT 1; 
SELECT lt.raceId, lt.driverId, lt.lap FROM lapTimes lt JOIN (     SELECT ds.driverId, ds.points     FROM driverStandings ds     JOIN races r ON ds.raceId = r.raceId     WHERE r.year = 2009 AND ds.points = (         SELECT MAX(points)         FROM driverStandings ds2         JOIN races r2 ON ds2.raceId = r2.raceId         WHERE r2.year = 2009     ) ) AS champion ON lt.driverId = champion.driverId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes lt2     JOIN driverStandings ds2 ON lt2.driverId = ds2.driverId     JOIN races r2 ON lt2.raceId = r2.raceId     WHERE r2.year = 2009 AND ds2.points = champion.points ) 
SELECT AVG(fastestLapSpeed) AS averageFastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix' AND YEAR(races.year) = 2009; 
SELECT      r.name,      r.year FROM      races r JOIN      results res ON r.raceId = res.raceId WHERE      res.milliseconds IS NOT NULL GROUP BY      r.raceId ORDER BY      MIN(res.milliseconds) ASC LIMIT 1; 
SELECT      (COUNT(CASE WHEN d.dob < '1985-01-01' AND lt.lap > 50 THEN dr.driverId END) * 100.0)      / COUNT(DISTINCT dr.driverId) AS percentage FROM      drivers dr JOIN      lapTimes lt ON dr.driverId = lt.driverId JOIN      races r ON lt.raceId = r.raceId WHERE      r.year BETWEEN 2000 AND 2005; 
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.milliseconds < 120 * 60; -- 02:00.00 is 120 seconds 
SELECT code FROM drivers WHERE nationality = 'America' 
SELECT raceId  FROM races  WHERE year = 2009; 
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId = 18; 
SELECT d.driverId, d.number, d.code FROM drivers d JOIN (     SELECT MIN(YEAR(dob)) as youngest_year     FROM drivers ) as min_age ON YEAR(d.dob) = min_age.youngest_year WHERE d.nationality = 'Dutch' ORDER BY d.dob DESC LIMIT 3; 
SELECT driverRef  FROM drivers  WHERE surname = 'Kubica' AND forename = 'Robert'; 
SELECT COUNT(*) FROM drivers WHERE nationality = 'Australian' AND EXTRACT(YEAR FROM dob) = 1980; 
SELECT d.driverId, d.forename, d.surname, MIN(lt.time) AS minLapTime FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY d.driverId, d.forename, d.surname ORDER BY minLapTime ASC LIMIT 3; 
SELECT d.driverRef FROM drivers d WHERE d.nationality = 'German' ORDER BY d.dob LIMIT 1; 
SELECT d.driverId, d.code FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.dob = '1971-01-01' AND lt.fastestLap = 1; 
SELECT      d.driverId,      d.forename,      d.surname,      d.nationality,      d.dob,     MAX(lt.time) AS latestLapTime FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId WHERE      d.nationality = 'Spanish' AND d.dob < '1982-01-01' GROUP BY      d.driverId, d.forename, d.surname, d.nationality, d.dob ORDER BY      latestLapTime DESC LIMIT      10; 
SELECT DISTINCT year FROM races JOIN results ON races.raceId = results.raceId WHERE results.fastestLapTime IS NOT NULL ORDER BY results.fastestLapTime ASC LIMIT 1; 
SELECT races.year, MAX(lapTimes.time) AS slowest_lap_time FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId GROUP BY races.year ORDER BY slowest_lap_time ASC LIMIT 1; 
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY milliseconds ASC LIMIT 5; 
SELECT COUNT(DISTINCT r.driverId) FROM results r JOIN status s ON r.statusId = s.statusId WHERE r.raceId > 50 AND r.raceId < 100   AND s.status = 'Disqualified'   AND r.time IS NOT NULL; 
SELECT      c.name,      c.location,      c.lat,      c.lng,      COUNT(r.circuitId) AS circuit_count FROM      circuits c JOIN      races r ON c.circuitId = r.circuitId WHERE      c.country = 'Austria' GROUP BY      c.circuitId 
SELECT      r.round  FROM      races r  JOIN      results rs ON r.raceId = rs.raceId  WHERE      rs.time IS NOT NULL  GROUP BY      r.round  ORDER BY      COUNT(rs.resultId) DESC  LIMIT 1 
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 23 AND q.q2 IS NOT NULL; 
SELECT s.year, r.name, r.date, r.time FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId JOIN (     SELECT MIN(year(dob)) AS min_year     FROM drivers ) AS youngest WHERE d.dob = youngest.min_year ORDER BY s.year LIMIT 1; 
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'Disqualified'; 
SELECT c.name, c.url FROM constructors AS c JOIN constructorStandings AS cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'Italian' ORDER BY cs.points DESC LIMIT 1; 
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId WHERE cs.wins = (     SELECT MAX(wins)     FROM constructorStandings ) GROUP BY c.url ORDER BY SUM(cs.wins) DESC LIMIT 1; 
SELECT d.driverId, d.surname, d.forename, lt.time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 ORDER BY lt.milliseconds DESC LIMIT 1; 
SELECT r.raceId, MIN(lt.time) AS fastestLapTime FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId WHERE lt.lap = 1 GROUP BY r.raceId ORDER BY fastestLapTime ASC LIMIT 1; 
SELECT AVG(T2.fastestLapTime) FROM results AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId AND T1.raceId = T2.raceId JOIN races AS T3 ON T1.raceId = T3.raceId JOIN drivers AS T4 ON T1.driverId = T4.driverId WHERE T3.year = 2006 AND T3.name = 'United States Grand Prix' AND T1.rank < 11 GROUP BY T1.driverId ORDER BY AVG(T2.fastestLapTime) ASC LIMIT 10 
SELECT      d.driverId,      d.surname,      d.forename,      d.nationality,      AVG(p.duration) AS avg_pitstop_duration FROM      drivers d JOIN      pitStops p ON d.driverId = p.driverId WHERE      d.nationality = 'German' AND      d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY      d.driverId, d.surname, d.forename, d.nationality ORDER BY      avg_pitstop_duration ASC LIMIT 5; 
SELECT d.surname, d.forename, r.time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2008 AND r.position = 1 AND r.time LIKE '%:%:%.%'; 
SELECT constructors.constructorRef, constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId JOIN races ON races.raceId = constructorStandings.raceId JOIN seasons ON seasons.year = races.year WHERE seasons.year = 2009 AND races.name = 'Singapore Grand Prix' AND constructorStandings.position = 1 ORDER BY constructorStandings.points DESC LIMIT 1 
SELECT d.forename, d.surname, d.dob FROM drivers d WHERE d.nationality = 'Austrian' AND d.dob BETWEEN '1981-01-01' AND '1991-12-31'; 
SELECT d.forename || ' ' || d.surname AS fullName,         d.url AS wikipediaLink,         d.dob AS dateOfBirth FROM drivers d WHERE d.nationality = 'German' AND d.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY d.dob DESC; 
SELECT location, country, lat, lng FROM circuits WHERE circuitRef = 'hungaroring'; 
SELECT      c.name,      c.nationality,      SUM(cr.points) AS total_points FROM      constructors c JOIN      constructorStandings cs ON c.constructorId = cs.constructorId JOIN      races r ON cs.raceId = r.raceId JOIN      seasons s ON r.year = s.year JOIN      constructorResults cr ON cs.raceId = cr.raceId AND c.constructorId = cr.constructorId WHERE      r.name = 'Monaco Grand Prix'     AND s.year BETWEEN 1980 AND 2010 GROUP BY      c.name, c.nationality ORDER BY      total_points DESC LIMIT 1; 
SELECT AVG(points) AS average_score FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN circuits ON results.circuitId = circuits.circuitId WHERE drivers.surname = 'Hamilton' AND circuits.country = 'Turkey' 
SELECT AVG(COUNT(raceId)) AS average_races_per_year FROM races WHERE year BETWEEN 2000 AND 2010; 
SELECT nationality  FROM drivers  GROUP BY nationality  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT COUNT(DISTINCT cs.constructorId) FROM constructorStandings cs JOIN drivers d ON cs.constructorId = d.constructorId WHERE cs.points = 91 
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN (     SELECT raceId, MIN(fastestLapTime) AS minTime     FROM results     WHERE fastestLapTime IS NOT NULL     GROUP BY raceId ) AS minLap ON r.raceId = minLap.raceId WHERE minLap.minTime = res.fastestLapTime 
SELECT c.location || ', ' || c.country AS full_location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(date) FROM races) 
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2008 AND c.name = 'Marina Bay Street Circuit' AND q.position = 1 AND q.number = 3 AND q.q3 IS NOT NULL ORDER BY q.q3 ASC LIMIT 1; 
SELECT d.forename, d.surname, d.nationality, r.name AS raceName FROM drivers d JOIN (     SELECT MIN(dob) AS min_dob     FROM drivers ) AS youngest ON d.dob = youngest.min_dob JOIN results r ON d.driverId = r.driverId WHERE d.driverId = (     SELECT driverId     FROM results     JOIN races ON results.raceId = races.raceId     ORDER BY races.year ASC, r.positionOrder ASC     LIMIT 1 ); 
SELECT      (SELECT COUNT(*)       FROM results       JOIN status ON results.statusId = status.statusId       JOIN races ON results.raceId = races.raceId       WHERE status.status = 'Accident'         AND races.name = 'Canadian Grand Prix'        AND results.driverId =             (SELECT driverId              FROM results              JOIN status ON results.statusId = status.statusId              JOIN races ON results.raceId = races.raceId              WHERE status.status = 'Accident'                AND races.name = 'Canadian Grand Prix'             GROUP BY driverId              ORDER BY COUNT(*) DESC              LIMIT 1)) AS accidents 
SELECT d.forename, d.surname, SUM(CASE WHEN ds.wins > 0 THEN 1 ELSE 0 END) as total_wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN (     SELECT MIN(dob) as min_dob     FROM drivers ) as oldest_driver ON d.dob = oldest_driver.min_dob GROUP BY d.driverId ORDER BY total_wins DESC LIMIT 1; 
SELECT raceId, driverId, MAX(duration) AS max_duration FROM pitStops GROUP BY raceId, driverId ORDER BY max_duration DESC LIMIT 1; 
SELECT MIN(milliseconds) AS fastestLapTime FROM lapTimes WHERE milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes ); 
SELECT MAX(duration) AS longest_pit_stop_duration FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis') 
SELECT pitStops.lap FROM pitStops JOIN races ON pitStops.raceId = races.raceId JOIN drivers ON pitStops.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' AND races.year = 2011 AND races.name = 'Australian Grand Prix' ORDER BY pitStops.lap; 
SELECT      d.driverId,      d.surname,      d.forename,      p.raceId,      p.driverId,      p.stop,      p.lap,      p.duration FROM      pitStops p JOIN      races r ON p.raceId = r.raceId JOIN      drivers d ON p.driverId = d.driverId WHERE      r.year = 2011 AND      r.name = 'Australian Grand Prix'; 
SELECT d.surname, d.forename, lt.position, lt.time, lt.milliseconds FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE d.surname = 'Hamilton' AND d.forename = 'Lewis' AND lt.position = 1 ORDER BY lt.milliseconds ASC LIMIT 1; 
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes     JOIN races ON lapTimes.raceId = races.raceId     WHERE races.name LIKE '%Formula_1%' ) 
SELECT r.position FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId JOIN drivers d ON lt.driverId = d.driverId WHERE d.surname = 'Hamilton' AND r.name LIKE 'Formula_1%' ORDER BY lt.milliseconds LIMIT 1; 
SELECT      d.driverRef,      d.surname,      d.forename,      lt.time,      lt.milliseconds FROM      lapTimes lt JOIN      drivers d ON lt.driverId = d.driverId JOIN      races r ON lt.raceId = r.raceId JOIN      circuits c ON r.circuitId = c.circuitId WHERE      c.name = 'Austrian Grand Prix' AND     lt.milliseconds = (         SELECT              MIN(milliseconds)          FROM              lapTimes lt2         JOIN              races r2 ON lt2.raceId = r2.raceId         JOIN              circuits c2 ON r2.circuitId = c2.circuitId         WHERE              c2.name = 'Austrian Grand Prix'     ) ORDER BY      lt.milliseconds ASC LIMIT 1; 
SELECT      d.name AS driver_name,      c.name AS circuit_name,      lt.position,      lt.time,      lt.milliseconds FROM      lapTimes lt JOIN      drivers d ON lt.driverId = d.driverId JOIN      circuits c ON lt.raceId IN (SELECT raceId FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy')) WHERE      lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes WHERE driverId = lt.driverId AND raceId = lt.raceId) ORDER BY      c.name, d.name, lt.position; 
SELECT      r.name  FROM      races AS r  JOIN      circuits AS c ON r.circuitId = c.circuitId  JOIN      lapTimes AS lt ON r.raceId = lt.raceId  WHERE      c.name = 'Austrian Grand Prix'      AND lt.time = (SELECT MIN(time) FROM lapTimes WHERE raceId = r.raceId) 
SELECT      p.raceId,      p.driverId,      p.duration  FROM      pitStops p  JOIN      (SELECT          raceId,          MIN(time) AS fastestLapTime       FROM          lapTimes       WHERE          raceId IN (SELECT raceId FROM races WHERE name = 'Austrian Grand Prix')       GROUP BY          raceId) AS lr  ON      p.raceId = lr.raceId  JOIN      results r  ON      p.raceId = r.raceId      AND p.driverId = r.driverId  WHERE      r.position = 1      AND p.duration IS NOT NULL; 
SELECT c.lat, c.lng FROM circuits c JOIN lapTimes lt ON c.circuitId = lt.raceId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes     WHERE raceId = c.circuitId ) AND lt.milliseconds = 29488; 
SELECT AVG(pitStops.milliseconds) AS average_pit_stop_time FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton'; 
SELECT AVG(milliseconds) AS average_lap_time_milliseconds FROM lapTimes WHERE raceId IN (     SELECT raceId     FROM races     WHERE circuitId IN (         SELECT circuitId         FROM circuits         WHERE country = 'Italy'     ) ) 
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) 
SELECT p.player_name, p.height FROM Player p WHERE p.height = (SELECT MAX(height) FROM Player); 
SELECT pa.preferred_foot FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.potential = (SELECT MIN(potential) FROM Player_Attributes) 
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating BETWEEN 60 AND 65 AND pa.defensive_work_rate = 'low' AND pa.player_api_id IN (     SELECT DISTINCT pa.player_api_id     FROM Player_Attributes pa     WHERE pa.player_api_id = p.player_api_id     AND (pa.attacking_work_rate = 'high' OR pa.attacking_work_rate = 'very high') ) 
SELECT player_fifa_api_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5; 
SELECT League.name, SUM(home_team_goal + away_team_goal) AS total_goals FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016' GROUP BY League.id ORDER BY total_goals DESC LIMIT 1; 
SELECT home_team_api_id, COUNT(*) AS lost_matches FROM Match WHERE season = '2015/2016' AND (home_team_goal < away_team_goal) GROUP BY home_team_api_id ORDER BY lost_matches ASC LIMIT 1; 
SELECT P.player_name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE PA.penalties = (SELECT MAX(penalties) FROM Player_Attributes) ORDER BY P.penalties DESC LIMIT 10; 
SELECT      T.team_short_name,      SUM(CASE WHEN M.away_team_goal > M.home_team_goal THEN 1 ELSE 0 END) AS wins FROM      Match M JOIN      Team T ON M.away_team_api_id = T.team_api_id WHERE      M.season = '2009/2010'      AND M.league_id = (SELECT id FROM League WHERE name = 'Scotland Premier League') GROUP BY      T.team_short_name ORDER BY      wins DESC LIMIT 1; 
SELECT      T1.team_long_name,     T1.buildUpPlaySpeed FROM      Team_Attributes AS T1 INNER JOIN      (SELECT          team_fifa_api_id,          MAX(buildUpPlaySpeed) AS max_speed      FROM          Team_Attributes      GROUP BY          team_fifa_api_id      ORDER BY          max_speed DESC      LIMIT 4) AS T2 ON      T1.team_fifa_api_id = T2.team_fifa_api_id ORDER BY      T2.max_speed DESC; 
SELECT League.name, COUNT(*) as draw_matches FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016' AND Match.home_team_goal = Match.away_team_goal GROUP BY League.name ORDER BY draw_matches DESC LIMIT 1; 
SELECT      P.player_name,     TIMESTAMPDIFF(YEAR, P.birthday, CURRENT_DATE) AS current_age FROM      Player P JOIN      Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE      PA.sprint_speed >= 97     AND PA.date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00'; 
SELECT League.name, COUNT(Match.id) AS total_matches FROM League JOIN Match ON League.id = Match.league_id GROUP BY League.name ORDER BY total_matches DESC LIMIT 1 
SELECT AVG(height)  FROM Player  WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'; 
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' GROUP BY player_api_id HAVING overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') ORDER BY overall_rating DESC LIMIT 1; 
SELECT team_fifa_api_id  FROM Team_Attributes  WHERE buildUpPlaySpeed BETWEEN 51 AND 59; 
SELECT T.team_long_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayPassing IS NOT NULL AND TA.buildUpPlayPassing >      (SELECT AVG(TA.buildUpPlayPassing)      FROM Team_Attributes TA      JOIN Team T ON TA.team_api_id = T.team_api_id      WHERE strftime('%Y', TA.date) = '2012' AND TA.buildUpPlayPassing IS NOT NULL) AND strftime('%Y', TA.date) = '2012' 
SELECT      (SUM(CASE WHEN `Player_Attributes`.`preferred_foot` = 'left' THEN 1 ELSE 0 END) * 1.0) / COUNT(`Player`.`player_fifa_api_id`) AS `left_foot_percentage` FROM      `Player` JOIN      `Player_Attributes` ON `Player`.`player_api_id` = `Player_Attributes`.`player_api_id` WHERE      `Player_Attributes`.`preferred_foot` = 'left'      AND `Player`.`birthday` BETWEEN '1987-01-01' AND '1992-12-31' 
SELECT      L.name AS league_name,     SUM(M.home_team_goal + M.away_team_goal) AS total_goals FROM      League L JOIN      Match M ON L.id = M.league_id GROUP BY      L.name ORDER BY      total_goals ASC LIMIT 5; 
SELECT AVG(long_shots) AS average_long_shots FROM Player_Attributes WHERE player_fifa_api_id = (     SELECT player_fifa_api_id     FROM Player     WHERE player_name = 'Ahmed Samir Farag' ); 
SELECT P.player_name, AVG(PA.heading_accuracy) AS avg_heading_accuracy FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 GROUP BY P.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10; 
SELECT team_long_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE buildUpPlayDribblingClass = 'Normal' AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY chanceCreationPassing ASC; 
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2009/2010' GROUP BY League.name HAVING AVG(Match.home_team_goal) > AVG(Match.away_team_goal) 
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers' 
SELECT p.player_name FROM Player p WHERE substr(p.birthday, 1, 4) = '1970' AND substr(p.birthday, 6, 2) = '10'; 
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_name` = 'Franco Zennaro'; 
SELECT      Team_Attributes.buildUpPlayPositioningClass FROM      Team_Attributes JOIN      Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE      Team.team_long_name = 'ADO Den Haag' 
SELECT `Player_Attributes.heading_accuracy` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Francois Affolter' AND `Player_Attributes.date` = '2014-09-18 00:00:00'; 
SELECT `overall_rating` FROM `Player_Attributes` WHERE `player_fifa_api_id` = (     SELECT `player_fifa_api_id`     FROM `Player`     WHERE `player_name` = 'Gabriel Tamas' ) AND strftime('%Y', `date`) = '2011'; 
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016'; 
SELECT `Player_Attributes`.`preferred_foot` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id` WHERE `Player`.`birthday` = (     SELECT MIN(`birthday`)     FROM `Player` ) 
SELECT p.player_name, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes) 
SELECT COUNT(*) FROM Player WHERE weight < 130 AND `player_api_id` IN (     SELECT player_api_id     FROM Player_Attributes     WHERE preferred_foot = 'left' ) 
SELECT team_short_name FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team_Attributes.chanceCreationPassingClass = 'Risky' 
SELECT `defensive_work_rate` FROM `Player_Attributes` WHERE `player_api_id` = (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'David Wilson' ) 
SELECT p.birthday FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) 
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Netherlands'; 
SELECT AVG(home_team_goal)  FROM Match  WHERE country_id = (SELECT id FROM Country WHERE name = 'Poland')  AND season = '2010/2011'; 
SELECT      p.player_name,      pa.average_finishing FROM      Player p JOIN      (SELECT          player_api_id,          AVG(finishing) AS average_finishing      FROM          Player_Attributes pa      JOIN          Player p ON pa.player_api_id = p.player_api_id      WHERE          p.height BETWEEN (SELECT MAX(height) FROM Player) AND (SELECT MIN(height) FROM Player)      GROUP BY          pa.player_api_id     ) pa ON p.player_api_id = pa.player_api_id ORDER BY      pa.average_finishing DESC LIMIT 1; 
SELECT p.player_name FROM Player p WHERE p.height > 180; 
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990' 
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam %' AND weight > 170; 
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010' 
SELECT `overall_rating` + `potential` AS `potential_score` FROM `Player_Attributes` WHERE `player_api_id` IN (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Aaron Doran' ) 
SELECT player_name FROM Player WHERE preferred_foot = 'left'; 
SELECT DISTINCT T.team_long_name FROM Team_Attributes AS TA JOIN Team AS T ON TA.team_api_id = T.team_api_id WHERE TA.buildUpPlaySpeedClass = 'Fast'; 
SELECT Team_Attributes.buildUpPlayPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_short_name = 'CLB'; 
SELECT t.team_short_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlayPassing > 70 
SELECT AVG(overall_rating) AS average_rating FROM Player_Attributes WHERE strftime('%Y', date) BETWEEN '2010' AND '2015' AND (SELECT height FROM Player WHERE Player_Attributes.player_api_id = Player.player_api_id) > 170 
SELECT player_name, height FROM Player ORDER BY height ASC LIMIT 1; 
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Italy Serie A'; 
SELECT team_short_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32; 
SELECT AVG(overall_rating)  FROM Player_Attributes  WHERE player_api_id = (     SELECT player_api_id      FROM Player      WHERE player_name = 'Aaron Doran' ) 
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10'; 
SELECT T.team_short_name FROM Team T JOIN Match M ON T.team_api_id = M.home_team_api_id WHERE M.home_team_goal = 10 
SELECT P.player_name, PA.balance, PA.potential FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE PA.potential = 61 AND PA.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61); 
SELECT      (AVG(PA1.ball_control) - AVG(PA2.ball_control)) AS ball_control_difference FROM      Player_Attributes PA1 JOIN      Player P1 ON PA1.player_api_id = P1.player_api_id JOIN      Player_Attributes PA2 ON PA2.player_api_id = P2.player_api_id JOIN      Player P2 ON PA2.player_api_id = P2.player_api_id WHERE      P1.player_name = 'Abdou Diallo' AND      P2.player_name = 'Aaron Appindangoye'; 
SELECT team_long_name  FROM Team  WHERE team_short_name = 'GEN'; 
SELECT      p1.player_name AS PlayerName,      p1.birthday AS Birthday FROM      Player p1 JOIN      Player p2 ON p1.player_api_id = p2.player_api_id WHERE      p1.player_name = 'Aaron Lennon' AND      p2.player_name = 'Abdelaziz Barrada' AND      p1.birthday < p2.birthday 
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player); 
SELECT COUNT(DISTINCT pa.player_api_id) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.preferred_foot = 'left' AND pa.attacking_work_rate = 'low'; 
SELECT c.name AS CountryName FROM Country c JOIN League l ON c.id = l.country_id WHERE l.name = 'Belgium Jupiler League'; 
SELECT name  FROM League  WHERE country_id = (SELECT id FROM Country WHERE name = 'Germany'); 
SELECT      p.player_name,      pa.overall_rating FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE      pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) 
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high' AND pa.preferred_foot = 'left' -- Assuming 'left' is the position and 'high' is the defense 
SELECT p.player_name, pa.crossing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY pa.crossing DESC LIMIT 3 
SELECT heading_accuracy FROM Player_Attributes WHERE player_api_id IN (     SELECT player_api_id     FROM Player     WHERE player_name = 'Ariel Borysiuk' ) 
SELECT COUNT(*) FROM Player_Attributes WHERE `volleys` > 70 AND (SELECT `height` FROM Player WHERE Player_Attributes.player_api_id = Player.player_api_id) > 180 
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70; 
SELECT COUNT(*) FROM Match WHERE season = '2008/2009' AND country_id = (SELECT id FROM Country WHERE name = 'Belgium'); 
SELECT pa.long_passing FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id ORDER BY p.birthday ASC LIMIT 1; 
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Belgium Jupiler League' AND strftime('%Y', date) = '2009' AND strftime('%m', date) = '04'; 
SELECT League.name, COUNT(*) AS match_count FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2008/2009' GROUP BY League.name ORDER BY match_count DESC LIMIT 1 
SELECT AVG(`overall_rating`) AS avg_overall_rating FROM `Player_Attributes` WHERE strftime('%Y', `birthday`) < '1986'; 
SELECT     ROUND(         (p1.overall_rating - p2.overall_rating) / p2.overall_rating * 100,         2     ) AS percentage_difference FROM     Player_Attributes p1 JOIN     Player_Attributes p2 ON p1.player_api_id = p2.player_api_id WHERE     p1.player_name = 'Ariel Borysiuk' AND p2.player_name = 'Paulin Puel' 
SELECT AVG(`buildUpPlaySpeed`)  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id  WHERE Team.team_long_name = 'Heart of Midlothian'; 
SELECT AVG(T1.overall_rating)  FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino' 
SELECT SUM(T1.crossing) AS total_crossing_score FROM Player_Attributes T1 JOIN Player T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox' 
SELECT MAX(`chanceCreationPassing`) AS highest_chance_creation_passing_score, `chanceCreationPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Ajax' 
SELECT preferred_foot  FROM Player_Attributes  WHERE player_api_id IN (     SELECT player_api_id      FROM Player      WHERE player_name = 'Abdou Diallo' ) 
SELECT MAX(`overall_rating`)  FROM `Player_Attributes`  JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id`  WHERE `Player.player_name` = 'Dorlan Pabon' 
SELECT AVG(away_team_goal) AS average_goals FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Parma' AND Match.country_id = (SELECT id FROM Country WHERE name = 'Italy'); 
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date = '2016/6/23' ORDER BY p.birthday LIMIT 1; 
SELECT `overall_rating` FROM `Player_Attributes` WHERE `player_name` = 'Aaron Mooy' AND `date` = '2016-02-04 00:00:00' 
SELECT `potential` FROM `Player_Attributes` WHERE `player_name` = 'Francesco Parravicini' AND `date` = '2010-08-30 00:00:00' 
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_name` = 'Francesco Migliore' AND `date` = '2015-05-01 00:00:00' 
SELECT defensive_work_rate FROM Player_Attributes WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00'; 
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' ORDER BY crossing DESC LIMIT 1; 
SELECT buildUpPlaySpeedClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Willem II' AND Team_Attributes.date = '2012-02-22 00:00:00' 
SELECT buildUpPlayDribblingClass FROM Team_Attributes WHERE team_fifa_api_id = (SELECT team_fifa_api_id FROM Team WHERE team_short_name = 'LEI') AND date = '2015-09-10 00:00:00' 
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'FC Lorient' AND `date` = '2010-02-22' 
SELECT `chanceCreationPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'PEC Zwolle' AND `date` = '2013-09-20 00:00:00'; 
SELECT chanceCreationCrossingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Hull City' AND Team_Attributes.date = '2010-02-22 00:00:00' 
SELECT `defenceAggressionClass` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_fifa_api_id` = `Team.team_fifa_api_id` WHERE `Team.team_long_name` = 'Hannover 96' AND `Team_Attributes.date` = '2015-09-10 00:00:00' 
SELECT AVG(overall_rating) AS average_overall_rating FROM Player_Attributes WHERE player_name = 'Marko Arnautovic' AND date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00' 
SELECT      ((         (SELECT overall_rating           FROM Player_Attributes           WHERE player_api_id = (              SELECT player_api_id               FROM Player               WHERE player_name = 'Landon Donovan' AND date = '2013-07-12'          )     ) - (         SELECT overall_rating           FROM Player_Attributes           WHERE player_api_id = (              SELECT player_api_id               FROM Player               WHERE player_name = 'Jordan Bowery' AND date = '2013-07-12'          )     )     ) / (         SELECT overall_rating           FROM Player_Attributes           WHERE player_api_id = (              SELECT player_api_id               FROM Player               WHERE player_name = 'Landon Donovan' AND date = '2013-07-12'          )     ) * 100) AS percentage_difference 
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player) ORDER BY height DESC LIMIT 5; 
SELECT player_api_id  FROM Player  ORDER BY weight DESC  LIMIT 10; 
SELECT p.player_name FROM Player p WHERE DATEDIFF(year, p.birthday, CURRENT_TIMESTAMP) > 34 
SELECT SUM(home_team_goal) AS total_home_goals FROM Match JOIN Player ON Player.player_api_id = Match.home_player_1 OR Player.player_api_id = Match.home_player_2 OR              Player.player_api_id = Match.home_player_3 OR Player.player_api_id = Match.home_player_4 OR              Player.player_api_id = Match.home_player_5 OR Player.player_api_id = Match.home_player_6 OR              Player.player_api_id = Match.home_player_7 OR Player.player_api_id = Match.home_player_8 OR              Player.player_api_id = Match.home_player_9 OR Player.player_api_id = Match.home_player_10 OR              Player.player_api_id = Match.home_player_11 WHERE Player.player_name = 'Aaron Lennon'; 
SELECT SUM(away_team_goal) FROM Match WHERE      (away_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      away_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      away_player_3 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      away_player_4 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      away_player_5 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      away_player_6 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      away_player_7 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      away_player_8 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      away_player_9 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      away_player_10 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      away_player_11 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR      away_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      away_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      away_player_3 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      away_player_4 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      away_player_5 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      away_player_6 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      away_player_7 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      away_player_8 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      away_player_9 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR      away_player_10 =
SELECT SUM(home_team_goal) AS total_home_goals FROM Match JOIN Player ON Player.player_api_id = Match.home_player_1 OR Player.player_api_id = Match.home_player_2 OR      Player.player_api_id = Match.home_player_3 OR Player.player_api_id = Match.home_player_4 OR      Player.player_api_id = Match.home_player_5 OR Player.player_api_id = Match.home_player_6 OR      Player.player_api_id = Match.home_player_7 OR Player.player_api_id = Match.home_player_8 OR      Player.player_api_id = Match.home_player_9 OR Player.player_api_id = Match.home_player_10 OR      Player.player_api_id = Match.home_player_11 WHERE strftime('%Y', Player.birthday) > strftime('%Y', 'now', 'localtime') - 31 
SELECT P.player_name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE PA.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) ORDER BY P.player_name LIMIT 10; 
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes) 
SELECT P.player_name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id JOIN Match M ON P.player_api_id = M.home_player_1 OR P.player_api_id = M.home_player_2 OR                  P.player_api_id = M.home_player_3 OR P.player_api_id = M.home_player_4 OR                  P.player_api_id = M.home_player_5 OR P.player_api_id = M.home_player_6 OR                  P.player_api_id = M.home_player_7 OR P.player_api_id = M.home_player_8 OR                  P.player_api_id = M.home_player_9 OR P.player_api_id = M.home_player_10 OR                  P.player_api_id = M.home_player_11 OR P.player_api_id = M.away_player_1 OR                  P.player_api_id = M.away_player_2 OR P.player_api_id = M.away_player_3 OR                  P.player_api_id = M.away_player_4 OR P.player_api_id = M.away_player_5 OR                  P.player_api_id = M.away_player_6 OR P.player_api_id = M.away_player_7 OR                  P.player_api_id = M.away_player_8 OR P.player_api_id = M.away_player_9 OR                  P.player_api_id = M.away_player_10 OR P.player_api_id = M.away_player_11 WHERE PA.attacking_work_rate = 'high' AND M.home_player_1 IS NOT NULL OR M.home_player_2 IS NOT NULL OR       M.home_player_3 IS NOT NULL OR M.home_player_4 IS NOT NULL OR       M.home_player_5 IS NOT NULL OR M.home_player_6 IS NOT NULL OR       M.home_player_7 IS NOT NULL OR M.home_player_8 IS NOT NULL OR       M.home_player_9 IS NOT NULL OR M.home_player_10 IS NOT NULL OR       M.home_player_11 IS NOT NULL OR M.away_player_1 IS NOT NULL OR       M.away_player_2 IS NOT NULL OR M.away_player_3 IS NOT NULL OR       M.away_player_4 IS NOT NULL OR M.away_player_5 IS NOT NULL OR       M.away_player_6 IS NOT NULL OR M.away_player_7 IS NOT NULL OR       M.away_player_8 IS NOT
SELECT P.player_name,         MAX(SUBTRACT(datetime(CURRENT_TIMESTAMP, 'localtime'), datetime(P.birthday))) as age FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE PA.finishing = 1 GROUP BY P.player_api_id ORDER BY age DESC LIMIT 1; 
SELECT p.player_name FROM Player p JOIN Country c ON p.player_fifa_api_id = c.id WHERE c.name = 'Belgium'; 
SELECT P.player_name, C.name AS country_name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id JOIN Country C ON P.player_fifa_api_id = C.id WHERE PA.vision > 89; 
SELECT Country.name, AVG(Player.weight) AS avg_weight FROM Player JOIN Country ON Player.player_fifa_api_id = Country.id GROUP BY Country.name ORDER BY avg_weight DESC LIMIT 1; 
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Slow' 
SELECT t.team_short_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.chanceCreationPassingClass = 'Safe' 
SELECT AVG(height) AS average_height FROM Player WHERE player_fifa_api_id IN (     SELECT player_fifa_api_id     FROM Player     JOIN Team ON Player.player_api_id = Team.team_api_id     JOIN League ON Team.team_api_id = League.id     JOIN Country ON League.country_id = Country.id     WHERE Country.name = 'Italy' ) 
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3; 
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990' 
SELECT      (PA6.jumping - PA23.jumping) AS jumping_score_difference FROM      Player_Attributes PA6 JOIN      Player_Attributes PA23 ON PA6.id = 6 AND PA23.id = 23 
SELECT pa.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.potential = (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right') AND pa.preferred_foot = 'right' ORDER BY pa.potential ASC LIMIT 3; 
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = 'left') AND pa.preferred_foot = 'left' 
SELECT     ROUND((COUNT(*) FILTER (WHERE strength > 80 AND stamina > 80) * 100.0) / COUNT(*), 2) AS percentage_with_high_strength_and_stamina FROM     Player_Attributes; 
SELECT C.name FROM Match M JOIN League L ON M.league_id = L.id JOIN Country C ON L.country_id = C.id WHERE L.name = 'Poland Ekstraklasa'; 
SELECT      m.home_team_goal AS home_final_score,      m.away_team_goal AS away_final_score FROM      Match m JOIN      League l ON m.league_id = l.id WHERE      m.date = '2008-09-24' AND      l.name = 'Belgian Jupiler League'; 
SELECT `sprint_speed`, `agility`, `acceleration` FROM `Player_Attributes` WHERE `player_fifa_api_id` IN (     SELECT `player_fifa_api_id`     FROM `Player`     WHERE `player_name` = 'Alexis Blin' ) 
SELECT      CASE          WHEN T1.buildUpPlaySpeedClass = 'Slow' THEN 'Slow'         WHEN T1.buildUpPlaySpeedClass = 'Balanced' THEN 'Balanced'         WHEN T1.buildUpPlaySpeedClass = 'Fast' THEN 'Fast'         ELSE 'Unknown'     END AS speed_class FROM      Team_Attributes T1 JOIN      Team T2 ON T1.team_api_id = T2.team_api_id WHERE      T2.team_long_name = 'KSV Cercle Brugge' 
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Serie A'); 
SELECT MAX(home_team_goal) AS highest_score FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie'); 
SELECT `Player_Attributes`.`finishing`, `Player_Attributes`.`curve` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id` WHERE `Player`.`weight` = (SELECT MAX(`weight`) FROM `Player`) 
SELECT League.name, COUNT(Match.id) as TotalGames FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY TotalGames DESC LIMIT 1 
SELECT T2.team_long_name FROM Match AS T1 JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id WHERE T1.away_team_goal = (SELECT MAX(away_team_goal) FROM Match) 
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) 
SELECT      (COUNT(CASE WHEN `Player`.height < 180 AND `Player_Attributes`.overall_rating > 70 THEN 1 END) * 100.0) / COUNT(`Player`.id) AS percentage FROM      `Player` INNER JOIN      `Player_Attributes` ON `Player`.player_api_id = `Player_Attributes`.player_api_id 
SELECT      CASE          WHEN SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) >               SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END) THEN              'In-patient'          ELSE              'Outpatient'      END AS GenderAdmissionComparison,     ROUND(         100.0 *          ABS(             SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) -              SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END)         ) /          SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END), 2     ) AS PercentageDeviation FROM      Patient 
SELECT      (COUNT(CASE WHEN P.Birthday > '1930' THEN P.ID END) / COUNT(P.ID)) * 100 AS PercentageFemaleBornAfter1930 FROM      Patient P WHERE      P.SEX = 'F' 
SELECT      ROUND(         (COUNT(CASE WHEN p.Birthday BETWEEN '1930-01-01' AND '1940-12-31' AND pa.Admission = '+' THEN 1 END) * 100.0)          / COUNT(CASE WHEN p.Birthday BETWEEN '1930-01-01' AND '1940-12-31' THEN 1 END),          2     ) AS PercentageInpatients FROM      Patient p JOIN      Examination e ON p.ID = e.ID JOIN      Patient pa ON p.ID = pa.ID WHERE      p.Birthday BETWEEN '1930-01-01' AND '1940-12-31'; 
SELECT     COUNT(CASE WHEN P.Admission = '+' THEN E.ID END) AS InpatientCount,     COUNT(CASE WHEN P.Admission = '-' THEN E.ID END) AS OutpatientCount,     COUNT(CASE WHEN P.Admission = '+' THEN E.ID END) / COUNT(CASE WHEN P.Admission = '-' THEN E.ID END) AS OutpatientToInpatientRatio FROM     Examination E JOIN     Patient P ON E.ID = P.ID WHERE     P.Diagnosis = 'SLE' 
SELECT p.Diagnosis, l.Date FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.ID = 30609 ORDER BY l.Date; 
SELECT p.SEX, p.Birthday, e.`Examination Date`, e.Symptoms FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 163109; 
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > 500; 
SELECT p.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday IS NOT NULL AND       l.RVVT = '+'; 
SELECT      p.ID,      p.SEX,      e.Diagnosis FROM      Examination e JOIN      Patient p ON e.ID = p.ID WHERE      e.Thrombosis = 2; 
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1937 AND l.`T-CHO` >= 250; 
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis IS NOT NULL AND l.ALB < 3.5; 
SELECT      (SUM(CASE WHEN P.SEX = 'F' AND L.TP < 6.0 OR L.TP > 8.5 THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT P.ID) AS Percentage_Female_Outside_Normal_TP FROM      Examination E JOIN      Patient P ON E.ID = P.ID JOIN      Laboratory L ON E.ID = L.ID WHERE      P.SEX = 'F' 
SELECT AVG(`aCL IgG`) as Average_aCL_IgG FROM Examination WHERE Diagnosis = '+' AND SUBSTR(`Examination Date`, 1, 4) - SUBSTR(Birthday, 1, 4) >= 50; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'F'  AND YEAR(p.Description) = 1997  AND p.Admission = '-' 
SELECT MIN(SUBTRACT(YEAR(Birthday), YEAR(`First Date`))) AS YoungestAgeAtAdmission FROM Patient WHERE `First Date` IS NOT NULL; 
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 1 AND P.SEX = 'F' AND YEAR(E.`Examination Date`) = 1997; 
SELECT MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS AgeGap FROM Patient WHERE EXISTS (     SELECT 1     FROM Examination     WHERE Examination.Patient_ID = Patient.ID     AND Examination.TG >= 200 ) 
SELECT p.SEX, p.Birthday, p.Diagnosis, e.Symptoms FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) ORDER BY p.Birthday LIMIT 1; 
SELECT      EXTRACT(MONTH FROM Date) AS Month,     CAST(COUNT(DISTINCT Patient.ID) AS REAL) / 12 AS AvgMonthlyMalePatients FROM      Laboratory  JOIN      Patient ON Laboratory.ID = Patient.ID WHERE      Patient.SEX = 'M'      AND Laboratory.Date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY      Month 
SELECT p.Birthday, l.Date,         (EXTRACT(YEAR FROM p.FirstDate) - EXTRACT(YEAR FROM p.Birthday)) AS AgeAtAdmission FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID AND l.Date = (SELECT MIN(Date) FROM Laboratory WHERE ID = p.ID) WHERE e.Diagnosis = 'SJS' ORDER BY p.Birthday LIMIT 1; 
SELECT      SUM(CASE WHEN P.SEX = 'M' AND L.UA <= 8.0 THEN 1 ELSE 0 END) / SUM(CASE WHEN P.SEX = 'F' AND L.UA <= 6.5 THEN 1 ELSE 0 END) AS MaleToFemaleRatio FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.UA <= 8.0 AND P.SEX = 'M'     OR L.UA <= 6.5 AND P.SEX = 'F' 
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE p.FirstDate IS NOT NULL AND e.ExaminationDate IS NULL AND (p.FirstDate <= DATE_SUB(e.ExaminationDate, INTERVAL 1 YEAR) OR e.ExaminationDate IS NULL); 
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Birthday < '1975-01-01' -- Underage patients are those born before 1975 AND E.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31'; -- Examination dates within the specified period 
SELECT COUNT(P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'M' AND L.`T-BIL` > 2.0; 
SELECT Diagnosis, COUNT(Diagnosis) as DiagnosisCount FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY DiagnosisCount DESC LIMIT 1; 
SELECT AVG(SUBTRACT(YEAR(CURRENT_DATE), YEAR(Birthday))) AS AverageAge FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date BETWEEN '1991-10-01' AND '1991-10-30'; 
SELECT      SUBTRACT(YEAR(`Examination Date`), YEAR(Birthday)) AS Age,     p.Diagnosis FROM      Examination e JOIN      Patient p ON e.ID = p.ID WHERE      e.HGB = (SELECT MAX(HGB) FROM Examination WHERE `Examination Date` = (         SELECT MAX(`Examination Date`) FROM Examination     )) 
SELECT `ANA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02' 
SELECT T1.`T-CHO` < 250 AS NormalCholesterol FROM Laboratory AS T1 WHERE T1.ID = 2927464 AND T1.Date = '1995-09-04'; 
SELECT p.SEX  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'AORTITIS' ORDER BY e.`Examination Date` ASC LIMIT 1; 
SELECT aCL_IgM FROM Examination WHERE `Examination Date` = '1993-11-12' AND Diagnosis = 'SLE' AND ID IN (     SELECT ID     FROM Patient     WHERE Description = '1994-02-19' ) 
SELECT p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX IN ('M', 'F')   AND l.GPT = 9   AND l.Date = '1992-06-12'; 
SELECT      p.Birthday,      EXTRACT(YEAR FROM (p.Birthday + INTERVAL '8 years 10 months 21 days')) AS AgeAtTest FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.Date = '1991-10-21' AND      l.UA = 8.4 
SELECT COUNT(Laboratory.ID) AS TotalLabTests FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.FirstDate = '1991-06-13' AND Patient.Diagnosis = 'SJS' AND YEAR(Laboratory.Date) = 1995; 
SELECT p.Diagnosis AS OriginalDiagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`Examination Date` = '1997-01-27' AND p.`First Date` = '1997-01-27' AND e.Diagnosis = 'SLE' 
SELECT Symptoms FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday = '1959-03-01' AND Examination.`Examination Date` = '1993-09-27'; 
SELECT      (SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-11-%' THEN l.`T-CHO` END) -      SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-12-%' THEN l.`T-CHO` END)) /       SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-11-%' THEN l.`T-CHO` END) AS decrease_rate FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Birthday = '1959-02-18'      AND l.Date LIKE '1981-11-%'     AND EXISTS (         SELECT 1         FROM Laboratory l2         WHERE l2.ID = p.ID         AND l2.Date LIKE '1981-12-%'     ) 
SELECT DISTINCT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Diagnosis = 'Behcet' AND YEAR(E.`Examination Date`) BETWEEN 1997 AND 1997; 
SELECT DISTINCT e.ID FROM Examination e JOIN Laboratory l ON e.ID = l.ID AND e.`Examination Date` = l.Date WHERE e.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND l.GPT > 30 AND l.ALB < 4 ORDER BY e.ID; 
SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' ORDER BY ID; 
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination) 
SELECT      (COUNT(CASE WHEN L.UA <= 6.5 THEN 1 END) * 100.0) / COUNT(L.UA) FROM      Laboratory L JOIN      Patient P ON L.ID = P.ID WHERE      L.`U-PRO` > 0 AND L.`U-PRO` < 30 
SELECT      (SUM(CASE WHEN p.SEX = 'M' AND YEAR(e.`Examination Date`) = 1981 THEN 1 ELSE 0 END) * 100.0) /      COUNT(CASE WHEN p.SEX = 'M' AND YEAR(e.`Examination Date`) = 1981 THEN 1 END) AS percentage_behecet FROM      Examination e JOIN      Patient p ON e.ID = p.ID WHERE      p.SEX = 'M' AND      YEAR(p.`First Date`) = 1981 AND      e.Diagnosis = 'BEHCET' 
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-'    AND l.Date LIKE '1991-10%'   AND l.`T-BIL` < 2.0; 
SELECT COUNT(P.ID) AS Female_Patients_Between_1980_and_1989 FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.`ANA Pattern` <> 'p' AND P.SEX = 'F' AND P.Birthday BETWEEN '1980-01-01' AND '1989-12-31' 
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID AND e.Diagnosis = 'PSS' JOIN Laboratory l ON p.ID = l.ID AND l.CRP > 2 AND l.CRE = 1 AND l.LDH = 123; 
SELECT AVG(L.ALB) AS Average_Blood_Albumin FROM Examination E JOIN Laboratory L ON E.ID = L.ID JOIN Patient P ON E.ID = P.ID WHERE P.SEX = 'F' AND E.`aCL IgG` > 400 AND E.Diagnosis = 'SLE' 
SELECT Symptoms, COUNT(*) as Frequency FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY Frequency DESC LIMIT 1; 
SELECT      p.Birthday,      MIN(e.`Examination Date`) AS FirstDocumentationDate,      p.Diagnosis FROM      Examination e JOIN      Patient p ON e.ID = p.ID WHERE      p.ID = 48473 GROUP BY      p.Birthday,      p.Diagnosis ORDER BY      FirstDocumentationDate ASC LIMIT 1; 
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F' AND Diagnosis = 'APS'; 
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Laboratory.Date) = 1997 AND Laboratory.TP > 6 AND Laboratory.TP < 8.5; 
SELECT      (SUM(CASE WHEN Examination.Symptoms LIKE '%ITP%' THEN 1 ELSE 0 END) * 100.0) /      SUM(CASE WHEN Examination.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) AS Proportion FROM Examination; 
SELECT      (SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END) * 100.0) / COUNT(P.SEX) FROM      Patient P WHERE      YEAR(P.Birthday) = 1980 AND      P.Diagnosis = 'RA' 
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND e.Diagnosis = 'BEHCET' AND p.Admission = '-'; 
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.WBC < 3.5; 
SELECT DATEDIFF(`Examination.Date`, `Patient.First Date`) as DaysToEvaluation FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.ID = 821298 AND Examination.Date IS NOT NULL 
SELECT      CASE          WHEN p.SEX = 'M' THEN (CASE WHEN l.UA > 8.0 THEN 'Yes' ELSE 'No' END)         WHEN p.SEX = 'F' THEN (CASE WHEN l.UA > 6.5 THEN 'Yes' ELSE 'No' END)         ELSE 'No'     END AS UricAcidInRange FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID = 57266 AND l.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = p.ID) 
SELECT Date FROM Laboratory WHERE ID = (SELECT ID FROM Patient WHERE ID = 48473) AND GOT >= 60; 
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND YEAR(l.Date) = 1994; 
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GPT >= 60 
SELECT p.ID, p.Birthday, e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.GPT > 60 ORDER BY p.Birthday ASC; 
SELECT AVG(LDH) AS avg_ldh FROM Laboratory WHERE LDH < 500; 
SELECT      p.ID,      (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.LDH BETWEEN 600 AND 800     AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) > 0; 
SELECT      p.Admission,     COUNT(DISTINCT e.ID) AS Number_of_Patients FROM      Examination e JOIN      Patient p ON e.ID = p.ID WHERE      e.ALP < 300 GROUP BY      p.Admission; 
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01' AND l.ALP < 300; 
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0; 
SELECT      p.ID,     p.SEX,     l.TP,     l.TP - 8.5 AS TP_Deviation FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.SEX = 'F'     AND l.TP > 8.5 
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND (l.ALB <= 3.5 OR l.ALB >= 5.5) GROUP BY p.ID, p.Birthday ORDER BY p.Birthday DESC; 
SELECT      P.ID,      CASE          WHEN L.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range'         ELSE 'Not Within Normal Range'     END AS Albumin_Range FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      YEAR(P.Birthday) = 1982 
SELECT      ROUND(         (COUNT(CASE WHEN p.SEX = 'F' AND l.UA > 6.5 THEN 1 END) * 100.0) / COUNT(p.ID),          2     ) AS percentage_female_over_uac FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.SEX = 'F' 
SELECT AVG(UA) AS Average_UA FROM Laboratory WHERE UA < 8.0 AND (SEX = 'M' OR (SEX = 'F' AND UA < 6.5)) AND (SELECT MAX(Date) FROM Laboratory WHERE Laboratory.ID = Examination.ID) = Laboratory.Date AND Laboratory.ID IN (SELECT ID FROM Examination); 
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN = 29; 
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'RA' AND e.UN < 30; 
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.CRE >= 1.5; 
SELECT      (SUM(CASE WHEN P.SEX = 'M' AND L.CRE >= 1.5 THEN 1 ELSE 0 END) >       SUM(CASE WHEN P.SEX = 'F' AND L.CRE >= 1.5 THEN 1 ELSE 0 END)) AS MaleAboveNormalCountGreaterThanFemale FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.CRE >= 1.5 
SELECT      Patient.ID,      Patient.SEX,      Patient.Birthday FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Laboratory.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory) 
SELECT      p.SEX,      COUNT(*) AS TotalPatients FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.`T-BIL` >= 2.0 GROUP BY      p.SEX; 
SELECT p.ID, lab.T_CHO AS T_CHO_index FROM Patient p JOIN Laboratory lab ON p.ID = lab.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient)   AND lab.T_CHO = (SELECT MAX(T_CHO) FROM Laboratory) 
SELECT AVG(TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE())) AS AverageAge FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.`T-CHO` >= 250; 
SELECT      p.ID,      p.Diagnosis FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.TG > 300; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200 AND (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM p.Birthday)) > 50; 
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.CPK < 250; 
SELECT COUNT(*) FROM Patient WHERE YEAR(Birthday) BETWEEN 1936 AND 1956 AND SEX = 'M' AND EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.ID = Patient.ID     AND CPK >= 250 ) 
SELECT      p.ID,      p.SEX,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.GLU >= 180     AND l.T_CHO < 250 
SELECT Patient.ID, Laboratory.GLU FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GLU < 180 AND YEAR(Patient.Description) >= 1991 AND Patient.ID = (     SELECT MIN(ID)     FROM Patient     WHERE YEAR(Description) >= 1991     GROUP BY ID ) 
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      (l.WBC <= 3.5 OR l.WBC >= 9.0) GROUP BY      p.SEX,      p.Birthday ORDER BY      p.SEX,      (p.Birthday - CURRENT_DATE) / 365.25 ASC; 
SELECT p.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RBC < 3.5 
SELECT      p.ID,     p.SEX,     p.Birthday,     CASE          WHEN p.Admission = '+' THEN 'Admitted'         ELSE 'Not Admitted'     END AS AdmissionStatus,     CASE          WHEN e.RBC <= 3.5 OR e.RBC >= 6.0 THEN 'Abnormal'         ELSE 'Normal'     END AS RBCStatus FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.SEX = 'F'      AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) >= 50     AND (e.RBC <= 3.5 OR e.RBC >= 6.0) 
SELECT DISTINCT P.ID, P.SEX FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Admission = '-' AND E.HGB < 10; 
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'SLE' AND e.HGB BETWEEN 10 AND 17 ORDER BY p.Birthday ASC LIMIT 1; 
SELECT P.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday)) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.ID IN (     SELECT L.ID     FROM Laboratory L     WHERE L.HCT >= 52     GROUP BY L.ID     HAVING COUNT(*) >= 2 ) 
SELECT AVG(HCT) AS AvgHematocritLevelBelowNormal FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29; 
SELECT      SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) AS 'BelowNormalCount',     SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS 'AboveNormalCount' FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID; 
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date LIKE '1984%' AND p.Birthday IS NOT NULL AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) < 50 AND l.PLT BETWEEN 100 AND 400; 
SELECT      SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) * 1.0 / SUM(CASE WHEN PT >= 14 THEN 1 ELSE 0 END) * 100 AS PercentageOfAbnormalPTFemale FROM      Patient  INNER JOIN      Examination ON Patient.ID = Examination.ID WHERE      SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(Birthday)) > 55; 
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.`First Date` > '1992-12-31' AND l.PT < 14; 
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45; 
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.ID AND E.`Examination Date` = L.Date WHERE L.APTT > 45 AND E.Thrombosis = 3; 
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND e.WBC BETWEEN 3.5 AND 9.0 AND (e.FG <= 150 OR e.FG >= 450); 
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday > '1980-01-01' AND Laboratory.FG < 150 OR Laboratory.FG > 450; 
SELECT DISTINCT P.Diagnosis FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`U-PRO` >= 30; 
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`U-PRO` BETWEEN 0 AND 30 AND P.Diagnosis = 'SLE' 
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`aCL IgG` < 900 AND p.Symptoms = 'abortion'; 
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE E.`aCL IgG` BETWEEN 900 AND 2000  AND E.Symptoms IS NOT NULL; 
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGA BETWEEN 80 AND 500 AND l.IGA = (SELECT MAX(IGA) FROM Laboratory WHERE IGA BETWEEN 80 AND 500) 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.`IGA` BETWEEN 80 AND 500  AND p.`First Date` >= '1990-01-01'; 
SELECT Diagnosis, COUNT(Diagnosis) AS DiagnosisCount FROM Examination WHERE `aCL IgM` IS NOT NULL AND `aCL IgM` NOT BETWEEN 40 AND 400 GROUP BY Diagnosis ORDER BY DiagnosisCount DESC LIMIT 1; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID AND l.Date = (SELECT MAX(lab.Date) FROM Laboratory lab WHERE lab.ID = p.ID) WHERE l.CRP LIKE '+' OR l.CRP LIKE '-' OR l.CRP < 1.0 AND p.Description IS NULL 
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.CRP >= 1.0 AND Patient.Birthday IS NOT NULL AND (YEAR(CURDATE()) - YEAR(Patient.Birthday)) < 18 AND Examination.CRP NOT IN ('+', '-', '-'); 
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX IN('-', '+-') AND e.KCT = '+'; 
SELECT DISTINCT p.ID, p.SEX, p.Birthday, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday > '1995-01-01' AND e.RA IN('-', '+-'); 
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RF < 20 AND (YEAR(CURDATE()) - YEAR(p.Birthday)) > 60; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID AND l.Date = (     SELECT MAX(l2.Date)     FROM Laboratory l2     WHERE l2.ID = p.ID ) WHERE l.RF < 20 AND p.Thrombosis = '0'; 
SELECT COUNT(DISTINCT Examination.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.ANA IS NOT NULL  AND Examination.`ANA Pattern` = 'P'  AND Examination.C3 > 35; 
SELECT Examination.ID FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.HCT < 29 OR Examination.HCT > 52 AND Examination.`aCL IgA` = (SELECT MAX(`aCL IgA`) FROM Examination WHERE Examination.HCT < 29 OR Examination.HCT > 52) 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 1 AND e.C4 > 10; 
SELECT COUNT(DISTINCT p.ID) AS NumNormalRNPAdmittedPatients FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RNP IN ('-', '+-') AND p.Admission = '+'; 
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient WHERE RNP NOT IN('-', '+-')) AND l.RNP NOT IN('-', '+-') ORDER BY p.Birthday ASC LIMIT 1; 
SELECT COUNT(*) FROM Examination E JOIN Laboratory L ON E.ID = L.ID AND E.`Examination Date` = L.Date WHERE L.SM IN('-', '+-') AND E.Thrombosis = '1'; 
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.SM != '-' AND L.SM != '+-' AND P.Birthday = (SELECT MAX(Birthday) FROM Patient) ORDER BY P.Birthday ASC LIMIT 3; 
SELECT DISTINCT e.ID FROM Examination e WHERE e.`Examination Date` >= '1997-01-01' AND e.SC170 IN('-', '+-'); 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'M'  AND e.Symptoms = 'vertigo'  AND e.SC170 IN('-', '+-'); 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.SSA IN('-','+-') AND p.`First Date` < '1990' 
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SSA NOT IN('-', '+-') AND p.ID = (SELECT MIN(ID) FROM Patient WHERE `First Date` IS NOT NULL) ORDER BY p.`First Date` ASC LIMIT 1; 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.`SSB` IN('-', '+-') AND e.Diagnosis = 'SLE'; 
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.SSB IN('-', '+-') AND e.Symptoms IS NOT NULL 
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.CENTROMEA IN('-', '+-') AND L.SSB IN('-', '+-'); 
SELECT p.ID, e.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE l.DNA >= 8 AND e.Diagnosis IS NOT NULL; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE p.Description IS NULL AND l.DNA < 8 
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.`DNA-II` >= 8 AND Patient.Admission = '+'; 
SELECT      (COUNT(DISTINCT E.ID) / COUNT(DISTINCT CASE WHEN E.GOT >= 60 THEN E.ID ELSE NULL END)) * 1.0 AS percentage FROM      Examination E WHERE      E.GOT >= 60 AND      E.Diagnosis = 'SLE' 
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60; 
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT >= 60 ORDER BY p.Birthday LIMIT 1; 
SELECT p.Birthday, p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 60 GROUP BY p.ID, p.Birthday ORDER BY AVG(l.GPT) DESC LIMIT 3; 
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT < 60 AND P.SEX = 'M' 
SELECT MIN(P.FirstDate) as FirstRecordedDate FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.LDH < 500 AND E.LDH = (SELECT MAX(LDH) FROM Examination WHERE LDH < 500) 
SELECT MAX(L.Date) as LatestMedicalDataDate FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.LDH >= 500 AND P.`First Date` = (SELECT MAX(`First Date`) FROM Patient) 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALP >= 300 AND p.Admission = '+'; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.ALP < 300; 
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0; 
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Diagnosis = 'SJS' AND E.TP > 6.0 AND E.TP < 8.5; 
SELECT E.`Examination Date` FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.ALB BETWEEN 3.5 AND 5.5 AND E.ALB = (SELECT MAX(ALB) FROM Examination WHERE ALB BETWEEN 3.5 AND 5.5) AND P.ID = (SELECT ID FROM Examination WHERE ALB BETWEEN 3.5 AND 5.5 GROUP BY ID ORDER BY ALB DESC LIMIT 1) 
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB BETWEEN 3.5 AND 5.5 AND l.TP BETWEEN 6.0 AND 8.5; 
SELECT Examination.`aCL IgG`, Examination.`aCL IgM`, Examination.`aCL IgA` FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.SEX = 'F' AND Examination.UA > 6.50 AND Examination.UA <= 9.00 ORDER BY Examination.UA DESC LIMIT 1; 
SELECT MAX(ANA) AS Highest_ANA FROM Examination WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE CRE < 1.5 ) 
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRE < 1.5 AND Laboratory.aCL_IgA = (SELECT MAX(aCL_IgA) FROM Laboratory) 
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`T-BIL` >= 2.0 AND e.`ANA Pattern` LIKE '%P%'; 
SELECT Examination.ANA FROM Examination JOIN (     SELECT Patient.ID     FROM Patient     JOIN Examination ON Patient.ID = Examination.ID     WHERE Examination.`T-BIL` < 2.0     ORDER BY Examination.`T-BIL` DESC     LIMIT 1 ) AS HighestBilirubin ON Examination.ID = HighestBilirubin.ID WHERE Examination.ANA IS NOT NULL; 
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID AND e.`Examination Date` = l.Date WHERE e.`T-CHO` >= 250 AND l.KCT = '-'; 
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.ID IN (     SELECT l.ID     FROM Laboratory l     WHERE l.`T-CHO` < 250 ) AND e.`ANA Pattern` = 'P' 
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID AND l.Date = e.`Examination Date` WHERE l.TG < 200 AND e.Symptoms IS NOT NULL; 
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.TG < 200 AND e.TG = (SELECT MAX(TG) FROM Examination WHERE TG < 200) 
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CPK < 250 AND Laboratory.CPK IS NOT NULL AND NOT EXISTS (     SELECT 1     FROM Examination     WHERE Examination.ID = Patient.ID AND Examination.Thrombosis = 0 ); 
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID AND l.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = e.ID) WHERE l.CPK < 250 AND (l.KCT = '+' OR l.RVVT = '+' OR l.LAC = '+'); 
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU > 180 ORDER BY p.Birthday LIMIT 1; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis IS NOT NULL AND l.GLU < 180 AND p.Diagnosis != 'Thrombosis'; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0; 
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID AND e.`Examination Date` = l.Date WHERE e.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0; 
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND (     (l.RBC <= 3.5 OR l.RBC >= 6.0) ); 
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.PLT > 100 AND e.PLT < 400 AND e.Diagnosis IS NOT NULL; 
SELECT      p.ID,      p.Diagnosis,      l.PLT FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Diagnosis = 'MCTD'     AND l.PLT > 100     AND l.PLT < 400; 
SELECT AVG(PT) AS AveragePT FROM Laboratory WHERE ID IN (     SELECT ID     FROM Patient     WHERE SEX = 'M' ) AND PT < 14; 
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID AND l.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = e.ID) WHERE e.Thrombosis IN (2, 1) AND l.PT < 14; 
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders' 
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Engineering'; 
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design'; 
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer'; 
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer'; 
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium' AND m.position = 'Student'; 
SELECT e.event_id, e.event_name, COUNT(a.link_to_member) AS total_attendance FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Student_Club' GROUP BY e.event_id, e.event_name ORDER BY total_attendance DESC LIMIT 1; 
SELECT m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President' AND ma.college = 'Student Club'; 
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN "member" m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean'; 
SELECT COUNT(DISTINCT e.event_id)  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE m.first_name = 'Sacha'    AND m.last_name = 'Harrison'    AND e.event_name = 'Student_Club'    AND e.event_date LIKE '2019%'; 
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND event_id IN (     SELECT link_to_event     FROM attendance     GROUP BY link_to_event     HAVING COUNT(link_to_member) > 10 ) 
SELECT event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Student_Club' GROUP BY event_name HAVING COUNT(attendance.link_to_member) > 20 
SELECT      AVG(COUNT(event.event_id)) AS average_attendance FROM      event JOIN      attendance ON event.event_id = attendance.link_to_event WHERE      event.type = 'Meeting'      AND YEAR(event.event_date) = 2020 GROUP BY      event.event_name; 
SELECT expense_description, MAX(cost) AS max_cost FROM expense WHERE link_to_budget IN (SELECT budget_id FROM budget WHERE event_status = 'club_event') GROUP BY expense_description ORDER BY max_cost DESC LIMIT 1; 
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Environmental Engineering'; 
SELECT m.first_name || ' ' || m.last_name AS full_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud' AND m.link_to_major = (SELECT major_id FROM major WHERE major_name = 'Student_Club') 
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Law and Constitutional Studies' 
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Sherri' AND m.last_name = 'Ramsey' 
SELECT m.college FROM major m JOIN member mem ON m.major_id = mem.link_to_major WHERE mem.first_name = 'Tyler' AND mem.last_name = 'Hewitt'; 
SELECT SUM(i.amount) AS total_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.position = 'Vice President'; 
SELECT SUM(b.spent) AS total_spent_on_food FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food'; 
SELECT z.city, z.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN "attendance" a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.position = 'President' AND ma.college = 'Student Club' JOIN zip_code z ON m.zip = z.zip_code 
SELECT m.first_name || ' ' || m.last_name AS full_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Illinois'; 
SELECT SUM(b.spent) as total_spent_on_advertisement FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Advertisement'; 
SELECT m.college, m.department FROM major m JOIN member mbr ON m.major_id = mbr.link_to_major WHERE mbr.first_name = 'Pierce' OR mbr.last_name = 'Guidi'; 
SELECT SUM(b.amount) AS total_budgeted_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker'; 
SELECT expense.expense_id, expense.expense_description, expense.approved FROM expense JOIN event ON expense.link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (     SELECT event_id FROM event WHERE event_name = 'October Meeting' AND event_date = '2019-10-08' )) WHERE expense.approved = 'True'; 
SELECT SUM(e.cost) / COUNT(e.expense_id) AS average_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Elijah' AND m.last_name = 'Allen' AND EXTRACT(MONTH FROM e.expense_date) IN (9, 10) 
SELECT      (SUM(CASE WHEN YEAR(e.event_date) = 2019 THEN b.spent ELSE 0 END) -       SUM(CASE WHEN YEAR(e.event_date) = 2020 THEN b.spent ELSE 0 END)) AS spending_difference FROM      event e JOIN      budget b ON e.event_id = b.link_to_event JOIN      member m ON e.event_id = (SELECT link_to_event FROM attendance WHERE link_to_member = m.member_id) WHERE      m.position = 'Student_Club' 
SELECT location FROM event WHERE event_name = 'Spring Budget Review'; 
SELECT SUM(e.cost) AS total_cost FROM expense e JOIN event ev ON e.link_to_budget = (SELECT b.budget_id FROM budget b WHERE b.link_to_event = (SELECT ev.event_id FROM event ev WHERE ev.event_name = 'Posters' AND ev.event_date = '2019-09-04')) WHERE e.expense_description = 'Posters'; 
SELECT b.remaining FROM budget b WHERE b.category = 'Food' AND b.amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food') 
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14'; 
SELECT COUNT(DISTINCT major_id)  FROM major  WHERE college = 'College of Humanities and Social Sciences' 
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'; 
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Adela' AND m.last_name = 'O''Gallagher' 
SELECT COUNT(*) FROM budget WHERE link_to_event IN (     SELECT event_id     FROM event     WHERE event_name = 'November Meeting' ) AND remaining < 0; 
SELECT SUM(b.amount) AS total_budget_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Speaker' 
SELECT e.event_status FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-08-20'; 
SELECT major_name  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE member.first_name = 'Brent' AND member.last_name = 'Thomason' 
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Human Development and Family Studies') AND t_shirt_size = 'Large'; 
SELECT z.type FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Christof' AND m.last_name = 'Nielson' 
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President'; 
SELECT z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' 
SELECT m.link_to_major, m.first_name, m.last_name, m.position, maj.department FROM member m JOIN major maj ON m.link_to_major = maj.major_id WHERE m.position = 'President'; 
SELECT i.date_received  FROM income i  JOIN member m ON i.link_to_member = m.member_id  WHERE m.first_name = 'Connor' AND m.last_name = 'Hilton' AND i.source = 'Dues'; 
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' AND i.date_received = (SELECT MIN(date_received) FROM income WHERE source = 'Dues') 
SELECT      (SUM(CASE WHEN b.category = 'Advertisement' AND e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /       SUM(CASE WHEN b.category = 'Advertisement' AND e.event_name = 'October Meeting' THEN b.amount ELSE 0 END)) AS ratio FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      b.category = 'Advertisement' AND      (e.event_name = 'Yearly Kickoff' OR e.event_name = 'October Meeting') 
SELECT      (SUM(CASE WHEN e.event_name = 'November Speaker' AND b.category = 'Parking' THEN b.amount ELSE 0 END) /      SUM(CASE WHEN e.event_name = 'November Speaker' THEN b.amount ELSE 0 END)) * 100 AS parking_percentage FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      e.event_name = 'November Speaker' 
SELECT SUM(e.cost) AS total_pizza_cost FROM expense e JOIN event ev ON e.link_to_event = ev.event_id WHERE e.expense_description = 'Pizza'; 
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange' AND state = 'Virginia'; 
SELECT department  FROM major  WHERE college = 'College of Humanities and Social Sciences'; 
SELECT z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Amy' AND m.last_name = 'Firth' 
SELECT e.expense_description FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE b.remaining = (SELECT MIN(remaining) FROM budget) 
SELECT DISTINCT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting'; 
SELECT college, COUNT(*) as member_count FROM major JOIN member ON major.major_id = member.link_to_major GROUP BY college ORDER BY member_count DESC LIMIT 1 
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.phone = '809-555-3360'; 
SELECT event_name, MAX(amount) AS highest_budget FROM event JOIN budget ON event.event_id = budget.link_to_event GROUP BY event_name ORDER BY highest_budget DESC LIMIT 1; 
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President'; 
SELECT COUNT(DISTINCT link_to_member) FROM attendance WHERE link_to_event IN (     SELECT event_id     FROM event     WHERE event_name = 'Women''s Soccer' ); 
SELECT date_received FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Casey' AND last_name = 'Mason') 
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN zip_code zc ON m.zip = zc.zip_code WHERE zc.state = 'Maryland'; 
SELECT COUNT(DISTINCT e.event_id) FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.phone = '954-555-6240'; 
SELECT first_name, last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'School of Applied Sciences, Technology and Education'; 
SELECT event_id, event_name, MAX(DIVIDE(spent, amount)) AS spend_to_budget_ratio FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' GROUP BY event.event_id, event_name ORDER BY spend_to_budget_ratio DESC LIMIT 1 
SELECT COUNT(*) FROM member WHERE position = 'President' 
SELECT MAX(spent) AS highest_spent FROM budget WHERE event_status = 'completed'; 
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020; 
SELECT SUM(b.spent) AS total_spent_for_food FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description LIKE '%food%' 
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id, m.first_name, m.last_name HAVING COUNT(a.link_to_event) > 7; 
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater'; 
SELECT first_name || ' ' || last_name AS full_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina'; 
SELECT SUM(income.amount) AS total_income FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour' 
SELECT m.first_name || ' ' || m.last_name AS full_name, i.amount FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE i.amount > 40; 
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff' 
SELECT m.first_name, m.last_name FROM member m JOIN budget b ON m.member_id = b.link_to_member JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff' AND b.event_status = 'Manage' 
SELECT m.first_name, m.last_name, i.source, MAX(i.amount) AS highest_income FROM member m JOIN income i ON m.member_id = i.link_to_member GROUP BY m.first_name, m.last_name, i.source ORDER BY highest_income DESC 
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.amount = (SELECT MIN(amount) FROM budget) 
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN e.cost ELSE 0 END) /       SUM(e.cost)) * 100 AS percentage_cost_yearly_kickoff FROM      event e; 
SELECT      (SUM(CASE WHEN m.link_to_major = (SELECT major_id FROM major WHERE major_name = 'Finance') THEN 1 ELSE 0 END) /      SUM(CASE WHEN m.link_to_major = (SELECT major_id FROM major WHERE major_name = 'Physics') THEN 1 ELSE 0 END)) AS ratio FROM      member m; 
SELECT source, SUM(amount) as total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1; 
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary' AND link_to_major = (     SELECT major_id     FROM major     WHERE college = 'Student Club' ) 
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Physics Teaching'; 
SELECT COUNT(DISTINCT link_to_member) FROM attendance WHERE link_to_event IN (     SELECT event_id     FROM event     WHERE event_name = 'Community Theater' AND YEAR(event_date) = 2019 ) 
SELECT COUNT(a.link_to_event), m.major_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN "member" Luisa ON Luisa.first_name = 'Luisa' AND Luisa.last_name = 'Guidi' WHERE m.member_id = Luisa.member_id GROUP BY m.major_name; 
SELECT AVG(spent)  FROM budget  WHERE category = 'Food'  AND link_to_event IN (SELECT event_id FROM event WHERE event_status = 'Closed') 
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Advertisement' GROUP BY event_name ORDER BY SUM(budget.spent) DESC LIMIT 1; 
SELECT      COUNT(*) AS attendance_count FROM      event      JOIN attendance ON event.event_id = attendance.link_to_event     JOIN member ON attendance.link_to_member = member.member_id WHERE      event.event_name = 'Women''s Soccer' AND      member.first_name = 'Maya' AND      member.last_name = 'Mclean'; 
SELECT      ROUND((SUM(CASE WHEN e.event_name LIKE '%Student_Club%' AND e.type = 'Community Service' THEN 1 ELSE 0 END) /           COUNT(e.event_id)) * 100, 2) AS community_service_event_percentage FROM      event e WHERE      e.event_date BETWEEN '2019-01-01' AND '2019-12-31' 
SELECT SUM(e.cost) AS total_poster_cost FROM expense e JOIN event ev ON e.link_to_event = ev.event_id WHERE ev.event_name = 'September Speaker' AND e.expense_description = 'Posters'; 
SELECT t_shirt_size, COUNT(*) AS total_ordered FROM member GROUP BY t_shirt_size ORDER BY total_ordered DESC LIMIT 1; 
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' AND budget.remaining < 0 ORDER BY budget.remaining LIMIT 1; 
SELECT e.event_name, e.type, SUM(e.expense.cost) AS total_value FROM event e JOIN expense e2 ON e.event_id = e2.link_to_budget WHERE e.event_name = 'October Meeting' AND e2.approved = 'Yes' GROUP BY e.event_name, e.type; 
SELECT category, amount FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'April Speaker') ORDER BY amount ASC; 
SELECT budget_id, amount FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1; 
SELECT budget_id, amount FROM budget WHERE category = 'Advertising' ORDER BY amount DESC LIMIT 3; 
SELECT SUM(e.cost) AS total_parking_cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE e.expense_description = 'Parking' 
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20'; 
SELECT      m.first_name || ' ' || m.last_name AS full_name,      SUM(e.cost) AS total_cost FROM      expense e JOIN      member m ON e.link_to_member = m.member_id WHERE      m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY      m.member_id; 
SELECT expense.expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison'; 
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large'; 
SELECT m.zip, m.first_name, m.last_name FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50 JOIN zip_code zc ON m.zip = zc.zip_code; 
SELECT major_name FROM major JOIN member ON major.major_id = member.link_to_major WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen'; 
SELECT m.position FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business'; 
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Business') AND t_shirt_size = 'Medium'; 
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30; 
SELECT e.type FROM event e WHERE e.location = 'MU 215'; 
SELECT event.type FROM event WHERE event.event_date = '2020-03-24T12:00:00'; 
SELECT major.major_name FROM major JOIN member ON major.major_id = member.link_to_major WHERE member.position = 'Vice President'; 
SELECT      (SUM(CASE WHEN m.major_name = 'Mathematics' THEN 1 ELSE 0 END) / COUNT(DISTINCT m.member_id)) * 100 AS percentage_mathematics_members FROM      member m; 
SELECT event.type FROM event WHERE location = 'MU 215'; 
SELECT COUNT(*)  FROM income  WHERE amount = 50; 
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'; 
SELECT COUNT(DISTINCT major.major_id) FROM major JOIN college ON major.college = college.college WHERE college.college = 'College of Agriculture and Applied Sciences' AND major.department = 'School of Applied Sciences, Technology and Education' 
SELECT m.last_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering'; 
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0; 
SELECT z.city, z.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN zip_code z ON m.zip = z.zip_code WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member'; 
SELECT e.event_name FROM event e JOIN member m ON e.event_id = (SELECT link_to_event FROM attendance WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Vice' AND last_name = 'President' AND position = 'Vice President' AND zip = (SELECT zip_code FROM zip_code WHERE city = 'Student_Club' AND address = '900 E. Washington St.')) WHERE e.type = 'Social'; 
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10'; 
SELECT DISTINCT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.position = 'Member' AND e.event_name = 'Women''s Soccer'; 
SELECT      ROUND(         (SUM(CASE WHEN i.amount = 50 THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT m.member_id),         2     ) AS percentage_of_50_received_by_Medium_tshirt_members FROM      member m JOIN      income i ON m.member_id = i.link_to_member WHERE      m.t_shirt_size = 'Medium' AND     m.position = 'Member' AND     i.amount = 50 
SELECT DISTINCT state FROM zip_code WHERE type = 'PO Box' GROUP BY state; 
SELECT DISTINCT zc.zip_code FROM zip_code zc JOIN major m ON zc.state = m.department WHERE m.major_name = 'San Juan Municipio' AND zc.type = 'PO Box' AND zc.state = 'Puerto Rico'; 
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'; 
SELECT link_to_event FROM expense WHERE cost > 50 GROUP BY link_to_event HAVING SUM(cost) > 50; 
SELECT m.member_id, m.first_name, m.last_name, e.event_id, e.event_name FROM member m JOIN expense ex ON m.member_id = ex.link_to_member JOIN event e ON ex.link_to_event = e.event_id WHERE ex.approved = 'true' AND ex.expense_date BETWEEN '2019-01-10' AND '2019-11-19' AND m.member_id IN (     SELECT a.link_to_member     FROM attendance a     JOIN event e ON a.link_to_event = e.event_id     WHERE e.event_id = ex.link_to_event ) 
SELECT m.link_to_major, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Katy' AND ma.major_id = 'rec1N0upiVLy5esTO' 
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences'; 
SELECT DISTINCT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 20 AND e.expense_date BETWEEN '2019-09-10' AND '2019-11-19'; 
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'education' AND m.position = 'Member'; 
SELECT      (SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) * 100.0) / COUNT(e.event_id) AS percentage_over_budget FROM      event e JOIN      budget b ON e.event_id = b.link_to_event 
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31' 
SELECT expense_id, expense_description, expense_date, cost FROM expense WHERE cost / COUNT(expense_id) > 50 GROUP BY expense_id, expense_description, expense_date, cost HAVING COUNT(expense_id) > 1; 
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'; 
SELECT      (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) * 100.0) / COUNT(zip_code) AS percentage_po_box_zip_codes FROM      zip_code 
SELECT event_name, location FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 0; 
SELECT e.event_name, e.event_date FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100; 
SELECT m.first_name, m.last_name, m.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 100; 
SELECT z.city, z.county FROM event e JOIN income i ON e.event_id = i.link_to_member JOIN zip_code z ON e.zip = z.zip_code GROUP BY e.event_id, z.city, z.county HAVING COUNT(i.income_id) > 40; 
SELECT link_to_member, SUM(cost) AS total_cost FROM expense WHERE link_to_member IN (     SELECT link_to_member     FROM expense     GROUP BY link_to_member     HAVING COUNT(DISTINCT link_to_event) > 1 ) GROUP BY link_to_member ORDER BY total_cost DESC LIMIT 1; 
SELECT AVG(e.cost) AS average_amount_paid FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position != 'Member'; 
SELECT event_name FROM event WHERE cost < (SELECT SUM(cost) / COUNT(event_id) FROM event WHERE category = 'Parking') 
SELECT      DIVIDE(SUM(e.cost), COUNT(e.event_id)) * 100 AS percentage_cost FROM      event e WHERE      e.type = 'Game' 
SELECT b.budget_id FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Water, chips, cookies' GROUP BY b.budget_id ORDER BY SUM(e.cost) DESC LIMIT 1; 
SELECT m.first_name || ' ' || m.last_name AS full_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5; 
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense) 
SELECT      SUBTRACT(         DIVIDE(SUM(CASE WHEN m.state = 'Maine' THEN 1 ELSE 0 END),                (SELECT COUNT(*) FROM member WHERE position = 'Member')),         DIVIDE(SUM(CASE WHEN m.state = 'Vermont' THEN 1 ELSE 0 END),                (SELECT COUNT(*) FROM member WHERE position = 'Member'))     ) AS percentage_difference FROM      member m; 
SELECT major_name, department  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE first_name = 'Garrett' AND last_name = 'Gerke'; 
SELECT      CONCAT(m.first_name, ' ', m.last_name) AS full_name,      SUM(e.cost) AS total_cost FROM      expense e JOIN      member m ON e.link_to_member = m.member_id WHERE      e.expense_description LIKE '%Water%'      AND e.expense_description LIKE '%Veggie tray%'     AND e.expense_description LIKE '%supplies%' GROUP BY      m.member_id; 
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education'; 
SELECT b.category, b.amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'January Speaker' 
SELECT DISTINCT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food'; 
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09'; 
SELECT b.category FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE e.expense_description = 'Posters'; 
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name, m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary'; 
SELECT      e.event_name,      SUM(b.spent) AS total_spent FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      b.category = 'Speaker Gifts' GROUP BY      e.event_name ORDER BY      total_spent DESC; 
SELECT z.city FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Garrett' AND m.last_name = 'Girke' 
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND z.short_state = 'NC' AND z.zip_code = 28092; 
SELECT COUNT(DISTINCT gs.GasStationID) FROM gasstations gs JOIN transactions_1k t ON gs.GasStationID = t.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE gs.Country = 'CZE' AND p.Description = 'Premium gas'; 
SELECT      (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 1.0) /      COUNT(CASE WHEN c.Currency = 'CZK' THEN 1 END) AS Ratio_EUR_to_CZK FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID WHERE      c.Currency IN ('EUR', 'CZK'); 
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date BETWEEN '201201' AND '201212' AND c.Segment = 'LAM' GROUP BY c.CustomerID ORDER BY SUM(ym.Consumption) ASC LIMIT 1; 
SELECT AVG(consumption) / 12 AS avg_monthly_consumption FROM yearmonth WHERE CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Segment = 'SME' ) AND Date BETWEEN '201301' AND '201312'; 
SELECT c.CustomerID, SUM(t.Amount) AS TotalGasConsumed FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Price = (SELECT Price FROM products WHERE ProductID = t.ProductID)   AND t.Currency = 'CZK'   AND t.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalGasConsumed DESC 
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date BETWEEN '201201' AND '201212' AND ym.Consumption < 30000 AND c.Segment = 'KAM' 
SELECT      (SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) -      SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END)) AS DifferenceInConsumption FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      y.Date BETWEEN '201201' AND '201212'; 
SELECT strftime('%Y', t1.Date) AS Year, SUM(t1.Amount * t2.Price) AS TotalGasUse FROM transactions_1k AS t1 JOIN products AS t2 ON t1.ProductID = t2.ProductID JOIN customers AS t3 ON t1.CustomerID = t3.CustomerID WHERE t3.Currency = 'EUR' GROUP BY Year ORDER BY TotalGasUse DESC LIMIT 1; 
SELECT Segment, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1; 
SELECT   SUBSTR(yearmonth.Date, 1, 4) AS Year,   SUM(yearmonth.Consumption) AS TotalConsumption FROM   yearmonth JOIN   transactions_1k ON yearmonth.CustomerID = transactions_1k.CustomerID WHERE   transactions_1k.Currency = 'CZK' GROUP BY   Year ORDER BY   TotalConsumption DESC LIMIT 1; 
SELECT      SUBSTR(y.Date, 6, 2) AS Month,     SUM(y.Consumption) AS TotalConsumption FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      c.Segment = 'SME' AND      SUBSTR(y.Date, 1, 4) = '2013' GROUP BY      Month ORDER BY      TotalConsumption DESC LIMIT 1; 
WITH CustomerAnnualAvg AS (     SELECT         c.Segment,         ym.CustomerID,         SUM(ym.Consumption) AS TotalConsumption,         COUNT(DISTINCT ym.CustomerID) AS CustomerCount     FROM         yearmonth ym     JOIN         customers c ON ym.CustomerID = c.CustomerID     WHERE         ym.Date BETWEEN '201301' AND '201312'     GROUP BY         c.Segment ), LowestConsumption AS (     SELECT         Segment,         MIN(TotalConsumption) AS MinConsumption     FROM         CustomerAnnualAvg     GROUP BY         Segment ), CustomerLowestConsumption AS (     SELECT         c.Segment,         c.CustomerID     FROM         CustomerAnnualAvg caa     JOIN         LowestConsumption lc ON caa.Segment = lc.Segment AND caa.TotalConsumption = lc.MinConsumption     JOIN         customers c ON caa.CustomerID = c.CustomerID ), SME_LAM AS (     SELECT         (SUM(ym.Consumption) / COUNT(DISTINCT ym.CustomerID)) AS Difference     FROM         yearmonth ym     JOIN         CustomerLowestConsumption clc ON ym.CustomerID = clc.CustomerID     WHERE         clc.Segment = 'SME' OR clc.Segment = 'LAM'     GROUP BY         Segment ), LAM_KAM AS (     SELECT         (SUM(ym.Consumption) / COUNT(DISTINCT ym.CustomerID)) AS Difference     FROM         yearmonth ym     JOIN         CustomerLowestConsumption clc ON ym.CustomerID = clc.CustomerID     WHERE         clc.Segment = 'LAM' OR clc.Segment = 'KAM'     GROUP BY         Segment ), KAM_SME AS (     SELECT         (SUM(ym.Consumption) / COUNT(DISTINCT ym.CustomerID)) AS Difference     FROM         yearmonth ym     JOIN         CustomerLowestConsumption clc ON ym.CustomerID = clc.CustomerID     WHERE         clc.Segment = 'KAM' OR clc.Segment = 'SME'     GROUP BY         Segment ) SELECT     (SELECT Difference FROM SME_LAM WHERE Segment =
SELECT      Segment,      MAX(PercentageIncrease) AS MaxPercentageIncrease,      MIN(PercentageIncrease) AS MinPercentageIncrease FROM (     SELECT          c.Segment,         (SUM(y3.Consumption) - SUM(y2.Consumption)) / SUM(y3.Consumption) * 100 AS PercentageIncrease     FROM          yearmonth y3     JOIN          yearmonth y2 ON y3.CustomerID = y2.CustomerID AND LEFT(y3.Date, 6) = LEFT(y2.Date, 6) + 100     JOIN          customers c ON y3.CustomerID = c.CustomerID     WHERE          c.Segment IN ('SME', 'LAM', 'KAM')          AND y3.Date BETWEEN '201201' AND '201312'         AND y2.Date BETWEEN '201201' AND '201212'         AND y3.Currency = 'EUR'     GROUP BY          c.Segment ) AS SegmentAnalysis GROUP BY      Segment ORDER BY      MaxPercentageIncrease DESC,      MinPercentageIncrease ASC LIMIT 1; 
SELECT SUM(Consumption) as TotalConsumption FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311' 
SELECT     (SELECT COUNT(*) FROM gasstations g JOIN countries c ON g.Country = c.CountryCode WHERE c.Country = 'Czech Republic' AND g.Segment = 'Discount')     - (SELECT COUNT(*) FROM gasstations g JOIN countries c ON g.Country = c.CountryCode WHERE c.Country = 'Slovakia' AND g.Segment = 'Discount') AS DifferenceInDiscountStations 
SELECT      SUM(y1.Consumption) AS Customer7_Consumption,     SUM(y2.Consumption) AS Customer5_Consumption,     (SUM(y1.Consumption) - SUM(y2.Consumption)) AS Difference FROM      yearmonth y1 JOIN      yearmonth y2 ON y1.CustomerID = 7 AND y2.CustomerID = 5 WHERE      y1.Date = '201304' AND y2.Date = '201304' 
SELECT     (SELECT COUNT(*) FROM customers c      JOIN transactions_1k t ON c.CustomerID = t.CustomerID      WHERE c.Segment = 'SME' AND t.Currency = 'CZK')     -     (SELECT COUNT(*) FROM customers c      JOIN transactions_1k t ON c.CustomerID = t.CustomerID      WHERE c.Segment = 'SME' AND t.Currency = 'EUR') AS SME_CZK_EUR_difference; 
SELECT c.CustomerID, y.Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'Euro'   AND y.Date = '201310'   AND c.Segment = 'LAM' ORDER BY y.Consumption DESC LIMIT 1; 
SELECT      c.CustomerID,      SUM(y.Consumption) AS TotalConsumption FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      c.Segment = 'KAM' GROUP BY      c.CustomerID ORDER BY      TotalConsumption DESC LIMIT 1; 
SELECT SUM(yearmonth.Consumption) FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'KAM' AND yearmonth.Date = '201305' 
SELECT      (SUM(CASE WHEN y.Consumption > 46.73 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS PercentageOfLAMCustomersConsumingMoreThan4673 FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      c.Segment = 'LAM' 
SELECT      g.Country,      COUNT(DISTINCT g.GasStationID) AS ValueForMoneyGasStationsCount FROM      gasstations g JOIN      transactions_1k t ON g.GasStationID = t.GasStationID JOIN      customers c ON t.CustomerID = c.CustomerID GROUP BY      g.Country ORDER BY      COUNT(DISTINCT g.GasStationID) DESC; 
SELECT     (SUM(CASE WHEN t.Amount * t.Price = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS PercentageOfKAMInEuro FROM     transactions_1k t JOIN     customers c ON t.CustomerID = c.CustomerID WHERE     c.Segment = 'KAM' 
SELECT     (COUNT(*) FILTER (WHERE Consumption > 528.3) * 100.0) / COUNT(*) FROM     yearmonth WHERE     Date = '201202' 
SELECT     (COUNT(CASE WHEN g.Country = 'Slovakia' AND g.Segment = 'Premium' THEN 1 END) * 100.0) /     COUNT(CASE WHEN g.Country = 'Slovakia' THEN 1 END) AS PercentageOfPremiumGasStations FROM     gasstations g 
SELECT CustomerID FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY Consumption DESC LIMIT 1; 
SELECT c.Segment, SUM(y.Consumption) as TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1; 
SELECT c.CustomerID, SUM(y.Consumption) as TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' GROUP BY c.CustomerID ORDER BY TotalConsumption ASC LIMIT 1; 
SELECT MAX(Consumption) AS HighestMonthlyConsumption FROM yearmonth WHERE Date LIKE '2012%' 
SELECT      ym.CustomerID,      MAX(ym.Consumption) AS MaxMonthlyConsumption FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      c.Currency = 'Euro' GROUP BY      ym.CustomerID ORDER BY      MaxMonthlyConsumption DESC LIMIT 1; 
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN yearmonth ym ON t.CustomerID = ym.CustomerID WHERE ym.Date = '201309' 
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE LEFT(t.Date, 6) = '201306' 
SELECT g ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'Euro'; 
SELECT DISTINCT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID WHERE t.Currency = 'EUR'; 
SELECT AVG(T.Amount * T.Price) AS AverageTotalPrice FROM transactions_1k AS T WHERE T.Date LIKE '2012-01%' 
SELECT COUNT(DISTINCT ym.CustomerID)  FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID JOIN transactions_1k t ON ym.CustomerID = t.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000 GROUP BY ym.CustomerID 
SELECT p.Description FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE g.Country = 'CZE'; 
SELECT DISTINCT Time FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.ChainID = 11; 
SELECT COUNT(*) FROM transactions_1k t1 JOIN gasstations t2 ON t1.GasStationID = t2.GasStationID WHERE t2.Country = 'CZE' AND t1.Price > 1000; 
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01'; 
SELECT AVG(t.Price * t.Amount) AS AverageTotalPrice FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'; 
SELECT AVG(T.Price) AS AverageTotalPrice FROM transactions_1k AS T JOIN customers AS C ON T.CustomerID = C.CustomerID WHERE C.Currency = 'Euro' 
SELECT c.CustomerID, SUM(t.Amount * t.Price) as TotalSpent FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-25' GROUP BY c.CustomerID ORDER BY TotalSpent DESC LIMIT 1; 
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID ASC LIMIT 1; 
SELECT c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Time = '16:25:00' AND t.Date = '2012-08-24'; 
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-23' AND ym.Time = '21:20:00'; 
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26'   AND Time < '13:00:00'   AND EXISTS (     SELECT 1     FROM customers AS c     JOIN yearmonth AS ym ON c.CustomerID = ym.CustomerID     WHERE c.Currency = 'EUR'       AND ym.Date = '2012-08-26'   )   AND EXISTS (     SELECT 1     FROM gasstations AS gs     WHERE gs.GasStationID = transactions_1k.GasStationID       AND gs.Currency = 'EUR'   ); 
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = (SELECT MIN(Date) FROM yearmonth) LIMIT 1; 
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00'; 
SELECT T1.ProductID FROM transactions_1k AS T1 WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'; 
SELECT ym.Consumption, ym.Date, ym.CustomerID FROM yearmonth ym WHERE ym.Date BETWEEN '2012-01-01' AND '2012-01-31' AND ym.CustomerID = (     SELECT t1.CustomerID     FROM transactions_1k t1     WHERE t1.Date = '2012-08-24'     AND t1.Amount = 12405 ) 
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.Time BETWEEN '08:00' AND '09:00'   AND transactions_1k.Date = '2012-08-26'   AND gasstations.Country = 'CZE'; 
SELECT c.Currency FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201306' AND (     SELECT SUM(t.Amount * t.Price)     FROM transactions_1k t     JOIN yearmonth ym ON t.CustomerID = ym.CustomerID AND ym.Date = '201306'     WHERE t.CustomerID = c.CustomerID ) = 214582.17; 
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CardID = 667467; 
SELECT c.Country FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-24' AND ym.Consumption = 548.4 
SELECT     ROUND((COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE NULL END) * 100.0) / COUNT(*), 2) AS Percentage_EUR_Users FROM     customers c JOIN     yearmonth ym ON c.CustomerID = ym.CustomerID WHERE     ym.Date = '2012-08-25' 
SELECT      (consumption_2012 - consumption_2013) / consumption_2012 AS ConsumptionDecreaseRate FROM (     SELECT          y1.CustomerID,         SUM(y1.Consumption) AS consumption_2012,         SUM(CASE WHEN y2.Date BETWEEN '2013-01-01' AND '2013-12-31' THEN y2.Consumption ELSE 0 END) AS consumption_2013     FROM          yearmonth y1     LEFT JOIN          yearmonth y2 ON y1.CustomerID = y2.CustomerID AND y2.Date BETWEEN '2012-01-01' AND '2012-12-31'     WHERE          y1.Date = '2012-08-25' AND y1.CustomerID = (             SELECT                  CustomerID              FROM                  transactions_1k              WHERE                  Date = '2012-08-25' AND Amount = 634.8         )     GROUP BY          y1.CustomerID ) AS consumption_rates 
SELECT GasStationID, SUM(Amount * Price) as TotalRevenue FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID GROUP BY GasStationID ORDER BY TotalRevenue DESC LIMIT 1 
SELECT     (SELECT SUM(t.Amount * t.Price) FROM transactions_1k t      JOIN gasstations gs ON t.GasStationID = gs.GasStationID      JOIN customers c ON t.CustomerID = c.CustomerID      WHERE gs.Country = 'SVK' AND c.Segment = 'premium') /     (SELECT SUM(t.Amount * t.Price) FROM transactions_1k t      JOIN gasstations gs ON t.GasStationID = gs.GasStationID      JOIN customers c ON t.CustomerID = c.CustomerID      WHERE gs.Country = 'SVK') * 100 AS PremiumPercentage 
SELECT SUM(t.Amount) AS TotalAmount FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.CustomerID = 38508;  SELECT SUM(t.Amount) AS January2012Amount FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.CustomerID = 38508 AND LEFT(t.Date, 6) = '201201'; 
SELECT p.ProductID, p.Description, SUM(t.Amount) AS TotalAmount FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY p.ProductID, p.Description ORDER BY TotalAmount DESC LIMIT 5; 
SELECT      c.CustomerID,     AVG(t.Price / t.Amount) AS AveragePricePerItem,     c.Currency FROM      transactions_1k t JOIN      customers c ON t.CustomerID = c.CustomerID GROUP BY      c.CustomerID, c.Currency ORDER BY      SUM(t.Amount * t.Price) DESC LIMIT 1; 
SELECT g.Country, MAX(t.Price) as MaxPrice FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE p.ProductID = 2 GROUP BY g.Country ORDER BY MaxPrice DESC LIMIT 1; 
SELECT ym.CustomerID, ym.Date, ym.Consumption FROM yearmonth ym JOIN transactions_1k t ON ym.CustomerID = t.CustomerID WHERE ym.Date LIKE '201208%'   AND t.ProductID = 5   AND (t.Price / t.Amount) > 29.00; 
