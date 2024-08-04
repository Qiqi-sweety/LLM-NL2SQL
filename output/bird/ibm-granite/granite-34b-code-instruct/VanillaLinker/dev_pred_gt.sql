SELECT MAX(`Percent (%) Eligible Free (K-12)`) FROM `frpm` WHERE `County Code` = '01';	california_schools
SELECT `CDSCode`, `Free Meal Count (Ages 5-17)`, `Enrollment (Ages 5-17)`, `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` AS `Eligible Free Rate (Ages 5-17)` FROM `frpm` WHERE `Educational Option Type` ='Continuation' ORDER BY `Eligible Free Rate (Ages 5-17)` LIMIT 3;	california_schools
SELECT `Zip` FROM `schools` WHERE `CDSCode` IN (SELECT `CDSCode` FROM `frpm` WHERE `Charter School (Y/N)` = 1 AND `County Name` = 'Fresno');	california_schools
SELECT MailStreet FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm."FRPM Count (K-12)" = (SELECT MAX(frpm."FRPM Count (K-12)") FROM frpm) AND frpm."Low Grade" = "K" AND frpm."High Grade" = "12";	california_schools
SELECT `Phone` FROM `schools`  JOIN `frpm` ON `schools`.`CDSCode` = `frpm`.`CDSCode`  WHERE `Charter` = 1 AND `FundingType` = 'Directly funded' AND `OpenDate` > '2000-01-01'	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.rtype = 'S' AND satscores.AvgScrMath > 400 AND schools.Virtual = 'F';	california_schools
SELECT CDSCode, Magnet FROM schools WHERE NumTstTakr > 500 AND Magnet = 1	california_schools
SELECT Phone FROM schools WHERE CDSCode IN (     SELECT cds     FROM satscores     WHERE NumGE1500 = (         SELECT MAX(NumGE1500)         FROM satscores     ) );	california_schools
SELECT satscores.NumTstTakr FROM satscores JOIN frpm ON satscores.cds = frpm.CDSCode WHERE frpm."FRPM Count (K-12)" = (SELECT MAX(frpm."FRPM Count (K-12)") FROM frpm)	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.rtype = 'S' AND satscores.AvgScrMath > 560 AND schools.FundingType = 'Directly funded';	california_schools
SELECT `frpm`.`FRPM Count (Ages 5-17)`  FROM `frpm`  JOIN `satscores` ON `frpm`.`CDSCode` = `satscores`.`cds`  WHERE `satscores`.`AvgScrRead` = (SELECT MAX(`satscores`.`AvgScrRead`) FROM `satscores`)	california_schools
SELECT `CDSCode` FROM `frpm` WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500	california_schools
SELECT `CDSCode`, `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` FROM `frpm` WHERE `NumGE1500` / `NumTstTakr` > 0.3 ORDER BY `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` DESC LIMIT 1;	california_schools
SELECT Phone FROM schools WHERE CDSCode IN (     SELECT CDSCode     FROM satscores     WHERE NumGE1500 / NumTstTakr IN (         SELECT MAX(NumGE1500 / NumTstTakr)         FROM satscores         GROUP BY rtype         ORDER BY rtype         LIMIT 3     ) );	california_schools
SELECT `NCESSchool` FROM `schools` ORDER BY `Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT District, AVG(AvgScrRead) as AvgRead FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.StatusType = "Active" GROUP BY District ORDER BY AvgRead DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM satscores WHERE enroll12 < 100 AND rtype = 'S' AND cds IN (SELECT CDSCode FROM schools WHERE County = 'Alameda' AND District = 'Alameda Unified');	california_schools
SELECT `CharterNum`, AVG(`AvgScrWrite`) as `AvgScore` FROM `satscores` WHERE `NumTstTakr` > 0 AND `AvgScrWrite` > 499 GROUP BY `CharterNum` ORDER BY `AvgScore` DESC	california_schools
SELECT COUNT(*) FROM satscores WHERE sname = "Fresno Unified" AND rtype = "D" AND NumTstTakr <= 250	california_schools
SELECT Phone FROM schools WHERE CDSCode = (SELECT CDSCode                  FROM satscores                  WHERE AvgScrMath = (SELECT MAX(AvgScrMath)                                     FROM satscores));	california_schools
SELECT COUNT(*) FROM schools WHERE County = "Amador" AND LowGrade = "9" AND HighGrade = "12";	california_schools
SELECT COUNT(*) FROM frpm WHERE `CDSCode` LIKE '06%' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700;	california_schools
SELECT sname, NumTstTakr FROM satscores WHERE cds LIKE '161119%' ORDER BY NumTstTakr DESC LIMIT 1;	california_schools
SELECT `School Name`, `Street` FROM `frpm` WHERE (`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) > 30	california_schools
SELECT `School Name` FROM `frpm` WHERE (`Percent (%) Eligible Free (K-12)` > 0.1) AND (`NumTstTakr` >= 1500);	california_schools
SELECT `schools`.`FundingType` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `schools`.`County` = 'Riverside' AND `satscores`.`AvgScrMath` > 400 GROUP BY `schools`.`CDSCode`	california_schools
SELECT `School Name`, `Street`, `City`, `State`, `Zip` FROM `frpm` WHERE `CDSCode` IN (  SELECT `CDSCode`  FROM `schools`  WHERE `County` = 'Monterey' AND `SOCType` = 'High Schools (Public)' ) AND `FRPM Count (Ages 5-17)` > 800;	california_schools
SELECT s.School, s.Phone, s.CDSCode, s.OpenDate, s.ClosedDate, s.LastUpdate, f.AvgScrWrite FROM schools s JOIN satscores f ON s.CDSCode = f.cds WHERE (s.OpenDate > '1991-01-01' OR s.ClosedDate < '2000-01-01') AND f.rtype = 'S' AND s.CDSCode NOT IN (SELECT CDSCode FROM schools WHERE StatusType = 'Closed');	california_schools
SELECT `School Name`, `DOC Type` FROM `frpm` WHERE `Charter School (Y/N)` = 0 AND `Charter School Number` = '0000' AND `Charter School (Y/N)` = 0 AND `Charter School Number` = '0000' AND `Funding Type` = 'Locally Funded' AND (`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) > (SELECT AVG(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) FROM `frpm` WHERE `Charter School (Y/N)` = 0 AND `Charter School Number` = '0000' AND `Charter School (Y/N)` = 0 AND `Charter School Number` = '0000' AND `Funding Type` = 'Locally Funded');	california_schools
SELECT OpenDate FROM schools WHERE StatusType = "Active" ANDDOCType = "K-12 Schools (Public)" ORDER BY Enroll12 DESC LIMIT 1	california_schools
SELECT City, Enrollment__K_12__ FROM schools GROUP BY City ORDER BY Enrollment__K_12__ ASC LIMIT 5;	california_schools
SELECT `CDSCode`, `Free Meal Count (K-12)`, `Enrollment (K-12)`, `Free Meal Count (K-12)` / `Enrollment (K-12)` AS `Eligible Free Rate (K-12)` FROM `frpm` WHERE `CDSCode` IN (  SELECT `CDSCode`  FROM `frpm`  ORDER BY `Enrollment (K-12)` DESC  LIMIT 2 )	california_schools
SELECT `CDSCode`, `FRPM Count (K-12)`, `Enrollment (K-12)`, (`FRPM Count (K-12)` / `Enrollment (K-12)`) AS `Eligible FRPM Rate` FROM `frpm` WHERE `EdOpsCode` = '66' AND `High Grade` = '12' ORDER BY `FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT `School Name` FROM `frpm` WHERE `Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT `FRPM Count (Ages 5-17)` / `Enrollment (Ages 5-17)` FROM `frpm` WHERE `CDSCode` = '01100170109835';	california_schools
SELECT `AdmEmail1` FROM `schools` JOIN `frpm` ON `schools`.`CDSCode` = `frpm`.`CDSCode` WHERE `Charter` = 1 ORDER BY `Enrollment (K-12)` LIMIT 1;	california_schools
SELECT AdmFName1, AdmLName1, AdmFName2, AdmLName2, AdmFName3, AdmLName3 FROM schools WHERE CDSCode = (SELECT cds                  FROM satscores                  WHERE NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)                  GROUP BY cds                  ORDER BY COUNT(*) DESC                  LIMIT 1);	california_schools
SELECT Street, City, Zip, State FROM schools WHERE CDSCode = (SELECT CDSCode                  FROM satscores                  WHERE NumGE1500 / NumTstTakr = (SELECT MIN(NumGE1500 / NumTstTakr) FROM satscores));	california_schools
SELECT `Website` FROM `schools` WHERE `County` = 'Los Angeles' AND `NumTstTakr` BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(NumTstTakr) FROM satscores WHERE cname = "Fresno" AND enroll12 > 0 AND year = 1980	california_schools
SELECT Phone FROM schools WHERE District = 'Fresno Unified' ORDER BY (SELECT AvgScrRead FROM satscores WHERE cds = CDSCode) ASC LIMIT 1;	california_schools
SELECT School, AvgScrRead FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE Virtual = 'F' ORDER BY County, AvgScrRead DESC LIMIT 5;	california_schools
SELECT EdOpsName FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath = (SELECT MAX(T1.AvgScrMath) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode)	california_schools
SELECT AvgScrMath, CDSCode, County FROM satscores WHERE AvgScrMath + AvgScrRead + AvgScrWrite = (SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite) FROM satscores)	california_schools
SELECT s.City, AVG(s.AvgScrWrite) FROM satscores s WHERE s.NumTstTakr = (SELECT MAX(NumTstTakr) FROM satscores WHERE NumGE1500 >= 1500) GROUP BY s.City;	california_schools
SELECT s.School, AVG(s.AvgScrWrite) FROM satscores s, schools sc WHERE s.cds = sc.CDSCode AND sc.AdmFName1 = 'Ricci' AND sc.AdmLName1 = 'Ulrich' GROUP BY s.School;	california_schools
SELECT `schools`.`State`, `schools`.`School`, SUM(`satscores`.`enroll12`) AS `Total_Enrollees` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `schools`.`DOC` = '31' AND `satscores`.`rtype` = 'S' AND `schools`.`SOC` = 'K-12' GROUP BY `schools`.`State`, `schools`.`School` ORDER BY `Total_Enrollees` DESC LIMIT 1;	california_schools
SELECT AVG(count) / 12 FROM (  SELECT COUNT(*) as count  FROM schools  WHERE StatusType = 'Active' AND OpenDate LIKE '1980%' ANDDOC = '52' );	california_schools
SELECT COUNT(CDSCode) FROM schools WHEREDOC = '54' AND StatusType = 'Merged' AND County = 'Orange' UNION SELECT COUNT(CDSCode) FROM schools WHERE DOC = '52' AND StatusType = 'Merged' AND County = 'Orange'	california_schools
SELECT COUNT(schools.County) as count, schools.County FROM schools WHERE schools.StatusType = 'Closed' GROUP BY schools.County ORDER BY count DESC LIMIT 1	california_schools
SELECT `MailStreet` FROM `schools` WHERE `CDSCode` IN (SELECT `cds` FROM `satscores` WHERE `AvgScrMath` = (SELECT MAX(`AvgScrMath`) FROM `satscores` WHERE `rtype` = 'S' AND `NumTstTakr` > 0 ORDER BY `AvgScrMath` DESC LIMIT 7,1))	california_schools
SELECT MailStreet, School, AvgScrRead FROM satscores, schools WHERE satscores.cds = schools.CDSCode ORDER BY AvgScrRead LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores, schools WHERE satscores.NumGE1500 >= 1500 AND satscores.NumTstTakr >= 1500 AND satscores.cds = schools.CDSCode AND schools.MailCity = 'Lakeport';	california_schools
SELECT SUM(NumTstTakr) FROM satscores WHERE cname = "Fresno";	california_schools
SELECT `schools`.`School`, `schools`.`MailZip`  FROM `schools`  WHERE `schools`.`AdmEmail1` = 'avetik@gmail.com' OR `schools`.`AdmEmail2` = 'avetik@gmail.com' OR `schools`.`AdmEmail3` = 'avetik@gmail.com';	california_schools
SELECT COUNT(CDSCode) FROM schools WHERE MailState = 'CA' AND County = 'Colusa' SELECT COUNT(CDSCode) FROM schools WHERE MailState = 'CA' AND County = 'Humboldt'	california_schools
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND StatusType = 'Active' AND City = 'San Joaquin';	california_schools
SELECT Phone, Ext FROM schools WHERE CDSCode = (SELECT cds FROM satscores WHERE AvgScrWrite = (SELECT AvgScrWrite FROM satscores ORDER BY AvgScrWrite DESC LIMIT 333, 1));	california_schools
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704';	california_schools
SELECT Website FROM schools WHERE AdmLName1 = 'Larson' AND AdmFName1 = 'Mike' UNION SELECT Website FROM schools WHERE AdmLName1 = 'Alvarez' AND AdmFName1 = 'Dante';	california_schools
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1 ANDDOC = '02'	california_schools
SELECT COUNT(*) FROM schools WHERE Charter = 1 AND City = "Hickman" ANDDOC = 52;	california_schools
SELECT COUNT(*) FROM frpm WHERE `Charter School (Y/N)` = 0 AND `County Name` = "Los Angeles" AND `Percent (%) Eligible Free (K-12)` < 0.18	california_schools
SELECT AdmLName1, AdmFName1, School, City FROM schools, frpm WHERE frpm.Charter = 1 AND frpm.CharterNum = '00D2' AND schools.CDSCode = frpm.CDSCode	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT (COUNT(CDSCode) / (SELECT COUNT(CDSCode) FROM frpm WHERE Charter School (Y/N) = 1) * 100) AS Locally_Funded_Ratio FROM frpm WHERE Charter School (Y/N) = 1 AND Charter Funding Type = 'Locally funded' AND County Name = 'Santa Clara';	california_schools
SELECT COUNT(*) FROM schools WHERE StatusType = 'Active' AND FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND County = 'Stanislaus';	california_schools
SELECT COUNT(*) FROM schools WHERE StatusType = "Closed" AND City = "San Francisco" ANDDOCType = "Community College District";	california_schools
SELECT `County` FROM `schools` WHERE `SOC` = '11' AND `ClosedDate` BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY `County` ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT `NCESDist` FROM `schools` WHERE `SOC` = '31'	california_schools
SELECT COUNT(*) FROM schools WHERE County = "Alpine" AND StatusType = "Active" ANDDOCType = "District Community Day School";	california_schools
SELECT DistrictCode FROM frpm WHERE Magnet = 0 AND City = "Fresno";	california_schools
SELECT Enrollment[Ages 5-17] FROM frpm WHERE CDSCode = '01100170123968' AND Academic[Year] = '2014-2015';	california_schools
SELECT `FRPM Count (Ages 5-17)` FROM `frpm` WHERE `CDSCode` = '01100170118489' AND `MailStreet` = 'PO Box 1040';	california_schools
SELECT `Low Grade` FROM `frpm` WHERE `EdOpsCode` = 'SPECON' AND `CDSCode` = '0613360';	california_schools
SELECT `EdOpsName` FROM `schools` WHERE `CDSCode` IN (SELECT `CDSCode` FROM `frpm` WHERE `Charter School (Y/N)` = 1 AND `Charter School Number` = '0728' AND `County Code` = 37);	california_schools
SELECT City FROM schools WHERE EILCode = 'HS' AND CDSCode LIKE '0614%' AND LowGrade = '9' AND HighGrade = '12' AND LunchProvision = '2';	california_schools
SELECT `School Name`, `Percent (%) Eligible FRPM (Ages 5-17)` FROM `frpm` WHERE `County Name` = 'Los Angeles' AND `Low Grade` = 'K' AND `High Grade` = '9';	california_schools
SELECT grade_span FROM (     SELECT grade_span, COUNT(*) AS count     FROM schools     WHERE city = 'Adelanto'     GROUP BY grade_span ) ORDER BY count DESC LIMIT 1	california_schools
SELECT COUNT(CDSCode) FROM schools WHERE County = 'San Diego' AND Virtual = 'F' INTERSECT SELECT COUNT(CDSCode) FROM schools WHERE County = 'Santa Barbara' AND Virtual = 'F'	california_schools
SELECT `School`, `Latitude` FROM `schools` ORDER BY `Latitude` DESC LIMIT 1;	california_schools
SELECT `City`, `Low Grade` FROM `schools` WHERE `State` = 'CA' ORDER BY `Latitude` ASC LIMIT 1;	california_schools
SELECT HighGrade, LowGrade FROM frpm WHERE ABS(Longitude) = (SELECT MAX(ABS(Longitude)) FROM frpm);	california_schools
SELECT COUNT(DISTINCT City) FROM schools WHERE Magnet = 1 AND EILName = 'K-8' AND NSLPProvisionStatus = 'Multiple Provision Types';	california_schools
SELECT AdmFName1, District, COUNT(*) as count FROM schools GROUP BY AdmFName1, District ORDER BY count DESC LIMIT 2;	california_schools
SELECT `District Code` FROM `frpm` WHERE `AdmFName1` = 'Alusine' AND `Percent (%) Eligible Free (K-12)` = `Free Meal Count (K-12)` / `Enrollment (K-12)` * 100%;	california_schools
SELECT AdmLName1, District, County, School FROM schools WHERE CharterNum = 40;	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = '62' OR DOC = '54');	california_schools
SELECT s.School, s.AdmEmail1 FROM satscores as sc JOIN schools as s ON sc.cds = s.CDSCode WHERE sc.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)	california_schools
SELECT COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK PO OBRATU' AND T2.A3 = 'east bohemia'	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A3 = 'Prague');	financial
SELECT A12, A13, A12 > A13 FROM district	financial
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000 AND (SELECT AVG(birth_date) FROM client WHERE gender = 'F') > 6000 AND (SELECT AVG(birth_date) FROM client WHERE gender = 'F') < 10000	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE A3 = 'north Bohemia') AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')) AND client_id IN (SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency	financial
SELECT account_id FROM client WHERE gender = 'F' ORDER BY birth_date DESC LIMIT 1;  SELECT AVG(A11) FROM district ORDER BY A11 DESC LIMIT 1;  SELECT AVG(A11) FROM district ORDER BY A11 LIMIT 1;  SELECT MAX(A11) - MIN(A11) FROM district;	financial
SELECT account_id FROM client WHERE birth_date = (SELECT MIN(birth_date) FROM client) AND district_id = (SELECT district_id FROM district WHERE A11 = (SELECT MAX(A11) FROM district));	financial
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'OWNER' AND d.disp_id IN (  SELECT disp_id FROM card WHERE type = 'junior' );	financial
SELECT client_id FROM client JOIN disp ON client.client_id = disp.client_id WHERE disp.type = 'DISPONENT';	financial
SELECT account_id, date, amount FROM loan WHERE status = 'A' AND date LIKE '1997%' ORDER BY amount LIMIT 1;	financial
SELECT account_id, amount FROM loan WHERE duration > 12 ORDER BY amount DESC LIMIT 1;	financial
SELECT COUNT(*) FROM client, district WHERE client.gender = 'F' AND client.birth_date < '1950-01-01' AND client.district_id = district.district_id AND district.A2 = 'Sokolov';	financial
SELECT account_id, date FROM trans WHERE date LIKE '1995%' GROUP BY account_id ORDER BY MIN(date);	financial
SELECT account_id FROM account WHERE date < '1997-01-01' AND frequency = 'POPLATEK MESICNE' AND district_id IN (SELECT district_id FROM district WHERE A10 > 3000);	financial
SELECT client_id FROM client c, card ca WHERE c.client_id = ca.disp_id AND ca.issued = '1994-03-03'	financial
SELECT date FROM account WHERE account_id = (SELECT account_id FROM trans WHERE amount = 840 AND date = '1998/10/14');	financial
SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha' AND A3 = 'Prague' AND A4 = '1204953';	financial
SELECT MAX(amount) FROM trans WHERE account_id IN (SELECT account_id FROM card WHERE issued = '1996-10-21');	financial
SELECT gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district b ON a.district_id = b.district_id WHERE birth_date = (SELECT MIN(birth_date) FROM client) AND A11 = (SELECT MAX(A11) FROM district) LIMIT 1;	financial
SELECT amount FROM trans WHERE account_id = (SELECT account_id FROM loan WHERE amount = (SELECT MAX(amount) FROM loan)) AND date > (SELECT date FROM account WHERE account_id = (SELECT account_id FROM loan WHERE amount = (SELECT MAX(amount) FROM loan))) ORDER BY date LIMIT 1	financial
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik') AND c.gender = 'F';	financial
SELECT disp_id FROM disp WHERE client_id IN (SELECT client_id FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha')) AND account_id IN (SELECT account_id FROM account WHERE date = '1998-09-02' AND amount = 5100);	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND date BETWEEN '1995-12-31' AND '1996-12-31';	financial
SELECT district_id FROM client, district WHERE client.gender = 'F' AND client.birth_date = '1976-01-29' AND client.district_id = district.district_id;	financial
SELECT birth_date FROM client WHERE client_id IN (SELECT client_id FROM account WHERE account_id IN (SELECT account_id FROM loan WHERE amount = 98832 AND date = '1996-01-03'));	financial
SELECT account_id FROM client c, district d, account a WHERE c.client_id = a.client_id AND d.district_id = c.district_id AND d.A3 = 'Prague' ORDER BY a.account_id LIMIT 1	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE A3 ='south Bohemia' AND A4 = (SELECT MAX(A4) FROM district WHERE A3 ='south Bohemia')); SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A3 ='south Bohemia' AND A4 = (SELECT MAX(A4) FROM district WHERE A3 ='south Bohemia')); SELECT (1.0 * (SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE A3 ='south Bohemia' AND A4 = (SELECT MAX(A4) FROM district WHERE A3 ='south Bohemia'))) / (SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A3 ='south Bohemia' AND A4 = (SELECT MAX(A4) FROM district WHERE A3 ='south Bohemia')))) * 100;	financial
SELECT ((SELECT balance FROM trans WHERE account_id = (SELECT account_id FROM loan WHERE loan_id = (SELECT loan_id FROM loan WHERE date = '1993-07-05' ORDER BY loan_id LIMIT 1)) AND date = '1998-12-27') - (SELECT balance FROM trans WHERE account_id = (SELECT account_id FROM loan WHERE loan_id = (SELECT loan_id FROM loan WHERE date = '1993-07-05' ORDER BY loan_id LIMIT 1)) AND date = '1993-03-22')) / (SELECT balance FROM trans WHERE account_id = (SELECT account_id FROM loan WHERE loan_id = (SELECT loan_id FROM loan WHERE date = '1993-07-05' ORDER BY loan_id LIMIT 1)) AND date = '1993-03-22') * 100	financial
SELECT (SUM(amount) / SUM(amount)) * 100 AS percentage FROM loan WHERE status = 'A';	financial
SELECT COUNT(DISTINCT account_id) / (SELECT COUNT(DISTINCT account_id) FROM loan WHERE amount < 100000) * 100 FROM loan WHERE amount < 100000 AND status = 'C';	financial
SELECT account.account_id, district.A2, district.A3 FROM account, district WHERE account.date < '1994-01-01' AND account.date > '1992-12-31' AND account.district_id = district.district_id AND account.frequency = 'POPLATEK PO OBRATU';	financial
SELECT account_id, frequency FROM account WHERE district_id IN (     SELECT district_id     FROM district     WHERE A4 = 'east Bohemia' ) AND date BETWEEN '1995-01-01' AND '2000-12-31';	financial
SELECT account_id, date FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Prachatice');	financial
SELECT district.A2, district.A3 FROM district JOIN loan ON district.district_id = loan.account_id WHERE loan.loan_id = 4990	financial
SELECT account_id, A2, A3 FROM district, loan WHERE district_id = district.district_id AND amount > 300000	financial
SELECT loan_id, district, avg(salary) FROM loan JOIN district ON loan.district_id = district.district_id WHERE duration = 60 GROUP BY loan_id, district	financial
SELECT district.A2, district.A13 - district.A12 FROM district, loan, account WHERE loan.status = 'D' AND loan.account_id = account.account_id AND account.district_id = district.district_id	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Decin') AND date BETWEEN '1993-01-01' AND '1993-12-31';	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT A2, COUNT(*) FROM client, district WHERE client.district_id = district.district_id AND gender = 'F' GROUP BY A2 ORDER BY COUNT(*) DESC LIMIT 9	financial
SELECT district.A2, SUM(trans.amount) AS withdraws FROM district JOIN account ON district.district_id = account.district_id JOIN trans ON account.account_id = trans.account_id WHERE trans.type = 'VYDAJ' AND trans.date LIKE '1996-01%' GROUP BY district.A2 ORDER BY withdraws DESC LIMIT 10	financial
SELECT COUNT(*) FROM client c WHERE NOT EXISTS (SELECT * FROM disp d WHERE d.client_id = c.client_id) AND c.district_id IN (SELECT district_id FROM district WHERE A3 = 'South Bohemia');	financial
SELECT A3 FROM district WHERE district_id = (SELECT district_id FROM loan WHERE status = 'C' ORDER BY amount DESC LIMIT 1)	financial
SELECT AVG(amount) FROM loan JOIN client ON loan.account_id = client.client_id WHERE gender = 'M';	financial
SELECT A2, A13 FROM district WHERE A13 = (SELECT MAX(A13) FROM district WHERE A8 = 1996)	financial
SELECT COUNT(*) FROM district WHERE district_id IN (SELECT district_id FROM client JOIN account ON client.client_id = account.client_id WHERE client.birth_date BETWEEN '1996-01-01' AND '1996-12-31' GROUP BY district_id ORDER BY SUM(A16) DESC LIMIT 1)	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM client WHERE birth_date < '1980-01-01') AND frequency = 'POPLATEK MESICNE' AND account_id IN (SELECT account_id FROM trans WHERE type = 'PRIJEM' AND operation = 'VYBER KARTOU' AND balance < 0);	financial
SELECT COUNT(*) FROM loan WHERE account_id IN (  SELECT account_id  FROM account  WHERE frequency = 'POPLATEK MESICNE' ) AND amount >= 250000 AND date BETWEEN '1995-01-01' AND '1997-12-31' AND status = 'A';	financial
SELECT COUNT(*) FROM account WHERE district_id = 1 AND frequency = 'POPLATEK MESICNE' AND date < '1995-03-24';	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM district WHERE A15 = (SELECT MAX(A15) - 1 FROM district));	financial
SELECT COUNT(*) FROM card c JOIN disp d ON c.card_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER';	financial
SELECT COUNT(*) FROM district WHERE A2 = "Pisek";	financial
SELECT A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district WHERE district_id IN (  SELECT district_id  FROM account  WHERE account_id IN (   SELECT account_id   FROM trans   WHERE amount > 10000 AND date LIKE '1997%'  ) );	financial
SELECT account_id FROM account JOIN order ON account.account_id = order.account_id WHERE k_symbol = 'SIPO' AND bank_to = 'PISEK';	financial
SELECT account_id FROM account JOIN card ON account.account_id = card.card_id WHERE card.type = 'gold';	financial
SELECT AVG(amount) FROM trans WHERE account_id IN (  SELECT account_id  FROM account  WHERE date >= '2021-01-01' AND date < '2022-01-01' ) AND type = 'VYBER KARTOU';	financial
SELECT account_id FROM trans WHERE type = 'PRIJEM' AND operation = 'VYBER KARTOU' AND amount < (SELECT AVG(amount) FROM trans WHERE type = 'PRIJEM' AND operation = 'VYBER KARTOU' AND date BETWEEN '1998-01-01' AND '1998-12-31') AND date BETWEEN '1998-01-01' AND '1998-12-31';	financial
SELECT client.client_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id JOIN loan ON disp.account_id = loan.account_id WHERE client.gender = 'F';	financial
SELECT COUNT(*) FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 ='south Bohemia';	financial
SELECT account_id FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Tabor') AND account_id IN (SELECT account_id FROM disp WHERE type = 'OWNER');	financial
SELECT A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district WHERE A11 BETWEEN 8000 AND 9000;  SELECT A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district WHERE A11 BETWEEN 8000 AND 9000;  SELECT A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district WHERE A11 BETWEEN 8000 AND 9000;  SELECT A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district WHERE A11 BETWEEN 8000 AND 9000;  SELECT A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district WHERE A11 BETWEEN 8000 AND 9000;  SELECT A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district WHERE A11 BETWEEN 8000 AND 9000;  SELECT A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13,	financial
SELECT COUNT(*) FROM district WHERE A3 = 'North Bohemia' AND A6 = 'AB';	financial
SELECT A2 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ'	financial
SELECT AVG(A15) FROM district WHERE A3 IN (SELECT A3 FROM district WHERE A15 > 4000 AND A16 >= 1997)	financial
SELECT COUNT(*) FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN account a ON d.account_id = a.account_id WHERE c.type = 'classic' AND a.type = 'OWNER';	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha');	financial
SELECT COUNT(card.card_id) / COUNT(card.card_id) * 100 FROM card WHERE card.type = 'gold' AND card.issued < '1998';	financial
SELECT client.client_id, client.gender, client.birth_date, client.district_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id JOIN loan ON account.account_id = loan.account_id WHERE loan.amount = (SELECT MAX(amount) FROM loan)	financial
SELECT A15 FROM district WHERE district_id = (SELECT district_id FROM account WHERE account_id = 532);	financial
SELECT district_id FROM account WHERE account_id IN (SELECT account_id FROM order WHERE order_id = 33333);	financial
SELECT * FROM trans WHERE account_id = 3356 AND type = 'VYBER' AND operation = 'VYBER KOMUNALNI'	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND account_id IN (  SELECT account_id  FROM loan  WHERE amount < 200000 );	financial
SELECT type FROM card c, disp d WHERE c.card_id = d.disp_id AND d.client_id = 13539	financial
SELECT district.A3 FROM district JOIN client ON district.district_id = client.district_id WHERE client.client_id = 3541	financial
SELECT district_id, COUNT(*) FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY district_id ORDER BY COUNT(*) DESC LIMIT 1	financial
SELECT client.client_id, client.gender, client.birth_date, client.district_id FROM client, disp, card, account WHERE disp.disp_id = card.disp_id AND card.card_id = account.card_id AND account.account_id = client.account_id AND order.order_id = 32423	financial
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM account WHERE district_id = 5);	financial
SELECT COUNT(*) FROM district WHERE district_id = 5	financial
SELECT client_id FROM client c JOIN card ca ON c.client_id = ca.disp_id WHERE ca.type = 'junior' AND ca.issued >= '1997-01-01'	financial
SELECT COUNT(*) FROM client WHERE gender = 'F' AND district_id IN (SELECT district_id FROM district WHERE A11 > 10000) / SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A11 > 10000)	financial
SELECT ((SELECT SUM(amount) FROM loan WHERE account_id IN (SELECT account_id FROM account WHERE client_id IN (SELECT client_id FROM client WHERE gender = 'M')) AND date BETWEEN '1996-01-01' AND '1997-01-01') - (SELECT SUM(amount) FROM loan WHERE account_id IN (SELECT account_id FROM account WHERE client_id IN (SELECT client_id FROM client WHERE gender = 'M')) AND date BETWEEN '1995-01-01' AND '1996-01-01')) / (SELECT SUM(amount) FROM loan WHERE account_id IN (SELECT account_id FROM account WHERE client_id IN (SELECT client_id FROM client WHERE gender = 'M')) AND date BETWEEN '1995-01-01' AND '1996-01-01') * 100	financial
SELECT COUNT(*) FROM trans WHERE account_id = 1 AND date > '1995-01-01' AND operation = 'VYBER KARTOU';	financial
SELECT A3, A16 FROM district WHERE A3 IN ('east bohemia', 'north bohemia') AND A16 IS NOT NULL;	financial
SELECT COUNT(*) FROM disp WHERE client_id BETWEEN 1 AND 10 AND account_id BETWEEN 1 AND 10;	financial
SELECT COUNT(*) FROM `order` WHERE `account_id` = 3; SELECT SUM(`amount`) FROM `trans` WHERE `account_id` = 3 AND `type` = 'ODEBET';	financial
SELECT birth_date FROM client WHERE client_id = 130;	financial
SELECT COUNT(*) FROM account WHERE district_id IN (     SELECT district_id     FROM district     WHERE A16 > 10000 ) AND frequency = 'POPLATEK PO OBRATU';	financial
SELECT SUM(amount) AS debt, status FROM loan WHERE account_id IN (  SELECT account_id  FROM disp  WHERE client_id = 992 );	financial
SELECT SUM(amount) FROM trans WHERE account_id = (SELECT account_id FROM disp WHERE client_id = 4) AND trans_id > 851; SELECT gender FROM client WHERE client_id = (SELECT client_id FROM disp WHERE account_id = (SELECT account_id FROM trans WHERE trans_id = 851));	financial
SELECT type FROM card c, disp d WHERE c.card_id = d.disp_id AND d.client_id = 9	financial
SELECT SUM(amount) FROM trans WHERE account_id = 617 AND date BETWEEN '1998-01-01' AND '1998-12-31';	financial
SELECT client_id FROM client WHERE birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'east bohemia');	financial
SELECT client_id FROM client WHERE gender = 'F' ORDER BY amount DESC LIMIT 3	financial
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND a.frequency = 'POPLATEK MESICNE' AND a.amount > 4000;	financial
SELECT COUNT(*) FROM district WHERE district_id = 3;	financial
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.card_id WHERE c.gender = 'F' AND cr.type = 'junior';	financial
SELECT COUNT(client.client_id) / COUNT(DISTINCT account.account_id) * 100 FROM client, account, district WHERE client.client_id = account.client_id AND district.district_id = client.district_id AND district.A3 = 'Prague' AND client.gender = 'F'	financial
SELECT COUNT(client.client_id) / COUNT(disp.disp_id) * 100 FROM client, disp WHERE client.client_id = disp.client_id AND disp.type = 'OWNER' AND client.gender = 'M' AND disp.account_id IN (  SELECT account.account_id  FROM account  WHERE account.frequency = 'POPLATEK TYDNE' );	financial
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'OWNER' AND d.disp_id IN (  SELECT disp_id FROM account a  JOIN card c ON a.account_id = c.account_id  WHERE c.type = 'classic' AND c.disp_id IN (   SELECT disp_id FROM account a   JOIN card c ON a.account_id = c.account_id   WHERE c.type = 'gold' AND c.disp_id IN (    SELECT disp_id FROM account a    JOIN card c ON a.account_id = c.account_id    WHERE c.type = 'junior' AND c.disp_id IN (     SELECT disp_id FROM account a     JOIN card c ON a.account_id = c.account_id     WHERE c.type = 'classic' AND c.disp_id IN (      SELECT disp_id FROM account a      JOIN card c ON a.account_id = c.account_id      WHERE c.type = 'gold' AND c.disp_id IN (       SELECT disp_id FROM account a       JOIN card c ON a.account_id = c.account_id       WHERE c.type = 'junior' AND c.disp_id IN (        SELECT disp_id FROM account a        JOIN card c ON a.account_id = c.account_id        WHERE c.type = 'classic' AND c.disp_id IN (         SELECT disp_id FROM account a         JOIN card c ON a.account_id = c.account_id         WHERE c.type = 'gold' AND c.disp_id IN (          SELECT disp_id FROM account a          JOIN card c ON a.account_id = c.account_id          WHERE c.type = 'junior' AND c.disp_id IN (           SELECT disp_id FROM account a           JOIN card c ON a.account_id = c.account_id           WHERE c.type = 'classic' AND c.disp_id IN (            SELECT disp_id FROM account a            JOIN card c ON a.account_id = c.account_id            WHERE c	financial
SELECT account_id, amount, date FROM loan WHERE duration > 24 ORDER BY amount ASC, date ASC LIMIT 1;	financial
SELECT account_id FROM client WHERE gender = 'F' ORDER BY birth_date DESC LIMIT 1;	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1920-01-01' AND '1929-12-31' AND d.A3 = 'east Bohemia';	financial
SELECT COUNT(*) FROM loan WHERE duration = 24 AND frequency = 'POPLATEK TYDNE';	financial
SELECT AVG(amount) FROM loan WHERE status = 'C' AND date > (SELECT date FROM trans WHERE account_id = loan.account_id AND type = 'PRIJEM' AND operation = 'VKLAD');	financial
SELECT client_id, district_id FROM client WHERE district_id IN (     SELECT district_id     FROM district     WHERE A16 = 1 );	financial
SELECT client.client_id, client.birth_date FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id WHERE card.type = 'gold' AND disp.type = 'OWNER';	financial
SELECT bond_type, COUNT(bond_type) AS bond_count FROM bond GROUP BY bond_type ORDER BY bond_count DESC LIMIT 1;	toxicology
SELECT COUNT(*) FROM molecule m, atom a WHERE m.molecule_id = a.molecule_id AND m.label = '-' AND a.element = 'cl';	toxicology
SELECT AVG(element = 'o') FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '-'	toxicology
SELECT AVG(bonds) FROM (     SELECT COUNT(*) AS bonds     FROM connected c     JOIN atom a ON c.atom_id = a.atom_id     JOIN molecule m ON a.molecule_id = m.molecule_id     WHERE m.label = '+' AND c.bond_id IN (         SELECT bond_id         FROM bond         WHERE bond_type = '-'     ) );	toxicology
SELECT COUNT(*) FROM `atom` JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `atom`.`element` = 'na' AND `molecule`.`label` = '-';	toxicology
SELECT `molecule`.`molecule_id` FROM `bond` JOIN `connected` ON `bond`.`bond_id` = `connected`.`bond_id` JOIN `atom` ON `connected`.`atom_id` = `atom`.`atom_id` JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `bond`.`bond_type` = '#' AND `molecule`.`label` = '+'	toxicology
SELECT DIVIDE(SUM(element = 'c'), COUNT(atom_id)) FROM atom WHERE bond_type = '=';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element!= 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT `molecule`.`molecule_id` FROM `molecule` JOIN `atom` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `atom`.`element` = 'c';	toxicology
SELECT element FROM atom WHERE atom_id IN (     SELECT atom_id, atom_id2     FROM connected     WHERE bond_id = 'TR004_8_9' );	toxicology
SELECT element FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '=';	toxicology
SELECT label FROM atom WHERE element = 'h' GROUP BY label ORDER BY COUNT(label) DESC LIMIT 1	toxicology
SELECT bond_type FROM bond JOIN atom ON atom.molecule_id = bond.molecule_id WHERE element = 'cl'	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id IN (  SELECT bond_id  FROM bond  WHERE bond_type = '-' );	toxicology
SELECT * FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE label = '-' GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20' UNION SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR004_20' AND connected.atom_id2 = 'TR004_8'	toxicology
SELECT label FROM molecule WHERE NOT molecule_id IN (SELECT molecule_id FROM atom WHERE element!='sn')	toxicology
SELECT COUNT(DISTINCT atom_id) FROM atom WHERE element = 'i' OR element ='s' AND atom_id IN (     SELECT atom_id     FROM connected     WHERE bond_id IN (         SELECT bond_id         FROM bond         WHERE bond_type = '-'     ) );	toxicology
SELECT * FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT atom_id, atom_id2, bond_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181') OR atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181');	toxicology
SELECT  DISTINCT  DIVIDE(   SUM(    element = 'f'   ) * 100,   COUNT(    DISTINCT    molecule_id   )  ) FROM  atom WHERE  label = '+'	toxicology
SELECT  DIVIDE(   (    SELECT     COUNT(*)    FROM     bond    WHERE     bond_type = '#'   )   * 100,   (    SELECT     COUNT(*)    FROM     bond    WHERE     label = '+'   )  )  AS percent;	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element LIMIT 3	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR001_2_6'	toxicology
SELECT difference  FROM (  SELECT    label,   COUNT(*) AS count  FROM molecule  GROUP BY label ) AS t PIVOT (  SUM(count)  FOR label IN ('+', '-') ) AS pivot_table UNPIVOT (  difference  FOR label IN (difference) );	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5';	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2';	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '=' GROUP BY molecule_id ORDER BY molecule_id LIMIT 5	toxicology
SELECT DIVIDE(COUNT(*), (SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR008')) as percent FROM bond WHERE bond_type = '=' AND molecule_id = 'TR008';	toxicology
SELECT DIVIDE(SUM(label = '+'), COUNT(molecule_id)) as percent FROM molecule	toxicology
SELECT  ROUND(  (   SELECT     COUNT(atom_id)    FROM     atom    WHERE     element = 'h'     AND     molecule_id = 'TR206'  ) /   (   SELECT     COUNT(atom_id)    FROM     atom    WHERE     molecule_id = 'TR206'  ),  4 )  AS  percent	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT atom.element, molecule.label FROM atom, molecule, connected WHERE atom.atom_id = connected.atom_id AND molecule.molecule_id = atom.molecule_id AND molecule.molecule_id = 'TR060';	toxicology
SELECT bond_type, COUNT(bond_type) FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1; SELECT label FROM molecule WHERE molecule_id = 'TR010';	toxicology
SELECT `molecule`.`molecule_id` FROM `molecule` JOIN `atom` ON `atom`.`molecule_id` = `molecule`.`molecule_id` JOIN `bond` ON `bond`.`molecule_id` = `molecule`.`molecule_id` JOIN `connected` ON `connected`.`atom_id` = `atom`.`atom_id` AND `connected`.`atom_id2` = `atom`.`atom_id` AND `connected`.`bond_id` = `bond`.`bond_id` WHERE `bond`.`bond_type` = '-' AND `molecule`.`label` = '-' GROUP BY `molecule`.`molecule_id` ORDER BY `molecule`.`molecule_id` LIMIT 3	toxicology
SELECT bond_id FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id LIMIT 2;	toxicology
SELECT COUNT(*) FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.atom_id = 'TR009_12' OR c.atom_id2 = 'TR009_12';	toxicology
SELECT COUNT(*) FROM molecule m, atom a WHERE m.molecule_id = a.molecule_id AND m.label = '+' AND a.element = 'br';	toxicology
SELECT bond_type, atom_id, atom_id2 FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond_id = 'TR001_6_9';	toxicology
SELECT `molecule`.`label` FROM `atom` JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `atom`.`atom_id` = 'TR000_1';	toxicology
SELECT COUNT(DISTINCT `molecule_id`) FROM `bond` WHERE `bond_type` = '#';	toxicology
SELECT COUNT(bond_id) FROM connected WHERE atom_id = 'TR%_19';	toxicology
SELECT `element` FROM `atom` WHERE `molecule_id` = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT `molecule`.`molecule_id` FROM `atom` JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `atom`.`atom_id` BETWEEN 'TR000_21' AND 'TR000_25' AND `molecule`.`label` = '+';	toxicology
SELECT bond_id FROM bond JOIN atom ON atom.atom_id = bond.atom_id WHERE element = 'p'  UNION  SELECT bond_id FROM bond JOIN atom ON atom.atom_id = bond.atom_id WHERE element = 'n'	toxicology
SELECT `molecule`.`molecule_id` FROM `bond` JOIN `molecule` ON `bond`.`molecule_id` = `molecule`.`molecule_id` WHERE `bond`.`bond_type` ='= ' GROUP BY `molecule`.`molecule_id` ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT AVG(t1.count) FROM (  SELECT COUNT(bond_id) AS count  FROM connected AS t0  JOIN atom AS t1 ON t0.atom_id = t1.atom_id  WHERE t1.element = 'i'  GROUP BY t0.atom_id )	toxicology
SELECT bond_type, bond_id FROM bond WHERE bond_id = 'TR000_2_4';	toxicology
SELECT `element` FROM `atom` WHERE `atom_id` NOT IN (SELECT `atom_id` FROM `connected` UNION SELECT `atom_id2` FROM `connected`);	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id IN (     SELECT bond_id     FROM bond     WHERE bond_type = '#' AND molecule_id = 'TR041' );	toxicology
SELECT atom.element FROM atom, bond, connected WHERE bond.bond_id = 'TR144_8_19' AND bond.bond_id = connected.bond_id AND atom.atom_id = connected.atom_id	toxicology
SELECT `molecule`.`molecule_id` FROM `molecule` JOIN `bond` ON `bond`.`molecule_id` = `molecule`.`molecule_id` WHERE `molecule`.`label` = '+' AND `bond`.`bond_type` ='= ' GROUP BY `molecule`.`molecule_id` ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT `element` FROM `atom` WHERE `element` IN (SELECT `element` FROM `atom` WHERE `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '+')) GROUP BY `element` ORDER BY COUNT(`element`) LIMIT 1	toxicology
SELECT atom_id2 FROM connected WHERE atom_id = (SELECT atom_id FROM atom WHERE element = 'pb');	toxicology
SELECT element FROM atom a, bond b, connected c WHERE a.atom_id = c.atom_id AND b.bond_id = c.bond_id AND b.bond_type = '#';	toxicology
SELECT bond_id, COUNT(atom_id) as count FROM connected GROUP BY bond_id ORDER BY count DESC LIMIT 1;	toxicology
SELECT  DIVIDE(     SUM(label = '+'),     COUNT(bond_id) ) * 100.00000 AS proportion FROM bond JOIN atom ON atom.atom_id = bond.atom_id JOIN molecule ON molecule.molecule_id = atom.molecule_id WHERE bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element ='s'	toxicology
SELECT bond_type FROM bond JOIN atom ON atom.molecule_id = bond.molecule_id WHERE element ='sn';	toxicology
SELECT COUNT(DISTINCT element) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br');	toxicology
SELECT bond_id FROM bond WHERE molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '+' );	toxicology
SELECT `molecule`.`molecule_id` FROM `molecule` JOIN `bond` ON `bond`.`molecule_id` = `molecule`.`molecule_id` WHERE `bond`.`bond_type` = '-' AND `molecule`.`label` = '-'	toxicology
SELECT  mol.molecule_id,  mol.label,  COUNT(at.atom_id) as num_atoms,  SUM(at.element = 'cl') as num_chlorine,  DIVIDE(SUM(at.element = 'cl'), COUNT(at.atom_id)) as percent FROM  atom at  JOIN molecule mol ON at.molecule_id = mol.molecule_id  JOIN bond b ON at.molecule_id = b.molecule_id  JOIN connected c ON at.atom_id = c.atom_id WHERE  b.bond_type = '-' GROUP BY  mol.molecule_id,  mol.label ORDER BY  percent DESC	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT `molecule_id` FROM `molecule` WHERE `label` = '-';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a.element, a.atom_id FROM atom a, bond b, connected c WHERE a.atom_id = c.atom_id AND b.bond_id = c.bond_id AND b.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(bond_id) FROM bond JOIN atom ON atom.atom_id = bond.bond_id WHERE element = 'i'	toxicology
SELECT label, COUNT(*) FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE element = 'ca' GROUP BY label ORDER BY MAX(label) DESC LIMIT 1;	toxicology
SELECT bond_id FROM bond WHERE bond_id = 'TR001_1_8' AND element = 'cl' AND element = 'c';	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '#' INTERSECT SELECT molecule_id FROM atom WHERE element = 'c' INTERSECT SELECT molecule_id FROM molecule WHERE label = '-';	toxicology
SELECT  COUNT(DISTINCT `atom`.`atom_id`) AS `num_atoms`,  `atom`.`element` AS `element`,  `molecule`.`label` AS `label`,  ROUND(   (    SELECT     COUNT(DISTINCT `atom`.`atom_id`) AS `num_atoms`    FROM     `atom`    WHERE     `atom`.`element` = 'cl'   ) / COUNT(DISTINCT `atom`.`atom_id`) * 100,   2  ) AS `percentage` FROM  `atom`  JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE  `atom`.`element` = 'cl'  AND `molecule`.`label` = '+'	toxicology
SELECT `element` FROM `atom` WHERE `molecule_id` = 'TR001';	toxicology
SELECT molecule_id FROM bond WHERE bond_type ='= ';	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id IN (  SELECT bond_id  FROM bond  WHERE bond_type = '#' );	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(*) FROM molecule m, bond b WHERE m.molecule_id = b.molecule_id AND b.bond_type = '-' AND m.label = '-';	toxicology
SELECT `label` FROM `molecule` AS T1 JOIN `bond` AS T2 ON T1.`molecule_id` = T2.`molecule_id` WHERE T2.`bond_id` = 'TR001_10_11'	toxicology
SELECT bond_id, label FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond_type = '#' AND label = '+';	toxicology
select element from atom join molecule on atom.molecule_id = molecule.molecule_id where label = '+' and substr(atom_id, 7, 1) = '4'	toxicology
SELECT   '+' as label,  ROUND(   CAST(    COUNT(     DISTINCT     connected.atom_id    ) AS numeric   ) /   (    SELECT      COUNT(      DISTINCT      atom.atom_id     )     FROM      atom     WHERE      atom.molecule_id = 'TR006'   ),   2  ) as ratio FROM   connected  WHERE   connected.atom_id IN (   SELECT     atom.atom_id    FROM     atom    WHERE     atom.molecule_id = 'TR006'    AND atom.element = 'h'  )  AND connected.atom_id2 IN (   SELECT     atom.atom_id    FROM     atom    WHERE     atom.molecule_id = 'TR006'  );	toxicology
SELECT `label` FROM `molecule` WHERE `molecule_id` IN (  SELECT `molecule_id`  FROM `atom`  WHERE `element` = 'ca' );	toxicology
SELECT bond_type FROM bond WHERE bond_id IN (     SELECT bond_id     FROM connected     WHERE atom_id IN (         SELECT atom_id         FROM atom         WHERE element = 'c'     ) );	toxicology
SELECT element FROM atom WHERE atom_id IN (  SELECT atom_id  FROM connected  WHERE bond_id = 'TR001_10_11'  UNION  SELECT atom_id2  FROM connected  WHERE bond_id = 'TR001_10_11' );	toxicology
SELECT  COUNT(*) FROM  bond WHERE  bond_type = '#';	toxicology
SELECT bond_type, COUNT(*) FROM bond WHERE molecule_id = 'TR047' GROUP BY bond_type;	toxicology
SELECT label FROM molecule WHERE molecule_id IN (  SELECT molecule_id  FROM atom  WHERE atom_id = 'TR001_1' );	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR151';	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.atom_id2 IN (     SELECT connected.atom_id2     FROM connected     WHERE connected.atom_id IN (         SELECT atom.atom_id         FROM atom         JOIN molecule ON atom.molecule_id = molecule.molecule_id         WHERE molecule.molecule_id = 'TR151'     ) )	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '+' );	toxicology
SELECT bond_id FROM bond WHERE bond_type ='='AND molecule_id IN (  SELECT molecule_id  FROM molecule  WHERE label = '+' );	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '+' ) AND element = 'h';	toxicology
SELECT bond.molecule_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR000_1';	toxicology
SELECT atom_id FROM atom WHERE element = 'c' AND molecule_id IN (  SELECT molecule_id  FROM molecule  WHERE label = '-' );	toxicology
SELECT  COUNT(DISTINCT `molecule`.`molecule_id`) AS `count_distinct_molecule_id`,  `molecule`.`label` AS `label`,  `atom`.`element` AS `element` FROM  `atom`  JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE  `atom`.`element` = 'h'  AND `molecule`.`label` = '+' ;	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR124';	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR186';	toxicology
SELECT bond.bond_type FROM bond WHERE bond.bond_id = 'TR007_4_19';	toxicology
SELECT element FROM atom WHERE atom_id IN (  SELECT atom_id  FROM connected  WHERE bond_id = 'TR001_10_11' );	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '=' AND molecule_id = 'TR006';	toxicology
SELECT DISTINCT t1.label, t2.element  FROM molecule AS t1  JOIN atom AS t2 ON t1.molecule_id = t2.molecule_id  WHERE t1.label = '+' AND t2.element = 'cl';	toxicology
SELECT bond_id, atom_id, atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-'	toxicology
SELECT DISTINCT t1.molecule_id, t1.element FROM atom AS t1 JOIN bond AS t2 ON t1.atom_id = t2.bond_id WHERE t2.bond_type = '#'	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 'cl';	toxicology
SELECT atom_id, COUNT(DISTINCT bond_type) FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE molecule_id = 'TR346' GROUP BY atom_id;	toxicology
SELECT COUNT(*) FROM molecule WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type ='= ') AND label = '+';	toxicology
SELECT COUNT(*) FROM molecule WHERE NOT molecule_id IN (     SELECT molecule_id     FROM atom     WHERE element ='s' ) AND NOT molecule_id IN (     SELECT molecule_id     FROM bond     WHERE bond_type ='= ' );	toxicology
SELECT label FROM molecule WHERE molecule_id IN (  SELECT molecule_id  FROM bond  WHERE bond_id = 'TR001_2_4' );	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT `molecule`.`molecule_id` FROM `atom` JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `atom`.`element` = 'cl' AND `molecule`.`label` = '+'	toxicology
SELECT `molecule`.`molecule_id` FROM `molecule` JOIN `atom` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `atom`.`element` = 'c' AND `molecule`.`label` = '-'	toxicology
SELECT  COUNT(DISTINCT `molecule`.`molecule_id`) AS `count` FROM  `atom`  JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE  `atom`.`element` = 'cl'  AND `molecule`.`label` = '+';	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT `element`) FROM `atom` WHERE `atom_id` IN (SELECT `atom_id` FROM `connected` WHERE `bond_id` = 'TR001_10_11');	toxicology
SELECT bond_type FROM bond WHERE bond_id = (SELECT bond_id FROM connected WHERE atom_id = 'TR000_1' AND atom_id2 = 'TR000_2');	toxicology
SELECT `molecule`.`molecule_id` FROM `atom` JOIN `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `atom`.`atom_id` = "TR000_2" AND `connected`.`atom_id2` = "TR000_4"	toxicology
SELECT `element` FROM `atom` WHERE `atom_id` = 'TR000_1';	toxicology
SELECT `label` FROM `molecule` WHERE `molecule_id` = 'TR000';	toxicology
SELECT  COUNT(bond_id) as bond_count,  DIVIDE(SUM(bond_type = '-'), COUNT(bond_id)) as percentage FROM  bond	toxicology
SELECT COUNT(*) FROM molecule m, atom a WHERE m.molecule_id = a.molecule_id AND a.element = 'n' AND m.label = '+';	toxicology
SELECT molecule_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON bond.bond_id = connected.bond_id WHERE element ='s' AND bond_type ='= '	toxicology
SELECT `molecule`.`molecule_id` FROM `molecule` JOIN `atom` ON `molecule`.`molecule_id` = `atom`.`molecule_id` WHERE `molecule`.`label` = '-' GROUP BY `molecule`.`molecule_id` HAVING COUNT(molecule_id) > 5	toxicology
SELECT element FROM atom WHERE atom_id IN (  SELECT atom_id  FROM connected  WHERE bond_id IN (   SELECT bond_id   FROM bond   WHERE bond_type = '=' AND molecule_id = 'TR024'  ) );	toxicology
SELECT label FROM molecule WHERE molecule_id IN (  SELECT atom.molecule_id  FROM atom  GROUP BY atom.molecule_id  ORDER BY COUNT(atom.molecule_id) DESC  LIMIT 1 );	toxicology
SELECT  ROUND(   (    SELECT     COUNT(      DISTINCT      connected.atom_id     )    FROM     connected,     atom,     bond,     molecule    WHERE     connected.atom_id = atom.atom_id     AND connected.atom_id2 = atom.atom_id     AND connected.bond_id = bond.bond_id     AND bond.bond_type = '#'     AND atom.element = 'h'     AND molecule.molecule_id = bond.molecule_id     AND molecule.label = '+'   )   /   (    SELECT     COUNT(      DISTINCT      bond.molecule_id     )    FROM     bond,     molecule    WHERE     bond.molecule_id = molecule.molecule_id     AND molecule.label = '+'   )   * 100.0  )  AS percentage;	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR004' and 'TR010' AND molecule_id IN (  SELECT bond.molecule_id  FROM bond  WHERE bond_type = '-' );	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'	toxicology
SELECT element FROM atom WHERE atom_id = 'TR004_7' AND molecule_id IN (  SELECT molecule_id  FROM molecule  WHERE label = '-' );	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond JOIN atom ON atom.atom_id = bond.bond_id WHERE element = 'o' AND bond_type = '=';	toxicology
SELECT COUNT(*) FROM molecule m, bond b WHERE m.molecule_id = b.molecule_id AND b.bond_type = '#' AND m.label = '-';	toxicology
SELECT a.element, b.bond_type FROM atom a, bond b, connected c WHERE a.atom_id = c.atom_id AND b.bond_id = c.bond_id AND c.atom_id2 = a.atom_id AND c.atom_id2 = b.bond_id AND c.atom_id2 = 'TR002'	toxicology
SELECT atom_id FROM atom WHERE element = 'c' AND atom_id IN (     SELECT atom_id     FROM connected     WHERE bond_id IN (         SELECT bond_id         FROM bond         WHERE bond_type = '='         AND molecule_id = 'TR012'     ) );	toxicology
SELECT atom_id FROM atom WHERE molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '+' ) AND element = 'o';	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT * FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId!= NULL AND cardKingdomId!= NULL	card_games
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards);	card_games
SELECT name FROM cards c JOIN legalities l ON c.id = l.id WHERE l.format = 'edh' AND l.status = 'legal' AND c.frameVersion = '2015' AND c.edhrecRank < 100	card_games
SELECT cards.name FROM cards JOIN legalities ON cards.id = legalities.id WHERE cards.rarity ='mythic' AND legalities.format = 'gladiator' AND legalities.status = 'Banned';	card_games
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.type = 'Artifact' AND cards.side IS NULL AND legalities.format = 'vintage';	card_games
SELECT id, artist FROM cards WHERE (power = '*' OR power IS NULL) AND uuid IN (     SELECT uuid     FROM legalities     WHERE format = 'commander' AND status = 'Legal' );	card_games
SELECT c.id, r.text FROM cards c JOIN rulings r ON c.id = r.uuid WHERE c.artist = 'Stephen Daniele' AND c.hasContentWarning = 1	card_games
SELECT text FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Sublime Epiphany' AND number = '74s');	card_games
SELECT cards.name, cards.artist, isPromo FROM cards JOIN rulings ON cards.uuid = rulings.uuid GROUP BY cards.name, cards.artist, isPromo ORDER BY COUNT(rulings.uuid) DESC LIMIT 1;	card_games
SELECT language FROM foreign_data WHERE uuid IN (     SELECT uuid     FROM cards     WHERE name = 'Annul' AND number = '29' );	card_games
SELECT name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'Japanese';	card_games
SELECT Divide(Sum(id where language = 'Chinese Simplified'), Count(id)) *100	card_games
SELECT name, totalSetSize FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE language = 'Italian';	card_games
SELECT COUNT(DISTINCT type) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT `borderColor` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = "Ancestor's Chosen";	card_games
SELECT language FROM set_translations WHERE setCode IN (SELECT setCode FROM cards WHERE name = 'Angel of Mercy');	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.id = l.id WHERE l.status ='restricted' AND c.isTextless = 0;	card_games
SELECT text FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = "Ancestor's Chosen");	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.id = l.id WHERE l.status ='restricted' AND c.isStarter = 1;	card_games
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Aven Cloudchaser';	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Benalish Knight';	card_games
SELECT artist FROM cards WHERE setCode = '10E' AND language = 'Phyrexian';	card_games
SELECT Divide(Count(id) where borderColor = 'borderless', Count(id)) *100 as percentage FROM cards;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'German' AND c.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'Russian' AND c.borderColor = 'borderless';	card_games
SELECT (SELECT COUNT(id) FROM cards WHERE language = 'French' AND isStorySpotlight = 1) / (SELECT COUNT(id) FROM cards WHERE isStorySpotlight = 1) * 100 AS percentage;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = 99;	card_games
SELECT * FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability ='mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords LIKE '%flying%';	card_games
SELECT COUNT(*) FROM cards WHERE originalType LIKE 'Summon - Angel' AND subtypes NOT LIKE 'Angel';	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT artist FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'Chinese Simplified';	card_games
SELECT cards.name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Japanese' AND cards.availability = 'paper';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.id = l.id WHERE l.status = 'Banned' AND c.borderColor = 'white';	card_games
SELECT uuid, language FROM cards c JOIN foreign_data f ON c.uuid = f.uuid JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'legacy';	card_games
SELECT text FROM rulings WHERE uuid = '56f4935b-f6c5-59b9-88bf-9bcce20247ce';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = 'future';  SELECT * FROM legalities WHERE status = 'legal';	card_games
SELECT cards.colors FROM cards WHERE cards.setCode = 'OGW';	card_games
SELECT cards.name, foreign_data.language FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.setCode = '10E' AND cards.convertedManaCost = 5;	card_games
SELECT name, date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE originalType = 'Creature - Elf';	card_games
SELECT colors, setCode FROM cards WHERE id BETWEEN 1 AND 20;	card_games
SELECT c.name, f.language FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.colors = 'B' AND c.type = 'Artifact' AND f.language IS NOT NULL;	card_games
SELECT name FROM cards WHERE rarity = 'uncommon' ORDER BY (SELECT date FROM rulings WHERE uuid = cards.uuid) ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomId IS NOT NULL AND cardKingdomFoilId IS NOT NULL AND power = '0';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability ='mtgo' AND hand = -1	card_games
SELECT COUNT(*) FROM cards WHERE hasContentWarning = 1 AND availability = 'paper' AND frameVersion = '1993';	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability ='mtgo,paper';	card_games
SELECT SUM(convertedManaCost) FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT type FROM cards WHERE availability = 'arena'	card_games
SELECT setCode FROM set_translations WHERE language = 'Spanish';	card_games
SELECT DIVIDE(COUNT(isOnlineOnly=1), COUNT(id)) from cards where frameEffects = 'legendary'	card_games
SELECT id, (SELECT (SELECT SUM(count(id)) FROM cards WHERE isStorylight = 1 AND isTextless = 0) / (SELECT SUM(count(id)) FROM cards) * 100) AS percentage FROM cards WHERE isStorylight = 1 AND isTextless = 0;	card_games
SELECT name, (SELECT COUNT(id) FROM foreign_data WHERE language = 'Spanish')/COUNT(id)*100 FROM cards;	card_games
SELECT language FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE baseSetSize = 309);	card_games
SELECT COUNT(*) FROM set_translations WHERE language = 'Portuguese (Brasil)' AND setCode IN (SELECT code FROM sets WHERE block = 'Commander');	card_games
SELECT id FROM cards WHERE types = 'Creature' AND status = 'legal';	card_games
SELECT type FROM cards WHERE subtypes IS NOT NULL AND supertypes IS NOT NULL AND language = 'German';	card_games
SELECT COUNT(*) FROM cards WHERE (power = '*' OR power IS NULL) AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(*) FROM cards c WHERE c.layout NOT IN ('transform','modal_dfc') AND c.setCode IN (SELECT code FROM sets WHERE releaseDate < '2004-01-01') AND c.uuid IN (     SELECT uuid     FROM rulings     WHERE text = 'This is a triggered mana ability.' ) AND c.side IS NULL;	card_games
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability = 'paper' AND convertedManaCost <= 2;	card_games
SELECT artist FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.text = "Das perfekte Gegenmittel zu einer dichten Formation";	card_games
SELECT foreign_data.name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.type = 'Creature' AND cards.layout = 'normal' AND cards.borderColor = 'black' AND cards.artist = 'Matthew D. Wilson' AND foreign_data.language = 'French';	card_games
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.id = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01';	card_games
SELECT language FROM set_translations WHERE setCode IN (     SELECT code     FROM sets     WHERE baseSetSize = 180 AND block = 'Ravnica' );	card_games
SELECT DIVIDE(COUNT(hasContentWarning = 0),COUNT(ID))*100 FROM cards WHERE format = 'commander' AND Status = 'legal';	card_games
SELECT DIVIDE(COUNT(language = 'French' and power is NULL or power = '*'), COUNT( power is NULL or power = '*'))*100 FROM cards	card_games
SELECT DIVIDE(COUNT(language = 'Japanese'),COUNT(language))*100 FROM set_translations WHERE type = 'expansion';	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name, power FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague' ORDER BY power LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934;	card_games
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3;	card_games
SELECT DIVIDE(COUNT(isTextless = 1 and layout = 'normal'),COUNT(isTextless))*100 FROM cards;	card_games
SELECT `number` FROM `cards` WHERE `subtypes` = 'Angel,Wizard' AND `otherFaceIds` IS NULL	card_games
SELECT name, code FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3	card_games
SELECT language FROM set_translations WHERE setCode = 'ARC' AND translation = 'Archenemy';	card_games
SELECT name, translation FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE id = 5;	card_games
SELECT language, type FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE id = 206);	card_games
SELECT id, name FROM cards WHERE uuid IN (     SELECT uuid     FROM foreign_data     WHERE language = 'Italian' ) AND setCode IN (     SELECT code     FROM sets     WHERE block = 'Shadowmoor' ) ORDER BY name LIMIT 2;	card_games
SELECT id FROM sets WHERE isForeignOnly = 1 AND isFoilOnly = 1 AND language = 'Japanese';	card_games
SELECT code, MAX(baseSetSize) FROM sets WHERE language = 'Russian';	card_games
SELECT COUNT(language = 'Chinese Simplified' AND isOnlineOnly = 1) / COUNT(language = 'Chinese Simplified') * 100 FROM foreign_data;	card_games
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language FROM set_translations WHERE setCode = "174";	card_games
SELECT name FROM sets WHERE code = "ALL";	card_games
SELECT language FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'A Pedra Fellwar');	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT baseSetSize, code FROM sets WHERE block = "Mirage" OR block = "Masques";	card_games
SELECT code FROM sets WHERE type = 'expansion';	card_games
SELECT foreign_data.name, cards.type FROM foreign_data, cards WHERE foreign_data.uuid = cards.uuid AND cards.watermark = 'Boros';	card_games
SELECT language, flavorText, type FROM foreign_data, cards WHERE foreign_data.uuid = cards.uuid AND watermark = 'colorpie';	card_games
SELECT DIVIDE(COUNT(cards.convertedManaCost = 10),COUNT(cards.convertedManaCost))*100 FROM cards, sets WHERE sets.name = 'Abyssal Horror' AND cards.setCode = sets.code	card_games
SELECT code FROM sets WHERE type = 'expansion commander';	card_games
SELECT foreign_data.name, cards.type FROM foreign_data, cards WHERE foreign_data.uuid = cards.uuid AND cards.watermark = 'Abzan';	card_games
SELECT c.type, f.language FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'azorius';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE bordercolor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%';	card_games
SELECT name, convertedManaCost FROM cards WHERE name = 'Serra Angel' OR name = 'Shrine Keeper' ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT set_translations.translation FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE cards.name = 'Ancestor''s Chosen' AND set_translations.language = 'Italian';	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT code FROM cards WHERE name = 'Angel of Mercy');	card_games
SELECT name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid JOIN sets s ON c.setCode = s.code WHERE f.language = 'German' AND s.code = '10E';	card_games
SELECT * FROM cards WHERE name = 'Ancestor''s Chosen' AND language = 'Korean';	card_games
SELECT COUNT(*) FROM cards WHERE setCode = (SELECT code FROM sets WHERE translation = 'Hauptset Zehnte Edition') AND artist = 'Adam Rex';	card_games
SELECT baseSetSize FROM sets WHERE translation = 'Hauptset Zehnte Edition';	card_games
SELECT translation FROM set_translations WHERE setCode = '8ED' AND language = 'Chinese Simplified';	card_games
SELECT name FROM cards WHERE name = 'Angel of Mercy' AND mtgoCode IS NOT NULL;	card_games
SELECT releaseDate FROM cards c, sets s WHERE c.name = 'Ancestor''s Chosen' AND c.setCode = s.code;	card_games
SELECT type FROM sets WHERE translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM set_translations WHERE language = 'Italian' AND translation IS NOT NULL AND setCode IN (SELECT code FROM sets WHERE block = 'Ice Age');	card_games
SELECT name FROM cards WHERE name = 'Adarkar Valkyrie' AND isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets WHERE language = 'Italian' AND translation IS NOT NULL AND baseSetSize < 100;	card_games
SELECT COUNT(*) FROM cards WHERE setCode = 'CSP' AND borderColor = 'black';	card_games
SELECT name FROM cards c, sets s WHERE c.setCode = s.code AND s.name = 'Coldsnap' AND c.convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards c, sets s WHERE c.setCode = s.code AND s.name = 'Coldsnap');	card_games
SELECT artist FROM cards WHERE setCode = 'C10' AND artist IN ('Jeremy Jarvis', 'Aaron Miller','Chippy');	card_games
SELECT * FROM cards WHERE setCode = '10E' AND number = '4';	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL);	card_games
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen';	card_games
SELECT language FROM foreign_data WHERE flavorText IS NOT NULL AND uuid = (SELECT uuid FROM cards WHERE name = 'Ancestor''s Chosen');	card_games
SELECT type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'German' AND c.name = 'Ancestor''s Chosen';	card_games
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid JOIN foreign_data ON cards.uuid = foreign_data.uuid JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND foreign_data.language = 'Italian';	card_games
SELECT foreignData.name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.setCode = '3ED' AND foreign_data.language = 'Italian' AND cards.convertedManaCost = (SELECT MAX(cards.convertedManaCost) FROM cards WHERE cards.setCode = '3ED');	card_games
SELECT date FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Reminisce');	card_games
SELECT DIVIDE(SUM(convertedManaCost = 7), SUM(convertedManaCost))*100 FROM cards WHERE name = 'Coldsnap';	card_games
SELECT DIVIDE(SUM(cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL), SUM(name = 'Coldsnap'))*100 AS percentage FROM cards;	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'	card_games
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%';	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' AND c.hasContentWarning = 1;	card_games
SELECT releaseDate FROM cards c, sets s WHERE c.name = 'Evacuation' AND c.setCode = s.code	card_games
SELECT baseSetSize FROM sets WHERE translation = 'Rinascita di Alara';	card_games
SELECT type FROM sets WHERE translation = 'Huitième édition';	card_games
SELECT set_translations.translation FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE cards.name = 'Tendo Ice Bridge' AND set_translations.language = 'French';	card_games
SELECT COUNT(*) FROM set_translations WHERE translation IS NOT NULL AND setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition');	card_games
SELECT set_translations.translation FROM set_translations JOIN cards ON set_translations.setCode = cards.setCode WHERE cards.name = 'Fellwar Stone' AND set_translations.language = 'Japanese';	card_games
SELECT name, MAX(convertedManaCost) FROM cards c, sets s WHERE c.setCode = s.code AND s.name = 'Journey into Nyx Hero''s Path'	card_games
SELECT releaseDate FROM sets WHERE translation = 'Ola de frío';	card_games
SELECT type FROM cards c, sets s WHERE c.name = 'Samite Pilgrim' AND c.setCode = s.code;	card_games
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'World Championship Decks 2004' AND c.convertedManaCost = 3	card_games
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND setCode = 'MIR';	card_games
SELECT DIVIDE(SUM(isNonFoilOnly = 1), SUM(language = 'Japanese'))*100 FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE language = 'Japanese';	card_games
SELECT DIVIDE(SUM(isOnlineOnly = 1), SUM(language = 'Portuguese (Brazil)))*100 FROM cards WHERE language = 'Portuguese (Brazil)'	card_games
SELECT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT MAX(frameEffects) FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1	card_games
SELECT name, convertedManaCost FROM cards WHERE format = 'duel' ORDER BY convertedManaCost DESC LIMIT 10;	card_games
SELECT MIN(originalReleaseDate), format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE rarity ='mythic' AND status = 'legal' GROUP BY format;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.artist = 'Volkan Baǵa' AND f.language = 'French';	card_games
SELECT COUNT(*) FROM cards WHERE rarity = 'rare' AND types = 'Enchantment' AND name = 'Abundance' AND uuid IN (SELECT uuid FROM legalities WHERE status = 'Legal');	card_games
SELECT format, name FROM cards c JOIN legalities l ON c.id = l.id WHERE status = 'Banned' GROUP BY format ORDER BY COUNT(status = 'Banned') DESC LIMIT 1;	card_games
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Battlebond');	card_games
SELECT artist, format FROM cards GROUP BY artist ORDER BY COUNT(artist) LIMIT 1;	card_games
SELECT status FROM cards WHERE frameVersion = '1997' AND artist = 'D. Alexander Gregory' AND hasContentWarning = 1 AND format = 'legacy';	card_games
SELECT name, format FROM cards c JOIN legalities l ON c.id = l.id WHERE edhrecRank = 1 AND status = 'Banned'	card_games
SELECT AVG(id) FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31';	card_games
SELECT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena';	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned','restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT text FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE artist = 'Kev Walker') ORDER BY date DESC;	card_games
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Hour of Devastation' AND legalities.status = 'Legal';	card_games
SELECT name FROM sets WHERE language NOT LIKE '%Japanese%' AND language = 'Korean';	card_games
SELECT frameVersion, artist, status FROM cards WHERE artist = 'Allen Williams' AND status = 'Banned';	card_games
SELECT Id, DisplayName, Reputation FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT DisplayName FROM users WHERE year(CreationDate) = 2011	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND strftime('%Y', CreationDate) > 2013	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = "csgillespie"	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = "csgillespie"	codebase_community
SELECTDisplayName FROM users JOIN posts ON users.Id = posts.OwnerUserId WHERE posts.Title = 'Eliciting priors from experts'	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = "csgillespie" AND ViewCount = (SELECT MAX(ViewCount) FROM posts WHERE OwnerDisplayName = "csgillespie");	codebase_community
SELECT OwnerDisplayName FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT SUM(CommentCount) FROM posts WHERE OwnerDisplayName = "csgillespie"	codebase_community
SELECT AnswerCount FROM posts WHERE OwnerDisplayName = "csgillespie" AND AnswerCount = (SELECT MAX(AnswerCount) FROM posts);	codebase_community
SELECT LastEditorDisplayName FROM posts WHERE Title = "Examples for teaching: Correlation does not mean causation"	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL	codebase_community
SELECT DISTINCT OwnerDisplayName FROM posts WHERE ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE Age > 65) AND Score >= 20	codebase_community
SELECT Location FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Title = 'Eliciting priors from experts');	codebase_community
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = "bayesian");	codebase_community
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = (SELECT TagName FROM tags GROUP BY TagName ORDER BY Count DESC LIMIT 1));	codebase_community
SELECT COUNT(*) FROM badges b, users u WHERE b.UserId = u.Id AND u.DisplayName = 'csgillespie'	codebase_community
SELECT Name FROM badges b, users u WHERE b.UserId = u.Id AND u.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011	codebase_community
SELECTDisplayName FROM users WHERE Id IN (  SELECT UserId  FROM badges  GROUP BY UserId  ORDER BY COUNT(Id) DESC  LIMIT 1 );	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = "csgillespie"	codebase_community
SELECT AVG(Count(Id)) FROM badges, users WHERE badges.UserId = users.Id AND users.Views > 200	codebase_community
SELECT Divide(Count(Id), Count(Id)) * 100 FROM posts WHERE Score > 5 AND OwnerUserId IN (SELECT Id FROM users WHERE Age > 65);	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT posts.Title FROM comments JOIN posts ON comments.PostId = posts.Id WHERE comments.Score = (SELECT MAX(comments.Score) FROM comments)	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910);	codebase_community
SELECT FavoriteCount FROM posts WHERE Id IN (SELECT PostId FROM comments WHERE UserId = 3025 AND CreationDate = '2014/4/23 20:29:39.0');	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 AND CommentCount = 1	codebase_community
SELECT Id, PostTypeId, AcceptedAnswerId, CreaionDate, Score, ViewCount, Body, OwnerUserId, LastActivityDate, Title, Tags, AnswerCount, CommentCount, FavoriteCount, LastEditorUserId, LastEditDate, CommunityOwnedDate, ParentId, ClosedDate, OwnerDisplayName, LastEditorDisplayName FROM posts WHERE OwnerUserId = 23853 AND CreationDate = '2013-07-12 09:08:18.0' AND (ClosedDate IS NULL OR ClosedDate IS NOT NULL);	codebase_community
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041);	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = "Tiago Pasqualini"	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Id` = (SELECT `UserId` FROM `votes` WHERE `Id` = 6347);	codebase_community
SELECT COUNT(*) FROM votes v, posts p WHERE v.PostId = p.Id AND p.Title LIKE '%data visualization%';	codebase_community
SELECT badges.Name FROM badges, users WHERE badges.UserId = users.Id AND users.DisplayName = "DatEpicCoderGuyWhoPrograms"	codebase_community
SELECT COUNT(post.Id) / COUNT(votes.Id) FROM post JOIN votes ON post.Id = votes.PostId WHERE post.OwnerUserId = 24	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM comments WHERE Score = 17	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT Name FROM badges b, users u WHERE b.UserId = u.Id AND u.DisplayName = 'SilentGhost'	codebase_community
SELECT u.DisplayName FROM users u, comments c WHERE u.Id = c.UserId AND c.Text = 'thank you user93!'	codebase_community
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion';	codebase_community
SELECTDisplayName, Reputation FROM users u, posts p WHERE u.Id = p.OwnerUserId AND p.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT Text FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Title = 'How does gentle boosting differ from AdaBoost?');	codebase_community
SELECT DisplayName FROM users WHERE Id IN (  SELECT UserId  FROM badges  WHERE Name = 'Necromancer' ) LIMIT 10	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Title = 'Open source tools for visualizing multi-dimensional data?'	codebase_community
SELECT Title FROM posts WHERE LastEditorDisplayName = "Vebjorn Ljosa"	codebase_community
SELECT SUM(score), users.websiteurl FROM posts JOIN users ON posts.lasteditoruserid = users.id WHERE users.displayname = "Yevgeny" GROUP BY users.websiteurl;	codebase_community
SELECT * FROM comments c JOIN postHistory ph ON c.PostId = ph.PostId WHERE ph.Text LIKE '%Why square the difference instead of taking the absolute value in standard deviation?%'	codebase_community
SELECT SUM(BountyAmount) FROM posts WHERE Title LIKE '%data%';	codebase_community
SELECT DisplayName FROM users WHERE Id IN (SELECT UserId FROM votes WHERE BountyAmount = 50 AND PostId IN (SELECT Id FROM posts WHERE Title LIKE '%variance%'));	codebase_community
SELECT Title, Text, AVG(ViewCount) FROM posts JOIN postHistory ON posts.Id = postHistory.PostId JOIN tags ON posts.Tags LIKE '%' || tags.TagName || '%' WHERE tags.TagName = 'humor' GROUP BY posts.Id	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13	codebase_community
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT Id FROM users ORDER BY Views LIMIT 1	codebase_community
select count(distinct UserId) from badges where Name = 'Supporter' and year(Date) = 2011	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges GROUP BY UserId HAVING COUNT(Name) > 5	codebase_community
SELECT COUNT(DISTINCT users.Id) FROM badges, users WHERE badges.Name = 'Teacher' AND badges.UserId = users.Id AND users.Location = 'New York' AND badges.Name = 'Supporter'	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u, posts p WHERE u.Id = p.OwnerUserId AND p.Id = 1	codebase_community
SELECT Users.Id, Users.DisplayName, COUNT(PostHistory.PostId) as PostHistoryCount FROM Users JOIN PostHistory ON Users.Id = PostHistory.UserId WHERE PostHistory.PostId IN (SELECT PostId FROM Posts WHERE Views >= 1000) GROUP BY Users.Id HAVING COUNT(PostHistory.PostId) = 1;	codebase_community
SELECT Users.Id, Users.DisplayName, Badges.Name FROM Users JOIN Badges ON Users.Id = Badges.UserId JOIN Comments ON Users.Id = Comments.UserId GROUP BY Users.Id ORDER BY COUNT(Comments.Id) DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Teacher' AND u.Location = 'India'	codebase_community
SELECT Subtract(Divide(Count(Name), Count(Name)) * 100, Divide(Count(Name), Count(Name)) * 100) FROM badges WHERE Name = 'Student' AND Year(Date) = 2010	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;	codebase_community
SELECT p.Id, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = 61217	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395	codebase_community
SELECT Id, Score, OwnerUserId FROM posts WHERE Score > 60;	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND YEAR(CreationDate) = 2011	codebase_community
SELECT AVG(UpVotes), AVG(Age) FROM users WHERE Id IN (  SELECT UserId  FROM posts  GROUP BY UserId  HAVING COUNT(UserId) > 10 );	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(*) FROM comments WHERE score > 60	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10	codebase_community
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users));	codebase_community
SELECT u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT Name FROM badges b, users u WHERE b.UserId = u.Id AND u.DisplayName = "Pierre"	codebase_community
SELECT Date FROM badges, users WHERE users.Id = badges.UserId AND users.Location = 'Rochester, NY'	codebase_community
SELECT COUNT(UserId) / (SELECT COUNT(UserId) FROM badges WHERE Name = "Teacher") * 100 FROM badges WHERE Name = "Teacher";	codebase_community
SELECT COUNT(Id) / (SELECT COUNT(Id) FROM users WHERE Age BETWEEN 13 AND 18) * 100 FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Name = 'Organizer');	codebase_community
SELECT Score FROM comments WHERE CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT age FROM users u, badges b WHERE u.id = b.userid AND location = "Vienna, Austria"	codebase_community
SELECT COUNT(*) FROM users u  JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65	codebase_community
SELECT SUM(Users.Views) FROM Badges JOIN Users ON Badges.UserId = Users.Id WHERE Badges.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE Reputation = (SELECT MIN(Reputation) FROM users));	codebase_community
SELECT Name FROM badges b, users u WHERE b.UserId = u.Id AND u.DisplayName = "Sharpie"	codebase_community
SELECT COUNT(*) FROM badges b, users u WHERE b.Name = "Supporter" AND b.UserId = u.Id AND u.Age > 65	codebase_community
SELECT DisplayName FROM users WHERE Id = 30	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York'	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT Id, DisplayName, Views FROM users WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT   COUNT(Id) as count_2010,  (SELECT COUNT(Id) FROM votes WHERE YEAR(CreationDate) = 2011) as count_2011 FROM votes WHERE YEAR(CreationDate) = 2010	codebase_community
SELECT T1.TagName FROM tags AS T1 JOIN users AS T2 ON T1.Id = T2.Id WHERE T2.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(*) FROM users u, posts p WHERE u.DisplayName = 'Daniel Vassallo' AND u.Id = p.OwnerUserId;	codebase_community
SELECT COUNT(*) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT Id FROM posts WHERE DisplayName ='slashnick' AND AnswerCount = (SELECT MAX(AnswerCount) FROM posts WHERE DisplayName ='slashnick');	codebase_community
SELECT Id, MAX(SUM(ViewCount)) FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' OR OwnerDisplayName = 'Noah Snyder' GROUP BY Id ORDER BY MAX(SUM(ViewCount)) DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM posts WHERE ParentId = 1 AND OwnerDisplayName = 'Matt Parker' AND Id IN (  SELECT PostId  FROM votes  WHERE PostId > 4 );	codebase_community
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 0	codebase_community
SELECT Tags FROM Posts WHERE OwnerDisplayName = 'Mark Meckes' AND CommentCount = 0;	codebase_community
SELECT DisplayName FROM users WHERE Id IN (  SELECT UserId  FROM badges  WHERE Name = 'Organizer' );	codebase_community
SELECT  ROUND(     CAST(         COUNT(             p.Id         ) AS NUMERIC     ) /     (         SELECT             COUNT(                 p.Id             )         FROM             posts p         WHERE             p.OwnerDisplayName = 'Community'     ) * 100,     2 ) AS percentage FROM     posts p WHERE     p.Tags LIKE '%r%';	codebase_community
SELECT (SELECT SUM(ViewCount) FROM posts WHERE DisplayName = 'Mornington') - (SELECT SUM(ViewCount) FROM posts WHERE DisplayName = 'Amos');	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges JOIN comments ON badges.UserId = comments.UserId WHERE badges.Name = 'Commentator' AND year(comments.CreationDate) = 2014	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' and '2012-07-21 23:59:59';	codebase_community
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM comments WHERE Score < 0 AND UserId = 13	codebase_community
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60	codebase_community
select Name from badges b, users u where b.UserId = u.Id and year(b.Date) = 2011 and u.Location like '%north pole%'	codebase_community
SELECT OwnerDisplayName, WebsiteUrl FROM posts WHERE FavoriteCount > 150	codebase_community
SELECT COUNT(*), MAX(CreationDate) FROM postHistory WHERE PostId IN (  SELECT Id  FROM posts  WHERE Title = 'What is the best introductory Bayesian statistics textbook?' );	codebase_community
SELECT LastAccessDate, Location FROM users WHERE Id IN (  SELECT UserId  FROM badges  WHERE Name = 'Outliers' );	codebase_community
SELECT T1.Title FROM posts AS T1 JOIN postLinks AS T2 ON T1.Id = T2.RelatedPostId WHERE T2.PostId = (SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time');	codebase_community
SELECT T1.PostId, T2.Name FROM postHistory AS T1 JOIN badges AS T2 ON T1.UserId = T2.UserId WHERE T1.UserDisplayName = "Samuel" AND YEAR(T1.CreationDate) = 2013 AND YEAR(T2.Date) = 2013	codebase_community
SELECT OwnerDisplayName FROM Posts WHERE Id = (SELECT Id FROM Posts ORDER BY ViewCount DESC LIMIT 1)	codebase_community
SELECT OwnerDisplayName, Location FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'hypothesis-testing'));	codebase_community
SELECT T1.Title, T2.LinkTypeId FROM posts AS T1 JOIN postLinks AS T2 ON T1.Id = T2.RelatedPostId WHERE T1.Title = 'What are principal component scores?';	codebase_community
SELECT ParentId, MAX(Score) FROM posts WHERE ParentId IS NOT NULL GROUP BY ParentId;	codebase_community
SELECTDisplayName, WebsiteUrl FROM users WHERE Id IN (  SELECT UserId  FROM votes  WHERE VoteTypeId = 8  GROUP BY UserId  ORDER BY MAX(BountyAmount) DESC  LIMIT 1 );	codebase_community
SELECT Title FROM posts WHERE Id IN (SELECT PostId FROM votes WHERE VoteTypeId = 2) ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT Age FROM users WHERE Id = (SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users));	codebase_community
SELECT COUNT(*) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(p.CreationDate) = 2011 AND v.BountyAmount = 50	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%';	codebase_community
SELECT AVG(links) FROM (  SELECT COUNT(Id) as links  FROM postLinks  WHERE YEAR(CreationDate) = 2010 AND AnswerCount <= 2  GROUP BY strftime('%m', CreationDate) );	codebase_community
SELECT Id FROM posts WHERE Id IN (SELECT PostId FROM votes WHERE UserId = 1465) ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT Title FROM posts WHERE Id IN (SELECT MIN(PostId) FROM postLinks);	codebase_community
SELECT DisplayName FROM users u WHERE u.Id = (SELECT UserId FROM badges b GROUP BY UserId ORDER BY COUNT(Name) DESC LIMIT 1)	codebase_community
SELECT MIN(CreationDate) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl';	codebase_community
SELECT MIN(CreationDate) FROM users u, posts p WHERE u.Id = p.OwnerUserId AND u.Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Autobiographer' ORDER BY b.Date LIMIT 1	codebase_community
SELECT COUNT(*) FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount >= 4 AND u.Location = 'United Kingdom'	codebase_community
SELECT AVG(PostId) FROM votes WHERE Age = (SELECT MAX(Age) FROM users);	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Jay Stevens' AND YEAR(CreationDate) = 2010;	codebase_community
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'Stephen Turner';	codebase_community
SELECT DISTINCT OwnerDisplayName FROM posts WHERE ViewCount > 20000 AND YEAR(CreationDate) = 2011;	codebase_community
SELECT Id, OwnerDisplayName FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts WHERE year(CreationDate) = 2010)	codebase_community
SELECT  ROUND(     (         SELECT COUNT(Id)          FROM posts         WHERE YEAR(CreationDate) = 2011         AND OwnerUserId IN (             SELECT Id             FROM users             WHERE Reputation > 1000         )     ) / COUNT(Id) * 100,     2 ) AS percentage	codebase_community
SELECT  DIV(     (SELECT COUNT(Id) FROM users WHERE Age BETWEEN 13 and 18),     (SELECT COUNT(Id) FROM users) ) as percentage;	codebase_community
SELECT SUM(ViewCount), LastEditorDisplayName FROM posts WHERE Text = 'Computer Game Datasets';	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Score = (SELECT MAX(Score) FROM posts));	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0	codebase_community
SELECT LastEditorDisplayName, Location FROM users u JOIN postHistory ph ON u.Id = ph.UserId WHERE ph.PostId = 183 ORDER BY ph.LastEditDate DESC LIMIT 1;	codebase_community
SELECT Name FROM badges WHERE Date = (SELECT MAX(Date) FROM badges WHERE UserDisplayName = 'Emmett');	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT SUBTRACT(Date, CreationDate) FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'Zolomon';	codebase_community
SELECT COUNT(Id) as post_count FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE CreationDate = (SELECT MAX(CreationDate) FROM users));  SELECT COUNT(Id) as comment_count FROM comments WHERE UserId = (SELECT Id FROM users WHERE CreationDate = (SELECT MAX(CreationDate) FROM users));	codebase_community
SELECT Text, UserDisplayName FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Title = 'Analysing wind data with R') ORDER BY CreationDate DESC LIMIT 10	codebase_community
SELECT COUNT(DISTINCT users.Id) FROM badges, users WHERE badges.Name = 'Citizen Patrol' AND badges.UserId = users.Id	codebase_community
SELECT COUNT(*) FROM posts p, postTags pt WHERE p.Id = pt.PostId AND pt.TagId = (SELECT Id FROM tags WHERE TagName = 'careers');	codebase_community
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT SUM(CommentCount), SUM(AnswerCount) FROM posts WHERE Title = 'Clustering 1D data';	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM posts WHERE BountyAmount >= 30	codebase_community
SELECT  (  SELECT COUNT(Id)  FROM stats_posts  WHERE Score > 50 AND OwnerUserId = (   SELECT Id   FROM stats_users   ORDER BY Reputation DESC   LIMIT 1  ) ) / (  SELECT COUNT(Id)  FROM stats_posts  WHERE OwnerUserId = (   SELECT Id   FROM stats_users   ORDER BY Reputation DESC   LIMIT 1  ) ) * 100 AS percentage;	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName ='sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT Text FROM comments c, posts p WHERE p.Id = c.PostId AND p.Title LIKE '%linear regression%'	codebase_community
SELECT Id, PostId, Score, Text, CreationDate, UserId, UserDisplayName FROM comments WHERE PostId IN (  SELECT Id  FROM posts  WHERE ViewCount BETWEEN 100 AND 150 ) ORDER BY Score DESC LIMIT 1	codebase_community
SELECT CreationDate, DATEDIFF(Now(), CreationDate) AS Age FROM users WHERE Id IN (SELECT UserId FROM comments WHERE Text LIKE '%http://%')	codebase_community
SELECT COUNT(*) FROM comments c, posts p WHERE c.Score = 0 AND c.PostId = p.Id AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CommentCount = 1) AND Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40	codebase_community
SELECT T1.Id, T2.Text FROM posts AS T1 JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT SUM(UpVotes) FROM users u, comments c WHERE u.Id = c.UserId AND c.Text = 'R is also lazy evaluated.'	codebase_community
SELECT Text FROM comments JOIN users ON users.Id = comments.UserId WHERE users.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT UserDisplayName FROM comments WHERE Score BETWEEN 1 AND 5 AND Id IN (  SELECT Id  FROM votes  WHERE VoteTypeId = 3  AND Id IN (   SELECT Id   FROM users   WHERE DownVotes = 0  ) );	codebase_community
SELECT  Divide(  (   SELECT COUNT(UserId)   FROM users   WHERE UpVotes = 0   AND Id IN (    SELECT UserId    FROM comments    WHERE Score BETWEEN 5 AND 10   )  )  * 100,  (   SELECT COUNT(UserId)   FROM comments   WHERE Score BETWEEN 5 AND 10  ) )	codebase_community
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = '3-D Man';	superhero
SELECT COUNT(*) FROM hero_power JOIN superpower ON superpower.id = hero_power.power_id WHERE superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero WHERE id IN (     SELECT hero_id     FROM hero_power     WHERE power_id = (         SELECT id         FROM superpower         WHERE power_name = 'Super Strength'     ) ) AND height_cm > 200;	superhero
SELECT full_name FROM superhero GROUP BY full_name HAVING COUNT(full_name) > 15	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';	superhero
SELECT colour.colour FROM colour JOIN superhero ON superhero.skin_colour_id = colour.id WHERE superhero.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility';	superhero
SELECT superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' AND superhero.hair_colour_id = colour.id AND colour.colour = 'Blond';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name, height_cm FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC;	superhero
SELECT publisher_name FROM publisher WHERE id = (SELECT publisher_id FROM superhero WHERE superhero_name = 'Sauron');	superhero
SELECT superhero.superhero_name, superhero.eye_colour_id, COUNT(superhero.id) AS count FROM superhero WHERE superhero.publisher_id = 4 GROUP BY superhero.eye_colour_id ORDER BY count DESC;	superhero
SELECT AVG(height_cm) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' AND superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT publisher_name FROM publisher JOIN superhero ON superhero.publisher_id = publisher.id JOIN hero_attribute ON hero_attribute.hero_id = superhero.id WHERE attribute_name = 'Speed' AND attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute WHERE attribute_name = 'Speed');	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics'	superhero
SELECT publisher.publisher_name FROM publisher JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero WHERE hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond');	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE attribute_name = 'Intelligence' ORDER BY attribute_value ASC LIMIT 1;	superhero
SELECT race FROM superhero WHERE superhero_name = 'Copycat';	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch'	superhero
SELECT COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100	superhero
SELECT superhero_name FROM superhero GROUP BY superhero_name ORDER BY COUNT(superhero_name) DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT  publisher_name,  ROUND(   MULTIPLY(    DIVIDE(     SUM(alignment = 'Bad'),     COUNT(id)    ),    100   )  ) AS percentage FROM  superhero  JOIN publisher ON superhero.publisher_id = publisher.id WHERE  publisher_name = 'Marvel Comics';	superhero
SELECT  SUBTRACT(   (    SELECT     COUNT(*)    FROM     superhero    WHERE     publisher_id = 4   ),   (    SELECT     COUNT(*)    FROM     superhero    WHERE     publisher_id = 3   )  ) AS  difference;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT colour.colour FROM colour JOIN superhero ON superhero.eye_colour_id = colour.id WHERE superhero.id = 75	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = 2;	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.gender_id = 1 LIMIT 5;	superhero
SELECT superhero_name FROM superhero WHERE race_id = 2;	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour');	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_power.hero_id = 56	superhero
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;	superhero
SELECT race FROM superhero WHERE weight_kg = 169	superhero
SELECT colour.colour FROM colour JOIN superhero ON superhero.hair_colour_id = colour.id JOIN race ON superhero.race_id = race.id WHERE superhero.height_cm = 185 AND race.race = 'human';	superhero
SELECT colour FROM colour WHERE id = (SELECT eye_colour_id             FROM superhero             WHERE weight_kg = (SELECT MAX(weight_kg) FROM superhero));	superhero
SELECT MULTIPLY(DIVIDE(SUM(publisher.id = 13)), COUNT(publisher.id), 100) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.height_cm BETWEEN 150 AND 180	superhero
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id GROUP BY superpower.power_name ORDER BY COUNT(superpower.power_name) DESC LIMIT 1	superhero
SELECT attribute_value FROM hero_attribute WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Abomination');	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_power.hero_id = 1	superhero
SELECT COUNT(*) FROM superpower WHERE power_name ='stealth';	superhero
SELECT full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE attribute_name ='strength' ORDER BY attribute_value DESC LIMIT 1	superhero
SELECT AVG(superhero.id) FROM superhero WHERE skin_colour_id = 1;	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON attribute.id = hero_attribute.attribute_id JOIN publisher ON publisher.id = superhero.publisher_id WHERE attribute.attribute_name = 'durability' AND hero_attribute.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_name = 'durability') AND publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT colour.colour FROM colour JOIN superhero ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Abraham Sapien';	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight';	superhero
SELECT eye_colour_id, hair_colour_id, skin_colour_id FROM superhero WHERE gender_id = 2 AND publisher_id = 3;	superhero
SELECT superhero_name, publisher_name FROM superhero WHERE hair_colour_id = skin_colour_id AND hair_colour_id = eye_colour_id;	superhero
SELECT race FROM superhero WHERE superhero_name = 'A-Bomb';	superhero
SELECT COUNT(superhero.id) / COUNT(DISTINCT superhero.gender_id) * 100 FROM superhero WHERE superhero.gender_id = 2 AND superhero.skin_colour_id = 5	superhero
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT gender.gender FROM gender JOIN superhero ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13';	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Adaptation';	superhero
SELECT COUNT(*) FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Amazo');	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.full_name = 'Hunter Zolomon';	superhero
SELECT height_cm FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Amber';	superhero
SELECT superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN colour AS colour_1 ON superhero.hair_colour_id = colour_1.id WHERE colour.colour = 'Black' AND colour_1.colour = 'Black';	superhero
SELECT colour.colour FROM colour WHERE skin_colour_id = colour.id AND colour.colour = 'Gold';	superhero
SELECT full_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire';	superhero
SELECT superhero_name FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT COUNT(*) FROM superhero WHERE id IN (SELECT hero_id FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength') AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')));	superhero
SELECT race.race, alignment.alignment FROM superhero JOIN race ON superhero.race_id = race.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Cameron Hicks';	superhero
SELECT COUNT(gender_id = 2 AND publisher_id = 4) / COUNT(publisher_id = 4) * 100 AS percent_of_female_heroes_published_by_marvel_comics;	superhero
SELECT AVG(weight_kg) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler');	superhero
SELECT superhero_name, AVG(height_cm) FROM superhero GROUP BY superhero_name;	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE attribute_name = 'Speed' AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_name = 'Speed');	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT attribute_name, attribute_value FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero_name = '3-D Man';	superhero
SELECT superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN colour AS colour_1 ON superhero.hair_colour_id = colour_1.id WHERE colour.colour = 'Blue' AND colour_1.colour = 'Brown';	superhero
SELECT publisher_name FROM publisher JOIN superhero ON superhero.publisher_id = publisher.id WHERE superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT COUNT(superhero.id) / (SELECT COUNT(id) FROM superhero) * 100.0 FROM superhero WHERE superhero.eye_colour_id = 7	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE gender_id = 1) / (SELECT COUNT(*) FROM superhero WHERE gender_id = 2)	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis'	superhero
SELECT superhero_name FROM superhero WHERE id = 294	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg = NULL;	superhero
SELECT colour.colour FROM colour JOIN superhero ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Karen Beecher-Duncan';	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.full_name = 'Helen Parr';	superhero
SELECT race FROM superhero WHERE weight_kg = 108 AND height_cm = 188;	superhero
SELECT publisher.publisher_name FROM publisher JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.id = 38	superhero
SELECT race FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)	superhero
SELECT alignment.alignment, superpower.power_name FROM alignment, superhero, superpower, hero_power WHERE superhero.alignment_id = alignment.id AND superhero.id = hero_power.hero_id AND superpower.id = hero_power.power_id AND superhero.superhero_name = 'Atom IV';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';	superhero
SELECT AVG(attribute_value) FROM hero_attribute WHERE hero_id IN (  SELECT id  FROM superhero  WHERE alignment_id = 3 );	superhero
SELECT colour.colour FROM colour JOIN superhero ON superhero.skin_colour_id = colour.id JOIN hero_attribute ON hero_attribute.hero_id = superhero.id JOIN attribute ON attribute.id = hero_attribute.attribute_id WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value = 100	superhero
SELECT COUNT(*) FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN gender ON superhero.gender_id = gender.id WHERE alignment.id = 1 AND gender.id = 2	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_value BETWEEN 75 AND 80;	superhero
SELECT race.race FROM race JOIN superhero ON race.id = superhero.race_id JOIN colour ON superhero.hair_colour_id = colour.id JOIN gender ON superhero.gender_id = gender.id WHERE colour.colour = 'blue' AND gender.gender ='male';	superhero
SELECT   (     (       SELECT         COUNT(*)       FROM         superhero       WHERE         alignment_id = 2     ) - (       SELECT         COUNT(*)       FROM         superhero       WHERE         alignment_id = 2         AND gender_id = 2     )   ) / (     SELECT       COUNT(*)     FROM       superhero     WHERE       alignment_id = 2   ) * 100.0 AS percentage FROM   superhero	superhero
SELECT  (   SELECT    COUNT(*)   FROM    colour   WHERE    colour.id = 7  ) - (   SELECT    COUNT(*)   FROM    colour   WHERE    colour.id = 1  ) FROM  superhero WHERE  (   weight_kg = 0   OR   weight_kg IS NULL  )	superhero
SELECT attribute_value FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Strength' AND superhero.superhero_name = 'Hulk';	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = 'Ajax'	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Green' AND superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND publisher_id = 3;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero_name;	superhero
SELECT gender_id FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON superpower.id = hero_power.power_id WHERE superpower.power_name = 'Phoenix Force';	superhero
SELECT superhero_name, MAX(weight_kg) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') GROUP BY superhero_name;	superhero
SELECT AVG(height_cm) FROM superhero WHERE race_id <> 1 AND publisher_id = 3	superhero
SELECT COUNT(*) FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value = 100 AND hero_attribute.attribute_id = 3;	superhero
SELECT  publisher_name,  COUNT(*) FROM  publisher  JOIN superhero ON publisher.id = superhero.publisher_id GROUP BY  publisher_name HAVING  publisher_name = 'DC Comics' OR publisher_name = 'Marvel Comics' ;	superhero
SELECT attribute.attribute_name FROM attribute JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id JOIN superhero ON superhero.id = hero_attribute.hero_id WHERE superhero.superhero_name = 'Black Panther' ORDER BY hero_attribute.attribute_value ASC LIMIT 1	superhero
SELECT colour.colour FROM colour WHERE (SELECT superhero.eye_colour_id        FROM superhero        WHERE superhero.superhero_name = 'Abomination') = colour.id	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT   (     (       SELECT         COUNT(*)       FROM         superhero       WHERE         gender_id = 2         AND publisher_id = 5     )     /     (       SELECT         COUNT(*)       FROM         superhero       WHERE         publisher_id = 5     )   )   * 100.0 AS   percentage_of_female_superheroes_created_by_george_lucas;	superhero
SELECT  MULTIPLY(   DIVIDE(    SUM(alignment = 'Good' WHERE publisher_name = 'Marvel Comics'),    COUNT(publisher_name = 'Marvel Comics')   ),   100.0  ) FROM superhero WHERE publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id FROM hero_attribute GROUP BY hero_id ORDER BY MIN(attribute_value) LIMIT 1	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.weight_kg < 100 AND colour.colour = 'Brown';	superhero
SELECT attribute_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Aquababy';	superhero
SELECT weight_kg, race FROM superhero WHERE id = 40	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = 3;	superhero
SELECT hero_id FROM hero_power JOIN superpower ON superpower.id = hero_power.power_id WHERE superpower.power_name = 'Intelligence';	superhero
SELECT colour.colour FROM colour INNER JOIN superhero ON eye_colour_id = colour.id WHERE superhero_name = 'Blackwulf';	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT driverRef FROM drivers WHERE driverId IN (  SELECT driverId  FROM qualifying  WHERE raceId = 20  AND q1 = (   SELECT MAX(q1)   FROM qualifying   WHERE raceId = 20  ) );	formula_1
SELECT surname FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 19 AND T2.lap = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19)	formula_1
SELECT DISTINCT T1.year FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.name = 'Shanghai'	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE country = 'Germany';	formula_1
SELECT position FROM circuits c, constructors con WHERE con.name = 'Renault' AND con.constructorId = c.circuitId	formula_1
SELECT COUNT(*) FROM races WHERE year = 2010 AND circuitId NOT IN (SELECT circuitId FROM circuits WHERE country IN ('Japan', 'South Korea', 'Australia', 'Russia', 'Mexico', 'Brazil', 'Canada', 'United States', 'United Kingdom', 'France', 'Spain', 'Italy', 'Germany'))	formula_1
SELECT name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Spain';	formula_1
SELECT circuits.lat, circuits.lng FROM circuits, races WHERE circuits.circuitId = races.circuitId AND races.name = 'Australian Grand Prix'	formula_1
SELECT url FROM circuits WHERE circuitRef ='sepang';	formula_1
SELECT time FROM races WHERE circuitId = 2;	formula_1
SELECT circuits.lat, circuits.lng FROM circuits, races WHERE circuits.circuitId = races.circuitId AND races.name = 'Abu Dhabi Grand Prix'	formula_1
SELECT constructors.nationality FROM constructors, constructorResults WHERE constructors.constructorId = constructorResults.constructorId AND constructorResults.raceId = 24 AND constructorResults.points = 1	formula_1
SELECT q1 FROM qualifying JOIN drivers ON drivers.driverId = qualifying.driverId WHERE raceId = 354 AND forename = "Bruno" AND surname = "Senna"	formula_1
SELECT drivers.nationality FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.q2 = '0:01:40' AND qualifying.qualifyId = 355	formula_1
SELECT number FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 903 AND T2.q3 LIKE '0:01:54%';	formula_1
SELECT COUNT(driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Bahrain Grand Prix' AND year = 2007) AND time IS NULL;	formula_1
SELECT url FROM seasons WHERE year = (SELECT year FROM races WHERE raceId = 901);	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29');	formula_1
SELECT drivers.forename, drivers.surname, drivers.dob FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.raceId = 592 AND results.time IS NOT NULL ORDER BY drivers.dob DESC LIMIT 1	formula_1
SELECT url FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 161 AND T2.lapTime.time LIKE '0:01:27%';	formula_1
SELECT drivers.forename, drivers.surname, constructors.name FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN constructors ON constructors.constructorId = results.constructorId WHERE results.raceId = 933 AND results.fastestLapSpeed = (SELECT MAX(results.fastestLapSpeed) FROM results WHERE results.raceId = 933);	formula_1
SELECT circuits.lat, circuits.lng FROM circuits, races WHERE circuits.circuitId = races.circuitId AND races.name = 'Malaysian Grand Prix'	formula_1
SELECT constructors.url FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId WHERE constructorResults.raceId = 9 AND constructorResults.points = (SELECT MAX(points) FROM constructorResults WHERE raceId = 9)	formula_1
SELECT q1 FROM qualifying WHERE driverId = 13 AND raceId = 345	formula_1
SELECT nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 347 AND T2.q2 = '0:01:15';	formula_1
SELECT code FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 45 AND T2.q3 LIKE '1:33%';	formula_1
SELECT time FROM results WHERE driverId = 1 AND raceId = 743	formula_1
SELECT drivers.forename, drivers.surname FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE results.raceId = 10 AND results.position = 2 AND results.year = 2006	formula_1
SELECT url FROM seasons, races WHERE races.raceId = 901 AND races.year = seasons.year	formula_1
SELECT COUNT(DISTINCT driverId) FROM lapTimes WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NULL;	formula_1
SELECT * FROM drivers WHERE driverId IN (SELECT driverId FROM results WHERE raceId = 872 AND time IS NOT NULL) AND dob = (SELECT MAX(dob) FROM drivers WHERE driverId IN (SELECT driverId FROM results WHERE raceId = 872 AND time IS NOT NULL));	formula_1
SELECT drivers.forename, drivers.surname FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE lapTimes.raceId = 348 AND lapTimes.time = (SELECT MIN(time) FROM lapTimes WHERE raceId = 348);	formula_1
SELECT nationality FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM lapTimes);	formula_1
SELECT  (  (   (    SELECT      fastestLapSpeed    FROM      lapTimes    WHERE      raceId = 853   )   -   (    SELECT      fastestLapSpeed    FROM      lapTimes    WHERE      raceId = 854   )  )  /  (   SELECT     fastestLapSpeed   FROM     lapTimes   WHERE     raceId = 853  ) ) * 100	formula_1
SELECT driverid, COUNT(driverid) AS count,  CASE  WHEN time IS NOT NULL THEN 1  ELSE 0 END AS has_time, (1 - (COUNT(driverid) / (CASE  WHEN time IS NOT NULL THEN 1  ELSE 0 END))) AS percentage FROM results WHERE date = '1983-07-16' GROUP BY driverid	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT name FROM races WHERE year = 2005 ORDER BY date DESC	formula_1
SELECT name FROM races WHERE year = year(min(date)) AND month = month(min(date));	formula_1
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999);	formula_1
SELECT year FROM races GROUP BY year ORDER BY COUNT(round) DESC LIMIT 1	formula_1
SELECT * FROM races WHERE year = 2017 AND circuitId NOT IN (SELECT circuitId FROM races WHERE year = 2000);	formula_1
SELECT name, location FROM circuits WHERE circuitId = (SELECT circuitId FROM races WHERE year = (SELECT MIN(year) FROM seasons WHERE year > 1990));	formula_1
SELECT MAX(year) FROM races WHERE circuitId = 1;	formula_1
SELECT COUNT(DISTINCT year) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE name = 'British Grand Prix' AND country = 'United Kingdom';	formula_1
SELECT drivers.forename, drivers.surname, driverStandings.position FROM drivers JOIN driverStandings ON drivers.driverId = driverStandings.driverId WHERE driverStandings.raceId = 18 ORDER BY driverStandings.position;	formula_1
SELECT drivers.forename, drivers.surname, max(results.points) FROM drivers JOIN results ON drivers.driverId = results.driverId GROUP BY drivers.driverId	formula_1
SELECT drivers.forename, drivers.surname, constructorResults.points FROM drivers JOIN constructorResults ON drivers.driverId = constructorResults.driverId WHERE raceId = 3 ORDER BY points DESC LIMIT 3;	formula_1
SELECT drivers.forename, drivers.surname, races.name FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT AVG(milliseconds) FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix'	formula_1
SELECT 100.0 * (SELECT COUNT(raceId) FROM results WHERE surname = 'Hamilton' AND position > 1 AND year >= 2010) / (SELECT COUNT(raceId) FROM results WHERE surname = 'Hamilton' AND year >= 2010);	formula_1
SELECT drivers.forename, drivers.surname, drivers.nationality, MAX(points) FROM drivers JOIN constructorStandings ON drivers.driverId = constructorStandings.driverId GROUP BY drivers.driverId ORDER BY MAX(points) DESC LIMIT 1	formula_1
SELECT drivers.forename, drivers.surname, drivers.dob, drivers.nationality, drivers.driverId, drivers.code, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality, drivers.url, drivers.driverRef, drivers.number, drivers.dob, drivers.nationality,	formula_1
SELECT circuitId, circuitRef, name, location, country, lat, lng, alt, url FROM circuits WHERE circuitId IN (  SELECT circuitId  FROM races  WHERE year BETWEEN 1990 AND 2000  GROUP BY circuitId  HAVING COUNT(raceId) = 4 );	formula_1
SELECT circuits.name, circuits.location, races.name FROM circuits, races WHERE races.circuitId = circuits.circuitId AND races.year = 2006 AND circuits.country = 'USA';	formula_1
SELECT races.name, circuits.name, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE MONTH(races.date) = 9 AND YEAR(races.date) = 2005;	formula_1
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = "Alex" AND drivers.surname = "Yoong" AND results.position < 20	formula_1
select count(*) from results r inner join drivers d on r.driverId = d.driverId where d.forename = "Michael" and d.surname = "Schumacher" and r.raceId in (select raceId from races where circuitId = 2 and max(points) = points)	formula_1
SELECT races.name, races.year FROM lapTimes JOIN races ON races.raceId = lapTimes.raceId JOIN drivers ON drivers.driverId = lapTimes.driverId WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' AND lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT AVG(points) FROM results WHERE driverId = 1 AND year = 2000	formula_1
SELECT races.name, constructorResults.points FROM races JOIN constructorResults ON races.raceId = constructorResults.raceId JOIN drivers ON races.raceId = drivers.raceId WHERE drivers.forename = "Lewis" AND drivers.surname = "Hamilton" AND races.year = (SELECT MIN(year) FROM races)	formula_1
SELECT races.name, circuits.country, races.date FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2017 ORDER BY races.date;	formula_1
SELECT races.name, races.year, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.laps = (SELECT MAX(laps) FROM races)	formula_1
SELECT (SELECT COUNT(races.raceId) FROM races, circuits WHERE races.circuitId = circuits.circuitId AND circuits.country = 'Germany' AND races.name = 'European Grand Prix') / (SELECT COUNT(races.raceId) FROM races WHERE races.name = 'European Grand Prix') * 100	formula_1
SELECT circuits.lat, circuits.lng FROM circuits WHERE circuits.name = 'Silverstone Circuit'	formula_1
SELECT circuitId, name, max(lat) as max_lat FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') GROUP BY circuitId, name	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT country FROM circuits WHERE alt = (SELECT max(alt) FROM circuits);	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT drivers.nationality FROM drivers ORDER BY drivers.dob DESC LIMIT 1	formula_1
SELECT surname FROM drivers WHERE nationality = 'italian'	formula_1
SELECT url FROM drivers WHERE surname = 'Davidson'	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT name FROM circuits WHERE circuitId = (SELECT circuitId FROM races WHERE year = 2009 AND name = 'Spanish Grand Prix');	formula_1
SELECT DISTINCT year FROM races, circuits WHERE races.circuitId = circuits.circuitId AND name = 'Silverstone'	formula_1
SELECT * FROM races WHERE circuitId = 1;	formula_1
SELECT date, time FROM races WHERE year = 2010 AND circuitId = 1;	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Italy';	formula_1
SELECT date FROM races WHERE circuitId = 4;	formula_1
SELECT url FROM circuits c, races r WHERE c.circuitId = r.circuitId AND r.name = "Spanish Grand Prix" AND r.year = 2009	formula_1
SELECT MIN(fastestLapTime) FROM results WHERE driverId = 1	formula_1
SELECT drivers.forename, drivers.surname FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT drivers.driverRef FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON races.raceId = results.raceId WHERE races.name = 'Canadian Grand Prix' AND results.position = 1 AND races.year = 2007	formula_1
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY results.rank ASC LIMIT 1	formula_1
SELECT MAX(results.fastestLapSpeed) FROM results, races WHERE results.raceId = races.raceId AND races.name = 'Spanish Grand Prix'	formula_1
SELECT DISTINCT year FROM races JOIN drivers ON races.raceId = drivers.raceId WHERE drivers.driverRef = 'hamilton'	formula_1
SELECT results.positionOrder FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Chinese Grand Prix'	formula_1
SELECT forename, surname FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.grid = 4 AND races.year = 1989 AND races.name = 'Australian Grand Prix'	formula_1
SELECT COUNT(driverId) FROM results WHERE raceId = 1 AND time IS NOT NULL	formula_1
SELECT lap, time, milliseconds FROM lapTimes WHERE driverId = 1 AND raceId = 1;	formula_1
SELECT results.time FROM results, races WHERE results.raceId = races.raceId AND races.name = 'Chinese Grand Prix' AND results.rank = 2 AND races.year = 2008	formula_1
SELECT drivers.forename, drivers.surname, races.url FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE races.name = 'Australian Grand Prix' AND races.year = 2008 GROUP BY races.raceId HAVING results.position = 1	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND raceId = 1;	formula_1
SELECT COUNT(raceId) FROM results WHERE time IS NOT NULL AND raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Chinese Grand Prix');	formula_1
SELECT SUM(points) FROM results WHERE driverId = 1	formula_1
SELECT AVG(strToSeconds(fastestLapTime)) FROM results WHERE driverId = 1 AND statusId = 1	formula_1
SELECT COUNT(raceId) / (SELECT COUNT(raceId) FROM races WHERE year = 2008 AND circuitId = 1) FROM results WHERE time IS NOT NULL;	formula_1
select round(cast(cast(time as time) as float) / cast(cast(time as time) as float) * 100, 2) as faster_in_percentage from results where raceId = 1 and position = 1 and milliseconds is not null union select round(cast(cast(time as time) as float) / cast(cast(time as time) as float) * 100, 2) as faster_in_percentage from results where raceId = 1 and position = 5 and milliseconds is not null	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = "British" AND dob > "1980-01-01";	formula_1
SELECT MAX(points) FROM constructorResults WHERE constructorId IN (SELECT constructorId FROM constructors WHERE nationality = 'British');	formula_1
SELECT constructorId, SUM(points) as total_points FROM constructorResults GROUP BY constructorId ORDER BY total_points DESC LIMIT 1	formula_1
SELECT name FROM constructors c WHERE NOT EXISTS (SELECT * FROM constructorResults cr WHERE cr.raceId = 291 AND cr.constructorId = c.constructorId AND cr.points = 0);	formula_1
SELECT COUNT(raceId) FROM constructors WHERE nationality = 'Japanese' AND points = 0 GROUP BY raceId HAVING COUNT(raceId) = 2	formula_1
SELECT constructorId, constructorRef, name, nationality, url FROM constructors WHERE constructorId IN (  SELECT constructorId  FROM results  WHERE rank = 1 );	formula_1
SELECT COUNT(*) FROM constructors c JOIN results r ON c.constructorId = r.constructorId WHERE r.laps > 50 AND c.nationality = 'French';	formula_1
SELECT   COUNT(driverId) / (SELECT COUNT(driverId) FROM drivers WHERE nationality = 'Japanese') * 100 FROM   results WHERE   results.time IS NOT NULL   AND year BETWEEN 2007 AND 2009	formula_1
SELECT AVG(time), year FROM results WHERE time IS NOT NULL AND year < 1975 GROUP BY year;	formula_1
SELECT forename, surname FROM drivers WHERE year(dob) > 1975 AND rank = 2;	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "Italian" AND T2.time IS NULL	formula_1
SELECT drivers.forename, drivers.surname FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT fastestLap FROM results WHERE year = 2009 AND position = 1	formula_1
SELECT avg(fastestLapSpeed) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Spanish Grand Prix');	formula_1
SELECT name, year FROM races WHERE milliseconds = (SELECT MIN(milliseconds) FROM races WHERE milliseconds IS NOT NULL);	formula_1
SELECT Divide(COUNT(driverId where year (dob) <1985 and laps >50),COUNT(DriverID where year between 2000 and 2005) *100	formula_1
SELECT COUNT(*) FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE drivers.nationality = 'French' AND lapTimes.milliseconds < 120000;	formula_1
SELECT code FROM drivers WHERE nationality = 'America';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;	formula_1
SELECT code FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers)  SELECT COUNT(*) FROM drivers WHERE nationality = 'Netherlands'	formula_1
SELECT driverRef FROM drivers WHERE surname = 'Kubica'	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND year(dob) = 1980;	formula_1
SELECT drivers.forename, drivers.surname, MIN(lapTimes.time) FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE drivers.nationality = 'German' AND year(drivers.dob) BETWEEN 1980 AND 1990 GROUP BY drivers.driverId ORDER BY MIN(lapTimes.time) LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob LIMIT 1;	formula_1
SELECT driverId, code FROM drivers WHERE year(dob) = 1971 AND driverId IN (SELECT driverId FROM lapTimes WHERE fastestLapTime IS NOT NULL);	formula_1
SELECT drivers.forename, drivers.surname, lapTimes.time FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE drivers.nationality = 'Spanish' AND year(drivers.dob) < 1982 GROUP BY drivers.driverId ORDER BY lapTimes.time DESC LIMIT 10	formula_1
SELECT year FROM lapTimes WHERE fastestLapTime!= "00:00:00" GROUP BY year ORDER BY fastestLapTime LIMIT 1	formula_1
SELECT year, MAX(milliseconds) FROM lapTimes GROUP BY year;	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY milliseconds LIMIT 5	formula_1
SELECT COUNT(*) FROM results WHERE statusId = 2 AND time IS NOT NULL AND raceId > 50 AND raceId < 100;	formula_1
SELECT COUNT(*), location, lat, lng FROM circuits WHERE country = 'Austria' GROUP BY circuitId;	formula_1
SELECT raceId, COUNT(time) FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(time) DESC LIMIT 1	formula_1
SELECT drivers.driverRef, drivers.nationality, drivers.dob FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.raceId = 23 AND qualifying.q2 IS NOT NULL	formula_1
SELECT MIN(races.date), drivers.forename, drivers.surname, seasons.year FROM drivers JOIN races ON drivers.driverId = races.driverId JOIN seasons ON races.year = seasons.year WHERE drivers.dob = (SELECT MAX(drivers.dob) FROM drivers) AND races.raceId = (SELECT MIN(races.raceId) FROM races) GROUP BY drivers.driverId ORDER BY drivers.dob;	formula_1
SELECT COUNT(driverId) FROM results WHERE statusId = (SELECT statusId FROM status WHERE status = 'Puncture') AND nationality = 'American';	formula_1
SELECT constructors.url FROM constructors, constructorStandings WHERE constructors.constructorId = constructorStandings.constructorId AND constructors.nationality = "Italian" ORDER BY constructorStandings.points DESC LIMIT 1	formula_1
SELECT url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId GROUP BY c.constructorId ORDER BY SUM(cs.wins) DESC LIMIT 1	formula_1
SELECT driverId, MAX(milliseconds) FROM lapTimes WHERE raceId = 4 AND lap = 3	formula_1
SELECT raceId, MIN(milliseconds) FROM lapTimes GROUP BY raceId	formula_1
SELECT AVG(milliseconds) FROM lapTimes WHERE raceId = 10 AND position < 11	formula_1
SELECT drivers.forename, drivers.surname, AVG(pitStops.duration) as avg_duration FROM drivers JOIN pitStops ON drivers.driverId = pitStops.driverId WHERE drivers.nationality = 'German' AND 1980 < year(drivers.dob) AND year(drivers.dob) < 1985 GROUP BY drivers.driverId ORDER BY avg_duration ASC LIMIT 3;	formula_1
SELECT time FROM results WHERE raceId = 10 AND position = 1	formula_1
SELECT constructors.constructorRef, constructors.url FROM constructors, results, races WHERE constructors.constructorId = results.constructorId AND races.raceId = results.raceId AND races.name = 'Singapore Grand Prix' AND races.year = 2009 AND results.position = 1	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND year(dob) BETWEEN '1981' AND '1991';	formula_1
SELECT forename ||'' || surname as Full_name, url, dob FROM drivers WHERE nationality = 'German' AND year(dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE circuitRef = 'hungaroring';	formula_1
SELECT constructorResults.points, constructors.name, constructors.nationality FROM constructorResults JOIN constructors ON constructorResults.constructorId = constructors.constructorId JOIN races ON constructorResults.raceId = races.raceId WHERE races.name = 'Monaco Grand Prix' AND races.year BETWEEN 1980 AND 2010 ORDER BY constructorResults.points DESC LIMIT 1	formula_1
SELECT AVG(points) FROM results WHERE driverId = 1 AND raceId IN (     SELECT raceId     FROM races     WHERE circuitId = 5 );	formula_1
SELECT AVG(COUNT(*)) FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31';	formula_1
SELECT MAX(nationality) FROM drivers;	formula_1
SELECT COUNT(results.raceId) FROM results WHERE results.rank = 91 AND results.statusId = 1	formula_1
SELECT races.name FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId WHERE lapTimes.milliseconds = (     SELECT MIN(lapTimes.milliseconds)     FROM lapTimes );	formula_1
SELECT circuits.name, circuits.location, circuits.country FROM circuits, races WHERE races.circuitId = circuits.circuitId AND races.date = (SELECT MAX(date) FROM races)	formula_1
SELECT forename, surname FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE raceId = (SELECT raceId FROM races WHERE circuitId = 1 AND year = 2008) AND position = (SELECT MIN(position) FROM qualifying WHERE raceId = (SELECT raceId FROM races WHERE circuitId = 1 AND year = 2008))	formula_1
SELECT forename, surname, nationality, name FROM drivers JOIN races ON drivers.driverId = races.raceId WHERE dob = (SELECT MAX(dob) FROM drivers)	formula_1
SELECT COUNT(*) FROM results WHERE statusId = 3 AND raceId = (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix');	formula_1
SELECT forename, surname, wins FROM drivers JOIN driverStandings ON drivers.driverId = driverStandings.driverId WHERE dob = (SELECT MIN(dob) FROM drivers) AND wins > 0;	formula_1
SELECT MAX(milliseconds) FROM pitStops;	formula_1
SELECT time FROM lapTimes ORDER BY milliseconds LIMIT 1	formula_1
SELECT MAX(milliseconds) FROM pitStops WHERE driverId = 1;	formula_1
SELECT lap FROM pitStops WHERE driverId = 1 AND raceId = 1;	formula_1
SELECT driverId, stop, time, duration FROM pitStops WHERE raceId = 1;	formula_1
SELECT MAX(milliseconds) FROM lapTimes WHERE driverId = 1	formula_1
SELECT forename, surname FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE lapTimes.time = (SELECT MIN(time) FROM lapTimes) LIMIT 1;	formula_1
SELECT circuitId, MIN(time) AS fastest_lap FROM lapTimes WHERE driverId = 1 GROUP BY circuitId	formula_1
SELECT time FROM lapTimes WHERE raceId = 1;	formula_1
SELECT circuitId, circuitRef, name, location, country, lat, lng, alt, url FROM circuits WHERE country = 'Italy';	formula_1
SELECT races.name FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId WHERE races.circuitId = 1 ORDER BY lapTimes.milliseconds ASC LIMIT 1	formula_1
SELECT pitStops.duration FROM pitStops JOIN lapTimes ON pitStops.driverId = lapTimes.driverId WHERE lapTimes.time = pitStops.time	formula_1
SELECT circuitId, lat, lng FROM circuits WHERE (SELECT MIN(milliseconds) FROM lapTimes) = 109488	formula_1
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = 1	formula_1
SELECT AVG(milliseconds) FROM lapTimes WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy');	formula_1
SELECT player_api_id FROM Player_Attributes GROUP BY player_api_id ORDER BY MAX(overall_rating) DESC LIMIT 1	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating >= 60 AND overall_rating < 65 AND defensive_work_rate = 'low';	european_football_2
SELECT player_api_id FROM Player_Attributes GROUP BY player_api_id ORDER BY MAX(crossing) DESC LIMIT 5;	european_football_2
SELECT name FROM League WHERE id = (SELECT league_id             FROM Match             WHERE season = '2015/2016'             GROUP BY league_id             ORDER BY SUM(home_team_goal, away_team_goal) DESC             LIMIT 1);	european_football_2
SELECT home_team_api_id, COUNT(*) FROM Match WHERE season = '2015/2016' AND home_team_goal - away_team_goal < 0 GROUP BY home_team_api_id ORDER BY COUNT(*) ASC LIMIT 1;	european_football_2
SELECT Player.player_name, Player_Attributes.penalties FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id ORDER BY Player_Attributes.penalties DESC LIMIT 10;	european_football_2
SELECT Team.team_long_name FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id JOIN League ON Match.league_id = League.id WHERE League.name = 'Scotland Premier League' AND season = '2009/2010' AND SUBTRACT(away_team_goal, home_team_goal) > 0 GROUP BY Team.team_long_name ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT buildUpPlaySpeed FROM Team_Attributes WHERE team_api_id IN (SELECT team_api_id FROM Team_Attributes WHERE buildUpPlaySpeed = (SELECT MAX(buildUpPlaySpeed) FROM Team_Attributes) LIMIT 4)	european_football_2
SELECT name FROM League WHERE id IN (SELECT league_id FROM Match WHERE season = '2015/2016' GROUP BY league_id HAVING MAX(home_team_goal = away_team_goal))	european_football_2
SELECT Player.player_name, Player.birthday, Player_Attributes.sprint_speed, Player_Attributes.date FROM Player, Player_Attributes WHERE Player.player_api_id = Player_Attributes.player_api_id AND Player_Attributes.sprint_speed >= 97 AND YEAR(Player_Attributes.date) >= '2013' AND YEAR(Player_Attributes.date) <= '2015';	european_football_2
SELECT name, MAX(COUNT(league_id)) FROM Match GROUP BY league_id	european_football_2
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT Player_Attributes.player_api_id FROM Player_Attributes WHERE Player_Attributes.date >= '2009-01-01' AND Player_Attributes.date <= '2010-12-31' GROUP BY Player_Attributes.player_api_id HAVING AVG(Player_Attributes.overall_rating) < (SELECT AVG(Player_Attributes.overall_rating) FROM Player_Attributes WHERE Player_Attributes.date >= '2009-01-01' AND Player_Attributes.date <= '2010-12-31') ORDER BY Player_Attributes.overall_rating DESC LIMIT 1	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT team_long_name FROM Team_Attributes WHERE buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing IS NOT NULL)	european_football_2
SELECT player_fifa_api_id, preferred_foot, birthday FROM Player_Attributes WHERE preferred_foot = 'left' AND YEAR(birthday) BETWEEN '1987' AND '1992';  SELECT player_fifa_api_id, preferred_foot, birthday FROM Player_Attributes WHERE preferred_foot = 'left' AND YEAR(birthday) BETWEEN '1987' AND '1992';  SELECT player_fifa_api_id, preferred_foot, birthday FROM Player_Attributes WHERE preferred_foot = 'left' AND YEAR(birthday) BETWEEN '1987' AND '1992';  SELECT player_fifa_api_id, preferred_foot, birthday FROM Player_Attributes WHERE preferred_foot = 'left' AND YEAR(birthday) BETWEEN '1987' AND '1992';  SELECT player_fifa_api_id, preferred_foot, birthday FROM Player_Attributes WHERE preferred_foot = 'left' AND YEAR(birthday) BETWEEN '1987' AND '1992';	european_football_2
SELECT league_id, SUM(home_team_goal, away_team_goal) as goals_made FROM Match GROUP BY league_id ORDER BY goals_made ASC LIMIT 5;	european_football_2
SELECT AVG(long_shots) FROM Player_Attributes WHERE player_fifa_api_id = 218353;	european_football_2
SELECT Player.player_name, AVG(Player_Attributes.heading_accuracy) FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player.height > 180 GROUP BY Player.player_fifa_api_id ORDER BY AVG(Player_Attributes.heading_accuracy) DESC LIMIT 10;	european_football_2
SELECT Team.team_long_name FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team_Attributes.buildUpPlayDribblingClass = 'Normal' AND Team_Attributes.date >= '2014-01-01 00:00:00' AND Team_Attributes.date <= '2014-01-31 00:00:00' GROUP BY Team.team_long_name HAVING DIVIDE(SUM(Team_Attributes.chanceCreationPassing), COUNT(Team_Attributes.id)) > Team_Attributes.chanceCreationPassing ORDER BY Team_Attributes.chanceCreationPassing DESC;	european_football_2
SELECT League.name FROM Match JOIN League ON Match.league_id = League.id WHERE season = '2009/2010' AND AVG(home_team_goal) > AVG(away_team_goal);	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT * FROM Player WHERE substr(birthday,1,7) = '1970-10';	european_football_2
SELECT Player_Attributes.attacking_work_rate FROM Player_Attributes JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id WHERE Player.player_name = 'Franco Zennaro';	european_football_2
SELECT buildUpPlayPositioningClass FROM Team_Attributes WHERE team_long_name = 'ADO Den Haag' AND date < '2015-09-10 00:00:00' AND date > '2010-02-22 00:00:00';	european_football_2
SELECT heading_accuracy FROM Player_Attributes WHERE player_fifa_api_id = 218353 AND date = '2014-09-18 00:00:00';	european_football_2
SELECT overall_rating FROM Player_Attributes JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id WHERE Player.player_name = 'Gabriel Tamas' AND strftime('%Y', Player_Attributes.date) = '2011';	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Scotland Premier League') AND season = '2015/2016';	european_football_2
SELECT preferred_foot FROM Player WHERE birthday = (SELECT MAX(birthday) FROM Player);	european_football_2
SELECT Player.player_name, Player.player_fifa_api_id, Player_Attributes.potential FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player_Attributes.potential = (SELECT MAX(Player_Attributes.potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE weight < 130 AND preferred_foot = 'left';	european_football_2
SELECT Team.team_short_name FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team_Attributes.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT defensive_work_rate FROM Player_Attributes WHERE player_name = 'David Wilson'	european_football_2
SELECT birthday FROM Player WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT League.name FROM Country, League WHERE Country.name = 'Netherlands' AND Country.id = League.country_id;	european_football_2
SELECT AVG(home_team_goal) FROM Match JOIN Country ON Match.country_id = Country.id WHERE name = 'Poland' AND season = '2010/2011';	european_football_2
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player.height = (SELECT MAX(height) FROM Player) OR Player.height = (SELECT MIN(height) FROM Player) GROUP BY Player.player_name ORDER BY AVG(Player_Attributes.finishing) DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height>180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) = '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player_Attributes.overall_rating > 80 AND strftime('%Y', Player_Attributes.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT potential FROM Player_Attributes WHERE player_fifa_api_id = 186170;	european_football_2
SELECT * FROM Player_Attributes WHERE preferred_foot = 'left';	european_football_2
SELECT team_long_name FROM Team_Attributes WHERE buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'CLB';	european_football_2
SELECT Team.team_short_name FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team_Attributes.buildUpPlayPassing > 70;	european_football_2
SELECT AVG(t2.overall_rating) FROM Match AS t1 JOIN Player_Attributes AS t2 ON t1.home_player_1 = t2.player_api_id WHERE strftime('%Y', t1.date) >= '2010' AND <= '2015' AND t2.height > 170	european_football_2
SELECT player_name, height FROM Player ORDER BY height ASC LIMIT 1;	european_football_2
SELECT Country.name FROM Country, League WHERE League.name = 'Italy Serie A' AND Country.id = League.country_id;	european_football_2
SELECT team_short_name FROM Team_Attributes WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_fifa_api_id = 186170;	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT team_short_name FROM Team WHERE home_team_goal = 10	european_football_2
SELECT Player.player_name, Player_Attributes.balance FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player_Attributes.balance = (SELECT MAX(Player_Attributes.balance) FROM Player_Attributes) AND Player_Attributes.potential = 61;	european_football_2
SELECT AVG(ball_control) - AVG(ball_control) FROM Player_Attributes WHERE player_name = 'Abdou Diallo' AND player_name = 'Aaron Appindangoye';	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT * FROM Player WHERE birthday > (SELECT birthday FROM Player WHERE player_name = 'Abdelaziz Barrada');	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';	european_football_2
SELECT Country.name FROM Country, League WHERE League.name = 'Belgium Jupiler League' AND Country.id = League.country_id;	european_football_2
SELECT name FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Germany');	european_football_2
SELECT Player.player_name, Player_Attributes.overall_rating FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player_Attributes.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT player_api_id) FROM Player_Attributes WHERE strftime('%Y', birthday)<'1986' AND defensive_work_rate = 'high';	european_football_2
SELECT player_name FROM Player WHERE player_fifa_api_id IN (     SELECT player_fifa_api_id     FROM Player_Attributes     WHERE crossing = (         SELECT MAX(crossing)         FROM Player_Attributes     ) );	european_football_2
SELECT heading_accuracy FROM Player_Attributes WHERE player_fifa_api_id = 218353;	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE height > 180 AND volleys > 70;	european_football_2
SELECT Player.player_name FROM Player, Player_Attributes WHERE Player.player_api_id = Player_Attributes.player_api_id AND Player_Attributes.volleys > 70 AND Player_Attributes.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match WHERE country_id IN (SELECT id FROM Country WHERE name = 'Belgium') AND season = '2008/2009';	european_football_2
SELECT long_passing FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id ORDER BY birthday ASC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League') AND SUBSTR(`date`, 1, 7) = '2009-04';	european_football_2
SELECT name FROM League WHERE id = (SELECT league_id             FROM Match             WHERE season = '2008/2009'             GROUP BY league_id             ORDER BY COUNT(*) DESC             LIMIT 1);	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id WHERE strftime('%Y', birthday) < '1986';	european_football_2
SELECT (overall_rating WHERE player_name = 'Ariel Borysiuk' - overall_rating WHERE player_name = 'Paulin Puel') / overall_rating WHERE player_name = 'Paulin Puel' * 100 AS higher_in_percentage FROM Player_Attributes WHERE player_name = 'Ariel Borysiuk'	european_football_2
SELECT AVG(buildUpPlaySpeed) FROM Team_Attributes WHERE team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(T2.crossing) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(chanceCreationPassing), chanceCreationPassingClass FROM Team_Attributes WHERE team_long_name = 'Ajax';	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_name = 'Abdou Diallo';	european_football_2
SELECT T1.player_name, MAX(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(away_team_goal) FROM Match WHERE away_team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Parma') AND country_id = (SELECT id FROM Country WHERE name = 'Italy');	european_football_2
SELECT Player.player_name FROM Player, Player_Attributes WHERE Player.player_api_id = Player_Attributes.player_api_id AND Player_Attributes.date LIKE '2016-06-23%' AND Player_Attributes.overall_rating = 77 ORDER BY Player.birthday DESC LIMIT 1;	european_football_2
SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Aaron Mooy' AND date LIKE '2016-02-04%'	european_football_2
SELECT potential FROM Player_Attributes WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00';	european_football_2
SELECT attacking_work_rate FROM Player_Attributes WHERE player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%';	european_football_2
SELECT defensive_work_rate FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Kevin Berigaud' AND Player_Attributes.date = '2013-02-22 00:00:00';	european_football_2
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant');	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'Willem II' AND date = '2012-02-22';	european_football_2
SELECT buildUpPlayDribblingClass FROM Team_Attributes WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.date LIKE '2010-02-22%' AND T2.team_long_name = 'FC Lorient';	european_football_2
SELECT chance_creation_passing_class FROM Team_Attributes WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00';	european_football_2
SELECT chance_creation_crossing_class FROM Team_Attributes WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00';	european_football_2
SELECT defenceAggressionClass FROM Team_Attributes WHERE team_long_name = 'Hannover 96' AND date LIKE '2015-09-10%';	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_name = 'Marko Arnautovic' AND date BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
;	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_name FROM Player WHERE datetime(CURRENT_TIMESTAMP,'localtime') - datetime(birthday) > 34	european_football_2
SELECT home_team_goal FROM Match WHERE home_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon');	european_football_2
SELECT SUM(away_team_goal) FROM Match WHERE home_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') AND away_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira');	european_football_2
SELECT SUM(home_team_goal) FROM Match WHERE SUBTRACT(datetime(CURRENT_TIMESTAMP,'localtime'), datetime(birthday)) < 31	european_football_2
SELECT player_name FROM Player WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes));	european_football_2
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player_Attributes.potential = (SELECT MAX(Player_Attributes.potential) FROM Player_Attributes);	european_football_2
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player_Attributes.attacking_work_rate = 'high';	european_football_2
SELECT Player.player_name FROM Player, Player_Attributes WHERE Player.player_api_id = Player_Attributes.player_api_id AND Player_Attributes.finishing = 1 ORDER BY eldest_player DESC LIMIT 1;	european_football_2
SELECT Player.player_name FROM Player JOIN Team ON Player.team_api_id = Team.team_api_id JOIN Country ON Team.country_id = Country.id WHERE Country.name = 'Belgium';	european_football_2
SELECT Player.player_name, Country.name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id JOIN Country ON Player.id = Country.id WHERE Player_Attributes.vision > 89	european_football_2
SELECT name, MAX(AVG(weight)) FROM Country JOIN Player ON Country.id = Player.id GROUP BY name	european_football_2
SELECT team_long_name FROM Team_Attributes WHERE buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT team_short_name FROM Team_Attributes WHERE chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(height) FROM Player WHERE Player.player_api_id IN (SELECT Player.player_api_id FROM Player JOIN Team ON Player.team_api_id = Team.team_api_id JOIN Country ON Team.country_id = Country.id WHERE Country.name = "Italy");	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990';	european_football_2
SELECT jumping FROM Player_Attributes WHERE id = 6; SELECT jumping FROM Player_Attributes WHERE id = 23;	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes) AND preferred_foot = 'right' LIMIT 5;	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) AND preferred_foot = 'left'	european_football_2
SELECT COUNT(*) / (SELECT COUNT(*) FROM Player_Attributes) * 100 FROM Player_Attributes WHERE stamina > 80 AND strength > 80	european_football_2
SELECT name FROM Country WHERE id IN (SELECT country_id FROM League WHERE name = 'Poland Ekstraklasa');	european_football_2
SELECT home_team_goal, away_team_goal FROM Match WHERE date LIKE '2008-09-24%' AND league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League');	european_football_2
SELECT `sprint_speed`, `agility`, `acceleration` FROM `Player_Attributes` WHERE `player_name` = 'Alexis Blin';	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = 10257 AND season = '2015/2016';	european_football_2
SELECT MAX(home_team_goal) FROM Match WHERE league_id = 1;	european_football_2
SELECT finishing, curve FROM Player_Attributes WHERE weight = (SELECT MAX(weight) FROM Player);	european_football_2
SELECT  League.name,  COUNT(id) FROM  Match  JOIN League ON Match.league_id = League.id WHERE  Match.season = '2015/2016' GROUP BY  League.name ORDER BY  COUNT(id) DESC LIMIT 4	european_football_2
SELECT Team.team_long_name FROM Team JOIN Match ON Team.team_api_id = Match.away_team_api_id WHERE Match.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)	european_football_2
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE Player_Attributes.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT  Divide(   Count(height < 180 AND overall_rating > 70),   Count(id)  ) * 100 FROM Player_Attributes;	european_football_2
SELECT  COUNT(ID) AS in_patient FROM  Patient WHERE  SEX = 'M'  AND Admission = '+'; SELECT  COUNT(ID) AS out_patient FROM  Patient WHERE  SEX = 'M'  AND Admission = '-'; SELECT  ROUND(   (    (     SELECT      COUNT(ID)     FROM      Patient     WHERE      SEX = 'M'      AND Admission = '+'    )    /    (     SELECT      COUNT(ID)     FROM      Patient     WHERE      SEX = 'M'      AND Admission = '-'    )   )   *   100,   2  ) AS percentage;	thrombosis_prediction
SELECT DIVIDE(COUNT(ID) WHERE year(Birthday) > '1930' AND SEX = 'F', (COUNT(ID) WHERE SEX = 'F'))	thrombosis_prediction
SELECT COUNT(ID) AS count, ROUND(COUNT(ID) / (SELECT COUNT(ID) FROM Patient WHERE year(Birthday) BETWEEN '1930-01-01' AND '1940-12-31') * 100, 2) AS percentage FROM Patient WHERE year(Birthday) BETWEEN '1930-01-01' AND '1940-12-31' AND Admission = '+';	thrombosis_prediction
SELECT   ROUND(   (    SELECT      COUNT(ID)     FROM      Patient     WHERE      Diagnosis = 'SLE'      AND Admission = '+'   )    /    (    SELECT      COUNT(ID)     FROM      Patient     WHERE      Diagnosis = 'SLE'      AND Admission = '-'   ),    2  )   AS Ratio;	thrombosis_prediction
SELECT DISTINCT `Diagnosis` FROM `Patient` WHERE `ID` = 30609; SELECT DISTINCT `Date` FROM `Laboratory` WHERE `ID` = 30609;	thrombosis_prediction
SELECT `SEX`, `Birthday` FROM `Patient` WHERE `ID` = 163109; SELECT `Examination Date`, `Symptoms` FROM `Examination` WHERE `ID` = 163109;	thrombosis_prediction
SELECT `ID`, `SEX`, `Birthday` FROM `Patient` WHERE `ID` IN (  SELECT `ID` FROM `Laboratory`  WHERE `LDH` > 500 );	thrombosis_prediction
SELECT ID, age  FROM Patient, Examination  WHERE Examination.ID = Patient.ID AND Examination.RVVT = '+'	thrombosis_prediction
SELECT `ID`, `SEX`, `Diagnosis` FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.`ID` = T2.`ID` WHERE T2.`Thrombosis` = 2	thrombosis_prediction
SELECT `ID` FROM `Patient` WHERE year(`Birthday`) = '1937' INTERSECT SELECT `ID` FROM `Laboratory` WHERE `T-CHO` >= '250'	thrombosis_prediction
SELECT ID, SEX, Diagnosis FROM Patient WHERE ALB < 3.5	thrombosis_prediction
SELECT DIVIDE((SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND TP < '6.0' OR TP > '8.5'), (SELECT COUNT(ID) FROM Patient WHERE SEX = 'F')) * 100 AS percentage;	thrombosis_prediction
SELECT AVG(aCL IgG) FROM Examination WHERE ID IN (  SELECT ID  FROM Patient  WHERE Admission = '+' AND SUBTRACT(year(current_timestamp), year(Birthday)) >= '50' );	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND year(Description) = '1997' AND Admission = '-';	thrombosis_prediction
SELECT MIN(SUBTRACT(YEAR(`First Date`),YEAR(Birthday))) FROM `Patient`;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Examination.Thrombosis = 1 AND Patient.SEX = 'F' AND strftime('%Y', Examination.Examination Date) = '1997';	thrombosis_prediction
SELECT SUBTRACT(MAX(year(Birthday)) - MIN(year(Birthday))) FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE TG >= 200 );	thrombosis_prediction
SELECT Symptoms, Diagnosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Birthday = (SELECT MAX(Birthday) FROM Patient) AND Symptoms IS NOT NULL;	thrombosis_prediction
SELECT AVG(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END) AS Male_Patients_Tested_Each_Month FROM Patient WHERE Date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY MONTH(Date)	thrombosis_prediction
SELECT `Date`, (SUBTRACT(year(`First Date`)), year(Birthday)) AS age FROM `Laboratory` JOIN `Patient` ON `Laboratory`.`ID` = `Patient`.`ID` WHERE `Diagnosis` = 'SJS' ORDER BY `Birthday` DESC LIMIT 1	thrombosis_prediction
SELECT  (SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND UA <= 8.0) / (SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND UA <= 6.5) AS RATIO	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` WHERE NOT EXISTS (SELECT * FROM `Examination` WHERE `Patient`.`ID` = `Examination`.`ID` AND SUBTRACT(year(`Examination Date`), year(`First Date`)) > = 1);	thrombosis_prediction
SELECT COUNT(*) FROM Examination INNER JOIN Patient ON Examination.ID = Patient.ID WHERE year(Birthday) < 18 AND year(Examination.Examination Date) BETWEEN '1990' AND '1993';	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN (SELECT ID FROM Laboratory WHERE `T-BIL` >= '2.0');	thrombosis_prediction
SELECT `Diagnosis` FROM `Patient`  JOIN `Examination` ON `Patient`.`ID` = `Examination`.`ID`  WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31'  GROUP BY `Diagnosis`  ORDER BY COUNT(`Diagnosis`) DESC  LIMIT 1	thrombosis_prediction
SELECT AVG(SUBTRACT('1999', year(Birthday))) FROM Patient WHERE ID IN (  SELECT ID  FROM Laboratory  WHERE Date BETWEEN '1991-10-01' AND '1991-10-30' );	thrombosis_prediction
SELECT SUBTRACT(year(`Examination Date`), year(Birthday)) AS age, `Diagnosis` FROM `Examination` JOIN `Laboratory` ON `Examination`.ID = `Laboratory`.ID WHERE `HGB` = (SELECT MAX(`HGB`) FROM `Laboratory`)	thrombosis_prediction
SELECT `aCL IgG` FROM `Examination` WHERE `ID` = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT T-CHO FROM `Laboratory` WHERE ID = 2927464 AND Date = '1995-9-4' AND T-CHO < 250	thrombosis_prediction
SELECT SEX FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Diagnosis = 'AORTITIS' ORDER BY `Examination Date` LIMIT 1)	thrombosis_prediction
SELECT `aCL IgM` FROM `Examination` WHERE `ID` IN (SELECT `ID` FROM `Patient` WHERE `Diagnosis` = 'SLE' AND `Description` = '1994-02-19') AND `Examination Date` = '1993/11/12'	thrombosis_prediction
SELECT SEX FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE GPT = 9 AND Date = '1992-06-12');	thrombosis_prediction
SELECT SUBTRACT(year(Date), year(Birthday)) FROM Patient, Laboratory WHERE Patient.ID = Laboratory.ID AND UA = '8.4' AND Date = '1991-10-21'	thrombosis_prediction
SELECT COUNT(ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.First Date = '1991-06-13' AND Patient.Diagnosis = 'SJS' AND Laboratory.Date LIKE '1995%';	thrombosis_prediction
SELECT `Diagnosis` FROM `Patient` WHERE `ID` IN (SELECT `ID` FROM `Examination` WHERE `Diagnosis` = 'SLE' AND `Examination Date` = '1997-01-27') AND `First Date` = (SELECT MIN(`First Date`) FROM `Patient`);	thrombosis_prediction
SELECT `Symptoms` FROM `Examination` WHERE `ID` IN (SELECT `ID` FROM `Patient` WHERE `Birthday` = '1953-03-01') AND `Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT SUBTRACT(SUM(Birthday = '1959-02-18' and Date like '1981-11-%' THEN `T-CHO`), SUM(Birthday = '1959-02-18' and Date like '1981-12-%' THEN `T-CHO`))	thrombosis_prediction
SELECT ID FROM Examination WHERE Diagnosis = 'Behcet' AND YEAR(Description) > = '1997-1-1' AND YEAR(Description) < '1998-1-1'	thrombosis_prediction
SELECT ID FROM Examination WHERE Examination.Date BETWEEN '1987-07-06' AND '1996-01-31' AND Examination.GPT > 30 AND Examination.ALB < 4	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+'	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 2 AND ANA = 'S' AND aCL IgM > (SELECT AVG(`aCL IgM`) + (AVG(`aCL IgM`) * 0.2) FROM Examination);	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE `U-PRO` > 0 AND `U-PRO` < 30 AND UA < = 6.5	thrombosis_prediction
SELECT DIVIDE(     SUM(         CASE             WHEN `SEX` = 'M' AND YEAR(`First Date`) = '1981' AND `Diagnosis` = 'BEHCET' THEN 1             ELSE 0         END     ),     COUNT(         CASE             WHEN YEAR(`First Date`) = '1981' THEN 1             ELSE 0         END     ),     100 ) AS `Percentage of male patients who first presented to the hospital in 1981 were diagnosed with BEHCET` FROM `Patient`;	thrombosis_prediction
SELECT ID FROM Patient WHERE Admission = '-' INTERSECT SELECT ID FROM Laboratory WHERE Date LIKE '1991-10%' INTERSECT SELECT ID FROM Laboratory WHERE T-BIL < 2.0	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31' AND ID IN (SELECT ID FROM Examination WHERE ANA Pattern!= 'P');	thrombosis_prediction
SELECT SEX FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Diagnosis = 'PSS' INTERSECT SELECT ID FROM Laboratory WHERE CRP > 2 AND CRE = 1 AND LDH = 123)	thrombosis_prediction
SELECT AVG(ALB) FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE SEX = 'F' AND PLT > 400 AND Diagnosis = 'SLE'	thrombosis_prediction
SELECT MAX(Symptoms) FROM Examination WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT Description, Diagnosis FROM Patient WHERE ID = 48473;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE YEAR(`Examination Date`) = '1997' AND `aCL IgG` < 1.3 OR `aCL IgM` < 1.6 OR `aCL IgA` < 0 OR `aCL IgG` > 4.3 OR `aCL IgM` > 4.6 OR `aCL IgA` > 3 OR `Thrombosis` = 1;	thrombosis_prediction
SELECT   COUNT(DISTINCT ID) AS `count`,  ROUND(   (    COUNT(DISTINCT ID) FILTER (WHERE DIAGNOSIS LIKE '%ITP%')    / COUNT(DISTINCT ID) FILTER (WHERE DIAGNOSIS LIKE '%SLE%')   ) * 100,   2  ) AS `proportion` FROM `Patient` WHERE DIAGNOSIS LIKE '%ITP%'  AND DIAGNOSIS LIKE '%SLE%';	thrombosis_prediction
SELECT DIVIDE(SUM(SEX = 'F'), COUNT(SEX)) * 100 FROM Patient WHERE YEAR(Birthday) = '1980' AND Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'M' AND `ID` IN (SELECT `ID` FROM `Examination` WHERE `Examination Date` BETWEEN '1995' AND '1997' AND `Diagnosis` = 'Behcet' AND `Admission` = '-');	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND ID IN (  SELECT ID FROM Laboratory  WHERE WBC < 3.5 );	thrombosis_prediction
SELECT DATEDIFF(`Examination Date`, `First Date`) FROM `Examination` WHERE `ID` = 821298;	thrombosis_prediction
SELECT `ID` FROM `Laboratory` WHERE `UA` > 8.0 AND `SEX` = 'M' OR `UA` > 6.5 AND `SEX` = 'F'	thrombosis_prediction
SELECT `Date` FROM `Laboratory` WHERE `ID` = 48473 AND `GOT` >= 60;	thrombosis_prediction
SELECT `ID`, `SEX`, `Birthday` FROM `Patient` WHERE `ID` IN (  SELECT `ID`  FROM `Laboratory`  WHERE `GOT` < 60 AND year(`Date`) = 1994 );	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'M' AND ID IN (SELECT ID FROM Laboratory WHERE GPT >= 60);	thrombosis_prediction
SELECT `Diagnosis` FROM `Patient` WHERE `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `GPT` > 60) ORDER BY `Birthday` ASC	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500	thrombosis_prediction
SELECT ID, age  FROM Patient  WHERE age > 18  AND ID IN (  SELECT ID   FROM Laboratory   WHERE LDH BETWEEN 600 AND 800 );	thrombosis_prediction
SELECT Admission FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE ALP < 300 );	thrombosis_prediction
SELECT `ID` FROM `Patient` WHERE `Birthday` = '1982-04-01'; SELECT `ID` FROM `Laboratory` WHERE `ALP` < 300;	thrombosis_prediction
SELECT `ID`, `SEX`, `Birthday` FROM `Patient` WHERE `ID` IN (  SELECT `ID`  FROM `Laboratory`  WHERE `TP` < 6.0 );	thrombosis_prediction
SELECT SUBTRACT(TP, 8.5) FROM Patient, Examination, Laboratory WHERE Patient.ID = Examination.ID AND Examination.ID = Laboratory.ID AND Patient.SEX = 'F' AND TP > 8.5	thrombosis_prediction
SELECT * FROM Patient WHERE SEX = 'M' AND ALB < 3.5 OR ALB > 5.5 ORDER BY Birthday DESC;	thrombosis_prediction
SELECT ID, ALB FROM Patient, Examination, Laboratory WHERE Year(Birthday) = '1982' AND ALB BETWEEN 3.5 AND 5.5 AND Patient.ID = Examination.ID AND Examination.ID = Laboratory.ID	thrombosis_prediction
SELECT COUNT(*) / (SELECT COUNT(*) FROM Patient WHERE SEX = 'F') * 100 FROM Patient WHERE (UA > 6.5 AND SEX = 'F') OR (UA > 8.0 AND SEX = 'M');	thrombosis_prediction
SELECT AVG(UA) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.UA < 8.0 AND p.SEX = 'M' OR l.UA < 6.5 AND p.SEX = 'F'	thrombosis_prediction
SELECT ID, SEX, Birthday FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE UN = 29 );	thrombosis_prediction
SELECT `ID`, `SEX`, `Birthday` FROM `Patient` WHERE `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `UN` < 30) AND `Diagnosis` = 'RA';	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN (  SELECT ID FROM Laboratory  WHERE CRE >= 1.5 );	thrombosis_prediction
SELECT (SUM(SEX = 'M') > SUM(SEX = 'F')) FROM Patient WHERE CRE >= 1.5	thrombosis_prediction
SELECT `ID`, `SEX`, `Birthday` FROM `Patient` WHERE `ID` IN (  SELECT `ID`  FROM `Laboratory`  GROUP BY `ID`  ORDER BY MAX(`T-BIL`) DESC  LIMIT 1 );	thrombosis_prediction
SELECT SEX, GROUP_CONCAT(DISTINCT ID) FROM Patient WHERE ID IN (  SELECT ID  FROM Laboratory  WHERE T-BIL >= 2.0 ) GROUP BY SEX	thrombosis_prediction
SELECT ID, MAX(T-CHO) FROM Patient, LABORATORY WHERE Patient.ID = LABORATORY.ID AND BIRTHDAY = (SELECT MIN(BIRTHDAY) FROMPATIENT) GROUP BY ID;	thrombosis_prediction
SELECT AVG(SUBTRACT(YEAR(NOW()), YEAR(birthday))) FROM Patient WHERE SEX = 'M' AND `T-CHO` >= 250;	thrombosis_prediction
SELECT DISTINCT `Patient`.`ID`, `Patient`.`Diagnosis` FROM `Patient` JOIN `Examination` ON `Patient`.`ID` = `Examination`.`ID` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`TG` > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE TG >= 200) AND SUBTRACT(year(current_timestamp), year(Birthday)) > 50	thrombosis_prediction
SELECT DISTINCT `ID` FROM `Laboratory` WHERE `Admission` = '-' AND `CPK` < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Patient WHERE year(Birthday) BETWEEN '1936' AND '1956' AND sex = 'M' INTERSECT SELECT DISTINCT ID FROM Laboratory WHERE CPK >= 250;	thrombosis_prediction
SELECT `ID`, `SEX`, SUBTRACT(year(current_timestamp), year(`Birthday`)) AS `Age` FROM `Patient` WHERE `GLU` >= 180 AND `T-CHO` < 250;	thrombosis_prediction
SELECT `ID`, `GLU` FROM `Laboratory` WHERE `GLU` < 180 AND year(`Description`) = 1991	thrombosis_prediction
SELECT `ID`, `SEX`, `Birthday` FROM `Patient` WHERE `ID` IN (  SELECT `ID`  FROM `Laboratory`  WHERE `WBC` <= 3.5 OR `WBC` >= 9.0 ) GROUP BY `SEX` ORDER BY `Birthday` ASC	thrombosis_prediction
SELECT ID, SUBTRACT(year(current_timestamp), year(Birthday)) as age, Diagnosis FROM Patient WHERE RBC < 3.5	thrombosis_prediction
SELECT ID, Admission FROM Patient WHERE SEX = 'F' AND SUBTRACT(year(current_timestamp), year(Birthday)) >= 50 AND ID IN (  SELECT ID  FROM Laboratory  WHERE RBC <= 3.5 OR RBC >= 6.0 );	thrombosis_prediction
SELECT ID, SEX FROM Patient WHERE Admission = '-' AND HGB < 10	thrombosis_prediction
SELECT ID, SEX FROM Patient WHERE Diagnosis = 'SLE' AND Birthday = (SELECT MAX(Birthday) FROM Patient WHERE Diagnosis = 'SLE' AND HGB BETWEEN 10 AND 17);	thrombosis_prediction
SELECT ID, age  FROM Patient  WHERE ID IN (  SELECT ID   FROM Laboratory   GROUP BY ID   HAVING COUNT(ID) > 2   AND MAX(HCT) >= 52 );	thrombosis_prediction
SELECT AVG(HCT) FROM `Laboratory` WHERE `Date` LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT COUNT(ID) FROM Patient WHERE PLT <= 100;	thrombosis_prediction
SELECT ID FROM Patient WHERE SUBTRACT(year(current_timestamp), year(Birthday)) < 50 INTERSECT SELECT ID FROM Laboratory WHERE YEAR(Date) = '1984' AND PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT DIVIDE(        SUM(          CASE            WHEN SUBTRACT(year(current_timestamp), year(Birthday)) > 55 ANDPT >= 14 AND SEX = 'F' THEN 1            ELSE 0          END        ),        SUM(          CASE            WHEN SUBTRACT(year(current_timestamp), year(Birthday)) > 55 AND PT >= 14 THEN 1            ELSE 0          END        )      ) * 100 AS percentage FROM Patient;	thrombosis_prediction
SELECT `ID` FROM `Patient` WHERE year(`First Date`) > 1992 INTERSECT SELECT `ID` FROM `Laboratory` WHERE `PT` < 14	thrombosis_prediction
SELECT COUNT(*) FROM Examination, Laboratory WHERE Examination.ID = Laboratory.ID AND Examination.Examination_Date > '1997-01-01' AND Laboratory.APTT < 45	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE APTT > 45 AND Thrombosis = 0	thrombosis_prediction
SELECT COUNT(*) FROM Patient, Examination, Laboratory WHERE Patient.ID = Examination.ID AND Examination.ID = Laboratory.ID AND SEX = 'M' AND WBC > 3.5 AND WBC < 9.0 AND (FG < 150 OR FG > 450);	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Patient WHERE Birthday > '1980-01-01' AND ID IN (     SELECT ID     FROM Laboratory     WHERE FG < 150 OR FG > 450 );	thrombosis_prediction
SELECT `Diagnosis` FROM `Patient` WHERE `U-PRO` >= 30;	thrombosis_prediction
SELECT `ID` FROM `Patient` WHERE `U-PRO` BETWEEN 0 AND 30 AND `Diagnosis` = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE aCL_IgG >= 2000	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE aCL_IgG > 900 AND aCL_IgG < 2000 AND Symptoms IS NOT NULL;	thrombosis_prediction
SELECT `Diagnosis` FROM `Patient` WHERE `ID` IN (SELECT `ID` FROM `Examination` WHERE `aCL IgA` = (SELECT MAX(`aCL IgA`) FROM `Examination` WHERE `aCL IgA` BETWEEN 80 AND 500));	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` WHERE `ID` IN (  SELECT `ID` FROM `Examination`  WHERE `aCL IgA` > 80 AND `aCL IgA` < 500 ) AND YEAR(`First Date`) > = 1990	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE aCL_IgM <= 40 OR aCL_IgM >= 400 GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE CRP = '+' AND Description IS NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE CRE >= 1.5) AND SUBTRACT((YEAR(CURDATE()), YEAR(Birthday))) < 70	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE Thrombosis = 0 AND KCT = '+' AND RA IN ('+', '+-');	thrombosis_prediction
SELECT `Diagnosis` FROM `Patient` WHERE `Birthday` > '1985-01-01' AND `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `RA` IN ('-','+-'));	thrombosis_prediction
SELECT ID FROM Patient WHERE RF < 20 AND SUBTRACT((YEAR(CURDATE()), YEAR(Birthday))) > 60	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 0 AND ID IN (SELECT ID FROM Laboratory WHERE RF < 20);	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination, Patient WHERE Examination.ID = Patient.ID AND C3 > 35 AND ANA Pattern = 'P'	thrombosis_prediction
SELECT `ID` FROM `Laboratory` WHERE `HGB` < 29 OR `HGB` > 52 ORDER BY `aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE Thrombosis = 1 AND C4 > 10	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Patient WHERE Admission = '+' AND RNP IN ('-','+-');	thrombosis_prediction
SELECT MAX(Birthday) FROM Patient WHERE RNP NOT IN('-', '+-');	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE ID IN (SELECT ID FROM Patient WHERE SM IN ('-','+-') AND Thrombosis = 0)	thrombosis_prediction
SELECT ID FROM Patient WHERE Birthday = (SELECT MAX(Birthday) FROM Patient) AND ID IN (SELECT ID FROM Examination WHERE SM NOT IN ('negative', '0')) LIMIT 3;	thrombosis_prediction
SELECT `ID` FROM `Examination` WHERE `Examination Date` >  '1997-01-01' AND `SC170` IN ('negative', '0');	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE SC170 IN('negative', '0') AND SEX = 'F' AND Symptoms IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT `ID`) FROM `Patient` WHERE `ID` IN (  SELECT `ID` FROM `Examination`  WHERE `SSA` IN ('-','+-')  AND YEAR(`First Date`) < 2000 );	thrombosis_prediction
SELECT `ID` FROM `Patient` WHERE `First Date` = (SELECT MIN(`First Date`) FROM `Patient`) AND `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `SSA` NOT IN('negative', '0'));	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE `SSB` IN ('-','+-') AND `Diagnosis` = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE SSB IN ('negative', '0') AND Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Patient WHERE CENTROMEA IN('-', '+-') AND SSB IN('-', '+-') AND SEX = 'M';	thrombosis_prediction
SELECT `Diagnosis` FROM `Patient` WHERE `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `DNA` >= 8);	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Patient WHERE DNA < 8 AND Description IS NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE IGG BETWEEN 900 AND 2000) AND Admission = '+';	thrombosis_prediction
SELECT COUNT(ID) FROM Examination WHERE GOT >= 60 AND Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN (  SELECT ID FROM Laboratory  WHERE GOT < 60 );	thrombosis_prediction
SELECT MIN(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GOT >= 60)	thrombosis_prediction
SELECT p.Birthday, MAX(l.GPT) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 60 GROUP BY p.Birthday ORDER BY MAX(l.GPT) DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE GOT < 60) AND SEX = 'M';	thrombosis_prediction
SELECT MIN(`First Date`)  FROM `Patient`  WHERE `ID` IN (  SELECT `ID`   FROM `Laboratory`   WHERE `LDH` < 500   ORDER BY `LDH` DESC   LIMIT 1 );	thrombosis_prediction
SELECT MAX(Date) FROM Laboratory WHERE ID = (SELECT ID FROM Patient WHERE First_Date = (SELECT MAX(First_Date) FROM Patient)) AND LDH >= 500	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE ALP >= 300) AND Admission = '+'	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Admission = '-' AND ALP < 300	thrombosis_prediction
SELECT `Diagnosis` FROM `Patient` WHERE `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `TP` < 6.0);	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Diagnosis = 'SJS' AND TP > 6.0 AND TP < 8.5);	thrombosis_prediction
SELECT `Examination Date` FROM `Examination` WHERE `aCL IgG` = (SELECT MAX(`aCL IgG`) FROM `Examination` WHERE `aCL IgG` > 3.5 AND `aCL IgG` < 5.5)	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ALB > 3.5 AND ALB < 5.5 AND TP between 6.0 and 8.5	thrombosis_prediction
SELECT MAX(`aCL IgG`) FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F' AND MAX(UA) > 6.50	thrombosis_prediction
SELECT MAX(ANA) FROM Examination WHERE CRE < 1.5	thrombosis_prediction
SELECT ID FROM Examination WHERE CRE < 1.5 AND aCL IgA = (SELECT MAX(aCL IgA) FROM Examination);	thrombosis_prediction
SELECT COUNT(*) FROM Examination, Patient WHERE Examination.ID = Patient.ID AND Examination.aCL_IgG >= 2.0 AND Examination.ANA_Pattern LIKE '%P%';	thrombosis_prediction
SELECT `ANA` FROM `Examination` WHERE `T-BIL` < 2.0 ORDER BY `T-BIL` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE T-CHO >= 250 AND KCT = '-'	thrombosis_prediction
SELECT COUNT(*) FROM Examination, Patient WHERE Examination.ID = Patient.ID AND T-CHO < 250 AND ANA Pattern = 'P';	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE TG < 200 AND Symptoms IS NOT NULL;	thrombosis_prediction
SELECT `Diagnosis` FROM `Patient` WHERE `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `TG` = (SELECT MAX(`TG`) FROM `Laboratory` WHERE `TG` < 200));	thrombosis_prediction
SELECT `ID` FROM `Examination` WHERE `Thrombosis` = 0 AND `CPK` < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE CPK < 250 AND (KCT = '+' OR RVVT = '+' OR LAC = '+');	thrombosis_prediction
SELECT MIN(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GLU > 180);	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE GLU < 180 AND Thrombosis = 0	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Admission = '+' AND ID IN (SELECT ID FROM Laboratory WHERE WBC BETWEEN 3.5 AND 9.0);	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Diagnosis = 'SLE' AND ID IN (SELECT ID FROM Laboratory WHERE WBC BETWEEN 3.5 AND 9.0);	thrombosis_prediction
SELECT `ID` FROM `Laboratory` WHERE `RBC` <= 3.5 OR `RBC` >= 6.0 AND `Admission` = '-'	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 0 AND Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT PLT FROM Examination, Patient WHERE Examination.ID = Patient.ID AND PLT > 100 AND PLT < 400 AND Diagnosis = 'MCTD';	thrombosis_prediction
SELECT AVG(PT) FROM `Laboratory` JOIN `Patient` ON `Laboratory`.`ID` = `Patient`.`ID` WHERE `Patient`.`SEX` = 'M' AND `Laboratory`.`PT` < 14	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis IN (1, 2) AND ID IN (  SELECT ID  FROM Laboratory  WHERE PT < 14 );	thrombosis_prediction
SELECT major_name FROM major JOIN member ON member.link_to_major = major.major_id WHERE first_name = 'Angela' AND last_name = 'Sanders';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Engineering');	student_club
SELECT first_name, last_name FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE department = 'School of Applied Sciences, Technology and Education');	student_club
SELECT COUNT(*) FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE attendance.link_to_event ='rec2N69DMcrqN9PJC' AND member.position = 'Member';	student_club
SELECT phone FROM member WHERE member_id IN (     SELECT link_to_member     FROM attendance     WHERE link_to_event ='rec2N69DMcrqN9PJC' );	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Agriculture and Applied Sciences') AND member_id IN (SELECT link_to_member FROM attendance WHERE link_to_event ='rec2N69DMcrqN9PJC') AND t_shirt_size = 'Medium';	student_club
SELECT event_id, event_name, event_date, type, location, status FROM event WHERE event_id IN (     SELECT link_to_event     FROM attendance     GROUP BY link_to_event     ORDER BY COUNT(link_to_event) DESC     LIMIT 1 );	student_club
SELECT college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'	student_club
SELECT event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id WHERE member.first_name = "Maya" AND member.last_name = "Mclean"	student_club
SELECT COUNT(*) FROM event WHERE event_id IN (     SELECT link_to_event     FROM attendance     WHERE link_to_member ='recd078PnS3x2doBe' ) AND YEAR(event_date) = 2019	student_club
SELECT COUNT(event_id) FROM attendance GROUP BY event_id HAVING COUNT(event_id) > 10 AND type = 'Meeting';	student_club
SELECT event_name FROM event WHERE event_id IN (  SELECT link_to_event  FROM attendance  GROUP BY link_to_event  HAVING COUNT(link_to_event) > 20 ) AND type!= 'Fundraiser';	student_club
SELECT AVG(COUNT(event_id)) FROM attendance WHERE link_to_event IN (  SELECT event_id  FROM event  WHERE type = 'Meeting' AND YEAR(event_date) = 2020 );	student_club
SELECT expense_description, MAX(cost) FROM expense WHERE expense_description LIKE '%support of club events%' GROUP BY expense_description	student_club
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering'	student_club
SELECT first_name, last_name FROM member WHERE member_id IN (     SELECT link_to_member     FROM attendance     WHERE link_to_event ='rec0Si5cQ4rJRVzd6' );	student_club
SELECT last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major_name = 'Law and Constitutional Studies';	student_club
SELECT county FROM zip_code WHERE zip_code = (SELECT zip FROM member WHERE member_id ='rec4BLdZHS2Blfp4v');	student_club
SELECT major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = "Tyler" AND member.last_name = "Hewitt"	student_club
SELECT amount FROM income WHERE source = 'Dues' AND link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President');	student_club
SELECT SUM(cost) FROM expense WHERE link_to_budget IN (SELECT budget_id FROM budget WHERE category = 'Food' AND link_to_event ='rec0Si5cQ4rJRVzd6');	student_club
SELECT city, state FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.position = 'President';	student_club
SELECT first_name, last_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Illinois');	student_club
SELECT SUM(spent) FROM budget WHERE link_to_event ='rec0Si5cQ4rJRVzd6' AND category = 'Advertisement';	student_club
SELECT major.department FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = "Pierce" AND member.last_name = "Woodard" INTERSECT SELECT major.department FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = "Luisa" AND member.last_name = "Guidi"	student_club
SELECT SUM(amount) FROM budget WHERE link_to_event ='recHaMmaKyfktt5fW';	student_club
SELECT approved FROM expense WHERE link_to_budget IN (     SELECT budget_id     FROM budget     WHERE link_to_event IN (         SELECT event_id         FROM event         WHERE event_name = 'October Meeting' AND event_date = '2019-10-08'     ) );	student_club
SELECT AVG(cost) FROM expense WHERE link_to_member ='rec4BLdZHS2Blfp4v' AND (month(expense_date) = 9 OR month(expense_date) = 10);	student_club
SELECT SUBTRACT(SUM(CASE WHEN YEAR(event_date) = 2019 THEN spent END), SUM(CASE WHEN YEAR(event_date) = 2020 THEN spent END)) FROM budget;	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04';	student_club
SELECT remaining FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food');	student_club
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14';	student_club
SELECT COUNT(*) FROM major WHERE college = "College of Humanities and Social Sciences"	student_club
SELECT phone FROM member WHERE first_name = "Carlo" AND last_name = "Jacobs"	student_club
SELECT county FROM zip_code WHERE zip_code = (SELECT zip FROM member WHERE first_name = "Adela" AND last_name = "O'Gallagher");	student_club
SELECT COUNT(*) FROM budget WHERE link_to_event ='rec180D2MI4EpckHy' AND remaining < 0	student_club
SELECT SUM(amount) FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = "September Speaker");	student_club
SELECT event_status FROM event WHERE event_id IN (     SELECT link_to_event     FROM expense     WHERE expense_description = 'Post Cards, Posters'     AND expense_date = '2019-8-20' );	student_club
SELECT major_name FROM major JOIN member ON member.link_to_major = major.major_id WHERE first_name = "Brent" AND last_name = "Thomason"	student_club
SELECT COUNT(*) FROM member WHERE link_to_major ='rec0xRZtkzxrg8kj2' AND t_shirt_size = 'Medium';	student_club
SELECT type FROM zip_code WHERE zip_code = (SELECT zip FROM member WHERE first_name = "Christof" AND last_name = "Nielson");	student_club
SELECT major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'	student_club
SELECT state FROM member WHERE first_name = "Sacha" AND last_name = "Harrison"	student_club
SELECT department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'President';	student_club
SELECT date_received FROM income WHERE source = 'Dues' AND link_to_member ='rec3pH4DxMcWHMRB7';	student_club
SELECT first_name, last_name FROM member JOIN income ON member.member_id = income.link_to_member WHERE income.date_received = (SELECT MIN(date_received) FROM income WHERE source = 'Dues')	student_club
SELECT COUNT(*) FROM budget WHERE category = 'Advertisement' AND spent > (SELECT spent FROM budget WHERE event_name = 'October Meeting');	student_club
SELECT (SUM(amount) / 150) * 100 FROM budget WHERE category = 'Parking' AND event_name = 'November Speaker';	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT city, county, state FROM zip_code WHERE zip_code = (SELECT zip FROM member WHERE first_name = "Amy" AND last_name = "Firth");	student_club
SELECT expense_description, cost, approved FROM expense WHERE link_to_budget = (SELECT budget_id FROM budget WHERE remaining = (SELECT MIN(remaining) FROM budget));	student_club
SELECT * FROM member WHERE member_id IN (SELECT link_to_member FROM attendance WHERE link_to_event ='rec0Si5cQ4rJRVzd6');	student_club
SELECT major.college FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY major.college ORDER BY COUNT(major.college) DESC LIMIT 1	student_club
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE phone = "809-555-3360";	student_club
SELECT event_name FROM event WHERE amount = (SELECT MAX(amount) FROM budget);	student_club
SELECT * FROM expense WHERE link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President');	student_club
SELECT COUNT(*) FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = "Women's Soccer"	student_club
SELECT date_received FROM income WHERE link_to_member ='rec4BLdZHS2Blfp4v';	student_club
SELECT COUNT(*) FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Maryland');	student_club
SELECT COUNT(*) FROM attendance WHERE link_to_member = (SELECT member_id FROM member WHERE phone = "954-555-6240");	student_club
SELECT first_name, last_name FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE department = 'School of Applied Sciences, Technology and Education');	student_club
SELECT event_name FROM event WHERE status = 'Closed' ORDER BY (spent/amount) DESC LIMIT 1	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food';	student_club
SELECT first_name, last_name FROM member WHERE member_id IN (  SELECT link_to_member  FROM attendance  GROUP BY link_to_member  HAVING COUNT(link_to_event) > 7 );	student_club
SELECT first_name, last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON event.event_id = attendance.link_to_event JOIN major ON major.major_id = member.link_to_major WHERE major.major_name = 'Interior Design' AND event.event_name = 'Community Theater';	student_club
SELECT first_name, last_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina');	student_club
SELECT SUM(amount) FROM income WHERE link_to_member ='rec280Sk7o31iG0Tx';	student_club
SELECT first_name, last_name FROM member JOIN income ON member.member_id = income.link_to_member WHERE income.amount > 40	student_club
SELECT SUM(cost) FROM expense WHERE link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event ='rec0Si5cQ4rJRVzd6');	student_club
SELECT first_name, last_name FROM member WHERE member_id IN (     SELECT link_to_member     FROM attendance     WHERE link_to_event ='rec0Si5cQ4rJRVzd6' );	student_club
SELECT member.first_name, member.last_name, income.source, income.amount FROM member JOIN income ON member.member_id = income.link_to_member WHERE income.amount = (SELECT MAX(amount) FROM income)	student_club
SELECT event_name FROM event WHERE cost = (SELECT MIN(cost) FROM event);	student_club
SELECT SUM(cost) FROM event;	student_club
SELECT   major_name,  COUNT(*) AS count FROM  member  JOIN major ON member.link_to_major = major.major_id GROUP BY  major_name;	student_club
SELECT source, MAX(amount) FROM income WHERE date_received BETWEEN '2019-09-01' and '2019-09-30' GROUP BY source;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Physics Teaching'	student_club
SELECT COUNT(*) FROM attendance WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'Community Theater' AND YEAR(event_date) = 2019);	student_club
SELECT COUNT(*) FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T3.first_name = "Luisa" AND T3.last_name = "Guidi";	student_club
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT event_name FROM event WHERE event_id IN (SELECT link_to_event FROM budget WHERE spent = (SELECT MAX(spent) FROM budget WHERE category = 'Advertisement'))	student_club
SELECT * FROM attendance JOIN member ON attendance.link_to_member = member.member_id JOIN event ON attendance.link_to_event = event.event_id WHERE member.first_name = "Maya" AND member.last_name = "Mclean" AND event.event_name = "Women's Soccer"	student_club
SELECT event_id, event_name, event_date, type, notes, location, status FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31' AND type = 'Community Service';	student_club
SELECT cost FROM expense WHERE expense_description = 'Posters' AND link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'September Speaker'));	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1	student_club
SELECT event_name FROM event WHERE status = 'Closed' ORDER BY spent - amount DESC LIMIT 1;	student_club
SELECT expense_description, SUM(cost) FROM expense WHERE link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event ='recggMW2eyCYceNcy') GROUP BY expense_description;	student_club
SELECT budget_id, category, SUM(amount) AS amount_budgeted FROM budget WHERE link_to_event ='rec180D2MI4EpckHy' GROUP BY budget_id, category ORDER BY amount_budgeted ASC	student_club
SELECT budget_id, MAX(amount) FROM budget WHERE category = 'Food';	student_club
SELECT budget_id, category, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT first_name, last_name, expense_description, cost FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE member.member_id = "rec4BLdZHS2Blfp4v"	student_club
SELECT expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = "Sacha" AND member.last_name = "Harrison";	student_club
SELECT expense_description FROM expense JOIN member ON member.member_id = expense.link_to_member WHERE t_shirt_size = 'X-Large'	student_club
SELECT zip FROM member WHERE member_id IN (  SELECT link_to_member  FROM expense  WHERE cost < 50 );	student_club
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member_id ='rec4BLdZHS2Blfp4v';	student_club
SELECT position FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business');	student_club
SELECT COUNT(*) FROM member WHERE link_to_major ='rec0xRZtkzxrg8kj2' AND t_shirt_size = 'Medium';	student_club
SELECT type FROM event WHERE budget.remaining > 30;	student_club
SELECT type FROM event WHERE location = 'MU 215';	student_club
SELECT event_name, type FROM event WHERE event_date = '2020-03-24T12:00:00';	student_club
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE position = 'Vice President';	student_club
SELECT COUNT(member_id) FROM member WHERE major_name = 'Business';	student_club
SELECT type FROM event WHERE location = 'MU 215';	student_club
SELECT COUNT(*) FROM income WHERE amount = 50	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT last_name, department, college FROM member JOIN major ON member.link_to_major = major.major_id WHERE major_name = 'Environmental Engineering';	student_club
SELECT budget.category FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.location = 'MU 215' AND event.type = 'Guest Speaker' AND budget.spent = 0	student_club
SELECT city, state FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'School of Electrical and Computer Engineering' AND position = 'Member';	student_club
SELECT event_name FROM event WHERE type = 'Social' AND location = '900 E. Washington St.' AND link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President');	student_club
SELECT last_name, position FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE expense_description = 'Pizza' AND expense_date = '2019-09-10'	student_club
SELECT last_name FROM member WHERE position = 'Member' AND link_to_event ='rec2N69DMcrqN9PJC';	student_club
SELECT COUNT(amount = 50) / COUNT(member_id) * 100 FROM member WHERE t_shirt_size = 'Medium' AND position = 'Member';	student_club
SELECT DISTINCT state FROM zip_code WHERE type = 'PO Box';	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND city = 'San Juan Municipio' AND state = 'Puerto Rico';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' and '2020-03-20';	student_club
SELECT link_to_event FROM attendance AS T1 JOIN income AS T2 ON T1.link_to_member = T2.link_to_member WHERE T2.amount > 50	student_club
SELECT member.first_name, member.last_name, attendance.link_to_event FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN expense ON attendance.link_to_event = expense.link_to_budget WHERE approved = 'true' AND expense_date BETWEEN '2019-01-10' and '2019-11-19'	student_club
SELECT college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = "Katy" AND T2.major_id = "rec1N0upiVLy5esTO"	student_club
SELECT phone FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND major_name = 'Business');	student_club
SELECT email FROM member WHERE member_id IN (  SELECT link_to_member  FROM expense  WHERE expense_date BETWEEN '2019-09-10' and '2019-11-19'  AND cost > 20 );	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Education & Human Services' AND major_name = 'Education');	student_club
SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event_id, event_name, event_date, type, notes, location, status, remaining FROM event WHERE remaining < 0;  SELECT event	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' and '2020-03-31';	student_club
SELECT expense_description, cost FROM expense GROUP BY expense_description HAVING DIVIDE( SUM(cost), COUNT(expense_id) ) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT  COUNT(zip_code) AS total_zip_codes,  SUM(type = 'PO Box') AS po_box_count FROM zip_code;	student_club
SELECT event_name, location FROM event WHERE remaining > 0;	student_club
SELECT event_name, event_date FROM event WHERE event_id IN (  SELECT link_to_event  FROM attendance  WHERE link_to_member IN (   SELECT member_id   FROM member   WHERE major_id IN (    SELECT major_id    FROM major    WHERE major_name = 'Agricultural Communication'   )  ) ) AND event_id IN (  SELECT link_to_event  FROM budget  WHERE budget_id IN (   SELECT link_to_budget   FROM expense   WHERE expense_description = 'Pizza'   AND cost > 50   AND cost < 100  ) );	student_club
SELECT first_name, last_name, major_name FROM member JOIN expense ON member.member_id = expense.link_to_member JOIN major ON member.link_to_major = major.major_id WHERE cost > 100	student_club
SELECT city, country FROM event WHERE event_id IN (  SELECT link_to_event  FROM income  GROUP BY link_to_event  HAVING COUNT(*) > 40 );	student_club
SELECT member_id, MAX(cost) FROM expense WHERE event_id IN (SELECT event_id FROM expense GROUP BY event_id HAVING COUNT(event_id) > 1) GROUP BY member_id;	student_club
SELECT AVG(cost) FROM expense WHERE approved = 'true' AND link_to_member IN (  SELECT member_id  FROM member  WHERE position!= 'Member' );	student_club
SELECT event_name FROM event WHERE cost < (SELECT AVG(cost) FROM expense WHERE category = 'Parking');	student_club
SELECT event_id, event_name, event_date, type, notes, location, status, (SELECT (SUM(cost) / COUNT(event_id)) * 100 FROM event WHERE type = 'Meeting') AS percentage FROM event WHERE type = 'Meeting';	student_club
SELECT link_to_event FROM budget WHERE budget.category = 'Food' AND budget.spent = (SELECT MAX(cost) FROM expense WHERE expense.expense_description = 'Water, chips, cookies');	student_club
SELECT first_name, last_name FROM member WHERE member_id IN (     SELECT link_to_member     FROM expense     GROUP BY link_to_member     ORDER BY MAX(cost) DESC     LIMIT 5 );	student_club
SELECT first_name, last_name, phone FROM member WHERE member_id IN (  SELECT link_to_member  FROM expense  WHERE cost > (   SELECT AVG(cost)   FROM expense  ) );	student_club
SELECT (SELECT COUNT(position = 'Member') FROM member WHERE state = 'New Jersey') - (SELECT COUNT(position = 'Member') FROM member WHERE state = 'Vermont');	student_club
SELECT major.major_name, major.department FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT first_name, last_name, cost FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_description = 'Water, Veggie tray, supplies';	student_club
SELECT last_name, phone FROM member JOIN major ON member.link_to_major = major.major_id WHERE major_name = 'Elementary Education';	student_club
SELECT budget.category, budget.amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker';	student_club
SELECT event_name FROM event WHERE category = 'Food';	student_club
SELECT first_name, last_name, amount FROM member JOIN income ON member.member_id = income.link_to_member WHERE date_received = '2019-09-09'	student_club
SELECT category FROM budget JOIN expense ON budget.link_to_event = expense.link_to_budget WHERE expense_description = 'Posters';	student_club
SELECT first_name, last_name, college FROM member JOIN major ON member.link_to_major = major.major_id WHERE position = 'Secretary';	student_club
SELECT event_name, SUM(spent) FROM budget WHERE category = 'Speaker Gifts' GROUP BY event_name;	student_club
SELECT city FROM zip_code WHERE zip_code = (SELECT zip FROM member WHERE member_id ='rec090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000	student_club
SELECT first_name, last_name, position FROM member WHERE zip = 28092 AND city = 'Lincolnton' AND state = 'North Carolina';	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT   COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 END) FROM customers;	debit_card_specializing
SELECT `CustomerID`, `Date`, `Consumption` FROM `yearmonth` WHERE `Date` BETWEEN '201201' AND '201212' AND `Segment` = 'LAM' ORDER BY `Consumption` LIMIT 1	debit_card_specializing
SELECT AVG(yearmonth.Consumption) / 12 FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' AND yearmonth.Date BETWEEN '201301' AND '201312'	debit_card_specializing
SELECT T1.CustomerID, T1.Date, T1.Consumption  FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T2.Currency = 'CZK' AND T1.Date BETWEEN '201101' AND '201112'  ORDER BY T1.Consumption DESC	debit_card_specializing
SELECT COUNT(*) FROM yearmonth WHERE CustomerID = 5 AND Date BETWEEN '201201' AND '201212' AND Consumption < 30000	debit_card_specializing
SELECT SUM(yearmonth.Consumption) FROM yearmonth, customers WHERE yearmonth.CustomerID = customers.CustomerID AND customers.Currency = 'CZK' AND yearmonth.Date BETWEEN '201201' AND '201212' - SELECT SUM(yearmonth.Consumption) FROM yearmonth, customers WHERE yearmonth.CustomerID = customers.CustomerID AND customers.Currency = 'EUR' AND yearmonth.Date BETWEEN '201201' AND '201212'	debit_card_specializing
SELECT strftime('%Y', date) as year, sum(amount) as total_gas_use_EUR FROM transactions_1k WHERE price IS NOT NULL GROUP BY year ORDER BY total_gas_use_EUR DESC LIMIT 1	debit_card_specializing
SELECT Segment, min(Consumption) FROM customers c join yearmonth y on c.CustomerID = y.CustomerID GROUP BY Segment	debit_card_specializing
SELECT SUBSTR(Date, 1, 4) AS Year, SUM(Consumption) AS Consumption FROM yearmonth GROUP BY SUBSTR(Date, 1, 4) ORDER BY Consumption DESC LIMIT 1	debit_card_specializing
SELECT Date, Consumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME' AND Currency = 'EUR' AND CustomerID IN (SELECT CustomerID FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' GROUP BY CustomerID ORDER BY SUM(Consumption) DESC LIMIT 1)) GROUP BY Date ORDER BY Consumption DESC LIMIT 1	debit_card_specializing
SELECT    Segment,  round(avg(cast(replace(Date, '2013', '') as int)), 2) as AnnualAverage FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' GROUP BY Segment ORDER BY AnnualAverage;  SELECT   Segment,  round(avg(cast(replace(Date, '2013', '') as int)), 2) as AnnualAverage FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' GROUP BY Segment ORDER BY AnnualAverage;  SELECT   Segment,  round(avg(cast(replace(Date, '2013', '') as int)), 2) as AnnualAverage FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' GROUP BY Segment ORDER BY AnnualAverage;	debit_card_specializing
SELECT Segment,        (SELECT (consumption - (SELECT consumption FROM yearmonth WHERE CustomerID = c.CustomerID AND Date LIKE '2012%')) / (SELECT consumption FROM yearmonth WHERE CustomerID = c.CustomerID AND Date LIKE '2012%') * 100         FROM yearmonth         WHERE CustomerID = c.CustomerID AND Date LIKE '2013%') AS percentage_increase FROM customers c ORDER BY percentage_increase DESC LIMIT 1;  SELECT Segment,        (SELECT (consumption - (SELECT consumption FROM yearmonth WHERE CustomerID = c.CustomerID AND Date LIKE '2012%')) / (SELECT consumption FROM yearmonth WHERE CustomerID = c.CustomerID AND Date LIKE '2012%') * 100         FROM yearmonth         WHERE CustomerID = c.CustomerID AND Date LIKE '2013%') AS percentage_increase FROM customers c ORDER BY percentage_increase LIMIT 1;	debit_card_specializing
SELECT SUM(yearmonth.Consumption) FROM yearmonth WHERE yearmonth.Date BETWEEN '201308' AND '201311' AND yearmonth.CustomerID = 6	debit_card_specializing
SELECT COUNT(*) FROM gasstations WHERE Segment = 'Value for money' AND Country = 'CZE' - SELECT COUNT(*) FROM gasstations WHERE Segment = 'Value for money' AND Country = 'SVK'	debit_card_specializing
SELECT yearmonth.consumption FROM yearmonth WHERE yearmonth.date = '201304' AND yearmonth.customerid = 7 SELECT yearmonth.consumption FROM yearmonth WHERE yearmonth.date = '201304' AND yearmonth.customerid = 5	debit_card_specializing
SELECT SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) FROM customers WHERE Segment = 'SME';	debit_card_specializing
select yearmonth.date, yearmonth.consumption from yearmonth join customers on customers.CustomerID = yearmonth.CustomerID where customers.Segment = 'LAM' and customers.Currency = 'EUR' and yearmonth.date = '201310' order by yearmonth.consumption desc limit 1	debit_card_specializing
select c.CustomerID, sum(t.Amount) as consumption from customers c join transactions_1k t on c.CustomerID = t.CustomerID where c.Segment = 'KAM' group by c.CustomerID order by consumption desc limit 1	debit_card_specializing
SELECT SUM(yearmonth.consumption) FROM yearmonth WHERE yearmonth.date = 201305 AND yearmonth.customerid IN (SELECT customerid FROM customers WHERE customers.segment = 'KAM');	debit_card_specializing
SELECT COUNT(*) / (SELECT COUNT(*) FROM customers WHERE Segment = 'LAM') * 100 FROM yearmonth WHERE CustomerID = 5 AND Consumption > 46.73	debit_card_specializing
SELECT Country, COUNT(*) FROM gasstations WHERE Segment = "Value for money" GROUP BY Country	debit_card_specializing
SELECT   (   SELECT     COUNT(*)   FROM     customers c   INNER JOIN     transactions_1k t ON c.CustomerID = t.CustomerID   WHERE     c.Segment = 'KAM' AND     t.Price > 0 AND     t.Price < 1  ) / (   SELECT     COUNT(*)   FROM     customers c   INNER JOIN     transactions_1k t ON c.CustomerID = t.CustomerID   WHERE     c.Segment = 'KAM'  ) * 100 AS Percentage ;	debit_card_specializing
select count(*) as total, sum(case when yearmonth.consumption > 528.3 then 1 else 0 end) as above_target from yearmonth where yearmonth.date = '201202'	debit_card_specializing
SELECT COUNT(*) / (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE') * 100 AS Percentage FROM gasstations WHERE Segment = 'Premium' AND Country = 'CZE';	debit_card_specializing
select yearmonth.CustomerID, sum(yearmonth.Consumption) as consumption from yearmonth where yearmonth.Date = '201309' group by yearmonth.CustomerID order by consumption desc limit 1	debit_card_specializing
SELECT Segment, min(Consumption) FROM yearmonth WHERE yearmonth.date = '201309' GROUP BY Segment	debit_card_specializing
SELECT yearmonth.date, yearmonth.consumption FROM yearmonth WHERE yearmonth.date = '201206' AND yearmonth.customerid IN (  SELECT customer.customerid  FROM customer  WHERE customer.segment = 'SME' ) ORDER BY yearmonth.consumption LIMIT 1	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%';	debit_card_specializing
SELECT CustomerID, Date, SUM(Consumption) / 12 AS Consumption FROM yearmonth WHERE Currency = 'EUR' GROUP BY CustomerID, Date ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT Description FROM products p, transactions_1k t, yearmonth y WHERE p.ProductID = t.ProductID AND t.CustomerID = y.CustomerID AND y.Date LIKE '201309%'	debit_card_specializing
SELECT DISTINCT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE substr(T2.Date,1,4) = '2013' AND substr(T2.Date,5,2) = '06'	debit_card_specializing
SELECT DISTINCT gasstations.ChainID FROM gasstations JOIN transactions_1k ON gasstations.GasStationID = transactions_1k.GasStationID WHERE transactions_1k.Amount = 'EUR';	debit_card_specializing
SELECT Description FROM products p, transactions_1k t WHERE p.ProductID = t.ProductID AND t.Amount = 28 AND t.Price = 672.64;	debit_card_specializing
SELECT AVG(Amount * Price) FROM transactions_1k WHERE Date LIKE '%2012-01%';	debit_card_specializing
SELECT COUNT(*) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000	debit_card_specializing
SELECT Description FROM products p, transactions_1k t, gasstations g WHERE p.ProductID = t.ProductID AND g.GasStationID = t.GasStationID AND g.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(Amount * Price) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE'	debit_card_specializing
SELECT AVG(t.Price * t.Amount) as average_total_price FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
select CustomerID, max(Price) as most_paid from transactions_1k where Date = '2012-08-25' group by CustomerID	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-25' AND T2.Amount > 0 LIMIT 1	debit_card_specializing
SELECT Currency FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00'	debit_card_specializing
SELECT Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-23' AND T2.Time = '21:20:00'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Currency = 'CZK';	debit_card_specializing
SELECT Segment FROM customers ORDER BY CustomerID LIMIT 1	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT T1.ProductID FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-23' AND T1.Time = '21:20:00'	debit_card_specializing
select Date, Consumption from yearmonth where CustomerID = (select CustomerID from transactions_1k where Date = '2012-08-24' and Amount = 124.05) and Date like '201201%';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date = '2012-08-26' AND transactions_1k.Time BETWEEN '08:00:00' AND '09:00:00'	debit_card_specializing
select currency from customers as c join yearmonth as y on c.customerid = y.customerid where y.date like '%201306%' and y.consumption = 214582.17	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.CardID = 667467	debit_card_specializing
SELECT c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24' AND t.Amount = 548.4	debit_card_specializing
SELECT COUNT(*) FROM customers WHERE Currency = 'EUR' AND Date = '2012-08-25'	debit_card_specializing
select (t1.consumption - t2.consumption) / t1.consumption from yearmonth t1, yearmonth t2 where t1.customerid = t2.customerid and t1.date = '2012-08-24' and t2.date = '2013-08-24'	debit_card_specializing
SELECT GasStationID, SUM(Amount * Price) AS Revenue FROM transactions_1k GROUP BY GasStationID ORDER BY Revenue DESC LIMIT 1	debit_card_specializing
SELECT SUM( Segment = "Premium" ) / COUNT( Segment ) AS "Premium Percentage" FROM gasstations WHERE Country = "SVK";	debit_card_specializing
SELECT SUM(t.Amount) FROM transactions_1k t WHERE t.CustomerID = 38508; SELECT SUM(t.Amount) FROM transactions_1k t WHERE t.CustomerID = 38508 AND t.Date = '201201';	debit_card_specializing
SELECT products.Description, SUM(transactions_1k.Amount) as total_amount FROM transactions_1k JOIN products ON transactions_1k.ProductID = products.ProductID GROUP BY transactions_1k.ProductID ORDER BY total_amount DESC LIMIT 5	debit_card_specializing
select top_spending_customer.customerid, top_spending_customer.total_price / top_spending_customer.total_amount as average_price_per_item, customers.currency from (select customerid, sum(price) as total_price, sum(amount) as total_amount       from transactions_1k       group by customerid       order by total_price desc       limit 1) as top_spending_customer join customers on top_spending_customer.customerid = customers.customerid	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ProductID = 2 AND T2.Amount = 1 ORDER BY T2.Price DESC LIMIT 1	debit_card_specializing
SELECT `yearmonth`.`Date`, `yearmonth`.`Consumption` FROM `yearmonth` WHERE `yearmonth`.`Date` = '201208' AND `yearmonth`.`CustomerID` IN (  SELECT `transactions_1k`.`CustomerID`  FROM `transactions_1k`  WHERE `transactions_1k`.`Date` = '201208'  AND `transactions_1k`.`ProductID` = 5  AND `transactions_1k`.`Price` / `transactions_1k`.`Amount` > 29.00 );	debit_card_specializing
