SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda'	california_schools
SELECT `School Name`, `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Type` = 'Continuation Schools' ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND s.County = 'Fresno County Office of Education';	california_schools
SELECT s.Street, s.StreetAbr, s.City, s.Zip, s.State FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.FRPM Count (K-12) = (SELECT MAX(FRPM Count (K-12)) FROM frpm)	california_schools
SELECT Phone FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE `Charter School (Y/N)` = 1 AND FundingType = 'Directly funded' AND OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.AvgScrMath < 400 AND schools.Virtual = 'F';	california_schools
SELECT DISTINCT s.CDSCode, s.School FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumTstTakr > 500 AND (s.Magnet = 1 OR s.GSoffered LIKE '%Magnet%')	california_schools
SELECT s.Phone FROM satscores AS sc JOIN schools AS s ON sc.cds = s.CDSCode WHERE sc.NumGE1500 IS NOT NULL AND sc.NumGE1500 > 0 ORDER BY sc.NumGE1500 DESC LIMIT 1;	california_schools
SELECT satscores.NumTstTakr FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.`FRPM Count (K-12)` = (     SELECT MAX(`FRPM Count (K-12)`)     FROM frpm )	california_schools
SELECT COUNT(DISTINCT frpm.CDSCode) FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrMath > 560 AND frpm.CharterSchool (Y/N) = 1;	california_schools
SELECT frpm.FRPM_Count_Ages_5_17 FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrRead IS NOT NULL ORDER BY satscores.AvgScrRead DESC LIMIT 1;	california_schools
SELECT `School Code` FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;	california_schools
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`)  FROM frpm  WHERE `Percent (%) Eligible FRPM (Ages 5-17)` > 0.3;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.rtype = 'SAT' AND sat.AvgScrRead IS NOT NULL AND sat.AvgScrMath IS NOT NULL AND sat.AvgScrWrite IS NOT NULL ORDER BY (sat.NumGE1500 / sat.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, f.`Enrollment (Ages 5-17)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT      s.District,      AVG(satscores.AvgScrRead) AS AvgScore FROM      satscores JOIN      schools ON satscores.cds = schools.CDSCode WHERE      schools.StatusType = 'Active' GROUP BY      s.District ORDER BY      AvgScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Alameda' AND satscores.NumTstTakr < 100;	california_schools
SELECT `Charter School Number` FROM frpm WHERE `AvgScrWrite` = 499;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 0 AND f.`NSLP Provision Status` = 'Directly funded' AND s.County = 'Contra Costa' AND EXISTS (     SELECT 1     FROM satscores sc     WHERE sc.cds = s.CDSCode     AND sc.NumTstTakr <= 250 );	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.AvgScrMath IS NOT NULL ORDER BY sc.AvgScrMath DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm WHERE `Low Grade` = '09' AND `High Grade` = '12' AND `District Code` = (SELECT `District Code` FROM schools WHERE County = 'Amador');	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Percent (%) Eligible Free (K-12)` > 500 AND `Percent (%) Eligible Free (K-12)` < 700;	california_schools
SELECT s.School, SUM(satscores.NumTstTakr) AS TotalTestTakers FROM satscores JOIN schools s ON satscores.cds = s.CDSCode WHERE s.County = 'Contra Costa' GROUP BY s.School ORDER BY TotalTestTakers DESC LIMIT 1;	california_schools
SELECT s.School, s.Street, s.City, s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT frpm.SchoolName FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.`Percent (%) Eligible Free (K-12)` > 0.1 AND satscores.NumTstTakr > 0 AND satscores.AvgScrRead >= 1500 OR satscores.AvgScrMath >= 1500 OR satscores.AvgScrWrite >= 1500;	california_schools
SELECT s.School, s.FundingType FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Riverside' GROUP BY s.CDSCode HAVING AVG(ss.AvgScrMath) > 400;	california_schools
SELECT s.School, s.Street, s.City, s.State, s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Percent (%) Eligible Free (Ages 5-17)` > 0 AND f.`FRPM Count (Ages 5-17)` > 800 AND f.`High Grade` = '12' AND f.`District Code` = (SELECT District FROM schools WHERE County = 'Monterey') AND s.County = 'Monterey' AND s.School Type = 'High Schools (Public)';	california_schools
SELECT      s.School,      ss.AvgScrWrite,      s.Phone FROM      satscores ss JOIN      schools s ON ss.cds = s.CDSCode WHERE      (s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01')	california_schools
WITH K12_vs_15_17 AS (     SELECT          frpm.CDSCode,         frpm.SchoolName,         frpm.DOCType,         (frpm.`Enrollment (K-12)` - frpm.`Enrollment (Ages 5-17)`) AS K12_15_17_Diff     FROM          frpm     WHERE          frpm.CharterSchool (Y/N) = 0 ), AvgDiff AS (     SELECT          AVG(K12_15_17_Diff) AS AvgDifference     FROM          K12_vs_15_17 ), SchoolsAboveAvg AS (     SELECT          k12.CDSCode,         k12.SchoolName,         k12.DOCType     FROM          K12_vs_15_17 k12, AvgDiff a     WHERE          k12.K12_15_17_Diff > a.AvgDifference ) SELECT      s.SchoolName,     s.DOCType FROM      SchoolsAboveAvg sa, schools s WHERE      sa.CDSCode = s.CDSCode;	california_schools
SELECT OpenDate FROM schools WHERE School IS NOT NULL AND `Educational Option Type` = 'K-12 Schools (Public)' ORDER BY Enrollment (K-12) DESC LIMIT 1;	california_schools
SELECT City, SUM(Enrollment (K-12)) AS TotalEnrollment FROM frpm GROUP BY City ORDER BY TotalEnrollment ASC LIMIT 5;	california_schools
SELECT `Percent (%) Eligible Free (K-12)` FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 10 OFFSET 9;	california_schools
SELECT      `School Name`,      `Percent (%) Eligible FRPM (K-12)` FROM      frpm WHERE      `Academic Year` = '2014-2015'     AND `Ownership Code` = '66' ORDER BY      `FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT s.School, s.Website FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT      `Percent (%) Eligible Free (Ages 5-17)` AS Free_Rate FROM      frpm JOIN      schools  ON      frpm.CDSCode = schools.CDSCode WHERE      schools.AdmFName1 = 'Kacey Gibson';	california_schools
SELECT s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`Enrollment (K-12)` = (     SELECT MIN(`Enrollment (K-12)`)     FROM frpm     WHERE `Charter School (Y/N)` = 1 )	california_schools
SELECT s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3 FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE s.NumGE1500 IS NOT NULL AND s.NumGE1500 >= 1500 ORDER BY s.NumGE1500 DESC LIMIT 1;	california_schools
SELECT Street, City, Zip, State FROM schools JOIN (     SELECT cds, (NumGE1500::numeric / NumTstTakr::numeric) AS excellence_rate     FROM satscores ) AS satscores_on_schools ON schools.CDSCode = satscores_on_schools.cds ORDER BY excellence_rate ASC LIMIT 1;	california_schools
SELECT s.Website FROM schools s JOIN satscores sats ON s.CDSCode = sats.cds WHERE s.County = 'Los Angeles' AND sats.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(NumTstTakr) AS AverageTestTakers FROM satscores WHERE YEAR(dname) = 1980 AND CDSCode IN (     SELECT CDSCode     FROM schools     WHERE StatusType = 'Open' AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31' );	california_schools
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.District = 'Fresno Unified' ORDER BY f.AvgScrRead ASC LIMIT 1;	california_schools
SELECT s.CDSCode, s.School, AVG(satscores.AvgScrRead) AS AvgReadScore FROM schools AS s JOIN satscores AS sc ON s.CDSCode = sc.cds WHERE s.Virtual = 'F' AND s.Magnet = 0 GROUP BY s.CDSCode, s.School ORDER BY AvgReadScore DESC LIMIT 5;	california_schools
SELECT      s.EdOpsCode,      s.EdOpsName  FROM      satscores AS s  JOIN      schools AS sch  ON      s.cds = sch.CDSCode  WHERE      s.AvgScrMath IS NOT NULL  ORDER BY      s.AvgScrMath DESC  LIMIT 1;	california_schools
SELECT s.County, AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) AS AvgTotalScore FROM (     SELECT CDSCode, (AvgScrMath + AvgScrRead + AvgScrWrite) AS AvgTotalScore     FROM frpm     WHERE AvgScrRead IS NOT NULL AND AvgScrMath IS NOT NULL AND AvgScrWrite IS NOT NULL ) AS subquery JOIN schools s ON subquery.CDSCode = s.CDSCode GROUP BY s.County, subquery.AvgTotalScore ORDER BY subquery.AvgTotalScore ASC LIMIT 1;	california_schools
SELECT s.City, AVG(satscores.AvgScrWrite) AS AvgWritingScore FROM satscores JOIN schools s ON satscores.cds = s.CDSCode WHERE satscores.NumTstTakr IN (     SELECT MAX(NumTstTakr)     FROM satscores     WHERE satscores.NumGE1500 IS NOT NULL AND satscores.NumGE1500 > 0 ) GROUP BY s.City;	california_schools
SELECT      s.School,      AVG(satscores.AvgScrWrite) AS AvgWritingScore FROM      schools AS s JOIN      satscores ON s.CDSCode = satscores.cds JOIN      (SELECT           AdmLName1       FROM           schools       WHERE           AdmLName1 = 'Ricci Ulrich') AS managers ON      s.AdmLName1 = managers.AdmLName1 GROUP BY      s.School;	california_schools
SELECT      s.CDSCode,     s.School,     frpm.`Enrollment (K-12)` AS TotalEnrollment FROM      schools s JOIN      frpm ON s.CDSCode = frpm.CDSCode WHERE      s.DOC = '31' ORDER BY      frpm.`Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT     COUNT(*) / 12 AS MonthlyAverageSchoolsOpened FROM     schools WHERE     County = 'Alameda'     AND District = 'Elementary School District'     AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31'	california_schools
SELECT      (SELECT COUNT(*)       FROM frpm       WHERE `District Code` = 10017         AND `School Type` = 'Elementary Schools (Public)'         AND `DOC` = '52') AS MergedElemSchoolsCount,     (SELECT COUNT(*)       FROM frpm       WHERE `District Code` = 10017         AND `School Type` = 'Unified School District (USD)'         AND `DOC` = '54') AS MergedUSDschoolsCount,     (SELECT COUNT(*)       FROM frpm       WHERE `District Code` = 10017         AND `School Type` = 'Elementary Schools (Public)'         AND `DOC` = '52') /       (SELECT COUNT(*)        FROM frpm        WHERE `District Code` = 10017          AND `School Type` = 'Unified School District (USD)'          AND `DOC` = '54') AS Ratio FROM frpm WHERE `District Code` = 10017;	california_schools
SELECT      County,      COUNT(*) AS ClosedSchoolsCount,      GROUP_CONCAT(School ORDER BY School) AS SchoolsList,      GROUP_CONCAT(ClosedDate ORDER BY School) AS ClosureDates FROM      schools WHERE      StatusType = 'Closed' GROUP BY      County ORDER BY      ClosedSchoolsCount DESC LIMIT 1;	california_schools
SELECT s.Street AS PostalStreet, s.School AS SchoolName FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath IS NOT NULL ORDER BY ss.AvgScrMath DESC LIMIT 1 OFFSET 5;	california_schools
SELECT s.Street, s.City, s.Zip, s.State, s MailStreet, s.MailCity, s.MailZip, s.MailState, frpm.SchoolName FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode WHERE frpm.AvgScrRead = (SELECT MIN(AvgScrRead) FROM frpm);	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Lakeport'  AND (satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite) >= 1500;	california_schools
SELECT s.CDSCode, s.MailCity, SUM(satscores.NumTstTakr) as TotalTestTakers FROM schools s JOIN satscores ON s.CDSCode = satscores.cds WHERE s.MailCity = 'Fresno' GROUP BY s.CDSCode, s.MailCity;	california_schools
SELECT s.School, s.MailZip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.AdmLName1 = 'Atoian' OR s.AdmLName2 = 'Atoian' OR s.AdmLName3 = 'Atoian';	california_schools
SELECT      (SELECT COUNT(*) FROM schools WHERE County = 'Colusa' AND MailState = 'California') /      (SELECT COUNT(*) FROM schools WHERE County = 'Humboldt' AND MailState = 'California') AS Ratio;	california_schools
SELECT COUNT(*) FROM schools WHERE State = 'CA' AND County = 'San Joaquin' AND StatusType = 'Active';	california_schools
SELECT s.Phone, s.Ext FROM schools s JOIN (     SELECT s.CDSCode, s.Phone, s.Ext, AVG(satscores.AvgScrWrite) AS AvgWriteScore     FROM schools s     JOIN satscores ON s.CDSCode = satscores.cds     GROUP BY s.CDSCode, s.Phone, s.Ext     ORDER BY AvgWriteScore DESC ) AS subquery WHERE subquery.AvgWriteScore = (     SELECT AVG(satscores.AvgScrWrite)     FROM schools s     JOIN satscores ON s.CDSCode = satscores.cds     GROUP BY s.CDSCode     ORDER BY AVG(satscores.AvgScrWrite) DESC     LIMIT 333, 1 );	california_schools
SELECT School, Phone, Ext FROM schools WHERE Zip = '95203-3704';	california_schools
SELECT Website FROM schools WHERE AdmFName1 = 'Mike Larson' OR AdmLName1 = 'Mike Larson' OR       AdmFName2 = 'Mike Larson' OR AdmLName2 = 'Mike Larson' OR       AdmFName3 = 'Mike Larson' OR AdmLName3 = 'Mike Larson' OR       AdmFName1 = 'Dante Alvarez' OR AdmLName1 = 'Dante Alvarez' OR       AdmFName2 = 'Dante Alvarez' OR AdmLName2 = 'Dante Alvarez' OR       AdmFName3 = 'Dante Alvarez' OR AdmLName3 = 'Dante Alvarez';	california_schools
SELECT Website FROM schools WHERE Charter = 1   AND Virtual = 'P'   AND County = 'San Joaquin';	california_schools
SELECT COUNT(*) FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.City = 'Hickman' AND s.DOC = '52' AND s.Charter = 1;	california_schools
SELECT COUNT(*) FROM frpm WHERE `County` = 'Los Angeles'   AND `Charter School (Y/N)` = 0   AND `Percent (%) Eligible Free (K-12)` < 0.18;	california_schools
SELECT s.School, s.City, sa.AdmFName1, sa.AdmLName1, sa.AdmFName2, sa.AdmLName2, sa.AdmFName3, sa.AdmLName3 FROM schools s JOIN schools sa ON s.CDSCode = sa.CDSCode WHERE s.Charter = 1 AND sa.CharterNum = '00D2';	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT     (COUNT(CASE WHEN frpm.CharterFundingType = 'Locally Funded' THEN 1 END) * 100.0) /     COUNT(*) * 100 AS PercentageLocallyFunded FROM     frpm WHERE     frpm.CountyName = 'Santa Clara'	california_schools
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly Funded'   AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'   AND County = 'Stanislaus';	california_schools
SELECT SUM(`ClosedDate` = '1989-01-01' AND `City` = 'San Francisco' AND `District` LIKE 'Community College%') AS TotalClosedCommunityColleges FROM schools WHERE `ClosedDate` BETWEEN '1989-01-01' AND '1989-12-31';	california_schools
SELECT County, COUNT(*) AS ClosureCount FROM schools WHERE SOC = '11' AND StatusType = 'Closed' AND (OpenDate BETWEEN '1980-01-01' AND '1989-12-31') GROUP BY County ORDER BY ClosureCount DESC LIMIT 1;	california_schools
SELECT NCESSchool FROM schools WHERE SOC = '31';	california_schools
SELECT      COUNT(*) AS TotalDistrictCommunityDaySchools FROM      frpm WHERE      `School Type` = 'District Community Day Schools'     AND County = 'Alpine'     AND (StatusType = 'Active' OR StatusType = 'Closed');	california_schools
SELECT District FROM schools WHERE City = 'Fresno' AND Magnet = 0;	california_schools
SELECT      SUM(`Enrollment (Ages 5-17)`) AS TotalEnrollment FROM      frpm WHERE      `Academic Year` = '2014-2015'      AND `Educational Option Type` = 'State Special School'      AND `District Name` = 'Fremont';	california_schools
SELECT Free_Meal_Count_Ages_5_17 FROM frpm WHERE `School Name` = 'Youth Authority School' AND MailStreet = 'PO Box 1040';	california_schools
SELECT `Low Grade` FROM frpm WHERE `EdOpsCode` = 'SPECON' AND `NCESSchool` = '613360' ORDER BY `Low Grade` ASC LIMIT 1;	california_schools
SELECT `School Name`, `Educational Option Type` FROM frpm WHERE `Educational Option Type` = 'Breakfast Provision 2'   AND `County Code` = '37';	california_schools
SELECT City FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.`Low Grade` = '09' AND frpm.`High Grade` = '12' AND frpm.`Educational Option Type` = 'Lunch Provision 2' AND schools.County = 'Merced' AND schools.EILCode = 'HS';	california_schools
SELECT      frpm.CDSCode,      frpm.SchoolName,      frpm.`Percent (%) Eligible FRPM (Ages 5-17)` FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.County = 'Los Angeles'      AND frpm.`Low Grade` = 'K'      AND frpm.`High Grade` = '9'	california_schools
SELECT `Grade Span` AS `Most Common Grade Span`, COUNT(*) AS `Count` FROM frpm WHERE `City` = 'Adelanto' GROUP BY `Grade Span` ORDER BY `Count` DESC LIMIT 1;	california_schools
SELECT      County,      COUNT(*) AS SchoolCount FROM      schools WHERE      (County = 'San Diego' OR County = 'Santa Barbara')      AND Virtual = 'F' GROUP BY      County ORDER BY      SchoolCount DESC LIMIT 1;	california_schools
SELECT s.School, s.Latitude, s.`School Type` FROM schools s WHERE s.Latitude = (     SELECT MAX(Latitude) FROM schools );	california_schools
SELECT      s.City,      s.School,      frpm.`Low Grade` FROM      frpm  JOIN      schools s ON frpm.CDSCode = s.CDSCode WHERE      s.State = 'CA' ORDER BY      s.Latitude ASC LIMIT 1;	california_schools
SELECT MAX(Longitude), `High Grade`, `Low Grade` FROM frpm GROUP BY `High Grade`, `Low Grade` ORDER BY Longitude DESC LIMIT 1;	california_schools
SELECT      COUNT(DISTINCT s.City) AS NumberOfCities,     s.City,     COUNT(DISTINCT frpm.CDSCode) AS NumberOfSchools FROM      schools s JOIN      frpm ON s.CDSCode = frpm.CDSCode WHERE      s.Magnet = 1 AND frpm.Low_Grade = 'K' AND frpm.High_Grade = '8' GROUP BY      s.City;	california_schools
SELECT      AdmFName1,      District,      COUNT(AdmFName1) AS NameCount FROM      schools GROUP BY      AdmFName1, District ORDER BY      NameCount DESC LIMIT 2;	california_schools
SELECT      frpm.`Percent (%) Eligible Free (K-12)`,      frpm.`District Code` FROM      frpm JOIN      schools  ON      frpm.CDSCode = schools.CDSCode JOIN      (SELECT          AdmFName1       FROM          schools       WHERE          AdmFName1 = 'Alusine') AS admin_names ON      schools.AdmFName1 = admin_names.AdmFName1;	california_schools
SELECT      s.District,      s.County,      s.School,      adm.AdmLName1 AS AdminLastName FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode JOIN      schools adm ON f.CDSCode = adm.CDSCode WHERE      f.CharterSchoolNumber = '40';	california_schools
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND       District = 'San Bernardino City Unified' AND       (OpenDate BETWEEN '2009-01-01' AND '2010-12-31') AND       (DOC = '54' OR SOC = '62') AND       (SchoolType = 'Intermediate/Middle Schools' OR SchoolType = 'Unified Schools');	california_schools
SELECT s.AdmEmail1, s.AdmEmail2, s.AdmEmail3, sname FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumGE1500 = (     SELECT MAX(sc2.NumGE1500)     FROM satscores sc2     JOIN schools s2 ON sc2.cds = s2.CDSCode     WHERE sc2.NumGE1500 IS NOT NULL )	california_schools
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'East Bohemia' AND t.type = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Praha' AND a.account_id IN (     SELECT DISTINCT l.account_id     FROM loan l     WHERE l.status = 'ELIGIBLE' );	financial
SELECT      CASE          WHEN AVG(A12) > AVG(A13) THEN '1995'         ELSE '1996'     END AS year_with_higher_unemployment_ratio FROM      district WHERE      A12 IS NOT NULL AND A13 IS NOT NULL;	financial
SELECT COUNT(DISTINCT d.district_id)  FROM district d JOIN client c ON d.district_id = c.district_id WHERE c.gender = 'F' AND d.A11 BETWEEN 6000 AND 10000;	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE client.gender = 'M' AND district.A3 = 'North Bohemia' AND district.A11 > 8000;	financial
SELECT      a.account_id FROM      client c JOIN      account ac ON c.district_id = ac.district_id JOIN      district d ON c.district_id = d.district_id WHERE      c.gender = 'F' ORDER BY      c.birth_date,      d.A11 ASC LIMIT 1; SELECT      a.account_id FROM      client c JOIN      account ac ON c.district_id = ac.district_id JOIN      district d ON c.district_id = d.district_id WHERE      c.gender = 'F' ORDER BY      d.A11 DESC LIMIT 1; SELECT      (SELECT d.A11 FROM district d JOIN client c ON d.district_id = c.district_id WHERE c.gender = 'F' ORDER BY d.A11 DESC LIMIT 1) -      (SELECT d.A11 FROM district d JOIN client c ON d.district_id = c.district_id WHERE c.gender = 'F' ORDER BY d.A11 ASC LIMIT 1);	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.birth_date = (SELECT MIN(birth_date) FROM client) AND d.A11 = (SELECT MAX(A11) FROM district) GROUP BY a.account_id;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.operation = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, MIN(l.amount) AS min_loan_amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE YEAR(l.date) = 1997 AND l.status = 'APPROVED' AND a.frequency = 'POPLATEK TYDNE' GROUP BY a.account_id ORDER BY min_loan_amount ASC LIMIT 1;	financial
SELECT account_id FROM account WHERE date LIKE '1993%' AND account_id IN (     SELECT account_id     FROM loan     WHERE duration > 12 ) ORDER BY amount DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'F'  AND c.birth_date < '1950-01-01'  AND d.A2 = 'Slokolov';	financial
SELECT a.account_id FROM account a WHERE a.date BETWEEN '1995-01-01' AND '1995-12-31' ORDER BY a.date ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' GROUP BY a.account_id HAVING SUM(CASE WHEN t.operation = 'DEPOSIT' THEN t.amount ELSE 0 END) -        SUM(CASE WHEN t.operation = 'WITHDRAWAL' THEN t.amount ELSE 0 END) > 3000;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card crd ON d.client_id = crd.disp_id WHERE crd.issued = '1994-03-03';	financial
SELECT a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14'	financial
SELECT a.district_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date = '1994-08-25';	financial
SELECT MAX(t.amount) AS max_amount FROM trans t JOIN card c ON t.account_id = c.card_id JOIN disp d ON c.disp_id = d.account_id JOIN client cl ON d.client_id = cl.client_id WHERE cl.birth_date BETWEEN '1966-10-21' AND '1970-10-21' AND t.type = 'TRANSFER';	financial
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A11 = (SELECT A11 FROM district ORDER BY A11 DESC LIMIT 1) AND c.birth_date = (SELECT MIN(birth_date) FROM client) ORDER BY d.A11 DESC LIMIT 1;	financial
SELECT t.amount AS first_transaction_amount FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id JOIN (     SELECT account_id     FROM loan     ORDER BY amount DESC     LIMIT 1 ) AS largest_loan ON a.account_id = largest_loan.account_id WHERE t.date = (SELECT MIN(date) FROM trans WHERE account_id = a.account_id)	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN account a ON c.district_id = a.district_id  JOIN district d ON a.district_id = d.district_id  WHERE d.A2 = 'Jesenik' AND c.gender = 'F';	financial
SELECT d.disp_id FROM disp d JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.date = '1998-09-02' AND t.amount = 5100 AND t.type = 'DEPOSIT' AND d.client_id = (SELECT client_id FROM client WHERE birth_date BETWEEN '1973-01-01' AND '1978-12-31');	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Litomerice' AND YEAR(account.date) = 1996;	financial
SELECT d.A2 FROM client c JOIN account a ON c.account_id = a.account_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM client c JOIN loan l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'Prague' ORDER BY a.date ASC LIMIT 1;	financial
SELECT      (SELECT COUNT(CASE WHEN c.gender = 'M' THEN 1 END)       FROM client c       JOIN district d ON c.district_id = d.district_id       WHERE d.A3 = 'South Bohemia') * 100.0 /      (SELECT COUNT(*)       FROM client c       JOIN district d ON c.district_id = d.district_id       WHERE d.A3 = 'South Bohemia') AS male_client_percentage FROM      (SELECT d.A3, d.A4       FROM district d       WHERE d.A3 = 'South Bohemia'       ORDER BY d.A4 DESC       LIMIT 1) AS max_inhabitant_branch;	financial
SELECT      ((         (SELECT balance           FROM trans           WHERE account_id = a.account_id             AND date = '1998-12-27'             ORDER BY date DESC             LIMIT 1) - (         SELECT balance           FROM trans           WHERE account_id = a.account_id             AND date = '1993-03-22'             ORDER BY date ASC             LIMIT 1     )) / (         SELECT balance           FROM trans           WHERE account_id = a.account_id             AND date = '1993-03-22'             ORDER BY date ASC             LIMIT 1     )) * 100 AS increase_rate FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN loan l ON a.account_id = l.account_id WHERE c.birth_date = '1993-07-05' AND l.date = (     SELECT MIN(date)       FROM loan       WHERE client_id = c.client_id );	financial
SELECT     (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) / SUM(l.amount)) * 100 AS paid_percentage FROM     loan l	financial
SELECT      (COUNT(CASE WHEN l.amount < 100000 AND l.status = 'C' THEN 1 END) * 100.0) / COUNT(*) AS running_no_issue_percentage FROM      loan l	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date LIKE '1993%' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, COUNT(*) AS frequency FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'East Bohemia' AND a.date BETWEEN '1995-01-01' AND '2000-12-31' JOIN disp d2 ON a.account_id = d2.account_id JOIN client c ON d2.client_id = c.client_id GROUP BY a.account_id;	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice';	financial
SELECT d.A2, d.A3 FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3, d.A11 FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60;	financial
SELECT      d.A2 AS district,     ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment_percentage FROM      loan l JOIN      district d ON d.district_id = l.client_id WHERE      l.status = 'D'     AND d.A12 IS NOT NULL     AND d.A13 IS NOT NULL     AND d.A13 > d.A12     AND YEAR(l.date) BETWEEN 1995 AND 1996;	financial
SELECT     (COUNT(*) FILTER (WHERE d.A2 = 'Decin' AND a.date LIKE '1993%'))::FLOAT / COUNT(*) * 100 AS percentage FROM     account a JOIN     district d ON a.district_id = d.district_id;	financial
SELECT DISTINCT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT district.A2, COUNT(client.client_id) AS female_account_holders FROM district JOIN client ON district.district_id = client.district_id JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id WHERE client.gender = 'F' GROUP BY district.A2 ORDER BY female_account_holders DESC LIMIT 10;	financial
SELECT d.A2 AS district_name, SUM(t.amount) AS total_withdrawals FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' AND a.frequency = 'POPLATEK MESICNE' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10;	financial
SELECT      COUNT(DISTINCT c.client_id)  FROM      client c  JOIN      district d ON c.district_id = d.district_id  WHERE      d.A3 = 'South Bohemia'      AND c.client_id NOT IN (         SELECT              d.client_id          FROM              disp d          JOIN              account a ON d.account_id = a.account_id      );	financial
SELECT d.A3 AS district_name, COUNT(l.loan_id) AS active_loans FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.A3 ORDER BY active_loans DESC LIMIT 1;	financial
SELECT AVG(amount) AS average_loan_amount FROM loan JOIN client ON loan.account_id IN (     SELECT account_id     FROM disp     JOIN client ON disp.client_id = client.client_id     WHERE client.gender = 'M' );	financial
SELECT d.A2 AS branch_location, d.A3 AS district_name, d.A13 AS unemployment_rate FROM district d WHERE d.A2 IN (     SELECT A2     FROM district     WHERE A13 = (         SELECT MAX(A13)         FROM district         WHERE strftime('%Y', date) = '1996'     )     AND strftime('%Y', date) = '1996' ) ORDER BY d.A13 DESC;	financial
SELECT COUNT(a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A16 = (SELECT MAX(A16) FROM district WHERE EXTRACT(YEAR FROM date) = 1996)	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND t.operation = 'VYBER KARTOU' AND t.balance < 0;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK MESICNE'   AND l.amount >= 250000   AND l.date BETWEEN '1995-01-01' AND '1997-12-31'   AND l.status = 'APPROVED';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id JOIN disp d ON a.account_id = d.account_id JOIN district dt ON d.district_id = dt.district_id WHERE dt.A8 = 1 AND l.status IN ('C', 'D');	financial
SELECT COUNT(c.client_id) AS male_clients_count FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A15 = (     SELECT A15     FROM district     WHERE A15 < (         SELECT MAX(A15)         FROM district         WHERE date_part('year', date) = 1995     )     AND date_part('year', date) = 1995 );	financial
SELECT COUNT(d.card_id) FROM card d JOIN disp dp ON d.card_id = dp.disp_id WHERE d.type = 'GOLD' AND dp.type = 'DISPONENT';	financial
SELECT COUNT(*) FROM account WHERE district_id IN (     SELECT district_id     FROM district     WHERE A2 = 'Pisek' );	financial
SELECT d.A2 AS district, SUM(t.amount) AS total_transactions FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.date BETWEEN '1997-01-01' AND '1997-12-31' GROUP BY d.A2 HAVING SUM(t.amount) > 10000;	financial
SELECT DISTINCT a.account_id FROM account a JOIN `order` o ON a.account_id = o.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek' AND o.k_symbol = 'SIPO';	financial
SELECT a.account_id FROM account JOIN disp ON a.account_id = disp.account_id JOIN card ON disp.disp_id = card.disp_id WHERE card.type = 'GOLD' AND EXISTS (     SELECT 1     FROM card AS c2     JOIN disp ON c2.disp_id = disp.disp_id     WHERE c2.type = 'JUNIOR' )	financial
SELECT AVG(amount) as average_credit_card_withdrawn FROM trans WHERE type = 'KARTA' AND operation = 'VYBER KARTOU' AND date >= '2021-01-01' AND date < '2022-01-01';	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'KARTA' AND t.operation = 'VYBER KARTOU' AND t.date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY a.account_id HAVING SUM(t.amount) < (     SELECT AVG(t2.amount)     FROM trans t2     JOIN account a2 ON t2.account_id = a2.account_id     WHERE t2.type = 'KARTA' AND t2.operation = 'VYBER KARTOU' AND t2.date BETWEEN '1998-01-01' AND '1998-12-31'     GROUP BY a2.account_id );	financial
SELECT DISTINCT c.client_id FROM client c JOIN account a ON c.account_id = a.account_id JOIN card crd ON a.account_id = crd.account_id JOIN loan ln ON a.account_id = ln.account_id WHERE c.gender = 'F' AND crd.type = 'CREDIT';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 LIKE '%South Bohemia%';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Tabor' AND a.frequency = 'POPLATEK MESICNE' AND a.type = 'OWNER';	financial
SELECT a.account_id, a.frequency FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency = 'OWNER' AND d.A11 BETWEEN 8000 AND 9000 UNION SELECT a.account_id, a.frequency FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency <> 'OWNER' AND d.A11 BETWEEN 8000 AND 9000;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT d.A2 AS district_name FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(A15) AS average_crimes FROM district WHERE A3 IN (SELECT A3 FROM district WHERE A15 > 4000) AND EXISTS (     SELECT 1     FROM account     WHERE district_id = district.district_id     AND date >= '1997-01-01' );	financial
SELECT COUNT(*)  FROM account  JOIN disp ON account.account_id = disp.account_id  JOIN card ON disp.disp_id = card.disp_id  WHERE card.type = 'classic' AND disp.type = 'OWNER';	financial
SELECT COUNT(client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M';	financial
SELECT      (COUNT(CASE WHEN card.type = 'Gold' AND card.issued < '1998-01-01' THEN 1 END) * 100.0) / COUNT(card.card_id) AS gold_card_percentage FROM      card;	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = (SELECT MAX(amount) FROM loan);	financial
SELECT SUM(A15) AS total_crimes FROM district JOIN account ON district.district_id = account.district_id WHERE account.account_id = 532 AND account.date = '1995-12-31';	financial
SELECT account.district_id FROM account JOIN `order` ON account.account_id = `order`.account_id WHERE `order`.order_id = 33333;	financial
SELECT t.account_id, t.date, t.amount FROM trans t JOIN client c ON t.account_id IN (SELECT account_id FROM disp WHERE client_id = 3356) WHERE t.operation = 'VYBER';	financial
SELECT COUNT(*) FROM account JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND loan.amount < 200000;	financial
SELECT c.type FROM card c JOIN disp d ON c.card_id = d.card_id JOIN client cl ON d.client_id = cl.client_id WHERE cl.client_id = 13539;	financial
SELECT d.A3  FROM district d JOIN client c ON d.district_id = c.district_id WHERE c.client_id = 3541;	financial
SELECT district.district_id, district.A2, COUNT(account.account_id) AS account_count FROM district JOIN account ON district.district_id = account.district_id JOIN loan ON account.account_id = loan.account_id WHERE loan.status = 'A' GROUP BY district.district_id ORDER BY account_count DESC LIMIT 1;	financial
SELECT c.client_id, c.gender, c.birth_date FROM `order` o JOIN account a ON o.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE o.order_id = 32423;	financial
SELECT t.trans_id, t.date, t.type, t.operation, t.amount, t.balance, t.k_symbol, t.bank, t.account FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.district_id = 5;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Jesenik';	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE c.gender = 'JUNIOR' AND a.date >= '1997-01-01';	financial
SELECT      (COUNT(CASE WHEN client.gender = 'F' THEN 1 END) * 100.0) / COUNT(client.client_id) AS percentage_female_clients FROM      client JOIN      district ON client.district_id = district.district_id WHERE      district.A11 > 10000	financial
SELECT      ((SUM(CASE WHEN YEAR(date) = 1997 THEN amount ELSE 0 END) - SUM(CASE WHEN YEAR(date) = 1996 THEN amount ELSE 0 END)) /       SUM(CASE WHEN YEAR(date) = 1996 THEN amount ELSE 0 END) * 100) AS growth_rate FROM loan WHERE client_id IN (     SELECT client_id     FROM client     WHERE gender = 'M' )	financial
SELECT COUNT(*) FROM trans WHERE type = 'VYBER KARTOU' AND date > '1995-12-31';	financial
SELECT     (SELECT SUM(A16) FROM district WHERE A3 = 'North Bohemia' AND A4 = '1996') -     (SELECT SUM(A16) FROM district WHERE A3 = 'East Bohemia' AND A4 = '1996') AS crime_difference	financial
SELECT COUNT(disp_id) AS total_dispositions FROM disp WHERE account_id BETWEEN 1 AND 10;	financial
SELECT      COUNT(*) AS statement_requests,     SUM(CASE WHEN operation = 'DEBIT' AND k_symbol = 'DEBITING' THEN amount ELSE 0 END) AS total_debit_amount FROM      account JOIN      trans ON account.account_id = trans.account_id WHERE      account.account_id = 3     AND trans.type = 'STATEMENT' UNION ALL SELECT      0 AS statement_requests,     SUM(amount) AS total_debit_amount FROM      trans WHERE      account_id = 3     AND operation = 'DEBIT'     AND k_symbol = '3539';	financial
SELECT c.birth_date FROM client c JOIN account a ON c.account_id = a.account_id WHERE c.client_id = 130 AND YEAR(c.birth_date) IS NOT NULL;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND EXISTS (     SELECT 1     FROM trans t     WHERE t.account_id = a.account_id     AND t.type = 'P' );	financial
SELECT     SUM(t.amount) AS total_debt,     SUM(CASE WHEN t.operation = 'Payment' THEN t.amount ELSE 0 END) AS total_payments FROM     trans t JOIN     account a ON t.account_id = a.account_id JOIN     disp d ON a.account_id = d.account_id JOIN     client c ON d.client_id = c.client_id WHERE     c.client_id = 992     AND t.type = 'Debt'	financial
SELECT     SUM(t.amount) AS total_sum,     c.gender FROM     trans t JOIN     account a ON t.account_id = a.account_id JOIN     client c ON a.district_id = c.district_id WHERE     t.trans_id = 851     AND a.account_id IN (SELECT account_id FROM disp WHERE client_id = 4)     AND c.client_id = 4 GROUP BY     c.gender;	financial
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN client cl ON d.client_id = cl.client_id WHERE cl.client_id = 9;	financial
SELECT SUM(trans.amount) AS total_payment FROM trans JOIN client ON trans.account_id IN (SELECT account_id FROM account JOIN client ON account.account_id = client.client_id WHERE client.client_id = 617) WHERE YEAR(trans.date) = 1998;	financial
SELECT client.client_id FROM client JOIN district ON client.district_id = district.district_id WHERE district.A2 = 'East Bohemia' AND client.birth_date BETWEEN '1983-01-01' AND '1987-12-31';	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.type = 'SIPO' AND t.amount > 4000;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Beroun' AND account.date > '1996-01-01';	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN card crd ON d.account_id = crd.account_id WHERE c.gender = 'F' AND crd.type = 'JUNIOR';	financial
SELECT     (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(c.client_id) AS female_percentage FROM     client c JOIN     district d ON c.district_id = d.district_id JOIN     disp d2 ON c.client_id = d2.client_id JOIN     account a ON d2.account_id = a.account_id WHERE     d.A3 = 'Praha';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) / COUNT(CASE WHEN ac.frequency = 'POPLATEK TYDNE' THEN 1 END)) * 100 AS male_clients_percentage FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      account ac ON d.account_id = ac.account_id WHERE      c.gender = 'M' AND ac.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT DISTINCT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.gender = 'F' AND c.A11 = (     SELECT MIN(A11)     FROM client     WHERE gender = 'F' ) ORDER BY c.birth_date DESC LIMIT 1;	financial
SELECT COUNT(c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1920-01-01' AND '1920-12-31' AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(DISTINCT a.account_id) AS loan_accounts FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.duration = 24;	financial
SELECT     T1.date,     AVG(T3.amount) AS average_loan_amount FROM     `order` T1 JOIN     account T2 ON T1.account_id = T2.account_id JOIN     loan T3 ON T2.account_id = T3.account_id WHERE     T3.status IN ('C', 'D')     AND T1.bank_to = 'POPLATEK PO OBRATU' GROUP BY     T1.date;	financial
SELECT DISTINCT c.client_id, d.A2 AS district FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK MESICNE';	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN card crd ON d.disp_id = crd.disp_id JOIN loan ln ON a.account_id = ln.account_id WHERE crd.type = 'GOLD' AND ln.status = 'ELIGIBLE';	financial
SELECT bond_type, COUNT(*) AS bond_count FROM bond GROUP BY bond_type ORDER BY bond_count DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT a.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' AND a.element = 'cl';	toxicology
SELECT AVG(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) as avg_oxygen_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-' GROUP BY a.molecule_id;	toxicology
SELECT      AVG(CASE WHEN m.label = '+' THEN COUNT(c.bond_id) END) /      COUNT(DISTINCT a.molecule_id) AS average_single_bonded_carcinogenic_molecules FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      c.bond_type = '-' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'na' AND molecule.label = '-';	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id) AS percentage_carbon FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = ' = ' AND a.element = 'c'	toxicology
SELECT COUNT(*) FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element <> 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'si';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN connected c2 ON c.bond_id = c2.bond_id AND c.atom_id2 = c2.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON c2.atom_id2 = a2.atom_id WHERE b.bond_type = ' = ' AND a1.element != a2.element;	toxicology
SELECT m.label, COUNT(a.atom_id) as atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT bond.bond_type FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'te';	toxicology
SELECT DISTINCT a1.atom_id, a2.atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT a1.atom_id AS Atom1, a2.atom_id AS Atom2 FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON c.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY Atom1, Atom2;	toxicology
SELECT element, COUNT(*) as count FROM atom WHERE molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label <> '-' ) GROUP BY element ORDER BY count ASC LIMIT 1;	toxicology
SELECT bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE (connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20') OR       (connected.atom_id = 'TR004_20' AND connected.atom_id2 = 'TR004_8');	toxicology
SELECT m.label FROM molecule m WHERE m.molecule_id NOT IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element != 'sn' )	toxicology
SELECT COUNT(*) FROM atom JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 JOIN bond ON connected.bond_id = bond.bond_id JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE (atom.element = 'i' OR atom.element = 's') AND bond.bond_type = '-';	toxicology
SELECT DISTINCT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN connected c2 ON c1.atom_id2 = c2.atom_id JOIN atom a2 ON c2.atom_id2 = a2.atom_id WHERE b.bond_type = '#';	toxicology
SELECT DISTINCT a.atom_id FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR181';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'f' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT m.molecule_id)  FROM      atom a  JOIN      molecule m ON a.molecule_id = m.molecule_id  WHERE      m.label = '+' AND a.element != 'f';	toxicology
SELECT      ROUND((SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END) * 100.0) / COUNT(b.bond_id), 2) AS percent FROM      bond b JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      m.label = '+'	toxicology
SELECT element, COUNT(*) as count FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR000' AND element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') GROUP BY element ORDER BY count DESC, element LIMIT 3;	toxicology
SELECT a1.atom_id AS AtomID1, a2.atom_id AS AtomID2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE b.bond_id = 'TR001_2_6' AND a1.molecule_id = 'TR001' AND a2.molecule_id = 'TR001';	toxicology
SELECT   (SELECT COUNT(*) FROM molecule WHERE label = '+') -    (SELECT COUNT(*) FROM molecule WHERE label = '-')	toxicology
SELECT a1.atom_id, a2.atom_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR_000_2_5';	toxicology
SELECT bond_id  FROM connected  WHERE atom_id2 = 'TR000_2';	toxicology
SELECT m.molecule_id, COUNT(b.bond_id) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = ' = ' GROUP BY m.molecule_id ORDER BY double_bond_count DESC, m.molecule_id ASC LIMIT 5;	toxicology
SELECT      DIVIDE(SUM(CASE WHEN bond.bond_type = ' = ' THEN 1 ELSE 0 END), COUNT(bond.bond_id)) AS percent FROM      bond JOIN      connected ON bond.bond_id = connected.bond_id JOIN      atom AS a1 ON connected.atom_id = a1.atom_id JOIN      atom AS a2 ON connected.atom_id2 = a2.atom_id JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      molecule.molecule_id = 'TR008';	toxicology
SELECT COUNT(CASE WHEN m.label = '+' THEN 1 END) / COUNT(m.molecule_id) AS percent FROM molecule m	toxicology
SELECT      ROUND(         (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100, 2     ) AS percent_hydrogen FROM      atom a WHERE      a.molecule_id = 'TR206'	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.molecule_id = 'TR000' UNION SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id2 = atom.atom_id WHERE atom.molecule_id = 'TR000';	toxicology
SELECT DISTINCT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR060' AND m.label IN ('+', '-') AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT      bond_type,      COUNT(bond_type) as bond_count,     CASE          WHEN m.label = '+' THEN 'Yes'         ELSE 'No'     END AS carcinogenic FROM      bond  JOIN      molecule m ON bond.molecule_id = m.molecule_id WHERE      bond.molecule_id = 'TR018' GROUP BY      bond_type ORDER BY      bond_count DESC LIMIT 1;	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '-' AND m.label = '-' GROUP BY m.molecule_id, m.label ORDER BY m.label ASC LIMIT 3;	toxicology
SELECT bond_id, bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_type ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected WHERE bond_id LIKE 'TR009_%' AND (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12');	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT b.bond_type, a1.atom_id AS atom1, a2.atom_id AS atom2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_6_9';	toxicology
SELECT m.molecule_id, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '#';	toxicology
SELECT COUNT(DISTINCT bond_id)  FROM connected  WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE SUBSTRING(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN atom a1 ON b.molecule_id = a1.molecule_id AND a1.element = 'p' JOIN atom a2 ON b.molecule_id = a2.molecule_id AND a2.element = 'n' JOIN connected c ON (b.bond_id = c.bond_id OR b.bond_id = c.bond_id2);	toxicology
SELECT m.molecule_id, COUNT(b.bond_id) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = ' = ' JOIN connected c ON b.bond_id = c.bond_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT AVG(COUNT(bond_id)) / COUNT(atom_id)  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  WHERE atom.element = 'i';	toxicology
SELECT b.bond_id, b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE SUBSTR(a.atom_id, 7, 2) + 0 = 45 OR SUBSTR(a.atom_id2, 7, 2) + 0 = 45;	toxicology
SELECT a.atom_id, a.element FROM atom a WHERE a.atom_id NOT IN (     SELECT c.atom_id     FROM connected c ) AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT DISTINCT a1.atom_id AS atom1, a2.atom_id AS atom2 FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c1.atom_id2 WHERE b.bond_type = '#' AND a1.molecule_id = 'TR447' AND a2.molecule_id = 'TR447';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR144_8_19';	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = ' = ' WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT element, COUNT(*) as count FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY element ORDER BY count LIMIT 1;	toxicology
SELECT DISTINCT a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE a1.element = 'pb' AND a2.element <> 'pb';	toxicology
SELECT DISTINCT a1.element AS element1, a2.element AS element2, a3.element AS element3 FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN connected c2 ON a1.atom_id = c2.atom_id2 JOIN connected c3 ON a2.atom_id = c3.atom_id2 JOIN connected c4 ON a3.atom_id = c4.atom_id2 JOIN atom a2 ON c2.atom_id = a2.atom_id JOIN atom a3 ON c3.atom_id = a3.atom_id WHERE b.bond_type = '#' AND a1.element IN ('c', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND a2.element IN ('c', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND a3.element IN ('c', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT      (COUNT(bond_id) * 100.0) / SUM(CASE WHEN atom_count = MAX atom_count THEN 1 ELSE 0 END) AS percentage_of_most_common_bond_combination FROM (     SELECT          bond.bond_id,         COUNT(DISTINCT connected.atom_id) AS atom_count     FROM          bond     JOIN connected ON bond.bond_id = connected.bond_id     JOIN atom AS a1 ON connected.atom_id = a1.atom_id     JOIN atom AS a2 ON connected.atom_id2 = a2.atom_id     GROUP BY          bond.bond_id, a1.element, a2.element ) AS bond_element_counts CROSS JOIN (     SELECT          MAX(count) AS MAX atom_count     FROM (         SELECT              COUNT(*) AS count         FROM              bond         JOIN connected ON bond.bond_id = connected.bond_id         JOIN atom AS a1 ON connected.atom_id = a1.atom_id         JOIN atom AS a2 ON connected.atom_id2 = a2.atom_id         GROUP BY              a1.element, a2.element     ) AS element_counts ) AS max_count;	toxicology
SELECT SUM(CASE WHEN `bond_type` = '-' THEN 1 ELSE 0 END) * 1.0 / COUNT(`bond_id`)  FROM `bond`  WHERE `bond_type` = '-' AND EXISTS (     SELECT 1 FROM `molecule` WHERE `molecule_id` = `bond`.molecule_id AND `label` = '+' );	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT DISTINCT a2.atom_id2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 's';	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'sn' OR a2.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE b.bond_type = '-'  GROUP BY a.molecule_id;	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#'  AND (a.element = 'p' OR a.element = 'br') AND m.label = 'triple-bond-molecule';	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100, 2) AS percentage_cl FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '-' AND a.element = 'cl';	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR030'  AND label = '+';	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(bond_id) FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'i';	toxicology
SELECT      COUNT(CASE WHEN m.label = '+' THEN 1 END) AS carcinogenic_count,     COUNT(CASE WHEN m.label = '-' THEN 1 END) AS non_carcinogenic_count FROM      molecule m JOIN      atom a ON m.molecule_id = a.molecule_id WHERE      a.element = 'ca' GROUP BY      m.molecule_id HAVING      MAX(m.label) IS NOT NULL;	toxicology
SELECT COUNT(*)  FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE b.bond_id = 'TR001_1_8' AND (a1.element = 'cl' OR a2.element = 'cl') AND (a1.element = 'c' OR a2.element = 'c');	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND b.bond_type = '#' AND m.label = '-';	toxicology
SELECT      SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.molecule_id) * 100 AS percentage FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+' AND a.element = 'cl';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR001';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = ' = ';	toxicology
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' AND c.atom_id < c.atom_id2;	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR005_16_26';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-';	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT bond.bond_id, molecule.label AS carcinogenicity FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '+';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+'  AND a.atom_id = SUBSTR(a.molecule_id, 7, 1) = '4';	toxicology
SELECT      m.label,     (SELECT COUNT(a.element)       FROM atom a       WHERE a.molecule_id = 'TR006' AND a.element = 'h') /      (SELECT COUNT(*)       FROM atom       WHERE a.molecule_id = 'TR006') AS hydrogen_ratio FROM molecule m WHERE m.molecule_id = 'TR006';	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND m.label = '+';	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom AS atom1 ON connected.atom_id = atom1.atom_id JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE atom1.element = 'te' AND atom2.element = 'te';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_10_11' AND a1.atom_id = SUBSTR('TR001_10_11', 7, 2) AND a2.atom_id = SUBSTR('TR001_10_11', 10, 2);	toxicology
SELECT      (COUNT(*) FILTER (WHERE bond_type = '#')) * 100.0 / COUNT(*) FROM      connected JOIN      bond ON connected.bond_id = bond.bond_id JOIN      molecule ON bond.molecule_id = molecule.molecule_id;	toxicology
SELECT      (SUM(CASE WHEN bond.bond_type = ' = ' THEN 1 ELSE 0 END) * 100.0) / COUNT(bond.bond_id) AS percent FROM      bond WHERE      bond.molecule_id = 'TR047'	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_1' AND m.label = '+';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id = 'TR151' AND label = '+';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR151' AND a.element IN ('cl', 'br', 'i', 'pb', 'te', 'sn', 'as', 'bi', 'hg', 'ag', 'au', 'pt', 'am', 'cn', 'fl', 'at', 'ts', 'ug', 'pp', 'mh', 'mt', 'ds', 'rf', 'db', 'sg', 'bh', 'hs', 'mt', 'ds', 'rg', 'cn', 'fl', 'at', 'ts', 'ug', 'pp', 'mh', 'mt', 'ds', 'rg', 'cn', 'fl', 'at', 'ts', 'ug', 'pp', 'mh', 'mt', 'ds', 'rg', 'cn', 'fl', 'at', 'ts', 'ug', 'pp', 'mh', 'mt', 'ds', 'rg', 'cn', 'fl', 'at', 'ts', 'ug', 'pp', 'mh', 'mt', 'ds', 'rg', 'cn', 'fl', 'at', 'ts', 'ug', 'pp', 'mh', 'mt', 'ds', 'rg', 'cn', 'fl', 'at', 'ts', 'ug', 'pp', 'mh', 'mt', 'ds', 'rg', 'cn', 'fl', 'at', 'ts', 'ug', 'pp', 'mh', 'mt', 'ds', 'rg', 'cn', 'fl', 'at', 'ts', 'ug', 'pp', 'mh', 'mt', 'ds', 'rg', 'cn', 'fl', 'at', 'ts', 'ug', 'pp', 'mh', 'mt', 'ds', 'rg', 'cn', 'fl', 'at', 'ts', 'ug', 'pp', 'mh', 'mt', 'ds', 'rg', 'cn', 'fl', 'at', 'ts', 'ug', 'pp', 'mh', 'mt', 'ds', 'rg', 'cn', 'fl', 'at', 'ts', 'ug', 'pp', 'mh', 'mt', 'ds', 'rg', 'cn', 'fl', 'at',	toxicology
SELECT COUNT(DISTINCT molecule_id)  FROM molecule  WHERE label = '+';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.molecule_id LIKE 'TR010%' AND m.molecule_id LIKE 'TR050%';	toxicology
SELECT COUNT(a.atom_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN connected c1 ON b.bond_id = c1.bond_id JOIN connected c2 ON b.bond_id = c2.bond_id AND c1.atom_id2 = c2.atom_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+' AND b.bond_type = ' = ';	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+';	toxicology
SELECT molecule_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR00_1_2' AND connected.atom_id = 'TR00_1';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label <> '-';	toxicology
SELECT      DIVIDE(SUM(CASE WHEN a.element = 'h' AND m.label = '+' THEN 1 ELSE 0 END), COUNT(DISTINCT m.molecule_id)) * 100.0 AS percentage_carcinogenic_with_hydrogen FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id	toxicology
SELECT m.label FROM molecule m WHERE m.molecule_id = 'TR124' AND m.label = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR186';	toxicology
SELECT bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR007_4' AND connected.atom_id2 = '19';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT      COUNT(bond.bond_id) AS double_bond_count,     CASE WHEN m.label = '+' THEN 'Yes' ELSE 'No' END AS carcinogenic FROM      bond JOIN      connected ON bond.bond_id = connected.bond_id JOIN      molecule m ON bond.molecule_id = m.molecule_id WHERE      bond.molecule_id = 'TR006' AND      bond.bond_type = ' = '	toxicology
SELECT m.molecule_id, GROUP_CONCAT(a.element ORDER BY a.element) AS elements FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') GROUP BY m.molecule_id;	toxicology
SELECT b.bond_id, a1.atom_id AS atom1, a2.atom_id AS atom2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT m.molecule_id, GROUP_CONCAT(a.element ORDER BY a.element) AS elements FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN atom a ON b.bond_id = a.atom_id WHERE b.bond_type = '#' GROUP BY m.molecule_id;	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN atom a2 ON a1.atom_id = (SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_3' AND atom_id = a2.atom_id) JOIN bond ON bond.bond_id = 'TR000_2_3' JOIN connected ON connected.bond_id = 'TR000_2_3' AND connected.atom_id = a1.atom_id WHERE a1.atom_id <> a2.atom_id;	toxicology
SELECT COUNT(b.bond_id) FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'cl' OR a2.element = 'cl';	toxicology
SELECT      a.atom_id,     COUNT(DISTINCT b.bond_type) AS bond_types_count FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.molecule_id = 'TR346' GROUP BY      a.atom_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS double_bond_molecules,         SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_compounds FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = ' = ' JOIN atom a1 ON m.molecule_id = a1.molecule_id JOIN atom a2 ON m.molecule_id = a2.molecule_id JOIN connected c ON a1.atom_id = c.atom_id AND a2.atom_id = c.atom_id2 JOIN connected c2 ON c.bond_id = c2.bond_id AND c2.atom_id = c.atom_id2 JOIN connected c3 ON c2.bond_id = c3.bond_id AND c3.atom_id = c.atom_id WHERE c.bond_id = c3.bond_id	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id LEFT JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '=' WHERE a.element != 's' AND b.bond_id IS NULL;	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR001_2_4' AND bond_type = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+' GROUP BY m.molecule_id;	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT      ROUND(DIVIDE(SUM(CASE WHEN label = '+' AND element = 'cl' THEN 1 ELSE 0 END), COUNT(DISTINCT molecule_id)), 2) AS percentage FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      molecule.label = '+';	toxicology
SELECT `molecule_id`  FROM `bond`  WHERE `bond_id` = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT element)  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 WHERE connected.bond_id = 'TR001_3_4';	toxicology
SELECT bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2';	toxicology
SELECT m.label AS molecule FROM molecule m JOIN atom a1 ON m.molecule_id = a1.molecule_id JOIN atom a2 ON m.molecule_id = a2.molecule_id WHERE a1.atom_id = 'TR000_2' AND a2.atom_id = 'TR000_4';	toxicology
SELECT element  FROM atom  WHERE atom_id = 'TR000_1';	toxicology
SELECT m.label FROM molecule m WHERE m.molecule_id = 'TR000';	toxicology
SELECT      (SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id) AS percentage FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 's' AND b.bond_type = ' = ';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND (SELECT COUNT(*) FROM atom WHERE molecule_id = m.molecule_id) > 5 GROUP BY m.molecule_id;	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024';	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' AND b.bond_type = '#' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT a.molecule_id) AS percentage_carcinogenic_with_triple_bonded_H FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      bond b ON c.bond_id = b.bond_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+'	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND molecule_id IN (   SELECT molecule_id   FROM bond   WHERE bond_type = '-' );	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label = '-' AND a.element IN ('c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS total_double_bonded_oxygen_molecules FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'o' AND b.bond_type = ' = ';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '#'  AND m.label = '-';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR016';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'c' AND b.bond_type = ' = ' AND a.molecule_id = 'TR012';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT id, name FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NULL AND cardKingdomId IS NULL;	card_games
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards);	card_games
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT c.name, c.scryfallId FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator';	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types LIKE '%Artifact%'   AND c.side IS NULL   AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power = '*' OR c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT c.name, r.text AS ruling_text, c.hasContentWarning AS has_content_warning FROM cards c JOIN rulings r ON c.uuid = r.uuid JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.artist = 'Stephen Daniel' AND c.name = r.name AND c.hasContentWarning = 1;	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT cards.name, cards.artist, cards.isPromo FROM cards JOIN rulings ON cards.uuid = rulings.uuid GROUP BY cards.uuid ORDER BY COUNT(rulings.uuid) DESC LIMIT 1;	card_games
SELECT st.language, st.translation FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.name = 'Annul' AND c.number = '29';	card_games
SELECT cards.name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN legalities.format = 'Chinese Simplified' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage_of_cards_in_chinese_simplified FROM      cards JOIN      legalities ON cards.uuid = legalities.uuid;	card_games
SELECT s.code, s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type)  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT st.language FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT text FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Cloudchaser Eagle' AND legalities.format = 'MTGO';	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Benalish Knight' AND EXISTS (     SELECT 1     FROM legalities l     JOIN sets s ON l.uuid = c.uuid     WHERE l.format = 'Legal' AND s.code = '10E' );	card_games
SELECT artist  FROM cards  WHERE flavorText LIKE '%Phyrexian%' AND artist IS NOT NULL;	card_games
SELECT      (COUNT(CASE WHEN cards.borderColor = 'borderless' THEN 1 END) * 100.0) / COUNT(cards.id) AS borderless_percentage FROM      cards;	card_games
SELECT COUNT(*) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid JOIN legalities ON cards.uuid = legalities.uuid WHERE foreign_data.language = 'German' AND cards.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND EXISTS (     SELECT 1     FROM set_translations     JOIN sets ON sets.code = set_translations.setCode     WHERE sets.name = 'Russian' AND cards.uuid = set_translations.setCode );	card_games
SELECT     (COUNT(CASE WHEN cards.isStorySpotlight = 1 AND foreign_data.language = 'French' THEN 1 END) * 100.0) / COUNT(CASE WHEN cards.isStorySpotlight = 1 THEN 1 END) AS percentage_French FROM     cards JOIN     foreign_data ON cards.uuid = foreign_data.uuid WHERE     cards.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords LIKE '%Flying%'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%';	card_games
SELECT c.id FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.hasFoil = 1 AND c.hasNonFoil = 1 AND c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL AND s.type = 'Expansion';	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank  FROM cards  WHERE frameVersion = '2015';	card_games
SELECT artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Chinese Simplified'	card_games
SELECT c.name FROM cards c JOIN set_translations st ON c.setCode = st.setCode AND st.language = 'Japanese' WHERE c.availability = 'paper';	card_games
SELECT COUNT(*) FROM cards WHERE status = 'Banned' AND borderColor = 'white';	card_games
SELECT c.uuid, fd.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data fd ON c.uuid = fd.uuid WHERE l.format = 'legacy' AND fd.language != 'en';	card_games
SELECT text  FROM rulings  WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Beacon of Immortality');	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = 'future' AND EXISTS (     SELECT 1     FROM legalities     WHERE legalities.uuid = cards.uuid     AND status = 'legal' );	card_games
SELECT c.name, c.colors FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW';	card_games
SELECT cards.name, set_translations.language FROM cards JOIN set_translations ON cards.uuid = set_translations.uuid WHERE cards.setCode = '10E' AND cards.convertedManaCost = 5;	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT      c.colors AS colors,      l.format AS format  FROM      cards c  JOIN      legalities l ON c.uuid = l.uuid  WHERE      c.id BETWEEN 1 AND 20;	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language != 'en';	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NULL;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability LIKE '%mtgo%' AND hand = '-1';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability LIKE '%paper%' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal'   AND frameVersion = '2003'   AND borderColor = 'black'   AND availability LIKE '%paper%'   AND availability LIKE '%mtgo%';	card_games
SELECT SUM(convertedManaCost) AS totalUnconvertedManaCost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT type, supertypes, subtypes FROM cards WHERE availability = 'arena';	card_games
SELECT s.code FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Spanish';	card_games
SELECT     (COUNT(CASE WHEN hand = '+3' THEN 1 END) * 100.0) / COUNT(id) FROM     cards WHERE     frameEffects = 'legendary';	card_games
SELECT      c.id,      (SUM(CASE WHEN c.isStorySpotlight = 1 AND c.isTextless = 0 THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN c.isStorySpotlight = 1 THEN 1 ELSE 0 END) AS percentage FROM      cards c GROUP BY      c.id ORDER BY      c.id;	card_games
SELECT cards.name,         (SUM(CASE WHEN set_translations.language = 'Spanish' THEN 1 ELSE 0 END) * 100.0) / COUNT(cards.id) AS percentage_spanish FROM cards LEFT JOIN set_translations ON cards.uuid = set_translations.uuid GROUP BY cards.name ORDER BY percentage_spanish DESC;	card_games
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'legal' AND c.types LIKE '%Creature%'	card_games
SELECT      c.name,     st.translation FROM      cards c JOIN      set_translations st ON c.setCode = st.setCode JOIN      sets s ON c.setCode = s.code JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      st.language = 'German'     AND c.subtypes IS NOT NULL     AND c.supertypes IS NOT NULL     AND c.type = 'Creature' UNION ALL SELECT      c.name,     st.translation FROM      cards c JOIN      set_translations st ON c.setCode = st.setCode JOIN      sets s ON c.setCode = s.code JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      st.language = 'German'     AND c.subtypes IS NOT NULL     AND c.supertypes IS NOT NULL     AND c.type = 'Enchantment' UNION ALL SELECT      c.name,     st.translation FROM      cards c JOIN      set_translations st ON c.setCode = st.setCode JOIN      sets s ON c.setCode = s.code JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      st.language = 'German'     AND c.subtypes IS NOT NULL     AND c.supertypes IS NOT NULL     AND c.type = 'Instant' UNION ALL SELECT      c.name,     st.translation FROM      cards c JOIN      set_translations st ON c.setCode = st.setCode JOIN      sets s ON c.setCode = s.code JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      st.language = 'German'     AND c.subtypes IS NOT NULL     AND c.supertypes IS NOT NULL     AND c.type = 'Sorcery' UNION ALL SELECT      c.name,     st.translation FROM      cards c JOIN      set_translations st ON c.setCode = st.setCode JOIN      sets s ON c.setCode = s.code JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      st.language = 'German'     AND c.subtypes IS NOT NULL     AND c.supertypes IS NOT NULL     AND c.type = 'Land';	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND (text LIKE '%When%' OR text LIKE '%Triggered ability%');	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'Pre-Modern' AND cards.side IS NULL AND cards.text LIKE '%triggered mana ability%';	card_games
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability = 'paper' AND uuid IN (SELECT uuid FROM legalities WHERE format = 'pauper');	card_games
SELECT artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.text = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT translation FROM set_translations JOIN sets ON set_translations.setCode = sets.code JOIN cards ON sets.code = cards.setCode JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.artist = 'Matthew D. Wilson' AND cards.borderColor = 'black' AND cards.type LIKE '%Creature%' AND cards.layout = 'normal' AND set_translations.language = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.rarity = 'rare' AND rulings.date = '2009-01-10';	card_games
SELECT st.language, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 180 AND s.block = 'Ravnica';	card_games
SELECT      (COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) * 100.0) / COUNT(c.id)  FROM      cards c  JOIN      legalities l ON c.uuid = l.uuid  WHERE      c.format = 'commander' AND      l.status = 'legal';	card_games
SELECT      (COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 END AND f.language = 'French' END) * 100.0) /      COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 END)  FROM      cards c  JOIN      foreign_data f ON c.uuid = f.uuid  WHERE      c.power IS NULL OR c.power = '*';	card_games
SELECT      ROUND(DIVIDE(COUNT(CASE WHEN s.type = 'expansion' THEN 1 END), COUNT(CASE WHEN st.language = 'Japanese' THEN 1 END)), 2) AS percentage_japanese_expansion_sets FROM      set_translations st JOIN      sets s ON st.setCode = s.code WHERE      st.language = 'Japanese';	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE colorIdentity IS NOT NULL AND borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name FROM cards WHERE (power IS NULL OR power = '*')   AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3;	card_games
SELECT language  FROM foreign_data  WHERE multiverseid = 149934;	card_games
SELECT id, cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3;	card_games
SELECT      (COUNT(CASE WHEN c.isTextless = 1 AND c.layout = 'normal' THEN 1 END) * 100.0) / COUNT(c.id) AS proportion FROM      cards c;	card_games
SELECT DISTINCT c.number FROM cards c WHERE c.subtypes LIKE '%Angel%'   AND c.subtypes LIKE '%Wizard%'   AND c.otherFaceIds IS NULL;	card_games
SELECT s.name, s.code FROM sets s WHERE s.mtgoCode IS NULL OR s.mtgoCode = '' ORDER BY s.name ASC LIMIT 3;	card_games
SELECT DISTINCT set_translations.language FROM set_translations JOIN sets ON set_translations.setCode = sets.code WHERE sets.mcmName = 'Archenemy' AND sets.code = 'ARC';	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5;	card_games
SELECT st.language, s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206;	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN legalities l ON s.code = l.uuid WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' GROUP BY s.id, s.name ORDER BY s.name ASC LIMIT 2;	card_games
SELECT id FROM sets WHERE isForeignOnly = 1 AND isFoilOnly = 1 AND code IN (SELECT setCode FROM set_translations WHERE language = 'Japanese');	card_games
SELECT s.code, s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.totalSetSize DESC LIMIT 1;	card_games
SELECT      (COUNT(CASE WHEN s.isOnlineOnly = 1 THEN 1 END) * 100.0) / COUNT(*) AS percentage FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.language = 'Chinese Simplified';	card_games
SELECT COUNT(*) FROM sets WHERE code IN (SELECT setCode FROM set_translations WHERE language = 'Japanese') AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart' GROUP BY id;	card_games
SELECT id, name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language FROM set_translations WHERE setCode = '174';	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar';	card_games
SELECT code  FROM sets  WHERE releaseDate = '2007-07-13';	card_games
SELECT s.baseSetSize, s.code FROM sets s WHERE s.block IN ('Masques', 'Mirage');	card_games
SELECT code FROM sets WHERE type = 'expansion';	card_games
SELECT      f.name,      c.type FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid WHERE      c.watermark = 'Boros';	card_games
SELECT      foreign_data.language,      foreign_data.flavorText,      cards.type FROM      cards JOIN      foreign_data ON cards.uuid = foreign_data.uuid WHERE      cards.watermark = 'colorpie';	card_games
SELECT      (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0) / COUNT(*) AS percentageOf10ManaCost FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Abyssal Horror';	card_games
SELECT s.code FROM sets s WHERE s.type = 'Expansion' AND s.name LIKE '%Commander%';	card_games
SELECT f.name, c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan';	card_games
SELECT f.language, c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.watermark = 'Azorius'	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand LIKE '+%';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes LIKE '%bundle%'	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE borderColor = 'black'  AND availability LIKE '%arena,mtgo%';	card_games
SELECT      CASE          WHEN c1.convertedManaCost > c2.convertedManaCost THEN 'Serra Angel'         ELSE 'Shrine Keeper'     END AS CardWithHigherManaCost FROM      cards c1 JOIN      cards c2 ON      c1.name = 'Serra Angel' AND c2.name = 'Shrine Keeper'	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Ancestor''s Chosen' AND st.language = 'Italian';	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE cards.name = 'Angel of Mercy';	card_games
SELECT c.name FROM cards c JOIN set_translations st ON c.uuid = st.uuid JOIN sets s ON st.setCode = s.code WHERE st.translation = 'Hauptset Zehnte Edition' AND s.name = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS(     SELECT 1     FROM cards     JOIN foreign_data ON cards.uuid = foreign_data.uuid     WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'Korean' );	card_games
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.uuid = set_translations.uuid JOIN sets ON sets.code = set_translations.setCode WHERE sets.name = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex';	card_games
SELECT SUM(baseSetSize) as total_cards_in_base_set FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE translation = 'Hauptset Zehnte Edition';	card_games
SELECT translation FROM set_translations JOIN sets ON sets.code = set_translations.setCode WHERE sets.name = 'Eighth Edition' AND set_translations.language = 'Chinese';	card_games
SELECT sets.name FROM sets JOIN cards ON sets.code = cards.setCode WHERE cards.name = 'Angel of Mercy' AND sets.mtgoCode IS NOT NULL;	card_games
SELECT releaseDate FROM sets JOIN cards ON sets.code = cards.setCode WHERE cards.name = 'Ancestor''s Chosen';	card_games
SELECT sets.type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian';	card_games
SELECT COUNT(*) FROM sets JOIN cards ON sets.code = cards.setCode WHERE cards.name = 'Adarkar Valkyrie' AND sets.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets WHERE id IN (     SELECT s.id     FROM sets s     JOIN set_translations st ON s.code = st.setCode     WHERE st.language = 'Italian' AND s.baseSetSize < 10 );	card_games
SELECT COUNT(*) FROM cards WHERE name = 'Coldsnap' AND borderColor = 'black';	card_games
SELECT cards.name FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' ORDER BY cards.convertedManaCost DESC LIMIT 1;	card_games
SELECT DISTINCT artist  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT id, name, number FROM cards WHERE setCode = 'Coldsnap' AND number = '4';	card_games
SELECT COUNT(*) FROM cards AS C JOIN sets AS S ON C.setCode = S.code WHERE C.convertedManaCost > 5 AND S.name = 'Coldsnap' AND (C.power = '*' OR C.power IS NULL);	card_games
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT language FROM foreign_data WHERE name = 'Ancestor''s Chosen' AND flavorText IS NOT NULL;	card_games
SELECT translation  FROM set_translations  JOIN sets ON sets.code = set_translations.setCode  JOIN foreign_data ON foreign_data.uuid = sets.uuid  WHERE sets.name = 'Ancestor''s Chosen' AND set_translations.language = 'German';	card_games
SELECT r.text AS ItalianRuling FROM cards c JOIN set_translations st ON c.setCode = st.setCode JOIN sets s ON st.setCode = s.code JOIN rulings r ON c.uuid = r.uuid WHERE s.name = 'Coldsnap' AND st.language = 'Italian' AND r.text IS NOT NULL;	card_games
SELECT s.translation FROM sets JOIN set_translations st ON sets.code = st.setCode JOIN cards c ON st.setCode = sets.code WHERE sets.name = 'Coldsnap' AND st.language = 'Italian' AND c.convertedManaCost = (     SELECT MAX(convertedManaCost)     FROM cards     JOIN set_translations st ON cards.uuid = st.uuid     JOIN sets s ON st.setCode = s.code     WHERE sets.name = 'Coldsnap'     AND st.language = 'Italian' );	card_games
SELECT date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce';	card_games
SELECT      (SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage_with_cmc_7 FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      c.setCode = 'Coldsnap';	card_games
SELECT      (SUM(CASE WHEN c.cardKingdomFoilId = c.cardKingdomId AND c.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage_incredibly_powerful FROM      cards c INNER JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName  FROM sets  WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%';	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT      c.name,     r.text AS ruling_text,     CASE          WHEN c.hasContentWarning = 1 THEN 'Yes'         ELSE 'No'     END AS hasContentWarning,     CASE          WHEN c.manaCost IS NULL OR c.convertedManaCost IS NULL OR c.power IS NULL OR c.toughness IS NULL THEN 'Yes'         ELSE 'No'     END AS hasMissingOrDegradedProperties FROM      cards c JOIN      rulings r ON c.uuid = r.uuid WHERE      c.artist = 'Jim Pavelec';	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation';	card_games
SELECT baseSetSize  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Rinascita di Alara';	card_games
SELECT type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Huitième édition';	card_games
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON s.code = c.setCode WHERE c.name = 'Tendo Ice Bridge' AND st.language = 'French';	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.name = 'Salvat 2011' AND set_translations.translation IS NOT NULL;	card_games
SELECT translation  FROM set_translations  JOIN sets ON sets.code = set_translations.setCode  WHERE sets.name = 'Fellwar Stone' AND set_translations.language = 'Japanese';	card_games
SELECT name, MAX(convertedManaCost) as maxCMC FROM cards WHERE name = 'Journey into Nyx Hero''s Path' GROUP BY name ORDER BY maxCMC DESC LIMIT 1;	card_games
SELECT s.releaseDate FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Ola de frío';	card_games
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3.0;	card_games
SELECT translation FROM set_translations WHERE setCode = 'MIR' AND language = 'Chinese Simplified';	card_games
SELECT      (SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN st.language = 'Japanese' THEN 1 ELSE 0 END) AS percentage_japanese_non_foil FROM      cards c JOIN      set_translations st ON c.uuid = st.uuid JOIN      sets s ON c.setCode = s.code WHERE      st.language = 'Japanese'	card_games
SELECT      (SUM(isOnlineOnly = 1) * 100.0) / SUM(language = 'Portuguese (Brazil)') FROM      cards  JOIN      set_translations ON cards.uuid = set_translations.uuid  WHERE      set_translations.language = 'Portuguese (Brazil)';	card_games
SELECT DISTINCT availability  FROM cards  WHERE artist = 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT artist, MAX(convertedManaCost) AS max_cost FROM cards WHERE side IS NULL GROUP BY artist ORDER BY max_cost DESC LIMIT 1;	card_games
SELECT MAX(frameEffects) AS most_common_frame_effect FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*'   AND hasFoil = 0   AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander' AND code NOT LIKE '%Alchemy%' ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT id, name, MAX(convertedManaCost) AS maxManaCost FROM cards WHERE format = 'duel' GROUP BY id, name ORDER BY maxManaCost DESC LIMIT 10;	card_games
SELECT      MIN(originalReleaseDate) AS OldestReleaseDate,      GROUP_CONCAT(DISTINCT legalities.format ORDER BY legalities.format) AS LegalPlayFormats FROM      cards JOIN      legalities ON cards.uuid = legalities.uuid WHERE      cards.rarity = 'mythic' AND      legalities.status = 'legal' GROUP BY      cards.uuid;	card_games
SELECT COUNT(c.id)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.artist = 'Volkan Baga'  AND fd.language = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'rare' AND cards.types LIKE '%Enchantment%' AND cards.name = 'Abundance' AND legalities.status = 'Legal';	card_games
SELECT legalities.format, cards.name FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.status = 'banned' GROUP BY legalities.format, cards.name ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT language FROM set_translations JOIN sets ON set_translations.setCode = sets.code WHERE sets.name = 'Battlebond';	card_games
SELECT artist, COUNT(*) as card_count FROM cards GROUP BY artist ORDER BY card_count ASC LIMIT 1;	card_games
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = '1997'   AND cards.artist = 'D. Alexander Gregory'   AND legalities.format = 'legacy'   AND (cards.hasContentWarning = 1 OR legalities.status = 'Wizards of the Coast');	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'banned';	card_games
SELECT      COUNT(*) / (SELECT COUNT(DISTINCT year(releaseDate)) FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31') AS avg_sets_per_year,     MAX(language) AS common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31';	card_games
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena';	card_games
SELECT DISTINCT c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'oldschool' AND (l.status = 'banned' OR l.status = 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT r.text, r.date FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'legal';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Korean' AND s.code NOT IN (     SELECT st.setCode     FROM set_translations st     WHERE st.language LIKE '%Japanese%' );	card_games
SELECT DISTINCT frameVersion FROM cards WHERE artist = 'Allen Williams';  SELECT c.name, c.type FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Allen Williams' AND l.status = 'banned';	card_games
SELECT      CASE          WHEN u1.Reputation > u2.Reputation THEN u1.DisplayName          ELSE u2.DisplayName      END AS HigherReputationUser FROM      users u1 JOIN      users u2 ON (u1.DisplayName = 'Harlan' OR u1.DisplayName = 'Jarrod Dixon')      AND (u2.DisplayName = 'Harlan' OR u2.DisplayName = 'Jarrod Dixon') WHERE      u1.Reputation > u2.Reputation OR u2.Reputation > u1.Reputation;	codebase_community
SELECT DisplayName FROM users WHERE strftime('%Y', CreationDate) = '2014'	codebase_community
SELECT COUNT(DISTINCT Id)  FROM users  WHERE LastAccessDate > '2014-09-01 00:00:00'	codebase_community
SELECT.DisplayName FROM users JOIN (     SELECT MAX(Views) as MaxViews     FROM users ) AS MaxViewUser WHERE users.Views = MaxViewUser.MaxViews;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 1 AND v.BountyAmount IS NULL AND u.UpVotes > 100 AND EXISTS (     SELECT 1      FROM votes v2      WHERE v2.UserId = u.Id AND v2.VoteTypeId = 2 AND v2.BountyAmount IS NULL AND v2.DownVotes > 1 )	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT SUM(p.CommentCount) AS TotalComments FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT p.AnswerCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Examples for teaching: Correlation does not mean causation' AND LastEditorUserId IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL	codebase_community
SELECT DISTINCT p.OwnerDisplayName FROM posts p WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (     SELECT Id     FROM users     WHERE Age > 65 ) AND Score >= 20;	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian';	codebase_community
SELECT p.Body, t.TagName FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags)	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND strftime('%Y', Date) = '2011';	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(posts.Score) AS AverageScore FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie'	codebase_community
SELECT AVG(badgeCount) as averageBadges FROM (     SELECT COUNT(b.Id) as badgeCount     FROM badges b     JOIN users u ON b.UserId = u.Id     WHERE u.Views > 200     GROUP BY b.UserId ) as badgeCounts;	codebase_community
SELECT      CAST(COUNT(CASE WHEN u.Age > 65 THEN p.Id END) AS REAL) * 100 / COUNT(p.Id) AS ElderUserPercentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 20;	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT MAX(CreationDate) AS MaxVoteCreationDate FROM votes WHERE CreationDate = (     SELECT MAX(CreationDate)     FROM votes     GROUP BY DAY(CreationDate)     ORDER BY COUNT(*) DESC     LIMIT 1 );	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM posts p LEFT JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910;	codebase_community
SELECT SUM(p.FavoriteCount) AS TotalFavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014/04/23 20:29:39.0'	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 AND CommentCount = 1;	codebase_community
SELECT      p.Id,     p.Title,     p.ClosedDate,     CASE          WHEN p.ClosedDate IS NULL THEN 'Not Well-Finished'         ELSE 'Well-Finished'     END AS PostStatus FROM      comments c JOIN      posts p ON c.PostId = p.Id WHERE      c.UserId = 23853 AND      c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT Reputation  FROM users  WHERE Id = (SELECT OwnerUserId             FROM posts             WHERE Id = 65041);	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Tiago Pasqualini')	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.Id = 6347;	codebase_community
SELECT SUM(CASE WHEN v.VoteTypeId = 2 THEN 1 ELSE -1 END) AS NetVotes FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) AS post_vote_ratio FROM posts LEFT JOIN votes ON posts.OwnerUserId = 24 WHERE posts.OwnerUserId = 24;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT c.UserDisplayName FROM comments c WHERE c.Text = 'thank you user93';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT c.Text AS Comment FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT DISTINCT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT u.DisplayName AS EditorDisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.Id;	codebase_community
SELECT c.Text AS CommentText FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND c.UserId IN (     SELECT DISTINCT uh.UserId     FROM postHistory uh     JOIN posts up ON uh.PostId = up.Id     WHERE up.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'     AND uh.UserId IS NOT NULL );	codebase_community
SELECT SUM(BountyAmount) AS TotalBountyAmount FROM posts JOIN votes ON posts.Id = votes.PostId WHERE posts.Title LIKE '%data%';	codebase_community
SELECT u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT      p.Title,      c.Text AS Comment,      c.Score,      AVG(p.ViewCount) AS AvgViewCount FROM      posts p JOIN      postLinks pl ON p.Id = pl.PostId JOIN      tags t ON pl.TagId = t.Id JOIN      comments c ON p.Id = c.PostId WHERE      t.TagName = 'humor' GROUP BY      p.Id, c.Id	codebase_community
SELECT COUNT(c.Id) AS TotalComments FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.Id = 13;	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE b.Name = 'Supporter' AND YEAR(b.Date) = 2011;	codebase_community
SELECT COUNT(DISTINCT UserId) AS NumberOfUsersWithMoreThanFiveBadges FROM badges WHERE Name IN ('Teacher') GROUP BY UserId HAVING COUNT(*) > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name IN ('Teacher', 'Supporter') AND u.Location = 'New York';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount >= 1000 GROUP BY u.Id HAVING COUNT(DISTINCT ph.Id) = 1;	codebase_community
SELECT      u.Id,     u.DisplayName,     b.Name AS Badge FROM      users u JOIN      comments c ON u.Id = c.UserId JOIN      badges b ON u.Id = b.UserId GROUP BY      u.Id, u.DisplayName, b.Name ORDER BY      COUNT(c.Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT     ((SUM(CASE WHEN YEAR(Date) = 2010 THEN 1 ELSE 0 END) / COUNT(*)) -       (SUM(CASE WHEN YEAR(Date) = 2011 THEN 1 ELSE 0 END) / COUNT(*))) * 100 AS PercentageDifference FROM badges WHERE Name = 'Student';	codebase_community
SELECT PostHistoryTypeId FROM postHistory WHERE PostId = 3720;  SELECT COUNT(DISTINCT UserId) FROM comments WHERE PostId = 3720;	codebase_community
SELECT p.* FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217;  SELECT ViewCount FROM posts WHERE Id = 61217;	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395;	codebase_community
SELECT posts.Id, posts.OwnerUserId FROM posts WHERE posts.Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount) AS TotalFavoriteCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Id = 686 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT AVG(u.UpVotes) + AVG(u.Age) AS AverageUpVotesAndAge FROM users u JOIN (     SELECT OwnerUserId     FROM posts     GROUP BY OwnerUserId     HAVING COUNT(*) > 10 ) p ON u.Id = p.OwnerUserId;	codebase_community
SELECT COUNT(DISTINCT badges.UserId)  FROM badges  WHERE badges.Name = 'Announcer';	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE Score > 60;	codebase_community
SELECT Text  FROM comments  WHERE CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(*) FROM posts WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT b.Date  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT      (SELECT COUNT(DISTINCT UserId)       FROM badges       WHERE Name = 'Teacher') / (SELECT COUNT(DISTINCT Id) FROM users) * 100 AS TeacherBadgePercentage	codebase_community
SELECT     ROUND(         (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 END) * 100.0) / COUNT(DISTINCT b.UserId),         2     ) AS Teenager_Percentage FROM     badges b JOIN     users u ON b.UserId = u.Id WHERE     b.Name = 'Organizer'	codebase_community
SELECT SUM(CASE WHEN v.VoteTypeId = 1 THEN 1 ELSE -1 END) AS RatingScore FROM posts p JOIN comments c ON p.Id = c.PostId JOIN votes v ON c.Id = v.PostId WHERE p.CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria' AND b.Name = 'Teacher';	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfAdultSupporters FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.Id, SUM(u.Views) as TotalViews FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0' GROUP BY u.Id;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Supporter' AND users.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Location = 'New York';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName, MAX(Views) AS HighestViews FROM users GROUP BY DisplayName ORDER BY HighestViews DESC LIMIT 1;	codebase_community
SELECT     (COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN Id END) / NULLIF(COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN Id END), 0)) AS VoteRatio FROM votes	codebase_community
SELECT TagName  FROM tags  JOIN posts ON tags.ExcerptPostId = posts.Id  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'John Stauffer';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo');	codebase_community
SELECT COUNT(v.Id) AS VoteCount FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT p.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT      (SELECT SUM(ViewCount)       FROM posts       WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky')) AS HarveyMotulskyViewCount,     (SELECT SUM(ViewCount)       FROM posts       WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Noah Snyder')) AS NoahSnyderViewCount WHERE      (SELECT SUM(ViewCount)       FROM posts       WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky')) >     (SELECT SUM(ViewCount)       FROM posts       WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Noah Snyder')) OR     (SELECT SUM(ViewCount)       FROM posts       WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky')) =      (SELECT SUM(ViewCount)       FROM posts       WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Noah Snyder'))	codebase_community
SELECT COUNT(p.Id) AS PostsWithMoreThanFourVotes FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND p.PostId > 4;	codebase_community
SELECT COUNT(*)  FROM comments  JOIN users ON comments.UserId = users.Id  WHERE users.DisplayName = 'Neil McGuigan' AND comments.Score < 60;	codebase_community
SELECT DISTINCT t.TagName FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND NOT EXISTS (     SELECT 1     FROM comments c     WHERE c.PostId = p.Id );	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer';	codebase_community
SELECT      CAST(COUNT(CASE WHEN p.PostTypeId = 2 THEN p.Id END AND t.TagName = 'r' AS INT) AS REAL) * 100 /      COUNT(CASE WHEN p.OwnerDisplayName = 'Community' THEN p.Id END) AS PercentageOfRPostsByCommunity FROM      posts p JOIN      tags t ON p.Id = t.ExcerptPostId WHERE      p.OwnerDisplayName = 'Community'	codebase_community
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName IN ('Mornington', 'Amos')	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE b.Name = 'Commentator' AND strftime('%Y', b.Date) = '2014';	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59';	codebase_community
SELECT u.DisplayName, u.Age FROM users u WHERE u.Id IN (     SELECT OwnerUserId     FROM posts     ORDER BY Views DESC     LIMIT 1 );	codebase_community
SELECT      p.LastEditDate,      p.LastEditorUserId  FROM      posts p  WHERE      p.Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT      c.Text AS Comment,      u.DisplayName AS CommentatorDisplayName,      p.Title AS PostTitle FROM      comments c JOIN      users u ON c.UserId = u.Id JOIN      posts p ON c.PostId = p.Id WHERE      c.Score > 60;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND YEAR(b.Date) = 2011;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150;	codebase_community
SELECT      COUNT(*) AS PostHistoryCount,      MAX(postHistory.CreationDate) AS LastEditDate FROM      postHistory JOIN      posts ON postHistory.PostId = posts.Id WHERE      posts.Title = 'What is the best introductory Bayesian statistics textbook?';	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers' ORDER BY u.LastAccessDate DESC;	codebase_community
SELECT      p.Title AS RelatedPostTitle FROM      posts p JOIN      postLinks pl ON p.Id = pl.PostId WHERE      p.Title = 'How to tell if something happened in a data set which monitors a value over time'     AND pl.RelatedPostId = p.Id;	codebase_community
SELECT p.Id, b.Name FROM badges b JOIN users u ON b.UserId = u.Id JOIN posts p ON b.UserId = p.OwnerUserId WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013;	codebase_community
SELECT p.OwnerDisplayName FROM posts p ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.Location FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN users u ON p.OwnerUserId = u.Id WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?';	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.ParentId IS NOT NULL AND p.Score = (SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL)	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8)	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT Id, DisplayName, MAX(Reputation) AS MaxReputation FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users) GROUP BY Id, DisplayName;	codebase_community
SELECT COUNT(*) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(p.CreationDate) = 2011 AND v.BountyAmount = 50	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT p.Score FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags) ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT AVG(CASE WHEN YEAR(CreationDate) = 2010 THEN COUNT(*) / 12 ELSE 0 END) AS avg_monthly_links FROM postLinks WHERE AnswerCount <= 2 GROUP BY MONTH(CreationDate);	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId AND v.UserId = 1465 WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts p2 JOIN votes v2 ON p2.Id = v2.PostId AND v2.UserId = 1465)	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks);	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(CreationDate)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.DisplayName = 'chl';	codebase_community
SELECT MIN(CreationDate)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users ORDER BY Age ASC LIMIT 1);	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(v.PostId) AS AveragePostsVotedByOldestUsers FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users);	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens')  AND YEAR(CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT AVG(posts.Score) AS AverageScore FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Stephen Turner';	codebase_community
SELECT DISTINCT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      (COUNT(CASE WHEN p.OwnerUserId IN (SELECT u.Id FROM users u WHERE u.Reputation > 1000) AND p.CreationDate BETWEEN '2011-01-01' AND '2011-12-31' THEN 1 END) * 100.0) / COUNT(p.Id) AS percentage FROM      posts p	codebase_community
SELECT      DIVIDE(COUNT(CASE WHEN users.Age BETWEEN 13 AND 18 THEN 1 END), COUNT(users.Id)) AS percentage FROM      users;	codebase_community
SELECT      p.ViewCount AS TotalViews,     u.DisplayName AS LastEditorDisplayName FROM      posts p JOIN      users u ON p.LastEditorUserId = u.Id WHERE      p.Title = 'Computer Game Datasets';	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT      u.DisplayName,      u.Location  FROM      users u  JOIN      posts p  ON      u.Id = p.LastEditorUserId  WHERE      p.Id = 183 ORDER BY      p.LastEditDate DESC  LIMIT 1;	codebase_community
SELECT Name, MAX(Date) as LatestBadgeDate FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett') GROUP BY UserId ORDER BY LatestBadgeDate DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT      u.CreationDate,     b.Date,     DATEDIFF(b.Date, u.CreationDate) AS TimeToGetBadge FROM      users u JOIN      badges b ON u.Id = b.UserId WHERE      u.DisplayName = 'Zolomon'	codebase_community
SELECT      u.Id AS UserId,      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = u.Id) AS PostCount,      (SELECT COUNT(*) FROM comments WHERE UserId = u.Id) AS CommentCount FROM      users u WHERE      u.CreationDate = (SELECT MAX(CreationDate) FROM users);	codebase_community
SELECT c.Text AS CommentText, u.DisplayName AS UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' AND c.CreationDate = (SELECT MAX(CreationDate) FROM comments WHERE PostId = p.Id) LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT badges.UserId)  FROM badges  WHERE badges.Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts WHERE EXISTS (     SELECT 1     FROM tags     WHERE posts.Id = tags.ExcerptPostId     AND tags.TagName = 'careers' );	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT     COALESCE(COUNT(c.Id), 0) AS CommentCount,     COALESCE(COUNT(a.Id), 0) AS AnswerCount FROM     posts p LEFT JOIN comments c ON p.Id = c.PostId AND p.Title = 'Clustering 1D data' LEFT JOIN posts a ON p.Id = a.ParentId AND p.Title = 'Clustering 1D data' WHERE     p.Title = 'Clustering 1D data'	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE PostTypeId = 1) AND BountyAmount >= 30;	codebase_community
SELECT      (COUNT(CASE WHEN posts.Score >= 50 THEN posts.Id END) * 100.0) / COUNT(posts.Id) AS percentage FROM      posts INNER JOIN      (SELECT MAX(Reputation) AS max_rep FROM users) AS top_rep_users ON      posts.OwnerUserId = top_rep_users.max_rep;	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How can I adapt ANOVA for binary data?'	codebase_community
SELECT MAX(c.Score), c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 GROUP BY c.PostId, c.Text ORDER BY MAX(c.Score) DESC LIMIT 1;	codebase_community
SELECT      c.CreationDate,      u.Age  FROM      comments c  JOIN      users u ON c.UserId = u.Id  WHERE      c.Text LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT p.Id) AS PostsWithLowViewCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id WHERE posts.CommentCount = 1 AND comments.Score IS NULL;	codebase_community
SELECT COUNT(DISTINCT u.Id) as TotalUsersAged40 FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id AS PostId, c.Text AS Comment FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'R is also lazy evaluated.'	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0	codebase_community
SELECT      ROUND(         (COUNT(CASE WHEN c.UserId IN (SELECT u.Id FROM users u WHERE u.UpVotes = 0) THEN 1 END) / COUNT(c.UserId)) * 100,         2     ) AS percentage FROM      comments c WHERE      c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT h.id)  FROM superhero h  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200;	superhero
SELECT superhero.full_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.full_name HAVING COUNT(hero_power.power_id) > 15;	superhero
SELECT COUNT(DISTINCT superhero.id) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT h.id)  FROM superhero h JOIN colour c ON h.eye_colour_id = c.id JOIN superpower sp ON sp.power_name = 'Agility' WHERE c.colour = 'Blue'  AND EXISTS (     SELECT 1      FROM hero_power hp      WHERE hp.hero_id = h.id      AND hp.power_id = (SELECT id FROM superpower WHERE power_name = 'Agility') );	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Blond';	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero.full_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' ORDER BY superhero.height_cm DESC LIMIT 1;	superhero
SELECT publisher_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero_name = 'Sauron';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' AND superhero.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT AVG(height_cm)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT      ROUND(         (SUM(CASE WHEN sp.power_name = 'Super Strength' THEN 1 ELSE 0 END) / COUNT(hs.id)) * 100,         2     ) AS percentage_with_super_strength FROM      superhero hs JOIN      hero_power hp ON hs.id = hp.hero_id JOIN      superpower sp ON hp.power_id = sp.id WHERE      hs.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Gold') AND publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond';	superhero
SELECT superhero_name, full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Intelligence' ORDER BY attribute_value LIMIT 1;	superhero
SELECT race FROM superhero WHERE superhero_name = 'Copycat';	superhero
SELECT COUNT(hs.id) FROM superhero hs JOIN hero_attribute ha ON hs.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch';	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name ORDER BY COUNT(power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT      ROUND(         (COUNT(CASE WHEN s.alignment_id = 2 THEN 1 END) * 100.0) / COUNT(*),          2     ) AS percentage_bad_alignment,     COUNT(CASE WHEN s.alignment_id = 2 THEN 1 END) AS count_bad_alignment_marvel FROM      superhero s WHERE      s.alignment_id = 2 AND     s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) -      (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference	superhero
SELECT id  FROM publisher  WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value)  FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg)  FROM superhero  WHERE gender_id = 2;	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id JOIN gender AS g ON s.gender_id = g.id WHERE g.gender = 'Male' GROUP BY sp.power_name ORDER BY COUNT(sp.power_name) DESC LIMIT 5;	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IS NULL;	superhero
SELECT power_name  FROM superpower  JOIN hero_power ON superpower.id = hero_power.power_id  WHERE hero_power.hero_id = 56;	superhero
SELECT superhero.full_name FROM superhero WHERE superhero.race_id = (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 169;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.hair_colour_id = c.id  WHERE s.race_id = (SELECT id FROM race WHERE race = 'human') AND s.height_cm = 185;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT     ROUND(         (SUM(CASE WHEN s.publisher_id = 13 THEN 1 ELSE 0 END) * 100.0) / COUNT(*),         2     ) AS percentage_marvel_heroes FROM superhero s WHERE s.height_cm BETWEEN 150 AND 180;	superhero
SELECT superhero.full_name FROM superhero WHERE superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Male') AND superhero.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT sp.power_name, COUNT(hp.power_id) AS power_count FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id GROUP BY sp.power_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(DISTINCT h.id) FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'stealth';	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (     SELECT MAX(ha2.attribute_value)     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Strength' )	superhero
SELECT AVG(COUNT(superhero.id)) / SUM(skin_colour_id = 1) FROM superhero WHERE skin_colour_id IS NULL OR skin_colour_id != 1;	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE attribute_name = 'Durability' AND publisher_name = 'Dark Horse Comics' ORDER BY attribute_value DESC LIMIT 1;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE power_name = 'Flight';	superhero
SELECT s.superhero_name, c.eye_colour, c.hair_colour, c.skin_colour FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id JOIN colour c ON s.eye_colour_id = c.id JOIN colour h ON s.hair_colour_id = h.id JOIN colour sk ON s.skin_colour_id = sk.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT      s.superhero_name,      p.publisher_name FROM      superhero s JOIN      colour c_hair ON s.hair_colour_id = c_hair.id JOIN      colour c_skin ON s.skin_colour_id = c_skin.id JOIN      colour c_eye ON s.eye_colour_id = c_eye.id JOIN      publisher p ON s.publisher_id = p.id WHERE      c_hair.colour = c_skin.colour AND      c_hair.colour = c_eye.colour;	superhero
SELECT r.race FROM superhero AS s JOIN race AS r ON s.race_id = r.id WHERE s.superhero_name = 'A-Bomb';	superhero
SELECT     ROUND((SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT s.id), 2) AS blue_female_percentage FROM     superhero s JOIN     colour c ON s.skin_colour_id = c.id WHERE     s.gender_id = (SELECT id FROM gender WHERE gender = 'Female');	superhero
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT g.gender FROM superhero AS s JOIN gender AS g ON s.gender_id = g.id WHERE s.superhero_name = 'Agent 13';	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Adaptation';	superhero
SELECT COUNT(*) AS num_powers FROM hero_power JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = 'Amazo';	superhero
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Black' AND hair_colour.colour = 'Black';	superhero
SELECT superhero_name, colour.colour AS eye_colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.skin_colour_id = (SELECT id FROM colour WHERE colour = 'Gold');	superhero
SELECT superhero.full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT superhero_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral';	superhero
SELECT COUNT(*) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Strength' );	superhero
SELECT s.race_id, a.alignment FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT      ROUND((SUM(CASE WHEN s.gender_id = g.id THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS female_heroes_percentage FROM      superhero s JOIN      gender g ON s.gender_id = g.id WHERE      s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT AVG(weight_kg) AS average_weight FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT      (SUM(CASE WHEN s.full_name = 'Emil Blonsky' THEN s.weight_kg ELSE 0 END) -      SUM(CASE WHEN s.full_name = 'Charles Chandler' THEN s.weight_kg ELSE 0 END)) AS weight_difference FROM superhero s;	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed' ORDER BY attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Brown';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IS NULL OR publisher_id = 1;	superhero
SELECT ROUND((SUM(CASE WHEN eye_colour_id = 7 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS blue_eyes_percentage FROM superhero;	superhero
SELECT     (SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END), 0)) AS male_female_ratio FROM superhero;	superhero
SELECT superhero_name, MAX(height_cm) as tallest_height FROM superhero ORDER BY tallest_height DESC LIMIT 1;	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT superhero_name, full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr';	superhero
SELECT race FROM superhero WHERE weight_kg = 108 AND height_cm = 188 AND race_id IS NOT NULL;	superhero
SELECT p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.id = 38;	superhero
SELECT s.race_id, r.race FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN (     SELECT hero_id, MAX(attribute_value) as max_value     FROM hero_attribute     GROUP BY hero_id ) ha_max ON ha.hero_id = ha_max.hero_id AND ha.attribute_value = ha_max.max_value JOIN race r ON s.race_id = r.id ORDER BY ha_max.max_value DESC LIMIT 1;	superhero
SELECT a.alignment, sp.power_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(attribute_value)  FROM hero_attribute  JOIN superhero ON hero_attribute.hero_id = superhero.id  WHERE superhero.alignment_id = 3;	superhero
SELECT s.full_name, c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = 100 GROUP BY s.full_name, c.colour;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 1 AND gender_id = 2;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value BETWEEN 75 AND 80;	superhero
SELECT s.superhero_name, r.race FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN race r ON s.race_id = r.id JOIN colour h ON s.hair_colour_id = h.id WHERE h.colour = 'blue' AND g.gender = 'male';	superhero
SELECT      (COUNT(CASE WHEN gender.id = 2 THEN 1 END) * 100.0) / COUNT(*)  FROM superhero  WHERE alignment_id = 2;	superhero
SELECT     (         (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 7 AND weight_kg IS NULL OR weight_kg = 0)         -         (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 1 AND weight_kg IS NULL OR weight_kg = 0)     ) AS blue_eyes_no_eye_color_difference FROM     superhero;	superhero
SELECT hero_attribute.attribute_value FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE attribute.attribute_name = 'Strength' AND superhero.superhero_name = 'Hulk';	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad')  AND skin_colour_id = (SELECT id FROM colour WHERE colour = 'Green');	superhero
SELECT COUNT(*) FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE gender.gender = 'Female' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero_name ASC;	superhero
SELECT s.gender_id FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name, MAX(weight_kg) as max_weight FROM superhero WHERE publisher_name = 'DC Comics' GROUP BY superhero_name ORDER BY max_weight DESC LIMIT 1;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE race <> 'Human' AND publisher_name = 'Dark Horse Comics';	superhero
SELECT superhero_name, full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed' AND attribute_value = 100 ORDER BY superhero.height_cm DESC, superhero.weight_kg ASC LIMIT 1;	superhero
SELECT      (SELECT COUNT(*)       FROM superhero       WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) -      (SELECT COUNT(*)       FROM superhero       WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS difference;	superhero
SELECT a.attribute_name FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Black Panther' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT superhero_name, MAX(height_cm) AS tallest_height FROM superhero WHERE height_cm IS NOT NULL ORDER BY tallest_height DESC LIMIT 1;	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT      ROUND((SUM(CASE WHEN s.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND p.publisher_name = 'George Lucas' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_female FROM superhero s JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT      ROUND((SUM(CASE WHEN alignment.alignment = 'Good' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS good_superhero_percentage FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id FROM hero_attribute ORDER BY attribute_value LIMIT 1;	superhero
SELECT superhero.full_name FROM superhero WHERE superhero_name = 'Alien';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.weight_kg < 100 AND colour.colour = 'Brown';	superhero
SELECT ha.attribute_value FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT weight_kg, race FROM superhero WHERE id = 40;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT DISTINCT h.id FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN attribute a ON h.alignment_id = a.id WHERE a.attribute_name = 'Intelligence' AND sp.power_name = 'Intelligence';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 18 AND q.q1 IS NOT NULL GROUP BY d.driverId HAVING COUNT(q.q1) = 5 ORDER BY MAX(q.q1) DESC LIMIT 5;	formula_1
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.round = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = r.raceId)	formula_1
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Shanghai International Circuit';	formula_1
SELECT url FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya');	formula_1
SELECT r.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'Germany';	formula_1
SELECT r.name, ds.position FROM circuits c JOIN races ra ON c.circuitId = ra.circuitId JOIN constructorStandings cs ON ra.raceId = cs.raceId JOIN constructors co ON cs.constructorId = co.constructorId JOIN drivers d ON cs.constructorId = d.constructorId JOIN driverStandings ds ON d.driverId = ds.driverId WHERE co.name = 'Renault';	formula_1
SELECT COUNT(*) FROM races WHERE year = 2010 AND circuitId NOT IN (     SELECT circuitId     FROM circuits     WHERE country IN ('Malaysia', 'Bahrain', 'Turkey', 'Monaco', 'Spain') )	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain';	formula_1
SELECT lat, lng  FROM circuits  WHERE name = 'Australian Grand Prix';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Abu Dhabi Grand Prix';	formula_1
SELECT constructors.nationality FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId JOIN races ON races.raceId = constructorResults.raceId WHERE constructorResults.points = 1 AND races.raceId = 24;	formula_1
SELECT q1 FROM qualifying JOIN drivers ON qualifying.driverId = drivers.driverId WHERE drivers.surname = 'Senna' AND drivers.forename = 'Bruno' AND qualifying.raceId = (SELECT raceId FROM races WHERE year = 2011 AND round = 1);	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '0:01:40' AND q.raceId = 355;	formula_1
SELECT q.driverId, d.number FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = (SELECT raceId FROM races WHERE raceId = 903 AND position = 3) AND q.q3 = '0:01:54';	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Bahrain Grand Prix'  AND ra.year = 2007  AND r.statusId NOT IN (SELECT statusId FROM status WHERE status = 'Finished')	formula_1
SELECT s.year FROM races AS r JOIN seasons AS s ON r.year = s.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results JOIN races ON results.raceId = races.raceId WHERE races.date = '2015-11-29' AND results.statusId NOT IN (SELECT statusId FROM status WHERE status = 'Not Started' OR status = 'Retired' OR status = 'Did Not Start');	formula_1
SELECT      d.driverRef,      d.surname,      d.forename,      d.dob  FROM      drivers d  JOIN      results r ON d.driverId = r.driverId  JOIN      races ra ON r.raceId = ra.raceId  WHERE      ra.raceId = 592 AND      r.time IS NOT NULL AND      d.dob = (SELECT MIN(dob) FROM drivers d2 JOIN results r2 ON d2.driverId = r2.driverId JOIN races ra2 ON r2.raceId = ra2.raceId WHERE ra2.raceId = 592 AND r2.time IS NOT NULL)	formula_1
SELECT d.driverRef, d.url FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE lt.milliseconds = 8727 AND r.raceId = 161;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN qualifying q ON r.raceId = q.raceId AND r.driverId = q.driverId WHERE q.fastestLap = (SELECT MAX(fastestLapSpeed) FROM qualifying WHERE raceId = q.raceId) AND r.raceId = 933;	formula_1
SELECT location, lat, lng FROM circuits WHERE name = 'Sepang International Circuit';	formula_1
SELECT constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId JOIN races ON races.raceId = constructorStandings.raceId WHERE races.raceId = 9 ORDER BY constructorStandings.points DESC LIMIT 1;	formula_1
SELECT q1 FROM qualifying JOIN drivers ON drivers.driverId = qualifying.driverId WHERE drivers.surname = 'di Grassi' AND qualifying.raceId = (SELECT raceId FROM races WHERE year = 2020 AND round = 345);	formula_1
SELECT drivers.nationality FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId JOIN races ON qualifying.raceId = races.raceId WHERE races.raceId = 347 AND qualifying.q2 = '0:01:15';	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 45 AND q.q3 = '0:01:33';	formula_1
SELECT r.time FROM results AS res JOIN drivers AS d ON res.driverId = d.driverId JOIN drivers AS d2 ON d2.driverRef = 'Bruce_McLaren' JOIN races AS r ON res.raceId = r.raceId AND r.raceId = 743 WHERE d.surname = 'McLaren' AND d.forename = 'Bruce';	formula_1
SELECT      d.driverId,      d.surname,      d.forename,      c.name AS constructor_name,      r.positionText FROM      results r JOIN      drivers d ON r.driverId = d.driverId JOIN      constructors c ON r.constructorId = c.constructorId JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.name = 'San Marino Grand Prix'      AND ra.year = 2006      AND r.position = 2;	formula_1
SELECT seasons.year, seasons.url FROM seasons JOIN races ON seasons.year = races.year WHERE races.raceId = 901;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM results r JOIN driverStandings ds ON r.driverId = ds.driverId JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.date = '2015-11-29' AND ds.position > 0 AND r.statusId NOT IN (     SELECT statusId     FROM status     WHERE status = 'Not Classified'     OR status = 'Retired'     OR status = 'Did Not Start'     OR status = 'Did Not Qualify'     OR status = 'Disqualified' );	formula_1
SELECT d.driverRef, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.milliseconds IS NOT NULL ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT d.forename || ' ' || d.surname AS fullName FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.raceId = 348 AND lt.time = (SELECT MIN(time) FROM lapTimes lt2 JOIN races r2 ON lt2.raceId = r2.raceId WHERE r2.raceId = 348)	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN (     SELECT raceId, MAX(fastestLapSpeed) as maxSpeed     FROM results     WHERE fastestLap IS NOT NULL     GROUP BY raceId ) AS fastestLapSpeeds ON r.raceId = fastestLapSpeeds.raceId AND r.fastestLap = fastestLapSpeeds.maxSpeed WHERE r.resultId = (     SELECT MAX(resultId)     FROM results     WHERE raceId = fastestLapSpeeds.raceId AND fastestLap IS NOT NULL );	formula_1
SELECT     (SUBSTR fastestLapTime(raceId = 853), SUBSTR fastestLapTime(raceId = 854), fastestLapTime(raceId = 853)) * 100 / fastestLapTime(raceId = 853) AS percentage FROM races WHERE raceId = 853 OR raceId = 854;	formula_1
SELECT      (COUNT(DISTINCT d.driverId)      / COUNT(DISTINCT r.driverId)) * 100 AS completionRate FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.date = '1983-07-16'      AND r.statusId != (SELECT statusId FROM status WHERE status = 'Retired');	formula_1
SELECT MIN(year) as first_Singapore_Grand_Prix_year FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*) AS total_races, r.name FROM races r JOIN seasons s ON r.year = s.year WHERE s.year = 2005 GROUP BY r.name ORDER BY r.name DESC;	formula_1
SELECT r.name AS RaceName, r.date FROM races r WHERE r.year = (     SELECT MIN(year)     FROM races     WHERE EXTRACT(YEAR FROM r.date) = EXTRACT(YEAR FROM MIN(date)) ) AND EXTRACT(MONTH FROM r.date) = EXTRACT(MONTH FROM MIN(date)) ORDER BY r.date;	formula_1
SELECT r.name, r.date FROM races r JOIN (     SELECT year, MAX(round) as max_round     FROM races     WHERE year = 1999     GROUP BY year ) AS last_round ON r.year = last_round.year AND r.round = last_round.max_round;	formula_1
SELECT seasons.year, COUNT(races.year) AS total_races FROM seasons JOIN races ON seasons.year = races.year GROUP BY seasons.year ORDER BY total_races DESC LIMIT 1;	formula_1
SELECT DISTINCT r.name FROM races r WHERE r.year = 2017 AND r.circuitId NOT IN (     SELECT c.circuitId     FROM circuits c     JOIN races r2 ON c.circuitId = r2.circuitId     WHERE r2.year = 2000 );	formula_1
SELECT c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.year = (SELECT MIN(year) FROM seasons WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Spain')) AND c.country = 'Spain';	formula_1
SELECT MAX(seasons.year) AS lastSeason FROM seasons JOIN races ON seasons.year = races.year JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Brands Hatch';	formula_1
SELECT COUNT(DISTINCT r.year)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Silverstone Circuit' AND r.name = 'British Grand Prix';	formula_1
SELECT d.forename, d.surname, ds.position FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2010 AND r.name = 'Singapore Grand Prix' ORDER BY ds.position;	formula_1
SELECT d.forename, d.surname, MAX(dr.points) as max_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN (     SELECT driverId, SUM(points) as total_points     FROM driverStandings     GROUP BY driverId ) dr ON d.driverId = dr.driverId GROUP BY d.driverId ORDER BY max_points DESC LIMIT 1;	formula_1
SELECT d.surname, d.forename, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3;	formula_1
SELECT d.surname AS Driver, r.name AS RaceName, lt.time AS LapTime FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes ) ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(milliseconds) AS average_lap_time FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE drivers.surname = 'Vettel' AND races.year = 2009 AND races.name = 'Chinese Grand Prix';	formula_1
SELECT      (COUNT(CASE WHEN d.surname = 'Hamilton' AND r.position > 1 THEN r.raceId END) * 100.0) /      COUNT(CASE WHEN d.surname = 'Hamilton' THEN r.raceId END) AS percentage FROM      results r JOIN      drivers d ON r.driverId = d.driverId WHERE      r.year >= 2010;	formula_1
SELECT d.surname, d.nationality, AVG(rs.points) AS average_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN results rs ON d.driverId = rs.driverId WHERE rs.wins = (SELECT MAX(wins) FROM driverStandings) GROUP BY d.driverId ORDER BY average_points DESC LIMIT 1;	formula_1
SELECT MIN(dob), d.surname, d.forename FROM drivers d WHERE d.nationality = 'Japanese' ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT c.name, COUNT(r.raceId) AS race_count FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.circuitId HAVING COUNT(r.raceId) = 4;	formula_1
SELECT c.name, c.location, r.name AS raceName FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE c.country = 'USA' AND s.year = 2006;	formula_1
SELECT r.name AS RaceName, c.name AS CircuitName, c.location AS CircuitLocation FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE strftime('%m', r.date) = '09' AND strftime('%Y', r.date) = '2005';	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Yoong' AND d.forename = 'Alex' AND res.position < 10;	formula_1
SELECT COUNT(DISTINCT r.raceId) FROM races r JOIN constructorStandings cs ON r.raceId = cs.raceId JOIN constructors c ON cs.constructorId = c.constructorId JOIN drivers d ON c.constructorId = d.constructorId WHERE d.surname = 'Schumacher' AND r.circuitId = (     SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit' ) AND cs.points = (     SELECT MAX(points) FROM constructorStandings cs2     JOIN races r2 ON cs2.raceId = r2.raceId     WHERE r2.circuitId = (         SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit'     ) );	formula_1
SELECT r.name AS race_name, r.year AS race_year FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Schumacher' AND res.milliseconds = (     SELECT MIN(milliseconds)     FROM results     WHERE driverId = d.driverId )	formula_1
SELECT AVG(points) FROM driverStandings JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.surname = 'Irvine' AND driverStandings.year = 2000;	formula_1
SELECT      r.name AS RaceName,      rs.points FROM      driverStandings ds JOIN      races r ON ds.raceId = r.raceId JOIN      drivers d ON ds.driverId = d.driverId JOIN      constructorStandings cs ON ds.raceId = cs.raceId AND ds.constructorId = cs.constructorId JOIN      constructors c ON cs.constructorId = c.constructorId WHERE      d.surname = 'Hamilton'      AND d.forename = 'Lewis' ORDER BY      r.year LIMIT 1;	formula_1
SELECT r.name, c.country, r.date FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId JOIN seasons AS s ON r.year = s.year WHERE s.year = 2017 ORDER BY r.date;	formula_1
SELECT      r.name AS race_name,      s.year AS race_year,      c.location AS circuit_location,      MAX(r.laps) AS most_laps FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId JOIN      (SELECT           raceId,           COUNT(*) AS laps       FROM           lapTimes       GROUP BY           raceId) AS lt ON r.raceId = lt.raceId JOIN      seasons s ON r.year = s.year WHERE      r.laps = lt.laps ORDER BY      most_laps DESC LIMIT 1;	formula_1
SELECT      (COUNT(CASE WHEN c.name = 'Germany' THEN 1 END) * 100.0) / COUNT(*) AS percentage_germany FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId WHERE      r.name = 'European Grand Prix' AND      c.country = 'Germany';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT name, lat FROM circuits WHERE circuitRef IN ('silverstone', 'hockenheimring', 'hungaroring') ORDER BY lat DESC LIMIT 1;	formula_1
SELECT circuitRef  FROM circuits  WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT c.country FROM circuits c WHERE c.alt = (SELECT MAX(alt) FROM circuits);	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT d.nationality FROM drivers d WHERE d.dob = (SELECT MIN(dob) FROM drivers);	formula_1
SELECT surname  FROM drivers  WHERE nationality = 'italian';	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE surname = 'Hamilton';	formula_1
SELECT circuits.name  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  JOIN seasons ON races.year = seasons.year  WHERE seasons.url = 'http://en.wikipedia.org/wiki/2009_FIA_Formula_One_World_Championship'  AND circuits.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT DISTINCT s.year FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT      r.raceId,      r.year,      r.round,      c.name AS circuitName,      c.url AS circuitUrl,      r.name AS raceName,      r.date,      r.time FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId WHERE      c.circuitRef = 'silverstone';	formula_1
SELECT r.date, r.time FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND c.name = 'Abu Dhabi Circuit';	formula_1
SELECT COUNT(DISTINCT races.raceId)  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Italy';	formula_1
SELECT DISTINCT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya' AND circuitRef = 'catalunya' AND EXISTS (     SELECT 1     FROM races     WHERE races.circuitId = circuits.circuitId     AND year = 2009 )	formula_1
SELECT MIN(fastestLapTime) AS fastestLapTime FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' AND fastestLap IS NOT NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId JOIN (     SELECT raceId, MAX(fastestLapSpeed) as maxSpeed     FROM results     WHERE fastestLapSpeed IS NOT NULL     GROUP BY raceId ) as maxSpeedRaces ON ra.raceId = maxSpeedRaces.raceId JOIN results fastest ON r.raceId = maxSpeedRaces.raceId AND r.fastestLapSpeed = maxSpeedRaces.maxSpeed WHERE r.driverId = d.driverId;	formula_1
SELECT d.driverRef FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId JOIN seasons s ON r.year = s.year WHERE s.url = 'http://en.wikipedia.org/wiki/2008_Australian_Grand_Prix' AND ds.position = 1 AND d.driverRef IS NOT NULL;	formula_1
SELECT r.name, r.date FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Hamilton' AND d.forename = 'Lewis';	formula_1
SELECT r.name AS race_name, d.surname AS driver_surname, MIN(r.rank) AS min_rank FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Hamilton' AND r.rank IS NOT NULL GROUP BY r.name ORDER BY min_rank DESC LIMIT 1;	formula_1
SELECT MAX(fastestLapSpeed) as fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT s.year FROM seasons s JOIN races r ON s.year = r.year JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Hamilton' AND d.forename = 'Lewis';	formula_1
SELECT r.rank FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.surname = 'Hamilton' AND ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.positionOrder = (     SELECT MAX(positionOrder)     FROM results     WHERE driverId = d.driverId AND raceId = r.raceId );	formula_1
SELECT d.forename, d.surname FROM results AS r JOIN drivers AS d ON r.driverId = d.driverId WHERE r.grid = 4 AND r.raceId IN (     SELECT raceId     FROM races     WHERE year = 2008 AND name = 'Australian Grand Prix' );	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.time IS NOT NULL;	formula_1
SELECT fastestLap, fastestLapTime, fastestLapSpeed FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.surname = 'Hamilton' AND drivers.forename = 'Lewis' AND races.year = 2008 AND races.name = 'Australian Grand Prix';	formula_1
SELECT r.time FROM results r JOIN driverStandings ds ON r.driverId = ds.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND ds.position = 2;	formula_1
SELECT d.surname, d.forename, d.url FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND s.status = 'Finished' AND r.position = 1 AND r.time LIKE 'HH:%';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE d.nationality = 'American' AND r.year = 2008 AND r.name = 'Australian Grand Prix';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.position IS NOT NULL;	formula_1
SELECT SUM(points) AS total_points FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' AND drivers.forename = 'Lewis';	formula_1
SELECT AVG(TIME_TO_SEC(fastestLapTime)) AS averageFastestLapTimeInSeconds FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' AND drivers.forename = 'Lewis';	formula_1
SELECT     (COUNT(CASE WHEN r.position IS NOT NULL THEN r.raceId END) * 1.0) / COUNT(r.raceId) AS completion_rate FROM races r WHERE r.year = 2008 AND r.name = 'Australian Grand Prix';	formula_1
SELECT      ((         (LEAST(CASE WHEN r1.milliseconds IS NULL THEN 0 ELSE r1.milliseconds END,                   GREATEST(CASE WHEN r2.milliseconds IS NULL THEN 0 ELSE r2.milliseconds END) -                   GREATEST(r1.milliseconds, 0))          / GREATEST(CASE WHEN r2.milliseconds IS NULL THEN 0 ELSE r2.milliseconds END)     ) * 100) AS percentage_faster FROM      results r1 JOIN      results r2 ON      r1.raceId = r2.raceId AND r1.positionOrder = 1 AND r2.positionOrder = (SELECT MAX(positionOrder) FROM results WHERE raceId = r1.raceId AND positionOrder > 1) WHERE      r1.year = 2008 AND r1.raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008)	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-01-01';	formula_1
SELECT AVG(points) AS average_points FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE c.nationality = 'British';	formula_1
SELECT c.name AS ConstructorName, SUM(cr.points) AS TotalPoints FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId GROUP BY c.name ORDER BY TotalPoints DESC LIMIT 1;	formula_1
SELECT constructors.name FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId JOIN races ON constructorStandings.raceId = races.raceId WHERE races.raceId = 291 AND constructorStandings.points = 0;	formula_1
SELECT COUNT(DISTINCT c.constructorId) FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'Japanese' AND cs.points = 0 AND COUNT(DISTINCT cs.raceId) = 2;	formula_1
SELECT c.name AS constructor_name FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT c.constructorId) FROM constructors AS c JOIN driverStandings AS ds ON c.constructorId = ds.constructorId JOIN drivers AS d ON d.driverId = ds.driverId JOIN lapTimes AS lt ON d.driverId = lt.driverId WHERE c.nationality = 'French' AND lt.lap > 50;	formula_1
SELECT      (COUNT(DISTINCT d.driverId)      / (SELECT COUNT(DISTINCT d.driverId)         FROM drivers d         INNER JOIN driverStandings ds ON d.driverId = ds.driverId         INNER JOIN races r ON ds.raceId = r.raceId         WHERE r.year BETWEEN 2007 AND 2009 AND d.nationality = 'Japanese')) * 100 AS completion_percentage FROM drivers d  INNER JOIN driverStandings ds ON d.driverId = ds.driverId  INNER JOIN races r ON ds.raceId = r.raceId  WHERE r.year BETWEEN 2007 AND 2009 AND d.nationality = 'Japanese' AND ds.time IS NOT NULL;	formula_1
SELECT     r.year,     AVG(UNIX_TIMESTAMP(time, 'HH:MM:SS.mmm') / 1000) AS avg_time_seconds FROM     results r JOIN     (SELECT         raceId,         MAX(points) AS max_points      FROM         results      WHERE         positionText = '1' AND         time IS NOT NULL      GROUP BY         raceId) AS top_races ON     r.raceId = top_races.raceId WHERE     r.positionText = '1' AND     r.time IS NOT NULL GROUP BY     r.year;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.dob > '1975-01-01' AND ds.position = 2;	formula_1
SELECT      d.driverId,      d.forename,      d.surname,      d.nationality,      r.name AS raceName FROM      drivers d JOIN      results r ON d.driverId = r.driverId WHERE      d.nationality = 'Italian' AND      r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes );	formula_1
SELECT lt.raceId, lt.lap FROM lapTimes lt JOIN results r ON lt.driverId = r.driverId JOIN drivers d ON r.driverId = d.driverId JOIN constructorStandings cs ON r.constructorId = cs.constructorId JOIN (     SELECT raceId, MAX(points) AS max_points     FROM constructorStandings     WHERE year = 2009     GROUP BY raceId ) AS cs_max ON cs.raceId = cs_max.raceId AND cs.points = cs_max.max_points WHERE r.year = 2009 ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(fastestLapSpeed) as average_speed FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix' AND results.year = 2009;	formula_1
SELECT r.name, r.year FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.milliseconds IS NOT NULL AND res.milliseconds = (     SELECT MIN(milliseconds)     FROM results     WHERE milliseconds IS NOT NULL ) ORDER BY r.name, r.year;	formula_1
SELECT      ROUND((COUNT(CASE WHEN d.dob < '1985-01-01' AND lt.lap > 50 THEN d.driverId END) * 100.0) /            (COUNT(DISTINCT d.driverId)), 2) AS percentage_of_drivers FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId JOIN      races r ON lt.raceId = r.raceId WHERE      r.year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(DISTINCT d.driverId) AS french_drivers_with_laptime_less_than_02 FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN drivers nationality ON d.driverRef = nationality.driverRef WHERE nationality.nationality = 'France' AND lt.milliseconds < 60000;	formula_1
SELECT code FROM drivers WHERE nationality = 'America';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;	formula_1
SELECT d.code, d.number, MIN(YEAR(CURRENT_DATE) - YEAR(d.dob)) AS age FROM drivers d WHERE d.nationality = 'Dutch' GROUP BY d.driverId ORDER BY age ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'Australia' AND SUBSTR(dob, 1, 4) = '1980';	formula_1
SELECT      d.driverRef,      d.surname,      d.forename,      MIN(lt.time) AS earliestLapTime FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId WHERE      d.nationality = 'German'      AND d.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY      d.driverRef, d.surname, d.forename ORDER BY      earliestLapTime ASC LIMIT 3;	formula_1
SELECT d.driverRef FROM drivers d WHERE d.nationality = 'Germany' ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId JOIN lapTimes lt ON r.raceId = lt.raceId AND d.driverId = lt.driverId WHERE d.dob = '1971-01-01' AND lt.fastestLap = 1	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN (     SELECT driverId, MAX(milliseconds) as max_time     FROM lapTimes     GROUP BY driverId ) lt ON d.driverId = lt.driverId JOIN constructors c ON d.constructorId = c.constructorId JOIN circuits cir ON c.circuitId = cir.circuitId WHERE d.nationality = 'Spain' AND d.dob < '1982-01-01' AND cir.country = 'Spain' ORDER BY lt.max_time LIMIT 10;	formula_1
SELECT DISTINCT r.year  FROM races r  JOIN results res ON r.raceId = res.raceId  WHERE res.fastestLap IS NOT NULL  ORDER BY res.fastestLapTime ASC  LIMIT 1;	formula_1
SELECT races.year, MAX(lapTimes.time) as max_time FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId GROUP BY races.year ORDER BY max_time ASC LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY milliseconds ASC LIMIT 5;	formula_1
SELECT COUNT(DISTINCT r.driverId) AS disqualifiedFinishers FROM results r JOIN status s ON r.statusId = s.statusId WHERE r.raceId > 50 AND r.raceId < 100 AND r.time IS NOT NULL AND s.status = 'Disqualified';	formula_1
SELECT c.name, c.location, c.lat, c.lng, COUNT(r.circuitId) as race_count FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'Austria' GROUP BY c.circuitId	formula_1
SELECT races.round, COUNT(DISTINCT results.resultId) AS finishers_count FROM races JOIN results ON races.raceId = results.raceId WHERE results.time IS NOT NULL GROUP BY races.round ORDER BY finishers_count DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
SELECT r.year, c.name, r.date, r.time FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId JOIN constructors con ON q.constructorId = con.constructorId JOIN (     SELECT MIN(year(dob)) AS min_dob     FROM drivers ) AS min_dob_year ON d.dob = min_dob_year.min_dob WHERE d.driverRef = 'MAX' ORDER BY r.year ASC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN status s ON r.statusId = s.statusId  WHERE d.nationality = 'American' AND s.status = 'Disqualified';	formula_1
SELECT      constructors.name AS constructor_name,      constructors.url AS introduction_website,      SUM(constructorStandings.points) AS total_points FROM      constructors JOIN      constructorStandings ON constructors.constructorId = constructorStandings.constructorId WHERE      constructors.nationality = 'Italian' GROUP BY      constructors.constructorId ORDER BY      total_points DESC LIMIT 1;	formula_1
SELECT constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId WHERE constructorStandings.wins = (     SELECT MAX(wins)     FROM constructorStandings ) GROUP BY constructors.url ORDER BY COUNT(constructorStandings.constructorId) DESC LIMIT 1;	formula_1
SELECT d.driverId, d.forename, d.surname, lt.position, lt.time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 ORDER BY lt.milliseconds DESC LIMIT 1;	formula_1
SELECT r.name, MIN(lt.milliseconds) AS fastestLapTime FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId WHERE lt.position = 1 GROUP BY lt.raceId, r.name ORDER BY fastestLapTime LIMIT 1;	formula_1
SELECT AVG(l fastestLapTime) FROM results JOIN lapTimes ON results.raceId = lapTimes.raceId AND results.driverId = lapTimes.driverId JOIN races ON results.raceId = races.raceId JOIN driverStandings ON results.driverId = driverStandings.driverId WHERE races.year = 2006 AND races.name = 'United States Grand Prix' AND driverStandings.rank < 11;	formula_1
SELECT d.driverId, d.surname, d.forename, AVG(p.duration) AS avg_pit_stop_duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverId, d.surname, d.forename ORDER BY avg_pit_stop_duration ASC LIMIT 5;	formula_1
SELECT      d.surname,      d.forename,      r.positionText,      r.time FROM      results AS r JOIN      drivers AS d ON r.driverId = d.driverId JOIN      races AS ra ON r.raceId = ra.raceId WHERE      ra.name = 'Canadian Grand Prix' AND      ra.year = 2008 AND      r.positionText = '1' AND      r.time LIKE '%:%:%.%';	formula_1
SELECT constructors.constructorRef, constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId JOIN races ON races.raceId = constructorStandings.raceId WHERE races.year = 2009 AND races.name = 'Singapore Grand Prix' AND constructorStandings.position = 1 ORDER BY constructors.constructorRef LIMIT 1;	formula_1
SELECT d.forename, d.surname, d.dob FROM drivers d WHERE d.nationality = 'Austrian' AND d.dob BETWEEN '1981-01-01' AND '1991-12-31';	formula_1
SELECT      d.forename || ' ' || d.surname AS fullName,      d.url AS wikiPageLink,      d.dob AS dateOfBirth FROM      drivers d WHERE      d.nationality = 'German' AND     d.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY      d.dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE circuitRef = 'hungaroring';	formula_1
SELECT      c.name AS constructor_name,      c.nationality AS constructor_nationality,      SUM(cr.points) AS total_points FROM      constructorStandings cs JOIN      races r ON cs.raceId = r.raceId JOIN      constructors c ON cs.constructorId = c.constructorId JOIN      circuits ct ON r.circuitId = ct.circuitId WHERE      ct.circuitRef = 'monaco'     AND r.year BETWEEN 1980 AND 2010 GROUP BY      c.constructorId ORDER BY      total_points DESC LIMIT 1;	formula_1
SELECT AVG(points) AS average_score FROM results JOIN races ON results.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' AND circuits.country = 'Turkey';	formula_1
SELECT AVG(COUNT(raceId)) AS average_races_per_year FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY year;	formula_1
SELECT nationality, COUNT(*) as count FROM drivers GROUP BY nationality ORDER BY count DESC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT rs.driverId) AS victories_count FROM results rs JOIN driverStandings ds ON rs.driverId = ds.driverId WHERE ds.positionText = '91st' AND rs.points = ds.points;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE res.fastestLap IS NOT NULL AND res.fastestLapTime = (     SELECT MIN(fastestLapTime)     FROM results     WHERE fastestLap IS NOT NULL )	formula_1
SELECT      c.name AS circuitName,      c.location AS circuitLocation,      c.country AS circuitCountry  FROM      circuits c  JOIN      races r ON c.circuitId = r.circuitId  WHERE      r.date = (SELECT MAX(date) FROM races);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.year = 2008 AND r.name = 'Marina Bay Street Circuit' AND q.position = 1 AND q.q3 IS NOT NULL AND q.q3 = (SELECT MIN(q2) FROM qualifying q2 JOIN races r2 ON q2.raceId = r2.raceId WHERE r2.year = 2008 AND r2.name = 'Marina Bay Street Circuit' AND q2.position = 1)	formula_1
SELECT d.forename || ' ' || d.surname AS fullName, d.nationality, r.name AS raceName FROM drivers d JOIN (     SELECT MIN(dob) AS minDob     FROM drivers ) AS youngest ON d.dob = youngest.minDob JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.driverId = (     SELECT driverId     FROM results     JOIN races ON results.raceId = races.raceId     WHERE drivers.driverId = results.driverId     ORDER BY races.year, races.round ASC     LIMIT 1 );	formula_1
SELECT COUNT(*)  FROM results  WHERE driverId = (     SELECT driverId      FROM results      JOIN races ON results.raceId = races.raceId      WHERE races.name = 'Canadian Grand Prix'      AND results.statusId = 3     GROUP BY driverId      ORDER BY COUNT(*) DESC      LIMIT 1 ) AND results.statusId = 3;	formula_1
SELECT d.forename, d.surname, SUM(CASE WHEN ds.wins > 0 THEN 1 ELSE 0 END) AS wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN (     SELECT MIN(dob) as oldestDob     FROM drivers ) as oldest ON d.dob = oldest.oldestDob GROUP BY d.driverId ORDER BY wins DESC LIMIT 1;	formula_1
SELECT raceId, driverId, MAX(duration) AS longestDuration FROM pitStops GROUP BY raceId, driverId ORDER BY longestDuration DESC LIMIT 1;	formula_1
SELECT MIN(milliseconds) as fastestLapTime FROM lapTimes WHERE milliseconds = (SELECT MIN(milliseconds) FROM lapTimes);	formula_1
SELECT MAX(duration) AS longest_pit_stop_time FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE name = 'Lewis Hamilton');	formula_1
SELECT pitStops.lap FROM pitStops JOIN races ON pitStops.raceId = races.raceId JOIN drivers ON pitStops.driverId = drivers.driverId JOIN results ON pitStops.driverId = results.driverId JOIN constructors ON results.constructorId = constructors.constructorId WHERE drivers.surname = 'Hamilton' AND races.year = 2011 AND races.name = 'Australian Grand Prix';	formula_1
SELECT      d.driverId,     d.surname,     d.forename,     p.raceId,     p.driverId,     p.duration FROM      pitStops p JOIN      races r ON p.raceId = r.raceId JOIN      drivers d ON p.driverId = d.driverId WHERE      r.year = 2011 AND      r.name = 'Australian Grand Prix';	formula_1
SELECT d.surname, l.position, l.time, l.milliseconds FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN circuits c ON l.raceId IN (SELECT raceId FROM races WHERE name LIKE '%Formula_1%') WHERE d.surname = 'Hamilton' AND l.position = 1 ORDER BY l.milliseconds ASC LIMIT 1;	formula_1
SELECT      d.forename || ' ' || d.surname AS driverFullName,     lt.time FROM      lapTimes lt JOIN      drivers d ON lt.driverId = d.driverId WHERE      lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT      circuits.name AS circuit_name,     circuits.positionText AS circuit_position FROM      circuits  JOIN      lapTimes ON circuits.circuitId = lapTimes.circuitId  JOIN      drivers ON lapTimes.driverId = drivers.driverId  JOIN      results ON lapTimes.driverId = results.driverId  WHERE      drivers.surname = 'Hamilton'      AND results.positionOrder = 1 ORDER BY      circuits.name;	formula_1
SELECT     d.driverRef,     d.forename,     d.surname,     lt.lap,     lt.time FROM     lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE     lt.raceId IN (         SELECT raceId         FROM races         WHERE name = 'Austrian Grand Prix'     ) ORDER BY     lt.time ASC LIMIT 1;	formula_1
SELECT l.raceId, l.driverId, l.lap, l.position, l.time, l.milliseconds FROM lapTimes l JOIN circuits c ON l.raceId = c.circuitId WHERE c.name = 'Monaco' OR c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name AS raceName FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix Circuit' AND lt.position = 1;	formula_1
SELECT      pitStops.driverId,      pitStops.time,      pitStops.duration  FROM      pitStops  JOIN      races ON pitStops.raceId = races.raceId  WHERE      races.name = 'Austrian Grand Prix'      AND pitStops.driverId IN (         SELECT              lapTimes.driverId          FROM              lapTimes          WHERE              lapTimes.raceId = races.raceId              AND lapTimes.position = 1              AND lapTimes.milliseconds = (                 SELECT                      MIN(lap.milliseconds)                  FROM                      lapTimes                  WHERE                      lapTimes.raceId = races.raceId              )     );	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN lapTimes lt ON c.circuitId = lt.raceId WHERE lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes lt2 WHERE lt2.raceId = c.circuitId) AND lt.time LIKE '1:29.488%'	formula_1
SELECT AVG(milliseconds) as average_pit_stop_time FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE name = 'Lewis Hamilton');	formula_1
SELECT AVG(milliseconds) AS average_lap_time_in_milliseconds FROM lapTimes WHERE raceId IN (     SELECT raceId     FROM races     JOIN circuits ON races.circuitId = circuits.circuitId     WHERE circuits.country = 'Italy' );	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT p.player_name, p.height FROM Player p WHERE p.height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating BETWEEN 60 AND 65 AND pa.defensive_work_rate = 'low';	european_football_2
SELECT player_api_id, MAX(crossing) AS max_crossing FROM Player_Attributes GROUP BY player_api_id ORDER BY max_crossing DESC LIMIT 5;	european_football_2
SELECT League.name, SUM(home_team_goal + away_team_goal) as total_goals FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY total_goals DESC LIMIT 1;	european_football_2
SELECT home_team_api_id, COUNT(*) AS lost_matches FROM Match WHERE season = '2015/2016' AND (home_team_goal < away_team_goal) GROUP BY home_team_api_id ORDER BY lost_matches ASC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.penalties = (SELECT MAX(penalties) FROM Player_Attributes) ORDER BY p.player_name LIMIT 10;	european_football_2
SELECT away_team_api_id, COUNT(*) as wins FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Scotland Premier League')    AND season = '2009/2010'   AND away_team_goal > home_team_goal GROUP BY away_team_api_id ORDER BY wins DESC LIMIT 1;	european_football_2
SELECT     T.team_long_name,     T.team_api_id,     T.team_fifa_api_id,     MAX(TA.buildUpPlaySpeed) AS max_build_up_play_speed FROM     Team T JOIN     Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE     TA.buildUpPlaySpeedClass = 'High' GROUP BY     T.team_long_name, T.team_api_id, T.team_fifa_api_id ORDER BY     max_build_up_play_speed DESC LIMIT 4;	european_football_2
SELECT L.name, COUNT(M.id) AS draw_matches FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' AND M.home_team_goal = M.away_team_goal GROUP BY L.name ORDER BY draw_matches DESC LIMIT 1;	european_football_2
SELECT     p.player_name,     (strftime('%Y-%m-%d', 'now', '-%Y year', p.birthday) AS current_age FROM     Player p JOIN     Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE     pa.sprint_speed >= 97     AND pa.date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00';	european_football_2
SELECT League.name, COUNT(league_id) AS total_matches FROM League JOIN Match ON League.id = Match.league_id GROUP BY League.name ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' GROUP BY player_api_id ORDER BY AVG(overall_rating) - (SELECT AVG(overall_rating) FROM Player_Attributes) DESC LIMIT 1;	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 51 AND 59;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE strftime('%Y', T2.date) = '2012'  AND T2.buildUpPlayPassing > (SELECT AVG(T2.buildUpPlayPassing)                              FROM Team_Attributes AS T2                             JOIN Team AS T1 ON T1.team_api_id = T2.team_api_id                             WHERE T2.buildUpPlayPassing IS NOT NULL AND strftime('%Y', T2.date) = '2012')	european_football_2
SELECT      (COUNT(CASE WHEN `Player_Attributes`.preferred_foot = 'left' THEN 1 END) * 1.0) / COUNT(`Player_Attributes`.player_fifa_api_id) AS left_foot_percentage FROM      `Player_Attributes` JOIN      `Player` ON `Player_Attributes`.player_fifa_api_id = `Player`.player_fifa_api_id WHERE      `Player`.birthday BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00';	european_football_2
SELECT      L.name AS LeagueName,      SUM(M.home_team_goal + M.away_team_goal) AS TotalGoals FROM      Match M JOIN      League L ON M.league_id = L.id GROUP BY      L.name ORDER BY      TotalGoals ASC LIMIT 5;	european_football_2
SELECT AVG(long_shots)  FROM Player_Attributes  WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Ahmed Samir Farag');	european_football_2
SELECT p.player_name, AVG(pa.heading_accuracy) AS avg_heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 GROUP BY p.player_api_id ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT team_long_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE buildUpPlayDribblingClass = 'Normal' AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY chanceCreationPassing ASC;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2009/2010' AND AVG(M.home_team_goal) > AVG(M.away_team_goal) GROUP BY L.name;	european_football_2
SELECT team_short_name  FROM Team  WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name FROM Player WHERE strftime('%Y', birthday) = '1970' AND strftime('%m', birthday) = '10';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_fifa_api_id` = (     SELECT `player_fifa_api_id`     FROM `Player`     WHERE `player_name` = 'Franco Zennaro' );	european_football_2
SELECT buildUpPlayPositioningClass FROM Team_Attributes WHERE team_long_name = 'ADO Den Haag' AND buildUpPlayPositioningClass = 'Low';	european_football_2
SELECT heading_accuracy FROM Player_Attributes WHERE player_api_id = (     SELECT player_api_id     FROM Player     WHERE player_name = 'Francois Affolter' ) AND date = '2014-09-18 00:00:00';	european_football_2
SELECT `overall_rating` FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Gabriel Tamas') AND strftime('%Y', `date`) = '2011';	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016';	european_football_2
SELECT preferred_foot FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.birthday = (     SELECT MIN(birthday)     FROM Player )	european_football_2
SELECT `player_name`, MAX(`potential`) AS `max_potential` FROM `Player_Attributes` GROUP BY `player_fifa_api_id`, `player_api_id`, `player_name` ORDER BY `max_potential` DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.weight < 130 AND pa.preferred_foot = 'left';	european_football_2
SELECT team_short_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team_Attributes.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT defensive_work_rate FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'David Wilson');	european_football_2
SELECT p.birthday FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal)  FROM Match  WHERE country_id = (SELECT id FROM Country WHERE name = 'Poland')  AND season = '2010/2011';	european_football_2
SELECT pa.player_api_id, p.player_name, AVG(pa.finishing) AS avg_finishing_rate FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.height BETWEEN (SELECT MAX(height) FROM Player) AND (SELECT MIN(height) FROM Player) GROUP BY pa.player_api_id, p.player_name ORDER BY avg_finishing_rate DESC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p WHERE p.height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam %' AND weight > 170;	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT `potential` FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Aaron Doran');	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.preferred_foot = 'left';	european_football_2
SELECT DISTINCT T.team_long_name FROM Team_Attributes AS TA JOIN Team AS T ON TA.team_api_id = T.team_api_id WHERE TA.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` WHERE `team_short_name` = 'CLB';	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.buildUpPlayPassing > 70;	european_football_2
SELECT AVG(overall_rating) AS avg_rating FROM Player_Attributes WHERE strftime('%Y', date) BETWEEN '2010' AND '2015' AND overall_rating > 170;	european_football_2
SELECT player_name, MIN(height) as shortest_height FROM Player WHERE height = (SELECT MIN(height) FROM Player) GROUP BY player_name;	european_football_2
SELECT c.name FROM Country AS c JOIN League AS l ON c.id = l.country_id WHERE l.name = 'Italy Serie A';	european_football_2
SELECT team_short_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT t.team_short_name FROM Team AS t JOIN Match AS m ON t.team_api_id = m.home_team_api_id WHERE m.home_team_goal = 10;	european_football_2
SELECT p.player_name, pa.balance, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = 61 AND pa.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61);	european_football_2
SELECT      ABS(AVG(PC1.ball_control) - AVG(PC2.ball_control)) AS Ball_Control_Difference FROM      Player_Attributes PC1 JOIN      Player P1 ON PC1.player_api_id = P1.player_api_id AND P1.player_name = 'Abdou Diallo' JOIN      Player_Attributes PC2 ON PC1.player_api_id != PC2.player_api_id AND PC2.player_api_id IN (         SELECT              player_api_id          FROM              Player          WHERE              player_name = 'Aaron Appindangoye'     ) GROUP BY      PC1.player_api_id, PC2.player_api_id;	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT p1.player_name AS Older_Player, p2.player_name AS Younger_Player FROM Player p1 JOIN Player p2 ON p1.birthday < p2.birthday OR (p1.birthday = p2.birthday AND p1.player_api_id < p2.player_api_id) WHERE p1.player_name = 'Aaron Lennon' OR p2.player_name = 'Aaron Lennon' AND p1.player_name != p2.player_name;	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.preferred_foot = 'left' AND pa.attacking_work_rate = 'low';	european_football_2
SELECT Country.name FROM League JOIN Country ON League.country_id = Country.id WHERE League.name = 'Belgium Jupiler League';	european_football_2
SELECT name FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Germany');	european_football_2
SELECT `player_name`, MAX(`overall_rating`) AS `max_strength` FROM `Player_Attributes` pa JOIN `Player` p ON pa.`player_api_id` = p.`player_api_id` GROUP BY p.`player_name` ORDER BY `max_strength` DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high'	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY Player_Attributes.crossing DESC LIMIT 1;	european_football_2
SELECT `heading_accuracy` FROM `Player_Attributes` WHERE `player_fifa_api_id` = (     SELECT `player_fifa_api_id`     FROM `Player`     WHERE `player_name` = 'Ariel Borysiuk' );	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.height > 180 AND pa.volleys > 70;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2008/2009' AND country_id = (SELECT id FROM Country WHERE name = 'Belgium');	european_football_2
SELECT PA.long_passing FROM Player_Attributes PA JOIN Player P ON PA.player_api_id = P.player_api_id WHERE P.birthday = (     SELECT MIN(birthday)     FROM Player );	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Belgium Jupiler League' AND strftime('%Y', date) = '2009' AND strftime('%m', date) = '04';	european_football_2
SELECT league_id, COUNT(*) as match_count FROM Match WHERE season = '2008/2009' GROUP BY league_id ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG(overall_rating) AS average_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', p.birthday) < '1986';	european_football_2
SELECT     ((         (SELECT overall_rating           FROM Player_Attributes           INNER JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id           WHERE Player.player_name = 'Ariel Borysiuk') -          (SELECT overall_rating           FROM Player_Attributes           INNER JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id           WHERE Player.player_name = 'Paulin Puel')     ) /      (SELECT overall_rating       FROM Player_Attributes       INNER JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id       WHERE Player.player_name = 'Paulin Puel')     ) * 100 FROM Player_Attributes;	european_football_2
SELECT AVG(`buildUpPlaySpeed`)  FROM `Team_Attributes`  WHERE `team_long_name` = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating)  FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id OR T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(PA.crossing) AS TotalCrossingScore FROM Player_Attributes PA JOIN Player P ON PA.player_api_id = P.player_api_id WHERE P.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(chanceCreationPassing), chanceCreationPassingClass  FROM Team_Attributes  WHERE team_long_name = 'Ajax'  GROUP BY chanceCreationPassingClass  ORDER BY chanceCreationPassing DESC  LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Abdou Diallo' ORDER BY Player_Attributes.date DESC LIMIT 1;	european_football_2
SELECT MAX(overall_rating)  FROM Player_Attributes  INNER JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(away_team_goal) AS average_away_goals FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Parma' AND Match.country_id = (SELECT id FROM Country WHERE Country.name = 'Italy');	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date = '2016-06-23' ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT `overall_rating` FROM `Player_Attributes` WHERE `player_name` = 'Aaron Mooy' AND `date` = '2016-02-04 00:00:00';	european_football_2
SELECT `potential` FROM `Player_Attributes` WHERE `player_name` = 'Francesco Parravicini' AND `date` = '2010-08-30 00:00:00';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_name` = 'Francesco Migliore' AND `date` = '2015-05-01 00:00:00';	european_football_2
SELECT `defensive_work_rate` FROM `Player_Attributes` WHERE `player_name` = 'Kevin Berigaud' AND `date` = '2013-02-22 00:00:00';	european_football_2
SELECT date  FROM Player_Attributes  WHERE player_name = 'Kevin Constant'  ORDER BY crossing DESC  LIMIT 1;	european_football_2
SELECT `buildUpPlaySpeedClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Willem II' AND `date` = '2012-02-22 00:00:00';	european_football_2
SELECT buildUpPlayDribblingClass FROM Team_Attributes WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'FC Lorient' AND `date` = '2010-02-22';	european_football_2
SELECT `chanceCreationPassingClass` FROM Team_Attributes WHERE `team_long_name` = 'PEC Zwolle' AND `date` = '2013-09-20 00:00:00';	european_football_2
SELECT chanceCreationCrossingClass FROM Team_Attributes WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00';	european_football_2
SELECT `defenceAggressionClass` FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Hannover 96' AND Team_Attributes.date = '2015-09-10 00:00:00';	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM Player_Attributes WHERE player_name = 'Marko Arnautovic' AND date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00'	european_football_2
SELECT      ( (p1.overall_rating - p2.overall_rating) / p1.overall_rating * 100 ) AS rating_difference_percentage FROM      Player_Attributes p1 JOIN      Player p ON p.player_api_id = p1.player_api_id JOIN      Player_Attributes p2 ON p2.player_api_id = p.player_api_id WHERE      p.player_name = 'Landon Donovan' AND     p2.player_name = 'Jordan Bowery' AND     p1.date = '2013-07-12' AND     p2.date = '2013-07-12'	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height = (SELECT MAX(height) FROM Player) ORDER BY p.player_name LIMIT 5;	european_football_2
SELECT player_api_id  FROM Player  ORDER BY weight DESC  LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p WHERE DATEDIFF(YEAR, p.birthday, DATE('now', 'localtime')) >= 35;	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Match JOIN Player ON Player.player_api_id = Match.home_player_1 OR Player.player_api_id = Match.home_player_2 OR                Player.player_api_id = Match.home_player_3 OR Player.player_api_id = Match.home_player_4 OR                Player.player_api_id = Match.home_player_5 OR Player.player_api_id = Match.home_player_6 OR                Player.player_api_id = Match.home_player_7 OR Player.player_api_id = Match.home_player_8 OR                Player.player_api_id = Match.home_player_9 OR Player.player_api_id = Match.home_player_10 OR                Player.player_api_id = Match.home_player_11 WHERE Player.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(away_team_goal) as total_goals FROM Match JOIN Player ON Player.player_api_id = Match.away_player_1 OR Player.player_api_id = Match.away_player_2 WHERE Player.player_name IN ('Daan Smith', 'Filipe Ferreira');	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Match JOIN Player ON home_player_1 = player_api_id OR home_player_2 = player_api_id OR home_player_3 = player_api_id OR                home_player_4 = player_api_id OR home_player_5 = player_api_id OR home_player_6 = player_api_id OR                home_player_7 = player_api_id OR home_player_8 = player_api_id OR home_player_9 = player_api_id OR                home_player_10 = player_api_id OR home_player_11 = player_api_id WHERE (strftime('%Y', CURRENT_TIMESTAMP, 'localtime') - strftime('%Y', birthday, 'localtime')) < 31;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) ORDER BY p.player_name LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT DISTINCT P.player_name FROM Player_Attributes PA JOIN Player P ON PA.player_api_id = P.player_api_id JOIN Match M ON P.player_api_id = M.home_player_X1 OR P.player_api_id = M.home_player_X2 OR P.player_api_id = M.home_player_X3 OR                  P.player_api_id = M.home_player_X4 OR P.player_api_id = M.home_player_X5 OR P.player_api_id = M.home_player_X6 OR                  P.player_api_id = M.home_player_X7 OR P.player_api_id = M.home_player_X8 OR P.player_api_id = M.home_player_X9 OR                  P.player_api_id = M.home_player_X10 OR P.player_api_id = M.home_player_X11 OR P.player_api_id = M.away_player_X1 OR                  P.player_api_id = M.away_player_X2 OR P.player_api_id = M.away_player_X3 OR P.player_api_id = M.away_player_X4 OR                  P.player_api_id = M.away_player_X5 OR P.player_api_id = M.away_player_X6 OR P.player_api_id = M.away_player_X7 OR                  P.player_api_id = M.away_player_X8 OR P.player_api_id = M.away_player_X9 OR P.player_api_id = M.away_player_X10 OR                  P.player_api_id = M.away_player_X11 WHERE PA.attacking_work_rate = 'high' AND (     (M.home_player_X1 = PA.player_api_id OR M.away_player_X1 = PA.player_api_id) AND      (M.home_player_X2 = PA.player_api_id OR M.away_player_X2 = PA.player_api_id) AND      (M.home_player_X3 = PA.player_api_id OR M.away_player_X3 = PA.player_api_id) AND      (M.home_player_X4 = PA.player_api_id OR M.away_player_X4 = PA.player_api_id) AND      (M.home_player_X5 = PA.player_api_id OR M.away_player_X5 = PA.player_api_id) AND      (M.home_player_X6 = PA.player_api_id OR M.away_player_X6 = PA.player_api_id) AND      (M.home_player_X7 = PA.player_api_id OR M.away_player_X7 = PA.player_api_id) AND      (M.home_player_X8 = PA.player	european_football_2
SELECT p.player_name,         (strftime('%Y-%m-%d', MAX(strftime('%Y-%m-%d', p.birthday)))) AS birthday FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY birthday ASC LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Country c ON p.player_fifa_api_id = c.id WHERE c.name = 'Belgium';	european_football_2
SELECT P.player_name, C.name AS country_name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id JOIN Country C ON P.player_fifa_api_id = C.id WHERE PA.vision > 89;	european_football_2
SELECT Country.name, AVG(Player.weight) as avg_weight FROM Player JOIN Country ON Player.player_api_id = Country.id GROUP BY Country.name ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT t.team_long_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(height) AS average_height FROM Player JOIN Country ON Player.player_fifa_api_id = Country.id WHERE Country.name = 'Italy';	european_football_2
SELECT p.player_name FROM Player p WHERE p.height > 180 ORDER BY p.player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND strftime('%Y', birthday) > '1990'	european_football_2
SELECT (SELECT jumping FROM Player_Attributes WHERE id = 6) - (SELECT jumping FROM Player_Attributes WHERE id = 23) AS JumpingScoreDifference	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = 'left');	european_football_2
SELECT      ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM Player_Attributes), 2) AS percentage_players_strength_stamina_above_80 FROM      Player_Attributes WHERE      strength > 80 AND stamina > 80;	european_football_2
SELECT Country.name FROM League JOIN Country ON League.country_id = Country.id WHERE League.name = 'Poland Ekstraklasa';	european_football_2
SELECT home_team_goal AS home_score, away_team_goal AS away_score FROM Match WHERE date = '2008-09-24%' AND league_id = (SELECT id FROM League WHERE name = 'Belgian Jupiler League');	european_football_2
SELECT sprint_speed, agility, acceleration FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Alexis Blin';	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Serie A');	european_football_2
SELECT MAX(home_team_goal) AS highest_home_score FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie');	european_football_2
SELECT `finishing`, `curve` FROM `Player_Attributes` WHERE `weight` = (SELECT MAX(`weight`) FROM `Player`);	european_football_2
SELECT League.name, COUNT(Match.id) as game_count FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY game_count DESC LIMIT 1;	european_football_2
SELECT T3.team_long_name FROM Match AS T1 JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id JOIN Team AS T3 ON T2.team_fifa_api_id = T3.team_fifa_api_id WHERE T1.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)	european_football_2
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT      (COUNT(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 END) * 100.0) / COUNT(id) AS percentage_of_undersixfeet FROM      Player_Attributes;	european_football_2
SELECT     CASE         WHEN COUNT(CASE WHEN SEX = 'M' THEN 1 END) - COUNT(CASE WHEN SEX = 'M' THEN 1 END AND Admission = '+') >         COUNT(CASE WHEN SEX = 'M' THEN 1 END AND Admission = '-') THEN             'In-patient'         ELSE             'Outpatient'     END AS GenderAdmissionComparison,     (ABS(COUNT(CASE WHEN SEX = 'M' THEN 1 END) - COUNT(CASE WHEN SEX = 'M' THEN 1 END AND Admission = '+') -     COUNT(CASE WHEN SEX = 'M' THEN 1 END AND Admission = '-')) /      COUNT(CASE WHEN SEX = 'M' THEN 1 END) * 100) AS PercentageDeviation FROM     Patient;	thrombosis_prediction
SELECT      (SELECT COUNT(*)       FROM Patient       WHERE EXTRACT(YEAR FROM Birthday) > 1930 AND SEX = 'F') /      (SELECT COUNT(*)       FROM Patient       WHERE SEX = 'F') * 100 AS PercentageOfFemalesBornAfter1930;	thrombosis_prediction
SELECT      ROUND((COUNT(CASE WHEN p.Birthday BETWEEN '1930-01-01' AND '1940-12-31' THEN 1 END) * 100.0) / COUNT(p.ID), 2) AS InpatientPercentage FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.Birthday BETWEEN '1930-01-01' AND '1940-12-31' AND      e.Admission = '+';	thrombosis_prediction
SELECT      COUNT(CASE WHEN Diagnosis = 'SLE' AND Admission = '+' THEN ID END) /      COUNT(CASE WHEN Diagnosis = 'SLE' AND Admission = '-' THEN ID END) AS OutpatientToInpatientRatio FROM      Examination;	thrombosis_prediction
SELECT p.Diagnosis, lab.Date FROM Patient p JOIN Laboratory lab ON p.ID = lab.ID WHERE p.ID = 30609 ORDER BY lab.Date;	thrombosis_prediction
SELECT p.SEX, p.Birthday, e.`Examination Date`, e.Symptoms FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 163109;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 500;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Birthday IS NOT NULL      AND l.RVVT = '+';	thrombosis_prediction
SELECT      Patient.ID,      Patient.SEX,      Examination.Diagnosis FROM      Patient JOIN      Examination ON Patient.ID = Examination.ID WHERE      Examination.Thrombosis = 2;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday BETWEEN '1937-01-01' AND '1937-12-31' AND l.`T-CHO` >= 250;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Diagnosis FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.ALB < 3.5;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN P.SEX = 'F' AND L.TP < 6.0 OR L.TP > 8.5 THEN P.ID END) * 100.0) / COUNT(P.ID) AS PercentageOfFemalesWithAbnormalTP FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      P.SEX = 'F'	thrombosis_prediction
SELECT AVG(`aCL IgG`) as Average_aCL_IgG FROM Examination WHERE Diagnosis LIKE '%MCTD%' OR Diagnosis LIKE '%SLE%' OR Diagnosis LIKE '%PSS%' AND `aCL IgG` IS NOT NULL AND SUBSTR(Birthday, 6, 2) - EXTRACT(YEAR FROM CURRENT_DATE) >= 50;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  WHERE p.SEX = 'F'  AND YEAR(p.Description) = 1997  AND p.Admission = '-';	thrombosis_prediction
SELECT MIN(SUBTRACT(YEAR(Birthday), YEAR(`First Date`))) AS YoungestAgeAtAdmission FROM Patient;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Thrombosis = 1 AND YEAR(Examination.`Examination Date`) = 1997 AND Patient.SEX = 'F';	thrombosis_prediction
SELECT MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS AgeGap FROM Patient WHERE EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.ID = Patient.ID       AND Laboratory.TG >= 200 );	thrombosis_prediction
SELECT Symptoms, Diagnosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday = (SELECT MIN(Birthday) FROM Patient);	thrombosis_prediction
SELECT      EXTRACT(MONTH FROM Date) AS Month,     COUNT(DISTINCT P.ID) / 12 AS AverageMalePatientsTested FROM      Laboratory L JOIN      Patient P ON L.ID = P.ID WHERE      P.SEX = 'M' AND      L.Date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY      EXTRACT(MONTH FROM Date);	thrombosis_prediction
SELECT      Patient.Birthday,      Examination.Date,      (SUBTRACT(year(Patient.Birthday), year(Examination.`First Date`))) AS InitialAge FROM      Patient  JOIN      Examination ON Patient.ID = Examination.ID WHERE      Examination.Diagnosis = 'SJS' ORDER BY      Patient.Birthday  LIMIT 1;	thrombosis_prediction
SELECT     SUM(CASE WHEN SEX = 'M' AND UA <= 8.0 THEN 1 ELSE 0 END) / SUM(CASE WHEN SEX = 'F' AND UA <= 6.5 THEN 1 ELSE 0 END) AS male_to_female_ratio FROM     Examination JOIN     Patient ON Examination.ID = Patient.ID	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID AND e.Examination_Date >= DATE_ADD(p.First_Date, INTERVAL 1 YEAR) WHERE e.ID IS NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Birthday < '1990-01-01' AND E.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31';	thrombosis_prediction
SELECT COUNT(*) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.SEX = 'M' AND Examination.`T-BIL` > 2.0;	thrombosis_prediction
SELECT Diagnosis, COUNT(*) as Count FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY Count DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(SUBTRACT(YEAR(CURRENT_DATE), YEAR(Birthday))) AS AverageAge FROM Patient WHERE ID IN (     SELECT ID     FROM Examination     WHERE `Examination Date` BETWEEN '1991-10-01' AND '1991-10-30' ) AND Birthday IS NOT NULL;	thrombosis_prediction
SELECT     (strftime('%Y', 'now') - strftime('%Y', Birthday)) AS Age,     Diagnosis FROM     Patient JOIN     Examination ON Patient.ID = Examination.ID WHERE     HGB = (SELECT MAX(HGB) FROM Examination WHERE Examination.Date = (         SELECT Date FROM Laboratory WHERE Laboratory.ID = Examination.ID AND Laboratory.Date = Examination.Date     ))	thrombosis_prediction
SELECT `ANA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT      T-CHO < 250 AS TotalCholesterolNormal FROM      Laboratory  WHERE      ID = 2927464 AND      Date = '1995-09-04';	thrombosis_prediction
SELECT SEX FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Diagnosis LIKE '%AORTITIS%' ORDER BY Examination.`Examination Date` LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM Examination WHERE Diagnosis = 'SLE' AND Description = '1994-02-19' AND `Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GPT = 9 AND Laboratory.Date = '1992-06-12' AND Patient.SEX IN ('M', 'F');	thrombosis_prediction
SELECT     p.ID,     p.Birthday,     (STRFTIME('%Y', '1991-10-21') - STRFTIME('%Y', p.Birthday)) AS AgeAtDate FROM     Patient p JOIN     Laboratory l ON p.ID = l.ID WHERE     l.UA = '8.4' AND     l.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(Laboratory.ID) AS TotalTests FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.Diagnosis = 'SJS' AND Examination.`First Date` = '1991-06-13' AND Laboratory.Date BETWEEN '1995-01-01' AND '1995-12-31' AND Examination.ID = Laboratory.ID;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`Examination Date` = '1997-01-27' AND p.`First Date` = '1997-01-27';	thrombosis_prediction
SELECT Symptoms FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday = '1959-03-01' AND Examination.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT     (SUM(CASE WHEN L.Date LIKE '1981-11-%' AND P.Birthday = '1959-02-18' THEN L.`T-CHO` ELSE 0 END) -      SUM(CASE WHEN L.Date LIKE '1981-12-%' AND P.Birthday = '1959-02-18' THEN L.`T-CHO` ELSE 0 END)) /      (SUM(CASE WHEN L.Date LIKE '1981-11-%' AND P.Birthday = '1959-02-18' THEN L.`T-CHO` ELSE 0 END) -       0) AS DecreaseRate FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE P.Birthday = '1959-02-18' AND L.Date BETWEEN '1981-11-01' AND '1981-12-31';	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Diagnosis LIKE '%Behcet%' AND E.`Examination Date` BETWEEN '1970-01-01' AND '1997-12-31' AND YEAR(E.`Examination Date`) BETWEEN 1970 AND 1997;	thrombosis_prediction
SELECT Patient.ID FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND Examination.GPT > 30 AND Examination.ALB < 4 ORDER BY Patient.ID;	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' ORDER BY ID;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN (     SELECT ID     FROM Examination     WHERE `ANA Pattern` = 'S' AND Thrombosis = 2 ) AS e2 ON e.ID = e2.ID WHERE e.`aCL IgM` > (     SELECT AVG(`aCL IgM`) * 1.2     FROM Examination     WHERE `ANA Pattern` = 'S' AND Thrombosis = 2 );	thrombosis_prediction
SELECT      ROUND(         (COUNT(CASE WHEN L.UA <= 6.5 THEN 1 END) * 100.0) /          COUNT(CASE WHEN L.UA <= 6.5 AND L.`U-PRO` > 0 AND L.`U-PRO` < 30 THEN 1 END),         2     ) AS Percentage FROM      Laboratory L JOIN      Examination E ON L.ID = E.ID WHERE      E.`U-PRO` > 0 AND E.`U-PRO` < 30     AND L.UA <= 6.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Diagnosis` = 'BEHCET' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS PercentageBEHCET FROM      Patient WHERE      `SEX` = 'M' AND      YEAR(`First Date`) = 1981	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.Date LIKE '1991-10%' AND l.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.ANA_Pattern != 'P'   AND P.SEX = 'F'   AND P.Birthday BETWEEN '1980-01-01' AND '1989-12-31';	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID AND e.Diagnosis = 'PSS' JOIN Laboratory l ON p.ID = l.ID AND l.CRP > 2 AND l.CRE = 1 AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(L.ALB) AS Average_Blood_Albumin FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.PLT > 400 AND P.Diagnosis LIKE '%SLE%';	thrombosis_prediction
SELECT MAX(Symptoms) as MostCommonSymptom FROM Examination WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT `First Date`, `Diagnosis` FROM Patient WHERE ID = 48473;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE YEAR(Laboratory.Date) = 1997 AND Laboratory.TP > 6 AND Laboratory.TP < 8.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Symptoms` LIKE '%ITP%' THEN 1 ELSE 0 END) * 1.0) /      SUM(CASE WHEN `Diagnosis` LIKE '%SLE%' THEN 1 ELSE 0 END) * 100 AS Proportion FROM Examination;	thrombosis_prediction
SELECT      (SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM      Patient WHERE      YEAR(Birthday) = 1980 AND      Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND e.Diagnosis = 'BEHCET' AND e.Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination Date`, `First Date`) AS EvaluationDelay FROM Examination WHERE ID = 821298 AND `Examination Date` IS NOT NULL AND `First Date` IS NOT NULL;	thrombosis_prediction
SELECT      Laboratory.UA > CASE WHEN Patient.SEX = 'M' THEN 8.0 ELSE 6.5 END AS IsUricAcidNormal FROM      Laboratory JOIN      Patient ON Laboratory.ID = Patient.ID WHERE      Laboratory.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = Laboratory.ID)     AND Patient.ID = 57266;	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ID = 48473 AND GOT >= 60;	thrombosis_prediction
SELECT p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND YEAR(l.Date) = 1994;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GPT >= 60;	thrombosis_prediction
SELECT p.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.GPT > 60 ORDER BY p.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) as Average_LDH FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT      p.ID,      (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.LDH BETWEEN 600 AND 800     AND (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) > 0;	thrombosis_prediction
SELECT      p.Admission,     COUNT(DISTINCT e.ID) AS PatientCount FROM      Examination e JOIN      Patient p ON e.ID = p.ID WHERE      e.ALP < 300 GROUP BY      p.Admission;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01' AND l.ALP < 300;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT      P.ID,     P.SEX,     L.TP,     L.TP - 8.5 AS TP_Deviation FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      P.SEX = 'F' AND      L.TP > 8.5	thrombosis_prediction
SELECT Patient.ID, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.ALB <= 3.5 OR Laboratory.ALB >= 5.5 ORDER BY Patient.Birthday DESC;	thrombosis_prediction
SELECT      p.ID,      CASE          WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range'         ELSE 'Not Within Normal Range'     END AS AlbuminStatus FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Birthday BETWEEN '1982-01-01' AND '1982-12-31'     AND l.Date = (SELECT MIN(Date) FROM Laboratory WHERE ID = p.ID)	thrombosis_prediction
SELECT     CAST(COUNT(CASE WHEN L.UA > 6.5 THEN 1 END) AS REAL) * 100 / COUNT(*) AS Percentage_Female_UA_Beyond_Normal FROM     Laboratory L JOIN     Patient P ON L.ID = P.ID WHERE     P.SEX = 'F';	thrombosis_prediction
SELECT AVG(UA) AS Average_UA_Index FROM Laboratory WHERE ID IN (     SELECT ID     FROM Examination     WHERE `Diagnosis` IS NOT NULL ) AND Date = (     SELECT MAX(Date)     FROM Laboratory     WHERE ID = Laboratory.ID ) AND (CASE WHEN SEX = 'M' THEN UA < 8.0 ELSE UA < 6.5 END)	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'RA' AND l.UN < 30;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.CRE >= 1.5;	thrombosis_prediction
SELECT     (SUM(CASE WHEN P.SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END)) AS More_Males_Than_Females FROM     Examination E JOIN     Patient P ON E.ID = P.ID WHERE     E.CRE >= 1.5;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory)	thrombosis_prediction
SELECT P.SEX, AVG(L.`T-BIL`) AS AvgTBil FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` >= 2.0 GROUP BY P.SEX;	thrombosis_prediction
SELECT p.ID, l.T-CHO FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND l.T-CHO = (SELECT MAX(T-CHO) FROM Laboratory) GROUP BY p.ID, l.T-CHO LIMIT 1;	thrombosis_prediction
SELECT AVG(DIV(SUM(YEAR(NOW()) - YEAR(Birthday)), COUNT(ID))) as AverageAge FROM Patient WHERE SEX = 'M' AND `T-CHO` >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG > 300;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG >= 200 AND SUBSTR(YEAR(CURRENT_TIMESTAMP), 3, 2) - SUBSTR(P.Birthday, 6, 2) > 50;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CPK < 250 AND Patient.Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday BETWEEN '1936-01-01' AND '1956-12-31' AND Patient.SEX = 'M' AND Laboratory.CPK >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday IS NOT NULL AND l.GLU >= 180 AND l.T-CHO < 250;	thrombosis_prediction
SELECT p.ID, l.GLU FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU < 180 AND YEAR(p.Description) >= 1991;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      (l.WBC <= 3.5 OR l.WBC >= 9.0) GROUP BY      p.SEX ORDER BY      p.SEX,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) ASC;	thrombosis_prediction
SELECT      p.ID,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age,      e.Diagnosis FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.ID IN (         SELECT              ID          FROM              Examination          WHERE              RBC < 3.5     )	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday,      p.Admission FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.SEX = 'F' AND      (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM p.Birthday) >= 50) AND      (l.RBC <= 3.5 OR l.RBC >= 6.0)	thrombosis_prediction
SELECT      Patient.ID,      Patient.SEX  FROM      Patient  JOIN      Laboratory  ON      Patient.ID = Laboratory.ID  WHERE      Patient.Admission = '-'      AND Laboratory.HGB < 10;	thrombosis_prediction
SELECT      p.ID,      p.SEX  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      e.Diagnosis = 'SLE'      AND p.Birthday = (SELECT MIN(Birthday) FROM Patient WHERE Diagnosis = 'SLE')     AND e.HGB BETWEEN 10 AND 17;	thrombosis_prediction
SELECT      p.ID,     TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID IN (         SELECT              ID         FROM              Laboratory         GROUP BY              ID         HAVING              COUNT(*) >= 2 AND MAX(HCT) >= 52     )	thrombosis_prediction
SELECT AVG(HCT) AS AverageHCTBelowNormal FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT     SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) AS LowerThanNormal,     SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS HigherThanNormal FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday IS NOT NULL AND SUBSTR(p.Birthday, 1, 4) < '1984' AND SUBSTR(p.Birthday, 1, 4) + 50 > SUBSTR(CURRENT_DATE, 1, 4) AND l.PLT BETWEEN 100 AND 400 AND l.Date LIKE '1984%';	thrombosis_prediction
SELECT      ROUND(         (COUNT(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 END) * 1.0) / COUNT(CASE WHEN PT >= 14 THEN 1 END),          2     ) AS PercentageOfFemalesWithAbnormalPT FROM      Patient WHERE      (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM Birthday)) > 55	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Description, p.`First Date`, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.`First Date` > '1992-12-31' AND l.PT < 14 ORDER BY p.ID;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.APTT > 45 AND e.Thrombosis = 3;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND e.WBC BETWEEN 3.5 AND 9.0 AND e.FG <= 150 OR e.FG >= 450;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday > '1980-01-01' AND Laboratory.FG < 150 OR Laboratory.FG > 450;	thrombosis_prediction
SELECT DISTINCT e.Diagnosis FROM Examination e JOIN Laboratory l ON e.ID = l.ID AND e.Date = l.Date WHERE l.`U-PRO` >= 30;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.`U-PRO` BETWEEN 0 AND 30 AND Patient.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) AS PatientsWithAbortionAndLowIgG FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.`aCL IgG` < 900 AND Examination.Symptoms = 'abortion';	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `aCL IgG` BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL;	thrombosis_prediction
SELECT Patient.Diagnosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.`aCL IgA` IS NOT NULL AND Examination.`aCL IgA` BETWEEN 80 AND 500 ORDER BY Examination.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE YEAR(`First Date`) >= 1990 AND IGA BETWEEN 80 AND 500;	thrombosis_prediction
SELECT Diagnosis, MAX(COUNT(Diagnosis)) as DiseaseCount FROM Examination WHERE `aCL IgM` NOT BETWEEN 40 AND 400 GROUP BY Diagnosis ORDER BY DiseaseCount DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.ID = Patient.ID     AND (         CRP LIKE '+' OR CRP LIKE '-' OR CRP < 1.0     ) ) AND Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.CRP >= 1.0 AND Patient.Birthday IS NOT NULL AND (YEAR(CURDATE()) - YEAR(Patient.Birthday)) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.RA IN('-', '+-') AND Examination.KCT = '+';	thrombosis_prediction
SELECT p.ID, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday > '1995-01-01' AND e.RA IN('-', '+-');	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RF < 20 AND (YEAR(CURDATE()) - YEAR(p.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.RF < 20 AND Laboratory.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.ID AND L.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = E.ID) WHERE E.ANA_Pattern = 'P' AND L.C3 > 35;	thrombosis_prediction
SELECT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Description BETWEEN 29 AND 52 AND E.`aCL IgA` = (SELECT MAX(`aCL IgA`) FROM Examination WHERE `aCL IgA` IS NOT NULL) AND E.`aCL IgA` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.Thrombosis = 1 AND Examination.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RNP IN ('-', '+-') AND p.Admission = '+';	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RNP NOT IN('-', '+-') ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE SM IN('-', '+-') AND Thrombosis = 1 ORDER BY Thrombosis DESC LIMIT 1;	thrombosis_prediction
SELECT Patient.ID FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.SM NOT IN('-', '+-') AND Examination.SM = 'abnormal' -- Assuming 'abnormal' is the value used to denote an abnormal SM ORDER BY Patient.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Laboratory L ON E.ID = L.ID AND L.Date = (SELECT MAX(Lab.Date) FROM Laboratory Lab WHERE Lab.ID = E.ID) WHERE E.`Examination Date` >= '1997-01-01' AND L.SC170 IN('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'M'  AND e.Symptoms LIKE '%vertigo%'  AND e.SC170 IN('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID AND l.SSA IN('-','+-')  WHERE p.`First Date` < '1990-01-01';	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SSA NOT IN('-', '+-') ORDER BY p.`First Date` ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  WHERE e.`ANA Pattern` IN('-', '+-') AND e.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID AND e.Date = l.Date  WHERE l.SSB IN('-', '+-') AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID AND L.Date = (     SELECT MAX(Date)     FROM Laboratory L2     WHERE L2.ID = P.ID ) WHERE P.SEX = 'M' AND L.CENTROMEA IN('-', '+-') AND L.SSB IN('-', '+-');	thrombosis_prediction
SELECT p.ID, e.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE l.DNA >= 8 AND e.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.DNA < 8 AND Laboratory.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.`DNA-II` >= 8 AND Patient.Admission = '+';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN L.GOT >= 60 AND E.Diagnosis = 'SLE' THEN E.ID END) * 1.0) /      COUNT(CASE WHEN L.GOT >= 60 THEN E.ID END) * 100 AS percentage FROM      Examination E INNER JOIN      Laboratory L ON E.ID = L.ID WHERE      L.GOT >= 60;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GOT < 60;	thrombosis_prediction
SELECT MIN(Birthday) as YoungestBirthdate FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE GOT >= 60 ) ORDER BY Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT Patient.Birthday, MAX(Laboratory.GPT) as MaxGPT FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GPT < 60 GROUP BY Patient.Birthday ORDER BY MaxGPT DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT < 60 AND P.SEX = 'M';	thrombosis_prediction
SELECT MIN(`First Date`)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE LDH < 500  AND LDH = (SELECT MAX(LDH) FROM Laboratory WHERE LDH < 500) ORDER BY `First Date` ASC  LIMIT 1;	thrombosis_prediction
SELECT MAX(Date) as LatestRecordDate FROM Laboratory WHERE ID = (SELECT MAX(ID) FROM Patient) AND LDH >= 500;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.ALP >= 300 AND P.Admission = '+';	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE ALP < 300 AND ID IN (SELECT ID FROM Patient WHERE Admission = '-');	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.Diagnosis = 'SJS' AND Laboratory.TP > 6.0 AND Laboratory.TP < 8.5;	thrombosis_prediction
SELECT `Examination Date` FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE ALB BETWEEN 3.5 AND 5.5 AND ALB = (SELECT MAX(ALB) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE ALB BETWEEN 3.5 AND 5.5);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M'  AND Laboratory.ALB BETWEEN 3.5 AND 5.5  AND Laboratory.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT MAX(UA), `aCL IgG`, `aCL IgM`, `aCL IgA` FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.SEX = 'F' AND Examination.UA > 6.50 GROUP BY Patient.ID ORDER BY MAX(UA) DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(`aCL IgG`), MAX(`aCL IgM`), MAX(`aCL IgA`)  FROM Examination  WHERE `CRE` < 1.5  AND ANA IS NOT NULL;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRE < 1.5 AND Laboratory.IGA = (     SELECT MAX(Lab.IGA)     FROM Laboratory Lab     WHERE Lab.ID = Patient.ID ) ORDER BY Laboratory.IGA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID AND l.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = e.ID) WHERE e.`ANA Pattern` LIKE '%P%' AND l.`T-BIL` >= 2.0;	thrombosis_prediction
SELECT e.ID, e.`aCL IgG`, e.`aCL IgM`, e.ANA, e.`ANA Pattern` FROM Examination e JOIN Laboratory l ON e.ID = l.ID AND e.`Examination Date` = l.Date WHERE e.`aCL IgG` IS NOT NULL OR e.`aCL IgM` IS NOT NULL OR e.ANA IS NOT NULL AND e.`T-BIL` < 2.0 AND e.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Examination WHERE `T-BIL` < 2.0);	thrombosis_prediction
SELECT COUNT(*) FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID AND Laboratory.Date = Examination.`Examination Date` WHERE Examination.`T-CHO` >= 250 AND Laboratory.KCT = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`T-CHO` < 250 AND E.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.TG < 200 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.TG < 200 ORDER BY e.TG DESC LIMIT 1;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CPK < 250 AND Examination.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Laboratory l ON e.ID = l.ID AND l.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = e.ID) WHERE l.CPK < 250 AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient WHERE ID = l.ID AND GLU > 180) AND l.GLU > 180;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.GLU < 180 AND Examination.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Admission = '+' AND Examination.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Diagnosis = 'SLE' AND Examination.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0 AND Patient.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.PLT > 100 AND e.PLT < 400 AND e.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT p.ID, e.PLT FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.PLT BETWEEN 100 AND 400 AND e.Diagnosis = 'MCTD';	thrombosis_prediction
SELECT AVG(PT) AS AverageProthrombinTime FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'M') AND PT < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Thrombosis IN (1, 2) AND Examination.PT < 14;	thrombosis_prediction
SELECT major_name  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.college = 'Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design';	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium';	student_club
SELECT e.event_name, COUNT(a.link_to_member) AS attendance FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.event_name LIKE '%Student_Club%' GROUP BY e.event_name ORDER BY attendance DESC LIMIT 1;	student_club
SELECT m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(DISTINCT e.event_id) FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND event_id IN (     SELECT link_to_event     FROM attendance     GROUP BY link_to_event     HAVING COUNT(link_to_member) > 10 );	student_club
SELECT event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id GROUP BY event.event_name HAVING COUNT(member.member_id) > 20;	student_club
SELECT COUNT(DISTINCT e.event_id) / COUNT(DISTINCT e.event_name) AS average_attendance FROM event e WHERE e.type = 'Meeting' AND YEAR(e.event_date) = 2020;	student_club
SELECT expense_description, MAX(cost) as highest_cost FROM expense WHERE link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE type = 'Meeting' OR type = 'Election')) GROUP BY expense_description ORDER BY highest_cost DESC LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT last_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Law and Constitutional Studies';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sherri' AND m.last_name = 'Ramsey';	student_club
SELECT m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Tyler' AND m.last_name = 'Hewitt';	student_club
SELECT SUM(i.amount) as total_funds_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT SUM(b.spent) AS total_spent_on_food FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President';	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM member WHERE link_to_major IN (     SELECT major_id     FROM major     WHERE state = 'Illinois' );	student_club
SELECT SUM(b.spent) AS total_spent_on_advertisement FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Advertisement';	student_club
SELECT major.department FROM major JOIN member ON major.major_id = member.link_to_major WHERE member.first_name = 'Pierce' OR member.last_name = 'Guidi';	student_club
SELECT SUM(b.amount) AS total_budgeted_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker';	student_club
SELECT expense_id FROM expense JOIN event ON expense.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' AND event.event_date = '2019-10-08' AND expense.approved = 'True';	student_club
SELECT AVG(cost) AS average_cost_spent FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Elijah' AND member.last_name = 'Allen' AND MONTH(expense.expense_date) IN (9, 10);	student_club
SELECT     SUM(CASE WHEN YEAR(event_date) = 2019 THEN spent ELSE 0 END) AS spent_2019,     SUM(CASE WHEN YEAR(event_date) = 2020 THEN spent ELSE 0 END) AS spent_2020,     (SUM(CASE WHEN YEAR(event_date) = 2019 THEN spent ELSE 0 END) - SUM(CASE WHEN YEAR(event_date) = 2020 THEN spent ELSE 0 END)) AS difference FROM     budget WHERE     link_to_event IN (SELECT event_id FROM event WHERE type = 'Meeting' AND status = 'Open');	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT expense.cost FROM expense JOIN event ON expense.link_to_event = event.event_id WHERE event.event_name LIKE '%Posters%' AND event.event_date = '2019-09-04';	student_club
SELECT budget.remaining FROM budget WHERE budget.category = 'Food' ORDER BY budget.amount DESC LIMIT 1;	student_club
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone  FROM member  WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT county  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE first_name = 'Adela' AND last_name = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM budget WHERE link_to_event IN (     SELECT event_id     FROM event     WHERE event_name = 'November Meeting' ) AND remaining < 0;	student_club
SELECT SUM(b.amount) AS total_budget_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Speaker';	student_club
SELECT e.event_status FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-08-20';	student_club
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE first_name = 'Brent' AND last_name = 'Thomason';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Human Development and Family Studies') AND t_shirt_size = 'Large';	student_club
SELECT zip_code.type FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Christof' AND member.last_name = 'Nielson';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN (     SELECT member_id     FROM member     WHERE first_name = 'Sacha' AND last_name = 'Harrison' ) AS subq ON m.member_id = subq.member_id;	student_club
SELECT major.department FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'President';	student_club
SELECT date_received  FROM income  WHERE source = 'Dues'  AND link_to_member = (SELECT member_id FROM member WHERE first_name = 'Connor' AND last_name = 'Hilton');	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' AND b.category = 'Advertisement' THEN b.amount ELSE 0 END) /      SUM(CASE WHEN e.event_name = 'October Meeting' AND b.category = 'Advertisement' THEN b.amount ELSE 0 END)) AS ratio FROM      event e JOIN      budget b ON e.event_id = b.link_to_event WHERE      e.event_name IN ('Yearly Kickoff', 'October Meeting');	student_club
SELECT     (SUM(CASE WHEN e.event_name = 'November Speaker' AND b.category = 'Parking' THEN b.amount ELSE 0 END) /       COUNT(CASE WHEN e.event_name = 'November Speaker' THEN b.amount ELSE 1 END)) * 100 AS parking_budget_percentage FROM     budget b JOIN     event e ON b.link_to_event = e.event_id WHERE     e.event_name = 'November Speaker';	student_club
SELECT SUM(e.cost) AS total_pizza_cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE e.expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange' AND state = 'Virginia';	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT e.expense_description FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE b.remaining = (SELECT MIN(remaining) FROM budget) ORDER BY e.expense_id;	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT college, COUNT(*) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY college ORDER BY member_count DESC LIMIT 1;	student_club
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE phone = '809-555-3360';	student_club
SELECT event_name, MAX(amount) AS highest_budget FROM event JOIN budget ON event.event_id = budget.link_to_event GROUP BY event_name ORDER BY highest_budget DESC LIMIT 1;	student_club
SELECT expense.expense_id, expense.expense_description, expense.expense_date, expense.cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT link_to_member)  FROM attendance  WHERE link_to_event IN (     SELECT event_id      FROM event      WHERE event_name = 'Women''s Soccer' );	student_club
SELECT date_received  FROM income  WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Casey' AND last_name = 'Mason');	student_club
SELECT COUNT(*) FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Maryland');	student_club
SELECT COUNT(*) FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE member.phone = '954-555-6240';	student_club
SELECT first_name, last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT      event.event_name,      budget.category,      MAX(DIVIDE(budget.spent, budget.amount)) AS spend_to_budget_ratio FROM      event JOIN      budget ON event.event_id = budget.link_to_event WHERE      event.status = 'Closed' GROUP BY      event.event_name,      budget.category ORDER BY      spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'President';	student_club
SELECT MAX(spent) AS highest_spent FROM budget;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT SUM(budget.spent) AS total_food_spent FROM budget JOIN expense ON budget.budget_id = expense.link_to_budget WHERE budget.category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT first_name, last_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina';	student_club
SELECT SUM(income.amount) AS total_income FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN budget b ON m.member_id = b.link_to_member JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff' AND e.type = 'Event' AND b.event_status = 'Budgeted';	student_club
SELECT m.first_name, m.last_name, i.source, MAX(i.amount) AS max_income FROM income i JOIN member m ON i.link_to_member = m.member_id GROUP BY m.first_name, m.last_name, i.source ORDER BY max_income DESC;	student_club
SELECT event_name, MIN(cost) AS lowest_cost FROM budget JOIN event ON budget.link_to_event = event.event_id GROUP BY event_name ORDER BY lowest_cost ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN e.cost ELSE 0 END) / SUM(e.cost)) * 100 AS Yearly_Kickoff_Percentage FROM      event e;	student_club
SELECT      (SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) * 1.0) /      SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) FROM      major;	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary' AND link_to_major = (SELECT major_id FROM major WHERE major_name = 'Student Club');	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Community Theater'  AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(a.link_to_event), m.major_name FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi' GROUP BY m.major_name;	student_club
SELECT AVG(spent)  FROM budget  WHERE category = 'Food'  AND link_to_event IN (SELECT event_id FROM event WHERE event_status = 'Closed')	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE category = 'Advertisement' GROUP BY event_name ORDER BY SUM(spent) DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM attendance  WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'Women''s Soccer')  AND link_to_member = (SELECT member_id FROM member WHERE first_name = 'Maya' AND last_name = 'Mclean');	student_club
SELECT      (SUM(CASE WHEN e.type = 'Community Service' THEN 1 ELSE 0 END) * 100.0) / COUNT(e.event_id) FROM      event e WHERE      e.event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT SUM(e.cost) AS total_cost FROM expense e JOIN event ev ON e.link_to_event = ev.event_id WHERE ev.event_name = 'September Speaker' AND e.expense_description = 'Posters';	student_club
SELECT t_shirt_size, COUNT(*) as count FROM member GROUP BY t_shirt_size ORDER BY count DESC LIMIT 1;	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining LIMIT 1;	student_club
SELECT expense.expense_description, SUM(expense.cost) AS total_value FROM expense JOIN event ON expense.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' AND expense.approved = 'Yes' GROUP BY expense.expense_description;	student_club
SELECT category, SUM(amount) AS total_amount FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'April Speaker' AND event_date LIKE '2020-04-%') GROUP BY category ORDER BY total_amount ASC;	student_club
SELECT budget_id FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1;	student_club
SELECT budget_id, amount FROM budget WHERE category = 'Advertising' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) AS total_cost_spent_parking FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT expense.expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT major_name  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen';	student_club
SELECT m.position FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business';	student_club
SELECT COUNT(*) FROM member WHERE major_name = 'Business' AND t_shirt_size = 'Medium';	student_club
SELECT event.type FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 30;	student_club
SELECT type FROM event WHERE location = 'MU 215';	student_club
SELECT type FROM event WHERE event_date = '2020-03-24T12:00:00';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT      (SUM(CASE WHEN m.position = 'Member' AND m.link_to_major = (SELECT major_id FROM major WHERE major_name = 'Mathematics') THEN 1 ELSE 0 END) * 100.0) / COUNT(m.member_id) AS percentage_math_members FROM      member m;	student_club
SELECT type FROM event WHERE location = 'MU 215';	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Agriculture and Applied Sciences'  AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0;	student_club
SELECT z.city, z.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN zip_code z ON m.zip = z.zip_code WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';	student_club
SELECT e.event_name FROM event e JOIN member m ON e.event_id = (SELECT link_to_event                             FROM attendance                             WHERE link_to_member = (SELECT member_id                                                     FROM member                                                     WHERE first_name = 'Vice' AND last_name = 'President' AND position = 'Vice President' AND zip = (SELECT zip_code                                                                                                                             FROM zip_code                                                                                                                             WHERE city = 'Student_Club' AND address = '900 E. Washington St.'))                             AND e.type = 'Social');	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member';	student_club
SELECT      ROUND((COUNT(CASE WHEN i.amount = 50 THEN 1 END) * 100.0) / COUNT(m.member_id), 2) AS percentage_of_amount_50 FROM      member m JOIN      income i ON m.member_id = i.link_to_member WHERE      m.t_shirt_size = 'Medium'      AND m.position = 'Member'     AND i.amount = 50;	student_club
SELECT DISTINCT state FROM zip_code WHERE type = 'PO Box';	student_club
SELECT zc.zip_code FROM zip_code zc JOIN major m ON zc.state = m.college WHERE m.major_name = 'San Juan Municipio' AND m.state = 'Puerto Rico' AND zc.type = 'PO Box';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT e.event_id FROM event e JOIN expense ex ON e.event_id = ex.link_to_event JOIN member m ON ex.link_to_member = m.member_id WHERE ex.cost > 50;	student_club
SELECT m.member_id, m.first_name, m.last_name, e.event_id, e.event_name FROM member m JOIN expense ex ON m.member_id = ex.link_to_member JOIN event e ON ex.link_to_budget = e.event_id WHERE ex.approved = 'true' AND ex.expense_date BETWEEN '2019-01-10' AND '2019-11-19' AND ex.link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_date BETWEEN '2019-01-10' AND '2019-11-19'))	student_club
SELECT m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Katy' AND ma.major_id = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT m.email FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.cost > 20 AND e.expense_date BETWEEN '2019-09-10' AND '2019-11-19';	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'education'  AND ma.college = 'College of Education & Human Services';	student_club
SELECT     (SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) / COUNT(e.event_id)) * 100 AS percentage_over_budget FROM     event e JOIN     budget b ON e.event_id = b.link_to_event	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_id, expense_description FROM expense GROUP BY expense_id HAVING SUM(cost) / COUNT(expense_id) > 50;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT      (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) * 100.0) / COUNT(zip_code) AS percentage_po_box FROM      zip_code;	student_club
SELECT e.event_name, e.location FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 0;	student_club
SELECT e.event_name, e.event_date FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, m.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 100;	student_club
SELECT z.city, z.county FROM event e JOIN income i ON e.event_id = i.link_to_member JOIN zip_code z ON e.location = z.city AND z.county WHERE e.event_id IN (     SELECT link_to_event     FROM income     GROUP BY link_to_event     HAVING COUNT(*) > 40 );	student_club
SELECT      e.link_to_member,      SUM(e.cost) AS total_expense FROM      expense e JOIN      (         SELECT              link_to_member         FROM              expense         GROUP BY              link_to_member         HAVING              COUNT(DISTINCT link_to_event) > 1     ) AS multiple_events ON      e.link_to_member = multiple_events.link_to_member GROUP BY      e.link_to_member ORDER BY      total_expense DESC LIMIT 1;	student_club
SELECT AVG(expense.cost) AS average_amount_paid FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.position <> 'Member';	student_club
SELECT event_name FROM event WHERE type = 'Meeting' AND link_to_event IN (     SELECT link_to_event     FROM expense     WHERE expense_description LIKE '%parking%'     AND link_to_budget IN (         SELECT budget_id         FROM budget         WHERE link_to_event IN (             SELECT event_id             FROM event             WHERE type = 'Meeting'         )     )     AND cost < (         SELECT AVG(cost)         FROM expense         JOIN budget ON expense.link_to_budget = budget.budget_id         WHERE budget.category = 'Parking'     ) )	student_club
SELECT      (SUM(e.cost) / COUNT(e.event_id)) * 100 AS percentage_cost FROM      event e WHERE      e.type = 'Game'	student_club
SELECT b.budget_id, SUM(e.cost) AS total_cost FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Water, chips, cookies' GROUP BY b.budget_id ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM expense e JOIN member m ON e.link_to_member = m.member_id GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT      (SUM(CASE WHEN m.zip IN (SELECT zip_code FROM zip_code WHERE state = 'Maine') THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) -      (SUM(CASE WHEN m.zip IN (SELECT zip_code FROM zip_code WHERE state = 'Vermont') THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) FROM      member m;	student_club
SELECT major.major_name, major.department FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies' GROUP BY m.member_id;	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education';	student_club
SELECT b.category, b.amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'January Speaker';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT category  FROM budget  JOIN expense ON budget.budget_id = expense.link_to_budget  WHERE expense.expense_description = 'Posters';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary';	student_club
SELECT e.event_name, SUM(b.spent) AS total_spent_on_gifts FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT z.city FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Garrett' AND m.last_name = 'Girke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code zc ON m.zip = zc.zip_code WHERE zc.city = 'Lincolnton' AND zc.state = 'North Carolina' AND zc.zip_code = 28092;	student_club
SELECT COUNT(DISTINCT GasStationID) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT      (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) / NULLIF(COUNT(CASE WHEN c.Currency = 'CZK' THEN 1 END), 0)) AS EUR_to_CZK_ratio FROM      customers c;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND y.Date BETWEEN '201201' AND '201212' GROUP BY c.CustomerID ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS AvgMonthlyConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount) AS TotalConsumption FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Price < 0 AND t.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC;	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM' AND ym.Date BETWEEN '201201' AND '201212' AND ym.Consumption < 30000;	debit_card_specializing
SELECT      (SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) -       SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END)) AS DifferenceInConsumption FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      y.Date BETWEEN '201201' AND '201212'     AND c.Currency IN ('CZK', 'EUR');	debit_card_specializing
SELECT strftime('%Y', yearmonth.Date) AS Year, SUM(yearmonth.Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Segment, SUM(Consumption) as TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT      SUBSTR(Date, 1, 4) AS Year,      SUM(Consumption) AS TotalConsumption FROM      yearmonth WHERE      Currency = 'CZK' GROUP BY      Year ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Date AS PeakMonth FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date LIKE '2013%' GROUP BY LEFT(Date, 7) ORDER BY SUM(Consumption) DESC LIMIT 1;	debit_card_specializing
WITH SegmentLowestConsumption AS (     SELECT         Segment,         MIN(Consumption) AS MinConsumption     FROM yearmonth     WHERE Date BETWEEN '201301' AND '201312'     GROUP BY Segment ), SME_Lowest AS (     SELECT         (SUM(Consumption) / MinConsumption) AS AvgConsumption     FROM yearmonth     JOIN SegmentLowestConsumption ON yearmonth.Segment = SegmentLowestConsumption.Segment     WHERE yearmonth.Segment = 'SME' AND MinConsumption = (SELECT MinConsumption FROM SegmentLowestConsumption WHERE Segment = 'SME') ), LAM_Lowest AS (     SELECT         (SUM(Consumption) / MinConsumption) AS AvgConsumption     FROM yearmonth     JOIN SegmentLowestConsumption ON yearmonth.Segment = SegmentLowestConsumption.Segment     WHERE yearmonth.Segment = 'LAM' AND MinConsumption = (SELECT MinConsumption FROM SegmentLowestConsumption WHERE Segment = 'LAM') ), LAM_KAM_Diff AS (     SELECT         LAM_Lowest.AvgConsumption - KAM_Lowest.AvgConsumption AS Difference     FROM LAM_Lowest     JOIN SegmentLowestConsumption AS KAM_Seg ON KAM_Seg.Segment = 'KAM' AND KAM_Seg.MinConsumption = LAM_Lowest.MinConsumption     JOIN (         SELECT             (SUM(Consumption) / MinConsumption) AS AvgConsumption         FROM yearmonth         JOIN SegmentLowestConsumption ON yearmonth.Segment = SegmentLowestConsumption.Segment         WHERE yearmonth.Segment = 'KAM'     ) AS KAM_Lowest ON KAM_Lowest.MinConsumption = KAM_Seg.MinConsumption ), KAM_SME_Diff AS (     SELECT         KAM_Lowest.AvgConsumption - SME_Lowest.AvgConsumption AS Difference     FROM KAM_Lowest     JOIN SegmentLowestConsumption AS SME_Seg ON SME_Seg.Segment = 'SME' AND SME_Seg.MinConsumption = KAM_Lowest.MinConsumption     JOIN SME_Lowest ON SME_Lowest.MinConsumption = SME_Seg.MinConsumption ) SELECT     LAM_KAM_D	debit_card_specializing
WITH Consumption_2012 AS (     SELECT          c.Segment,         SUM(y.Consumption) AS TotalConsumption2012     FROM yearmonth y     JOIN customers c ON y.CustomerID = c.CustomerID     WHERE y.Date LIKE '2012%'     GROUP BY c.Segment ), Consumption_2013 AS (     SELECT          c.Segment,         SUM(y.Consumption) AS TotalConsumption2013     FROM yearmonth y     JOIN customers c ON y.CustomerID = c.CustomerID     WHERE y.Date LIKE '2013%'     GROUP BY c.Segment ), Consumption_Change AS (     SELECT          c1.Segment,         (c1.TotalConsumption2013 - c1.TotalConsumption2012) AS ConsumptionChange,         c1.TotalConsumption2013 AS Consumption2013,         (c1.TotalConsumption2013 - c1.TotalConsumption2012) / c1.TotalConsumption2013 * 100 AS PercentageChange     FROM Consumption_2012 c1     JOIN Consumption_2013 c2 ON c1.Segment = c2.Segment ), MaxMinSegment AS (     SELECT          MAX(PercentageChange) AS MaxPercentageChange,         MIN(PercentageChange) AS MinPercentageChange     FROM Consumption_Change ) SELECT      c.Segment,     c.ConsumptionChange,     c.PercentageChange FROM Consumption_Change c JOIN MaxMinSegment mms ON c.PercentageChange = mms.MaxPercentageChange OR c.PercentageChange = mms.MinPercentageChange WHERE c.Segment IN ('SME', 'LAM', 'KAM') ORDER BY c.PercentageChange DESC;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*)       FROM gasstations g1      JOIN customers c ON g1.ChainID = c.CustomerID      WHERE c.Currency = 'EUR' AND g1.Country = 'Czech Republic' AND g1.Segment = 'Discount')     -     (SELECT COUNT(*)       FROM gasstations g2      JOIN customers c ON g2.ChainID = c.CustomerID      WHERE c.Currency = 'EUR' AND g2.Country = 'Slovakia' AND g2.Segment = 'Discount') AS DifferenceInDiscountStations;	debit_card_specializing
SELECT (SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') -         (SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS ConsumptionDifference;	debit_card_specializing
SELECT      SUM(CASE WHEN c.Currency = 'CZK' THEN 1 ELSE 0 END) -      SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) AS Difference FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID WHERE      c.Segment = 'SME'	debit_card_specializing
SELECT c.CustomerID, y.Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND y.Date = '201310' ORDER BY y.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT      c.CustomerID,      SUM(y.Consumption) AS TotalConsumption FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      c.Segment = 'KAM' GROUP BY      c.CustomerID ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(yearmonth.Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'KAM' AND yearmonth.Date = '201305';	debit_card_specializing
SELECT      ROUND((COUNT(*) * 100.0) / SUM(CASE WHEN c.Consumption > 46.73 THEN 1 ELSE 0 END), 2) AS Percentage FROM      yearmonth c JOIN      customers cu ON c.CustomerID = cu.CustomerID WHERE      cu.Segment = 'LAM'	debit_card_specializing
SELECT      gasstations.Country,     COUNT(*) AS TotalValueForMoneyGasStations FROM      gasstations JOIN      transactions_1k ON gasstations.GasStationID = transactions_1k.GasStationID JOIN      products ON transactions_1k.ProductID = products.ProductID WHERE      transactions_1k.Price * transactions_1k.Amount < (SELECT AVG(transactions_1k.Price * transactions_1k.Amount)                                                       FROM transactions_1k                                                       JOIN products ON transactions_1k.ProductID = products.ProductID) GROUP BY      gasstations.Country ORDER BY      TotalValueForMoneyGasStations DESC;	debit_card_specializing
SELECT     (COUNT(*) FILTER (WHERE c.Currency = 'EUR') * 100.0) / COUNT(*) FROM     customers c JOIN     transactions_1k t ON c.CustomerID = t.CustomerID WHERE     c.Segment = 'KAM'	debit_card_specializing
SELECT     (COUNT(*) FILTER (WHERE Consumption > 528.3) * 100.0) / COUNT(*) FROM     yearmonth WHERE     Date = '201202';	debit_card_specializing
SELECT      (COUNT(CASE WHEN g.Country = 'Slovakia' AND g.Segment = 'Premium' THEN 1 END) * 100.0) /      COUNT(CASE WHEN g.Country = 'Slovakia' THEN 1 END) AS PremiumGasStationPercentage FROM      gasstations g;	debit_card_specializing
SELECT CustomerID, SUM(Consumption) as TotalConsumption FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) as TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' GROUP BY c.CustomerID ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) AS HighestMonthlyConsumption FROM yearmonth WHERE Date LIKE '2012%';	debit_card_specializing
SELECT      ym.CustomerID,      (ym.Consumption / 12) AS MonthlyConsumption FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR' GROUP BY      ym.CustomerID,      ym.Date ORDER BY      MonthlyConsumption DESC LIMIT 1;	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN yearmonth y ON t.CustomerID = y.CustomerID AND t.Date = y.Date WHERE y.Date = '201309';	debit_card_specializing
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE LEFT(t.Date, 6) = '201306';	debit_card_specializing
SELECT g.ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY g.ChainID	debit_card_specializing
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(T.Price * T.Amount) AS AverageTotalPrice FROM transactions_1k AS T WHERE T.Date LIKE '2012-01%';	debit_card_specializing
SELECT COUNT(DISTINCT ym.CustomerID) FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY ym.CustomerID HAVING SUM(ym.Consumption) > 1000;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.ChainID = 11;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(T.Price) AS AverageTotalPrice FROM transactions_1k T JOIN gasstations G ON T.GasStationID = G.GasStationID WHERE G.Country = 'CZE';	debit_card_specializing
SELECT AVG(T.Price) AS AverageTotalPrice FROM customers C JOIN transactions_1k T ON C.CustomerID = T.CustomerID WHERE C.Currency = 'EUR';	debit_card_specializing
SELECT customers.CustomerID, SUM(transactions_1k.Amount * transactions_1k.Price) AS TotalSpent FROM customers JOIN transactions_1k ON customers.CustomerID = transactions_1k.CustomerID WHERE transactions_1k.Date = '2012-08-25' GROUP BY customers.CustomerID ORDER BY TotalSpent DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Time = '16:25:00' AND t.Date = '2012-08-24';	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-23' AND ym.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND EXISTS (     SELECT 1     FROM customers     WHERE customers.CustomerID = transactions_1k.CustomerID     AND customers.Currency = 'EUR' ) AND EXISTS (     SELECT 1     FROM products     WHERE products.ProductID = transactions_1k.ProductID     AND (products.Description LIKE '%EUR%' OR products.Description LIKE '%Euro%') );	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (     SELECT MIN(CustomerID)     FROM customers );	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00';	debit_card_specializing
SELECT t.ProductID FROM transactions_1k t WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT ym.Date, ym.Consumption FROM yearmonth ym WHERE ym.CustomerID = (     SELECT t1.CustomerID     FROM transactions_1k t1     JOIN customers c ON t1.CustomerID = c.CustomerID     WHERE t1.Date = '2012-08-24'     AND t1.Amount = 12405 ) AND ym.Date BETWEEN '2012-01-01' AND '2012-01-31';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.Time BETWEEN '08:00' AND '09:00' AND transactions_1k.Date = '2012-08-26' AND gasstations.Country = 'CZE';	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201306' AND ym.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CardID = 667467;	debit_card_specializing
SELECT c.Country FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-24' AND ym.Consumption = 548.4;	debit_card_specializing
SELECT      (SELECT COUNT(*)       FROM customers       WHERE Currency = 'EUR') * 100 /      (SELECT COUNT(*)       FROM yearmonth       WHERE Date = '2012-08-25'       AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR')) AS PercentageOfEURCustomers;	debit_card_specializing
SELECT      (SUM(CASE WHEN y.Date BETWEEN '2012-08-24' AND '2012-12-31' THEN y.Consumption ELSE 0 END) -      SUM(CASE WHEN y.Date BETWEEN '2013-01-01' AND '2013-08-24' THEN y.Consumption ELSE 0 END)) /      SUM(CASE WHEN y.Date BETWEEN '2012-08-24' AND '2012-12-31' THEN y.Consumption ELSE 0 END) * 100 AS ConsumptionDecreaseRate FROM      yearmonth y WHERE      y.CustomerID = (         SELECT              t.CustomerID          FROM              transactions_1k t          WHERE              t.Amount = 634.8 AND              DATE(t.Date) = '2012-08-25'     );	debit_card_specializing
SELECT GasStationID, SUM(Amount * Price) AS TotalRevenue FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID GROUP BY GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT      (SELECT SUM(Consumption) FROM yearmonth AS ym1      JOIN customers AS c ON ym1.CustomerID = c.CustomerID      WHERE c.Segment = 'Premium' AND ym1.Date LIKE '2023%'      AND c.Country = 'SVK') /      (SELECT SUM(Consumption) FROM yearmonth AS ym2      JOIN customers AS c ON ym2.CustomerID = c.CustomerID      WHERE c.Country = 'SVK') * 100 AS Premium_Percentage	debit_card_specializing
SELECT SUM(Amount) AS TotalAmount FROM transactions_1k WHERE CustomerID = 38508;  SELECT SUM(Amount) AS January2012Amount FROM transactions_1k WHERE CustomerID = 38508 AND Date = '201201';	debit_card_specializing
SELECT p.ProductID, p.Description, SUM(t.Amount * t.Price) as TotalSales FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.ProductID, p.Description ORDER BY TotalSales DESC LIMIT 5;	debit_card_specializing
SELECT      c.CustomerID,      AVG(t.Price / t.Amount) AS AvgPricePerItem,      c.Currency FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY      c.CustomerID,      c.Currency ORDER BY      AVG(t.Price / t.Amount) DESC LIMIT 1;	debit_card_specializing
SELECT g.Country, MAX(t.Price) AS MaxPrice FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE p.ProductID = 2 GROUP BY g.Country ORDER BY MaxPrice DESC LIMIT 1;	debit_card_specializing
SELECT y.Date, y.CustomerID, y.Consumption,         (t.Price / t.Amount) AS PricePerUnit FROM yearmonth y JOIN transactions_1k t ON y.CustomerID = t.CustomerID WHERE t.ProductID = 5 AND (t.Price / t.Amount) > 29.00 AND y.Date LIKE '201208%';	debit_card_specializing
