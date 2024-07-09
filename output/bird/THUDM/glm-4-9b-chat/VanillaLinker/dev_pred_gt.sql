SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `Academic Year` = '2014-2015' AND `County Name` = 'Alameda';	california_schools
SELECT     `School Name`,     `Percent (%) Eligible Free (Ages 5-17)` FROM     frpm WHERE     `Educational Option Type` = 'Continuation' ORDER BY     `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND s.County = 'Fresno' AND s.District = 'Fresno County Office of Education';	california_schools
SELECT s.MailStreet, s.MailStreetAbr, s.MailCity, s.MailZip, s.MailState FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.FRPM Count (K-12) = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm) AND s.MailStreet IS NOT NULL AND s.MailStreetAbr IS NOT NULL AND s.MailCity IS NOT NULL AND s.MailZip IS NOT NULL AND s.MailState IS NOT NULL;	california_schools
SELECT schools.Phone FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.`Charter School (Y/N)` = 1 AND frpm.Charter Funding Type = 'Directly funded' AND schools.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.AvgScrMath > 400 AND schools.Virtual = 'F';	california_schools
SELECT s.CDSCode, s.School, s.Magnet FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumTstTakr > 500 AND s.Magnet = 1;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 IS NOT NULL AND ss.NumGE1500 > 0 ORDER BY ss.NumGE1500 DESC LIMIT 1;	california_schools
SELECT satscores.NumTstTakr FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.`FRPM Count (K-12)` = (     SELECT MAX(`FRPM Count (K-12)`)     FROM frpm )	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM frpm f JOIN satscores s ON f.CDSCode = s.cds WHERE s.AvgScrMath > 560 AND f.`Charter School (Y/N)` = 1;	california_schools
SELECT frpm.CDSCode, frpm.`FRPM Count (Ages 5-17)` FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrRead IS NOT NULL ORDER BY satscores.AvgScrRead DESC LIMIT 1;	california_schools
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;	california_schools
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`)  FROM frpm  WHERE `Percent (%) Eligible FRPM (Ages 5-17)` > 0.3  AND `Enrollment (Ages 5-17)` > 0  AND `Percent (%) Eligible Free (Ages 5-17)` IS NOT NULL;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.rtype = 'D' ORDER BY (ss.NumGE1500 / ss.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, fpm.`Enrollment (Ages 5-17)` FROM frpm fpm JOIN schools s ON fpm.CDSCode = s.CDSCode WHERE s.StatusType = 'Active' ORDER BY fpm.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT      District,      AVG(AvgScrRead) AS AvgScore FROM      satscores WHERE      rtype = 'D' AND      AvgScrRead IS NOT NULL GROUP BY      District ORDER BY      AvgScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Alameda' AND satscores.NumTstTakr < 100;	california_schools
SELECT s.CDSCode, s.CharterNum, AVG(s.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL GROUP BY s.CDSCode, s.CharterNum ORDER BY AvgWritingScore DESC;	california_schools
SELECT COUNT(*) FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Fresno' AND s.FundingType = 'Directly funded' AND ss.NumTstTakr <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.AvgScrMath IS NOT NULL AND sc.AvgScrMath = (     SELECT MAX(AvgScrMath)     FROM satscores     WHERE AvgScrMath IS NOT NULL );	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12';	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700;	california_schools
SELECT s.School, s.District, ss.NumTstTakr FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Contra Costa' ORDER BY ss.NumTstTakr DESC LIMIT 1;	california_schools
SELECT s.School, s.Street, s.StreetAbr, s.City, s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT frpm.School_Name, satscores.NumTstTakr FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.`Percent (%) Eligible Free (K-12)` > 0.1 AND satscores.NumGE1500 >= 1500;	california_schools
SELECT      s.School,      s.FundingType FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      s.County = 'Riverside' AND      sc.AvgScrMath IS NOT NULL AND      (SELECT AVG(sc.AvgScrMath) FROM satscores sc WHERE sc.cds = s.CDSCode) > 400;	california_schools
SELECT      s.School,      s.Street,      s.City,      s.State,      s.Zip  FROM      schools s  JOIN      frpm f ON s.CDSCode = f.CDSCode  WHERE      f.County = 'Monterey'      AND f.`Percent (%) Eligible FRPM (Ages 5-17)` > 0      AND f.`FRPM Count (Ages 5-17)` > 800      AND s.District LIKE '%High Schools%';	california_schools
SELECT      s.School,      ss.AvgScrWrite,      s.Phone AS CommunicationNumber FROM      schools s JOIN      satscores ss ON s.CDSCode = ss.cds WHERE      (s.OpenDate > '1991-12-31' OR (s.ClosedDate < '2000-01-01' AND s.ClosedDate IS NOT NULL))	california_schools
WITH k12_15_17_diff AS (     SELECT          s.CDSCode,          s.School,          s.DOCType,         (frpm.Enrollment (`K-12`) - frpm.Enrollment (`Ages 5-17`)) AS diff     FROM          frpm     JOIN          schools s ON frpm.CDSCode = s.CDSCode     WHERE          frpm.`Charter School (Y/N)` = 0 ), avg_diff AS (     SELECT          AVG(diff) AS avg_diff     FROM          k12_15_17_diff ), above_avg_diff AS (     SELECT          k12_15_17_diff.CDSCode,          k12_15_17_diff.School,          k12_15_17_diff.DOCType     FROM          k12_15_17_diff, avg_diff     WHERE          k12_15_17_diff.diff > avg_diff.avg_diff ) SELECT      School,      DOCType FROM      above_avg_diff;	california_schools
SELECT s.OpenDate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM frpm) AND f.`Educational Option Type` = 'K-12 Schools (Public)' ORDER BY s.OpenDate LIMIT 1;	california_schools
SELECT `City`, `Enrollment (K-12)` AS Enrollment FROM frpm WHERE `Enrollment (K-12)` IS NOT NULL ORDER BY `Enrollment (K-12)` ASC LIMIT 5;	california_schools
SELECT      `Percent (%) Eligible Free (K-12)` AS Eligible_Free_Rate FROM      frpm ORDER BY      `Enrollment (K-12)` DESC LIMIT 10, 2;	california_schools
SELECT     `School Name`,     `Percent (%) Eligible FRPM (K-12)` AS `Eligible FRPM Rate` FROM     frpm WHERE     `School Type` = 'K-12 Schools (Public)'     AND `Educational Option Type` = 'Traditional'     AND `Charter School (Y/N)` = 0     AND `Educational Option Type` = 'Traditional'     AND `School Code` IN (         SELECT             `School Code`         FROM             frpm         WHERE             `School Type` = 'K-12 Schools (Public)'             AND `Educational Option Type` = 'Traditional'             AND `Charter School (Y/N)` = 0             AND `Educational Option Type` = 'Traditional'         ORDER BY             `FRPM Count (K-12)` DESC         LIMIT 5     ) ORDER BY     `FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT s.School, s.Website FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT     frpm.CDSCode,     frpm.County Name,     frpm.School Name,     (frpm.Free Meal Count (Ages 5-17) / frpm.Enrollment (Ages 5-17)) AS Free_Rate FROM     frpm JOIN     schools ON frpm.CDSCode = schools.CDSCode WHERE     schools.AdmFName1 = 'Kacey Gibson';	california_schools
SELECT s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`Enrollment (K-12)` = (SELECT MIN(`Enrollment (K-12)`) FROM frpm WHERE `Charter School (Y/N)` = 1) AND f.`Low Grade` = '1' AND f.`High Grade` = '12';	california_schools
SELECT      s.LastUpdate,     a.AdmFName1 AS AdminFName1,     a.AdmLName1 AS AdminLName1,     a.AdmEmail1 AS AdminEmail1,     a.AdmFName2 AS AdminFName2,     a.AdmLName2 AS AdminLName2,     a.AdmEmail2 AS AdminEmail2,     a.AdmFName3 AS AdminFName3,     a.AdmLName3 AS AdminLName3,     a.AdmEmail3 AS AdminEmail3 FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds JOIN      (         SELECT              cds,             MAX(NumGE1500) AS MaxGE1500         FROM              satscores         GROUP BY              cds     ) AS max_scores ON sc.cds = max_scores.cds AND sc.NumGE1500 = max_scores.MaxGE1500 JOIN      schools a ON s.CDSCode = a.CDSCode WHERE      s.StatusType = 'Active' ORDER BY      sc.NumGE1500 DESC LIMIT 1;	california_schools
SELECT Street, City, Zip, State FROM schools WHERE CDSCode = (     SELECT CDSCode     FROM (         SELECT CDSCode, (NumGE1500 * 1.0) / NumTstTakr AS ExcellenceRate         FROM satscores         WHERE rtype = 'D'     ) AS Rate     ORDER BY ExcellenceRate ASC     LIMIT 1 );	california_schools
SELECT schools.Website FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.County = 'Los Angeles' AND satscores.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(NumTstTakr) AS AverageTestTakers FROM satscores WHERE YEAR(OpenDate) = 1980 AND CDSCode IN (SELECT CDSCode FROM schools WHERE County = 'Fresno');	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.District = 'Fresno Unified' AND sc.AvgScrRead IS NOT NULL ORDER BY sc.AvgScrRead ASC LIMIT 1;	california_schools
SELECT s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' AND s.StatusType = 'Active' AND s.SOCType = 'School' AND s.SOC = 'ELEMHIGH' AND s.SOC = 'HS' AND s.SOC = 'ELEM' AND s.SOC = 'K-12' AND ss.AvgScrRead IS NOT NULL AND s.County IN (     SELECT County     FROM (         SELECT s.County, AVG(ss.AvgScrRead) AS avg_read_score         FROM schools s         JOIN satscores ss ON s.CDSCode = ss.cds         WHERE s.Virtual = 'F'         AND s.StatusType = 'Active'         AND s.SOCType = 'School'         AND s.SOC = 'ELEMHIGH'         AND s.SOC = 'HS'         AND s.SOC = 'ELEM'         AND s.SOC = 'K-12'         AND ss.AvgScrRead IS NOT NULL         GROUP BY s.County         ORDER BY avg_read_score DESC         LIMIT 5     ) AS top_counties ) ORDER BY s.County, ss.AvgScrRead DESC LIMIT 5;	california_schools
SELECT      s.`School Type` FROM      satscores AS sc JOIN      schools AS s ON sc.cds = s.CDSCode WHERE      sc.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)	california_schools
SELECT      s.County,      AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) AS AvgAllSubjectScore FROM      satscores AS sc JOIN      schools AS s ON sc.cds = s.CDSCode GROUP BY      s.County ORDER BY      AvgAllSubjectScore LIMIT 1;	california_schools
SELECT s.City, AVG(satscores.AvgScrWrite) AS AvgWritingScore FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.NumGE1500 IS NOT NULL AND satscores.NumGE1500 > 0 GROUP BY s.City ORDER BY satscores.NumGE1500 DESC LIMIT 1;	california_schools
SELECT s.School, AVG(s.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds JOIN (     SELECT AdmLName1 AS ManagerLastName     FROM schools     WHERE AdmLName1 = 'Ulrich' ) mu ON s.AdmLName1 = mu.ManagerLastName GROUP BY s.School;	california_schools
SELECT      s.CDSCode,      s.School,      SUM(f.Enrollment(K-12)) AS TotalEnrollment FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.DOC = '31' AND      f.Low_Grade = '1' AND      f.High_Grade = '12' GROUP BY      s.CDSCode,      s.School ORDER BY      TotalEnrollment DESC LIMIT 1;	california_schools
SELECT COUNT(*) / 12 AS MonthlyAverageSchoolsOpened FROM schools WHERE County = 'Alameda'   AND DOC = '52'   AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31';	california_schools
SELECT      SUM(CASE WHEN s.DOC = '54' THEN 1 ELSE 0 END) AS UnifiedSchoolDistrictCount,     SUM(CASE WHEN s.DOC = '52' THEN 1 ELSE 0 END) AS ElementarySchoolDistrictCount,     (SUM(CASE WHEN s.DOC = '54' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN s.DOC = '52' THEN 1 ELSE 0 END), 0)) AS Ratio FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Orange' AND s.DOC IN ('54', '52');	california_schools
SELECT      County,      COUNT(*) AS ClosedSchoolsCount,      GROUP_CONCAT(School ORDER BY School ASC SEPARATOR ', ') AS ClosedSchoolNames,      GROUP_CONCAT(ClosedDate ORDER BY ClosedDate ASC SEPARATOR ', ') AS ClosureDates FROM      schools WHERE      StatusType = 'Closed' GROUP BY      County ORDER BY      ClosedSchoolsCount DESC LIMIT 1;	california_schools
SELECT s.Street AS PostalStreet, sname AS SchoolName FROM satscores AS sc JOIN schools AS s ON sc.cds = s.CDSCode WHERE sc.AvgScrMath IS NOT NULL ORDER BY sc.AvgScrMath DESC LIMIT 1 OFFSET 6;	california_schools
SELECT s.Street, s.StreetAbr, s.City, s.Zip, s.State, sch.Name FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds JOIN (     SELECT cds, AVG(AvgScrRead) as AvgReadScore     FROM satscores     GROUP BY cds     ORDER BY AvgReadScore ASC     LIMIT 1 ) AS low_score ON s.CDSCode = low_score.cds JOIN frpm sch ON s.CDSCode = sch.CDSCode WHERE sc.AvgScrRead IS NOT NULL;	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Lakeport' AND (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500;	california_schools
SELECT sname, SUM(NumTstTakr) AS TotalTestTakers FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.City = 'Fresno' GROUP BY sname;	california_schools
SELECT      s.CDSCode,      s.MailZip  FROM      schools s  JOIN      (SELECT          AdmLName1       FROM          schools       WHERE          AdmLName1 = 'Atoian') a  ON      s.AdmLName1 = a.AdmLName1;	california_schools
SELECT      (COUNT(CASE WHEN s.County = 'Colusa' THEN 1 END) / NULLIF(COUNT(CASE WHEN s.County = 'Humboldt' THEN 1 END), 0)) AS Ratio FROM      schools s WHERE      s.State = 'CA';	california_schools
SELECT COUNT(*) FROM schools WHERE State = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active';	california_schools
SELECT      s.Phone,      s.Ext  FROM      schools s  JOIN      satscores ss  ON      s.CDSCode = ss.cds  WHERE      ss.AvgScrWrite IS NOT NULL  ORDER BY      ss.AvgScrWrite DESC  LIMIT 1 OFFSET 332;	california_schools
SELECT School, Phone, Ext FROM schools WHERE Zip = '95203-3704';	california_schools
SELECT s.Website FROM schools s JOIN (     SELECT CDSCode     FROM schools     WHERE (AdmFName1 = 'Mike Larson' OR AdmLName1 = 'Larson' OR AdmFName2 = 'Mike Larson' OR AdmLName2 = 'Larson' OR AdmFName3 = 'Mike Larson' OR AdmLName3 = 'Larson')     AND (AdmFName1 = 'Dante Alvarez' OR AdmLName1 = 'Alvarez' OR AdmFName2 = 'Dante Alvarez' OR AdmLName2 = 'Alvarez' OR AdmFName3 = 'Dante Alvarez' OR AdmLName3 = 'Alvarez') ) as admins ON s.CDSCode = admins.CDSCode;	california_schools
SELECT Website FROM schools WHERE Charter = 1 AND Virtual = 'P' AND County = 'San Joaquin';	california_schools
SELECT COUNT(*) FROM schools WHERE Charter = 1 AND DOC = '52' AND City = 'Hickman';	california_schools
SELECT COUNT(*) FROM frpm WHERE County = 'Los Angeles'   AND Charter = 0   AND (`Free Meal Count (K-12)` * 100 / `Enrollment (K-12)`) < 0.18;	california_schools
SELECT s.School, s.City, a.AdmFName1, a.AdmLName1, a.AdmFName2, a.AdmLName2, a.AdmFName3, a.AdmLName3 FROM schools s JOIN schools a ON s.CDSCode = a.CDSCode WHERE s.Charter = 1 AND a.CharterNum = '00D2';	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT     (COUNT(CASE WHEN `Charter Funding Type` = 'Locally funded' THEN 1 END) * 100.0) /     COUNT(*) * 100 AS PercentageLocallyFunded FROM     frpm WHERE     `County` = 'Santa Clara'	california_schools
SELECT COUNT(*) FROM schools WHERE County = 'Stanislaus' AND FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND StatusType = 'Active';	california_schools
SELECT SUM(`FRPM Count (K-12)`) AS TotalFRPMCount FROM frpm WHERE `Academic Year` = '1989-1990' AND `City` = 'San Francisco' AND `School Type` = 'Community College District';	california_schools
SELECT County, COUNT(*) AS ClosureCount FROM schools WHERE SOC = '11' AND (OpenDate BETWEEN '1980-01-01' AND '1989-12-31') GROUP BY County ORDER BY ClosureCount DESC LIMIT 1;	california_schools
SELECT NCESDist FROM schools WHERE SOC = '31';	california_schools
SELECT      COUNT(*) AS Total,     SUM(CASE WHEN `StatusType` = 'Active' THEN 1 ELSE 0 END) AS Active,     SUM(CASE WHEN `StatusType` = 'Closed' THEN 1 ELSE 0 END) AS Closed FROM      frpm  JOIN      schools  ON      frpm.CDSCode = schools.CDSCode  WHERE      schools.County = 'Alpine'      AND (`StatusType` = 'Active' OR `StatusType` = 'Closed');	california_schools
SELECT District FROM schools WHERE City = 'Fresno' AND Magnet = 0;	california_schools
SELECT SUM(`Enrollment (Ages 5-17)`) AS TotalEnrollment FROM frpm WHERE `Academic Year` = '2014-2015'   AND `EdOpsCode` = 'SSS'   AND `School Name` LIKE '%State Special School%';	california_schools
SELECT `FRPM Count (Ages 5-17)`  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.MailingStreet = 'PO Box 1040' AND schools.StatusType = 'Youth Authority';	california_schools
SELECT MIN(`Low Grade`) AS Lowest_Grade FROM frpm WHERE `EdOpsCode` = 'SPECON' AND `NCESSchool` = '0613360';	california_schools
SELECT frpm.School Name, frpm.Educational Option Type FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.County Code = '37' AND frpm.`Educational Option Type` = 'Breakfast Provision 2';	california_schools
SELECT s.City FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.EILCode = 'HS' AND f.Low_Grade = '9' AND f.High_Grade = '12' AND s.County = 'Merced' AND f.NSLP_Provision_Status = 'Lunch Provision 2';	california_schools
SELECT      frpm.School Name,      (frpm.FRPM Count (Ages 5-17) / frpm.Enrollment (Ages 5-17) * 100) AS Percent_Eligible_FRPM FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.County = 'Los Angeles'     AND frpm.Low Grade = 'K'     AND frpm.High Grade = '9'	california_schools
SELECT `Grade Span Served` AS GradeSpan, COUNT(*) AS Count FROM frpm WHERE `City` = 'Adelanto' GROUP BY `Grade Span Served` ORDER BY Count DESC LIMIT 1;	california_schools
SELECT      County,      COUNT(*) AS NumberOfSchools FROM      schools WHERE      County BETWEEN 'San Diego' AND 'Santa Barbara'     AND Virtual = 0 GROUP BY      County ORDER BY      NumberOfSchools DESC LIMIT 1;	california_schools
SELECT School, Latitude FROM schools ORDER BY Latitude DESC LIMIT 1;	california_schools
SELECT City, School, `Low Grade` FROM schools WHERE State = 'CA' ORDER BY Latitude ASC LIMIT 1;	california_schools
SELECT      MAX(`Longitude`) AS max_longitude,      `High Grade`,      `Low Grade` FROM      frpm WHERE      `Longitude` IS NOT NULL GROUP BY      `High Grade`,      `Low Grade` ORDER BY      `Longitude` DESC LIMIT 1;	california_schools
SELECT      s.City,     COUNT(DISTINCT frpm.CDSCode) AS NumberOfSchools FROM      schools s JOIN      frpm ON s.CDSCode = frpm.CDSCode WHERE      s.Magnet = 1     AND frpm.`Educational Option Type` = 'K-8 Schools (Public)'     AND frpm.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY      s.City;	california_schools
SELECT     AdmFName1 AS FirstName,     District,     COUNT(*) AS Count,     RANK() OVER (PARTITION BY AdmFName1 ORDER BY COUNT(*) DESC) AS Rank FROM     schools WHERE     AdmFName1 IS NOT NULL GROUP BY     AdmFName1,     District ORDER BY     Rank ASC,     Count DESC LIMIT 2;	california_schools
SELECT      frpm.`Percent (%) Eligible Free (K-12)`,      frpm.`District Code` FROM      frpm JOIN      schools  ON      frpm.CDSCode = schools.CDSCode JOIN      (SELECT           AdmFName1       FROM           schools       WHERE           AdmFName1 = 'Alusine') AS adm ON      schools.AdmFName1 = adm.AdmFName1;	california_schools
SELECT      s.LastUpdate,      s.District,      s.County,      s.School FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      f.`Charter School Number` = '40' AND      s.Charter = 1;	california_schools
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND       District = 'San Bernardino City Unified' AND       OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND       SOC = '62' AND       DOC = '54' AND       EdOpsCode IN ('P', 'U')	california_schools
SELECT s.AdmEmail1, s.AdmEmail2, s.AdmEmail3, sname FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE (ss.AvgScrRead >= 1500 OR ss.AvgScrMath >= 1500 OR ss.AvgScrWrite >= 1500) AND s.CDSCode = (     SELECT cds     FROM satscores     GROUP BY cds     ORDER BY SUM(NumTstTakr) DESC     LIMIT 1 );	california_schools
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'East Bohemia' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp disp ON a.account_id = disp.account_id JOIN client c ON disp.client_id = c.client_id WHERE d.A3 = 'Prague' AND c.client_id NOT IN (     SELECT cl.client_id     FROM client cl     JOIN loan l ON cl.client_id = l.account_id     WHERE l.status = 'A' );	financial
SELECT     CASE         WHEN A12 > A13 THEN '1995'         ELSE '1996'     END AS YearWithHigherUnemployment,     GREATEST(A12, A13) AS HighestUnemploymentRate FROM     district WHERE     A12 IS NOT NULL AND A13 IS NOT NULL;	financial
SELECT COUNT(*) AS num_districts FROM district WHERE A11 > 6000 AND A11 < 10000 AND A6 = 'F';	financial
SELECT COUNT(client_id) FROM client JOIN district ON client.district_id = district.district_id WHERE gender = 'M' AND district.A3 = 'North Bohemia' AND district.A11 > 8000;	financial
SELECT      a.account_id,     (SELECT A11 FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = a.client_id ORDER BY A11 DESC LIMIT 1) -      (SELECT A11 FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = a.client_id ORDER BY A11 ASC LIMIT 1) AS salary_gap FROM      account a JOIN      client c ON a.client_id = c.client_id WHERE      c.gender = 'F' ORDER BY      (SELECT A11 FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = a.client_id ORDER BY A11 ASC LIMIT 1) ASC;	financial
SELECT client_id FROM client WHERE birth_date = (SELECT MIN(birth_date) FROM client) AND district_id IN (     SELECT district_id     FROM district     ORDER BY A11 DESC     LIMIT 1 ) ORDER BY A11 DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND t.type = 'DISPONENT';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE YEAR(l.date) = 1997 AND l.status = 'A' AND a.frequency = 'POPLATEK TYDNE' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND a.date LIKE '1993%' ORDER BY l.amount DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'F'  AND c.birth_date < '1950-01-01'  AND d.A2 = 'Sokolov';	financial
SELECT a.account_id, MIN(a.date) as earliest_trade_date FROM account a WHERE YEAR(a.date) = 1995 GROUP BY a.account_id ORDER BY earliest_trade_date ASC LIMIT 1;	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.balance > 3000 GROUP BY a.account_id;	financial
SELECT c.client_id FROM client c JOIN card cd ON c.client_id = cd.disp_id WHERE cd.issued = '1994-03-03';	financial
SELECT account.date FROM account JOIN trans ON account.account_id = trans.account_id WHERE trans.amount = 840 AND trans.date = '1998-10-14'	financial
SELECT d.district_id FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE l.date = '1994-08-25' AND d.type = 'OWNER';	financial
SELECT MAX(amount) AS biggest_transaction_amount FROM trans JOIN card ON trans.account_id = card.card_id JOIN disp ON trans.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE card.issued = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (SELECT MIN(birth_date) FROM client) AND d.A11 = (SELECT MAX(A11) FROM district);	financial
SELECT      t.amount AS first_transaction_amount FROM      trans t JOIN      account a ON t.account_id = a.account_id JOIN      loan l ON a.account_id = l.account_id JOIN      disp d ON a.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      l.amount = (SELECT MAX(amount) FROM loan) ORDER BY      t.date ASC LIMIT 1;	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE district.A2 = 'Jesenik' AND client.gender = 'F';	financial
SELECT d.disp_id FROM disp d JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id JOIN client c ON d.client_id = c.client_id WHERE t.amount = 5100 AND t.date = '1998-09-02';	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Litomerice' AND YEAR(account.date) = 1996;	financial
SELECT d.A2 FROM account a JOIN client c ON a.district_id = c.district_id JOIN disp d ON a.account_id = d.account_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'Prague' ORDER BY a.date ASC LIMIT 1;	financial
SELECT     (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(c.gender) AS male_client_percentage FROM     client c JOIN     district d ON c.district_id = d.district_id WHERE     d.A3 = 'Jihoceske'     AND d.A4 = 'Jihocesky kraj' ORDER BY     d.A9 DESC LIMIT 1;	financial
SELECT     ((MAX(t.balance) - MIN(t.balance)) / MIN(t.balance) * 100) AS balance_increase_rate FROM     trans t JOIN     loan l ON t.account_id = l.account_id JOIN     client c ON t.account_id IN (SELECT account_id FROM disp WHERE client_id = c.client_id) WHERE     c.birth_date <= '1993-07-05'     AND t.date BETWEEN '1993-03-22' AND '1998-12-27'     AND l.status = 'A'     AND l.date <= '1993-07-05' GROUP BY     c.client_id;	financial
SELECT     ROUND(         (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) * 100.0) /          SUM(l.amount), 2     ) AS percentage_fully_paid FROM     loan l;	financial
SELECT     (SUM(CASE WHEN l.amount < 100000 AND l.status = 'C' THEN 1 ELSE 0 END) /       SUM(CASE WHEN l.amount < 100000 THEN 1 ELSE 0 END)) * 100 AS percentage_accounts_running_no_issue FROM     loan l WHERE     l.amount < 100000;	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date BETWEEN '1993-01-01' AND '1993-12-31' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.frequency FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dt ON d.district_id = dt.district_id WHERE dt.A2 = 'East Bohemia' AND a.date BETWEEN '1995-01-01' AND '2000-12-31' JOIN client c ON d.client_id = c.client_id;	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice';	financial
SELECT d.A2 AS district, d.A3 AS region FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount > 300000;	financial
SELECT      l.loan_id,      d.A3 AS district,      d.A11 AS average_salary FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      disp d ON a.account_id = d.account_id JOIN      district dt ON d.district_id = dt.district_id WHERE      l.duration = 60;	financial
SELECT d.A5, (d.A13 - d.A12) / d.A12 * 100 AS unemployment_increment_rate FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE l.status = 'D' AND d.A12 IS NOT NULL AND d.A13 IS NOT NULL AND d.A12 != 0 AND l.date BETWEEN '1995-01-01' AND '1996-12-31';	financial
SELECT      (COUNT(*) FILTER (WHERE d.A2 = 'Decin' AND a.date LIKE '1993%')) * 100.0 / COUNT(*) FROM      account a JOIN      district d ON a.district_id = d.district_id;	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT d.A2, COUNT(cl.client_id) AS female_account_holders FROM district d JOIN client c ON d.district_id = c.district_id JOIN disp d2 ON c.client_id = d2.client_id JOIN account a ON d2.account_id = a.account_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_account_holders DESC LIMIT 9;	financial
SELECT d.A2 AS district_name, SUM(t.amount) AS total_withdrawals FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND a.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dt ON d.district_id = dt.district_id WHERE dt.A3 = 'South Bohemia' AND a.account_id NOT IN (     SELECT c.card_id     FROM card c     JOIN disp d ON c.disp_id = d.disp_id     WHERE d.account_id = a.account_id );	financial
SELECT district.A3 AS district_name, COUNT(loan.loan_id) AS active_loan_count FROM district JOIN account ON district.district_id = account.district_id JOIN loan ON account.account_id = loan.account_id WHERE loan.status IN ('C', 'D') GROUP BY district.district_id ORDER BY active_loan_count DESC LIMIT 1;	financial
SELECT AVG(loan.amount) AS average_loan_amount FROM loan JOIN client ON loan.account_id IN (SELECT account_id FROM account JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id) WHERE client.gender = 'M';	financial
SELECT A2 AS branch_location, A6 AS district_name FROM district WHERE A13 = (SELECT MAX(A13) FROM district WHERE YEAR(date_column) = 1996) AND YEAR(date_column) = 1996;	financial
SELECT COUNT(a.account_id) AS num_accounts_opened FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A16 = (SELECT MAX(A16) FROM district WHERE A4 = 'central Bohemia' AND A5 = 'Prague' AND A6 = '0');	financial
SELECT COUNT(DISTINCT account_id) FROM trans JOIN account ON trans.account_id = account.account_id WHERE trans.operation = 'VYBER KARTOU' AND account.frequency = 'POPLATEK MESICNE' AND trans.balance < 0;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND l.amount >= 250000 AND l.date BETWEEN '1995-01-01' AND '1997-12-31';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id JOIN disp d ON a.account_id = d.account_id JOIN district dt ON d.district_id = dt.district_id WHERE dt.A2 = 'Hl.m. Praha' AND (l.status = 'C' OR l.status = 'D');	financial
SELECT COUNT(c.client_id)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A15 = (     SELECT A15      FROM district      WHERE A15 = (         SELECT MAX(A15)          FROM district          WHERE A15 < (SELECT MAX(A15) FROM district)     ) ) AND c.gender = 'M';	financial
SELECT COUNT(*)  FROM card c  JOIN disp d ON c.card_id = d.card_id  WHERE c.type = 'gold' AND d.type = 'OWNER';	financial
SELECT COUNT(a.account_id) AS account_count FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek';	financial
SELECT d.A2 AS District, SUM(t.amount) AS Total_Transactions FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE YEAR(t.date) = 1997 AND t.amount > 10000 GROUP BY d.A2 HAVING SUM(t.amount) > 10000;	financial
SELECT DISTINCT a.account_id FROM account a JOIN "order" o ON a.account_id = o.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek' AND o.k_symbol = 'SIPO';	financial
SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'gold';	financial
SELECT AVG(amount) as average_credit_card_amount FROM trans WHERE type = 'PRIJEM' AND operation = 'VYBER KARTOU' AND date >= '2021-01-01' AND date < '2022-01-01';	financial
SELECT DISTINCT t.account_id FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.date BETWEEN '1998-01-01' AND '1998-12-31' AND t.operation = 'VYBER KARTOU' AND t.amount < (SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND date BETWEEN '1998-01-01' AND '1998-12-31')	financial
SELECT DISTINCT c.client_id, c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN card cr ON a.account_id = cr.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' AND cr.type = 'gold';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account AS ac JOIN disp AS d ON ac.account_id = d.account_id JOIN client AS c ON d.client_id = c.client_id JOIN district AS dt ON c.district_id = dt.district_id WHERE c.gender = 'F' AND dt.A3 = 'South Bohemia';	financial
SELECT account.account_id FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Tabor' AND account.type = 'OWNER';	financial
SELECT a.frequency FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.account_id NOT IN (     SELECT account_id     FROM disp     WHERE type = 'OWNER' ) AND d.A11 BETWEEN 8000 AND 9000 AND a.frequency != 'OWNER';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dt ON d.district_id = dt.district_id JOIN trans t ON a.account_id = t.account_id WHERE dt.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT DISTINCT d.A2 AS district_name FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(A15) AS avg_crimes FROM district WHERE A3 IN ('Hl.m. Praha', 'Benesov', 'Beroun', 'Kladno', 'Kolin') AND A15 > 4000 AND EXISTS (     SELECT 1     FROM account     WHERE account.district_id = district.district_id     AND date >= '1997-01-01' );	financial
SELECT COUNT(c.card_id)  FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN account a ON d.account_id = a.account_id WHERE c.type = 'classic' AND d.type = 'OWNER';	financial
SELECT COUNT(client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'M' AND district.A2 = 'Hl.m. Praha';	financial
SELECT     (COUNT(CASE WHEN c.type = 'gold' AND c.issued < '1998-01-01' THEN 1 END) * 100.0) / COUNT(c.card_id) AS gold_card_percentage FROM     card c;	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE d.type = 'OWNER' AND l.amount = (SELECT MAX(amount) FROM loan);	financial
SELECT district.A15 FROM district JOIN account ON district.district_id = account.district_id WHERE account.account_id = 532;	financial
SELECT a.district_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 33333;	financial
SELECT t.account_id, t.date, t.amount FROM trans t JOIN client c ON t.account_id = c.account_id WHERE c.client_id = 3356 AND t.operation = 'VYBER';	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND       EXISTS (           SELECT 1           FROM loan           WHERE loan.account_id = account.account_id AND loan.amount < 200000       );	financial
SELECT c.type FROM card c JOIN disp d ON c.card_id = d.card_id JOIN client cl ON d.client_id = cl.client_id WHERE cl.client_id = 13539;	financial
SELECT d.A3 AS region FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = 3541;	financial
SELECT district.A2 FROM district JOIN account ON district.district_id = account.district_id JOIN loan ON account.account_id = loan.account_id WHERE loan.status = 'A' GROUP BY district.A2 ORDER BY COUNT(account.account_id) DESC LIMIT 1;	financial
SELECT c.client_id FROM `order` o JOIN disp d ON o.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE o.order_id = 32423;	financial
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN district dt ON d.district_id = dt.district_id WHERE dt.district_id = 5;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Jesenik';	financial
SELECT DISTINCT c.client_id FROM client c JOIN card crd ON c.client_id = crd.disp_id JOIN disp d ON c.client_id = d.client_id WHERE crd.type = 'junior' AND crd.issued >= '1997-01-01';	financial
SELECT     (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(c.client_id) AS percentage_female_clients FROM     client c JOIN     district d ON c.district_id = d.district_id WHERE     d.A11 > 10000;	financial
SELECT      (SUM(CASE WHEN YEAR(date) = 1997 THEN amount ELSE 0 END) -       SUM(CASE WHEN YEAR(date) = 1996 THEN amount ELSE 0 END)) /      SUM(CASE WHEN YEAR(date) = 1996 THEN amount ELSE 0 END) * 100 AS growth_rate FROM      loan WHERE      client_id IN (SELECT client_id FROM client WHERE gender = 'M')     AND YEAR(date) IN (1996, 1997);	financial
SELECT COUNT(*)  FROM trans  JOIN card ON trans.account_id = card.card_id  WHERE trans.operation = 'VYBER KARTOU' AND trans.date > '1995-12-31';	financial
SELECT      (SUM(CASE WHEN A3 = 'central Bohemia' THEN A16 ELSE 0 END) -       SUM(CASE WHEN A3 = 'East Bohemia' THEN A16 ELSE 0 END)) AS diff_crimes FROM      district WHERE      A3 IN ('central Bohemia', 'East Bohemia') AND      A16 IS NOT NULL;	financial
SELECT      SUM(CASE WHEN d.type = 'OWNER' THEN 1 ELSE 0 END) AS owner_count,     SUM(CASE WHEN d.type = 'DISPONENT' THEN 1 ELSE 0 END) AS disponent_count FROM      disp d WHERE      d.account_id BETWEEN 1 AND 10;	financial
SELECT      COUNT(*) AS statement_requests,     SUM(CASE WHEN operation = 'DEBIT' AND k_symbol = '3539' THEN amount ELSE 0 END) AS total_debit_3539 FROM      `trans` WHERE      account_id = 3 AND      type = 'PRIJEM' AND      k_symbol = 'STAVKA';	financial
SELECT      c.birth_date FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      account a ON d.account_id = a.account_id WHERE      a.account_id = 130 AND d.type = 'OWNER' LIMIT 1;	financial
SELECT COUNT(DISTINCT d.account_id) FROM disp d JOIN account a ON d.account_id = a.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT      l.amount AS loan_amount,     SUM(l.payments) AS total_payments,     (l.amount - SUM(l.payments)) AS remaining_debt FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      disp d ON a.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      c.client_id = 992 GROUP BY      l.account_id, l.amount;	financial
SELECT SUM(t.amount) AS total_sum, c.gender FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.client_id = 4 AND t.k_symbol = '851' GROUP BY c.gender;	financial
SELECT card.type FROM card JOIN disp ON card.disp_id = disp.disp_id JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 9;	financial
SELECT SUM(trans.amount) AS total_payment FROM trans JOIN account ON trans.account_id = account.account_id JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 617 AND trans.date BETWEEN '1998-01-01' AND '1998-12-31';	financial
SELECT c.client_id FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A3 = 'East Bohemia';	financial
SELECT c.client_id FROM client c JOIN loan l ON c.client_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN trans t ON d.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.k_symbol = 'SIPO' AND t.amount > 4000;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Beroun' AND account.date > '1996-12-31';	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.card_id = cr.card_id WHERE c.gender = 'F' AND cr.type = 'junior';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(c.client_id) AS female_percentage FROM      account a JOIN      disp d ON a.account_id = d.account_id JOIN      district dt ON d.district_id = dt.district_id JOIN      client c ON d.client_id = c.client_id WHERE      dt.A3 = 'Prague';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(CASE WHEN a.frequency = 'POPLATEK TYDNE' THEN 1 END) AS male_clients_percentage FROM      account a JOIN      client c ON a.account_id = c.account_id WHERE      a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT a.account_id, MIN(l.amount) AS min_approved_amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' GROUP BY a.account_id ORDER BY min_approved_amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND d.A11 = (SELECT MIN(A11) FROM district) ORDER BY c.birth_date DESC LIMIT 1;	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE client.birth_date BETWEEN '1920-01-01' AND '1920-12-31' AND district.A3 = 'east Bohemia';	financial
SELECT COUNT(*) FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration = 24 AND account.frequency = 'POPLATEK TYDNE';	financial
SELECT AVG(l.amount) AS average_loan_amount FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.status IN ('C', 'D') AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT c.client_id, d.A2 FROM client c JOIN disp d ON c.district_id = d.client_id WHERE d.type = 'OWNER'	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card crd ON d.disp_id = crd.disp_id JOIN account acc ON d.account_id = acc.account_id JOIN loan l ON acc.account_id = l.account_id WHERE crd.type = 'gold' AND d.type = 'OWNER';	financial
SELECT bond_type, COUNT(bond_type) AS frequency FROM bond GROUP BY bond_type ORDER BY frequency DESC LIMIT 1;	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' AND atom.element = 'cl';	toxicology
SELECT AVG(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) as avg_oxygen_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT      COUNT(CASE WHEN b.bond_type = '-' THEN 1 END) / COUNT(a.atom_id) AS avg_single_bonded_carcinogens FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+' GROUP BY      a.molecule_id;	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'na' AND molecule.label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id) AS percentage_of_carbon FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '=' JOIN      molecule m ON a.molecule_id = m.molecule_id	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c';	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR004_8_9' OR a.atom_id = (SELECT atom_id2 FROM connected WHERE bond_id = 'TR004_8_9');	toxicology
SELECT DISTINCT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE b.bond_type = '=';	toxicology
SELECT m.label, COUNT(a.atom_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.element = 'cl';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN connected c2 ON c1.atom_id2 = c2.atom_id JOIN molecule m ON c1.molecule_id = m.molecule_id WHERE m.label = '-' AND a1.atom_id < a2.atom_id; -- to avoid duplicate pairs	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT bond_type  FROM connected  WHERE (atom_id = 'TR004_8' AND atom_id2 = 'TR004_20') OR (atom_id = 'TR004_20' AND atom_id2 = 'TR004_8') AND bond_id IN (SELECT bond_id FROM bond);	toxicology
SELECT m.label FROM molecule m WHERE m.molecule_id NOT IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element <> 'sn' ) AND m.label IN ('+', '-');	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('i', 's') AND b.bond_type = '-';	toxicology
SELECT DISTINCT a1.atom_id, a2.atom_id FROM connected c1 JOIN connected c2 ON c1.bond_id = c2.bond_id AND c1.atom_id < c2.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN atom a1 ON c1.atom_id = a1.atom_id JOIN atom a2 ON c2.atom_id = a2.atom_id WHERE b.bond_type = '#';	toxicology
SELECT DISTINCT a1.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN atom a2 ON c1.atom_id2 = a2.atom_id WHERE a2.molecule_id = 'TR181' OR a1.molecule_id = 'TR181';	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'f' THEN 1 ELSE 0 END) * 100) / COUNT(DISTINCT a.atom_id), 2) AS percentage_fluorine_free_carcinogens FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+' AND      a.element != 'f';	toxicology
SELECT      COUNT(b.bond_id) * 100.0 / (SELECT COUNT(*) FROM bond WHERE bond_type = '#') AS percent FROM      bond b JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      m.label = '+' AND b.bond_type = '#';	toxicology
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR000' GROUP BY element ORDER BY COUNT(*) DESC, element ASC LIMIT 3;	toxicology
SELECT a1.atom_id AS AtomID1, a2.atom_id AS AtomID2 FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN connected c2 ON a2.atom_id = c2.atom_id WHERE b.bond_id = 'TR001_2_6' AND b.molecule_id = 'TR001' AND a1.atom_id <> a2.atom_id;	toxicology
SELECT (SELECT COUNT(*) FROM molecule WHERE label = '+') - (SELECT COUNT(*) FROM molecule WHERE label = '-') AS diff_carcinogenic_noncarcinogenic;	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5';	toxicology
SELECT bond_id FROM connected WHERE atom_id = 'TR000_2' OR atom_id2 = 'TR000_2';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id, m.label ORDER BY m.label ASC LIMIT 5;	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008' AND bond_type = '=';	toxicology
SELECT ROUND(DIVIDE(SUM(CASE WHEN `molecule`.`label` = '+' THEN 1 ELSE 0 END), COUNT(`molecule`.`molecule_id`)) * 100, 3) AS `percentage_of_carcinogenic_molecules` FROM `molecule`	toxicology
SELECT      ROUND(         (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 100) / COUNT(a.atom_id),          4     ) AS percent FROM      atom a WHERE      a.molecule_id = 'TR206'	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.molecule_id = 'TR000';	toxicology
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR060';	toxicology
SELECT bond_type,         CASE WHEN COUNT(bond_type) > (SELECT COUNT(*) / 2 FROM bond WHERE molecule_id = 'TR010') THEN 'Yes'             ELSE 'No' END AS is_carcinogenic FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1;	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON a.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE m.label = '-' AND b.bond_type = '-' AND a.atom_id != c.atom_id GROUP BY m.molecule_id ORDER BY m.molecule_id LIMIT 3;	toxicology
SELECT bond_id, bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM `connected` WHERE `atom_id` = 'TR009_12' OR `atom_id2` = 'TR009_12';	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND atom.element = 'br';	toxicology
SELECT b.bond_type, a1.atom_id AS atom1, a2.atom_id AS atom2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_6_9';	toxicology
SELECT m.label AS molecule_label, m.label AS carcinogenicity FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT molecule_id)  FROM bond  WHERE bond_type = '#';	toxicology
SELECT COUNT(DISTINCT c.bond_id) AS connection_count FROM connected c WHERE c.atom_id LIKE 'TR%_19' OR c.atom_id2 LIKE 'TR%_19';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT b.bond_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c1.atom_id2 WHERE a1.element = 'p' OR a2.element = 'n';	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT AVG(COUNT(b.bond_id)) / COUNT(a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'i';	toxicology
SELECT bond.bond_id, bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id WHERE atom.atom_id = 'TR000_45' OR atom.atom_id = 'TR000_45' AND (bond.bond_type = '=' OR bond.bond_type = '-' OR bond.bond_type = '#');	toxicology
SELECT a.element FROM atom a LEFT JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id IS NULL;	toxicology
SELECT a1.atom_id AS atom1, a2.atom_id AS atom2 FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c1.atom_id2 WHERE b.molecule_id = 'TR041' AND b.bond_type = '#';	toxicology
SELECT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR144_8_19';	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT DISTINCT a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'pb' AND a2.element <> 'pb';	toxicology
SELECT DISTINCT a.element  FROM atom a JOIN bond b ON a.atom_id = b.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT      bond_type,     COUNT(bond.bond_id) AS total_bonds,     (COUNT(bond.bond_id) * 100.0) /      (SELECT COUNT(DISTINCT atom_id) FROM atom) AS percentage FROM      bond JOIN      connected ON bond.bond_id = connected.bond_id JOIN      atom AS atom1 ON connected.atom_id = atom1.atom_id JOIN      atom AS atom2 ON connected.atom_id2 = atom2.atom_id GROUP BY      bond_type ORDER BY      percentage DESC LIMIT 1;	toxicology
SELECT ROUND((SUM(CASE WHEN bond.bond_type = '-' THEN 1 ELSE 0 END) * 100) / COUNT(bond.bond_id), 5) AS proportion_of_carcinogenic_single_bonds FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT DISTINCT a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 's' AND a2.element = 's';	toxicology
SELECT bond.bond_type FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE b.bond_type = '-';	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br');	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.label = '+';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100 AS percentage_cl FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '-';	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';	toxicology
SELECT bond_type  FROM bond  WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(*) FROM atom JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 WHERE atom.element = 'i';	toxicology
SELECT      molecule.molecule_id,      MAX(molecule.label) AS carcinogenicity FROM      atom  JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      atom.element = 'ca' GROUP BY      molecule.molecule_id;	toxicology
SELECT EXISTS (     SELECT 1     FROM atom a1     JOIN connected c ON a1.atom_id = c.atom_id     JOIN atom a2 ON a2.atom_id = c.atom_id2     JOIN bond b ON b.bond_id = c.bond_id     WHERE a1.element = 'cl' AND a2.element = 'c' AND b.bond_id = 'TR001_1_8' ) AS has_chlorine_and_carbon;	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'c' AND b.bond_type = '#' AND m.label = '-';	toxicology
SELECT      SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100 / COUNT(a.molecule_id) AS percentage FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+' AND a.element = 'cl';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id IN (     SELECT bond_id     FROM connected     WHERE atom_id = 'TR001' ) AND a.molecule_id = (     SELECT molecule_id     FROM connected     WHERE atom_id = 'TR001' );	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '=' AND molecule_id IN (SELECT molecule_id FROM connected);	toxicology
SELECT DISTINCT c1.atom_id, c2.atom_id FROM connected c1 JOIN connected c2 ON c1.bond_id = c2.bond_id JOIN bond b ON c1.bond_id = b.bond_id WHERE b.bond_type = '#' AND c1.atom_id < c2.atom_id;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(*) FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-';	toxicology
SELECT `molecule`.`label` FROM `molecule` JOIN `bond` ON `molecule`.`molecule_id` = `bond`.`molecule_id` WHERE `bond`.`bond_id` = 'TR001_10_11';	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '=' AND molecule.label = '+';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.atom_id LIKE 'TR%4' GROUP BY m.molecule_id;	toxicology
SELECT      m.label AS label,     (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) AS hydrogen_ratio FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.molecule_id = 'TR006' GROUP BY      m.label;	toxicology
SELECT m.label FROM `molecule` m JOIN `atom` a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND m.label = '+';	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'c';	toxicology
SELECT DISTINCT a1.element, a2.element FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT      (COUNT(CASE WHEN b.bond_type = '#' THEN 1 END) * 100.0) / COUNT(*) AS triple_bond_percentage FROM      connected c JOIN      bond b ON c.bond_id = b.bond_id JOIN      molecule m ON c.molecule_id = m.molecule_id;	toxicology
SELECT      COUNT(CASE WHEN b.bond_type = '=' THEN 1 END) / COUNT(b.bond_id) * 100 AS percent FROM      bond b JOIN      connected c ON b.bond_id = c.bond_id WHERE      b.molecule_id = 'TR047';	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_1';	toxicology
SELECT COUNT(*)  FROM `molecule`  WHERE `molecule_id` = 'TR151' AND `label` = '+';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR151' AND a.element IN ('cl', 'br', 'i', 'sn', 'pb', 'te');	toxicology
SELECT COUNT(DISTINCT `molecule_id`)  FROM `molecule`  WHERE `label` = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.element = 'c' AND a.molecule_id BETWEEN 'TR010' AND 'TR050' AND LENGTH(a.molecule_id) = 6 AND SUBSTR(a.molecule_id, 4, 3) BETWEEN '010' AND '050';	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+' AND b.bond_type = '=';	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'h' AND a.molecule_id IN (     SELECT c.molecule_id     FROM connected c     JOIN bond b ON c.bond_id = b.bond_id     WHERE b.bond_type = '=' );	toxicology
SELECT c.molecule_id FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE c.atom_id = 'TR000_1' AND b.bond_id = 'TR000_1_2';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label != '-';	toxicology
SELECT      DIVIDE(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END), COUNT(DISTINCT m.molecule_id)) * 100.0 AS percentage FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      molecule m ON c.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id = 'TR124' AND label = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR186';	toxicology
SELECT `bond_type` FROM `bond` JOIN `connected` ON `bond.bond_id` = `connected.bond_id` WHERE `connected.atom_id` = 'TR007_4' OR `connected.atom_id2` = 'TR007_4' AND `connected.atom_id2` = 'TR007_19' OR `connected.atom_id` = 'TR007_19';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN connected c2 ON c1.atom_id2 = c2.atom_id JOIN atom a2 ON c2.atom_id2 = a2.atom_id WHERE c1.bond_id = 'TR001_2_4' AND a1.atom_id != a2.atom_id	toxicology
SELECT      COUNT(CASE WHEN bond.bond_type = '=' THEN 1 END) AS double_bonds_count,     CASE WHEN molecule.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM      atom JOIN      bond ON atom.molecule_id = bond.molecule_id JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      atom.molecule_id = 'TR006'	toxicology
SELECT m.molecule_id, GROUP_CONCAT(a.element ORDER BY a.element) AS elements FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id;	toxicology
SELECT b.bond_id, a1.atom_id AS atom_id1, a2.atom_id AS atom_id2 FROM bond b JOIN connected c1 ON b.bond_id = c1.bond_id JOIN atom a1 ON c1.atom_id = a1.atom_id JOIN connected c2 ON c1.atom_id2 = c2.atom_id JOIN atom a2 ON c2.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT m.molecule_id, GROUP_CONCAT(DISTINCT a.element ORDER BY a.element) AS elements FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE b.bond_type = '=' GROUP BY m.molecule_id;	toxicology
SELECT a1.element AS atom1_element, a2.element AS atom2_element FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN connected c2 ON c.atom_id2 = c2.atom_id JOIN atom a2 ON c2.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a1.element = 'c' AND a2.element = 'cl' AND b.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'cl';	toxicology
SELECT    a.atom_id,    COUNT(DISTINCT c.bond_id) AS bond_types_count FROM    atom a JOIN    connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE    a.molecule_id = 'TR346' GROUP BY    a.atom_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS double_bonded_carcinogens FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id LEFT JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 LEFT JOIN bond b ON c.bond_id = b.bond_id WHERE a.element != 's' AND b.bond_type != '=';	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT   COUNT(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 END) * 100.0 / COUNT(T1.molecule_id) AS percentage FROM   molecule AS T1 JOIN   atom AS T2 ON T1.molecule_id = T2.molecule_id	toxicology
SELECT `molecule_id` FROM `bond` WHERE `bond_id` = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element) AS element_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_3_4' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT bond_type  FROM connected  JOIN bond ON connected.bond_id = bond.bond_id  WHERE connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2';	toxicology
SELECT m.label AS molecule_label FROM `molecule` m JOIN `atom` a1 ON m.molecule_id = a1.molecule_id JOIN `atom` a2 ON m.molecule_id = a2.molecule_id WHERE a1.atom_id = 'TR000_2' AND a2.atom_id = 'TR000_4';	toxicology
SELECT `element`  FROM `atom`  WHERE `atom_id` = 'TR000_1';	toxicology
SELECT      m.molecule_id,      m.label  FROM      molecule m  WHERE      m.molecule_id = 'TR000' AND      m.label = '+';	toxicology
SELECT      (SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id) AS percentage FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND (SELECT COUNT(*) FROM atom WHERE molecule_id = m.molecule_id) > 5;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.element IN ('c', 'o', 's', 'n', 'p', 'f', 'br', 'i', 'sn', 'pb', 'te', 'ca') AND a.molecule_id = 'TR024';	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      (SELECT COUNT(*) FROM `molecule` WHERE `label` = '+') /      (SELECT COUNT(DISTINCT `molecule_id`) FROM `atom` JOIN `connected` ON `atom.atom_id` = `connected.atom_id`       WHERE `atom.element` = 'h' AND `bond.bond_type` = '#') * 100.0	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label = '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS total_double_bonded_oxygen_molecules FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'o' AND b.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' AND m.label = '-';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR002';	toxicology
SELECT DISTINCT c1.atom_id FROM connected c1 JOIN connected c2 ON c1.atom_id2 = c2.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN atom a1 ON c1.atom_id = a1.atom_id JOIN atom a2 ON c2.atom_id = a2.atom_id WHERE a1.element = 'c' AND b.bond_type = '=' AND c1.molecule_id = 'TR012' AND c2.molecule_id = 'TR012' AND c1.atom_id < c2.atom_id;	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT c.name, c.mtgoId, c.scryfallId FROM cards c WHERE c.borderColor = 'borderless' AND c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL AND NOT EXISTS (     SELECT 1     FROM sets s     WHERE c.setCode = s.code     AND s.name LIKE '%Foreign%' ) AND NOT EXISTS (     SELECT 1     FROM sets s     WHERE c.setCode = s.code     AND s.name LIKE '%Foreign%'     AND s.isFoilOnly = 1 );	card_games
SELECT name FROM cards WHERE convertedManaCost < MAX(faceConvertedManaCost)	card_games
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015';	card_games
SELECT c.name, c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned';	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.type LIKE '%Artifact%' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power = '*' OR c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT c.id FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel' AND r.text LIKE '%rulings%';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT c.name, c.artist, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.uuid ORDER BY COUNT(r.uuid) DESC LIMIT 1;	card_games
SELECT language FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.name = 'Annul' AND cards.number = '29';	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN foreign_data.language = 'Chinese Simplified' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage_simplified_chinese FROM      cards JOIN      foreign_data ON cards.uuid = foreign_data.uuid;	card_games
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type)  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes  FROM cards  WHERE name = 'Duress';	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType  FROM cards  WHERE name = 'Ancestor''s Chosen';	card_games
SELECT st.language FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Cloudchaser Eagle';	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT rulings.text FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.name = 'Benalish Knight' AND rulings.text LIKE '%Rule of playing%'	card_games
SELECT artist FROM cards WHERE asciiName = 'Phyrexian';	card_games
SELECT      (COUNT(CASE WHEN cards.borderColor = 'borderless' THEN 1 END) * 100.0) / COUNT(cards.id) AS percentage_borderless_cards FROM cards;	card_games
SELECT COUNT(*) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND EXISTS (     SELECT 1     FROM foreign_data     WHERE cards.uuid = foreign_data.uuid AND foreign_data.language = 'Russian' );	card_games
SELECT      (COUNT(CASE WHEN fd.language = 'French' AND c.isStorySpotlight = 1 THEN 1 END) * 100.0) /      COUNT(CASE WHEN c.isStorySpotlight = 1 THEN 1 END) AS percentage_of_French_story_spotlight_cards FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords LIKE '%Flying%'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND id NOT IN (     SELECT id     FROM cards     WHERE subtypes LIKE '%Angel%' )	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.hasFoil = 1 AND c.hasNonFoil = 1 AND c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL AND l.format = 'commander';	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank  FROM cards  WHERE frameVersion = '2015';	card_games
SELECT c.artist  FROM cards c  JOIN set_translations st ON c.setCode = st.setCode  WHERE st.language = 'Chinese Simplified';	card_games
SELECT c.* FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability = 'paper' AND fd.language = 'Japanese';	card_games
SELECT COUNT(*) FROM cards WHERE status = 'Banned' AND borderColor = 'white';	card_games
SELECT c.uuid, fd.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data fd ON c.uuid = fd.uuid WHERE l.format = 'legacy' AND fd.language IS NOT NULL;	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT COUNT(*) AS total_cards_with_future_frame FROM cards WHERE frameVersion = 'future' AND id IN (     SELECT uuid     FROM legalities     WHERE status = 'legal' );	card_games
SELECT c.name, c.colorIdentity FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW';	card_games
SELECT c.name, st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT cards.colorIdentity, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.id BETWEEN 1 AND 20;	card_games
SELECT c.name, c.uuid FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language != 'English';	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL AND power = '0';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability LIKE '%mtgo%' AND hand = '-1';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability LIKE '%paper%' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal'    AND frameVersion = '2003'   AND borderColor = 'black'   AND availability = 'mtgo,paper';	card_games
SELECT SUM(convertedManaCost) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT type FROM cards WHERE availability = 'arena';	card_games
SELECT s.code FROM cards c JOIN set_translations st ON c.uuid = st.uuid JOIN sets s ON st.setCode = s.code WHERE st.language = 'Spanish';	card_games
SELECT      ROUND((COUNT(CASE WHEN frameEffects = 'legendary' AND isOnlineOnly = 1 THEN 1 END) * 100.0) / COUNT(id), 2) AS legendary_online_percentage FROM      cards WHERE      frameEffects = 'legendary';	card_games
SELECT      (SUM(CASE WHEN c.isStorySpotlight = 1 AND c.isTextless = 0 THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN c.isStorySpotlight = 1 THEN 1 ELSE 0 END) AS PercentageWithoutTextBox FROM      cards c;	card_games
SELECT      name,      ROUND((SUM(CASE WHEN f.language = 'Spanish' THEN 1 ELSE 0 END) * 100.0) / COUNT(c.id), 2) AS percentage_Spanish FROM      cards c LEFT JOIN      foreign_data f ON c.uuid = f.uuid GROUP BY      c.name ORDER BY      percentage_Spanish DESC;	card_games
SELECT DISTINCT t.language FROM sets s JOIN set_translations t ON s.code = t.setCode WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT id FROM cards WHERE type LIKE '%Creature%' AND id IN (SELECT uuid FROM legalities WHERE status = 'Legal');	card_games
SELECT DISTINCT subtypes, supertypes FROM cards WHERE subtypes IS NOT NULL AND supertypes IS NOT NULL AND (language = 'German' OR flavorText LIKE '%German%') ORDER BY subtypes, supertypes;	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'premodern' AND cards.side IS NULL AND EXISTS (     SELECT 1     FROM rulings     WHERE rulings.uuid = cards.uuid     AND rulings.text LIKE '%triggered mana ability%' );	card_games
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability = 'paper' AND uuid IN (     SELECT uuid     FROM legalities     WHERE format = 'pauper' AND status = 'Legal' );	card_games
SELECT cards.artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.text = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.artist = 'Matthew D. Wilson' AND c.type LIKE '%Creature%' AND c.layout = 'normal' AND c.borderColor = 'black' AND f.language = 'French';	card_games
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01';	card_games
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 180 AND s.block = 'Ravnica';	card_games
SELECT      ROUND(         (COUNT(CASE WHEN hasContentWarning = 0 THEN 1 END) * 100.0) / COUNT(*),          2     ) AS percentageWithoutContentWarning FROM      cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE      legalities.format = 'commander'      AND legalities.status = 'Legal';	card_games
SELECT     (COUNT(CASE WHEN cards.power IS NULL OR cards.power = '*' THEN 1 END AND foreign_data.language = 'French' END) * 100.0 /      COUNT(CASE WHEN cards.power IS NULL OR cards.power = '*' THEN 1 END)) AS percentage_of_french_cards_without_power FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.power IS NULL OR cards.power = '*';	card_games
SELECT     (SELECT COUNT(*) FROM sets WHERE type = 'expansion' AND id IN (         SELECT setCode FROM set_translations WHERE language = 'Japanese'     )) * 100.0 /      (SELECT COUNT(*) FROM set_translations WHERE language = 'Japanese') AS percentage_japanese_expansion_sets;	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE colorIdentity IS NOT NULL AND borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name, power FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934;	card_games
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT      (COUNT(CASE WHEN cards.isTextless = 1 AND cards.layout = 'normal' THEN 1 END) * 100.0) / COUNT(cards.id) AS proportion_of_textless_cards FROM      cards;	card_games
SELECT DISTINCT c.number FROM cards c WHERE c.subtypes LIKE '%Angel%' AND c.subtypes LIKE '%Wizard%' AND c.otherFaceIds IS NULL;	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3;	card_games
SELECT language FROM set_translations WHERE setCode = 'ARC' AND mcmName = 'Archenemy';	card_games
SELECT name, translation FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.id = 5;	card_games
SELECT s.language, s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206;	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode AND st.language = 'Italian' WHERE s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT id FROM sets WHERE isForeignOnly = 1 AND isFoilOnly = 1 AND EXISTS (     SELECT 1     FROM set_translations     JOIN sets ON sets.code = set_translations.setCode     WHERE set_translations.language = 'Japanese' )	card_games
SELECT sets.name, MAX(sets.baseSetSize) AS most_cards FROM sets JOIN set_translations ON sets.code = set_translations.setCode AND set_translations.language = 'Russian' GROUP BY sets.name ORDER BY most_cards DESC LIMIT 1;	card_games
SELECT      (COUNT(CASE WHEN c.isOnlineOnly = 1 THEN 1 END) * 100.0) / COUNT(c.id) AS percentage FROM      cards c JOIN      set_translations st ON c.uuid = st.uuid WHERE      st.language = 'Chinese Simplified';	card_games
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id  FROM cards  WHERE frameEffects = 'extendedart';	card_games
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language  FROM set_translations  WHERE setCode = '174';	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'A Pedra Fellwar';	card_games
SELECT code  FROM sets  WHERE releaseDate = '2007-07-13';	card_games
SELECT s.baseSetSize, s.code FROM sets s WHERE s.block IN ('Masques', 'Mirage');	card_games
SELECT code  FROM sets  WHERE type = 'expansion';	card_games
SELECT fd.name, c.type FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.language = 'Boros' AND c.watermark = 'Boros';	card_games
SELECT f.language, f.flavorText, c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'colorpie';	card_games
SELECT      (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0) / COUNT(c.id) AS percentage_of_10_mana_cost FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Abyssal Horror';	card_games
SELECT code FROM sets WHERE type = 'expansion' AND code IN (     SELECT setCode     FROM legalities     WHERE uuid IN (SELECT uuid FROM cards WHERE type LIKE '%Commander%') );	card_games
SELECT fd.name AS foreign_name, c.type FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.name LIKE '%Abzan%'	card_games
SELECT      fd.language, c.type FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      fd.text LIKE '%Azorius%'	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT name  FROM cards  WHERE isTextless = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes LIKE '%bundle%';	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE availability LIKE '%arena,mtgo%'  AND borderColor = 'black';	card_games
SELECT     CASE         WHEN c1.convertedManaCost > c2.convertedManaCost THEN 'Serra Angel'         ELSE 'Shrine Keeper'     END AS cardWithHigherManaCost FROM     cards c1 JOIN     cards c2 ON     c1.name = 'Serra Angel' AND c2.name = 'Shrine Keeper'	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT st.translation FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Italian';	card_games
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.setCode = sets.code WHERE cards.name = 'Angel of Mercy';	card_games
SELECT cards.name FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS (     SELECT 1     FROM foreign_data fd     JOIN cards c ON fd.uuid = c.uuid     WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Korean' );	card_games
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex';	card_games
SELECT baseSetSize FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT translation FROM set_translations WHERE setCode = '8ED' AND language = 'Chinese Simplified';	card_games
SELECT s.name FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT releaseDate FROM sets JOIN cards ON sets.code = cards.setCode WHERE cards.name = 'Ancestor''s Chosen';	card_games
SELECT type  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian' AND set_translations.translation IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Adarkar Valkyrie' AND s.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets WHERE id IN (SELECT id FROM set_translations WHERE language = 'Italian' AND translation IS NOT NULL) AND baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards WHERE setCode = 'Coldsnap' AND borderColor = 'black';	card_games
SELECT name, MAX(convertedManaCost) as MaxCMC FROM cards WHERE setCode = 'Coldsnap' GROUP BY name ORDER BY MaxCMC DESC LIMIT 1;	card_games
SELECT DISTINCT artist FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT name, number FROM cards WHERE name = 'Coldsnap' AND number = 4;	card_games
SELECT COUNT(*) FROM cards C JOIN sets S ON C.setCode = S.code WHERE C.convertedManaCost > 5 AND S.name = 'Coldsnap' AND (C.power = '*' OR C.power IS NULL);	card_games
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen';	card_games
SELECT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.flavorText IS NOT NULL;	card_games
SELECT type FROM foreign_data WHERE language = 'German' AND name = 'Ancestor''s Chosen';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND r.language = 'Italian';	card_games
SELECT ft.translation FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN set_translations st ON c.setCode = st.setCode AND fd.language = st.language WHERE c.setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') AND fd.language = 'Italian' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce';	card_games
SELECT      (SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Coldsnap';	card_games
SELECT      (SUM(CASE WHEN card.cardKingdomFoilId IS NOT NULL AND card.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) * 100.0) /      (SELECT COUNT(*) FROM cards WHERE sets.name = 'Coldsnap') AS percentage_incredibly_powerful FROM      cards INNER JOIN      sets ON cards.setCode = sets.code WHERE      sets.name = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name LIKE 'From the Vault: Lore';	card_games
SELECT parentCode  FROM sets  WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text AS ruling_text, c.hasContentWarning FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' ORDER BY c.name;	card_games
SELECT s.releaseDate  FROM sets s  JOIN cards c ON s.code = c.setCode  WHERE c.name = 'Evacuation';	card_games
SELECT baseSetSize  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Rinascita di Alara';	card_games
SELECT type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE translation = 'Huitième édition';	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code JOIN cards c ON s.code = c.setCode JOIN foreign_data fd ON c.uuid = fd.uuid JOIN cards c2 ON fd.name = c2.name AND c2.name = 'Tendo Ice Bridge' WHERE st.language = 'French' AND c.setCode = c2.setCode;	card_games
SELECT COUNT(*) FROM set_translations JOIN sets ON sets.code = set_translations.setCode WHERE sets.name = 'Tenth Edition' AND set_translations.translation IS NOT NULL;	card_games
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON s.code = c.setCode WHERE c.name = 'Fellwar Stone' AND st.language = 'Japanese';	card_games
SELECT name, MAX(convertedManaCost) AS max_cmc FROM cards WHERE setCode = 'Journey into Nyx Hero''s Path' GROUP BY name ORDER BY max_cmc DESC LIMIT 1;	card_games
SELECT sets.releaseDate FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Ola de frío';	card_games
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3;	card_games
SELECT translation FROM set_translations WHERE setCode = 'Mirrodin' AND language = 'Chinese Simplified';	card_games
SELECT     ROUND(         (SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN f.language = 'Japanese' THEN 1 ELSE 0 END)) * 100,         2     ) AS percentage_non_foil_japanese FROM     cards c JOIN     set_translations f ON c.uuid = f.uuid JOIN     sets s ON c.setCode = s.code WHERE     f.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN sets.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN sets_translations.language = 'Portuguese (Brazil)' THEN 1 ELSE 0 END) FROM      cards JOIN      sets ON cards.setCode = sets.code JOIN      set_translations ON sets.code = set_translations.setCode WHERE      set_translations.language = 'Portuguese (Brazil)';	card_games
SELECT DISTINCT availability  FROM cards  WHERE artist = 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT artist FROM cards WHERE side IS NULL AND convertedManaCost = (     SELECT MAX(convertedManaCost)     FROM cards     WHERE side IS NULL );	card_games
SELECT MAX(frameEffects) AS most_common_frame_effect FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander' AND code != 'A16' -- Exclude Alchemy modifications ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT id, name, MAX(convertedManaCost) AS max_cost FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'duel' GROUP BY id, name ORDER BY max_cost DESC LIMIT 10;	card_games
SELECT s.releaseDate, l.format FROM cards c JOIN sets s ON c.setCode = s.code JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Legal' ORDER BY s.releaseDate LIMIT 1;	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.artist = 'Volkan Baǵa'  AND foreign_data.language = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'rare' AND cards.types LIKE '%Enchantment%' AND cards.name = 'Abundance' AND legalities.status = 'Legal';	card_games
SELECT format, COUNT(*) as banned_count FROM legalities WHERE status = 'Banned' GROUP BY format ORDER BY banned_count DESC LIMIT 1;	card_games
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Battlebond');	card_games
SELECT artist, COUNT(*) as card_count FROM cards GROUP BY artist ORDER BY card_count LIMIT 1;	card_games
SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997'   AND c.artist = 'D. Alexander Gregory'   AND l.format = 'legacy'   AND c.hasContentWarning = 1;	card_games
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.edhrecRank = 1 AND legalities.status = 'Banned';	card_games
SELECT AVG(id) as annual_avg_sets, MAX(COUNT(language)) as common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(releaseDate);	card_games
SELECT DISTINCT artist FROM cards WHERE BorderColor = 'black' AND availability = 'arena';	card_games
SELECT l.uuid FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.format = 'oldschool' AND (l.status = 'banned' OR l.status = 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability LIKE '%paper%';	card_games
SELECT r.id, r.date, r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT s.name FROM sets s LEFT JOIN set_translations st_japanese ON s.code = st_japanese.setCode AND st_japanese.language = 'Japanese' LEFT JOIN set_translations st_korean ON s.code = st_korean.setCode AND st_korean.language = 'Korean' WHERE st_japanese.setCode IS NULL AND st_korean.setCode IS NOT NULL;	card_games
SELECT DISTINCT frameVersion AS FrameStyle FROM cards WHERE artist = 'Allen Williams';  SELECT id, name FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Banned';	card_games
SELECT     CASE         WHEN u1.Reputation > u2.Reputation THEN u1.DisplayName         ELSE u2.DisplayName     END AS HigherReputationUser FROM     users u1 JOIN     users u2 ON u1.DisplayName = 'Harlan' AND u2.DisplayName = 'Jarrod Dixon'	codebase_community
SELECT DisplayName  FROM users  WHERE YEAR(CreationDate) = 2011;	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  WHERE u.Views > 10 AND YEAR(u.CreationDate) > 2013;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.OwnerDisplayName  FROM posts p  WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT SUM(c.CommentCount) AS TotalComments FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT p.AnswerCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL	codebase_community
SELECT DISTINCT p.OwnerDisplayName FROM posts p WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags) ORDER BY t.Count DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011;	codebase_community
SELECT users.DisplayName FROM users JOIN badges ON badges.UserId = users.Id GROUP BY users.DisplayName ORDER BY COUNT(badges.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score) AS AverageScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT AVG(b.Count) AS AverageBadges FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Views > 200;	codebase_community
SELECT      ROUND((COUNT(CASE WHEN u.Age > 65 THEN p.Id END) * 100.0) / COUNT(p.Id), 2) AS ElderUserOwnershipPercentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 5	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT MAX(CreationDate)  FROM votes  WHERE CreationDate IN (     SELECT CreationDate      FROM votes      GROUP BY CreationDate      ORDER BY COUNT(*) DESC      LIMIT 1 );	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014/04/23 20:29:39.0'	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 LIMIT 1;	codebase_community
SELECT      p.Id AS PostId,      p.Title,      p.ClosedDate  FROM      posts p  JOIN      comments c ON p.Id = c.PostId  WHERE      c.UserId = 23853 AND      c.CreationDate = '2013-07-12 09:08:18.0' AND      p.ClosedDate IS NULL;	codebase_community
SELECT Reputation  FROM users  WHERE Id = (SELECT OwnerUserId              FROM posts              WHERE Id = 65041);	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Tiago Pasqualini'	codebase_community
SELECT users.DisplayName FROM users JOIN votes ON users.Id = votes.UserId WHERE votes.Id = 6347;	codebase_community
SELECT SUM(CASE WHEN v.VoteTypeId = 2 THEN 1 ELSE 0 END) AS TotalUpVotes,        SUM(CASE WHEN v.VoteTypeId = 3 THEN 1 ELSE 0 END) AS TotalDownVotes FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%';	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT     CAST(COUNT(posts.Id) AS FLOAT) / COUNT(votes.Id) AS post_vote_ratio FROM     posts LEFT JOIN     votes ON posts.OwnerUserId = votes.UserId WHERE     posts.OwnerUserId = 24	codebase_community
SELECT ViewCount  FROM posts  WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT UserDisplayName FROM comments WHERE Text LIKE '%thank you user93%'	codebase_community
SELECT c.Id, c.PostId, c.Score, c.Text, c.CreationDate, c.UserId, c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT ph.UserDisplayName AS Editor FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data' AND ph.Text = '' AND ph.Comment = '' AND ph.UserDisplayName IS NOT NULL;	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.WebsiteUrl;	codebase_community
SELECT c.Text AS CommentText, c.CreationDate AS CommentDate, u.DisplayName AS CommenterDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(BountyAmount) AS TotalBountyAmount FROM posts WHERE Title LIKE '%data%'	codebase_community
SELECT u.DisplayName FROM votes v JOIN posts p ON v.PostId = p.Id JOIN users u ON v.UserId = u.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT p.Title, p.Text, AVG(p.ViewCount) AS AvgViewCount FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'humor' GROUP BY p.Id ORDER BY p.Id;	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13;	codebase_community
SELECT Id AS UserId FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  WHERE b.Name = 'Supporter'  AND EXTRACT(YEAR FROM b.Date) = 2011;	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b WHERE b.Name IS NOT NULL AND        (SELECT COUNT(*)         FROM badges b2         WHERE b2.UserId = b.UserId AND b2.Name IS NOT NULL) > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name IN ('Teacher', 'Supporter') AND u.Location = 'New York';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT p.OwnerUserId, COUNT(ph.Id) AS PostHistoryCount FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE p.ViewCount >= 1000 GROUP BY p.OwnerUserId HAVING COUNT(ph.Id) = 1;	codebase_community
SELECT u.DisplayName, b.Name FROM comments c JOIN users u ON c.UserId = u.Id JOIN badges b ON u.Id = b.UserId GROUP BY c.UserId, u.DisplayName, b.Name ORDER BY COUNT(c.Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Teacher' AND u.Location = 'India';	codebase_community
SELECT      ((COUNT(CASE WHEN Year(b.Date) = 2010 THEN 1 END) / (SELECT COUNT(*) FROM badges)) -       (COUNT(CASE WHEN Year(b.Date) = 2011 THEN 1 END) / (SELECT COUNT(*) FROM badges))) * 100 AS percentage_difference FROM badges b WHERE b.Name = 'Student';	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommenters FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;	codebase_community
SELECT p.Id, p.ViewCount AS Popularity FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395;	codebase_community
SELECT p.Id, p.OwnerUserId FROM posts p WHERE p.Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount) AS TotalFavoriteCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Id = 686 AND YEAR(p.CreaionDate) = 2011;	codebase_community
SELECT      AVG(u.UpVotes) + AVG(u.Age) AS avg_upvotes_and_age FROM      users u JOIN      (SELECT          OwnerUserId     FROM          posts     GROUP BY          OwnerUserId     HAVING          COUNT(*) > 10) p ON u.Id = p.OwnerUserId;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*) AS PositiveCommentCount FROM comments WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Pierre'	codebase_community
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY' ORDER BY b.Date;	codebase_community
SELECT      ROUND((COUNT(DISTINCT b.UserId) / (SELECT COUNT(DISTINCT u.Id) FROM users u)) * 100, 2) AS TeacherBadgePercentage FROM      badges b WHERE      b.Name = 'Teacher';	codebase_community
SELECT     (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN u.Id END) * 100.0) / COUNT(DISTINCT b.UserId) AS Teenager_Percentage FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer'	codebase_community
SELECT SUM(c.Score) AS TotalRatingScore FROM comments c WHERE c.CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria' AND b.Name = 'Teacher';	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65	codebase_community
SELECT u.ViewCount FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Supporter' AND users.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Location = 'New York, NY';	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName, MAX(Views) FROM users WHERE Views IS NOT NULL GROUP BY DisplayName ORDER BY MAX(Views) DESC;	codebase_community
SELECT      (COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 END) / COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 END)) AS vote_ratio FROM votes	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(p.Id) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(*) FROM votes JOIN users ON votes.UserId = users.Id WHERE users.DisplayName = 'Harlan';	codebase_community
SELECT p.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT      (SELECT MAX(SUM(ViewCount))       FROM posts       WHERE OwnerUserId IN (          SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky'           UNION           SELECT Id FROM users WHERE DisplayName = 'Noah Snyder'      )     ) AS HarveyMotulskyPopularity,     (SELECT MAX(SUM(ViewCount))       FROM posts       WHERE OwnerUserId IN (          SELECT Id FROM users WHERE DisplayName = 'Noah Snyder'           UNION           SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky'      )     ) AS NoahSnyderPopularity	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND p.Id IN (     SELECT PostId     FROM votes     GROUP BY PostId     HAVING COUNT(*) > 4 );	codebase_community
SELECT COUNT(*)  FROM comments  JOIN users ON comments.UserId = users.Id  WHERE users.DisplayName = 'Neil McGuigan' AND comments.Score < 60;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.Id = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT      (COUNT(CASE WHEN t.TagName = 'r' THEN p.Id ELSE NULL END) / COUNT(CASE WHEN u.DisplayName = 'Community' THEN p.Id ELSE NULL END)) * 100 AS percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id JOIN      tags t ON p.Id = t.ExcerptPostId WHERE      u.DisplayName = 'Community';	codebase_community
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Mornington', 'Amos');	codebase_community
SELECT COUNT(DISTINCT badges.UserId) FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Commentator' AND YEAR(badges.Date) = 2014;	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'	codebase_community
SELECT u.DisplayName, u.Age FROM users u WHERE u.Age IS NOT NULL ORDER BY u.Age DESC LIMIT 1;	codebase_community
SELECT p.LastEditorUserId, p.LastEditDate FROM posts p WHERE p.Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score > 60;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND YEAR(b.Date) = 2011;	codebase_community
SELECT      p.OwnerDisplayName,      u.WebsiteUrl FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.FavoriteCount > 150;	codebase_community
SELECT      p.Id AS PostId,      COUNT(ph.Id) AS HistoryCount,      MAX(ph.CreationDate) AS LastEditDate FROM      posts p JOIN      postHistory ph ON p.Id = ph.PostId WHERE      p.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY      p.Id;	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers' ORDER BY u.LastAccessDate DESC;	codebase_community
SELECT p.Title AS RelatedPostTitle FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'How to tell if something happened in a data set which monitors a value over time' AND pl.RelatedPostId = p.Id;	codebase_community
SELECT p.Id, b.Name FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(p.CreaionDate) = 2013 AND YEAR(b.Date) = 2013;	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.Location FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN users u ON p.OwnerUserId = u.Id WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?';	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.Id = (     SELECT PostId     FROM posts     WHERE ParentId IS NOT NULL     ORDER BY Score DESC     LIMIT 1 );	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8);	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId  FROM posts  ORDER BY FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT MAX(Reputation) AS MostInfluentialReputation FROM users;	codebase_community
SELECT COUNT(*) FROM posts WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50 AND Id IN (SELECT PostId FROM votes WHERE VoteTypeId = 2);	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT SUM(p.Score) as TotalScore FROM posts p WHERE p.LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT      COUNT(postLinks.Id) / 12 AS average_monthly_links FROM      postLinks WHERE      YEAR(postLinks.CreationDate) = 2010     AND EXISTS (         SELECT 1         FROM posts         WHERE              postLinks.PostId = posts.Id              AND posts.AnswerCount <= 2     )	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (     SELECT MIN(CreationDate)     FROM postLinks );	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(CreationDate) FROM votes JOIN users ON votes.UserId = users.Id WHERE users.DisplayName = 'chl' ORDER BY CreationDate ASC LIMIT 1;	codebase_community
SELECT MIN(CreationDate)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(Votes.PostId) as AvgPostsVoted FROM votes JOIN users ON votes.UserId = users.Id WHERE users.Age = (SELECT MAX(Age) FROM users);	codebase_community
SELECT DisplayName  FROM users  WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DISTINCT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens') AND YEAR(CreaionDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT AVG(Score) AS AverageScore FROM posts WHERE OwnerUserId = (     SELECT Id     FROM users     WHERE DisplayName = 'Stephen Turner' );	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName AS OwnerDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      ROUND((COUNT(CASE WHEN YEAR(posts.CreaionDate) = 2011 AND users.Reputation > 1000 THEN 1 END) * 100.0) / COUNT(posts.Id), 2) AS Percentage FROM      posts JOIN      users ON posts.OwnerUserId = users.Id;	codebase_community
SELECT      DIVIDE(COUNT(CASE WHEN users.Age BETWEEN 13 AND 18 THEN 1 END), COUNT(users.Id)) AS percentage FROM      users;	codebase_community
SELECT p.ViewCount, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Body LIKE '%Computer Game Datasets%' AND p.LastEditDate = (     SELECT MAX(p2.LastEditDate)     FROM posts p2     WHERE p2.Body LIKE '%Computer Game Datasets%' );	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(c.Id) AS comment_count FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT Name  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett')  ORDER BY Date DESC  LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT     (b.Date - u.CreationDate) AS TimeToGetBadge FROM     badges b JOIN     users u ON b.UserId = u.Id WHERE     u.DisplayName = 'Zolomon';	codebase_community
SELECT      u.DisplayName,      COUNT(DISTINCT p.Id) AS PostCount,      COUNT(DISTINCT c.Id) AS CommentCount FROM      users u LEFT JOIN      posts p ON u.Id = p.OwnerUserId LEFT JOIN      comments c ON u.Id = c.UserId WHERE      u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY      u.DisplayName;	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE b.Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(p.Id) AS CareerPostsCount FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'careers';	codebase_community
SELECT Reputation, ViewCount  FROM users  WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT      (SELECT COUNT(*) FROM comments WHERE PostId = p.Id) AS CommentCount,     (SELECT COUNT(*) FROM posts WHERE PostId = p.Id AND PostTypeId = 1) AS AnswerCount FROM      posts p WHERE      p.Title = 'Clustering 1D data';	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(*) FROM posts WHERE BountyAmount >= 30;	codebase_community
SELECT      (COUNT(CASE WHEN posts.Score > 50 THEN posts.Id END) * 100.0) / COUNT(posts.Id) AS PercentageScoreAbove50 FROM      posts INNER JOIN      users ON posts.OwnerUserId = users.Id WHERE      users.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Id, c.Text, c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT      c.CreationDate,      u.Age  FROM      comments c  JOIN      users u ON c.UserId = u.Id  WHERE      c.Text LIKE '%http://%'	codebase_community
SELECT COUNT(DISTINCT p.Id) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(c.Id) AS ZeroScoreComments FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS TotalUsers40YearsOld FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id, c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'R is also lazy evaluated.';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT DISTINCT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0	codebase_community
SELECT      ROUND((COUNT(CASE WHEN c.UserId IN (SELECT u.Id FROM users u WHERE u.UpVotes = 0) THEN c.UserId END) * 100.0) / COUNT(c.UserId), 2) AS PercentageZeroUpVotes FROM comments c WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero su ON hp.hero_id = su.id WHERE su.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT hp.hero_id)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200;	superhero
SELECT superhero.full_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.full_name HAVING COUNT(hero_power.power_id) > 15;	superhero
SELECT COUNT(*)  FROM superhero  WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT superhero.id) AS blueEyedAgilityCount FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour e ON s.eye_colour_id = e.id AND e.colour = 'Blue' JOIN colour h ON s.hair_colour_id = h.id AND h.colour = 'Blond';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name, height_cm FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC;	superhero
SELECT publisher_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero_name = 'Sauron';	superhero
SELECT      s.superhero_name,      c.colour,      COUNT(h.id) AS popularity FROM      superhero s JOIN      colour c ON s.eye_colour_id = c.id JOIN      publisher p ON s.publisher_id = p.id GROUP BY      s.superhero_name,      c.colour HAVING      p.publisher_name = 'Marvel Comics' ORDER BY      popularity DESC;	superhero
SELECT AVG(height_cm)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' AND superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name, MIN(h.height_cm) AS min_height FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' GROUP BY p.publisher_name ORDER BY min_height ASC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond';	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Intelligence' ORDER BY hero_attribute.attribute_value ASC LIMIT 1;	superhero
SELECT race FROM superhero WHERE superhero_name = 'Copycat';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Death Touch';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female' AND attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = 100;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name ORDER BY COUNT(hero_power.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT      ROUND((SUM(CASE WHEN s.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_bad_alignment,     COUNT(CASE WHEN s.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad' AND s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) THEN 1 END) AS marvel_bad alignment_count FROM superhero s;	superhero
SELECT     SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) -      SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS diff_published FROM     superhero s JOIN     publisher p ON s.publisher_id = p.id;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg)  FROM superhero  WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female');	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' GROUP BY sp.power_name ORDER BY COUNT(*) DESC LIMIT 5;	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour');	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 56;	superhero
SELECT full_name  FROM superhero  WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God')  LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT race FROM superhero WHERE weight_kg = 169;	superhero
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.hair_colour_id = c.id WHERE s.height_cm = 185 AND s.race_id = (SELECT id FROM race WHERE race = 'human');	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT      ROUND((SUM(CASE WHEN publisher_id = 13 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_of_marvel_heroes FROM superhero WHERE height_cm BETWEEN 150 AND 180;	superhero
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT sp.power_name, COUNT(hp.power_id) as power_count FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id GROUP BY sp.power_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT attribute_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.id = 1;	superhero
SELECT COUNT(hp.hero_id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'stealth';	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT AVG(superhero.id) AS average_superhero_count FROM superhero WHERE skin_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour');	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE attribute_name = 'Durability' AND publisher_name = 'Dark Horse Comics' ORDER BY attribute_value DESC LIMIT 1;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight';	superhero
SELECT s.superhero_name, c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT      s.superhero_name,      p.publisher_name FROM      superhero s JOIN      colour AS eye_colour ON s.eye_colour_id = eye_colour.id JOIN      colour AS hair_colour ON s.hair_colour_id = hair_colour.id JOIN      colour AS skin_colour ON s.skin_colour_id = skin_colour.id JOIN      publisher p ON s.publisher_id = p.id WHERE      hair_colour.id = skin_colour.id AND      hair_colour.id = eye_colour.id;	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'A-Bomb';	superhero
SELECT      ROUND((SUM(CASE WHEN c.colour = 'Blue' AND g.gender = 'Female' THEN 1 ELSE 0 END) * 100.0) /            COUNT(CASE WHEN g.gender = 'Female' THEN 1 ELSE NULL END), 2) AS percentage_blue_female FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.skin_colour_id = c.id WHERE g.gender = 'Female';	superhero
SELECT superhero_name, race FROM superhero JOIN race ON superhero.race_id = race.id WHERE full_name = 'Charles Chandler';	superhero
SELECT gender.gender FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(power_id)  FROM hero_power  JOIN superhero ON hero_power.hero_id = superhero.id  WHERE superhero.superhero_name = 'Amazo';	superhero
SELECT sp.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id AND superhero.hair_colour_id = colour.id WHERE colour.colour = 'Black';	superhero
SELECT s.superhero_name, c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE c.colour = 'Gold';	superhero
SELECT superhero.full_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire';	superhero
SELECT superhero_name  FROM superhero  WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = (     SELECT MAX(attribute_value)      FROM hero_attribute      JOIN attribute ON hero_attribute.attribute_id = attribute.id      WHERE attribute.attribute_name = 'Strength' );	superhero
SELECT s.race_id, a.alignment FROM superhero AS s JOIN alignment AS a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT      ROUND((SUM(CASE WHEN s.gender_id = 2 AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) * 100.0) / COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 END), 2) AS percentage_female_marvel_heroes FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(weight_kg)  FROM superhero  WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT      (SELECT SUM(weight_kg)       FROM superhero       WHERE full_name = 'Emil Blonsky') -      (SELECT SUM(weight_kg)       FROM superhero       WHERE full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed' AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed')	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id AND eye_colour.colour = 'Blue' JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id AND hair_colour.colour = 'Brown';	superhero
SELECT publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero_name = 'Hawkman' OR superhero_name = 'Karate Kid' OR superhero_name = 'Speedy';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT ROUND((SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0) / COUNT(s.id), 2) AS blue_eye_percentage FROM superhero s JOIN colour c ON s.eye_colour_id = c.id;	superhero
SELECT SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS male_count,        SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS female_count,        SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) * 1.0 /         SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS male_to_female_ratio FROM superhero;	superhero
SELECT superhero_name, MAX(height_cm) AS tallest_height FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name  FROM superhero  WHERE id = 294;	superhero
SELECT superhero_name, full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero AS sup JOIN hero_power AS hp ON sup.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sup.full_name = 'Helen Parr';	superhero
SELECT race_id FROM superhero WHERE weight_kg = 108 AND height_cm = 188;	superhero
SELECT p.publisher_name FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE s.id = 38;	superhero
SELECT s.race_id FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute );	superhero
SELECT a.alignment, sp.power_name FROM superhero su JOIN alignment a ON su.alignment_id = a.id JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.superhero_name = 'Atom IV';	superhero
SELECT superhero_name, full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.alignment_id = 3;	superhero
SELECT s.superhero_name, c.colour FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN colour c ON s.skin_colour_id = c.id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND alignment_id = 1;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute_value BETWEEN 75 AND 80;	superhero
SELECT s.superhero_name, r.race FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour h ON s.hair_colour_id = h.id JOIN race r ON s.race_id = r.id WHERE h.colour = 'Blue' AND g.gender = 'Male';	superhero
SELECT      ROUND(         (SUM(CASE WHEN gender.id = 2 THEN 1 ELSE 0 END) /           SUM(CASE WHEN alignment.id = 2 THEN 1 ELSE 0 END)) * 100.0, 2     ) AS percentage_female_bad_heroes FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN gender ON superhero.gender_id = gender.id WHERE alignment.id = 2;	superhero
SELECT      (SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) -       SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END)) AS eye_color_difference FROM superhero T1 WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL;	superhero
SELECT attribute_value FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Hulk' AND attribute.attribute_name = 'Strength';	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN colour ON superhero.skin_colour_id = colour.id WHERE alignment.alignment = 'Bad' AND colour.colour = 'Green';	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE power_name = 'Wind Control' ORDER BY superhero_name ASC;	superhero
SELECT s.gender_id FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name, MAX(weight_kg) AS max_weight FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') ORDER BY max_weight DESC LIMIT 1;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE race_id != (SELECT id FROM race WHERE race = 'Human') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics')	superhero
SELECT superhero_name, full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;	superhero
SELECT      (SELECT COUNT(*)       FROM superhero       WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) -      (SELECT COUNT(*)       FROM superhero       WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS difference;	superhero
SELECT a.attribute_name FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Black Panther' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT c.colour  FROM superhero AS s  JOIN colour AS c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT superhero_name, height_cm  FROM superhero  ORDER BY height_cm DESC  LIMIT 1;	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT      ROUND((SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_female FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'George Lucas');	superhero
SELECT      ROUND((SUM(CASE WHEN s.alignment_id = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_good FROM      superhero s WHERE      s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id FROM hero_attribute ORDER BY attribute_value LIMIT 1;	superhero
SELECT superhero.full_name  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero_name = 'Alien' AND race.race = 'Alien';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.colour = 'Auburn';	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT weight_kg, race  FROM superhero  WHERE id = 40;	superhero
SELECT AVG(height_cm)  FROM superhero  WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT hero_id  FROM hero_power  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Intelligence';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 20 AND q.q1 = (SELECT MAX(q1) FROM qualifying WHERE raceId = 20) AND d.driverRef IN (     SELECT driverRef     FROM drivers     JOIN qualifying ON drivers.driverId = qualifying.driverId     WHERE raceId = 20     GROUP BY driverRef     HAVING COUNT(*) = 1 ) ORDER BY d.driverRef;	formula_1
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19) AND q.raceId = 19;	formula_1
SELECT DISTINCT s.year FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE c.location = 'Shanghai';	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'Germany';	formula_1
SELECT c.name, cs.position FROM circuits c JOIN constructorResults cr ON c.circuitId = cr.circuitId JOIN constructors cs ON cr.constructorId = cs.constructorId WHERE cs.name = 'Renault';	formula_1
SELECT COUNT(*) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2010 AND NOT (circuits.country = 'Asia' OR circuits.country = 'Europe');	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE c.country = 'Spain';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT lat, lng  FROM circuits  WHERE name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.nationality FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE cr.points = 1.0 AND r.raceId = 24;	formula_1
SELECT q.q1 FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE d.forename = 'Bruno' AND d.surname = 'Senna' AND q.raceId = (SELECT raceId FROM races WHERE raceId = 354);	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '00:01:40' AND q.raceId = 355;	formula_1
SELECT drivers.number FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.q3 LIKE '01:54%' AND qualifying.raceId = (SELECT raceId FROM races WHERE year = 2009 AND round = 3);	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Bahrain Grand Prix'  AND r.time IS NULL;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29' AND time = '12:00:00') AND statusId = (SELECT statusId FROM status WHERE status = 'Finished');	formula_1
SELECT d.driverRef, d.forename, d.surname, d.dob FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.raceId = 592 AND d.dob IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.driverRef, d.url FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.raceId = 161 AND lt.time LIKE '0:01:%';	formula_1
SELECT drivers.nationality FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.raceId = 933 AND results.fastestLap = 1;	formula_1
SELECT c.location, c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Malaysian Grand Prix';	formula_1
SELECT constructors.url FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId JOIN races ON constructorResults.raceId = races.raceId WHERE races.raceId = 9 AND constructorResults.points = (SELECT MAX(points) FROM constructorResults cr WHERE cr.raceId = 9);	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'di Grassi' AND forename = 'Lucas') AND raceId = (SELECT raceId FROM races WHERE year = 2009 AND round = 3);	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '01:15' AND q.raceId = (SELECT raceId FROM races WHERE raceId = 347);	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 45 AND q.q3 LIKE '01:33%'	formula_1
SELECT r.time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'McLaren' AND r.raceId = (SELECT raceId FROM races WHERE round = 743);	formula_1
SELECT d.surname, d.forename FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'San Marino Grand Prix' AND r.year = 2006 AND ds.position = 2;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29' AND time IS NULL)	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.raceId = 872 AND ds.positionText != '' AND d.dob = (SELECT MIN(dob) FROM drivers JOIN driverStandings ds ON drivers.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.raceId = 872 AND ds.positionText != '')	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = 348 AND lt.position = 1 ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM lapTimes lt2 JOIN results r2 ON lt2.driverId = r2.driverId);	formula_1
SELECT     (SUBTRACT(fastestLapSpeed(raceId = 853), (fastestLapSpeed(raceId = 854)) * 100) / fastestLapSpeed(raceId = 853)) * 100 AS percent_faster FROM     (SELECT         drivers.driverId,         drivers.forename,         drivers.surname,         races.raceId,         races.name AS race_name,         races.time,         results.fastestLapTime,         results.fastestLapSpeed,         (SELECT results.fastestLapSpeed          FROM results          JOIN races ON results.raceId = races.raceId          WHERE races.raceId = 854 AND results.driverId = drivers.driverId) AS next_race_fastestLapSpeed     FROM drivers     JOIN results ON drivers.driverId = results.driverId     JOIN races ON results.raceId = races.raceId     WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta'     AND races.raceId = 853     OR drivers.forename = 'Paul' AND drivers.surname = 'di Resta'     AND races.raceId = 854) AS subquery	formula_1
SELECT      d.driverId,     d.forename,     d.surname,     (COUNT(CASE WHEN r.time IS NOT NULL THEN 1 END) * 100.0) / COUNT(r.driverId) AS completionRate FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.date = '1983-07-16' GROUP BY      d.driverId, d.forename, d.surname;	formula_1
SELECT MIN(year) AS first_singapore_grand_prix_year FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*) AS total_races, race.name FROM races JOIN seasons ON races.year = seasons.year WHERE seasons.year = 2005 GROUP BY race.name ORDER BY race.name DESC;	formula_1
SELECT name FROM races WHERE year = (SELECT year FROM races WHERE date = (SELECT MIN(date) FROM races))   AND EXTRACT(MONTH FROM date) = (SELECT EXTRACT(MONTH FROM MIN(date)) FROM races);	formula_1
SELECT r.name, r.date  FROM races r  JOIN seasons s ON r.year = s.year  WHERE r.year = 1999  AND r.round = (SELECT MAX(round) FROM races WHERE year = 1999);	formula_1
SELECT s.year, COUNT(r.round) AS race_count FROM seasons s JOIN races r ON s.year = r.year GROUP BY s.year ORDER BY race_count DESC LIMIT 1;	formula_1
SELECT DISTINCT r.name FROM races r WHERE r.year = 2017 AND r.raceId NOT IN (     SELECT raceId     FROM races     WHERE year = 2000 );	formula_1
SELECT c.name AS CircuitName, c.location AS CircuitLocation FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.url LIKE '%1950%' AND c.country != 'European' ORDER BY s.year ASC LIMIT 1;	formula_1
SELECT MAX(year) AS last_season FROM seasons JOIN circuits ON circuits.name = 'Brands Hatch' JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'United Kingdom' AND races.name = 'British Grand Prix';	formula_1
SELECT COUNT(DISTINCT year) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone Circuit' AND circuits.country = 'United Kingdom' AND races.name = 'British Grand Prix';	formula_1
SELECT d.driverRef, d.forename, d.surname, ds.positionText FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2010 AND r.name = 'Singapore Grand Prix' ORDER BY ds.position;	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE ds.points = (SELECT MAX(points) FROM driverStandings)	formula_1
SELECT d.surname, SUM(rs.points) AS total_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId JOIN results rs ON ds.raceId = rs.raceId AND d.driverId = rs.driverId WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' GROUP BY d.driverId ORDER BY total_points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name AS raceName, MIN(l.milliseconds) AS bestLapTime FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN races r ON l.raceId = r.raceId GROUP BY l.driverId, r.raceId ORDER BY bestLapTime ASC LIMIT 1;	formula_1
SELECT AVG(lt.milliseconds) AS average_lap_time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.name = 'Malaysian Grand Prix';	formula_1
SELECT      CAST(COUNT(CASE WHEN ds.position > 1 THEN 1 END) AS REAL) / COUNT(ds.raceId) * 100 AS percentage_not_first FROM      driverStandings ds JOIN      drivers d ON ds.driverId = d.driverId WHERE      d.surname = 'Hamilton'      AND ds.raceId IN (SELECT raceId FROM races WHERE year >= 2010)	formula_1
SELECT d.forename, d.surname, d.nationality, d.points FROM drivers d JOIN (     SELECT driverId, MAX(points) AS max_points     FROM driverStandings     GROUP BY driverId ) AS ds ON d.driverId = ds.driverId WHERE ds.max_points = (     SELECT MAX(points)     FROM driverStandings );	formula_1
SELECT     d.forename,     d.surname,     (YEAR(CURRENT_TIMESTAMP) - YEAR(d.dob)) AS age FROM     drivers d WHERE     d.nationality = 'Japanese' ORDER BY     age LIMIT 1;	formula_1
SELECT DISTINCT c.circuitRef, c.name, c.location, c.country FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.year BETWEEN 1990 AND 2000 GROUP BY c.circuitId HAVING COUNT(r.raceId) = 4;	formula_1
SELECT c.name AS CircuitName, c.location AS CircuitLocation, r.name AS RaceName FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = 2006 AND c.country = 'USA';	formula_1
SELECT r.name AS raceName, c.name AS circuitName, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT r.name AS race_name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Yoong' AND d.forename = 'Alex' AND res.position < 20;	formula_1
SELECT COUNT(*) FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId JOIN circuits ct ON c.constructorRef = ct.circuitRef JOIN races r ON cs.raceId = r.raceId JOIN seasons s ON r.year = s.year WHERE c.name = 'Michael Schumacher' AND ct.name = 'Sepang International Circuit' AND cs.points = (SELECT MAX(points) FROM constructorStandings cs2 JOIN races r2 ON cs2.raceId = r2.raceId WHERE cs2.constructorId = c.constructorId AND r2.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit'));	formula_1
SELECT r.name AS race, s.year FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races s ON r.raceId = s.raceId WHERE d.surname = 'Schumacher' AND r.milliseconds = (     SELECT MIN(milliseconds)     FROM results     JOIN drivers ON results.driverId = drivers.driverId     WHERE drivers.surname = 'Schumacher' );	formula_1
SELECT AVG(points) AS avg_points FROM driverStandings JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.surname = 'Irvine' AND YEAR(races.date) = 2000;	formula_1
SELECT r.name AS RaceName, rs.points FROM races r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId JOIN constructorStandings cs ON cs.raceId = r.raceId AND cs.constructorId = d.constructorId JOIN constructorResults cr ON cr.constructorId = d.constructorId JOIN `sqlite_sequence` sq ON sq.name = 'drivers' WHERE d.driverRef = 'hamilton' AND ds.position = 1 AND r.year = (SELECT MIN(year) FROM races) AND rs.points = cr.points;	formula_1
SELECT      r.name AS raceName,      c.country AS hostingCountry,      r.date AS raceDate FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId JOIN      seasons s ON r.year = s.year WHERE      s.year = 2017 ORDER BY      r.date;	formula_1
SELECT      r.name AS race_name,      s.year AS race_year,      c.location AS circuit_location,      MAX(r.laps) AS most_laps FROM      races r JOIN      results res ON r.raceId = res.raceId JOIN      circuits c ON r.circuitId = c.circuitId JOIN      seasons s ON r.year = s.year GROUP BY      r.name,      s.year,      c.location ORDER BY      most_laps DESC LIMIT 1;	formula_1
SELECT     (SELECT COUNT(*) FROM races WHERE country = 'Germany' AND name = 'European Grand Prix') * 100.0 /      (SELECT COUNT(*) FROM races WHERE name = 'European Grand Prix') AS percentage	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT name, lat FROM circuits WHERE circuitRef IN ('silverstone', 'hockenheimring', 'hungaroring') ORDER BY lat DESC LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country, MAX(alt) AS max_altitude FROM circuits WHERE alt IS NOT NULL GROUP BY country ORDER BY max_altitude DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT      d.nationality,     MIN(d.dob) AS oldest_driver_dob FROM      drivers d JOIN      constructors c ON d.constructorId = c.constructorId WHERE      d.nationality IS NOT NULL GROUP BY      d.nationality ORDER BY      oldest_driver_dob ASC LIMIT 1;	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian';	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef  FROM drivers  WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT c.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  JOIN seasons s ON r.year = s.year  WHERE r.name = 'Spanish Grand Prix' AND s.year = 2009;	formula_1
SELECT DISTINCT r.year FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT      c.name AS circuitName,     c.url AS circuitUrl,     r.name AS raceName,     r.url AS raceUrl,     s.year AS raceYear,     s.url AS seasonUrl FROM      circuits c JOIN      races r ON c.circuitId = r.circuitId JOIN      seasons s ON r.year = s.year WHERE      c.circuitRef = 'silverstone';	formula_1
SELECT date, time  FROM races  WHERE year = 2010 AND circuitRef = 'abu_dhabi';	formula_1
SELECT COUNT(*) FROM circuits JOIN races ON circuits.circuitId = races.circuitId JOIN seasons ON races.year = seasons.year WHERE circuits.name = 'Circuit de Barcelona-Catalunya' OR circuits.name = 'Monaco Grand Prix';	formula_1
SELECT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya' AND circuitId IN (     SELECT circuitId     FROM races     WHERE year = 2009 AND name = 'Spanish Grand Prix' );	formula_1
SELECT MIN(milliseconds) as fastestLapTime FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE driverRef = 'hamilton')	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.fastestLap = 1 ORDER BY lt.fastestLapSpeed DESC LIMIT 1;	formula_1
SELECT d.driverRef FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Canadian Grand Prix' AND ds.position = 1 AND r.year = 2007;	formula_1
SELECT r.name AS race_name, r.date AS race_date FROM races r JOIN results rs ON r.raceId = rs.raceId JOIN drivers d ON rs.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.name AS RaceName, d.forename || ' ' || d.surname AS DriverName, MIN(dr.rank) AS MinRank FROM results r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' GROUP BY r.name, d.forename, d.surname ORDER BY MinRank ASC LIMIT 1;	formula_1
SELECT MAX(fastestLapSpeed) AS fastest_lap_speed FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix' AND results.fastestLap IS NOT NULL;	formula_1
SELECT DISTINCT seasons.year FROM seasons JOIN races ON seasons.year = races.year JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT d.forename || ' ' || d.surname AS driver_name, r.positionOrder AS final_rank FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Chinese Grand Prix' AND d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.grid = 4 AND r.raceId = (SELECT raceId FROM races WHERE year = 1989 AND circuitId = (SELECT circuitId FROM circuits WHERE circuitRef = 'aussie') AND r.raceId = (SELECT raceId FROM races WHERE year = 1989 AND circuitId = (SELECT circuitId FROM circuits WHERE circuitRef = 'aussie'));	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM results AS r JOIN drivers AS d ON r.driverId = d.driverId JOIN races AS ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.time IS NOT NULL;	formula_1
SELECT MIN(milliseconds) AS fastestLapTime FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') ORDER BY fastestLapTime ASC LIMIT 1;	formula_1
SELECT r.time FROM races r JOIN results res ON r.raceId = res.raceId JOIN driverStandings ds ON res.driverId = ds.driverId JOIN drivers d ON res.driverId = d.driverId WHERE r.year = 2008 AND r.name = 'Austrian Grand Prix' AND ds.position = 2 AND d.driverRef = 'hamilton';	formula_1
SELECT      d.driverId,      d.forename,      d.surname,      d.url FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId JOIN      seasons s ON r.year = s.year WHERE      s.year = 2008 AND      r.name = 'Australian Grand Prix' AND      d.url IN (SELECT url FROM drivers WHERE url LIKE '%http://en.wikipedia.org/wiki/%') ORDER BY      ds.position ASC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN races r ON d.driverId = r.driverId JOIN constructorResults cr ON r.raceId = cr.raceId JOIN constructors c ON cr.constructorId = c.constructorId WHERE d.nationality = 'British' AND r.year = 2008 AND r.name = 'Australian Grand Prix';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND r.position IS NOT NULL;	formula_1
SELECT SUM(points) AS total_points FROM driverStandings JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT AVG(TIME_TO_SEC(T.fastestLapTime)) AS avg_fastest_lap_time_seconds FROM results AS R JOIN drivers AS D ON R.driverId = D.driverId JOIN lapTimes AS T ON R.driverId = T.driverId WHERE D.forename = 'Lewis' AND D.surname = 'Hamilton';	formula_1
SELECT      (SELECT COUNT(DISTINCT raceId)       FROM results       WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' AND time IS NOT NULL)     ) /      (SELECT COUNT(DISTINCT raceId)       FROM results       WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')     ) AS completion_rate;	formula_1
WITH   champion AS (     SELECT       t1.time AS champion_time     FROM       results t1       JOIN races t2 ON t1.raceId = t2.raceId     WHERE       t2.name = 'Australian Grand Prix' AND t2.year = 2008       AND t1.position = 1   ),   last_driver AS (     SELECT       t1.time AS last_driver_time     FROM       results t1       JOIN races t2 ON t1.raceId = t2.raceId     WHERE       t2.name = 'Australian Grand Prix' AND t2.year = 2008       AND t1.position = (         SELECT MAX(t3.position)         FROM results t3         JOIN races t4 ON t3.raceId = t4.raceId         WHERE           t4.name = 'Australian Grand Prix' AND t4.year = 2008       )   ),   difference AS (     SELECT       (t1.time - t2.time) / t2.time * 100 AS time_diff_percentage     FROM       champion t1, last_driver t2   ) SELECT   time_diff_percentage FROM   difference;	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne';	formula_1
SELECT lat, lng  FROM circuits  WHERE country = 'USA';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND dob > '1980-01-01';	formula_1
SELECT MAX(points) AS max_points FROM constructorStandings WHERE constructorId IN (     SELECT constructorId     FROM constructors     WHERE nationality = 'British' )	formula_1
SELECT constructors.name, SUM(constructorStandings.points) AS total_points FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId GROUP BY constructors.name ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.raceId = 291 AND cr.points = 0;	formula_1
SELECT COUNT(DISTINCT cr.constructorId) FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'Japanese' AND cr.points = 0 GROUP BY cr.constructorId HAVING COUNT(DISTINCT cr.raceId) = 2;	formula_1
SELECT constructors.name, constructors.constructorRef FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId WHERE constructorStandings.position = 1;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN constructors c ON d.driverId = c.constructorId JOIN lapTimes lt ON d.driverId = lt.driverId WHERE c.nationality = 'French' AND lt.lap > 50;	formula_1
SELECT      (COUNT(CASE WHEN d.nationality = 'Japanese' AND r.year BETWEEN 2007 AND 2009 THEN d.driverId END) * 100.0) /      COUNT(CASE WHEN d.nationality = 'Japanese' THEN d.driverId END) AS race_completion_percentage FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      d.nationality = 'Japanese'      AND r.year BETWEEN 2007 AND 2009     AND r.time IS NOT NULL;	formula_1
SELECT      r.year,      AVG(SEC_TO_TIME(TIME_TO_SEC(time))) AS avg_time_seconds FROM      results r JOIN      drivers d ON r.driverId = d.driverId JOIN      constructorStandings cs ON r.constructorId = cs.constructorId AND r.raceId = cs.raceId JOIN      seasons s ON r.year = s.year WHERE      r.statusId = 1 AND -- only finished races     d.driverRef = cs.positionText AND -- only champion drivers     s.year < 1975 -- before year 1975 GROUP BY      r.year;	formula_1
SELECT d.forename, d.surname FROM drivers d WHERE d.dob > '1975-01-01' AND EXISTS (     SELECT 1     FROM driverStandings ds     WHERE ds.driverId = d.driverId     AND ds.position = 2 )	formula_1
SELECT COUNT(DISTINCT d.driverId) AS Italian_Drivers_Who_Didnt_Finish FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN constructors c ON r.constructorId = c.constructorId WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes );	formula_1
SELECT lap FROM lapTimes JOIN (     SELECT driverId     FROM results     WHERE year = 2009 AND position = 1 ) AS champ ON lapTimes.driverId = champ.driverId WHERE raceId IN (     SELECT raceId     FROM races     WHERE year = 2009 ) ORDER BY milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(fastestLapSpeed) AS average_fastest_lap_speed FROM results WHERE raceId IN (     SELECT raceId     FROM races     WHERE name = 'Spanish Grand Prix' ) AND fastestLap IS NOT NULL;	formula_1
SELECT r.name AS race_name, r.year FROM races r JOIN (     SELECT raceId, MIN(milliseconds) AS min_time     FROM results     WHERE milliseconds IS NOT NULL     GROUP BY raceId ) AS min_results ON r.raceId = min_results.raceId ORDER BY min_results.min_time LIMIT 1;	formula_1
SELECT      ROUND(         (COUNT(CASE WHEN drivers.dob < '1985-01-01' THEN drivers.driverId END) / COUNT(DISTINCT drivers.driverId)) * 100, 2     ) AS percentage_of_qualified_drivers FROM      drivers JOIN      races ON drivers.driverId = races.driverId JOIN      results ON races.raceId = results.raceId WHERE      drivers.dob < '1985-01-01'     AND results.laps > 50     AND results.year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(DISTINCT d.driverId) AS French Drivers With Fastest Lap FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.seconds < 120;	formula_1
SELECT code FROM drivers WHERE nationality = 'American';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) AS numberOfDrivers FROM driverStandings WHERE raceId = 18;	formula_1
SELECT      d.code,     (SELECT           MIN(YEAR(dob))       FROM drivers d2       WHERE d2.nationality = 'Dutch'         AND d2.driverId < d.driverId) AS youngest_driver_code,     (SELECT           COUNT(*)       FROM drivers d2       WHERE d2.nationality = 'Dutch'         AND d2.driverId < d.driverId) AS netherlandic_drivers_count FROM drivers d WHERE d.nationality = 'Dutch' ORDER BY d.dob DESC LIMIT 3;	formula_1
SELECT driverRef  FROM drivers  WHERE surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND SUBSTR(dob, 1, 4) = '1980';	formula_1
SELECT d.driverRef, d.forename, d.surname, MIN(lt.time) AS earliestLapTime FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY d.driverId ORDER BY earliestLapTime ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE d.dob LIKE '1971%' AND lt.fastestLapTime = (     SELECT MIN(lt2.fastestLapTime)     FROM lapTimes lt2     WHERE lt2.raceId = r.raceId );	formula_1
SELECT      d.driverId,      d.forename,      d.surname,      d.dob,     MAX(l(milliseconds)) as latestLapTime FROM      drivers d JOIN      lapTimes l ON d.driverId = l.driverId WHERE      d.nationality = 'Spanish' AND      d.dob < '1982-01-01' GROUP BY      d.driverId, d.forename, d.surname, d.dob ORDER BY      latestLapTime DESC LIMIT 10;	formula_1
SELECT year FROM races JOIN results ON races.raceId = results.raceId JOIN lapTimes ON races.raceId = lapTimes.raceId WHERE lapTimes.fastestLapTime = (     SELECT MIN(lapTimes.fastestLapTime)     FROM lapTimes ) GROUP BY races.year;	formula_1
SELECT s.year, MAX(lt.time) AS max_time FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId JOIN seasons s ON r.year = s.year GROUP BY s.year ORDER BY max_time ASC LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE raceId = (SELECT raceId FROM races WHERE round = 1 AND year = 2009) ORDER BY time ASC LIMIT 5;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM results r JOIN status s ON r.statusId = s.statusId WHERE r.raceId BETWEEN 50 AND 100   AND s.status = 'Disqualified'   AND r.time IS NULL;	formula_1
SELECT COUNT(*), c.location, c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'Austria' GROUP BY c.circuitId;	formula_1
SELECT r.year, r.round FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.time IS NOT NULL GROUP BY r.year, r.round ORDER BY COUNT(res.resultId) DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE q.q2 IS NOT NULL AND r.raceId = 23;	formula_1
SELECT      d.driverId,      d.name,      r.year,      r.date,      r.time FROM      drivers d JOIN      qualifying q ON d.driverId = q.driverId JOIN      races r ON q.raceId = r.raceId WHERE      d.dob = (SELECT MIN(dob) FROM drivers) ORDER BY      r.year ASC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'Puncture';	formula_1
SELECT      constructors.name AS constructor_name,      constructors.url AS introduction_website,      SUM(constructorResults.points) AS total_points FROM      constructors JOIN      constructorResults ON constructors.constructorId = constructorResults.constructorId WHERE      constructors.nationality = 'Italian' GROUP BY      constructors.constructorId ORDER BY      total_points DESC LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId GROUP BY c.constructorId ORDER BY SUM(cs.wins) DESC LIMIT 1;	formula_1
SELECT d.driverId, d.forename, d.surname, MAX(lt.time) AS slowestLapTime FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 GROUP BY d.driverId, d.forename, d.surname ORDER BY slowestLapTime DESC LIMIT 1;	formula_1
SELECT r.name AS race_name, MIN(l.time) AS fastest_lap_time_ms, MIN(l.milliseconds) AS fastest_lap_milliseconds FROM races r JOIN lapTimes l ON r.raceId = l.raceId WHERE l.position = 1 GROUP BY r.raceId, r.name ORDER BY fastest_lap_milliseconds LIMIT 1;	formula_1
SELECT AVG(fastestLapTime) AS avgFastestLapTime FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2006 AND name = 'United States Grand Prix') AND rank < 11;	formula_1
SELECT      d.forename,      d.surname,      d.dob,      AVG(T2.duration) AS avg_pitstop_duration FROM      drivers d JOIN      pitStops p ON d.driverId = p.driverId WHERE      d.nationality = 'German' AND      d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY      d.driverId ORDER BY      avg_pitstop_duration ASC LIMIT 3;	formula_1
SELECT d.surname, d.forename, r.time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2008 AND r.position = 1;	formula_1
SELECT constructors.constructorRef, constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId JOIN races ON constructorStandings.raceId = races.raceId JOIN seasons ON races.year = seasons.year WHERE seasons.year = 2009 AND races.name = 'Singapore Grand Prix' AND constructorStandings.position = 1;	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND dob BETWEEN '1981-01-01' AND '1991-12-31';	formula_1
SELECT forename || ' ' || surname AS fullName, url, dob FROM drivers WHERE nationality = 'German' AND dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng  FROM circuits  WHERE circuitRef = 'hungaroring';	formula_1
SELECT c.name, c.nationality, SUM(cr.points) as total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.name = 'Circuit de Monaco' AND r.year BETWEEN 1980 AND 2010 GROUP BY c.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(points) as average_score FROM constructorStandings cs JOIN races r ON cs.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId JOIN constructors co ON cs.constructorId = co.constructorId JOIN drivers d ON co.constructorId = d.constructorId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND c.name = 'Istanbul Park'	formula_1
SELECT AVG(COUNT(raceId)) AS average_races_per_year FROM races WHERE year BETWEEN 2000 AND 2010;	formula_1
SELECT nationality, COUNT(*) as count FROM drivers GROUP BY nationality ORDER BY count DESC LIMIT 1;	formula_1
SELECT COUNT(*)  FROM driverStandings ds  JOIN results r ON ds.driverId = r.driverId  WHERE ds.points = 91 AND r.wins > 0;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN (     SELECT raceId, MIN(fastestLapTime) AS minFastestLapTime     FROM results     GROUP BY raceId ) AS minLap ON r.raceId = minLap.raceId JOIN (     SELECT raceId, MAX(fastestLapSpeed) AS maxFastestLapSpeed     FROM results     GROUP BY raceId ) AS maxSpeed ON minLap.raceId = maxSpeed.raceId WHERE minLap.minFastestLapTime = maxSpeed.maxFastestLapSpeed;	formula_1
SELECT c.location || ', ' || c.country AS full_location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(date) FROM races);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.year = 2008 AND r.name = 'Malaysian Grand Prix' AND q.position = 1 AND q.q3 = MIN(q.q3);	formula_1
SELECT      d.forename || ' ' || d.surname AS fullName,     d.nationality,     c.name AS raceName FROM      drivers d JOIN      (SELECT MIN(dob) AS minDob FROM drivers) AS youngest ON      d.dob = youngest.minDob JOIN      races c ON      d.driverId = (         SELECT              driverId          FROM              results          WHERE              raceId = c.raceId          ORDER BY              time          LIMIT              1     );	formula_1
SELECT      (SELECT COUNT(*)       FROM results       JOIN status ON results.statusId = status.statusId       JOIN races ON results.raceId = races.raceId       JOIN drivers ON results.driverId = drivers.driverId       WHERE drivers.driverRef = 'hamilton'       AND races.name = 'Canadian Grand Prix'       AND status.status = 'Accident') AS accidents_count FROM      drivers  WHERE      drivers.driverRef = 'hamilton';	formula_1
SELECT d.forename, d.surname, COUNT(r.driverId) AS wins FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.driverId ORDER BY wins DESC LIMIT 1;	formula_1
SELECT MAX(duration) AS longest_pitstop_time FROM pitStops;	formula_1
SELECT MIN(milliseconds) AS fastestLapTime FROM lapTimes WHERE position = 1;	formula_1
SELECT MAX(duration) AS longest_pit_stop_duration FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT lap FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId JOIN races ON pitStops.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Australian Grand Prix' AND YEAR(races.date) = 2011;	formula_1
SELECT      d.driverId,     d.surname,     d.forename,     ps.raceId,     ps.driverId,     ps.duration  FROM      pitStops ps JOIN      drivers d ON ps.driverId = d.driverId JOIN      races r ON ps.raceId = r.raceId WHERE      r.year = 2011 AND      r.name = 'Australian Grand Prix';	formula_1
SELECT d.driverRef, lt.position, lt.time, lt.milliseconds FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE d.driverRef = 'hamilton' ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname, MIN(LEAST(STRFTIME('%s', lt.time), STRFTIME('%s', lt.time, 'unixepoch'))) AS min_time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId GROUP BY d.driverId ORDER BY min_time ASC LIMIT 20;	formula_1
SELECT      races.name AS circuit_name,      races.position FROM      races  JOIN      lapTimes ON races.raceId = lapTimes.raceId JOIN      drivers ON lapTimes.driverId = drivers.driverId JOIN      results ON lapTimes.driverId = results.driverId AND lapTimes.raceId = results.raceId WHERE      drivers.driverRef = 'hamilton'      AND lapTimes.time = (SELECT MIN(time) FROM lapTimes lt2 WHERE lt2.raceId = lapTimes.raceId AND lt2.driverId = lapTimes.driverId)	formula_1
SELECT raceId, MIN(milliseconds) AS fastestTime FROM lapTimes WHERE raceId IN (     SELECT raceId     FROM races     WHERE name = 'Austrian Grand Prix' ) GROUP BY raceId ORDER BY fastestTime ASC LIMIT 1;	formula_1
SELECT      circuits.name AS circuit_name,      MIN(lapTimes.time) AS fastest_lap_time FROM      circuits  JOIN      lapTimes ON circuits.circuitId = lapTimes.raceId WHERE      circuits.name LIKE '%Italy%' GROUP BY      circuits.name ORDER BY      fastest_lap_time;	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.circuitRef = 'austrian' AND r.name LIKE '%Austrian Grand Prix%' ORDER BY r.date DESC LIMIT 1;	formula_1
SELECT      pitStops.driverId,      pitStops.time,      pitStops.duration FROM      lapTimes  JOIN      pitStops ON lapTimes.driverId = pitStops.driverId AND lapTimes.raceId = pitStops.raceId JOIN      races ON lapTimes.raceId = races.raceId WHERE      lapTimes.raceId = (SELECT raceId FROM races WHERE name = 'Austrian Grand Prix')     AND lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId WHERE races.name = 'Austrian Grand Prix')	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN lapTimes lt ON c.circuitId = lt.circuitId WHERE lt.time = '1:29.488';	formula_1
SELECT AVG(milliseconds) AS average_pit_stop_time_milliseconds FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE driverRef = 'hamilton');	formula_1
SELECT AVG(milliseconds) AS average_lap_time FROM lapTimes WHERE raceId IN (     SELECT raceId     FROM races     WHERE circuitId IN (         SELECT circuitId         FROM circuits         WHERE country = 'Italy'     ) );	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT MAX(height), player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_api_id IN (     SELECT player_api_id     FROM Player_Attributes     ORDER BY potential ASC     LIMIT 1 )	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE pa.overall_rating BETWEEN 60 AND 65 AND pa.defensive_work_rate = 'low';	european_football_2
SELECT `player_api_id` FROM `Player_Attributes` ORDER BY `crossing` DESC LIMIT 5;	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY SUM(Match.home_team_goal + Match.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT home_team_api_id, COUNT(*) as lost_matches FROM Match WHERE season = '2015/2016' AND (home_team_goal < away_team_goal) GROUP BY home_team_api_id ORDER BY lost_matches ASC LIMIT 1;	european_football_2
SELECT p.player_name, SUM(pa.penalties) as total_penalties FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_name ORDER BY total_penalties DESC LIMIT 10;	european_football_2
SELECT T.team_long_name FROM Team T JOIN Match M ON T.team_api_id = M.away_team_api_id WHERE M.season = '2009/2010' AND M.home_team_api_id IN (     SELECT team_api_id     FROM Team     JOIN League L ON T.team_api_id = L.id     WHERE L.name = 'Scotland Premier League' ) GROUP BY T.team_long_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT      T1.team_long_name,      T1.buildUpPlaySpeed FROM      Team_Attributes AS T1 JOIN      (SELECT          team_api_id,          MAX(buildUpPlaySpeed) AS max_speed      FROM          Team_Attributes      GROUP BY          team_api_id      ORDER BY          max_speed DESC      LIMIT 4) AS T2 ON      T1.team_api_id = T2.team_api_id ORDER BY      T1.buildUpPlaySpeed DESC;	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016' AND SUM(CASE WHEN Match.home_team_goal = Match.away_team_goal THEN 1 ELSE 0 END) = MAX(SUM(CASE WHEN Match.home_team_goal = Match.away_team_goal THEN 1 ELSE 0 END)) GROUP BY League.name;	european_football_2
SELECT     p.player_name,     (strftime('%Y', 'now') - strftime('%Y', p.birthday)) AS age_at_present FROM     Player p JOIN     Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE     pa.sprint_speed >= 97     AND pa.date BETWEEN '2013-01-01' AND '2015-12-31';	european_football_2
SELECT League.name, COUNT(Match.id) AS total_matches FROM League JOIN Match ON League.id = Match.league_id GROUP BY League.id ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' GROUP BY player_api_id HAVING overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT team_fifa_api_id  FROM Team_Attributes  WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT t.team_long_name FROM Team t JOIN Team_Attributes ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE strftime('%Y', ta.date) = '2012' AND ta.buildUpPlayPassing > (     SELECT AVG(ta.buildUpPlayPassing)     FROM Team_Attributes ta     WHERE ta.buildUpPlayPassing IS NOT NULL     AND strftime('%Y', ta.date) = '2012' )	european_football_2
SELECT      ROUND((SUM(CASE WHEN `Player`.`player_fifa_api_id` IN (SELECT `player_fifa_api_id` FROM `Player_Attributes` WHERE `preferred_foot` = 'left') AND YEAR(`Player`.`birthday`) BETWEEN 1987 AND 1992 THEN 1 ELSE 0 END) * 100) / COUNT(`Player`.`player_fifa_api_id`), 2) AS left_foot_players_percentage FROM `Player`;	european_football_2
SELECT      League.name AS LeagueName,     SUM(Match.home_team_goal + Match.away_team_goal) AS TotalGoals FROM      Match JOIN      League ON Match.league_id = League.id GROUP BY      League.name ORDER BY      TotalGoals ASC LIMIT 5;	european_football_2
SELECT      AVG(long_shots) AS average_long_shots FROM      Player_Attributes WHERE      player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Ahmed Samir Farag');	european_football_2
SELECT      p.player_name,     AVG(pa.heading_accuracy) AS avg_heading_accuracy FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE      p.height > 180 GROUP BY      p.player_name ORDER BY      avg_heading_accuracy DESC LIMIT      10;	european_football_2
SELECT team_long_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE buildUpPlayDribblingClass = 'Normal' AND date >= '2014-01-01 00:00:00' AND date <= '2014-01-31 00:00:00' AND chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' AND date >= '2014-01-01 00:00:00' AND date <= '2014-01-31 00:00:00') GROUP BY team_long_name ORDER BY chanceCreationPassing ASC;	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2009/2010' AND AVG(Match.home_team_goal) > AVG(Match.away_team_goal) GROUP BY League.name;	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name, birthday FROM Player WHERE strftime('%Y-%m', birthday) = '1970-10';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Franco Zennaro';	european_football_2
SELECT      t.team_long_name,     ta.buildUpPlayPositioningClass FROM      Team t JOIN      Team_Attributes ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE      t.team_long_name = 'ADO Den Haag' AND      ta.buildUpPlayPositioningClass = 'High';	european_football_2
SELECT heading_accuracy  FROM Player_Attributes  WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Francois Affolter')  AND date = '2014-09-18 00:00:00';	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Gabriel Tamas' AND strftime('%Y', pa.date) = '2011';	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016';	european_football_2
SELECT preferred_foot FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.birthday = (     SELECT MIN(birthday)     FROM Player )	european_football_2
SELECT p.player_name, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.potential DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left';	european_football_2
SELECT team_short_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE chanceCreationPassingClass = 'Risky';	european_football_2
SELECT defensive_work_rate  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'David Wilson';	european_football_2
SELECT p.birthday  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT `League.name` FROM `League` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `Country.name` = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal)  FROM Match  JOIN Country ON Match.country_id = Country.id  WHERE Country.name = 'Poland' AND Match.season = '2010/2011';	european_football_2
SELECT p.player_name, p.height, AVG(pa.finishing) AS avg_finishing_rate FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height BETWEEN (SELECT MAX(height) FROM Player) AND (SELECT MIN(height) FROM Player) GROUP BY p.player_api_id ORDER BY avg_finishing_rate DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT `potential` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id` WHERE `Player.player_name` = 'Aaron Doran';	european_football_2
SELECT player_name  FROM Player  WHERE preferred_foot = 'left';	european_football_2
SELECT team_long_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team_Attributes.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_short_name = 'CLB';	european_football_2
SELECT team_short_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE buildUpPlayPassing > 70;	european_football_2
SELECT AVG(t2.overall_rating) as average_rating FROM Player t1 JOIN Player_Attributes t2 ON t1.player_api_id = t2.player_api_id WHERE t1.height > 170 AND strftime('%Y', t2.date) BETWEEN '2010' AND '2015';	european_football_2
SELECT player_name, MIN(height) as ShortestHeight FROM Player GROUP BY player_name ORDER BY ShortestHeight ASC LIMIT 1;	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Italy Serie A';	european_football_2
SELECT team_short_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;	european_football_2
SELECT AVG(`overall_rating`) AS avg_overall_rating FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_fifa_api_id` = `Player`.`player_fifa_api_id` WHERE `Player`.`player_name` = 'Aaron Doran';	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT t.team_short_name FROM Team t JOIN Match m ON t.team_api_id = m.home_team_api_id WHERE m.home_team_goal = 10;	european_football_2
SELECT p.player_name, pa.balance, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = 61 ORDER BY pa.balance DESC LIMIT 1;	european_football_2
SELECT      (SELECT AVG(ball_control)       FROM Player_Attributes pa       JOIN Player p ON pa.player_api_id = p.player_api_id       WHERE p.player_name = 'Abdou Diallo') -      (SELECT AVG(ball_control)       FROM Player_Attributes pa       JOIN Player p ON pa.player_api_id = p.player_api_id       WHERE p.player_name = 'Aaron Appindangoye') AS ball_control_difference;	european_football_2
SELECT team_long_name  FROM Team  WHERE team_short_name = 'GEN';	european_football_2
SELECT      p1.player_name AS Older_Player,      p2.player_name AS Younger_Player FROM      Player p1 JOIN      Player p2 ON p1.player_name = 'Aaron Lennon' AND p2.player_name = 'Abdelaziz Barrada' WHERE      p1.birthday > p2.birthday;	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE pa.preferred_foot = 'left' AND pa.attacking_work_rate = 'low';	european_football_2
SELECT `Country.name` FROM `Country` JOIN `League` ON `Country.id` = `League.country_id` WHERE `League.name` = 'Belgium Jupiler League';	european_football_2
SELECT `name` FROM `League` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `Country.name` = 'Germany';	european_football_2
SELECT p.player_name, pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high';	european_football_2
SELECT p.player_name, pa.crossing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY pa.crossing DESC LIMIT 1;	european_football_2
SELECT `heading_accuracy` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Ariel Borysiuk';	european_football_2
SELECT COUNT(*) FROM Player WHERE height > 180 AND `volleys` > 70;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Belgium' AND Match.season = '2008/2009';	european_football_2
SELECT PA.long_passing FROM Player_Attributes PA JOIN Player P ON PA.player_api_id = P.player_api_id WHERE P.birthday = (     SELECT MIN(birthday)     FROM Player );	european_football_2
SELECT COUNT(*) FROM Match WHERE League.name = 'Belgium Jupiler League' AND SUBSTR(`date`, 1, 7) = '2009-04';	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2008/2009' GROUP BY League.name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes` WHERE strftime('%Y', `Player`.`birthday`) < '1986' AND `Player_Attributes`.`player_api_id` IN (SELECT `player_api_id` FROM `Player` WHERE strftime('%Y', `Player`.`birthday`) < '1986');	european_football_2
SELECT      (SELECT overall_rating       FROM Player_Attributes pa       JOIN Player p ON pa.player_api_id = p.player_api_id       WHERE p.player_name = 'Ariel Borysiuk') -      (SELECT overall_rating       FROM Player_Attributes pa       JOIN Player p ON pa.player_api_id = p.player_api_id       WHERE p.player_name = 'Paulin Puel') *      100.0 /      (SELECT overall_rating       FROM Player_Attributes pa       JOIN Player p ON pa.player_api_id = p.player_api_id       WHERE p.player_name = 'Paulin Puel') AS percentage_difference;	european_football_2
SELECT AVG(buildUpPlaySpeed)  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id  WHERE Team.team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating) AS AverageOverallRating FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(crossing) AS total_crossing_score FROM Player_Attributes INNER JOIN Player AS T2 ON T2.player_api_id = Player_Attributes.player_api_id WHERE T2.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(`chanceCreationPassing`), `chanceCreationPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Ajax' GROUP BY `chanceCreationPassingClass` ORDER BY MAX(`chanceCreationPassing`) DESC LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player WHERE player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(overall_rating)  FROM Player_Attributes  WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Dorlan Pabon')	european_football_2
SELECT AVG(away_team_goal) AS average_goals_away FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id JOIN League ON Team.team_fifa_api_id = League.country_id JOIN Country ON League.country_id = Country.id WHERE Team.team_long_name = 'Parma' AND Country.name = 'Italy';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%' ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT overall_rating FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Mooy') AND date LIKE '2016-02-04%';	european_football_2
SELECT potential FROM Player_Attributes WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_name` = 'Francesco Migliore' AND `date` LIKE '2015-05-01%';	european_football_2
SELECT `defensive_work_rate` FROM `Player_Attributes` WHERE `player_name` = 'Kevin Berigaud' AND `date` = '2013-02-22 00:00:00';	european_football_2
SELECT MAX(date), `player_name` FROM `Player_Attributes` WHERE `player_name` = 'Kevin Constant' GROUP BY `player_name` ORDER BY MAX(`crossing`) DESC LIMIT 1;	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Willem II' AND Team_Attributes.date = '2011-02-22'	european_football_2
SELECT buildUpPlayDribblingClass FROM Team_Attributes WHERE team_fifa_api_id IN (     SELECT team_fifa_api_id     FROM Team     WHERE team_short_name = 'LEI' ) AND date = '2015-09-10 00:00:00';	european_football_2
SELECT buildUpPlayPassingClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'FC Lorient' AND Team_Attributes.date LIKE '2010-02-22%';	european_football_2
SELECT `chanceCreationPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'PEC Zwolle' AND `date` = '2013-09-20 00:00:00';	european_football_2
SELECT chanceCreationCrossingClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id  WHERE Team.team_long_name = 'Hull City' AND Team_Attributes.date = '2010-02-22 00:00:00';	european_football_2
SELECT `defenceAggressionClass` FROM `Team_Attributes` WHERE `team_fifa_api_id` = (     SELECT `team_fifa_api_id`     FROM `Team`     WHERE `team_long_name` = 'Hannover 96' ) AND `date` LIKE '2015-09-10%';	european_football_2
SELECT AVG(`overall_rating`) AS average_overall_rating FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Marko Arnautovic' AND LEFT(`Player_Attributes.date`, 10) BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT     ((         (SELECT overall_rating FROM Player_Attributes          INNER JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id          WHERE Player.player_name = 'Landon Donovan'          AND Player_Attributes.date = '2013-07-12'         ) -          (SELECT overall_rating FROM Player_Attributes          INNER JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id          WHERE Player.player_name = 'Jordan Bowery'          AND Player_Attributes.date = '2013-07-12'         )     ) /      (SELECT overall_rating FROM Player_Attributes      INNER JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id      WHERE Player.player_name = 'Landon Donovan'      AND Player_Attributes.date = '2013-07-12'     ) * 100 ) AS percentage_difference;	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT player_api_id  FROM Player  ORDER BY weight DESC  LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p WHERE DATEDIFF(CURRENT_TIMESTAMP, p.birthday) > 34 * 365;	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Match JOIN Player ON Match.home_player_1 = Player.player_api_id OR              Match.home_player_2 = Player.player_api_id OR              Match.home_player_3 = Player.player_api_id OR              Match.home_player_4 = Player.player_api_id OR              Match.home_player_5 = Player.player_api_id OR              Match.home_player_6 = Player.player_api_id OR              Match.home_player_7 = Player.player_api_id OR              Match.home_player_8 = Player.player_api_id OR              Match.home_player_9 = Player.player_api_id OR              Match.home_player_10 = Player.player_api_id OR              Match.home_player_11 = Player.player_api_id WHERE Player.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(a.away_team_goal) AS total_away_goals FROM Match a JOIN Player p ON a.away_player_1 = p.player_api_id OR a.away_player_2 = p.player_api_id WHERE p.player_name IN ('Daan Smith', 'Filipe Ferreira');	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Match JOIN Player ON Player.player_api_id = Match.home_player_1 OR Player.player_api_id = Match.home_player_2 OR              Player.player_api_id = Match.home_player_3 OR Player.player_api_id = Match.home_player_4 OR              Player.player_api_id = Match.home_player_5 OR Player.player_api_id = Match.home_player_6 OR              Player.player_api_id = Match.home_player_7 OR Player.player_api_id = Match.home_player_8 OR              Player.player_api_id = Match.home_player_9 OR Player.player_api_id = Match.home_player_10 OR              Player.player_api_id = Match.home_player_11 WHERE (strftime('%Y', CURRENT_TIMESTAMP, 'localtime') - strftime('%Y', Player.birthday, 'localtime')) < 31	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Match m ON p.player_api_id = m.home_player_1 OR p.player_api_id = m.home_player_2 OR p.player_api_id = m.home_player_3 OR p.player_api_id = m.home_player_4 OR p.player_api_id = m.home_player_5 OR p.player_api_id = m.home_player_6 OR p.player_api_id = m.home_player_7 OR p.player_api_id = m.home_player_8 OR p.player_api_id = m.home_player_9 OR p.player_api_id = m.home_player_10 OR p.player_api_id = m.home_player_11 JOIN Team_Attributes ta ON m.home_team_api_id = ta.team_api_id WHERE pa.attacking_work_rate = 'high' AND ta.buildUpPlayDribbling IS NOT NULL UNION SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Match m ON p.player_api_id = m.away_player_1 OR p.player_api_id = m.away_player_2 OR p.player_api_id = m.away_player_3 OR p.player_api_id = m.away_player_4 OR p.player_api_id = m.away_player_5 OR p.player_api_id = m.away_player_6 OR p.player_api_id = m.away_player_7 OR p.player_api_id = m.away_player_8 OR p.player_api_id = m.away_player_9 OR p.player_api_id = m.away_player_10 OR p.player_api_id = m.away_player_11 JOIN Team_Attributes ta ON m.away_team_api_id = ta.team_api_id WHERE pa.attacking_work_rate = 'high' AND ta.buildUpPlayDribbling IS NOT NULL;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY p.birthday LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Country c ON p.player_fifa_api_id = c.id WHERE c.name = 'Belgium';	european_football_2
SELECT p.player_name, c.name AS country_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Country c ON p.player_fifa_api_id = c.id WHERE pa.vision >= 90;	european_football_2
SELECT c.name AS Country, AVG(p.weight) AS AverageWeight FROM Player p JOIN Country c ON p.player_fifa_api_id = c.id GROUP BY c.name ORDER BY AverageWeight DESC LIMIT 1;	european_football_2
SELECT Team.team_long_name FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team_Attributes.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(height) AS average_height FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id JOIN Team ON Player.team_api_id = Team.team_api_id JOIN League ON Team.league_id = League.id JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Italy';	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-01-01';	european_football_2
SELECT (SELECT jumping FROM Player_Attributes WHERE id = 6) - (SELECT jumping FROM Player_Attributes WHERE id = 23) AS jump_difference;	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = 'left') AND pa.preferred_foot = 'left';	european_football_2
SELECT      (COUNT(*) FILTER (WHERE `strength` > 80 AND `stamina` > 80) * 100.0) / COUNT(*) AS percentage_over_80_strength_stamina FROM      `Player_Attributes`;	european_football_2
SELECT name FROM Country WHERE name = 'Poland';	european_football_2
SELECT home_team_goal, away_team_goal FROM Match WHERE date LIKE '2008-09-24%' AND league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League') AND (home_team_api_id = 9987 OR away_team_api_id = 9987);	european_football_2
SELECT      p.player_name,      pa.sprint_speed,      pa.agility,      pa.acceleration FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE      p.player_name = 'Alexis Blin';	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE Team.team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A');	european_football_2
SELECT MAX(home_team_goal) AS highest_home_score FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie');	european_football_2
SELECT `Player`.`player_name`, `Player`.`weight`, `Player_Attributes`.`finishing`, `Player_Attributes`.`curve` FROM `Player` JOIN `Player_Attributes` ON `Player`.`player_api_id` = `Player_Attributes`.`player_api_id` WHERE `Player`.`weight` = (SELECT MAX(`weight`) FROM `Player`)	european_football_2
SELECT League.name, COUNT(Match.id) AS total_games FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY total_games DESC LIMIT 4;	european_football_2
SELECT T1.team_long_name FROM Team T1 JOIN Match T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT      (COUNT(CASE WHEN p.height < 180 AND pa.overall_rating > 70 THEN 1 END) * 100.0) / COUNT(p.id) AS percentage_of_undersixfeet_with_strength_over_seventy FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id	european_football_2
SELECT      (COUNT(CASE WHEN p.SEX = 'M' AND e.Admission = '+' THEN 1 END) /       COUNT(CASE WHEN p.SEX = 'M' THEN 1 END) * 100) AS MaleInPatientPercentage,     (COUNT(CASE WHEN p.SEX = 'M' AND e.Admission = '-' THEN 1 END) /       COUNT(CASE WHEN p.SEX = 'M' THEN 1 END) * 100) AS MaleOutPatientPercentage FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.SEX = 'M';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN P.Birthday > '1930' THEN P.ID END) * 100.0) / COUNT(CASE WHEN P.SEX = 'F' THEN P.ID END) AS PercentageOfFemalesBornAfter1930 FROM      Patient P;	thrombosis_prediction
SELECT      ROUND((COUNT(CASE WHEN P.Birthday BETWEEN '1930-01-01' AND '1940-12-31' AND Pa.Admission = '+' THEN 1 END) * 100.0) /      COUNT(CASE WHEN P.Birthday BETWEEN '1930-01-01' AND '1940-12-31' THEN 1 END), 2) AS Inpatient_Percentage FROM      Patient P JOIN      Examination E ON P.ID = E.ID JOIN      Patient Pa ON P.ID = Pa.ID WHERE      P.Birthday BETWEEN '1930-01-01' AND '1940-12-31';	thrombosis_prediction
SELECT     (COUNT(CASE WHEN p.Diagnosis = 'SLE' AND e.Admission = '+' THEN e.ID END) /      COUNT(CASE WHEN p.Diagnosis = 'SLE' AND e.Admission = '-' THEN e.ID END)) AS OutpatientToInpatientRatio FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Diagnosis = 'SLE';	thrombosis_prediction
SELECT p.Diagnosis, l.Date FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.ID = 30609;	thrombosis_prediction
SELECT      p.SEX,      p.Birthday,      e.`Examination Date`,      e.Symptoms  FROM      Patient p  JOIN      Examination e  ON      p.ID = e.ID  WHERE      p.ID = 163109;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 500;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.RVVT = '+';	thrombosis_prediction
SELECT      p.ID,      p.SEX,      e.Diagnosis  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      e.Thrombosis = 2;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1937-05-02' AND l.T-CHO >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALB < 3.5;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN P.SEX = 'F' AND L.TP < 6.0 OR L.TP > 8.5 THEN P.ID END) * 100.0) / COUNT(P.ID) AS Percentage_Female TP_Out_Of_Normal FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      P.SEX = 'F';	thrombosis_prediction
SELECT AVG(`aCL IgG`) AS Average_AntiCardiolipin_IgG FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Admission = '+' AND SUBSTR(Patient.Birthday, 6, 2) - SUBSTR(CURRENT_DATE, 6, 2) >= 50;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'F' AND YEAR(P.Description) = 1997 AND E.Admission = '-';	thrombosis_prediction
SELECT      MIN(         EXTRACT(YEAR FROM `First Date`) - EXTRACT(YEAR FROM Birthday)     ) AS YoungestAgeAtAdmission FROM      Patient;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 1 AND YEAR(E.`Examination Date`) = 1997 AND P.SEX = 'F';	thrombosis_prediction
SELECT MAX(YEAR(P.Birthday)) - MIN(YEAR(P.Birthday)) AS AgeGap FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG >= 200 GROUP BY P.ID;	thrombosis_prediction
SELECT p.Description, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT      EXTRACT(YEAR FROM `Examination Date`) AS Year,      EXTRACT(MONTH FROM `Examination Date`) AS Month,      COUNT(`Patient`.ID) / 12 AS AvgMonthlyMalePatients FROM      `Examination` JOIN      `Patient` ON `Examination`.ID = `Patient`.ID WHERE      `Patient`.SEX = 'M' AND      `Examination Date` BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY      Year, Month	thrombosis_prediction
SELECT      l.Date AS LabWorkDate,      (SUBTRACT(year(p.Birthday), year(p.FirstDate))) AS AgeAtAdmission FROM      Examination e JOIN      Patient p ON e.ID = p.ID JOIN      Laboratory l ON e.ID = l.ID AND e.`Examination Date` = l.Date WHERE      e.Diagnosis LIKE '%SJS%' ORDER BY      p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      (SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END) * 1.0) / SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS MaleToFemaleRatio FROM      Patient WHERE      (SEX = 'M' AND UA <= 8.0) OR (SEX = 'F' AND UA <= 6.5);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE e.Examination_Date IS NULL OR (e.Examination_Date - p.First_Date) >= INTERVAL 1 YEAR;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Birthday < '1970-01-01' AND YEAR(E.`Examination Date`) BETWEEN 1990 AND 1993;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.T_BIL >= 2.0;	thrombosis_prediction
SELECT Diagnosis, COUNT(*) AS diagnosis_count FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY diagnosis_count DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(SUBTRACT('1999', year(Birthday))) AS average_age FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE Date BETWEEN '1991-10-01' AND '1991-10-30' )	thrombosis_prediction
SELECT      (YEAR(`Examination Date`) - YEAR(`Birthday`)) AS Age,     T2.Diagnosis FROM      Examination AS T1 JOIN      Patient AS T2 ON T1.ID = T2.ID WHERE      T1.HGB = (SELECT MAX(HGB) FROM Examination)	thrombosis_prediction
SELECT `ANA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT      `T-CHO` AS Total_Cholesterol FROM      Laboratory WHERE      ID = 2927464 AND      Date = '1995-09-04' AND      `T-CHO` < 250;	thrombosis_prediction
SELECT p.SEX  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Diagnosis LIKE '%AORTITIS%' ORDER BY e.`Examination Date` ASC  LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM Examination WHERE `Examination Date` = '1993-11-12' AND ID IN (SELECT ID FROM Patient WHERE `Description` = '1994-02-19' AND `Diagnosis` = 'SLE');	thrombosis_prediction
SELECT P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX IN ('M', 'F') AND L.GPT = 9 AND L.Date = '1992-06-12';	thrombosis_prediction
SELECT      (EXTRACT(YEAR FROM '1991-10-21') - EXTRACT(YEAR FROM p.Birthday)) -      (CASE          WHEN EXTRACT(MONTH FROM '1991-10-21') < EXTRACT(MONTH FROM p.Birthday) OR               (EXTRACT(MONTH FROM '1991-10-21') = EXTRACT(MONTH FROM p.Birthday) AND EXTRACT(DAY FROM '1991-10-21') < EXTRACT(DAY FROM p.Birthday))          THEN 1          ELSE 0      END) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.Date = '1991-10-21' AND      l.UA = '8.4';	thrombosis_prediction
SELECT COUNT(ID) AS Total_Laboratory_Tests FROM Laboratory WHERE ID IN (     SELECT ID     FROM Patient     WHERE `First Date` = '1991-06-13'     AND Diagnosis = 'SJS' ) AND Date BETWEEN '1995-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT p.Diagnosis AS Original_Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`Examination Date` = '1997-01-27' AND p.`First Date` = '1997-01-27' AND e.Diagnosis = 'SLE';	thrombosis_prediction
SELECT e.Symptoms FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday = '1959-03-01' AND e.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT      (SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-11-%' THEN l.`T-CHO` ELSE 0 END) -      SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-12-%' THEN l.`T-CHO` ELSE 0 END)) /       SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-11-%' THEN l.`T-CHO` ELSE 1 END) AS DecreaseRate FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Birthday = '1959-02-18' AND      (l.Date LIKE '1981-11-%' OR l.Date LIKE '1981-12-%')	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Diagnosis LIKE '%Behcet%' AND Examination.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT p.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Date BETWEEN '1987-07-06' AND '1996-01-31' AND e.GPT > 30 AND e.ALB < 4 ORDER BY p.ID;	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' ORDER BY ID;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 2 AND e.`ANA Pattern` = 'S' AND e.`aCL IgM` > (SELECT AVG(`aCL IgM`) FROM Examination) * 1.2;	thrombosis_prediction
SELECT      ROUND(         (SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) / SUM(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN 1 ELSE 0 END)) * 100,          2     ) AS PercentageOfNormalProteinuriaWithLowUricAcid FROM      Laboratory WHERE      `U-PRO` > 0 AND `U-PRO` < 30	thrombosis_prediction
SELECT      (SUM(CASE WHEN T1.Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) * 100.0) /      (COUNT(T1.Diagnosis = 'BEHCET') * 100.0) AS PercentageOfMalePatientsWithBEHCET FROM      Patient T1 WHERE      T1.SEX = 'M' AND      YEAR(T1.FirstDate) = 1981	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Description, p.`First Date`, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND       l.Date LIKE '1991-10%' AND       l.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`ANA Pattern` != 'P'   AND p.SEX = 'F'   AND p.Birthday BETWEEN '1980-01-01' AND '1989-12-31';	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID AND e.`Examination Date` = l.Date WHERE e.Diagnosis = 'PSS' AND l.CRP > 2 AND l.CRE = 1 AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(ALB) AS Average_Blood_Albumin FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'F' AND Laboratory.PLT > 400 AND Patient.Diagnosis = 'SLE';	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1;	thrombosis_prediction
SELECT      p.Birthday,      pa.Diagnosis  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      p.ID = 48473  ORDER BY      e.Description  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE YEAR(e.`Examination Date`) = 1997 AND e.TP > 6 AND e.TP < 8.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Examination.Diagnosis` LIKE '%SLE%' THEN 1 ELSE 0 END)       / SUM(CASE WHEN `Examination.Symptoms` LIKE '%ITP%' THEN 1 ELSE 0 END)) * 100 AS ProportionOfSLEWithThrombocytopenia FROM Examination;	thrombosis_prediction
SELECT     ROUND((SUM(CASE WHEN YEAR(Birthday) = '1980' AND Diagnosis = 'RA' AND SEX = 'F' THEN 1 ELSE 0 END) * 100.0) / COUNT(SEX), 2) AS percentage_female_with_ra FROM     Patient	thrombosis_prediction
SELECT COUNT(*) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.SEX = 'M' AND Examination.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND Examination.Diagnosis = 'Behcet' AND Examination.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.SEX = 'F' AND Examination.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination Date`, `First Date`) as DaysBetween FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.ID = 821298;	thrombosis_prediction
SELECT      CASE          WHEN p.SEX = 'M' THEN (UA > 8.0)         WHEN p.SEX = 'F' THEN (UA > 6.5)     END AS IsUricAcidNormal FROM      Laboratory l JOIN      Patient p ON l.ID = p.ID WHERE      p.ID = 57266 AND p.SEX IN ('M', 'F');	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ID = (SELECT ID FROM Patient WHERE `First Date` = '1973-01-01') AND GOT >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND YEAR(l.Date) = 1994;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GPT >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, e.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE l.GPT > 60 ORDER BY p.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) as avg_LDH FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT      p.ID,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.LDH BETWEEN 600 AND 800     AND TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) > 0;	thrombosis_prediction
SELECT      p.ID,      CASE WHEN e.Admission = '+' THEN 'Inpatient' ELSE 'Outpatient' END AS AdmissionStatus FROM      Examination e JOIN      Patient p ON e.ID = p.ID WHERE      e.ALP < 300;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01' AND l.ALP < 300;	thrombosis_prediction
SELECT      Patient.ID,      Patient.SEX,      Patient.Birthday FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Laboratory.TP < 6.0;	thrombosis_prediction
SELECT      Patient.ID,      (Lab.TP - 8.5) AS TP_Deviation FROM      Patient JOIN      Laboratory Lab ON Patient.ID = Lab.ID WHERE      Patient.SEX = 'F' AND      Lab.TP > 8.5	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB <= 3.5 OR l.ALB >= 5.5 GROUP BY p.ID, p.Birthday ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT      p.ID,     CASE          WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range'         ELSE 'Not Within Normal Range'     END AS Albumin_Status FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Birthday BETWEEN '1982-01-01' AND '1982-12-31'     AND l.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = p.ID)	thrombosis_prediction
SELECT      CAST(COUNT(*) AS REAL) * 100 /      (SELECT COUNT(*) FROM Patient WHERE SEX = 'F') AS Percentage_Female_UA_Beyond_Normal FROM      Examination  JOIN      Patient ON Examination.ID = Patient.ID WHERE      Patient.SEX = 'F' AND      (Examination.UA > 6.5);	thrombosis_prediction
SELECT AVG(UA) AS Average_UA_Index FROM Laboratory WHERE (UA < 8.0 AND SEX = 'M') OR (UA < 6.5 AND SEX = 'F') AND ID IN (SELECT ID FROM Examination) AND Laboratory.ID = Examination.ID AND Laboratory.Date = (     SELECT MAX(Date)     FROM Laboratory AS L2     WHERE L2.ID = Laboratory.ID )	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'RA' AND e.UN < 30;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.CRE >= 1.5;	thrombosis_prediction
SELECT     SUM(CASE WHEN SEX = 'M' AND CRE >= 1.5 THEN 1 ELSE 0 END) AS MaleCreatinineOutOfRange,     SUM(CASE WHEN SEX = 'F' AND CRE >= 1.5 THEN 1 ELSE 0 END) AS FemaleCreatinineOutOfRange FROM     Patient JOIN     Laboratory ON     Patient.ID = Laboratory.ID WHERE     Patient.SEX IN ('M', 'F') GROUP BY     Patient.SEX ORDER BY     MaleCreatinineOutOfRange DESC, FemaleCreatinineOutOfRange DESC LIMIT 1;	thrombosis_prediction
SELECT      Patient.ID,      Patient.SEX,      Patient.Birthday  FROM      Patient  JOIN      Laboratory  ON      Patient.ID = Laboratory.ID  WHERE      Laboratory.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory);	thrombosis_prediction
SELECT GROUP_CONCAT(DISTINCT p.ID) AS PatientID, p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-BIL` >= 2.0 GROUP BY p.SEX;	thrombosis_prediction
SELECT      p.ID,      l.T-CHO FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Birthday = (SELECT MIN(Birthday) FROM Patient)     AND l.T-CHO = (SELECT MAX(T-CHO) FROM Laboratory)	thrombosis_prediction
SELECT AVG(DIVIDE(SUBTRACT(YEAR(NOW()), YEAR(Birthday)), COUNT(ID)))  FROM Patient  WHERE SEX = 'M' AND `T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG > 300;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG >= 200 AND (YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT L.ID FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Admission = '-' AND L.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Birthday BETWEEN '1936-01-01' AND '1956-12-31'  AND Patient.SEX = 'M'  AND Laboratory.CPK >= 250;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Birthday IS NOT NULL AND      (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) >= 18 AND     l.GLU >= 180 AND      l.T_CHO < 250;	thrombosis_prediction
SELECT      Patient.ID,      Laboratory.GLU  FROM      Patient  JOIN      Laboratory  ON      Patient.ID = Laboratory.ID  WHERE      Laboratory.GLU < 180  AND      YEAR(Patient.Description) = 1991;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.WBC <= 3.5 OR l.WBC >= 9.0 GROUP BY      p.SEX,      p.Birthday ORDER BY      p.SEX,      (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) ASC;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) AS Age,      e.Diagnosis FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.ID IN (SELECT ID FROM Laboratory WHERE RBC < 3.5)	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday,      p.Admission FROM      Patient p WHERE      p.SEX = 'F' AND      (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Birthday)) >= 50 AND      (SELECT RBC FROM Laboratory l WHERE l.ID = p.ID ORDER BY l.Date DESC LIMIT 1) <= 3.5 OR      (SELECT RBC FROM Laboratory l WHERE l.ID = p.ID ORDER BY l.Date DESC LIMIT 1) >= 6.0 AND      p.Admission = '+';	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Admission = '-' AND e.HGB < 10;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND p.Birthday = (     SELECT MAX(Birthday)     FROM Patient     WHERE ID IN (         SELECT ID         FROM Examination         WHERE Diagnosis = 'SLE' AND HGB BETWEEN 10 AND 17     ) );	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID IN (         SELECT              l1.ID         FROM              Laboratory l1         WHERE              l1.HCT >= 52         GROUP BY              l1.ID         HAVING              COUNT(l1.ID) > 2     )	thrombosis_prediction
SELECT AVG(HCT) as AverageHematocritLevel FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) AS 'BelowNormalCount',     SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS 'AboveNormalCount' FROM Laboratory;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = 1984 AND p.Birthday > DATE_SUB(CURDATE(), INTERVAL 50 YEAR) AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT      ROUND(         (SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) / SUM(CASE WHEN PT >= 14 THEN 1 ELSE 0 END)) * 100,          2     ) AS PercentageOfAbnormalPTFemale FROM      Patient WHERE      (YEAR(CURRENT_TIMESTAMP) - YEAR(Birthday)) > 55	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Description, p.`First Date`, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.`First Date` > '1992-12-31' AND l.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID AND l.Date = e.`Examination Date` WHERE e.Thrombosis = 0 AND l.APTT > 45;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.SEX = 'M' AND Examination.WBC > 3.5 AND Examination.WBC < 9.0 AND (Examination.FG <= 150 OR Examination.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.Birthday > '1980-01-01' AND Examination.FG < 150 OR Examination.FG > 450;	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`U-PRO` >= 30;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.`U-PRO` BETWEEN 0 AND 30 AND Examination.Diagnosis = 'SLE';	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.aCL_IgG >= 2000;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`aCL IgG` > 900 AND E.`aCL IgG` < 2000 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`aCL IgA` BETWEEN 80 AND 500 AND e.`aCL IgA` = (SELECT MAX(`aCL IgA`)                   FROM Examination                   WHERE `aCL IgA` BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.`First Date` > '1990-01-01' AND e.`aCL IgA` > 80 AND e.`aCL IgA` < 500;	thrombosis_prediction
SELECT      T1.Diagnosis,      COUNT(T1.Diagnosis) AS DiagnosisCount FROM      Examination AS T1 JOIN      Patient AS T2 ON T1.ID = T2.ID WHERE      (T1.aCL_IgM <= 40 OR T1.aCL_IgM >= 400) GROUP BY      T1.Diagnosis ORDER BY      DiagnosisCount DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID NOT IN (SELECT DISTINCT ID FROM Laboratory WHERE CRP = '+') AND Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.ID IN (     SELECT e.ID     FROM Examination e     WHERE e.CRE >= 1.5 ) AND SUBDATE(CURDATE(), INTERVAL 70 YEAR) > p.Birthday;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.RA IN('-', '+-') AND e.KCT = '+';	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday > '1985-01-01' AND e.RA IN('-', '+-');	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RF < 20 AND (YEAR(CURDATE()) - YEAR(p.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RF < 20 AND e.Thrombosis = '0';	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.ANA = 256 AND Examination.ANA_Pattern = 'P' AND Examination.C3 > 35;	thrombosis_prediction
SELECT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'F' AND e.HCT < 29 OR e.HCT > 52 ORDER BY e.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Thrombosis = 1 AND C4 > 10;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RNP IN ('-', '+-') AND P.Admission = '+';	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RNP NOT IN('-', '+-') ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.SM IN('-', '+-') AND E.Thrombosis = 0;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SM NOT IN ('negative', '0') ORDER BY p.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`Examination Date` > '1997-01-01' AND e.SC170 IN('negative', '0');	thrombosis_prediction
SELECT DISTINCT COUNT(P.ID)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE P.SEX = 'F'  AND E.Symptoms IS NULL  AND E.SC170 IN ('negative', '0');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SSA IN('-','+-') AND YEAR(p.`First Date`) < 2000;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SSA NOT IN ('negative', '0') AND p.`First Date` = (SELECT MIN(`First Date`) FROM Patient WHERE ID = p.ID) GROUP BY p.ID;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.`SSB` IN('-', '+-') AND Examination.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) AS PatientCount FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.SSB IN ('negative', '0') AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'M' AND E.CENTROMEA IN('-', '+-') AND E.SSB IN('-', '+-');	thrombosis_prediction
SELECT p.ID, e.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.DNA < 8 AND Patient.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.IGG BETWEEN 900 AND 2000 AND p.Admission = '+';	thrombosis_prediction
SELECT      (COUNT(E.ID) FILTER (WHERE E.GOT >= 60 AND E.Diagnosis = 'SLE'))::FLOAT /      (COUNT(E.ID) FILTER (WHERE E.GOT >= 60)) * 100 AS Percentage FROM      Examination E;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT MIN(Birthday)  FROM Patient  WHERE ID IN (     SELECT ID      FROM Laboratory      WHERE GOT >= 60 )  ORDER BY Birthday ASC  LIMIT 1;	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 60 GROUP BY p.Birthday ORDER BY AVG(l.GPT) DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT < 60 AND Patient.SEX = 'M';	thrombosis_prediction
SELECT MIN(`First Date`)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE LDH < 500  ORDER BY LDH DESC, MIN(`First Date`) ASC  LIMIT 1;	thrombosis_prediction
SELECT MAX(Date) as LatestMedicalDataRecorded FROM Laboratory WHERE ID = (     SELECT MAX(`First Date`)     FROM Patient ) AND LDH >= 500;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.ALP >= 300 AND P.Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Admission = '-' AND Examination.ALP < 300;	thrombosis_prediction
SELECT DISTINCT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Diagnosis = 'SJS' AND Laboratory.TP > 6.0 AND Laboratory.TP < 8.5;	thrombosis_prediction
SELECT `Examination.Date` FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.ID = (     SELECT ID     FROM Laboratory     WHERE ALB > 3.5 AND ALB < 5.5     GROUP BY ID     ORDER BY MAX(ALB) DESC     LIMIT 1 );	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT MAX(UA) as MaxUricAcid, aCL_IgG, aCL_IgM, aCL_IgA FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'F' AND UA > 6.50 GROUP BY p.ID ORDER BY MaxUricAcid DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(`ANA`) as Highest_ANA FROM Examination WHERE ID IN (SELECT ID FROM Laboratory WHERE CRE < 1.5) AND `ANA` IS NOT NULL;	thrombosis_prediction
SELECT      p.ID  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      l.CRE < 1.5      AND l.IGA = (SELECT MAX(Iga) FROM Laboratory WHERE ID = p.ID)	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`T-BIL` >= 2.0 AND e.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT Examination.`aCL IgG`, Examination.`aCL IgM`, Examination.ANA FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID AND Examination.`Examination Date` = Laboratory.Date WHERE Laboratory.`T-BIL` < 2.0 AND Laboratory.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0) AND Examination.ANA IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`T-CHO` >= 250 AND e.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`T-CHO` < 250 AND e.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE TG < 200 AND Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.TG < 200 AND e.TG = (SELECT MAX(TG) FROM Examination WHERE TG < 200) AND p.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 0 AND e.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.CPK < 250 AND (E.KCT = '+' OR E.RVVT = '+' OR E.LAC = '+');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND l.GLU > 180;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GLU < 180 AND Laboratory.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.WBC BETWEEN 3.5 AND 9.0  AND Patient.Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND e.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Admission = '-' AND (e.RBC <= 3.5 OR e.RBC >= 6.0);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.PLT > 100 AND e.PLT < 400 AND e.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT p.ID, e.PLT FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.PLT > 100 AND e.PLT < 400 AND e.Diagnosis = 'MCTD';	thrombosis_prediction
SELECT AVG(PT) AS Average_Prothrombin_Time FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'M') AND PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.Thrombosis IN (2, 1) AND Laboratory.PT < 14;	thrombosis_prediction
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';	student_club
SELECT COUNT(*)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.college = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design' AND m.position = 'Member';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*) FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer' AND member.t_shirt_size = 'Medium';	student_club
SELECT event.event_name, COUNT(link_to_event) AS attendance_count FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id WHERE member.position = 'Member' AND event.event_name LIKE '%Student_Club%' GROUP BY event.event_name ORDER BY attendance_count DESC LIMIT 1;	student_club
SELECT m.link_to_major, m.first_name, m.last_name FROM member m WHERE m.position = 'Vice President' AND m.link_to_major IS NOT NULL;	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(*) FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison' AND YEAR(event.event_date) = 2019 AND event.event_name = 'Student_Club';	student_club
SELECT COUNT(*) AS meeting_count FROM event WHERE type = 'Meeting' AND event_id IN (     SELECT link_to_event     FROM attendance     GROUP BY link_to_event     HAVING COUNT(link_to_member) > 10 );	student_club
SELECT event_name FROM event WHERE event_id IN (     SELECT link_to_event     FROM attendance     GROUP BY link_to_event     HAVING COUNT(link_to_member) > 20 AND type != 'Fundraiser' )	student_club
SELECT COUNT(DISTINCT e.event_id) / COUNT(DISTINCT e.event_name) AS average_attendance FROM event e WHERE e.type = 'Meeting' AND YEAR(e.event_date) = 2020;	student_club
SELECT expense_description, MAX(cost) AS max_cost FROM expense WHERE link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE type = 'Meeting' OR type = 'Election')) GROUP BY expense_description ORDER BY max_cost DESC LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Law and Constitutional Studies';	student_club
SELECT      z.county  FROM      member m  JOIN      zip_code z ON m.zip = z.zip_code  JOIN      (SELECT          member_id       FROM          member       WHERE          first_name = 'Sherri' AND          last_name = 'Ramsey') AS sh ON      m.member_id = sh.member_id;	student_club
SELECT m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Tyler' AND m.last_name = 'Hewitt';	student_club
SELECT SUM(i.amount) AS total_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT SUM(b.spent) AS total_spent_on_food FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President';	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Agriculture and Applied Sciences') AND zip IN (SELECT zip_code FROM zip_code WHERE state = 'Illinois');	student_club
SELECT SUM(b.spent) AS total_advertisement_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Advertisement';	student_club
SELECT major.department FROM major JOIN member ON major.major_id = member.link_to_major WHERE member.first_name = 'Pierce' OR member.last_name = 'Guidi';	student_club
SELECT SUM(b.amount) AS total_budgeted_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker';	student_club
SELECT e.expense_description FROM expense e JOIN event ev ON e.link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'October Meeting' AND event_date = '2019-10-08')) WHERE e.approved = 'true';	student_club
SELECT      SUM(expense.cost) / COUNT(expense.expense_id) AS avg_cost FROM      expense JOIN      member ON expense.link_to_member = member.member_id WHERE      member.first_name = 'Elijah' AND      member.last_name = 'Allen' AND      CAST(SUBSTRING(expense.expense_date, 6, 2) AS INTEGER) IN (9, 10);	student_club
SELECT      (SUM(CASE WHEN SUBSTRING(event_date, 1, 4) = '2019' THEN spent ELSE 0 END) -      SUM(CASE WHEN SUBSTRING(event_date, 1, 4) = '2020' THEN spent ELSE 0 END)) AS total_spent_difference FROM      event JOIN      budget ON event.event_id = budget.link_to_event WHERE      event.status = 'Closed';	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT expense.cost FROM expense JOIN event ON expense.link_to_event = event.event_id WHERE event.event_name = 'Posters' AND expense.expense_date = '2019-09-04';	student_club
SELECT remaining FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1;	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT county FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE first_name = 'Adela' AND last_name = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM budget WHERE link_to_event IN (     SELECT event_id     FROM event     WHERE event_name = 'November Meeting' ) AND remaining < 0;	student_club
SELECT SUM(amount) AS total_budget_amount FROM budget WHERE link_to_event IN (     SELECT event_id     FROM event     WHERE event_name = 'September Speaker' );	student_club
SELECT e.status FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-08-20';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Brent' AND member.last_name = 'Thomason';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT zip_code.type FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Christof' AND member.last_name = 'Nielson';	student_club
SELECT major.major_name FROM major JOIN member ON major.major_id = member.link_to_major WHERE member.position = 'Vice President';	student_club
SELECT z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT m.link_to_major, m.first_name, m.last_name, m.position, m.email, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'President';	student_club
SELECT date_received FROM income WHERE first_name = 'Connor' AND last_name = 'Hilton' AND source = 'Dues';	student_club
SELECT first_name, last_name FROM member JOIN income ON member.member_id = income.link_to_member WHERE source = 'Dues' ORDER BY date_received LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /      SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END)) AS budget_ratio FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      b.category = 'Advertisement' AND     (e.event_name = 'Yearly Kickoff' OR e.event_name = 'October Meeting');	student_club
SELECT     (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) /      SUM(CASE WHEN b.event_name = 'November Speaker' THEN b.amount ELSE 0 END)) * 100 AS parking_budget_percentage FROM     budget b WHERE     b.event_name = 'November Speaker';	student_club
SELECT SUM(e.cost) AS total_pizza_cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE e.expense_description = 'Pizza' AND b.event_status = 'Closed';	student_club
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT zip_code.city, zip_code.county, zip_code.state FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Amy' AND member.last_name = 'Firth';	student_club
SELECT expense.expense_description, expense.cost FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.remaining = (SELECT MIN(remaining) FROM budget);	student_club
SELECT m.member_id, m.first_name, m.last_name, m.email, m.position, m.t_shirt_size, m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN `event` e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT major.college, COUNT(*) as member_count FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY major.college ORDER BY member_count DESC LIMIT 1;	student_club
SELECT major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE phone = '809-555-3360';	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.amount = (SELECT MAX(amount) FROM budget)	student_club
SELECT e.expense_description, e.expense_date, e.cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT date_received FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Casey' AND last_name = 'Mason');	student_club
SELECT COUNT(*) FROM member WHERE zip IN (     SELECT zip_code     FROM zip_code     WHERE state = 'Maryland' );	student_club
SELECT COUNT(*) FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE member.phone = '954-555-6240';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT      event_id,      event_name,      type,      MAX(DIVIDE(spent, amount)) AS spend_to_budget_ratio FROM      event JOIN      budget ON event.event_id = budget.link_to_event WHERE      event.status = 'Closed' AND budget.amount IS NOT NULL GROUP BY      event_id, event_name, type ORDER BY      spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) AS highest_spent FROM budget WHERE event_status = 'Closed';	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT SUM(spent) AS total_spent_for_food FROM budget WHERE category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id, m.first_name, m.last_name HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT first_name, last_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina');	student_club
SELECT SUM(amount) AS total_income FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN budget b ON m.member_id = b.link_to_member JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name, i.source, MAX(i.amount) as highest_income FROM member m JOIN income i ON m.member_id = i.link_to_member GROUP BY m.member_id, m.first_name, m.last_name, i.source ORDER BY highest_income DESC LIMIT 1;	student_club
SELECT event_name, MIN(cost) AS lowest_cost FROM event GROUP BY event_name ORDER BY lowest_cost ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.cost ELSE 0 END) / SUM(b.cost) * 100) AS percentage_of_total_cost FROM      event e JOIN      budget b ON e.event_id = b.link_to_event WHERE      e.event_name = 'Yearly Kickoff';	student_club
SELECT      (SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) * 1.0) /      SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) FROM      major;	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Community Theater'  AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(a.link_to_event) AS events_attended, m.major_name FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi' JOIN major ma ON m.link_to_major = ma.major_id GROUP BY m.major_name;	student_club
SELECT AVG(spent) AS average_spent_on_food FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Food' AND event.event_status = 'Closed' GROUP BY event.event_id;	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Advertisement' ORDER BY budget.spent DESC LIMIT 1;	student_club
SELECT EXISTS (     SELECT 1     FROM event e     JOIN attendance a ON e.event_id = a.link_to_event     JOIN member m ON a.link_to_member = m.member_id     WHERE e.event_name = 'Women''s Soccer'       AND m.first_name = 'Maya'       AND m.last_name = 'Mclean' ) AS attended;	student_club
SELECT      (SUM(CASE WHEN event.type = 'Community Service' THEN 1 ELSE 0 END) / COUNT(event.event_id)) * 100 AS community_service_percentage FROM      event WHERE      event.event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT SUM(e.cost) AS total_poster_cost FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE e.event_name = 'September Speaker' AND ex.expense_description = 'Posters';	student_club
SELECT t_shirt_size, COUNT(*) AS size_count FROM member GROUP BY t_shirt_size ORDER BY size_count DESC LIMIT 1;	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' AND budget.remaining < 0 ORDER BY budget.remaining LIMIT 1;	student_club
SELECT expense.expense_description, SUM(expense.cost) AS total_value FROM expense JOIN event ON expense.link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'October Meeting')) GROUP BY expense.expense_description;	student_club
SELECT category, SUM(amount) AS total_budgeted FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event_name = 'April Speaker' GROUP BY category ORDER BY total_budgeted ASC;	student_club
SELECT budget_id, amount FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1;	student_club
SELECT budget_id, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) AS total_parking_cost FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT      m.first_name || ' ' || m.last_name AS full_name,      SUM(e.cost) AS total_cost FROM      member m JOIN      expense e ON m.member_id = e.link_to_member WHERE      m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY      m.first_name, m.last_name;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50 JOIN zip_code zc ON m.zip = zc.zip_code;	student_club
SELECT major_name FROM major JOIN member ON major.major_id = member.link_to_major WHERE first_name = 'Phillip' AND last_name = 'Cullen';	student_club
SELECT position FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Business') AND t_shirt_size = 'Medium';	student_club
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;	student_club
SELECT type FROM event WHERE location = 'MU 215';	student_club
SELECT type FROM event WHERE event_date = '2020-03-24T12:00:00';	student_club
SELECT major.major_name FROM major JOIN member ON major.major_id = member.link_to_major WHERE member.position = 'Vice President';	student_club
SELECT     ROUND((SUM(CASE WHEN m.position = 'Member' AND ma.major_name = 'Business' THEN 1 ELSE 0 END) * 100.0) / COUNT(m.member_id), 2) AS percentage_business_members FROM     member m JOIN     major ma ON m.link_to_major = ma.major_id	student_club
SELECT type FROM event WHERE location = 'MU 215';	student_club
SELECT COUNT(*)  FROM income  WHERE amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*) FROM major WHERE department = 'School of Applied Sciences, Technology and Education' AND college = 'College of Agriculture and Applied Sciences';	student_club
SELECT m.last_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0;	student_club
SELECT m.zip, z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Electrical and Computer Engineering' AND m.position = 'Member';	student_club
SELECT event.event_name FROM event JOIN member ON event.event_id IN (SELECT link_to_event FROM attendance) JOIN member AS m ON member.member_id = attendance.link_to_member AND m.position = 'Vice President' JOIN major ON major.major_id = member.link_to_major JOIN zip_code ON zip_code.zip_code = member.zip WHERE major.college = 'College of Agriculture and Applied Sciences' AND zip_code.city = 'Holtsville' AND zip_code.state = 'New York' AND zip_code.short_state = 'NY' AND event.type = 'Social';	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member';	student_club
SELECT      ROUND((COUNT(CASE WHEN i.amount = 50 THEN 1 END) * 100.0) / COUNT(DISTINCT m.member_id), 2) AS percentage_50_amount_received FROM      income i JOIN      member m ON i.link_to_member = m.member_id WHERE      m.t_shirt_size = 'Medium'     AND m.position = 'Member'	student_club
SELECT DISTINCT zc.state FROM zip_code zc WHERE zc.type = 'PO Box';	student_club
SELECT DISTINCT zip_code.zip_code FROM zip_code JOIN member ON zip_code.zip_code = member.zip JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Postal Service Department' AND major.college = 'College of Arts and Sciences' AND zip_code.type = 'PO Box' AND zip_code.state = 'Puerto Rico';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT e.event_id FROM event e JOIN expense ex ON e.event_id = ex.link_to_event JOIN income i ON ex.link_to_member = i.link_to_member WHERE i.amount > 50;	student_club
SELECT      m.member_id,      m.first_name,      m.last_name,      e.event_name,      e.event_id FROM      expense AS ex JOIN      member AS m ON ex.link_to_member = m.member_id JOIN      event AS e ON ex.link_to_event = e.event_id WHERE      ex.approved = 'true'      AND ex.expense_date BETWEEN '2019-01-10' AND '2019-11-19' JOIN      attendance AS att ON e.event_id = att.link_to_event	student_club
SELECT college FROM major JOIN member ON major.major_id = member.link_to_major WHERE first_name = 'Katy' AND major.major_id = 'rec1N0upiVLy5esTO';	student_club
SELECT phone  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.college = 'College of Agriculture and Applied Sciences' AND major.major_name = 'Business';	student_club
SELECT DISTINCT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND e.cost > 20;	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major_name = 'Education' AND position = 'Member';	student_club
SELECT     (SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) * 100.0) / COUNT(event_id) AS percentage_over_budget FROM     event	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_id, expense_description, expense_date, cost FROM expense WHERE cost > 50 GROUP BY expense_id, expense_description, expense_date, cost HAVING SUM(cost) / COUNT(expense_id) > 50;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT      ROUND((SUM(CASE WHEN `type` = 'PO Box' THEN 1 ELSE 0 END) / COUNT(`zip_code`)) * 100, 2) AS percentage_po_box_zip_codes FROM      zip_code;	student_club
SELECT event_name, location FROM event WHERE event_id IN (     SELECT link_to_event     FROM budget     WHERE remaining > 0 )	student_club
SELECT e.event_name, e.event_date FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, ma.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN major ma ON m.link_to_major = ma.major_id WHERE e.cost > 100;	student_club
SELECT z.city, z.county FROM event e JOIN income i ON e.event_id = i.link_to_member JOIN member m ON i.link_to_member = m.member_id JOIN zip_code z ON m.zip = z.zip_code GROUP BY e.event_id HAVING COUNT(i.income_id) > 40;	student_club
SELECT link_to_member, SUM(cost) AS total_spent FROM expense WHERE link_to_member IN (     SELECT link_to_member     FROM attendance     GROUP BY link_to_member     HAVING COUNT(DISTINCT link_to_event) > 1 ) GROUP BY link_to_member ORDER BY total_spent DESC LIMIT 1;	student_club
SELECT AVG(cost)  FROM expense  JOIN member ON expense.link_to_member = member.member_id  WHERE position != 'Member';	student_club
SELECT event_name FROM event WHERE type = 'Meeting' AND EXISTS (     SELECT 1     FROM expense     JOIN budget ON expense.link_to_budget = budget.budget_id     WHERE budget.category = 'Parking'     GROUP BY expense.event_id     HAVING SUM(expense.cost) < (         SELECT AVG(parking_expenses.total_cost)         FROM (             SELECT SUM(e.cost) AS total_cost             FROM expense e             JOIN budget b ON e.link_to_budget = b.budget_id             WHERE b.category = 'Parking'             GROUP BY e.event_id         ) parking_expenses     ) );	student_club
SELECT      (SUM(e.cost) / COUNT(e.event_id)) * 100 AS meeting_cost_percentage FROM      event e WHERE      e.type = 'Meeting';	student_club
SELECT link_to_budget FROM expense WHERE expense_description = 'Water, chips, cookies' GROUP BY link_to_budget ORDER BY SUM(cost) DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id, m.first_name, m.last_name ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT      (SUM(CASE WHEN z.state = 'New Jersey' THEN 1 ELSE 0 END) * 100.0 / COUNT(m.member_id)) -     (SUM(CASE WHEN z.state = 'Vermont' THEN 1 ELSE 0 END) * 100.0 / COUNT(m.member_id)) AS percentage_difference FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'Member';	student_club
SELECT major.major_name, major.department  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT      m.first_name || ' ' || m.last_name AS full_name,      SUM(e.cost) AS total_spent FROM      expense e JOIN      member m ON e.link_to_member = m.member_id WHERE      e.expense_description = 'Water, Veggie tray, supplies' GROUP BY      m.member_id	student_club
SELECT last_name, phone FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Elementary Education';	student_club
SELECT category, amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker';	student_club
SELECT DISTINCT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT category FROM expense WHERE expense_description = 'Posters';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, m.college FROM member m WHERE m.position = 'Secretary' AND m.link_to_major IS NOT NULL;	student_club
SELECT e.event_name, SUM(e.spent) AS total_spent FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT z.city FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code zc ON m.zip = zc.zip_code WHERE zc.city = 'Lincolnton' AND zc.state = 'North Carolina' AND zc.zip_code = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT      (COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 END)) AS EUR_to_CZK_Ratio FROM      customers;	debit_card_specializing
SELECT c.CustomerID, ymc.ConsumerID, MIN(ym.Consumption) AS MinConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' AND ym.Date BETWEEN '201201' AND '201212' GROUP BY ym.ConsumerID ORDER BY MinConsumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS AverageMonthlyConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount * t.Price) AS TotalConsumption FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE c.Currency = 'CZK' AND t.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM' AND ym.Date BETWEEN '201201' AND '201212' AND ym.Consumption < 30000;	debit_card_specializing
SELECT      (SELECT SUM(Consumption)       FROM yearmonth       WHERE CustomerID IN         (SELECT CustomerID FROM customers WHERE Currency = 'CZK')         AND Date BETWEEN '201201' AND '201212') -      (SELECT SUM(Consumption)       FROM yearmonth       WHERE CustomerID IN         (SELECT CustomerID FROM customers WHERE Currency = 'EUR')         AND Date BETWEEN '201201' AND '201212') AS DifferenceInConsumption	debit_card_specializing
SELECT Date AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Segment, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT LEFT(Date, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Date AS PeakMonth FROM yearmonth WHERE CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Segment = 'SME' ) AND Date BETWEEN '201301' AND '201312' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
WITH segment_consumption AS (     SELECT          c.Segment,         ym.CustomerID,         SUM(ym.Consumption) AS TotalConsumption,         COUNT(*) AS CustomerCount,         AVG(ym.Consumption) AS AvgConsumption     FROM          yearmonth ym     JOIN          customers c ON ym.CustomerID = c.CustomerID     WHERE          ym.Date BETWEEN '201301' AND '201312'     GROUP BY          c.Segment, ym.CustomerID ), min_consumption AS (     SELECT          Segment,         MIN(AvgConsumption) AS MinAvgConsumption     FROM          segment_consumption     GROUP BY          Segment ), sme_avg AS (     SELECT          (SELECT MinAvgConsumption FROM min_consumption WHERE Segment = 'SME') AS MinAvgSME ), lam_avg AS (     SELECT          (SELECT MinAvgConsumption FROM min_consumption WHERE Segment = 'LAM') AS MinAvgLAM ), kam_avg AS (     SELECT          (SELECT MinAvgConsumption FROM min_consumption WHERE Segment = 'KAM') AS MinAvgKAM ), consumption_difference AS (     SELECT          (SELECT MinAvgSME FROM sme_avg) - (SELECT MinAvgLAM FROM lam_avg) AS DifferenceSMEtoLAM,         (SELECT MinAvgLAM FROM lam_avg) - (SELECT MinAvgKAM FROM kam_avg) AS DifferenceLAMtoKAM,         (SELECT MinAvgKAM FROM kam_avg) - (SELECT MinAvgSME FROM sme_avg) AS DifferenceKAMtoSME ) SELECT      DifferenceSMEtoLAM,     DifferenceLAMtoKAM,     DifferenceKAMtoSME FROM      consumption_difference;	debit_card_specializing
WITH Consumption2012 AS (     SELECT CustomerID, SUM(Consumption) AS TotalConsumption2012     FROM yearmonth     WHERE Date LIKE '2012%'     GROUP BY CustomerID ), Consumption2013 AS (     SELECT CustomerID, SUM(Consumption) AS TotalConsumption2013     FROM yearmonth     WHERE Date LIKE '2013%'     GROUP BY CustomerID ), SegmentConsumption AS (     SELECT c.CustomerID, c.Segment, (c.TotalConsumption2013 - c.TotalConsumption2012) AS Increase, c.TotalConsumption2013 AS Consumption2013     FROM Consumption2012 c     JOIN customers c ON c.CustomerID = Consumption2012.CustomerID     JOIN Consumption2013 c2 ON c.CustomerID = c2.CustomerID     WHERE c.Segment IN ('SME', 'LAM') -- Assuming KAM is not a segment in the provided data ), SegmentIncrease AS (     SELECT Segment, (Increase / Consumption2013) * 100 AS PercentageIncrease     FROM SegmentConsumption ), MaxMinIncrease AS (     SELECT MAX(PercentageIncrease) AS MaxIncrease, MIN(PercentageIncrease) AS MinIncrease     FROM SegmentIncrease ) SELECT si.Segment, si.PercentageIncrease FROM SegmentIncrease si JOIN MaxMinIncrease mmi ON si.PercentageIncrease = mmi.MaxIncrease OR si.PercentageIncrease = mmi.MinIncrease;	debit_card_specializing
SELECT SUM(Consumption) as TotalConsumption FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*)       FROM gasstations       WHERE Country = 'CZE' AND Segment = 'Discount') -      (SELECT COUNT(*)       FROM gasstations       WHERE Country = 'SVK' AND Segment = 'Discount') AS Difference;	debit_card_specializing
SELECT (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') -        (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS Difference	debit_card_specializing
SELECT      (SELECT SUM(CASE WHEN c.Currency = 'CZK' THEN t.Amount ELSE 0 END)       FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID      WHERE c.Segment = 'SME') -     (SELECT SUM(CASE WHEN c.Currency = 'EUR' THEN t.Amount ELSE 0 END)       FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID      WHERE c.Segment = 'SME') AS MoreCZKThanEUR	debit_card_specializing
SELECT ym.CustomerID FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310' ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, c.Segment, SUM(ym.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) as TotalConsumption FROM yearmonth WHERE CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Segment = 'KAM' ) AND Date = '201305';	debit_card_specializing
SELECT     (SUM(CASE WHEN Consumption > 46.73 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Percentage FROM     yearmonth WHERE     CustomerID IN (         SELECT CustomerID         FROM customers         WHERE Segment = 'LAM'     );	debit_card_specializing
SELECT Country, COUNT(*) AS ValueForMoneyStations FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY ValueForMoneyStations DESC LIMIT 1;	debit_card_specializing
SELECT     ROUND((COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE NULL END) * 100.0) / COUNT(c.CustomerID), 2) AS PercentageOfKAMCustomersPayInEuro FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM'	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM yearmonth WHERE Consumption > 528.3 AND LEFT(Date, 6) = '201202') /      (SELECT COUNT(*) FROM yearmonth WHERE LEFT(Date, 6) = '201202') * 100 AS Percentage	debit_card_specializing
SELECT     (COUNT(CASE WHEN g.Country = 'CZE' AND g.Segment = 'Premium' THEN 1 END) * 100.0) /      COUNT(CASE WHEN g.Country = 'CZE' THEN 1 END) AS PercentagePremiumGasStations FROM     gasstations g;	debit_card_specializing
SELECT CustomerID, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) as TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, y.Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) as HighestMonthlyConsumption FROM `yearmonth` WHERE SUBSTR(Date, 1, 6) = '201201';	debit_card_specializing
SELECT CustomerID,         MAX(Consumption) AS MaxMonthlyConsumption FROM yearmonth AS ym JOIN customers AS c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY CustomerID ORDER BY MaxMonthlyConsumption DESC LIMIT 1;	debit_card_specializing
SELECT p.Description FROM products p JOIN yearmonth ym ON p.ProductID = ym.ProductID WHERE ym.Date LIKE '201309%'	debit_card_specializing
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN yearmonth ym ON t.CustomerID = ym.CustomerID WHERE ym.Date LIKE '201306'	debit_card_specializing
SELECT g.ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY g.ChainID;	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(T.Price * T.Amount) AS AverageTotalPrice FROM transactions_1k AS T WHERE T.Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(DISTINCT ym.CustomerID) FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.ChainID = 11;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(TotalPrice) as AverageTotalPrice FROM (     SELECT SUM(t.Amount * t.Price) as TotalPrice     FROM transactions_1k t     JOIN gasstations g ON t.GasStationID = g.GasStationID     WHERE g.Country = 'CZE' ) AS TotalPricePerTransaction;	debit_card_specializing
SELECT AVG(t.Price * t.Amount) AS AverageTotalPrice FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount * t.Price) AS TotalAmount FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-25' GROUP BY t.CustomerID ORDER BY TotalAmount DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '2012-08-25' AND EXISTS (     SELECT 1     FROM transactions_1k t2     WHERE t2.GasStationID = g.GasStationID     AND t2.Date < '2012-08-25' ) ORDER BY t.Date ASC LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Time = '16:25:00' AND t.Date = '2012-08-24';	debit_card_specializing
SELECT Segment  FROM customers  JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID  WHERE yearmonth.Date = '2012-08-23' AND customers.CustomerID = (     SELECT CustomerID      FROM transactions_1k      WHERE Date = '2012-08-23' AND Time = '21:20:00' );	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Price * Amount = 672.64;	debit_card_specializing
SELECT Segment  FROM customers  WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers);	debit_card_specializing
SELECT g.Country FROM transactions_1k AS t JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00';	debit_card_specializing
SELECT t.ProductID FROM transactions_1k t WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT      ym.Consumption AS TotalSpentInJanuary2012,      ym.Date AS DateOfSpending FROM      yearmonth ym WHERE      ym.CustomerID = (         SELECT              t1k.CustomerID         FROM              transactions_1k t1k         WHERE              t1k.Date = '2012-08-24' AND              t1k.Price = 124.05     ) AND      ym.Date = '201201';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.Time BETWEEN '08:00:00' AND '09:00:00' AND gasstations.Country = 'CZE' AND transactions_1k.Date = '2012-08-26';	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201306' AND ym.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CardID = 667467;	debit_card_specializing
SELECT c.Country FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-24' AND ym.Consumption = 548.4;	debit_card_specializing
SELECT      (COUNT(DISTINCT c.CustomerID) FILTER (WHERE c.Currency = 'EUR') * 100.0) /      COUNT(DISTINCT c.CustomerID) AS Percentage_EUR_Users FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      ym.Date = '2012-08-25' AND      c.Currency = 'EUR';	debit_card_specializing
SELECT      (consumption_2012 - consumption_2013) / consumption_2012 AS consumption_decrease_rate FROM (     SELECT          c.CustomerID,         y1.Consumption AS consumption_2012,         y2.Consumption AS consumption_2013     FROM          yearmonth y1     INNER JOIN          yearmonth y2 ON y1.CustomerID = y2.CustomerID     INNER JOIN          customers c ON y1.CustomerID = c.CustomerID     WHERE          y1.Date = '201208' AND          y2.Date = '201301' AND          c.CustomerID IN (             SELECT                  CustomerID              FROM                  transactions_1k              WHERE                  Date = '2012-08-25' AND                  Price * Amount = 634.8         ) ) AS rate_calculation;	debit_card_specializing
SELECT      gasstations.GasStationID,      SUM(transactions_1k.Amount * transactions_1k.Price) AS Revenue FROM      gasstations  JOIN      transactions_1k  ON      gasstations.GasStationID = transactions_1k.GasStationID GROUP BY      gasstations.GasStationID ORDER BY      Revenue DESC LIMIT 1;	debit_card_specializing
SELECT      (SUM(CASE WHEN g.Segment = 'Premium' THEN t.Amount ELSE 0 END) * 100.0 /       SUM(t.Amount)) AS PremiumPercentage FROM      transactions_1k t JOIN      gasstations g ON t.GasStationID = g.GasStationID JOIN      customers c ON t.CustomerID = c.CustomerID WHERE      g.Country = 'SVK' AND      c.Segment IS NOT NULL;	debit_card_specializing
SELECT SUM(t.Amount * t.Price) AS TotalSpent FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.CustomerID = 38508;  SELECT Consumption FROM yearmonth WHERE CustomerID = 38508 AND Date = '201201';	debit_card_specializing
SELECT p.Description, SUM(t.Amount * t.Price) as TotalSales FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY p.Description ORDER BY TotalSales DESC LIMIT 5;	debit_card_specializing
SELECT c.CustomerID, AVG(t.Price) AS AvgPricePerItem, c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID, c.Currency ORDER BY SUM(t.Price * t.Amount) DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE p.ProductID = 2 ORDER BY t.Price DESC LIMIT 1;	debit_card_specializing
SELECT      ym.CustomerID,      ym.Consumption AS ConsumptionStatus FROM      yearmonth ym JOIN      transactions_1k t1k ON ym.CustomerID = t1k.CustomerID WHERE      t1k.ProductID = 5      AND t1k.Price / t1k.Amount > 29.00      AND ym.Date = '201208';	debit_card_specializing
