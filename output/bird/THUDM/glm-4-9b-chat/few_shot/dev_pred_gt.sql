SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestFreeRateK12 FROM frpm WHERE `County Name` = 'Alameda';	california_schools
SELECT      CDSCode,      `Percent (%) Eligible Free (Ages 5-17)` FROM      frpm WHERE      `Educational Option Type` = 'Continuation' ORDER BY      `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND s.District = 'Fresno County Office of Education';	california_schools
SELECT s.MailStreet, s.MailStreetAbr, s.MailCity, s.MailZip, s.MailState FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm)	california_schools
SELECT s.Phone FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`Charter Funding Type` = 'Directly funded' AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.AvgScrMath < 400 AND schools.Virtual = 'F';	california_schools
SELECT s.CDSCode, s.School, s.Magnet FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumTstTakr > 500 AND s.Magnet = 1;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 IS NOT NULL ORDER BY ss.NumGE1500 DESC LIMIT 1;	california_schools
SELECT satscores.NumTstTakr FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm)	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE s.AvgScrMath > 560 AND sch.FundingType = 'Directly funded';	california_schools
SELECT frpm.CDSCode, frpm.`FRPM Count (Ages 5-17)` FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrRead IS NOT NULL ORDER BY satscores.AvgScrRead DESC LIMIT 1;	california_schools
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;	california_schools
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`)  FROM frpm  WHERE `Percent (%) Eligible FRPM (Ages 5-17)` > 0.3	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.rtype = 'D' ORDER BY (sc.NumGE1500 / sc.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, frpm.`Enrollment (Ages 5-17)` FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode ORDER BY frpm.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT District, AVG(AvgScrRead) AS AvgReadScore FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.StatusType = 'Active' GROUP BY District ORDER BY AvgReadScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Alameda' AND satscores.NumTstTakr < 100;	california_schools
SELECT `Charter School Number` FROM frpm WHERE `AvgScrWrite` = 499;	california_schools
SELECT COUNT(*) FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.County = 'Contra Costa' AND schools.FundingType = 'Directly funded' AND satscores.NumTstTakr <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.AvgScrMath IS NOT NULL ORDER BY sc.AvgScrMath DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm WHERE `Low Grade` = '09' AND `High Grade` = '12' AND `County Code` = '01';	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles'   AND `Free Meal Count (K-12)` > 500   AND `Free Meal Count (K-12)` < 700;	california_schools
SELECT s.School, sname, SUM(NumTstTakr) AS TotalTestTakers FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.County = 'Contra Costa' GROUP BY s.School, sname ORDER BY TotalTestTakers DESC LIMIT 1;	california_schools
SELECT s.School, s.Street, s.StreetAbr, s.City, s.Zip, (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) AS EnrollmentDifference FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT s.School FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores sc ON s.CDSCode = sc.cds WHERE f.`Percent (%) Eligible Free (K-12)` > 0.1 AND sc.NumGE1500 IS NOT NULL AND sc.NumTstTakr > 0;	california_schools
SELECT s.School, s.FundingType FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Riverside' GROUP BY s.School, s.FundingType HAVING AVG(ss.AvgScrMath) > 400;	california_schools
SELECT      s.School AS SchoolName,     s.Street AS StreetAddress,     s.City AS City,     s.Zip AS ZipCode,     s.State AS State FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      f.County = 'Monterey' AND     f.`Percent (%) Eligible FRPM (Ages 5-17)` > 0 AND     f.`FRPM Count (Ages 5-17)` > 800 AND     s.SchoolType = 'High Schools (Public)';	california_schools
SELECT      s.School AS SchoolName,     ss.AvgScrWrite AS WritingScore,     s.Phone AS CommunicationNumber FROM      schools s JOIN      satscores ss ON s.CDSCode = ss.cds WHERE      (s.OpenDate > '1991-01-01' OR (s.ClosedDate < '2000-01-01' AND s.ClosedDate IS NOT NULL))	california_schools
WITH SchoolEnrollmentDifferences AS (     SELECT          s.CDSCode,         s.School,         s.DOCType,         (f.Enrollment('K-12') - f.Enrollment('Ages 5-17')) AS EnrollmentDifference     FROM          schools s     JOIN          frpm f ON s.CDSCode = f.CDSCode     WHERE          f.`Charter School (Y/N)` = 0 ), AverageDifference AS (     SELECT          AVG(EnrollmentDifference) AS AvgDiff     FROM          SchoolEnrollmentDifferences ) SELECT      sed.School,     sed.DOCType FROM      SchoolEnrollmentDifferences sed CROSS JOIN      AverageDifference WHERE      sed.EnrollmentDifference > AverageDifference.AvgDiff;	california_schools
SELECT OpenDate  FROM schools  WHERE `School Type` = 'K-12 Schools (Public)'  ORDER BY Enrollment (K-12) DESC  LIMIT 1;	california_schools
SELECT `City`, `Enrollment (K-12)` AS Enrollment FROM frpm WHERE `Enrollment (K-12)` IS NOT NULL ORDER BY `Enrollment (K-12)` ASC LIMIT 5;	california_schools
SELECT `Percent (%) Eligible Free (K-12)` FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 10;	california_schools
SELECT     `School Name`,     `FRPM Count (K-12)` / `Enrollment (K-12)` AS EligibleFreeMealRate FROM     frpm WHERE     `School Type` = 'K-12 Schools (Public)'     AND `Educational Option Type` = 'Traditional'     AND `School Code` IN (         SELECT             `School Code`         FROM             frpm         WHERE             `School Type` = 'K-12 Schools (Public)'             AND `Educational Option Type` = 'Traditional'         ORDER BY             `FRPM Count (K-12)` DESC         LIMIT 5     )     AND `School Code` IN (         SELECT             `School Code`         FROM             schools         WHERE             `DOCType` = '66'     ) ORDER BY     EligibleFreeMealRate DESC LIMIT 5;	california_schools
SELECT      s.School,      s.Website  FROM      frpm f  JOIN      schools s  ON      f.CDSCode = s.CDSCode  WHERE      f.FreeMealCount_Ages5_17 BETWEEN 1900 AND 2000;	california_schools
SELECT      frpm.`Percent (%) Eligible Free (Ages 5-17)` AS Free_Rate FROM      frpm JOIN      schools  ON      frpm.CDSCode = schools.CDSCode WHERE      schools.AdmFName1 = 'Kacey Gibson'	california_schools
SELECT s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`Enrollment (K-12)` = (SELECT MIN(`Enrollment (K-12)`) FROM frpm WHERE `Charter School (Y/N)` = 1);	california_schools
SELECT      s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3 FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      sc.NumGE1500 IS NOT NULL AND sc.NumGE1500 > 0 GROUP BY      s.CDSCode ORDER BY      SUM(sc.NumGE1500) DESC LIMIT 1;	california_schools
SELECT Street, City, Zip, State FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.rtype = 'D' ORDER BY (satscores.NumGE1500 / satscores.NumTstTakr) ASC LIMIT 1;	california_schools
SELECT s.Website FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.County = 'Los Angeles' AND sc.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(NumTstTakr) as AverageTestTakers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Fresno' AND YEAR(schools.OpenDate) = 1980;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.District = 'Fresno Unified' AND ss.AvgScrRead IS NOT NULL ORDER BY ss.AvgScrRead ASC LIMIT 1;	california_schools
SELECT s.CDSCode, s.School, AVG(s.AvgScrRead) AS AvgReadScore FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.Virtual = 'F' AND s.GSoffered = 'Virtual' AND s.GSserved = 'Virtual' GROUP BY s.CDSCode, s.School ORDER BY AvgReadScore DESC LIMIT 5;	california_schools
SELECT      frpm.Educational Option Type FROM      frpm JOIN      satscores ON frpm.CDSCode = satscores.cds JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      satscores.AvgScrMath IS NOT NULL ORDER BY      satscores.AvgScrMath DESC LIMIT 1;	california_schools
SELECT      s.County,      AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) AS AvgAllSubjectScore FROM      satscores AS sc JOIN      schools AS s ON sc.cds = s.CDSCode WHERE      sc.AvgScrRead IS NOT NULL AND sc.AvgScrMath IS NOT NULL AND sc.AvgScrWrite IS NOT NULL GROUP BY      s.County ORDER BY      AvgAllSubjectScore ASC LIMIT 1;	california_schools
SELECT s.City, AVG(satscores.AvgScrWrite) AS AvgWritingScore FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.NumGE1500 IS NOT NULL AND satscores.NumGE1500 > 0 GROUP BY satscores.cds, s.City ORDER BY satscores.NumGE1500 DESC LIMIT 1;	california_schools
SELECT s.School, AVG(ss.AvgScrWrite) as AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds JOIN frpm f ON s.CDSCode = f.CDSCode JOIN schools admin_schools ON s.School = admin_schools.School AND s.County = admin_schools.County AND s.District = admin_schools.District WHERE admin_schools.AdmFName1 = 'Ricci' AND admin_schools.AdmLName1 = 'Ulrich' GROUP BY s.School	california_schools
SELECT      s.CDSCode,      s.School,      SUM(f.Enrollment(K-12)) AS TotalEnrollment FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.DOC = '31' AND      f.Low_Grade = '1' AND      f.High_Grade = '12' GROUP BY      s.CDSCode, s.School ORDER BY      TotalEnrollment DESC LIMIT 1;	california_schools
SELECT      COUNT(*) / 12 AS MonthlyAverageSchoolsOpened FROM      schools WHERE      County = 'Alameda' AND      District = 'Elementary School District' AND      StatusType = 'Active' AND      OpenDate >= '1980-01-01' AND      OpenDate < '1981-01-01'	california_schools
SELECT      (SELECT COUNT(*)       FROM frpm       WHERE `District Type` = 'Unified School District'         AND `School Type` = 'Elementary Schools (Public)'        AND `DOC` = '54') AS UnifiedElementaryCount,     (SELECT COUNT(*)       FROM frpm       WHERE `District Type` = 'Unified School District'         AND `School Type` = 'K-12 Schools (Public)'        AND `DOC` = '54') AS UnifiedCount,     (SELECT COUNT(*)       FROM frpm       WHERE `District Type` = 'Elementary School District'         AND `School Type` = 'Elementary Schools (Public)'        AND `DOC` = '52') AS ElementaryCount,     (SELECT COUNT(*)       FROM frpm       WHERE `District Type` = 'Elementary School District'         AND `School Type` = 'K-12 Schools (Public)'        AND `DOC` = '52') AS MergedUnifiedCount FROM      (SELECT 1) AS dummy;	california_schools
SELECT      County,      COUNT(*) AS closed_schools_count,      GROUP_CONCAT(School ORDER BY closed_schools_count DESC) AS schools,      GROUP_CONCAT(ClosedDate ORDER BY closed_schools_count DESC) AS closure_dates FROM      schools WHERE      StatusType = 'Closed' GROUP BY      County ORDER BY      closed_schools_count DESC LIMIT 1;	california_schools
SELECT s.Street, s.StreetAbr, s.City, s.Zip, s.State, s.SchoolName FROM schools s JOIN (     SELECT sname, AVG(AvgScrMath) AS AvgMath     FROM satscores     JOIN schools ON satscores.cds = schools.CDSCode     GROUP BY sname     ORDER BY AvgMath DESC ) AS sats ON s.School = sats.sname WHERE s.StatusType = 'Active' ORDER BY sats.AvgMath DESC LIMIT 1 OFFSET 5;	california_schools
SELECT s.Street, s.StreetAbr, s.City, s.Zip, s.State, sch.SchoolName FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds JOIN frpm sch ON s.CDSCode = sch.CDSCode WHERE sc.AvgScrRead IS NOT NULL ORDER BY sc.AvgScrRead ASC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Lakeport' AND (satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite) >= 1500;	california_schools
SELECT s.CDSCode, s.MailCity, SUM(s.NumTstTakr) AS TotalTestTakers FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.MailCity = 'Fresno' GROUP BY s.CDSCode, s.MailCity;	california_schools
SELECT s.CDSCode, s.Zip AS MailingZip FROM schools s JOIN (     SELECT AdmLName1     FROM schools     WHERE AdmLName1 = 'Atoian' ) a ON s.AdmLName1 = a.AdmLName1;	california_schools
SELECT     (SELECT COUNT(*) FROM schools WHERE County = 'Colusa' AND State = 'CA') /      (SELECT COUNT(*) FROM schools WHERE County = 'Humboldt' AND State = 'CA') AS Ratio;	california_schools
SELECT COUNT(*) FROM schools WHERE State = 'CA' AND County = 'San Joaquin' AND StatusType = 'Active';	california_schools
SELECT s.Phone, s.Ext FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds ORDER BY ss.AvgScrWrite DESC LIMIT 1 OFFSET 332;	california_schools
SELECT School, Phone, Ext FROM schools WHERE Zip = '95203-3704';	california_schools
SELECT s.Website  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.AdmFName1 = 'Mike Larson' OR s.AdmFName2 = 'Mike Larson' OR s.AdmFName3 = 'Mike Larson'     OR s.AdmLName1 = 'Mike Larson' OR s.AdmLName2 = 'Mike Larson' OR s.AdmLName3 = 'Mike Larson'     OR s.AdmFName1 = 'Dante Alvarez' OR s.AdmFName2 = 'Dante Alvarez' OR s.AdmFName3 = 'Dante Alvarez'     OR s.AdmLName1 = 'Dante Alvarez' OR s.AdmLName2 = 'Dante Alvarez' OR s.AdmLName3 = 'Dante Alvarez';	california_schools
SELECT Website FROM schools WHERE Charter = 1 AND Virtual = 'P' AND County = 'San Joaquin';	california_schools
SELECT COUNT(*) FROM schools WHERE Charter = 1 AND DOC = '52' AND City = 'Hickman';	california_schools
SELECT COUNT(*) FROM frpm WHERE `Academic Year` = '2014-2015'   AND `Percent (%) Eligible Free (K-12)` < 0.18   AND `Charter School (Y/N)` = 0   AND `District Code` IN (     SELECT `District Code`     FROM schools     WHERE `County` = 'Los Angeles'   );	california_schools
SELECT      s.School,      s.City,      a.AdmFName1,      a.AdmLName1 FROM      schools s JOIN      schools a ON s.CDSCode = a.CDSCode WHERE      s.Charter = 1      AND a.CharterNum = '00D2';	california_schools
SELECT COUNT(*)  FROM schools  WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      (COUNT(CASE WHEN frpm.CharterFundingType = 'Locally funded' THEN 1 END) * 100.0) /      COUNT(*) AS PercentageLocallyFunded FROM      frpm WHERE      frpm.CountyName = 'Santa Clara'	california_schools
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND County = 'Stanislaus';	california_schools
SELECT SUM(CASE WHEN `School` IS NULL THEN 1 ELSE 0 END) AS TotalClosure FROM schools WHERE `City` = 'San Francisco' AND `ClosedDate` BETWEEN '1989-01-01' AND '1989-12-31' AND `StatusType` = 'Closed' AND `District` LIKE 'Community College District%';	california_schools
SELECT County, COUNT(*) AS ClosureCount FROM schools WHERE SOC = '11' AND OpenDate BETWEEN '1980-01-01' AND '1989-12-31' AND StatusType = 'Closed' GROUP BY County ORDER BY ClosureCount DESC LIMIT 1;	california_schools
SELECT NCESDist FROM schools WHERE SOCType = 'State Special Schools';	california_schools
SELECT      SUM(CASE WHEN StatusType = 'Active' THEN 1 ELSE 0 END) AS ActiveCount,     SUM(CASE WHEN StatusType = 'Closed' THEN 1 ELSE 0 END) AS ClosedCount FROM      schools WHERE      County = 'Alpine' AND      School LIKE 'District Community Day School%';	california_schools
SELECT District FROM schools WHERE City = 'Fresno' AND Magnet = 0;	california_schools
SELECT      SUM(`Enrollment (Ages 5-17)`) AS TotalEnrollment FROM      frpm WHERE      `Academic Year` = '2014-2015'     AND `EdOpsCode` = 'SSS'     AND `School Code` IN (         SELECT              `School Code`         FROM              schools         WHERE              `School` = 'State Special School'             AND `City` = 'Fremont'     );	california_schools
SELECT `Free Meal Count (Ages 5-17)` FROM frpm WHERE `School Code` IN (SELECT `School` FROM schools WHERE `MailStreet` = 'PO Box 1040' AND `StatusType` = 'Youth Authority');	california_schools
SELECT MIN(`Low Grade`) AS Lowest_Grade FROM frpm WHERE `Educational Option Type` = 'SPECON' AND `District Code` = (SELECT District FROM schools WHERE `CDSCode` = '613360');	california_schools
SELECT frpm.School Name, frpm.Educational Option Type FROM frpm WHERE frpm.County Code = '37' AND frpm.Educational Option Type = 'Breakfast Provision 2';	california_schools
SELECT City FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.EILCode = 'HS' AND frpm.Low_Grade = '9' AND frpm.High_Grade = '12' AND schools.County = 'Merced' AND frpm.`Educational Option Type` = 'Lunch Provision 2';	california_schools
SELECT      `School Name`,      `Percent (%) Eligible FRPM (Ages 5-17)` FROM      frpm WHERE      `Low Grade` = 'K' AND      `High Grade` = '9' AND      `County Name` = 'Los Angeles';	california_schools
SELECT `Grade Span Served` AS GradeSpan, COUNT(*) AS Count FROM schools WHERE City = 'Adelanto' GROUP BY `Grade Span Served` ORDER BY Count DESC LIMIT 1;	california_schools
SELECT      County,      COUNT(*) AS NumberOfSchools FROM      schools WHERE      Virtual = 'F' AND      County IN ('San Diego', 'Santa Barbara') GROUP BY      County ORDER BY      NumberOfSchools DESC LIMIT 1;	california_schools
SELECT `School Name`, Latitude FROM schools WHERE Latitude = (SELECT MAX(Latitude) FROM schools);	california_schools
SELECT s.City, s.School, s.Low_Grade FROM schools s WHERE s.State = 'CA' ORDER BY s.Latitude ASC LIMIT 1;	california_schools
SELECT      MAX(Longitude) AS MaxLongitude,      `High Grade`,      `Low Grade` FROM      frpm GROUP BY      `High Grade`,      `Low Grade` ORDER BY      MaxLongitude DESC LIMIT 1;	california_schools
SELECT      s.City,     COUNT(*) AS TotalSchools FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.Magnet = 1 AND     f.`Educational Option Type` LIKE '%Multiple%' GROUP BY      s.City;	california_schools
SELECT AdmFName1, District, COUNT(AdmFName1) as NameCount FROM schools WHERE AdmFName1 IS NOT NULL GROUP BY AdmFName1, District ORDER BY NameCount DESC LIMIT 2;	california_schools
SELECT frpm.`Percent (%) Eligible Free (K-12)`, frpm.`District Code` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode JOIN (     SELECT DISTINCT AdmFName1     FROM schools     WHERE AdmFName1 = 'Alusine' ) AS adm ON schools.AdmFName1 = adm.AdmFName1;	california_schools
SELECT      s.LastUpdate,      s.District,      s.County,      s.School,      s.AdmLName1 FROM      schools s WHERE      s.CharterNum = '40';	california_schools
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified' AND (DOC = '54' OR SOC = '62') AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND StatusType = 'Active';	california_schools
SELECT      s.AdmEmail1  FROM      schools s  JOIN      satscores sc ON s.CDSCode = sc.cds  WHERE      sc.NumGE1500 IS NOT NULL AND      sc.NumGE1500 = (SELECT MAX(sc2.NumGE1500) FROM satscores sc2 WHERE sc2.cds = s.CDSCode)	california_schools
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'East Bohemia' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT account.account_id) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'Prague' AND NOT EXISTS (     SELECT 1     FROM loan     WHERE loan.account_id = account.account_id );	financial
SELECT      CASE          WHEN A12 > A13 THEN '1995'         ELSE '1996'     END AS higher_unemployment_year,     MAX(A12) AS unemployment_rate_1995,     MAX(A13) AS unemployment_rate_1996 FROM district WHERE A12 IS NOT NULL AND A13 IS NOT NULL GROUP BY CASE              WHEN A12 > A13 THEN '1995'             ELSE '1996'         END;	financial
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000 AND A6 = 'F';	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE client.gender = 'M' AND district.A3 = 'North Bohemia' AND district.A11 > 8000;	financial
SELECT      a.account_id,      (SELECT MAX(A11) FROM district) - (SELECT MIN(A11) FROM district) AS salary_gap FROM      account a JOIN      client c ON a.district_id = c.district_id JOIN      district d ON c.district_id = d.district_id WHERE      c.gender = 'F' ORDER BY      d.A11 ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id ORDER BY c.birth_date DESC, d.A11 DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'PRIJEM' AND t.operation = 'VKLAD' AND a.frequency = 'POPLATEK PO OBRATU' AND d.type = 'DISPONENT';	financial
SELECT a.account_id, MIN(l.amount) AS min_approved_amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date BETWEEN '1997-01-01' AND '1997-12-31' AND a.frequency = 'POPLATEK TYDNE' GROUP BY a.account_id ORDER BY min_approved_amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND a.date LIKE '1993%';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 = 'Slokolov';	financial
SELECT a.account_id FROM account a WHERE a.date BETWEEN '1995-01-01' AND '1995-12-31' ORDER BY a.date ASC LIMIT 1;	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.balance > 3000 GROUP BY a.account_id;	financial
SELECT c.client_id FROM client c JOIN card cd ON c.client_id = cd.client_id WHERE cd.issued = '1994-03-03';	financial
SELECT a.date  FROM account a  JOIN trans t ON a.account_id = t.account_id  WHERE t.date = '1998-10-14' AND t.amount = 840;	financial
SELECT account.district_id FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.date = '1994-08-25';	financial
SELECT MAX(t.amount) AS max_transaction_amount FROM trans t JOIN card c ON t.account_id = c.account_id JOIN disp d ON t.account_id = d.account_id JOIN client cl ON d.client_id = cl.client_id WHERE c.issued = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id JOIN account a ON c.account_id = a.account_id WHERE d.A11 = (SELECT MAX(A11) FROM district) AND c.birth_date = (SELECT MIN(birth_date) FROM client);	financial
SELECT c.client_id, c.gender, c.birth_date, MIN(t.amount) AS first_transaction_amount FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.date = (SELECT MIN(trans_date) FROM trans WHERE account_id = a.account_id) AND l.amount = (SELECT MAX(amount) FROM loan) GROUP BY c.client_id, c.gender, c.birth_date	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN account a ON c.district_id = a.district_id  JOIN district d ON c.district_id = d.district_id  WHERE d.A2 = 'Jesenik' AND c.gender = 'F';	financial
SELECT d.disp_id FROM disp d JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id JOIN client c ON d.client_id = c.client_id WHERE t.amount = 5100   AND t.date = '1998-09-02'   AND t.type = 'PRIJEM';	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Litomerice' AND DATE_FORMAT(date, '%Y') = '1996';	financial
SELECT d.A2 FROM client c JOIN account a ON c.account_id = a.account_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM client c JOIN loan l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT account.account_id FROM account JOIN district ON account.district_id = district.district_id JOIN client ON account.district_id = client.district_id WHERE district.A3 = 'Prague' ORDER BY account.date LIMIT 1;	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(c.client_id) AS male_client_percentage FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A3 = 'Jihoceske' ORDER BY      d.A4 DESC LIMIT 1;	financial
SELECT      (a.balance - b.balance) / b.balance * 100 AS increase_rate FROM      account a JOIN      account b ON a.account_id = b.account_id JOIN      disp d ON a.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      a.date = '1998-12-27'     AND b.date = '1993-03-22'     AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE year(birth_date) = 1993 AND month(birth_date) = 7 AND day(birth_date) = 5);	financial
SELECT     (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) / SUM(l.amount)) * 100 AS paid_amount_percentage FROM     loan l;	financial
SELECT      (COUNT(CASE WHEN l.status = 'C' THEN 1 END) * 100.0) / COUNT(l.account_id) AS running_accounts_percentage FROM      loan l WHERE      l.amount < 100000;	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date = '1993-12-31' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT      account.account_id,      account.frequency FROM      account JOIN      disp ON account.account_id = disp.account_id JOIN      district ON disp.district_id = district.district_id WHERE      district.A3 = 'east Bohemia' AND      account.date BETWEEN '1995-01-01' AND '2000-12-31' JOIN      client ON disp.client_id = client.client_id;	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice';	financial
SELECT d.A2 AS district, d.A3 AS region FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount > 300000;	financial
SELECT      l.loan_id,      d.A3 AS district,      d.A11 AS average_salary FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      district d ON a.district_id = d.district_id WHERE      l.duration = 60;	financial
SELECT d.A2 AS district, (d.A13 - d.A12) / d.A12 * 100 AS unemployment_increment_percentage FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'D' AND d.A12 IS NOT NULL AND d.A13 IS NOT NULL;	financial
SELECT      (COUNT(CASE WHEN d.A2 = 'Decin' THEN a.account_id END) * 100.0) / COUNT(a.account_id) AS percentage_of_decin_accounts_opened_in_1993 FROM      account a JOIN      district d ON a.district_id = d.district_id WHERE      a.date LIKE '1993%';	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT      d.A2 AS district,      COUNT(c.client_id) AS female_account_holders FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      c.gender = 'F' GROUP BY      d.A2 ORDER BY      female_account_holders DESC LIMIT 10;	financial
SELECT d.A2 AS district_name, SUM(t.amount) AS total_withdrawals FROM district d JOIN trans t ON d.district_id = t.account_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dt ON a.district_id = dt.district_id LEFT JOIN card cr ON c.client_id = cr.disp_id WHERE dt.A3 = 'South Bohemia' AND cr.card_id IS NULL;	financial
SELECT district.A3, SUM(loan.amount) AS total_active_loan FROM district JOIN loan ON district.district_id = loan.account_id WHERE loan.status IN ('C', 'D') GROUP BY district.A3 ORDER BY total_active_loan DESC LIMIT 1;	financial
SELECT AVG(amount) AS average_loan_amount FROM loan JOIN client ON loan.account_id IN (     SELECT account_id     FROM disp     JOIN client ON disp.client_id = client.client_id     WHERE client.gender = 'M' );	financial
SELECT A2 AS branch_location, A3 AS district_name, A13 AS unemployment_rate FROM district WHERE A13 = (SELECT MAX(A13) FROM district WHERE EXTRACT(YEAR FROM date '1996-01-01') = 1996) AND EXTRACT(YEAR FROM date '1996-01-01') = 1996 ORDER BY A13 DESC;	financial
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A16 = (SELECT MAX(A16) FROM district WHERE A16 IS NOT NULL AND A2 LIKE 'Kladno');	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'PRIJEM' AND t.operation = 'VYBER KARTOU' AND t.balance < 0 AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(DISTINCT account.account_id) AS loan_count FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.amount >= 250000 AND account.frequency = 'POPLATEK MESICNE' AND loan.date BETWEEN '1995-01-01' AND '1997-12-31' AND loan.status = 'A';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Hl.m. Praha' AND (l.status = 'C' OR l.status = 'D');	financial
SELECT COUNT(c.client_id) AS male_clients_count FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A15 = (     SELECT A15     FROM district     WHERE A15 IN (         SELECT A15         FROM district         WHERE A15 < (SELECT MAX(A15) FROM district WHERE A15 IS NOT NULL)         ORDER BY A15 DESC         LIMIT 1     ) );	financial
SELECT COUNT(*) FROM card JOIN disp ON card.disp_id = disp.disp_id WHERE card.type = 'gold' AND disp.type = 'DISPONENT';	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Pisek';	financial
SELECT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.date BETWEEN '1997-01-01' AND '1997-12-31' GROUP BY d.A2 HAVING SUM(t.amount) > 10000;	financial
SELECT DISTINCT a.account_id FROM account a JOIN "order" o ON a.account_id = o.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek' AND o.k_symbol = 'SIPO';	financial
SELECT DISTINCT a.account_id FROM account AS a JOIN card AS c1 ON a.account_id = c1.account_id AND c1.type = 'gold' JOIN card AS c2 ON a.account_id = c2.account_id AND c2.type = 'junior';	financial
SELECT AVG(amount) AS average_credit_card_withdrawal FROM trans WHERE type = 'VYBER KARTOU' AND date >= '2021-01-01' AND date < '2022-01-01';	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYBER KARTOU' AND t.date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY c.client_id HAVING SUM(CASE WHEN t.date BETWEEN '1998-01-01' AND '1998-12-31' THEN t.amount ELSE 0 END) <      (SELECT AVG(t2.amount)       FROM trans t2      WHERE t2.type = 'VYBER KARTOU'      AND t2.date BETWEEN '1998-01-01' AND '1998-12-31')	financial
SELECT DISTINCT c.client_id, c.gender, c.birth_date, a.account_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN card crd ON a.account_id = crd.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' AND crd.type = 'gold';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 LIKE '%South Bohemia%';	financial
SELECT account.account_id FROM account JOIN disp ON account.account_id = disp.account_id JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Tabor' AND disp.type = 'OWNER';	financial
SELECT a.frequency FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A11 BETWEEN 8000 AND 9000 AND a.frequency != 'OWNER';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT DISTINCT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(A15) AS avg_crimes FROM district WHERE A3 IN (     SELECT A3     FROM district     WHERE A15 > 4000     AND EXISTS (         SELECT 1         FROM account         WHERE account.district_id = district.district_id         AND STRFTIME('%Y', account.date) >= '1997'     ) );	financial
SELECT COUNT(c.card_id)  FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN account a ON d.account_id = a.account_id WHERE c.type = 'classic' AND d.type = 'OWNER';	financial
SELECT COUNT(client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M';	financial
SELECT      (COUNT(CASE WHEN c.type = 'gold' AND c.issued < '1998-01-01' THEN 1 END) * 100.0) / COUNT(c.card_id) AS gold_card_percentage FROM card c;	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE d.type = 'OWNER' AND l.amount = (SELECT MAX(amount) FROM loan);	financial
SELECT district.A15 FROM district JOIN account ON district.district_id = account.district_id WHERE account.account_id = 532;	financial
SELECT account.district_id FROM account JOIN `order` ON account.account_id = `order`.account_id WHERE `order`.order_id = 33333;	financial
SELECT trans.account_id, trans.date, trans.amount FROM trans JOIN disp ON trans.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 3356 AND trans.operation IS NOT NULL AND trans.operation = 'VYBER';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT card.type FROM card JOIN disp ON card.card_id = disp.card_id JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 13539;	financial
SELECT d.A3 AS region FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = 3541;	financial
SELECT district.A2, COUNT(account.account_id) AS account_count FROM district JOIN account ON district.district_id = account.district_id JOIN loan ON account.account_id = loan.account_id WHERE loan.status = 'A' GROUP BY district.A2 ORDER BY account_count DESC LIMIT 1;	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN `order` o ON a.account_id = o.account_id WHERE o.order_id = 32423;	financial
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN district dt ON d.district_id = dt.district_id WHERE dt.district_id = 5;	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik');	financial
SELECT DISTINCT c.client_id FROM client c JOIN card crd ON c.client_id = crd.disp_id JOIN disp d ON crd.card_id = d.account_id JOIN account a ON d.account_id = a.account_id WHERE crd.type = 'junior' AND a.date >= '1997-01-01';	financial
SELECT     (SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM     client c JOIN     district d ON c.district_id = d.district_id WHERE     d.A11 > 10000;	financial
SELECT     ((SUM(CASE WHEN l.date BETWEEN '1997-01-01' AND '1997-12-31' THEN l.amount ELSE 0 END) -      SUM(CASE WHEN l.date BETWEEN '1996-01-01' AND '1996-12-31' THEN l.amount ELSE 0 END)) /      SUM(CASE WHEN l.date BETWEEN '1996-01-01' AND '1996-12-31' THEN l.amount ELSE 0 END) * 100) AS growth_rate FROM     loan l JOIN     client c ON l.account_id IN (SELECT account_id FROM disp WHERE client_id = c.client_id) WHERE     c.gender = 'M';	financial
SELECT COUNT(*) FROM trans WHERE type = 'PRIJEM' AND operation = 'VYBER KARTOU' AND date > '1995-01-01';	financial
SELECT      (SUM(CASE WHEN district.A3 = 'North Bohemia' THEN district.A16 ELSE 0 END) -      SUM(CASE WHEN district.A3 = 'East Bohemia' THEN district.A16 ELSE 0 END)) AS crime_difference FROM district WHERE district.A3 IN ('North Bohemia', 'East Bohemia') AND district.A4 = '1996';	financial
SELECT      SUM(CASE WHEN d.type = 'OWNER' THEN 1 ELSE 0 END) AS owner_count,     SUM(CASE WHEN d.type = 'DISPONENT' THEN 1 ELSE 0 END) AS disponent_count FROM      disp d JOIN      account a ON d.account_id = a.account_id WHERE      a.account_id BETWEEN 1 AND 10;	financial
SELECT COUNT(*) AS statement_requests FROM account WHERE account_id = 3 AND frequency = 'POPLATEK MESICNE';  SELECT SUM(amount) AS total_debit_amount FROM trans WHERE account_id = 3 AND operation = 'VYBER' AND k_symbol = '3539';	financial
SELECT client.birth_date FROM client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id WHERE account.account_id = 130 AND disp.type = 'OWNER';	financial
SELECT COUNT(DISTINCT d.account_id) FROM disp d JOIN account a ON d.account_id = a.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT     SUM(l.amount) AS total_debt,     (SUM(l.amount) - COALESCE(SUM(CASE WHEN t.operation = 'PRIJEM' THEN t.amount ELSE 0 END), 0)) AS outstanding_amount FROM     loan l LEFT JOIN     trans t ON l.account_id = t.account_id AND t.type = 'PRIJEM' WHERE     l.account_id IN (         SELECT             d.account_id         FROM             disp d         INNER JOIN             client c ON d.client_id = c.client_id         WHERE             c.client_id = 992     );	financial
SELECT SUM(t.amount) AS total_sum FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.client_id = 4 AND t.k_symbol = '851';	financial
SELECT card.type FROM card JOIN disp ON card.disp_id = disp.disp_id JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 9;	financial
SELECT SUM(trans.amount) AS total_payment FROM trans JOIN client ON trans.account_id IN (SELECT account_id FROM disp WHERE client_id = 617) WHERE YEAR(trans.date) = 1998;	financial
SELECT c.client_id FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A2 = 'East Bohemia';	financial
SELECT c.client_id FROM client c JOIN loan l ON c.client_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) AS male_customers_over_4000 FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN "order" o ON a.account_id = o.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND o.k_symbol = 'SIPO' AND o.amount > 4000;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Beroun' AND account.date > '1996-12-31';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card crd ON d.card_id = crd.card_id WHERE c.gender = 'F' AND crd.type = 'junior';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(DISTINCT d.account_id) AS female_customer_proportion FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      district dt ON c.district_id = dt.district_id WHERE      dt.A3 = 'Prague';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(CASE WHEN a.frequency = 'POPLATEK TYDNE' THEN 1 END) AS male_clients_percentage FROM      account a JOIN      client c ON a.account_id = c.district_id WHERE      a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT a.account_id, MIN(l.amount) AS min_amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' GROUP BY a.account_id ORDER BY min_amount ASC LIMIT 1;	financial
SELECT DISTINCT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.gender = 'F' AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F') ORDER BY c.A11 ASC LIMIT 1;	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE client.birth_date BETWEEN '1920-01-01' AND '1920-12-31' AND district.A3 = 'East Bohemia';	financial
SELECT COUNT(*) FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration = 24 AND account.frequency = 'POPLATEK TYDNE';	financial
SELECT      trans.date,     AVG(loan.amount) AS average_loan_amount FROM      trans JOIN      loan ON trans.account_id = loan.account_id WHERE      loan.status IN ('C', 'D')     AND trans.frequency = 'POPLATEK PO OBRATU' GROUP BY      trans.date;	financial
SELECT c.client_id, d.A2 AS district FROM client c JOIN disp d ON c.district_id = d.account_id WHERE d.type = 'OWNER';	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card crd ON d.disp_id = crd.disp_id JOIN account acc ON d.account_id = acc.account_id JOIN loan l ON acc.account_id = l.account_id WHERE crd.type = 'gold' AND l.status = 'A';	financial
SELECT bond_type, COUNT(bond_type) as count FROM bond GROUP BY bond_type ORDER BY count DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT a.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' AND a.element = 'cl';	toxicology
SELECT AVG(COUNT(c.atom_id) Filter (WHERE a.element = 'o')) AS avg_oxygen_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT AVG(CASE WHEN m.label = '+' THEN COUNT(c.bond_id) END)  FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' AND atom.element = 'na';	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT      ROUND(         (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100) / COUNT(a.atom_id),         2     ) AS percentage_carbon FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '='	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element <> 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099'   AND label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'si';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR004_8_9';	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '='	toxicology
SELECT m.label, COUNT(DISTINCT a.atom_id) AS total_atoms FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY total_atoms DESC LIMIT 1;	toxicology
SELECT bond.bond_type FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.element = 'te';	toxicology
SELECT DISTINCT c1.atom_id, c2.atom_id FROM connected c1 JOIN connected c2 ON c1.bond_id = c2.bond_id WHERE c1.bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-') AND c1.atom_id != c2.atom_id;	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN connected c2 ON c.atom_id2 = c2.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '-' AND a1.atom_id < a2.atom_id;	toxicology
SELECT element, COUNT(*) AS count FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY count ASC LIMIT 1;	toxicology
SELECT bond_type FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE (connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20')    OR (connected.atom_id = 'TR004_20' AND connected.atom_id2 = 'TR004_8');	toxicology
SELECT DISTINCT m.label FROM molecule m WHERE m.molecule_id NOT IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element != 'sn' )	toxicology
SELECT COUNT(*) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('i', 's') AND b.bond_type = '-';	toxicology
SELECT DISTINCT a1.atom_id, a2.atom_id FROM connected AS c1 JOIN connected AS c2 ON c1.bond_id = c2.bond_id JOIN bond AS b ON c1.bond_id = b.bond_id JOIN atom AS a1 ON c1.atom_id = a1.atom_id JOIN atom AS a2 ON c2.atom_id2 = a2.atom_id WHERE b.bond_type = '#' AND c1.atom_id2 = c2.atom_id AND c1.atom_id <> c2.atom_id2;	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.molecule_id = 'TR181' OR c.atom_id IN (     SELECT atom_id     FROM connected     WHERE atom_id = 'TR181' OR atom_id2 = 'TR181' )	toxicology
SELECT      (COUNT(CASE WHEN a.element = 'f' THEN 1 END) / COUNT(DISTINCT m.molecule_id)) * 100 AS percentage FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+' AND a.element != 'f'	toxicology
SELECT      COUNT(bond.bond_id) * 100.0 /      (SELECT COUNT(bond_id) FROM bond WHERE bond.molecule_id IN (         SELECT molecule.molecule_id FROM molecule WHERE molecule.label = '+'     )) AS percent FROM      bond JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      bond.bond_type = '#' AND      molecule.label = '+';	toxicology
SELECT element, COUNT(*) as frequency FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR000' AND element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') GROUP BY element ORDER BY element ASC LIMIT 3;	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_6' AND b.molecule_id = 'TR001';	toxicology
SELECT (SUM(CASE WHEN `molecule`.`label` = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN `molecule`.`label` = '-' THEN 1 ELSE 0 END)) AS `difference` FROM `molecule`	toxicology
SELECT atom_id, atom_id2  FROM connected  WHERE bond_id = 'TR_000_2_5';	toxicology
SELECT bond_id  FROM connected  WHERE atom_id = 'TR000_2' AND atom_id2 = 'TR000_2';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id, m.label ORDER BY m.label ASC LIMIT 5;	toxicology
SELECT      DIVIDE(SUM(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END), COUNT(bond.bond_id)) AS percent FROM      bond WHERE      bond.molecule_id = 'TR008'	toxicology
SELECT DIVIDE(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END), COUNT(molecule_id)) AS percent FROM molecule;	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id), 2) AS percent FROM      atom a WHERE      a.molecule_id = 'TR206';	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.molecule_id = 'TR000' OR a2.molecule_id = 'TR000';	toxicology
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR060';	toxicology
SELECT bond_type,         CASE WHEN COUNT(bond_type) = (SELECT MAX(bond_count) FROM (SELECT bond_type, COUNT(bond_type) as bond_count FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR018' GROUP BY bond_type) as max_bond_counts) THEN 'Majority'             ELSE 'Not Majority'        END as is_majority_bond,        CASE WHEN molecule.label = '+' THEN 'Carcinogenic'             ELSE 'Non-Carcinogenic'        END as carcinogenicity FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.molecule_id = 'TR018' GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1;	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN connected c ON m.molecule_id = c.bond_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-' AND m.label = '-' GROUP BY m.molecule_id ORDER BY COUNT(c.bond_id) DESC LIMIT 3;	toxicology
SELECT bond_id, bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR006' ORDER BY bond_type ASC, bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected WHERE bond_id LIKE 'TR009_%' AND (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12');	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT bond.bond_type, connected.atom_id, connected.atom_id2 FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR001_6_9';	toxicology
SELECT m.label AS molecule_label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10' AND m.label = '+';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#';	toxicology
SELECT COUNT(DISTINCT `bond_id`)  FROM `connected`  WHERE `atom_id` = 'TR%_19' OR `atom_id2` = 'TR%_19';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR004';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE CAST(SUBSTRING(a.atom_id, 7, 2) AS INTEGER) BETWEEN 21 AND 25 AND m.label = '+';	toxicology
SELECT c.bond_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'p' AND a2.element = 'n' UNION SELECT c.bond_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'n' AND a2.element = 'p';	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT AVG(COUNT(b.bond_id) / COUNT(a.atom_id))  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 'i';	toxicology
SELECT bond.bond_id, bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.atom_id = 'TR000_45' OR atom.atom_id = 'TR000_46';	toxicology
SELECT a.element FROM atom a WHERE a.atom_id NOT IN (SELECT c.atom_id FROM connected c) AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT c.atom_id, a.element FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE b.molecule_id = 'TR447' AND b.bond_type = '#';	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  WHERE c.bond_id = 'TR144_8_19';	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT element, COUNT(*) as count FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY element ORDER BY count LIMIT 1;	toxicology
SELECT DISTINCT a1.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a1.element = 'pb' AND c.atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'pb');	toxicology
SELECT DISTINCT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN connected c2 ON a1.atom_id = c2.atom_id2 JOIN atom a2 ON c2.atom_id = a2.atom_id WHERE b.bond_type = '#' AND a1.element IN ('c', 'cl', 's', 'o', 'n', 'p', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND a2.element IN ('c', 'cl', 's', 'o', 'n', 'p', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT      (COUNT(bond_id) /       (SELECT COUNT(DISTINCT atom_id)        FROM atom        JOIN connected ON atom.atom_id = connected.atom_id        WHERE bond_id IN (SELECT bond_id FROM connected                          GROUP BY bond_id                          ORDER BY COUNT(bond_id)                          DESC LIMIT 1))) * 100 AS percentage FROM bond;	toxicology
SELECT      DIVIDE(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END), COUNT(bond_id)) AS proportion_of_carcinogenic_single_bonds FROM      bond JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      bond_type = '-' AND molecule.label = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT DISTINCT a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id OR a1.atom_id = c.atom_id2 JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 's';	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.label = '+';	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS total_triple_bond_atoms FROM atom a JOIN bond b ON a.atom_id = b.molecule_id WHERE b.bond_type = '#' AND a.element IN ('p', 'br') AND a.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT      ROUND(DIVIDE(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END), COUNT(a.atom_id)), 2) AS percent_cl FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '-' WHERE      a.element = 'cl'	toxicology
SELECT `label` FROM `molecule` WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT m.molecule_id FROM molecule m WHERE m.label = '-';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR030'  AND label = '+';	toxicology
SELECT bond.bond_type FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT bond.bond_id) FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'i';	toxicology
SELECT MAX(m.label) AS predominant_label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca';	toxicology
SELECT EXISTS (   SELECT 1   FROM connected c   JOIN bond b ON c.bond_id = b.bond_id   JOIN atom a1 ON c.atom_id = a1.atom_id   JOIN atom a2 ON c.atom_id2 = a2.atom_id   WHERE b.bond_id = 'TR001_1_8'     AND (a1.element = 'cl' OR a2.element = 'cl')     AND (a1.element = 'c' OR a2.element = 'c') )	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'c' AND b.bond_type = '#' AND m.label = '-';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.molecule_id) AS percentage FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+' AND a.element = 'cl'	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR001';	toxicology
SELECT b.molecule_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '=';	toxicology
SELECT DISTINCT a1.atom_id AS first_atom, a2.atom_id AS second_atom FROM connected AS c1 JOIN connected AS c2 ON c1.atom_id = c2.atom_id2 JOIN bond AS b ON c1.bond_id = b.bond_id JOIN bond AS b2 ON c2.bond_id = b2.bond_id JOIN bond AS b3 ON b2.bond_id = b3.bond_id JOIN atom AS a1 ON c1.atom_id = a1.atom_id JOIN atom AS a2 ON c2.atom_id2 = a2.atom_id WHERE b.bond_type = '#' AND b3.bond_type = '#';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR005_16_26';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '+';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+'  AND SUBSTR(a.atom_id, 7, 1) = '4' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT     m.label,     (SELECT COUNT(a.element) FROM atom a WHERE a.molecule_id = 'TR006' AND a.element = 'h') /      (SELECT COUNT(a.element) FROM atom a WHERE a.molecule_id = 'TR006') AS ratio FROM     molecule m WHERE     m.molecule_id = 'TR006';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND m.label = '+';	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom AS a1 ON connected.atom_id = a1.atom_id JOIN atom AS a2 ON connected.atom_id2 = a2.atom_id WHERE a1.element = 'te' OR a2.element = 'te';	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN atom a2 ON a1.atom_id = SUBSTR('TR001_10_11', 7, 2) JOIN connected c ON c.atom_id = a1.atom_id OR c.atom_id2 = a1.atom_id JOIN bond b ON b.bond_id = c.bond_id JOIN atom a3 ON a3.atom_id = SUBSTR('TR001_10_11', 10, 2) WHERE b.bond_id = 'TR001_10_11' AND a3.element = 'o'	toxicology
SELECT      (SELECT COUNT(*) FROM bond WHERE bond_type = '#') * 100.0 /      (SELECT COUNT(*) FROM molecule) AS triple_bond_percentage;	toxicology
SELECT      DIVIDE(COUNT(CASE WHEN bond.bond_type = '=' THEN 1 END), COUNT(bond.bond_id)) AS percent FROM      bond WHERE      bond.molecule_id = 'TR047';	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_1';	toxicology
SELECT COUNT(*) > 0 AS is_carcinogenic FROM molecule WHERE molecule_id = 'TR151' AND label = '+';	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.molecule_id = 'TR151' AND a.element IN ('cl', 'br', 'i', 'pb', 'te');	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id BETWEEN 'TR010' AND 'TR050' AND a.element = 'c';	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT bond.bond_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND bond.bond_type = '=';	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'h';	toxicology
SELECT molecule.molecule_id FROM connected JOIN bond ON connected.bond_id = bond.bond_id JOIN atom AS atom1 ON connected.atom_id = atom1.atom_id JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id WHERE atom1.atom_id = 'TR000_1' AND bond.bond_id = 'TR000_1_2';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '+';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 100.0) / COUNT(m.molecule_id)  FROM      atom a  JOIN      connected c ON a.atom_id = c.atom_id  JOIN      molecule m ON a.molecule_id = m.molecule_id  WHERE      m.label = '+';	toxicology
SELECT EXISTS (   SELECT 1   FROM molecule   WHERE molecule_id = 'TR124' AND label = '+' ) AS is_carcinogenic;	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR186';	toxicology
SELECT bond_type  FROM bond  WHERE bond_id = 'TR007_4_19';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN connected c2 ON c.atom_id2 = c2.atom_id JOIN atom a2 ON c2.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) AS double_bonds_count,         CASE WHEN m.label = '+' THEN 'Yes' ELSE 'No' END AS is_carcinogenic FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.molecule_id = 'TR006' AND b.bond_type = '=';	toxicology
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT b.bond_id, a1.atom_id AS atom1, a2.atom_id AS atom2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT m.molecule_id, GROUP_CONCAT(DISTINCT a.element) AS elements FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE b.bond_type = '=' GROUP BY m.molecule_id;	toxicology
SELECT a1.element AS Atom1, a2.element AS Atom2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'cl';	toxicology
SELECT a.atom_id, COUNT(c.bond_id) AS bond_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS double_bond_carcinogenic_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id NOT IN (     SELECT m.molecule_id     FROM molecule     JOIN atom ON m.molecule_id = atom.molecule_id     JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2     JOIN bond ON connected.bond_id = bond.bond_id     WHERE bond.bond_type = '=' AND atom.element = 's' )	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT     DIVIDE(SUM(CASE WHEN `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '+') AND `element` = 'cl' THEN 1 ELSE 0 END), COUNT(DISTINCT `molecule_id`))     AS percentage FROM `atom` WHERE `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '+');	toxicology
SELECT `molecule_id` FROM `bond` WHERE `bond_id` = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2';	toxicology
SELECT m.label FROM molecule m JOIN atom a1 ON m.molecule_id = a1.molecule_id JOIN atom a2 ON m.molecule_id = a2.molecule_id WHERE a1.atom_id = 'TR000_2' AND a2.atom_id = 'TR000_4';	toxicology
SELECT `element` FROM `atom` WHERE `atom_id` = 'TR000_1';	toxicology
SELECT   m.molecule_id,   m.label FROM   molecule m WHERE   m.molecule_id = 'TR000'   AND m.label = '+';	toxicology
SELECT      (SELECT COUNT(*)       FROM bond       WHERE bond_type = '-') /      (SELECT COUNT(*)       FROM bond) * 100 AS percentage;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5 AND m.label = '-';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024';	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      (SUM(CASE WHEN `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '+')                AND `atom`.`element` = 'h'                AND `bond`.`bond_type` = '#'                THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT `molecule`.`molecule_id`) AS percentage_carcinogenic_triple_bond_h FROM `atom` JOIN `bond` ON `atom`.`molecule_id` = `bond`.`molecule_id` JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id`	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label = '-'	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.element = 'o' AND b.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' AND m.label = '-';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR016';	toxicology
SELECT a1.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id WHERE a1.element = 'c' AND b.bond_type = ' = ' AND a1.molecule_id = 'TR012';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT id, artist, asciiName, name, cardKingdomId FROM cards WHERE cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT c.name, c.setCode FROM cards c WHERE c.borderColor = 'borderless'   AND (c.cardKingdomFoilId IS NULL OR c.cardKingdomId IS NULL)	card_games
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards);	card_games
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015';	card_games
SELECT c.name, c.setCode FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned';	card_games
SELECT l.uuid, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.type LIKE '%Artifact%' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power = '*' OR c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT      c.name,      ru.text AS ruling_text,      CASE          WHEN c.hasContentWarning = 1 THEN 'Missing or Degraded'         ELSE 'No Missing or Degraded'     END AS properties_status FROM      cards c JOIN      rulings ru ON c.uuid = ru.uuid JOIN      (SELECT artist FROM cards WHERE artist = 'Stephen Daniel') AS sd ON c.artist = sd.artist;	card_games
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Sublime Epiphany' AND cards.number = '74s';	card_games
SELECT cards.name, cards.artist, cards.isPromo FROM cards JOIN rulings ON cards.uuid = rulings.uuid GROUP BY cards.uuid ORDER BY COUNT(rulings.uuid) DESC LIMIT 1;	card_games
SELECT ffl.language FROM cards c JOIN foreign_data ffl ON c.uuid = ffl.uuid WHERE c.name = 'Annul' AND c.number = '29';	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN st.language = 'Chinese Simplified' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage_of_cards_in_chinese_simplified FROM      cards c JOIN      set_translations st ON c.setCode = st.setCode	card_games
SELECT      s.code,      s.name,      s.totalSetSize  FROM      sets s  JOIN      set_translations st  ON      s.code = st.setCode  WHERE      st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type) AS numberOfTypes FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType  FROM cards  WHERE name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code JOIN cards c ON s.code = c.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isTextless = 0;	card_games
SELECT text  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Cloudchaser Eagle';	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT rulings.text FROM rulings JOIN cards ON cards.uuid = rulings.uuid WHERE cards.name = 'Benalish Knight';	card_games
SELECT DISTINCT artist  FROM cards  WHERE asciiName = 'Phyrexian';	card_games
SELECT      (COUNT(CASE WHEN cards.borderColor = 'borderless' THEN 1 END) * 100.0) / COUNT(cards.id) AS borderless_percentage FROM cards;	card_games
SELECT COUNT(*) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE cards.borderColor = 'borderless' AND set_translations.language = 'Russian';	card_games
SELECT      (COUNT(CASE WHEN fd.language = 'French' THEN 1 END) * 100.0) / COUNT(CASE WHEN c.isStorySpotlight = 1 THEN 1 END) FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords LIKE '%Flying%';	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%';	card_games
SELECT cards.id FROM cards WHERE cards.cardKingdomFoilId IS NOT NULL AND cards.cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT artist FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.language = 'Chinese Simplified';	card_games
SELECT id, artist, asciiName, name FROM cards WHERE availability = 'paper' AND language = 'Japanese';	card_games
SELECT COUNT(*) FROM cards WHERE status = 'Banned' AND borderColor = 'white';	card_games
SELECT c.uuid, fd.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data fd ON c.uuid = fd.uuid WHERE l.format = 'legacy';	card_games
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Beacon of Immortality';	card_games
SELECT COUNT(*) AS total_cards_with_future_frame_version FROM cards WHERE frameVersion = 'future' AND uuid IN (SELECT uuid FROM legalities WHERE status = 'legal');	card_games
SELECT c.name, c.colorIdentity FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW';	card_games
SELECT c.name, st.language FROM cards c JOIN set_translations st ON c.uuid = st.uuid JOIN sets s ON c.uuid = s.uuid WHERE c.convertedManaCost = 5 AND s.code = '10E';	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT colorIdentity, format FROM cards WHERE id BETWEEN 1 AND 20;	card_games
SELECT c.name, c.text FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language != 'English';	card_games
SELECT name FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.rarity = 'uncommon' ORDER BY rulings.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability LIKE '%mtgo%' AND hand = '-1';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal'   AND frameVersion = '2003'   AND borderColor = 'black'   AND availability LIKE '%paper%'   AND availability LIKE '%mtgo%';	card_games
SELECT SUM(convertedManaCost) AS totalUnconvertedManaCost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT type, supertypes, subtypes FROM cards WHERE availability = 'arena';	card_games
SELECT sets.code FROM cards JOIN set_translations ON cards.setCode = sets.code WHERE set_translations.language = 'Spanish';	card_games
SELECT      ROUND(         (COUNT(CASE WHEN cards.hand = '+3' THEN 1 END) * 100.0) / COUNT(cards.id),         2     ) AS legendary_card_percentage_with_max_hand_size_3 FROM      cards WHERE      cards.frameEffects = 'legendary'	card_games
SELECT      id,      ROUND(         (COUNT(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 END) * 100.0)          / COUNT(CASE WHEN isStorySpotlight = 1 THEN 1 END),          2     ) AS percentage_with_textbox FROM      cards WHERE      isStorySpotlight = 1 GROUP BY      id ORDER BY      percentage_with_textbox DESC;	card_games
SELECT name,         ROUND((SUM(CASE WHEN language = 'Spanish' THEN 1 ELSE 0 END) * 100.0) / COUNT(id), 2) AS percentage_Spanish FROM cards GROUP BY name ORDER BY percentage_Spanish DESC;	card_games
SELECT DISTINCT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE baseSetSize = 309);	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT id FROM cards WHERE type LIKE '%Creature%' AND uuid IN (SELECT uuid FROM legalities WHERE status = 'Legal');	card_games
SELECT DISTINCT CASE                 WHEN subtypes IS NOT NULL AND supertypes IS NOT NULL THEN subtypes || ' — ' || supertypes                 ELSE type               END AS cardTypeGerman FROM cards WHERE language = 'German'	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL AND (text LIKE '%triggered ability%' OR text LIKE '%Triggers when%');	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'premodern' AND       c.text LIKE '%triggered mana ability%' AND       c.side IS NULL;	card_games
SELECT id  FROM cards  WHERE artist = 'Erica Yang' AND availability = 'paper' AND uuid IN (     SELECT uuid      FROM legalities      WHERE format = 'pauper' );	card_games
SELECT cards.artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.text LIKE '%Das perfekte Gegenmittel zu einer dichten Formation%';	card_games
SELECT fd.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Matthew D. Wilson' AND c.type LIKE '%Creature%' AND c.layout = 'normal' AND c.borderColor = 'black' AND fd.language = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.rarity = 'rare' AND rulings.date = '2009-01-10';	card_games
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 180 AND s.block = 'Ravnica';	card_games
SELECT      (COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) * 100.0) / COUNT(c.id)  FROM      cards c  JOIN      legalities l ON c.uuid = l.uuid  WHERE      c.format = 'commander' AND      l.status = 'Legal';	card_games
SELECT      (COUNT(CASE WHEN fd.language = 'French' AND (c.power IS NULL OR c.power = '*') THEN 1 END) * 100.0) /      COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 END) AS percentage_french_no_power FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.power IS NULL OR c.power = '*'	card_games
SELECT      ROUND(         (COUNT(CASE WHEN s.type = 'expansion' THEN 1 END) * 100.0) / COUNT(CASE WHEN l.language = 'Japanese' THEN 1 END),         2     ) AS percentage_japanese_expansion_sets FROM      set_translations st JOIN      sets s ON st.setCode = s.code JOIN      legalities l ON s.code = l.uuid WHERE      l.language = 'Japanese';	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000 AND colorIdentity != ''	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name FROM cards WHERE (power IS NULL OR power = '*') AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934;	card_games
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3;	card_games
SELECT      (COUNT(CASE WHEN cards.isTextless = 1 THEN 1 END) * 100.0) / COUNT(*) FROM      cards WHERE      cards.layout = 'normal';	card_games
SELECT id, name, subtypes FROM cards WHERE subtypes LIKE '%Angel%'   AND subtypes LIKE '%Wizard%'   AND otherFaceIds IS NULL;	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3;	card_games
SELECT DISTINCT language FROM set_translations WHERE setCode = 'ARC' AND mcmName = 'Archenemy';	card_games
SELECT name, translation FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.id = 5;	card_games
SELECT st.language, s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206;	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode AND st.language = 'Italian' WHERE s.block = 'Shadowmoor' ORDER BY s.name LIMIT 2;	card_games
SELECT id FROM sets WHERE isForeignOnly = 1 AND isFoilOnly = 1 AND EXISTS (     SELECT 1     FROM set_translations     JOIN sets ON sets.code = set_translations.setCode     WHERE sets.code = sets.code AND set_translations.language = 'Japanese' );	card_games
SELECT s.name, s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode AND st.language = 'Russian' WHERE s.baseSetSize = (SELECT MAX(baseSetSize) FROM sets s2 JOIN set_translations st2 ON s2.code = st2.setCode AND st2.language = 'Russian') ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT      ROUND((COUNT(CASE WHEN isOnlineOnly = 1 THEN 1 END) / COUNT(*)) * 100, 2) AS percentage FROM      cards WHERE      language = 'Chinese Simplified';	card_games
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT name, asciiName, scryfallId FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language FROM set_translations WHERE setCode = '174';	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar';	card_games
SELECT code  FROM sets  WHERE releaseDate = '2007-07-13';	card_games
SELECT s.baseSetSize, s.code FROM sets s WHERE s.block = 'Masques' OR s.block = 'Mirage';	card_games
SELECT code  FROM sets  WHERE type = 'expansion';	card_games
SELECT      f.name,      c.type FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid WHERE      c.watermark = 'Boros';	card_games
SELECT fd.language, fd.flavorText, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'colorpie';	card_games
SELECT      (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0) / COUNT(c.id) AS percentage_with_cmc_10 FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Abyssal Horror';	card_games
SELECT code  FROM sets  WHERE type = 'expansion' AND name LIKE '%Commander%';	card_games
SELECT fd.name AS foreignName, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Abzan';	card_games
SELECT f.language, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Azorius' AND fd.language IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%'   AND hand LIKE '+%';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT faceConvertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes LIKE '%bundle%';	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE availability LIKE '%arena,mtgo%' AND borderColor = 'black';	card_games
SELECT      CASE          WHEN MAX(c1.convertedManaCost) > MAX(c2.convertedManaCost) THEN 'Serra Angel'         WHEN MAX(c1.convertedManaCost) < MAX(c2.convertedManaCost) THEN 'Shrine Keeper'         ELSE 'Equal'     END AS CardWithHigherManaCost FROM      cards c1 JOIN      cards c2 ON c1.name = 'Serra Angel' AND c2.name = 'Shrine Keeper';	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name, convertedManaCost FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.mtgoId = sets.mtgoId JOIN set_translations ON sets.code = set_translations.setCode WHERE cards.name = 'Angel of Mercy';	card_games
SELECT c.name FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS (     SELECT 1     FROM cards     JOIN foreign_data ON cards.uuid = foreign_data.uuid     WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'Korean' )	card_games
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex';	card_games
SELECT baseSetSize FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT translation  FROM set_translations  WHERE setCode = '8ED' AND language = 'Chinese Simplified';	card_games
SELECT s.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT releaseDate FROM sets JOIN cards ON sets.code = cards.setCode WHERE cards.name = 'Ancestor''s Chosen';	card_games
SELECT type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM sets WHERE block = 'Ice Age' AND id IN (SELECT id FROM set_translations WHERE language = 'Italian');	card_games
SELECT name FROM cards JOIN sets ON cards.setCode = sets.code WHERE name = 'Adarkar Valkyrie' AND sets.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode AND set_translations.language = 'Italian' WHERE sets.baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND cards.borderColor = 'black';	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT artist FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT number FROM cards WHERE setCode = 'Coldsnap' AND number = 4;	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL);	card_games
SELECT flavorText FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.language = 'Italian' AND cards.name = 'Ancestor''s Chosen';	card_games
SELECT language FROM foreign_data WHERE name = 'Ancestor''s Chosen' AND flavorText IS NOT NULL;	card_games
SELECT type  FROM foreign_data  JOIN cards ON foreign_data.uuid = cards.uuid  WHERE foreign_data.language = 'German' AND cards.name = 'Ancestor''s Chosen';	card_games
SELECT f.text AS ItalianText FROM cards c JOIN set_translations st ON c.setCode = st.setCode JOIN foreign_data f ON c.uuid = f.uuid WHERE st.language = 'Italian' AND st.setCode = (SELECT code FROM sets WHERE name = 'Coldsnap');	card_games
SELECT foreign_data.translation AS it_name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND foreign_data.language = 'Italian' ORDER BY cards.convertedManaCost DESC LIMIT 1;	card_games
SELECT date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce';	card_games
SELECT      (COUNT(*) FILTER (WHERE cards.convertedManaCost = 7) * 100.0) / COUNT(*) FROM      cards JOIN      sets ON cards.setCode = sets.code WHERE      sets.name = 'Coldsnap';	card_games
SELECT      (SUM(CASE WHEN cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM      cards WHERE      name = 'Coldsnap';	card_games
SELECT code  FROM sets  WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName  FROM sets  WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text, c.hasContentWarning FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' AND r.text IS NOT NULL;	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation';	card_games
SELECT baseSetSize  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Rinascita di Alara';	card_games
SELECT type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE translation = 'Huitième édition';	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code JOIN cards c ON s.code = c.setCode JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.name = 'Tendo Ice Bridge' AND st.language = 'French';	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.name = 'Salvat 2011' AND set_translations.translation IS NOT NULL;	card_games
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON s.code = c.setCode WHERE c.name = 'Fellwar Stone' AND st.language = 'Japanese';	card_games
SELECT name, MAX(convertedManaCost) AS highestCMC FROM cards WHERE name = 'Journey into Nyx Hero''s Path' GROUP BY name ORDER BY highestCMC DESC LIMIT 1;	card_games
SELECT releaseDate  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE translation = 'Ola de frío';	card_games
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3.0;	card_games
SELECT translation  FROM set_translations  WHERE language = 'Chinese Simplified' AND setCode = 'MIR';	card_games
SELECT      (SUM(CASE WHEN sets.isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100.0) /      SUM(CASE WHEN cards.language = 'Japanese' THEN 1 ELSE 0 END) FROM      cards JOIN      sets ON cards.setCode = sets.code WHERE      cards.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN sets.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) /      SUM(CASE WHEN sets.language = 'Portuguese (Brazil)' THEN 1 ELSE 0 END) AS percentage_online_only_brazil_portuguese FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.language = 'Portuguese (Brazil)';	card_games
SELECT DISTINCT availability  FROM cards  WHERE artist = 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT artist FROM cards WHERE side IS NULL AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE side IS NULL) AND artist IS NOT NULL;	card_games
SELECT MAX(frameEffects) AS most_common_frame_effect FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander'   AND isFoilOnly = 0   AND isForeignOnly = 0   AND isNonFoilOnly = 0   AND isOnlineOnly = 0   AND isPartialPreview = 0 ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT name, MAX(convertedManaCost) AS highestManaCost FROM cards WHERE uuid IN (SELECT uuid FROM legalities WHERE format = 'duel') GROUP BY name ORDER BY highestManaCost DESC LIMIT 10;	card_games
SELECT MIN(originalReleaseDate), s.format FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.rarity = 'mythic' AND c.status = 'legal' GROUP BY s.format ORDER BY originalReleaseDate ASC LIMIT 1;	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.artist = 'Volkan Baga'  AND foreign_data.language = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'rare' AND cards.types LIKE '%Enchantment%' AND cards.name = 'Abundance' AND legalities.status = 'Legal';	card_games
SELECT l.format, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'banned' GROUP BY l.format, c.name ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Battlebond');	card_games
SELECT artist, COUNT(*) as card_count FROM cards GROUP BY artist ORDER BY card_count ASC LIMIT 1;	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND l.format = 'legacy' AND c.hasContentWarning = 1 AND l.status = 'Legal';	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'banned';	card_games
SELECT AVG(id) AS annual_average_sets, MAX(COUNT(language)) AS common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(releaseDate);	card_games
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena';	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT r.text, r.date FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Hour of Devastation' AND legalities.status = 'Legal';	card_games
SELECT s.name FROM sets s LEFT JOIN set_translations st_japanese ON s.code = st_japanese.setCode AND st_japanese.language = 'Japanese' LEFT JOIN set_translations st_korean ON s.code = st_korean.setCode AND st_korean.language = 'Korean' WHERE st_japanese.translation IS NULL AND st_korean.translation IS NOT NULL;	card_games
SELECT frameVersion, name FROM cards WHERE artist = 'Allen Williams';  SELECT DISTINCT frameVersion, name FROM cards WHERE artist = 'Allen Williams' AND uuid IN (SELECT uuid FROM legalities WHERE status = 'banned');	card_games
SELECT      CASE          WHEN u.DisplayName = 'Harlan' THEN u.Reputation          WHEN u.DisplayName = 'Jarrod Dixon' THEN u.Reputation          ELSE NULL      END AS Reputation_Harlan,      CASE          WHEN u.DisplayName = 'Harlan' THEN NULL          WHEN u.DisplayName = 'Jarrod Dixon' THEN u.Reputation          ELSE NULL      END AS Reputation_JarrodDixon FROM users u WHERE u.DisplayName IN ('Harlan', 'Jarrod Dixon')	codebase_community
SELECT DisplayName  FROM users  WHERE year(CreationDate) = 2014;	codebase_community
SELECT COUNT(*)  FROM users  WHERE LastAccessDate > '2014-09-01 00:00:00'	codebase_community
SELECT DisplayName  FROM users  WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND EXTRACT(YEAR FROM CreationDate) > 2013;	codebase_community
SELECT COUNT(p.Id) as PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName AS OwnerDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT SUM(CommentCount) AS TotalComments FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT p.AnswerCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL	codebase_community
SELECT DISTINCT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE Age > 65) AND Score >= 20;	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian';	codebase_community
SELECT p.Id, p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags) ORDER BY p.Id LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND strftime('%Y', Date) = '2011';	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY b.UserId ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score) as AverageScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT AVG(badge_count) as avg_badges FROM (     SELECT COUNT(b.Id) as badge_count     FROM badges b     JOIN users u ON b.UserId = u.Id     JOIN posts p ON u.Id = p.OwnerUserId     WHERE p.ViewCount > 200     GROUP BY b.UserId ) as user_badges;	codebase_community
SELECT      (SELECT COUNT(*)       FROM posts p       JOIN users u ON p.OwnerUserId = u.Id       WHERE p.Score > 20 AND u.Age > 65) /       (SELECT COUNT(*)        FROM posts        WHERE Score > 20) * 100 AS PercentageOfElderUsers FROM posts;	codebase_community
SELECT COUNT(*)  FROM votes  WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM badges  WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(c.Id) AS comment_count FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 3025 AND c.CreationDate = '2014/4/23 20:29:39.0'	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 LIMIT 1;	codebase_community
SELECT p.PostId, p.Title, p.ClosedDate,         CASE WHEN p.ClosedDate IS NULL THEN 'Not closed' ELSE 'Closed' END AS PostStatus FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041);	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Tiago Pasqualini';	codebase_community
SELECT u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.Id = 381800;	codebase_community
SELECT SUM(CASE WHEN p.Title LIKE '%data visualization%' THEN v.BountyAmount ELSE 0 END) AS TotalVotes FROM posts p LEFT JOIN votes v ON p.Id = v.PostId	codebase_community
SELECT Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = 24) /      (SELECT COUNT(*) FROM votes WHERE UserId = 24) AS PostVoteRatio FROM      users WHERE      Id = 24;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT UserDisplayName FROM comments WHERE Text = 'thank you user93'	codebase_community
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT u.DisplayName AS EditorDisplayName, u.ProfileImageUrl AS EditorProfileImage FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data?';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY p.LastEditorUserId, u.WebsiteUrl;	codebase_community
SELECT c.Id, c.Text, c.CreationDate, c.UserId, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(BountyAmount) AS TotalBountyAmount FROM posts WHERE Title LIKE '%data%';	codebase_community
SELECT v.UserId, u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT AVG(p.ViewCount) AS average_view_count, p.Title, c.Text AS comment_text, c.Score AS comment_score FROM posts p LEFT JOIN comments c ON p.Id = c.PostId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'humor' GROUP BY p.Id ORDER BY p.Id;	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13;	codebase_community
SELECT Id AS UserId, MAX(Reputation) AS HighestReputation FROM users GROUP BY Id ORDER BY HighestReputation DESC LIMIT 1;	codebase_community
SELECT Id FROM users ORDER BY Views LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  WHERE b.Name = 'Supporter'  AND strftime('%Y', b.Date) = '2011';	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  WHERE b.Name IS NOT NULL  GROUP BY b.UserId  HAVING COUNT(b.Name) > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name IN ('Teacher', 'Supporter')  AND u.Location = 'New York';	codebase_community
SELECT      u.DisplayName,      u.Reputation  FROM      users u  JOIN      posts p  ON      u.Id = p.OwnerUserId  WHERE      p.Id = 1;	codebase_community
SELECT      u.DisplayName,      COUNT(DISTINCT ph.PostId) AS PostHistoryCount,      p.ViewCount FROM      users u JOIN      postHistory ph ON u.Id = ph.UserId JOIN      posts p ON ph.PostId = p.Id GROUP BY      u.DisplayName HAVING      COUNT(DISTINCT ph.PostId) = 1 AND p.ViewCount >= 1000;	codebase_community
SELECT      u.DisplayName,      b.Name AS Badge FROM      comments c JOIN      users u ON c.UserId = u.Id LEFT JOIN      badges b ON u.Id = b.UserId GROUP BY      u.Id, b.Name ORDER BY      COUNT(c.Id) DESC;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT      (         (SUM(CASE WHEN Year(b.Date) = 2010 THEN 1 ELSE 0 END) / COUNT(*)) -          (SUM(CASE WHEN Year(b.Date) = 2011 THEN 1 ELSE 0 END) / COUNT(*))     ) * 100 AS PercentageDifference FROM badges b;	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommentersCount FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;	codebase_community
SELECT p.Id, p.ViewCount AS Popularity FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT Score, LinkTypeId  FROM postLinks  WHERE PostId = 395;	codebase_community
SELECT posts.Id AS PostId, users.Id AS UserId FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount)  FROM posts p  JOIN votes v ON p.Id = v.PostId  WHERE p.LastActivityDate BETWEEN '2011-01-01' AND '2011-12-31'  AND v.UserId = 686;	codebase_community
SELECT AVG(u.UpVotes) + AVG(u.Age) AS avg_upvotes_and_age FROM users u JOIN (     SELECT OwnerUserId     FROM posts     GROUP BY OwnerUserId     HAVING COUNT(*) > 10 ) p ON u.Id = p.OwnerUserId;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE Score > 60;	codebase_community
SELECT Text  FROM comments  WHERE CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT      (COUNT(DISTINCT b.UserId) * 100.0) / COUNT(DISTINCT u.Id) AS PercentageOfUsersWithTeacherBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Teacher';	codebase_community
SELECT      ROUND(         (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN u.Id ELSE NULL END) * 100.0) / COUNT(u.Id),         2     ) AS PercentageOfTeenagers FROM      badges b JOIN      users u ON b.UserId = u.Id WHERE      b.Name = 'Organizer';	codebase_community
SELECT c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'Vienna, Austria'	codebase_community
SELECT COUNT(DISTINCT b.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.ViewCount FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Supporter' AND users.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName, MAX(Views) AS MaxViews FROM users WHERE Views IS NOT NULL GROUP BY DisplayName ORDER BY MaxViews DESC LIMIT 1;	codebase_community
SELECT DIVIDE(COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 END), COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 END)) AS VoteRatio FROM votes	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Stauffer';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo');	codebase_community
SELECT COUNT(v.Id) AS VoteCount FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT p.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT      CASE          WHEN SUM(CASE WHEN u.DisplayName = 'Harvey Motulsky' THEN p.ViewCount ELSE 0 END)               > SUM(CASE WHEN u.DisplayName = 'Noah Snyder' THEN p.ViewCount ELSE 0 END) THEN 'Harvey Motulsky'         ELSE 'Noah Snyder'      END AS MorePopularUser,     MAX(SUM(CASE WHEN u.DisplayName = 'Harvey Motulsky' THEN p.ViewCount ELSE 0 END)) -       MAX(SUM(CASE WHEN u.DisplayName = 'Noah Snyder' THEN p.ViewCount ELSE 0 END)) AS PopularityDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName = 'Harvey Motulsky' OR u.DisplayName = 'Noah Snyder' GROUP BY      u.DisplayName;	codebase_community
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Matt Parker'  AND (SELECT COUNT(*) FROM votes v WHERE v.PostId = p.Id) > 4;	codebase_community
SELECT COUNT(c.Id) AS NegativeCommentsCount FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score < 60 AND u.DisplayName = 'Neil McGuigan';	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND NOT EXISTS (     SELECT 1     FROM comments c     WHERE c.PostId = p.Id );	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT      (COUNT(CASE WHEN p.Id IN (SELECT PostId FROM posts p JOIN tags t ON p.Id = p.PostId WHERE t.TagName = 'r') THEN 1 END) * 100.0) /      COUNT(CASE WHEN u.DisplayName = 'Community' THEN 1 END) AS percentage FROM      posts p  JOIN      users u ON p.OwnerUserId = u.Id	codebase_community
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName IN ('Mornington', 'Amos');	codebase_community
SELECT COUNT(DISTINCT badges.UserId)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE badges.Name = 'Commentator' AND YEAR(badges.Date) = 2014;	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'	codebase_community
SELECT u.DisplayName, u.Age FROM users u ORDER BY u.Views DESC LIMIT 1;	codebase_community
SELECT      p.LastEditDate,      u.DisplayName AS LastEditorDisplayName,      p.LastEditorUserId FROM      posts p JOIN      users u ON p.LastEditorUserId = u.Id WHERE      p.Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score > 60;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND YEAR(b.Date) = 2011;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150;	codebase_community
SELECT     p.Title,     COUNT(ph.Id) AS PostHistoryCount,     MAX(ph.LastEditDate) AS LatestEditDate FROM     posts p JOIN     postHistory ph ON p.Id = ph.PostId WHERE     p.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY     p.Title;	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers' ORDER BY u.LastAccessDate DESC;	codebase_community
SELECT p.Title AS RelatedPostTitle FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'How to tell if something happened in a data set which monitors a value over time' AND pl.RelatedPostId = p.Id;	codebase_community
SELECT p.Id, b.Name FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(p.CreationDate) = 2013 AND YEAR(b.Date) = 2013;	codebase_community
SELECT OwnerDisplayName  FROM posts  WHERE ViewCount = (SELECT MAX(ViewCount) FROM posts);	codebase_community
SELECT u.DisplayName, u.Location FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN users u ON p.OwnerUserId = u.Id WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?'	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.Id = (     SELECT MAX(p2.Score)     FROM posts p2     WHERE p2.ParentId IS NOT NULL ) AND p.ParentId IS NOT NULL;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId  FROM posts  ORDER BY FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT MAX(Reputation) AS MaxReputation, MAX(Age) AS MaxAge FROM users;	codebase_community
SELECT COUNT(*) FROM posts JOIN votes ON posts.Id = votes.PostId WHERE YEAR(posts.CreaionDate) = 2011 AND votes.BountyAmount = 50;	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1;	codebase_community
SELECT p.Id, p.Score FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = (SELECT TagName FROM tags GROUP BY TagName ORDER BY MAX(Count) DESC LIMIT 1) ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT      COUNT(postLinks.Id) / 12 AS average_monthly_links FROM      postLinks JOIN      posts ON postLinks.PostId = posts.Id WHERE      YEAR(postLinks.CreationDate) = 2010 AND      posts.AnswerCount <= 2;	codebase_community
SELECT PostId FROM posts WHERE OwnerUserId = 1465 ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks)	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY b.UserId ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(CreationDate) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'chl') AND PostId IN (SELECT Id FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'chl')) ORDER BY CreationDate ASC LIMIT 1;	codebase_community
SELECT MIN(CreationDate) AS FirstPostDate FROM posts WHERE OwnerUserId IN (     SELECT Id FROM users ORDER BY Age ASC LIMIT 1 );	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(v.PostId) AS avg_posts_voted FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users);	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000	codebase_community
SELECT DISTINCT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens') AND YEAR(CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p WHERE p.Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT AVG(Score) AS average_score FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Stephen Turner')	codebase_community
SELECT DISTINCT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName AS OwnerDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      ROUND(         (COUNT(CASE WHEN p.OwnerUserId IN (SELECT Id FROM users WHERE Reputation > 1000 AND YEAR(p.CreationDate) = 2011) THEN 1 END) * 100.0) / COUNT(p.Id),         2     ) AS percentage FROM      posts p;	codebase_community
SELECT      (COUNT(CASE WHEN users.Age BETWEEN 13 AND 18 THEN 1 END) * 100.0 / COUNT(users.Id)) AS percentage FROM      users;	codebase_community
SELECT      p.ViewCount,      u.DisplayName AS NameWhoPostedLast FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Title = 'Computer Game Datasets' AND      p.LastEditorUserId = u.Id ORDER BY      p.LasActivityDate DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT MAX(Date) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett') AND Name = (SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett') ORDER BY Date DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT     u.CreationDate AS UserAccountCreationDate,     b.Date AS BadgeDate,     DATEDIFF(b.Date, u.CreationDate) AS TimeToGetBadge FROM     badges b JOIN     users u ON b.UserId = u.Id WHERE     u.DisplayName = 'Zolomon'	codebase_community
SELECT      u.Id,     COUNT(DISTINCT p.Id) AS post_count,     COUNT(DISTINCT c.Id) AS comment_count FROM      users u LEFT JOIN      posts p ON u.Id = p.OwnerUserId LEFT JOIN      comments c ON u.Id = c.UserId WHERE      u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY      u.Id;	codebase_community
SELECT c.Text AS CommentText, u.DisplayName AS CommentatorDisplayName FROM comments c JOIN users u ON c.UserId = u.Id JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts JOIN tags ON posts.Id = tags.ExcerptPostId WHERE tags.TagName = 'careers';	codebase_community
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT     (SELECT COUNT(*) FROM comments WHERE PostId = p.Id) AS CommentCount,     (SELECT COUNT(*) FROM posts WHERE PostTypeId = 1 AND ParentId = p.Id) AS AnswerCount FROM     posts p WHERE     p.Title = 'Clustering 1D data';	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE BountyAmount >= 30;	codebase_community
SELECT      (COUNT(CASE WHEN posts.Score >= 50 THEN posts.Id END) * 100.0) / COUNT(posts.Id) AS Percentage FROM      posts JOIN      users ON posts.OwnerUserId = users.Id WHERE      users.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How can I adapt ANOVA for binary data?';	codebase_community
SELECT c.Id, c.Text, c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT c.CreationDate, u.Age FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text LIKE '%http://%'	codebase_community
SELECT COUNT(DISTINCT c.PostId) AS posts_with_low_view_count FROM comments c WHERE c.Score = 0 AND c.PostId IN (     SELECT p.Id     FROM posts p     WHERE p.ViewCount < 5 );	codebase_community
SELECT COUNT(c.Id) AS ZeroScoreCommentsCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT users.Id) as TotalUsers40 FROM comments JOIN posts ON comments.PostId = posts.Id JOIN users ON comments.UserId = users.Id WHERE comments.Score = 0 AND users.Age = 40;	codebase_community
SELECT c.PostId, c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'R is also lazy evaluated.';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT DISTINCT c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0	codebase_community
SELECT      ROUND(         (COUNT(CASE WHEN c.UserId IS NOT NULL THEN c.UserId END AND c.UpVotes = 0 AND c.Score BETWEEN 5 AND 10)           / COUNT(CASE WHEN c.UserId IS NOT NULL THEN c.UserId END AND c.Score BETWEEN 5 AND 10),          2) * 100 AS percentage FROM comments c WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT hp.hero_id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;	superhero
SELECT superhero.full_name FROM superhero WHERE superhero.id IN (     SELECT hero_id     FROM hero_power     GROUP BY hero_id     HAVING COUNT(power_id) > 15 );	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT superhero.id)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Blond';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT superhero.full_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics'  ORDER BY superhero.height_cm DESC  LIMIT 1;	superhero
SELECT publisher_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero_name = 'Sauron';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' AND superhero.publisher_id = (     SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics' );	superhero
SELECT AVG(height_cm)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT      ROUND((SUM(CASE WHEN h.power_name = 'Super Strength' THEN 1 ELSE 0 END) * 100.0) / COUNT(h.id), 2) AS super_strength_percentage FROM      superhero s JOIN      hero_power hp ON s.id = hp.hero_id JOIN      superpower h ON hp.power_id = h.id WHERE      s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name, a.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Speed' AND a.attribute_value = (     SELECT MIN(attribute_value)     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Speed' )	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Gold') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero WHERE hair_colour_id IN (SELECT id FROM colour WHERE colour = 'Blond');	superhero
SELECT superhero_name, full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Intelligence' ORDER BY attribute_value ASC LIMIT 1;	superhero
SELECT race FROM superhero WHERE superhero_name = 'Copycat';	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Death Touch';	superhero
SELECT COUNT(DISTINCT superhero.id)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  JOIN gender ON superhero.gender_id = gender.id  WHERE gender.gender = 'Female'  AND attribute.attribute_name = 'Strength'  AND hero_attribute.attribute_value = 100;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name ORDER BY COUNT(hero_power.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT      ROUND((SUM(CASE WHEN a.alignment = 'Bad' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS bad_alignment_percentage,     SUM(CASE WHEN a.alignment = 'Bad' AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS bad_alignment_marvel_count FROM      superhero s JOIN      alignment a ON s.alignment_id = a.id JOIN      publisher p ON s.publisher_id = p.id WHERE      a.alignment = 'Bad';	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))      -      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference;	superhero
SELECT id  FROM publisher  WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute;	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name IS NULL;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superhero AS sup JOIN hero_power AS hp ON sup.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sup.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg)  FROM superhero  WHERE gender_id = 2;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.gender_id = 1 GROUP BY sp.power_name ORDER BY COUNT(sp.power_name) DESC LIMIT 5;	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.id = 56;	superhero
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT race_id  FROM superhero  WHERE weight_kg = 169;	superhero
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.hair_colour_id = c.id WHERE s.race_id = (SELECT id FROM race WHERE race = 'human') AND s.height_cm = 185;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT      ROUND((SUM(CASE WHEN s.publisher_id = 13 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_marvel_heroes FROM      superhero s WHERE      s.height_cm BETWEEN 150 AND 180;	superhero
SELECT full_name FROM superhero WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);	superhero
SELECT sp.power_name, COUNT(hp.power_id) as power_count FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id GROUP BY sp.power_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(*)  FROM superhero sp JOIN hero_power hp ON sp.id = hp.hero_id JOIN superpower spw ON hp.power_id = spw.id WHERE spw.power_name = 'stealth';	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Strength' )	superhero
SELECT AVG(superhero.id)  FROM superhero  WHERE skin_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE attribute_name = 'Durability' AND publisher_name = 'Dark Horse Comics' ORDER BY attribute_value DESC LIMIT 1;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Flight';	superhero
SELECT s.superhero_name, c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT      s.superhero_name,      p.publisher_name FROM      superhero s JOIN      colour AS eye_colour ON s.eye_colour_id = eye_colour.id JOIN      colour AS hair_colour ON s.hair_colour_id = hair_colour.id JOIN      colour AS skin_colour ON s.skin_colour_id = skin_colour.id JOIN      publisher p ON s.publisher_id = p.id WHERE      s.eye_colour_id = s.hair_colour_id      AND s.hair_colour_id = s.skin_colour_id;	superhero
SELECT race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.superhero_name = 'A-Bomb';	superhero
SELECT      ROUND((SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT h.id), 2) AS percentage_blue_female FROM      superhero h JOIN      colour c ON h.skin_colour_id = c.id WHERE      h.gender_id = 2;	superhero
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT gender.gender  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  WHERE superhero.superhero_name = 'Agent 13';	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Adaptation';	superhero
SELECT COUNT(power_id)  FROM hero_power  JOIN superhero ON hero_power.hero_id = superhero.id  WHERE superhero.superhero_name = 'Amazo';	superhero
SELECT sp.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.full_name = 'Hunter Zolomon';	superhero
SELECT superhero.height_cm FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Amber';	superhero
SELECT superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id AND eye_colour.colour = 'Black' JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id AND hair_colour.colour = 'Black';	superhero
SELECT superhero_name, colour.colour AS eye_colour FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Gold';	superhero
SELECT superhero.full_name FROM superhero WHERE superhero.race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT superhero_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral';	superhero
SELECT COUNT(*)  FROM superhero  WHERE attribute_value = (SELECT MAX(attribute_value)                           FROM hero_attribute                           JOIN attribute ON hero_attribute.attribute_id = attribute.id                           WHERE attribute.attribute_name = 'Strength');	superhero
SELECT race.race, alignment.alignment FROM superhero JOIN race ON superhero.race_id = race.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Cameron Hicks';	superhero
SELECT      ROUND(         (SUM(CASE WHEN gender.gender = 'Female' THEN 1 ELSE 0 END) * 100.0) /          COUNT(*),         2     ) AS percentage_female_marvel_heroes FROM      superhero JOIN      gender ON superhero.gender_id = gender.id JOIN      publisher ON superhero.publisher_id = publisher.id WHERE      publisher.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(weight_kg)  FROM superhero  WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT (SUM(weight_kg) - (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Charles Chandler')) AS weight_difference FROM superhero WHERE full_name = 'Emil Blonsky';	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed' ORDER BY attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = 7 AND hair_colour_id = 9;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT      ROUND((COUNT(CASE WHEN eye_colour_id = 7 THEN 1 END) * 100.0) / COUNT(*), 2) AS blue_eyes_percentage FROM superhero;	superhero
SELECT SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS male_female_ratio FROM superhero;	superhero
SELECT superhero_name, MAX(height_cm) as tallest_height FROM superhero ORDER BY tallest_height DESC LIMIT 1;	superhero
SELECT id  FROM superpower  WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT superhero_name, full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero AS sup JOIN hero_power AS hp ON sup.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sup.full_name = 'Helen Parr';	superhero
SELECT race FROM superhero WHERE weight_kg = 108 AND height_cm = 188;	superhero
SELECT publisher_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero.id = 38;	superhero
SELECT s.race_id, r.race FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN race r ON s.race_id = r.id WHERE ha.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute )	superhero
SELECT a.alignment, sp.power_name FROM superhero su JOIN alignment a ON su.alignment_id = a.id JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.superhero_name = 'Atom IV';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(ha.attribute_value)  FROM hero_attribute ha  JOIN superhero s ON ha.hero_id = s.id  WHERE s.alignment_id = 3;	superhero
SELECT s.superhero_name, c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 1 AND gender_id = 2;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_value BETWEEN 75 AND 80;	superhero
SELECT race.race  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  JOIN gender ON superhero.gender_id = gender.id  WHERE colour.colour = 'Blue' AND gender.gender = 'Male';	superhero
SELECT      ROUND((SUM(CASE WHEN alignment.id = 2 AND gender.id = 2 THEN 1 ELSE 0 END) /             SUM(CASE WHEN alignment.id = 2 THEN 1 ELSE 0 END)) * 100.0, 2) AS percentage_female_bad_heroes FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN gender ON superhero.gender_id = gender.id WHERE alignment.id = 2;	superhero
SELECT   (SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) -    SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END)) AS eye_colour_difference FROM superhero T1 WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL;	superhero
SELECT attribute_value FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Hulk' AND attribute.attribute_name = 'Strength';	superhero
SELECT sp.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.superhero_name = 'Ajax';	superhero
SELECT COUNT(*)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  JOIN colour ON superhero.skin_colour_id = colour.id  WHERE alignment.alignment = 'Bad' AND colour.colour = 'Green';	superhero
SELECT COUNT(*)  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE gender.gender = 'Female' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero_name ASC;	superhero
SELECT s.gender_id FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') ORDER BY weight_kg DESC LIMIT 1;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE race <> 'Human' AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;	superhero
SELECT   (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics'))   -   (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS diff_count	superhero
SELECT a.attribute_name FROM attribute a JOIN hero_attribute ha ON a.id = ha.attribute_id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Black Panther' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT superhero_name, full_name, height_cm FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT      ROUND(         (COUNT(CASE WHEN s.gender_id = 2 THEN 1 END) * 100.0) / COUNT(*),          2     ) AS percentage_female FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'George Lucas';	superhero
SELECT      ROUND(         (COUNT(CASE WHEN alignment = 'Good' THEN 1 END) * 100.0) / COUNT(*),          2     ) AS good_superhero_percentage FROM superhero WHERE publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);	superhero
SELECT full_name  FROM superhero  WHERE superhero_name = 'Alien';	superhero
SELECT superhero.full_name FROM superhero WHERE superhero.weight_kg < 100 AND superhero.eye_colour_id = (SELECT id FROM colour WHERE colour = 'Brown');	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT weight_kg, race FROM superhero WHERE id = 40;	superhero
SELECT AVG(height_cm)  FROM superhero  WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT hp.hero_id FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Intelligence';	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN results r ON d.driverId = r.driverId WHERE q.q1 IN (     SELECT MAX(q1)     FROM qualifying     WHERE raceId = 18 ) AND r.raceId = 18 AND r.statusId IN (SELECT statusId FROM status WHERE status = 'Eliminated');	formula_1
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19)	formula_1
SELECT DISTINCT s.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN seasons s ON r.year = s.year WHERE c.location = 'Shanghai';	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT c.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  JOIN seasons s ON r.year = s.year  WHERE c.country = 'Germany';	formula_1
SELECT cs.positionText FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN constructorStandings cs ON r.raceId = cs.raceId JOIN constructors co ON cs.constructorId = co.constructorId WHERE co.name = 'Renault';	formula_1
SELECT COUNT(*) FROM races WHERE year = 2010 AND circuitId NOT IN (     SELECT circuitId     FROM circuits     WHERE country = 'Malaysia' OR country = 'Bahrain' OR country = 'Turkey' OR country = 'Spain' );	formula_1
SELECT r.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'Spain';	formula_1
SELECT lat, lng FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Australian Grand Prix';	formula_1
SELECT races.url FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.name = 'Sepang International Circuit';	formula_1
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT lat, lng  FROM circuits  WHERE name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.name AS country FROM constructors AS con JOIN races AS r ON con.constructorId = r.raceId JOIN circuits AS cir ON r.circuitId = cir.circuitId JOIN constructorResults AS cr ON con.constructorId = cr.constructorId JOIN status AS s ON cr.statusId = s.statusId WHERE r.raceId = 24 AND cr.points = 1.0 AND s.status = 'Finished';	formula_1
SELECT q1 FROM qualifying JOIN drivers ON qualifying.driverId = drivers.driverId WHERE drivers.surname = 'Senna' AND raceId = 354;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '00:01:40' AND q.raceId = 355;	formula_1
SELECT d.number FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 903 AND q.q3 = '0:01:54';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2007 AND ra.name = 'Bahrain Grand Prix' AND r.statusId = 1 AND NOT EXISTS (     SELECT 1     FROM results r2     WHERE r2.driverId = d.driverId     AND r2.raceId = ra.raceId     AND r2.statusId = 1 );	formula_1
SELECT seasons.url FROM seasons JOIN races ON seasons.year = races.year WHERE races.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.date = '2015-11-29'  AND results.statusId = 1;	formula_1
SELECT d.driverRef, d.surname, d.forename, d.dob FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.raceId = 592 AND d.dob IS NOT NULL ORDER BY d.dob LIMIT 1;	formula_1
SELECT d.driverRef, d.url FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE lt.time = '0:01:27' AND r.raceId = 161;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId = 933 AND r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933)	formula_1
SELECT location, lat, lng  FROM circuits  WHERE name = 'Malaysian Grand Prix';	formula_1
SELECT constructors.url  FROM constructors  JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId  JOIN races ON constructorStandings.raceId = races.raceId  WHERE races.raceId = 9  AND constructorStandings.points = (SELECT MAX(points) FROM constructorStandings WHERE raceId = 9);	formula_1
SELECT q1 FROM qualifying JOIN drivers ON drivers.driverId = qualifying.driverId WHERE drivers.name = 'Lucas di Grassi' AND qualifying.raceId = (SELECT raceId FROM races WHERE raceId = 345);	formula_1
SELECT drivers.nationality FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId JOIN races ON qualifying.raceId = races.raceId WHERE races.raceId = 347 AND qualifying.q2 = '01:15:00';	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 45 AND q.q3 = '1:01:33';	formula_1
SELECT time  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.surname = 'McLaren' AND results.raceId = 743;	formula_1
SELECT d.surname, d.forename FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'San Marino Grand Prix' AND r.year = 2006 AND ds.position = 2;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId) AS driversFinished FROM driverStandings WHERE raceId IN (     SELECT raceId     FROM races     WHERE date = '2015-11-29' ) AND status = 'Finished';	formula_1
SELECT d.driverRef, d.forename, d.surname, d.dob FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.raceId = 872 AND ds.position IS NOT NULL ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT d.forename || ' ' || d.surname AS fullName FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = 348 ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT drivers.nationality FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.fastestLap = 1;	formula_1
SELECT      ( fastestLapSpeed(raceId = 853) - fastestLapSpeed(raceId = 854) ) / fastestLapSpeed(raceId = 853) * 100 AS percentage FROM      (SELECT fastestLapSpeed FROM results WHERE raceId = 853 AND driverId = (SELECT driverId FROM drivers WHERE name = 'Paul di Resta'))      AS race853,     (SELECT fastestLapSpeed FROM results WHERE raceId = 854 AND driverId = (SELECT driverId FROM drivers WHERE name = 'Paul di Resta'))      AS race854;	formula_1
SELECT      SUM(CASE WHEN results.time IS NOT NULL THEN 1 ELSE 0 END) AS completed,     COUNT(driverId) AS total FROM      results JOIN      races ON results.raceId = races.raceId WHERE      DATE(results.time) = '1983-07-16' GROUP BY      driverId	formula_1
SELECT MIN(year)  FROM races  WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*) AS total_races, r.name AS race_name FROM races r JOIN seasons s ON r.year = s.year WHERE s.year = 2005 ORDER BY r.name DESC;	formula_1
SELECT name FROM races WHERE year = (SELECT year FROM races ORDER BY date ASC LIMIT 1)   AND month(date) = (SELECT month(date) FROM races ORDER BY date ASC LIMIT 1);	formula_1
SELECT r.name, r.date FROM races r WHERE r.year = 1999 ORDER BY r.round DESC LIMIT 1;	formula_1
SELECT seasons.year, COUNT(races.raceId) AS numberOfRaces FROM seasons JOIN races ON seasons.year = races.year GROUP BY seasons.year ORDER BY numberOfRaces DESC LIMIT 1;	formula_1
SELECT r.name FROM races r WHERE r.year = 2017 AND r.circuitId NOT IN (     SELECT c.circuitId     FROM races r2     JOIN circuits c ON r2.circuitId = c.circuitId     WHERE r2.year = 2000 );	formula_1
SELECT c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.year = (SELECT MIN(year) FROM seasons WHERE url LIKE '%European Grand Prix%') AND c.country = 'Spain';	formula_1
SELECT MAX(year)  FROM races  WHERE name = 'British Grand Prix'  AND circuitRef = 'brands_hatch';	formula_1
SELECT COUNT(DISTINCT s.year)  FROM seasons s  JOIN races r ON s.year = r.year  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Silverstone Circuit' AND c.country = 'United Kingdom' AND r.name = 'British Grand Prix';	formula_1
SELECT d.forename, d.surname, ds.positionText FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Singapore Grand Prix' ORDER BY ds.position;	formula_1
SELECT drivers.forename, drivers.surname, MAX(driverStandings.points) AS max_points FROM drivers JOIN driverStandings ON drivers.driverId = driverStandings.driverId GROUP BY drivers.driverId ORDER BY max_points DESC LIMIT 1;	formula_1
SELECT d.surname, d.forename, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3;	formula_1
SELECT drivers.forename, drivers.surname, races.name AS race_name, lapTimes.time FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE lapTimes.milliseconds = (     SELECT MIN(milliseconds) FROM lapTimes );	formula_1
SELECT AVG(milliseconds) AS average_lap_time FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE drivers.surname = 'Vettel' AND races.name = 'Chinese Grand Prix' AND YEAR(races.date) = 2009;	formula_1
SELECT      (COUNT(CASE WHEN ds.position > 1 THEN 1 END) / COUNT(raceId)) * 100 AS percentage FROM      driverStandings ds JOIN      drivers d ON ds.driverId = d.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      d.surname = 'Hamilton' AND      r.year >= 2010;	formula_1
SELECT      d.forename,      d.surname,      d.nationality,      AVG(dr.points) as average_points FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId WHERE      ds.wins = (SELECT MAX(wins) FROM driverStandings) GROUP BY      d.driverId;	formula_1
SELECT      MIN(dob) AS youngest_dob,      d.name  FROM      drivers d  WHERE      d.nationality = 'Japanese'  GROUP BY      d.nationality  ORDER BY      youngest_dob ASC  LIMIT 1;	formula_1
SELECT DISTINCT c.name, c.circuitRef FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.year BETWEEN 1990 AND 2000 GROUP BY c.name, c.circuitRef HAVING COUNT(r.raceId) = 4;	formula_1
SELECT c.name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT races.name AS raceName, circuits.name AS circuitName, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE MONTH(races.date) = 9 AND YEAR(races.date) = 2005;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Yoong' AND res.position < 10;	formula_1
SELECT COUNT(*) FROM races JOIN constructorStandings ON races.raceId = constructorStandings.raceId JOIN constructors ON constructorStandings.constructorId = constructors.constructorId JOIN drivers ON constructors.constructorId = drivers.driverId WHERE drivers.surname = 'Schumacher' AND circuits.circuitRef = 'sepang' AND constructorStandings.wins > 0;	formula_1
SELECT r.name AS race, s.year FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId JOIN (     SELECT raceId, MIN(milliseconds) AS minMilliseconds     FROM lapTimes     GROUP BY raceId ) lt ON ra.raceId = lt.raceId AND r.raceId = lt.raceId JOIN seasons s ON ra.year = s.year WHERE d.surname = 'Schumacher' AND r.fastestLap = lt.raceId;	formula_1
SELECT AVG(points) AS avg_points FROM driverStandings JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.surname = 'Irvine' AND (SELECT year FROM seasons WHERE races.year = driverStandings.year) = 2000;	formula_1
SELECT      r.name AS race_name,      drs.points FROM      driverStandings drs JOIN      drivers d ON drs.driverId = d.driverId JOIN      races r ON drs.raceId = r.raceId JOIN      seasons s ON r.year = s.year WHERE      d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY      s.year ASC LIMIT 1;	formula_1
SELECT races.name, circuits.country, races.date FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE seasons.year = 2017 ORDER BY races.date;	formula_1
SELECT      r.name AS raceName,      s.year AS raceYear,      c.location AS circuitLocation,      MAX(r.laps) AS mostLaps FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId JOIN      seasons s ON r.year = s.year GROUP BY      r.raceId, s.year, c.location ORDER BY      mostLaps DESC LIMIT 1;	formula_1
SELECT      (COUNT(CASE WHEN c.country = 'Germany' THEN 1 END) * 100.0) / COUNT(r.name) AS percentage FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId WHERE      r.name = 'European Grand Prix';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT name, lat FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country, MAX(alt) AS highest_altitude FROM circuits WHERE alt IS NOT NULL GROUP BY country ORDER BY highest_altitude DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT d.nationality FROM drivers d JOIN (     SELECT MIN(dob) AS min_dob     FROM drivers ) AS oldest_driver WHERE d.dob = oldest_driver.min_dob;	formula_1
SELECT surname  FROM drivers  WHERE nationality = 'Italian';	formula_1
SELECT url FROM drivers WHERE surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT s.year FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT      c.name AS CircuitName,      c.url AS CircuitURL,      r.year,      r.round,      r.name AS RaceName,      r.date,      r.time,      r.url AS RaceURL FROM      races AS r JOIN      circuits AS c ON r.circuitId = c.circuitId WHERE      c.circuitRef = 'silverstone';	formula_1
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.circuitRef = 'abu_dhabi' AND r.year BETWEEN 2010 AND 2019;	formula_1
SELECT COUNT(DISTINCT r.raceId) AS race_count FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy';	formula_1
SELECT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT url FROM circuits WHERE circuitRef = 'catalunya' AND circuitId IN (     SELECT circuitId     FROM races     WHERE year = 2009 AND name = 'Spanish Grand Prix' );	formula_1
SELECT MIN(fastestLapTime) as fastestLapTime FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE r.fastestLap = 1 ORDER BY r.fastestLapSpeed DESC LIMIT 1;	formula_1
SELECT d.driverRef FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Australian Grand Prix' AND ds.positionText = '1' AND r.year = 2008;	formula_1
SELECT r.name AS RaceName, r.date AS RaceDate FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Hamilton' AND d.forename = 'Lewis';	formula_1
SELECT r.name AS RaceName FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Hamilton' ORDER BY res.rank ASC LIMIT 1;	formula_1
SELECT MAX(fastestLapSpeed) AS fastestLapSpeed FROM results WHERE raceId = (     SELECT raceId     FROM races     WHERE year = 2009 AND name = 'Spanish Grand Prix' )	formula_1
SELECT DISTINCT s.year FROM seasons s JOIN races r ON s.year = r.year JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Hamilton' AND d.forename = 'Lewis';	formula_1
SELECT rank  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'  AND results.raceId = (     SELECT raceId      FROM races      WHERE year = 2008 AND name = 'Australian Grand Prix' )  ORDER BY positionOrder DESC  LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.grid = 4;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2008 AND results.time IS NOT NULL;	formula_1
SELECT MIN(milliseconds) AS fastestLapTime FROM lapTimes WHERE driverRef = 'hamilton' AND raceId = (     SELECT raceId     FROM races     WHERE year = 2008 AND name = 'Australian Grand Prix' ) ORDER BY fastestLapTime ASC LIMIT 1;	formula_1
SELECT time  FROM results  JOIN races ON results.raceId = races.raceId  JOIN driverStandings ON results.driverId = driverStandings.driverId  WHERE races.year = 2008  AND races.name = 'Australian Grand Prix'  AND driverStandings.positionText = '2';	formula_1
SELECT      d.driverRef,      d.url FROM      results r JOIN      drivers d ON r.driverId = d.driverId JOIN      races ra ON r.raceId = ra.raceId JOIN      seasons se ON ra.year = se.year WHERE      se.year = 2008 AND      ra.name = 'Australian Grand Prix' AND      r.position = 1 AND      r.time LIKE '%:%:%.%';	formula_1
SELECT COUNT(*)  FROM drivers  JOIN driverStandings ON drivers.driverId = driverStandings.driverId  JOIN races ON driverStandings.raceId = races.raceId  WHERE drivers.nationality = 'American'  AND races.year = 2008  AND races.name = 'Australian Grand Prix';	formula_1
SELECT COUNT(DISTINCT driverId) FROM driverStandings WHERE raceId IN (     SELECT raceId     FROM races     WHERE year = 2008 AND positionText <> '' )	formula_1
SELECT SUM(points) as total_points FROM driverStandings JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT AVG(CAST(SUBSTR(fastestLapTime, 3, 2) * 60 + CAST(SUBSTR(fastestLapTime, 6, 2) AS INTEGER)) AS REAL) AS averageFastestLapTime FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton';	formula_1
SELECT      (COUNT(CASE WHEN r.time IS NOT NULL THEN r.raceId END) * 1.0) / COUNT(r.raceId) AS completionRate FROM      races r WHERE      r.year = 2008 AND r.name = 'Australian Grand Prix';	formula_1
SELECT     ((         SELECT milliseconds         FROM results         WHERE raceId = (             SELECT raceId             FROM races             WHERE year = 2008 AND name = 'Australian Grand Prix'         )         AND statusId = 1 AND position = 1     ) - (         SELECT milliseconds         FROM results         WHERE raceId = (             SELECT raceId             FROM races             WHERE year = 2008 AND name = 'Australian Grand Prix'         )         AND statusId = 1 AND position = (             SELECT MAX(position)             FROM results             WHERE raceId = (                 SELECT raceId                 FROM races                 WHERE year = 2008 AND name = 'Australian Grand Prix'             )         )     )     ) / (         SELECT milliseconds         FROM results         WHERE raceId = (             SELECT raceId             FROM races             WHERE year = 2008 AND name = 'Australian Grand Prix'         )         AND statusId = 1 AND position = (             SELECT MAX(position)             FROM results             WHERE raceId = (                 SELECT raceId                 FROM races                 WHERE year = 2008 AND name = 'Australian Grand Prix'             )         )     ) * 100 AS percentage_difference	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND dob > '1980-01-01';	formula_1
SELECT AVG(points) AS average_points FROM constructorStandings JOIN constructors ON constructorStandings.constructorId = constructors.constructorId JOIN drivers ON constructors.constructorId = drivers.driverId WHERE drivers.nationality = 'British';	formula_1
SELECT constructors.name, SUM(constructorResults.points) as total_points FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId GROUP BY constructors.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT constructors.name FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId JOIN races ON constructorStandings.raceId = races.raceId WHERE races.raceId = 291 AND constructorStandings.points = 0;	formula_1
SELECT COUNT(DISTINCT c.constructorId)  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Japanese' AND cs.points = 0  GROUP BY c.constructorId  HAVING COUNT(DISTINCT cs.raceId) = 2;	formula_1
SELECT DISTINCT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN constructors c ON d.driverId = c.constructorId  JOIN constructorResults cr ON c.constructorId = cr.constructorId  JOIN races r ON cr.raceId = r.raceId  JOIN lapTimes lt ON r.raceId = lt.raceId AND d.driverId = lt.driverId  WHERE d.nationality = 'French' AND lt.lap > 50;	formula_1
SELECT     (COUNT(DISTINCT d.driverId)      FILTER (WHERE r.time IS NOT NULL AND r.year BETWEEN 2007 AND 2009)     /     COUNT(DISTINCT d.driverId)     ) * 100 AS race_completion_percentage FROM     drivers d JOIN     driverStandings ds ON d.driverId = ds.driverId JOIN     races r ON ds.raceId = r.raceId WHERE     d.nationality = 'Japanese' AND     r.year BETWEEN 2007 AND 2009;	formula_1
SELECT     s.year,     AVG(TIME_TO_SEC(r.time)) AS average_time_seconds FROM     races r JOIN     driverStandings ds ON r.raceId = ds.raceId JOIN     drivers d ON ds.driverId = d.driverId JOIN     seasons s ON r.year = s.year JOIN     results rs ON d.driverId = rs.driverId AND r.raceId = rs.raceId WHERE     ds.position = 1     AND rs.time IS NOT NULL GROUP BY     s.year;	formula_1
SELECT d.forename, d.surname FROM drivers d WHERE d.dob > '1975-01-01' AND EXISTS (     SELECT 1     FROM driverStandings ds     JOIN drivers d ON ds.driverId = d.driverId     WHERE ds.positionText = '2'     AND d.driverId = d.driverId );	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN constructors c ON c.constructorId = ds.constructorId WHERE d.nationality = 'Italian' AND ds.position IS NULL;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes );	formula_1
SELECT lap FROM lapTimes JOIN driverStandings ON lapTimes.driverId = driverStandings.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE driverStandings.position = 1 AND races.year = 2009 ORDER BY lapTimes.milliseconds LIMIT 1;	formula_1
SELECT AVG(fastestLapSpeed)  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.name = 'Spanish Grand Prix';	formula_1
SELECT r.name, r.year FROM races r JOIN (     SELECT raceId, MIN(milliseconds) AS min_time     FROM results     WHERE milliseconds IS NOT NULL     GROUP BY raceId ) AS shortest_time ON r.raceId = shortest_time.raceId ORDER BY shortest_time.min_time ASC LIMIT 1;	formula_1
SELECT      (SELECT COUNT(DISTINCT d.driverId)       FROM drivers d       WHERE d.dob < '1985-01-01'       AND EXISTS (         SELECT 1          FROM results r          JOIN races ra ON r.raceId = ra.raceId          WHERE ra.year BETWEEN 2000 AND 2005          AND r.driverId = d.driverId          AND r.laps > 50      )     ) * 100.0 /      (SELECT COUNT(DISTINCT d.driverId)       FROM drivers d       WHERE d.dob < '1985-01-01'       AND EXISTS (         SELECT 1          FROM races ra          WHERE ra.year BETWEEN 2000 AND 2005          AND EXISTS (             SELECT 1              FROM results r              WHERE r.driverId = d.driverId              AND r.raceId = ra.raceId         )      )     ) AS percentage	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.seconds < 120;	formula_1
SELECT code  FROM drivers  WHERE nationality = 'American';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) AS numberOfDrivers FROM driverStandings WHERE raceId = 18;	formula_1
SELECT d.code, d.number FROM drivers d JOIN (     SELECT MIN(YEAR(d.dob)) as minYear     FROM drivers     WHERE nationality = 'Dutch' ) AS youngestDutch ON d.dob = youngestDutch.minYear AND d.nationality = 'Dutch' JOIN (     SELECT MIN(YEAR(d.dob)) as minAge     FROM drivers d     ORDER BY d.dob DESC     LIMIT 3 ) AS top3Youngest ON d.dob = top3Youngest.minAge ORDER BY d.number;	formula_1
SELECT driverRef FROM drivers WHERE surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'Australian' AND strftime('%Y', dob) = '1980';	formula_1
SELECT d.driverId, d.forename, d.surname, MIN(l.time) AS earliestLapTime FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY d.driverId, d.forename, d.surname ORDER BY earliestLapTime ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob = '1971-01-01' AND r.fastestLap IS NOT NULL;	formula_1
SELECT d.driverRef, d.forename, d.surname, d.dob, lt.time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'Spanish' AND d.dob < '1982-01-01' ORDER BY lt.time DESC LIMIT 10;	formula_1
SELECT DISTINCT s.year  FROM seasons s JOIN races r ON s.year = r.year JOIN results res ON r.raceId = res.raceId WHERE res.fastestLap IS NOT NULL ORDER BY res.fastestLapTime ASC LIMIT 1;	formula_1
SELECT s.year, MAX(l.time) as max_lap_time FROM races r JOIN lapTimes l ON r.raceId = l.raceId JOIN seasons s ON r.year = s.year GROUP BY s.year ORDER BY max_lap_time LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE raceId = 1 AND lap = 1 ORDER BY milliseconds ASC LIMIT 5;	formula_1
SELECT COUNT(*) FROM results WHERE raceId > 50 AND raceId < 100   AND statusId = 2   AND time IS NOT NULL;	formula_1
SELECT c.name, c.location, c.lat, c.lng, COUNT(r.circuitId) AS raceCount FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'Austria' GROUP BY r.circuitId	formula_1
SELECT r.round AS race_number, COUNT(DISTINCT r.raceId) AS finishers_count FROM races r JOIN results rs ON r.raceId = rs.raceId WHERE rs.time IS NOT NULL GROUP BY r.round ORDER BY finishers_count DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 IS NOT NULL AND q.raceId = 23;	formula_1
SELECT      s.year,      r.name AS race_name,      r.date,      r.time FROM      driverStandings ds JOIN      races r ON ds.raceId = r.raceId JOIN      drivers d ON ds.driverId = d.driverId JOIN      (         SELECT              MIN(year(dob)) AS youngest_year         FROM              drivers     ) youngest ON      d.dob = youngest.youngest_year WHERE      ds.position = 1 ORDER BY      s.year ASC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN status s ON r.statusId = s.statusId  WHERE d.nationality = 'American' AND s.status = 'Disqualified';	formula_1
SELECT c.name, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'Italian' ORDER BY cs.points DESC LIMIT 1;	formula_1
SELECT constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId JOIN races ON constructorStandings.raceId = races.raceId GROUP BY constructors.constructorId ORDER BY SUM(constructorStandings.wins) DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.surname, d.forename, MAX(lt.time) AS slowestLapTime FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 GROUP BY d.driverId ORDER BY MAX(lt.time) DESC LIMIT 1;	formula_1
SELECT r.name AS race_name, MIN(lt.milliseconds) AS fastest_lap_time FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId WHERE lt.position = 1 GROUP BY r.raceId, r.name ORDER BY fastest_lap_time ASC LIMIT 1;	formula_1
SELECT AVG(fastestLapTime) AS averageFastestLapTime FROM results WHERE raceId = (     SELECT raceId     FROM races     WHERE name = 'United States Grand Prix' AND year = 2006 ) AND rank < 11 AND fastestLap IS NOT NULL;	formula_1
SELECT d.driverRef, d.name, AVG(PS.duration) as avgPitStopDuration FROM drivers d JOIN pitStops PS ON d.driverId = PS.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverRef, d.name ORDER BY avgPitStopDuration ASC LIMIT 5;	formula_1
SELECT      d.surname,      d.forename,      r.time FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId JOIN      seasons s ON r.year = s.year WHERE      s.year = 2008      AND r.name = 'Canadian Grand Prix'     AND ds.position = 1     AND d.driverId = (         SELECT              driverId          FROM              driverStandings          WHERE              raceId = (                 SELECT                      raceId                  FROM                      races                  WHERE                      name = 'Canadian Grand Prix'                      AND year = 2008             )         ORDER BY              points DESC          LIMIT 1     );	formula_1
SELECT c.constructorRef, c.url FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId JOIN races r ON cs.raceId = r.raceId WHERE cs.year = 2009 AND r.name = 'Singapore Grand Prix' AND cs.position = 1;	formula_1
SELECT forename, surname, dob  FROM drivers  WHERE nationality = 'Austrian' AND dob BETWEEN '1981-01-01' AND '1991-12-31';	formula_1
SELECT d.forename || ' ' || d.surname AS fullName,         d.url,         d.dob  FROM drivers d  WHERE d.nationality = 'German'  AND d.dob BETWEEN '1971-01-01' AND '1985-12-31'  ORDER BY d.dob DESC;	formula_1
SELECT location, country, lat, lng  FROM circuits  WHERE circuitRef = 'hungaroring';	formula_1
SELECT      cs.points,      c.name,      c.nationality FROM      constructorStandings cs JOIN      constructors c ON cs.constructorId = c.constructorId JOIN      races r ON cs.raceId = r.raceId WHERE      r.name = 'Circuit de Monaco'     AND r.year BETWEEN 1980 AND 2010 ORDER BY      cs.points DESC LIMIT 1;	formula_1
SELECT AVG(points) AS average_score FROM races JOIN driverStandings ON races.raceId = driverStandings.raceId JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' AND races.name = 'Turkish Grand Prix';	formula_1
SELECT AVG(COUNT(raceId)) AS annual_average_races FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31';	formula_1
SELECT nationality  FROM drivers  GROUP BY nationality  ORDER BY COUNT(*) DESC  LIMIT 1;	formula_1
SELECT SUM(CASE WHEN ds.position = 91 THEN cs.wins ELSE 0 END) AS victories_by_91st_rank FROM driverStandings ds JOIN constructorStandings cs ON ds.constructorId = cs.constructorId JOIN constructors c ON cs.constructorId = c.constructorId JOIN results r ON ds.driverId = r.driverId AND ds.raceId = r.raceId WHERE cs.positionText = '91st'	formula_1
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN lapTimes ON results.driverId = lapTimes.driverId AND results.raceId = lapTimes.raceId WHERE lapTimes.fastestLapTime = (SELECT MIN(fastestLapTime) FROM lapTimes) ORDER BY results.positionOrder ASC LIMIT 1;	formula_1
SELECT c.location || ', ' || c.country AS full_location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(date) FROM races);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2008 AND c.name = 'Marina Bay Street Circuit' AND q.position = 1 AND q.q1 IS NULL AND q.q2 IS NULL AND q.q3 IS NOT NULL ORDER BY q.q3 ASC LIMIT 1;	formula_1
SELECT d.forename || ' ' || d.surname AS fullName, d.nationality, r.name AS raceName FROM drivers d JOIN races r ON d.driverId = (SELECT MIN(d2.driverId) FROM drivers d2 WHERE d2.dob = (SELECT MIN(d3.dob) FROM drivers d3)) WHERE d.dob = (SELECT MIN(d4.dob) FROM drivers d4);	formula_1
SELECT COUNT(*)  FROM results  JOIN races ON results.raceId = races.raceId  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.driverRef = (     SELECT drivers.driverRef      FROM results      JOIN races ON results.raceId = races.raceId      JOIN drivers ON results.driverId = drivers.driverId      WHERE races.name = 'Canadian Grand Prix'      JOIN status ON results.statusId = status.statusId      AND status.status = 'Accident'      GROUP BY drivers.driverRef      ORDER BY COUNT(*) DESC      LIMIT 1 )  JOIN status ON results.statusId = status.statusId  AND status.status = 'Accident'  AND races.name = 'Canadian Grand Prix';	formula_1
SELECT d.forename, d.surname, COUNT(*) AS wins FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.driverId;	formula_1
SELECT raceId, driverId, MAX(duration) as longestPitStopDuration FROM pitStops GROUP BY raceId, driverId ORDER BY longestPitStopDuration DESC LIMIT 1;	formula_1
SELECT MIN(milliseconds) AS fastestLapTime FROM lapTimes;	formula_1
SELECT MAX(duration) AS longest_pit_stop_time FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT pitStops.lap FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId JOIN races ON pitStops.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Australian Grand Prix' AND YEAR(races.date) = 2011;	formula_1
SELECT driverId, stop, duration FROM pitStops JOIN races ON pitStops.raceId = races.raceId WHERE races.name = 'Australian Grand Prix' AND year = 2011;	formula_1
SELECT MIN(milliseconds) AS fastestLapMilliseconds, time AS fastestLapTime, raceId FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') GROUP BY raceId ORDER BY fastestLapMilliseconds LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes );	formula_1
SELECT r.position FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId JOIN drivers d ON lt.driverId = d.driverId JOIN results rs ON lt.driverId = rs.driverId AND lt.raceId = rs.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND lt.time = (SELECT MIN(time) FROM lapTimes WHERE driverId = lt.driverId AND raceId = lt.raceId) AND r.name LIKE 'Formula_1%'	formula_1
SELECT MIN(milliseconds) AS fastest_lap_time FROM lapTimes WHERE raceId IN (     SELECT raceId     FROM races     WHERE name = 'Austrian Grand Prix' );	formula_1
SELECT      circuits.name AS circuit_name,      drivers.surname AS driver_surname,      drivers.forename AS driver_forename,      lapTimes.time AS fastest_lap_time FROM      lapTimes JOIN      drivers ON lapTimes.driverId = drivers.driverId JOIN      races ON lapTimes.raceId = races.raceId JOIN      circuits ON races.circuitId = circuits.circuitId WHERE      circuits.name = 'Circuit de Barcelona-Catalunya' OR circuits.name = 'Monaco Grand Prix' OR circuits.name = 'Autodromo Nazionale Monza' ORDER BY      fastest_lap_time;	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.circuitRef = 'austria' AND r.name LIKE '%Austrian Grand Prix%';	formula_1
SELECT pitStops.duration FROM pitStops JOIN races ON pitStops.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId JOIN lapTimes ON pitStops.raceId = lapTimes.raceId AND pitStops.driverId = lapTimes.driverId WHERE circuits.name = 'Austrian Grand Prix Circuit' AND lapTimes.position = 1	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN lapTimes lt ON c.circuitId = lt.raceId WHERE lt.time = '1:29.488';	formula_1
SELECT AVG(milliseconds) AS average_pit_stop_time FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE name = 'Lewis Hamilton');	formula_1
SELECT AVG(milliseconds)  FROM lapTimes  WHERE circuitId IN (     SELECT circuitId      FROM circuits      WHERE country = 'Italy' );	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT p.player_name, p.height FROM Player p WHERE p.height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT `Player_Attributes.preferred_foot` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player_Attributes.potential` = (SELECT MIN(`potential`) FROM `Player_Attributes`)	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating BETWEEN 60 AND 65 AND pa.defensive_work_rate = 'low';	european_football_2
SELECT player_api_id, player_name, MAX(crossing) AS best_crossing_rating FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id GROUP BY Player_Attributes.player_api_id, Player_name ORDER BY best_crossing_rating DESC LIMIT 5;	european_football_2
SELECT League.name, SUM(home_team_goal + away_team_goal) as total_goals FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY total_goals DESC LIMIT 1;	european_football_2
SELECT home_team_api_id, COUNT(*) as losses FROM Match WHERE season = '2015/2016' AND home_team_goal < away_team_goal GROUP BY home_team_api_id ORDER BY losses ASC LIMIT 1;	european_football_2
SELECT p.player_name, pa.penalties FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.penalties DESC LIMIT 10;	european_football_2
SELECT away_team_api_id, COUNT(*) as wins FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Scotland Premier League') AND season = '2009/2010' AND away_team_goal > home_team_goal GROUP BY away_team_api_id ORDER BY wins DESC LIMIT 1;	european_football_2
SELECT MAX(buildUpPlaySpeed) AS max_speed FROM Team_Attributes WHERE team_api_id IN (     SELECT team_api_id     FROM Team_Attributes     ORDER BY buildUpPlaySpeed DESC     LIMIT 4 );	european_football_2
SELECT League.name, COUNT(*) as draw_matches FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2015/2016' AND Match.home_team_goal = Match.away_team_goal GROUP BY League.name ORDER BY draw_matches DESC LIMIT 1;	european_football_2
SELECT     p.player_name,     (strftime('%Y-%m-%d %H:%M:%S', 'now', '-%Y-%m-%d %H:%M:%S', p.birthday) AS current_age) FROM     Player p JOIN     Player_Attributes pa ON     p.player_api_id = pa.player_api_id WHERE     pa.sprint_speed >= 97 AND     pa.date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00';	european_football_2
SELECT League.name, COUNT(Match.id) AS match_count FROM League JOIN Match ON League.id = Match.league_id GROUP BY League.id ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' GROUP BY player_api_id HAVING overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT team_fifa_api_id  FROM Team_Attributes  WHERE buildUpPlaySpeed BETWEEN 51 AND 59;	european_football_2
SELECT t.team_long_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE strftime('%Y', ta.date) = '2012' AND ta.buildUpPlayPassing IS NOT NULL GROUP BY t.team_long_name HAVING ta.buildUpPlayPassing >      (SELECT AVG(buildUpPlayPassing)       FROM Team_Attributes       WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing IS NOT NULL)	european_football_2
SELECT      (COUNT(CASE WHEN preferred_foot = 'left' THEN 1 END) * 1.0) / COUNT(player_fifa_api_id) AS left_foot_percentage FROM      Player WHERE      birthday BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00';	european_football_2
SELECT L.name, SUM(M.home_team_goal + M.away_team_goal) AS total_goals FROM League L JOIN Match M ON L.id = M.league_id GROUP BY L.id ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(long_shots) AS average_long_shots FROM Player_Attributes WHERE player_api_id = (     SELECT player_api_id     FROM Player     WHERE player_name = 'Ahmed Samir Farag' );	european_football_2
SELECT p.player_name, AVG(pa.heading_accuracy) AS avg_heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 GROUP BY p.player_api_id ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND T1.chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes AS T3 WHERE T3.buildUpPlayDribblingClass = 'Normal' AND T3.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY T1.chanceCreationPassing ASC;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2009/2010' AND AVG(M.home_team_goal) > AVG(M.away_team_goal) GROUP BY L.name ORDER BY AVG(M.home_team_goal) - AVG(M.away_team_goal) DESC;	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name FROM Player WHERE strftime('%Y', birthday) = '1970' AND strftime('%m', birthday) = '10';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_fifa_api_id` = (     SELECT `player_fifa_api_id`     FROM `Player`     WHERE `player_name` = 'Franco Zennaro' );	european_football_2
SELECT      `Team_Attributes`.`buildUpPlayPositioningClass` AS `freedom_of_movement` FROM      `Team_Attributes` JOIN      `Team` ON `Team_Attributes`.`team_fifa_api_id` = `Team`.`team_fifa_api_id` WHERE      `Team`.`team_long_name` = 'ADO Den Haag';	european_football_2
SELECT heading_accuracy  FROM Player_Attributes  WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Francois Affolter')  AND date = '2014-09-18 00:00:00';	european_football_2
SELECT `overall_rating` FROM `Player_Attributes` WHERE `player_fifa_api_id` IN (     SELECT `player_fifa_api_id`     FROM `Player`     WHERE `player_name` = 'Gabriel Tamas' ) AND strftime('%Y', `date`) = '2011';	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016';	european_football_2
SELECT preferred_foot FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.birthday = (     SELECT MIN(birthday)     FROM Player )	european_football_2
SELECT player_name, MAX(potential) AS highest_potential FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id GROUP BY player_name ORDER BY highest_potential DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.weight < 130 AND Player_Attributes.preferred_foot = 'left';	european_football_2
SELECT team_short_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE chanceCreationPassingClass = 'Risky';	european_football_2
SELECT defensive_work_rate FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'David Wilson';	european_football_2
SELECT p.birthday  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT name  FROM League  WHERE country_id = (SELECT id FROM Country WHERE name = 'Netherlands');	european_football_2
SELECT AVG(home_team_goal)  FROM Match  JOIN Country ON Match.country_id = Country.id  JOIN League ON Match.league_id = League.id  WHERE Country.name = 'Poland' AND League.name = 'Poland Ekstraklasa' AND Match.season = '2010/2011';	european_football_2
SELECT p.player_name, pa.overall_rating, pa.finishing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height = (SELECT MAX(height) FROM Player)    OR p.height = (SELECT MIN(height) FROM Player)    AND pa.finishing >= (SELECT MAX(AVG(finishing)) FROM Player_Attributes) ORDER BY pa.finishing DESC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p WHERE p.height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT `potential`  FROM `Player_Attributes` WHERE `player_api_id` = (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Aaron Doran' );	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.preferred_foot = 'left';	european_football_2
SELECT team_long_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `Team.team_short_name` = 'CLB';	european_football_2
SELECT team_short_name  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE buildUpPlayPassing > 70;	european_football_2
SELECT AVG(`overall_rating`) as average_rating FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `height` > 170 AND strftime('%Y', `date`) BETWEEN '2010' AND '2015';	european_football_2
SELECT player_name, height  FROM Player  ORDER BY height ASC  LIMIT 1;	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Italy Serie A';	european_football_2
SELECT team_short_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes`  WHERE `player_api_id` = (     SELECT `player_api_id`      FROM `Player`      WHERE `player_name` = 'Aaron Doran' );	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT team_short_name FROM Team JOIN Match ON Team.team_api_id = Match.home_team_api_id WHERE home_team_goal = 10;	european_football_2
SELECT p.player_name, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61) AND pa.potential = 61;	european_football_2
SELECT ABS(AVG(CASE WHEN pa.player_name = 'Abdou Diallo' THEN pa.ball_control ELSE 0 END) - AVG(CASE WHEN pa.player_name = 'Aaron Appindangoye' THEN pa.ball_control ELSE 0 END)) AS ball_control_difference FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name IN ('Abdou Diallo', 'Aaron Appindangoye');	european_football_2
SELECT team_long_name  FROM Team  WHERE team_short_name = 'GEN';	european_football_2
SELECT      p1.player_name AS Older_Player,      p1.birthday AS Birthday FROM      Player p1 JOIN      Player p2 ON p1.player_api_id = p2.player_api_id AND p1.player_name = 'Aaron Lennon' AND p2.player_name = 'Abdelaziz Barrada' WHERE      p1.birthday < p2.birthday;	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.preferred_foot = 'left' AND pa.attacking_work_rate = 'low';	european_football_2
SELECT Country.name  FROM Country  JOIN League ON Country.id = League.country_id  WHERE League.name = 'Belgium Jupiler League';	european_football_2
SELECT `name` FROM `League` WHERE `country_id` IN (SELECT `id` FROM `Country` WHERE `name` = 'Germany');	european_football_2
SELECT p.player_name, pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high';	european_football_2
SELECT p.player_name, pa.crossing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY pa.crossing DESC LIMIT 1;	european_football_2
SELECT heading_accuracy  FROM Player_Attributes  WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Ariel Borysiuk');	european_football_2
SELECT COUNT(*) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.height > 180 AND Player_Attributes.volleys > 70;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Belgium' AND Match.season = '2008/2009';	european_football_2
SELECT pa.long_passing FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.birthday = (SELECT MIN(birthday) FROM Player)	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League') AND strftime('%Y', date) = '2009' AND strftime('%m', date) = '04';	european_football_2
SELECT League.name, COUNT(Match.id) as match_count FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2008/2009' GROUP BY League.name ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE strftime('%Y', Player.birthday) < '1986';	european_football_2
SELECT   (SELECT overall_rating FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Ariel Borysiuk') AND date = (SELECT MAX(date) FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Ariel Borysiuk'))) -   (SELECT overall_rating FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Paulin Puel') AND date = (SELECT MAX(date) FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Paulin Puel'))) /   (SELECT overall_rating FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Paulin Puel') AND date = (SELECT MAX(date) FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Paulin Puel'))) * 100	european_football_2
SELECT AVG(buildUpPlaySpeed) AS average_build_up_speed FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating)  FROM Player_Attributes AS T1  JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(PA.crossing) AS total_crossing_score FROM Player_Attributes PA JOIN Player P ON PA.player_api_id = P.player_api_id WHERE P.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(`chanceCreationPassing`) AS highest_chance_creation_passing, `chanceCreationPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Ajax' GROUP BY `chanceCreationPassingClass` ORDER BY `chanceCreationPassing` DESC LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(overall_rating)  FROM Player_Attributes  JOIN Player T2 ON T2.player_api_id = Player_Attributes.player_api_id  WHERE T2.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(away_team_goal)  FROM Match  JOIN Team ON Match.away_team_api_id = Team.team_api_id  JOIN League ON Match.league_id = League.id  JOIN Country ON League.country_id = Country.id  WHERE Team.team_long_name = 'Parma' AND Country.name = 'Italy';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date = '2016-06-23' ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT overall_rating  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Mooy')  AND date = '2016-02-04 00:00:00';	european_football_2
SELECT `potential` FROM `Player_Attributes` WHERE `player_name` = 'Francesco Parravicini' AND `date` = '2010-08-30 00:00:00';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_name` = 'Francesco Migliore' AND `date` = '2015-05-01 00:00:00';	european_football_2
SELECT `defensive_work_rate` FROM `Player_Attributes` WHERE `player_api_id` IN (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Kevin Berigaud' ) AND `date` = '2013-02-22 00:00:00';	european_football_2
SELECT date FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Kevin Constant' ORDER BY crossing DESC LIMIT 1;	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'Willem II' AND date = '2012-02-22 00:00:00';	european_football_2
SELECT `buildUpPlayDribblingClass` FROM `Team_Attributes` WHERE `team_short_name` = 'LEI' AND `date` = '2015-09-10 00:00:00';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'FC Lorient' AND `date` = '2010-02-22'	european_football_2
SELECT chanceCreationPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'PEC Zwolle' AND Team_Attributes.date = '2013-09-20 00:00:00';	european_football_2
SELECT chanceCreationCrossingClass  FROM Team_Attributes  WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00';	european_football_2
SELECT `defenceAggressionClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Hannover 96' AND `date` = '2015-09-10 00:00:00';	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM Player_Attributes WHERE player_name = 'Marko Arnautovic' AND date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00';	european_football_2
SELECT      ((         (SELECT overall_rating           FROM Player_Attributes           WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')           AND date = '2013-07-12'     ) - (         SELECT overall_rating           FROM Player_Attributes           WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')           AND date = '2013-07-12'     )     ) / (         SELECT overall_rating           FROM Player_Attributes           WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')           AND date = '2013-07-12'     ) * 100 ) AS percentage_difference;	european_football_2
SELECT player_name  FROM Player  WHERE height = (SELECT MAX(height) FROM Player)  LIMIT 5;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p WHERE (strftime('%Y', 'now') - strftime('%Y', p.birthday)) > 35;	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Match JOIN Player ON Match.home_player_1 = Player.player_api_id OR               Match.home_player_2 = Player.player_api_id OR               Match.home_player_3 = Player.player_api_id OR               Match.home_player_4 = Player.player_api_id OR               Match.home_player_5 = Player.player_api_id OR               Match.home_player_6 = Player.player_api_id OR               Match.home_player_7 = Player.player_api_id OR               Match.home_player_8 = Player.player_api_id OR               Match.home_player_9 = Player.player_api_id OR               Match.home_player_10 = Player.player_api_id OR               Match.home_player_11 = Player.player_api_id WHERE Player.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(away_team_goal) AS total_away_goals FROM Match JOIN Player ON away_player_1 = player_api_id OR away_player_2 = player_api_id WHERE player_name IN ('Daan Smith', 'Filipe Ferreira');	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Match m ON p.player_api_id = m.home_player_1 OR p.player_api_id = m.home_player_2 OR p.player_api_id = m.home_player_3 OR p.player_api_id = m.home_player_4 OR p.player_api_id = m.home_player_5 OR p.player_api_id = m.home_player_6 OR p.player_api_id = m.home_player_7 OR p.player_api_id = m.home_player_8 OR p.player_api_id = m.home_player_9 OR p.player_api_id = m.home_player_10 OR p.player_api_id = m.home_player_11 WHERE strftime('%Y', 'now', '-31 year') > strftime('%Y', p.birthday) GROUP BY p.player_api_id;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (     SELECT MAX(overall_rating)     FROM Player_Attributes ) LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Match m ON p.player_api_id = m.home_player_1 OR p.player_api_id = m.home_player_2 OR p.player_api_id = m.home_player_3 OR p.player_api_id = m.home_player_4 OR p.player_api_id = m.home_player_5 OR p.player_api_id = m.home_player_6 OR p.player_api_id = m.home_player_7 OR p.player_api_id = m.home_player_8 OR p.player_api_id = m.home_player_9 OR p.player_api_id = m.home_player_10 OR p.player_api_id = m.home_player_11 JOIN Player_Attributes mate_pa ON mate_pa.player_api_id = m.home_player_1 OR mate_pa.player_api_id = m.home_player_2 OR mate_pa.player_api_id = m.home_player_3 OR mate_pa.player_api_id = m.home_player_4 OR mate_pa.player_api_id = m.home_player_5 OR mate_pa.player_api_id = m.home_player_6 OR mate_pa.player_api_id = m.home_player_7 OR mate_pa.player_api_id = m.home_player_8 OR mate_pa.player_api_id = m.home_player_9 OR mate_pa.player_api_id = m.home_player_10 OR mate_pa.player_api_id = m.home_player_11 WHERE pa.attacking_work_rate = 'high' AND mate_pa.attacking_work_rate = 'high';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY p.birthday LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Country c ON p.player_fifa_api_id = c.id WHERE c.name = 'Belgium';	european_football_2
SELECT p.player_name, c.name AS country_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Country c ON p.player_fifa_api_id = c.id WHERE pa.vision >= 90;	european_football_2
SELECT c.name, AVG(p.weight) as avg_weight FROM Player p JOIN Country c ON p.player_fifa_api_id = c.id GROUP BY c.name ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT t.team_long_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT T2.team_short_name FROM Team_Attributes AS TA JOIN Team AS T2 ON TA.team_api_id = T2.team_api_id WHERE TA.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE player_fifa_api_id IN (     SELECT player_fifa_api_id     FROM Player     JOIN Country ON Player.player_fifa_api_id = Country.id     WHERE Country.name = 'Italy' );	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT (SELECT jumping FROM Player_Attributes WHERE id = 6) - (SELECT jumping FROM Player_Attributes WHERE id = 23) AS jumping_score_difference;	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes WHERE preferred_foot = 'left' AND player_api_id = pa.player_api_id) AND pa.preferred_foot = 'left';	european_football_2
SELECT      (COUNT(*) FILTER (WHERE `strength` > 80 AND `stamina` > 80) * 100.0) / COUNT(*) AS percentage_above_80 FROM      Player_Attributes;	european_football_2
SELECT `Country.name` FROM `League` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `League.name` = 'Poland Ekstraklasa';	european_football_2
SELECT home_team_goal, away_team_goal  FROM Match  WHERE date LIKE '2008-09-24%' AND league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League') AND home_team_api_id IN (SELECT team_api_id FROM Team WHERE team_long_name = 'KRC Genk' OR team_long_name = 'Beerschot AC' OR team_long_name = 'SV Zulte-Waregem' OR team_long_name = 'Sporting Lokeren' OR team_long_name = 'KSV Cercle Brugge') AND away_team_api_id IN (SELECT team_api_id FROM Team WHERE team_long_name = 'KRC Genk' OR team_long_name = 'Beerschot AC' OR team_long_name = 'SV Zulte-Waregem' OR team_long_name = 'Sporting Lokeren' OR team_long_name = 'KSV Cercle Brugge');	european_football_2
SELECT      sprint_speed,      agility,      acceleration  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'Alexis Blin';	european_football_2
SELECT `buildUpPlaySpeedClass` FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A');	european_football_2
SELECT MAX(home_team_goal) AS highest_score FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Netherlands Eredivisie';	european_football_2
SELECT `Player_Attributes`.`finishing`, `Player_Attributes`.`curve` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id` WHERE `Player`.`weight` = (SELECT MAX(`weight`) FROM `Player`)	european_football_2
SELECT League.name, COUNT(Match.id) as game_count FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY game_count DESC LIMIT 1;	european_football_2
SELECT T2.team_long_name FROM Match AS M JOIN Team AS T1 ON M.away_team_api_id = T1.team_api_id WHERE M.away_team_goal = (SELECT MAX(away_team_goal) FROM Match) ORDER BY M.away_team_goal DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT      (COUNT(CASE WHEN p.height < 180 AND pa.overall_rating > 70 THEN 1 END) * 100.0) / COUNT(p.id) AS percentage_under_180_strength_over_70 FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id	european_football_2
SELECT     CASE         WHEN SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) > SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END) THEN 'In-patient'         ELSE 'Outpatient'     END AS MostFrequentAdmission,     ROUND(         100.0 * ABS(             SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) -              SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END)         ) / SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END),         2     ) AS PercentageDeviation FROM Patient;	thrombosis_prediction
SELECT      (SELECT COUNT(ID)       FROM Patient       WHERE YEAR(Birthday) > '1930' AND SEX = 'F') * 100.0 /      (SELECT COUNT(ID)       FROM Patient       WHERE SEX = 'F') AS PercentageOfFemalesBornAfter1930;	thrombosis_prediction
SELECT      ROUND((COUNT(*) * 100.0) /            (SELECT COUNT(*)             FROM Patient             WHERE YEAR(Birthday) BETWEEN 1930 AND 1940), 2) AS Inpatient_Percentage FROM Patient WHERE YEAR(Birthday) BETWEEN 1930 AND 1940 AND Admission = '+';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN p.Diagnosis = 'SLE' AND e.Admission = '+' THEN e.ID END) * 1.0) /      COUNT(CASE WHEN p.Diagnosis = 'SLE' AND e.Admission = '-' THEN e.ID END) FROM      Examination e JOIN      Patient p ON e.ID = p.ID WHERE      p.Diagnosis = 'SLE';	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p WHERE p.ID = 30609 UNION SELECT l.Date FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.ID = 30609;	thrombosis_prediction
SELECT      p.SEX,      p.Birthday,      e.`Examination Date`,      e.Symptoms  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      p.ID = 163109;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 500;	thrombosis_prediction
SELECT      p.ID,      EXTRACT(YEAR FROM (CURRENT_DATE - p.Birthday)) AS Age FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.RVVT = '+' AND     p.Birthday IS NOT NULL;	thrombosis_prediction
SELECT p.ID, p.SEX, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 2;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1937 AND l.`T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN P.SEX = 'F' AND L.TP < 6.0 OR L.TP > 8.5 THEN 1 END) * 100.0) / COUNT(P.ID) AS Percentage_Female_With_Abnormal_TP FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      P.SEX = 'F';	thrombosis_prediction
SELECT AVG(`aCL IgG`) AS Average_ACL_IgG FROM Examination WHERE Diagnosis LIKE '%MCTD%' AND `Examination Date` <= DATE('now', '-50 years') AND Admission = '+';	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Description) = 1997 AND Admission = '-';	thrombosis_prediction
SELECT MIN(SUBTRACT(YEAR(Birthday), YEAR(`First Date`))) AS Youngest_Age FROM Patient WHERE `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 1  AND P.SEX = 'F' AND YEAR(E.`Examination Date`) = 1997;	thrombosis_prediction
SELECT MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS AgeGap FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE TG >= 200 );	thrombosis_prediction
SELECT p.Description, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      CASE          WHEN MONTH(`Examination Date`) BETWEEN 1 AND 12 THEN MONTH(`Examination Date`)         ELSE 0      END AS Month,     COUNT(DISTINCT Patient.ID) / 12 AS AveragePatients FROM      Examination JOIN      Patient ON Examination.ID = Patient.ID WHERE      Patient.SEX = 'M'      AND `Examination Date` BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY      Month;	thrombosis_prediction
SELECT p.Birthday, lab.Date FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory lab ON p.ID = lab.ID AND lab.Date = (     SELECT MIN(lab2.Date)     FROM Laboratory lab2     WHERE lab2.ID = p.ID ) WHERE e.Diagnosis LIKE '%SJS%' ORDER BY p.Birthday LIMIT 1;	thrombosis_prediction
SELECT      SUM(CASE WHEN P.SEX = 'M' THEN 1 ELSE 0 END) / SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END) AS Male_to_Female_Ratio FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      (P.SEX = 'M' AND L.UA <= 8.0) OR (P.SEX = 'F' AND L.UA <= 6.5)	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE p.FirstDate IS NOT NULL  AND (e.ExaminationDate IS NULL OR (EXTRACT(YEAR FROM p.FirstDate) + 1) > EXTRACT(YEAR FROM e.ExaminationDate))	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Birthday < '1974-01-01' AND E.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31';	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.`T-BIL` > 2.0;	thrombosis_prediction
SELECT Diagnosis, COUNT(*) AS DiagnosisCount FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY DiagnosisCount DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(SUBTRACT(YEAR(CURRENT_DATE), YEAR(Birthday))) AS average_age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
SELECT      P.ID,     P.Diagnosis,     (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS AgeAtExamination FROM      Examination E JOIN      Patient P ON E.ID = P.ID WHERE      E.HGB = (SELECT MAX(HGB) FROM Examination)	thrombosis_prediction
SELECT `aCL IgG`, `aCL IgM`, `aCL IgA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT      T-CHO AS Total_Cholesterol  FROM      Laboratory  WHERE      ID = 2927464 AND      Date = '1995-09-04' AND      T-CHO IS NOT NULL  HAVING      T-CHO < 250;	thrombosis_prediction
SELECT p.SEX  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Diagnosis LIKE '%AORTITIS%' ORDER BY e.`Examination Date` LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM Examination WHERE `Examination Date` = '1993-11-12' AND ID IN (SELECT ID FROM Patient WHERE `Description` = '1994-02-19' AND Diagnosis = 'SLE');	thrombosis_prediction
SELECT P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT = 9 AND L.Date = '1992-06-12';	thrombosis_prediction
SELECT      P.ID,      P.Birthday,      (STRFTIME('%Y', '1991-10-21') - STRFTIME('%Y', P.Birthday)) AS AgeAtTestDate FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.UA = '8.4' AND      L.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(L.ID) AS TotalTests FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.`First Date` = '1991-06-13' AND P.Diagnosis = 'SJS' AND YEAR(L.Date) = 1995;	thrombosis_prediction
SELECT p.Diagnosis AS Original_Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.`First Date` = '1997-01-27' AND e.`Examination Date` = '1997-01-27' AND e.Diagnosis LIKE '%SLE%';	thrombosis_prediction
SELECT Symptoms FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday = '1959-03-01' AND Examination.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT      (SUM(CASE WHEN P.Birthday = '1959-02-18' AND L.Date LIKE '1981-11-%' THEN L.`T-CHO` ELSE 0 END) -       SUM(CASE WHEN P.Birthday = '1959-02-18' AND L.Date LIKE '1981-12-%' THEN L.`T-CHO` ELSE 0 END)) /       SUM(CASE WHEN P.Birthday = '1959-02-18' AND L.Date LIKE '1981-11-%' THEN L.`T-CHO` ELSE 1 END) AS DecreaseRate FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday = '1959-02-18' AND L.Date BETWEEN '1981-11-01' AND '1981-12-31';	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Diagnosis LIKE '%Behcet%' AND E.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT DISTINCT p.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND e.GPT > 30 AND e.ALB < 4;	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' ORDER BY ID;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 2 AND e.`ANA Pattern` = 'S' AND e.`aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination);	thrombosis_prediction
SELECT     ROUND(         (SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) /           SUM(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN 1 ELSE 0 END)) * 100,         2     ) AS Percentage FROM     Laboratory WHERE     `U-PRO` > 0 AND `U-PRO` < 30	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Diagnosis` = 'BEHCET' THEN 1 ELSE 0 END) * 100.0) /      COUNT(`First Date`) FROM      Patient WHERE      `SEX` = 'M' AND      YEAR(`First Date`) = 1981	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Description, p.`First Date`, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-'    AND l.Date LIKE '1991-10%'   AND l.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE `ANA Pattern` != 'P' AND Patient.SEX = 'F' AND Patient.Birthday BETWEEN '1980-01-01' AND '1989-12-31';	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID AND e.Examination_Date = l.Date WHERE e.Diagnosis = 'PSS'    AND l.CRP > 2    AND l.CRE = 1    AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(ALB) AS Average_Blood_Albumin FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'F' AND Patient.Diagnosis LIKE '%SLE%' AND Laboratory.PLT > 400;	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis LIKE '%SLE%' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1;	thrombosis_prediction
SELECT p.Birthday, pat.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 48473 ORDER BY p.FirstDate LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.SEX = 'F' AND Examination.Diagnosis LIKE '%APS%';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = 1997 AND l.TP > 6 AND l.TP < 8.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Symptoms` LIKE '%ITP%' THEN 1 ELSE 0 END) / SUM(CASE WHEN `Diagnosis` LIKE '%SLE%' THEN 1 ELSE 0 END)) * 100 AS ProportionOfThrombocytopeniaWithSLE FROM Examination;	thrombosis_prediction
SELECT (SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) * 100) / COUNT(*) FROM Patient WHERE YEAR(Birthday) = 1980 AND Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND e.Diagnosis = 'BEHCET' AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.SEX = 'F' AND Examination.WBC < 3.5;	thrombosis_prediction
SELECT      DATEDIFF(`Examination Date`, `First Date`) AS DaysBeforeEvaluation FROM      Examination WHERE      ID = (SELECT ID FROM Patient WHERE `First Date` = '1993-02-10')	thrombosis_prediction
SELECT     CASE         WHEN p.SEX = 'M' THEN (l.UA > 8.0)         WHEN p.SEX = 'F' THEN (l.UA > 6.5)         ELSE FALSE     END AS UricAcidWithinNormalRange FROM     Laboratory l JOIN     Patient p ON l.ID = p.ID WHERE     p.ID = 57266;	thrombosis_prediction
SELECT Date  FROM Laboratory  WHERE ID = 48473 AND GOT >= 60;	thrombosis_prediction
SELECT p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND YEAR(l.Date) = 1994;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GPT >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 60 ORDER BY p.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) AS Average_LDH FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.LDH BETWEEN 600 AND 800     AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) > 0;	thrombosis_prediction
SELECT p.ID, p.Admission FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALP < 300 GROUP BY p.ID, p.Admission;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday = '1982-04-01' AND Laboratory.ALP < 300;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      l.TP < 6.0;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      l.TP,      (l.TP - 8.5) AS TP_Deviation FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.SEX = 'F'      AND l.TP > 8.5	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'M' AND E.ALB < 3.5 OR E.ALB > 5.5 ORDER BY P.Birthday DESC;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday,      CASE          WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Yes'         ELSE 'No'     END AS Albumin_in_Normal_Range FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      YEAR(p.Birthday) = 1982;	thrombosis_prediction
SELECT      ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM Patient WHERE SEX = 'F'), 2) AS PercentageOfFemalesWithHighUA FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.SEX = 'F' AND      (l.UA > 6.5 OR l.UA > 8.0);	thrombosis_prediction
SELECT AVG(UA) AS Average_UA_Index FROM Laboratory WHERE ID IN (     SELECT ID     FROM Patient     WHERE (SEX = 'M' AND UA < 8.0) OR (SEX = 'F' AND UA < 6.5) ) AND EXISTS (     SELECT 1     FROM Laboratory AS L2     WHERE L2.ID = Laboratory.ID     AND L2.UA < (         CASE             WHEN Patient.SEX = 'M' THEN 8.0             ELSE 6.5         END     )     AND L2.Date > Laboratory.Date ) GROUP BY Laboratory.ID;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.UN = 29;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.Diagnosis = 'RA'      AND e.UN < 30;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.CRE >= 1.5;	thrombosis_prediction
SELECT (SUM(CASE WHEN Sex = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END)) AS MaleAboveNormalRangeGreaterThanFemale FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRE >= 1.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory);	thrombosis_prediction
SELECT p.SEX, COUNT(*) AS TotalPatients FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.T_BIL >= 2.0 GROUP BY p.SEX;	thrombosis_prediction
SELECT p.ID, l.T-CHO FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND l.T-CHO = (SELECT MAX(T-CHO) FROM Laboratory) ORDER BY p.Birthday ASC, l.T-CHO DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(DIVIDE(SUBTRACT(YEAR(NOW()), YEAR(Birthday)), COUNT(ID)))  FROM Patient  WHERE SEX = 'M' AND `T-CHO` >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG > 300;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG >= 200 AND SUBSTR(Patient.Birthday, 6, 4) < SUBSTR(CURRENT_DATE, 6, 4) - 50;	thrombosis_prediction
SELECT DISTINCT Laboratory.ID FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.Admission = '-' AND Laboratory.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday BETWEEN '1936-01-01' AND '1956-12-31' AND Patient.SEX = 'M' AND Laboratory.CPK >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Birthday)) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday IS NOT NULL AND l.GLU >= 180 AND l.T_Cho < 250;	thrombosis_prediction
SELECT      p.ID,      l.GLU FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Description >= '1991-01-01'     AND l.GLU < 180;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      (l.WBC <= 3.5 OR l.WBC >= 9.0) GROUP BY      p.SEX,      p.Birthday ORDER BY      p.SEX,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) ASC;	thrombosis_prediction
SELECT p.ID, (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) AS Age, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RBC < 3.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Admission FROM Patient p WHERE p.SEX = 'F' AND (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Birthday)) >= 50 AND p.RBC <= 3.5 OR p.RBC >= 6.0 AND EXISTS (     SELECT 1     FROM Examination e     WHERE e.ID = p.ID AND e.RBC <= 3.5 OR e.RBC >= 6.0 ) AND p.Admission = '+';	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Admission = '-' AND e.HGB < 10;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE'   AND p.Birthday = (SELECT MIN(Birthday) FROM Patient WHERE Diagnosis = 'SLE')   AND e.HGB > 10 AND e.HGB < 17;	thrombosis_prediction
SELECT      p.ID,     (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID IN (         SELECT              ID         FROM              Laboratory         GROUP BY              ID         HAVING              COUNT(*) >= 2 AND MAX(l.HCT) >= 52     );	thrombosis_prediction
SELECT AVG(HCT) as AverageHematocritLevel FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      (SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END)) AS Difference FROM      Laboratory JOIN      Patient  ON      Laboratory.ID = Patient.ID WHERE      PLT < 100 OR PLT > 400;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Description, p.`First Date`, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date LIKE '1984%' AND p.Birthday IS NOT NULL AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) < 50 AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT      ROUND((SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) * 1.0) / SUM(CASE WHEN PT >= 14 THEN 1 ELSE 0 END), 2) AS percentage_female_abnormal_PT FROM      Patient WHERE      (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM Birthday)) > 55;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Description, p.`First Date`, p.Admission, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.`First Date` > '1992-12-31' AND e.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.APTT > 45 AND e.Thrombosis = 3;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.WBC BETWEEN 3.5 AND 9.0 AND (L.FG <= 150 OR L.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.Birthday > '1980-01-01'  AND Examination.FG < 150 OR Examination.FG > 450;	thrombosis_prediction
SELECT DISTINCT p.ID, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`U-PRO` >= 30;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Diagnosis = 'SLE' AND Examination.`U-PRO` BETWEEN 0 AND 30;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `aCL IgG` < 900 AND Symptoms = 'abortion';	thrombosis_prediction
SELECT COUNT(*) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.`aCL IgG` BETWEEN 900 AND 2000 AND Examination.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`aCL IgA` BETWEEN 80 AND 500 AND e.`aCL IgA` = (     SELECT MAX(`aCL IgA`)     FROM Examination     WHERE `aCL IgA` BETWEEN 80 AND 500 )	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.`First Date` >= '1990-01-01'  AND e.`aCL IgA` IS NOT NULL  AND e.`aCL IgA` BETWEEN 80 AND 500;	thrombosis_prediction
SELECT Diagnosis, MAX(COUNT(Diagnosis)) AS MostCommonDisease FROM Examination WHERE `aCL IgM` IS NOT NULL AND `aCL IgM` NOT BETWEEN 40 AND 400 GROUP BY Diagnosis ORDER BY MostCommonDisease DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Description IS NULL AND (CRP LIKE '+' OR CRP LIKE '-' OR CRP < 1.0);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRP >= 1.0 AND SUBSTR(Laboratory.Date, 1, 4) - SUBSTR(Patient.Birthday, 1, 4) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.RA IN('-', '+-') AND Examination.KCT = '+';	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday > '1995-01-01' AND e.RA IN('-', '+-');	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE p.Birthday <= DATE_SUB(CURDATE(), INTERVAL 60 YEAR) AND EXISTS (     SELECT 1     FROM Laboratory l     WHERE l.ID = p.ID     AND l.RF < 20 )	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.RF < 20 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID AND l.Date = (SELECT MAX(l2.Date) FROM Laboratory l2 WHERE l2.ID = e.ID) WHERE e.`ANA Pattern` = 'P' AND l.C3 > 35;	thrombosis_prediction
SELECT Examination.ID FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.ID IN (     SELECT Patient.ID     FROM Patient     WHERE NOT (29 < Patient.HCT < 52) ) AND Examination.`aCL IgA` = (     SELECT MAX(`aCL IgA`)     FROM Examination     JOIN Patient ON Examination.ID = Patient.ID     WHERE NOT (29 < Patient.HCT < 52) )	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Thrombosis = 1 AND C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.RNP IN ('-', '+-') AND p.Admission = '+';	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient WHERE RNP NOT IN('-', '+-')) AND l.RNP NOT IN('-', '+-');	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SM IN('-', '+-') AND e.Thrombosis = 1;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SM NOT IN('-', '+-') AND l.SM = 'abnormal' ORDER BY p.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`Examination Date` >= '1997-01-01' AND E.SC170 IN('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'M'  AND e.Symptoms LIKE '%vertigo%'  AND e.SC170 IN('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.`First Date` < '1990'  AND e.SSA IN('-','+-');	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SSA NOT IN('-', '+-') AND p.`First Date` = (SELECT MIN(`First Date`) FROM Patient WHERE ID = p.ID) AND l.SSA IS NOT NULL ORDER BY p.`First Date` LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.`SSB` IN('-', '+-') AND e.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS patient_count FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'F' AND e.SSB IN('-', '+-') AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'M' AND E.CENTROMEA IN('-', '+-') AND E.SSB IN('-', '+-');	thrombosis_prediction
SELECT p.ID, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.Description IS NULL  AND e.DNA < 8;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`DNA-II` >= 8 AND p.Admission = '+';	thrombosis_prediction
SELECT      ROUND((COUNT(DISTINCT e.ID) * 1.0) / COUNT(DISTINCT CASE WHEN e.GOT >= 60 THEN e.ID ELSE NULL END), 2) AS percentage FROM      Examination e WHERE      e.GOT >= 60 AND e.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT MIN(Birthday)  FROM Patient  WHERE ID IN (     SELECT DISTINCT L.ID      FROM Laboratory L      JOIN Examination E ON L.ID = E.ID      WHERE L.GOT >= 60 AND E.Diagnosis IS NOT NULL ) ORDER BY Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT p.Birthday, p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 60 GROUP BY p.ID, p.Birthday ORDER BY MAX(l.GPT) DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT < 60 AND Patient.SEX = 'M';	thrombosis_prediction
SELECT MIN(`First Date`) AS FirstRecordDate FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH < 500 AND Patient.ID = (     SELECT ID     FROM Laboratory     WHERE LDH < 500     GROUP BY ID     ORDER BY MAX(LDH) DESC     LIMIT 1 );	thrombosis_prediction
SELECT MAX(`Date`) AS LatestRecordDate FROM Laboratory WHERE LDH >= 500 AND ID = (SELECT MAX(`First Date`) FROM Patient);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.ALP >= 300 AND p.Admission = '+';	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.Admission = '-' AND Laboratory.ALP < 300;	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory JOIN Examination ON Laboratory.ID = Examination.ID WHERE Examination.Diagnosis = 'SJS' AND Laboratory.TP > 6.0 AND Laboratory.TP < 8.5;	thrombosis_prediction
SELECT `Examination Date` FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE ALB > 3.5 AND ALB < 5.5 ORDER BY ALB DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.ALB BETWEEN 3.5 AND 5.5 AND Laboratory.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT MAX(UA), `aCL IgG`, `aCL IgM`, `aCL IgA` FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.SEX = 'F' AND UA > 6.50 GROUP BY Patient.ID ORDER BY MAX(UA) DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(`aCL IgG`) AS HighestANAClLevel FROM Examination WHERE `aCL IgG` IS NOT NULL AND CRE < 1.5;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRE < 1.5 AND l.IGA = (SELECT MAX(Iga) FROM Laboratory WHERE IGA IS NOT NULL)	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`T-BIL` >= 2.0 AND e.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT `aCL IgG`, `aCL IgM`, ANA FROM Examination WHERE `T-BIL` < 2.0 AND `T-BIL` = (SELECT MAX(`T-BIL`) FROM Examination WHERE `T-BIL` < 2.0) AND ID IN (SELECT ID FROM Laboratory WHERE ID IN (SELECT ID FROM Examination)) ORDER BY `T-BIL` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`T-CHO` >= 250 AND e.KCT = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`T-CHO` < 250 AND E.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E WHERE E.TG < 200 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.TG < 200 ORDER BY e.TG DESC LIMIT 1;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 0 AND e.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.CPK < 250 AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND l.GLU > 180;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.GLU < 180 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.WBC BETWEEN 3.5 AND 9.0 AND Patient.Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Diagnosis = 'SLE' AND e.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Admission = '-'  AND (e.RBC <= 3.5 OR e.RBC >= 6.0);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.PLT > 100 AND e.PLT < 400 AND p.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT      p.ID,      p.Diagnosis,      e.PLT  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      p.Diagnosis = 'MCTD'      AND e.PLT > 100      AND e.PLT < 400;	thrombosis_prediction
SELECT AVG(PT) AS AverageProthrombinTime FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'M') AND PT < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis IN (1, 2) AND e.PT < 14;	thrombosis_prediction
SELECT major_name  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.college = 'College of Engineering';	student_club
SELECT first_name, last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Art and Design';	student_club
SELECT COUNT(DISTINCT attendance.link_to_member) FROM event JOIN attendance ON event.event_id = attendance.link_to_event WHERE event.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium';	student_club
SELECT e.event_name, COUNT(a.link_to_event) AS attendance_count FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.event_name LIKE '%Student_Club%' GROUP BY e.event_id, e.event_name ORDER BY attendance_count DESC LIMIT 1;	student_club
SELECT m.link_to_major, m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(DISTINCT e.event_id) FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND e.event_date LIKE '2019%';	student_club
SELECT COUNT(*)  FROM event  WHERE event_id IN (     SELECT link_to_event      FROM attendance      GROUP BY link_to_event      HAVING COUNT(link_to_member) > 10 ) AND type = 'Meeting';	student_club
SELECT event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event GROUP BY event_name HAVING COUNT(attendance.link_to_member) > 20;	student_club
SELECT      COUNT(DISTINCT event.event_id) / COUNT(DISTINCT event.event_name) AS average_attendance FROM      event JOIN      attendance ON event.event_id = attendance.link_to_event WHERE      event.type = 'Meeting'      AND YEAR(event.event_date) = 2020;	student_club
SELECT expense_description, MAX(cost) AS max_cost FROM expense WHERE link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE type = 'Meeting' OR type = 'Election')) GROUP BY expense_description ORDER BY max_cost DESC LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT last_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Law and Constitutional Studies';	student_club
SELECT z.county  FROM member m JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Sherri' AND m.last_name = 'Ramsey';	student_club
SELECT m.college FROM major m JOIN member mem ON m.major_id = mem.link_to_major WHERE mem.first_name = 'Tyler' AND mem.last_name = 'Hewitt';	student_club
SELECT SUM(i.amount) AS total_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT SUM(b.spent) as total_spent_on_food FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President';	student_club
SELECT first_name, last_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'IL');	student_club
SELECT SUM(b.spent) AS total_advertisement_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Advertisement';	student_club
SELECT m.link_to_major, m.first_name, m.last_name, maj.department FROM member m JOIN major maj ON m.link_to_major = maj.major_id WHERE m.first_name = 'Pierce' OR m.last_name = 'Guidi';	student_club
SELECT SUM(amount) AS total_budgeted_amount FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'October Speaker');	student_club
SELECT expense.expense_id, expense.expense_description, expense.approved FROM expense JOIN event ON expense.link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'October Meeting' AND event_date = '2019-10-08')) WHERE expense.approved = 'true';	student_club
SELECT SUM(cost) / COUNT(*) AS average_cost FROM expense WHERE link_to_member IN (     SELECT member_id     FROM member     WHERE first_name = 'Elijah' AND last_name = 'Allen' ) AND expense_date >= '2019-09-01' AND expense_date <= '2019-10-31';	student_club
SELECT     (SUM(CASE WHEN strftime('%Y', event_date) = '2019' THEN spent ELSE 0 END) -      SUM(CASE WHEN strftime('%Y', event_date) = '2020' THEN spent ELSE 0 END)) AS difference_in_spent FROM     event JOIN     budget ON event.event_id = budget.link_to_event WHERE     event.status = 'Closed'	student_club
SELECT location  FROM event  WHERE event_name = 'Spring Budget Review';	student_club
SELECT expense.cost FROM expense JOIN event ON expense.link_to_budget IN (     SELECT budget_id     FROM budget     WHERE link_to_event IN (         SELECT event_id         FROM event         WHERE event_name = 'Posters'         AND event_date = '2019-09-04'     ) ) WHERE expense.expense_description = 'Posters';	student_club
SELECT remaining FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1;	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT county FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE first_name = 'Adela' AND last_name = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM budget WHERE event_status = 'November Meeting' AND remaining < 0;	student_club
SELECT SUM(b.amount) as total_budget_amount FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'September Speaker';	student_club
SELECT e.status FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-08-20';	student_club
SELECT major_name FROM major JOIN member ON major.major_id = member.link_to_major WHERE first_name = 'Brent' AND last_name = 'Thomason';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Human Development and Family Studies' AND member.t_shirt_size = 'Large';	student_club
SELECT zip_code.type  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.first_name = 'Christof' AND member.last_name = 'Nielson';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT state FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE first_name = 'Sacha' AND last_name = 'Harrison';	student_club
SELECT m.first_name, m.last_name, m.email, m.position, m.t_shirt_size, m.phone, m.zip, m.link_to_major, maj.department FROM member m JOIN major maj ON m.link_to_major = maj.major_id WHERE m.position = 'President';	student_club
SELECT date_received FROM income WHERE source = 'Dues' AND link_to_member = 'rec3pH4DxMcWHMRB7';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' AND i.date_received = (SELECT MIN(date_received) FROM income WHERE source = 'Dues');	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' AND b.category = 'Advertisement' THEN b.amount ELSE 0 END) /       SUM(CASE WHEN e.event_name = 'October Meeting' AND b.category = 'Advertisement' THEN b.amount ELSE 0 END)) AS ratio FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      (e.event_name = 'Yearly Kickoff' AND b.category = 'Advertisement') OR      (e.event_name = 'October Meeting' AND b.category = 'Advertisement')	student_club
SELECT     (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) /      (SELECT SUM(amount) FROM budget WHERE event_name = 'November Speaker')) * 100 AS parking_budget_percentage FROM     budget b WHERE     b.event_name = 'November Speaker';	student_club
SELECT SUM(cost) AS total_pizza_cost FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT      zip_code.city,      zip_code.county,      zip_code.state FROM      member JOIN      zip_code ON member.zip = zip_code.zip_code WHERE      member.first_name = 'Amy' AND      member.last_name = 'Firth';	student_club
SELECT expense.expense_description FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.remaining = (SELECT MIN(remaining) FROM budget);	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT college, COUNT(*) as member_count FROM major JOIN member ON major.major_id = member.link_to_major GROUP BY college ORDER BY member_count DESC LIMIT 1;	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.phone = '809-555-3360';	student_club
SELECT event_name, MAX(amount) AS highest_budget FROM event JOIN budget ON event.event_id = budget.link_to_event GROUP BY event_name ORDER BY highest_budget DESC LIMIT 1;	student_club
SELECT expense.expense_description, expense.expense_date, expense.cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT link_to_member)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women''s Soccer';	student_club
SELECT date_received FROM income WHERE first_name = 'Casey' AND last_name = 'Mason';	student_club
SELECT COUNT(*) FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'MD');	student_club
SELECT COUNT(*) FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE member.phone = '954-555-6240';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT event_name,         MAX(DIVIDE(spent, amount)) AS spend_to_budget_ratio FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.status = 'Closed' GROUP BY event_name ORDER BY spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'President';	student_club
SELECT MAX(spent) AS highest_spent FROM budget WHERE event_status = 'Closed';	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT SUM(spent) AS total_spent_on_food FROM budget WHERE category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT first_name, last_name FROM member WHERE zip IN (     SELECT zip_code     FROM zip_code     WHERE city = 'Georgetown' AND state = 'South Carolina' );	student_club
SELECT SUM(amount) as total_income FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost) AS total_expense FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN budget b ON m.member_id = b.link_to_member JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff' AND e.status = 'Open';	student_club
SELECT m.first_name, m.last_name, i.source, MAX(i.amount) AS highest_income FROM member m JOIN income i ON m.member_id = i.link_to_member GROUP BY m.member_id, m.first_name, m.last_name, i.source ORDER BY highest_income DESC LIMIT 1;	student_club
SELECT event_name, MIN(amount) AS lowest_cost FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Food' GROUP BY event_name ORDER BY lowest_cost ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.cost ELSE 0 END) / SUM(b.cost) * 100) AS Yearly_Kickoff_Percentage FROM      event e JOIN      budget b ON e.event_id = b.link_to_event	student_club
SELECT SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) FROM major;	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Community Theater' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(a.link_to_event) AS num_events_attended, m.major_name FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi' GROUP BY m.major_name;	student_club
SELECT AVG(spent) / COUNT(*) AS average_spent_per_event FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Advertisement' ORDER BY budget.spent DESC LIMIT 1;	student_club
SELECT EXISTS (     SELECT 1     FROM attendance     JOIN member ON attendance.link_to_member = member.member_id     JOIN event ON attendance.link_to_event = event.event_id     WHERE member.first_name = 'Maya'       AND member.last_name = 'Mclean'       AND event.event_name = 'Women''s Soccer' ) AS attended;	student_club
SELECT      (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100.0) / COUNT(event_id)  FROM      event  WHERE      event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT SUM(e.cost) AS total_poster_cost FROM expense e JOIN event ev ON e.link_to_budget IN (     SELECT budget_id     FROM budget     WHERE link_to_event = (         SELECT event_id         FROM event         WHERE event_name = 'September Speaker'     ) ) WHERE e.expense_description = 'Posters';	student_club
SELECT t_shirt_size, COUNT(t_shirt_size) as total_ordered FROM member GROUP BY t_shirt_size ORDER BY total_ordered DESC LIMIT 1;	student_club
SELECT event_name FROM event WHERE status = 'Closed' ORDER BY remaining + amount DESC LIMIT 1;	student_club
SELECT expense.expense_description, SUM(expense.cost) AS total_value FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' AND expense.approved = 'true' GROUP BY expense.expense_description;	student_club
SELECT category, amount FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'April Speaker') ORDER BY amount ASC;	student_club
SELECT link_to_event, MAX(amount) as max_budget FROM budget WHERE category = 'Food' GROUP BY link_to_event ORDER BY max_budget DESC LIMIT 1;	student_club
SELECT budget_id, category, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) as total_parking_cost FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) as total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.first_name, m.last_name;	student_club
SELECT expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison';	student_club
SELECT expense.expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.t_shirt_size = 'X-Large';	student_club
SELECT m.zip, e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.cost < 50;	student_club
SELECT major_name  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE first_name = 'Phillip' AND last_name = 'Cullen';	student_club
SELECT position FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business';	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;	student_club
SELECT type FROM event WHERE location = 'MU 215';	student_club
SELECT type  FROM event  WHERE event_date = '2020-03-24T12:00:00';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT      (SUM(CASE WHEN m.position = 'Member' AND ma.major_name = 'Mathematics' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT m.member_id) AS percentage_math_members FROM      member m JOIN      major ma ON m.link_to_major = ma.major_id	student_club
SELECT type FROM event WHERE location = 'MU 215';	student_club
SELECT COUNT(*)  FROM income  WHERE amount = 50;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences'   AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215' AND b.spent = 0 AND e.type = 'Guest Speaker';	student_club
SELECT m.zip.city, m.zip.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';	student_club
SELECT event_name FROM event JOIN member ON event.location = '900 E. Washington St.' JOIN attendance ON event.event_id = attendance.link_to_event JOIN member AS m ON attendance.link_to_member = m.member_id WHERE m.position = 'Vice President' AND event.type = 'Social';	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member';	student_club
SELECT      (COUNT(CASE WHEN i.amount = 50 THEN 1 END) * 100.0) / COUNT(m.member_id) AS percentage_of_50_received FROM      member m JOIN      income i ON m.member_id = i.link_to_member WHERE      m.t_shirt_size = 'Medium' AND m.position = 'Member';	student_club
SELECT DISTINCT z.state FROM zip_code z WHERE z.type = 'PO Box';	student_club
SELECT zc.zip_code FROM zip_code zc WHERE zc.city = 'Aguada' AND zc.state = 'Puerto Rico';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT e.event_id FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget JOIN member m ON ex.link_to_member = m.member_id WHERE ex.cost > 50 GROUP BY e.event_id HAVING SUM(ex.cost) > 50;	student_club
SELECT      m.member_id,      m.first_name,      m.last_name,      e.event_id,      e.event_name FROM      member m JOIN      expense e ON m.member_id = e.link_to_member WHERE      e.approved = 'true'     AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19' JOIN      event e2 ON e.link_to_event = e2.event_id;	student_club
SELECT m.link_to_major FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Katy' AND ma.major_id = 'rec1N0upiVLy5esTO';	student_club
SELECT phone FROM member WHERE link_to_major IN (     SELECT major_id     FROM major     WHERE college = 'College of Agriculture and Applied Sciences' AND major_name = 'Business' );	student_club
SELECT DISTINCT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND e.cost > 20;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Education' AND m.position = 'Member';	student_club
SELECT      (SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(event_id)) AS over_budget_percentage FROM      event;	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_id, expense_description FROM expense WHERE cost > 50 GROUP BY expense_id, expense_description HAVING SUM(cost) / COUNT(expense_id) > 50;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT      (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) * 100.0) / COUNT(zip_code) AS po_box_percentage FROM      zip_code;	student_club
SELECT event_name, location FROM event WHERE event_id IN (     SELECT link_to_event     FROM budget     WHERE remaining > 0 );	student_club
SELECT e.event_name, e.event_date FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, m.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 100;	student_club
SELECT z.city, z.country FROM event e JOIN income i ON e.event_id = i.link_to_member JOIN zip_code z ON e.location = z.city AND z.state = z.short_state GROUP BY e.event_id, z.city, z.country HAVING COUNT(i.income_id) > 40;	student_club
SELECT m.member_id, m.first_name, m.last_name, SUM(e.cost) AS total_expense FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id IN (     SELECT link_to_member     FROM expense     GROUP BY link_to_member     HAVING COUNT(DISTINCT link_to_event) > 1 ) GROUP BY m.member_id ORDER BY total_expense DESC LIMIT 1;	student_club
SELECT AVG(cost) AS average_amount_paid FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.position <> 'Member' GROUP BY expense.link_to_member;	student_club
SELECT event_name FROM event WHERE cost < (SELECT AVG(cost) FROM expense WHERE category = 'Parking') AND event_id IN (SELECT link_to_event FROM expense WHERE category = 'Parking') GROUP BY event_name;	student_club
SELECT     (SUM(expense.cost) / (SELECT COUNT(event_id) FROM event WHERE event.type = 'Game')) * 100 AS game_event_cost_percentage FROM     expense JOIN     event ON expense.link_to_event = event.event_id WHERE     event.type = 'Game';	student_club
SELECT link_to_budget, SUM(cost) AS total_cost FROM expense WHERE expense_description = 'Water, chips, cookies' GROUP BY link_to_budget ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT      m.first_name,      m.last_name,      m.phone FROM      member m JOIN      expense e ON m.member_id = e.link_to_member WHERE      e.cost > (SELECT AVG(cost) FROM expense);	student_club
SELECT     SUBTRACT(         DIVIDE(SUM(CASE WHEN state = 'Maine' THEN 1 ELSE 0 END),          (SELECT COUNT(*) FROM member WHERE position = 'Member')),         DIVIDE(SUM(CASE WHEN state = 'Vermont' THEN 1 ELSE 0 END),          (SELECT COUNT(*) FROM member WHERE position = 'Member'))     ) AS percentage_difference FROM member;	student_club
SELECT major_name, department FROM major WHERE major_id = (SELECT link_to_major FROM member WHERE first_name = 'Garrett' AND last_name = 'Gerke');	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, e.cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies';	student_club
SELECT last_name, phone FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Elementary Education';	student_club
SELECT category, amount FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'January Speaker');	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT first_name || ' ' || last_name AS full_name, amount FROM income WHERE date_received = '2019-09-09';	student_club
SELECT category FROM budget JOIN expense ON budget.budget_id = expense.link_to_budget WHERE expense.expense_description = 'Posters';	student_club
SELECT m.first_name, m.last_name, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary';	student_club
SELECT e.event_name, SUM(e.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT z.city FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Garrett' AND m.last_name = 'Girke';	student_club
SELECT first_name, last_name, position FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Lincolnton' AND zip_code.state = 'North Carolina' AND zip_code.zip_code = 28092;	student_club
SELECT COUNT(*)  FROM gasstations  WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR') AS EUR_Payments,     (SELECT COUNT(*) FROM customers WHERE Currency = 'CZK') AS CZK_Payments,     (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR') * 1.0 / (SELECT COUNT(*) FROM customers WHERE Currency = 'CZK') AS Ratio	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND y.Date BETWEEN '201201' AND '201212' GROUP BY c.CustomerID ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS Average_Monthly_Consumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM' AND ym.Date BETWEEN '201201' AND '201212' AND ym.Consumption < 30000;	debit_card_specializing
SELECT     (SUM(CASE WHEN c.Currency = 'CZK' THEN ym.Consumption ELSE 0 END) -      SUM(CASE WHEN c.Currency = 'EUR' THEN ym.Consumption ELSE 0 END)) AS ConsumptionDifference FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE ym.Date BETWEEN '201201' AND '201212' AND c.Currency IN ('CZK', 'EUR');	debit_card_specializing
SELECT      yearmonth.Date AS YearMonth,      SUM(yearmonth.Consumption) AS TotalConsumption FROM      yearmonth JOIN      customers ON yearmonth.CustomerID = customers.CustomerID WHERE      customers.Currency = 'EUR' GROUP BY      YEAR(yearmonth.Date), MONTH(yearmonth.Date) ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Segment, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT      SUBSTR(Date, 1, 4) AS Year,      SUM(Consumption) AS TotalConsumption FROM      yearmonth WHERE      SUBSTR(Date, 5, 2) = 'CZK' GROUP BY      Year ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Date AS PeakMonth FROM yearmonth WHERE CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Segment = 'SME' ) AND Date LIKE '2013%' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
WITH LowestConsumption AS (     SELECT          Segment,          MIN(Consumption) AS MinConsumption,          COUNT(*) AS CustomerCount     FROM          yearmonth     WHERE          Date BETWEEN '201301' AND '201312'     GROUP BY          Segment ), SME_Avg AS (     SELECT          (SUM(Consumption) / CustomerCount) AS AvgConsumption     FROM          yearmonth, LowestConsumption     WHERE          yearmonth.Segment = 'SME' AND          yearmonth.CustomerID = customers.CustomerID AND          LowestConsumption.Segment = 'SME' AND          LowestConsumption.MinConsumption = yearmonth.Consumption ), LAM_Avg AS (     SELECT          (SUM(Consumption) / CustomerCount) AS AvgConsumption     FROM          yearmonth, LowestConsumption     WHERE          yearmonth.Segment = 'LAM' AND          yearmonth.CustomerID = customers.CustomerID AND          LowestConsumption.Segment = 'LAM' AND          LowestConsumption.MinConsumption = yearmonth.Consumption ), KAM_Avg AS (     SELECT          (SUM(Consumption) / CustomerCount) AS AvgConsumption     FROM          yearmonth, LowestConsumption     WHERE          yearmonth.Segment = 'KAM' AND          yearmonth.CustomerID = customers.CustomerID AND          LowestConsumption.Segment = 'KAM' AND          LowestConsumption.MinConsumption = yearmonth.Consumption ) SELECT      (SME_Avg.AvgConsumption - LAM_Avg.AvgConsumption) AS Difference_SME_LAM,     (LAM_Avg.AvgConsumption - KAM_Avg.AvgConsumption) AS Difference_LAM_KAM,     (KAM_Avg.AvgConsumption - SME_Avg.AvgConsumption) AS Difference_KAM_SME FROM      SME_Avg, LAM_Avg, KAM_Avg;	debit_card_specializing
WITH Consumption2012 AS (     SELECT          c.CustomerID,          SUM(y.Consumption) AS TotalConsumption2012     FROM          yearmonth y     JOIN          customers c ON y.CustomerID = c.CustomerID     WHERE          SUBSTR(y.Date, 1, 4) = '2012'     GROUP BY          c.CustomerID ), Consumption2013 AS (     SELECT          c.CustomerID,          SUM(y.Consumption) AS TotalConsumption2013     FROM          yearmonth y     JOIN          customers c ON y.CustomerID = c.CustomerID     WHERE          SUBSTR(y.Date, 1, 4) = '2013'     GROUP BY          c.CustomerID ), SegmentConsumption AS (     SELECT          c.Segment,          (c.TotalConsumption2013 - c.TotalConsumption2012) AS ConsumptionIncrease,         (c.TotalConsumption2013 - c.TotalConsumption2012) / c.TotalConsumption2013 * 100 AS PercentageIncrease     FROM          (SELECT              Consumption2012.CustomerID,              Consumption2012.TotalConsumption2012,              Consumption2013.TotalConsumption2013         FROM              Consumption2012         JOIN              Consumption2013 ON Consumption2012.CustomerID = Consumption2013.CustomerID) c     JOIN          customers c ON c.CustomerID = Consumption2012.CustomerID     WHERE          c.Segment IN ('SME', 'LAM', 'KAM') ), MaxMinIncrease AS (     SELECT          MAX(PercentageIncrease) AS MaxPercentageIncrease,         MIN(PercentageIncrease) AS MinPercentageIncrease     FROM          SegmentConsumption ) SELECT      sc.Segment,      sc.ConsumptionIncrease,      sc.PercentageIncrease FROM      SegmentConsumption sc JOIN      MaxMinIncrease mmi ON sc.PercentageIncrease = mmi.MaxPercentageIncrease OR sc.PercentageIncrease = mmi.MinPercentageIncrease ORDER BY      sc.PercentageIncrease DESC;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Discount') -      (SELECT COUNT(*) FROM gasstations WHERE Country = 'SLO' AND Segment = 'Discount') AS DiscountDifference FROM      dual;	debit_card_specializing
SELECT      (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') -      (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS Difference	debit_card_specializing
SELECT     SUM(CASE WHEN c.Currency = 'CZK' THEN 1 ELSE 0 END) AS SME_CZK,     SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) AS SME_EUR,     SUM(CASE WHEN c.Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) AS Difference FROM     customers c JOIN     transactions_1k t ON c.CustomerID = t.CustomerID WHERE     c.Segment = 'SME';	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310' ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM') AND Date = '201305';	debit_card_specializing
SELECT     (SUM(CASE WHEN Consumption > 46.73 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Percentage FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'LAM';	debit_card_specializing
SELECT g.Country, COUNT(*) as ValueForMoneyStations FROM gasstations g WHERE g.Segment = 'Value for money' GROUP BY g.Country;	debit_card_specializing
SELECT     (COUNT(*) FILTER (WHERE c.Currency = 'EUR') * 100.0) / COUNT(*) FROM     customers c JOIN     yearmonth ym ON c.CustomerID = ym.CustomerID WHERE     c.Segment = 'KAM';	debit_card_specializing
SELECT      ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM yearmonth WHERE Date = '201202'), 2) AS Percentage FROM      yearmonth  WHERE      Date = '201202'      AND Consumption > 528.3;	debit_card_specializing
SELECT     (COUNT(CASE WHEN g.Country = 'SLO' AND g.Segment = 'Premium' THEN 1 END) * 100.0) / COUNT(g.GasStationID) AS PercentageOfPremiumGasStations FROM     gasstations g;	debit_card_specializing
SELECT CustomerID, SUM(Consumption) as TotalConsumption FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Segment, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE Date = '201309' GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT      c.CustomerID,      SUM(ym.Consumption) AS TotalConsumption FROM      yearmonth AS ym JOIN      customers AS c ON ym.CustomerID = c.CustomerID WHERE      c.Segment = 'SME' AND      ym.Date = '201206' GROUP BY      c.CustomerID ORDER BY      TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) AS HighestMonthlyConsumption FROM yearmonth WHERE Date LIKE '2012%';	debit_card_specializing
SELECT c.CustomerID,         (SUM(y.Consumption) / 12) AS MonthlyConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' GROUP BY c.CustomerID ORDER BY MonthlyConsumption DESC LIMIT 1;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID WHERE strftime('%Y%m', t.Date) = '201309';	debit_card_specializing
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date LIKE '2013-06%';	debit_card_specializing
SELECT DISTINCT g.ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT products.Description FROM products JOIN transactions_1k ON products.ProductID = transactions_1k.ProductID JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR';	debit_card_specializing
SELECT AVG(Price * Amount) AS AverageTotalPrice FROM transactions_1k WHERE Date LIKE '2012-01%';	debit_card_specializing
SELECT COUNT(DISTINCT ym.CustomerID) FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT products.Description FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID JOIN products ON transactions_1k.ProductID = products.ProductID WHERE gasstations.Country = 'CZE';	debit_card_specializing
SELECT Time FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE gasstations.ChainID = 11 GROUP BY Time;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(TotalPrice) AS AverageTotalPrice FROM (     SELECT (t.Amount * t.Price) AS TotalPrice     FROM transactions_1k t     JOIN gasstations g ON t.GasStationID = g.GasStationID     WHERE g.Country = 'CZE' ) AS SubQuery;	debit_card_specializing
SELECT AVG(t.Amount * t.Price) AS AvgTotalPrice FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT CustomerID, SUM(Consumption) as TotalPaid FROM yearmonth WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY TotalPaid DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID ASC LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Time = '16:25:00' AND t.Date = '2012-08-24';	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-23' AND c.CustomerID = (     SELECT CustomerID     FROM yearmonth     WHERE Date = '2012-08-23'     ORDER BY Date DESC     LIMIT 1 )	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND EXISTS (     SELECT 1     FROM customers     WHERE customers.CustomerID = transactions_1k.CustomerID     AND customers.Currency = 'EUR' );	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers);	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00';	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT ym.Date, ym.Consumption FROM yearmonth ym WHERE ym.CustomerID = (     SELECT t1k.CustomerID     FROM transactions_1k t1k     WHERE t1k.Date = '2012-08-24'       AND t1k.Price = 124.05 ) AND ym.Date = '201201';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.Time BETWEEN '08:00:00' AND '09:00:00' AND DATE(transactions_1k.Date) = '2012-08-26' AND gasstations.Country = 'CZE';	debit_card_specializing
SELECT c.Currency FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE ym.Date LIKE '201306' AND ym.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CardID = 667467;	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-24' AND ym.Consumption = 548.4;	debit_card_specializing
SELECT     (COUNT(*) FILTER (WHERE c.Currency = 'EUR') * 100.0) / COUNT(*) FROM     transactions_1k t1 JOIN     customers c ON t1.CustomerID = c.CustomerID WHERE     t1.Date = '2012-08-25'	debit_card_specializing
SELECT     ((SELECT Consumption FROM yearmonth WHERE CustomerID = t1.CustomerID AND Date = '201208' AND year(Date) = 2012) -       (SELECT Consumption FROM yearmonth WHERE CustomerID = t1.CustomerID AND Date = '201208' AND year(Date) = 2013)) /       (SELECT Consumption FROM yearmonth WHERE CustomerID = t1.CustomerID AND Date = '201208' AND year(Date) = 2012) AS ConsumptionDecreaseRate FROM transactions_1k t1 WHERE t1.Price = 634.8 AND strftime('%Y-%m-%d', t1.Date) = '2012-08-25';	debit_card_specializing
SELECT GasStationID, SUM(Amount * Price) as TotalRevenue FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID GROUP BY GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT      (SUM(CASE WHEN g.Country = 'SVK' AND g.Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0) /      COUNT(*) AS Premium_Percentage FROM      transactions_1k t JOIN      gasstations g ON t.GasStationID = g.GasStationID JOIN      customers c ON t.CustomerID = c.CustomerID WHERE      c.Segment = 'SVK';	debit_card_specializing
SELECT SUM(t.Amount) AS TotalAmount FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.CustomerID = 38508;  SELECT SUM(y.Consumption) AS TotalSpentInJanuary FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.CustomerID = 38508 AND y.Date = '201201';	debit_card_specializing
SELECT p.Description AS ProductName, SUM(t.Amount) AS TotalAmountSold FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.Description ORDER BY TotalAmountSold DESC LIMIT 5;	debit_card_specializing
SELECT c.CustomerID, AVG(t.Price / t.Amount) AS avg_price_per_item, c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID ORDER BY avg_price_per_item DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE p.ProductID = 2 ORDER BY t.Price DESC LIMIT 1;	debit_card_specializing
SELECT ym.CustomerID, ym.Consumption FROM yearmonth ym JOIN transactions_1k t ON ym.CustomerID = t.CustomerID WHERE t.ProductID = 5 AND t.Price / t.Amount > 29.00 AND ym.Date LIKE '201208%';	debit_card_specializing
