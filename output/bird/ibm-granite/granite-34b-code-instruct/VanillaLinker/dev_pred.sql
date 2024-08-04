SELECT MAX(`Percent (%) Eligible Free (K-12)`) FROM `frpm` WHERE `County Code` = '01';
SELECT `CDSCode`, `Free Meal Count (Ages 5-17)`, `Enrollment (Ages 5-17)`, `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` AS `Eligible Free Rate (Ages 5-17)` FROM `frpm` WHERE `Educational Option Type` ='Continuation' ORDER BY `Eligible Free Rate (Ages 5-17)` LIMIT 3;
SELECT `Zip` FROM `schools` WHERE `CDSCode` IN (SELECT `CDSCode` FROM `frpm` WHERE `Charter School (Y/N)` = 1 AND `County Name` = 'Fresno');
SELECT MailStreet FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm."FRPM Count (K-12)" = (SELECT MAX(frpm."FRPM Count (K-12)") FROM frpm) AND frpm."Low Grade" = "K" AND frpm."High Grade" = "12";
SELECT `Phone` FROM `schools`  JOIN `frpm` ON `schools`.`CDSCode` = `frpm`.`CDSCode`  WHERE `Charter` = 1 AND `FundingType` = 'Directly funded' AND `OpenDate` > '2000-01-01'
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.rtype = 'S' AND satscores.AvgScrMath > 400 AND schools.Virtual = 'F';
SELECT CDSCode, Magnet FROM schools WHERE NumTstTakr > 500 AND Magnet = 1
SELECT Phone FROM schools WHERE CDSCode IN (     SELECT cds     FROM satscores     WHERE NumGE1500 = (         SELECT MAX(NumGE1500)         FROM satscores     ) );
SELECT satscores.NumTstTakr FROM satscores JOIN frpm ON satscores.cds = frpm.CDSCode WHERE frpm."FRPM Count (K-12)" = (SELECT MAX(frpm."FRPM Count (K-12)") FROM frpm)
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.rtype = 'S' AND satscores.AvgScrMath > 560 AND schools.FundingType = 'Directly funded';
SELECT `frpm`.`FRPM Count (Ages 5-17)`  FROM `frpm`  JOIN `satscores` ON `frpm`.`CDSCode` = `satscores`.`cds`  WHERE `satscores`.`AvgScrRead` = (SELECT MAX(`satscores`.`AvgScrRead`) FROM `satscores`)
SELECT `CDSCode` FROM `frpm` WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500
SELECT `CDSCode`, `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` FROM `frpm` WHERE `NumGE1500` / `NumTstTakr` > 0.3 ORDER BY `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` DESC LIMIT 1;
SELECT Phone FROM schools WHERE CDSCode IN (     SELECT CDSCode     FROM satscores     WHERE NumGE1500 / NumTstTakr IN (         SELECT MAX(NumGE1500 / NumTstTakr)         FROM satscores         GROUP BY rtype         ORDER BY rtype         LIMIT 3     ) );
SELECT `NCESSchool` FROM `schools` ORDER BY `Enrollment (Ages 5-17)` DESC LIMIT 5;
SELECT District, AVG(AvgScrRead) as AvgRead FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.StatusType = "Active" GROUP BY District ORDER BY AvgRead DESC LIMIT 1
SELECT COUNT(*) FROM satscores WHERE enroll12 < 100 AND rtype = 'S' AND cds IN (SELECT CDSCode FROM schools WHERE County = 'Alameda' AND District = 'Alameda Unified');
SELECT `CharterNum`, AVG(`AvgScrWrite`) as `AvgScore` FROM `satscores` WHERE `NumTstTakr` > 0 AND `AvgScrWrite` > 499 GROUP BY `CharterNum` ORDER BY `AvgScore` DESC
SELECT COUNT(*) FROM satscores WHERE sname = "Fresno Unified" AND rtype = "D" AND NumTstTakr <= 250
SELECT Phone FROM schools WHERE CDSCode = (SELECT CDSCode                  FROM satscores                  WHERE AvgScrMath = (SELECT MAX(AvgScrMath)                                     FROM satscores));
SELECT COUNT(*) FROM schools WHERE County = "Amador" AND LowGrade = "9" AND HighGrade = "12";
SELECT COUNT(*) FROM frpm WHERE `CDSCode` LIKE '06%' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700;
SELECT sname, NumTstTakr FROM satscores WHERE cds LIKE '161119%' ORDER BY NumTstTakr DESC LIMIT 1;
SELECT `School Name`, `Street` FROM `frpm` WHERE (`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) > 30
SELECT `School Name` FROM `frpm` WHERE (`Percent (%) Eligible Free (K-12)` > 0.1) AND (`NumTstTakr` >= 1500);
SELECT `schools`.`FundingType` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `schools`.`County` = 'Riverside' AND `satscores`.`AvgScrMath` > 400 GROUP BY `schools`.`CDSCode`
SELECT `School Name`, `Street`, `City`, `State`, `Zip` FROM `frpm` WHERE `CDSCode` IN ( 	SELECT `CDSCode` 	FROM `schools` 	WHERE `County` = 'Monterey' AND `SOCType` = 'High Schools (Public)' ) AND `FRPM Count (Ages 5-17)` > 800;
SELECT s.School, s.Phone, s.CDSCode, s.OpenDate, s.ClosedDate, s.LastUpdate, f.AvgScrWrite FROM schools s JOIN satscores f ON s.CDSCode = f.cds WHERE (s.OpenDate > '1991-01-01' OR s.ClosedDate < '2000-01-01') AND f.rtype = 'S' AND s.CDSCode NOT IN (SELECT CDSCode FROM schools WHERE StatusType = 'Closed');
SELECT `School Name`, `DOC Type` FROM `frpm` WHERE `Charter School (Y/N)` = 0 AND `Charter School Number` = '0000' AND `Charter School (Y/N)` = 0 AND `Charter School Number` = '0000' AND `Funding Type` = 'Locally Funded' AND (`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) > (SELECT AVG(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) FROM `frpm` WHERE `Charter School (Y/N)` = 0 AND `Charter School Number` = '0000' AND `Charter School (Y/N)` = 0 AND `Charter School Number` = '0000' AND `Funding Type` = 'Locally Funded');
SELECT OpenDate FROM schools WHERE StatusType = "Active" ANDDOCType = "K-12 Schools (Public)" ORDER BY Enroll12 DESC LIMIT 1
SELECT City, Enrollment__K_12__ FROM schools GROUP BY City ORDER BY Enrollment__K_12__ ASC LIMIT 5;
SELECT `CDSCode`, `Free Meal Count (K-12)`, `Enrollment (K-12)`, `Free Meal Count (K-12)` / `Enrollment (K-12)` AS `Eligible Free Rate (K-12)` FROM `frpm` WHERE `CDSCode` IN ( 	SELECT `CDSCode` 	FROM `frpm` 	ORDER BY `Enrollment (K-12)` DESC 	LIMIT 2 )
SELECT `CDSCode`, `FRPM Count (K-12)`, `Enrollment (K-12)`, (`FRPM Count (K-12)` / `Enrollment (K-12)`) AS `Eligible FRPM Rate` FROM `frpm` WHERE `EdOpsCode` = '66' AND `High Grade` = '12' ORDER BY `FRPM Count (K-12)` DESC LIMIT 5;
SELECT `School Name` FROM `frpm` WHERE `Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;
SELECT `FRPM Count (Ages 5-17)` / `Enrollment (Ages 5-17)` FROM `frpm` WHERE `CDSCode` = '01100170109835';
SELECT `AdmEmail1` FROM `schools` JOIN `frpm` ON `schools`.`CDSCode` = `frpm`.`CDSCode` WHERE `Charter` = 1 ORDER BY `Enrollment (K-12)` LIMIT 1;
SELECT AdmFName1, AdmLName1, AdmFName2, AdmLName2, AdmFName3, AdmLName3 FROM schools WHERE CDSCode = (SELECT cds                  FROM satscores                  WHERE NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)                  GROUP BY cds                  ORDER BY COUNT(*) DESC                  LIMIT 1);
SELECT Street, City, Zip, State FROM schools WHERE CDSCode = (SELECT CDSCode                  FROM satscores                  WHERE NumGE1500 / NumTstTakr = (SELECT MIN(NumGE1500 / NumTstTakr) FROM satscores));
SELECT `Website` FROM `schools` WHERE `County` = 'Los Angeles' AND `NumTstTakr` BETWEEN 2000 AND 3000;
SELECT AVG(NumTstTakr) FROM satscores WHERE cname = "Fresno" AND enroll12 > 0 AND year = 1980
SELECT Phone FROM schools WHERE District = 'Fresno Unified' ORDER BY (SELECT AvgScrRead FROM satscores WHERE cds = CDSCode) ASC LIMIT 1;
SELECT School, AvgScrRead FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE Virtual = 'F' ORDER BY County, AvgScrRead DESC LIMIT 5;
SELECT EdOpsName FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath = (SELECT MAX(T1.AvgScrMath) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode)
SELECT AvgScrMath, CDSCode, County FROM satscores WHERE AvgScrMath + AvgScrRead + AvgScrWrite = (SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite) FROM satscores)
SELECT s.City, AVG(s.AvgScrWrite) FROM satscores s WHERE s.NumTstTakr = (SELECT MAX(NumTstTakr) FROM satscores WHERE NumGE1500 >= 1500) GROUP BY s.City;
SELECT s.School, AVG(s.AvgScrWrite) FROM satscores s, schools sc WHERE s.cds = sc.CDSCode AND sc.AdmFName1 = 'Ricci' AND sc.AdmLName1 = 'Ulrich' GROUP BY s.School;
SELECT `schools`.`State`, `schools`.`School`, SUM(`satscores`.`enroll12`) AS `Total_Enrollees` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `schools`.`DOC` = '31' AND `satscores`.`rtype` = 'S' AND `schools`.`SOC` = 'K-12' GROUP BY `schools`.`State`, `schools`.`School` ORDER BY `Total_Enrollees` DESC LIMIT 1;
SELECT AVG(count) / 12 FROM ( 	SELECT COUNT(*) as count 	FROM schools 	WHERE StatusType = 'Active' AND OpenDate LIKE '1980%' ANDDOC = '52' );
SELECT COUNT(CDSCode) FROM schools WHEREDOC = '54' AND StatusType = 'Merged' AND County = 'Orange' UNION SELECT COUNT(CDSCode) FROM schools WHERE DOC = '52' AND StatusType = 'Merged' AND County = 'Orange'
SELECT COUNT(schools.County) as count, schools.County FROM schools WHERE schools.StatusType = 'Closed' GROUP BY schools.County ORDER BY count DESC LIMIT 1
SELECT `MailStreet` FROM `schools` WHERE `CDSCode` IN (SELECT `cds` FROM `satscores` WHERE `AvgScrMath` = (SELECT MAX(`AvgScrMath`) FROM `satscores` WHERE `rtype` = 'S' AND `NumTstTakr` > 0 ORDER BY `AvgScrMath` DESC LIMIT 7,1))
SELECT MailStreet, School, AvgScrRead FROM satscores, schools WHERE satscores.cds = schools.CDSCode ORDER BY AvgScrRead LIMIT 1;
SELECT COUNT(*) FROM satscores, schools WHERE satscores.NumGE1500 >= 1500 AND satscores.NumTstTakr >= 1500 AND satscores.cds = schools.CDSCode AND schools.MailCity = 'Lakeport';
SELECT SUM(NumTstTakr) FROM satscores WHERE cname = "Fresno";
SELECT `schools`.`School`, `schools`.`MailZip`  FROM `schools`  WHERE `schools`.`AdmEmail1` = 'avetik@gmail.com' OR `schools`.`AdmEmail2` = 'avetik@gmail.com' OR `schools`.`AdmEmail3` = 'avetik@gmail.com';
SELECT COUNT(CDSCode) FROM schools WHERE MailState = 'CA' AND County = 'Colusa' SELECT COUNT(CDSCode) FROM schools WHERE MailState = 'CA' AND County = 'Humboldt'
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND StatusType = 'Active' AND City = 'San Joaquin';
SELECT Phone, Ext FROM schools WHERE CDSCode = (SELECT cds FROM satscores WHERE AvgScrWrite = (SELECT AvgScrWrite FROM satscores ORDER BY AvgScrWrite DESC LIMIT 333, 1));
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704';
SELECT Website FROM schools WHERE AdmLName1 = 'Larson' AND AdmFName1 = 'Mike' UNION SELECT Website FROM schools WHERE AdmLName1 = 'Alvarez' AND AdmFName1 = 'Dante';
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1 ANDDOC = '02'
SELECT COUNT(*) FROM schools WHERE Charter = 1 AND City = "Hickman" ANDDOC = 52;
SELECT COUNT(*) FROM frpm WHERE `Charter School (Y/N)` = 0 AND `County Name` = "Los Angeles" AND `Percent (%) Eligible Free (K-12)` < 0.18
SELECT AdmLName1, AdmFName1, School, City FROM schools, frpm WHERE frpm.Charter = 1 AND frpm.CharterNum = '00D2' AND schools.CDSCode = frpm.CDSCode
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';
SELECT (COUNT(CDSCode) / (SELECT COUNT(CDSCode) FROM frpm WHERE Charter School (Y/N) = 1) * 100) AS Locally_Funded_Ratio FROM frpm WHERE Charter School (Y/N) = 1 AND Charter Funding Type = 'Locally funded' AND County Name = 'Santa Clara';
SELECT COUNT(*) FROM schools WHERE StatusType = 'Active' AND FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND County = 'Stanislaus';
SELECT COUNT(*) FROM schools WHERE StatusType = "Closed" AND City = "San Francisco" ANDDOCType = "Community College District";
SELECT `County` FROM `schools` WHERE `SOC` = '11' AND `ClosedDate` BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY `County` ORDER BY COUNT(*) DESC LIMIT 1
SELECT `NCESDist` FROM `schools` WHERE `SOC` = '31'
SELECT COUNT(*) FROM schools WHERE County = "Alpine" AND StatusType = "Active" ANDDOCType = "District Community Day School";
SELECT DistrictCode FROM frpm WHERE Magnet = 0 AND City = "Fresno";
SELECT Enrollment[Ages 5-17] FROM frpm WHERE CDSCode = '01100170123968' AND Academic[Year] = '2014-2015';
SELECT `FRPM Count (Ages 5-17)` FROM `frpm` WHERE `CDSCode` = '01100170118489' AND `MailStreet` = 'PO Box 1040';
SELECT `Low Grade` FROM `frpm` WHERE `EdOpsCode` = 'SPECON' AND `CDSCode` = '0613360';
SELECT `EdOpsName` FROM `schools` WHERE `CDSCode` IN (SELECT `CDSCode` FROM `frpm` WHERE `Charter School (Y/N)` = 1 AND `Charter School Number` = '0728' AND `County Code` = 37);
SELECT City FROM schools WHERE EILCode = 'HS' AND CDSCode LIKE '0614%' AND LowGrade = '9' AND HighGrade = '12' AND LunchProvision = '2';
SELECT `School Name`, `Percent (%) Eligible FRPM (Ages 5-17)` FROM `frpm` WHERE `County Name` = 'Los Angeles' AND `Low Grade` = 'K' AND `High Grade` = '9';
SELECT grade_span FROM (     SELECT grade_span, COUNT(*) AS count     FROM schools     WHERE city = 'Adelanto'     GROUP BY grade_span ) ORDER BY count DESC LIMIT 1
SELECT COUNT(CDSCode) FROM schools WHERE County = 'San Diego' AND Virtual = 'F' INTERSECT SELECT COUNT(CDSCode) FROM schools WHERE County = 'Santa Barbara' AND Virtual = 'F'
SELECT `School`, `Latitude` FROM `schools` ORDER BY `Latitude` DESC LIMIT 1;
SELECT `City`, `Low Grade` FROM `schools` WHERE `State` = 'CA' ORDER BY `Latitude` ASC LIMIT 1;
SELECT HighGrade, LowGrade FROM frpm WHERE ABS(Longitude) = (SELECT MAX(ABS(Longitude)) FROM frpm);
SELECT COUNT(DISTINCT City) FROM schools WHERE Magnet = 1 AND EILName = 'K-8' AND NSLPProvisionStatus = 'Multiple Provision Types';
SELECT AdmFName1, District, COUNT(*) as count FROM schools GROUP BY AdmFName1, District ORDER BY count DESC LIMIT 2;
SELECT `District Code` FROM `frpm` WHERE `AdmFName1` = 'Alusine' AND `Percent (%) Eligible Free (K-12)` = `Free Meal Count (K-12)` / `Enrollment (K-12)` * 100%;
SELECT AdmLName1, District, County, School FROM schools WHERE CharterNum = 40;
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = '62' OR DOC = '54');
SELECT s.School, s.AdmEmail1 FROM satscores as sc JOIN schools as s ON sc.cds = s.CDSCode WHERE sc.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)
SELECT COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK PO OBRATU' AND T2.A3 = 'east bohemia'
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A3 = 'Prague');
SELECT A12, A13, A12 > A13 FROM district
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000 AND (SELECT AVG(birth_date) FROM client WHERE gender = 'F') > 6000 AND (SELECT AVG(birth_date) FROM client WHERE gender = 'F') < 10000
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE A3 = 'north Bohemia') AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency
SELECT account_id FROM client WHERE gender = 'F' ORDER BY birth_date DESC LIMIT 1;  SELECT AVG(A11) FROM district ORDER BY A11 DESC LIMIT 1;  SELECT AVG(A11) FROM district ORDER BY A11 LIMIT 1;  SELECT MAX(A11) - MIN(A11) FROM district;
SELECT account_id FROM client WHERE birth_date = (SELECT MIN(birth_date) FROM client) AND district_id = (SELECT district_id FROM district WHERE A11 = (SELECT MAX(A11) FROM district));
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'OWNER' AND d.disp_id IN ( 	SELECT disp_id FROM card WHERE type = 'junior' );
SELECT client_id FROM client JOIN disp ON client.client_id = disp.client_id WHERE disp.type = 'DISPONENT';
SELECT account_id, date, amount FROM loan WHERE status = 'A' AND date LIKE '1997%' ORDER BY amount LIMIT 1;
SELECT account_id, amount FROM loan WHERE duration > 12 ORDER BY amount DESC LIMIT 1;
SELECT COUNT(*) FROM client, district WHERE client.gender = 'F' AND client.birth_date < '1950-01-01' AND client.district_id = district.district_id AND district.A2 = 'Sokolov';
SELECT account_id, date FROM trans WHERE date LIKE '1995%' GROUP BY account_id ORDER BY MIN(date);
SELECT account_id FROM account WHERE date < '1997-01-01' AND frequency = 'POPLATEK MESICNE' AND district_id IN (SELECT district_id FROM district WHERE A10 > 3000);
SELECT client_id FROM client c, card ca WHERE c.client_id = ca.disp_id AND ca.issued = '1994-03-03'
SELECT date FROM account WHERE account_id = (SELECT account_id FROM trans WHERE amount = 840 AND date = '1998/10/14');
SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha' AND A3 = 'Prague' AND A4 = '1204953';
SELECT MAX(amount) FROM trans WHERE account_id IN (SELECT account_id FROM card WHERE issued = '1996-10-21');
SELECT gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district b ON a.district_id = b.district_id WHERE birth_date = (SELECT MIN(birth_date) FROM client) AND A11 = (SELECT MAX(A11) FROM district) LIMIT 1;
SELECT amount FROM trans WHERE account_id = (SELECT account_id FROM loan WHERE amount = (SELECT MAX(amount) FROM loan)) AND date > (SELECT date FROM account WHERE account_id = (SELECT account_id FROM loan WHERE amount = (SELECT MAX(amount) FROM loan))) ORDER BY date LIMIT 1
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik') AND c.gender = 'F';
SELECT disp_id FROM disp WHERE client_id IN (SELECT client_id FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha')) AND account_id IN (SELECT account_id FROM account WHERE date = '1998-09-02' AND amount = 5100);
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND date BETWEEN '1995-12-31' AND '1996-12-31';
SELECT district_id FROM client, district WHERE client.gender = 'F' AND client.birth_date = '1976-01-29' AND client.district_id = district.district_id;
SELECT birth_date FROM client WHERE client_id IN (SELECT client_id FROM account WHERE account_id IN (SELECT account_id FROM loan WHERE amount = 98832 AND date = '1996-01-03'));
SELECT account_id FROM client c, district d, account a WHERE c.client_id = a.client_id AND d.district_id = c.district_id AND d.A3 = 'Prague' ORDER BY a.account_id LIMIT 1
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE A3 ='south Bohemia' AND A4 = (SELECT MAX(A4) FROM district WHERE A3 ='south Bohemia')); SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A3 ='south Bohemia' AND A4 = (SELECT MAX(A4) FROM district WHERE A3 ='south Bohemia')); SELECT (1.0 * (SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE A3 ='south Bohemia' AND A4 = (SELECT MAX(A4) FROM district WHERE A3 ='south Bohemia'))) / (SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A3 ='south Bohemia' AND A4 = (SELECT MAX(A4) FROM district WHERE A3 ='south Bohemia')))) * 100;
SELECT ((SELECT balance FROM trans WHERE account_id = (SELECT account_id FROM loan WHERE loan_id = (SELECT loan_id FROM loan WHERE date = '1993-07-05' ORDER BY loan_id LIMIT 1)) AND date = '1998-12-27') - (SELECT balance FROM trans WHERE account_id = (SELECT account_id FROM loan WHERE loan_id = (SELECT loan_id FROM loan WHERE date = '1993-07-05' ORDER BY loan_id LIMIT 1)) AND date = '1993-03-22')) / (SELECT balance FROM trans WHERE account_id = (SELECT account_id FROM loan WHERE loan_id = (SELECT loan_id FROM loan WHERE date = '1993-07-05' ORDER BY loan_id LIMIT 1)) AND date = '1993-03-22') * 100
SELECT (SUM(amount) / SUM(amount)) * 100 AS percentage FROM loan WHERE status = 'A';
SELECT COUNT(DISTINCT account_id) / (SELECT COUNT(DISTINCT account_id) FROM loan WHERE amount < 100000) * 100 FROM loan WHERE amount < 100000 AND status = 'C';
SELECT account.account_id, district.A2, district.A3 FROM account, district WHERE account.date < '1994-01-01' AND account.date > '1992-12-31' AND account.district_id = district.district_id AND account.frequency = 'POPLATEK PO OBRATU';
SELECT account_id, frequency FROM account WHERE district_id IN (     SELECT district_id     FROM district     WHERE A4 = 'east Bohemia' ) AND date BETWEEN '1995-01-01' AND '2000-12-31';
SELECT account_id, date FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Prachatice');
SELECT district.A2, district.A3 FROM district JOIN loan ON district.district_id = loan.account_id WHERE loan.loan_id = 4990
SELECT account_id, A2, A3 FROM district, loan WHERE district_id = district.district_id AND amount > 300000
SELECT loan_id, district, avg(salary) FROM loan JOIN district ON loan.district_id = district.district_id WHERE duration = 60 GROUP BY loan_id, district
SELECT district.A2, district.A13 - district.A12 FROM district, loan, account WHERE loan.status = 'D' AND loan.account_id = account.account_id AND account.district_id = district.district_id
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Decin') AND date BETWEEN '1993-01-01' AND '1993-12-31';
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';
SELECT A2, COUNT(*) FROM client, district WHERE client.district_id = district.district_id AND gender = 'F' GROUP BY A2 ORDER BY COUNT(*) DESC LIMIT 9
SELECT district.A2, SUM(trans.amount) AS withdraws FROM district JOIN account ON district.district_id = account.district_id JOIN trans ON account.account_id = trans.account_id WHERE trans.type = 'VYDAJ' AND trans.date LIKE '1996-01%' GROUP BY district.A2 ORDER BY withdraws DESC LIMIT 10
SELECT COUNT(*) FROM client c WHERE NOT EXISTS (SELECT * FROM disp d WHERE d.client_id = c.client_id) AND c.district_id IN (SELECT district_id FROM district WHERE A3 = 'South Bohemia');
SELECT A3 FROM district WHERE district_id = (SELECT district_id FROM loan WHERE status = 'C' ORDER BY amount DESC LIMIT 1)
SELECT AVG(amount) FROM loan JOIN client ON loan.account_id = client.client_id WHERE gender = 'M';
SELECT A2, A13 FROM district WHERE A13 = (SELECT MAX(A13) FROM district WHERE A8 = 1996)
SELECT COUNT(*) FROM district WHERE district_id IN (SELECT district_id FROM client JOIN account ON client.client_id = account.client_id WHERE client.birth_date BETWEEN '1996-01-01' AND '1996-12-31' GROUP BY district_id ORDER BY SUM(A16) DESC LIMIT 1)
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM client WHERE birth_date < '1980-01-01') AND frequency = 'POPLATEK MESICNE' AND account_id IN (SELECT account_id FROM trans WHERE type = 'PRIJEM' AND operation = 'VYBER KARTOU' AND balance < 0);
SELECT COUNT(*) FROM loan WHERE account_id IN ( 	SELECT account_id 	FROM account 	WHERE frequency = 'POPLATEK MESICNE' ) AND amount >= 250000 AND date BETWEEN '1995-01-01' AND '1997-12-31' AND status = 'A';
SELECT COUNT(*) FROM account WHERE district_id = 1 AND frequency = 'POPLATEK MESICNE' AND date < '1995-03-24';
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM district WHERE A15 = (SELECT MAX(A15) - 1 FROM district));
SELECT COUNT(*) FROM card c JOIN disp d ON c.card_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER';
SELECT COUNT(*) FROM district WHERE A2 = "Pisek";
SELECT A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district WHERE district_id IN ( 	SELECT district_id 	FROM account 	WHERE account_id IN ( 		SELECT account_id 		FROM trans 		WHERE amount > 10000 AND date LIKE '1997%' 	) );
SELECT account_id FROM account JOIN order ON account.account_id = order.account_id WHERE k_symbol = 'SIPO' AND bank_to = 'PISEK';
SELECT account_id FROM account JOIN card ON account.account_id = card.card_id WHERE card.type = 'gold';
SELECT AVG(amount) FROM trans WHERE account_id IN ( 	SELECT account_id 	FROM account 	WHERE date >= '2021-01-01' AND date < '2022-01-01' ) AND type = 'VYBER KARTOU';
SELECT account_id FROM trans WHERE type = 'PRIJEM' AND operation = 'VYBER KARTOU' AND amount < (SELECT AVG(amount) FROM trans WHERE type = 'PRIJEM' AND operation = 'VYBER KARTOU' AND date BETWEEN '1998-01-01' AND '1998-12-31') AND date BETWEEN '1998-01-01' AND '1998-12-31';
SELECT client.client_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id JOIN loan ON disp.account_id = loan.account_id WHERE client.gender = 'F';
SELECT COUNT(*) FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 ='south Bohemia';
SELECT account_id FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Tabor') AND account_id IN (SELECT account_id FROM disp WHERE type = 'OWNER');
SELECT A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district WHERE A11 BETWEEN 8000 AND 9000;  SELECT A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district WHERE A11 BETWEEN 8000 AND 9000;  SELECT A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district WHERE A11 BETWEEN 8000 AND 9000;  SELECT A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district WHERE A11 BETWEEN 8000 AND 9000;  SELECT A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district WHERE A11 BETWEEN 8000 AND 9000;  SELECT A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district WHERE A11 BETWEEN 8000 AND 9000;  SELECT A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13,
SELECT COUNT(*) FROM district WHERE A3 = 'North Bohemia' AND A6 = 'AB';
SELECT A2 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ'
SELECT AVG(A15) FROM district WHERE A3 IN (SELECT A3 FROM district WHERE A15 > 4000 AND A16 >= 1997)
SELECT COUNT(*) FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN account a ON d.account_id = a.account_id WHERE c.type = 'classic' AND a.type = 'OWNER';
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha');
SELECT COUNT(card.card_id) / COUNT(card.card_id) * 100 FROM card WHERE card.type = 'gold' AND card.issued < '1998';
SELECT client.client_id, client.gender, client.birth_date, client.district_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id JOIN loan ON account.account_id = loan.account_id WHERE loan.amount = (SELECT MAX(amount) FROM loan)
SELECT A15 FROM district WHERE district_id = (SELECT district_id FROM account WHERE account_id = 532);
SELECT district_id FROM account WHERE account_id IN (SELECT account_id FROM order WHERE order_id = 33333);
SELECT * FROM trans WHERE account_id = 3356 AND type = 'VYBER' AND operation = 'VYBER KOMUNALNI'
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND account_id IN ( 	SELECT account_id 	FROM loan 	WHERE amount < 200000 );
SELECT type FROM card c, disp d WHERE c.card_id = d.disp_id AND d.client_id = 13539
SELECT district.A3 FROM district JOIN client ON district.district_id = client.district_id WHERE client.client_id = 3541
SELECT district_id, COUNT(*) FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY district_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT client.client_id, client.gender, client.birth_date, client.district_id FROM client, disp, card, account WHERE disp.disp_id = card.disp_id AND card.card_id = account.card_id AND account.account_id = client.account_id AND order.order_id = 32423
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM account WHERE district_id = 5);
SELECT COUNT(*) FROM district WHERE district_id = 5
SELECT client_id FROM client c JOIN card ca ON c.client_id = ca.disp_id WHERE ca.type = 'junior' AND ca.issued >= '1997-01-01'
SELECT COUNT(*) FROM client WHERE gender = 'F' AND district_id IN (SELECT district_id FROM district WHERE A11 > 10000) / SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A11 > 10000)
SELECT ((SELECT SUM(amount) FROM loan WHERE account_id IN (SELECT account_id FROM account WHERE client_id IN (SELECT client_id FROM client WHERE gender = 'M')) AND date BETWEEN '1996-01-01' AND '1997-01-01') - (SELECT SUM(amount) FROM loan WHERE account_id IN (SELECT account_id FROM account WHERE client_id IN (SELECT client_id FROM client WHERE gender = 'M')) AND date BETWEEN '1995-01-01' AND '1996-01-01')) / (SELECT SUM(amount) FROM loan WHERE account_id IN (SELECT account_id FROM account WHERE client_id IN (SELECT client_id FROM client WHERE gender = 'M')) AND date BETWEEN '1995-01-01' AND '1996-01-01') * 100
SELECT COUNT(*) FROM trans WHERE account_id = 1 AND date > '1995-01-01' AND operation = 'VYBER KARTOU';
SELECT A3, A16 FROM district WHERE A3 IN ('east bohemia', 'north bohemia') AND A16 IS NOT NULL;
SELECT COUNT(*) FROM disp WHERE client_id BETWEEN 1 AND 10 AND account_id BETWEEN 1 AND 10;
SELECT COUNT(*) FROM `order` WHERE `account_id` = 3; SELECT SUM(`amount`) FROM `trans` WHERE `account_id` = 3 AND `type` = 'ODEBET';
SELECT birth_date FROM client WHERE client_id = 130;
SELECT COUNT(*) FROM account WHERE district_id IN (     SELECT district_id     FROM district     WHERE A16 > 10000 ) AND frequency = 'POPLATEK PO OBRATU';
SELECT SUM(amount) AS debt, status FROM loan WHERE account_id IN ( 	SELECT account_id 	FROM disp 	WHERE client_id = 992 );
SELECT SUM(amount) FROM trans WHERE account_id = (SELECT account_id FROM disp WHERE client_id = 4) AND trans_id > 851; SELECT gender FROM client WHERE client_id = (SELECT client_id FROM disp WHERE account_id = (SELECT account_id FROM trans WHERE trans_id = 851));
SELECT type FROM card c, disp d WHERE c.card_id = d.disp_id AND d.client_id = 9
SELECT SUM(amount) FROM trans WHERE account_id = 617 AND date BETWEEN '1998-01-01' AND '1998-12-31';
SELECT client_id FROM client WHERE birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'east bohemia');
SELECT client_id FROM client WHERE gender = 'F' ORDER BY amount DESC LIMIT 3
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND a.frequency = 'POPLATEK MESICNE' AND a.amount > 4000;
SELECT COUNT(*) FROM district WHERE district_id = 3;
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.card_id WHERE c.gender = 'F' AND cr.type = 'junior';
SELECT COUNT(client.client_id) / COUNT(DISTINCT account.account_id) * 100 FROM client, account, district WHERE client.client_id = account.client_id AND district.district_id = client.district_id AND district.A3 = 'Prague' AND client.gender = 'F'
SELECT COUNT(client.client_id) / COUNT(disp.disp_id) * 100 FROM client, disp WHERE client.client_id = disp.client_id AND disp.type = 'OWNER' AND client.gender = 'M' AND disp.account_id IN ( 	SELECT account.account_id 	FROM account 	WHERE account.frequency = 'POPLATEK TYDNE' );
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'OWNER' AND d.disp_id IN ( 	SELECT disp_id FROM account a 	JOIN card c ON a.account_id = c.account_id 	WHERE c.type = 'classic' AND c.disp_id IN ( 		SELECT disp_id FROM account a 		JOIN card c ON a.account_id = c.account_id 		WHERE c.type = 'gold' AND c.disp_id IN ( 			SELECT disp_id FROM account a 			JOIN card c ON a.account_id = c.account_id 			WHERE c.type = 'junior' AND c.disp_id IN ( 				SELECT disp_id FROM account a 				JOIN card c ON a.account_id = c.account_id 				WHERE c.type = 'classic' AND c.disp_id IN ( 					SELECT disp_id FROM account a 					JOIN card c ON a.account_id = c.account_id 					WHERE c.type = 'gold' AND c.disp_id IN ( 						SELECT disp_id FROM account a 						JOIN card c ON a.account_id = c.account_id 						WHERE c.type = 'junior' AND c.disp_id IN ( 							SELECT disp_id FROM account a 							JOIN card c ON a.account_id = c.account_id 							WHERE c.type = 'classic' AND c.disp_id IN ( 								SELECT disp_id FROM account a 								JOIN card c ON a.account_id = c.account_id 								WHERE c.type = 'gold' AND c.disp_id IN ( 									SELECT disp_id FROM account a 									JOIN card c ON a.account_id = c.account_id 									WHERE c.type = 'junior' AND c.disp_id IN ( 										SELECT disp_id FROM account a 										JOIN card c ON a.account_id = c.account_id 										WHERE c.type = 'classic' AND c.disp_id IN ( 											SELECT disp_id FROM account a 											JOIN card c ON a.account_id = c.account_id 											WHERE c
SELECT account_id, amount, date FROM loan WHERE duration > 24 ORDER BY amount ASC, date ASC LIMIT 1;
SELECT account_id FROM client WHERE gender = 'F' ORDER BY birth_date DESC LIMIT 1;
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1920-01-01' AND '1929-12-31' AND d.A3 = 'east Bohemia';
SELECT COUNT(*) FROM loan WHERE duration = 24 AND frequency = 'POPLATEK TYDNE';
SELECT AVG(amount) FROM loan WHERE status = 'C' AND date > (SELECT date FROM trans WHERE account_id = loan.account_id AND type = 'PRIJEM' AND operation = 'VKLAD');
SELECT client_id, district_id FROM client WHERE district_id IN (     SELECT district_id     FROM district     WHERE A16 = 1 );
SELECT client.client_id, client.birth_date FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id WHERE card.type = 'gold' AND disp.type = 'OWNER';
SELECT bond_type, COUNT(bond_type) AS bond_count FROM bond GROUP BY bond_type ORDER BY bond_count DESC LIMIT 1;
SELECT COUNT(*) FROM molecule m, atom a WHERE m.molecule_id = a.molecule_id AND m.label = '-' AND a.element = 'cl';
SELECT AVG(element = 'o') FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '-'
SELECT AVG(bonds) FROM (     SELECT COUNT(*) AS bonds     FROM connected c     JOIN atom a ON c.atom_id = a.atom_id     JOIN molecule m ON a.molecule_id = m.molecule_id     WHERE m.label = '+' AND c.bond_id IN (         SELECT bond_id         FROM bond         WHERE bond_type = '-'     ) );
SELECT COUNT(*) FROM `atom` JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `atom`.`element` = 'na' AND `molecule`.`label` = '-';
SELECT `molecule`.`molecule_id` FROM `bond` JOIN `connected` ON `bond`.`bond_id` = `connected`.`bond_id` JOIN `atom` ON `connected`.`atom_id` = `atom`.`atom_id` JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `bond`.`bond_type` = '#' AND `molecule`.`label` = '+'
SELECT DIVIDE(SUM(element = 'c'), COUNT(atom_id)) FROM atom WHERE bond_type = '=';
SELECT COUNT(*) FROM bond WHERE bond_type = '#';
SELECT COUNT(*) FROM atom WHERE element!= 'br';
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';
SELECT DISTINCT `molecule`.`molecule_id` FROM `molecule` JOIN `atom` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `atom`.`element` = 'c';
SELECT element FROM atom WHERE atom_id IN (     SELECT atom_id, atom_id2     FROM connected     WHERE bond_id = 'TR004_8_9' );
SELECT element FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '=';
SELECT label FROM atom WHERE element = 'h' GROUP BY label ORDER BY COUNT(label) DESC LIMIT 1
SELECT bond_type FROM bond JOIN atom ON atom.molecule_id = bond.molecule_id WHERE element = 'cl'
SELECT atom_id, atom_id2 FROM connected WHERE bond_id IN ( 	SELECT bond_id 	FROM bond 	WHERE bond_type = '-' );
SELECT * FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-';
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE label = '-' GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20' UNION SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR004_20' AND connected.atom_id2 = 'TR004_8'
SELECT label FROM molecule WHERE NOT molecule_id IN (SELECT molecule_id FROM atom WHERE element!='sn')
SELECT COUNT(DISTINCT atom_id) FROM atom WHERE element = 'i' OR element ='s' AND atom_id IN (     SELECT atom_id     FROM connected     WHERE bond_id IN (         SELECT bond_id         FROM bond         WHERE bond_type = '-'     ) );
SELECT * FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';
SELECT atom_id, atom_id2, bond_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181') OR atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181');
SELECT 	DISTINCT 	DIVIDE( 		SUM( 			element = 'f' 		) * 100, 		COUNT( 			DISTINCT 			molecule_id 		) 	) FROM 	atom WHERE 	label = '+'
SELECT 	DIVIDE( 		( 			SELECT 				COUNT(*) 			FROM 				bond 			WHERE 				bond_type = '#' 		) 		* 100, 		( 			SELECT 				COUNT(*) 			FROM 				bond 			WHERE 				label = '+' 		) 	) 	AS percent;
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element LIMIT 3
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR001_2_6'
SELECT difference  FROM ( 	SELECT  		label, 		COUNT(*) AS count 	FROM molecule 	GROUP BY label ) AS t PIVOT ( 	SUM(count) 	FOR label IN ('+', '-') ) AS pivot_table UNPIVOT ( 	difference 	FOR label IN (difference) );
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5';
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2';
SELECT molecule_id FROM bond WHERE bond_type = '=' GROUP BY molecule_id ORDER BY molecule_id LIMIT 5
SELECT DIVIDE(COUNT(*), (SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR008')) as percent FROM bond WHERE bond_type = '=' AND molecule_id = 'TR008';
SELECT DIVIDE(SUM(label = '+'), COUNT(molecule_id)) as percent FROM molecule
SELECT  ROUND( 	( 		SELECT  			COUNT(atom_id)  		FROM  			atom  		WHERE  			element = 'h'  			AND  			molecule_id = 'TR206' 	) /  	( 		SELECT  			COUNT(atom_id)  		FROM  			atom  		WHERE  			molecule_id = 'TR206' 	), 	4 )  AS  percent
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';
SELECT atom.element, molecule.label FROM atom, molecule, connected WHERE atom.atom_id = connected.atom_id AND molecule.molecule_id = atom.molecule_id AND molecule.molecule_id = 'TR060';
SELECT bond_type, COUNT(bond_type) FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1; SELECT label FROM molecule WHERE molecule_id = 'TR010';
SELECT `molecule`.`molecule_id` FROM `molecule` JOIN `atom` ON `atom`.`molecule_id` = `molecule`.`molecule_id` JOIN `bond` ON `bond`.`molecule_id` = `molecule`.`molecule_id` JOIN `connected` ON `connected`.`atom_id` = `atom`.`atom_id` AND `connected`.`atom_id2` = `atom`.`atom_id` AND `connected`.`bond_id` = `bond`.`bond_id` WHERE `bond`.`bond_type` = '-' AND `molecule`.`label` = '-' GROUP BY `molecule`.`molecule_id` ORDER BY `molecule`.`molecule_id` LIMIT 3
SELECT bond_id FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id LIMIT 2;
SELECT COUNT(*) FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.atom_id = 'TR009_12' OR c.atom_id2 = 'TR009_12';
SELECT COUNT(*) FROM molecule m, atom a WHERE m.molecule_id = a.molecule_id AND m.label = '+' AND a.element = 'br';
SELECT bond_type, atom_id, atom_id2 FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond_id = 'TR001_6_9';
SELECT `molecule`.`label` FROM `atom` JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `atom`.`atom_id` = 'TR000_1';
SELECT COUNT(DISTINCT `molecule_id`) FROM `bond` WHERE `bond_type` = '#';
SELECT COUNT(bond_id) FROM connected WHERE atom_id = 'TR%_19';
SELECT `element` FROM `atom` WHERE `molecule_id` = 'TR004';
SELECT COUNT(*) FROM molecule WHERE label = '-';
SELECT DISTINCT `molecule`.`molecule_id` FROM `atom` JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `atom`.`atom_id` BETWEEN 'TR000_21' AND 'TR000_25' AND `molecule`.`label` = '+';
SELECT bond_id FROM bond JOIN atom ON atom.atom_id = bond.atom_id WHERE element = 'p'  UNION  SELECT bond_id FROM bond JOIN atom ON atom.atom_id = bond.atom_id WHERE element = 'n'
SELECT `molecule`.`molecule_id` FROM `bond` JOIN `molecule` ON `bond`.`molecule_id` = `molecule`.`molecule_id` WHERE `bond`.`bond_type` ='= ' GROUP BY `molecule`.`molecule_id` ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(t1.count) FROM ( 	SELECT COUNT(bond_id) AS count 	FROM connected AS t0 	JOIN atom AS t1 ON t0.atom_id = t1.atom_id 	WHERE t1.element = 'i' 	GROUP BY t0.atom_id )
SELECT bond_type, bond_id FROM bond WHERE bond_id = 'TR000_2_4';
SELECT `element` FROM `atom` WHERE `atom_id` NOT IN (SELECT `atom_id` FROM `connected` UNION SELECT `atom_id2` FROM `connected`);
SELECT atom_id, atom_id2 FROM connected WHERE bond_id IN (     SELECT bond_id     FROM bond     WHERE bond_type = '#' AND molecule_id = 'TR041' );
SELECT atom.element FROM atom, bond, connected WHERE bond.bond_id = 'TR144_8_19' AND bond.bond_id = connected.bond_id AND atom.atom_id = connected.atom_id
SELECT `molecule`.`molecule_id` FROM `molecule` JOIN `bond` ON `bond`.`molecule_id` = `molecule`.`molecule_id` WHERE `molecule`.`label` = '+' AND `bond`.`bond_type` ='= ' GROUP BY `molecule`.`molecule_id` ORDER BY COUNT(*) DESC LIMIT 1
SELECT `element` FROM `atom` WHERE `element` IN (SELECT `element` FROM `atom` WHERE `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '+')) GROUP BY `element` ORDER BY COUNT(`element`) LIMIT 1
SELECT atom_id2 FROM connected WHERE atom_id = (SELECT atom_id FROM atom WHERE element = 'pb');
SELECT element FROM atom a, bond b, connected c WHERE a.atom_id = c.atom_id AND b.bond_id = c.bond_id AND b.bond_type = '#';
SELECT bond_id, COUNT(atom_id) as count FROM connected GROUP BY bond_id ORDER BY count DESC LIMIT 1;
SELECT  DIVIDE(     SUM(label = '+'),     COUNT(bond_id) ) * 100.00000 AS proportion FROM bond JOIN atom ON atom.atom_id = bond.atom_id JOIN molecule ON molecule.molecule_id = atom.molecule_id WHERE bond_type = '-'
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');
SELECT atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element ='s'
SELECT bond_type FROM bond JOIN atom ON atom.molecule_id = bond.molecule_id WHERE element ='sn';
SELECT COUNT(DISTINCT element) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '-'
SELECT COUNT(*) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br');
SELECT bond_id FROM bond WHERE molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '+' );
SELECT `molecule`.`molecule_id` FROM `molecule` JOIN `bond` ON `bond`.`molecule_id` = `molecule`.`molecule_id` WHERE `bond`.`bond_type` = '-' AND `molecule`.`label` = '-'
SELECT 	mol.molecule_id, 	mol.label, 	COUNT(at.atom_id) as num_atoms, 	SUM(at.element = 'cl') as num_chlorine, 	DIVIDE(SUM(at.element = 'cl'), COUNT(at.atom_id)) as percent FROM 	atom at 	JOIN molecule mol ON at.molecule_id = mol.molecule_id 	JOIN bond b ON at.molecule_id = b.molecule_id 	JOIN connected c ON at.atom_id = c.atom_id WHERE 	b.bond_type = '-' GROUP BY 	mol.molecule_id, 	mol.label ORDER BY 	percent DESC
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');
SELECT `molecule_id` FROM `molecule` WHERE `label` = '-';
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';
SELECT a.element, a.atom_id FROM atom a, bond b, connected c WHERE a.atom_id = c.atom_id AND b.bond_id = c.bond_id AND b.bond_id = 'TR001_10_11'
SELECT COUNT(bond_id) FROM bond JOIN atom ON atom.atom_id = bond.bond_id WHERE element = 'i'
SELECT label, COUNT(*) FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE element = 'ca' GROUP BY label ORDER BY MAX(label) DESC LIMIT 1;
SELECT bond_id FROM bond WHERE bond_id = 'TR001_1_8' AND element = 'cl' AND element = 'c';
SELECT molecule_id FROM bond WHERE bond_type = '#' INTERSECT SELECT molecule_id FROM atom WHERE element = 'c' INTERSECT SELECT molecule_id FROM molecule WHERE label = '-';
SELECT 	COUNT(DISTINCT `atom`.`atom_id`) AS `num_atoms`, 	`atom`.`element` AS `element`, 	`molecule`.`label` AS `label`, 	ROUND( 		( 			SELECT 				COUNT(DISTINCT `atom`.`atom_id`) AS `num_atoms` 			FROM 				`atom` 			WHERE 				`atom`.`element` = 'cl' 		) / COUNT(DISTINCT `atom`.`atom_id`) * 100, 		2 	) AS `percentage` FROM 	`atom` 	JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE 	`atom`.`element` = 'cl' 	AND `molecule`.`label` = '+'
SELECT `element` FROM `atom` WHERE `molecule_id` = 'TR001';
SELECT molecule_id FROM bond WHERE bond_type ='= ';
SELECT atom_id, atom_id2 FROM connected WHERE bond_id IN ( 	SELECT bond_id 	FROM bond 	WHERE bond_type = '#' );
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR000_1_2';
SELECT COUNT(*) FROM molecule m, bond b WHERE m.molecule_id = b.molecule_id AND b.bond_type = '-' AND m.label = '-';
SELECT `label` FROM `molecule` AS T1 JOIN `bond` AS T2 ON T1.`molecule_id` = T2.`molecule_id` WHERE T2.`bond_id` = 'TR001_10_11'
SELECT bond_id, label FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond_type = '#' AND label = '+';
select element from atom join molecule on atom.molecule_id = molecule.molecule_id where label = '+' and substr(atom_id, 7, 1) = '4'
SELECT  	'+' as label, 	ROUND( 		CAST( 			COUNT( 				DISTINCT 				connected.atom_id 			) AS numeric 		) / 		( 			SELECT  				COUNT( 					DISTINCT 					atom.atom_id 				)  			FROM  				atom  			WHERE  				atom.molecule_id = 'TR006' 		), 		2 	) as ratio FROM  	connected  WHERE  	connected.atom_id IN ( 		SELECT  			atom.atom_id  		FROM  			atom  		WHERE  			atom.molecule_id = 'TR006' 			AND atom.element = 'h' 	) 	AND connected.atom_id2 IN ( 		SELECT  			atom.atom_id  		FROM  			atom  		WHERE  			atom.molecule_id = 'TR006' 	);
SELECT `label` FROM `molecule` WHERE `molecule_id` IN ( 	SELECT `molecule_id` 	FROM `atom` 	WHERE `element` = 'ca' );
SELECT bond_type FROM bond WHERE bond_id IN (     SELECT bond_id     FROM connected     WHERE atom_id IN (         SELECT atom_id         FROM atom         WHERE element = 'c'     ) );
SELECT element FROM atom WHERE atom_id IN ( 	SELECT atom_id 	FROM connected 	WHERE bond_id = 'TR001_10_11' 	UNION 	SELECT atom_id2 	FROM connected 	WHERE bond_id = 'TR001_10_11' );
SELECT 	COUNT(*) FROM 	bond WHERE 	bond_type = '#';
SELECT bond_type, COUNT(*) FROM bond WHERE molecule_id = 'TR047' GROUP BY bond_type;
SELECT label FROM molecule WHERE molecule_id IN ( 	SELECT molecule_id 	FROM atom 	WHERE atom_id = 'TR001_1' );
SELECT label FROM molecule WHERE molecule_id = 'TR151';
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.atom_id2 IN (     SELECT connected.atom_id2     FROM connected     WHERE connected.atom_id IN (         SELECT atom.atom_id         FROM atom         JOIN molecule ON atom.molecule_id = molecule.molecule_id         WHERE molecule.molecule_id = 'TR151'     ) )
SELECT COUNT(*) FROM molecule WHERE label = '+';
SELECT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c';
SELECT COUNT(*) FROM atom WHERE molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '+' );
SELECT bond_id FROM bond WHERE bond_type ='='AND molecule_id IN ( 	SELECT molecule_id 	FROM molecule 	WHERE label = '+' );
SELECT COUNT(*) FROM atom WHERE molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '+' ) AND element = 'h';
SELECT bond.molecule_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR000_1';
SELECT atom_id FROM atom WHERE element = 'c' AND molecule_id IN ( 	SELECT molecule_id 	FROM molecule 	WHERE label = '-' );
SELECT 	COUNT(DISTINCT `molecule`.`molecule_id`) AS `count_distinct_molecule_id`, 	`molecule`.`label` AS `label`, 	`atom`.`element` AS `element` FROM 	`atom` 	JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE 	`atom`.`element` = 'h' 	AND `molecule`.`label` = '+' ;
SELECT label FROM molecule WHERE molecule_id = 'TR124';
SELECT atom_id FROM atom WHERE molecule_id = 'TR186';
SELECT bond.bond_type FROM bond WHERE bond.bond_id = 'TR007_4_19';
SELECT element FROM atom WHERE atom_id IN ( 	SELECT atom_id 	FROM connected 	WHERE bond_id = 'TR001_10_11' );
SELECT COUNT(*) FROM bond WHERE bond_type = '=' AND molecule_id = 'TR006';
SELECT DISTINCT t1.label, t2.element  FROM molecule AS t1  JOIN atom AS t2 ON t1.molecule_id = t2.molecule_id  WHERE t1.label = '+' AND t2.element = 'cl';
SELECT bond_id, atom_id, atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-'
SELECT DISTINCT t1.molecule_id, t1.element FROM atom AS t1 JOIN bond AS t2 ON t1.atom_id = t2.bond_id WHERE t2.bond_type = '#'
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR000_2_3';
SELECT COUNT(*) FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 'cl';
SELECT atom_id, COUNT(DISTINCT bond_type) FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE molecule_id = 'TR346' GROUP BY atom_id;
SELECT COUNT(*) FROM molecule WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type ='= ') AND label = '+';
SELECT COUNT(*) FROM molecule WHERE NOT molecule_id IN (     SELECT molecule_id     FROM atom     WHERE element ='s' ) AND NOT molecule_id IN (     SELECT molecule_id     FROM bond     WHERE bond_type ='= ' );
SELECT label FROM molecule WHERE molecule_id IN ( 	SELECT molecule_id 	FROM bond 	WHERE bond_id = 'TR001_2_4' );
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';
SELECT COUNT(*) FROM bond WHERE bond_type = '-';
SELECT `molecule`.`molecule_id` FROM `atom` JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `atom`.`element` = 'cl' AND `molecule`.`label` = '+'
SELECT `molecule`.`molecule_id` FROM `molecule` JOIN `atom` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `atom`.`element` = 'c' AND `molecule`.`label` = '-'
SELECT 	COUNT(DISTINCT `molecule`.`molecule_id`) AS `count` FROM 	`atom` 	JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE 	`atom`.`element` = 'cl' 	AND `molecule`.`label` = '+';
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';
SELECT COUNT(DISTINCT `element`) FROM `atom` WHERE `atom_id` IN (SELECT `atom_id` FROM `connected` WHERE `bond_id` = 'TR001_10_11');
SELECT bond_type FROM bond WHERE bond_id = (SELECT bond_id FROM connected WHERE atom_id = 'TR000_1' AND atom_id2 = 'TR000_2');
SELECT `molecule`.`molecule_id` FROM `atom` JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `atom`.`atom_id` = "TR000_2" AND `connected`.`atom_id2` = "TR000_4"
SELECT `element` FROM `atom` WHERE `atom_id` = 'TR000_1';
SELECT `label` FROM `molecule` WHERE `molecule_id` = 'TR000';
SELECT 	COUNT(bond_id) as bond_count, 	DIVIDE(SUM(bond_type = '-'), COUNT(bond_id)) as percentage FROM 	bond
SELECT COUNT(*) FROM molecule m, atom a WHERE m.molecule_id = a.molecule_id AND a.element = 'n' AND m.label = '+';
SELECT molecule_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON bond.bond_id = connected.bond_id WHERE element ='s' AND bond_type ='= '
SELECT `molecule`.`molecule_id` FROM `molecule` JOIN `atom` ON `molecule`.`molecule_id` = `atom`.`molecule_id` WHERE `molecule`.`label` = '-' GROUP BY `molecule`.`molecule_id` HAVING COUNT(molecule_id) > 5
SELECT element FROM atom WHERE atom_id IN ( 	SELECT atom_id 	FROM connected 	WHERE bond_id IN ( 		SELECT bond_id 		FROM bond 		WHERE bond_type = '=' AND molecule_id = 'TR024' 	) );
SELECT label FROM molecule WHERE molecule_id IN ( 	SELECT atom.molecule_id 	FROM atom 	GROUP BY atom.molecule_id 	ORDER BY COUNT(atom.molecule_id) DESC 	LIMIT 1 );
SELECT 	ROUND( 		( 			SELECT 				COUNT( 					DISTINCT 					connected.atom_id 				) 			FROM 				connected, 				atom, 				bond, 				molecule 			WHERE 				connected.atom_id = atom.atom_id 				AND connected.atom_id2 = atom.atom_id 				AND connected.bond_id = bond.bond_id 				AND bond.bond_type = '#' 				AND atom.element = 'h' 				AND molecule.molecule_id = bond.molecule_id 				AND molecule.label = '+' 		) 		/ 		( 			SELECT 				COUNT( 					DISTINCT 					bond.molecule_id 				) 			FROM 				bond, 				molecule 			WHERE 				bond.molecule_id = molecule.molecule_id 				AND molecule.label = '+' 		) 		* 100.0 	) 	AS percentage;
SELECT COUNT(*) FROM molecule WHERE label = '+';
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR004' and 'TR010' AND molecule_id IN ( 	SELECT bond.molecule_id 	FROM bond 	WHERE bond_type = '-' );
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'
SELECT element FROM atom WHERE atom_id = 'TR004_7' AND molecule_id IN ( 	SELECT molecule_id 	FROM molecule 	WHERE label = '-' );
SELECT COUNT(DISTINCT molecule_id) FROM bond JOIN atom ON atom.atom_id = bond.bond_id WHERE element = 'o' AND bond_type = '=';
SELECT COUNT(*) FROM molecule m, bond b WHERE m.molecule_id = b.molecule_id AND b.bond_type = '#' AND m.label = '-';
SELECT a.element, b.bond_type FROM atom a, bond b, connected c WHERE a.atom_id = c.atom_id AND b.bond_id = c.bond_id AND c.atom_id2 = a.atom_id AND c.atom_id2 = b.bond_id AND c.atom_id2 = 'TR002'
SELECT atom_id FROM atom WHERE element = 'c' AND atom_id IN (     SELECT atom_id     FROM connected     WHERE bond_id IN (         SELECT bond_id         FROM bond         WHERE bond_type = '='         AND molecule_id = 'TR012'     ) );
SELECT atom_id FROM atom WHERE molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '+' ) AND element = 'o';
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT * FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId!= NULL AND cardKingdomId!= NULL
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards);
SELECT name FROM cards c JOIN legalities l ON c.id = l.id WHERE l.format = 'edh' AND l.status = 'legal' AND c.frameVersion = '2015' AND c.edhrecRank < 100
SELECT cards.name FROM cards JOIN legalities ON cards.id = legalities.id WHERE cards.rarity ='mythic' AND legalities.format = 'gladiator' AND legalities.status = 'Banned';
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.type = 'Artifact' AND cards.side IS NULL AND legalities.format = 'vintage';
SELECT id, artist FROM cards WHERE (power = '*' OR power IS NULL) AND uuid IN (     SELECT uuid     FROM legalities     WHERE format = 'commander' AND status = 'Legal' );
SELECT c.id, r.text FROM cards c JOIN rulings r ON c.id = r.uuid WHERE c.artist = 'Stephen Daniele' AND c.hasContentWarning = 1
SELECT text FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Sublime Epiphany' AND number = '74s');
SELECT cards.name, cards.artist, isPromo FROM cards JOIN rulings ON cards.uuid = rulings.uuid GROUP BY cards.name, cards.artist, isPromo ORDER BY COUNT(rulings.uuid) DESC LIMIT 1;
SELECT language FROM foreign_data WHERE uuid IN (     SELECT uuid     FROM cards     WHERE name = 'Annul' AND number = '29' );
SELECT name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'Japanese';
SELECT Divide(Sum(id where language = 'Chinese Simplified'), Count(id)) *100
SELECT name, totalSetSize FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE language = 'Italian';
SELECT COUNT(DISTINCT type) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE artist = 'Aaron Boyd';
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';
SELECT COUNT(*) FROM cards WHERE power = '*';
SELECT promoTypes FROM cards WHERE name = 'Duress';
SELECT `borderColor` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';
SELECT originalType FROM cards WHERE name = "Ancestor's Chosen";
SELECT language FROM set_translations WHERE setCode IN (SELECT setCode FROM cards WHERE name = 'Angel of Mercy');
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.id = l.id WHERE l.status ='restricted' AND c.isTextless = 0;
SELECT text FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = "Ancestor's Chosen");
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.id = l.id WHERE l.status ='restricted' AND c.isStarter = 1;
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Aven Cloudchaser';
SELECT type FROM cards WHERE name = 'Benalish Knight';
SELECT text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Benalish Knight';
SELECT artist FROM cards WHERE setCode = '10E' AND language = 'Phyrexian';
SELECT Divide(Count(id) where borderColor = 'borderless', Count(id)) *100 as percentage FROM cards;
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'German' AND c.isReprint = 1;
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'Russian' AND c.borderColor = 'borderless';
SELECT (SELECT COUNT(id) FROM cards WHERE language = 'French' AND isStorySpotlight = 1) / (SELECT COUNT(id) FROM cards WHERE isStorySpotlight = 1) * 100 AS percentage;
SELECT COUNT(*) FROM cards WHERE toughness = 99;
SELECT * FROM cards WHERE artist = 'Aaron Boyd';
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability ='mtgo';
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT layout FROM cards WHERE keywords LIKE '%flying%';
SELECT COUNT(*) FROM cards WHERE originalType LIKE 'Summon - Angel' AND subtypes NOT LIKE 'Angel';
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT id FROM cards WHERE duelDeck = 'a';
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';
SELECT artist FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'Chinese Simplified';
SELECT cards.name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Japanese' AND cards.availability = 'paper';
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.id = l.id WHERE l.status = 'Banned' AND c.borderColor = 'white';
SELECT uuid, language FROM cards c JOIN foreign_data f ON c.uuid = f.uuid JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'legacy';
SELECT text FROM rulings WHERE uuid = '56f4935b-f6c5-59b9-88bf-9bcce20247ce';
SELECT COUNT(*) FROM cards WHERE frameVersion = 'future';  SELECT * FROM legalities WHERE status = 'legal';
SELECT cards.colors FROM cards WHERE cards.setCode = 'OGW';
SELECT cards.name, foreign_data.language FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.setCode = '10E' AND cards.convertedManaCost = 5;
SELECT name, date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE originalType = 'Creature - Elf';
SELECT colors, setCode FROM cards WHERE id BETWEEN 1 AND 20;
SELECT c.name, f.language FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.colors = 'B' AND c.type = 'Artifact' AND f.language IS NOT NULL;
SELECT name FROM cards WHERE rarity = 'uncommon' ORDER BY (SELECT date FROM rulings WHERE uuid = cards.uuid) ASC LIMIT 3;
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomId IS NOT NULL AND cardKingdomFoilId IS NOT NULL AND power = '0';
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability ='mtgo' AND hand = -1
SELECT COUNT(*) FROM cards WHERE hasContentWarning = 1 AND availability = 'paper' AND frameVersion = '1993';
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability ='mtgo,paper';
SELECT SUM(convertedManaCost) FROM cards WHERE artist = 'Rob Alexander';
SELECT type FROM cards WHERE availability = 'arena'
SELECT setCode FROM set_translations WHERE language = 'Spanish';
SELECT DIVIDE(COUNT(isOnlineOnly=1), COUNT(id)) from cards where frameEffects = 'legendary'
SELECT id, (SELECT (SELECT SUM(count(id)) FROM cards WHERE isStorylight = 1 AND isTextless = 0) / (SELECT SUM(count(id)) FROM cards) * 100) AS percentage FROM cards WHERE isStorylight = 1 AND isTextless = 0;
SELECT name, (SELECT COUNT(id) FROM foreign_data WHERE language = 'Spanish')/COUNT(id)*100 FROM cards;
SELECT language FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE baseSetSize = 309);
SELECT COUNT(*) FROM set_translations WHERE language = 'Portuguese (Brasil)' AND setCode IN (SELECT code FROM sets WHERE block = 'Commander');
SELECT id FROM cards WHERE types = 'Creature' AND status = 'legal';
SELECT type FROM cards WHERE subtypes IS NOT NULL AND supertypes IS NOT NULL AND language = 'German';
SELECT COUNT(*) FROM cards WHERE (power = '*' OR power IS NULL) AND text LIKE '%triggered ability%';
SELECT COUNT(*) FROM cards c WHERE c.layout NOT IN ('transform','modal_dfc') AND c.setCode IN (SELECT code FROM sets WHERE releaseDate < '2004-01-01') AND c.uuid IN (     SELECT uuid     FROM rulings     WHERE text = 'This is a triggered mana ability.' ) AND c.side IS NULL;
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability = 'paper' AND convertedManaCost <= 2;
SELECT artist FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.text = "Das perfekte Gegenmittel zu einer dichten Formation";
SELECT foreign_data.name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.type = 'Creature' AND cards.layout = 'normal' AND cards.borderColor = 'black' AND cards.artist = 'Matthew D. Wilson' AND foreign_data.language = 'French';
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.id = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01';
SELECT language FROM set_translations WHERE setCode IN (     SELECT code     FROM sets     WHERE baseSetSize = 180 AND block = 'Ravnica' );
SELECT DIVIDE(COUNT(hasContentWarning = 0),COUNT(ID))*100 FROM cards WHERE format = 'commander' AND Status = 'legal';
SELECT DIVIDE(COUNT(language = 'French' and power is NULL or power = '*'), COUNT( power is NULL or power = '*'))*100 FROM cards
SELECT DIVIDE(COUNT(language = 'Japanese'),COUNT(language))*100 FROM set_translations WHERE type = 'expansion';
SELECT availability FROM cards WHERE artist = 'Daren Bader';
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;
SELECT name, power FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague' ORDER BY power LIMIT 3;
SELECT language FROM foreign_data WHERE multiverseid = 149934;
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3;
SELECT DIVIDE(COUNT(isTextless = 1 and layout = 'normal'),COUNT(isTextless))*100 FROM cards;
SELECT `number` FROM `cards` WHERE `subtypes` = 'Angel,Wizard' AND `otherFaceIds` IS NULL
SELECT name, code FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3
SELECT language FROM set_translations WHERE setCode = 'ARC' AND translation = 'Archenemy';
SELECT name, translation FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE id = 5;
SELECT language, type FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE id = 206);
SELECT id, name FROM cards WHERE uuid IN (     SELECT uuid     FROM foreign_data     WHERE language = 'Italian' ) AND setCode IN (     SELECT code     FROM sets     WHERE block = 'Shadowmoor' ) ORDER BY name LIMIT 2;
SELECT id FROM sets WHERE isForeignOnly = 1 AND isFoilOnly = 1 AND language = 'Japanese';
SELECT code, MAX(baseSetSize) FROM sets WHERE language = 'Russian';
SELECT COUNT(language = 'Chinese Simplified' AND isOnlineOnly = 1) / COUNT(language = 'Chinese Simplified') * 100 FROM foreign_data;
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '');
SELECT id FROM cards WHERE borderColor = 'black';
SELECT id FROM cards WHERE frameEffects = 'extendedart';
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;
SELECT language FROM set_translations WHERE setCode = "174";
SELECT name FROM sets WHERE code = "ALL";
SELECT language FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'A Pedra Fellwar');
SELECT code FROM sets WHERE releaseDate = '2007-07-13';
SELECT baseSetSize, code FROM sets WHERE block = "Mirage" OR block = "Masques";
SELECT code FROM sets WHERE type = 'expansion';
SELECT foreign_data.name, cards.type FROM foreign_data, cards WHERE foreign_data.uuid = cards.uuid AND cards.watermark = 'Boros';
SELECT language, flavorText, type FROM foreign_data, cards WHERE foreign_data.uuid = cards.uuid AND watermark = 'colorpie';
SELECT DIVIDE(COUNT(cards.convertedManaCost = 10),COUNT(cards.convertedManaCost))*100 FROM cards, sets WHERE sets.name = 'Abyssal Horror' AND cards.setCode = sets.code
SELECT code FROM sets WHERE type = 'expansion commander';
SELECT foreign_data.name, cards.type FROM foreign_data, cards WHERE foreign_data.uuid = cards.uuid AND cards.watermark = 'Abzan';
SELECT c.type, f.language FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'azorius';
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';
SELECT name FROM cards WHERE isTextless = 0;
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen';
SELECT COUNT(*) FROM cards WHERE bordercolor = 'white' AND (power = '*' OR power IS NULL);
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';
SELECT COUNT(artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%';
SELECT name, convertedManaCost FROM cards WHERE name = 'Serra Angel' OR name = 'Shrine Keeper' ORDER BY convertedManaCost DESC LIMIT 1;
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;
SELECT set_translations.translation FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE cards.name = 'Ancestor''s Chosen' AND set_translations.language = 'Italian';
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT code FROM cards WHERE name = 'Angel of Mercy');
SELECT name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid JOIN sets s ON c.setCode = s.code WHERE f.language = 'German' AND s.code = '10E';
SELECT * FROM cards WHERE name = 'Ancestor''s Chosen' AND language = 'Korean';
SELECT COUNT(*) FROM cards WHERE setCode = (SELECT code FROM sets WHERE translation = 'Hauptset Zehnte Edition') AND artist = 'Adam Rex';
SELECT baseSetSize FROM sets WHERE translation = 'Hauptset Zehnte Edition';
SELECT translation FROM set_translations WHERE setCode = '8ED' AND language = 'Chinese Simplified';
SELECT name FROM cards WHERE name = 'Angel of Mercy' AND mtgoCode IS NOT NULL;
SELECT releaseDate FROM cards c, sets s WHERE c.name = 'Ancestor''s Chosen' AND c.setCode = s.code;
SELECT type FROM sets WHERE translation = 'Hauptset Zehnte Edition';
SELECT COUNT(*) FROM set_translations WHERE language = 'Italian' AND translation IS NOT NULL AND setCode IN (SELECT code FROM sets WHERE block = 'Ice Age');
SELECT name FROM cards WHERE name = 'Adarkar Valkyrie' AND isForeignOnly = 1;
SELECT COUNT(*) FROM sets WHERE language = 'Italian' AND translation IS NOT NULL AND baseSetSize < 100;
SELECT COUNT(*) FROM cards WHERE setCode = 'CSP' AND borderColor = 'black';
SELECT name FROM cards c, sets s WHERE c.setCode = s.code AND s.name = 'Coldsnap' AND c.convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards c, sets s WHERE c.setCode = s.code AND s.name = 'Coldsnap');
SELECT artist FROM cards WHERE setCode = 'C10' AND artist IN ('Jeremy Jarvis', 'Aaron Miller','Chippy');
SELECT * FROM cards WHERE setCode = '10E' AND number = '4';
SELECT COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL);
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen';
SELECT language FROM foreign_data WHERE flavorText IS NOT NULL AND uuid = (SELECT uuid FROM cards WHERE name = 'Ancestor''s Chosen');
SELECT type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'German' AND c.name = 'Ancestor''s Chosen';
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid JOIN foreign_data ON cards.uuid = foreign_data.uuid JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND foreign_data.language = 'Italian';
SELECT foreignData.name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.setCode = '3ED' AND foreign_data.language = 'Italian' AND cards.convertedManaCost = (SELECT MAX(cards.convertedManaCost) FROM cards WHERE cards.setCode = '3ED');
SELECT date FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Reminisce');
SELECT DIVIDE(SUM(convertedManaCost = 7), SUM(convertedManaCost))*100 FROM cards WHERE name = 'Coldsnap';
SELECT DIVIDE(SUM(cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL), SUM(name = 'Coldsnap'))*100 AS percentage FROM cards;
SELECT code FROM sets WHERE releaseDate = '2017-07-14';
SELECT keyruneCode FROM sets WHERE code = 'PKHC';
SELECT mcmId FROM sets WHERE code = 'SS2';
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%';
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';
SELECT c.name, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' AND c.hasContentWarning = 1;
SELECT releaseDate FROM cards c, sets s WHERE c.name = 'Evacuation' AND c.setCode = s.code
SELECT baseSetSize FROM sets WHERE translation = 'Rinascita di Alara';
SELECT type FROM sets WHERE translation = 'Huitième édition';
SELECT set_translations.translation FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE cards.name = 'Tendo Ice Bridge' AND set_translations.language = 'French';
SELECT COUNT(*) FROM set_translations WHERE translation IS NOT NULL AND setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition');
SELECT set_translations.translation FROM set_translations JOIN cards ON set_translations.setCode = cards.setCode WHERE cards.name = 'Fellwar Stone' AND set_translations.language = 'Japanese';
SELECT name, MAX(convertedManaCost) FROM cards c, sets s WHERE c.setCode = s.code AND s.name = 'Journey into Nyx Hero''s Path'
SELECT releaseDate FROM sets WHERE translation = 'Ola de frío';
SELECT type FROM cards c, sets s WHERE c.name = 'Samite Pilgrim' AND c.setCode = s.code;
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'World Championship Decks 2004' AND c.convertedManaCost = 3
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND setCode = 'MIR';
SELECT DIVIDE(SUM(isNonFoilOnly = 1), SUM(language = 'Japanese'))*100 FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE language = 'Japanese';
SELECT DIVIDE(SUM(isOnlineOnly = 1), SUM(language = 'Portuguese (Brazil)))*100 FROM cards WHERE language = 'Portuguese (Brazil)'
SELECT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1;
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT MAX(frameEffects) FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'a';
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT name, convertedManaCost FROM cards WHERE format = 'duel' ORDER BY convertedManaCost DESC LIMIT 10;
SELECT MIN(originalReleaseDate), format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE rarity ='mythic' AND status = 'legal' GROUP BY format;
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.artist = 'Volkan Baǵa' AND f.language = 'French';
SELECT COUNT(*) FROM cards WHERE rarity = 'rare' AND types = 'Enchantment' AND name = 'Abundance' AND uuid IN (SELECT uuid FROM legalities WHERE status = 'Legal');
SELECT format, name FROM cards c JOIN legalities l ON c.id = l.id WHERE status = 'Banned' GROUP BY format ORDER BY COUNT(status = 'Banned') DESC LIMIT 1;
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Battlebond');
SELECT artist, format FROM cards GROUP BY artist ORDER BY COUNT(artist) LIMIT 1;
SELECT status FROM cards WHERE frameVersion = '1997' AND artist = 'D. Alexander Gregory' AND hasContentWarning = 1 AND format = 'legacy';
SELECT name, format FROM cards c JOIN legalities l ON c.id = l.id WHERE edhrecRank = 1 AND status = 'Banned'
SELECT AVG(id) FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31';
SELECT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena';
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned','restricted');
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';
SELECT text FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE artist = 'Kev Walker') ORDER BY date DESC;
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Hour of Devastation' AND legalities.status = 'Legal';
SELECT name FROM sets WHERE language NOT LIKE '%Japanese%' AND language = 'Korean';
SELECT frameVersion, artist, status FROM cards WHERE artist = 'Allen Williams' AND status = 'Banned';
SELECT Id, DisplayName, Reputation FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);
SELECT DisplayName FROM users WHERE year(CreationDate) = 2011
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users);
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1
SELECT COUNT(*) FROM users WHERE Views > 10 AND strftime('%Y', CreationDate) > 2013
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = "csgillespie"
SELECT Title FROM posts WHERE OwnerDisplayName = "csgillespie"
SELECTDisplayName FROM users JOIN posts ON users.Id = posts.OwnerUserId WHERE posts.Title = 'Eliciting priors from experts'
SELECT Title FROM posts WHERE OwnerDisplayName = "csgillespie" AND ViewCount = (SELECT MAX(ViewCount) FROM posts WHERE OwnerDisplayName = "csgillespie");
SELECT OwnerDisplayName FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)
SELECT SUM(CommentCount) FROM posts WHERE OwnerDisplayName = "csgillespie"
SELECT AnswerCount FROM posts WHERE OwnerDisplayName = "csgillespie" AND AnswerCount = (SELECT MAX(AnswerCount) FROM posts);
SELECT LastEditorDisplayName FROM posts WHERE Title = "Examples for teaching: Correlation does not mean causation"
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL
SELECT DISTINCT OwnerDisplayName FROM posts WHERE ClosedDate IS NOT NULL
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE Age > 65) AND Score >= 20
SELECT Location FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Title = 'Eliciting priors from experts');
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = "bayesian");
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = (SELECT TagName FROM tags GROUP BY TagName ORDER BY Count DESC LIMIT 1));
SELECT COUNT(*) FROM badges b, users u WHERE b.UserId = u.Id AND u.DisplayName = 'csgillespie'
SELECT Name FROM badges b, users u WHERE b.UserId = u.Id AND u.DisplayName = 'csgillespie'
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011
SELECTDisplayName FROM users WHERE Id IN ( 	SELECT UserId 	FROM badges 	GROUP BY UserId 	ORDER BY COUNT(Id) DESC 	LIMIT 1 );
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = "csgillespie"
SELECT AVG(Count(Id)) FROM badges, users WHERE badges.UserId = users.Id AND users.Views > 200
SELECT Divide(Count(Id), Count(Id)) * 100 FROM posts WHERE Score > 5 AND OwnerUserId IN (SELECT Id FROM users WHERE Age > 65);
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';
SELECT posts.Title FROM comments JOIN posts ON comments.PostId = posts.Id WHERE comments.Score = (SELECT MAX(comments.Score) FROM comments)
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910);
SELECT FavoriteCount FROM posts WHERE Id IN (SELECT PostId FROM comments WHERE UserId = 3025 AND CreationDate = '2014/4/23 20:29:39.0');
SELECT Text FROM comments WHERE PostId = 107829 AND CommentCount = 1
SELECT Id, PostTypeId, AcceptedAnswerId, CreaionDate, Score, ViewCount, Body, OwnerUserId, LastActivityDate, Title, Tags, AnswerCount, CommentCount, FavoriteCount, LastEditorUserId, LastEditDate, CommunityOwnedDate, ParentId, ClosedDate, OwnerDisplayName, LastEditorDisplayName FROM posts WHERE OwnerUserId = 23853 AND CreationDate = '2013-07-12 09:08:18.0' AND (ClosedDate IS NULL OR ClosedDate IS NOT NULL);
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041);
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = "Tiago Pasqualini"
SELECT `DisplayName` FROM `users` WHERE `Id` = (SELECT `UserId` FROM `votes` WHERE `Id` = 6347);
SELECT COUNT(*) FROM votes v, posts p WHERE v.PostId = p.Id AND p.Title LIKE '%data visualization%';
SELECT badges.Name FROM badges, users WHERE badges.UserId = users.Id AND users.DisplayName = "DatEpicCoderGuyWhoPrograms"
SELECT COUNT(post.Id) / COUNT(votes.Id) FROM post JOIN votes ON post.Id = votes.PostId WHERE post.OwnerUserId = 24
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT Name FROM badges b, users u WHERE b.UserId = u.Id AND u.DisplayName = 'SilentGhost'
SELECT u.DisplayName FROM users u, comments c WHERE u.Id = c.UserId AND c.Text = 'thank you user93!'
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion';
SELECTDisplayName, Reputation FROM users u, posts p WHERE u.Id = p.OwnerUserId AND p.Title = 'Understanding what Dassault iSight is doing?'
SELECT Text FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Title = 'How does gentle boosting differ from AdaBoost?');
SELECT DisplayName FROM users WHERE Id IN ( 	SELECT UserId 	FROM badges 	WHERE Name = 'Necromancer' ) LIMIT 10
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Title = 'Open source tools for visualizing multi-dimensional data?'
SELECT Title FROM posts WHERE LastEditorDisplayName = "Vebjorn Ljosa"
SELECT SUM(score), users.websiteurl FROM posts JOIN users ON posts.lasteditoruserid = users.id WHERE users.displayname = "Yevgeny" GROUP BY users.websiteurl;
SELECT * FROM comments c JOIN postHistory ph ON c.PostId = ph.PostId WHERE ph.Text LIKE '%Why square the difference instead of taking the absolute value in standard deviation?%'
SELECT SUM(BountyAmount) FROM posts WHERE Title LIKE '%data%';
SELECT DisplayName FROM users WHERE Id IN (SELECT UserId FROM votes WHERE BountyAmount = 50 AND PostId IN (SELECT Id FROM posts WHERE Title LIKE '%variance%'));
SELECT Title, Text, AVG(ViewCount) FROM posts JOIN postHistory ON posts.Id = postHistory.PostId JOIN tags ON posts.Tags LIKE '%' || tags.TagName || '%' WHERE tags.TagName = 'humor' GROUP BY posts.Id
SELECT COUNT(*) FROM comments WHERE UserId = 13
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);
SELECT Id FROM users ORDER BY Views LIMIT 1
select count(distinct UserId) from badges where Name = 'Supporter' and year(Date) = 2011
SELECT COUNT(DISTINCT UserId) FROM badges GROUP BY UserId HAVING COUNT(Name) > 5
SELECT COUNT(DISTINCT users.Id) FROM badges, users WHERE badges.Name = 'Teacher' AND badges.UserId = users.Id AND users.Location = 'New York' AND badges.Name = 'Supporter'
SELECT u.DisplayName, u.Reputation FROM users u, posts p WHERE u.Id = p.OwnerUserId AND p.Id = 1
SELECT Users.Id, Users.DisplayName, COUNT(PostHistory.PostId) as PostHistoryCount FROM Users JOIN PostHistory ON Users.Id = PostHistory.UserId WHERE PostHistory.PostId IN (SELECT PostId FROM Posts WHERE Views >= 1000) GROUP BY Users.Id HAVING COUNT(PostHistory.PostId) = 1;
SELECT Users.Id, Users.DisplayName, Badges.Name FROM Users JOIN Badges ON Users.Id = Badges.UserId JOIN Comments ON Users.Id = Comments.UserId GROUP BY Users.Id ORDER BY COUNT(Comments.Id) DESC LIMIT 1
SELECT COUNT(*) FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Teacher' AND u.Location = 'India'
SELECT Subtract(Divide(Count(Name), Count(Name)) * 100, Divide(Count(Name), Count(Name)) * 100) FROM badges WHERE Name = 'Student' AND Year(Date) = 2010
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;
SELECT p.Id, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = 61217
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395
SELECT Id, Score, OwnerUserId FROM posts WHERE Score > 60;
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND YEAR(CreationDate) = 2011
SELECT AVG(UpVotes), AVG(Age) FROM users WHERE Id IN ( 	SELECT UserId 	FROM posts 	GROUP BY UserId 	HAVING COUNT(UserId) > 10 );
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer';
SELECT Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0'
SELECT COUNT(*) FROM comments WHERE score > 60
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(Id) FROM posts WHERE Score = 10
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users));
SELECT u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'
SELECT Name FROM badges b, users u WHERE b.UserId = u.Id AND u.DisplayName = "Pierre"
SELECT Date FROM badges, users WHERE users.Id = badges.UserId AND users.Location = 'Rochester, NY'
SELECT COUNT(UserId) / (SELECT COUNT(UserId) FROM badges WHERE Name = "Teacher") * 100 FROM badges WHERE Name = "Teacher";
SELECT COUNT(Id) / (SELECT COUNT(Id) FROM users WHERE Age BETWEEN 13 AND 18) * 100 FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Name = 'Organizer');
SELECT Score FROM comments WHERE CreationDate = '2010-07-19 19:19:56.0'
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'
SELECT age FROM users u, badges b WHERE u.id = b.userid AND location = "Vienna, Austria"
SELECT COUNT(*) FROM users u 	JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65
SELECT SUM(Users.Views) FROM Badges JOIN Users ON Badges.UserId = Users.Id WHERE Badges.Date = '2010-07-19 19:39:08.0'
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE Reputation = (SELECT MIN(Reputation) FROM users));
SELECT Name FROM badges b, users u WHERE b.UserId = u.Id AND u.DisplayName = "Sharpie"
SELECT COUNT(*) FROM badges b, users u WHERE b.Name = "Supporter" AND b.UserId = u.Id AND u.Age > 65
SELECT DisplayName FROM users WHERE Id = 30
SELECT COUNT(*) FROM users WHERE Location = 'New York'
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;
SELECT Id, DisplayName, Views FROM users WHERE Views = (SELECT MAX(Views) FROM users);
SELECT  	COUNT(Id) as count_2010, 	(SELECT COUNT(Id) FROM votes WHERE YEAR(CreationDate) = 2011) as count_2011 FROM votes WHERE YEAR(CreationDate) = 2010
SELECT T1.TagName FROM tags AS T1 JOIN users AS T2 ON T1.Id = T2.Id WHERE T2.DisplayName = 'John Salvatier';
SELECT COUNT(*) FROM users u, posts p WHERE u.DisplayName = 'Daniel Vassallo' AND u.Id = p.OwnerUserId;
SELECT COUNT(*) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';
SELECT Id FROM posts WHERE DisplayName ='slashnick' AND AnswerCount = (SELECT MAX(AnswerCount) FROM posts WHERE DisplayName ='slashnick');
SELECT Id, MAX(SUM(ViewCount)) FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' OR OwnerDisplayName = 'Noah Snyder' GROUP BY Id ORDER BY MAX(SUM(ViewCount)) DESC LIMIT 1
SELECT COUNT(*) FROM posts WHERE ParentId = 1 AND OwnerDisplayName = 'Matt Parker' AND Id IN ( 	SELECT PostId 	FROM votes 	WHERE PostId > 4 );
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 0
SELECT Tags FROM Posts WHERE OwnerDisplayName = 'Mark Meckes' AND CommentCount = 0;
SELECT DisplayName FROM users WHERE Id IN ( 	SELECT UserId 	FROM badges 	WHERE Name = 'Organizer' );
SELECT  ROUND(     CAST(         COUNT(             p.Id         ) AS NUMERIC     ) /     (         SELECT             COUNT(                 p.Id             )         FROM             posts p         WHERE             p.OwnerDisplayName = 'Community'     ) * 100,     2 ) AS percentage FROM     posts p WHERE     p.Tags LIKE '%r%';
SELECT (SELECT SUM(ViewCount) FROM posts WHERE DisplayName = 'Mornington') - (SELECT SUM(ViewCount) FROM posts WHERE DisplayName = 'Amos');
SELECT COUNT(DISTINCT UserId) FROM badges JOIN comments ON badges.UserId = comments.UserId WHERE badges.Name = 'Commentator' AND year(comments.CreationDate) = 2014
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' and '2012-07-21 23:59:59';
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users);
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';
SELECT COUNT(*) FROM comments WHERE Score < 0 AND UserId = 13
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60
select Name from badges b, users u where b.UserId = u.Id and year(b.Date) = 2011 and u.Location like '%north pole%'
SELECT OwnerDisplayName, WebsiteUrl FROM posts WHERE FavoriteCount > 150
SELECT COUNT(*), MAX(CreationDate) FROM postHistory WHERE PostId IN ( 	SELECT Id 	FROM posts 	WHERE Title = 'What is the best introductory Bayesian statistics textbook?' );
SELECT LastAccessDate, Location FROM users WHERE Id IN ( 	SELECT UserId 	FROM badges 	WHERE Name = 'Outliers' );
SELECT T1.Title FROM posts AS T1 JOIN postLinks AS T2 ON T1.Id = T2.RelatedPostId WHERE T2.PostId = (SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time');
SELECT T1.PostId, T2.Name FROM postHistory AS T1 JOIN badges AS T2 ON T1.UserId = T2.UserId WHERE T1.UserDisplayName = "Samuel" AND YEAR(T1.CreationDate) = 2013 AND YEAR(T2.Date) = 2013
SELECT OwnerDisplayName FROM Posts WHERE Id = (SELECT Id FROM Posts ORDER BY ViewCount DESC LIMIT 1)
SELECT OwnerDisplayName, Location FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'hypothesis-testing'));
SELECT T1.Title, T2.LinkTypeId FROM posts AS T1 JOIN postLinks AS T2 ON T1.Id = T2.RelatedPostId WHERE T1.Title = 'What are principal component scores?';
SELECT ParentId, MAX(Score) FROM posts WHERE ParentId IS NOT NULL GROUP BY ParentId;
SELECTDisplayName, WebsiteUrl FROM users WHERE Id IN ( 	SELECT UserId 	FROM votes 	WHERE VoteTypeId = 8 	GROUP BY UserId 	ORDER BY MAX(BountyAmount) DESC 	LIMIT 1 );
SELECT Title FROM posts WHERE Id IN (SELECT PostId FROM votes WHERE VoteTypeId = 2) ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);
SELECT Age FROM users WHERE Id = (SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users));
SELECT COUNT(*) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(p.CreationDate) = 2011 AND v.BountyAmount = 50
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%';
SELECT AVG(links) FROM ( 	SELECT COUNT(Id) as links 	FROM postLinks 	WHERE YEAR(CreationDate) = 2010 AND AnswerCount <= 2 	GROUP BY strftime('%m', CreationDate) );
SELECT Id FROM posts WHERE Id IN (SELECT PostId FROM votes WHERE UserId = 1465) ORDER BY FavoriteCount DESC LIMIT 1
SELECT Title FROM posts WHERE Id IN (SELECT MIN(PostId) FROM postLinks);
SELECT DisplayName FROM users u WHERE u.Id = (SELECT UserId FROM badges b GROUP BY UserId ORDER BY COUNT(Name) DESC LIMIT 1)
SELECT MIN(CreationDate) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl';
SELECT MIN(CreationDate) FROM users u, posts p WHERE u.Id = p.OwnerUserId AND u.Age = (SELECT MIN(Age) FROM users);
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Autobiographer' ORDER BY b.Date LIMIT 1
SELECT COUNT(*) FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount >= 4 AND u.Location = 'United Kingdom'
SELECT AVG(PostId) FROM votes WHERE Age = (SELECT MAX(Age) FROM users);
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Jay Stevens' AND YEAR(CreationDate) = 2010;
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'Stephen Turner';
SELECT DISTINCT OwnerDisplayName FROM posts WHERE ViewCount > 20000 AND YEAR(CreationDate) = 2011;
SELECT Id, OwnerDisplayName FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts WHERE year(CreationDate) = 2010)
SELECT  ROUND(     (         SELECT COUNT(Id)          FROM posts         WHERE YEAR(CreationDate) = 2011         AND OwnerUserId IN (             SELECT Id             FROM users             WHERE Reputation > 1000         )     ) / COUNT(Id) * 100,     2 ) AS percentage
SELECT  DIV(     (SELECT COUNT(Id) FROM users WHERE Age BETWEEN 13 and 18),     (SELECT COUNT(Id) FROM users) ) as percentage;
SELECT SUM(ViewCount), LastEditorDisplayName FROM posts WHERE Text = 'Computer Game Datasets';
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Score = (SELECT MAX(Score) FROM posts));
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0
SELECT LastEditorDisplayName, Location FROM users u JOIN postHistory ph ON u.Id = ph.UserId WHERE ph.PostId = 183 ORDER BY ph.LastEditDate DESC LIMIT 1;
SELECT Name FROM badges WHERE Date = (SELECT MAX(Date) FROM badges WHERE UserDisplayName = 'Emmett');
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;
SELECT SUBTRACT(Date, CreationDate) FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'Zolomon';
SELECT COUNT(Id) as post_count FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE CreationDate = (SELECT MAX(CreationDate) FROM users));  SELECT COUNT(Id) as comment_count FROM comments WHERE UserId = (SELECT Id FROM users WHERE CreationDate = (SELECT MAX(CreationDate) FROM users));
SELECT Text, UserDisplayName FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Title = 'Analysing wind data with R') ORDER BY CreationDate DESC LIMIT 10
SELECT COUNT(DISTINCT users.Id) FROM badges, users WHERE badges.Name = 'Citizen Patrol' AND badges.UserId = users.Id
SELECT COUNT(*) FROM posts p, postTags pt WHERE p.Id = pt.PostId AND pt.TagId = (SELECT Id FROM tags WHERE TagName = 'careers');
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon';
SELECT SUM(CommentCount), SUM(AnswerCount) FROM posts WHERE Title = 'Clustering 1D data';
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';
SELECT COUNT(*) FROM posts WHERE BountyAmount >= 30
SELECT  ( 	SELECT COUNT(Id) 	FROM stats_posts 	WHERE Score > 50 AND OwnerUserId = ( 		SELECT Id 		FROM stats_users 		ORDER BY Reputation DESC 		LIMIT 1 	) ) / ( 	SELECT COUNT(Id) 	FROM stats_posts 	WHERE OwnerUserId = ( 		SELECT Id 		FROM stats_users 		ORDER BY Reputation DESC 		LIMIT 1 	) ) * 100 AS percentage;
SELECT COUNT(*) FROM posts WHERE Score < 20;
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName ='sample';
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';
SELECT Text FROM comments c, posts p WHERE p.Id = c.PostId AND p.Title LIKE '%linear regression%'
SELECT Id, PostId, Score, Text, CreationDate, UserId, UserDisplayName FROM comments WHERE PostId IN ( 	SELECT Id 	FROM posts 	WHERE ViewCount BETWEEN 100 AND 150 ) ORDER BY Score DESC LIMIT 1
SELECT CreationDate, DATEDIFF(Now(), CreationDate) AS Age FROM users WHERE Id IN (SELECT UserId FROM comments WHERE Text LIKE '%http://%')
SELECT COUNT(*) FROM comments c, posts p WHERE c.Score = 0 AND c.PostId = p.Id AND p.ViewCount < 5;
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CommentCount = 1) AND Score = 0;
SELECT COUNT(DISTINCT u.Id) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40
SELECT T1.Id, T2.Text FROM posts AS T1 JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Group differences on a five point Likert item'
SELECT SUM(UpVotes) FROM users u, comments c WHERE u.Id = c.UserId AND c.Text = 'R is also lazy evaluated.'
SELECT Text FROM comments JOIN users ON users.Id = comments.UserId WHERE users.DisplayName = 'Harvey Motulsky';
SELECT UserDisplayName FROM comments WHERE Score BETWEEN 1 AND 5 AND Id IN ( 	SELECT Id 	FROM votes 	WHERE VoteTypeId = 3 	AND Id IN ( 		SELECT Id 		FROM users 		WHERE DownVotes = 0 	) );
SELECT  Divide( 	( 		SELECT COUNT(UserId) 		FROM users 		WHERE UpVotes = 0 		AND Id IN ( 			SELECT UserId 			FROM comments 			WHERE Score BETWEEN 5 AND 10 		) 	) 	* 100, 	( 		SELECT COUNT(UserId) 		FROM comments 		WHERE Score BETWEEN 5 AND 10 	) )
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = '3-D Man';
SELECT COUNT(*) FROM hero_power JOIN superpower ON superpower.id = hero_power.power_id WHERE superpower.power_name = 'Super Strength';
SELECT COUNT(*) FROM superhero WHERE id IN (     SELECT hero_id     FROM hero_power     WHERE power_id = (         SELECT id         FROM superpower         WHERE power_name = 'Super Strength'     ) ) AND height_cm > 200;
SELECT full_name FROM superhero GROUP BY full_name HAVING COUNT(full_name) > 15
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';
SELECT colour.colour FROM colour JOIN superhero ON superhero.skin_colour_id = colour.id WHERE superhero.superhero_name = 'Apocalypse';
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility';
SELECT superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' AND superhero.hair_colour_id = colour.id AND colour.colour = 'Blond';
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');
SELECT superhero_name, height_cm FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC;
SELECT publisher_name FROM publisher WHERE id = (SELECT publisher_id FROM superhero WHERE superhero_name = 'Sauron');
SELECT superhero.superhero_name, superhero.eye_colour_id, COUNT(superhero.id) AS count FROM superhero WHERE superhero.publisher_id = 4 GROUP BY superhero.eye_colour_id ORDER BY count DESC;
SELECT AVG(height_cm) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' AND superpower.power_name = 'Super Strength';
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');
SELECT publisher_name FROM publisher JOIN superhero ON superhero.publisher_id = publisher.id JOIN hero_attribute ON hero_attribute.hero_id = superhero.id WHERE attribute_name = 'Speed' AND attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute WHERE attribute_name = 'Speed');
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics'
SELECT publisher.publisher_name FROM publisher JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.superhero_name = 'Blue Beetle II';
SELECT COUNT(*) FROM superhero WHERE hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond');
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE attribute_name = 'Intelligence' ORDER BY attribute_value ASC LIMIT 1;
SELECT race FROM superhero WHERE superhero_name = 'Copycat';
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100
SELECT superhero_name FROM superhero GROUP BY superhero_name ORDER BY COUNT(superhero_name) DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');
SELECT 	publisher_name, 	ROUND( 		MULTIPLY( 			DIVIDE( 				SUM(alignment = 'Bad'), 				COUNT(id) 			), 			100 		) 	) AS percentage FROM 	superhero 	JOIN publisher ON superhero.publisher_id = publisher.id WHERE 	publisher_name = 'Marvel Comics';
SELECT 	SUBTRACT( 		( 			SELECT 				COUNT(*) 			FROM 				superhero 			WHERE 				publisher_id = 4 		), 		( 			SELECT 				COUNT(*) 			FROM 				superhero 			WHERE 				publisher_id = 3 		) 	) AS 	difference;
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';
SELECT AVG(attribute_value) FROM hero_attribute;
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;
SELECT colour.colour FROM colour JOIN superhero ON superhero.eye_colour_id = colour.id WHERE superhero.id = 75
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = 'Deathlok';
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = 2;
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.gender_id = 1 LIMIT 5;
SELECT superhero_name FROM superhero WHERE race_id = 2;
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour');
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_power.hero_id = 56
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;
SELECT race FROM superhero WHERE weight_kg = 169
SELECT colour.colour FROM colour JOIN superhero ON superhero.hair_colour_id = colour.id JOIN race ON superhero.race_id = race.id WHERE superhero.height_cm = 185 AND race.race = 'human';
SELECT colour FROM colour WHERE id = (SELECT eye_colour_id             FROM superhero             WHERE weight_kg = (SELECT MAX(weight_kg) FROM superhero));
SELECT MULTIPLY(DIVIDE(SUM(publisher.id = 13)), COUNT(publisher.id), 100) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.height_cm BETWEEN 150 AND 180
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id GROUP BY superpower.power_name ORDER BY COUNT(superpower.power_name) DESC LIMIT 1
SELECT attribute_value FROM hero_attribute WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Abomination');
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_power.hero_id = 1
SELECT COUNT(*) FROM superpower WHERE power_name ='stealth';
SELECT full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE attribute_name ='strength' ORDER BY attribute_value DESC LIMIT 1
SELECT AVG(superhero.id) FROM superhero WHERE skin_colour_id = 1;
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON attribute.id = hero_attribute.attribute_id JOIN publisher ON publisher.id = superhero.publisher_id WHERE attribute.attribute_name = 'durability' AND hero_attribute.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_name = 'durability') AND publisher.publisher_name = 'Dark Horse Comics';
SELECT colour.colour FROM colour JOIN superhero ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Abraham Sapien';
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight';
SELECT eye_colour_id, hair_colour_id, skin_colour_id FROM superhero WHERE gender_id = 2 AND publisher_id = 3;
SELECT superhero_name, publisher_name FROM superhero WHERE hair_colour_id = skin_colour_id AND hair_colour_id = eye_colour_id;
SELECT race FROM superhero WHERE superhero_name = 'A-Bomb';
SELECT COUNT(superhero.id) / COUNT(DISTINCT superhero.gender_id) * 100 FROM superhero WHERE superhero.gender_id = 2 AND superhero.skin_colour_id = 5
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler';
SELECT gender.gender FROM gender JOIN superhero ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13';
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Adaptation';
SELECT COUNT(*) FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Amazo');
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.full_name = 'Hunter Zolomon';
SELECT height_cm FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Amber';
SELECT superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN colour AS colour_1 ON superhero.hair_colour_id = colour_1.id WHERE colour.colour = 'Black' AND colour_1.colour = 'Black';
SELECT colour.colour FROM colour WHERE skin_colour_id = colour.id AND colour.colour = 'Gold';
SELECT full_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire';
SELECT superhero_name FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');
SELECT COUNT(*) FROM superhero WHERE id IN (SELECT hero_id FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength') AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')));
SELECT race.race, alignment.alignment FROM superhero JOIN race ON superhero.race_id = race.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Cameron Hicks';
SELECT COUNT(gender_id = 2 AND publisher_id = 4) / COUNT(publisher_id = 4) * 100 AS percent_of_female_heroes_published_by_marvel_comics;
SELECT AVG(weight_kg) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler');
SELECT superhero_name, AVG(height_cm) FROM superhero GROUP BY superhero_name;
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = 'Abomination';
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE attribute_name = 'Speed' AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_name = 'Speed');
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;
SELECT attribute_name, attribute_value FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero_name = '3-D Man';
SELECT superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN colour AS colour_1 ON superhero.hair_colour_id = colour_1.id WHERE colour.colour = 'Blue' AND colour_1.colour = 'Brown';
SELECT publisher_name FROM publisher JOIN superhero ON superhero.publisher_id = publisher.id WHERE superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;
SELECT COUNT(superhero.id) / (SELECT COUNT(id) FROM superhero) * 100.0 FROM superhero WHERE superhero.eye_colour_id = 7
SELECT (SELECT COUNT(*) FROM superhero WHERE gender_id = 1) / (SELECT COUNT(*) FROM superhero WHERE gender_id = 2)
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);
SELECT id FROM superpower WHERE power_name = 'cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg = NULL;
SELECT colour.colour FROM colour JOIN superhero ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Karen Beecher-Duncan';
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.full_name = 'Helen Parr';
SELECT race FROM superhero WHERE weight_kg = 108 AND height_cm = 188;
SELECT publisher.publisher_name FROM publisher JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.id = 38
SELECT race FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)
SELECT alignment.alignment, superpower.power_name FROM alignment, superhero, superpower, hero_power WHERE superhero.alignment_id = alignment.id AND superhero.id = hero_power.hero_id AND superpower.id = hero_power.power_id AND superhero.superhero_name = 'Atom IV';
SELECT superhero.superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';
SELECT AVG(attribute_value) FROM hero_attribute WHERE hero_id IN ( 	SELECT id 	FROM superhero 	WHERE alignment_id = 3 );
SELECT colour.colour FROM colour JOIN superhero ON superhero.skin_colour_id = colour.id JOIN hero_attribute ON hero_attribute.hero_id = superhero.id JOIN attribute ON attribute.id = hero_attribute.attribute_id WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value = 100
SELECT COUNT(*) FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN gender ON superhero.gender_id = gender.id WHERE alignment.id = 1 AND gender.id = 2
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_value BETWEEN 75 AND 80;
SELECT race.race FROM race JOIN superhero ON race.id = superhero.race_id JOIN colour ON superhero.hair_colour_id = colour.id JOIN gender ON superhero.gender_id = gender.id WHERE colour.colour = 'blue' AND gender.gender ='male';
SELECT   (     (       SELECT         COUNT(*)       FROM         superhero       WHERE         alignment_id = 2     ) - (       SELECT         COUNT(*)       FROM         superhero       WHERE         alignment_id = 2         AND gender_id = 2     )   ) / (     SELECT       COUNT(*)     FROM       superhero     WHERE       alignment_id = 2   ) * 100.0 AS percentage FROM   superhero
SELECT 	( 		SELECT 			COUNT(*) 		FROM 			colour 		WHERE 			colour.id = 7 	) - ( 		SELECT 			COUNT(*) 		FROM 			colour 		WHERE 			colour.id = 1 	) FROM 	superhero WHERE 	( 		weight_kg = 0 		OR 		weight_kg IS NULL 	)
SELECT attribute_value FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Strength' AND superhero.superhero_name = 'Hulk';
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = 'Ajax'
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Green' AND superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND publisher_id = 3;
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero_name;
SELECT gender_id FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON superpower.id = hero_power.power_id WHERE superpower.power_name = 'Phoenix Force';
SELECT superhero_name, MAX(weight_kg) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') GROUP BY superhero_name;
SELECT AVG(height_cm) FROM superhero WHERE race_id <> 1 AND publisher_id = 3
SELECT COUNT(*) FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value = 100 AND hero_attribute.attribute_id = 3;
SELECT 	publisher_name, 	COUNT(*) FROM 	publisher 	JOIN superhero ON publisher.id = superhero.publisher_id GROUP BY 	publisher_name HAVING 	publisher_name = 'DC Comics' OR publisher_name = 'Marvel Comics' ;
SELECT attribute.attribute_name FROM attribute JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id JOIN superhero ON superhero.id = hero_attribute.hero_id WHERE superhero.superhero_name = 'Black Panther' ORDER BY hero_attribute.attribute_value ASC LIMIT 1
SELECT colour.colour FROM colour WHERE (SELECT superhero.eye_colour_id        FROM superhero        WHERE superhero.superhero_name = 'Abomination') = colour.id
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';
SELECT   (     (       SELECT         COUNT(*)       FROM         superhero       WHERE         gender_id = 2         AND publisher_id = 5     )     /     (       SELECT         COUNT(*)       FROM         superhero       WHERE         publisher_id = 5     )   )   * 100.0 AS   percentage_of_female_superheroes_created_by_george_lucas;
SELECT 	MULTIPLY( 		DIVIDE( 			SUM(alignment = 'Good' WHERE publisher_name = 'Marvel Comics'), 			COUNT(publisher_name = 'Marvel Comics') 		), 		100.0 	) FROM superhero WHERE publisher_name = 'Marvel Comics';
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';
SELECT hero_id FROM hero_attribute GROUP BY hero_id ORDER BY MIN(attribute_value) LIMIT 1
SELECT full_name FROM superhero WHERE superhero_name = 'Alien';
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.weight_kg < 100 AND colour.colour = 'Brown';
SELECT attribute_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Aquababy';
SELECT weight_kg, race FROM superhero WHERE id = 40
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = 3;
SELECT hero_id FROM hero_power JOIN superpower ON superpower.id = hero_power.power_id WHERE superpower.power_name = 'Intelligence';
SELECT colour.colour FROM colour INNER JOIN superhero ON eye_colour_id = colour.id WHERE superhero_name = 'Blackwulf';
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);
SELECT driverRef FROM drivers WHERE driverId IN ( 	SELECT driverId 	FROM qualifying 	WHERE raceId = 20 	AND q1 = ( 		SELECT MAX(q1) 		FROM qualifying 		WHERE raceId = 20 	) );
SELECT surname FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 19 AND T2.lap = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19)
SELECT DISTINCT T1.year FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.name = 'Shanghai'
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';
SELECT name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE country = 'Germany';
SELECT position FROM circuits c, constructors con WHERE con.name = 'Renault' AND con.constructorId = c.circuitId
SELECT COUNT(*) FROM races WHERE year = 2010 AND circuitId NOT IN (SELECT circuitId FROM circuits WHERE country IN ('Japan', 'South Korea', 'Australia', 'Russia', 'Mexico', 'Brazil', 'Canada', 'United States', 'United Kingdom', 'France', 'Spain', 'Italy', 'Germany'))
SELECT name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Spain';
SELECT circuits.lat, circuits.lng FROM circuits, races WHERE circuits.circuitId = races.circuitId AND races.name = 'Australian Grand Prix'
SELECT url FROM circuits WHERE circuitRef ='sepang';
SELECT time FROM races WHERE circuitId = 2;
SELECT circuits.lat, circuits.lng FROM circuits, races WHERE circuits.circuitId = races.circuitId AND races.name = 'Abu Dhabi Grand Prix'
SELECT constructors.nationality FROM constructors, constructorResults WHERE constructors.constructorId = constructorResults.constructorId AND constructorResults.raceId = 24 AND constructorResults.points = 1
SELECT q1 FROM qualifying JOIN drivers ON drivers.driverId = qualifying.driverId WHERE raceId = 354 AND forename = "Bruno" AND surname = "Senna"
SELECT drivers.nationality FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.q2 = '0:01:40' AND qualifying.qualifyId = 355
SELECT number FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 903 AND T2.q3 LIKE '0:01:54%';
SELECT COUNT(driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Bahrain Grand Prix' AND year = 2007) AND time IS NULL;
SELECT url FROM seasons WHERE year = (SELECT year FROM races WHERE raceId = 901);
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29');
SELECT drivers.forename, drivers.surname, drivers.dob FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.raceId = 592 AND results.time IS NOT NULL ORDER BY drivers.dob DESC LIMIT 1
SELECT url FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 161 AND T2.lapTime.time LIKE '0:01:27%';
SELECT drivers.forename, drivers.surname, constructors.name FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN constructors ON constructors.constructorId = results.constructorId WHERE results.raceId = 933 AND results.fastestLapSpeed = (SELECT MAX(results.fastestLapSpeed) FROM results WHERE results.raceId = 933);
SELECT circuits.lat, circuits.lng FROM circuits, races WHERE circuits.circuitId = races.circuitId AND races.name = 'Malaysian Grand Prix'
SELECT constructors.url FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId WHERE constructorResults.raceId = 9 AND constructorResults.points = (SELECT MAX(points) FROM constructorResults WHERE raceId = 9)
SELECT q1 FROM qualifying WHERE driverId = 13 AND raceId = 345
SELECT nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 347 AND T2.q2 = '0:01:15';
SELECT code FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 45 AND T2.q3 LIKE '1:33%';
SELECT time FROM results WHERE driverId = 1 AND raceId = 743
SELECT drivers.forename, drivers.surname FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE results.raceId = 10 AND results.position = 2 AND results.year = 2006
SELECT url FROM seasons, races WHERE races.raceId = 901 AND races.year = seasons.year
SELECT COUNT(DISTINCT driverId) FROM lapTimes WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NULL;
SELECT * FROM drivers WHERE driverId IN (SELECT driverId FROM results WHERE raceId = 872 AND time IS NOT NULL) AND dob = (SELECT MAX(dob) FROM drivers WHERE driverId IN (SELECT driverId FROM results WHERE raceId = 872 AND time IS NOT NULL));
SELECT drivers.forename, drivers.surname FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE lapTimes.raceId = 348 AND lapTimes.time = (SELECT MIN(time) FROM lapTimes WHERE raceId = 348);
SELECT nationality FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM lapTimes);
SELECT  ( 	( 		( 			SELECT  				fastestLapSpeed 			FROM  				lapTimes 			WHERE  				raceId = 853 		) 		- 		( 			SELECT  				fastestLapSpeed 			FROM  				lapTimes 			WHERE  				raceId = 854 		) 	) 	/ 	( 		SELECT  			fastestLapSpeed 		FROM  			lapTimes 		WHERE  			raceId = 853 	) ) * 100
SELECT driverid, COUNT(driverid) AS count,  CASE 	WHEN time IS NOT NULL THEN 1 	ELSE 0 END AS has_time, (1 - (COUNT(driverid) / (CASE 	WHEN time IS NOT NULL THEN 1 	ELSE 0 END))) AS percentage FROM results WHERE date = '1983-07-16' GROUP BY driverid
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix';
SELECT name FROM races WHERE year = 2005 ORDER BY date DESC
SELECT name FROM races WHERE year = year(min(date)) AND month = month(min(date));
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999);
SELECT year FROM races GROUP BY year ORDER BY COUNT(round) DESC LIMIT 1
SELECT * FROM races WHERE year = 2017 AND circuitId NOT IN (SELECT circuitId FROM races WHERE year = 2000);
SELECT name, location FROM circuits WHERE circuitId = (SELECT circuitId FROM races WHERE year = (SELECT MIN(year) FROM seasons WHERE year > 1990));
SELECT MAX(year) FROM races WHERE circuitId = 1;
SELECT COUNT(DISTINCT year) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE name = 'British Grand Prix' AND country = 'United Kingdom';
SELECT drivers.forename, drivers.surname, driverStandings.position FROM drivers JOIN driverStandings ON drivers.driverId = driverStandings.driverId WHERE driverStandings.raceId = 18 ORDER BY driverStandings.position;
SELECT drivers.forename, drivers.surname, max(results.points) FROM drivers JOIN results ON drivers.driverId = results.driverId GROUP BY drivers.driverId
SELECT drivers.forename, drivers.surname, constructorResults.points FROM drivers JOIN constructorResults ON drivers.driverId = constructorResults.driverId WHERE raceId = 3 ORDER BY points DESC LIMIT 3;
SELECT drivers.forename, drivers.surname, races.name FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)
SELECT AVG(milliseconds) FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix'
SELECT 100.0 * (SELECT COUNT(raceId) FROM results WHERE surname = 'Hamilton' AND position > 1 AND year >= 2010) / (SELECT COUNT(raceId) FROM results WHERE surname = 'Hamilton' AND year >= 2010);
SELECT drivers.forename, drivers.surname, drivers.nationality, MAX(points) FROM drivers JOIN constructorStandings ON drivers.driverId = constructorStandings.driverId GROUP BY drivers.driverId ORDER BY MAX(points) DESC LIMIT 1
SELECT drivers.forename, drivers.surname, drivers.dob, drivers.nationality, drivers.driverId, drivers.code, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality,
SELECT circuitId, circuitRef, name, location, country, lat, lng, alt, url FROM circuits WHERE circuitId IN ( 	SELECT circuitId 	FROM races 	WHERE year BETWEEN 1990 AND 2000 	GROUP BY circuitId 	HAVING COUNT(raceId) = 4 );
SELECT circuits.name, circuits.location, races.name FROM circuits, races WHERE races.circuitId = circuits.circuitId AND races.year = 2006 AND circuits.country = 'USA';
SELECT races.name, circuits.name, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE MONTH(races.date) = 9 AND YEAR(races.date) = 2005;
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = "Alex" AND drivers.surname = "Yoong" AND results.position < 20
select count(*) from results r inner join drivers d on r.driverId = d.driverId where d.forename = "Michael" and d.surname = "Schumacher" and r.raceId in (select raceId from races where circuitId = 2 and max(points) = points)
SELECT races.name, races.year FROM lapTimes JOIN races ON races.raceId = lapTimes.raceId JOIN drivers ON drivers.driverId = lapTimes.driverId WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' AND lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)
SELECT AVG(points) FROM results WHERE driverId = 1 AND year = 2000
SELECT races.name, constructorResults.points FROM races JOIN constructorResults ON races.raceId = constructorResults.raceId JOIN drivers ON races.raceId = drivers.raceId WHERE drivers.forename = "Lewis" AND drivers.surname = "Hamilton" AND races.year = (SELECT MIN(year) FROM races)
SELECT races.name, circuits.country, races.date FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2017 ORDER BY races.date;
SELECT races.name, races.year, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.laps = (SELECT MAX(laps) FROM races)
SELECT (SELECT COUNT(races.raceId) FROM races, circuits WHERE races.circuitId = circuits.circuitId AND circuits.country = 'Germany' AND races.name = 'European Grand Prix') / (SELECT COUNT(races.raceId) FROM races WHERE races.name = 'European Grand Prix') * 100
SELECT circuits.lat, circuits.lng FROM circuits WHERE circuits.name = 'Silverstone Circuit'
SELECT circuitId, name, max(lat) as max_lat FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') GROUP BY circuitId, name
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits WHERE alt = (SELECT max(alt) FROM circuits);
SELECT COUNT(*) FROM drivers WHERE code IS NULL;
SELECT drivers.nationality FROM drivers ORDER BY drivers.dob DESC LIMIT 1
SELECT surname FROM drivers WHERE nationality = 'italian'
SELECT url FROM drivers WHERE surname = 'Davidson'
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';
SELECT name FROM circuits WHERE circuitId = (SELECT circuitId FROM races WHERE year = 2009 AND name = 'Spanish Grand Prix');
SELECT DISTINCT year FROM races, circuits WHERE races.circuitId = circuits.circuitId AND name = 'Silverstone'
SELECT * FROM races WHERE circuitId = 1;
SELECT date, time FROM races WHERE year = 2010 AND circuitId = 1;
SELECT COUNT(*) FROM circuits WHERE country = 'Italy';
SELECT date FROM races WHERE circuitId = 4;
SELECT url FROM circuits c, races r WHERE c.circuitId = r.circuitId AND r.name = "Spanish Grand Prix" AND r.year = 2009
SELECT MIN(fastestLapTime) FROM results WHERE driverId = 1
SELECT drivers.forename, drivers.surname FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)
SELECT drivers.driverRef FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON races.raceId = results.raceId WHERE races.name = 'Canadian Grand Prix' AND results.position = 1 AND races.year = 2007
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY results.rank ASC LIMIT 1
SELECT MAX(results.fastestLapSpeed) FROM results, races WHERE results.raceId = races.raceId AND races.name = 'Spanish Grand Prix'
SELECT DISTINCT year FROM races JOIN drivers ON races.raceId = drivers.raceId WHERE drivers.driverRef = 'hamilton'
SELECT results.positionOrder FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Chinese Grand Prix'
SELECT forename, surname FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.grid = 4 AND races.year = 1989 AND races.name = 'Australian Grand Prix'
SELECT COUNT(driverId) FROM results WHERE raceId = 1 AND time IS NOT NULL
SELECT lap, time, milliseconds FROM lapTimes WHERE driverId = 1 AND raceId = 1;
SELECT results.time FROM results, races WHERE results.raceId = races.raceId AND races.name = 'Chinese Grand Prix' AND results.rank = 2 AND races.year = 2008
SELECT drivers.forename, drivers.surname, races.url FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE races.name = 'Australian Grand Prix' AND races.year = 2008 GROUP BY races.raceId HAVING results.position = 1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND raceId = 1;
SELECT COUNT(raceId) FROM results WHERE time IS NOT NULL AND raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Chinese Grand Prix');
SELECT SUM(points) FROM results WHERE driverId = 1
SELECT AVG(strToSeconds(fastestLapTime)) FROM results WHERE driverId = 1 AND statusId = 1
SELECT COUNT(raceId) / (SELECT COUNT(raceId) FROM races WHERE year = 2008 AND circuitId = 1) FROM results WHERE time IS NOT NULL;
select round(cast(cast(time as time) as float) / cast(cast(time as time) as float) * 100, 2) as faster_in_percentage from results where raceId = 1 and position = 1 and milliseconds is not null union select round(cast(cast(time as time) as float) / cast(cast(time as time) as float) * 100, 2) as faster_in_percentage from results where raceId = 1 and position = 5 and milliseconds is not null
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide';
SELECT lat, lng FROM circuits WHERE country = 'USA';
SELECT COUNT(*) FROM drivers WHERE nationality = "British" AND dob > "1980-01-01";
SELECT MAX(points) FROM constructorResults WHERE constructorId IN (SELECT constructorId FROM constructors WHERE nationality = 'British');
SELECT constructorId, SUM(points) as total_points FROM constructorResults GROUP BY constructorId ORDER BY total_points DESC LIMIT 1
SELECT name FROM constructors c WHERE NOT EXISTS (SELECT * FROM constructorResults cr WHERE cr.raceId = 291 AND cr.constructorId = c.constructorId AND cr.points = 0);
SELECT COUNT(raceId) FROM constructors WHERE nationality = 'Japanese' AND points = 0 GROUP BY raceId HAVING COUNT(raceId) = 2
SELECT constructorId, constructorRef, name, nationality, url FROM constructors WHERE constructorId IN ( 	SELECT constructorId 	FROM results 	WHERE rank = 1 );
SELECT COUNT(*) FROM constructors c JOIN results r ON c.constructorId = r.constructorId WHERE r.laps > 50 AND c.nationality = 'French';
SELECT   COUNT(driverId) / (SELECT COUNT(driverId) FROM drivers WHERE nationality = 'Japanese') * 100 FROM   results WHERE   results.time IS NOT NULL   AND year BETWEEN 2007 AND 2009
SELECT AVG(time), year FROM results WHERE time IS NOT NULL AND year < 1975 GROUP BY year;
SELECT forename, surname FROM drivers WHERE year(dob) > 1975 AND rank = 2;
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "Italian" AND T2.time IS NULL
SELECT drivers.forename, drivers.surname FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)
SELECT fastestLap FROM results WHERE year = 2009 AND position = 1
SELECT avg(fastestLapSpeed) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Spanish Grand Prix');
SELECT name, year FROM races WHERE milliseconds = (SELECT MIN(milliseconds) FROM races WHERE milliseconds IS NOT NULL);
SELECT Divide(COUNT(driverId where year (dob) <1985 and laps >50),COUNT(DriverID where year between 2000 and 2005) *100
SELECT COUNT(*) FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE drivers.nationality = 'French' AND lapTimes.milliseconds < 120000;
SELECT code FROM drivers WHERE nationality = 'America';
SELECT raceId FROM races WHERE year = 2009;
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;
SELECT code FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers)  SELECT COUNT(*) FROM drivers WHERE nationality = 'Netherlands'
SELECT driverRef FROM drivers WHERE surname = 'Kubica'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND year(dob) = 1980;
SELECT drivers.forename, drivers.surname, MIN(lapTimes.time) FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE drivers.nationality = 'German' AND year(drivers.dob) BETWEEN 1980 AND 1990 GROUP BY drivers.driverId ORDER BY MIN(lapTimes.time) LIMIT 3;
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob LIMIT 1;
SELECT driverId, code FROM drivers WHERE year(dob) = 1971 AND driverId IN (SELECT driverId FROM lapTimes WHERE fastestLapTime IS NOT NULL);
SELECT drivers.forename, drivers.surname, lapTimes.time FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE drivers.nationality = 'Spanish' AND year(drivers.dob) < 1982 GROUP BY drivers.driverId ORDER BY lapTimes.time DESC LIMIT 10
SELECT year FROM lapTimes WHERE fastestLapTime!= "00:00:00" GROUP BY year ORDER BY fastestLapTime LIMIT 1
SELECT year, MAX(milliseconds) FROM lapTimes GROUP BY year;
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY milliseconds LIMIT 5
SELECT COUNT(*) FROM results WHERE statusId = 2 AND time IS NOT NULL AND raceId > 50 AND raceId < 100;
SELECT COUNT(*), location, lat, lng FROM circuits WHERE country = 'Austria' GROUP BY circuitId;
SELECT raceId, COUNT(time) FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(time) DESC LIMIT 1
SELECT drivers.driverRef, drivers.nationality, drivers.dob FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.raceId = 23 AND qualifying.q2 IS NOT NULL
SELECT MIN(races.date), drivers.forename, drivers.surname, seasons.year FROM drivers JOIN races ON drivers.driverId = races.driverId JOIN seasons ON races.year = seasons.year WHERE drivers.dob = (SELECT MAX(drivers.dob) FROM drivers) AND races.raceId = (SELECT MIN(races.raceId) FROM races) GROUP BY drivers.driverId ORDER BY drivers.dob;
SELECT COUNT(driverId) FROM results WHERE statusId = (SELECT statusId FROM status WHERE status = 'Puncture') AND nationality = 'American';
SELECT constructors.url FROM constructors, constructorStandings WHERE constructors.constructorId = constructorStandings.constructorId AND constructors.nationality = "Italian" ORDER BY constructorStandings.points DESC LIMIT 1
SELECT url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId GROUP BY c.constructorId ORDER BY SUM(cs.wins) DESC LIMIT 1
SELECT driverId, MAX(milliseconds) FROM lapTimes WHERE raceId = 4 AND lap = 3
SELECT raceId, MIN(milliseconds) FROM lapTimes GROUP BY raceId
SELECT AVG(milliseconds) FROM lapTimes WHERE raceId = 10 AND position < 11
SELECT drivers.forename, drivers.surname, AVG(pitStops.duration) as avg_duration FROM drivers JOIN pitStops ON drivers.driverId = pitStops.driverId WHERE drivers.nationality = 'German' AND 1980 < year(drivers.dob) AND year(drivers.dob) < 1985 GROUP BY drivers.driverId ORDER BY avg_duration ASC LIMIT 3;
SELECT time FROM results WHERE raceId = 10 AND position = 1
SELECT constructors.constructorRef, constructors.url FROM constructors, results, races WHERE constructors.constructorId = results.constructorId AND races.raceId = results.raceId AND races.name = 'Singapore Grand Prix' AND races.year = 2009 AND results.position = 1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND year(dob) BETWEEN '1981' AND '1991';
SELECT forename ||'' || surname as Full_name, url, dob FROM drivers WHERE nationality = 'German' AND year(dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC;
SELECT location, country, lat, lng FROM circuits WHERE circuitRef = 'hungaroring';
SELECT constructorResults.points, constructors.name, constructors.nationality FROM constructorResults JOIN constructors ON constructorResults.constructorId = constructors.constructorId JOIN races ON constructorResults.raceId = races.raceId WHERE races.name = 'Monaco Grand Prix' AND races.year BETWEEN 1980 AND 2010 ORDER BY constructorResults.points DESC LIMIT 1
SELECT AVG(points) FROM results WHERE driverId = 1 AND raceId IN (     SELECT raceId     FROM races     WHERE circuitId = 5 );
SELECT AVG(COUNT(*)) FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31';
SELECT MAX(nationality) FROM drivers;
SELECT COUNT(results.raceId) FROM results WHERE results.rank = 91 AND results.statusId = 1
SELECT races.name FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId WHERE lapTimes.milliseconds = (     SELECT MIN(lapTimes.milliseconds)     FROM lapTimes );
SELECT circuits.name, circuits.location, circuits.country FROM circuits, races WHERE races.circuitId = circuits.circuitId AND races.date = (SELECT MAX(date) FROM races)
SELECT forename, surname FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE raceId = (SELECT raceId FROM races WHERE circuitId = 1 AND year = 2008) AND position = (SELECT MIN(position) FROM qualifying WHERE raceId = (SELECT raceId FROM races WHERE circuitId = 1 AND year = 2008))
SELECT forename, surname, nationality, name FROM drivers JOIN races ON drivers.driverId = races.raceId WHERE dob = (SELECT MAX(dob) FROM drivers)
SELECT COUNT(*) FROM results WHERE statusId = 3 AND raceId = (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix');
SELECT forename, surname, wins FROM drivers JOIN driverStandings ON drivers.driverId = driverStandings.driverId WHERE dob = (SELECT MIN(dob) FROM drivers) AND wins > 0;
SELECT MAX(milliseconds) FROM pitStops;
SELECT time FROM lapTimes ORDER BY milliseconds LIMIT 1
SELECT MAX(milliseconds) FROM pitStops WHERE driverId = 1;
SELECT lap FROM pitStops WHERE driverId = 1 AND raceId = 1;
SELECT driverId, stop, time, duration FROM pitStops WHERE raceId = 1;
SELECT MAX(milliseconds) FROM lapTimes WHERE driverId = 1
SELECT forename, surname FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE lapTimes.time = (SELECT MIN(time) FROM lapTimes) LIMIT 1;
SELECT circuitId, MIN(time) AS fastest_lap FROM lapTimes WHERE driverId = 1 GROUP BY circuitId
SELECT time FROM lapTimes WHERE raceId = 1;
SELECT circuitId, circuitRef, name, location, country, lat, lng, alt, url FROM circuits WHERE country = 'Italy';
SELECT races.name FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId WHERE races.circuitId = 1 ORDER BY lapTimes.milliseconds ASC LIMIT 1
SELECT pitStops.duration FROM pitStops JOIN lapTimes ON pitStops.driverId = lapTimes.driverId WHERE lapTimes.time = pitStops.time
SELECT circuitId, lat, lng FROM circuits WHERE (SELECT MIN(milliseconds) FROM lapTimes) = 109488
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = 1
SELECT AVG(milliseconds) FROM lapTimes WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy');
SELECT player_api_id FROM Player_Attributes GROUP BY player_api_id ORDER BY MAX(overall_rating) DESC LIMIT 1
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player);
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes);
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating >= 60 AND overall_rating < 65 AND defensive_work_rate = 'low';
SELECT player_api_id FROM Player_Attributes GROUP BY player_api_id ORDER BY MAX(crossing) DESC LIMIT 5;
SELECT name FROM League WHERE id = (SELECT league_id             FROM Match             WHERE season = '2015/2016'             GROUP BY league_id             ORDER BY SUM(home_team_goal, away_team_goal) DESC             LIMIT 1);
SELECT home_team_api_id, COUNT(*) FROM Match WHERE season = '2015/2016' AND home_team_goal - away_team_goal < 0 GROUP BY home_team_api_id ORDER BY COUNT(*) ASC LIMIT 1;
SELECT Player.player_name, Player_Attributes.penalties FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id ORDER BY Player_Attributes.penalties DESC LIMIT 10;
SELECT Team.team_long_name FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id JOIN League ON Match.league_id = League.id WHERE League.name = 'Scotland Premier League' AND season = '2009/2010' AND SUBTRACT(away_team_goal, home_team_goal) > 0 GROUP BY Team.team_long_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT buildUpPlaySpeed FROM Team_Attributes WHERE team_api_id IN (SELECT team_api_id FROM Team_Attributes WHERE buildUpPlaySpeed = (SELECT MAX(buildUpPlaySpeed) FROM Team_Attributes) LIMIT 4)
SELECT name FROM League WHERE id IN (SELECT league_id FROM Match WHERE season = '2015/2016' GROUP BY league_id HAVING MAX(home_team_goal = away_team_goal))
SELECT Player.player_name, Player.birthday, Player_Attributes.sprint_speed, Player_Attributes.date FROM Player, Player_Attributes WHERE Player.player_api_id = Player_Attributes.player_api_id AND Player_Attributes.sprint_speed >= 97 AND YEAR(Player_Attributes.date) >= '2013' AND YEAR(Player_Attributes.date) <= '2015';
SELECT name, MAX(COUNT(league_id)) FROM Match GROUP BY league_id
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';
SELECT Player_Attributes.player_api_id FROM Player_Attributes WHERE Player_Attributes.date >= '2009-01-01' AND Player_Attributes.date <= '2010-12-31' GROUP BY Player_Attributes.player_api_id HAVING AVG(Player_Attributes.overall_rating) < (SELECT AVG(Player_Attributes.overall_rating) FROM Player_Attributes WHERE Player_Attributes.date >= '2009-01-01' AND Player_Attributes.date <= '2010-12-31') ORDER BY Player_Attributes.overall_rating DESC LIMIT 1
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;
SELECT team_long_name FROM Team_Attributes WHERE buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing IS NOT NULL)
SELECT player_fifa_api_id, preferred_foot, birthday FROM Player_Attributes WHERE preferred_foot = 'left' AND YEAR(birthday) BETWEEN '1987' AND '1992';  SELECT player_fifa_api_id, preferred_foot, birthday FROM Player_Attributes WHERE preferred_foot = 'left' AND YEAR(birthday) BETWEEN '1987' AND '1992';  SELECT player_fifa_api_id, preferred_foot, birthday FROM Player_Attributes WHERE preferred_foot = 'left' AND YEAR(birthday) BETWEEN '1987' AND '1992';  SELECT player_fifa_api_id, preferred_foot, birthday FROM Player_Attributes WHERE preferred_foot = 'left' AND YEAR(birthday) BETWEEN '1987' AND '1992';  SELECT player_fifa_api_id, preferred_foot, birthday FROM Player_Attributes WHERE preferred_foot = 'left' AND YEAR(birthday) BETWEEN '1987' AND '1992';
SELECT league_id, SUM(home_team_goal, away_team_goal) as goals_made FROM Match GROUP BY league_id ORDER BY goals_made ASC LIMIT 5;
SELECT AVG(long_shots) FROM Player_Attributes WHERE player_fifa_api_id = 218353;
SELECT Player.player_name, AVG(Player_Attributes.heading_accuracy) FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player.height > 180 GROUP BY Player.player_fifa_api_id ORDER BY AVG(Player_Attributes.heading_accuracy) DESC LIMIT 10;
SELECT Team.team_long_name FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team_Attributes.buildUpPlayDribblingClass = 'Normal' AND Team_Attributes.date >= '2014-01-01 00:00:00' AND Team_Attributes.date <= '2014-01-31 00:00:00' GROUP BY Team.team_long_name HAVING DIVIDE(SUM(Team_Attributes.chanceCreationPassing), COUNT(Team_Attributes.id)) > Team_Attributes.chanceCreationPassing ORDER BY Team_Attributes.chanceCreationPassing DESC;
SELECT League.name FROM Match JOIN League ON Match.league_id = League.id WHERE season = '2009/2010' AND AVG(home_team_goal) > AVG(away_team_goal);
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';
SELECT * FROM Player WHERE substr(birthday,1,7) = '1970-10';
SELECT Player_Attributes.attacking_work_rate FROM Player_Attributes JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id WHERE Player.player_name = 'Franco Zennaro';
SELECT buildUpPlayPositioningClass FROM Team_Attributes WHERE team_long_name = 'ADO Den Haag' AND date < '2015-09-10 00:00:00' AND date > '2010-02-22 00:00:00';
SELECT heading_accuracy FROM Player_Attributes WHERE player_fifa_api_id = 218353 AND date = '2014-09-18 00:00:00';
SELECT overall_rating FROM Player_Attributes JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id WHERE Player.player_name = 'Gabriel Tamas' AND strftime('%Y', Player_Attributes.date) = '2011';
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Scotland Premier League') AND season = '2015/2016';
SELECT preferred_foot FROM Player WHERE birthday = (SELECT MAX(birthday) FROM Player);
SELECT Player.player_name, Player.player_fifa_api_id, Player_Attributes.potential FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player_Attributes.potential = (SELECT MAX(Player_Attributes.potential) FROM Player_Attributes);
SELECT COUNT(*) FROM Player_Attributes WHERE weight < 130 AND preferred_foot = 'left';
SELECT Team.team_short_name FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team_Attributes.chanceCreationPassingClass = 'Risky';
SELECT defensive_work_rate FROM Player_Attributes WHERE player_name = 'David Wilson'
SELECT birthday FROM Player WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);
SELECT League.name FROM Country, League WHERE Country.name = 'Netherlands' AND Country.id = League.country_id;
SELECT AVG(home_team_goal) FROM Match JOIN Country ON Match.country_id = Country.id WHERE name = 'Poland' AND season = '2010/2011';
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player.height = (SELECT MAX(height) FROM Player) OR Player.height = (SELECT MIN(height) FROM Player) GROUP BY Player.player_name ORDER BY AVG(Player_Attributes.finishing) DESC LIMIT 1;
SELECT player_name FROM Player WHERE height>180;
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) = '1990';
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player_Attributes.overall_rating > 80 AND strftime('%Y', Player_Attributes.date) BETWEEN '2008' AND '2010';
SELECT potential FROM Player_Attributes WHERE player_fifa_api_id = 186170;
SELECT * FROM Player_Attributes WHERE preferred_foot = 'left';
SELECT team_long_name FROM Team_Attributes WHERE buildUpPlaySpeedClass = 'Fast';
SELECT buildUpPlayPassingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'CLB';
SELECT Team.team_short_name FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team_Attributes.buildUpPlayPassing > 70;
SELECT AVG(t2.overall_rating) FROM Match AS t1 JOIN Player_Attributes AS t2 ON t1.home_player_1 = t2.player_api_id WHERE strftime('%Y', t1.date) >= '2010' AND <= '2015' AND t2.height > 170
SELECT player_name, height FROM Player ORDER BY height ASC LIMIT 1;
SELECT Country.name FROM Country, League WHERE League.name = 'Italy Serie A' AND Country.id = League.country_id;
SELECT team_short_name FROM Team_Attributes WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_fifa_api_id = 186170;
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';
SELECT team_short_name FROM Team WHERE home_team_goal = 10
SELECT Player.player_name, Player_Attributes.balance FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player_Attributes.balance = (SELECT MAX(Player_Attributes.balance) FROM Player_Attributes) AND Player_Attributes.potential = 61;
SELECT AVG(ball_control) - AVG(ball_control) FROM Player_Attributes WHERE player_name = 'Abdou Diallo' AND player_name = 'Aaron Appindangoye';
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';
SELECT * FROM Player WHERE birthday > (SELECT birthday FROM Player WHERE player_name = 'Abdelaziz Barrada');
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';
SELECT Country.name FROM Country, League WHERE League.name = 'Belgium Jupiler League' AND Country.id = League.country_id;
SELECT name FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Germany');
SELECT Player.player_name, Player_Attributes.overall_rating FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player_Attributes.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);
SELECT COUNT(DISTINCT player_api_id) FROM Player_Attributes WHERE strftime('%Y', birthday)<'1986' AND defensive_work_rate = 'high';
SELECT player_name FROM Player WHERE player_fifa_api_id IN (     SELECT player_fifa_api_id     FROM Player_Attributes     WHERE crossing = (         SELECT MAX(crossing)         FROM Player_Attributes     ) );
SELECT heading_accuracy FROM Player_Attributes WHERE player_fifa_api_id = 218353;
SELECT COUNT(*) FROM Player_Attributes WHERE height > 180 AND volleys > 70;
SELECT Player.player_name FROM Player, Player_Attributes WHERE Player.player_api_id = Player_Attributes.player_api_id AND Player_Attributes.volleys > 70 AND Player_Attributes.dribbling > 70;
SELECT COUNT(*) FROM Match WHERE country_id IN (SELECT id FROM Country WHERE name = 'Belgium') AND season = '2008/2009';
SELECT long_passing FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id ORDER BY birthday ASC LIMIT 1
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League') AND SUBSTR(`date`, 1, 7) = '2009-04';
SELECT name FROM League WHERE id = (SELECT league_id             FROM Match             WHERE season = '2008/2009'             GROUP BY league_id             ORDER BY COUNT(*) DESC             LIMIT 1);
SELECT AVG(overall_rating) FROM Player_Attributes JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id WHERE strftime('%Y', birthday) < '1986';
SELECT (overall_rating WHERE player_name = 'Ariel Borysiuk' - overall_rating WHERE player_name = 'Paulin Puel') / overall_rating WHERE player_name = 'Paulin Puel' * 100 AS higher_in_percentage FROM Player_Attributes WHERE player_name = 'Ariel Borysiuk'
SELECT AVG(buildUpPlaySpeed) FROM Team_Attributes WHERE team_long_name = 'Heart of Midlothian';
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Pietro Marino';
SELECT SUM(T2.crossing) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Aaron Lennox';
SELECT MAX(chanceCreationPassing), chanceCreationPassingClass FROM Team_Attributes WHERE team_long_name = 'Ajax';
SELECT preferred_foot FROM Player_Attributes WHERE player_name = 'Abdou Diallo';
SELECT T1.player_name, MAX(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Dorlan Pabon'
SELECT AVG(away_team_goal) FROM Match WHERE away_team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Parma') AND country_id = (SELECT id FROM Country WHERE name = 'Italy');
SELECT Player.player_name FROM Player, Player_Attributes WHERE Player.player_api_id = Player_Attributes.player_api_id AND Player_Attributes.date LIKE '2016-06-23%' AND Player_Attributes.overall_rating = 77 ORDER BY Player.birthday DESC LIMIT 1;
SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Aaron Mooy' AND date LIKE '2016-02-04%'
SELECT potential FROM Player_Attributes WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00';
SELECT attacking_work_rate FROM Player_Attributes WHERE player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%';
SELECT defensive_work_rate FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Kevin Berigaud' AND Player_Attributes.date = '2013-02-22 00:00:00';
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant');
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'Willem II' AND date = '2012-02-22';
SELECT buildUpPlayDribblingClass FROM Team_Attributes WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00';
SELECT buildUpPlayPassingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.date LIKE '2010-02-22%' AND T2.team_long_name = 'FC Lorient';
SELECT chance_creation_passing_class FROM Team_Attributes WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00';
SELECT chance_creation_crossing_class FROM Team_Attributes WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00';
SELECT defenceAggressionClass FROM Team_Attributes WHERE team_long_name = 'Hannover 96' AND date LIKE '2015-09-10%';
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_name = 'Marko Arnautovic' AND date BETWEEN '2007-02-22' AND '2016-04-21';
