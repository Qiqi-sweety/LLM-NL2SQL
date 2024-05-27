WITH AlamedaCounty AS (SELECT f.CDSCode FROM frpm f WHERE LOWER(f.County Name) = 'alameda'), AlamedaSchools AS (SELECT a.CDSCode FROM AlamedaCounty a JOIN schools s ON a.CDSCode = s.CDSCode) SELECT MAX(f.Percent (%) Eligible Free (K-12)) AS highest_eligible_free_rate FROM AlamedaSchools AS ASchool JOIN frpm f ON ASchool.CDSCode = f.CDSCode;	california_schools
SELECT f.CDSCode, f.School Name, f.District Name, f.County Name, f.Percentage (%) Eligible Free (Ages 5-17) AS Eligible_Free_Rate FROM frpm f ORDER BY f.Percentage (%) Eligible Free (Ages 5-17) ASC NULLS LAST LIMIT 3;	california_schools
SELECT s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f."Charter School (Y/N)" = 1 AND s.County = 'Fresno';	california_schools
SELECT s.MailStreet, s.MailCity, s.MailState, s.MailZip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.FRPM Count (K-12) DESC NULLS LAST LIMIT 1;	california_schools
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f."Charter School (Y/N)" = 1 AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM satscores s WHERE s.Virtual = 'F' AND s.AvgScrMath < 400;	california_schools
SELECT s.CDSCode, s.School FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.NumTstTakr > 500 AND (s.Magnet = 1 OR s.Virtual IS NOT NULL);	california_schools
SELECT s.Phone FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY s.NumTstTakr DESC NULLS LAST LIMIT 1;	california_schools
WITH frpm_rank AS (SELECT f.CDSCode, f.FRPM_Count_K_12 AS frpm_count FROM frpm f ORDER BY f.FRPM_Count_K_12 DESC LIMIT 5) SELECT SUM(s.NumTstTakr) AS total_test_takers FROM satscores s JOIN frpm_rank f ON s.CDS = f.CDSCode;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) AS number_of_schools FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE s.AvgScrMath > 560 AND sch.FundingType = 'Charter';	california_schools
WITH HighestSAT AS (SELECT s.CDSCode, s.AvgScrRead FROM satscores s WHERE s.rtype = 'C' ORDER BY s.AvgScrRead DESC LIMIT 1) SELECT frpm.CDSCode, frpm.FRPM_Count_Ages_5_17 AS FRPM_Count FROM HighestSAT h JOIN frpm frpm ON h.CDSCode = frpm.CDSCode;	california_schools
SELECT DISTINCT f.CDSCode FROM frpm f WHERE f."Enrollment (K-12)" + f."Enrollment (Ages 5-17)" > 500;	california_schools
SELECT MAX(free_meal_count_ages_5_17 / NULLIF(enrollment_ages_5_17, 0)) AS highest_eligible_free_rate FROM frpm WHERE cdscode IN (SELECT s.cds FROM satscores s WHERE (numge1500 / NULLIF(numtsttakr, 0)) > 0.3);	california_schools
WITH sat_excellence AS (SELECT s.cds, (s.NumGE1500::FLOAT / NULLIF(s.NumTstTakr, 0)) AS excellence_rate FROM satscores s) SELECT s.phone FROM schools s JOIN sat_excellence se ON s.cds = se.cds ORDER BY se.excellence_rate DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, f.Enrollment FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.Enrollment DESC NULLS LAST LIMIT 5;	california_schools
SELECT d.District, AVG(s.AvgScrRead) AS avg_reading_score FROM satscores s JOIN schools s2 ON s.cds = s2.CDSCode WHERE s2.StatusType = 'Active' GROUP BY d.District ORDER BY avg_reading_score DESC NULLS LAST LIMIT 1;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM satscores s JOIN schools sc ON s.CDS = sc.CDSCode WHERE s.NumTstTakr < 100 AND LOWER(sc.County) = 'alameda';	california_schools
SELECT s CharterNumber FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Percent (%) Eligible Free (K-12)` = 100;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Contra Costa' AND s.Charter = 1 AND s.FundingType = 'Directly Funded' AND s.NumTstTakr <= 250;	california_schools
WITH MathScores AS (SELECT s.CDSCode, AVG(s.AvgScrMath) AS AvgMath FROM satscores s GROUP BY s.CDSCode) SELECT s.Phone FROM schools s JOIN MathScores m ON s.CDSCode = m.CDSCode ORDER BY m.AvgMath DESC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT f.CDSCode) FROM frpm f WHERE f.`Low Grade` = '9' AND f.`High Grade` = '12' AND f.`County Name` = 'Amador';	california_schools
SELECT COUNT(*) FROM frpm f WHERE f.`Free Meal Count (K-12)` > 500 AND f.`Free Meal Count (K-12)` < 700 AND f.`County Code` = 'Los Angeles';	california_schools
WITH SchoolTestTakers AS (SELECT s.CDSCode, s.School, SUM(st.NumTstTakr) AS TotalTestTakers FROM frpm f JOIN satscores st ON f.CDSCode = st.cds JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.County Name = 'Contra Costa' GROUP BY s.CDSCode, s.School) SELECT st.School FROM SchoolTestTakers st ORDER BY st.TotalTestTakers DESC NULLS LAST LIMIT 1;	california_schools
SELECT s.school, s.street, s.city, s.zip, s.state FROM frpm f JOIN schools s ON f.cdscode = s.cdscode WHERE f.enrollment_k_12 - f.enrollment_ages_5_17 > 30;	california_schools
SELECT s.School, s.District, s.County, f.Percent (%) Eligible Free (K-12), sats.NumTstTakr, sats.NumGE1500 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores sats ON s.CDSCode = sats.cds WHERE f.Percent (%) Eligible Free (K-12) > 0.1 AND sats.NumGE1500 IS NOT NULL;	california_schools
SELECT s.FundingType FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Riverside' AND (SELECT SUM(ss.AvgScrMath) / NULLIF(COUNT(*), 0) FROM satscores ss WHERE ss.cds = s.CDSCode) > 400;	california_schools
SELECT s.School, s.Street, s.City, s.State, s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f."Percent (%) Eligible FRPM (Ages 5-17)" > 80 ORDER BY f."Percent (%) Eligible FRPM (Ages 5-17)" DESC NULLS LAST;	california_schools
SELECT s.School, AVG(s.AvgScrWrite) AS average_score, s.Phone FROM schools s WHERE s.OpenDate > '1991-01-01' AND (s.ClosedDate IS NULL OR s.ClosedDate < '2000-01-01') GROUP BY s.School, s.Phone ORDER BY s.School NULLS LAST;	california_schools
SELECT s.CDSCode, s.School, s.DOC FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.Chartar School (Y/N) = 0 AND (f.Enrollment (K-12) - f.Enrollment (Ages 5-17)) > (SELECT AVG(f.Enrollment (K-12) - f.Enrollment (Ages 5-17)) FROM frpm f WHERE f.Chartar School (Y/N) = 0) ORDER BY s.CDSCode NULLS LAST;	california_schools
SELECT s.OpenDate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.StatusType = 'K-12' ORDER BY s.OpenDate ASC LIMIT 1;	california_schools
SELECT s.City, s.School, MIN(s.Enrollment) AS min_enrollment FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Low Grade` = '1' AND f.`High Grade` = '12' GROUP BY s.City, s.School ORDER BY min_enrollment ASC LIMIT 5;	california_schools
WITH SchoolEnrollment AS (SELECT frpm.CDSCode, frpm.School Name, SUM(frpm.Enrollment (K-12)) AS total_enrollment FROM frpm GROUP BY frpm.CDSCode, frpm.School Name ORDER BY total_enrollment DESC LIMIT 10) SELECT frpm.School Name, frpm. Percent (%) Eligible Free (K-12) AS eligible_free_rate FROM SchoolEnrollment se JOIN frpm ON se.CDSCode = frpm.CDSCode ORDER BY eligible_free_rate DESC LIMIT 10;	california_schools
SELECT s.CDSCode, s.School, (frpm.FRPM_Count_K_12 / NULLIF(frpm.Enrollment_K_12, 0)) AS frpm_rate FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode WHERE frpm.IRC = 66 ORDER BY frpm.FRPM_Count_K_12 DESC NULLS LAST LIMIT 5;	california_schools
SELECT s.WEBSITE, s.SCHOOL FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f."Free Meal Count (Ages 5-17)" BETWEEN 1900 AND 2000;	california_schools
SELECT (f."Free Meal Count (Ages 5-17)" / NULLIF(f."Enrollment (Ages 5-17)", 0)) * 100 AS eligible_free_rate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s."AdmFName1" ILIKE '%Kacey%Gibson%' AND s."AdmLName1" ILIKE '%Gibson%Kacey%' AND s."AdmEmail1" ILIKE '%kgibson%' AND s."AdmFName2" IS NULL AND s."AdmLName2" IS NULL AND s."AdmEmail2" IS NULL AND s."AdmFName3" IS NULL AND s."AdmLName3" IS NULL AND s."AdmEmail3" IS NULL;	california_schools
SELECT s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 ORDER BY f.`Enrollment (K-12)` ASC LIMIT 1;	california_schools
WITH HighestSatSchool AS (SELECT s.CDSCode, s.School, MAX(ss.NumGE1500) AS MaxNumGE1500 FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode GROUP BY s.CDSCode, s.School) SELECT s.School, s.AdminFName1, s.AdminLName1 FROM HighestSatSchool hs JOIN schools s ON hs.CDSCode = s.CDSCode WHERE hs.MaxNumGE1500 = (SELECT MAX(MaxNumGE1500) FROM HighestSatSchool) LIMIT 1;	california_schools
SELECT s.street, s.city, s.state, s.zip FROM schools s JOIN frpm f ON s.cdscode = f.cdscode WHERE f.numge1500 / NULLIF(f.numtsttakr, 0) = MIN(f.numge1500 / NULLIF(f.numtsttakr, 0)) ORDER BY f.numge1500 / NULLIF(f.numtsttakr, 0) LIMIT 1;	california_schools
SELECT s.WEBSITE FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Los Angeles' AND f."Enrollment (K-12)" BETWEEN 2000 AND 3000 AND ss.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(s.NumTstTakr) AS average_test_takers FROM schools s WHERE s.County = 'Fresno' AND EXTRACT(YEAR FROM s.LastUpdate) = 1980;	california_schools
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.District = 'Fresno Unified' ORDER BY ss.AvgScrRead ASC LIMIT 1;	california_schools
SELECT s.sname, AVG(s.AvgScrRead) AS average_reading_score FROM satscores s JOIN schools sh ON s.cds = sh.CDSCode WHERE sh.Virtual = 'F' GROUP BY s.sname ORDER BY average_reading_score DESC NULLS LAST LIMIT 5;	california_schools
SELECT s.EducationType FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.CDSCode = (SELECT s.CDSCode FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.AvgScrMath IS NOT NULL ORDER BY ss.AvgScrMath DESC LIMIT 1);	california_schools
SELECT AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) AS average_score, s.cname FROM satscores s GROUP BY s.cname ORDER BY average_score ASC LIMIT 1;	california_schools
WITH t AS (SELECT s.CDSCode, s.City, SUM(s.NumTstTakr) AS total_takers, AVG(s.AvgScrWrite) AS avg_write_score FROM satscores s WHERE s.NumGE1500 >= 1500 GROUP BY s.CDSCode, s.City ORDER BY total_takers DESC LIMIT 1) SELECT t.City, t.avg_write_score FROM t;	california_schools
SELECT s.School, AVG(ss.AvgScrWrite) AS average_writing_score FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmlName1 ilike '%Ricci Ulrich%' OR s.AdmlName2 ilike '%Ricci Ulrich%' OR s.AdmlName3 ilike '%Ricci Ulrich%' GROUP BY s.School ORDER BY s.School NULLS LAST;	california_schools
SELECT s.State, SUM(f.Enrollment (K-12)) AS total_enrollment FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`School Type` = 'State Special School' AND f.`Low Grade` = '1' AND f.`High Grade` = '12' GROUP BY s.State ORDER BY total_enrollment DESC NULLS LAST LIMIT 1;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) / 12.0 AS avg_monthly_openings FROM schools s WHERE s.County = 'Alameda' AND s.StatusType = 'Elementary School District' AND EXTRACT(YEAR FROM s.OpenDate) = 1980 AND s.DOC = '52';	california_schools
SELECT CAST(COUNT(DISTINCT CASE WHEN s.DOC = '54' THEN s.CDSCode END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN s.DOC = '52' THEN s.CDSCode END), 0) AS ratio FROM schools s WHERE s.County = 'Orange';	california_schools
SELECT s.County, s.School, s.ClosedDate FROM schools s WHERE s.StatusType = 'Closed' ORDER BY COUNT(s.County) DESC LIMIT 1;	california_schools
SELECT s.street FROM schools s JOIN frpm f ON s.cdscode = f.cdscode ORDER BY satscores.avgscrmath DESC NULLS LAST LIMIT 1;	california_schools
SELECT s.MailStreet, s.MailCity, s.MailState, s.MailZip, s.MailStreetAbr, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.MailZip, s.MailCity, s.MailState, s.Mail	california_schools
SELECT COUNT(*) FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE s.NumTstTakr > 0 AND (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) >= 1500 AND LOWER(sch.MailCity) = 'lakeport';	california_schools
SELECT SUM(s.NumTstTakr) AS total_test_takers FROM satscores s JOIN schools s1 ON s.cds = s1.CDSCode WHERE s1.MailCity ilike '%Fresno%';	california_schools
SELECT s.CDSCode, s.MailZip FROM schools s WHERE (s.AdmlName1 ilike '%Atoian%' OR s.AdmlName2 ilike '%Atoian%' OR s.AdmlName3 ilike '%Atoian%');	california_schools
SELECT CAST(COUNT(CASE WHEN s.County = 'Colusa' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN s.County = 'Humboldt' THEN 1 END), 0) AS ratio FROM schools s WHERE s.MailState = 'California' AND s.County IN ('Colusa', 'Humboldt');	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s WHERE s.MailState = 'CA' AND s.StatusType = 'Active';	california_schools
WITH avg_write AS (SELECT s.CDSCode, AVG(s.AvgScrWrite) AS avg_write_score FROM satscores s GROUP BY s.CDSCode ORDER BY avg_write_score DESC NULLS LAST LIMIT 333) SELECT s.Phone, s.Ext FROM schools s JOIN avg_write aw ON s.CDSCode = aw.CDSCode;	california_schools
SELECT s.Phone, s.Ext, s.School FROM schools s WHERE s.Zip = '95203-3704';	california_schools
SELECT s.Website FROM schools s WHERE s.AdmlName1 ilike '%Mike Larson%' OR s.AdmlName2 ilike '%Mike Larson%' OR s.AdmlName3 ilike '%Mike Larson%' OR s.AdmlName1 ilike '%Dante Alvarez%' OR s.AdmlName2 ilike '%Dante Alvarez%' OR s.AdmlName3 ilike '%Dante Alvarez%';	california_schools
SELECT s.Website FROM schools s WHERE s.Virtual = 'P' AND s.Charter = 1 AND s.County = 'San Joaquin';	california_schools
SELECT COUNT(*) FROM schools s WHERE LOWER(s.city) = 'hickman' AND s.charter = 1 AND s.doc = '52';	california_schools
SELECT COUNT(DISTINCT f.CDSCode) FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.Charter = 0 AND s.County = 'Los Angeles' AND f.`Percent (%) Eligible Free (K-12)` < 0.18;	california_schools
SELECT s.School, s.City, s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3 FROM schools s WHERE s.Charter = 1 AND s.CharterNum = '00D2' ORDER BY s.School NULLS LAST;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s WHERE s.MailCity = 'Hickman' AND s.CharterNum = '00D4';	california_schools
SELECT (COUNT(CASE WHEN s.FundingType = 'Locally Funded' THEN 1 END)::FLOAT / NULLIF(COUNT(*), 0)) * 100 AS percentage FROM schools s WHERE s.County = 'Santa Clara';	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s WHERE s.FundingType = 'Directly Funded' AND s.County = 'Stanislaus' AND s.OpenDate BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT SUM(CASE WHEN s.StatusType = 'Community College' AND s.ClosedDate = '1989-01-01' THEN 1 ELSE 0 END) AS total_community_colleges_closed_in_1989 FROM schools s;	california_schools
SELECT s.County, COUNT(s.CDSCode) AS total_closures FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.StatusType = 'Closed' AND s.OpenDate BETWEEN '1980-01-01' AND '1989-12-31' AND s.SOC = '11' GROUP BY s.County ORDER BY total_closures DESC LIMIT 1;	california_schools
SELECT s.NCESDist FROM schools s WHERE s.SOC = '31';	california_schools
SELECT COUNT(*) FROM schools s WHERE s.County = 'Alpine' AND s.StatusType IN ('A', 'C');	california_schools
SELECT s.District FROM schools s WHERE s.Magnet = 0 AND s.City = 'Fresno' ORDER BY s.District NULLS LAST;	california_schools
SELECT SUM(s.enroll12) AS total_students FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`County Name` = 'Fremont' AND s.EdOpsCode = 'SSS' AND f.`Academic Year` = '2014-15' AND f.`Low Grade` = '5' AND f.`High Grade` = '17';	california_schools
SELECT SUM(f.frpm_count_ages_5_17) AS total_frpm_count FROM frpm f JOIN schools s ON f.cdscode = s.cdscode WHERE s.charter = 1 AND s.mailstreet ilike '%PO Box 1040%';	california_schools
SELECT l.Low Grade FROM frpm l WHERE l.District Code = (SELECT s.NCESDist FROM schools s WHERE s.EdOpsCode = 'SPECON' AND s.NCESSchool = '613360') ORDER BY l.Low Grade ASC NULLS LAST LIMIT 1;	california_schools
SELECT s.School, f.Educational Option Type FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.NSLP Provision Status = 'Breakfast Provision 2' AND f.County Code = '37';	california_schools
SELECT s.City FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.LowGrade = '9' AND f.HighGrade = '12' AND f.EducationalOptionType = 'Lunch Provision 2' AND f.SchoolType = 'HS' AND s.County = 'Merced';	california_schools
SELECT s.CDSCode, s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND (f.Low Grade = 'K' AND f.High Grade = '9') AND f.Percentage Eligible FRPM (Ages 5-17) IS NOT NULL;	california_schools
SELECT s.Virtual, COUNT(*) AS COUNT FROM schools s WHERE s.City = 'Adelanto' GROUP BY s.Virtual ORDER BY COUNT DESC NULLS LAST LIMIT 1;	california_schools
WITH sd AS (SELECT COUNT(*) AS num_schools FROM schools WHERE County = 'San Diego' AND Virtual = 'F'), sb AS (SELECT COUNT(*) AS num_schools FROM schools WHERE County = 'Santa Barbara' AND Virtual = 'F') SELECT (SELECT County FROM schools WHERE CDSCode = (SELECT CDSCode FROM frpm ORDER BY IRC DESC LIMIT 1)) AS County, (sd.num_schools - sb.num_schools) AS difference FROM sd, sb;	california_schools
SELECT s.School, s.Latitude FROM schools s ORDER BY s.Latitude DESC NULLS LAST LIMIT 1;	california_schools
SELECT s.City, s.School, f.Low_Grade FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.State = 'CA' ORDER BY s.Latitude ASC NULLS LAST LIMIT 1;	california_schools
SELECT s.Grade FROM schools s WHERE s.Longitude = (SELECT MAX(s2.Longitude) FROM schools s2);	california_schools
WITH magnet_schools AS (SELECT s.CDSCode, s.City, s.District, s.School, s.Magnet, s.Latitude, s.Longitude FROM schools s WHERE s.Magnet = 1 AND s.GradeRange LIKE '%K-8%') SELECT COUNT(DISTINCT ms.CDSCode) AS number_of_schools, ms.City, ms.District, ms.School FROM magnet_schools ms GROUP BY ms.City, ms.District, ms.School HAVING COUNT(DISTINCT ms.CDSCode) > 1;	california_schools
SELECT s.District, s.AdminFName1, s.AdminFName2, s.AdminFName3, COUNT(*) AS frequency FROM schools s GROUP BY s.District, s.AdminFName1, s.AdminFName2, s.AdminFName3 ORDER BY frequency DESC LIMIT 2;	california_schools
SELECT f.CDSCode, CAST(f.Free_Meal_Count_K_12 AS FLOAT) / NULLIF(f.Enrollment_K_12, 0) * 100 AS Percent_Eligible_Free FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 ilike 'Alusine%' ORDER BY f.CDSCode NULLS LAST;	california_schools
SELECT s.AdmLName3 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.Charter School Number = '40';	california_schools
SELECT s.MailEmail1, s.MailEmail2, s.MailEmail3 FROM schools s WHERE s.County = 'San Bernardino' AND s.District = 'San Bernardino City Unified' AND s.StatusType IN ('Public Intermediate/Middle Schools', 'Unified Schools') AND s.OpenDate BETWEEN '2009-01-01' AND '2010-12-31';	california_schools
WITH school_scores AS (SELECT s.CDSCode, s.School, SUM(ss.NumTstTakr) AS total_test_takers FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds GROUP BY s.CDSCode, s.School) SELECT school, admin_email FROM school_scores ss JOIN schools s ON ss.CDSCode = s.CDSCode WHERE ss.total_test_takers = (SELECT MAX(total_test_takers) FROM school_scores) ORDER BY school NULLS LAST LIMIT 1;	california_schools
SELECT COUNT(*) FROM account a JOIN card c ON a.account_id = c.card_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND a.district_id IN (SELECT district_id FROM district WHERE A3 = 'East Bohemia');	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE LOWER(d.A3) = 'prague';	financial
SELECT 1995 AS year, AVG(d.A12) AS average_unemployment_rate FROM district d UNION ALL SELECT 1996 AS year, AVG(d.A13) AS average_unemployment_rate FROM district d ORDER BY year NULLS LAST;	financial
SELECT COUNT(DISTINCT a.district_id) FROM account a JOIN client c ON a.account_id = c.client_id WHERE c.gender = 'F' AND a.frequency = 'Salary' AND a.date BETWEEN '2020-01-01' AND '2020-12-31' AND a.A11 > 6000 AND a.A11 < 10000;	financial
SELECT COUNT(*) FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000;	financial
WITH min_avg AS (SELECT MIN(A11) AS min_avg FROM client), max_avg AS (SELECT MAX(A11) AS max_avg FROM client) SELECT c.account_id FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.gender = 'F' AND c.birth_date = (SELECT MIN(birth_date) FROM client) ORDER BY a.date LIMIT 1, 1;	financial
WITH ranked AS (SELECT a.account_id, c.birth_date, d.A11 AS avg_salary, RANK() OVER (ORDER BY c.birth_date ASC) AS age_rank FROM account a JOIN client c ON a.district_id = c.district_id JOIN disp d ON a.account_id = d.account_id) SELECT account_id FROM ranked WHERE age_rank = 1;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.frequency, l.amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE EXTRACT(YEAR FROM l.date) = 1997 ORDER BY l.amount ASC NULLS LAST;	financial
SELECT a.account_id, a.date, l.amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE date_part('year', a.date) = 1993 AND l.duration > 12 ORDER BY l.amount DESC NULLS LAST LIMIT 1;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 ilike '%Slokolov%';	financial
SELECT a.account_id, a.date FROM account a WHERE EXTRACT(YEAR FROM a.date) = 1995 ORDER BY a.date ASC NULLS LAST LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.amount > 3000;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.disp_id = cd.disp_id WHERE EXTRACT(YEAR FROM cd.issued) = 1994 AND EXTRACT(MONTH FROM cd.issued) = 3 AND EXTRACT(DAY FROM cd.issued) = 3;	financial
SELECT a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14';	financial
SELECT a.district_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.date <= '1994-08-25' AND a.date >= '1994-08-25' AND l.date <= '1994-08-25' AND l.date >= '1994-08-25';	financial
SELECT MAX(t.amount) AS max_transaction_amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE d.issued = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN account a ON c.client_id = a.client_id JOIN district d ON a.district_id = d.district_id ORDER BY d.A11 DESC, c.birth_date ASC LIMIT 1;	financial
WITH max_loan AS (SELECT c.client_id FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.client_id = c.client_id GROUP BY c.client_id ORDER BY MAX(l.amount) DESC LIMIT 1), first_transaction AS (SELECT t.account_id, MIN(t.date) AS first_transaction_date FROM trans t JOIN account a ON t.account_id = a.account_id JOIN max_loan ml ON a.client_id = ml.client_id GROUP BY t.account_id) SELECT c.client_id, ft.first_transaction_date FROM client c JOIN first_transaction ft ON c.client_id = ft.account_id;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Jesenik' AND c.gender = 'F';	financial
SELECT d.disp_id FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id JOIN disp d ON t.account_id = d.account_id WHERE t.amount = 5100 AND t.date = '1998-09-02' AND c.gender ='male';	financial
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 ilike '%Litomerice%' AND EXTRACT(YEAR FROM a.date) = 1996;	financial
SELECT d.A2 FROM client c JOIN account a ON c.client_id = a.client_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN loan l ON d.account_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT a.account_id FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'Prague' ORDER BY a.date LIMIT 1;	financial
SELECT (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage_of_male FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'South Bohemia';	financial
SELECT (MAX(t2.balance) - MIN(t1.balance))::FLOAT / NULLIF(MIN(t1.balance), 0) * 100 AS increase_rate FROM trans t1 JOIN trans t2 ON t1.account_id = t2.account_id AND t1.date = '1993-07-05' AND t2.date = '1998-12-27' WHERE t1.account_id IN (SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.date = '1993-07-05');	financial
SELECT (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) / NULLIF(SUM(l.amount), 0)) * 100 AS percentage FROM loan l;	financial
SELECT CAST(SUM(CASE WHEN l.status = 'C' THEN o.amount ELSE 0 END) AS FLOAT) / NULLIF(SUM(o.amount), 0) * 100 AS percentage FROM loan l JOIN order o ON l.account_id = o.account_id WHERE l.amount < 100000;	financial
SELECT a.account_id, d.A2, d.A3 FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.account_id = c.card_id WHERE c.type = 'POPLATEK PO OBRATU' AND EXTRACT(YEAR FROM a.date) = 1993;	financial
SELECT a.account_id, COUNT(*) AS frequency FROM account a JOIN client c ON a.district_id = c.district_id WHERE EXTRACT(YEAR FROM a.date) BETWEEN 1995 AND 2000 AND c.gender = 'M' AND a.frequency ='monthly' GROUP BY a.account_id ORDER BY frequency DESC NULLS LAST;	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 ilike '%Prachatice%';	financial
SELECT d.A2 AS district, d.A3 AS region FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM account a JOIN loan l ON a.account_id = l.account_id JOIN client c ON a.account_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3 AS district, d.A11 AS average_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE l.duration = 60;	financial
WITH client_district AS (SELECT c.client_id, d.district_id FROM client c JOIN disp d ON c.client_id = d.client_id), loan_status AS (SELECT l.account_id, l.status FROM loan l WHERE l.status = 'D'), account_district AS (SELECT a.account_id, ad.district_id FROM account a JOIN client_district cd ON a.account_id = cd.client_id), district_unemployment AS (SELECT d.district_id, d.A12 AS unemployment_rate_2015, d.A13 AS unemployment_rate_2016 FROM district d), unemployment_increment AS (SELECT du.district_id, ((du.unemployment_rate_2016 - du.unemployment_rate_2015) / NULLIF(du.unemployment_rate_2015, 0)) * 100 AS unemployment_increment FROM district_unemployment du) SELECT ad.district_id, ui.unemployment_increment FROM account_district ad JOIN unemployment_increment ui ON ad.district_id = ui.district_id JOIN loan_status ls ON ad.account_id = ls.account_id;	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN d.A2 = 'Decin' THEN a.account_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.account_id), 0) AS proportion FROM account a JOIN district d ON a.district_id = d.district_id WHERE EXTRACT(YEAR FROM a.date) = 1993;	financial
SELECT a.account_id FROM account a WHERE a.frequency = 'POPLATEK MESICNE';	financial
SELECT d.A2, COUNT(c.client_id) AS female_count FROM client c JOIN account a ON c.client_id = a.client_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_count DESC LIMIT 10;	financial
SELECT d.A2, SUM(t.amount) AS total_withdrawal FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.client_id = c.client_id JOIN disp d ON a.account_id = d.account_id WHERE t.type = 'VYDAJ' AND EXTRACT(MONTH FROM t.date) = 1 AND EXTRACT(YEAR FROM t.date) = 1996 GROUP BY d.A2 ORDER BY total_withdrawal DESC LIMIT 10;	financial
SELECT COUNT(*) FROM account a JOIN client c ON a.district_id = c.district_id JOIN disp d ON a.account_id = d.account_id LEFT JOIN card cd ON d.account_id = cd.disp_id WHERE c.district_id IN (SELECT district_id FROM district WHERE A3 = 'South Bohemia') AND cd.card_id IS NULL;	financial
WITH active_loan AS (SELECT a.account_id, d.A3 AS district_name, SUM(l.amount) AS total_loan_amount FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE l.status IN ('C', 'D') GROUP BY a.account_id, d.A3) SELECT district_name, total_loan_amount FROM active_loan ORDER BY total_loan_amount DESC LIMIT 1;	financial
SELECT AVG(l.amount) AS average_loan_amount FROM loan l JOIN client c ON l.account_id = c.client_id WHERE c.gender = 'M';	financial
SELECT d.A2, d.A3, d.A4, d.A5, d.A6, d.A7, d.A8, d.A9, d.A10, d.A11, d.A12, d.A13, d.A14, d.A15, d.A16 FROM district d WHERE d.A13 = (SELECT MAX(d2.A13) FROM district d2 WHERE d2.A13 IS NOT NULL);	financial
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A16 = (SELECT MAX(d.A16) FROM district d);	financial
SELECT COUNT(DISTINCT t.account_id) FROM trans t WHERE t.operation = 'VYBER KARTOU' AND t.type = 'POPLATEK MESICNE' AND t.balance < 0;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND l.amount >= 250000 AND l.date BETWEEN '1995-01-01' AND '1997-12-31' AND l.status = 'APPROVED';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id JOIN client c ON a.district_id = c.district_id WHERE l.status = 'C' AND c.gender = 'M' AND a.district_id = 1;	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT d.district_id FROM district d WHERE d.A15 = (SELECT MAX(d2.A15) FROM district d2 WHERE d2.A15 < (SELECT MAX(d3.A15) FROM district d3));	financial
SELECT COUNT(*) FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'disponent';	financial
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 ilike '%Pisek%';	financial
SELECT d.A3 FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.date BETWEEN '1997-01-01' AND '1997-12-31' AND t.amount > 10000;	financial
SELECT a.account_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.k_symbol = 'SIPO';	financial
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.account_id = c.disp_id WHERE c.type = 'gold' AND c.type = 'junior';	financial
SELECT AVG(t.amount) AS average_amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.client_id = c.client_id WHERE t.operation = 'VYBER KARTOU' AND EXTRACT(YEAR FROM t.date) = 2021 AND c.gender = 'F';	financial
WITH avg_spending AS (SELECT t.account_id, AVG(t.amount) AS avg_amount FROM trans t WHERE t.operation = 'VYBER KARTOU' AND EXTRACT(YEAR FROM t.date) = 1998 GROUP BY t.account_id) SELECT a.account_id, a.frequency FROM account a JOIN avg_spending AS s ON a.account_id = s.account_id WHERE s.avg_amount < a.frequency;	financial
SELECT DISTINCT c.client_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN card cd ON a.account_id = cd.disp_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F';	financial
SELECT COUNT(*) FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 ilike '%South Bohemia%';	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.frequency = 'OWNER' AND a.date <= CURRENT_DATE AND c.district_id IN (SELECT district_id FROM district WHERE A2 ilike '%Tabor%');	financial
SELECT a.type, d.A11 FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.type!= 'OWNER' AND d.A11 > 8000 AND d.A11 <= 9000;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE LOWER(d.A3) = 'north bohemia' AND LOWER(t.bank) = 'ab';	financial
SELECT d.A2 FROM account a JOIN trans t ON a.account_id = t.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(d.A15) AS average_crimes FROM district d WHERE d.A15 > 4000 AND d.A3 IN (SELECT a.district_id FROM account a WHERE a.date >= '1997-01-01');	financial
SELECT COUNT(*) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.card_id = c.card_id WHERE a.frequency = 'OWNER' AND c.type = 'classic';	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A2 ilike '%Hl.m.%Praha%' AND c.gender = 'M';	financial
SELECT CAST(COUNT(CASE WHEN c.type = 'Gold' AND c.issued < '1998-01-01' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percent_of_gold FROM card c;	financial
WITH max_loan AS (SELECT a.account_id FROM loan l JOIN account a ON l.account_id = a.account_id GROUP BY a.account_id ORDER BY SUM(l.amount) DESC LIMIT 1) SELECT c.client_id FROM client c JOIN account a ON c.client_id = a.client_id JOIN max_loan ml ON a.account_id = ml.account_id;	financial
SELECT a.district_id, a.frequency, COUNT(d.A15) AS total_crimes FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.date = '1995-01-01' GROUP BY a.district_id, a.frequency ORDER BY total_crimes DESC NULLS LAST;	financial
SELECT a.district_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.account_id = 33333;	financial
SELECT t.amount FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE t.operation = 'VYBER' AND d.client_id = 3356;	financial
SELECT COUNT(*) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT c.type FROM client cl JOIN disp d ON cl.client_id = d.client_id JOIN card c ON d.account_id = c.card_id WHERE cl.client_id = 13539;	financial
SELECT d.A3 AS region FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = 3541;	financial
WITH district_accounts AS (SELECT a.district_id, COUNT(l.account_id) AS num_accounts FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY a.district_id) SELECT d.A2, da.num_accounts FROM district d JOIN district_accounts da ON d.district_id = da.district_id ORDER BY da.num_accounts DESC NULLS LAST LIMIT 1;	financial
SELECT c.client_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 32423;	financial
SELECT t.trans_id, t.date, t.type, t.amount, t.balance, t.k_symbol, t.bank, t.account FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5;	financial
SELECT COUNT(*) FROM account a JOIN client c ON a.district_id = c.district_id WHERE LOWER(c.gender) ='male';	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.account_id = cd.card_id WHERE cd.type = 'junior' AND cd.issued >= '1997-01-01';	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender = 'F' THEN c.client_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.account_id), 0) AS proportion FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.frequency = 'F' AND c.district_id IN (SELECT d.district_id FROM district d WHERE d.A11 > 10000);	financial
SELECT (SUM(CASE WHEN EXTRACT(YEAR FROM l.date) = 1997 THEN l.amount ELSE 0 END) - SUM(CASE WHEN EXTRACT(YEAR FROM l.date) = 1996 THEN l.amount ELSE 0 END)) / NULLIF(SUM(CASE WHEN EXTRACT(YEAR FROM l.date) = 1996 THEN l.amount ELSE 0 END), 0) * 100 AS growth_rate FROM loan l JOIN client c ON l.account_id = c.client_id WHERE c.gender = 'M';	financial
SELECT COUNT(*) FROM trans t WHERE LOWER(t.operation) = 'vyber kartou' AND EXTRACT(YEAR FROM t.date) > 1995;	financial
SELECT d.A3, SUM(d.A16) AS total_crimes FROM district d WHERE d.A3 IN ('East Bohemia', 'North Bohemia') AND d.A16 > 0 GROUP BY d.A3 ORDER BY d.A3 NULLS LAST;	financial
SELECT COUNT(DISTINCT d.disp_id) AS number_of_dispositions FROM disp d WHERE d.account_id BETWEEN 1 AND 10;	financial
SELECT COUNT(*) AS frequency, SUM(t.amount) AS total_amount FROM trans t WHERE t.account_id = 3 AND t.operation = 'debit' AND t.amount = 3539;	financial
SELECT EXTRACT(YEAR FROM c.birth_date) AS birth_year FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.account_id = 130;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN trans t ON a.account_id = t.account_id WHERE a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT SUM(l.amount) AS total_amount_of_debt, SUM(l.payments) AS total_payments FROM loan l WHERE l.account_id IN (SELECT d.account_id FROM disp d WHERE d.client_id = 992);	financial
SELECT SUM(t.amount) AS total_amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.client_id = c.client_id WHERE t.trans_id = 851 AND c.client_id = 4;	financial
SELECT c.type FROM client cl JOIN disp d ON cl.client_id = d.client_id JOIN card c ON d.account_id = c.card_id WHERE cl.client_id = 9;	financial
SELECT SUM(t.amount) AS total_amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.client_id = c.client_id WHERE c.client_id = 617 AND EXTRACT(YEAR FROM t.date) = 1998;	financial
SELECT c.client_id FROM client c JOIN account a ON c.district_id = a.district_id WHERE EXTRACT(YEAR FROM c.birth_date) BETWEEN 1983 AND 1987 AND a.frequency = 'East Bohemia';	financial
WITH ranked_loans AS (SELECT c.client_id, l.amount FROM client c JOIN account a ON c.client_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC) SELECT rl.client_id FROM ranked_loans rl LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'M' AND EXTRACT(YEAR FROM c.birth_date) BETWEEN 1974 AND 1976 AND l.amount > 4000;	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 ilike '%Beroun%' AND EXTRACT(YEAR FROM a.date) > 1996;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.account_id JOIN card cd ON a.account_id = cd.disp_id WHERE LOWER(c.gender) = 'f' AND cd.type = 'credit';	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender = 'F' THEN c.client_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.account_id), 0) * 100 AS proportion FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 LIKE '%Prague%';	financial
SELECT (COUNT(DISTINCT CASE WHEN c.gender = 'M' THEN a.account_id END)::FLOAT / NULLIF((SELECT COUNT(DISTINCT account_id) FROM account WHERE frequency = 'POPLATEK TYDNE'), 0)) * 100 AS percentage_of_male_clients FROM account a JOIN client c ON a.account_id = c.client_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT a.account_id, a.date FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date > (CURRENT_DATE - interval '24 months') AND a.date < '1997-01-01' ORDER BY l.amount ASC NULLS LAST LIMIT 1;	financial
SELECT a.account_id FROM client c JOIN account a ON c.client_id = a.client_id WHERE c.gender = 'F' ORDER BY c.birth_date ASC, a.A11 ASC LIMIT 1;	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE EXTRACT(YEAR FROM c.birth_date) = 1920 AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(*) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.duration = 24;	financial
SELECT AVG(l.amount) AS average_loan_amount FROM loan l JOIN trans t ON l.account_id = t.account_id WHERE l.status = 'C' AND t.operation = 'POPLATEK PO OBRATU';	financial
SELECT c.client_id, d.A2 AS district FROM client c JOIN account a ON c.client_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'permanent' OR a.date IS NOT NULL;	financial
SELECT c.client_id, EXTRACT(YEAR FROM age(CURRENT_DATE, c.birth_date)) AS age FROM client c JOIN account a ON c.client_id = a.account_id JOIN card d ON a.account_id = d.card_id WHERE d.type = 'gold' AND a.frequency = 'credit';	financial
SELECT b.bond_type, COUNT(*) AS bond_count FROM bond b GROUP BY b.bond_type ORDER BY bond_count DESC LIMIT 1;	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'cl' AND m.label = '-';	toxicology
SELECT AVG(COUNT) AS average_oxygen_count FROM (SELECT COUNT(*) AS COUNT FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'O' AND b.bond_type = '-' GROUP BY a.molecule_id) AS subquery;	toxicology
SELECT AVG(DIVIDE(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END), COUNT(a.atom_id))) AS average_single_bonded_carcinogenic_molecules FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-';	toxicology
SELECT DISTINCT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT CAST(SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM connected c JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'double-bond';	toxicology
SELECT COUNT(*) AS triple_bonds FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) AS number_of_atoms FROM atom WHERE atom.element!= 'br';	toxicology
SELECT COUNT(*) AS carcinogenic_count FROM molecule m WHERE m.label = '+' AND m.molecule_id BETWEEN 'TR000' AND 'TR099';	toxicology
SELECT DISTINCT a.atom_id FROM atom a WHERE a.element ='si';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'double';	toxicology
SELECT m.label, COUNT(*) AS count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'H' GROUP BY m.label ORDER BY count DESC NULLS LAST LIMIT 1;	toxicology
SELECT b.bond_type FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.element = 'te';	toxicology
SELECT a.atom_id, a2.atom_id AS connected_atom FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE m.label = '-';	toxicology
WITH element_counts AS (SELECT a.element, COUNT(*) AS count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY a.element), least_common AS (SELECT element, count FROM element_counts ORDER BY count ASC LIMIT 1) SELECT element FROM least_common;	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20';	toxicology
SELECT DISTINCT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element!='sn' AND m.label IN ('+', '-');	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('i','s') AND b.bond_type = '-';	toxicology
SELECT a1.atom_id, a2.atom_id AS connected_atom_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR181';	toxicology
SELECT CAST(COUNT(CASE WHEN a.element = 'f' THEN 1 END) AS FLOAT) / NULLIF(COUNT(a.molecule_id), 0) AS percent FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT DIVIDE(SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END), COUNT(b.bond_id)) AS percent FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT a.element FROM atom a WHERE a.molecule_id = 'TR000' GROUP BY a.element ORDER BY a.element NULLS LAST LIMIT 3;	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_6' AND a.molecule_id = 'TR001';	toxicology
SELECT SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN m.label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule m;	toxicology
SELECT c.atom_id FROM connected c WHERE c.bond_id = 'TR_000_2_5';	toxicology
SELECT b.bond_id FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.atom_id = 'TR000_2' AND c.atom_id2 = a.atom_id;	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = 'double bond' ORDER BY m.label ASC LIMIT 5;	toxicology
SELECT DIVIDE(SUM(CASE WHEN b.bond_type = 'double' THEN 1 ELSE 0 END), COUNT(b.bond_id)) AS percent FROM bond b WHERE b.molecule_id = 'TR008';	toxicology
SELECT DIVIDE(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END), COUNT(molecule_id)) AS percent FROM molecule;	toxicology
SELECT DIVIDE(SUM(CASE WHEN a.element = 'H' THEN 1 ELSE 0 END), COUNT(a.atom_id)) AS percent FROM atom a WHERE a.molecule_id = 'TR206';	toxicology
SELECT b.bond_type FROM bond b WHERE b.molecule_id = 'TR000';	toxicology
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR060';	toxicology
SELECT b.bond_type, COUNT(*) AS bond_count, CASE WHEN m.label = '+' THEN TRUE ELSE FALSE END AS is_carcinogenic FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR018' GROUP BY b.bond_type ORDER BY bond_count DESC LIMIT 1;	toxicology
SELECT m.label FROM molecule m JOIN atom a1 ON m.molecule_id = a1.molecule_id JOIN atom a2 ON a1.molecule_id = a2.molecule_id JOIN connected c ON (a1.atom_id = c.atom_id AND a2.atom_id = c.atom_id2) JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-' AND m.label!= '-' GROUP BY m.label ORDER BY m.label LIMIT 3;	toxicology
SELECT b.bond_type FROM bond b WHERE b.molecule_id = 'TR006' ORDER BY b.bond_type NULLS LAST LIMIT 2;	toxicology
SELECT COUNT(*) AS num_bonds FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.atom_id = 'TR009_12' OR c.atom_id2 = 'TR009_12';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'br' AND m.label = '+';	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_id = 'TR001_6_9';	toxicology
SELECT a.molecule_id, CASE WHEN m.label = '+' THEN 'carcinogenic' ELSE 'not carcinogenic' END AS carcinogenic FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT COUNT(c.bond_id) AS number_of_connections FROM connected c WHERE c.atom_id like 'TR%_19';	toxicology
SELECT a.element FROM atom a WHERE a.molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id LIKE '____21%' AND a.atom_id LIKE '____24%' AND m.label = '+' ORDER BY m.molecule_id NULLS LAST;	toxicology
SELECT DISTINCT b.bond_id FROM bond b JOIN atom a1 ON b.molecule_id = a1.molecule_id JOIN atom a2 ON b.molecule_id = a2.molecule_id WHERE a1.element = 'p' AND a2.element = 'n';	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = 'double' ORDER BY m.label DESC NULLS LAST LIMIT 1;	toxicology
SELECT AVG(COUNT(b.bond_id)::FLOAT / NULLIF(COUNT(c.atom_id), 0)) AS avg_bonds_per_atom FROM atom a LEFT JOIN connected c ON a.atom_id = c.atom_id LEFT JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'i';	toxicology
SELECT b.bond_type, b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.atom_id = (SELECT atom_id FROM atom WHERE atom_id = 'atom_' || CAST(45 AS TEXT)) || CAST(45 AS TEXT);	toxicology
SELECT DISTINCT a.element FROM atom a WHERE a.atom_id NOT IN (SELECT c.atom_id FROM connected c);	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR144_8_19';	toxicology
SELECT b.molecule_id, COUNT(*) AS num_double_bonds FROM bond b WHERE b.bond_type = 'double' GROUP BY b.molecule_id ORDER BY num_double_bonds DESC LIMIT 1; SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'double' AND m.label = '+' ORDER BY b.molecule_id NULLS LAST LIMIT 1;	toxicology
WITH element_counts AS (SELECT a.element, COUNT(*) AS COUNT FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.element) SELECT element FROM element_counts ORDER BY COUNT ASC NULLS LAST LIMIT 1;	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a.element = 'pb';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT CAST(COUNT(DISTINCT b.bond_id) AS FLOAT) / NULLIF(COUNT(DISTINCT a.atom_id), 0) AS ratio FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id GROUP BY a.element ORDER BY ratio DESC LIMIT 1;	toxicology
SELECT DIVIDE(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END), COUNT(b.bond_id)) AS proportion FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT SUM(CASE WHEN a.element = 'C' THEN 1 ELSE 0 END) AS carbon_atoms, SUM(CASE WHEN a.element = 'H' THEN 1 ELSE 0 END) AS hydrogen_atoms FROM atom a;	toxicology
SELECT c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element ='s';	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element ='sn';	toxicology
SELECT COUNT(DISTINCT a.element) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'p' OR a.element = 'br' AND b.bond_type = '#';	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT DIVIDE(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END), COUNT(a.atom_id)) AS percent FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT m.label FROM molecule m WHERE m.molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT m.molecule_id FROM molecule m WHERE m.label = '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS total_carcinogenic_molecules FROM molecule m WHERE m.label = '+' AND m.molecule_id >= 'TR000' AND m.molecule_id <= 'TR030';	toxicology
SELECT b.bond_type FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id BETWEEN 'TR000' AND 'TR050' ORDER BY m.molecule_id NULLS LAST;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT b.bond_id) FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 'i';	toxicology
SELECT MAX(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic, MAX(CASE WHEN m.label = '-' THEN 1 ELSE 0 END) AS non_carcinogenic FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca';	toxicology
SELECT b.bond_id FROM bond b JOIN atom a1 ON b.molecule_id = a1.molecule_id JOIN atom a2 ON b.bond_id = a2.bond_id WHERE a1.element = 'cl' AND a2.element = 'c' AND b.bond_id = 'TR001_1_8';	toxicology
SELECT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'C' AND b.bond_type = '#' AND m.label = '-' LIMIT 2;	toxicology
SELECT DIVIDE(SUM(CASE WHEN a.element = 'Cl' THEN 1 ELSE 0 END), COUNT(*)) AS percentage FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON c.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT a.element FROM atom a WHERE a.molecule_id = 'TR001';	toxicology
SELECT DISTINCT m.molecule_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = 'double';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR005_16_26';	toxicology
SELECT COUNT(*) FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT b.bond_id, m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id, a.element, m.label FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT COUNT(*) FROM (SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE c.atom_id2 = a.atom_id AND m.label = '+' AND (SELECT COUNT(*) FROM atom b WHERE b.molecule_id = m.molecule_id AND b.atom_id < a.atom_id) = 3 AND a.atom_id not ilike '%sn%' AND a.element not ilike '%pb%' AND a.element not ilike '%te%' AND a.element not ilike '%br%' AND a.element not ilike '%f%' AND a.element not ilike '%i%' AND a.element not ilike '%na%' AND a.element not ilike '%cl%' AND a.element not ilike '%o%' AND a.element not ilike '%h%' AND a.element not ilike '%n%' AND a.element not ilike '%p%' AND a.element not ilike '%ca%' AND a.element not ilike '%s%' AND a.element not ilike '%c%') AS element_count;	toxicology
SELECT (COUNT(CASE WHEN a.element = 'H' THEN 1 END) * 1.0 / NULLIF(COUNT(a.element), 0)) AS ratio, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR006' GROUP BY m.label;	toxicology
SELECT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca' AND m.label = '+';	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a.element = 'te' AND a2.element = 'te';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN connected c2 ON a.atom_id = c2.atom_id JOIN bond b ON c.bond_id = b.bond_id AND c2.bond_id = b.bond_id WHERE b.bond_id = 'TR001_10_11' AND c.atom_id < c2.atom_id;	toxicology
SELECT CAST(COUNT(CASE WHEN b.bond_type = '#' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS fraction_of_triple_bonds FROM bond b;	toxicology
SELECT DIVIDE(SUM(CASE WHEN b.bond_type ='='THEN 1 ELSE 0 END), COUNT(*)) AS percent FROM bond b WHERE b.molecule_id = 'TR047';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_1' AND m.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m WHERE m.label = '+';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR151' AND a.element IN ('As', 'Pb', 'Hg', 'Cd', 'Se', 'Te');	toxicology
SELECT COUNT(*) FROM molecule m WHERE m.label = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.molecule_id BETWEEN 'TR010' AND 'TR050';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT DISTINCT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND b.bond_type = 'double bond';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'H' AND m.label = '+';	toxicology
SELECT m.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a.element = 'TR00_1' AND b.bond_type = 'TR00_1_2';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label!= '-';	toxicology
SELECT (COUNT(CASE WHEN a.element = 'H' AND m.label = '+' THEN 1 END) * 1.0 / NULLIF(COUNT(a.element = 'H'), 0)) * 100 AS percentage FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'H';	toxicology
SELECT m.molecule_id FROM molecule m WHERE m.label = '+';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR186';	toxicology
SELECT b.bond_type FROM bond b WHERE b.molecule_id = 'TR007_4_19';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) AS double_bonds, m.label AS is_carcinogenic FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON m.molecule_id = b.molecule_id WHERE b.bond_type = 'double' AND m.molecule_id = 'TR006';	toxicology
SELECT a.molecule_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT b.bond_id, a.atom_id, a2.atom_id AS atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(b.bond_id) FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 'Cl';	toxicology
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id;	toxicology
SELECT COUNT(DISTINCT b.molecule_id) AS number_of_molecules, COUNT(DISTINCT m.molecule_id) AS number_of_carcinogenic_molecules FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = 'double bond' AND m.label = '+' GROUP BY b.molecule_id, m.molecule_id;	toxicology
SELECT COUNT(*) FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.element!= 'S' AND b.bond_type!= 'double';	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_2_4' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM atom a WHERE a.molecule_id = 'TR005';	toxicology
SELECT COUNT(*) AS single_bonds_count FROM bond b WHERE b.bond_type = '-';	toxicology
SELECT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element ilike '%cl%' AND m.label = '+' ORDER BY m.molecule_id NULLS LAST;	toxicology
SELECT DISTINCT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'C' AND m.label!= '-';	toxicology
SELECT DIVIDE(SUM(CASE WHEN a.label = '+' AND a.element = 'Cl' THEN 1 ELSE 0 END), COUNT(DISTINCT a.molecule_id)) AS percentage FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT b.molecule_id FROM bond b WHERE b.bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element) FROM connected c JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2';	toxicology
SELECT a.element, b.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom b ON c.atom_id2 = b.atom_id WHERE a.atom_id = 'TR000_2' AND b.atom_id = 'TR000_4';	toxicology
SELECT a.element FROM atom a WHERE a.atom_id = 'TR000_1';	toxicology
SELECT m.label FROM molecule m WHERE m.molecule_id = 'TR000';	toxicology
SELECT DIVIDE(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END), COUNT(b.bond_id)) AS percentage FROM bond b;	toxicology
SELECT COUNT(DISTINCT a.molecule_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT DISTINCT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element ='s' AND b.bond_type = 'double';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id GROUP BY m.molecule_id HAVING COUNT(a.molecule_id) > 5 AND m.label = '-' ORDER BY m.molecule_id NULLS LAST;	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024';	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS num_atoms FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY num_atoms DESC LIMIT 1;	toxicology
SELECT (COUNT(DISTINCT CASE WHEN a.element = 'h' AND b.bond_type = '#' THEN m.molecule_id END) * 100.0 / NULLIF(COUNT(DISTINCT m.molecule_id), 0)) AS percentage FROM atom a JOIN bond b ON a.atom_id = b.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(*) FROM bond b WHERE b.bond_type = '-' AND b.molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'C' AND m.molecule_id = 'TR008';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label = '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN connected c ON a.atom_id = c.atom_id AND a.atom_id2 = c.atom_id2 WHERE a.element = 'O' AND b.bond_type = 'double';	toxicology
SELECT COUNT(*) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR016';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'C' AND b.bond_type = '=='; SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR012'; SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'C' AND b.bond_type = '=='; SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'C' AND b.bond_type = '=='; SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'C' AND b.bond_type = '=='; SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'C' AND b.bond_type = '=='; SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'C' AND b.bond_type = '=='; SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'C' AND b.bond_type = '=='; SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'C' AND b.bond_type = '=='; SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'C' AND b.bond_type = '=='; SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'C' AND b.bond_type = '=='; SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'o' AND m.label = '+' ORDER BY a.atom_id NULLS LAST;	toxicology
SELECT c.name, c.uuid FROM cards c WHERE c.cardKingdomFoilId = c.cardKingdomId AND c.cardKingdomId IS NOT NULL;	card_games
SELECT c.name FROM cards c WHERE c.borderColor = 'borderless' AND c.cardKingdomFoilId IS NULL AND c.cardKingdomId IS NOT NULL;	card_games
SELECT c.name FROM cards c WHERE c.faceConvertedManaCost = (SELECT MAX(c2.faceConvertedManaCost) FROM cards c2);	card_games
SELECT c.name FROM cards c WHERE c.edhrecRank < 100 AND c.frameVersion = '2015';	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity ='mythic' AND l.status = 'Banned' AND l.format = 'gladiator';	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.type = 'Artifact' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'commander' AND l.status = 'Legal' AND c.power = '*';	card_games
SELECT c.name, r.text FROM cards c JOIN artist Stephen Daniele ON c.artist = 'Stephen Daniele' JOIN legalities l ON c.uuid = l.uuid JOIN rulings r ON c.uuid = r.uuid WHERE c.hasContentWarning = 1 ORDER BY c.name NULLS LAST;	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name ilike '%Sublime Epiphany%' AND c.number ilike '%74s%';	card_games
SELECT c.name, c.artist, c.isPromo, COUNT(r.uuid) AS ruling_count FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid GROUP BY c.name, c.artist, c.isPromo ORDER BY ruling_count DESC LIMIT 1;	card_games
SELECT f.language FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE c.name ilike '%Annul%' AND c.number ilike '%29';	card_games
SELECT c.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'Japanese';	card_games
SELECT (SUM(CASE WHEN f.language = 'Chinese Simplified' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(f.id), 0)) AS percentage FROM foreign_data f;	card_games
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT c.type) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Aaron Boyd';	card_games
SELECT c.keywords FROM cards c WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards c WHERE c.power = '*';	card_games
SELECT c.promoTypes FROM cards c WHERE c.name = 'Duress';	card_games
SELECT c.borderColor FROM cards c WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT c.originalType FROM cards c WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT s.setCode, f.language FROM cards c JOIN sets s ON c.setCode = s.code JOIN foreign_data f ON c.uuid = f.uuid WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(DISTINCT l.uuid) FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status ='restricted' AND c.isTextless = 0;	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE LOWER(c.name) = 'condemn';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status ='restricted' AND c.isStarter = 1;	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Cloudchaser Eagle';	card_games
SELECT c.type FROM cards c WHERE c.name = 'Benalish Knight';	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Benalish Knight';	card_games
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Phyrexian';	card_games
SELECT (COUNT(CASE WHEN c.borderColor = 'borderless' THEN 1 END) * 100.0 / NULLIF(COUNT(c.id), 0)) AS percentage FROM cards c;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE LOWER(f.language) = 'de' AND c.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE LOWER(fd.language) = 'russian' AND c.borderColor = 'borderless';	card_games
SELECT (COUNT(DISTINCT c.uuid) filter (WHERE c.language = 'French' AND c.isStorySpotlight = 1)::FLOAT / NULLIF(COUNT(DISTINCT c.uuid) filter (WHERE c.isStorySpotlight = 1), 0)) * 100 AS percentage FROM cards c WHERE c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards c WHERE c.toughness = '99';	card_games
SELECT c.name FROM cards c WHERE c.artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards c WHERE c.borderColor = 'black' AND c.availability ='mtgo';	card_games
SELECT c.uuid FROM cards c WHERE c.convertedManaCost = 0;	card_games
SELECT c.layout FROM cards c WHERE c.keywords LIKE '%flying%';	card_games
SELECT COUNT(*) FROM cards c WHERE c.subtypes!= 'Angel' AND c.subtypes IS NOT NULL AND c.originalType = 'Summon - Angel';	card_games
SELECT c.cardKingdomFoilId, c.cardKingdomId FROM cards c WHERE c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL;	card_games
SELECT c.id FROM cards c WHERE c.duelDeck = 'a';	card_games
SELECT c.edhrecRank FROM cards c WHERE c.frameVersion = '2015';	card_games
SELECT c.artist FROM cards c WHERE c.colorIdentity = 'zh' ORDER BY c.artist NULLS LAST;	card_games
SELECT c.name, c.uuid FROM cards c WHERE c.availability = 'paper' AND c.language = 'Japanese';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'Banned' AND c.borderColor = 'white';	card_games
SELECT c.uuid, f.language FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.type = 'legacy';	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT COUNT(c.id) AS future_frame_cards, l.status AS legality_status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'legal';	card_games
SELECT c.name, c.colors FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW';	card_games
SELECT c.name, st.translation, st.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN set_translations st ON c.uuid = st.id WHERE c.convertedManaCost = 5 AND st.setCode = '10E';	card_games
SELECT c.name, c.originalType, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT c.colors, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20;	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language!= 'en';	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards c JOIN artist a ON c.artist = a.name WHERE a.name = 'John Avon' AND c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomFoilId!= '';	card_games
SELECT COUNT(*) AS white_powerful_cards_count FROM cards c WHERE LOWER(c.borderColor) = 'white' AND (LOWER(c.cardKingdomFoilId) = LOWER(c.cardKingdomId) AND c.cardKingdomId IS NOT NULL);	card_games
SELECT COUNT(*) FROM cards c WHERE c.artist = 'UDON' AND c.availability ='mtgo' AND c.hand = '-1';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT c.manaCost FROM cards c WHERE c.layout = 'normal' AND c.frameVersion = '2003' AND c.borderColor = 'black' AND c.availability IN ('paper','mtgo');	card_games
SELECT SUM(CAST(card.manaCost AS REAL)) AS total_unconverted_mana_cost FROM cards card WHERE LOWER(card.artist) = 'rob alexander';	card_games
SELECT DISTINCT t FROM cards c WHERE c.availability = 'arena';	card_games
SELECT s.setCode FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE LOWER(st.language) = 'es';	card_games
SELECT CAST(COUNT(CASE WHEN hand = '+3' THEN 1 END) AS FLOAT) / NULLIF(COUNT(id), 0) AS percentage FROM cards WHERE frameEffects = 'legendary';	card_games
SELECT c.uuid, COUNT(c.uuid) AS card_count FROM cards c WHERE c.isStorySpotlight = 1 AND c.isTextless = 0 GROUP BY c.uuid ORDER BY card_count DESC NULLS LAST;	card_games
SELECT c.name, (COUNT(DISTINCT c.uuid) * 100.0 / NULLIF((SELECT COUNT(DISTINCT uuid) FROM foreign_data), 0)) AS percentage FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE f.language = 'Spanish' GROUP BY c.name;	card_games
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 309 ORDER BY st.language;	card_games
SELECT COUNT(*) FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Portuguese (Brasil)' AND s.block = 'Commander';	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.type = 'Creature' AND l.status = 'legal';	card_games
SELECT c.type FROM cards c WHERE c.uuid IN (SELECT f.uuid FROM foreign_data f WHERE f.language = 'de') AND c.subtypes IS NOT NULL AND c.supertypes IS NOT NULL UNION SELECT c.type FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'Legal' AND c.subtypes IS NOT NULL AND c.supertypes IS NOT NULL;	card_games
SELECT COUNT(*) AS number_of_cards FROM cards WHERE power IS NULL OR power = '*';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE LOWER(l.status) = 'legal' AND c.side IS NULL AND c.flavorText ilike '%This is a triggered mana ability%';	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.status = 'legal' AND c.availability = 'paper';	card_games
SELECT c.artist FROM cards c WHERE c.text = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.borderColor = 'black' AND c.artist = 'Matthew D. Wilson' AND c.layout = 'normal' AND f.language = 'French' AND c.type = 'Creature';	card_games
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2009-01-10';	card_games
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.totalSetSize = 180;	card_games
SELECT CAST(COUNT(CASE WHEN hasContentWarning = 0 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE format = 'commander' AND status = 'legal';	card_games
SELECT DIVIDE(COUNT(CASE WHEN c.language = 'French' AND (c.power IS NULL OR c.power = '*') THEN 1 END), COUNT(CASE WHEN (c.power IS NULL OR c.power = '*') THEN 1 END))*100 AS percentage FROM cards c WHERE (c.power IS NULL OR c.power = '*');	card_games
SELECT (COUNT(CASE WHEN s.type = 'expansion' AND s.language = 'Japanese' THEN 1 END)::FLOAT / NULLIF(COUNT(CASE WHEN s.language = 'Japanese' THEN 1 END), 0)) * 100 AS percentage FROM sets s WHERE s.language = 'Japanese';	card_games
SELECT c.availability FROM cards c WHERE c.artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards c WHERE c.borderColor = 'borderless' AND c.edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards c WHERE c.isOversized = 1 AND c.isReprint = 1 AND c.isPromo = 1;	card_games
SELECT c.name, c.power FROM cards c WHERE c.power IS NULL OR c.power = '*' AND c.promoTypes = 'arenaleague' ORDER BY c.name ASC LIMIT 3;	card_games
SELECT f.language FROM foreign_data f WHERE f.multiverseid = 149934;	card_games
SELECT c.cardKingdomFoilId, c.cardKingdomId FROM cards c WHERE c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL ORDER BY c.cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT (COUNT(CASE WHEN c.isTextless = 1 AND c.layout = 'normal' THEN 1 END)::FLOAT / NULLIF(COUNT(*), 0)) * 100 AS proportion FROM cards c;	card_games
SELECT c.number FROM cards c WHERE c.subtypes ilike '%Angel%' AND c.subtypes ilike '%Wizard%' AND c.faceName IS NULL;	card_games
SELECT s.name FROM sets s WHERE s.mtgoCode IS NULL OR s.mtgoCode = '' ORDER BY s.name ASC LIMIT 3;	card_games
SELECT DISTINCT language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.mcmName = 'Archenemy' AND s.setCode = 'ARC';	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5;	card_games
SELECT s.name AS set_name, st.language AS language, s.type AS set_type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206;	card_games
SELECT s.name, s.id FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT s.id FROM sets s WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND s.mtgoCode ILIKE '%Japanese%';	card_games
SELECT s.code FROM sets s WHERE s.type ='set' AND s.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT DIVIDE(COUNT(CASE WHEN c.isOnlineOnly = 1 THEN 1 END), COUNT(*)) * 100 AS percentage FROM cards c WHERE c.language = 'Chinese Simplified';	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s WHERE s.mtgoCode IS NULL OR s.mtgoCode = '' AND s.name ILIKE '%Japanese%';	card_games
SELECT c.id FROM cards c WHERE c.borderColor = 'black';	card_games
SELECT c.id FROM cards c WHERE c.frameEffects = 'extendedart';	card_games
SELECT c.name FROM cards c WHERE c.borderColor = 'black' AND c.isFullArt = 1 ORDER BY c.name NULLS LAST;	card_games
SELECT s.translation FROM set_translations s WHERE s.set_code = '174';	card_games
SELECT s.name FROM sets s WHERE s.code = 'ALL';	card_games
SELECT f.language FROM foreign_data f WHERE f.name = 'A Pedra Fellwar';	card_games
SELECT s.code FROM sets s WHERE s.releaseDate = '2007-07-13';	card_games
SELECT s.baseSetSize, s.code FROM sets s WHERE s.block = 'Masques' AND s.block = 'Mirage';	card_games
SELECT s.setCode FROM sets s WHERE s.type = 'expansion';	card_games
SELECT f.name, f.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark ilike '%Boros%';	card_games
SELECT f.language, f.flavorText, c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'colorpie';	card_games
SELECT (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END)::FLOAT / NULLIF(COUNT(*), 0)) * 100 AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Abyssal Horror';	card_games
SELECT s.setCode FROM sets s WHERE s.type = 'Expansion' AND s.setCode IN (SELECT s.setCode FROM sets s WHERE s.type = 'Commander');	card_games
SELECT f.name, f.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'abzan';	card_games
SELECT f.language, f.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Azorius';	card_games
SELECT COUNT(*) FROM cards c WHERE c.artist = 'Aaron Miller' AND c.cardKingdomFoilId = c.cardKingdomId AND c.cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards c WHERE c.hand ilike '%paper%' AND c.hand like '+%';	card_games
SELECT c.name FROM cards c WHERE c.isTextless = 0;	card_games
SELECT c.convertedManaCost FROM cards c WHERE c.name = 'Ancestor`s Chosen';	card_games
SELECT COUNT(*) FROM cards c WHERE c.power = '*' OR c.power IS NULL AND c.borderColor = 'white';	card_games
SELECT c.name FROM cards c WHERE c.isPromo = 1 AND c.side IS NOT NULL;	card_games
SELECT c.subtypes, c.supertypes FROM cards c WHERE c.name = 'Molimo, Maro-Sorcerer';	card_games
SELECT DISTINCT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT c.artist) FROM cards c WHERE c.borderColor = 'black' AND (c.availability LIKE '%arena,mtgo%' OR c.availability LIKE '%mtgo,arena%');	card_games
SELECT c.name, c.convertedManaCost FROM cards c WHERE c.name IN ('Serra Angel', 'Shrine Keeper') ORDER BY c.convertedManaCost DESC;	card_games
SELECT c.artist FROM cards c WHERE c.flavorName = 'Battra, Dark Destroyer';	card_games
SELECT c.name, c.convertedManaCost FROM cards c WHERE c.frameVersion = '2003' ORDER BY c.convertedManaCost DESC NULLS LAST LIMIT 3;	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.code IN (SELECT c.setCode FROM cards c WHERE c.name = 'Ancestor''s Chosen') AND st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT s.id) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Angel of Mercy';	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON l.uuid = s.id WHERE s.code = 'Hauptset Zehnte Edition';	card_games
SELECT c.uuid FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name ilike '%Ancestor''s Chosen%' AND fd.language = 'Korean';	card_games
SELECT COUNT(*) FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE LOWER(st.translation) = 'hauptset zehnte edition' AND LOWER(c.artist) = 'adam rex';	card_games
SELECT s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE LOWER(s.name) = 'eighth edition' AND LOWER(st.language) ='simplified chinese';	card_games
SELECT c.uuid FROM cards c WHERE c.name = 'Angel of Mercy' AND c.mtgoCode IS NOT NULL;	card_games
SELECT s.releaseDate FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Ancestor''s Chosen';	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation ilike '%Hauptset Zehnte Edition%';	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE LOWER(st.language) = 'italian' AND LOWER(s.block) = 'ice age';	card_games
SELECT c.uuid FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name ilike '%Adarkar Valkyrie%' AND s.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND st.translation IS NOT NULL AND s.baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards c WHERE c.name = 'Coldsnap' AND c.borderColor = 'black';	card_games
SELECT c.name, c.convertedManaCost FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT c.artist FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.artist IN ('Jeremy Jarvis', 'Aaron Miller','Chippy');	card_games
SELECT c.uuid FROM cards c JOIN sets s ON c.setCode = s.code WHERE LOWER(s.name) = 'coldsnap' AND c.number = '4';	card_games
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.convertedManaCost > 5 AND (c.power = '*' OR c.power IS NULL) AND s.name = 'Coldsnap';	card_games
SELECT f.flavorText FROM foreign_data f WHERE f.name = 'Ancestor''s Chosen' AND f.language = 'Italian';	card_games
SELECT f.language FROM foreign_data f WHERE f.name = 'Ancestor''s Chosen' AND f.flavorText IS NOT NULL;	card_games
SELECT f.text FROM foreign_data f WHERE f.name = 'Ancestor''s Chosen' AND f.language = 'German';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.name = 'Coldsnap';	card_games
SELECT c.name, c.italian_name FROM cards c JOIN set_translations st ON c.name = st.translation WHERE c.set_code = 'Coldsnap' AND st.language = 'Italian' ORDER BY c.converted_mana_cost DESC NULLS LAST LIMIT 1;	card_games
SELECT r.date FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Reminisce';	card_games
SELECT (SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END)::FLOAT / NULLIF(SUM(c.convertedManaCost), 0)) * 100 AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT (SUM(CASE WHEN c.cardKingdomFoilId = c.cardKingdomId AND c.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) * 1.0 / NULLIF((SELECT COUNT(*) FROM cards c2 WHERE c2.name = 'Coldsnap'), 0)) * 100 AS percentage FROM cards c WHERE c.name = 'Coldsnap';	card_games
SELECT s.code FROM sets s WHERE s.releaseDate = '2017-07-14';	card_games
SELECT s.keyruneCode FROM sets s WHERE s.code = 'PKHC';	card_games
SELECT s.mcmId FROM sets s WHERE s.code = 'SS2';	card_games
SELECT s.mcmName FROM sets s WHERE s.releaseDate = '2017-06-09';	card_games
SELECT s.type FROM sets s WHERE s.name ilike '%From the Vault: Lore%' LIMIT 1;	card_games
SELECT s.code FROM sets s WHERE s.name = 'Commander 2014 Oversized';	card_games
SELECT c.uuid, r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' AND r.text IS NOT NULL AND (c.hasContentWarning = 1 OR c.hasContentWarning IS NULL);	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation';	card_games
SELECT s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE LOWER(st.translation) = 'rinascita di alara';	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Huitième édition';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'French' AND st.translation ilike '%Tendo%Ice%Bridge%';	card_games
SELECT COUNT(*) FROM set_translations st WHERE st.translation IS NOT NULL AND st.setCode = 'Salvat 2011';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese' AND s.name IN (SELECT c.name FROM cards c WHERE c.name = 'Fellwar Stone');	card_games
SELECT c.name, c.convertedManaCost FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero''s Path' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT s.releaseDate FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE LOWER(st.translation) = 'ola de frío';	card_games
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE LOWER(s.name) = 'world championship decks 2004' AND c.convertedManaCost = 3;	card_games
SELECT st.translation FROM set_translations st WHERE LOWER(st.setCode) ='mirrodin' AND LOWER(st.language) = 'chinese simplified';	card_games
SELECT (SUM(CASE WHEN s.language = 'Japanese' THEN s.isNonFoilOnly ELSE 0 END) * 100.0 / NULLIF(SUM(CASE WHEN s.language = 'Japanese' THEN 1 ELSE 0 END), 0)) AS percentage FROM sets s WHERE s.language = 'Japanese';	card_games
SELECT (SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0 / NULLIF(SUM(CASE WHEN s.language = 'Portuguese (Brazil)' THEN 1 ELSE 0 END), 0)) AS percentage FROM cards c JOIN set_translations st ON c.uuid = st.id WHERE st.language = 'Portuguese (Brazil)';	card_games
SELECT c.availability FROM cards c WHERE c.isTextless = 1 AND c.artist = 'Aleksi Briclot';	card_games
SELECT s.id FROM sets s WHERE s.baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
WITH card_info AS (SELECT c.uuid, c.artist, c.faceName, c.convertedManaCost, row_number() OVER (PARTITION BY c.uuid ORDER BY c.faceName IS NULL) AS face_rank FROM cards c WHERE c.faceName IS NOT NULL) SELECT ci.artist FROM card_info ci WHERE ci.face_rank = 1 ORDER BY ci.convertedManaCost DESC LIMIT 1;	card_games
SELECT MAX(c.frameEffects) AS most_common_frame_effects FROM cards c WHERE c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards c WHERE c.power IS NULL OR c.power = '*' AND c.hasFoil = 0 AND c.duelDeck = 'a';	card_games
SELECT s.id FROM sets s WHERE s.type = 'commander' ORDER BY s.totalSetSize DESC LIMIT 1;	card_games
SELECT c.name, MAX(c.manaCost) AS max_mana_cost FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' GROUP BY c.name ORDER BY max_mana_cost DESC LIMIT 10;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity ='mythic' AND l.status = 'legal' ORDER BY c.originalReleaseDate ASC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baga' AND fd.language = 'French';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types = 'Enchantment' AND c.name = 'Abundance' AND l.status = 'Legal';	card_games
SELECT l.uuid, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'banned' ORDER BY COUNT(l.status) DESC LIMIT 1;	card_games
SELECT s.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Battlebond';	card_games
SELECT c.artist, c.type FROM cards c GROUP BY c.artist, c.type ORDER BY COUNT(c.uuid) ASC LIMIT 1;	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND c.hasContentWarning = 1 AND l.format = 'legacy';	card_games
SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'banned';	card_games
SELECT AVG(s.id) AS average_set_id, MAX(COUNT(l.language)) AS common_language FROM sets s JOIN set_translations l ON s.code = l.setCode WHERE s.releaseDate BETWEEN '2012-01-01' AND '2015-12-31';	card_games
SELECT DISTINCT c.artist FROM cards c WHERE c.borderColor = 'black' AND c.availability = 'arena';	card_games
SELECT c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'oldschool' AND l.status IN ('banned','restricted');	card_games
SELECT COUNT(*) FROM cards c WHERE c.artist = 'Matthew D. Wilson' AND c.availability = 'paper';	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Kev Walker' ORDER BY MAX(r.date) DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.setCode = 'HOU';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language not like '%Japanese%' AND st.language = 'Korean';	card_games
SELECT DISTINCT frameVersion, artist FROM cards WHERE artist = 'Allen Williams' ORDER BY frameVersion; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen Williams' INTERSECT SELECT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen Williams' EXCEPT SELECT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen Williams'; SELECT DISTINCT frameVersion FROM cards WHERE artist = 'Allen Williams'; SELECT DISTINCT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen Williams' INTERSECT SELECT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen Williams' EXCEPT SELECT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen Williams'; SELECT DISTINCT frameVersion FROM cards WHERE artist = 'Allen Williams'; SELECT DISTINCT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen Williams' INTERSECT SELECT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen Williams' EXCEPT SELECT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen Williams'; SELECT DISTINCT frameVersion FROM cards WHERE artist = 'Allen Williams'; SELECT DISTINCT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen Williams' INTERSECT SELECT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen Williams' EXCEPT SELECT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen Williams'; SELECT DISTINCT frameVersion FROM cards WHERE artist = 'Allen Williams'; SELECT DISTINCT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen Williams' INTERSECT SELECT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen Williams' EXCEPT SELECT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM legalities WHERE status = 'banned'; SELECT DISTINCT uuid FROM cards WHERE artist = 'Allen	card_games
SELECT u1.DisplayName, MAX(u1.Reputation) AS MaxReputation FROM users u1 JOIN users u2 ON u1.DisplayName = 'Harlan' AND u2.DisplayName = 'Jarrod Dixon' WHERE u1.Reputation > u2.Reputation GROUP BY u1.DisplayName;	codebase_community
SELECT u.DisplayName FROM users u WHERE EXTRACT(YEAR FROM u.CreationDate) = 2014 ORDER BY u.DisplayName NULLS LAST;	codebase_community
SELECT COUNT(*) FROM users u WHERE u.LastAccessDate > '2014-09-01 00:00:00';	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Views = (SELECT MAX(u2.Views) FROM users u2);	codebase_community
SELECT COUNT(*) FROM users u WHERE u.UpVotes > 100 AND u.DownVotes > 1;	codebase_community
SELECT COUNT(*) FROM users u WHERE u.Views > 10 AND EXTRACT(YEAR FROM u.CreationDate) > 2013;	codebase_community
SELECT COUNT(p.id) FROM posts p JOIN users u ON p.owneruserid = u.id WHERE LOWER(u.displayname) = 'csgillespie';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie';	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
WITH PostFavorites AS (SELECT p.Id, p.OwnerUserId, p.FavoriteCount FROM posts p ORDER BY p.FavoriteCount DESC) SELECT u.DisplayName FROM PostFavorites pf JOIN users u ON pf.OwnerUserId = u.Id LIMIT 1;	codebase_community
SELECT SUM(p.CommentCount) AS total_comments FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
WITH MaxAnswers AS (SELECT MAX(p.AnswerCount) AS MaxAnswerCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie') SELECT p.AnswerCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie' AND p.AnswerCount = (SELECT MaxAnswerCount FROM MaxAnswers);	codebase_community
SELECT p.LastEditorDisplayName FROM posts p WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.OwnerDisplayName = 'csgillespie' AND p.ParentId IS NULL;	codebase_community
SELECT DISTINCT p.OwnerDisplayName FROM posts p WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20;	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id WHERE LOWER(t.TagName) = 'bayesian';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(t2.Count) FROM tags t2);	codebase_community
SELECT COUNT(b.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges b WHERE b.name = 'csgillespie' AND EXTRACT(YEAR FROM b.date) = 2011;	codebase_community
WITH BadgeCounts AS (SELECT b.UserId, COUNT(b.Id) AS badge_count FROM badges b GROUP BY b.UserId) SELECT u.DisplayName FROM BadgeCounts bc JOIN users u ON bc.UserId = u.Id ORDER BY bc.badge_count DESC NULLS LAST LIMIT 1;	codebase_community
SELECT AVG(p.Score) AS average_score FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie';	codebase_community
SELECT CAST(COUNT(b.Id) AS FLOAT) / NULLIF(COUNT(DISTINCT u.DisplayName), 0) AS average_badges_per_user FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Views > 200;	codebase_community
SELECT (CAST(COUNT(DISTINCT p.Id FROM posts p WHERE p.Score > 20 AND p.OwnerUserId IN (SELECT u.Id FROM users u WHERE u.Age > 65)) AS FLOAT) / NULLIF(COUNT(DISTINCT p.Id FROM posts p WHERE p.Score > 20), 0)) * 100 AS percentage FROM posts p;	codebase_community
SELECT SUM(v.BountyAmount) FROM votes v WHERE v.UserId = 58 AND v.CreationDate = '2010-07-19';	codebase_community
SELECT v.creationdate FROM votes v WHERE v.creationdate = (SELECT MAX(v2.creationdate) FROM votes v2 GROUP BY v2.creationdate ORDER BY COUNT(v2.id) DESC LIMIT 1);	codebase_community
SELECT COUNT(b.Id) AS RevivalBadgesCount FROM badges b WHERE LOWER(b.Name) ='revival';	codebase_community
WITH MaxScoreComment AS (SELECT p.Id, MAX(c.Score) AS MaxScore FROM posts p JOIN comments c ON p.Id = c.PostId GROUP BY p.Id) SELECT p.Title FROM posts p JOIN MaxScoreComment msc ON p.Id = msc.Id ORDER BY msc.MaxScore DESC LIMIT 1;	codebase_community
SELECT COUNT(c.Id) FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910;	codebase_community
WITH CommentedPost AS (SELECT c.PostId FROM comments c WHERE c.UserId = 3025 AND c.CreationDate = '2014/4/23 20:29:39.0') SELECT p.FavoriteCount FROM posts p JOIN CommentedPost cp ON p.Id = cp.PostId;	codebase_community
SELECT c.Text FROM comments c WHERE c.PostId IN (SELECT p.Id FROM posts p WHERE p.ParentId = 107829) AND c.CommentCount = 1;	codebase_community
WITH CommentTime AS (SELECT c.PostId, c.CreationDate FROM Comments c WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0') SELECT p.Title, p.ClosedDate IS NULL AS IsWellFinished FROM CommentTime ct JOIN Posts p ON ct.PostId = p.Id;	codebase_community
SELECT u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 65041;	codebase_community
SELECT COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'tiago pasqualini';	codebase_community
SELECT v.UserId, u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.Id = 6347;	codebase_community
SELECT SUM(v.BountyAmount) AS total_bounty FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title ILIKE '%data%visualization%';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT CAST(COUNT(DISTINCT p.Id) AS FLOAT) / NULLIF(COUNT(DISTINCT v.Id), 0) AS ratio FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.OwnerUserId = 24;	codebase_community
SELECT p.ViewCount FROM posts p WHERE p.Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT c.Text FROM comments c WHERE c.Score = 17;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(u.DisplayName) ='silentghost';	codebase_community
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE LOWER(c.Text) = 'thank you user93!';	codebase_community
SELECT c.Text FROM comments c WHERE c.UserId IN (SELECT u.Id FROM users u WHERE u.DisplayName = 'A Lion');	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE LOWER(p.Title) = 'how does gentle boosting differ from adaboost';	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' ORDER BY u.DisplayName NULLS LAST LIMIT 10;	codebase_community
SELECT p.LastEditorDisplayName FROM posts p WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE LOWER(u.DisplayName) ='vebjorn ljosa';	codebase_community
SELECT SUM(p.Score) AS TotalScore FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgeny'; SELECT u.WebsiteUrl FROM users u WHERE LOWER(u.DisplayName) = 'yevgen	codebase_community
SELECT c.Text, c.UserId, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE LOWER(p.Title) = 'why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(v.BountyAmount) AS total_bounty FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title ilike '%data%';	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.BountyAmount = 50 AND v.PostId IN (SELECT p.Id FROM posts p WHERE p.Body LIKE '%variance%');	codebase_community
SELECT AVG(p.ViewCount) AS average_view_count, p.Title, c.Text AS comment, c.Score FROM posts p JOIN comments c ON p.Id = c.PostId JOIN tags t ON p.Id = t.ExcerptPostId WHERE LOWER(t.TagName) = 'humor' GROUP BY p.Title, c.Text, c.Score;	codebase_community
SELECT COUNT(c.Id) FROM comments c WHERE c.UserId = 13;	codebase_community
SELECT u.Id FROM users u ORDER BY u.Reputation DESC LIMIT 1;	codebase_community
SELECT u.Id FROM users u WHERE u.Views = (SELECT MIN(u2.Views) FROM users u2);	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE b.Name = 'Supporter' AND EXTRACT(YEAR FROM b.Date) = 2011;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE COUNT(b.Name) > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b ON u.Id = b.UserId WHERE LOWER(u.Location) = 'new york' AND b.Name IN ('Supporter', 'Teacher');	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN postHistory ph ON p.Id = ph.PostId WHERE u.Views >= 1000 GROUP BY u.DisplayName HAVING COUNT(DISTINCT ph.PostId) = 1;	codebase_community
WITH CommentCounts AS (SELECT c.UserId, COUNT(c.Id) AS CommentCount FROM comments c GROUP BY c.UserId), RankedUsers AS (SELECT cc.UserId, cc.CommentCount, RANK() OVER (ORDER BY cc.CommentCount DESC) AS Rank FROM CommentCounts cc) SELECT ru.UserId, b.Name AS BadgeName FROM RankedUsers ru JOIN badges b ON ru.UserId = b.UserId WHERE ru.Rank = 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(u.Location) = 'india' AND LOWER(b.Name) = 'teacher';	codebase_community
WITH total_2010 AS (SELECT COUNT(*) AS total_2010 FROM badges WHERE LOWER(Name) ='student'), total_2011 AS (SELECT COUNT(*) AS total_2011 FROM badges WHERE LOWER(Name) ='student' AND YEAR(Date) = 2011), percentage_change AS (SELECT ((total_2011 - total_2010) / NULLIF(total_2010, 0)) * 100 AS percentage_change FROM total_2010, total_2011) SELECT percentage_change FROM percentage_change;	codebase_community
SELECT p.PostHistoryTypeId FROM postHistory p WHERE p.PostId = 3720 UNION SELECT c.UserId FROM comments c WHERE c.PostId = 3720 GROUP BY c.UserId;	codebase_community
SELECT p.Title, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217; SELECT p.Title, p.ViewCount FROM posts p WHERE p.Id = 61217; SELECT COUNT(*) AS PostCount, SUM(p.ViewCount) AS TotalViewCount FROM posts p WHERE p.Id = 61217; SELECT COUNT(*) AS PostCount, SUM(p.ViewCount) AS TotalViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.RelatedPostId = 61217; SELECT COUNT(*) AS PostCount, SUM(p.ViewCount) AS TotalViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217; SELECT COUNT(*) AS PostCount, SUM(p.ViewCount) AS TotalViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217; SELECT COUNT(*) AS PostCount, SUM(p.ViewCount) AS TotalViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.RelatedPostId = 61217; SELECT COUNT(*) AS PostCount, SUM(p.ViewCount) AS TotalViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217; SELECT COUNT(*) AS PostCount, SUM(p.ViewCount) AS TotalViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217; SELECT COUNT(*) AS PostCount, SUM(p.ViewCount) AS TotalViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.RelatedPostId = 61217; SELECT COUNT(*) AS PostCount, SUM(p.ViewCount) AS TotalViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217; SELECT COUNT(*) AS PostCount, SUM(p.ViewCount) AS TotalViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217; SELECT COUNT(*) AS PostCount, SUM(p.ViewCount) AS TotalViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217; SELECT COUNT(*) AS PostCount, SUM(p.ViewCount) AS TotalViewCount FROM posts p	codebase_community
SELECT p.score, pl.linktypeid FROM posts p JOIN postlinks pl ON p.id = pl.postid WHERE p.id = 395;	codebase_community
SELECT p.Id, p.Score, u.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount) AS total_favorited FROM posts p WHERE p.OwnerUserId = 686 AND EXTRACT(YEAR FROM p.CreationDate) = 2011;	codebase_community
SELECT AVG(u.UpVotes / NULLIF(COUNT(u.Id), 0)) AS up_votes_avg, AVG(u.Age / NULLIF(COUNT(u.Id), 0)) AS age_avg FROM users u JOIN posts p ON u.Id = p.OwnerUserId GROUP BY u.Id HAVING COUNT(p.OwnerUserId) > 10;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE b.Name = 'Announcer';	codebase_community
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08';	codebase_community
SELECT COUNT(c.Id) FROM comments c WHERE c.Score > 60;	codebase_community
SELECT c.Text FROM comments c WHERE c.CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id ORDER BY u.Reputation DESC LIMIT 1;	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.name FROM badges b JOIN users u ON b.userid = u.id WHERE LOWER(u.displayname) = 'pierre';	codebase_community
SELECT u.Id, b.Date FROM users u JOIN badges b ON u.Id = b.UserId WHERE LOWER(u.Location) = 'rochester, ny' ORDER BY u.Id NULLS LAST;	codebase_community
SELECT (COUNT(DISTINCT b.UserId)::FLOAT / NULLIF((SELECT COUNT(DISTINCT UserId) FROM badges), 0)) * 100 AS percentage FROM badges b WHERE b.Name = 'Teacher';	codebase_community
SELECT (COUNT(DISTINCT CASE WHEN u.Age BETWEEN 13 AND 18 THEN b.UserId END) * 100.0 / NULLIF(COUNT(DISTINCT b.UserId), 0)) AS percentage FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT c.Score FROM comments c WHERE c.CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT c.Text FROM comments c WHERE c.CreationDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria' ORDER BY u.Age NULLS LAST;	codebase_community
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
WITH user_badges AS (SELECT u.Id, u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0') SELECT SUM(p.ViewCount) AS total_views FROM posts p JOIN user_badges ub ON p.OwnerUserId = ub.Id;	codebase_community
SELECT b.name FROM badges b JOIN users u ON b.userid = u.id WHERE u.reputation = (SELECT MIN(reputation) FROM users);	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Id = 30;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u WHERE LOWER(u.Location) = 'new york';	codebase_community
SELECT COUNT(*) FROM votes v WHERE YEAR(v.CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users u WHERE u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Views = (SELECT MAX(u2.Views) FROM users u2);	codebase_community
SELECT DIVIDE(COUNT(Id WHERE YEAR(CreationDate) = 2010), COUNT(Id WHERE YEAR(CreationDate) = 2011)) FROM votes;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN posts ph ON p.Id = ph.ParentId JOIN posts ph2 ON ph.Id = ph2.ParentId JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Stauffer' ORDER BY t.Count DESC NULLS LAST;	codebase_community
SELECT COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'daniel vassallo';	codebase_community
SELECT COUNT(v.Id) FROM votes v JOIN users u ON v.UserId = u.Id WHERE LOWER(u.DisplayName) = 'harlan';	codebase_community
SELECT p.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName ='slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT p.Id, MAX(p.ViewCount) AS max_view_count FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY p.Id ORDER BY max_view_count DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND p.Score > 4;	codebase_community
SELECT SUM(c.Score) AS total_negative_score FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60;	codebase_community
WITH posts_without_comments AS (SELECT p.id FROM posts p LEFT JOIN comments c ON p.id = c.postid WHERE c.postid IS NULL) SELECT DISTINCT t.id, t.tagname FROM posts_without_comments pwc JOIN posts pt ON pwc.id = pt.id JOIN tags t ON pt.id = t.excerptpostid WHERE pt.owneruserid IN (SELECT u.id FROM users u WHERE u.displayname ilike '%Mark Meckes%');	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT CAST(COUNT(DISTINCT p.Id) AS FLOAT) / NULLIF(COUNT(DISTINCT c.Id), 0) AS percentage FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(t.TagName) = 'r' AND LOWER(u.DisplayName) = 'community';	codebase_community
SELECT SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) - SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) AS view_count_difference FROM posts p JOIN users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE b.Name = 'Commentator' AND EXTRACT(YEAR FROM b.Date) = 2014;	codebase_community
SELECT COUNT(*) AS NumberOfPosts FROM posts p WHERE p.CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
WITH MaxViews AS (SELECT u.Id, u.DisplayName, u.Views FROM users u WHERE u.Views = (SELECT MAX(u2.Views) FROM users u2)) SELECT mv.DisplayName, mv.Age FROM MaxViews mv JOIN users u ON mv.Id = u.Id WHERE u.Age IS NOT NULL;	codebase_community
SELECT p.LastEditDate, p.LastEditorUserId FROM posts p WHERE p.Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) AS negative_comments FROM comments c WHERE c.UserId = 13 AND c.Score < 60;	codebase_community
SELECT p.Title, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score > 60 ORDER BY p.Title NULLS LAST;	codebase_community
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location LIKE '%North Pole%' AND EXTRACT(YEAR FROM b.Date) = 2011 ORDER BY b.Name NULLS LAST;	codebase_community
SELECT p.OwnerDisplayName, p.FavoriteCount, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150;	codebase_community
WITH PostHistory AS (SELECT ph.Id, COUNT(*) AS PostHistoryCount, MAX(ph.CreationDate) AS LastEditDate FROM postHistory ph WHERE ph.Text ILIKE '%What%is%the%best%introductory%Bayesian%statistics%textbook%' GROUP BY ph.Id) SELECT ph.PostHistoryCount, ph.LastEditDate FROM PostHistory ph ORDER BY ph.PostHistoryCount DESC NULLS LAST;	codebase_community
SELECT u.LastAccessDate, u.Location FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Outliers';	codebase_community
SELECT p.Title FROM posts p JOIN postlinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = (SELECT pl2.Id FROM posts pl2 WHERE LOWER(pl2.Title) = 'how to tell if something happened in a data set which monitors a value over time');	codebase_community
SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN comments c ON p.Id = c.PostId JOIN badges b ON c.UserId = b.UserId WHERE c.UserDisplayName = 'Samuel' AND YEAR(p.CreationDate) = 2013 UNION SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN badges b ON p.Id = b.PostId WHERE p.OwnerDisplayName = 'Samuel' AND YEAR(b.Date) = 2013;	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.ViewCount = (SELECT MAX(p2.ViewCount) FROM posts p2);	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count IS NOT NULL AND t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?';	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.ParentId IS NOT NULL ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC NULLS LAST LIMIT 1;	codebase_community
SELECT p.Title FROM posts p ORDER BY p.ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id WHERE p.ViewCount BETWEEN 5000 AND 7000;	codebase_community
SELECT p.OwnerUserId FROM posts p WHERE p.FavoriteCount = (SELECT MAX(p2.FavoriteCount) FROM posts p2);	codebase_community
SELECT u.Age FROM users u WHERE u.Reputation = (SELECT MAX(u2.Reputation) FROM users u2);	codebase_community
SELECT COUNT(*) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(p.CreationDate) = 2011 AND v.BountyAmount = 50;	codebase_community
SELECT u.Id FROM users u ORDER BY u.Age ASC LIMIT 1;	codebase_community
WITH PostTagCount AS (SELECT p.Id, p.ViewCount, t.Count FROM posts p JOIN post_tags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id) SELECT pt.Id, pt.ViewCount, pt.Count FROM PostTagCount pt WHERE pt.Count = (SELECT MAX(Count) FROM PostTagCount) ORDER BY pt.ViewCount DESC LIMIT 1;	codebase_community
SELECT DIVIDE(COUNT(pl.Id WHERE YEAR(pl.CreationDate) = 2010 AND p.AnswerCount <= 2), 12) AS average_monthly_links FROM posts p JOIN postLinks pl ON p.Id = pl.PostId;	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(pl2.CreationDate) FROM postLinks pl2);	codebase_community
WITH BadgeCounts AS (SELECT u.DisplayName, COUNT(b.Name) AS badge_count FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY u.DisplayName) SELECT dc.DisplayName FROM BadgeCounts dc ORDER BY dc.badge_count DESC LIMIT 1;	codebase_community
SELECT MIN(v.CreationDate) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl';	codebase_community
SELECT MIN(u.CreationDate) AS FirstPostDate FROM users u WHERE u.Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC NULLS LAST LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(v.PostId) AS average_posts_voted FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(u2.Age) FROM users u2);	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Reputation = (SELECT MAX(u2.Reputation) FROM users u2);	codebase_community
SELECT COUNT(*) FROM users u WHERE u.Reputation > 2000 AND u.Views > 1000;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) AS post_count FROM posts p WHERE p.OwnerDisplayName = 'Jay Stevens' AND YEAR(p.CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'harvey motulsky' ORDER BY p.ViewCount DESC NULLS LAST LIMIT 1;	codebase_community
SELECT p.Id, p.Title, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score = (SELECT MAX(p2.Score) FROM posts p2);	codebase_community
SELECT AVG(p.Score) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) ='stephen turner';	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT p.Id, p.OwnerDisplayName FROM posts p WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT DIVIDE(COUNT(p.Id WHERE p.CreationDate BETWEEN '2011-01-01' AND '2011-12-31' AND u.Reputation > 1000), COUNT(p.Id)) * 100 AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT DIVIDE(COUNT(u.Id WHERE u.Age BETWEEN 13 AND 18), COUNT(u.Id)) AS percentage FROM users u;	codebase_community
SELECT SUM(p.ViewCount) AS total_views, u.DisplayName AS last_poster FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(p.Body) = 'computer game datasets' AND p.LasActivityDate = (SELECT MAX(la.LasActivityDate) FROM posts la WHERE LOWER(la.Body) = 'computer game datasets');	codebase_community
WITH avg_views AS (SELECT AVG(p.ViewCount) AS avg_view_count FROM posts p) SELECT COUNT(*) AS num_posts FROM posts p WHERE p.ViewCount > (SELECT avg_view_count FROM avg_views);	codebase_community
WITH MaxScore AS (SELECT p.Id FROM posts p WHERE p.Score = (SELECT MAX(p.Score) FROM posts p)) SELECT COUNT(c.Id) FROM comments c JOIN MaxScore ms ON c.PostId = ms.Id;	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.ViewCount > 35000 AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT b.Name FROM badges b WHERE b.UserId IN (SELECT u.Id FROM users u WHERE LOWER(u.DisplayName) = 'emmett') ORDER BY b.Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users u JOIN votes v ON u.Id = v.UserId WHERE u.Age BETWEEN 19 AND 65 AND v.UpVotes > 5000;	codebase_community
SELECT EXTRACT(epoch FROM (MAX(b.Date) - u.CreationDate))/86400 AS days_to_get_badge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT u.Id, COUNT(p.Id) AS posts_count, COUNT(c.Id) AS comments_count FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY u.Id;	codebase_community
WITH LatestComment AS (SELECT c.Text, c.UserId, c.UserDisplayName, MAX(c.CreationDate) AS LatestCommentDate FROM comments c WHERE c.PostId IN (SELECT p.Id FROM posts p WHERE p.Title = 'Analysing wind data with R') GROUP BY c.Text, c.UserId, c.UserDisplayName) SELECT lc.Text, lc.UserDisplayName FROM LatestComment lc;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE LOWER(b.Name) = 'citizen patrol';	codebase_community
SELECT COUNT(*) FROM posts p JOIN tags t ON p.id = t.excerptpostid WHERE LOWER(t.tagname) = 'careers';	codebase_community
SELECT u.Reputation, SUM(p.ViewCount) AS total_view_count FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE LOWER(u.DisplayName) = 'jarrod dixon' GROUP BY u.Reputation;	codebase_community
SELECT COUNT(c.id) AS comment_count, COUNT(p.id) AS answer_count FROM comments c JOIN posts p ON c.postid = p.id WHERE LOWER(p.title) = 'clustering 1d data';	codebase_community
SELECT u.CreationDate FROM users u WHERE u.DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM votes v WHERE v.BountyAmount >= 30;	codebase_community
WITH stats_posts AS (SELECT p.Id, p.Score, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id) SELECT CAST(COUNT(DISTINCT CASE WHEN sp.Score >= 50 THEN sp.Id END) AS FLOAT) / NULLIF(COUNT(DISTINCT sp.Id), 0) AS percentage FROM stats_posts sp WHERE (SELECT MAX(Reputation) FROM users) = sp.Reputation;	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.Score < 20;	codebase_community
SELECT COUNT(*) FROM tags t WHERE t.count <= 20 AND t.id < 15;	codebase_community
SELECT t.ExcerptPostId, t.WikiPostId FROM tags t WHERE LOWER(t.TagName) ='sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)' LIMIT 1;	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE LOWER(p.Title) = 'how can i adapt anova for binary data';	codebase_community
SELECT p.Id, p.ViewCount, c.Text, c.Score FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC NULLS LAST LIMIT 1;	codebase_community
SELECT c.creationdate, u.age FROM comments c JOIN users u ON c.userid = u.id WHERE c.text ilike '%http://%' ORDER BY c.creationdate NULLS LAST;	codebase_community
SELECT COUNT(DISTINCT c.PostId) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) AS zero_score_comments FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.CommentCount = 1;	codebase_community
SELECT COUNT(DISTINCT c.UserId) AS total_users FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND EXTRACT(YEAR FROM AGE(u.CreationDate)) = 40;	codebase_community
SELECT p.Id AS post_id, COUNT(c.Id) AS comment_count FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item' GROUP BY p.Id;	codebase_community
SELECT SUM(v.UpVotes) AS total_up_votes FROM users u JOIN comments c ON u.Id = c.UserId JOIN votes v ON u.Id = v.UserId WHERE c.Text ilike '%R%is%also%lazy%evaluated%.';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE LOWER(u.DisplayName) = 'harvey motulsky';	codebase_community
SELECT c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.DownVotes = 0 AND c.Score BETWEEN 1 AND 5;	codebase_community
SELECT DIVIDE(COUNT(DISTINCT c.UserId WHERE c.UpVotes = 0 AND c.Score BETWEEN 5 AND 10), COUNT(DISTINCT c.UserId WHERE c.Score BETWEEN 5 AND 10)) AS percentage FROM comments c WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT s.power_name FROM hero_power h JOIN superpower s ON h.power_id = s.id JOIN superhero su ON h.hero_id = su.id WHERE su.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT h.id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM hero_power hp JOIN superhero s ON hp.hero_id = s.id WHERE hp.power_id IN (SELECT id FROM superpower WHERE power_name = 'Super Strength') AND s.height_cm > 200;	superhero
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(DISTINCT hp.power_id) > 15;	superhero
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT h.id) FROM superhero h JOIN colour c ON h.eye_colour_id = c.id JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' JOIN colour h ON s.hair_colour_id = h.id WHERE h.colour = 'Blond';	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s WHERE s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT s.full_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC LIMIT 1;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Sauron';	superhero
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE LOWER(c.colour) = 'blue' AND s.publisher_id IN (SELECT id FROM publisher WHERE LOWER(publisher_name) ='marvel comics');	superhero
SELECT AVG(s.height_cm) AS average_height FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT MULTIPLY(DIVIDE(SUM(CASE WHEN sp.power_name = 'Super Strength' THEN 1 ELSE 0 END), COUNT(s.id)), 100) AS percentage FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s WHERE s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE c.colour = 'Gold' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE c.colour = 'Blond';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC NULLS LAST LIMIT 1;	superhero
SELECT s.race_id FROM superhero s WHERE s.superhero_name = 'Copycat';	superhero
SELECT COUNT(*) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch';	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND a.attribute_value = 100 AND s.gender_id IN (SELECT id FROM gender WHERE gender = 'Female');	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.superhero_name ORDER BY COUNT(hp.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero s WHERE s.race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT (COUNT(CASE WHEN s.alignment_id = a.id THEN 1 END)::FLOAT / NULLIF(COUNT(*), 0)) * 100 AS percentage FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.alignment = 'Bad' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference_in_number_of_superheroes;	superhero
SELECT p.id FROM publisher p WHERE p.publisher_name = 'Star Trek';	superhero
SELECT AVG(ha.attribute_value) AS average_attribute_value FROM hero_attribute ha;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.id = 75;	superhero
SELECT s.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id WHERE s.superhero_name = 'Deathlok';	superhero
SELECT AVG(s.weight_kg) FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE g.id = 2;	superhero
SELECT s.superhero_name, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.gender_id = (SELECT id FROM gender WHERE gender = 'Male') ORDER BY s.superhero_name NULLS LAST LIMIT 5;	superhero
SELECT s.superhero_name FROM superhero s WHERE s.race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT s.superhero_name FROM superhero s WHERE s.height_cm BETWEEN 170 AND 190 AND s.eye_colour_id = 1;	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 56;	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Demi-God' ORDER BY s.full_name NULLS LAST LIMIT 5;	superhero
SELECT COUNT(s.id) FROM superhero s WHERE s.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT s.race_id FROM superhero s WHERE s.weight_kg = 169;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE s.height_cm = 185 AND s.race_id = (SELECT id FROM race WHERE race = 'human');	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(s2.weight_kg) FROM superhero s2);	superhero
SELECT (COUNT(CASE WHEN s.publisher_id = 13 THEN 1 END) / NULLIF(COUNT(*), 0)) * 100 AS percentage FROM superhero s WHERE s.height_cm BETWEEN 150 AND 180;	superhero
SELECT s.full_name FROM superhero s WHERE s.gender_id = (SELECT id FROM gender WHERE gender ='male') AND (s.weight_kg > (SELECT AVG(s2.weight_kg) * 0.79) ORDER BY s.full_name NULLS LAST;	superhero
SELECT sp.power_name, COUNT(*) AS COUNT FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id GROUP BY sp.power_name ORDER BY COUNT DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(DISTINCT h.id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name ='stealth';	superhero
WITH strongest_superhero AS (SELECT s.id, s.full_name, MAX(ha.attribute_value) AS max_strength FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id IN (SELECT id FROM attribute WHERE attribute_name ='strength') GROUP BY s.id, s.full_name) SELECT sss.full_name FROM strongest_superhero sss ORDER BY sss.max_strength DESC NULLS LAST LIMIT 1;	superhero
SELECT DIVIDE(COUNT(s.id), SUM(CASE WHEN c.id = 1 THEN 1 ELSE 0 END)) AS average FROM superhero s JOIN colour c ON s.skin_colour_id = c.id;	superhero
SELECT COUNT(s.id) FROM superhero s WHERE s.publisher_id IN (SELECT p.id FROM publisher p WHERE p.publisher_name = 'Dark Horse Comics');	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC NULLS LAST LIMIT 1;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power h ON s.id = h.hero_id JOIN superpower p ON h.power_id = p.id WHERE p.power_name = 'Flight';	superhero
SELECT s.eye_colour_id, s.hair_colour_id, s.skin_colour_id FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.hair_colour_id = s.skin_colour_id AND s.hair_colour_id = s.eye_colour_id ORDER BY s.superhero_name NULLS LAST;	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'A-Bomb';	superhero
SELECT (COUNT(CASE WHEN c.colour = 'Blue' AND s.gender = 'Female' THEN 1 END) * 100.0 / NULLIF(COUNT(CASE WHEN s.gender = 'Female' THEN 1 END), 0)) AS percentage FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.gender = 'Female';	superhero
SELECT s.superhero_name, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.full_name = 'Charles Chandler';	superhero
SELECT g.gender FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE s.superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(hp.power_id) AS number_of_powers FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id WHERE s.superhero_name = 'Amazo';	superhero
SELECT s.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id WHERE s.superhero_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Black' AND c2.colour = 'Black';	superhero
SELECT DISTINCT s.eye_colour_id FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE c.colour = 'Gold';	superhero
SELECT s.full_name FROM superhero s WHERE s.race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT s.superhero_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral';	superhero
WITH StrengthMax AS (SELECT h.id AS hero_id, MAX(ha.attribute_value) AS max_strength FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' GROUP BY h.id) SELECT COUNT(DISTINCT sm.hero_id) FROM StrengthMax sm;	superhero
SELECT s.race_id, a.alignment FROM superhero s JOIN attribute a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT (COUNT(CASE WHEN s.gender_id = g.id AND p.publisher_name = 'Marvel Comics' THEN 1 END) * 100.0 / NULLIF(COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 END), 0)) AS percentage FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female';	superhero
SELECT AVG(s.weight_kg) FROM superhero s WHERE s.race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT (SUM(s.weight_kg) - SUM(s2.weight_kg)) AS weight_difference FROM superhero s JOIN superhero s2 ON s.full_name = 'Emil Blonsky' AND s2.full_name = 'Charles Chandler';	superhero
SELECT AVG(s.height_cm) AS average_height FROM superhero s;	superhero
SELECT s.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(s.id) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN race r ON s.race_id = r.id WHERE g.id = 1 AND r.id = 21;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(s.id) FROM superhero s WHERE s.alignment_id = 3;	superhero
SELECT a.attribute_name, h.attribute_value FROM hero_attribute h JOIN attribute a ON h.attribute_id = a.id JOIN superhero s ON h.hero_id = s.id WHERE s.superhero_name ilike '%3-D Man%';	superhero
SELECT s.superhero_name FROM superhero s WHERE s.eye_colour_id = 7 AND s.hair_colour_id = 9 ORDER BY s.superhero_name NULLS LAST;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT (COUNT(CASE WHEN s.eye_colour_id = 7 THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage_of_blue_eyes FROM superhero s;	superhero
SELECT DIVIDE(SUM(CASE WHEN s.gender_id = 1 THEN 1 ELSE 0 END), SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END)) AS ratio FROM superhero s;	superhero
SELECT s.superhero_name FROM superhero s WHERE s.height_cm = (SELECT MAX(s2.height_cm) FROM superhero s2);	superhero
SELECT sp.id FROM superpower sp WHERE sp.power_name = 'cryokinesis';	superhero
SELECT s.superhero_name FROM superhero s WHERE s.id = 294;	superhero
SELECT s.full_name FROM superhero s WHERE s.weight_kg = 0 OR s.weight_kg IS NULL;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT s.power_id, s.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id WHERE s.full_name = 'Helen Parr';	superhero
SELECT s.race_id FROM superhero s WHERE s.weight_kg = 108 AND s.height_cm = 188;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.id = 38;	superhero
SELECT s.race_id, r.race FROM superhero s JOIN race r ON s.race_id = r.id ORDER BY (SELECT MAX(h.attribute_value) FROM hero_attribute h WHERE h.hero_id = s.id) DESC LIMIT 1;	superhero
SELECT s.alignment, h.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' ORDER BY s.full_name NULLS LAST LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.alignment_id = 3;	superhero
SELECT s.skin_colour_id, c.colour FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN colour c ON a.id = c.id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN alignment a ON s.alignment_id = a.id WHERE g.id = 2 AND a.id = 1;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80;	superhero
SELECT s.race_id, r.race FROM superhero s JOIN colour c ON s.hair_colour_id = c.id JOIN race r ON s.race_id = r.id WHERE c.colour = 'blue';	superhero
SELECT (COUNT(DISTINCT CASE WHEN g.id = 2 THEN s.id END)::FLOAT / NULLIF(COUNT(DISTINCT s.id), 0)) * 100 AS percentage FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN gender g ON s.gender_id = g.id WHERE a.id = 2;	superhero
WITH T1 AS (SELECT s.id AS hero_id, s.full_name, s.eye_colour_id FROM superhero s WHERE s.weight_kg = 0 OR s.eye_colour_id IS NULL) SELECT (SELECT COUNT(DISTINCT CASE WHEN c.id = 7 THEN t1.hero_id END) - COUNT(DISTINCT CASE WHEN c.id = 1 THEN t1.hero_id END)) AS difference FROM T1 JOIN colour c ON T1.eye_colour_id = c.id;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name ilike '%Hulk%';	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero s WHERE s.skin_colour_id IN (SELECT id FROM colour WHERE colour = 'Green') AND s.alignment_id IN (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name NULLS LAST;	superhero
SELECT g.gender FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' ORDER BY s.weight_kg DESC LIMIT 1;	superhero
SELECT AVG(s.height_cm) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics' AND s.race_id!= (SELECT id FROM race WHERE race = 'Human');	superhero
SELECT COUNT(*) FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE ha.attribute_id IN (SELECT id FROM attribute WHERE attribute_name = 'Speed') AND ha.attribute_value = 100;	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS difference;	superhero
SELECT a.attribute_name FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE ha.hero_id IN (SELECT s.id FROM superhero s WHERE s.superhero_name = 'Black Panther') ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT s.superhero_name FROM superhero s WHERE s.height_cm = (SELECT MAX(s2.height_cm) FROM superhero s2);	superhero
SELECT s.superhero_name FROM superhero s WHERE s.full_name = 'Charles Chandler';	superhero
SELECT MULTIPLY(DIVIDE(SUM(CASE WHEN s.gender_id = g.id THEN 1 ELSE 0 END) FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE s.publisher_id = p.id), COUNT(*)) * 100.0 AS percentage FROM publisher p WHERE p.publisher_name = 'George Lucas';	superhero
SELECT (SUM(CASE WHEN s.alignment_id = a.id THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(s.id), 0)) AS percentage FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' AND a.alignment = 'Good';	superhero
SELECT COUNT(*) FROM superhero s WHERE s.full_name LIKE 'John%';	superhero
SELECT h.id FROM hero_attribute ha JOIN superhero h ON ha.hero_id = h.id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'intelligence') ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT s.full_name FROM superhero s WHERE s.superhero_name = 'Alien';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.colour = 'brown';	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name ilike '%Aquababy%';	superhero
SELECT s.weight_kg, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.id = 40;	superhero
SELECT AVG(s.height_cm) FROM superhero s WHERE s.alignment_id = (SELECT id FROM alignment WHERE alignment = 'neutral');	superhero
SELECT s.id FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Intelligence';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(s2.height_cm) * 0.8 FROM superhero s2);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.number = 5 ORDER BY q.q1 DESC LIMIT 5;	formula_1
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 19 ORDER BY MIN(q.q2) LIMIT 1;	formula_1
SELECT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.location) ='shanghai';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'Germany';	formula_1
SELECT r.name, c.position FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN constructorResults cr ON r.raceId = cr.raceId JOIN constructors cn ON cr.constructorId = cn.constructorId WHERE LOWER(cn.name) ='renault';	formula_1
SELECT COUNT(*) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND (c.country not ilike '%Asia%' AND c.country not ilike '%Europe%');	formula_1
SELECT r.name, c.name AS circuit_name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.country) ='spain';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name ilike '%Australian Grand Prix%';	formula_1
SELECT r.url FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT c.lat, c.lng FROM circuits c WHERE c.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.country FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN constructorResults cr ON r.raceId = cr.raceId JOIN constructors cn ON cr.constructorId = cn.constructorId WHERE r.round = 24 AND cr.points = 1;	formula_1
SELECT q.q1 FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE d.forename = 'Bruno' AND d.surname = 'Senna' AND q.raceId = 354;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.number = 355 AND q.q2 = '0:01:40';	formula_1
SELECT d.number FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.position = 1 AND q.q3 = '0:01:54' AND q.raceId = 903;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM results r JOIN status s ON r.statusId = s.statusId WHERE r.raceId = 6 AND s.status = 'DNF';	formula_1
SELECT r.name, s.url FROM races r JOIN seasons s ON r.year = s.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM results r WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.date = '2015-11-29');	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC NULLS LAST LIMIT 1;	formula_1
SELECT d.url FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.time = '0:01:27' AND r.raceId = 161;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 933 AND r.fastestLapSpeed = (SELECT MAX(r2.fastestLapSpeed) FROM results r2 WHERE r2.raceId = 933);	formula_1
SELECT c.name, c.lat, c.lng FROM circuits c WHERE c.name LIKE '%Malaysian Grand Prix%';	formula_1
SELECT c.url FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE cr.raceId = 9 ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT q1 FROM qualifying WHERE raceId = 345 AND driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi');	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 347 AND q.q2 = '0:01:15';	formula_1
SELECT d.code FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 45 AND q.q3 = '0:01:33';	formula_1
SELECT r.name AS race_name, d.surname, d.forename, r.date, to_char(r.time, 'HH24:MI') AS time, to_char(r.date, 'YYYY-MM-DD') AS race_date FROM races r JOIN drivers d ON r.year = d.dob YEAR AND r.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit') WHERE r.raceId = 743;	formula_1
SELECT d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.position = 2 AND r.raceId IN (SELECT r2.raceId FROM races r2 JOIN seasons s2 ON r2.year = s2.year WHERE s2.url = '2006');	formula_1
SELECT r.year, r.name, r.date, r.time, r.url FROM races r WHERE r.year IN (SELECT DISTINCT r.year FROM races r WHERE r.raceId = 901);	formula_1
SELECT COUNT(DISTINCT r.resultId) FROM results r JOIN races r1 ON r.raceId = r1.raceId WHERE r1.date = '2015-11-29';	formula_1
SELECT d.forename, d.surname, MAX(d.dob) AS max_dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL GROUP BY d.forename, d.surname ORDER BY max_dob LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races R1 ON r.raceId = R1.raceId WHERE r.time = (SELECT MIN(r2.time) FROM results r2 WHERE r2.raceId = R1.raceId) AND R1.raceId = 348;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (SELECT MAX(r2.fastestLapSpeed) FROM results r2);	formula_1
SELECT (SUBTRACT(fastestLapSpeed(raceId = 853), (fastestLapSpeed(raceId = 854)))/NULLIF(fastestLapSpeed(raceId = 853),0) AS percentage FROM results WHERE number = 853;	formula_1
SELECT d.driverRef, DIVIDE(COUNT(r.resultId WHERE r.time IS NOT NULL AND r.date = '1983-07-16'), COUNT(r.resultId WHERE r.date = '1983-07-16')) AS percentage FROM drivers d JOIN results r ON d.driverId = r.driverId GROUP BY d.driverRef;	formula_1
SELECT MIN(r.year) FROM races r WHERE LOWER(r.name) LIKE '%singapore grand prix%';	formula_1
SELECT COUNT(*) AS total_races, r.name AS race_name FROM races r JOIN seasons s ON r.year = s.year WHERE s.year = 2005 ORDER BY r.name DESC;	formula_1
SELECT r.name, r.date FROM races r WHERE r.year = (SELECT MIN(r2.year) FROM races r2 WHERE MONTH(r2.date) = MONTH(MIN(r2.date))) AND r.date BETWEEN r.date AND DATEADD(MONTH, 1, r.date) ORDER BY r.date;	formula_1
SELECT r.name, r.date FROM races r WHERE r.year = 1999 ORDER BY r.round DESC LIMIT 1;	formula_1
SELECT r.year, COUNT(r.round) AS num_races FROM races r GROUP BY r.year ORDER BY num_races DESC LIMIT 1;	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 AND r.circuitId NOT IN (SELECT c.circuitId FROM circuits c WHERE c.country = 'United States');	formula_1
SELECT c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = (SELECT MIN(year) FROM races WHERE name ilike '%European Grand Prix%');	formula_1
SELECT MAX(r.year) AS last_year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Brands Hatch';	formula_1
SELECT COUNT(DISTINCT r.year) AS number_of_seasons FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name ILIKE '%Silverstone%British%Grand%Prix%';	formula_1
SELECT d.forename, d.surname, ds.position FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE ds.raceId IN (SELECT r.raceId FROM races r WHERE LOWER(r.name) ='singapore grand prix' AND r.year = 2010) ORDER BY ds.position NULLS LAST;	formula_1
SELECT d.forename, d.surname, MAX(r.points) AS max_points FROM results r JOIN drivers d ON r.driverId = d.driverId GROUP BY d.forename, d.surname ORDER BY max_points DESC LIMIT 1;	formula_1
SELECT d.surname, d.forename, rs.points FROM drivers d JOIN results rs ON d.driverId = rs.driverId WHERE rs.raceId IN (SELECT r.raceId FROM races r WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix') ORDER BY rs.points DESC NULLS LAST LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name, MIN(l.time) AS best_lap_time FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN races r ON l.raceId = r.raceId GROUP BY d.forename, d.surname, r.name ORDER BY best_lap_time ASC NULLS LAST;	formula_1
SELECT AVG(milliseconds/1000.0) AS average_lap_time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE d.forename = 'Sebastian' AND d.surname = 'Vettel' AND lt.raceId = (SELECT r.raceId FROM races r WHERE r.year = 2009 AND r.name = 'Chinese Grand Prix');	formula_1
SELECT DIVIDE(COUNT(r.resultId) WHERE r.surName = 'Hamilton' AND r.year >= 2010 AND r.position > 1), (COUNT(r.resultId) WHERE r.surName = 'Hamilton' AND r.year >= 2010) AS percentage FROM results r;	formula_1
SELECT d.forename, d.surname, d.nationality, AVG(r.points) AS avg_points FROM drivers d JOIN driverStandings r ON d.driverId = r.driverId GROUP BY d.forename, d.surname, d.nationality ORDER BY MAX(r.wins) DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, 2022 - EXTRACT(YEAR FROM d.dob) AS age FROM drivers d WHERE d.nationality = 'Japanese' ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT c.name, c.location, c.country, COUNT(r.circuitId) AS race_count FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.name, c.location, c.country HAVING COUNT(r.circuitId) >= 4 ORDER BY c.name NULLS LAST;	formula_1
SELECT c.name, c.location, r.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name, c.name, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT r.name, r.date, r.time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Yoong' AND r.position < 10;	formula_1
SELECT COUNT(*) FROM (SELECT r.raceId FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN constructors c ON r.constructorId = c.constructorId JOIN circuits ci ON r.raceId = ci.circuitId WHERE d.surname = 'Schumacher' AND ci.name = 'Sepang International Circuit' AND r.points = (SELECT MAX(points) FROM results WHERE raceId = r.raceId) GROUP BY r.raceId) AS subquery;	formula_1
SELECT r.name, s.year FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Schumacher' AND r.fastestLapTime = (SELECT MIN(r2.fastestLapTime) FROM results r2 WHERE r2.driverId = r.driverId);	formula_1
SELECT AVG(r.points) FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Irvine' AND r.year = 2000;	formula_1
SELECT MIN(r.Year) AS year_of_first_race, SUM(CASE WHEN r.RaceId = MIN(r.RaceId) THEN r.Points ELSE 0 END) AS points_in_first_race FROM Results r JOIN Drivers d ON r.DriverId = d.DriverId WHERE d.Surname = 'Hamilton' AND d.Forename = 'Lewis';	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT r.name AS race_name, r.year AS year_of_race, c.name AS circuit_location, MAX(l.lap) AS most_laps FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN lapTimes l ON r.raceId = l.raceId GROUP BY r.name, r.year, c.name ORDER BY most_laps DESC LIMIT 1;	formula_1
SELECT (COUNT(CASE WHEN c.country = 'Germany' AND r.name = 'European Grand Prix' THEN 1 END) * 1.0 / NULLIF(COUNT(CASE WHEN r.name = 'European Grand Prix' THEN 1 END), 0)) * 100 AS percentage FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'European Grand Prix';	formula_1
SELECT c.lat, c.lng FROM circuits c WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT c.name FROM circuits c WHERE c.lat = (SELECT MAX(c2.lat) FROM circuits c2 WHERE c2.name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring'));	formula_1
SELECT c.circuitRef FROM circuits c WHERE c.name = 'Marina Bay Street Circuit';	formula_1
SELECT c.location FROM circuits c WHERE c.alt = (SELECT MAX(c2.alt) FROM circuits c2);	formula_1
SELECT COUNT(*) FROM drivers d WHERE d.code IS NULL;	formula_1
SELECT c.country, MIN(d.dob) AS oldest_dob FROM drivers d JOIN circuits c ON d.nationality = c.country GROUP BY c.country ORDER BY oldest_dob NULLS LAST LIMIT 1;	formula_1
SELECT d.surname FROM drivers d WHERE d.nationality = 'Italian';	formula_1
SELECT d.url FROM drivers d WHERE d.forename ilike '%Anthony%' AND d.surname ilike '%Davidson%';	formula_1
SELECT d.driverRef FROM drivers d WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = 2008 AND r.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name ilike '%Silverstone%';	formula_1
SELECT r.name, r.date, r.time, c.name AS circuit_name, r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name LIKE '%Silverstone%' AND r.url IS NOT NULL;	formula_1
SELECT r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Abu Dhabi Circuit' AND r.year = 2010;	formula_1
SELECT COUNT(DISTINCT r.raceId) AS number_of_races FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.location) = 'italy';	formula_1
SELECT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.name) = 'barcelona-catalunya';	formula_1
SELECT c.url FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name ilike '%Spanish Grand Prix%' AND r.year = 2009;	formula_1
SELECT MIN(r.time) FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN (SELECT r.driverId, r.lap, r.time FROM results r WHERE r.fastestLapSpeed IS NOT NULL) AS fl ON d.driverId = fl.driverId ORDER BY fl.lap DESC LIMIT 1;	formula_1
SELECT d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races r2 ON r.raceId = r2.raceId WHERE LOWER(r2.name) = 'australian grand prix' AND r2.year = 2008 AND r.position = 1;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.name AS race_name, d.forename, d.surname, d.rank FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.driverRef = 'Lewis' ORDER BY d.rank ASC LIMIT 1;	formula_1
SELECT MAX(r.fastestLapSpeed) AS fastest_lap_speed FROM results r WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.name ilike '%Spanish Grand Prix%' AND r2.year = 2009);	formula_1
SELECT DISTINCT r.year FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.driverRef ilike '%Lewis%Hamilton%';	formula_1
SELECT d.forename, d.surname, r.positionOrder FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.driverRef = 'HAM' AND r.raceId IN (SELECT r.raceId FROM races r WHERE r.name = 'Australian Grand Prix' AND r.year = 2008) ORDER BY r.positionOrder DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.grid = 4 AND r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.year = 2008);	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM results r WHERE r.raceId = (SELECT r2.raceId FROM races r2 WHERE r2.name ilike '%Australian Grand Prix%' AND r2.year = 2008) AND r.time IS NOT NULL;	formula_1
SELECT MAX(l.time) AS fastest_lap_time FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND l.raceId IN (SELECT r.raceId FROM races r WHERE r.year = 2008 AND r.name = 'Australian Grand Prix');	formula_1
SELECT r.time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.position = 2 AND r.raceId IN (SELECT r2.raceId FROM races r2 JOIN seasons s ON r2.year = s.year WHERE s.year = 2008 AND r2.circuitId IN (SELECT c.circuitId FROM circuits c WHERE c.name = 'Australian Grand Prix'));	formula_1
SELECT d.forename, d.surname, r.time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE LOWER(r2.name) = 'australian grand prix' AND EXTRACT(YEAR FROM r2.date) = 2008) AND r.position = 1;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'American' AND r.raceId IN (SELECT r.raceId FROM races r WHERE r.year = 2008 AND r.name = 'Australian Grand Prix');	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.year = 2008 AND r2.name = 'Australian Grand Prix' AND r2.time IS NOT NULL) AND r.position IS NOT NULL;	formula_1
SELECT SUM(r.points) AS total_points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE LOWER(d.surname) = 'hamilton';	formula_1
SELECT AVG(CAST(SUBSTRING(r.time, 3, 2) AS INTEGER) * 60 + CAST(SUBSTRING(SUBSTRING(r.time, 7, 2) FROM '[0-9][0-9]') AS INTEGER) AS time_in_seconds) AS average_fastest_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Hamilton';	formula_1
SELECT CAST(COUNT(DISTINCT CASE WHEN r.time IS NOT NULL THEN r.raceId END) AS FLOAT) / NULLIF(COUNT(DISTINCT r.raceId), 0) AS rate FROM results r WHERE r.raceId IN (SELECT r.raceId FROM races r WHERE r.year = 2008 AND r.circuitId IN (SELECT c.circuitId FROM circuits c WHERE c.name = 'Melbourne Grand Prix Circuit'));	formula_1
SELECT (SUM(CASE WHEN r.position = 1 THEN CAST(r.time AS TIME) ELSE NULL END) - SUM(CASE WHEN r.position = r.laps THEN CAST(r.time AS TIME) ELSE NULL END)) * 60 AS champion_time, SUM(CASE WHEN r.position = r.laps THEN CAST(r.time AS TIME) ELSE NULL END) * 60 AS last_driver_time FROM results r WHERE r.year = 2008 AND r.time IS NOT NULL;	formula_1
SELECT COUNT(c.circuitId) FROM circuits c WHERE LOWER(c.location) ='melbourne' AND LOWER(c.country) = 'australia';	formula_1
SELECT c.lat, c.lng FROM circuits c WHERE c.country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers d WHERE d.nationality = 'GB' AND EXTRACT(YEAR FROM d.dob) > 1980;	formula_1
SELECT AVG(cr.points) AS average_points FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'British';	formula_1
SELECT c.name, SUM(cr.points) AS total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId GROUP BY c.name ORDER BY total_points DESC NULLS LAST LIMIT 1;	formula_1
SELECT c.name, cr.points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.points = 0 AND cr.raceId = 291;	formula_1
SELECT COUNT(DISTINCT cr.constructorId) FROM constructorResults cr WHERE cr.points = 0 AND cr.raceId IN (SELECT r.raceId FROM races r GROUP BY r.raceId HAVING COUNT(r.raceId) = 2);	formula_1
SELECT DISTINCT c.constructorRef FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1 ORDER BY c.constructorRef NULLS LAST;	formula_1
SELECT COUNT(DISTINCT c.constructorId) FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN drivers d ON cr.driverId = d.driverId JOIN lapTimes lt ON d.driverId = lt.driverId WHERE c.nationality = 'French' AND lt.lap > 50;	formula_1
SELECT (COUNT(DISTINCT r.driverId) * 100.0 / NULLIF(COUNT(DISTINCT r.driverId), 0)) AS percentage FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.nationality = 'Japanese' AND r.time IS NOT NULL AND r.year BETWEEN 2007 AND 2009;	formula_1
SELECT r.year, AVG(EXTRACT(EPOCH FROM TO_TIMESTAMP(r.time)) / 60) AS average_time_minutes FROM results r JOIN constructorStandings cs ON r.raceId = cs.raceId WHERE r.positionText IS NOT NULL GROUP BY r.year ORDER BY r.year NULLS LAST;	formula_1
SELECT d.forename, d.surname FROM drivers d WHERE EXTRACT(YEAR FROM d.dob) > 1975 AND d.rank = 2;	formula_1
SELECT COUNT(*) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN (SELECT r.driverId, MIN(l.time) AS fastestLapTime FROM races r JOIN lapTimes l ON r.raceId = l.raceId GROUP BY r.driverId) AS fl ON d.driverId = fl.driverId ORDER BY fl.fastestLapTime ASC NULLS LAST LIMIT 1;	formula_1
SELECT MAX(r.time) FROM results r JOIN constructorResults cr ON r.raceId = cr.raceId JOIN constructors c ON cr.constructorId = c.constructorId WHERE r.year = 2009 AND c.name = (SELECT c2.name FROM constructors c2 JOIN constructorStandings cs ON c2.constructorId = cs.constructorId WHERE cs.wins = (SELECT MAX(cs2.wins) FROM constructorStandings cs2));	formula_1
SELECT AVG(cast(r.fastestLapSpeed AS REAL)) AS average_fastest_lap_speed FROM results r JOIN races s ON r.raceId = s.raceId WHERE s.name = 'Spanish Grand Prix' AND s.year = 2009;	formula_1
SELECT r.name, s.year FROM races r JOIN results rs ON r.raceId = rs.raceId WHERE rs.time IS NOT NULL AND rs.milliseconds = (SELECT MIN(rs2.milliseconds) FROM results rs2 WHERE rs2.time IS NOT NULL AND rs2.milliseconds IS NOT NULL);	formula_1
SELECT CAST(COUNT(DISTINCT r.driverId) filter (WHERE d.year(dob) < 1985 AND r.laps > 50) AS FLOAT) / NULLIF(COUNT(DISTINCT r.driverId) filter (WHERE d.year(dob) BETWEEN 2000 AND 2005), 0) * 100 AS percentage FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.year(dob) BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.time < '01:00:00';	formula_1
SELECT d.driverRef FROM drivers d WHERE d.nationality = 'America';	formula_1
SELECT r.raceId FROM races r WHERE r.year = 2009;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 18;	formula_1
SELECT d.code, COUNT(*) FROM drivers d WHERE d.nationality = 'Netherlands' GROUP BY d.code HAVING COUNT(*) IN (1, 2, 3) ORDER BY d.dob ASC LIMIT 3;	formula_1
SELECT d.driverRef FROM drivers d WHERE d.forename = 'Robert' AND d.surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers d WHERE d.nationality = 'Australia' AND EXTRACT(YEAR FROM d.dob) = 1980;	formula_1
SELECT d.forename, d.surname, MIN(l.time) AS min_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE EXTRACT(YEAR FROM d.dob) BETWEEN 1980 AND 1990 GROUP BY d.forename, d.surname ORDER BY min_time ASC LIMIT 3;	formula_1
SELECT d.driverRef FROM drivers d WHERE d.nationality = 'German' ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE EXTRACT(YEAR FROM d.dob) = 1971 AND r.fastestLapTime IS NOT NULL ORDER BY d.driverId NULLS LAST;	formula_1
SELECT d.surname, d.forename, MAX(l.time) AS max_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'Spanish' AND EXTRACT(YEAR FROM d.dob) < 1982 GROUP BY d.surname, d.forename ORDER BY max_time DESC LIMIT 10;	formula_1
SELECT r.year FROM races r JOIN results rs ON r.raceId = rs.raceId WHERE rs.fastestLapTime IS NOT NULL ORDER BY rs.fastestLapTime ASC LIMIT 1;	formula_1
SELECT r.year, MAX(l.time) AS max_lap_time FROM races r JOIN lapTimes l ON r.raceId = l.raceId GROUP BY r.year ORDER BY max_lap_time ASC LIMIT 1;	formula_1
SELECT d.driverId, MIN(l.time) AS fastestLapTime FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId GROUP BY d.driverId ORDER BY fastestLapTime DESC NULLS LAST LIMIT 5;	formula_1
SELECT COUNT(DISTINCT r.resultId) FROM results r WHERE r.statusId = 2 AND r.time IS NOT NULL AND r.raceId BETWEEN 50 AND 100;	formula_1
SELECT COUNT(r.raceId), c.location, c.lat, c.lng FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.location) = 'austria' GROUP BY c.location, c.lat, c.lng;	formula_1
WITH race_finishers AS (SELECT r.raceId, COUNT(DISTINCT d.driverId) AS num_finishers FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE res.time IS NOT NULL GROUP BY r.raceId) SELECT rf.raceId, rf.num_finishers FROM race_finishers rf ORDER BY rf.num_finishers DESC NULLS LAST LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 IS NOT NULL AND q.raceId = 23;	formula_1
SELECT MIN(r.date) AS first_qualifying_date, r.name AS race_name, r.time AS race_time FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY r.date, r.name, r.time;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.statusId = 2 AND d.nationality = 'USA';	formula_1
SELECT c.name, c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'Italian' ORDER BY cr.points DESC NULLS LAST LIMIT 1;	formula_1
WITH ConstructorWins AS (SELECT c.constructorId, COUNT(*) AS total_wins FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE cs.wins > 0 GROUP BY c.constructorId) SELECT c.url, cw.total_wins FROM ConstructorWins cw JOIN constructors c ON cw.constructorId = c.constructorId ORDER BY cw.total_wins DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, MAX(l.time) AS slowest_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE l.lap = 3 AND l.raceId IN (SELECT r.raceId FROM races r WHERE LOWER(r.name) LIKE '%French Grand Prix%') GROUP BY d.forename, d.surname ORDER BY slowest_time ASC NULLS LAST LIMIT 1;	formula_1
SELECT r.name, MIN(l.time) AS fastest_lap_time FROM races r JOIN lapTimes l ON r.raceId = l.raceId GROUP BY r.name ORDER BY fastest_lap_time ASC LIMIT 1;	formula_1
SELECT AVG(r.fastestLapTime) AS average_fastest_lap_time FROM results r WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.year = 2006 AND r2.name = 'United States Grand Prix') AND r.rank < 11;	formula_1
SELECT d.surname, d.forename, AVG(p.duration) AS avg_duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.surname, d.forename ORDER BY avg_duration ASC LIMIT 5;	formula_1
SELECT d.surname, r.time FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId IN (SELECT r.raceId FROM races r WHERE r.name LIKE '%Canadian Grand Prix%') AND r.year = 2008 ORDER BY r.position LIMIT 1;	formula_1
SELECT c.constructorRef, c.url FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN constructors c ON r.constructorId = c.constructorId WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE LOWER(r2.name) LIKE '%Singapore Grand Prix%') AND r.position = 1 AND r.time = (SELECT MAX(r2.time) FROM results r2 WHERE r2.raceId = r.raceId);	formula_1
SELECT d.forename, d.surname, d.dob FROM drivers d WHERE d.nationality = 'Austrian' AND EXTRACT(YEAR FROM d.dob) BETWEEN 1981 AND 1991 ORDER BY d.dob NULLS LAST;	formula_1
SELECT d.forename, d.surname, d.url, d.dob FROM drivers d WHERE d.nationality = 'German' AND year(d.dob) BETWEEN 1971 AND 1985 ORDER BY d.dob DESC;	formula_1
SELECT c.location, c.country, c.lat, c.lng FROM circuits c WHERE c.name = 'Hungaroring';	formula_1
SELECT SUM(c.points) AS total_points, c.name, c.nationality FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE cs.raceId IN (SELECT r.raceId FROM races r WHERE LOWER(r.name) ='monaco grand prix' AND r.year BETWEEN 1980 AND 2010) GROUP BY cs.constructorId, c.name, c.nationality ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(r.points) AS average_points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE LOWER(d.surname) = 'hamilton' AND LOWER(r.name) = 'turkish grand prix';	formula_1
SELECT EXTRACT(YEAR FROM r.date) AS year, COUNT(r.raceId) AS num_races FROM races r WHERE r.date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY EXTRACT(YEAR FROM r.date) ORDER BY EXTRACT(YEAR FROM r.date) NULLS LAST;	formula_1
SELECT d.nationality FROM drivers d GROUP BY d.nationality ORDER BY COUNT(d.nationality) DESC LIMIT 1;	formula_1
SELECT COUNT(*) AS wins FROM results r WHERE r.position <= 91 AND r.points = 25;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.fastestLapTime = (SELECT MIN(res2.fastestLapTime) FROM results res2);	formula_1
SELECT c.name, c.location + ','+ c.country AS full_location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(r2.date) FROM races r2);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races R1 ON r.raceId = R1.raceId WHERE r.time = (SELECT MIN(q3) FROM qualifying) AND R1.year = 2008 AND R1.circuitId IN (SELECT c.circuitId FROM circuits c WHERE c.name = 'Marina Bay Street Circuit');	formula_1
SELECT d.forename, d.surname, d.nationality, r.name AS first_race FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob = (SELECT MAX(dob) FROM drivers);	formula_1
SELECT MAX(raceId) AS max_race_id, COUNT(*) AS total_accidents FROM (SELECT r.raceId, COUNT(*) AS accidents FROM results r JOIN status s ON r.statusId = s.statusId WHERE LOWER(r.positionText) = 'accident' AND r.raceId IN (SELECT r2.raceId FROM races r2 WHERE LOWER(r2.name) = 'canadian grand prix') GROUP BY r.raceId) AS subquery GROUP BY max_race_id ORDER BY total_accidents DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, SUM(r.wins) AS total_wins FROM drivers d JOIN (SELECT driverId FROM drivers ORDER BY dob ASC LIMIT 1) AS youngest ON d.driverId = youngest.driverId JOIN driverStandings dr ON d.driverId = dr.driverId JOIN races r ON dr.raceId = r.raceId GROUP BY d.forename, d.surname;	formula_1
SELECT MAX(p.duration) AS longest_pitstop_duration FROM pitStops p;	formula_1
SELECT MIN(l.time) FROM lapTimes l;	formula_1
SELECT MAX(p.duration) AS longest_pit_stop FROM pitStops p JOIN drivers d ON p.driverId = d.driverId WHERE d.surname = 'Hamilton';	formula_1
SELECT p.lap FROM pitStops p JOIN drivers d ON p.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND p.raceId IN (SELECT r.raceId FROM races r WHERE r.year = 2011 AND r.name = 'Australian Grand Prix');	formula_1
SELECT d.forename, d.surname, ps.time, ps.duration FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN pitStops ps ON r.resultId = ps.raceId AND d.driverId = ps.driverId WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.year = 2011 AND r2.name = 'Australian Grand Prix');	formula_1
SELECT MIN(l.time) AS fastest_lap_time FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId WHERE LOWER(d.forename) = 'lewis' AND LOWER(d.surname) = 'hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.time = (SELECT MIN(time) FROM results);	formula_1
SELECT r.position FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.fastestLapTime = (SELECT MIN(r2.time) FROM results r2 WHERE r2.driverId = r.driverId);	formula_1
SELECT lt.time FROM lapTimes lt WHERE lt.raceId IN (SELECT r.circuitId FROM races r WHERE LOWER(r.name) LIKE '%austrian grand prix%') AND lt.position = 1 ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT c.name AS circuit_name, l.time AS fastest_lap_time FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes l ON r.raceId = l.raceId AND l.driverId IN (SELECT d.driverId FROM drivers d WHERE d.nationality = 'Italian') ORDER BY l.time ASC;	formula_1
SELECT r.name, l.time FROM races r JOIN lapTimes l ON r.raceId = l.raceId WHERE r.circuitId = (SELECT c.circuitId FROM circuits c WHERE c.name = 'Austrian Grand Prix') ORDER BY l.time ASC LIMIT 1;	formula_1
WITH AustrianGP AS (SELECT r.raceId, d.driverId, d.forename, d.surname, l.time, ps.time AS pitStopTime FROM races r JOIN drivers d ON r.year = d.dob::integer AND d.driverRef = r.name JOIN lapTimes l ON r.raceId = l.raceId AND d.driverId = l.driverId JOIN pitStops ps ON r.raceId = ps.raceId AND d.driverId = ps.driverId WHERE r.circuitId = (SELECT c.circuitId FROM circuits c WHERE c.name = 'Austrian Grand Prix')) SELECT AustrianGP.forename, AustrianGP.surname, AustrianGP.time, AustrianGP.pitStopTime FROM AustrianGP WHERE AustrianGP.time = (SELECT MIN(AustrianGP2.time) FROM AustrianGP AustrianGP2) AND AustrianGP.pitStopTime = (SELECT MIN(AustrianGP3.pitStopTime) FROM AustrianGP AustrianGP3 WHERE AustrianGP3.raceId = AustrianGP.raceId AND AustrianGP3.driverId = AustrianGP.driverId);	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN (SELECT r.circuitId, MIN(l.time) AS minTime FROM races r JOIN lapTimes l ON r.raceId = l.raceId GROUP BY r.circuitId) AS t ON c.circuitId = t.circuitId WHERE t.minTime = '1:29.488';	formula_1
SELECT AVG(ps.milliseconds) AS average_milliseconds FROM pitStops ps JOIN drivers d ON ps.driverId = d.driverId WHERE d.forename ilike '%Lewis%' AND d.surname ilike '%Hamilton%';	formula_1
SELECT AVG(lapTimes.milliseconds) AS average_lap_time FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN circuits ON lapTimes.raceId = races.circuitId WHERE circuits.country = 'Italy';	formula_1
SELECT pa.player_api_id, MAX(pa.overall_rating) AS max_overall_rating FROM Player_Attributes pa GROUP BY pa.player_api_id ORDER BY max_overall_rating DESC LIMIT 1;	european_football_2
SELECT p.player_name, MAX(p.height) FROM Player p GROUP BY p.player_name ORDER BY MAX(p.height) DESC LIMIT 1;	european_football_2
SELECT pa.preferred_foot FROM Player_Attributes pa WHERE pa.potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT p.player_api_id) FROM Player_Attributes p WHERE p.overall_rating >= 60 AND p.overall_rating < 65 AND p.defensive_work_rate = 'low';	european_football_2
SELECT p.player_api_id FROM "Player_Attributes" p WHERE p.crossing = (SELECT MAX(p2.crossing) FROM "Player_Attributes" p2) ORDER BY p.player_api_id LIMIT 5;	european_football_2
SELECT l.name, MAX(SUM(m.home_team_goal, m.away_team_goal)) AS total_goals FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY total_goals DESC LIMIT 1;	european_football_2
SELECT t.team_long_name, COUNT(*) AS lost_matches FROM Match m JOIN Team t ON m.home_team_api_id = t.team_api_id WHERE m.season = '2015/2016' AND (m.home_team_goal - m.away_team_goal) < 0 GROUP BY t.team_long_name ORDER BY lost_matches ASC LIMIT 1;	european_football_2
SELECT p.player_name, MAX(pa.penalties) AS max_penalties FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_name ORDER BY max_penalties DESC LIMIT 10;	european_football_2
SELECT m.away_team_api_id, COUNT(m.away_team_api_id) AS wins FROM Match m JOIN Team t ON m.away_team_api_id = t.team_api_id WHERE LOWER(t.team_short_name) = 'celtic' AND m.season = '2009/2010' GROUP BY m.away_team_api_id ORDER BY wins DESC NULLS LAST LIMIT 1;	european_football_2
SELECT t.team_fifa_api_id, MAX(t.buildUpPlaySpeed) AS max_build_up_play_speed FROM Team_Attributes t GROUP BY t.team_fifa_api_id ORDER BY max_build_up_play_speed DESC LIMIT 4;	european_football_2
SELECT l.name, MAX(SUM(m.home_team_goal = m.away_team_goal)) AS max_draws FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY max_draws DESC NULLS LAST LIMIT 1;	european_football_2
SELECT p.player_name, age(p.birthday) AS age FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.sprint_speed >= 97 AND pa.date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00' ORDER BY p.player_name;	european_football_2
SELECT l.name, COUNT(*) AS total_matches FROM Match m JOIN League l ON m.league_id = l.id GROUP BY l.name ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT p.player_api_id, p.player_name, MAX(pa.overall_rating) AS max_overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE substr(pa.date, 1, 4) = '2010' GROUP BY p.player_api_id, p.player_name ORDER BY max_overall_rating DESC NULLS LAST LIMIT 1;	european_football_2
SELECT t.team_fifa_api_id FROM Team_Attributes t WHERE t.buildUpPlaySpeed BETWEEN 51 AND 59;	european_football_2
SELECT t.team_long_name FROM Team t JOIN Team_Attributes ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE ta.date = '2012' AND (SELECT SUM(ta.buildUpPlayPassing) / NULLIF(COUNT(t.team_long_name), 0) FROM Team t JOIN Team_Attributes ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE ta.date = '2012' AND ta.buildUpPlayPassing IS NOT NULL) < ta.buildUpPlayPassing;	european_football_2
SELECT DIVIDE(MULTIPLY((SUM(CASE WHEN p.preferred_foot = 'left' THEN 1 ELSE 0 END), 1.0), COUNT(p.player_fifa_api_id)) AS percentage_of_left_footers FROM Player_Attributes p WHERE p.birthday BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00';	european_football_2
SELECT l.name, SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM Match m JOIN League l ON m.league_id = l.id GROUP BY l.name ORDER BY total_goals ASC NULLS LAST LIMIT 5;	european_football_2
SELECT AVG(p.long_shots) AS average_long_shots FROM Player_Attributes p JOIN Player p1 ON p.player_fifa_api_id = p1.player_fifa_api_id WHERE p1.player_name = 'Ahmed Samir Farag';	european_football_2
SELECT p.player_name, AVG(ha) AS avg_heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 GROUP BY p.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT t.team_long_name, AVG(t.chanceCreationPassing) AS average_passing FROM Team_Attributes t WHERE t.buildUpPlayDribblingClass = 'Normal' AND t.date >= '2014-01-01 00:00:00' AND t.date <= '2014-12-31 00:00:00' GROUP BY t.team_long_name HAVING SUM(t.chanceCreationPassing) / NULLIF(COUNT(t.id), 0) > t.chanceCreationPassing ORDER BY average_passing DESC;	european_football_2
SELECT l.name FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2009/2010' AND AVG(m.home_team_goal) > AVG(m.away_team_goal);	european_football_2
SELECT t.team_short_name FROM Team t WHERE t.team_long_name = 'Queens Park Rangers';	european_football_2
SELECT p.player_name FROM Player p WHERE p.height > 180 AND p.weight < 70;	european_football_2
SELECT pa.attacking_work_rate FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Franco Zennaro';	european_football_2
SELECT t.team_long_name, t.team_fifa_api_id, ta.buildUpPlayPositioningClass FROM Team t JOIN Team_Attributes ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE t.team_long_name = 'ADO Den Haag';	european_football_2
SELECT pa.Heading_Accuracy FROM Player_Attributes pa WHERE LOWER(pa.preferred_foot) = 'left' AND LOWER(pa.date) = '2014-09-18 00:00:00' AND LOWER(pa.player_name) = 'francois affolter';	european_football_2
SELECT p.overall_rating FROM Player_Attributes p WHERE p.player_api_id IN (SELECT pa.player_api_id FROM Player_Attributes pa WHERE strftime('%Y', pa.date) = '2011') ORDER BY p.overall_rating DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Match m JOIN League l ON m.league_id = l.id WHERE l.name = 'Scotland Premier League' AND m.season = '2015/2016';	european_football_2
SELECT pa.preferred_foot FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY p.birthday DESC LIMIT 1;	european_football_2
SELECT p.player_api_id, p.player_name, p.player_fifa_api_id, p.overall_rating, p.potential FROM Player p ORDER BY p.potential DESC;	european_football_2
SELECT COUNT(*) FROM Player p WHERE p.weight < 130 AND p.preferred_foot = 'left';	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT p.overall_rating, p.defensive_work_rate FROM Player_Attributes p WHERE p.player_api_id IN (SELECT pa.player_api_id FROM Player_Attributes pa WHERE pa.player_name = 'David Wilson');	european_football_2
SELECT p.player_name, p.birthday FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(pa2.overall_rating) FROM Player_Attributes pa2);	european_football_2
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE c.name = 'Netherlands';	european_football_2
SELECT AVG(M.home_team_goal) FROM Match M JOIN League L ON M.league_id = L.id JOIN Country C ON L.country_id = C.id WHERE C.name = 'Poland' AND M.season = '2010/2011';	european_football_2
SELECT p.player_name, AVG(pa.finishing) AS average_finishing_rate FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height = (SELECT MAX(height) FROM Player) OR p.height = (SELECT MIN(height) FROM Player) GROUP BY p.player_name ORDER BY average_finishing_rate DESC NULLS LAST LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p WHERE p.height > 180;	european_football_2
SELECT COUNT(*) FROM Player p WHERE strftime('%Y', p.birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player p WHERE p.player_name ilike 'Adam%' AND p.weight > 170;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010' ORDER BY p.player_name;	european_football_2
SELECT pa.potential FROM Player_Attributes pa WHERE LOWER(pa.player_name) = 'aaron doran';	european_football_2
SELECT p.player_name FROM Player p WHERE p.preferred_foot = 'left';	european_football_2
SELECT t.team_long_name FROM Team_Attributes ta JOIN Team t ON ta.team_fifa_api_id = t.team_fifa_api_id WHERE ta.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT t.buildUpPlayPassingClass FROM Team t WHERE t.team_short_name = 'CLB';	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.buildUpPlayPassing > 70;	european_football_2
SELECT AVG(pa.overall_rating) AS average_overall_rating FROM Player_Attributes pa WHERE strftime('%Y', pa.date) BETWEEN '2010' AND '2015' AND pa.height > 170;	european_football_2
SELECT p.player_name, p.height FROM Player p ORDER BY p.height ASC LIMIT 1;	european_football_2
SELECT l.country_id FROM League l WHERE l.name = 'Italy Serie A';	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.buildUpPlaySpeed = 31 AND ta.buildUpPlayDribbling = 53 AND ta.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(pa.overall_rating) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(*) FROM Match m WHERE LOWER(m.league_id) = 'germany 1. bundesliga' AND strftime('%Y-%m', m.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT t.team_short_name FROM Team t JOIN Match m ON t.team_api_id = m.home_team_api_id WHERE m.home_team_goal = 10;	european_football_2
SELECT p.player_name, MAX(pa.balance) AS balance_score, p.player_api_id FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = 61 GROUP BY p.player_name, p.player_api_id ORDER BY balance_score DESC NULLS LAST;	european_football_2
SELECT (AVG(pa.ball_control) - AVG(pa2.ball_control)) AS difference FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Abdou Diallo' UNION ALL SELECT (AVG(pa.ball_control) - AVG(pa2.ball_control)) AS difference FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Aaron Appindangoye';	european_football_2
SELECT t.team_long_name FROM Team t WHERE t.team_short_name = 'GEN';	european_football_2
SELECT pl1.player_name, pl2.player_name FROM Player AS pl1 JOIN Player AS pl2 ON pl1.player_api_id = pl2.player_api_id WHERE pl1.player_name = 'Aaron Lennon' AND pl2.player_name = 'Abdelaziz Barrada' ORDER BY pl1.birthday > pl2.birthday NULLS LAST LIMIT 1;	european_football_2
SELECT p.player_name, MAX(p.height) FROM Player p GROUP BY p.player_name ORDER BY MAX(p.height) DESC NULLS LAST LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';	european_football_2
SELECT l.country_id FROM League l WHERE l.name = 'Belgium Jupiler League';	european_football_2
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE c.name = 'Germany';	european_football_2
SELECT p.player_name, MAX(pa.overall_rating) AS max_overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_name ORDER BY max_overall_rating DESC NULLS LAST LIMIT 1;	european_football_2
SELECT COUNT(DISTINCT p.player_api_id) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', p.birthday)<'1986' AND pa.defensive_work_rate = 'high';	european_football_2
SELECT p.player_name, MAX(pa.crossing) AS max_crossing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') GROUP BY p.player_name ORDER BY max_crossing DESC LIMIT 1;	european_football_2
SELECT p.player_name, pa.heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name ilike '%Ariel Borysiuk%';	european_football_2
SELECT COUNT(*) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 AND pa.volleys > 70;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70 ORDER BY p.player_name;	european_football_2
SELECT COUNT(*) FROM Match m JOIN Country c ON m.country_id = c.id WHERE c.name = 'Belgium' AND m.season = '2008/2009';	european_football_2
SELECT MAX(p.age) AS age, p.player_name, pa.long_passing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.birthday = (SELECT MIN(birthday) FROM Player) ORDER BY age DESC NULLS LAST;	european_football_2
SELECT COUNT(*) FROM Match m JOIN League l ON m.league_id = l.id WHERE l.name = 'Belgium Jupiler League' AND strftime('%Y', m.date) = '2009' AND strftime('%m', m.date) = '04';	european_football_2
SELECT l.name FROM League l WHERE l.id = (SELECT MAX(m.league_id) FROM Match m WHERE m.season = '2008/2009');	european_football_2
SELECT AVG(DIVIDE(SUM(pa.overall_rating), COUNT(pa.id))) AS average_overall_rating FROM Player_Attributes pa WHERE strftime('%Y', pa.birthday) < '1986';	european_football_2
WITH b AS (SELECT (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Ariel Borysiuk') AS a, (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel') AS b), percentage AS (SELECT ((a - b) / NULLIF(b, 0)) * 100 AS percentage FROM b) SELECT percentage FROM percentage;	european_football_2
SELECT AVG(t.buildUpPlaySpeed) AS average_build_up_play_speed FROM Team t JOIN Player p ON t.team_api_id = p.team_api_id WHERE LOWER(t.team_long_name) = 'heart of midlothian';	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes T1 WHERE T1.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(t2.crossing) AS total_crossing_score FROM "Player_Attributes" t2 WHERE t2.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(t.buildUpPlayPassing) AS highest_passing_score, t.buildUpPlayPassingClass AS classification FROM Team_Attributes t JOIN Team t2 ON t.team_fifa_api_id = t2.team_fifa_api_id WHERE LOWER(t2.team_long_name) = 'ajax';	european_football_2
SELECT p.preferred_foot FROM Player_Attributes p WHERE p.player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(pa.overall_rating) AS highest_overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(M.away_team_goal) AS average_goals FROM Match M JOIN Team T ON M.away_team_api_id = T.team_api_id WHERE LOWER(T.team_long_name) = 'parma';	european_football_2
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.date = '2016/6/23' AND pa.overall_rating = 77 ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT p.overall_rating FROM Player_Attributes p WHERE p.player_api_id IN (SELECT p2.player_api_id FROM Player p2 WHERE p2.player_name = 'Aaron Mooy') AND p.date = '2016-02-04 00:00:00';	european_football_2
SELECT p.overall_rating, p.potential FROM Player_Attributes p WHERE p.date = '2010-08-30 00:00:00' AND p.player_name = 'Francesco Parravicini';	european_football_2
SELECT p.attacking_work_rate FROM Player_Attributes p WHERE p.player_name = 'Francesco Migliore' AND p.date = '2015-05-01 00:00:00';	european_football_2
SELECT pa.attacking_work_rate, pa.defensive_work_rate FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Kevin Berigaud' AND pa.date = '2013-02-22 00:00:00';	european_football_2
SELECT MAX(p.date) AS date FROM Player_Attributes p WHERE p.player_name = 'Kevin Constant';	european_football_2
SELECT t.buildUpPlaySpeedClass FROM Team_Attributes t JOIN Team ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE ta.team_long_name = 'Willem II' AND t.date = '2012-02-22 00:00:00';	european_football_2
SELECT t.buildUpPlayDribblingClass FROM Team_Attributes t JOIN Team ta ON t.team_api_id = ta.team_api_id WHERE ta.team_short_name = 'LEI' AND t.date = '2015-09-10 00:00:00';	european_football_2
SELECT t.buildUpPlayPassingClass FROM Team_Attributes t JOIN Team ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE ta.team_long_name = 'FC Lorient' AND t.date = '2010-02-22';	european_football_2
SELECT ta.buildUpPlayPassingClass FROM Team_Attributes ta JOIN Team t ON ta.team_fifa_api_id = t.team_fifa_api_id WHERE LOWER(t.team_long_name) = 'pec zwolle' AND ta.date = '2013-09-20 00:00:00';	european_football_2
SELECT t.buildUpPlayCrossingClass FROM "Team_Attributes" t JOIN Team t2 ON t.team_fifa_api_id = t2.team_fifa_api_id WHERE t2.team_long_name = 'Hull City' AND t.date = '2010-02-22 00:00:00';	european_football_2
SELECT t.team_fifa_api_id, ta.defenceAggressionClass FROM Team t JOIN Team_Attributes ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE t.team_long_name = 'Hannover 96' AND ta.date = '2015-09-10 00:00:00';	european_football_2
SELECT AVG(pa.overall_rating) FROM Player_Attributes pa WHERE pa.player_name = 'Marko Arnautovic' AND pa.date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00';	european_football_2
SELECT (pa.overall_rating - (SELECT pa2.overall_rating FROM Player_Attributes pa2 WHERE pa2.player_name = 'Jordan Bowery')) * 100.0 / NULLIF(pa.overall_rating, 0) AS percentage FROM Player_Attributes pa WHERE pa.player_name = 'Landon Donovan' AND pa.date = '2013-07-12';	european_football_2
SELECT p.player_name, MAX(p.height) FROM Player p GROUP BY p.player_name ORDER BY MAX(p.height) DESC NULLS LAST LIMIT 5;	european_football_2
SELECT p.player_api_id FROM Player p WHERE p.weight = (SELECT MAX(p2.weight) FROM Player p2);	european_football_2
SELECT p.player_name FROM Player p WHERE datetime(CURRENT_TIMESTAMP,'localtime') - datetime(p.birthday) > 34;	european_football_2
SELECT SUM(M.home_team_goal) AS total_home_goals FROM Match M JOIN Player P ON M.home_player_1 = P.player_api_id OR M.home_player_2 = P.player_api_id OR M.home_player_3 = P.player_api_id OR M.home_player_4 = P.player_api_id OR M.home_player_5 = P.player_api_id OR M.home_player_6 = P.player_api_id OR M.home_player_7 = P.player_api_id OR M.home_player_8 = P.player_api_id OR M.home_player_9 = P.player_api_id OR M.home_player_10 = P.player_api_id OR M.home_player_11 = P.player_api_id WHERE P.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(M.away_team_goal) AS total_away_goals FROM Match M JOIN Player P ON M.away_player_1 = P.player_api_id OR M.away_player_2 = P.player_api_id OR M.away_player_3 = P.player_api_id OR M.away_player_4 = P.player_api_id OR M.away_player_5 = P.player_api_id OR M.away_player_6 = P.player_api_id OR M.away_player_7 = P.player_api_id OR M.away_player_8 = P.player_api_id OR M.away_player_9 = P.player_api_id OR M.away_player_10 = P.player_api_id OR M.away_player_11 = P.player_api_id WHERE P.player_name = 'Daan Smith' OR P.player_name = 'Filipe Ferreira';	european_football_2
SELECT SUM(M.home_team_goal) AS total_home_goals FROM Match M JOIN Player P ON M.home_player_1 = P.player_api_id OR M.home_player_2 = P.player_api_id OR M.home_player_3 = P.player_api_id OR M.home_player_4 = P.player_api_id OR M.home_player_5 = P.player_api_id OR M.home_player_6 = P.player_api_id OR M.home_player_7 = P.player_api_id OR M.home_player_8 = P.player_api_id OR M.home_player_9 = P.player_api_id OR M.home_player_10 = P.player_api_id OR M.home_player_11 = P.player_api_id WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, TO_DATE(P.birthday, 'YYYY-MM-DD'))) <= 30;	european_football_2
SELECT p.player_name, MAX(pa.overall_rating) AS max_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_name ORDER BY max_rating DESC LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(pa2.potential) FROM Player_Attributes pa2);	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.attacking_work_rate = 'high';	european_football_2
SELECT p.player_name, MAX(DATEDIFF('year', p.birthday, CURRENT_DATE())) AS age FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.finishing = 1 GROUP BY p.player_name ORDER BY age DESC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN "Player_Attributes" pa ON p.player_api_id = pa.player_api_id JOIN "Team" t ON pa.player_fifa_api_id = t.team_fifa_api_id JOIN League l ON t.team_api_id = l.id JOIN Country c ON l.country_id = c.id WHERE c.name = 'Belgium';	european_football_2
SELECT p.player_name, p.country FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.vision > 89;	european_football_2
SELECT c.name, MAX(AVG(p.weight)) AS avg_weight FROM Player p JOIN Team t ON p.player_api_id = t.team_api_id JOIN Country c ON t.team_fifa_api_id = c.id GROUP BY c.name ORDER BY avg_weight DESC NULLS LAST LIMIT 1;	european_football_2
SELECT t.team_long_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_fifa_api_id = t.team_fifa_api_id WHERE ta.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(p.height) AS average_height FROM Player p JOIN "Player_Attributes" pa ON p.player_api_id = pa.player_api_id JOIN Team t ON p.player_api_id = t.team_api_id JOIN League l ON t.team_fifa_api_id = l.id JOIN Country c ON l.country_id = c.id WHERE c.name = 'Italy';	european_football_2
SELECT p.player_name FROM Player p WHERE p.height > 180 ORDER BY p.player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player p WHERE p.player_name LIKE 'Aaron%' AND p.birthday > '1990';	european_football_2
SELECT (pa.jumping AND pa.id = 6) - (pa.jumping AND pa.id = 23) AS difference FROM Player_Attributes pa WHERE pa.id IN (6, 23);	european_football_2
SELECT p.player_api_id FROM Player_Attributes p WHERE p.preferred_foot = 'right' ORDER BY p.potential ASC LIMIT 3;	european_football_2
SELECT COUNT(DISTINCT p.player_api_id) FROM Player_Attributes p WHERE p.crossing = (SELECT MAX(p2.crossing) FROM Player_Attributes p2) AND p.preferred_foot = 'left';	european_football_2
SELECT CAST(COUNT(CASE WHEN p.stamina > 80 AND p.strength > 80 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM Player_Attributes p;	european_football_2
SELECT m.country_id, c.name AS country_name FROM Match m JOIN League l ON m.league_id = l.id JOIN Country c ON l.country_id = c.id WHERE l.name = 'Poland Ekstraklasa';	european_football_2
SELECT m.home_team_goal AS home_score, m.away_team_goal AS away_score FROM Match m WHERE m.date = '2008-09-24';	european_football_2
SELECT p.sprint_speed, p.agility, p.acceleration FROM Player_Attributes p WHERE p.player_name = 'Alexis Blin';	european_football_2
SELECT t.buildUpPlaySpeedClass FROM Team t WHERE t.team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*) FROM Match m WHERE m.league_id IN (SELECT id FROM League WHERE name = 'Italian Serie A') AND m.season = '2015/2016';	european_football_2
SELECT MAX(m.home_team_goal) AS highest_score FROM Match m JOIN Team t ON m.home_team_api_id = t.team_api_id JOIN League l ON t.team_api_id = l.id WHERE l.name = 'Netherlands Eredivisie';	european_football_2
SELECT p.player_name, pa.finishing, pa.curve FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.weight = (SELECT MAX(p2.weight) FROM Player p2);	european_football_2
SELECT t.team_long_name, COUNT(m.id) AS game_count FROM Match m JOIN Team t ON m.home_team_api_id = t.team_api_id OR m.away_team_api_id = t.team_api_id WHERE m.date BETWEEN '2015-08-01' AND '2016-05-31' GROUP BY t.team_long_name ORDER BY game_count DESC LIMIT 1;	european_football_2
SELECT t.team_long_name FROM Team t JOIN Match m ON t.team_api_id = m.away_team_api_id WHERE m.away_team_goal = (SELECT MAX(m2.away_team_goal) FROM Match m2);	european_football_2
SELECT p.player_name, p.player_api_id FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(pa2.overall_rating) FROM Player_Attributes pa2);	european_football_2
SELECT (COUNT(CASE WHEN p.height < 180 AND p.overall_rating > 70 THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage FROM Player_Attributes p;	european_football_2
SELECT (COUNT(DISTINCT CASE WHEN p.SEX = 'M' AND p.Admission = '+' THEN p.ID ELSE NULL END) - COUNT(DISTINCT CASE WHEN p.SEX = 'M' AND p.Admission = '-' THEN p.ID ELSE NULL END))::FLOAT / NULLIF(COUNT(DISTINCT CASE WHEN p.SEX = 'M' AND p.Admission = '+' THEN p.ID ELSE NULL END), 0) * 100 AS percentage FROM Patient p;	thrombosis_prediction
SELECT DIVIDE(COUNT(DISTINCT CASE WHEN YEAR(P.Birthday) > '1930' AND P.SEX = 'F' THEN P.ID END), COUNT(DISTINCT CASE WHEN P.SEX = 'F' THEN P.ID END)) AS percentage FROM Patient P;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN p.Admission = '+' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS proportion_inpatient FROM Patient p WHERE p.Birthday BETWEEN '1930-01-01' AND '1940-12-31';	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN Admission = '+' THEN ID END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN Admission = '-' THEN ID END), 0) AS ratio FROM Patient WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT p.Description, l.Date FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.ID = 30609;	thrombosis_prediction
SELECT p.SEX, p.Birthday, e.`Examination Date`, e.Symptoms FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 163109;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 500;	thrombosis_prediction
SELECT p.ID, age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RVVT = '+';	thrombosis_prediction
SELECT p.ID, p.SEX, e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 2;	thrombosis_prediction
SELECT p.ID, p.Description FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE EXTRACT(YEAR FROM p.Birthday) = 1937 AND l.`T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT DIVIDE(COUNT(CASE WHEN p.SEX = 'F' AND l.TP < '6.0' OR l.TP > '8.5' THEN p.ID END), COUNT(p.ID)) * 100 AS percentage FROM Patient p JOIN Laboratory l ON p.ID = l.ID;	thrombosis_prediction
SELECT AVG(e.aCL IgG) AS average_aCL_IgG FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Admission = '+' AND (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Birthday)) >= 50;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p WHERE p.SEX = 'F' AND EXTRACT(YEAR FROM p.Description) = 1997 AND p.Admission = '-';	thrombosis_prediction
SELECT MIN(age) FROM (SELECT EXTRACT(YEAR FROM AGE(P.Birthday, P.`First Date`)) AS age FROM Patient P) AS subquery;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 1 AND p.SEX = 'F' AND EXTRACT(YEAR FROM e.`Examination Date`) = 1997;	thrombosis_prediction
SELECT MAX(year(Birthday)) - MIN(year(Birthday)) AS age_gap FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200;	thrombosis_prediction
SELECT p.DESCRIPTION, e.SYMPTOMS, e.DIAGNOSIS FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.BIRTHDAY = (SELECT MIN(BIRTHDAY) FROM Patient);	thrombosis_prediction
SELECT DIVIDE(COUNT(DISTINCT l.ID), 12) AS avg_patients_per_month FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.Date BETWEEN '1998-01-01' AND '1998-12-31' AND p.SEX = 'M';	thrombosis_prediction
SELECT MAX(P.Birthday) AS oldest_patient_birthday, (YEAR(P.`First Date`) - YEAR(P.Birthday)) AS age_at_admission FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Diagnosis = 'SJS' GROUP BY P.ID ORDER BY P.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT DIVIDE(SUM(CASE WHEN UA <= 8.0 AND SEX = 'M' THEN 1 ELSE 0 END), SUM(CASE WHEN UA <= 6.5 AND SEX = 'F' THEN 1 ELSE 0 END)) AS ratio FROM Laboratory;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p WHERE p.ID NOT IN (SELECT e.ID FROM Examination e WHERE DATEDIFF(YEAR, e.`Examination Date`, p.`First Date`) >= 1);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE EXTRACT(YEAR FROM p.Birthday) < 18 AND e.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31';	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.`T-BIL` > 2.0;	thrombosis_prediction
SELECT e.Diagnosis, COUNT(e.Diagnosis) AS diagnosis_count FROM Examination e WHERE e.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY e.Diagnosis ORDER BY diagnosis_count DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(EXTRACT(YEAR FROM age(CURRENT_DATE, p.Birthday))) AS average_age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.ID IN (SELECT l.ID FROM Laboratory l WHERE l.Date BETWEEN '1991-10-01' AND '1991-10-30');	thrombosis_prediction
SELECT EXTRACT(YEAR FROM AGE(p.Birthday, e.`Examination Date`)) AS age_at_examination, p.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.ID IN (SELECT ID FROM Examination ORDER BY HGB DESC LIMIT 1);	thrombosis_prediction
SELECT e.`aCL IgG` FROM Examination e WHERE e.ID = 3605340 AND e.`Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT l.t_cholesterol FROM laboratory l WHERE l.id = 2927464 AND l.date = '1995-09-04' AND l.t_cholesterol < 250;	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE LOWER(e.Diagnosis) = 'aortitis' ORDER BY p.ID LIMIT 1;	thrombosis_prediction
SELECT e.aCL IgM FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Description = '1994-02-19' AND p.Diagnosis = 'SLE' AND e.Description = '1993/11/12';	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date = '1992-06-12' AND l.GPT = 9;	thrombosis_prediction
SELECT SUBTRACT('1992', YEAR(P.Birthday)) AS age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.UA = '8.4' AND L.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(l.ID) AS total_tests FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.`First Date` = '1991-06-13' AND p.Diagnosis = 'SJS' AND l.Date BETWEEN '1995-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT p.Description FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND e.`Examination Date` = '1997-01-27' AND p.`First Date` = (SELECT MIN(p2.`First Date`) FROM Patient p2 WHERE p2.ID = p.ID);	thrombosis_prediction
SELECT e.Symptoms FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday = '1959-03-01' AND e.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT (SUM(CASE WHEN l.date like '1981-11-%' THEN l.`T-CHO` ELSE 0 END) - SUM(CASE WHEN l.date like '1981-12-%' THEN l.`T-CHO` ELSE 0 END))/NULLIF(SUM(CASE WHEN l.date like '1981-12-%' THEN l.`T-CHO` ELSE 0 END), 0) AS percentage_change FROM Laboratory l JOIN Patient p ON l.id = p.id WHERE p.birthday = '1959-02-18' AND l.date BETWEEN '1981-11-01' AND '1981-12-31';	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE LOWER(p.Diagnosis) = 'behcet' AND EXTRACT(YEAR FROM e.`Examination Date`) >= 1997 AND EXTRACT(YEAR FROM e.`Examination Date`) < 1998 ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT e.ID FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.Date BETWEEN '1987-07-06' AND '1996-01-31' AND l.GPT > 30 AND l.ALB < 4 ORDER BY e.ID;	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE p.SEX = 'F' AND EXTRACT(YEAR FROM p.Birthday) = 1964 AND p.Admission = '+' ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.Thrombosis = 2 AND e.ANA = 'S' AND e.`aCL IgM` > (AVG(e.`aCL IgM`) * 1.2);	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN UA <= 6.5 THEN 1 END) * 100.0 / NULLIF(COUNT(DISTINCT CASE WHEN (U_PRO > 0 AND U_PRO < 30) THEN 1 END), 0) AS DECIMAL(5,2)) AS percentage FROM Laboratory;	thrombosis_prediction
SELECT DIVIDE(SUM(CASE WHEN P.DIAGNOSIS = 'BEHCET' THEN 1 ELSE 0 END), COUNT(*), 100) AS percentage FROM Patient P WHERE P.SEX = 'M' AND YEAR(P.`FIRST DATE`) = 1981;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.Date like '1991-10%' AND l.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p WHERE p.SEX = 'F' AND p.BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31' AND p.`ANA Pattern`!= 'P';	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'PSS' AND l.CRP > 2 AND l.CRE = 1 AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(L.ALB) AS average_albumin_level FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.PLT > 400 AND P.SEX = 'F' AND P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT MAX(e.Symptoms) AS most_common_sign FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Diagnosis = 'SLE';	thrombosis_prediction
SELECT p.`First Date`, p.Diagnosis FROM Patient p WHERE p.ID = 48473;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND e.Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = 1997 AND (l.TP < 6 OR l.TP > 8.5);	thrombosis_prediction
SELECT DIVIDE(SUM(CASE WHEN e.Diagnosis LIKE '%Thrombosis%' THEN 1 ELSE 0 END), SUM(CASE WHEN e.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END)) * 100 AS proportion FROM Examination e;	thrombosis_prediction
SELECT (COUNT(CASE WHEN P.SEX = 'F' THEN 1 END)::FLOAT / NULLIF(COUNT(P.SEX), 0)) * 100 AS percentage FROM Patient P WHERE YEAR(P.BIRTHDAY) = '1980' AND P.Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND p.Diagnosis = 'BEHCET' AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(e.`Examination Date`, p.`First Date`) AS days_to_examination FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.ID = 821298;	thrombosis_prediction
SELECT l.ua FROM laboratory l JOIN patient p ON l.id = p.id WHERE p.id = 57266 AND ((l.ua > 8.0 AND p.sex = 'M') OR (l.ua > 6.5 AND p.sex = 'F'));	thrombosis_prediction
SELECT e."Examination Date" FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID WHERE p.ID = 48473 AND l.GOT >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ID IN (SELECT l.ID FROM Laboratory l WHERE l.ID = p.ID AND l.Date = '1994-01-01' AND l.GOT < 60);	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GPT >= 60;	thrombosis_prediction
SELECT p.Diagnosis, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 60 ORDER BY p.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT p.ID, age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT p.admission, COUNT(*) AS number_of_patients FROM laboratory l JOIN patient p ON l.id = p.id WHERE l.alp < 300 GROUP BY p.admission;	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE EXTRACT(MONTH FROM p.Birthday) = 4 AND EXTRACT(DAY FROM p.Birthday) = 1 AND EXTRACT(YEAR FROM p.Birthday) = 1982 AND (SELECT l.ALP FROM Laboratory l WHERE l.ID = p.ID AND l.Date = (SELECT MAX(l2.Date) FROM Laboratory l2 WHERE l2.ID = p.ID)) < 300;	thrombosis_prediction
SELECT p.ID, p.SEX, p.`Birthday` FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT (L.TP - 8.5) AS deviation FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.TP > 8.5;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND (l.ALB <= 3.5 OR l.ALB >= 5.5) ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT p.ID, p.Birthday, l.ALB FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = '1982' AND l.ALB BETWEEN 3.5 AND 5.5;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN (l.ua > 8 AND p.sex = 'M') OR (l.ua > 6.5 AND p.sex = 'F') THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM Laboratory l JOIN Patient p ON l.id = p.id WHERE l.id IN (SELECT e.id FROM Examination e WHERE e.thrombosis IS NOT NULL);	thrombosis_prediction
SELECT AVG(L.UA) AS average_UA FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.UA < COALESCE((CASE WHEN P.SEX = 'M' THEN 8.0 ELSE 6.5 END), 0);	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN < 30 AND p.Diagnosis = 'RA' ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.CRE >= 1.5;	thrombosis_prediction
SELECT CASE WHEN SUM(CASE WHEN LATERAL (SEX = 'M') THEN 1 ELSE 0 END) > SUM(CASE WHEN LATERAL (SEX = 'F') THEN 1 ELSE 0 END) THEN TRUE ELSE FALSE END AS answer FROM Laboratory WHERE CRE >= 1.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, l.Date, MAX(l.T_BIL) AS max_t_bil FROM Patient p JOIN Laboratory l ON p.ID = l.ID GROUP BY p.ID, p.SEX, p.Birthday, l.Date ORDER BY max_t_bil DESC LIMIT 1;	thrombosis_prediction
SELECT p.sex, COUNT(*) FROM patient p JOIN examination e ON p.id = e.id JOIN laboratory l ON p.id = l.id WHERE l.t_bil >= 2.0 GROUP BY p.sex ORDER BY p.sex NULLS LAST;	thrombosis_prediction
SELECT p.ID, MAX(l.T-CHO) AS T_CHO FROM Patient p JOIN Laboratory l ON p.ID = l.ID GROUP BY p.ID ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT AVG(DIVIDE(SUM(SUBTRACT(YEAR(NOW()), YEAR(p.Birthday))), COUNT(p.ID))) AS average_age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.`T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.TG > 300;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.TG >= 200 AND (EXTRACT(YEAR FROM age(CURRENT_DATE, p.Birthday)) > 50);	thrombosis_prediction
SELECT DISTINCT l.ID FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.Admission = '-' AND l.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND EXTRACT(YEAR FROM p.Birthday) BETWEEN 1936 AND 1956 AND l.CPK >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU >= 180 AND l.T_CHO < 250;	thrombosis_prediction
SELECT p.ID, l.GLU FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE EXTRACT(YEAR FROM p.Description) >= 1991 AND l.GLU < 180;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, EXTRACT(YEAR FROM age(now(), p.Birthday)) AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.WBC <= 3.5 OR l.WBC >= 9.0 GROUP BY p.SEX, age ORDER BY p.SEX, age ASC;	thrombosis_prediction
SELECT p.ID, p.Diagnosis, (EXTRACT(YEAR FROM age(CURRENT_DATE, p.Birthday))) AS age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.RBC < 3.5;	thrombosis_prediction
SELECT p.ID, p.Description, l.RBC FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND (SUBTRACT(year(current_timestamp), year(p.Birthday)) >= 50) AND (l.RBC <= 3.5 OR l.RBC >= 6.0) AND p.Admission = '+' ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.HGB < 10;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND p.Birthday = (SELECT MIN(Birthday) FROM Patient p2 JOIN Examination e2 ON p2.ID = e2.ID WHERE e2.Diagnosis = 'SLE' AND 10 < p2.HGB AND p2.HGB < 17) ORDER BY p.ID NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT p.ID, age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE age >= 18 AND age <= 80 AND COUNT(l.ID) > 2 AND HCT >= 52 ORDER BY age NULLS LAST;	thrombosis_prediction
SELECT AVG(L.HCT) AS average_hematocrit FROM Laboratory L WHERE L.Date LIKE '1991%' AND L.HCT < 29;	thrombosis_prediction
SELECT (SUM(CASE WHEN L.PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN L.PLT > 400 THEN 1 ELSE 0 END)) AS difference FROM Laboratory L;	thrombosis_prediction
SELECT p.id, p.description FROM patient p JOIN laboratory l ON p.id = l.id WHERE date like '1984%' AND (EXTRACT(YEAR FROM age(CURRENT_DATE, birthday)) < 50) AND (l.plt BETWEEN 100 AND 400);	thrombosis_prediction
SELECT DIVIDE(SUM(CASE WHEN L.PT >= 14 AND P.SEX = 'F' THEN 1 ELSE 0 END), SUM(CASE WHEN L.PT >= 14 THEN 1 ELSE 0 END)) * 100 AS percentage FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE SUBTRACT(YEAR(CURRENT_TIMESTAMP()), YEAR(P.Birthday)) > 55 AND L.PT >= 14;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.`First Date` > '1992-01-01' AND l.PT < 14 ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.`Examination Date` > '1997-01-01' AND e.APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.APTT > 45 AND e.Thrombosis = 3;	thrombosis_prediction
SELECT COUNT(DISTINCT l.ID) FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.SEX = 'M' AND l.WBC BETWEEN 3.5 AND 9.0 AND (l.FG <= 150 OR l.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday > '1980-01-01' AND l.FG BETWEEN 150 AND 450;	thrombosis_prediction
SELECT DISTINCT e.Diagnosis FROM Examination e WHERE e.`U-PRO` >= 30;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`U-PRO` BETWEEN 0 AND 30 AND e.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ID IS NOT NULL AND l.IGG < 900 AND p.Symptoms = 'abortion';	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.IDG BETWEEN 900 AND 2000 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ID IN (SELECT l.ID FROM Laboratory l WHERE l.IGA BETWEEN 80 AND 500 ORDER BY l.IGA DESC LIMIT 1) ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IDA BETWEEN 80 AND 500 AND YEAR(p.`First Date`) >= 1990;	thrombosis_prediction
SELECT d.Diagnosis, COUNT(Diagnosis) AS count FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.IGM NOT BETWEEN 40 AND 400 GROUP BY d.Diagnosis ORDER BY count DESC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l WHERE l.CRP IS NULL AND (l.CRP LIKE '+' OR l.CRP LIKE '-' OR l.CRP < 1.0);	thrombosis_prediction
SELECT COUNT(DISTINCT a.ID) FROM Laboratory a WHERE a.CRP NOT IN ('+-', '-') AND a.CRP >= 1.0 AND (YEAR(CURRENT_DATE) - YEAR(a.ID)) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT a.ID) FROM Examination a JOIN Laboratory b ON a.ID = b.ID WHERE b.RA = '-' AND b.KCT = '+';	thrombosis_prediction
SELECT e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE YEAR(p.Birthday) >= 1995 AND e.RA IN ('-', '+-');	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE (SUBTRACT(YEAR(CURDATE()), YEAR(p.Birthday)) > 60) AND (CAST(LAB.RF AS INTEGER) < 20) FROM Laboratory LAB JOIN Patient p ON LAB.ID = p.ID;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.RF < 20 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT t.ID) FROM Laboratory t JOIN Examination e ON t.ID = e.ID WHERE t.C3 > 35 AND e.ANA = 'P';	thrombosis_prediction
SELECT e.ID FROM Examination e WHERE e.`aCL IgA` = (SELECT MAX(e2.`aCL IgA`) FROM Examination e2 WHERE e2.`aCL IgA` IS NOT NULL AND (e2.`aCL IgA` < 29 OR e2.`aCL IgA` > 52));	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 1 AND e.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Admission = '+' AND e.RNP IN ('-', '+-');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RNP NOT IN ('-', '+-') ORDER BY p.Birthday ASC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.SMILAC IN ('-', '+-') AND e.Thrombosis = 1;	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE p.SSA NOT IN ('-', '+-') ORDER BY p.Birthday ASC LIMIT 3;	thrombosis_prediction
SELECT e.ID FROM Examination e WHERE e.`Examination Date` >= '1997-01-01' AND e.SC170 IN ('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE LOWER(p.SEX) ='m' AND LOWER(e.SYMPTOMS) ='vertigo' AND e.SCAT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE LOWER(e.SSA) IN ('-', '+-') AND YEAR(p.`First Date`) < 1990;	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE p.ID IN (SELECT e.ID FROM Examination e WHERE e.SSA NOT IN ('-', '+-') ORDER BY p.`First Date` ASC LIMIT 1);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE LOWER(e.SSA) IN ('-', '+-') AND LOWER(p.Diagnosis) ='sle';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.SSB IN ('-', '+-') AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.CENTROMEA IN ('-', '+-') AND e.SSB IN ('-', '+-');	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`DNA-II` >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p WHERE p.Description IS NULL AND p.DNA <= 8;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.`DNA-II` >= 8 AND e.Admission = '+';	thrombosis_prediction
SELECT MULTIPLY(DIVIDE(COUNT(e.ID WHERE e.GOT >= 60 AND e.Diagnosis = 'SLE'), COUNT(e.ID WHERE e.GOT >= 60)), 1.0) AS percentage FROM Examination e;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GOT < 60;	thrombosis_prediction
SELECT MIN(P.Birthday) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT >= 60;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 60 ORDER BY l.GPT DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GOT < 60;	thrombosis_prediction
SELECT p.first_date FROM patient p JOIN laboratory l ON p.id = l.id WHERE l.ldh < 500 GROUP BY p.first_date ORDER BY p.first_date ASC LIMIT 1;	thrombosis_prediction
SELECT MAX(p."First Date") AS latest_date FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH >= 500;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l WHERE l.ID IN (SELECT e.ID FROM Examination e WHERE e.LAC LIKE '%hospital%') AND l.ALP >= 300;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.ALB < 300;	thrombosis_prediction
SELECT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.Diagnosis = 'SJS' AND e.TP > 6.0 AND e.TP < 8.5;	thrombosis_prediction
SELECT e.ID, e.`Examination Date` FROM Examination e WHERE e.ALB = (SELECT MAX(ALB) FROM Examination WHERE ALB > 3.5 AND ALB < 5.5);	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT e.aCL IgG, e.aCL IgM, e.aCL IgA FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID WHERE p.SEX = 'F' AND l.UA > 6.50 ORDER BY l.UA DESC LIMIT 1;	thrombosis_prediction
SELECT p.ID, MAX(e.ANA) AS ANA_Level FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.CRE < 1.5 GROUP BY p.ID ORDER BY ANA_Level DESC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT e.ID FROM Examination e WHERE e.CRE < 1.5 ORDER BY e.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.`T-BIL` >= 2.0 AND e.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT MAX(e.ANA) AS ANA FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.`T-CHO` >= 250 AND e.KCT = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-CHO` < 250 AND l.ANA = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.TG < 200 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG < 200 ORDER BY l.TG DESC LIMIT 1;	thrombosis_prediction
SELECT e.ID FROM Examination e WHERE e.Thrombosis = 0 AND e.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) AS number_of_patients FROM Examination e WHERE e.CPK < 250 AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU > 180 ORDER BY p.Birthday ASC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.ID = e.ID AND l.GLU < 180 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID IN (SELECT e.ID FROM Examination e WHERE e.RBC <= 3.5 OR e.RBC >= 6.0) AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.ID IN (SELECT e.ID FROM Examination e WHERE e.PLT > 100 AND e.PLT < 400) AND p.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT p.ID, l.PLT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'MCTD' AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT AVG(L.PT) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'M' AND L.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis IN (1, 2) AND e.PT < 14;	thrombosis_prediction
SELECT m.major_name FROM member m JOIN major m1 ON m.link_to_major = m1.major_id WHERE m.first_name = 'Angela' AND m.last_name = 'Sanders';	student_club
SELECT COUNT(*) FROM member m JOIN major m2 ON m.link_to_major = m2.major_id WHERE m2.department = 'Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.department ilike '%Art%Design%' AND mjr.department not ilike '%Student%';	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name ilike '%Women''s%Soccer%';	student_club
SELECT m.phone FROM event e JOIN "attendance" a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*) AS number_of_students FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.t_shirt_size = 'Medium' AND e.event_name ilike '%Women''s Soccer%';	student_club
SELECT e.event_name, COUNT(a.link_to_event) AS attendance_count FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE a.link_to_member IN (SELECT m.member_id FROM member m WHERE m.link_to_major IN (SELECT m.major_id FROM major m WHERE m.department = 'Student_Club')) GROUP BY e.event_id, e.event_name ORDER BY attendance_count DESC LIMIT 1;	student_club
SELECT m.college FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.position = 'Vice President' AND e.event_name = 'Student_Club';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE LOWER(m.first_name) ='maya' AND LOWER(m.last_name) ='mclean';	student_club
SELECT COUNT(*) AS num_events FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE a.link_to_member = 'Sacha Harrison' AND EXTRACT(YEAR FROM e.event_date::DATE) = 2019;	student_club
SELECT COUNT(*) AS number_of_meetings FROM (SELECT link_to_event FROM attendance WHERE link_to_member IN (SELECT member_id FROM member WHERE link_to_major = 'Student_Club' GROUP BY member_id HAVING COUNT(link_to_event) > 10)) AS subquery;	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event GROUP BY e.event_name HAVING COUNT(a.link_to_event) > 20;	student_club
SELECT AVG(DIVIDE(COUNT(event_id), COUNT(DISTINCT event_name))) AS average_attendance FROM event WHERE LOWER(type) ='meeting' AND YEAR(event_date) = 2020;	student_club
SELECT e.expense_description, MAX(e.cost) AS max_cost FROM expense e WHERE e.expense_description ilike '%in support of club events%' GROUP BY e.expense_description ORDER BY max_cost DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE LOWER(ma.major_name) = 'environmental engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE LOWER(ma.major_name) = 'law and constitutional studies';	student_club
SELECT m.zip, z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.last_name = 'Ramsey' AND m.first_name = 'Sherri';	student_club
SELECT m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.member_id = 'Hewitt_Tyler';	student_club
SELECT SUM(i.amount) AS total_amount FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Food' AND e.event_name = 'September Meeting';	student_club
SELECT m.city, m.state FROM member m JOIN "attendance" a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.type = 'President' ORDER BY m.city NULLS LAST, m.state NULLS LAST;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'IL';	student_club
SELECT SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.event_status = 'September Meeting' AND b.category = 'Advertisement';	student_club
SELECT m.department FROM major m JOIN member m1 ON m.major_id = m1.link_to_major WHERE m1.member_id IN ('Pierce', 'Guidi');	student_club
SELECT SUM(b.amount) FROM budget b WHERE b.event_status = 'October Speaker';	student_club
SELECT e.expense_id, e.expense_description, e.approved FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08' AND b.event_status = 'approved';	student_club
SELECT SUM(e.cost) AS total_cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE b.event_status = 'approved' AND MONTH(e.expense_date) IN (9, 10) AND e.link_to_member = 'Elijah Allen';	student_club
SELECT (SUM(CASE WHEN YEAR(e.event_date) = 2020 THEN b.spent ELSE 0 END) - SUM(CASE WHEN YEAR(e.event_date) = 2019 THEN b.spent ELSE 0 END)) AS difference FROM event e JOIN budget b ON e.event_id = b.link_to_event;	student_club
SELECT e.location FROM event e WHERE e.event_name = 'Spring Budget Review';	student_club
SELECT SUM(e.cost) AS total_cost FROM "expense" e WHERE e.expense_description ilike '%Poster%' AND e.expense_date = '2019-09-04';	student_club
SELECT MAX(b.amount) AS max_food_budget, b.remaining FROM budget b WHERE b.category = 'Food' ORDER BY max_food_budget DESC LIMIT 1;	student_club
SELECT e.notes FROM event e WHERE e.event_date = '2019-09-14' AND e.type = 'Fundraising';	student_club
SELECT COUNT(DISTINCT m.major_id) FROM major m WHERE LOWER(m.college) = 'college of humanities and social sciences';	student_club
SELECT m.phone FROM member m WHERE m.first_name = 'Carlo' AND m.last_name = 'Jacobs';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.member_id IN (SELECT link_to_member FROM attendance WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'Adela O''Gallagher'));	student_club
SELECT COUNT(*) FROM budget b WHERE b.event_status = 'November Meeting' AND b.remaining < 0;	student_club
SELECT SUM(b.amount) AS total_amount FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name ilike '%September%Speaker%';	student_club
SELECT b.event_status FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE e.expense_description ilike '%Post Cards, Posters%' AND e.expense_date = '2019-8-20';	student_club
SELECT m.major_name FROM member m WHERE m.member_id = 'Brent Thomason';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Human Development and Family Studies') AND t_shirt_size = 'Large';	student_club
SELECT z.type FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.last_name = 'Nielson' AND m.first_name = 'Christof';	student_club
SELECT m.major_name FROM member m JOIN "attendance" a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.position = 'Vice President';	student_club
SELECT z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name ||'' || m.last_name = 'Sacha Harrison';	student_club
SELECT m.department FROM member m JOIN "attendance" a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.position = 'President' AND e.type = 'President';	student_club
SELECT i.date_received FROM income i WHERE i.link_to_member = (SELECT m.member_id FROM member m WHERE m.first_name ilike '%Connor%' AND m.last_name ilike '%Hilton%') AND i.source = 'Dues';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1;	student_club
SELECT DIVIDE(SUM(b.amount WHERE b.category = 'Advertisement' AND b.link_to_event = a.event_id), SUM(b.amount WHERE b.category = 'Advertisement' AND b.link_to_event = c.event_id)) AS ratio FROM event a, event c, budget b WHERE a.event_name = 'Yearly Kickoff' AND c.event_name = 'October Meeting';	student_club
SELECT (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) / NULLIF(SUM(b.amount), 0)) * 100 AS percentage FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Speaker';	student_club
SELECT SUM(e.cost) AS total_cost_of_pizzas FROM "expense" e WHERE e.expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT z.city) FROM zip_code z WHERE LOWER(z.county) = 'orange' AND LOWER(z.state) = 'virginia';	student_club
SELECT DISTINCT m.department FROM major m WHERE m.college = 'College of Humanities and Social Sciences';	student_club
SELECT m.zip, z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.last_name = 'Firth' AND m.first_name = 'Amy';	student_club
SELECT e.expense_description FROM budget b JOIN expense e ON b.link_to_budget = e.link_to_budget WHERE b.remaining = (SELECT MIN(remaining) FROM budget);	student_club
SELECT m.member_id, m.first_name, m.last_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.event_name = 'October Meeting';	student_club
SELECT m.college, COUNT(m.college) AS num_members FROM member m GROUP BY m.college ORDER BY num_members DESC LIMIT 1;	student_club
SELECT m.major_name FROM member m WHERE m.phone = '809-555-3360';	student_club
SELECT e.event_name, MAX(b.amount) AS highest_budget FROM event e JOIN budget b ON e.event_id = b.link_to_event GROUP BY e.event_name ORDER BY highest_budget DESC NULLS LAST LIMIT 1;	student_club
SELECT e.expense_description, e.cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM "attendance" a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name ilike '%Women''s Soccer%';	student_club
SELECT i.date_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name = 'Casey' AND m.last_name = 'Mason';	student_club
SELECT COUNT(*) FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE LOWER(z.state) ='maryland';	student_club
SELECT COUNT(DISTINCT a.link_to_event) AS number_of_events FROM attendance a JOIN event e ON a.link_to_event = e.event_id JOIN member m ON a.link_to_member = m.member_id WHERE m.phone = '954-555-6240';	student_club
SELECT m.first_name ||'' || m.last_name AS full_name FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.department ilike '%School of Applied Sciences, Technology and Education%';	student_club
SELECT e.event_name, b.spent::FLOAT / NULLIF(b.amount, 0) AS spend_to_budget_ratio FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' ORDER BY spend_to_budget_ratio DESC NULLS LAST LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM "member" m WHERE m.position = 'President';	student_club
SELECT MAX(b.spent) AS max_spent FROM budget b;	student_club
SELECT COUNT(*) FROM event e WHERE LOWER(e.type) ='meeting' AND EXTRACT(YEAR FROM e.event_date::DATE) = 2020;	student_club
SELECT SUM(b.spent) AS total_spent_on_food FROM budget b WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, COUNT(a.link_to_event) AS event_count FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.first_name, m.last_name HAVING COUNT(a.link_to_event) > 7 ORDER BY event_count DESC NULLS LAST;	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Georgetown' AND z.state = 'South Carolina' ORDER BY m.first_name, m.last_name;	student_club
SELECT SUM(i.amount) AS total_income FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name ilike '%Grant%' AND m.last_name ilike '%Gilmour%';	student_club
SELECT m.first_name ||'' || m.last_name AS full_name, SUM(i.amount) AS total_income FROM income i JOIN member m ON i.link_to_member = m.member_id GROUP BY m.first_name, m.last_name HAVING SUM(i.amount) > 40;	student_club
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name ilike '%Yearly Kickoff%';	student_club
SELECT m.first_name, m.last_name, i.amount, i.source FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE m.link_to_major IS NOT NULL GROUP BY m.first_name, m.last_name, i.amount, i.source ORDER BY i.amount DESC LIMIT 1;	student_club
SELECT e.event_name, MIN(e.cost) AS min_cost FROM event e JOIN budget b ON e.event_id = b.link_to_event GROUP BY e.event_name ORDER BY min_cost ASC LIMIT 1;	student_club
SELECT (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN e.notes::REAL END) / NULLIF(SUM(e.notes::REAL), 0)) * 100 AS percentage FROM event e;	student_club
SELECT SUM(CASE WHEN m.major_name = 'Finance' THEN 1 ELSE 0 END)::FLOAT / NULLIF(SUM(CASE WHEN m.major_name = 'Physics' THEN 1 ELSE 0 END), 0) AS ratio FROM major m;	student_club
SELECT MAX(i.source) AS top_source FROM "income" i WHERE i.date_received BETWEEN '2019-09-01' AND '2019-09-30';	student_club
SELECT m.first_name, m.last_name, m.email FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE m.position = 'Secretary' AND mjr.department = 'Student Club';	student_club
SELECT COUNT(*) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.major_name) = 'physics teaching';	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Community Theater' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(DISTINCT a.link_to_event) AS number_of_events, m.major_name FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.last_name = 'Guidi' AND m.first_name = 'Luisa';	student_club
SELECT DIVIDE(SUM(b.spent), COUNT(b.spent)) FROM budget b WHERE b.event_status = 'Closed' AND b.category = 'Food';	student_club
SELECT event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Advertisement' ORDER BY b.spent DESC LIMIT 1;	student_club
SELECT m.member_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name ilike '%Women''s Soccer%' AND m.last_name ilike '%Mclean%';	student_club
SELECT DIVIDE(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END), COUNT(*)) * 100 AS percentage FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT SUM(e.cost) AS total_cost FROM "expense" e JOIN "budget" b ON e.link_to_budget = b.budget_id JOIN "event" ev ON b.link_to_event = ev.event_id WHERE e.expense_description ilike '%Posters%' AND ev.event_name ilike '%September Speaker%';	student_club
SELECT t_shirt_size, MAX(COUNT(t_shirt_size)) AS max_count FROM member GROUP BY t_shirt_size ORDER BY max_count DESC NULLS LAST LIMIT 1;	student_club
SELECT e.event_name, MIN(b.remaining) AS min_remaining FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 GROUP BY e.event_name ORDER BY min_remaining DESC NULLS LAST LIMIT 1;	student_club
SELECT e.expense_description, SUM(e.cost) AS total_cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name ilike '%October Meeting%' AND e.approved = 'yes' GROUP BY e.expense_description;	student_club
SELECT b.category, SUM(b.amount) AS total_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name ilike '%April Speaker%' GROUP BY b.category ORDER BY total_amount ASC;	student_club
SELECT link_to_event, MAX(amount) AS max_amount FROM budget WHERE category = 'Food' GROUP BY link_to_event ORDER BY max_amount DESC LIMIT 1;	student_club
SELECT b.link_to_event, b.amount FROM budget b WHERE b.category = 'Advertisement' ORDER BY b.amount DESC NULLS LAST LIMIT 3;	student_club
SELECT SUM(e.cost) AS total_cost FROM expense e WHERE LOWER(e.expense_description) = 'parking';	student_club
SELECT SUM(e.cost) FROM "expense" e WHERE e.expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event WHERE m.member_id ='rec4BLdZHS2Blfp4v' GROUP BY m.first_name, m.last_name;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.member_id = 'Sacha Harrison';	student_club
SELECT e.expense_description FROM "expense" e JOIN "member" m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large' ORDER BY e.expense_description NULLS LAST;	student_club
SELECT m.zip FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event WHERE e.cost < 50;	student_club
SELECT m.major_name FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE m.first_name ilike '%Phillip%' AND m.last_name ilike '%Cullen%';	student_club
SELECT m.position FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.major_name) = 'business';	student_club
SELECT COUNT(*) FROM member m WHERE m.link_to_major = (SELECT major_id FROM major WHERE major_name = 'Business') AND m.t_shirt_size = 'Medium';	student_club
SELECT DISTINCT e.event_name, e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;	student_club
SELECT DISTINCT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215';	student_club
SELECT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_date = '2020-03-24T12:00:00';	student_club
SELECT m.major_name FROM member m JOIN "attendance" a ON m.member_id = a.link_to_member WHERE m.position = 'Vice President';	student_club
SELECT DIVIDE(SUM(CASE WHEN m.major_name = 'Mathematics' THEN 1 ELSE 0 END), COUNT(m.member_id)) * 100 AS percentage FROM member m;	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215';	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) FROM member m WHERE m.position = 'Member' AND m.t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*) FROM major m WHERE m.department = 'School of Applied Sciences, Technology and Education' AND m.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT m.last_name, m.department, m.college FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.major_name = 'Environmental Engineering' ORDER BY m.last_name NULLS LAST;	student_club
SELECT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location ilike '%MU 215%' AND e.type = 'Guest Speaker' AND b.spent = 0;	student_club
SELECT z.city, z.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN zip_code z ON m.zip = z.zip_code WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';	student_club
SELECT e.event_name FROM event e JOIN "attendance" a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.position = 'Vice President' AND m.link_to_major IN (SELECT m.major_id FROM major m WHERE m.department = 'Student_Club') AND e.location = '900 E. Washington St.' AND e.type = 'Social';	student_club
SELECT m.last_name, m.position FROM "member" m JOIN "expense" e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.position = 'Member' AND e.event_name = 'Women''s Soccer' ORDER BY m.last_name;	student_club
SELECT DIVIDE(COUNT(CASE WHEN i.amount = 50 THEN 1 END), COUNT(DISTINCT m.member_id)) * 100 AS percentage FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE m.t_shirt_size = 'Medium' AND m.position = 'Member';	student_club
SELECT DISTINCT z.state FROM zip_code z WHERE z.type = 'PO Box';	student_club
SELECT DISTINCT z.zip_code FROM zip_code z WHERE LOWER(z.city) ='san juan' AND LOWER(z.state) = 'puerto rico' AND LOWER(z.type) = 'po box';	student_club
SELECT DISTINCT e.event_name FROM event e WHERE e.type = 'Game' AND e.status = 'Closed' AND e.event_date BETWEEN '2019-03-15' AND '2020-03-20' ORDER BY e.event_name NULLS LAST;	student_club
SELECT DISTINCT a.link_to_member, a.link_to_event FROM attendance a JOIN expense e ON a.link_to_member = e.link_to_member WHERE e.cost > 50 ORDER BY a.link_to_member NULLS LAST;	student_club
SELECT m.member_id, m.first_name, m.last_name, e.event_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.member_id IN (SELECT link_to_member FROM expense WHERE approved = 'true' AND expense_date BETWEEN '2019-01-10' AND '2019-11-19') AND m.member_id IN (SELECT link_to_member FROM income WHERE date_received BETWEEN '2019-01-10' AND '2019-11-19');	student_club
SELECT m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Katy' AND ma.major_name ='rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences' ORDER BY m.phone NULLS LAST;	student_club
SELECT m.email FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND e.cost > 20;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.major_name) = 'education';	student_club
SELECT DIVIDE(SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END), COUNT(e.event_id)) * 100 AS percentage FROM event e JOIN budget b ON e.event_id = b.link_to_event;	student_club
SELECT e.event_id, e.location, e.status FROM event e WHERE e.event_date BETWEEN '2019-11-01' AND '2020-03-31' ORDER BY e.event_id NULLS LAST;	student_club
SELECT e.expense_description, SUM(e.cost) / NULLIF(COUNT(e.expense_id), 0) AS average_cost FROM "expense" e GROUP BY e.expense_description HAVING SUM(e.cost) / NULLIF(COUNT(e.expense_id), 0) > 50;	student_club
SELECT m.first_name, m.last_name FROM member m WHERE m.t_shirt_size = 'X-Large' ORDER BY m.first_name, m.last_name NULLS LAST;	student_club
SELECT DIVIDE(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END), COUNT(zip_code)) * 100 AS percentage_of_po_boxes FROM zip_code;	student_club
SELECT e.event_name, e.location FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 0;	student_club
SELECT e.event_name, e.event_date, e.type, e.notes, e.location, e.status FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN expense ex ON a.link_to_member = ex.link_to_member WHERE ex.expense_description ilike '%Pizza%' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, m.position, m.t_shirt_size, m.phone, m.zip, m.link_to_major, m.email FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event WHERE e.cost > 100;	student_club
SELECT z.city, z.state FROM event e JOIN zip_code z ON e.location = z.city WHERE e.event_id IN (SELECT a.link_to_event FROM attendance a JOIN income i ON a.link_to_member = i.link_to_member GROUP BY a.link_to_event HAVING COUNT(i.income_id) > 40);	student_club
SELECT m.member_id, SUM(e.cost) AS total_cost FROM "expense" e JOIN "attendance" a ON e.link_to_event = a.link_to_event JOIN "member" m ON a.link_to_member = m.member_id GROUP BY m.member_id HAVING COUNT(DISTINCT e.link_to_event) > 1 ORDER BY total_cost DESC LIMIT 1;	student_club
WITH student_expenses AS (SELECT e.event_id, SUM(exp.cost) AS total_cost FROM expense exp JOIN attendance a ON exp.link_to_member = a.link_to_member JOIN member m ON a.link_to_member = m.member_id WHERE m.position!= 'Member' GROUP BY e.event_id) SELECT AVG(se.total_cost) AS average_cost FROM student_expenses se;	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Parking' AND b.cost < (SELECT SUM(b2.cost) / COUNT(b2.event_id) FROM budget b2 WHERE b2.category = 'Parking');	student_club
SELECT (SUM(CASE WHEN e.type = 'Game' THEN e.cost ELSE 0 END) / NULLIF(SUM(e.cost), 0)) * 100 AS percentage FROM event e;	student_club
SELECT MAX(b.spent) AS max_spent FROM "expense" e JOIN "budget" b ON e.link_to_budget = b.budget_id WHERE e.expense_description ilike '%Water, chips, cookies%';	student_club
SELECT m.first_name, m.last_name, MAX(e.cost) AS total_cost FROM "expense" e JOIN "member" m ON e.link_to_member = m.member_id GROUP BY m.first_name, m.last_name ORDER BY total_cost DESC LIMIT 5;	student_club
WITH member_expenses AS (SELECT m.member_id, m.first_name, m.last_name, m.phone, SUM(e.cost) AS total_cost FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event GROUP BY m.member_id, m.first_name, m.last_name, m.phone) SELECT me.member_id, me.first_name ||'' || me.last_name AS full_name, me.phone FROM member_expenses me WHERE me.total_cost > (SELECT AVG(total_cost) FROM member_expenses) ORDER BY me.total_cost DESC NULLS LAST;	student_club
SELECT (SUM(CASE WHEN m.zip = 03901 THEN 1 ELSE 0 END)::FLOAT / NULLIF(COUNT(CASE WHEN m.position = 'Member' THEN 1 END), 0) - SUM(CASE WHEN m.zip = 05001 THEN 1 ELSE 0 END)::FLOAT / NULLIF(COUNT(CASE WHEN m.position = 'Member' THEN 1 END), 0)) AS difference FROM member m;	student_club
SELECT m.major_name, m.department FROM member m JOIN major m1 ON m.link_to_major = m1.major_id WHERE m.last_name = 'Gerke' AND m.first_name = 'Garrett';	student_club
SELECT m.first_name, m.last_name, e.expense_description, SUM(e.cost) AS total_cost FROM "expense" e JOIN "member" m ON e.link_to_member = m.member_id WHERE e.expense_description ilike '%Water, Veggie tray, supplies%' GROUP BY m.first_name, m.last_name, e.expense_description;	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education';	student_club
SELECT b.category, b.amount FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name ilike '%January Speaker%';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT b.category FROM "expense" e JOIN "budget" b ON e.link_to_budget = b.budget_id WHERE e.expense_description = 'Posters';	student_club
SELECT m.first_name ||'' || m.last_name AS full_name, m.link_to_major, m.zip FROM member m WHERE m.position = 'Secretary';	student_club
SELECT SUM(b.spent) AS total_amount_spent, e.event_name FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT m.zip, z.city FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE LOWER(m.first_name) = 'garrett' AND LOWER(m.last_name) = 'girke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND z.zip_code = 28092;	student_club
SELECT COUNT(*) FROM gasstations gs JOIN products p ON gs.gasstationid = p.productid WHERE gs.country = 'CZE' AND p.description ilike '%Premium%gas%';	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN c.Currency = 'CZK' THEN 1 END), 0) AS ratio FROM customers c;	debit_card_specializing
SELECT c.CustomerID, c.Currency, y.Date, y.Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date BETWEEN '201201' AND '201212' AND c.Country = 'LAM' ORDER BY y.Consumption ASC NULLS LAST LIMIT 1;	debit_card_specializing
SELECT AVG(y.Consumption) / 12 AS average_monthly_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND y.Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY total_consumption DESC NULLS LAST LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT y.CustomerID) FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date BETWEEN '201201' AND '201212' AND c.Segment = 'KAM' AND y.Consumption < 30000;	debit_card_specializing
SELECT SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) - SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END) AS difference_in_consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date BETWEEN '201201' AND '201212';	debit_card_specializing
WITH total_eur AS (SELECT ym.Date, SUM(ym.Consumption) AS total_consumption FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY ym.Date) SELECT te.Date, te.total_consumption FROM total_eur te ORDER BY te.total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS total_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID GROUP BY c.Segment ORDER BY total_consumption ASC LIMIT 1;	debit_card_specializing
SELECT EXTRACT(YEAR FROM y.Date) AS YEAR, SUM(y.Consumption) AS total_consumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'CZK' GROUP BY YEAR ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT y.date, MAX(y.consumption) AS max_consumption FROM "yearmonth" y JOIN customers c ON y.customerid = c.customerid WHERE c.segment = 'SME' AND y.date like '2013%' GROUP BY y.date ORDER BY max_consumption DESC LIMIT 1;	debit_card_specializing
WITH cte AS (SELECT ym.CustomerID, ym.Date, ym.Consumption, RANK() OVER (PARTITION BY ym.CustomerID, EXTRACT(YEAR FROM ym.Date) ORDER BY ym.Consumption) AS consumption_rank FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'CZK' AND EXTRACT(YEAR FROM ym.Date) BETWEEN 2013 AND 2013) SELECT 'SME', AVG(cte.consumption) AS avg_consumption_sme FROM cte WHERE cte.CustomerID IN (SELECT cte.CustomerID FROM cte WHERE cte.segment = 'SME' AND cte.consumption_rank = 1) UNION ALL SELECT 'LAM', AVG(cte.consumption) AS avg_consumption_lam FROM cte WHERE cte.CustomerID IN (SELECT cte.CustomerID FROM cte WHERE cte.segment = 'LAM' AND cte.consumption_rank = 1) UNION ALL SELECT 'KAM', AVG(cte.consumption) AS avg_consumption_kam FROM cte WHERE cte.CustomerID IN (SELECT cte.CustomerID FROM cte WHERE cte.segment = 'KAM' AND cte.consumption_rank = 1) ORDER BY avg_consumption_sme DESC, avg_consumption_lam DESC, avg_consumption_kam DESC; WITH cte AS (SELECT ym.CustomerID, ym.Date, ym.Consumption, RANK() OVER (PARTITION BY ym.CustomerID, EXTRACT(YEAR FROM ym.Date) ORDER BY ym.Consumption) AS consumption_rank FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'CZK' AND EXTRACT(YEAR FROM ym.Date) BETWEEN 2013 AND 2013) SELECT (SELECT avg_consumption_sme FROM (SELECT 'SME', AVG(cte.consumption) AS avg_consumption_sme FROM cte WHERE cte.CustomerID IN (SELECT cte.CustomerID FROM cte WHERE cte.segment = 'SME' AND cte.consumption_rank = 1) UNION ALL SELECT 'LAM', AVG(cte.consumption) AS avg_consumption_lam FROM cte WHERE cte.CustomerID IN (SELECT cte.CustomerID FROM cte WHERE cte.segment = 'LAM' AND cte.consumption	debit_card_specializing
WITH segment_consumption AS (SELECT c.Segment, SUM(CASE WHEN y.Date BETWEEN '201201' AND '201212' THEN y.Consumption ELSE 0 END) AS consumption_2012, SUM(CASE WHEN y.Date BETWEEN '201301' AND '201312' THEN y.Consumption ELSE 0 END) AS consumption_2013 FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY c.Segment) SELECT s.Segment, (s.consumption_2013 - s.consumption_2012) AS increase_or_decrease, ((s.consumption_2013 - s.consumption_2012) / NULLIF(s.consumption_2013, 0)) * 100 AS percentage_increase FROM segment_consumption s ORDER BY percentage_increase DESC NULLS LAST;	debit_card_specializing
SELECT SUM(y.Consumption) AS total_consumption FROM "yearmonth" y WHERE y.CustomerID = 6 AND y.Date BETWEEN '201308' AND '201311';	debit_card_specializing
WITH cr AS (SELECT COUNT(*) AS cr_count FROM gasstations gs JOIN customers c ON gs.chainid = c.customerid WHERE LOWER(c.currency) = 'czech koruna' AND LOWER(gs.segment) = 'discount'), sk AS (SELECT COUNT(*) AS sk_count FROM gasstations gs JOIN customers c ON gs.chainid = c.customerid WHERE LOWER(c.currency) = 'euro' AND LOWER(gs.segment) = 'discount') SELECT cr_count - sk_count AS difference FROM cr, sk;	debit_card_specializing
SELECT (y1.Consumption - y2.Consumption) AS consumption_difference FROM yearmonth y1 JOIN yearmonth y2 ON y1.CustomerID = y2.CustomerID AND y1.Date = '201304' AND y2.Date = '201304' WHERE y1.CustomerID = 7 AND y2.CustomerID = 5;	debit_card_specializing
WITH czech AS (SELECT COUNT(*) AS czech_count FROM customers c JOIN "yearmonth" ym ON c.CustomerID = ym.CustomerID WHERE LOWER(c.Currency) = 'czk' AND c.Segment = 'SME'), euro AS (SELECT COUNT(*) AS euro_count FROM customers c JOIN "yearmonth" ym ON c.CustomerID = ym.CustomerID WHERE LOWER(c.Currency) = 'eur' AND c.Segment = 'SME') SELECT (czech_count - euro_count) AS difference FROM czech, euro;	debit_card_specializing
SELECT y.CustomerID FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'Euro' AND y.Date = '201310' ORDER BY y.Consumption DESC NULLS LAST LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(y.Consumption) AS total_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date = '201305' AND c.Segment = 'KAM';	debit_card_specializing
WITH total_lam AS (SELECT COUNT(*) AS total_lam_customers FROM customers c JOIN yearmonth ym ON c.customerid = ym.customerid WHERE c.segment = 'LAM' AND ym.consumption > 46.73), total_lam_consumed_more_4673 AS (SELECT COUNT(*) AS lam_customers_consumed_more_4673 FROM customers c JOIN yearmonth ym ON c.customerid = ym.customerid WHERE c.segment = 'LAM' AND ym.consumption > 46.73) SELECT (lam_customers_consumed_more_4673.total_lam_customers / NULLIF(total_lam.total_lam_customers, 0)) * 100 AS percentage FROM total_lam, total_lam_consumed_more_4673;	debit_card_specializing
SELECT g.Country, COUNT(g.GasStationID) AS total_gas_stations FROM gasstations g JOIN products p ON g.ChainID = p.ProductID WHERE g.Segment = 'Value' GROUP BY g.Country ORDER BY total_gas_stations DESC NULLS LAST;	debit_card_specializing
SELECT (SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END)::FLOAT / NULLIF(COUNT(*), 0)) * 100 AS percentage_of_euro_users FROM customers c WHERE c.Segment = 'KAM';	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN y.Consumption > 528.3 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM yearmonth y WHERE y.Date LIKE '201202';	debit_card_specializing
SELECT (COUNT(CASE WHEN g.Segment = 'premium' THEN 1 END)::FLOAT / NULLIF(COUNT(*), 0)) * 100 AS percentage_of_premium FROM gasstations g WHERE g.Country = 'Slovakia';	debit_card_specializing
SELECT ym.CustomerID, SUM(ym.Consumption) AS total_consumption FROM "yearmonth" ym WHERE ym.Date = '201309' GROUP BY ym.CustomerID ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.segment, MIN(y.consumption) AS min_consumption FROM yearmonth y JOIN customers c ON y.customerid = c.customerid WHERE y.date = '201309' GROUP BY c.segment ORDER BY min_consumption LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, y.Date, SUM(y.Consumption) AS total_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date = '201206' AND c.Segment = 'SME' GROUP BY c.CustomerID, y.Date ORDER BY total_consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(y.Consumption) AS highest_consumption FROM "yearmonth" y WHERE y.Date like '2012%' GROUP BY y.CustomerID;	debit_card_specializing
SELECT ym.CustomerID, MAX(ym.Consumption) AS max_consumption FROM "yearmonth" ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'EUR GROUP BY ym.CustomerID;	debit_card_specializing
SELECT p.description FROM products p JOIN transactions_1k t ON p.product_id = t.product_id JOIN "yearmonth" y ON t.customer_id = y.customer_id AND EXTRACT(YEAR FROM TO_DATE(y.date, 'YYYYMM')) = 2013 AND EXTRACT(MONTH FROM TO_DATE(y.date, 'YYYYMM')) = 9;	debit_card_specializing
SELECT g.Country FROM "transactions_1k" t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date >= '20130601' AND t.Date < '20130701';	debit_card_specializing
SELECT g.ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT p.description FROM products p JOIN "transactions_1k" t ON p.productid = t.productid WHERE t.customerid IN (SELECT c.customerid FROM customers c WHERE c.currency = 'EUR');	debit_card_specializing
SELECT AVG(t.Price) AS average_price FROM "transactions_1k" t WHERE t.Date LIKE '%2012-01%';	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) AS customers_with_high_consumption FROM customers c JOIN "yearmonth" y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000;	debit_card_specializing
SELECT t.productid, p.description FROM transactions_1k t JOIN products p ON t.productid = p.productid JOIN gasstations gs ON t.gasstationid = gs.gasstationid WHERE gs.country = 'CZE';	debit_card_specializing
SELECT t.time, t.amount FROM transactions_1k t JOIN gasstations g ON t.gasstationid = g.gasstationid WHERE g.chainid = 11;	debit_card_specializing
SELECT COUNT(*) FROM "transactions_1k" t JOIN gasstations gs ON t.GasStationID = gs.GasStationID WHERE gs.Country = 'CZE' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(t.Price) AS average_price FROM "transactions_1k" t JOIN gasstations gs ON t.GasStationID = gs.GasStationID WHERE gs.Country = 'CZE';	debit_card_specializing
SELECT AVG(t.Price) AS average_price FROM "transactions_1k" t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'Euro';	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount) AS total_amount FROM "transactions_1k" t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-25' GROUP BY c.CustomerID ORDER BY total_amount DESC NULLS LAST LIMIT 1;	debit_card_specializing
SELECT g.Country FROM "transactions_1k" t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID ASC LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM "transactions_1k" t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.time = '16:25:00' AND EXTRACT(YEAR FROM t.date) = 2012 AND EXTRACT(MONTH FROM t.date) = 8 AND EXTRACT(DAY FROM t.date) = 24;	debit_card_specializing
SELECT c.Segment FROM customers c JOIN "transactions_1k" t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(*) AS number_of_transactions FROM "transactions_1k" t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' AND t.time < '13:00:00' AND t.date = '2012-08-26';	debit_card_specializing
SELECT c.Segment FROM customers c ORDER BY c.CustomerID ASC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM "transactions_1k" t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00';	debit_card_specializing
SELECT t.productid FROM transactions_1k t WHERE t.date = '2012-08-23' AND t.time = '21:20:00';	debit_card_specializing
SELECT SUM(t.amount) AS total_spent_in_january, t.date FROM transactions_1k t WHERE t.customerid IN (SELECT y.customerid FROM yearmonth y WHERE y.date = '2012-01-01') AND t.date BETWEEN '2012-01-01' AND '2012-01-31' AND t.amount = 124.05;	debit_card_specializing
SELECT COUNT(*) AS number_of_transactions FROM "transactions_1k" t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE EXTRACT(HOUR FROM t.time) BETWEEN 8 AND 9 AND g.country = 'CZE' AND EXTRACT(YEAR FROM t.date) = 2012 AND EXTRACT(MONTH FROM t.date) = 8 AND EXTRACT(DAY FROM t.date) = 26;	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201306' AND y.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM customers c JOIN "transactions_1k" t ON c.CustomerID = t.CustomerID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE c.CustomerID = 667467;	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '2012-08-24' AND y.Consumption = 548.4;	debit_card_specializing
SELECT CAST(COUNT(DISTINCT CASE WHEN c.Currency = 'EUR' THEN ym.CustomerID END) AS FLOAT) / NULLIF(COUNT(DISTINCT ym.CustomerID), 0) AS proportion FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE ym.Date = '2012-08-25';	debit_card_specializing
WITH consumption_2012 AS (SELECT ym.CustomerID, SUM(ym.Consumption) AS total_consumption_2012 FROM "yearmonth" ym WHERE ym.Date >= '2012-08-01' AND ym.Date <= '2012-12-31' GROUP BY ym.CustomerID), consumption_2013 AS (SELECT ym.CustomerID, SUM(ym.Consumption) AS total_consumption_2013 FROM "yearmonth" ym WHERE ym.Date >= '2013-01-01' AND ym.Date <= '2013-12-31' GROUP BY ym.CustomerID) SELECT ((c2012.total_consumption_2012 - c2013.total_consumption_2013) / NULLIF(c2012.total_consumption_2012, 0)) * 100 AS consumption_decrease_percentage FROM consumption_2012 c2012 LEFT JOIN consumption_2013 c2013 ON c2012.CustomerID = c2013.CustomerID WHERE c2012.CustomerID = 1234567890;	debit_card_specializing
SELECT g.ChainID, SUM(t.Amount) AS total_revenue FROM "transactions_1k" t JOIN gasstations g ON t.GasStationID = g.GasStationID GROUP BY g.ChainID ORDER BY total_revenue DESC NULLS LAST LIMIT 1;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN c.Segment = 'premium' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM customers c WHERE c.Segment IS NOT NULL AND c.Segment IN ('premium','standard') AND c.Segment = 'premium';	debit_card_specializing
SELECT SUM(t.Amount) AS total_amount FROM transactions_1k t WHERE t.CustomerID = 38508; SELECT SUM(t.Amount) AS total_amount FROM transactions_1k t JOIN "yearmonth" y ON t.CustomerID = y.CustomerID AND to_date(y.Date, 'YYYYMM') = to_date('201201', 'YYYYMM') WHERE t.CustomerID = 38508;	debit_card_specializing
SELECT p.Description, SUM(t.Amount) AS total_amount FROM "transactions_1k" t JOIN products p ON t.ProductID = p.ProductID GROUP BY p.Description ORDER BY total_amount DESC LIMIT 5;	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount) AS total_amount, AVG(t.Price) AS average_price, c.Currency FROM "transactions_1k" t JOIN customers c ON t.CustomerID = c.CustomerID GROUP BY c.CustomerID ORDER BY total_amount DESC LIMIT 1;	debit_card_specializing
SELECT g.Country, MAX(p.Description) AS most_expensive_product FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE p.ProductID = 2 GROUP BY g.Country ORDER BY most_expensive_product DESC NULLS LAST LIMIT 1;	debit_card_specializing
SELECT ym.CustomerID, SUM(ym.Consumption) AS total_consumption FROM "transactions_1k" t JOIN yearmonth ym ON t.CustomerID = ym.CustomerID WHERE t.ProductID = 5 AND t.Price / NULLIF(t.Amount, 0) > 29.00 AND ym.Date LIKE '%201208%' GROUP BY ym.CustomerID ORDER BY total_consumption DESC NULLS LAST;	debit_card_specializing
