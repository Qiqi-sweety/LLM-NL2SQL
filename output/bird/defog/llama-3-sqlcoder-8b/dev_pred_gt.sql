SELECT MAX(free_meal_count_k12 / NULLIF(enrollment_k12, 0)) AS max_free_rate FROM frpm WHERE county_name = 'Alameda';	california_schools
SELECT f.CDSCode, f.School Name, f.District Name, f.County Name, f.Percentage(%) Eligible Free (Ages 5-17) FROM frpm f ORDER BY f.Percentage(%) Eligible Free (Ages 5-17) ASC LIMIT 3;	california_schools
SELECT s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Fresno' AND f."Charter School (Y/N)" = 1;	california_schools
SELECT s.MailStreet, s.MailCity, s.MailState, s.MailZip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.District Code = (SELECT f.District Code FROM frpm f ORDER BY f.FRPM Count (K-12) DESC LIMIT 1);	california_schools
SELECT s.Phone FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.Charter_School (Y/N) = 1 AND f.Charter Funding Type = 'Directly funded' AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores ss ON f.CDSCode = ss.cds WHERE f.Virtual = 'F' AND ss.AvgScrMath < 400;	california_schools
SELECT s.CDSCode, s.School FROM satscores s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.NumTstTakr > 500 AND s.Magnet = 1;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 IS NOT NULL ORDER BY ss.NumGE1500 DESC NULLS LAST LIMIT 1;	california_schools
WITH frpm_rank AS (SELECT f.CDSCode, f.FRPM_Count_K_12 AS frpm_count, RANK() OVER (ORDER BY f.FRPM_Count_K_12 DESC) AS rank FROM frpm f) SELECT COUNT(s.NumTstTakr) AS num_test_takers FROM frpm_rank fr JOIN satscores s ON fr.CDSCode = s.cds WHERE fr.rank = 1;	california_schools
SELECT COUNT(*) FROM frpm f WHERE f.CDSCode IN (SELECT s.CDS FROM satscores s WHERE s.AvgScrMath > 560 AND s.rtype = 'Directly funded');	california_schools
SELECT s.CDSCode, s.sname, s.dname, s.cname, s.enroll12, s.NumTstTakr, s.AvgScrRead, f.FRPM_Count_Ages_5_17 FROM satscores s JOIN frpm f ON s.CDSCode = f.CDSCode ORDER BY s.AvgScrRead DESC LIMIT 1;	california_schools
SELECT f.CDSCode FROM frpm f WHERE f."Enrollment (K-12)" + f."Enrollment (Ages 5-17)" > 500;	california_schools
SELECT MAX(free_meal_count / enrollment) AS max_free_rate FROM frpm WHERE percent_eligible_frpm_ages_5_17 > 0.3;	california_schools
SELECT s.Phone FROM satscores s WHERE s.NumGE1500 / NULLIF(s.NumTstTakr, 0) >= (SELECT NumGE1500 / NULLIF(NumTstTakr, 0) FROM satscores ORDER BY NumGE1500 / NULLIF(NumTstTakr, 0) DESC LIMIT 3) ORDER BY s.Phone NULLS LAST;	california_schools
SELECT s.NCESSchool, COUNT(*) AS total_enrollment FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Low Grade` = 'K' AND f.`High Grade` = '17' GROUP BY s.NCESSchool ORDER BY total_enrollment DESC LIMIT 5;	california_schools
WITH avg_scores AS (SELECT s.District, AVG(t.AvgScrRead) AS avg_score FROM frpm t JOIN schools s ON t.CDSCode = s.CDSCode WHERE t.`Charter School (Y/N)` = 1 AND t.`Charter School Number` IS NOT NULL GROUP BY s.District) SELECT ds.District, ds.avg_score FROM avg_scores ds ORDER BY ds.avg_score DESC NULLS LAST LIMIT 1;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM satscores s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.NumTstTakr < 100 AND f.`District Name` = 'Alameda County Office of Education';	california_schools
SELECT s.ChartNumber FROM satscores s WHERE s.AvgScrWrite = 499;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM satscores s JOIN schools sc ON s.CDSCode = sc.CDSCode WHERE s.NumTstTakr <= 250 AND sc.County = 'Contra Costa' AND sc.FundingType = 'Directly funded';	california_schools
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath IS NOT NULL ORDER BY ss.AvgScrMath DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm f WHERE f.`Low Grade` = '9' AND f.`High Grade` = '12' AND f.`District Name` = 'Amador';	california_schools
SELECT COUNT(*) FROM frpm f WHERE f.District Name = 'Los Angeles' AND f.Free Meal Count (K-12) > 500 AND f.Free Meal Count (K-12) < 700;	california_schools
SELECT s.CDSCode, s.School, s.District, s.County, MAX(s.NumTstTakr) AS max_test_takers FROM satscores s WHERE s.rtype = 'High School' AND s.cname = 'Contra Costa' GROUP BY s.CDSCode, s.School, s.District, s.County ORDER BY max_test_takers DESC LIMIT 1;	california_schools
SELECT s.street, s.streetabr, s.city, s.zip, s.state, s.mailstreet, s.mailstrabr, s.mailcity, s.mailzip, s.mailstate, (frpm.enrollment_k_12 - frpm.enrollment_ages_5_17) AS enrollment_difference FROM frpm JOIN schools s ON frpm.cdscode = s.cdscode WHERE (frpm.enrollment_k_12 - frpm.enrollment_ages_5_17) > 30;	california_schools
SELECT s.School, s.District, s.County, s.NCESDist, s.NCESSchool, f.Percent_ Eligible_Free_(K-12) AS percent_free_meal, srt.AvgScrRead, srt.AvgScrMath, srt.AvgScrWrite, srt.NumGE1500 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores srt ON s.CDSCode = srt.cds WHERE f.Percent_Eligible_Free_(K-12) > 0.1 AND srt.NumGE1500 > 0;	california_schools
SELECT s.CDSCode, s.School, s.FundingType FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.District Code = 'Riverside' AND (SELECT SUM(f.AvgScrMath) / COUNT(s.CDSCode) FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.District Code = 'Riverside') > 400;	california_schools
SELECT s.School, s.Street, s.City, s.State, s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.'School Type' = 'High Schools (Public)' AND f.'District Type' = 'County Office of Education (COE)' AND f.'Percent (%) Eligible FRPM (Ages 5-17)' > 0.8 AND f.'Age Group' = '15-17' ORDER BY s.School NULLS LAST;	california_schools
SELECT s.School, AVG(ss.AvgScrWrite) AS avg_score, s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE (s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01') GROUP BY s.School, s.Phone;	california_schools
SELECT s.School, s.DOC FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f."Charter School (Y/N)" = 0 AND ((f."Enrollment (K-12)" - f."Enrollment (Ages 5-17)") > (SELECT AVG(f."Enrollment (K-12)" - f."Enrollment (Ages 5-17)") FROM frpm f WHERE f."Charter School (Y/N)" = 0));	california_schools
SELECT s.OpenDate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.Low Grade = 'K' AND f.High Grade = '12' ORDER BY s.OpenDate ASC LIMIT 1;	california_schools
SELECT s.City, SUM(f.FRPM_Count_K_12) AS total_enrollment FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.Low_Grade = '1' AND f.High_Grade = '12' GROUP BY s.City ORDER BY total_enrollment ASC LIMIT 5;	california_schools
SELECT s.CDSCode, s.School, s.District, s.County, (f.`Free Meal Count (K-12)` / NULLIF(f.`Enrollment (K-12)`, 0)) AS eligible_free_rate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.`Enrollment (K-12)` DESC NULLS LAST LIMIT 10;	california_schools
SELECT s.CDSCode, (f.FRPM_Count_K_12 / NULLIF(f.Enrollment_K_12, 0)) AS Eligible_Free_or_Reduced_Price_Meal_Rate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.StatusType = '66' ORDER BY f.FRPM_Count_K_12 DESC LIMIT 5;	california_schools
SELECT s.school, s.website FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.free_meal_count_ages_5_17 BETWEEN 1900 AND 2000;	california_schools
SELECT (SUM(f.FreeMealCountAges517) / NULLIF(SUM(f.EnrollmentAges517), 0)) * 100 AS free_rate FROM frpm f WHERE f.SchoolName = 'Kacey Gibson';	california_schools
SELECT s.CDSCode, s.School, s.AdminEmail1, s.AdminEmail2, s.AdminEmail3 FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f."Charter School (Y/N)" = 1 ORDER BY f."Enrollment (K-12)" ASC LIMIT 1;	california_schools
SELECT s.admfname1 ||'' || s.admlname1 AS full_name FROM satscores ss JOIN schools s ON ss.cds = s.cds WHERE ss.numge1500 = (SELECT MAX(numge1500) FROM satscores);	california_schools
SELECT s.Street, s.City, s.State, s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode ORDER BY f.NumGE1500 / NULLIF(f.NumTstTakr, 0) ASC LIMIT 1;	california_schools
SELECT s.website FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.IRC BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(s.NumTstTakr) AS average_test_takers FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.OpenDate BETWEEN '1980-01-01' AND '1980-12-31' AND sc.County = 'Fresno';	california_schools
SELECT s.Phone FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores sc ON f.CDSCode = sc.cds WHERE f.`District Name` = 'Fresno Unified' ORDER BY sc.AvgScrRead ASC LIMIT 1;	california_schools
SELECT s.CDSCode, AVG(s.AvgScrRead) AS avg_reading_score FROM satscores s JOIN schools v ON s.CDSCode = v.CDSCode WHERE v.Virtual = 'F' GROUP BY s.CDSCode ORDER BY avg_reading_score DESC NULLS LAST LIMIT 5;	california_schools
SELECT s.School, s.District, s.County, s.StatusType, s.EducationalOptionType FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.AvgScrMath = (SELECT MAX(f2.AvgScrMath) FROM frpm f2);	california_schools
SELECT s.AvgScrMath, s.cname FROM satscores s WHERE (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) = (SELECT MIN(s2.AvgScrRead + s2.AvgScrMath + s2.AvgScrWrite) FROM satscores s2);	california_schools
SELECT AVG(s.AvgScrWrite) AS average_writing_score, s.cname FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE s.NumGE1500 IS NOT NULL GROUP BY s.cds, s.cname ORDER BY s.NumGE1500 DESC LIMIT 1;	california_schools
SELECT s.CDSCode, AVG(ss.AvgScrWrite) AS avg_writing_score FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE (s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich') OR (s.AdmFName2 = 'Ricci' AND s.AdmLName2 = 'Ulrich') OR (s.AdmFName3 = 'Ricci' AND s.AdmLName3 = 'Ulrich') GROUP BY s.CDSCode ORDER BY avg_writing_score DESC NULLS LAST;	california_schools
SELECT s.state, SUM(s.enroll12) AS total_enrollment FROM schools s WHERE s.doc = '31' AND s.low_grade = 'K' AND s.high_grade = '12' GROUP BY s.state ORDER BY total_enrollment DESC NULLS LAST LIMIT 1;	california_schools
SELECT (COUNT(*)/12) AS average_monthly_openings FROM schools WHERE County = 'Alameda' AND StatusType = 'Open' AND OpenDate >= '1980-01-01' AND OpenDate < '1981-01-01' AND DOC = '52';	california_schools
SELECT CAST(COUNT(DISTINCT CASE WHEN s.DOC = '54' THEN s.CDSCode END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN s.DOC = '52' THEN s.CDSCode END), 0) AS ratio FROM schools s WHERE s.County = 'Orange';	california_schools
SELECT s.County, s.School, s.ClosedDate FROM schools s WHERE s.StatusType = 'Closed' GROUP BY s.County, s.School, s.ClosedDate ORDER BY COUNT(s.School) DESC NULLS LAST LIMIT 1;	california_schools
SELECT s.street FROM schools s JOIN frpm f ON s.cdscode = f.cdscode JOIN satscores ss ON s.cdscode = ss.cdscode WHERE ss.avgscrmath IS NOT NULL ORDER BY ss.avgscrmath DESC LIMIT 1 OFFSET 5;	california_schools
SELECT s.MailStreet FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.CDSCode IN (SELECT s.CDSCode FROM frpm f JOIN satscores ss ON f.CDSCode = ss.cds WHERE ss.AvgScrRead IS NOT NULL ORDER BY ss.AvgScrRead ASC LIMIT 1);	california_schools
SELECT COUNT(DISTINCT s.CDSCode) AS total_schools FROM satscores s JOIN schools sch ON s.CDSCode = sch.CDSCode WHERE (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) >= 1500 AND LOWER(sch.MailCity) = 'lakeport';	california_schools
SELECT SUM(s.NumTstTakr) AS total_test_takers FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE LOWER(sc.MailCity) = 'fresno';	california_schools
SELECT s.CDSCode, s.MailZip FROM schools s WHERE s.MailZip IN (SELECT s.MailZip FROM schools s WHERE s.AdmlName1 = 'Avetik' AND s.AdmlName2 = 'Atoian');	california_schools
SELECT CAST(COUNT(DISTINCT CASE WHEN s.County = 'Colusa' THEN s.CDSCode END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN s.County = 'Humboldt' THEN s.CDSCode END), 0) AS ratio FROM schools s WHERE s.State = 'California' AND s.County IN ('Colusa', 'Humboldt');	california_schools
SELECT COUNT(*) FROM schools s WHERE LOWER(s.MailState) = 'ca' AND LOWER(s.StatusType) = 'active';	california_schools
SELECT s.Phone, s.Ext FROM satscores ss JOIN schools s ON ss.CDS = s.CDSCode ORDER BY ss.AvgScrWrite DESC NULLS LAST LIMIT 1 OFFSET 332;	california_schools
SELECT s.Phone, s.Ext, s.School FROM schools s WHERE s.Zip = '95203-3704';	california_schools
SELECT s.Website FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.AdmFName1 ilike '%Mike Larson%' OR s.AdmLName1 ilike '%Mike Larson%' OR s.AdmFName2 ilike '%Mike Larson%' OR s.AdmLName2 ilike '%Mike Larson%' OR s.AdmFName3 ilike '%Mike Larson%' OR s.AdmLName3 ilike '%Mike Larson%' OR s.AdmFName1 ilike '%Dante Alvarez%' OR s.AdmLName1 ilike '%Dante Alvarez%' OR s.AdmFName2 ilike '%Dante Alvarez%' OR s.AdmLName2 ilike '%Dante Alvarez%' OR s.AdmFName3 ilike '%Dante Alvarez%' OR s.AdmLName3 ilike '%Dante Alvarez%';	california_schools
SELECT s.Website FROM schools s WHERE s.Virtual = 'P' AND s.Charter = 1 AND s.County = 'San Joaquin';	california_schools
SELECT COUNT(*) FROM schools s WHERE s.DOC = '52' AND s.Charter = 1 AND s.City = 'Hickman';	california_schools
SELECT COUNT(*) FROM frpm f WHERE f.Charter = 0 AND f.`County Name` = 'Los Angeles' AND f.`Percent (%) Eligible Free (K-12)` < 0.18;	california_schools
SELECT s.CDSCode, s.School, s.City, s.AdmlName1, s.AdmlName2, s.AdmlName3 FROM schools s WHERE s.Charter = 1 AND s.CharterNum = '00D2';	california_schools
SELECT COUNT(*) AS total_schools FROM schools s WHERE s.MailCity = 'Hickman' AND s.CharterNum = '00D4';	california_schools
SELECT (COUNT(DISTINCT CASE WHEN s.FundingType = 'Locally funded' THEN s.CDSCode END)::FLOAT / NULLIF(COUNT(DISTINCT s.FundingType), 0)) * 100 AS percentage FROM schools s WHERE s.County = 'Santa Clara';	california_schools
SELECT COUNT(*) FROM schools s WHERE s.FundingType = 'Directly Funded' AND s.County = 'Stanislaus' AND s.OpenDate BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT SUM(s.ClosureDate - s.OpenDate) AS TotalDays FROM schools s WHERE s.City = 'San Francisco' AND s.StatusType = 'Closed';	california_schools
SELECT s.County, COUNT(s.CDSCode) AS NumberOfClosures FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.SOC = '11' AND s.ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY s.County ORDER BY NumberOfClosures DESC NULLS LAST LIMIT 1;	california_schools
SELECT s.NCESDist FROM schools s WHERE s.SOC = '31';	california_schools
SELECT COUNT(*) FROM schools s WHERE LOWER(s.county) = 'alpine' AND (s.status_type = 'Active' OR s.status_type = 'Closed');	california_schools
SELECT s.District FROM schools s WHERE s.Virtual IS NULL AND s.Magnet = 0 AND s.City = 'Fresno';	california_schools
SELECT SUM(f.Free Meal Count (Ages 5-17)) AS total_students FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.EdOpsCode = 'SSS' AND f.`Academic Year` = '2014-2015';	california_schools
SELECT SUM(f.frpm_count_ages_5_17) AS total_free_or_reduced_price_meals FROM frpm f JOIN schools s ON f.cdscode = s.cdscode WHERE s.street_abr = 'PO Box 1040' AND s.status_type = 'Y';	california_schools
SELECT MIN(f.LOW_GRADE) AS lowest_grade FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.EDOPSCode = 'SPECON' AND s.NCESDist = '613360';	california_schools
SELECT s.School, s.SchoolType FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.DistrictCode = '37' AND f.EducationalOptionType = 'Breakfast Provision 2';	california_schools
SELECT s.City FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Low Grade` = '9' AND f.`High Grade` = '12' AND f.`County Name` = 'Merced' AND f.`EILCode` = 'HS' AND f.`Lunch Provision Status` = '2';	california_schools
SELECT s.School, frpm.Percent_ Eligible FRPM (Ages 5-17) FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND frpm.Low Grade = 'K' AND frpm.High Grade = '9';	california_schools
SELECT s.GradeSpan, COUNT(*) AS COUNT FROM Schools s WHERE s.City = 'Adelanto' GROUP BY s.GradeSpan ORDER BY COUNT DESC LIMIT 1;	california_schools
WITH SchoolCount AS (SELECT s.County, COUNT(s.CDSCode) AS NumSchools FROM schools s WHERE s.Virtual = 'F' AND s.County BETWEEN 'San Diego' AND 'Santa Barbara' GROUP BY s.County) SELECT sc.County, sc.NumSchools FROM SchoolCount sc ORDER BY sc.NumSchools DESC LIMIT 1;	california_schools
SELECT s.School, s.Latitude FROM schools s ORDER BY s.Latitude DESC NULLS LAST LIMIT 1;	california_schools
SELECT s.City, s.School, s.LowestGrade FROM schools s WHERE s.State = 'CA' ORDER BY s.Latitude ASC LIMIT 1;	california_schools
SELECT s.GSoffered FROM schools s WHERE s.Longitude = (SELECT MAX(s2.Longitude) FROM schools s2);	california_schools
SELECT s.city, COUNT(DISTINCT s.CDSCode) AS number_of_schools FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Magnet = 1 AND f.Low Grade = 'K' AND f.High Grade = '8' GROUP BY s.city ORDER BY number_of_schools DESC NULLS LAST;	california_schools
SELECT s.District, COUNT(*) AS frequency, s.AdmFName1 FROM schools s WHERE s.AdmFName1 IS NOT NULL AND s.AdmFName1!= '' GROUP BY s.District, s.AdmFName1 ORDER BY frequency DESC LIMIT 2;	california_schools
SELECT s.District Code, (f.Free Meal Count (K-12) / NULLIF(f.Enrollment (K-12), 0)) * 100 AS Percent Eligible Free FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 ilike '%Alusine%' AND s.StatusType = 'Active';	california_schools
SELECT s.CDSCode, s.District, s.County, s.School, s.AdmLName1 FROM schools s WHERE s.CharterNum = '40' AND s.AdmLName1 IS NOT NULL;	california_schools
SELECT s.admemail1 FROM schools s WHERE s.county = 'San Bernardino' AND s.district = 'San Bernardino City Unified' AND s.doc = '54' AND s.soc = '62' AND s.opendate BETWEEN '2009-01-01' AND '2010-12-31';	california_schools
WITH SchoolSAT AS (SELECT s.CDSCode, s.School, MAX(ss.NumTstTakr) AS MaxTestTakers FROM schools s JOIN satscores ss ON s.CDSCode = ss.CDSCode WHERE ss.NumGE1500 IS NOT NULL GROUP BY s.CDSCode, s.School) SELECT s.School, s.AdmEmail1 FROM SchoolSAT s JOIN schools sch ON s.CDSCode = sch.CDSCode ORDER BY s.MaxTestTakers DESC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Východní Čechy' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE d.A3 ilike '%Prague%';	financial
SELECT d.district_id, (d.A12 - d.A13) / d.A12 AS ratio_change, (CASE WHEN d.A12 > d.A13 THEN 'Decreased' WHEN d.A12 < d.A13 THEN 'Increased' ELSE 'Remained the same' END) AS change_direction FROM district d WHERE d.A12 IS NOT NULL AND d.A13 IS NOT NULL ORDER BY ratio_change DESC NULLS LAST LIMIT 1;	financial
SELECT COUNT(DISTINCT d.district_id) FROM district d JOIN account a ON d.district_id = a.district_id JOIN client c ON a.account_id = c.client_id WHERE c.gender = 'F' AND d.A11 > 6000 AND d.A11 < 10000;	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000;	financial
SELECT a.account_id, c.gender, d.A11, (SELECT MAX(d.A11) - MIN(d.A11) FROM district d) AS gap FROM account a JOIN client c ON a.district_id = c.district_id JOIN disp d ON a.account_id = d.account_id WHERE c.gender = 'F' ORDER BY c.birth_date ASC;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.birth_date = (SELECT MIN(c2.birth_date) FROM client c2);	financial
SELECT COUNT(*) AS number_of_customers FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'POPLATEK PO OBRATU' ORDER BY c.client_id NULLS LAST;	financial
SELECT a.account_id, a.frequency, l.amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.date BETWEEN '1997-01-01' AND '1997-12-31' ORDER BY l.amount ASC NULLS LAST LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE EXTRACT(YEAR FROM a.date) = 1993 AND l.duration > 12 ORDER BY l.amount DESC NULLS LAST LIMIT 1;	financial
SELECT COUNT(*) FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND c.district_id IN (SELECT district_id FROM district WHERE A2 = 'Slokolov');	financial
SELECT a.account_id FROM account a WHERE EXTRACT(YEAR FROM a.date) = 1995 ORDER BY a.date ASC LIMIT 1;	financial
SELECT a.account_id FROM account a WHERE a.date < '1997-01-01' AND a.frequency = 'POPLATEK MESICNE' AND a.amount > 3000;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'card' AND d.issued = '1994-03-03';	financial
SELECT a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND EXTRACT(YEAR FROM t.date) = 1998 AND EXTRACT(MONTH FROM t.date) = 10 AND EXTRACT(DAY FROM t.date) = 14;	financial
SELECT a.district_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date = '1994-08-25';	financial
SELECT MAX(t.amount) FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id JOIN disp d ON a.account_id = d.account_id WHERE c.birth_date = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id ORDER BY c.birth_date ASC, d.A11 DESC LIMIT 1;	financial
SELECT c.client_id, t.amount FROM client c JOIN account a ON c.client_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.date = (SELECT MIN(t2.date) FROM trans t2 WHERE t2.account_id = a.account_id) ORDER BY t.amount DESC NULLS LAST LIMIT 1;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.gender = 'F' AND a.district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik');	financial
SELECT d.disp_id FROM account a JOIN trans t ON a.account_id = t.account_id JOIN disp d ON a.account_id = d.account_id WHERE t.date = '1998-09-02' AND t.amount = 5100;	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 ilike '%Litomerice%' AND EXTRACT(YEAR FROM a.date) = 1996;	financial
SELECT d.A2 FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM client c JOIN account a ON c.client_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT a.account_id FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE d.A3 ilike '%Prague%' ORDER BY a.account_id ASC LIMIT 1;	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender = 'M' THEN c.client_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.client_id), 0) * 100 AS percentage_of_male FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'South Bohemia';	financial
SELECT ((MAX(t2.balance) - MIN(t1.balance)) / NULLIF(MIN(t1.balance), 0)) * 100 AS percentage_change FROM trans t1 JOIN trans t2 ON t1.account_id = t2.account_id AND t1.date = '1993-03-22' AND t2.date = '1998-12-27' WHERE t1.account_id IN (SELECT l.account_id FROM loan l WHERE l.date = '1993-07-05');	financial
SELECT (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) * 100.0 / NULLIF(SUM(l.amount), 0)) AS percentage FROM loan l;	financial
SELECT (SUM(CASE WHEN l.status = 'C' AND l.amount < 100000 THEN 1 ELSE 0 END) * 100.0 / NULLIF(SUM(l.amount), 0)) AS percentage FROM loan l;	financial
SELECT a.account_id, d.A2, d.A3 FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date > '1993-01-01' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, COUNT(a.account_id) AS frequency FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE a.date BETWEEN '1995-01-01' AND '2000-12-31' AND d.A2 ilike '%East Bohemia%' GROUP BY a.account_id ORDER BY frequency DESC NULLS LAST;	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice';	financial
SELECT d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2, d.A3 FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3 AS district, d.A11 AS average_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60;	financial
SELECT d.A3, ((d.A13 - d.A12) / NULLIF(d.A12, 0)) * 100 AS unemployment_rate_increase FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON c.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'D' AND a.date BETWEEN '1995-01-01' AND '1996-12-31' ORDER BY d.A3 NULLS LAST;	financial
SELECT CAST(COUNT(CASE WHEN d.A2 = 'Decin' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM account a JOIN district d ON a.district_id = d.district_id WHERE EXTRACT(YEAR FROM a.date) = 1993;	financial
SELECT a.account_id FROM account a WHERE a.frequency = 'POPLATEK MESICNE';	financial
SELECT d.A2, COUNT(*) AS female_count FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_count DESC NULLS LAST LIMIT 10;	financial
SELECT d.A2, SUM(t.amount) AS total_withdrawal FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.account_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawal DESC NULLS LAST LIMIT 10;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.district_id = c.district_id LEFT JOIN disp d ON a.account_id = d.account_id WHERE c.gender = 'M' AND d.account_id IS NULL AND c.district_id IN (SELECT district_id FROM district WHERE A3 = 'South Bohemia');	financial
SELECT d.A3, MAX(l.amount) AS max_loan_amount FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE l.status IN ('C', 'D') GROUP BY d.A3 ORDER BY max_loan_amount DESC LIMIT 1;	financial
SELECT AVG(l.amount) AS average_loan_amount FROM loan l JOIN client c ON l.account_id = c.client_id WHERE c.gender = 'M';	financial
SELECT d.A2, d.A3, d.A4, d.A5, d.A6, d.A7, d.A8, d.A9, d.A10, d.A11, d.A12, d.A13, d.A14, d.A15, d.A16 FROM district d WHERE d.A13 = (SELECT MAX(d2.A13) FROM district d2 WHERE d2.A13 IS NOT NULL);	financial
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A16 = (SELECT MAX(A16) FROM district);	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.operation = 'VYBER KARTOU' AND t.balance < 0 AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND l.date BETWEEN '1995-01-01' AND '1997-12-31' AND l.amount >= 250000 AND l.status = 'approved';	financial
SELECT COUNT(*) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.district_id = 1 AND l.status = 'C';	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A15 = (SELECT MAX(A15) FROM district WHERE A12 IS NULL);	financial
SELECT COUNT(*) FROM card c WHERE c.type = 'gold';	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek';	financial
SELECT d.A2 AS district_name, SUM(t.amount) AS total_transaction_amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE EXTRACT(YEAR FROM a.date) = 1997 AND t.amount > 10000 GROUP BY d.A2;	financial
SELECT a.account_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.k_symbol = 'SIPO';	financial
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.account_id = c.card_id WHERE c.type = 'GOLD' AND c.type = 'JUNIOR';	financial
SELECT AVG(t.amount) AS average_amount FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.type = 'VYBER KARTOU' AND EXTRACT(YEAR FROM t.date) = 2021;	financial
SELECT a.account_id FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.type = 'VYBER KARTOU' AND EXTRACT(YEAR FROM t.date) = 1998 AND t.amount < (SELECT AVG(t2.amount) FROM trans t2 JOIN account a2 ON t2.account_id = a2.account_id WHERE t2.type = 'VYBER KARTOU' AND EXTRACT(YEAR FROM t2.date) = 1998);	financial
SELECT DISTINCT a.account_id, a.frequency FROM account a JOIN client c ON a.account_id = c.client_id JOIN card cd ON a.account_id = cd.disp_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' AND cd.type = 'credit';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 ilike '%South Bohemia%';	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.frequency = 'OWNER' AND a.district_id IN (SELECT district_id FROM district WHERE A2 = 'Tabor');	financial
SELECT a.frequency FROM account a WHERE a.frequency!= 'OWNER' AND a.frequency IN (SELECT a.frequency FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.A11 BETWEEN 8000 AND 9000) ORDER BY a.frequency NULLS LAST;	financial
SELECT COUNT(*) FROM account a JOIN trans t ON a.account_id = t.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 ilike '%North Bohemia%' AND t.bank ilike '%AB%';	financial
SELECT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ ORDER BY d.A2 NULLS LAST;	financial
SELECT AVG(d.A15) AS average_crimes_1995 FROM district d WHERE d.A3 IN (SELECT a.district_id FROM account a WHERE a.date >= '1997-01-01') AND d.A15 > 4000;	financial
SELECT COUNT(*) FROM card c JOIN account a ON c.disp_id = a.account_id WHERE c.type = 'CLASSIC' AND a.frequency = 'OWNER';	financial
SELECT COUNT(*) AS male_clients FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A2 ilike '%Hl.m.%Praha%' AND c.gender = 'M';	financial
SELECT (COUNT(CASE WHEN c.type = 'Gold' AND c.issued < '1998-01-01' THEN 1 END)::FLOAT / NULLIF(COUNT(*), 0)) * 100 AS percentage FROM card c;	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN account a ON c.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id ORDER BY l.amount DESC LIMIT 1;	financial
SELECT d.A15 FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.account_id = 1;	financial
SELECT a.district_id FROM account a JOIN `order` o ON a.account_id = o.account_id WHERE o.account_id = 33333;	financial
SELECT t.amount FROM trans t JOIN client c ON t.account_id = c.client_id WHERE c.client_id = 3356 AND t.operation = 'VYBER';	financial
SELECT COUNT(*) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT c.type FROM client cl JOIN disp d ON cl.client_id = d.client_id JOIN card c ON d.account_id = c.disp_id WHERE cl.client_id = 13539;	financial
SELECT d.A3 FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = 3541;	financial
WITH total_accounts AS (SELECT d.district_id, COUNT(a.account_id) AS account_count FROM account a JOIN loan l ON a.account_id = l.account_id JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE l.status = 'A' GROUP BY d.district_id) SELECT d.A2, ta.account_count FROM total_accounts ta JOIN district d ON ta.district_id = d.district_id ORDER BY ta.account_count DESC LIMIT 1;	financial
SELECT c.client_id, c.gender, c.birth_date, c.district_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 32423;	financial
SELECT t.trans_id, t.date, t.type, t.amount FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5 ORDER BY t.date NULLS LAST;	financial
SELECT COUNT(*) FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.district_id = 18;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.account_id = cd.disp_id WHERE cd.type = 'JUNIOR' AND cd.issued >= '1997-01-01';	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender = 'F' THEN c.client_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.account_id), 0) AS proportion FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.date BETWEEN '1995-01-01' AND '1995-12-31' AND a.frequency = 'POPLATEK MESICNE' AND a.date <= '1995-03-24' AND a.date >= '1995-03-25' AND d.A11 > 10000;	financial
WITH total_1996 AS (SELECT SUM(amount) AS total_1996 FROM loan JOIN account ON loan.account_id = account.account_id JOIN client ON account.client_id = client.client_id WHERE client.gender = 'M' AND EXTRACT(YEAR FROM loan.date) = 1996), total_1997 AS (SELECT SUM(amount) AS total_1997 FROM loan JOIN account ON loan.account_id = account.account_id JOIN client ON account.client_id = client.client_id WHERE client.gender = 'M' AND EXTRACT(YEAR FROM loan.date) = 1997) SELECT ((total_1997 - total_1996) / NULLIF(total_1996, 0)) * 100 AS growth_rate FROM total_1996, total_1997;	financial
SELECT COUNT(*) FROM trans t WHERE t.operation = 'VYBER KARTOU' AND t.date > '1995-12-31';	financial
SELECT (SELECT SUM(d.A16) FROM district d WHERE d.A3 = 'North Bohemia') - (SELECT SUM(d.A16) FROM district d WHERE d.A3 = 'East Bohemia');	financial
SELECT COUNT(DISTINCT c.client_id) AS number_of_clients, COUNT(DISTINCT d.disp_id) AS number_of_disps FROM account a JOIN client c ON a.district_id = c.district_id JOIN disp d ON a.account_id = d.account_id WHERE a.account_id BETWEEN 1 AND 10;	financial
SELECT COUNT(*) AS frequency, SUM(amount) AS total_amount FROM trans WHERE account_id = 3 AND type = 'DEBIT' AND k_symbol ='statement';	financial
SELECT c.birth_date FROM client c JOIN account a ON c.client_id = a.account_id WHERE a.account_id = 130;	financial
SELECT COUNT(*) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT SUM(l.amount) AS total_amount, SUM(l.payments) AS total_payments FROM loan l JOIN account a ON l.account_id = a.account_id WHERE a.account_id IN (SELECT c.client_id FROM client c WHERE c.client_id = 992);	financial
SELECT SUM(t.amount) AS total_amount, c.gender FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.client_id = c.client_id WHERE t.trans_id = 851 AND a.account_id IN (SELECT account_id FROM account WHERE client_id = 4);	financial
SELECT c.type FROM client cl JOIN disp d ON cl.client_id = d.client_id JOIN card c ON d.account_id = c.disp_id WHERE cl.client_id = 9;	financial
SELECT SUM(t.amount) FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.client_id = 617 AND EXTRACT(YEAR FROM t.date) = 1998;	financial
SELECT c.client_id, c.gender, c.birth_date, a.district_id FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT c.client_id, l.amount FROM client c JOIN account a ON c.client_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.amount > 4000;	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 ilike '%Beroun%' AND a.date > '1996-12-31';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.account_id = cd.disp_id WHERE c.gender = 'F' AND cd.type = 'credit';	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender = 'F' THEN a.account_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.account_id), 0) * 100 AS proportion FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 ILIKE '%Prague%';	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender = 'M' THEN a.account_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.account_id), 0) * 100 AS percentage_of_male_clients FROM account a JOIN client c ON a.account_id = c.client_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(*) FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT a.account_id, a.date, l.amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE (l.date + interval '24 months') > CURRENT_DATE AND a.date < '1997-01-01' ORDER BY l.amount ASC NULLS LAST LIMIT 1;	financial
SELECT a.account_id FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.gender = 'F' ORDER BY c.birth_date ASC, a.A11 ASC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE EXTRACT(YEAR FROM c.birth_date) = 1920 AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(*) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.duration = 24;	financial
WITH RunningContracts AS (SELECT l.account_id, SUM(l.amount) AS total_amount FROM loan l WHERE l.status = 'C' GROUP BY l.account_id), IssuanceAfterTransaction AS (SELECT t.account_id, SUM(t.amount) AS total_issue FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.frequency = 'POPLATEK PO OBRATU' GROUP BY t.account_id) SELECT rc.account_id, AVG(rc.total_amount + i.total_issue) AS average_amount FROM RunningContracts rc JOIN IssuanceAfterTransaction i ON rc.account_id = i.account_id GROUP BY rc.account_id ORDER BY rc.account_id NULLS LAST;	financial
SELECT c.client_id, d.district_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'permanent' AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT c.client_id, EXTRACT(YEAR FROM age(CURRENT_DATE, c.birth_date)) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.account_id = cd.disp_id WHERE cd.type = 'GOLD' AND d.account_id IN (SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'active');	financial
SELECT b.bond_type FROM bond b GROUP BY b.bond_type ORDER BY COUNT(b.bond_type) DESC LIMIT 1;	toxicology
SELECT COUNT(*) AS chlorine_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'cl' AND m.label = '-';	toxicology
SELECT AVG(COUNT(a.atom_id)) AS avg_oxygen_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-' AND a.element = 'o';	toxicology
SELECT AVG(DIVIDE(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END), COUNT(c.atom_id))) AS average_single_bonded_carcinogenic_molecules FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT COUNT(*) AS non_carcinogenic_atoms FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT CAST(SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(a.atom_id), 0) AS fraction_of_carbon FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'double-bond';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom a WHERE a.element!= 'br';	toxicology
SELECT COUNT(*) AS number_of_carcinogenic_molecules FROM molecule m WHERE m.label = '+' AND m.molecule_id BETWEEN 'TR000' AND 'TR099';	toxicology
SELECT a.molecule_id FROM atom a WHERE a.element ='si';	toxicology
SELECT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'double';	toxicology
SELECT m.label, COUNT(*) AS count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY count DESC LIMIT 1;	toxicology
SELECT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'te';	toxicology
SELECT a.atom_id, a2.atom_id AS connected_atom_id FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT element, COUNT(*) AS frequency FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE label = '-' GROUP BY element ORDER BY frequency ASC LIMIT 1;	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20';	toxicology
SELECT DISTINCT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element!='sn' AND m.label IN ('+', '-');	toxicology
SELECT COUNT(*) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'i' OR a.element ='s' AND b.bond_type = '-';	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR181';	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN a.element = 'f' THEN a.atom_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.atom_id), 0) AS proportion FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT DIVIDE(SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END), COUNT(b.bond_id)) AS percent FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC NULLS LAST LIMIT 3;	toxicology
SELECT a1.element AS atom1, a2.element AS atom2 FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_2_6' AND c.molecule_id = 'TR001';	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule;	toxicology
SELECT c.atom_id FROM connected c WHERE c.bond_id = 'TR_000_2_5';	toxicology
SELECT c.bond_id FROM connected c WHERE c.atom_id = 'TR000_2';	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = 'double' ORDER BY m.label ASC LIMIT 5;	toxicology
SELECT SUM(CASE WHEN b.bond_type = 'double' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(b.bond_id), 0) AS percent FROM bond b WHERE b.molecule_id = 'TR008';	toxicology
SELECT DIVIDE(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END), COUNT(molecule_id)) AS percent FROM molecule;	toxicology
SELECT (SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) * 100.0 / COUNT(atom_id)) AS percent FROM atom WHERE molecule_id = 'TR206';	toxicology
SELECT DISTINCT b.bond_type FROM bond b WHERE b.molecule_id = 'TR000';	toxicology
SELECT a.element, m.label FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON c.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR060';	toxicology
SELECT MAX(COUNT(b.bond_type)) AS majority_bond_type FROM bond b WHERE b.molecule_id = 'TR018'; SELECT m.label FROM molecule m WHERE m.molecule_id = 'TR018';	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-' GROUP BY m.label ORDER BY m.label ASC LIMIT 3;	toxicology
SELECT b.bond_type FROM bond b WHERE b.molecule_id = 'TR006' ORDER BY b.bond_type ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected c JOIN atom a ON (c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id) WHERE a.atom_id = 'TR009_12' AND c.molecule_id = 'TR009';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'br' AND m.label = '+';	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.bond_id = 'TR001_6_9';	toxicology
SELECT a.molecule_id, CASE WHEN m.label = '+' THEN 'carcinogenic' ELSE 'not carcinogenic' END AS carcinogenic FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT COUNT(c.bond_id) FROM connected c WHERE c.atom_id like 'TR%_19';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a WHERE a.atom_id BETWEEN 'TR000_21' AND 'TR000_25' AND a.molecule_id IN (SELECT m.molecule_id FROM molecule m WHERE m.label = '+');	toxicology
SELECT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'p' AND a2.element = 'n';	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = 'double' ORDER BY m.label DESC LIMIT 1;	toxicology
SELECT AVG(COUNT(bond_id)::FLOAT / NULLIF(COUNT(atom_id), 0)) AS avg_bonds FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN connected AS connected2 ON atom.atom_id = connected2.atom_id2 WHERE atom.element = 'i';	toxicology
SELECT b.bond_type, b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.atom_id = (SELECT atom_id FROM atom WHERE atom_id = 'TR000_' || CAST(45 AS TEXT) || '_1');	toxicology
SELECT DISTINCT a.element FROM atom a WHERE a.atom_id NOT IN (SELECT c.atom_id FROM connected c);	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a.element FROM atom a WHERE a.atom_id = 'TR144_8_19';	toxicology
SELECT m.molecule_id, COUNT(*) AS num_double_bonds FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = 'double' AND m.label = '+' GROUP BY m.molecule_id ORDER BY num_double_bonds DESC LIMIT 1;	toxicology
SELECT element, COUNT(*) AS count FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY element ORDER BY count ASC LIMIT 1;	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom b ON c.atom_id2 = b.atom_id WHERE a.element = 'pb';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT CAST(COUNT(DISTINCT b.bond_id) AS FLOAT) / NULLIF((SELECT COUNT(DISTINCT a.atom_id) FROM atom a), 0) AS proportion FROM connected c JOIN atom a ON c.atom_id = a.atom_id AND atom_id2 = a.atom_id2 JOIN bond b ON c.bond_id = b.bond_id;	toxicology
SELECT SUM(CASE WHEN b.bond_type = '-' AND m.label = '+' THEN 1 ELSE 0 END)::FLOAT / NULLIF(COUNT(*), 0) AS proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id;	toxicology
SELECT COUNT(*) FROM atom a WHERE a.element IN ('c', 'h');	toxicology
SELECT a.atom_id2 FROM atom a WHERE a.element ='s';	toxicology
SELECT b.bond_type FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element ='sn';	toxicology
SELECT COUNT(DISTINCT a.element) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS total_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('p', 'br') AND b.bond_type = '#';	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END)::FLOAT / NULLIF(COUNT(*), 0) AS percent FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT m.label FROM molecule m WHERE m.molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m WHERE m.label = '-';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';	toxicology
SELECT b.bond_type FROM bond b WHERE b.molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(*) AS bond_count FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 'i';	toxicology
SELECT MAX(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic, MAX(CASE WHEN m.label = '-' THEN 1 ELSE 0 END) AS non_carcinogenic FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca';	toxicology
SELECT 1 FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN connected c2 ON a.atom_id = c2.atom_id JOIN atom b ON c.atom_id2 = b.atom_id AND c2.atom_id2 = b.atom_id WHERE a.element = 'cl' AND b.element = 'c' AND c.bond_id = 'TR001_1_8' AND c2.bond_id = 'TR001_1_8';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND b.bond_type = '#' AND m.label = '-';	toxicology
SELECT DIVIDE(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END), COUNT(m)) AS percentage FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR001';	toxicology
SELECT DISTINCT b.molecule_id FROM bond b WHERE b.bond_type = 'double';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR005_16_26';	toxicology
SELECT COUNT(*) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT b.bond_id, m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT a.element, COUNT(*) AS frequency FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE length(a.atom_id) = 8 AND substr(a.atom_id, 7, 1) = '4' AND a.element IN ('cl', 'c', 'h') AND c.atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'cl') GROUP BY a.element;	toxicology
SELECT (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 1.0 / NULLIF(COUNT(a.element), 0)) AS ratio, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR006';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca';	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a.element = 'te' AND a2.element = 'te';	toxicology
SELECT a.element AS element1, b.element AS element2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom b ON c.atom_id2 = b.atom_id WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN b.bond_type = '#' THEN a.molecule_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.molecule_id), 0) AS fraction_of_molecules_with_triple_bonds FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id;	toxicology
SELECT (COUNT(CASE WHEN b.bond_type ='='THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percent FROM bond b WHERE b.molecule_id = 'TR047';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR000_1' AND m.label = '+';	toxicology
SELECT m.label FROM molecule m WHERE m.molecule_id = 'TR151' AND m.label = '+';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON c.atom_id = m.molecule_id WHERE m.molecule_id = 'TR151' AND a.element IN ('cl', 'br', 'as', 'po','sn', 'pb', 'te');	toxicology
SELECT COUNT(*) FROM molecule m WHERE m.label = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id BETWEEN 'TR010' AND 'TR050' AND a.element = 'c';	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND b.bond_type = 'double';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+';	toxicology
SELECT c.atom_id, c.atom_id2, b.bond_id, m.molecule_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE a1.atom_id = 'TR000_1';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label!= '-';	toxicology
SELECT (SUM(CASE WHEN a.element = 'h AND m.label = '+' THEN 1 ELSE 0 END) / NULLIF(COUNT(DISTINCT a.molecule_id), 0)) * 100 AS percentage FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id;	toxicology
SELECT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR186';	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.atom_id = 'TR007_4_19';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) AS num_double_bonds, m.label AS carcinogenic FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR006' AND b.bond_type = 'double' AND (m.label = '+' OR m.label = '-');	toxicology
SELECT DISTINCT a.molecule_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' ORDER BY a.molecule_id NULLS LAST;	toxicology
SELECT b.bond_id, a.atom_id, a2.atom_id AS atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT m.label, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a1.element, a2.element FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) AS number_of_bonds FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'cl' OR a2.element = 'cl';	toxicology
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS bond_types FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id;	toxicology
SELECT COUNT(DISTINCT b.molecule_id) AS number_of_molecules_with_double_bond, COUNT(DISTINCT CASE WHEN m.label = '+' THEN b.molecule_id END) AS number_of_carcinogenic_molecules FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = 'double';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element!='s' AND b.bond_type!='= ';	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005';	toxicology
SELECT COUNT(*) FROM bond b WHERE b.bond_type = '-';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT DISTINCT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label!= '+';	toxicology
SELECT DIVIDE(SUM(CASE WHEN label = '+' AND element = 'cl' THEN 1 ELSE 0 END), COUNT(molecule_id)) AS percentage FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE label = '+';	toxicology
SELECT b.molecule_id FROM bond b WHERE b.bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element) FROM connected c JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2';	toxicology
SELECT a.molecule_id FROM atom a WHERE a.atom_id = 'TR000_2' UNION SELECT a.molecule_id FROM atom a WHERE a.atom_id = 'TR000_4';	toxicology
SELECT a.element FROM atom a WHERE a.atom_id = 'TR000_1';	toxicology
SELECT a.element, m.label FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON c.atom_id = a.molecule_id WHERE a.molecule_id = 'TR000';	toxicology
SELECT SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) / NULLIF(COUNT(b.bond_id), 0) AS percentage FROM bond b;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element ='s' AND a.molecule_id IN (SELECT c.atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '==');	toxicology
SELECT m.molecule_id FROM molecule m JOIN (SELECT a.molecule_id FROM atom a GROUP BY a.molecule_id HAVING COUNT(a.atom_id) > 5) AS t ON m.molecule_id = t.molecule_id WHERE m.label = '-';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024';	toxicology
SELECT m.label, MAX(COUNT(a.atom_id)) AS max_atoms FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY m.label ORDER BY max_atoms DESC LIMIT 1;	toxicology
SELECT (COUNT(CASE WHEN a.element = 'h' AND b.bond_type = '#' AND m.label = '+' THEN 1 END) / NULLIF((SELECT COUNT(*) FROM molecule), 0)) * 100.0 AS percentage FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id;	toxicology
SELECT COUNT(*) FROM molecule m WHERE m.label = '+';	toxicology
SELECT COUNT(*) AS single_bond_molecules FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id BETWEEN 'TR004' AND 'TR010' AND b.bond_type = '-';	toxicology
SELECT COUNT(*) AS carbon_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN connected c2 ON a.atom_id = c2.atom_id JOIN atom b ON c.atom_id2 = b.atom_id WHERE a.element = 'c' AND b.element = 'c' AND a.molecule_id = 'TR000' AND b.molecule_id = 'TR000';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR000_4' AND m.label!= '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a.element = 'o' AND b.bond_type = 'double';	toxicology
SELECT COUNT(*) FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR016';	toxicology
SELECT c.atom_id FROM atom c JOIN connected b ON c.atom_id = b.atom_id JOIN bond d ON b.bond_id = d.bond_id WHERE c.element = 'c' AND d.bond_type = 'double';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'o' AND m.label = '+' ORDER BY a.atom_id NULLS LAST;	toxicology
SELECT c.name, c.text FROM cards c WHERE c.cardKingdomFoilId = c.cardKingdomId AND c.cardKingdomId IS NOT NULL;	card_games
SELECT c.name, c.text FROM cards c WHERE c.borderColor = 'borderless' AND c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL;	card_games
SELECT c.name FROM cards c WHERE c.faceConvertedManaCost > (SELECT MAX(c2.faceConvertedManaCost) FROM cards c2);	card_games
SELECT c.name, c.uuid FROM cards c WHERE c.frameVersion = '2015' AND c.edhrecRank < 100;	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity ='mythic' AND l.status = 'Banned' AND l.format = 'gladiator';	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.type = 'Artifact' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'commander' AND l.status = 'Legal' AND (c.power = '*' OR c.power IS NULL);	card_games
SELECT c.uuid, c.text, r.text AS ruling, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele';	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
WITH RulingCount AS (SELECT c.name, c.artist, COUNT(r.uuid) AS numRulings, c.isPromo FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid GROUP BY c.name, c.artist, c.isPromo) SELECT rc.name, rc.artist, rc.numRulings, rc.isPromo FROM RulingCount rc WHERE rc.numRulings = (SELECT MAX(numRulings) FROM RulingCount) AND rc.isPromo = 1;	card_games
SELECT f.language FROM foreign_data f WHERE f.name = 'Annul' AND f.multiverseid = 29;	card_games
SELECT c.uuid, c.name FROM cards c WHERE c.uuid IN (SELECT fd.uuid FROM foreign_data fd WHERE fd.language = 'Japanese');	card_games
SELECT (SUM(CASE WHEN f.language = 'Chinese Simplified' THEN 1 ELSE 0 END)::FLOAT / NULLIF(COUNT(*), 0)) * 100 AS percentage FROM cards c JOIN foreign_data f ON c.uuid = f.uuid;	card_games
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT c.type) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.artist = 'Aaron Boyd';	card_games
SELECT c.keywords FROM cards c WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards c WHERE c.power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT cards.borderColor FROM cards WHERE cards.name = 'Ancestor''s Chosen';	card_games
SELECT c.type FROM cards c WHERE c.name = 'Ancestor''s Chosen' AND c.originalType IS NOT NULL;	card_games
SELECT DISTINCT s.setCode, st.language FROM sets s JOIN set_translations st ON s.setCode = st.setCode JOIN cards c ON s.setCode = c.setCode WHERE c.name ilike '%Angel%of%Mercy%' ORDER BY s.setCode;	card_games
SELECT COUNT(*) FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status ='restricted' AND c.isTextless = 0;	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status ='restricted' AND c.isStarter = 1;	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name ilike '%Cloudchaser Eagle%';	card_games
SELECT c.type FROM cards c WHERE c.name = 'Benalish Knight';	card_games
SELECT r.text FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Benalish Knight' AND l.format ='standard';	card_games
SELECT c.artist FROM cards c WHERE c.name LIKE '%Phyrexian%';	card_games
SELECT (COUNT(CASE WHEN c.borderColor = 'borderless' THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage_of_borderless_cards FROM cards c;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.borderColor = 'borderless' AND fd.language = 'Russian';	card_games
SELECT (COUNT(CASE WHEN c.language = 'French' THEN 1 END)::FLOAT / NULLIF(COUNT(CASE WHEN c.isStorySpotlight = 1 THEN 1 END), 0)) * 100 AS percentage FROM cards c WHERE c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards c WHERE c.toughness = '99';	card_games
SELECT c.name FROM cards c WHERE c.artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards c WHERE c.borderColor = 'black' AND c.availability ='mtgo';	card_games
SELECT c.id FROM cards c WHERE c.convertedManaCost = 0;	card_games
SELECT c.layout FROM cards c WHERE c.keywords LIKE '%Flying%';	card_games
SELECT COUNT(*) FROM cards c WHERE LOWER(c.subtypes)!= 'angel' AND LOWER(c.originalType) ='summon - angel';	card_games
SELECT c.id FROM cards c WHERE c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL;	card_games
SELECT c.id FROM cards c WHERE c.duelDeck = 'a';	card_games
SELECT c.edhrecRank FROM cards c WHERE c.frameVersion = '2015';	card_games
SELECT DISTINCT artist FROM cards WHERE artist LIKE '%Chinese Simplified%';	card_games
SELECT c.uuid, c.name FROM cards c WHERE c.availability = 'paper' AND c.language = 'Japanese';	card_games
SELECT COUNT(*) FROM cards c WHERE c.borderColor = 'white' AND c.status = 'Banned';	card_games
SELECT c.uuid, f.language FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.type = 'Legacy';	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT COUNT(*) AS number_of_cards, status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'legal';	card_games
SELECT c.name, c.colorIdentity FROM cards c WHERE c.setCode = 'OGW';	card_games
SELECT c.uuid, f.text AS flavor_text, s.translation FROM cards c JOIN foreign_data f ON c.uuid = f.uuid JOIN set_translations s ON c.setCode = s.setCode AND s.language = 'English' WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT c.colors, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20;	card_games
SELECT c.uuid, c.name, f.flavorText FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.colors = 'B' AND f.language!= 'en';	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.artist = 'John Avon' AND (c.cardKingdomId IS NOT NULL AND c.cardKingdomFoilId IS NOT NULL);	card_games
SELECT COUNT(*) FROM cards c WHERE c.borderColor = 'white' AND (c.cardKingdomFoilId = c.cardKingdomId AND c.cardKingdomId IS NOT NULL);	card_games
SELECT COUNT(*) FROM cards c WHERE c.artist = 'UDON' AND c.availability ='mtgo' AND c.hand = -1;	card_games
SELECT COUNT(*) FROM cards c WHERE c.hasContentWarning = 1 AND c.availability = 'paper' AND c.frameVersion = '1993';	card_games
SELECT c.manaCost FROM cards c WHERE c.layout = 'normal' AND c.frameVersion = '2003' AND c.borderColor = 'black' AND c.availability = 'paper,mtgo';	card_games
SELECT SUM(CAST(c.manaCost AS REAL)) FROM cards c WHERE c.artist = 'Rob Alexander';	card_games
SELECT DISTINCT t FROM cards WHERE t IN (SELECT types FROM cards WHERE availability = 'arena');	card_games
SELECT s.setCode FROM cards c JOIN foreign_data f ON c.uuid = f.uuid JOIN set_translations st ON f.language = st.language AND f.multiverseid = st.setCode WHERE LOWER(st.translation) ='spanish';	card_games
SELECT CAST(COUNT(CASE WHEN c.hand = '+3' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS percentage FROM cards c WHERE c.frameEffects = 'legendary';	card_games
SELECT c.id, CAST(SUM(CASE WHEN c.isStorylight = 1 AND c.isTextless = 1 THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(SUM(CASE WHEN c.isStorylight = 1 THEN 1 ELSE 0 END), 0) * 100 AS percentage FROM cards c WHERE c.isStorylight = 1 GROUP BY c.id ORDER BY percentage DESC NULLS LAST;	card_games
SELECT c.name, (COUNT(c.id) / (SELECT COUNT(*) FROM cards) * 100) AS percentage FROM cards c WHERE c.language = 'Spanish' GROUP BY c.name;	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.totalSetSize = 309;	card_games
SELECT COUNT(*) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.type = 'Commander' AND st.language = 'Portuguese (Brasil)';	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.type = 'Creature' AND l.status = 'Legal';	card_games
SELECT c.type FROM cards c WHERE c.uuid IN (SELECT fd.uuid FROM foreign_data fd WHERE fd.language = 'de') AND (c.subtypes IS NOT NULL AND c.supertypes IS NOT NULL);	card_games
SELECT COUNT(*) FROM cards c WHERE c.power IS NULL;	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'premodern' AND c.rulings IS NOT NULL AND c.rulings LIKE '%This is a triggered mana ability%' AND c.side IS NULL;	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability = 'paper';	card_games
SELECT artist FROM cards WHERE text = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.artist = 'Matthew D. Wilson' AND c.borderColor = 'black' AND c.layout = 'normal' AND c.type = 'Creature' AND f.language = 'French';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND l.status = 'Legal' AND l.format = 'Constructed' AND l.status = 'Legal' AND l.format = 'Constructed' AND l.date = '2009-01-10';	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.totalSetSize = 180;	card_games
SELECT CAST(SUM(CASE WHEN c.hasContentWarning = 0 THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'commander' AND l.status = 'legal';	card_games
SELECT DIVIDE(COUNT(CASE WHEN c.language = 'French' AND (c.power IS NULL OR c.power = '*') THEN 1 END), COUNT(CASE WHEN (c.power IS NULL OR c.power = '*') THEN 1 END)) * 100 AS percentage FROM cards c WHERE (c.power IS NULL OR c.power = '*');	card_games
SELECT DIVIDE(COUNT(DISTINCT s.code), NULLIF((SELECT COUNT(DISTINCT s.code) FROM sets s WHERE s.type = 'expansion'), 0)) * 100 AS percentage FROM sets s WHERE s.type = 'expansion' AND s.code IN (SELECT st.setCode FROM set_translations st WHERE st.language = 'Japanese');	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards c WHERE c.borderColor = 'borderless' AND c.edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT c.name FROM cards c WHERE (c.power IS NULL OR c.power = '*') AND c.promoTypes = 'arenaleague' ORDER BY c.name ASC NULLS LAST LIMIT 3;	card_games
SELECT f.text FROM foreign_data f WHERE f.multiverseid = 149934;	card_games
SELECT c.cardKingdomFoilId, c.cardKingdomId FROM cards c WHERE c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL ORDER BY c.cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT DIVIDE(COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END), COUNT(CASE WHEN isTextless = 1 THEN 1 END)) * 100 AS proportion FROM cards;	card_games
SELECT c.id FROM cards c WHERE c.subtypes ilike '%Angel%' AND c.subtypes ilike '%Wizard%' AND c.faceName IS NULL;	card_games
SELECT s.name FROM sets s WHERE s.mtgoCode IS NULL OR s.mtgoCode = '' ORDER BY s.name ASC LIMIT 3;	card_games
SELECT DISTINCT language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.mcmName = 'Archenemy' AND s.setCode = 'ARC';	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5;	card_games
SELECT s.name, s.type FROM sets s WHERE s.id = 206;	card_games
SELECT s.name, s.id FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.type = 'block' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT s.id FROM sets s WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND s.mtgoCode IN (SELECT st.setCode FROM set_translations st WHERE LOWER(st.translation) = 'japanese');	card_games
SELECT s.code FROM sets s WHERE s.name LIKE '%Russian%' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT (COUNT(CASE WHEN c.isOnlineOnly = 1 THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage FROM cards c WHERE c.language = 'Chinese Simplified';	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s WHERE s.isJapanese = 1 AND (s.mtgoCode IS NULL OR s.mtgoCode = '');	card_games
SELECT c.id FROM cards c WHERE c.borderColor = 'black';	card_games
SELECT c.id FROM cards c WHERE c.frameEffects = 'extendedart';	card_games
SELECT c.uuid FROM cards c WHERE c.borderColor = 'black' AND c.isFullArt = 1 ORDER BY c.uuid NULLS LAST;	card_games
SELECT s.name, s.type, s.releaseDate, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 174;	card_games
SELECT s.name FROM sets s WHERE s.code = 'ALL';	card_games
SELECT fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name ilike '%A Pedra Fellwar%';	card_games
SELECT s.code FROM sets s WHERE s.releaseDate = '2007-07-13';	card_games
SELECT s.baseSetSize, s.setCode FROM sets s JOIN set_translations st ON s.setCode = st.setCode WHERE s.type = 'block' AND st.translation = 'Masques' AND st.translation = 'Mirage';	card_games
SELECT s.setCode FROM sets s WHERE s.type = 'expansion';	card_games
SELECT f.name, f.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'boros';	card_games
SELECT c.text, f.text, c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'colorpie';	card_games
SELECT (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.name = 'Abyssal Horror';	card_games
SELECT s.setCode FROM sets s WHERE s.type = 'Expansion Commander';	card_games
SELECT f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan'; SELECT c.type, f.name FROM cards c JOIN foreign_data f ON	card_games
SELECT f.language, c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'azorius';	card_games
SELECT COUNT(*) FROM cards c WHERE c.artist = 'Aaron Miller' AND c.cardKingdomFoilId = c.cardKingdomId AND c.cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards c WHERE c.hand ilike '%+%';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT c.convertedManaCost FROM cards c WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards c WHERE c.border_color = 'white' AND (c.power = '*' OR c.power IS NULL);	card_games
SELECT c.name FROM cards c WHERE c.isPromo = 1 AND c.side IS NOT NULL;	card_games
SELECT t.subtypes, t.supertypes FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.name = 'Molimo, Maro-Sorcerer';	card_games
SELECT DISTINCT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT c.artist) FROM cards c WHERE c.borderColor = 'black' AND c.duelDeck LIKE '%arena,mtgo%';	card_games
SELECT c1.name, c1.convertedManaCost FROM cards c1 WHERE c1.name = 'Serra Angel' UNION SELECT c2.name, c2.convertedManaCost FROM cards c2 WHERE c2.name = 'Shrine Keeper' ORDER BY c1.convertedManaCost DESC NULLS LAST;	card_games
SELECT c.artist FROM cards c WHERE c.flavorName = 'Battra, Dark Destroyer';	card_games
SELECT c.name, c.convertedManaCost FROM cards c WHERE c.frameVersion = '2003' ORDER BY c.convertedManaCost DESC NULLS LAST LIMIT 3;	card_games
SELECT s.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Ancestor''s Chosen' AND s.language = 'Italian';	card_games
SELECT COUNT(*) FROM set_translations st JOIN cards c ON st.setCode = c.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN set_translations st ON fd.multiverseid = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name ilike '%Ancestor''s Chosen%' AND fd.language = 'Korean';	card_games
SELECT COUNT(*) FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE LOWER(st.translation) = 'hauptset zehnte edition' AND c.artist = 'Adam Rex';	card_games
SELECT s.code, s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE LOWER(st.translation) = 'hauptset zehnte edition';	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.name = 'Eighth Edition' AND st.language = 'Simplified Chinese';	card_games
SELECT COUNT(*) FROM cards c JOIN sets s ON c.mtgoCode = s.mtgoCode WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian';	card_games
SELECT COUNT(*) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation ilike '%Adarkar Valkyrie%' AND s.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND st.translation IS NOT NULL AND s.baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards c WHERE c.borderColor = 'black' AND c.setCode = '10E';	card_games
SELECT c.name, c.convertedManaCost FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC NULLS LAST LIMIT 1;	card_games
SELECT DISTINCT c.artist FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.artist IN ('Jeremy Jarvis', 'Aaron Miller','Chippy');	card_games
SELECT c.uuid FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.number = '4' AND s.name = 'Coldsnap';	card_games
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.convertedManaCost > 5 AND (c.power = '*' OR c.power IS NULL);	card_games
SELECT fd.flavorText FROM foreign_data fd WHERE fd.name = 'Ancestor''s Chosen' AND fd.language = 'Italian';	card_games
SELECT DISTINCT language FROM foreign_data fd WHERE fd.name = 'Ancestor''s Chosen' AND fd.flavorText IS NOT NULL;	card_games
SELECT c.types FROM cards c WHERE c.name = 'Ancestor''s Chosen' AND c.language = 'German';	card_games
SELECT r.text FROM cards c JOIN foreign_data f ON c.uuid = f.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND f.language = 'Italian' ORDER BY c.id NULLS LAST;	card_games
SELECT c.name, c.italian_name FROM cards c JOIN sets s ON c.set_code = s.code WHERE s.name = 'Coldsnap' ORDER BY c.converted_mana_cost DESC NULLS LAST;	card_games
SELECT r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Reminisce';	card_games
SELECT (COUNT(CASE WHEN c(convertedManaCost) = 7 THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT (COUNT(CASE WHEN c.cardKingdomFoilId = c.cardKingdomId AND c.cardKingdomId IS NOT NULL THEN 1 END)::FLOAT / NULLIF((SELECT COUNT(*) FROM cards c WHERE c.name = 'Coldsnap'), 0)) * 100 AS percentage FROM cards c WHERE c.name = 'Coldsnap';	card_games
SELECT s.code FROM sets s WHERE s.releaseDate = '2017-07-14';	card_games
SELECT s.keyruneCode FROM sets s WHERE s.code = 'PKHC';	card_games
SELECT s.mcmId FROM sets s WHERE s.code = 'SS2';	card_games
SELECT s.mcmName FROM sets s WHERE s.releaseDate = '2003-01-01';	card_games
SELECT s.type FROM sets s WHERE s.code IN (SELECT s2.code FROM sets s2 WHERE s2.name ilike '%From the Vault: Lore%');	card_games
SELECT s.code FROM sets s WHERE s.name = 'Commander 2014 Oversized';	card_games
SELECT c.uuid, c.name, c.text, r.text AS ruling, c.hasContentWarning FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' AND c.hasContentWarning = 1;	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation';	card_games
SELECT s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE LOWER(st.translation) = 'rinascita di alara';	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE LOWER(st.translation) = 'huitième édition';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Tendo Ice Bridge' AND st.language = 'French';	card_games
SELECT COUNT(*) FROM set_translations st WHERE st.setCode = 'Salvat 2011' AND st.translation IS NOT NULL;	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese' AND s.name = 'Fellwar Stone';	card_games
SELECT c.name, c.convertedManaCost FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero''s Path' ORDER BY c.convertedManaCost DESC NULLS LAST LIMIT 1;	card_games
SELECT s.releaseDate FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Ola de frío';	card_games
SELECT s.type FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.convertedManaCost = 3 AND s.name = 'World Championship Decks 2004';	card_games
SELECT st.translation FROM set_translations st WHERE st.language = 'Chinese Simplified' AND st.setCode = (SELECT s.code FROM sets s WHERE s.name = 'Mirrodin');	card_games
SELECT (SUM(CASE WHEN c.language = 'Japanese' AND c.isNonFoilOnly = 1 THEN 1 ELSE 0 END)::FLOAT / NULLIF((SELECT COUNT(*) FROM cards c WHERE c.language = 'Japanese'), 0)) * 100 AS percentage FROM cards c;	card_games
SELECT (SUM(c.isOnlineOnly) * 1.0 / NULLIF(SUM(CASE WHEN c.language = 'Portuguese (Brazil)' THEN 1 ELSE 0 END), 0)) * 100 AS percentage FROM cards c;	card_games
SELECT DISTINCT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT s.id FROM sets s WHERE s.baseSetSize = (SELECT MAX(s2.baseSetSize) FROM sets s2);	card_games
SELECT c.artist, MAX(c.convertedManaCost) AS max_cost FROM cards c WHERE c.otherFaceIds IS NULL GROUP BY c.artist ORDER BY max_cost DESC NULLS LAST LIMIT 1;	card_games
SELECT MAX(frameEffects) AS mostCommonVisualFrameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT s.id FROM sets s WHERE s.type = 'Commander' ORDER BY s.totalSetSize DESC LIMIT 1;	card_games
SELECT c.name, MAX(c.manaCost) AS max_mana_cost FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' GROUP BY c.name ORDER BY max_mana_cost DESC LIMIT 10;	card_games
SELECT MIN(c.originalReleaseDate) AS oldest_release_date, l.status AS legal_status, l.uuid AS card_uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity ='mythic' AND l.status = 'legal' GROUP BY l.uuid ORDER BY oldest_release_date ASC NULLS LAST;	card_games
SELECT COUNT(*) FROM cards c WHERE c.artist = 'Volkan Baga' AND c.language = 'French';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types = 'Enchantment' AND c.name = 'Abundance' AND l.status = 'Legal';	card_games
SELECT l.format, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'banned' ORDER BY COUNT(l.status = 'banned') DESC LIMIT 1;	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.name = 'Battlebond';	card_games
SELECT c.artist, c.format FROM cards c GROUP BY c.artist, c.format ORDER BY COUNT(c.artist) ASC LIMIT 1;	card_games
SELECT l.status FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND c.hasContentWarning = 1 AND l.format = 'legacy';	card_games
SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'banned';	card_games
SELECT AVG(s.totalSetSize) AS average_sets FROM sets s WHERE s.releaseDate BETWEEN '2012-01-01' AND '2015-12-31'; SELECT MAX(COUNT(t.language)) AS common_language FROM set_translations t GROUP BY t.setCode;	card_games
SELECT DISTINCT c.artist FROM cards c WHERE c.borderColor = 'black' AND c.availability = 'arena';	card_games
SELECT c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'oldschool' AND l.status IN ('banned','restricted');	card_games
SELECT COUNT(*) FROM cards c WHERE c.artist = 'Matthew D. Wilson' AND c.availability = 'paper';	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name IN (SELECT name FROM cards WHERE sets.code = 'HO') AND l.status = 'legal';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language not like '%Japanese%' AND st.language = 'Korean' ORDER BY s.name NULLS LAST;	card_games
SELECT DISTINCT frameVersion FROM cards WHERE artist = 'Allen Williams'; SELECT l.uuid FROM legalities l WHERE l.status = 'banned';	card_games
SELECT u1.DisplayName, MAX(u1.Reputation) AS MaxReputation FROM users u1 WHERE u1.DisplayName = 'Harlan' OR u1.DisplayName = 'Jarrod Dixon' GROUP BY u1.DisplayName ORDER BY MaxReputation DESC NULLS LAST LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u WHERE EXTRACT(YEAR FROM u.CreationDate) = 2014 ORDER BY u.DisplayName NULLS LAST;	codebase_community
SELECT COUNT(*) FROM users u WHERE u.LastAccessDate > '2014-09-01 00:00:00';	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Views = (SELECT MAX(u2.Views) FROM users u2);	codebase_community
SELECT CAST(COUNT(DISTINCT CASE WHEN v.DownVotes > 1 THEN u.Id END) AS FLOAT) / NULLIF(COUNT(DISTINCT u.Id), 0) AS fraction FROM users u JOIN (SELECT v.UserId FROM votes v WHERE v.UpVotes > 100) AS u ON u.Id = v.UserId;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u WHERE u.Views > 10 AND EXTRACT(YEAR FROM u.CreationDate) > 2013;	codebase_community
SELECT COUNT(p.id) FROM posts p JOIN users u ON p.owneruserid = u.id WHERE LOWER(u.displayname) = 'csgillespie';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC NULLS LAST LIMIT 1;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT SUM(p.CommentCount) AS total_comments FROM posts p WHERE p.OwnerUserId IN (SELECT u.Id FROM users u WHERE u.DisplayName = 'csgillespie');	codebase_community
SELECT p.ViewCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie' ORDER BY p.ViewCount DESC NULLS LAST LIMIT 1;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.OwnerUserId IN (SELECT u.Id FROM users u WHERE u.DisplayName = 'csgillespie') AND p.ParentId IS NULL;	codebase_community
SELECT DISTINCT p.OwnerDisplayName FROM posts p WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) AS high_scoring_posts FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20;	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id WHERE LOWER(t.TagName) = 'bayesian';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(t2.Count) FROM tags t2);	codebase_community
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges b WHERE b.Name = 'csgillespie' AND EXTRACT(YEAR FROM b.Date) = 2011;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie';	codebase_community
SELECT CAST(COUNT(b.Id) AS FLOAT) / NULLIF(COUNT(DISTINCT u.DisplayName), 0) AS average_badges_per_user FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Views > 200;	codebase_community
SELECT CAST(COUNT(DISTINCT CASE WHEN u.Age > 65 THEN p.Id END) AS FLOAT) / NULLIF(COUNT(DISTINCT p.Id), 0) * 100 AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 20;	codebase_community
SELECT SUM(v.BountyAmount) AS total_bounty FROM votes v WHERE v.UserId = 58 AND v.CreationDate = '2010-07-19';	codebase_community
SELECT MAX(v.CreationDate) FROM votes v GROUP BY v.CreationDate ORDER BY COUNT(v.Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges WHERE LOWER(Name) ='revival';	codebase_community
WITH MaxScoreComment AS (SELECT c.PostId, MAX(c.Score) AS MaxScore FROM comments c GROUP BY c.PostId) SELECT p.Title FROM MaxScoreComment msc JOIN posts p ON msc.PostId = p.Id;	codebase_community
SELECT COUNT(c.Id) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 3025 AND c.CreationDate = '2014/4/23 20:29:39.0';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ParentId = 107829 AND c.CommentCount = 1;	codebase_community
SELECT p.Id, p.Title FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0' AND p.ClosedDate IS NULL;	codebase_community
SELECT u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 65041;	codebase_community
SELECT COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'tiago pasqualini';	codebase_community
SELECT u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.Id = 6347;	codebase_community
SELECT COUNT(v.Id) AS vote_count FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT (COUNT(p.Id) * 1.0 / NULLIF(COUNT(v.Id), 0)) AS ratio FROM posts p JOIN users u ON p.OwnerUserId = u.Id LEFT JOIN votes v ON p.Id = v.PostId WHERE u.Id = 24;	codebase_community
SELECT p.ViewCount FROM posts p WHERE p.Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT c.Text FROM comments c WHERE c.Score = 17;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT c.UserId FROM comments c WHERE c.Text = 'thank you user93!';	codebase_community
SELECT c.Text FROM comments c WHERE c.UserId IN (SELECT u.Id FROM users u WHERE u.DisplayName = 'A Lion');	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' ORDER BY u.DisplayName LIMIT 10;	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE LOWER(u.DisplayName) ='vebjorn ljosa';	codebase_community
SELECT SUM(p.Score) AS total_score FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE LOWER(u.DisplayName) = 'yevgeny';	codebase_community
SELECT c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE LOWER(p.Title) = 'why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(v.BountyAmount) AS TotalBountyAmount FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title ilike '%data%';	codebase_community
SELECT u.DisplayName FROM votes v JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title ilike '%variance%';	codebase_community
SELECT p.Title, p.ViewCount, p.Comment, p.Score, AVG(p.ViewCount) AS average_view_count FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE LOWER(t.TagName) = 'humor' GROUP BY p.Title, p.ViewCount, p.Comment, p.Score;	codebase_community
SELECT SUM(c.Score) AS TotalScore FROM comments c WHERE c.UserId = 13;	codebase_community
SELECT u.Id FROM users u ORDER BY u.Reputation DESC LIMIT 1;	codebase_community
SELECT u.Id FROM users u WHERE u.Views = (SELECT MIN(u2.Views) FROM users u2);	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND EXTRACT(YEAR FROM b.Date) = 2011;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE COUNT(b.Name) > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b ON u.Id = b.UserId WHERE LOWER(u.Location) = 'new york' AND b.Name IN ('Teacher', 'Supporter');	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN postHistory ph ON p.Id = ph.PostId WHERE u.Views >= 1000 GROUP BY u.DisplayName HAVING COUNT(DISTINCT ph.Id) = 1;	codebase_community
WITH user_comments AS (SELECT u.Id, u.DisplayName, COUNT(c.Id) AS comment_count FROM users u JOIN comments c ON u.Id = c.UserId GROUP BY u.Id, u.DisplayName) SELECT uc.Id, uc.DisplayName, b.Name AS badge_name FROM user_comments uc JOIN badges b ON uc.Id = b.UserId WHERE uc.comment_count = (SELECT MAX(comment_count) FROM user_comments) ORDER BY uc.Id NULLS LAST;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
WITH total_students AS (SELECT COUNT(*) AS total FROM badges WHERE Name = 'Student'), students_2010 AS (SELECT COUNT(*) AS students_2010 FROM badges WHERE Name = 'Student' AND EXTRACT(YEAR FROM Date) = 2010), students_2011 AS (SELECT COUNT(*) AS students_2011 FROM badges WHERE Name = 'Student' AND EXTRACT(YEAR FROM Date) = 2011) SELECT ((COALESCE(students_2010.students_2010, 0) - COALESCE(students_2011.students_2011, 0)) / NULLIF(COALESCE(total_students.total, 1), 0)) * 100 AS percentage_change FROM total_students, students_2010, students_2011;	codebase_community
SELECT ph.PostHistoryTypeId FROM postHistory ph WHERE ph.PostId = 3720; SELECT COUNT(DISTINCT ph.UserId) FROM postHistory ph WHERE ph.PostId = 3720;	codebase_community
SELECT p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT p.score, pl.linkTypeId FROM posts p JOIN postLinks pl ON p.id = pl.postId WHERE p.id = 395;	codebase_community
SELECT p.Id AS PostId, u.Id AS UserId FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount) AS total_favorited FROM posts p WHERE p.OwnerUserId = 686 AND EXTRACT(YEAR FROM p.CreationDate) = 2011;	codebase_community
SELECT AVG(u.UpVotes / NULLIF(COUNT(u.Id), 0)) AS up_votes_average, AVG(u.Age / NULLIF(COUNT(u.Id), 0)) AS age_average FROM users u JOIN posts p ON u.Id = p.OwnerUserId GROUP BY u.Id HAVING COUNT(p.OwnerUserId) > 10;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE LOWER(b.Name) = 'announcer';	codebase_community
SELECT b.Name FROM badges b WHERE b.Date = '2010-07-19 19:39:08';	codebase_community
SELECT COUNT(c.Id) FROM comments c WHERE c.Score > 60;	codebase_community
SELECT c.Text FROM comments c WHERE c.CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(u2.Reputation) FROM users u2);	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(u.DisplayName) = 'pierre';	codebase_community
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY' ORDER BY b.Date;	codebase_community
SELECT (COUNT(DISTINCT b.UserId) * 100.0 / NULLIF(COUNT(DISTINCT u.Id), 0)) AS percentage FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Teacher';	codebase_community
SELECT CAST(COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT c.Text FROM comments c WHERE c.CreationDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria' ORDER BY u.Age NULLS LAST;	codebase_community
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.Views FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id ORDER BY u.Reputation ASC LIMIT 1;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Id = 30;	codebase_community
SELECT COUNT(*) FROM users u WHERE LOWER(u.Location) = 'new york';	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users u WHERE u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Views = (SELECT MAX(u2.Views) FROM users u2);	codebase_community
SELECT DIVIDE(COUNT(Id WHERE YEAR(CreationDate) = 2010), COUNT(Id WHERE YEAR(CreationDate) = 2011)) FROM votes;	codebase_community
SELECT t.TagName FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE LOWER(u.DisplayName) = 'john stauffer';	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'daniel vassallo';	codebase_community
SELECT COUNT(*) FROM votes v WHERE v.UserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'Harlan');	codebase_community
SELECT p.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) ='slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT p.Id, MAX(p.ViewCount) AS max_view_count FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' OR u.DisplayName = 'Noah Snyder' GROUP BY p.Id ORDER BY max_view_count DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) ='matt parker' AND p.Id > 4;	codebase_community
SELECT COUNT(*) AS negative_comments FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'neil mcguigan' AND c.Score < 60;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN comments c ON p.Id = c.PostId WHERE p.OwnerUserId IN (SELECT u.Id FROM users u WHERE u.DisplayName = 'Mark Meckes') AND c.Id IS NULL ORDER BY t.TagName NULLS LAST;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT DIVIDE(COUNT(DISTINCT p.PostId), NULLIF(COUNT(DISTINCT u.Id), 0)) AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'community' AND EXISTS (SELECT 1 FROM tags t WHERE LOWER(t.TagName) = 'r' AND t.Id = p.Id);	codebase_community
SELECT SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) - SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) AS difference FROM posts p JOIN users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Commentator' AND EXTRACT(YEAR FROM b.Date) = 2014;	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT u.DisplayName, u.Age FROM users u ORDER BY u.Views DESC LIMIT 1;	codebase_community
SELECT p.LastEditDate, p.LastEditorUserId FROM posts p WHERE p.Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(c.Id) AS negative_comments FROM comments c WHERE c.UserId = 13 AND c.Score < 60;	codebase_community
SELECT p.Title, u.DisplayName FROM posts p JOIN comments c ON p.Id = c.PostId JOIN users u ON c.UserId = u.Id WHERE c.Score > 60 ORDER BY p.Title NULLS LAST;	codebase_community
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE EXTRACT(YEAR FROM b.Date) = 2011 AND u.Location ILIKE '%North Pole%';	codebase_community
SELECT p.OwnerDisplayName, p.OwnerUserId, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150;	codebase_community
SELECT ph.Text, COUNT(ph.Id) AS post_history_count, MAX(ph.LastEditDate) AS last_edit_date FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title ilike '%What is the best introductory Bayesian statistics textbook%' GROUP BY ph.Text ORDER BY last_edit_date DESC NULLS LAST;	codebase_community
SELECT u.LastAccessDate, u.Location FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Outliers';	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId IN (SELECT p2.Id FROM posts p2 WHERE p2.Title = 'How to tell if something happened in a data set which monitors a value over time');	codebase_community
SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN comments c ON p.Id = c.PostId JOIN users u ON c.UserId = u.Id JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName ilike '%Samuel%' AND YEAR(p.CreationDate) = 2013 UNION SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN badges b ON p.Id = b.UserId WHERE p.OwnerDisplayName ilike '%Samuel%' AND YEAR(b.Date) = 2013;	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.ViewCount = (SELECT MAX(p2.ViewCount) FROM posts p2);	codebase_community
SELECT p.OwnerDisplayName, p.Location FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE LOWER(p.Title) = 'what are principal component scores?';	codebase_community
SELECT p.OwnerDisplayName, p.ParentId FROM posts p WHERE p.ParentId IS NOT NULL ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT p.Title, MAX(p.ViewCount) AS MaxViewCount FROM posts p GROUP BY p.Title ORDER BY MaxViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id WHERE p.ViewCount BETWEEN 5000 AND 7000;	codebase_community
SELECT p.OwnerUserId FROM posts p WHERE p.FavoriteCount = (SELECT MAX(p2.FavoriteCount) FROM posts p2);	codebase_community
SELECT u.Age FROM users u WHERE u.Reputation = (SELECT MAX(u2.Reputation) FROM users u2);	codebase_community
SELECT COUNT(p.Id) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(p.CreationDate) = 2011 AND v.BountyAmount = 50;	codebase_community
SELECT u.Id FROM users u ORDER BY u.Age ASC LIMIT 1;	codebase_community
WITH post_tag_counts AS (SELECT p.Id, t.Count FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId) SELECT pt.Id, pt.Count, pt.Count AS score FROM post_tag_counts pt WHERE pt.Count = (SELECT MAX(Count) FROM post_tag_counts);	codebase_community
SELECT DIVIDE(COUNT(pl.Id WHERE YEAR(pl.CreationDate) = 2010 AND p.AnswerCount <= 2), 12) AS average_monthly_links FROM posts p JOIN postLinks pl ON p.Id = pl.PostId;	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC NULLS LAST LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(pl2.CreationDate) FROM postLinks pl2);	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY u.DisplayName ORDER BY COUNT(b.Name) DESC NULLS LAST LIMIT 1;	codebase_community
SELECT MIN(v.CreationDate) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl';	codebase_community
SELECT MIN(u.CreationDate) FROM users u WHERE u.Age = (SELECT MIN(u2.Age) FROM users u2);	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount >= 4 AND LOWER(u.Location) = 'united kingdom';	codebase_community
SELECT AVG(v.PostId) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(u2.Age) FROM users u2);	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Reputation = (SELECT MAX(u2.Reputation) FROM users u2);	codebase_community
SELECT COUNT(*) FROM users u WHERE u.Reputation > 2000 AND u.Views > 1000;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(p.Id) FROM posts p WHERE p.OwnerUserId IN (SELECT u.Id FROM users u WHERE LOWER(u.DisplayName) = 'jay stevens') AND YEAR(p.CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'harvey motulsky' ORDER BY p.ViewCount DESC NULLS LAST LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p WHERE p.Score = (SELECT MAX(p2.Score) FROM posts p2);	codebase_community
SELECT AVG(p.Score) AS average_score FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) ='stephen turner';	codebase_community
SELECT DISTINCT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT p.Id, p.OwnerDisplayName FROM posts p WHERE p.CreationDate BETWEEN '2010-01-01' AND '2010-12-31' ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT DIVIDE(COUNT(p.Id where p.CreationDate = '2011' and p.OwnerUserId in (SELECT u.Id FROM users u WHERE u.Reputation > 1000)), COUNT(p.Id)) * 100 AS percentage FROM posts p;	codebase_community
SELECT DIVIDE(COUNT(u.Id WHERE u.Age BETWEEN 13 AND 18), COUNT(u.Id)) AS percentage FROM users u;	codebase_community
SELECT SUM(p.ViewCount) AS total_views, u.DisplayName AS posted_by FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Computer Game Datasets';	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.ViewCount > (SELECT AVG(p2.ViewCount) FROM posts p2);	codebase_community
WITH MaxScore AS (SELECT p.Id FROM posts p WHERE p.Score = (SELECT MAX(p.Score) FROM posts p)) SELECT COUNT(c.Id) AS comment_count FROM comments c JOIN MaxScore ms ON c.PostId = ms.Id;	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.ViewCount > 35000 AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT b.Name FROM badges b WHERE b.UserId IN (SELECT u.Id FROM users u WHERE u.DisplayName = 'Emmett') ORDER BY b.Date DESC NULLS LAST LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users u JOIN votes v ON u.Id = v.UserId WHERE u.Age BETWEEN 19 AND 65 AND v.UpVotes > 5000;	codebase_community
SELECT SUBTRACT(b.Date, u.CreationDate) AS time_to_get_badge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT u.Id, COUNT(p.Id) AS post_count, COUNT(c.Id) AS comment_count FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY u.Id;	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.PostId IN (SELECT p.Id FROM posts p WHERE p.Title = 'Analysing wind data with R') ORDER BY c.CreationDate DESC NULLS LAST LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE b.Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(p.Id) FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'careers';	codebase_community
SELECT u.Reputation, p.ViewCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Jarrod Dixon';	codebase_community
SELECT COUNT(c.Id) AS comment_count, COUNT(p.Id) AS answer_count FROM comments c JOIN posts p ON c.PostId = p.Id WHERE LOWER(p.Title) = 'clustering 1d data';	codebase_community
SELECT u.CreationDate FROM users u WHERE u.DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM votes v WHERE v.BountyAmount >= 30;	codebase_community
SELECT CAST(COUNT(DISTINCT p.Id WHERE p.Score >= 50) AS FLOAT) / NULLIF(COUNT(DISTINCT p.Id), 0) AS proportion FROM posts p WHERE p.OwnerUserId = (SELECT u.Id FROM users u ORDER BY u.Reputation DESC LIMIT 1);	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.Score < 20;	codebase_community
SELECT COUNT(*) FROM tags t WHERE t.Count <= 20 AND t.Id < 15;	codebase_community
SELECT t.ExcerptPostId, t.WikiPostId FROM tags t WHERE LOWER(t.TagName) ='sample';	codebase_community
SELECT u.Reputation, SUM(v.UpVotes) AS total_up_votes FROM comments c JOIN users u ON c.UserId = u.Id JOIN votes v ON c.UserId = v.UserId WHERE c.Text = 'fine, you win :)' GROUP BY u.Reputation;	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How can I adapt ANOVA for binary data?';	codebase_community
WITH post_comments AS (SELECT c.PostId, MAX(c.Score) AS MaxScore FROM comments c WHERE c.ViewCount BETWEEN 100 AND 150 GROUP BY c.PostId) SELECT p.Title, pc.MaxScore FROM posts p JOIN post_comments pc ON p.Id = pc.PostId ORDER BY pc.MaxScore DESC NULLS LAST LIMIT 1;	codebase_community
SELECT c.creationdate, (strftime('%Y', 'now') - strftime('%Y', c.creationdate)) AS age FROM comments c JOIN users u ON c.userid = u.id WHERE u.websiteurl LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT c.PostId) AS posts_with_low_view_count FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) AS zero_score_comments FROM comments c WHERE c.Score = 0 AND c.PostId IN (SELECT p.Id FROM posts p WHERE p.CommentCount = 1);	codebase_community
SELECT COUNT(DISTINCT c.UserId) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id AS post_id, COUNT(c.Id) AS comments_count FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item' GROUP BY p.Id;	codebase_community
SELECT u.UpVotes FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text ilike '%R%is%also%lazy%evaluated%';	codebase_community
SELECT c.Text FROM comments c WHERE c.UserId IN (SELECT u.Id FROM users u WHERE u.DisplayName = 'Harvey Motulsky');	codebase_community
SELECT c.UserId, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.DownVotes = 0 AND c.Score BETWEEN 1 AND 5;	codebase_community
SELECT DIVIDE(COUNT(DISTINCT c.UserId WHERE c.UpVotes = 0 AND c.Score BETWEEN 5 AND 10), COUNT(DISTINCT c.UserId WHERE c.Score BETWEEN 5 AND 10)) AS percentage FROM comments c WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT h.id) FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM hero_power hp JOIN superhero s ON hp.hero_id = s.id WHERE hp.power_id IN (SELECT id FROM superpower WHERE power_name = 'Super Strength') AND s.height_cm > 200;	superhero
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.hero_id) > 15;	superhero
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE LOWER(c.colour) = 'blue';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT h.id) FROM superhero h JOIN colour c ON h.eye_colour_id = c.id JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Blue' AND c2.colour = 'Blond';	superhero
SELECT COUNT(*) FROM superhero s WHERE s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT s.full_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC LIMIT 1;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Sauron';	superhero
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' AND s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT AVG(s.height_cm) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT MULTIPLY(DIVIDE(SUM(CASE WHEN sp.power_name = 'Super Strength' THEN 1 ELSE 0 END), COUNT(s.id)), 100) AS percentage FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN publisher p ON s.publisher_id = p.id WHERE LOWER(p.publisher_name) ='marvel comics';	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s WHERE s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC NULLS LAST LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE c.colour = 'Gold' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT s.publisher_id, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE c.colour = 'Blond';	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Intelligence') ORDER BY ha.attribute_value ASC NULLS LAST LIMIT 1;	superhero
SELECT s.race_id FROM superhero s WHERE s.superhero_name = 'Copycat';	superhero
SELECT COUNT(*) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Death Touch';	superhero
SELECT COUNT(*) FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.gender_id IN (SELECT id FROM gender WHERE gender = 'Female') AND a.attribute_name = 'Strength' AND a.attribute_value = 100;	superhero
WITH PowerCount AS (SELECT s.superhero_name, COUNT(hp.power_id) AS power_count FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.superhero_name) SELECT pc.superhero_name FROM PowerCount pc WHERE pc.power_count = (SELECT MAX(power_count) FROM PowerCount) ORDER BY pc.superhero_name NULLS LAST;	superhero
SELECT COUNT(*) FROM superhero s WHERE s.race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT (COUNT(CASE WHEN s.alignment_id = 2 THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference;	superhero
SELECT p.id FROM publisher p WHERE p.publisher_name = 'Star Trek';	superhero
SELECT AVG(ha.attribute_value) AS average_attribute_value FROM hero_attribute ha;	superhero
SELECT COUNT(*) FROM superhero s WHERE s.full_name IS NULL;	superhero
SELECT s.eye_colour_id, c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.id = 75;	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = 'Deathlok';	superhero
SELECT AVG(s.weight_kg) FROM superhero s WHERE s.gender_id = 2;	superhero
SELECT s.superhero_name, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.gender_id IN (SELECT id FROM gender WHERE gender = 'Male') LIMIT 5;	superhero
SELECT s.superhero_name FROM superhero s WHERE s.race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT s.superhero_name FROM superhero s WHERE s.height_cm BETWEEN 170 AND 190 AND s.eye_colour_id = 1;	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 56;	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Demi-God' LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero s WHERE s.alignment_id = 2;	superhero
SELECT s.race_id, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.weight_kg = 169;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE s.height_cm = 185 AND s.race_id = (SELECT id FROM race WHERE race = 'human');	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id ORDER BY s.weight_kg DESC LIMIT 1;	superhero
SELECT (COUNT(CASE WHEN s.publisher_id = 13 THEN 1 END)::FLOAT / NULLIF(COUNT(*), 0)) * 100 AS percentage FROM superhero s WHERE s.height_cm BETWEEN 150 AND 180;	superhero
SELECT s.full_name FROM superhero s WHERE s.gender_id IN (SELECT id FROM gender WHERE gender ='male') AND s.weight_kg > (SELECT AVG(s2.weight_kg) * 0.79 FROM superhero s2);	superhero
SELECT s.superhero_name, COUNT(hp.power_id) AS power_count FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.superhero_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT s.power_name FROM hero_power hp JOIN superpower s ON hp.power_id = s.id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(DISTINCT h.id) FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower s ON hp.power_id = s.id WHERE s.power_name ='stealth';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT DIVIDE(COUNT(s.id), SUM(CASE WHEN c.id = 1 THEN 1 ELSE 0 END)) AS average FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE c.id = 1;	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s WHERE s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Flight';	superhero
SELECT s.eye_colour_id, s.hair_colour_id, s.skin_colour_id FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id AND s.hair_colour_id = c.id AND s.skin_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT s.race_id, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'A-Bomb';	superhero
SELECT (COUNT(CASE WHEN s.eye_colour_id = c.id AND g.gender = 'Female' THEN 1 END) * 1.0 / NULLIF(COUNT(CASE WHEN g.gender = 'Female' THEN 1 END), 0)) * 100 AS percentage FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Female' AND c.colour = 'Blue';	superhero
SELECT s.superhero_name, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.full_name = 'Charles Chandler';	superhero
SELECT g.gender FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE s.superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Adaptation';	superhero
SELECT COUNT(hp.power_id) FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id WHERE s.superhero_name = 'Amazo';	superhero
SELECT s.superhero_name, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour e ON s.eye_colour_id = e.id JOIN colour h ON s.hair_colour_id = h.id WHERE e.colour = 'Black' AND h.colour = 'Black';	superhero
SELECT colour.colour FROM colour JOIN superhero ON colour.id = superhero.skin_colour_id WHERE colour.colour = 'Gold';	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Vampire';	superhero
SELECT s.superhero_name FROM superhero s WHERE s.alignment_id = 3;	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id IN (SELECT a.id FROM attribute a WHERE a.attribute_name = 'Strength') AND ha.attribute_value = (SELECT MAX(ha2.attribute_value) FROM hero_attribute ha2 WHERE ha2.attribute_id = (SELECT a.id FROM attribute a WHERE a.attribute_name = 'Strength'));	superhero
SELECT s.race_id, a.alignment FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT SUM(CASE WHEN s.gender_id = g.id AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) / NULLIF(COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 END), 0) * 100 AS percentage FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(s.weight_kg) FROM superhero s WHERE s.race_id = (SELECT id FROM race WHERE LOWER(race) = 'Alien');	superhero
SELECT (SELECT SUM(s.weight_kg) FROM superhero s WHERE s.full_name = 'Emil Blonsky') - (SELECT SUM(s.weight_kg) FROM superhero s WHERE s.full_name = 'Charles Chandler') AS difference;	superhero
SELECT AVG(s.height_cm) AS average_height FROM superhero s;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) AS male_count FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE s.race_id = 21 AND g.id = 1;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero s WHERE s.alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT s.superhero_name FROM superhero s WHERE s.eye_colour_id = 7 AND s.hair_colour_id = 9;	superhero
SELECT s.publisher_id, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero s WHERE s.publisher_id IS NULL;	superhero
SELECT (COUNT(CASE WHEN s.eye_colour_id = 7 THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage_of_superheroes_with_blue_eyes FROM superhero s;	superhero
SELECT DIVIDE(SUM(CASE WHEN s.gender_id = 1 THEN 1 ELSE 0 END), SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END)) AS ratio FROM superhero s;	superhero
SELECT s.superhero_name FROM superhero s WHERE s.height_cm = (SELECT MAX(s2.height_cm) FROM superhero s2);	superhero
SELECT sp.id FROM superpower sp WHERE sp.power_name = 'cryokinesis';	superhero
SELECT s.superhero_name FROM superhero s WHERE s.id = 294;	superhero
SELECT s.full_name FROM superhero s WHERE s.weight_kg = 0 OR s.weight_kg IS NULL;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr';	superhero
SELECT s.race_id, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.weight_kg = 108 AND s.height_cm = 188;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.id = 38;	superhero
WITH RankedHeroAttributes AS (SELECT h.id AS hero_id, a.attribute_name, ha.attribute_value, RANK() OVER (PARTITION BY h.id ORDER BY ha.attribute_value DESC) AS rank FROM superhero h JOIN hero_attribute ha ON h.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id) SELECT rha.hero_id, rha.attribute_name, rha.attribute_value FROM RankedHeroAttributes rha WHERE rha.rank = 1; SELECT s.race FROM superhero s JOIN RankedHeroAttributes rha ON s.id = rha.hero_id;	superhero
SELECT s.alignment, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' ORDER BY s.full_name NULLS LAST LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.alignment_id = 3;	superhero
SELECT colour.colour FROM superhero JOIN hero_attribute ha ON superhero.skin_colour_id = ha.hero_id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN alignment a ON s.alignment_id = a.id WHERE a.id = 1 AND g.id = 2;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80;	superhero
SELECT s.race FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE c.colour = 'blue' AND s.gender_id IN (SELECT id FROM gender WHERE gender ='male');	superhero
SELECT (COUNT(s.gender_id = 2) * 100.0 / NULLIF(COUNT(s.alignment_id = 2), 0)) AS percentage_female FROM superhero s WHERE s.alignment_id = 2;	superhero
SELECT (SELECT COUNT(*) FROM superhero s WHERE s.eye_colour_id = 7) - (SELECT COUNT(*) FROM superhero s WHERE s.eye_colour_id = 1) AS difference FROM superhero s WHERE s.weight_kg = 0 OR s.weight_kg IS NULL;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength') AND s.superhero_name = 'Hulk';	superhero
SELECT s.power_name FROM superhero s JOIN hero_power h ON s.id = h.hero_id WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero s WHERE s.skin_colour_id IN (SELECT id FROM colour WHERE colour = 'Green') AND s.alignment_id IN (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT COUNT(*) FROM superhero s WHERE s.gender_id IN (SELECT id FROM gender WHERE gender = 'Female') AND s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power h ON s.id = h.hero_id JOIN superpower p ON h.power_id = p.id WHERE p.power_name = 'Wind Control' ORDER BY s.superhero_name ASC;	superhero
SELECT g.gender FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' ORDER BY s.weight_kg DESC NULLS LAST LIMIT 1;	superhero
SELECT AVG(s.height_cm) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.race_id!= (SELECT id FROM race WHERE race = 'Human') AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(*) FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE ha.attribute_name = 'Speed' AND ha.attribute_value = 100;	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'));	superhero
SELECT a.attribute_name FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Black Panther' ORDER BY MIN(ha.attribute_value) LIMIT 1;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT s.superhero_name FROM superhero s WHERE s.height_cm = (SELECT MAX(s2.height_cm) FROM superhero s2);	superhero
SELECT s.superhero_name FROM superhero s WHERE s.full_name = 'Charles Chandler';	superhero
SELECT (COUNT(CASE WHEN s.gender_id = g.id THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'George Lucas' AND g.gender = 'Female';	superhero
SELECT (COUNT(CASE WHEN s.alignment_id = 1 THEN 1 END)::FLOAT / NULLIF(COUNT(*), 0) * 100) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT h.id FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT s.full_name FROM superhero s WHERE s.superhero_name = 'Alien';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.colour = 'Brown';	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT s.weight_kg, s.race_id FROM superhero s WHERE s.id = 40;	superhero
SELECT AVG(s.height_cm) FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral';	superhero
SELECT s.id FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Intelligence';	superhero
SELECT colour.colour FROM colour JOIN superhero ON colour.id = superhero.eye_colour_id WHERE superhero.superhero_name = 'Blackwulf';	superhero
SELECT s.superhero_name, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(s2.height_cm) * 0.8 FROM superhero s2);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q1 = (SELECT MAX(q2.q1) FROM qualifying q2 WHERE q2.raceId = 18 LIMIT 5);	formula_1
SELECT d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN qualifying q ON r.raceId = q.raceId AND d.driverId = q.driverId WHERE r.raceId = 19 AND q.position = 2 ORDER BY MIN(q.q2) LIMIT 1;	formula_1
SELECT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location ilike '%Shanghai%';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE LOWER(c.country) = 'germany';	formula_1
SELECT r.position FROM results r JOIN constructors c ON r.constructorId = c.constructorId WHERE c.name = 'Renault';	formula_1
SELECT COUNT(*) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND (c.country NOT ILIKE '%Asia%' AND c.country NOT ILIKE '%Europe%');	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain';	formula_1
SELECT c.lat, c.lng FROM circuits c WHERE c.name LIKE '%Australian Grand Prix%';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT r.time FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT c.lat, c.lng FROM circuits c WHERE c.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.country FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN results res ON r.raceId = res.raceId JOIN constructors cn ON res.constructorId = cn.constructorId JOIN constructorResults cr ON cn.constructorId = cr.constructorId WHERE r.round = 24 AND cr.points = 1;	formula_1
SELECT q1 FROM qualifying q WHERE q.driverId = (SELECT d.driverId FROM drivers d WHERE d.forename = 'Bruno' AND d.surname = 'Senna') AND q.raceId = 354;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '0:01:40' AND q.raceId = 355;	formula_1
SELECT d.number FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 903 AND q.position = 3 AND q.q3 = '00:01:54';	formula_1
SELECT COUNT(DISTINCT r.driverId) - COUNT(DISTINCT r.resultId) AS drivers_not_finished FROM results r JOIN races R2 ON r.raceId = R2.raceId WHERE R2.name = 'Bahrain Grand Prix' AND r.time IS NOT NULL;	formula_1
SELECT r.year, r.name AS race_name, r.date, r.time, r.url FROM races r WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM races r JOIN results re ON r.raceId = re.raceId WHERE re.time IS NOT NULL AND re.time!= '';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.time IS NOT NULL AND r.raceId = 592 ORDER BY d.dob ASC NULLS LAST LIMIT 1;	formula_1
SELECT d.url FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 161 AND r.time = '00:01:27';	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 933 AND r.fastestLapSpeed = (SELECT MAX(r2.fastestLapSpeed) FROM results r2 WHERE r2.raceId = 933);	formula_1
SELECT c.name, c.lat, c.lng FROM circuits c WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT c.url FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE cs.raceId = 9 ORDER BY cs.points DESC LIMIT 1;	formula_1
SELECT q1 FROM qualifying WHERE raceId = 345 AND driverId IN (SELECT driverId FROM drivers WHERE LOWER(surname) = 'di grassi' AND LOWER(forename) = 'lucas');	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '0:01:15' AND q.raceId = 347;	formula_1
SELECT d.code FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 45 AND q.q3 = '0:01:33';	formula_1
SELECT r.name, to_char(r.date, 'YYYY-MM-DD HH24:MI:SS') AS race_date, d.surname, to_char(l.time, 'HH24:MI:SS') AS finish_time FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN laps l ON r.resultId = l.resultId AND r.driverId = l.driverId WHERE d.forename = 'Bruce' AND d.surname = 'McLaren' AND r.raceId = 743;	formula_1
SELECT d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId IN (SELECT r2.raceId FROM races r2 JOIN circuits c ON r2.circuitId = c.circuitId WHERE LOWER(c.name) ='san marino') AND r.position = 2 AND r.year = 2006;	formula_1
SELECT r.year FROM races r WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.position IS NOT NULL AND res.position < 20 AND EXTRACT(YEAR FROM r.date) = 2015 AND EXTRACT(MONTH FROM r.date) = 11 AND EXTRACT(DAY FROM r.date) = 29;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL GROUP BY d.forename, d.surname ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId = 348 AND r.time = (SELECT MIN(r2.time) FROM results r2 WHERE r2.raceId = 348);	formula_1
SELECT d.nationality FROM drivers d JOIN (SELECT r.driverId FROM races r WHERE r.raceId = 348) AS r2 ON d.driverId = r2.driverId WHERE d.driverId IN (SELECT r.driverId FROM results r WHERE r.fastestLapSpeed = (SELECT MAX(r2.fastestLapSpeed) FROM results r2));	formula_1
SELECT (fastestLapSpeed(raceId = 853) - fastestLapSpeed(raceId = 854)) / NULLIF(fastestLapSpeed(raceId = 853), 0) * 100 AS percentage FROM results WHERE number = 853;	formula_1
SELECT DIVIDE(COUNT(DISTINCT r.driverId WHERE r.time IS NOT NULL AND r.date = '1983-07-16'), COUNT(DISTINCT r.driverId WHERE r.date = '1983-07-16')) AS percentage FROM races r;	formula_1
SELECT MIN(r.year) AS first_year FROM races r WHERE r.name LIKE '%Singapore Grand Prix%';	formula_1
SELECT COUNT(*) AS total_races, r.name FROM races r WHERE r.year = 2005 ORDER BY r.name DESC;	formula_1
SELECT r.name, r.date FROM races r WHERE r.year = (SELECT MIN(r2.year) FROM races r2 WHERE EXTRACT(MONTH FROM r2.date) = EXTRACT(MONTH FROM (SELECT MIN(r3.date) FROM races r3)) AND r2.year = EXTRACT(YEAR FROM (SELECT MIN(r4.date) FROM races r4))) ORDER BY r.date;	formula_1
SELECT r.name, r.date FROM races r WHERE r.year = 1999 ORDER BY r.round DESC LIMIT 1;	formula_1
SELECT r.year, COUNT(r.round) AS total_rounds FROM races r GROUP BY r.year ORDER BY total_rounds DESC LIMIT 1;	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 AND r.circuitId NOT IN (SELECT c.circuitId FROM circuits c WHERE c.circuitId IN (SELECT c.circuitId FROM circuits c WHERE c.year = 2000));	formula_1
SELECT c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.year = (SELECT MIN(year) FROM seasons WHERE url LIKE '%European Grand Prix%');	formula_1
SELECT MAX(r.year) AS last_year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.name) = 'brands hatch';	formula_1
SELECT COUNT(DISTINCT r.year) AS number_of_seasons FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.name) = 'Silverstone';	formula_1
SELECT d.forename, d.surname, d.position FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE ds.raceId IN (SELECT raceId FROM races WHERE name LIKE '%Singapore Grand Prix%') AND ds.year = 2010 ORDER BY ds.position;	formula_1
SELECT d.forename, d.surname, MAX(r.points) AS max_points FROM results r JOIN drivers d ON r.driverId = d.driverId GROUP BY d.forename, d.surname ORDER BY max_points DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, SUM(r.points) AS total_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2017 AND r.circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Shanghai International Circuit') GROUP BY d.forename, d.surname ORDER BY total_points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name AS race_name, MIN(l.time) AS best_lap_time FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN races r ON l.raceId = r.raceId GROUP BY d.forename, d.surname, r.name ORDER BY best_lap_time ASC NULLS LAST LIMIT 1;	formula_1
SELECT AVG(milliseconds/1000.0) AS average_lap_time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE d.forename = 'Sebastian' AND d.surname = 'Vettel' AND lt.raceId = (SELECT raceId FROM races WHERE name = 'Chinese Grand Prix' AND year = 2009);	formula_1
SELECT DIVIDE(COUNT(r.resultId) WHERE r.surname = 'Hamilton' AND r.year >= 2010 AND r.position > 1), (COUNT(r.resultId) WHERE r.surname = 'Hamilton' AND r.year >= 2010) AS percentage FROM results r;	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(COUNT(d.driverStandingsId)) AS wins, AVG(dr.points) AS avg_points FROM drivers d JOIN driverStandings dr ON d.driverId = dr.driverId GROUP BY d.forename, d.surname, d.nationality ORDER BY wins DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, 2022 - EXTRACT(YEAR FROM d.dob) + 1 AS age FROM drivers d WHERE d.nationality = 'Japanese' ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.name HAVING COUNT(r.raceId) >= 4;	formula_1
SELECT c.name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name, c.name AS circuit_name, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE EXTRACT(MONTH FROM r.date) = 9 AND EXTRACT(YEAR FROM r.date) = 2005;	formula_1
SELECT r.name AS race_name, d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.position < 10;	formula_1
SELECT COUNT(*) FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN circuits c ON r.raceId = c.circuitId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND r.points = (SELECT MAX(r2.points) FROM results r2 WHERE r2.raceId = r.raceId);	formula_1
SELECT r.name, r.year FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY r.year NULLS LAST;	formula_1
SELECT AVG(r.points) FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Irvine' AND r.year = 2000;	formula_1
SELECT r.name, MIN(r.year) AS year, d.points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' GROUP BY r.name, d.points;	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT r.name, r.year, c.name AS circuit_name FROM (SELECT r.name, r.year, r.circuitId, COUNT(l.lap) AS total_laps FROM races r JOIN lapTimes l ON r.raceId = l.raceId GROUP BY r.name, r.year, r.circuitId) AS subquery WHERE total_laps = (SELECT MAX(total_laps) FROM (SELECT r.name, r.year, r.circuitId, COUNT(l.lap) AS total_laps FROM races r JOIN lapTimes l ON r.raceId = l.raceId GROUP BY r.name, r.year, r.circuitId) AS subquery); SELECT c.name AS circuit_location FROM circuits c WHERE c.circuitId = (SELECT circuitId FROM (SELECT r.name, r.year, r.circuitId, COUNT(l.lap) AS total_laps FROM races r JOIN lapTimes l ON r.raceId = l.raceId GROUP BY r.name, r.year, r.circuitId) AS subquery WHERE total_laps = (SELECT MAX(total_laps) FROM (SELECT r.name, r.year, r.circuitId, COUNT(l.lap) AS total_laps FROM races r JOIN lapTimes l ON r.raceId = l.raceId GROUP BY r.name, r.year, r.circuitId) AS subquery));	formula_1
SELECT (COUNT(CASE WHEN c.country = 'Germany' AND r.name = 'European Grand Prix' THEN 1 END) * 100.0 / NULLIF(COUNT(CASE WHEN r.name = 'European Grand Prix' THEN 1 END), 0)) AS percentage FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Germany' AND r.name = 'European Grand Prix';	formula_1
SELECT c.lat, c.lng FROM circuits c WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT c.name FROM circuits c WHERE c.lat = (SELECT MAX(c2.lat) FROM circuits c2 WHERE c2.name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring'));	formula_1
SELECT c.circuitRef FROM circuits c WHERE c.name = 'Marina Bay Street Circuit';	formula_1
SELECT c.country FROM circuits c WHERE c.alt = (SELECT MAX(c2.alt) FROM circuits c2);	formula_1
SELECT COUNT(*) FROM drivers d WHERE d.code IS NULL;	formula_1
SELECT d.nationality FROM drivers d WHERE d.dob = (SELECT MIN(d2.dob) FROM drivers d2);	formula_1
SELECT d.surname FROM drivers d WHERE d.nationality = 'Italian';	formula_1
SELECT d.url FROM drivers d WHERE d.forename = 'Anthony' AND d.surname = 'Davidson';	formula_1
SELECT d.driverRef FROM drivers d WHERE d.surname = 'Hamilton';	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = 2008 AND r.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT r.year FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.name = 'Silverstone';	formula_1
SELECT r.name, c.name, r.date, r.time, r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name ilike '%Silverstone%';	formula_1
SELECT r.time FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.name ilike '%Abu Dhabi%' AND r.year = 2010;	formula_1
SELECT COUNT(DISTINCT r.raceId) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.location) = 'italy';	formula_1
SELECT DISTINCT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name ilike '%Barcelona-Catalunya%';	formula_1
SELECT c.url FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = 2009 AND r.name = 'Spanish Grand Prix';	formula_1
SELECT MIN(r.fastestLapTime) AS fastest_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE s.status = 'Fastest Lap' ORDER BY r.fastestLapSpeed DESC LIMIT 1;	formula_1
SELECT d.driverRef FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId IN (SELECT raceId FROM races WHERE name = 'Australian Grand Prix') AND r.position = 1 AND EXTRACT(YEAR FROM r.race.date) = 2008;	formula_1
SELECT r.name FROM races r JOIN results rs ON r.raceId = rs.raceId JOIN drivers d ON rs.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.name, d.surname, d.forename, MIN(d.rank) AS min_rank FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' GROUP BY r.name, d.surname, d.forename ORDER BY min_rank ASC NULLS LAST LIMIT 1;	formula_1
SELECT MAX(r.fastestLapSpeed) AS fastest_lap_speed FROM results r WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.name ilike '%Spanish Grand Prix%' AND r2.year = 2009);	formula_1
SELECT DISTINCT r.year FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.positionOrder FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.name = 'Australian Grand Prix' AND r2.year = 2008);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.name = 'Australian Grand Prix' AND EXTRACT(YEAR FROM r2.date) = 2008) AND r.grid = 4;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM results r JOIN races r2 ON r.raceId = r2.raceId WHERE r2.name = 'Australian Grand Prix' AND r.time IS NOT NULL AND r2.year = 2008;	formula_1
SELECT r.name AS race, l.time AS fastest_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN lapTimes l ON r.resultId = l.raceId AND r.driverId = l.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.year = 2008 AND l.lap = 1;	formula_1
SELECT r.time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.position = 2 AND d.nationality = 'Australian' AND r.raceId IN (SELECT r2.raceId FROM races r2 JOIN seasons s ON r2.year = s.year WHERE s.url = '2008' AND r2.name = 'Australian Grand Prix');	formula_1
SELECT d.surname, d.forename, r.name, r.date, r.time, c.url FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN constructors c ON r.constructorId = c.constructorId WHERE r.raceId = (SELECT r2.raceId FROM races r2 WHERE r2.name = 'Australian Grand Prix' AND EXTRACT(YEAR FROM r2.date) = 2008) AND r.position = 1;	formula_1
SELECT COUNT(*) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'American' AND r.raceId IN (SELECT r.raceId FROM races r WHERE r.year = 2008 AND r.name = 'Australian Grand Prix');	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId = 1 AND r.time IS NOT NULL;	formula_1
SELECT SUM(d.points) AS total_points FROM driverStandings d WHERE d.driverId IN (SELECT d.driverId FROM drivers d WHERE LOWER(d.surname) = 'hamilton');	formula_1
SELECT AVG(EXTRACT(MINUTE FROM TO_TIMESTAMP(r.time, 'HH24:MI'))*60 + EXTRACT(SECOND FROM TO_TIMESTAMP(r.time, 'HH24:MI')) + EXTRACT(MICROSECOND FROM TO_TIMESTAMP(r.time, 'HH24:MI'))/60000.0) AS averageFastestLapTime FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT CAST(COUNT(DISTINCT CASE WHEN r.time IS NOT NULL THEN r.raceId END) AS FLOAT) / NULLIF(COUNT(DISTINCT r.raceId), 0) AS rate FROM results r WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.name = 'Australian Grand Prix' AND r2.year = 2008);	formula_1
WITH champion_time AS (SELECT (EXTRACT(HOUR FROM time) * 3600 + EXTRACT(MINUTE FROM time) * 60 + EXTRACT(SECOND FROM time) + EXTRACT(MILLISECOND FROM time) / 1000.0) AS time_in_seconds FROM results WHERE raceId = 1 AND time IS NOT NULL AND year = 2008 ORDER BY points DESC LIMIT 1), last_driver_time AS (SELECT (EXTRACT(HOUR FROM time) * 3600 + EXTRACT(MINUTE FROM time) * 60 + EXTRACT(SECOND FROM time) + EXTRACT(MILLISECOND FROM time) / 1000.0) AS time_in_seconds FROM results WHERE raceId = 1 AND time IS NOT NULL AND year = 2008 ORDER BY points ASC NULLS LAST LIMIT 1), champion_time_diff AS (SELECT (champion_time.time_in_seconds - last_driver_time.time_in_seconds) AS time_diff FROM champion_time, last_driver_time) SELECT ((champion_time_diff.time_diff / NULLIF(last_driver_time.time_in_seconds, 0)) * 100) AS percentage_faster FROM champion_time, last_driver_time, champion_time_diff;	formula_1
SELECT COUNT(*) FROM circuits c WHERE c.location ilike '%Melbourne%Australia%';	formula_1
SELECT c.lat, c.lng FROM circuits c WHERE c.country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers d WHERE d.nationality = 'British' AND EXTRACT(YEAR FROM d.dob) > 1980;	formula_1
SELECT AVG(cr.points) AS average_points FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'British';	formula_1
WITH ConstructorPoints AS (SELECT cr.constructorId, SUM(cr.points) AS totalPoints FROM constructorResults cr GROUP BY cr.constructorId) SELECT c.name, cp.totalPoints FROM ConstructorPoints cp JOIN constructors c ON cp.constructorId = c.constructorId ORDER BY cp.totalPoints DESC LIMIT 1;	formula_1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.points = 0 AND cr.raceId = 291;	formula_1
SELECT COUNT(*) FROM (SELECT cr.constructorId FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId JOIN drivers d ON c.nationality = d.nationality WHERE c.nationality = 'Japanese' AND cr.points = 0 GROUP BY cr.constructorId HAVING COUNT(cr.raceId) = 2) AS subquery;	formula_1
SELECT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(*) FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN drivers d ON cr.driverId = d.driverId WHERE d.nationality = 'French' AND cr.lap > 50;	formula_1
SELECT (COUNT(DISTINCT r.DriverID) filter (WHERE r.time IS NOT NULL AND r.year BETWEEN 2007 AND 2009)::FLOAT / NULLIF(COUNT(DISTINCT r.DriverID) filter (WHERE r.year BETWEEN 2007 AND 2009), 0)) * 100 AS percentage FROM results r WHERE r.nationality = 'Japanese';	formula_1
SELECT r.year, AVG(EXTRACT(EPOCH FROM TO_TIMESTAMP(r.time)) / 60) AS average_time_in_seconds FROM races r JOIN results res ON r.raceId = res.raceId AND res.position = 1 WHERE res.time IS NOT NULL GROUP BY r.year ORDER BY r.year NULLS LAST;	formula_1
SELECT d.forename, d.surname FROM drivers d WHERE d.dob > '1975-01-01' AND d.rank = 2 ORDER BY d.surname;	formula_1
SELECT COUNT(*) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN (SELECT lt.driverId, MIN(lt.time) AS min_time FROM lapTimes lt GROUP BY lt.driverId) AS mt ON d.driverId = mt.driverId ORDER BY mt.min_time ASC LIMIT 1;	formula_1
SELECT MAX(l.time) AS fastest_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN constructorStandings cs ON r.raceId = cs.raceId AND r.driverId = cs.driverId WHERE r.year = 2009 AND cs.wins > 10;	formula_1
SELECT AVG(fastestLapSpeed) AS average_fastest_lap_speed FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Spanish Grand Prix';	formula_1
SELECT r.name, r.year, MIN(t.milliseconds) AS shortest_time FROM races r JOIN results t ON r.raceId = t.raceId WHERE t.milliseconds IS NOT NULL GROUP BY r.name, r.year ORDER BY shortest_time ASC LIMIT 1;	formula_1
SELECT (COUNT(DISTINCT r.driverId) FROM results r WHERE YEAR(r.dob) < 1985 AND r.laps > 50) * 100.0 / NULLIF(COUNT(DISTINCT r.driverId) FROM results r WHERE YEAR(r.dob) BETWEEN 2000 AND 2005), NULL AS percentage FROM results r WHERE YEAR(r.dob) BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(*) FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.time < '01:00:00';	formula_1
SELECT d.driverRef FROM drivers d WHERE d.nationality = 'America';	formula_1
SELECT r.raceId FROM races r WHERE r.year = 2009;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM races r WHERE r.raceId = 18;	formula_1
SELECT d.driverRef, d.code FROM drivers d WHERE d.nationality = 'Netherlands' ORDER BY d.dob DESC LIMIT 3;	formula_1
SELECT d.driverRef FROM drivers d WHERE d.forename = 'Robert' AND d.surname = 'Kubica';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d WHERE d.nationality = 'Australian' AND EXTRACT(YEAR FROM d.dob) = 1980;	formula_1
SELECT d.forename, d.surname, MIN(l.time) AS min_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE EXTRACT(YEAR FROM d.dob) BETWEEN 1980 AND 1990 GROUP BY d.forename, d.surname ORDER BY min_lap_time LIMIT 3;	formula_1
SELECT d.driverRef FROM drivers d WHERE d.nationality = 'German' ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT r.resultId, r.driverId, r.driverRef FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.dob = '1971-01-01' AND r.fastestLapTime IS NOT NULL;	formula_1
SELECT d.forename, d.surname, MAX(l.time) AS max_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'Spanish' AND d.dob < '1982' GROUP BY d.forename, d.surname ORDER BY max_time DESC LIMIT 10;	formula_1
SELECT r.year FROM results r WHERE r.fastestLapTime = (SELECT MIN(r2.fastestLapTime) FROM results r2);	formula_1
SELECT r.year FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId WHERE lt.time = (SELECT MAX(lt2.time) FROM lapTimes lt2);	formula_1
SELECT d.driverId, MIN(l.time) AS fastest_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId GROUP BY d.driverId ORDER BY fastest_lap_time ASC LIMIT 5;	formula_1
SELECT COUNT(*) FROM results r WHERE r.statusId = 2 AND r.time IS NOT NULL AND r.raceId > 50 AND r.raceId < 100;	formula_1
SELECT COUNT(r.raceId), c.name, c.lat, c.lng FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.name) LIKE '%austria%' GROUP BY r.raceId, c.name, c.lat, c.lng;	formula_1
SELECT r.number FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.time IS NOT NULL GROUP BY r.number ORDER BY COUNT(res.resultId) DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.number = 2 AND q.raceId = 23;	formula_1
SELECT r.name, r.date, r.time FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers);	formula_1
SELECT COUNT(*) FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.statusId = 2 AND d.nationality = 'American';	formula_1
SELECT c.name, c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'Italian' ORDER BY cr.points DESC NULLS LAST LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId GROUP BY c.url ORDER BY SUM(cs.wins) DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races r2 ON r.raceId = r2.raceId WHERE r2.name = 'French Grand Prix' AND r.lap = 3 ORDER BY r.time ASC NULLS LAST LIMIT 1;	formula_1
SELECT r.name, MIN(l.time) AS min_time FROM lapTimes l JOIN races r ON l.raceId = r.raceId GROUP BY r.name ORDER BY min_time ASC LIMIT 1;	formula_1
SELECT AVG(r.time) FROM results r WHERE r.rank < 11 AND r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.name = 'United States Grand Prix' AND r2.year = 2006);	formula_1
SELECT d.surname, d.forename, AVG(p.duration) AS avg_duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.surname, d.forename ORDER BY avg_duration ASC NULLS LAST LIMIT 5;	formula_1
SELECT d.forename, d.surname, to_char(to_date(r.time, 'HH24:MI:SS'), 'HH24:MI:SS') AS time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId IN (SELECT r2.raceId FROM races r2 JOIN drivers dr2 ON r2.raceId = dr2.raceId WHERE r2.name ilike '%Canadian Grand Prix%' AND EXTRACT(YEAR FROM r2.date) = 2008) AND r.position = 1;	formula_1
SELECT c.constructorRef, c.url FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE cs.raceId IN (SELECT r.raceId FROM races r WHERE r.name = 'Singapore Grand Prix' AND r.year = 2009) ORDER BY cs.points DESC NULLS LAST LIMIT 1;	formula_1
SELECT d.forename, d.surname, d.dob FROM drivers d WHERE d.nationality = 'Austrian' AND EXTRACT(YEAR FROM d.dob) BETWEEN 1981 AND 1991;	formula_1
SELECT d.forename, d.surname, d.url, d.dob FROM drivers d WHERE EXTRACT(YEAR FROM d.dob) BETWEEN 1971 AND 1985 AND d.nationality = 'German' ORDER BY d.dob DESC;	formula_1
SELECT c.location, c.country, c.lat, c.lng FROM circuits c WHERE c.name = 'Hungaroring';	formula_1
SELECT SUM(cr.points) AS total_points, c.name, c.nationality FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.year BETWEEN 1980 AND 2010 AND r.name = 'Monaco Grand Prix' GROUP BY c.name, c.nationality ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(r.points) FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.raceId IN (SELECT raceId FROM races WHERE LOWER(name) LIKE '%Turkish Grand Prix%');	formula_1
SELECT EXTRACT(YEAR FROM r.date) AS YEAR, COUNT(r.raceId) AS num_races FROM races r WHERE r.date BETWEEN '2000-01-01' AND '2010-12-12' GROUP BY EXTRACT(YEAR FROM r.date) ORDER BY EXTRACT(YEAR FROM r.date) NULLS LAST;	formula_1
SELECT d.nationality FROM drivers d GROUP BY d.nationality ORDER BY COUNT(d.nationality) DESC LIMIT 1;	formula_1
SELECT SUM(r.points) AS total_points FROM (SELECT d.driverId, d.surname, d.forename, SUM(r.points) AS points FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.driverId IN (SELECT d2.driverId FROM drivers d2 JOIN results r2 ON d2.driverId = r2.driverId WHERE r2.points = (SELECT MAX(r3.points) FROM results r3)) GROUP BY d.driverId, d.surname, d.forename) AS t WHERE t.points = 91;	formula_1
SELECT r.name, MIN(t.time) AS fastest_lap_time FROM results r JOIN laps t ON r.resultId = t.raceId AND r.driverId = t.driverId GROUP BY r.name ORDER BY fastest_lap_time ASC NULLS LAST LIMIT 1;	formula_1
SELECT c.name, c.location || ','|| c.country AS full_location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(r2.date) FROM races r2);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE r.rank = 1 AND ra.year = 2008 AND r.time = (SELECT MIN(q3) FROM qualifying);	formula_1
SELECT d.forename, d.surname, d.nationality, to_char(r.date, 'YYYY-MM-DD') AS first_race_date FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob = (SELECT MAX(dob) FROM drivers);	formula_1
WITH CanadianGP AS (SELECT r.name, COUNT(*) AS num_accidents FROM results r WHERE r.positionText = 'DNF' AND r.statusId = 3 GROUP BY r.name) SELECT MAX(num_accidents) AS max_accidents FROM CanadianGP;	formula_1
SELECT d.forename, d.surname, SUM(r.wins) AS total_wins FROM drivers d JOIN results r ON d.driverId = r.driverId GROUP BY d.forename, d.surname ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT MAX(p.duration) AS max_duration FROM pitStops p;	formula_1
SELECT MIN(l.time) FROM lapTimes l;	formula_1
SELECT MAX(p.duration) AS longest_duration FROM pitStops p JOIN drivers d ON p.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT pt.lap, pt.time FROM pitStops pt JOIN drivers d ON pt.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND pt.raceId IN (SELECT r.raceId FROM races r WHERE r.year = 2011 AND r.name = 'Australian Grand Prix');	formula_1
SELECT d.forename, d.surname, ps.time, ps.duration FROM drivers d JOIN pitStops ps ON d.driverId = ps.driverId JOIN races r ON ps.raceId = r.raceId WHERE r.year = 2011;	formula_1
SELECT r.name, MIN(l.time) AS fastest_lap FROM races r JOIN drivers d ON r.circuitId = d.driverId JOIN lapTimes l ON r.raceId = l.raceId AND d.driverId = l.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' GROUP BY r.name;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN (SELECT r.driverId, MIN(l.time) AS min_time FROM races r JOIN lapTimes l ON r.raceId = l.raceId GROUP BY r.driverId) AS lt ON d.driverId = lt.driverId ORDER BY lt.min_time ASC LIMIT 1;	formula_1
SELECT r.name AS race_name, c.name AS circuit_name, d.surname AS driver_surname, d.forename AS driver_forename, s.status AS status, d.position FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN constructors c ON r.constructorId = c.constructorId JOIN status s ON r.statusId = s.statusId WHERE r.driverId = (SELECT r2.driverId FROM results r2 WHERE r2.time = (SELECT MIN(time) FROM results r3 WHERE r3.driverId = r2.driverId)) ORDER BY r.name NULLS LAST;	formula_1
SELECT MIN(l.time) FROM lapTimes l WHERE l.raceId IN (SELECT r.raceId FROM races r WHERE LOWER(r.name) = 'austrian grand prix');	formula_1
SELECT c.name, l.time FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes l ON r.raceId = l.raceId AND l.lap = 1 WHERE c.location = 'Italy' ORDER BY l.time ASC NULLS LAST;	formula_1
SELECT r.name AS race_name, l.time AS lap_record_time FROM lapTimes l JOIN races r ON l.raceId = r.raceId WHERE l.raceId IN (SELECT raceId FROM circuits WHERE name = 'Austrian Grand Prix') ORDER BY l.time ASC LIMIT 1;	formula_1
SELECT r.name, CAST(p.time AS integer) AS time FROM races r JOIN results rs ON r.raceId = rs.raceId JOIN pitStops p ON rs.raceId = p.raceId AND rs.driverId = p.driverId WHERE rs.driverId IN (SELECT d.driverId FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE d.nationality = 'Austrian') ORDER BY time ASC LIMIT 1;	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN results r ON c.circuitId = r.raceId JOIN status s ON r.statusId = s.statusId WHERE r.position = 1 AND s.status = 'fastest lap';	formula_1
SELECT AVG(p.duration) AS average_pit_stop_duration FROM pitStops p JOIN drivers d ON p.driverId = d.driverId WHERE d.surname = 'Hamilton';	formula_1
SELECT AVG(lapTimes.milliseconds) AS average_lap_time FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE LOWER(circuits.location) = 'italy';	formula_1
SELECT p.player_api_id FROM Player_Attributes p WHERE p.overall_rating = (SELECT MAX(p2.overall_rating) FROM Player_Attributes p2);	european_football_2
SELECT p.player_name, MAX(p.height) AS height FROM Player p GROUP BY p.player_name ORDER BY height DESC LIMIT 1;	european_football_2
SELECT pa.preferred_foot FROM Player_Attributes pa WHERE pa.potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id) FROM Player_Attributes pa WHERE pa.defensive_work_rate = 'low' AND pa.overall_rating >= 60 AND pa.overall_rating < 65;	european_football_2
SELECT p.player_api_id, MAX(pa.crossing) AS max_crossing FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id GROUP BY p.player_api_id ORDER BY max_crossing DESC LIMIT 5;	european_football_2
SELECT l.name FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' ORDER BY SUM(m.home_team_goal, m.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT m.home_team_api_id, COUNT(*) AS lost_matches FROM Match m WHERE m.season = '2015/2016' AND (m.home_team_goal - m.away_team_goal) < 0 GROUP BY m.home_team_api_id ORDER BY lost_matches ASC LIMIT 1;	european_football_2
SELECT p.player_name, MAX(pa.penalties) AS max_penalties FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_name ORDER BY max_penalties DESC LIMIT 10;	european_football_2
SELECT t.team_short_name, COUNT(*) AS wins FROM Match m JOIN Team t ON m.away_team_api_id = t.team_api_id WHERE m.country_id IN (SELECT id FROM Country WHERE name = 'Scotland') AND m.season = '2009/2010' AND (m.away_team_goal - m.home_team_goal) > 0 GROUP BY t.team_short_name ORDER BY wins DESC LIMIT 1;	european_football_2
SELECT t.team_long_name, MAX(t.buildUpPlaySpeed) AS max_build_up_play_speed FROM Team_Attributes t GROUP BY t.team_long_name ORDER BY max_build_up_play_speed DESC LIMIT 4;	european_football_2
SELECT l.name, MAX(SUM(M.home_team_goal = M.away_team_goal)) AS max_draws FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY l.name ORDER BY max_draws DESC LIMIT 1;	european_football_2
SELECT p.player_api_id, p.player_name, (julianday('now') - julianday(birthday))/31536.0 AS age FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.sprint_speed >= 97 AND pa.date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00' ORDER BY age NULLS LAST;	european_football_2
SELECT l.name, MAX(COUNT(m.league_id)) AS total_matches FROM League l JOIN Match m ON l.id = m.league_id GROUP BY l.name ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT p.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.date > '2010-01-01' AND pa.date < '2011-01-01' ORDER BY pa.overall_rating DESC LIMIT 1;	european_football_2
SELECT t.team_fifa_api_id FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.buildUpPlaySpeed BETWEEN 51 AND 59;	european_football_2
SELECT t.team_long_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlayPassing IS NOT NULL AND strftime('%Y', ta.date) = '2012' GROUP BY t.team_long_name HAVING SUM(ta.buildUpPlayPassing) / NULLIF(COUNT(t.team_long_name), 0) < AVG(ta.buildUpPlayPassing);	european_football_2
SELECT DIVIDE(MULTIPLY(SUM(CASE WHEN pa.preferred_foot = 'left' THEN 1 ELSE 0 END), 1.0), COUNT(pa.player_fifa_api_id)) AS percentage FROM Player_Attributes pa WHERE pa.birthday BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00';	european_football_2
SELECT l.name, SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM Match m JOIN League l ON m.league_id = l.id GROUP BY l.name ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(long_shots) AS average_long_shots FROM Player_Attributes pa WHERE pa.player_api_id = 218353;	european_football_2
SELECT p.player_name, AVG(h.heading_accuracy) AS avg_heading_accuracy FROM Player p JOIN Player_Attributes h ON p.player_api_id = h.player_api_id WHERE p.height > 180 GROUP BY p.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT t.team_long_name, AVG(t.chanceCreationPassing) AS average_chance_creation_passing, SUM(t.chanceCreationPassing) AS total_chance_creation_passing FROM Team_Attributes t WHERE t.buildUpPlayDribblingClass = 'Normal' AND t.date >= '2014-01-01 00:00:00' AND t.date <= '2014-12-31 00:00:00' GROUP BY t.team_long_name HAVING SUM(t.chanceCreationPassing) / NULLIF(COUNT(t.id), 0) > t.chanceCreationPassing ORDER BY total_chance_creation_passing DESC;	european_football_2
SELECT l.name FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2009/2010' AND AVG(m.home_team_goal) > AVG(m.away_team_goal);	european_football_2
SELECT t.team_short_name FROM Team t WHERE t.team_long_name = 'Queens Park Rangers';	european_football_2
SELECT p.player_name FROM Player p WHERE p.height > 180 AND p.weight > 70 ORDER BY p.height DESC NULLS LAST;	european_football_2
SELECT pa.attacking_work_rate FROM Player_Attributes pa WHERE pa.player_api_id = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Franco Zennaro');	european_football_2
SELECT t.team_long_name, ta.buildUpPlayPositioningClass FROM Team AS t JOIN Team_Attributes AS ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE t.team_long_name = 'ADO Den Haag';	european_football_2
SELECT pa.heading_accuracy FROM Player_Attributes pa WHERE pa.date = '2014-09-18 00:00:00' AND pa.player_api_id IN (SELECT pa.player_api_id FROM Player_Attributes pa WHERE pa.date = '2014-09-18 00:00:00' AND pa.player_name = 'Francois Affolter');	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa WHERE pa.player_api_id IN (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Gabriel Tamas') AND strftime('%Y', pa.date) = '2011';	european_football_2
SELECT COUNT(*) FROM Match m JOIN League l ON m.league_id = l.id WHERE l.name = 'Scotland Premier League' AND m.season = '2015/2016';	european_football_2
SELECT pa.preferred_foot FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY p.birthday DESC LIMIT 1;	european_football_2
SELECT p.player_name, p.player_fifa_api_id, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_fifa_api_id = pa.player_fifa_api_id WHERE pa.potential = (SELECT MAX(pa2.potential) FROM Player_Attributes pa2);	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND weight < 130;	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT p.attacking_work_rate, p.defensive_work_rate FROM Player_Attributes p WHERE p.player_api_id IN (SELECT pa.player_api_id FROM Player_Attributes pa WHERE LOWER(pa.player_name) = 'David Wilson');	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.date = (SELECT MAX(pa.date) FROM Player_Attributes pa);	european_football_2
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE LOWER(c.name) = 'netherlands';	european_football_2
SELECT AVG(M.home_team_goal) FROM Match M JOIN League L ON M.league_id = L.id JOIN Country C ON L.country_id = C.id WHERE C.name = 'Poland' AND M.season = '2010/2011';	european_football_2
SELECT p.player_name, AVG(pa.finishing) AS average_finishing_rate FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height = (SELECT MAX(height) FROM Player) OR p.height = (SELECT MIN(height) FROM Player) GROUP BY p.player_name ORDER BY average_finishing_rate DESC NULLS LAST LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p WHERE p.height > 180;	european_football_2
SELECT COUNT(*) FROM Player p WHERE strftime('%Y', p.birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player p WHERE p.player_name ilike 'Adam%' AND p.weight > 170;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', pa.date) BETWEEN '2008' AND '2010' AND pa.overall_rating > 80;	european_football_2
SELECT p.player_api_id, p.player_name, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Aaron Doran';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.preferred_foot = 'left';	european_football_2
SELECT t.team_long_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT t.buildUpPlayPassingClass FROM Team t WHERE t.team_short_name = 'CLB';	european_football_2
SELECT t.team_short_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlayPassing > 70;	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE strftime('%Y', date) BETWEEN '2010' AND '2015' AND height > 170;	european_football_2
SELECT p.player_name, p.height FROM Player p WHERE p.height = (SELECT MIN(p2.height) FROM Player p2);	european_football_2
SELECT l.country_id FROM League l WHERE l.name = 'Italy Serie A';	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.buildUpPlaySpeed = 31 AND ta.buildUpPlayDribbling = 53 AND ta.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(pa.overall_rating) AS average_overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(*) AS matches_count FROM Match m JOIN League l ON m.league_id = l.id WHERE LOWER(l.name) = 'germany 1. bundesliga' AND strftime('%Y-%m', m.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT t.team_short_name FROM Match m JOIN Team t ON m.home_team_api_id = t.team_api_id WHERE m.home_team_goal = 10;	european_football_2
SELECT p.player_name, p.player_api_id, p.player_fifa_api_id, p.birthday, p.height, p.weight, pa.balance, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.balance = (SELECT MAX(pa2.balance) FROM Player_Attributes pa2 WHERE pa2.potential = 61);	european_football_2
SELECT (AVG(t.ball_control) - AVG(h.ball_control)) AS difference FROM Player_Attributes h JOIN Player p1 ON h.player_api_id = p1.player_api_id JOIN Player_Attributes t ON p1.player_api_id = t.player_api_id WHERE p1.player_name = 'Abdou Diallo' AND t.player_api_id NOT IN (SELECT player_api_id FROM Player_Attributes WHERE player_name = 'Abdou Diallo'); UNION SELECT (AVG(t.ball_control) - AVG(h.ball_control)) AS difference FROM Player_Attributes h JOIN Player p2 ON h.player_api_id = p2.player_api_id JOIN Player_Attributes t ON p2.player_api_id = t.player_api_id WHERE p2.player_name = 'Aaron Appindangoye' AND t.player_api_id NOT IN (SELECT player_api_id FROM Player_Attributes WHERE player_name = 'Aaron Appindangoye');	european_football_2
SELECT t.team_long_name FROM Team t WHERE t.team_short_name = 'GEN';	european_football_2
SELECT p1.player_name, p2.player_name FROM Player p1 JOIN Player p2 ON p1.player_api_id = p2.player_api_id WHERE p1.birthday > p2.birthday;	european_football_2
SELECT p.player_name, MAX(p.height) FROM Player p GROUP BY p.player_name ORDER BY MAX(p.height) DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate ='medium';	european_football_2
SELECT l.name FROM League l WHERE l.name = 'Belgium Jupiler League';	european_football_2
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE c.name = 'Germany';	european_football_2
SELECT p.player_api_id, p.player_name, MAX(pa.overall_rating) AS max_overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id GROUP BY p.player_api_id, p.player_name ORDER BY max_overall_rating DESC LIMIT 1;	european_football_2
SELECT COUNT(DISTINCT p.player_api_id) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', p.birthday)<'1986' AND pa.defensive_work_rate = 'high';	european_football_2
SELECT p.player_name, MAX(pa.crossing) AS max_crossing FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') GROUP BY p.player_name ORDER BY max_crossing DESC LIMIT 1;	european_football_2
SELECT pa.heading_accuracy FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Ariel Borysiuk';	european_football_2
SELECT COUNT(*) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 AND pa.volleys > 70;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match m JOIN Country c ON m.country_id = c.id WHERE LOWER(c.name) = 'belgium' AND m.season = '2008/2009';	european_football_2
SELECT MAX(p.long_passing) AS long_passing_score FROM Player p ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Match m WHERE m.league_id IN (SELECT id FROM League WHERE name = 'Belgium Jupiler League') AND strftime('%Y', m.date) = '2009' AND strftime('%m', m.date) = '04';	european_football_2
SELECT l.name FROM League l JOIN Match m ON l.id = m.league_id WHERE m.season = '2008/2009' GROUP BY l.name ORDER BY COUNT(m.id) DESC LIMIT 1;	european_football_2
SELECT AVG(p.overall_rating) AS average_overall_rating FROM Player p WHERE strftime('%Y', p.birthday) < '1986';	european_football_2
SELECT (SELECT ((pa.overall_rating - (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel'))::FLOAT / (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel')) * 100) AS percentage_difference FROM Player_Attributes pa WHERE pa.player_name = 'Ariel Borysiuk';	european_football_2
SELECT AVG(t.buildUpPlaySpeed) FROM Team t JOIN Player p ON t.team_api_id = p.team_api_id WHERE t.team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating) FROM Player T1 WHERE T1.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(pa.crossing) AS total_crossing_score FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(t.buildUpPlayPassing) AS highest_passing_score, t.buildUpPlayPassingClass AS passing_class FROM Team_Attributes t JOIN Team t2 ON t.team_fifa_api_id = t2.team_fifa_api_id WHERE t2.team_long_name = 'Ajax';	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(t1.overall_rating) AS highest_overall_rating FROM Player_Attributes t1 JOIN Player t2 ON t1.player_api_id = t2.player_api_id WHERE LOWER(t2.player_name) = 'dorlan pabon';	european_football_2
SELECT AVG(M.away_team_goal) AS average_goals FROM Match M JOIN Team T ON M.away_team_api_id = T.team_api_id WHERE LOWER(T.team_long_name) = 'parma';	european_football_2
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.date = '2016-06-23 00:00:00' AND pa.overall_rating = 77 ORDER BY p.birthday ASC NULLS LAST LIMIT 1;	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Aaron Mooy' AND pa.date = '2016-02-04 00:00:00';	european_football_2
SELECT t.player_api_id, t.player_name, t.date, t.overall_rating, t.potential FROM Player_Attributes t WHERE t.player_name = 'Francesco Parravicini' AND t.date = '2010-08-30 00:00:00';	european_football_2
SELECT t.attacking_work_rate FROM Player_Attributes t WHERE t.player_name = 'Francesco Migliore' AND t.date = '2015-05-01 00:00:00';	european_football_2
SELECT d.defensive_work_rate FROM Player_Attributes d WHERE d.player_name = 'Kevin Berigaud' AND d.date = '2013-02-22 00:00:00';	european_football_2
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' ORDER BY date ASC LIMIT 1;	european_football_2
SELECT t.buildUpPlaySpeedClass FROM Team_Attributes t JOIN Team ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE ta.team_long_name = 'Willem II' AND t.date = '2012-02-22 00:00:00';	european_football_2
SELECT t.buildUpPlayDribblingClass FROM Team_Attributes t JOIN Team t1 ON t.team_api_id = t1.team_api_id WHERE t1.team_short_name = 'LEI' AND t.date = '2015-09-10 00:00:00';	european_football_2
SELECT t.buildUpPlayPassingClass FROM Team_Attributes t WHERE t.team_long_name = 'FC Lorient' AND t.date = '2010-02-22';	european_football_2
SELECT t.buildUpPlayPassingClass FROM Team_Attributes t JOIN Team ta ON t.team_api_id = ta.team_api_id WHERE ta.team_long_name = 'PEC Zwolle' AND t.date = '2013-09-20 00:00:00';	european_football_2
SELECT t.buildUpPlayCrossingClass FROM Team_Attributes t JOIN Team ta ON t.team_api_id = ta.team_api_id WHERE ta.team_long_name = 'Hull City' AND t.date = '2010-02-22 00:00:00';	european_football_2
SELECT ta.buildUpPlayPassingClass, ta.buildUpPlayDribblingClass, ta.buildUpPlayPositioningClass, ta.chanceCreationPassingClass, ta.chanceCreationDribblingClass, ta.chanceCreationPositioningClass, ta.defencePressureClass, ta.defenceAggressionClass, ta.defenceTeamWidthClass, ta.defenceDefenderLineClass FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id JOIN Team t ON p.player_api_id = t.team_api_id JOIN Team_Attributes ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE t.team_long_name = 'Hannover 96' AND pa.date = '2015-09-10 00:00:00';	european_football_2
SELECT AVG(pa.overall_rating) FROM Player_Attributes pa WHERE LOWER(pa.player_name) ='marko arnautovic' AND pa.date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00';	european_football_2
SELECT (pa1.overall_rating - pa2.overall_rating) / NULLIF(pa1.overall_rating, 0) * 100 AS percentage FROM Player_Attributes pa1 JOIN Player pa ON pa1.player_fifa_api_id = pa.player_fifa_api_id JOIN Player_Attributes pa2 ON pa.player_api_id = pa2.player_api_id WHERE pa.player_name = 'Landon Donovan' AND pa2.player_name = 'Jordan Bowery' AND pa1.date = '2013-07-12';	european_football_2
SELECT p.player_name FROM Player p WHERE p.height = (SELECT MAX(p2.height) FROM Player p2);	european_football_2
SELECT p.player_api_id FROM Player p ORDER BY p.weight DESC LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p WHERE datetime(CURRENT_TIMESTAMP,'localtime') - datetime(p.birthday) > 34;	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Match m JOIN Player p ON m.home_player_1 = p.player_api_id OR m.home_player_2 = p.player_api_id OR m.home_player_3 = p.player_api_id OR m.home_player_4 = p.player_api_id OR m.home_player_5 = p.player_api_id OR m.home_player_6 = p.player_api_id OR m.home_player_7 = p.player_api_id OR m.home_player_8 = p.player_api_id OR m.home_player_9 = p.player_api_id OR m.home_player_10 = p.player_api_id OR m.home_player_11 = p.player_api_id WHERE p.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(M.away_team_goal) AS total_away_goals FROM Match M JOIN Player P ON M.away_player_1 = P.player_api_id OR M.away_player_2 = P.player_api_id OR M.away_player_3 = P.player_api_id OR M.away_player_4 = P.player_api_id OR M.away_player_5 = P.player_api_id OR M.away_player_6 = P.player_api_id OR M.away_player_7 = P.player_api_id OR M.away_player_8 = P.player_api_id OR M.away_player_9 = P.player_api_id OR M.away_player_10 = P.player_api_id OR M.away_player_11 = P.player_api_id WHERE P.player_name = 'Daan Smith' OR P.player_name = 'Filipe Ferreira';	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Match m JOIN Player p ON m.home_player_1 = p.player_api_id OR m.home_player_2 = p.player_api_id OR m.home_player_3 = p.player_api_id OR m.home_player_4 = p.player_api_id OR m.home_player_5 = p.player_api_id OR m.home_player_6 = p.player_api_id OR m.home_player_7 = p.player_api_id OR m.home_player_8 = p.player_api_id OR m.home_player_9 = p.player_api_id OR m.home_player_10 = p.player_api_id OR m.home_player_11 = p.player_api_id WHERE (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM CAST(birthday AS DATE)) < 31) AND (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM CAST(birthday AS DATE))) <= 30;	european_football_2
SELECT p.player_name, MAX(pa.overall_rating) AS overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_name ORDER BY overall_rating DESC LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.date = (SELECT MAX(pa.date) FROM Player_Attributes pa) ORDER BY pa.potential DESC NULLS LAST LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.attacking_work_rate = 'high';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY (MAX(EXTRACT(epoch FROM (CURRENT_TIMESTAMP - p.birthday))/86400)) DESC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Country c ON p.player_api_id = c.id WHERE c.name = 'Belgium';	european_football_2
SELECT p.player_name, c.name AS country_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Country c ON p.birthday LIKE '%' || c.name || '%' WHERE pa.vision > 89;	european_football_2
SELECT p.country_id, MAX(AVG(p.weight)) AS avg_weight FROM Player p GROUP BY p.country_id ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT t.team_long_name FROM Team_Attributes ta JOIN Team t ON ta.team_fifa_api_id = t.team_fifa_api_id WHERE ta.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(p.height) FROM Player p JOIN Team t ON p.player_api_id = t.team_api_id JOIN Match m ON t.team_api_id = m.home_team_api_id OR t.team_api_id = m.away_team_api_id JOIN League l ON m.league_id = l.id JOIN Country c ON l.country_id = c.id WHERE LOWER(c.name) = 'italy';	european_football_2
SELECT p.player_name FROM Player p WHERE p.height > 180 ORDER BY p.player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player p WHERE p.player_name LIKE 'Aaron%' AND p.birthday > '1990';	european_football_2
SELECT (SELECT jumping FROM Player_Attributes WHERE id = 6) - (SELECT jumping FROM Player_Attributes WHERE id = 23) AS difference_in_jumping_scores;	european_football_2
SELECT p.player_api_id FROM Player_Attributes p WHERE p.preferred_foot = 'right' ORDER BY p.potential ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa WHERE pa.crossing = (SELECT MAX(pa2.crossing) FROM Player_Attributes pa2) AND pa.preferred_foot = 'left';	european_football_2
SELECT CAST(COUNT(*) FILTER (WHERE t.stamina > 80 AND t.strength > 80) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM Player_Attributes t;	european_football_2
SELECT l.name AS league_name, c.name AS country_name FROM League l JOIN Country c ON l.country_id = c.id WHERE l.name = 'Ekstraklasa' AND c.name = 'Poland';	european_football_2
SELECT m.home_team_goal AS home_score, m.away_team_goal AS away_score FROM Match m WHERE m.date LIKE '%2008-09-24%';	european_football_2
SELECT p.sprint_speed, p.agility, p.acceleration FROM Player_Attributes p JOIN Player pl ON p.player_api_id = pl.player_api_id WHERE pl.player_name = 'Alexis Blin';	european_football_2
SELECT t.buildUpPlaySpeedClass FROM Team t WHERE t.team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*) FROM Match m WHERE m.league_id IN (SELECT id FROM League WHERE name = 'Italian Serie A') AND m.season = '2015/2016';	european_football_2
SELECT MAX(m.home_team_goal) AS highest_score FROM Match m JOIN Team t ON m.home_team_api_id = t.team_api_id WHERE LOWER(t.team_long_name) = 'netherlands eredivisie';	european_football_2
SELECT p.player_api_id, p.player_name, pa.finishing, pa.curve FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.weight = (SELECT MAX(weight) FROM Player);	european_football_2
SELECT t.team_long_name, COUNT(m.id) AS game_count FROM Match m JOIN Team t ON m.home_team_api_id = t.team_api_id OR m.away_team_api_id = t.team_api_id WHERE m.season = '2015/2016' GROUP BY t.team_long_name ORDER BY game_count DESC LIMIT 1;	european_football_2
SELECT t.team_long_name FROM Team t JOIN Match m ON t.team_api_id = m.away_team_api_id WHERE m.away_team_goal = (SELECT MAX(m2.away_team_goal) FROM Match m2);	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.date = (SELECT MAX(pa2.date) FROM Player_Attributes pa2);	european_football_2
SELECT DIVIDE(COUNT(CASE WHEN p.height < 180 AND pa.overall_rating > 70 THEN 1 END), COUNT(pa.id)) * 100 AS percentage FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id;	european_football_2
SELECT (COUNT(CASE WHEN p.SEX = 'M' AND p.Admission = '+' THEN 1 END) - COUNT(CASE WHEN p.SEX = 'M' AND p.Admission = '-' THEN 1 END))::FLOAT / NULLIF(COUNT(CASE WHEN p.SEX = 'M' AND p.Admission = '+' THEN 1 END), 0) * 100 AS percentage FROM Patient p;	thrombosis_prediction
SELECT DIVIDE(COUNT(CASE WHEN YEAR(P.Birthday) > 1930 AND P.SEX = 'F' THEN E.ID END), COUNT(CASE WHEN P.SEX = 'F' THEN E.ID END)) AS proportion FROM Examination E JOIN Patient P ON E.ID = P.ID;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN p.Admission = '+' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS proportion FROM Patient p WHERE EXTRACT(YEAR FROM p.Birthday) BETWEEN 1930 AND 1940;	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN Admission = '+' THEN ID ELSE NULL END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN Admission = '-' THEN ID ELSE NULL END), 0) AS ratio FROM Patient WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT p.Diagnosis, l.Date FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.ID = 30609;	thrombosis_prediction
SELECT p.SEX, p.Birthday, e.`Examination Date`, e.Symptoms FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 163109;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 500;	thrombosis_prediction
SELECT e.ID, age() - age(P.Birthday) AS age FROM Examination e JOIN Patient P ON e.ID = P.ID WHERE e.RVVT = '+';	thrombosis_prediction
SELECT p.ID, p.SEX, e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 2;	thrombosis_prediction
SELECT p.id FROM Patient p JOIN Laboratory l ON p.id = l.id WHERE EXTRACT(YEAR FROM p.birthday) = 1937 AND l.t_cho > 250;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT (COUNT(CASE WHEN P.SEX = 'F' AND L.TP < '6.0' OR L.TP > '8.5' THEN 1 END) * 1.0 / NULLIF(COUNT(*), 0)) * 100 AS percentage FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID;	thrombosis_prediction
SELECT AVG(e.aCL IgG) AS average_aCL_IgG FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Description = '+' AND EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.Birthday)) >= 50;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND EXTRACT(YEAR FROM p.Description) = 1997 AND p.Admission = '-';	thrombosis_prediction
SELECT MIN(age) FROM (SELECT SUBTRACT(YEAR(birthday), YEAR(`first date`)) AS age FROM Patient) AS subquery;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = '1' AND p.SEX = 'F' AND EXTRACT(YEAR FROM e.`Examination Date`) = 1997;	thrombosis_prediction
SELECT MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS age_gap FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200;	thrombosis_prediction
SELECT e.Symptoms, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient);	thrombosis_prediction
SELECT DIVIDE(COUNT(DISTINCT l.ID), 12) AS avg_patients_per_month FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.SEX = 'M' AND l.Date BETWEEN '1998-01-01' AND '1998-12-31';	thrombosis_prediction
SELECT MAX(l.Date), (EXTRACT(YEAR FROM p.First Date) - EXTRACT(YEAR FROM p.Birthday)) AS age_at_admission FROM Laboratory l JOIN Patient p ON l.ID = p.ID JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis ilike '%SJS%' GROUP BY p.ID;	thrombosis_prediction
SELECT DIVIDE(SUM(CASE WHEN L.UA <= 8.0 AND P.SEX = 'M' THEN 1 ELSE 0 END), SUM(CASE WHEN L.UA <= 6.5 AND P.SEX = 'F' THEN 1 ELSE 0 END)) AS RATIO FROM Laboratory L JOIN Patient P ON L.ID = P.ID;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.ID IN (SELECT ID FROM Patient WHERE `First Date` IS NOT NULL) AND (EXTRACT(YEAR FROM e.`Examination Date`) - EXTRACT(YEAR FROM p.`First Date`)) >= 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE EXTRACT(YEAR FROM p.Birthday) < 18 AND e.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.`T-BIL` > 2.0;	thrombosis_prediction
SELECT MAX(COUNT(Diagnosis)) AS Most_Common_Illness FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, Birthday))) AS average_age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`Examination Date` BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
SELECT EXTRACT(YEAR FROM AGE(birthday, EXAMINATION_DATE)) AS age, diagnosis FROM EXAMINATION e JOIN PATIENT p ON e.ID = p.ID WHERE HGB = (SELECT MAX(HGB) FROM EXAMINATION);	thrombosis_prediction
SELECT e.`aCL IgG` FROM Examination e WHERE e.ID = 3605340 AND e.`Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT (SELECT T.T-CHO FROM Laboratory T WHERE T.ID = 2927464 AND T.Date = '1995-09-04') < 250 AS IsTotalCholesterolNormal;	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE LOWER(e.Diagnosis) = 'aortitis' ORDER BY p.ID ASC LIMIT 1;	thrombosis_prediction
SELECT e.aCL_IgM FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Description = '1994-02-19' AND e.`Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date = '1992-06-12' AND l.GPT = 9;	thrombosis_prediction
SELECT age() - age(Birthday) AS age_at_test FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE UA = '8.4' AND Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(l.ID) AS total_labs FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.`First Date` = '1991-06-13' AND EXTRACT(YEAR FROM l.Date) = 1995 AND p.Diagnosis LIKE '%SJS%';	thrombosis_prediction
SELECT p.Description FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`Examination Date` = '1997-01-27' AND p.`First Date` = (SELECT MIN(p2.`First Date`) FROM Patient p2 WHERE p2.ID = p.ID);	thrombosis_prediction
SELECT e.Symptoms FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday = '1959-03-01' AND e.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT (SUM(CASE WHEN l.Date LIKE '1981-11-%' THEN l.`T-CHO` ELSE 0 END) - SUM(CASE WHEN l.Date LIKE '1981-12-%' THEN l.`T-CHO` ELSE 0 END)) AS decrease_rate FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.Birthday = '1959-02-18';	thrombosis_prediction
SELECT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Diagnosis ilike '%Behcet%' AND YEAR(p.`First Date`) >= 1997 AND YEAR(p.`First Date`) < 1998 ORDER BY e.ID NULLS LAST;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND l.GPT > 30 AND l.ALB < 4;	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE p.SEX = 'F' AND YEAR(p.Birthday) = 1964 AND p.Admission = '+' ORDER BY p.ID;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.Thrombosis = 2 AND e.ANA = 'S' AND e.`aCL IgM` > (AVG(e.`aCL IgM`) * 1.2);	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN UA <= 6.5 AND (`U-PRO` > 0 AND `U-PRO` < 30) THEN ID END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN (`U-PRO` > 0 AND `U-PRO` < 30) THEN ID END), 0) * 100 AS percentage FROM Laboratory;	thrombosis_prediction
SELECT DIVIDE(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END), COUNT(*), 100) AS percentage FROM Patient WHERE SEX = 'M' AND YEAR(First Date) = 1981;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date LIKE '1991-10%' AND p.Admission = '-' AND l.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p WHERE p.SEX = 'F' AND p.BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31' AND p.`ANA Pattern`!= 'P';	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'PSS' AND l.CRP > 2 AND l.CRE = 1 AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(L.ALB) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.PLT > 400 AND P.SEX = 'F' AND P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT MAX(e.Symptoms) AS Most_Common_Symptom FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE LOWER(p.Diagnosis) ='sle';	thrombosis_prediction
SELECT p.`First Date`, p.Diagnosis FROM Patient p WHERE p.ID = 48473;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND e.Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE YEAR(e.`Examination Date`) = '1997' AND (e.TP < 6 OR e.TP > 8.5);	thrombosis_prediction
SELECT (SUM(CASE WHEN e.Thrombosis > 0 AND p.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) * 100.0 / NULLIF(SUM(CASE WHEN p.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END), 0)) AS proportion FROM Patient p JOIN Examination e ON p.ID = e.ID;	thrombosis_prediction
SELECT DIVIDE(COUNT(CASE WHEN P.SEX = 'F' THEN 1 END), COUNT(P.SEX)) * 100 AS percentage FROM Patient P WHERE YEAR(P.BIRTHDAY) = '1980' AND P.Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND e.Diagnosis = 'BEHCET' AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(e.`Examination Date`, p.`First Date`) AS days_to_examination FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 821298;	thrombosis_prediction
SELECT l.UA FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.ID = 57266 AND (l.UA > 8.0 AND p.SEX = 'M' OR l.UA > 6.5 AND p.SEX = 'F');	thrombosis_prediction
SELECT l.date, l.got FROM laboratory l JOIN patient p ON l.id = p.id WHERE l.id = 48473 AND l.got >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ID IN (SELECT ID FROM Laboratory WHERE Date BETWEEN '1994-01-01' AND '1994-12-31') AND l.GOT < 60;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GPT >= 60;	thrombosis_prediction
SELECT p.Diagnosis, MAX(p.Birthday) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 60 GROUP BY p.Diagnosis, p.Birthday ORDER BY p.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) AS average_ldh FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT p.ID, age() - age(p.Birthday) AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT e.ID, p.Description FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.ID IN (SELECT ID FROM Laboratory WHERE ALP < 300);	thrombosis_prediction
SELECT p.ID, l.ALB FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01' AND l.ALB < 300;	thrombosis_prediction
SELECT p.ID, p.SEX, p.`Birthday` FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT p.ID, (l.TP - 8.5) AS deviation FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.TP > 8.5;	thrombosis_prediction
SELECT p.id, p.birthday FROM Patient p JOIN Laboratory l ON p.id = l.id WHERE p.sex = 'M' AND (l.alb <= 3.5 OR l.alb >= 5.5) ORDER BY p.birthday DESC;	thrombosis_prediction
SELECT p.ID, p.Description FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE Year(p.Birthday) = '1982' AND (l.ALB BETWEEN 3.5 AND 5.5);	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN l.UA > 8.0 AND p.SEX = 'M' OR l.UA > 6.5 AND p.SEX = 'F' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.SEX = 'F';	thrombosis_prediction
SELECT AVG(l.UA) FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.UA < 8.0 AND (p.SEX = 'M' OR (l.UA < 6.5 AND p.SEX = 'F'));	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'RA' AND l.UN < 30;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.CRE >= 1.5;	thrombosis_prediction
SELECT CASE WHEN SUM(CASE WHEN P.SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END) THEN 'True' ELSE 'False' END AS answer FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRE >= 1.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.T_BIL = (SELECT MAX(l2.T_BIL) FROM Laboratory l2);	thrombosis_prediction
SELECT p.SEX, COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.T_BIL >= 2.0 GROUP BY p.SEX;	thrombosis_prediction
SELECT p.ID, MAX(l.T-CHO) AS t_cho FROM Patient p JOIN Laboratory l ON p.ID = l.ID GROUP BY p.ID ORDER BY p.Birthday ASC, t_cho DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(DIVIDE(SUM(SUBTRACT(YEAR(NOW()), YEAR(birthday))), COUNT(ID))) AS average_age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.`T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.Description, l.Date, l.TG FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG > 300;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l WHERE l.TG >= 200 AND EXTRACT(YEAR FROM age(CURRENT_DATE, l.ID::DATE)) > 50;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND p.Birthday BETWEEN '1936-01-01' AND '1956-12-31' AND l.CPK >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU >= 180 AND l.`T-CHO` < 250;	thrombosis_prediction
SELECT p.ID, l.GLU FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Description >= '1991' AND l.GLU < 180;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, date('now') - p.Birthday AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.WBC <= 3.5 OR l.WBC >= 9.0 GROUP BY p.SEX, p.Birthday ORDER BY age ASC;	thrombosis_prediction
SELECT p.ID, EXTRACT(YEAR FROM age(now(), p.Birthday)) AS age, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RBC < 3.5 ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, l.RBC, p.`First Date`, p.Admission FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND (EXTRACT(YEAR FROM age(CURRENT_DATE, p.Birthday)) >= 50) AND ((l.RBC <= 3.5 OR l.RBC >= 6.0)) AND p.`First Date` IS NOT NULL AND p.Admission IN ('+', '-');	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.HGB < 10;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND p.Birthday = (SELECT MIN(Birthday) FROM Patient p2 JOIN Examination e2 ON p2.ID = e2.ID WHERE e2.Diagnosis = 'SLE' AND 10 < (SELECT HGB FROM Laboratory l WHERE l.ID = e2.ID AND l.Date = e2.`Examination Date`) AND (SELECT HGB FROM Laboratory l WHERE l.ID = e2.ID AND l.Date = e2.`Examination Date`) < 17);	thrombosis_prediction
SELECT p.ID, age FROM Patient p JOIN (SELECT l.ID, COUNT(l.ID) AS num_lab FROM Laboratory l WHERE l.HCT >= 52 GROUP BY l.ID HAVING COUNT(l.ID) > 2) AS lab ON p.ID = lab.ID ORDER BY p.ID;	thrombosis_prediction
SELECT AVG(L.HCT) FROM Laboratory L WHERE L.Date LIKE '1991%' AND L.HCT < 29;	thrombosis_prediction
SELECT (SELECT COUNT(*) FROM Laboratory WHERE PLT < 100) - (SELECT COUNT(*) FROM Laboratory WHERE PLT > 400);	thrombosis_prediction
SELECT p.ID, p.DESCRIPTION FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date LIKE '1984%' AND (EXTRACT(YEAR FROM age(now(), p.BIRTHDAY))) < 50 AND l.PLT BETWEEN 100 AND 400 ORDER BY p.DESCRIPTION NULLS LAST;	thrombosis_prediction
SELECT MULTIPLY(DIVIDE(SUM(CASE WHEN L.PT >= 14 AND P.SEX = 'F' THEN 1 ELSE 0 END), SUM(CASE WHEN L.PT >= 14 THEN 1 ELSE 0 END)), 1.0) AS percentage FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(P.Birthday)) > 55;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.`First Date` > '1992-01-01' AND l.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.`Examination Date` > '1997-01-01' AND e.APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis = 3 AND l.APTT > 45;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.WBC BETWEEN 3.5 AND 9.0 AND (l.FG <= 150 OR l.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday > '1980-01-01' AND (l.FG < 150 OR l.FG > 450);	thrombosis_prediction
SELECT DISTINCT e.Diagnosis FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.`U-PRO` >= 30;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.ID IN (SELECT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE Diagnosis = 'SLE') AND l.`U-PRO` BETWEEN 0 AND 30;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.IGG < 900 AND e.Symptoms = 'abortion';	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.IGG BETWEEN 900 AND 2000 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`aCL IgA` = (SELECT MAX(e2.`aCL IgA`) FROM Examination e2 WHERE e2.`aCL IgA` BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`aCL IgA` BETWEEN 80 AND 500 AND YEAR(p.`First Date`) >= 1990;	thrombosis_prediction
SELECT p.Diagnosis, COUNT(*) AS COUNT FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.IGM NOT BETWEEN 40 AND 400 GROUP BY p.Diagnosis ORDER BY COUNT DESC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l WHERE l.CRP IS NULL AND (l.CRP LIKE '+' OR l.CRP LIKE '-' OR l.CRP < 1.0);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRP NOT IN ('+-', '-') AND l.CRP >= 1.0 AND (YEAR(CURRENT_DATE()) - YEAR(p.Birthday)) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.RA IN ('-', '+-') AND e.KCT = '+';	thrombosis_prediction
SELECT e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE YEAR(p.Birthday) >= 1995 AND e.RA IN ('-', '+-');	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RF < 20 AND (YEAR(CURRENT_DATE()) - YEAR(p.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.RF < 20 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.C3 > 35 AND e.ANA Pattern = 'P';	thrombosis_prediction
SELECT e.ID FROM Examination e WHERE e.`aCL IgA` = (SELECT MAX(e2.`aCL IgA`) FROM Examination e2 WHERE e2.`aCL IgA` IS NOT NULL AND (e2.`aCL IgA` < 29 OR e2.`aCL IgA` > 52));	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis = 1 AND l.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE LOWER(e.RNP) IN ('-', '+-') AND LOWER(p.Admission) = '+';	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RNP NOT IN('-','+') ORDER BY p.Birthday ASC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.Symptoms = 'SM' AND e.Thrombosis = 1;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SM NOT IN ('-', '+-') ORDER BY p.Birthday ASC NULLS LAST LIMIT 3;	thrombosis_prediction
SELECT e.ID FROM Examination e WHERE e.`Examination Date` >= '1997-01-01' AND e.Symptoms IN ('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.SSb = '-' AND p.SEX = 'M' AND e.SYMPTOMS ='vertigo';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SSA IN ('-','+-') AND YEAR(p.`First Date`) < 1990;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SSA NOT IN ('-', '+-') ORDER BY p.`First Date` ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.SSB IN ('-', '+-') AND e.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.SSB IN ('-', '+-') AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.CENTROMEA IN ('-', '+-') AND p.SEX = 'M';	thrombosis_prediction
SELECT p.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.`DNA-II` < 8 AND e.Description IS NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.`DNA-II` >= 8 AND e.`Admission` = '+';	thrombosis_prediction
SELECT (COUNT(DISTINCT e.ID) / NULLIF(COUNT(DISTINCT l.ID), 0)) * 100 AS percentage FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.GOT >= 60 AND l.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GOT < 60;	thrombosis_prediction
SELECT MAX(P.Birthday) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT >= 60;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 60 ORDER BY l.GPT DESC NULLS LAST LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.GOT < 60 AND p.SEX = 'M';	thrombosis_prediction
SELECT MIN(p.`First Date`) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH < 500 ORDER BY MIN(p.`First Date`) DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(p."First Date") FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH >= 500;	thrombosis_prediction
SELECT COUNT(*) AS patients_with_abnormal_alp FROM Laboratory l WHERE l.ID IN (SELECT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Description ilike '%+%' AND l.ALPH >= 300);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Admission = '-';	thrombosis_prediction
SELECT e.Diagnosis FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.ID IN (SELECT ID FROM Examination WHERE Diagnosis = 'SJS') AND l.TP > 6.0 AND l.TP < 8.5;	thrombosis_prediction
SELECT e."Examination Date" FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.ALB > 3.5 AND l.ALB < 5.5 ORDER BY l.ALB DESC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT e.aCL_IgG, e.aCL_IgM, e.aCL_IgA FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID WHERE p.SEX = 'F' AND l.UA > 6.50 ORDER BY l.UA DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(e.ANA) AS highest_ana FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.CRE < 1.5;	thrombosis_prediction
SELECT e.ID FROM Examination e WHERE e.CRE < 1.5 ORDER BY e.aCL IgA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.ID = e.ID AND l.`T-BIL` >= 2.0 AND e.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT MAX(e.`aCL IgG`) AS highest_ana_concentration FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.`T-CHO` >= 250 AND l.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS number_of_patients FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.`T-CHO` < 250 AND e.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.TG < 200 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.TG < 200 ORDER BY l.TG DESC LIMIT 1;	thrombosis_prediction
SELECT e.ID FROM Examination e WHERE e.Thrombosis = 0 AND e.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.CPK < 250 AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+');	thrombosis_prediction
SELECT MIN(P.Birthday) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU > 180;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.GLU < 180 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT e.ID FROM Examination e WHERE e.RBC <= 3.5 OR e.RBC >= 6.0 AND e.Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.PLT > 100 AND e.PLT < 400 AND p.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT pl.IGG FROM Laboratory pl JOIN Examination ex ON pl.ID = ex.ID WHERE pl.PLT > 100 AND pl.PLT < 400 AND ex.Diagnosis = 'MCTD';	thrombosis_prediction
SELECT AVG(L.PT) AS average_prothrombin_time FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'M' AND L.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.Thrombosis IN (1, 2) AND e.PT < 14;	thrombosis_prediction
SELECT m.major_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.last_name = 'Sanders' AND m.first_name = 'Angela';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.department) ='student_club' AND LOWER(mjr.college) = 'engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.department = 'Art and Design' ORDER BY m.first_name NULLS LAST, m.last_name NULLS LAST;	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name ilike '%Women''s Soccer%';	student_club
SELECT COUNT(*) FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.t_shirt_size = 'Medium' AND e.event_name = 'Women''s Soccer';	student_club
SELECT e.event_id, COUNT(a.link_to_event) AS attendance_count FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.link_to_major IN (SELECT major_id FROM major WHERE department = 'Student_Club') GROUP BY e.event_id ORDER BY attendance_count DESC LIMIT 1;	student_club
SELECT m.college FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.position = 'Vice President' AND e.event_name = 'Officers meeting - January';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.last_name = 'Mclean' AND m.first_name = 'Maya';	student_club
SELECT COUNT(*) AS number_of_events FROM attendance a JOIN event e ON a.link_to_event = e.event_id JOIN member m ON a.link_to_member = m.member_id WHERE LOWER(m.first_name) ='sacha' AND LOWER(m.last_name) = 'harrison' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(*) AS number_of_meetings FROM event e JOIN "attendance" a ON e.event_id = a.link_to_event WHERE a.link_to_event IN (SELECT link_to_event FROM "attendance" GROUP BY link_to_event HAVING COUNT(link_to_event) > 10) AND e.type = 'Meeting';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event GROUP BY e.event_name HAVING COUNT(a.link_to_event) > 20;	student_club
SELECT AVG(DIVIDE(COUNT(event_id), COUNT(DISTINCT event_name))) AS average_attendance FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT e.event_id, e.event_name, MAX(e.cost) AS max_cost FROM event e JOIN "expense" ex ON e.event_id = ex.link_to_event GROUP BY e.event_id, e.event_name ORDER BY max_cost DESC NULLS LAST LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.major_name) = 'environmental engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE LOWER(ma.major_name) = 'law and constitutional studies';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.last_name = 'Ramsey' AND m.first_name = 'Sherri';	student_club
SELECT m.college FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE m.last_name = 'Hewitt' AND first_name = 'Tyler';	student_club
SELECT SUM(b.amount) AS total_funds FROM budget b JOIN event e ON b.link_to_event = e.event_id JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Food' AND e.event_name = 'September Meeting';	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'IL';	student_club
SELECT SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement' AND e.event_name = 'September Meeting';	student_club
SELECT m.department FROM major m JOIN member m2 ON m.major_id = m2.link_to_major WHERE m2.first_name = 'Pierce' AND m2.last_name = 'Guidi';	student_club
SELECT SUM(b.amount) FROM budget b WHERE b.link_to_event IN (SELECT e.event_id FROM event e WHERE e.event_name = 'October Speaker');	student_club
SELECT e.expense_description, e.approved FROM expense e JOIN event ev ON e.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08';	student_club
SELECT SUM(e.cost) AS total_cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name ILIKE '%Elijah Allen%' AND MONTH(e.expense_date) IN (9, 10);	student_club
WITH total_2019 AS (SELECT SUM(spent) AS total_spent_2019 FROM budget WHERE YEAR(event_status) = 2019), total_2020 AS (SELECT SUM(spent) AS total_spent_2020 FROM budget WHERE YEAR(event_status) = 2020) SELECT (total_spent_2020 - total_spent_2019) AS difference_in_spending FROM total_2019, total_2020;	student_club
SELECT e.location FROM event e WHERE e.event_name = 'Spring Budget Review';	student_club
SELECT SUM(e.cost) AS total_cost FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE e.event_name LIKE '%Poster%' AND e.event_date = '2019-09-04';	student_club
SELECT b.remaining FROM budget b WHERE b.category = 'Food' ORDER BY b.amount DESC LIMIT 1;	student_club
SELECT i.notes FROM income i WHERE i.source = 'Fundraising' AND i.date_received = '2019-09-14';	student_club
SELECT COUNT(DISTINCT m.major_id) FROM major m WHERE LOWER(m.department) = 'humanities and social sciences';	student_club
SELECT m.phone FROM member m WHERE m.first_name = 'Carlo' AND m.last_name = 'Jacobs';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name ||'' || m.last_name = 'Adela O''Gallagher';	student_club
SELECT COUNT(*) FROM budget b WHERE b.link_to_event IN (SELECT event_id FROM event WHERE event_name = 'November Meeting') AND b.remaining < 0;	student_club
SELECT SUM(b.amount) FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'September Speaker';	student_club
SELECT e.event_status FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-08-20';	student_club
SELECT m.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.member_id ='member_1234567890';	student_club
SELECT COUNT(*) FROM member m WHERE m.t_shirt_size = 'Large' AND m.link_to_major = (SELECT major_id FROM major WHERE major_name = 'Human Development and Family Studies');	student_club
SELECT z.type FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.last_name = 'Nielson' AND m.first_name = 'Christof';	student_club
SELECT m.major_name FROM member m JOIN member_position mp ON m.member_id = mp.member_id WHERE mp.position = 'Vice President';	student_club
SELECT z.short_state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name ||'' || m.last_name = 'Sacha Harrison';	student_club
SELECT m.department FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'President';	student_club
SELECT i.date_received FROM income i WHERE i.link_to_member ='member_id' AND i.source = 'Dues';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1;	student_club
SELECT DIVIDE(SUM(b.amount WHERE b.category = 'Advertisement' AND b.link_to_event ='rec0akZnLLpGUloLH'), SUM(b.amount WHERE b.category = 'Advertisement' AND b.link_to_event ='rec0Si5cQ4rJRVzd6')) AS ratio FROM budget b;	student_club
SELECT (SUM(CASE WHEN b.category = 'Parking' AND e.event_name = 'November Speaker' THEN b.amount ELSE 0 END) / NULLIF((SELECT COUNT(*) FROM budget b WHERE b.event_status = 'November Speaker'), 0)) * 100 AS percentage FROM budget b JOIN event e ON b.link_to_event = e.event_id;	student_club
SELECT SUM(e.cost) AS total_cost_of_pizzas FROM expense e WHERE e.expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE LOWER(state) = 'va' AND LOWER(county) = 'orange';	student_club
SELECT m.department FROM major m WHERE m.college = 'College of Humanities and Social Sciences';	student_club
SELECT m.city, m.county, m.state FROM member m WHERE m.last_name = 'Firth' AND m.first_name = 'Amy';	student_club
SELECT e.expense_description FROM budget b JOIN expense e ON b.link_to_event = e.link_to_budget WHERE b.remaining = (SELECT MIN(b2.remaining) FROM budget b2);	student_club
SELECT m.member_id, m.first_name, m.last_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.event_name = 'October Meeting';	student_club
SELECT m.college, COUNT(*) AS member_count FROM member m GROUP BY m.college ORDER BY member_count DESC NULLS LAST LIMIT 1;	student_club
SELECT m.major_name FROM member m WHERE m.phone = '809-555-3360';	student_club
SELECT e.event_name, MAX(b.amount) AS highest_budget FROM event e JOIN budget b ON e.event_id = b.link_to_event GROUP BY e.event_name ORDER BY highest_budget DESC LIMIT 1;	student_club
SELECT e.expense_id, e.expense_description, e.cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT i.date_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name = 'Casey' AND m.last_name = 'Mason';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m WHERE m.zip IN (SELECT zip_code FROM zip_code WHERE LOWER(state) ='md');	student_club
SELECT COUNT(*) AS attended_events FROM member m JOIN attendance a ON m.member_id = a.link_to_member WHERE m.phone = '954-555-6240';	student_club
SELECT m.first_name ||'' || m.last_name AS full_name FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT b.link_to_event, b.spent / NULLIF(b.amount, 0) AS ratio FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.status = 'Closed' ORDER BY ratio DESC NULLS LAST LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m WHERE LOWER(m.position) = 'president';	student_club
SELECT MAX(b.spent) AS highest_spent FROM budget b;	student_club
SELECT COUNT(*) FROM event e WHERE e.type = 'Meeting' AND YEAR(e.event_date) = 2020;	student_club
SELECT SUM(b.spent) AS total_spent FROM budget b WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.first_name, m.last_name HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.member_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Interior Design') AND e.event_name = 'Community Theater';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Georgetown' AND z.state = 'South Carolina';	student_club
SELECT SUM(i.amount) AS total_income FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.last_name = 'Gilmour' AND m.first_name = 'Grant';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost) AS total_expense FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE e.event_name ilike '%Yearly Kickoff%';	student_club
SELECT m.member_id FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name, i.source, MAX(i.amount) AS max_income FROM income i JOIN member m ON i.link_to_member = m.member_id GROUP BY m.first_name, m.last_name, i.source ORDER BY max_income DESC LIMIT 1;	student_club
SELECT e.event_id, e.event_name, MIN(e.cost) AS min_cost FROM event e JOIN expense ex ON e.event_id = ex.link_to_event GROUP BY e.event_id, e.event_name ORDER BY min_cost ASC LIMIT 1;	student_club
SELECT (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.cost ELSE 0 END) * 100.0 / NULLIF(SUM(b.cost), 0)) AS percentage FROM expense b JOIN event e ON b.link_to_event = e.event_id;	student_club
SELECT SUM(CASE WHEN m.major_name = 'Finance' THEN 1 ELSE 0 END)::FLOAT / NULLIF(SUM(CASE WHEN m.major_name = 'Physics' THEN 1 ELSE 0 END), 0) AS ratio FROM major m;	student_club
SELECT MAX(source) AS top_source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY top_source DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, m.email FROM member m WHERE m.position = 'Secretary' AND m.link_to_major IN (SELECT major_id FROM major WHERE department = 'Student Club');	student_club
SELECT COUNT(*) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.major_name) = 'physics teaching';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.event_name = 'Community Theater' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(*) AS attended_events, m.major_name FROM "attendance" a JOIN member m ON a.link_to_member = m.member_id WHERE m.last_name = 'Guidi' AND m.first_name = 'Luisa' GROUP BY m.major_name;	student_club
SELECT DIVIDE(SUM(b.spent), COUNT(b.spent)) AS average_spent_per_event FROM budget b WHERE b.event_status = 'Closed' AND b.category = 'Food';	student_club
SELECT e.event_name, MAX(b.spent) AS max_spent FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Advertisement' GROUP BY e.event_name ORDER BY max_spent DESC LIMIT 1;	student_club
SELECT m.member_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT DIVIDE(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END), COUNT(event_id)) * 100 AS percentage FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT SUM(e.cost) AS total_cost FROM event e JOIN "expense" ex ON e.event_id = ex.link_to_event WHERE e.event_name = 'September Speaker' AND ex.expense_description = 'Posters';	student_club
SELECT t_shirt_size, COUNT(*) AS COUNT FROM member GROUP BY t_shirt_size ORDER BY COUNT DESC LIMIT 1;	student_club
SELECT e.event_name, MIN(b.remaining) AS min_remaining FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 GROUP BY e.event_name ORDER BY min_remaining DESC LIMIT 1;	student_club
SELECT e.event_name, SUM(e.cost) AS total_cost FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE e.event_name ilike '%October Meeting%' GROUP BY e.event_name;	student_club
SELECT b.category, b.amount FROM budget b WHERE b.link_to_event IN (SELECT e.event_id FROM event e WHERE e.event_name = 'April Speaker') ORDER BY b.amount ASC;	student_club
SELECT MAX(b.amount) FROM budget b WHERE b.category = 'Food';	student_club
SELECT b.link_to_event, SUM(b.amount) AS total_amount FROM budget b WHERE b.category = 'Advertisement' GROUP BY b.link_to_event ORDER BY total_amount DESC NULLS LAST LIMIT 3;	student_club
SELECT SUM(e.cost) FROM expense e WHERE e.expense_description = 'Parking';	student_club
SELECT SUM(e.cost) FROM expense e WHERE e.expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id ='rec4BLdZHS2Blfp4v' GROUP BY m.first_name, m.last_name;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.last_name = 'Harrison' AND m.first_name = 'Sacha';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT z.city FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT m.major_name FROM member m JOIN major m2 ON m.link_to_major = m2.major_id WHERE m.last_name = 'Cullen' AND m.first_name = 'Phillip';	student_club
SELECT m.position FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.major_name) = 'business';	student_club
SELECT COUNT(*) FROM member m WHERE m.t_shirt_size = 'Medium' AND m.link_to_major = (SELECT major_id FROM major WHERE major_name = 'Business');	student_club
SELECT e.event_name, b.event_status, b.remaining FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215';	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_date = '2020-03-24T12:00:00';	student_club
SELECT m.major_name FROM member m JOIN "attendance" a ON m.member_id = a.link_to_member WHERE m.position = 'Vice President';	student_club
SELECT DIVIDE(SUM(CASE WHEN position = 'Member' AND link_to_major ='major1' THEN 1 ELSE 0 END), COUNT(member_id)) * 100 AS percentage FROM member;	student_club
SELECT e.event_name, b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215';	student_club
SELECT COUNT(*) FROM income i WHERE i.amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(DISTINCT m.major_id) FROM major m WHERE LOWER(m.department) ='school of applied sciences, technology and education' AND LOWER(m.college) = 'college of agriculture and applied sciences';	student_club
SELECT m.last_name, m.department, m.college FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215' AND b.spent = 0 AND e.type = 'Guest Speaker';	student_club
SELECT m.city, m.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Electrical and Computer Engineering' AND m.position = 'Member';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.position = 'Vice President' AND m.link_to_major = 'Student_Club' AND e.location = '900 E. Washington St.' AND e.type = 'Social';	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name ilike '%Women''s Soccer%';	student_club
SELECT (COUNT(DISTINCT i.amount = 50)::FLOAT / NULLIF(COUNT(DISTINCT i.link_to_member), 0)) * 100 AS percentage FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.t_shirt_size = 'Medium' AND m.position = 'Member';	student_club
SELECT DISTINCT z.city FROM zip_code z WHERE z.type = 'PO Box';	student_club
SELECT z.zip_code FROM zip_code z WHERE z.type = 'PO Box' AND z.state = 'Puerto Rico' AND z.county = 'San Juan Municipio';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT m.member_id, e.event_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN expense ex ON m.member_id = ex.link_to_member WHERE ex.cost > 50;	student_club
SELECT m.member_id, m.first_name, m.last_name, e.event_name, a.link_to_event FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE a.link_to_member IN (SELECT link_to_member FROM expense WHERE approved = 'true' AND expense_date BETWEEN '2019-01-10' AND '2019-11-19');	student_club
SELECT m.college FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE m.first_name = 'Katy' AND mjr.major_id ='rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.major_name = 'Business' AND mjr.department = 'Business' AND mjr.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT DISTINCT m.email FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND e.cost > 20;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.major_name) = 'education' AND LOWER(m.position) ='member';	student_club
SELECT (SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage FROM budget b;	student_club
SELECT e.event_id, e.location, e.status FROM event e WHERE e.event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT e.expense_id, e.expense_description FROM expense e GROUP BY e.expense_id, e.expense_description HAVING SUM(e.cost) / NULLIF(COUNT(e.expense_id), 0) > 50 ORDER BY e.expense_id NULLS LAST;	student_club
SELECT m.first_name, m.last_name FROM member m WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT DIVIDE(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END), COUNT(zip_code)) * 100 AS percentage_of_po_boxes FROM zip_code;	student_club
SELECT e.event_name, e.location FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 0;	student_club
SELECT e.event_name, e.event_date, e.notes FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, m.major_name, e.expense_description, e.cost FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event WHERE e.cost > 100;	student_club
SELECT z.city, z.state FROM event e JOIN zip_code z ON e.location = z.city WHERE e.event_id IN (SELECT a.link_to_event FROM attendance a JOIN income i ON a.link_to_member = i.link_to_member GROUP BY a.link_to_event HAVING COUNT(i.income_id) > 40);	student_club
WITH TotalSpent AS (SELECT m.member_id, SUM(e.cost) AS total_cost FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event GROUP BY m.member_id HAVING COUNT(DISTINCT e.link_to_event) > 1) SELECT member_id, total_cost FROM TotalSpent ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT AVG(DIVIDE(SUM(e.cost), COUNT(DISTINCT e.event_id))) AS average_amount_paid FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.position!= 'Member';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Parking' AND b.spent < (SELECT SUM(b2.spent) / COUNT(DISTINCT b2.link_to_event) FROM budget b2 WHERE b2.category = 'Parking');	student_club
SELECT (SUM(e.cost) / NULLIF(COUNT(e.event_id), 0)) * 100 AS percentage_of_cost FROM event e WHERE e.type = 'Game';	student_club
SELECT MAX(b.spent) FROM budget b WHERE b.event_status = 'Open' AND b.category = 'expense' AND b.link_to_event IN (SELECT e.event_id FROM event e WHERE e.type = 'Meeting');	student_club
SELECT m.first_name, m.last_name, MAX(e.cost) AS total_cost FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event GROUP BY m.first_name, m.last_name ORDER BY total_cost DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_budget WHERE e.cost > (SELECT AVG(e2.cost) FROM expense e2) ORDER BY m.first_name NULLS LAST;	student_club
SELECT SUBTRACT(DIVIDE(SUM(CASE WHEN m.zip = 03901 THEN 1 ELSE 0 END), COUNT(CASE WHEN m.position = 'Member' THEN 1 ELSE 0 END)), DIVIDE(SUM(CASE WHEN m.zip = 05001 THEN 1 ELSE 0 END), COUNT(CASE WHEN m.position = 'Member' THEN 1 ELSE 0 END))) AS difference FROM member m;	student_club
SELECT m.major_name FROM member m WHERE m.member_id = 'Garrett Gerke';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.expense_description = 'Water, Veggie tray, supplies' GROUP BY m.first_name, m.last_name;	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE LOWER(ma.major_name) = 'elementary education';	student_club
SELECT b.category, b.amount FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'January Speaker';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount, i.date_received FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT b.category FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE e.expense_description ilike '%Posters%';	student_club
SELECT m.first_name, m.last_name, m.link_to_major FROM member m WHERE m.position = 'Secretary';	student_club
SELECT SUM(b.spent) AS total_spent, e.event_name FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT m.city FROM member m JOIN member m2 ON m.member_id = m2.member_id WHERE m2.first_name = 'Garrett' AND m2.last_name = 'Girke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina';	student_club
SELECT COUNT(*) FROM gasstations g JOIN products p ON g.ChainID = p.ProductID WHERE g.Country = 'CZE' AND p.Description = 'Premium';	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN c.Currency = 'CZK' THEN 1 END), 0) AS ratio FROM customers c;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date BETWEEN '201201' AND '201212' AND c.Segment = 'LAM' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(y.Consumption) / 12 AS average_monthly_consumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND y.Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date BETWEEN '201101' AND '201112' AND c.Currency = 'CZK GROUP BY c.CustomerID ORDER BY total_consumption DESC NULLS LAST;	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN "yearmonth" y ON c.CustomerID = y.CustomerID WHERE y.Date BETWEEN '201201' AND '201212' AND y.Consumption < 30000 AND c.Segment = 'KAM';	debit_card_specializing
SELECT (SELECT SUM(y.Consumption) FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201201' AND '201212') - (SELECT SUM(y.Consumption) FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' AND y.Date BETWEEN '201201' AND '201212') AS difference_in_consumption;	debit_card_specializing
SELECT y.Date, SUM(y.Consumption) AS total_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY y.Date ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS total_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID GROUP BY c.Segment ORDER BY total_consumption ASC LIMIT 1;	debit_card_specializing
SELECT y.Date, SUM(y.Consumption) AS total_consumption FROM yearmonth y WHERE y.Date like '____-' GROUP BY y.Date ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT y.date, MAX(y.consumption) AS max_consumption FROM yearmonth y JOIN customers c ON y.customerid = c.customerid WHERE c.segment = 'SME' AND y.date like '2013%' GROUP BY y.date ORDER BY max_consumption DESC LIMIT 1;	debit_card_specializing
SELECT (SELECT (SELECT SUM(t1.Amount) / NULLIF(COUNT(*), 0) AS avg_sme FROM "yearmonth" y1 JOIN customers c1 ON y1.CustomerID = c1.CustomerID WHERE c1.Segment = 'SME' AND y1.Date BETWEEN '201301' AND '201312') - (SELECT SUM(t2.Amount) / NULLIF(COUNT(*), 0) AS avg_lam FROM "yearmonth" y2 JOIN customers c2 ON y2.CustomerID = c2.CustomerID WHERE c2.Segment = 'LAM' AND y2.Date BETWEEN '201301' AND '201312')) AS difference_sme_lam, (SELECT (SELECT SUM(t3.Amount) / NULLIF(COUNT(*), 0) AS avg_lam FROM "yearmonth" y3 JOIN customers c3 ON y3.CustomerID = c3.CustomerID WHERE c3.Segment = 'LAM' AND y3.Date BETWEEN '201301' AND '201312') - (SELECT SUM(t4.Amount) / NULLIF(COUNT(*), 0) AS avg_sme FROM "yearmonth" y4 JOIN customers c4 ON y4.CustomerID = c4.CustomerID WHERE c4.Segment = 'SME' AND y4.Date BETWEEN '201301' AND '201312')) AS difference_lam_sme;	debit_card_specializing
WITH total_2012 AS (SELECT c.CustomerID, SUM(y.Consumption) AS total_2012 FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date BETWEEN '201201' AND '201212' GROUP BY c.CustomerID), total_2013 AS (SELECT c.CustomerID, SUM(y.Consumption) AS total_2013 FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date BETWEEN '201301' AND '201312' GROUP BY c.CustomerID) SELECT s.Segment, (t2013.total_2013 - t2012.total_2012) AS change_in_consumption, ((t2013.total_2013 - t2012.total_2012) * 100.0 / NULLIF(t2013.total_2013, 0)) AS percentage_change FROM total_2012 t2012 JOIN total_2013 t2013 ON t2012.CustomerID = t2013.CustomerID JOIN customers c ON t2012.CustomerID = c.CustomerID ORDER BY c.Segment NULLS LAST;	debit_card_specializing
SELECT SUM(y.Consumption) AS total_consumption FROM yearmonth y WHERE y.CustomerID = 6 AND y.Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT (SELECT COUNT(*) FROM gasstations gs WHERE gs.country = 'Czech Republic' AND gs.segment = 'discount') - (SELECT COUNT(*) FROM gasstations gs WHERE gs.country = 'Slovakia' AND gs.segment = 'discount') AS difference;	debit_card_specializing
SELECT (y1.Consumption - y2.Consumption) AS difference FROM yearmonth y1 JOIN yearmonth y2 ON y1.CustomerID = y2.CustomerID AND y1.Date = '201304' AND y2.Date = '201304' WHERE y1.CustomerID = 7 AND y2.CustomerID = 5;	debit_card_specializing
SELECT (SELECT COUNT(*) FROM customers c1 WHERE c1.Currency = 'CZK' AND c1.Segment = 'SME') - (SELECT COUNT(*) FROM customers c2 WHERE c2.Currency = 'EUR' AND c2.Segment = 'SME') AS difference;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND y.Date = '201310' ORDER BY y.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(y.Consumption) AS total_consumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date = '201305' AND c.Segment = 'KAM';	debit_card_specializing
SELECT (COUNT(DISTINCT CASE WHEN y.Consumption > 46.73 THEN y.CustomerID END) * 100.0 / NULLIF(COUNT(DISTINCT y.CustomerID), 0)) AS percentage FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'LAM';	debit_card_specializing
SELECT g.Country, COUNT(g.GasStationID) AS total_gas_stations FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID GROUP BY g.Country ORDER BY total_gas_stations DESC;	debit_card_specializing
SELECT (SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0)) AS Percentage FROM customers c WHERE c.CustomerID IN (SELECT DISTINCT CustomerID FROM transactions_1k);	debit_card_specializing
SELECT CAST(COUNT(*) filter (WHERE ym.Consumption > 528.3) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM yearmonth ym WHERE ym.Date LIKE '201202%';	debit_card_specializing
SELECT (COUNT(DISTINCT CASE WHEN gs.Country = 'Slovakia' AND gs.Segment = 'Premium' THEN gs.GasStationID END)::FLOAT / NULLIF(COUNT(DISTINCT CASE WHEN gs.Country = 'Slovakia' THEN gs.GasStationID END), 0)) * 100 AS percentage_of_premium FROM gasstations gs;	debit_card_specializing
SELECT ym.CustomerID, SUM(ym.Consumption) AS total_consumption FROM yearmonth ym WHERE ym.Date = '201309' GROUP BY ym.CustomerID ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, c.Segment, y.Consumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date = '201309' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201206' AND c.Segment = 'SME' GROUP BY c.CustomerID ORDER BY total_consumption ASC NULLS LAST LIMIT 1;	debit_card_specializing
SELECT MAX(y.Consumption) AS highest_consumption FROM yearmonth y WHERE y.Date LIKE '2012%';	debit_card_specializing
SELECT y.Date, SUM(y.Consumption) / 12 AS monthly_consumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR GROUP BY y.Date ORDER BY monthly_consumption DESC LIMIT 1;	debit_card_specializing
SELECT p.description FROM products p JOIN transactions_1k t ON p.product_id = t.product_id WHERE t.date = '201309';	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date LIKE '201306%';	debit_card_specializing
SELECT DISTINCT gs.ChainID FROM transactions_1k t JOIN gasstations gs ON t.GasStationID = gs.GasStationID WHERE t.CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR');	debit_card_specializing
SELECT t.productid, p.description FROM transactions_1k t JOIN products p ON t.productid = p.productid WHERE t.price = 1.0;	debit_card_specializing
SELECT AVG(t.Price) AS average_price FROM "transactions_1k" t WHERE t.Date LIKE '%2012-01%';	debit_card_specializing
SELECT COUNT(DISTINCT t.CustomerID) FROM transactions_1k t JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE t.Amount >= 1000 AND y.Consumption > 1000;	debit_card_specializing
SELECT t.ProductID, p.Description FROM "transactions_1k" t JOIN products p ON t.ProductID = p.ProductID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT EXTRACT(HOUR FROM t.time) AS hour_of_day, COUNT(*) AS number_of_transactions FROM transactions_1k t JOIN gasstations g ON t.gasstationid = g.gasstationid WHERE g.chainid = 11 GROUP BY hour_of_day ORDER BY hour_of_day NULLS LAST;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(t.Price) AS average_price FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT AVG(t.Price) AS average_price FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount) AS Total_Amount FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID JOIN transactions_1k t ON c.CustomerID = t.CustomerID AND y.Date = '2012-08-25' GROUP BY c.CustomerID ORDER BY Total_Amount DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID ASC NULLS LAST LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Time = '16:25:00' AND EXTRACT(YEAR FROM t.Date::DATE) = 2012 AND EXTRACT(MONTH FROM t.Date::DATE) = 8 AND EXTRACT(DAY FROM t.Date::DATE) = 24;	debit_card_specializing
SELECT c.Segment FROM customers c JOIN "transactions_1k" t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00' LIMIT 1;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' AND t.Date = '2012-08-26' AND t.Time < '13:00:00';	debit_card_specializing
SELECT c.Segment FROM customers c WHERE c.CustomerID = (SELECT MIN(c2.CustomerID) FROM customers c2);	debit_card_specializing
SELECT g.country FROM transactions_1k t JOIN gasstations g ON t.gasstationid = g.gasstationid WHERE t.date = '2012-08-24' AND t.time = '12:42:00';	debit_card_specializing
SELECT t.ProductID FROM transactions_1k t WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT SUM(t.amount) AS total_spent_in_january FROM transactions_1k t WHERE t.date >= '2012-01-01' AND t.date < '2012-02-01' AND t.customerid IN (SELECT c.customerid FROM customers c WHERE c.customerid IN (SELECT y.customerid FROM yearmonth y WHERE y.date = '2012-08-24'));	debit_card_specializing
SELECT COUNT(*) AS number_of_transactions FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-26' AND t.Time BETWEEN '08:00' AND '09:00' AND g.Country = 'CZE';	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date LIKE '%201306%' AND y.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CardID = 667467;	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '2012-08-24' AND y.Consumption = 548.4;	debit_card_specializing
SELECT CAST(COUNT(DISTINCT CASE WHEN c.Currency = 'EUR' THEN y.Date END) AS FLOAT) / NULLIF(COUNT(DISTINCT y.Date), 0) AS proportion FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date = '2012-08-25';	debit_card_specializing
WITH consumption_2012 AS (SELECT ym.CustomerID, SUM(ym.Consumption) AS total_consumption_2012 FROM yearmonth ym WHERE ym.Date BETWEEN '2012-08-25' AND '2012-12-31' GROUP BY ym.CustomerID), consumption_2013 AS (SELECT ym.CustomerID, SUM(ym.Consumption) AS total_consumption_2013 FROM yearmonth ym WHERE ym.Date BETWEEN '2013-01-01' AND '2013-12-31' GROUP BY ym.CustomerID) SELECT (c2012.total_consumption_2012 - c2013.total_consumption_2013) / NULLIF(c2012.total_consumption_2012, 0) AS consumption_decrease_rate FROM consumption_2012 c2012 LEFT JOIN consumption_2013 c2013 ON c2012.CustomerID = c2013.CustomerID WHERE c2012.total_consumption_2012 > 634.8;	debit_card_specializing
WITH total_revenue AS (SELECT t.GasStationID, SUM(t.Amount) AS total_amount FROM transactions_1k t GROUP BY t.GasStationID) SELECT gr.GasStationID FROM total_revenue gr ORDER BY gr.total_amount DESC LIMIT 1;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN c.Segment = 'premium' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(c.Segment), 0) AS proportion FROM customers c WHERE c.Segment IS NOT NULL AND c.Segment!= '';	debit_card_specializing
SELECT SUM(t.amount) AS total_spent, SUM(CASE WHEN EXTRACT(YEAR FROM t.date) = 2012 AND EXTRACT(MONTH FROM t.date) = 1 THEN t.amount ELSE 0 END) AS january_2012 FROM transactions_1k t WHERE t.customerid = 38508;	debit_card_specializing
SELECT p.Description, SUM(t.Amount) AS Total_Sales FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.Description ORDER BY Total_Sales DESC LIMIT 5;	debit_card_specializing
WITH total_spent AS (SELECT t.CustomerID, SUM(t.Amount) AS total_amount FROM transactions_1k t GROUP BY t.CustomerID ORDER BY total_spent DESC LIMIT 1) SELECT c.CustomerID, c.Currency, (t.Price / NULLIF(t.Amount, 0)) AS avg_price_per_item FROM total_spent t JOIN customers c ON t.CustomerID = c.CustomerID;	debit_card_specializing
WITH t AS (SELECT ym.CustomerID, ym.Date, t.ProductID, t.Price, SUM(t.Amount) AS total_amount, SUM(t.Amount * t.Price) AS total_revenue FROM "transactions_1k" t JOIN "yearmonth" ym ON t.CustomerID = ym.CustomerID WHERE ym.Date BETWEEN '2020-01-01' AND '2020-12-31' AND t.ProductID = 2 GROUP BY ym.CustomerID, ym.Date, t.ProductID) SELECT gs.Country, MAX(t.total_revenue) AS max_revenue FROM t JOIN gasstations gs ON t.CustomerID = gs.GasStationID GROUP BY gs.Country ORDER BY max_revenue DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM "transactions_1k" t JOIN products p ON t.ProductID = p.ProductID JOIN yearmonth y ON t.CustomerID = y.CustomerID AND y.Date like '%201208%' WHERE t.ProductID = 5 AND (t.Price / NULLIF(t.Amount, 0)) > 29.00 GROUP BY c.CustomerID ORDER BY total_consumption DESC NULLS LAST;	debit_card_specializing
