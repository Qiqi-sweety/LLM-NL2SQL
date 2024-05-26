SELECT MAX(s.percentage_eligible_free_k12) AS highest_percentage_eligible_free FROM frpm s WHERE s.county_name = 'Alameda';	california_schools
SELECT s.CDSCode, s.School, s.District, s.County, f.Percent_ eligible_Free_(Ages_5-17) AS eligible_Free_Rate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.Percent_eligible_Free_(Ages_5-17) ASC LIMIT 3;	california_schools
SELECT s.Zip FROM schools s WHERE s.County = 'Fresno County Office of Education' AND s.Charter = 1 ORDER BY s.Zip NULLS LAST;	california_schools
WITH k12_frpms AS (SELECT f.CDSCode, f.School Name, SUM(f.FRPM Count (K-12)) AS total_frpms FROM frpm f GROUP BY f.CDSCode, f.School Name ORDER BY total_frpms DESC LIMIT 1) SELECT s.MailStreet, s.MailCity, s.MailState, s.MailZip FROM k12_frpms k JOIN schools s ON k.CDSCode = s.CDSCode;	california_schools
SELECT s.Phone FROM schools s WHERE s.StatusType = 'Charter' AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) AS num_schools FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores ss ON f.CDSCode = ss.cds WHERE ss.AvgScrMath < 400 AND s.Virtual = 'Y';	california_schools
SELECT s.CDSCode, s.School, s.District, s.County, s.Virtual, s.Magnet FROM satscores ss JOIN schools s ON ss.CDS = s.CDSCode WHERE ss.NumTstTakr > 500 AND (s.Magnet IS NOT NULL OR s.Virtual IS NOT NULL) ORDER BY s.CDSCode NULLS LAST;	california_schools
SELECT s.Phone FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.NumGE1500 = (SELECT MAX(ss2.NumGE1500) FROM satscores ss2);	california_schools
WITH k12_frpm AS (SELECT f.CDSCode, f.FRPM_Count FROM frpm f WHERE f.Low_Grade = 'K' AND f.High_Grade = '12' ORDER BY f.FRPM_Count DESC LIMIT 1) SELECT s.NumTstTakr FROM k12_frpm k JOIN satscores s ON k.CDSCode = s.cds;	california_schools
SELECT COUNT(*) FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Charter = 1 AND f.AvgScrMath > 560;	california_schools
WITH highest_reading_avg AS (SELECT s.CDSCode, AVG(s.AvgScrRead) AS avg_reading FROM satscores s GROUP BY s.CDSCode ORDER BY avg_reading DESC LIMIT 1) SELECT frpm.CDSCode, frpm.FRPM_Count_(Ages_5-17) FROM highest_reading_avg hra JOIN frpm frpm ON hra.CDSCode = frpm.CDSCode;	california_schools
SELECT f.CDSCode FROM frpm f WHERE f.Enrollment (K-12) > 500;	california_schools
SELECT MAX(s.freenage5_17) AS highest_free_rate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f Percent(%) Eligible FRPM (Ages 5-17) > 0.3;	california_schools
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode ORDER BY s.Phone DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, frpm.Enrollment FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode ORDER BY frpm.Enrollment DESC LIMIT 5;	california_schools
WITH district_scores AS (SELECT s.District, AVG(s.AvgScrRead) AS avg_reading_score FROM satscores s JOIN frpm f ON s.CDS = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`2013-14 CALPADS Fall 1 Certification Status` = 1 GROUP BY s.District) SELECT ds.District, ds.avg_reading_score FROM district_scores ds ORDER BY ds.avg_reading_score DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Alameda' AND s.rtype = 'K-12' AND f.NumTstTakr < 100;	california_schools
SELECT s.CharterNum FROM satscores s WHERE s.AvgScrWrite = 499;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`District Code` = 3 AND f.`Charter School Number` IS NOT NULL AND f.`Charter Funding Type` = 'Directly Funded' AND s.NumTstTakr <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores);	california_schools
SELECT COUNT(*) FROM frpm f WHERE f.CDSCode IN (SELECT s.CDSCode FROM schools s WHERE s.County = 'Amador') AND f.LowGrade = '9' AND f.HighGrade = '12';	california_schools
SELECT COUNT(*) FROM frpm f WHERE f.CDSCode IN (SELECT s.CDSCode FROM schools s WHERE s.County = 'Los Angeles') AND f."Free Meal Count (K-12)" > 500 AND f."Free Meal Count (K-12)" < 700;	california_schools
WITH school_scores AS (SELECT s.CDSCode, s.School, SUM(s.NumTstTakr) AS total_test_takers FROM satscores s JOIN schools s1 ON s.CDSCode = s1.CDSCode WHERE LOWER(s1.County) = 'contra costa' GROUP BY s.CDSCode, s.School) SELECT school, total_test_takers FROM school_scores ORDER BY total_test_takers DESC NULLS LAST LIMIT 1;	california_schools
SELECT s.School, s.Street, s.City, s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE ABS(f.Enrollment_K_12 - f.Enrollment_Ages_5_17) > 30;	california_schools
SELECT s.School, s.District, s.County, f.Percent_() Eligible Free (K-12) FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.Percent_() Eligible Free (K-12) > 0.1 AND f.FRPM Count (K-12) > 0;	california_schools
SELECT s.FundingType FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Riverside' AND ss.AvgScrMath > 400;	california_schools
SELECT s.School, s.MailStreet, s.MailCity, s.MailState, s.MailZip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.FRPMLowGrade = '9' AND f.FRPMAgeRange = '15-17' AND f.FRPMAgeRange = '15-17' AND f.FRPMLowGrade = '12' AND f.FRPMAgeRange = '15-17' AND f.FRPMAgeRange = '15-17' AND f.FRPMLowGrade = '12' AND f.FRPMAgeRange = '15-17' AND f.FRPMAgeRange = '15-17' AND f.FRPMLowGrade = '12' AND f.FRPMAgeRange = '15-17' AND f.FRPMAgeRange = '15-17' AND f.FRPMLowGrade = '12' AND f.FRPMAgeRange = '15-17' AND f.FRPMAgeRange = '15-17' AND f.FRPMLowGrade = '12' AND f.FRPMAgeRange = '15-17' AND f.FRPMAgeRange = '15-17' AND f.FRPMLowGrade = '12' AND f.FRPMAgeRange = '15-17' AND f.FRPMAgeRange = '15-17' AND f.FRPMLowGrade = '12' AND f.FRPMAgeRange = '15-17' AND f.FRPMAgeRange = '15-17' AND f.FRPMLowGrade = '12' AND f.FRPMAgeRange = '15-17' AND f.FRPMAgeRange = '15-17' AND f.FRPMLowGrade = '12' AND f.FRPMAgeRange = '15-17' AND f.FRPMAgeRange = '15-17' AND f.FRPMLowGrade = '12' AND f.FRPMAgeRange = '15-17' AND f.FRPMAgeRange = '15-17' AND f.FRPMLowGrade = '12' AND f.FRPMAgeRange = '15-17' AND f.FRPMAgeRange = '15-17' AND f.FRPMLowGrade = '12' AND f.FRPMAgeRange = '15-17' AND f.FRPMAgeRange	california_schools
SELECT s.School, AVG(ss.AvgScrWrite) AS avg_score, s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.OpenDate > '1991-01-01' AND (s.ClosedDate IS NULL OR s.ClosedDate < '2000-01-01') GROUP BY s.School, s.Phone ORDER BY avg_score DESC NULLS LAST;	california_schools
SELECT s.Name, s.DOC, AVG(s.Enrollment_15_17 - s.Enrollment_K_12) AS avg_diff FROM (SELECT fr.CDSCode, s.Name, s.DOC, s.Enrollment_15_17, s.Enrollment_K_12 FROM frpm fr JOIN schools s ON fr.CDSCode = s.CDSCode WHERE fr.Magnet = 0) AS subquery GROUP BY s.Name, s.DOC HAVING AVG(subquery.Enrollment_15_17 - subquery.Enrollment_K_12) > (SELECT AVG(subquery.Enrollment_15_17 - subquery.Enrollment_K_12) FROM (SELECT fr.CDSCode, s.Name, s.DOC, s.Enrollment_15_17, s.Enrollment_K_12 FROM frpm fr JOIN schools s ON fr.CDSCode = s.CDSCode WHERE fr.Magnet = 0) AS subquery) ORDER BY avg_diff DESC NULLS LAST;	california_schools
SELECT s.OpenDate FROM schools s WHERE s.StatusType = '1-12' ORDER BY s.OpenDate ASC LIMIT 1;	california_schools
WITH lowest_enrollment AS (SELECT s.City, MIN(s.Enrollment (K-12)) AS min_enrollment FROM frpm s GROUP BY s.City ORDER BY min_enrollment ASC LIMIT 5) SELECT le.City, le.min_enrollment FROM lowest_enrollment le;	california_schools
WITH enrollment_data AS (SELECT s.CDSCode, s.School, SUM(f.Free Meal Count (K-12)) AS total_free_meals, COUNT(f.CDSCode) AS total_students FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Low Grade` = '1' AND f.`High Grade` = '12' GROUP BY s.CDSCode, s.School ORDER BY total_students DESC LIMIT 10), eligible_free_rate AS (SELECT ed.CDSCode, ed.School, CAST(ed.total_free_meals AS FLOAT) / NULLIF(ed.total_students, 0) AS eligible_free_rate FROM enrollment_data ed) SELECT efr.CDSCode, efr.School, efr.eligible_free_rate FROM eligible_free_rate efr ORDER BY efr.eligible_free_rate DESC NULLS LAST LIMIT 10;	california_schools
SELECT s.CDSCode, s.School, frpm.Percent_Eligible_Free_12 FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode WHERE s.StatusType = '66' ORDER BY frpm.Percent_Eligible_Free_12 DESC NULLS LAST LIMIT 5;	california_schools
SELECT s.school, s.website FROM frpm f JOIN schools s ON f.cdscode = s.cdscode WHERE f.freeNodeCountAges517 BETWEEN 1900 AND 2000;	california_schools
SELECT sfrpm.Percent (%) Eligible Free (Ages 5-17) AS free_rate FROM frpm sfrpm JOIN schools s ON sfrpm.CDSCode = s.CDSCode WHERE s.Virtual = 'Y' AND s.AdmFName1 ilike '%Kacey%Gibson%' AND s.AdmLName1 ilike '%Gibson%Kacey%' AND s.AdmlEmail1 ilike '%kacey.gibson%' ORDER BY free_rate DESC NULLS LAST;	california_schools
SELECT s.AdmEmail1 FROM schools s WHERE s.Charter = 1 ORDER BY s.Enrollment (K-12) ASC LIMIT 1;	california_schools
SELECT s.AdmFName1, s.AdmLName1, s.AdmEmail1 FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.NumTstTakr = (SELECT MAX(ss2.NumTstTakr) FROM satscores ss2 WHERE ss2.AvgScrRead >= 1500 AND ss2.AvgScrMath >= 1500 AND ss2.AvgScrWrite >= 1500) ORDER BY s.AdmFName1, s.AdmLName1, s.AdmEmail1 LIMIT 1;	california_schools
SELECT s.Street, s.City, s.Zip, s.State FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.Percent_Eligible_Free_ (K-12) = (SELECT MIN(f2.Percent_Eligible_Free_ (K-12)) FROM frpm f2);	california_schools
SELECT s.website FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND f.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(s.NumTstTakr) AS average_test_takers FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.OpenDate BETWEEN '1980-01-01' AND '1980-12-31' AND sc.County = 'Fresno';	california_schools
SELECT s.Phone FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores ss ON f.CDSCode = ss.cds WHERE s.County = 'Fresno Unified' ORDER BY ss.AvgScrRead ASC LIMIT 1;	california_schools
SELECT s.sname, AVG(s.AvgScrRead) AS avg_reading_score FROM satscores s WHERE s.Virtual IS TRUE GROUP BY s.sname ORDER BY avg_reading_score DESC LIMIT 5;	california_schools
SELECT s.Educational_Option_Type FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.CDSCode IN (SELECT s.CDS FROM satscores s WHERE s.AvgScrMath = (SELECT MAX(s2.AvgScrMath) FROM satscores s2)) ORDER BY s.Educational_Option_Type ASC NULLS LAST LIMIT 1;	california_schools
SELECT s.AvgScrMath, s.cname FROM satscores s ORDER BY s.AvgScrMath ASC LIMIT 1;	california_schools
WITH t AS (SELECT s.CDSCode, s.School, SUM(s.NumTstTakr) AS total_takers FROM satscores s WHERE s.NumTstTakr >= 1500 GROUP BY s.CDSCode, s.School) SELECT AVG(s.AvgScrWrite) AS average_write_score, s.City FROM schools s JOIN t ON s.CDSCode = t.CDSCode GROUP BY s.City ORDER BY average_write_score DESC NULLS LAST LIMIT 1;	california_schools
SELECT s.CDSCode, AVG(s.AvgScrWrite) AS Avg_Write_Score FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.CDSCode ORDER BY s.CDSCode NULLS LAST;	california_schools
SELECT s.State, COUNT(*) AS total_enrollment FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.StatusType = 'Special' AND f.`Low Grade` = '1' AND f.`High Grade` = '12' GROUP BY s.State ORDER BY total_enrollment DESC;	california_schools
SELECT COUNT(s.CDSCode) AS monthly_openings FROM schools s WHERE s.County = 'Alameda' AND s.StatusType = 'Elementary School District' AND EXTRACT(YEAR FROM s.OpenDate) = 1980;	california_schools
SELECT CAST(COUNT(DISTINCT s1.CDSCode) AS FLOAT) / NULLIF(COUNT(DISTINCT s2.CDSCode), 0) AS ratio FROM frpm s1 JOIN schools s2 ON s1.CDSCode = s2.CDSCode WHERE s2.StatusType = 'Unified' AND s1.`County Code` = 'Orange' AND s2.StatusType = 'Elementary' AND s1.`County Code` = 'Orange';	california_schools
SELECT s.County, s.School, s.ClosedDate FROM schools s WHERE s.ClosedDate IS NOT NULL ORDER BY s.County NULLS LAST;	california_schools
WITH school_avg AS (SELECT s.CDSCode, s.School, AVG(sats.AvgScrMath) AS avg_math FROM schools s JOIN satscores sats ON s.CDSCode = sats.cds GROUP BY s.CDSCode, s.School ORDER BY avg_math DESC LIMIT 5) SELECT sa.School, s.Street FROM school_avg sa JOIN schools s ON sa.CDSCode = s.CDSCode ORDER BY sa.avg_math DESC LIMIT 1;	california_schools
SELECT s.MailStreet, s.School FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores);	california_schools
SELECT COUNT(*) FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.MailCity = 'Lakeport' AND ss.NumGE1500 IS NOT NULL;	california_schools
SELECT SUM(s.NumTstTakr) AS total_test_takers FROM satscores s JOIN schools s2 ON s.cds = s2.CDSCode WHERE s2.MailCity = 'Fresno';	california_schools
SELECT s.CDSCode, s.MailZip FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE (s.AdmFName1 ilike '%Avetik%' OR s.AdmLName1 ilike '%Atoian%' OR s.AdmFName2 ilike '%Avetik%' OR s.AdmLName2 ilike '%Atoian%' OR s.AdmFName3 ilike '%Avetik%' OR s.AdmLName3 ilike '%Atoian%') AND s.MailZip IS NOT NULL ORDER BY s.MailZip NULLS LAST;	california_schools
SELECT CAST(SUM(CASE WHEN s.County = 'Colusa' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(SUM(CASE WHEN s.County = 'Humboldt' THEN 1 ELSE 0 END), 0) AS ratio FROM schools s WHERE s.MailState = 'California' AND s.County IN ('Colusa', 'Humboldt');	california_schools
SELECT COUNT(*) AS active_schools FROM schools s WHERE s.MailState = 'California' AND s.StatusType = 'Active';	california_schools
SELECT s.Phone, s.Ext FROM satscores s ORDER BY s.AvgScrWrite DESC LIMIT 332, 1;	california_schools
SELECT s.Phone, s.Ext, s.School FROM schools s WHERE s.Zip = '95203-3704';	california_schools
SELECT s.Website FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE (s.AdmFName1 = 'Mike' AND s.AdmLName1 = 'Larson') OR (s.AdmFName2 = 'Dante' AND s.AdmLName2 = 'Alvarez');	california_schools
SELECT s.Website FROM schools s WHERE s.Virtual = 'yes' AND s.Charter = 1 AND s.County = 'San Joaquin';	california_schools
SELECT COUNT(*) AS number_of_chartered_schools FROM schools s WHERE s.Virtual IS NULL AND s.Magnet IS NULL AND s.City = 'Hickman' AND s.District = 'Elementary School District';	california_schools
SELECT COUNT(*) FROM frpm f WHERE f.County Code = 'Los Angeles' AND f.Percent (%) Eligible Free (K-12) < 0.18;	california_schools
SELECT s.School, s.City, s.AdmFName1, s.AdmLName1, s.AdmEmail1, s.AdmFName2, s.AdmLName2, s.AdmEmail2, s.AdmFName3, s.AdmLName3, s.AdmEmail3 FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Charter = 1 AND s.CharterNum = '00D2';	california_schools
SELECT COUNT(*) FROM schools s WHERE s.MailCity = 'Hickman' AND s.CharterNum = '00D4';	california_schools
SELECT CAST(COUNT(DISTINCT CASE WHEN s.FundingType = 'Locally Funded' THEN s.CDSCode END) AS FLOAT) / NULLIF(COUNT(DISTINCT s.CDSCode), 0) * 100 AS percentage FROM schools s WHERE s.Chartier = 1;	california_schools
SELECT COUNT(*) AS number_of_schools FROM schools s WHERE s.County = 'Stanislaus' AND s.OpenDate BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT COUNT(*) AS Total_Closures FROM schools s WHERE s.StatusType = 'Closed' AND s.OpenDate < '1990-01-01' AND s.City = 'San Francisco';	california_schools
SELECT s.County, COUNT(s.CDSCode) AS Number_of_Schools FROM schools s WHERE s.StatusType = 'Closed' AND s.OpenDate BETWEEN '1980-01-01' AND '1989-12-31' AND s.DOC = 'Youth Authority Facilities' GROUP BY s.County ORDER BY Number_of_Schools DESC LIMIT 1;	california_schools
SELECT s.NCESDist FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.School Type = 'State Special Schools' AND f.School Ownership Code IS NOT NULL ORDER BY s.NCESDist NULLS LAST;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) AS active_and_closed_district_community_day_schools FROM schools s WHERE s.StatusType = 'Community Day School' AND s.County = 'Alpine' AND (s.OpenDate IS NOT NULL OR s.ClosedDate IS NOT NULL);	california_schools
SELECT s.District FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.Magnet IS NULL AND s.City = 'Fresno';	california_schools
SELECT SUM(f.enrollment_ages_5_17) AS total_enrollment FROM frpm f WHERE f.cdscode = 'State Special School' AND f.academic_year = '2014-2015';	california_schools
SELECT SUM(f.frpm_count_ages_5_17) AS total_frpm_count FROM frpm f JOIN schools s ON f.cdscode = s.cdscod WHERE s.street_abr = 'PO Box 1040' AND s.virtual = 'Y' AND s.magnet = 1;	california_schools
SELECT l.Low_Grade FROM frpm l WHERE l.CDSCode IN (SELECT s.CDS FROM schools s WHERE s.NCESDist = '613360');	california_schools
SELECT s.School, s.County FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f."County Code" = '37' AND f."Educational Option Type" = 'Breakfast Provision 2';	california_schools
SELECT s.City FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Low Grade` = '9' AND f.`High Grade` = '12' AND f.`County Code` = '057' AND f.`NSLP Provision Status` = '2' ORDER BY s.City ASC NULLS LAST;	california_schools
SELECT s.CDSCode, s.School, f.Percent_Eligible_FRPM_Ages_5_17 FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND f.Low_Grade = 'K' AND f.High_Grade = '9';	california_schools
SELECT s.Grade, COUNT(*) AS COUNT FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE LOWER(s.City) = 'adelanto' GROUP BY s.Grade ORDER BY COUNT DESC LIMIT 1;	california_schools
WITH virtual_schools AS (SELECT s.County, COUNT(*) AS school_count FROM schools s WHERE s.Virtual IS NOT NULL AND s.Virtual!= 'None' GROUP BY s.County) SELECT vs.County, vs.school_count FROM virtual_schools vs WHERE vs.County BETWEEN 'San Diego' AND 'Santa Barbara' ORDER BY vs.school_count DESC NULLS LAST LIMIT 1;	california_schools
SELECT s.School, s.Latitude FROM schools s ORDER BY s.Latitude DESC LIMIT 1;	california_schools
SELECT s.City, s.School, f.Low_Grade FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.State = 'California' ORDER BY s.Latitude ASC LIMIT 1;	california_schools
SELECT s.GSoffered FROM schools s ORDER BY s.Longitude DESC LIMIT 1;	california_schools
WITH m AS (SELECT s.CDSCode, s.School, s.City, s.District, s.County, s.StatusType, s.OpenDate, s.ClosedDate, s.Virtual, s.Magnet, s.Latitude, s.Longitude, s.LastUpdate FROM schools s WHERE s.Magnet = 1 AND s.Virtual = 'Yes' AND s.StatusType = 'Active' AND s.OpenDate IS NOT NULL AND s.ClosedDate IS NULL) SELECT m.City, COUNT(DISTINCT m.CDSCode) AS num_schools, COUNT(DISTINCT m.School) AS num_schools_with_multiple_magnet_programs FROM m GROUP BY m.City HAVING COUNT(DISTINCT m.School) > 1 ORDER BY num_schools DESC NULLS LAST; WITH m AS (SELECT s.CDSCode, s.School, s.City, s.District, s.County, s.StatusType, s.OpenDate, s.ClosedDate, s.Virtual, s.Magnet, s.Latitude, s.Longitude, s.LastUpdate FROM schools s WHERE s.Magnet = 1 AND s.Virtual = 'Yes' AND s.StatusType = 'Active' AND s.OpenDate IS NOT NULL AND s.ClosedDate IS NULL) SELECT m.City, COUNT(DISTINCT m.CDSCode) AS num_schools, COUNT(DISTINCT m.School) AS num_schools_with_multiple_magnet_programs FROM m GROUP BY m.City HAVING COUNT(DISTINCT m.School) > 1 ORDER BY num_schools DESC NULLS LAST; WITH m AS (SELECT s.CDSCode, s.School, s.City, s.District, s.County, s.StatusType, s.OpenDate, s.ClosedDate, s.Virtual, s.Magnet, s.Latitude, s.Longitude, s.LastUpdate FROM schools s WHERE s.Magnet = 1 AND s.Virtual = 'Yes' AND s.StatusType = 'Active' AND s.OpenDate IS NOT NULL AND s.ClosedDate IS NULL) SELECT m.City, COUNT(DISTINCT m.CDSCode) AS num_schools, COUNT(DISTINCT m.School) AS num_schools_with_multiple_magnet_programs FROM m GROUP BY m.City HAVING COUNT(DISTINCT m.School) > 1 ORDER BY num_schools DESC NULLS LAST; WITH m AS (SELECT s.CDSCode, s.School, s.City, s.District, s.County, s.StatusType, s.OpenDate, s.Closed	california_schools
SELECT s.District, s.School, s.AdminFName1, s.AdminLName1, COUNT(s.AdminFName1) AS num_admins FROM schools s WHERE s.AdminFName1 IS NOT NULL GROUP BY s.District, s.School, s.AdminFName1, s.AdminLName1 ORDER BY num_admins DESC LIMIT 2;	california_schools
SELECT f.CDSCode, f.District Code, f.Percent (%) Eligible Free (K-12) AS percentage FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 ilike '%Alusine%' OR s.AdmFName2 ilike '%Alusine%' OR s.AdmFName3 ilike '%Alusine%';	california_schools
SELECT s.District, s.County, s.School, s.AdmLName3 FROM schools s WHERE s.CharterNum = '40' AND s.AdmLName3 IS NOT NULL;	california_schools
SELECT s.MailEmail1 FROM schools s WHERE s.County = 'San Bernardino' AND s.District = 'San Bernardino City Unified' AND s.StatusType IN ('Public Intermediate/Middle Schools', 'Unified Schools') AND s.OpenDate BETWEEN '2009-01-01' AND '2010-12-31';	california_schools
SELECT s.CDSCode, s.School, s.AdmEmail1 FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.NumGE1500 = (SELECT MAX(ss1.NumGE1500) FROM satscores ss1);	california_schools
SELECT a.account_id, a.frequency, d.A2 FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE a.frequency = 'issuance' AND d.A2 = 'East Bohemia';	financial
SELECT COUNT(*) FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.district_id IN (SELECT district_id FROM district d WHERE d.A5 ilike '%Prague%') AND a.frequency ='monthly';	financial
SELECT '1995' AS year, AVG(unemployed_ratio) AS average_unemployment_ratio FROM (SELECT (SELECT COUNT(DISTINCT c.client_id) - COUNT(DISTINCT l.client_id) / NULLIF(COUNT(DISTINCT c.client_id), 0) AS unemployed_ratio FROM client c LEFT JOIN loan l ON c.client_id = l.client_id AND EXTRACT(YEAR FROM l.date) = 1995) AS unemployed_ratio FROM dual) AS subquery UNION ALL SELECT '1996' AS year, AVG(unemployed_ratio) AS average_unemployment_ratio FROM (SELECT (SELECT COUNT(DISTINCT c.client_id) - COUNT(DISTINCT l.client_id) / NULLIF(COUNT(DISTINCT c.client_id), 0) AS unemployed_ratio FROM client c LEFT JOIN loan l ON c.client_id = l.client_id AND EXTRACT(YEAR FROM l.date) = 1996) AS unemployed_ratio FROM dual) AS subquery ORDER BY year, average_unemployment_ratio DESC NULLS LAST;	financial
SELECT COUNT(DISTINCT a.district_id) FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.gender = 'female' AND a.frequency ='monthly' AND a.date BETWEEN '2021-01-01' AND '2021-12-31' AND a.balance > 6000 AND a.balance < 10000;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE c.gender ='male' AND t.amount > 8000;	financial
SELECT a.account_id, AVG(a.amount) AS avg_salary FROM account a JOIN client c ON a.district_id = c.district_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' GROUP BY a.account_id ORDER BY avg_salary ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.birth_date = (SELECT MIN(c2.birth_date) FROM client c2) ORDER BY a.account_id NULLS LAST;	financial
SELECT COUNT(*) FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.frequency = 'weekly' AND c.gender = 'Owner';	financial
SELECT c.client_id, c.gender FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'Disponent';	financial
SELECT a.account_id, a.frequency, l.amount AS approved_amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE EXTRACT(YEAR FROM l.date) = 1997 ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id, MAX(l.amount) AS max_amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE EXTRACT(YEAR FROM a.date) = 1993 AND l.duration > 12 GROUP BY a.account_id ORDER BY max_amount DESC NULLS LAST;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'female' AND c.birth_date < '1950-01-01' AND d.A2 ilike '%Slokolov%';	financial
SELECT a.account_id, a.date FROM account a WHERE EXTRACT(YEAR FROM a.date) = 1995 ORDER BY a.date ASC LIMIT 1;	financial
SELECT a.account_id, a.date, a.frequency, a.balance FROM account a WHERE a.date < '1997-01-01' AND a.balance > 3000;	financial
SELECT c.client_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN card cd ON a.account_id = cd.disp_id WHERE cd.issued = '1994-03-03';	financial
SELECT a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND EXTRACT(YEAR FROM t.date) = 1998 AND EXTRACT(MONTH FROM t.date) = 10 AND EXTRACT(DAY FROM t.date) = 14;	financial
SELECT a.district_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date = '1994-08-25';	financial
WITH client_transactions AS (SELECT t.account_id, SUM(t.amount) AS total_amount FROM trans t JOIN card c ON t.account_id = c.disp_id WHERE c.issued = '1996-10-21' GROUP BY t.account_id) SELECT MAX(total_amount) AS max_transaction FROM client_transactions;	financial
SELECT c.gender FROM client c JOIN account a ON c.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id JOIN district d ON a.district_id = d.district_id WHERE t.date = (SELECT MAX(t2.date) FROM trans t2) AND d.A10 = (SELECT AVG(d2.A10) FROM district d2) ORDER BY c.birth_date ASC NULLS LAST LIMIT 1;	financial
SELECT t.amount FROM account a JOIN client c ON a.district_id = c.district_id JOIN trans t ON a.account_id = t.account_id WHERE a.date = (SELECT MIN(a2.date) FROM account a2 JOIN client c2 ON a2.district_id = c2.district_id JOIN trans t2 ON a2.account_id = t2.account_id WHERE c2.client_id = c.client_id) AND a.account_id IN (SELECT l.account_id FROM loan l GROUP BY l.account_id ORDER BY SUM(l.amount) DESC LIMIT 1);	financial
SELECT COUNT(*) AS number_of_clients FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.gender = 'female';	financial
SELECT d.disp_id FROM disp d JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 5100 AND t.date = '1998-09-02';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.gender = 'female' AND EXTRACT(YEAR FROM a.date) = 1996;	financial
SELECT d.A2, d.A3, d.A4, d.A5, d.A6, d.A7, d.A8, d.A9, d.A10, d.A11, d.A12, d.A13, d.A14, d.A15, d.A16 FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN loan l ON d.account_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 ilike '%Prague%' ORDER BY a.account_id ASC LIMIT 1;	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender ='male' THEN c.client_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.client_id), 0) AS proportion FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE d.A11 > 1000000;	financial
SELECT (t.balance - l.balance) / NULLIF(l.balance, 0) * 100 AS percentage_change FROM trans t JOIN loan l ON t.account_id = l.account_id WHERE t.account_id IN (SELECT account_id FROM account WHERE date = '1993-07-05') AND (t.date BETWEEN '1993-03-22' AND '1998-12-27');	financial
SELECT CAST(SUM(CASE WHEN l.status = 'paid' THEN l.amount ELSE 0 END) AS FLOAT) / NULLIF(SUM(l.amount), 0) AS fraction_paid FROM loan l;	financial
SELECT CAST(COUNT(CASE WHEN l.status = 'active' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS fraction_active FROM loan l WHERE l.amount < 100000;	financial
SELECT a.account_id, d.A2, d.A3 FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE EXTRACT(YEAR FROM a.date) = 1993 AND a.date > (SELECT MAX(t.date) FROM trans t WHERE t.account_id = a.account_id);	financial
SELECT a.account_id, COUNT(*) AS frequency FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.date BETWEEN '1995-01-01' AND '2000-12-31' AND c.gender ='male' AND a.frequency ='monthly' GROUP BY a.account_id ORDER BY frequency DESC NULLS LAST;	financial
SELECT a.account_id, a.date FROM account a WHERE a.district_id IN (SELECT d.district_id FROM district d WHERE d.A2 ilike '%Prachatice%');	financial
SELECT d.A2 AS district, d.A3 AS region FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A3 AS district, d.A2 AS region, l.amount FROM account a JOIN loan l ON a.account_id = l.account_id JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3 AS district, AVG(d.A8) AS avg_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE l.duration = 60 GROUP BY l.loan_id, d.A3;	financial
SELECT d.A3, ((d.A14 - d.A11) / d.A11) * 100 AS percentage_change FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id JOIN client c ON a.account_id = c.client_id WHERE l.status = 'active' AND l.date BETWEEN '1995-01-01' AND '1996-12-31' AND c.gender ='male' ORDER BY percentage_change DESC NULLS LAST;	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN d.A2 = 'Decin' THEN a.account_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.account_id), 0) AS proportion FROM account a JOIN district d ON a.district_id = d.district_id WHERE EXTRACT(YEAR FROM a.date) = 1993;	financial
SELECT a.account_id FROM account a WHERE a.frequency ='monthly';	financial
SELECT d.district_id, COUNT(*) AS female_count FROM account a JOIN client c ON a.account_id = c.client_id WHERE c.gender = 'female' GROUP BY d.district_id ORDER BY female_count DESC NULLS LAST LIMIT 10;	financial
SELECT d.A2, SUM(t.amount) AS total_amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE t.type = 'withdrawal' AND EXTRACT(MONTH FROM t.date) = 1 AND EXTRACT(YEAR FROM t.date) = 1996 AND d.A2 IS NOT NULL GROUP BY d.A2 ORDER BY total_amount DESC LIMIT 10;	financial
SELECT COUNT(*) FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.gender ='male' AND a.account_id NOT IN (SELECT card_id FROM card);	financial
SELECT d.A2, COUNT(l.loan_id) AS active_loans_count FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'active' GROUP BY d.A2 ORDER BY active_loans_count DESC LIMIT 1;	financial
SELECT AVG(l.amount) AS average_loan_amount FROM loan l JOIN client c ON l.account_id = c.client_id WHERE c.gender ='male';	financial
SELECT d.A2 AS branch_location, d.A3 AS district_name, COUNT(t.account_id) AS number_of_accounts FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE EXTRACT(YEAR FROM t.date) = 1996 GROUP BY d.A2, d.A3 ORDER BY number_of_accounts DESC NULLS LAST;	financial
WITH crime_data AS (SELECT d.district_id, COUNT(t.trans_id) AS total_crimes FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE EXTRACT(YEAR FROM t.date) = 1996 GROUP BY d.district_id) SELECT COUNT(a.account_id) AS total_accounts FROM account a JOIN crime_data cd ON a.district_id = cd.district_id ORDER BY total_crimes DESC LIMIT 1;	financial
SELECT COUNT(*) FROM trans t JOIN card c ON t.account_id = c.card_id WHERE t.operation = 'withdrawal' AND t.balance < 0 AND EXTRACT(MONTH FROM c.issued) = EXTRACT(MONTH FROM CURRENT_DATE);	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.amount >= 250000 AND a.frequency ='monthly' AND l.date BETWEEN '1995-01-01' AND '1997-12-31' AND l.status = 'approved';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.district_id = 1 AND l.status = 'active';	financial
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district d2 ON a.district_id = d2.district_id WHERE d.type = 'CRIME' AND EXTRACT(YEAR FROM a.date) = 1995 AND c.gender = 'Male' ORDER BY d.type DESC LIMIT 1;	financial
SELECT COUNT(*) FROM card c WHERE c.type ilike '%high-level%' AND c.type ilike '%credit%';	financial
SELECT COUNT(*) FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.district_id = (SELECT district_id FROM district WHERE LOWER(A2) = 'pisek');	financial
SELECT d.A2, SUM(t.amount) AS total_amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE EXTRACT(YEAR FROM t.date) = 1997 AND t.amount > 10000 GROUP BY d.A2 ORDER BY total_amount DESC NULLS LAST;	financial
SELECT a.account_id, a.date FROM account a JOIN order o ON a.account_id = o.account_id WHERE a.frequency = 'household' AND a.district_id = (SELECT district_id FROM district WHERE A2 = 'Pisek');	financial
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.account_id = c.disp_id WHERE c.type = 'gold' AND c.type = 'junior';	financial
SELECT AVG(t.amount) FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.type = 'credit' AND EXTRACT(YEAR FROM t.date) = 2021;	financial
SELECT a.account_id FROM account a JOIN card c ON a.account_id = c.card_id WHERE EXTRACT(YEAR FROM a.date) = 1998 AND a.frequency = 'credit' AND a.amount < (SELECT AVG(amount) FROM account WHERE frequency = 'credit' AND EXTRACT(YEAR FROM date) = 1998);	financial
SELECT a.account_id, a.frequency FROM account a JOIN card c ON a.account_id = c.disp_id JOIN client cl ON a.district_id = cl.district_id WHERE cl.gender = 'female' AND c.type = 'credit' AND a.account_id IN (SELECT l.account_id FROM loan l);	financial
SELECT COUNT(*) AS female_accounts_in_south_bohemia FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.gender = 'F';	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.gender ='male' AND a.frequency ='monthly' AND a.date >= '2020-01-01' AND a.date <= '2020-12-31' AND c.birth_date BETWEEN '1990-01-01' AND '1999-12-31';	financial
SELECT a.frequency FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE d.A10 > 8000 AND d.A10 <= 9000 AND a.frequency NOT IN ('Checking', 'Savings');	financial
SELECT COUNT(*) FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id WHERE t.bank = 'AB' AND c.gender ='male';	financial
SELECT d.A2 FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'withdrawal';	financial
SELECT AVG(c.count) AS average_crimes FROM (SELECT COUNT(t.trans_id) AS count FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id WHERE a.date >= '1997-01-01' AND t.date BETWEEN '1995-01-01' AND '1995-12-31' AND a.frequency ='monthly' AND c.gender ='male' GROUP BY c.district_id HAVING COUNT(t.trans_id) > 4000) AS c;	financial
SELECT COUNT(*) FROM account a JOIN card c ON a.account_id = c.card_id WHERE c.type = 'classic' AND a.frequency = 'daily';	financial
SELECT COUNT(*) AS male_clients FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.gender ='male' AND a.frequency = 'Hl.m. Praha';	financial
SELECT CAST(COUNT(*) FILTER (WHERE c.type = 'Gold' AND c.issued < '1998-01-01') AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM card c;	financial
SELECT c.client_id, c.gender FROM client c JOIN account a ON c.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id ORDER BY l.amount DESC NULLS LAST LIMIT 1;	financial
SELECT COUNT(*) AS number_of_crimes FROM account a JOIN loan l ON a.account_id = l.account_id JOIN trans t ON a.account_id = t.account_id WHERE a.account_id = 532 AND EXTRACT(YEAR FROM t.date) = 1995 AND t.type = 'withdrawal';	financial
SELECT a.district_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 33333;	financial
SELECT t.amount, t.date, t.operation, t.balance FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id WHERE c.client_id = 3356 AND t.type = 'cash' ORDER BY t.date DESC;	financial
SELECT COUNT(*) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'weekly' AND l.amount < 200000;	financial
SELECT c.type FROM client cl JOIN disp d ON cl.client_id = d.client_id JOIN card c ON d.account_id = c.card_id WHERE cl.client_id = 13539;	financial
SELECT d.A3 FROM client c JOIN account a ON c.client_id = a.client_id JOIN district d ON a.district_id = d.district_id WHERE c.client_id = 3541;	financial
SELECT d.A2, COUNT(l.loan_id) AS number_of_loans FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE l.status = 'finished' GROUP BY d.A2 ORDER BY number_of_loans DESC NULLS LAST LIMIT 1;	financial
SELECT c.client_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 32423;	financial
SELECT t.account_id, t.date, t.type, t.amount, t.balance FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5 ORDER BY t.date ASC;	financial
SELECT COUNT(*) AS number_of_accounts FROM account a JOIN client c ON a.district_id = c.district_id WHERE LOWER(c.gender) ='male';	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card k ON d.disp_id = k.disp_id WHERE k.type = 'junior' AND EXTRACT(YEAR FROM k.issued) > 1996;	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender = 'female' THEN d.district_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT d.district_id), 0) AS proportion FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON a.district_id = d.district_id WHERE d.A10 > 10000;	financial
WITH total_loan_96 AS (SELECT SUM(amount) AS total_loan_1996 FROM loan WHERE account_id IN (SELECT account_id FROM client WHERE gender ='male')), total_loan_97 AS (SELECT SUM(amount) AS total_loan_1997 FROM loan WHERE account_id IN (SELECT account_id FROM client WHERE gender ='male') AND date BETWEEN '1997-01-01' AND '1997-12-31') SELECT ((total_loan_1997 - total_loan_1996) / NULLIF(total_loan_1996, 0)) * 100 AS growth_rate FROM total_loan_96, total_loan_97;	financial
SELECT COUNT(*) FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN account a ON d.account_id = a.account_id WHERE c.type = 'credit' AND EXTRACT(YEAR FROM a.date) > 1995;	financial
SELECT (SELECT COUNT(*) FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.date >= '1996-01-01' AND a.date < '1997-01-01' AND c.gender ='male') - (SELECT COUNT(*) FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.date >= '1996-01-01' AND a.date < '1997-01-01' AND c.gender = 'female') AS difference;	financial
SELECT COUNT(DISTINCT d.client_id) AS client_count, COUNT(DISTINCT d.account_id) AS account_count FROM disp d WHERE d.account_id BETWEEN 1 AND 10;	financial
SELECT COUNT(*) AS frequency, SUM(amount) AS total_amount FROM trans WHERE account_id = 3 AND type = 'debit' AND operation = 'debit';	financial
SELECT c.birth_date FROM client c JOIN account a ON c.client_id = a.client_id WHERE a.account_id = 130;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'owner';	financial
SELECT SUM(l.amount) AS total_debt, COUNT(*) AS number_of_payments, SUM(l.payments) AS total_payments_made FROM loan l WHERE l.account_id IN (SELECT d.client_id FROM disp d WHERE d.account_id IN (SELECT a.account_id FROM account a WHERE a.frequency = 'Monthly' AND a.date BETWEEN (CURRENT_DATE - interval '6 months') AND CURRENT_DATE));	financial
SELECT SUM(t.amount) AS total_amount, c.gender FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.client_id = c.client_id WHERE t.trans_id = 851 AND c.client_id = 4 GROUP BY c.gender;	financial
SELECT c.type FROM client cl JOIN disp d ON cl.client_id = d.client_id JOIN card c ON d.account_id = c.disp_id WHERE cl.client_id = 9;	financial
SELECT SUM(t.amount) AS total_amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.client_id = c.client_id WHERE c.client_id = 617 AND EXTRACT(YEAR FROM t.date) = 1998;	financial
SELECT c.client_id FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND a.frequency = 'East Bohemia' ORDER BY c.client_id;	financial
SELECT c.client_id, l.amount FROM client c JOIN account a ON c.client_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(*) FROM client c JOIN account a ON c.client_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender ='male' AND EXTRACT(YEAR FROM c.birth_date) BETWEEN 1974 AND 1976 AND l.payments > 4000;	financial
SELECT COUNT(*) AS number_of_accounts FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.birth_date > '1996-12-31';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.account_id JOIN card cd ON a.account_id = cd.disp_id WHERE c.gender = 'female' AND cd.type = 'junior';	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender = 'female' THEN a.account_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.account_id), 0) AS proportion FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prague';	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender ='male' THEN a.account_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.account_id), 0) AS proportion FROM account a JOIN client c ON a.account_id = c.client_id WHERE a.frequency = 'weekly';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.account_id WHERE a.frequency = 'weekly issuance';	financial
WITH loan_validity AS (SELECT l.account_id, MAX(l.date) AS max_loan_date FROM loan l WHERE l.date < CURRENT_DATE - INTERVAL '24 months' GROUP BY l.account_id) SELECT a.account_id, a.date, l.max_loan_date FROM account a JOIN loan_validity l ON a.account_id = l.account_id WHERE a.date < '1997-01-01' ORDER BY a.date ASC NULLS LAST;	financial
WITH client_salary AS (SELECT c.client_id, AVG(d.A10) AS avg_salary FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id GROUP BY c.client_id) SELECT t.account_id FROM client_salary cs JOIN trans t ON cs.client_id = t.account_id WHERE cs.gender = 'F' ORDER BY cs.avg_salary ASC LIMIT 1;	financial
SELECT COUNT(*) FROM client c JOIN account a ON c.district_id = a.district_id WHERE EXTRACT(YEAR FROM c.birth_date) = 1920 AND a.frequency = 'East Bohemia';	financial
SELECT COUNT(*) FROM loan l WHERE l.duration = 24 AND l.type = 'weekly';	financial
SELECT AVG(l.amount) AS average_loan_amount FROM loan l WHERE l.status = 'active';	financial
SELECT c.client_id, d.district_id FROM client c JOIN account a ON c.client_id = a.client_id JOIN loan l ON a.account_id = l.account_id JOIN district d ON c.district_id = d.district_id;	financial
SELECT c.client_id, EXTRACT(YEAR FROM age(CURRENT_DATE, c.birth_date)) AS age FROM client c JOIN account a ON c.client_id = a.account_id JOIN card cd ON a.account_id = cd.disp_id WHERE cd.type = 'credit' AND a.frequency = 'high';	financial
SELECT bt.bond_type, COUNT(*) AS COUNT FROM bond bt GROUP BY bt.bond_type ORDER BY COUNT DESC LIMIT 1;	toxicology
SELECT COUNT(*) AS num_molecules FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'Cl';	toxicology
SELECT AVG(COUNT) AS average_oxygen_count FROM (SELECT COUNT(a.atom_id) AS COUNT FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'O' AND b.bond_type ='single') AS subquery;	toxicology
SELECT AVG(COUNT(b.bond_id)) AS average_bonds FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id AND a.atom_id2 = c.atom_id2 WHERE c.atom_id = c.atom_id2;	toxicology
SELECT COUNT(*) AS non_carcinogenic_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label not like '%carcinogenic%';	toxicology
SELECT DISTINCT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'triple' AND m.label IN (SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'triple' GROUP BY m.label HAVING COUNT(DISTINCT b.bond_type) > 1);	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN b.bond_type = 'double' THEN a.atom_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.atom_id), 0) AS proportion FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id;	toxicology
SELECT COUNT(*) AS total_bonds FROM bond WHERE bond_type = 'triple';	toxicology
SELECT COUNT(*) FROM atom a WHERE a.element!= 'Br';	toxicology
SELECT COUNT(*) AS number_of_carcinogenic_molecules FROM (SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'carcinogenic' LIMIT 100) AS carcinogenic_molecules;	toxicology
SELECT a.atom_id, a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element ='silicon';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'double';	toxicology
SELECT m.label, COUNT(a.atom_id) AS count_atoms FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'H' GROUP BY m.label ORDER BY count_atoms DESC LIMIT 1;	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id WHERE a.element = 'Te';	toxicology
SELECT a.atom_id, a.element, b.atom_id AS neighbor, b.element AS neighbor_element, b.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom b ON c.atom_id2 = b.atom_id WHERE c.bond_id IS NOT NULL AND b.atom_id!= a.atom_id;	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type!= 'carcinogenic' GROUP BY a.atom_id, a.element ORDER BY a.atom_id NULLS LAST;	toxicology
SELECT a.element, COUNT(a.element) AS count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label not ilike '%carcinogen%' GROUP BY a.element ORDER BY count ASC LIMIT 1;	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20';	toxicology
SELECT DISTINCT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element!= 'Sn';	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS total_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element IN ('Iodine', 'Sulfur') AND b.bond_type ='single';	toxicology
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'triple';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR181';	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN a.element IS NULL THEN b.molecule_id ELSE NULL END) AS FLOAT) / NULLIF(COUNT(DISTINCT b.molecule_id), 0) AS proportion FROM bond b LEFT JOIN atom a ON b.molecule_id = a.molecule_id WHERE b.bond_type = 'carcinogenic';	toxicology
SELECT CAST(COUNT(DISTINCT b.molecule_id) AS FLOAT) / NULLIF((SELECT COUNT(DISTINCT m.molecule_id) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = 'triple'), 0) AS proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = 'triple' AND m.label IN (SELECT label FROM molecule WHERE label LIKE '%carcinogenic%');	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR000' ORDER BY a.element ASC LIMIT 3;	toxicology
SELECT a.atom_id, a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR001_2_6' AND c.atom_id = c.atom_id2;	toxicology
SELECT COUNT(DISTINCT CASE WHEN m.is_carcinogenic = 'yes' THEN m.molecule_id END) - COUNT(DISTINCT CASE WHEN m.is_carcinogenic = 'no' THEN m.molecule_id END) AS difference FROM molecule m;	toxicology
SELECT c.atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR_000_2_5';	toxicology
SELECT b.bond_id FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR000_2' AND a2.molecule_id = 'TR000_2';	toxicology
SELECT m.label FROM bond b JOIN atom a1 ON b.molecule_id = a1.molecule_id JOIN atom a2 ON b.bond_id = a2.atom_id JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE b.bond_type = 'double' ORDER BY m.label ASC NULLS LAST LIMIT 5;	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN b.bond_type = 'double' THEN c.atom_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.atom_id), 0) AS proportion FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.molecule_id = 'TR008';	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN m.label LIKE '%carcinogenic%' THEN a.atom_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.atom_id), 0) AS proportion FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id;	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN a.element = 'H' THEN a.atom_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.atom_id), 0) * 100 AS percentage_of_hydrogen FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR206';	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id WHERE a.molecule_id = 'TR000';	toxicology
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR060';	toxicology
SELECT b.bond_type, COUNT(b.bond_id) AS count_bonds FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.molecule_id = 'TR018' GROUP BY b.bond_type ORDER BY count_bonds DESC LIMIT 1;	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type ='single' AND m.label NOT IN (SELECT m2.label FROM molecule m2 JOIN atom a2 ON m2.molecule_id = a2.molecule_id JOIN connected c2 ON a2.atom_id = c2.atom_id JOIN bond b2 ON c2.bond_id = b2.bond_id WHERE b2.bond_type = 'carcinogenic') ORDER BY m.label ASC NULLS LAST LIMIT 3;	toxicology
SELECT b.bond_type FROM bond b WHERE b.molecule_id = 'TR006' ORDER BY b.bond_type ASC LIMIT 2;	toxicology
SELECT COUNT(*) AS number_of_bonds FROM connected c JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.atom_id = '12' AND b.molecule_id = 'TR009';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'Br';	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.bond_id = 'TR001_6_9';	toxicology
SELECT m.label, CASE WHEN m.carcinogenic = 'yes' THEN 'carcinogenic' ELSE 'not carcinogenic' END AS carcinogenic_status FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT b.molecule_id) FROM bond b WHERE b.bond_type = 'triple';	toxicology
SELECT COUNT(*) FROM connected c WHERE c.atom_id = '19';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR004';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m WHERE m.label IS NULL;	toxicology
SELECT DISTINCT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id >= '21' AND a.atom_id <= '25';	toxicology
SELECT b.bond_id, b.bond_type FROM bond b JOIN atom a1 ON b.molecule_id = a1.molecule_id JOIN atom a2 ON b.molecule_id = a2.molecule_id WHERE a1.element = 'P' AND a2.element = 'N';	toxicology
SELECT m.label, COUNT(b.bond_type) AS double_bond_count FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = 'double' GROUP BY m.label ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT AVG(COUNT(b.bond_id)) AS average_bonds FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'Iodine';	toxicology
SELECT b.bond_type, b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.atom_id = '45' OR c.atom_id2 = '45' ORDER BY b.bond_id NULLS LAST;	toxicology
SELECT DISTINCT a.element FROM atom a WHERE a.atom_id NOT IN (SELECT c.atom_id FROM connected c);	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR447' AND b.bond_type = 'triple';	toxicology
SELECT a.element FROM atom a WHERE a.molecule_id = 'TR144_8_19';	toxicology
WITH double_bonds AS (SELECT m.molecule_id, COUNT(b.bond_id) AS num_double_bonds FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id WHERE a.element = 'C' AND b.bond_type = 'double' GROUP BY m.molecule_id) SELECT m.label, db.num_double_bonds FROM double_bonds db JOIN molecule m ON db.molecule_id = m.molecule_id WHERE m.label LIKE '%carcinogenic%' ORDER BY db.num_double_bonds DESC NULLS LAST LIMIT 1;	toxicology
SELECT a.element, COUNT(*) AS frequency FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label IN ('carcinogenic') GROUP BY a.element ORDER BY frequency ASC LIMIT 1;	toxicology
SELECT DISTINCT c.atom_id, a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'lead';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'triple';	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN b.bond_type = 'C-C' THEN c.atom_id || c.atom_id2 END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.atom_id), 0) AS fraction FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id;	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN b.bond_type ='single' THEN c.molecule_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.molecule_id), 0) AS proportion FROM connected c JOIN bond b ON c.bond_id = b.bond_id;	toxicology
SELECT SUM(CASE WHEN a.element = 'C' THEN 1 ELSE 0 END) AS carbon_atoms, SUM(CASE WHEN a.element = 'H' THEN 1 ELSE 0 END) AS hydrogen_atoms FROM atom a;	toxicology
SELECT c.atom_id2 FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom b ON c.atom_id2 = b.atom_id WHERE a.element ='sulfur';	toxicology
SELECT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'Tin';	toxicology
SELECT COUNT(DISTINCT a.element) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type ='single';	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = 'triple' AND (a.element = 'P' OR a.element = 'Br');	toxicology
SELECT b.bond_id FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id AND a.atom_id = c.atom_id2 JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = 'carcinogenic';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'C' AND a.element IN (SELECT element FROM atom WHERE element NOT IN ('O', 'N')) AND NOT EXISTS (SELECT 1 FROM bond b WHERE b.molecule_id = m.molecule_id AND b.bond_type = 'double bond');	toxicology
SELECT a.element, SUM(CASE WHEN b.bond_type ='single' THEN 1 ELSE 0 END)::FLOAT / COUNT(*) AS fraction FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'Cl' GROUP BY a.element;	toxicology
SELECT m.label FROM molecule m WHERE m.molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m WHERE m.label NOT ILIKE '%carcinogenic%';	toxicology
SELECT m.label, COUNT(*) AS total_carbon_atoms FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'C' AND m.molecule_id BETWEEN 'TR000' AND 'TR030' GROUP BY m.label ORDER BY total_carbon_atoms DESC NULLS LAST;	toxicology
SELECT b.bond_type FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.molecule_id BETWEEN 'TR000' AND 'TR050' ORDER BY b.bond_type NULLS LAST;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT b.bond_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'Iodine';	toxicology
SELECT CASE WHEN c.carcinogenic = 'yes' THEN 'carcinogenic' ELSE 'non carcinogenic' END AS carcinogenic_status, COUNT(*) AS number_of_molecules FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN (SELECT b.molecule_id FROM bond b WHERE b.bond_type = 'covalent') AS b ON a.molecule_id = b.molecule_id WHERE a.element = 'Calcium' GROUP BY carcinogenic;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_1_8' AND a.element IN ('chlorine', 'carbon');	toxicology
SELECT m.molecule_id, a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'carbon' AND b.bond_type = 'triple' AND m.label not ilike '%carcinogenic%' GROUP BY m.molecule_id, a.element ORDER BY m.molecule_id NULLS LAST LIMIT 2;	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN a.element = 'Cl' THEN a.atom_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.atom_id), 0) AS fraction_of_chlorine FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'carcinogenic';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR001';	toxicology
SELECT b.molecule_id FROM bond b WHERE b.bond_type = 'double';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'triple' ORDER BY c.atom_id, c.atom_id2;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR005_16_26';	toxicology
SELECT COUNT(*) AS non_carcinogenic_molecules FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type ='single';	toxicology
SELECT b.bond_type FROM bond b WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id, m.label, c.carcinogenic FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id LEFT JOIN (SELECT m.label, 1 AS carcinogenic FROM molecule m JOIN connected c ON m.molecule_id = c.atom_id AND m.molecule_id = c.atom_id2) AS c ON m.label = c.label WHERE b.bond_type = 'triple';	toxicology
SELECT c.atom_id, COUNT(DISTINCT b.bond_type) AS bond_count, COUNT(DISTINCT c.atom_id2) AS connections FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'toxicology' GROUP BY c.atom_id ORDER BY c.atom_id ASC NULLS LAST;	toxicology
SELECT a.element, COUNT(a.element)::FLOAT / NULLIF(COUNT(*), 0) AS ratio FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR006' AND a.element = 'Hydrogen' GROUP BY a.element;	toxicology
SELECT DISTINCT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN connected c ON a.atom_id = c.atom_id AND a.atom_id2 = c.atom_id2 WHERE a.element = 'Calcium' AND c.bond_id IS NULL;	toxicology
SELECT DISTINCT b.bond_type FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.element = 'Te';	toxicology
SELECT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_10_11' ORDER BY a.element NULLS LAST;	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN b.bond_type = 'triple' THEN a.molecule_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.molecule_id), 0) AS proportion FROM atom a JOIN bond b ON a.atom_id = b.molecule_id;	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN b.bond_type = 'double' THEN c.atom_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.atom_id), 0) AS proportion FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR047';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_1';	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'carcinogenic' AND a.element = 'TR151';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR151';	toxicology
SELECT COUNT(*) AS number_of_carcinogenic_compounds FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'C' AND m.label ilike '%carcinogenic%';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id BETWEEN 'TR010' AND 'TR050' AND a.element = 'carbon';	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label LIKE '%carcinogenic compounds%';	toxicology
SELECT DISTINCT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label ilike '%carcinogenic%';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'hydrogen' AND m.label ilike '%carcinogenic compound%';	toxicology
SELECT c.atom_id, c.atom_id2, b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'TR00_1' AND b.bond_type = 'TR00_1_2';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'C' AND m.label NOT ILIKE '%carcinogenic%';	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN a.element = 'hydrogen' THEN m.molecule_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT m.molecule_id), 0) AS proportion FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'hydrogen' AND EXISTS (SELECT 1 FROM bond b WHERE b.molecule_id = m.molecule_id AND b.bond_type = 'carcinogenic');	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id WHERE c.atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'C') AND c.atom_id IN (SELECT atom_id FROM atom WHERE element = 'H');	toxicology
SELECT a.element FROM atom a WHERE a.molecule_id = 'TR186';	toxicology
SELECT b.bond_type FROM bond b WHERE b.bond_id = 'TR007_4_19';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) AS num_double_bonds, m.label AS is_carcinogenic FROM atom a JOIN bond b ON a.atom_id = b.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = 'double' AND m.label = 'TR006';	toxicology
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element IN ('benzene', 'benzene-1,3-dione', 'benzene-1,2-dione');	toxicology
SELECT b.bond_id, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type ='single';	toxicology
SELECT DISTINCT m.label, a.element FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id JOIN atom a ON b.bond_id = a.atom_id WHERE b.bond_type = 'triple';	toxicology
SELECT DISTINCT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) AS bond_count FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 'Cl';	toxicology
SELECT a.atom_id, COUNT(b.bond_type) AS bond_type_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS molecule_count, COUNT(DISTINCT CASE WHEN b.bond_type = 'double' THEN m.molecule_id END) AS double_bond_molecule_count, COUNT(DISTINCT CASE WHEN b.bond_type = 'double' AND m.label = 'carcinogenic compound' THEN m.molecule_id END) AS carcinogenic_double_bond_molecule_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element!= 'S' AND b.bond_type!= 'double';	toxicology
SELECT b.bond_type FROM bond b WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) AS atom_count FROM atom a WHERE a.molecule_id = 'TR005';	toxicology
SELECT COUNT(*) AS number_of_bonds FROM bond b WHERE b.bond_type ='single';	toxicology
SELECT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element ilike '%cl%' AND m.label ilike '%carcinogenic%';	toxicology
SELECT DISTINCT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'C' AND m.label NOT IN (SELECT label FROM molecule WHERE label ilike '%carcinogenic%');	toxicology
SELECT CAST(COUNT(DISTINCT m.molecule_id) filter (WHERE a.element = 'Chlorine') AS FLOAT) / NULLIF(COUNT(DISTINCT m.molecule_id), 0) AS fraction FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label LIKE '%carcinogenic%' GROUP BY m.molecule_id HAVING COUNT(DISTINCT a.molecule_id) > 1;	toxicology
SELECT b.molecule_id FROM bond b WHERE b.bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT b.element) FROM bond b WHERE b.bond_id = 'TR001_3_4';	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2';	toxicology
SELECT m.label FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR000_2' AND a2.atom_id = 'TR000_4';	toxicology
SELECT a.element FROM atom a WHERE a.atom_id = 'TR000_1';	toxicology
SELECT c.molecule_id FROM connected c WHERE c.atom_id = 'TR000' AND c.atom_id2 IN (SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'carcinogenic');	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN b.bond_type ='single' THEN a.atom_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.atom_id), 0) AS proportion FROM atom a LEFT JOIN bond b ON a.atom_id = b.molecule_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'N';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'S' AND b.bond_type = 'double';	toxicology
SELECT a.molecule_id, COUNT(a.atom_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label NOT ILIKE '%carcinogenic%' GROUP BY a.molecule_id HAVING COUNT(a.atom_id) > 5;	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR024' AND b.bond_type = 'double';	toxicology
WITH molecule_atoms AS (SELECT m.molecule_id, COUNT(a.atom_id) AS num_atoms FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id GROUP BY m.molecule_id) SELECT m.label, ma.num_atoms FROM molecule_atoms ma JOIN molecule m ON ma.molecule_id = m.molecule_id WHERE m.label ilike '%carcinogenic%' ORDER BY ma.num_atoms DESC LIMIT 1;	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN a.element = 'H' AND b.bond_type = 'triple' THEN m.molecule_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT m.molecule_id), 0) * 100 AS percentage FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'carcinogenic';	toxicology
SELECT COUNT(*) AS number_of_molecules_with_single_bonds FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type ='single' AND m.molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*) AS carbon_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'C' AND m.molecule_id = 'TR008';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label not ilike '%carcinogenic%' ORDER BY a.element NULLS LAST;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'O' AND b.bond_type = 'double bond';	toxicology
SELECT COUNT(*) FROM atom a JOIN bond b ON a.atom_id = b.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = 'triple' AND m.label not ilike '%carcinogenic%';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR016';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'C' AND b.bond_type = 'double' AND a.molecule_id = 'TR012' AND c.atom_id2 = a.atom_id;	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'O' AND m.label IN ('Molecule1', 'Molecule2');	toxicology
SELECT c.uuid, c.name, c.artist, c.rarity FROM cards c WHERE c.hasFoil = 1 AND c.hasNonFoil = 1 AND c.isFoil = 1 AND c.isNonFoil = 1;	card_games
SELECT c.name, c.uuid FROM cards c WHERE c.isBorderless = 1 AND c.hasFoil = 0;	card_games
SELECT c.name, c.faceConvertedManaCost FROM cards c WHERE c.faceConvertedManaCost > c.convertedManaCost ORDER BY c.faceConvertedManaCost DESC NULLS LAST;	card_games
SELECT c.name, c.edhrecRank FROM cards c WHERE c.edhrecRank < 100 ORDER BY c.edhrecRank ASC;	card_games
SELECT c.name, c.rarity FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'banned' AND l.format = 'gladiator' AND c.rarity ='mythic';	card_games
SELECT c.uuid, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.type = 'Artifact' AND c.hasAlternativeDeckLimit = 0 AND l.format = 'Vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power IS NULL AND l.format = 'Commander';	card_games
SELECT c.name, r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel' ORDER BY c.name ASC;	card_games
SELECT r.text, r.date FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name ilike '%Sublime Epiphany%' AND c.number = '74s';	card_games
SELECT c.name, c.artist, COUNT(r.id) AS ruling_count, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.name, c.artist, c.isPromo ORDER BY ruling_count DESC LIMIT 1;	card_games
SELECT DISTINCT f.language FROM foreign_data f WHERE f.name = 'Annul' AND f.multiverseid = 29;	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'ja';	card_games
SELECT CAST(COUNT(DISTINCT CASE WHEN c.language = 'zh-CN' THEN c.uuid END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.uuid), 0) AS proportion FROM cards c;	card_games
SELECT s.code, COUNT(c.id) AS card_count FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' GROUP BY s.code ORDER BY card_count DESC;	card_games
SELECT COUNT(DISTINCT a.type) FROM cards c JOIN artist a ON c.artist = a.name WHERE a.name = 'Aaron Boyd';	card_games
SELECT c.keywords FROM cards c WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards c WHERE c.power = '∞';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT c.borderColor FROM cards c WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT c.type FROM cards c WHERE c.name = 'Ancestor''s Chosen' AND c.originalReleaseDate IS NOT NULL;	card_games
SELECT DISTINCT st.language FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name ilike '%Angel of Mercy%';	card_games
SELECT COUNT(*) FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status ='restricted' AND c.text IS NOT NULL;	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name ilike '%Condemn%';	card_games
SELECT COUNT(*) AS restricted_cards_in_starter FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status ='restricted' AND c.isStarter = 1;	card_games
SELECT l.status FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.name ilike '%Cloudchaser%Eagle%';	card_games
SELECT t.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.name ilike '%Benalish Knight%' LIMIT 1;	card_games
SELECT r.text FROM rulings r WHERE r.uuid IN (SELECT f.uuid FROM foreign_data f WHERE f.name = 'Benalish Knight');	card_games
SELECT DISTINCT c.artist FROM cards c WHERE c.name ilike '%Phyrexian%';	card_games
SELECT CAST(COUNT(DISTINCT CASE WHEN c.isBorderless = 1 THEN c.uuid END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.uuid), 0) AS proportion FROM cards c;	card_games
SELECT COUNT(*) AS reprinted_cards FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'de' AND c.isReprint = 1;	card_games
SELECT COUNT(*) AS number_of_borderless_cards FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.bordercolor IS NULL AND f.language = 'Russian';	card_games
SELECT CAST(COUNT(DISTINCT CASE WHEN c.isStorySpotlight = 1 THEN f.language END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.uuid), 0) AS proportion FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.isStorySpotlight = 1 AND f.language = 'French';	card_games
SELECT COUNT(*) FROM cards c WHERE c.toughness = '99';	card_games
SELECT DISTINCT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.name = 'Aaron Boyd';	card_games
SELECT COUNT(*) AS black_border_mtgo_only FROM cards c WHERE c.broker_price IS NULL AND c.broker_price IS NOT NULL;	card_games
SELECT c.uuid FROM cards c WHERE c.convertedManaCost = 0;	card_games
SELECT c.layout FROM cards c WHERE c.keywords ilike '%flying%' ORDER BY c.layout NULLS LAST;	card_games
SELECT COUNT(*) FROM cards c WHERE c.originalType = 'Summon - Angel' AND c.subtypes!= 'Angel';	card_games
SELECT c.uuid FROM cards c WHERE c.hasFoil = 1 AND c.isAlternative = 0 AND c.isFoil = 1;	card_games
SELECT c.id FROM cards c WHERE c.duelDeck = 'a';	card_games
SELECT c.edhrecRank FROM cards c WHERE c.frameVersion = '2015';	card_games
SELECT DISTINCT c.artist FROM cards c WHERE c.colorIdentity = 'Chinese Simplified';	card_games
SELECT c.name, c.uuid FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.isOnlineOnly = 0 AND f.language = 'Japanese';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.borderColor = 'white' AND l.status = 'banned';	card_games
SELECT c.uuid, f.language FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.type = 'creature' AND c.subtypes LIKE '%Legendary%';	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion LIKE '%Future%' ORDER BY c.name;	card_games
SELECT c.name, c.colors FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'legal' AND l.format = 'constructed' AND c.setCode = 'OGW' ORDER BY c.name;	card_games
SELECT c.name, s.translation FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN set_translations s ON c.setCode = s.setCode WHERE c.convertedManaCost = 5 AND s.translation IS NOT NULL AND c.setCode = '10E' ORDER BY c.name ASC;	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf' ORDER BY r.date DESC;	card_games
SELECT c.colors, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20 ORDER BY c.colors NULLS LAST;	card_games
SELECT c.name, f.name AS foreign_language FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.type = 'Artifact' AND c.colorIdentity like '%black%';	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) AS number_of_cards FROM cards c WHERE c.artist = 'John Avon' AND c.hasFoil = 1 AND c.power IS NULL;	card_games
SELECT COUNT(*) AS powerful_cards_count FROM cards c WHERE c.borders = 'white';	card_games
SELECT COUNT(*) FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.artist ilike '%UDON%' AND c.printings ilike '%MTGO%' AND c.hand ilike '%-1%';	card_games
SELECT COUNT(*) FROM cards c WHERE c.frameVersion = '1993' AND c.hasContentWarning = 1;	card_games
SELECT c.manaCost FROM cards c WHERE c.layout = 'normal' AND c.frameVersion = '2003' AND c.borderColor = 'black' AND c.availability IN ('paper','mtgo');	card_games
SELECT SUM(c.convertedManaCost) AS total_unconverted_mana FROM cards c WHERE c.artist = 'Rob Alexander';	card_games
SELECT DISTINCT type FROM cards WHERE type IS NOT NULL;	card_games
SELECT s.code FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE LOWER(st.language) = 'es';	card_games
SELECT CAST(COUNT(DISTINCT CASE WHEN c.hasAlternativeDeckLimit = 1 AND c.hasFoil = 1 THEN c.uuid END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.uuid), 0) AS proportion FROM cards c WHERE c.isFullArt = 1 AND c.isAlternative = 1;	card_games
SELECT c.id, COUNT(*)::FLOAT / COUNT(DISTINCT c.id) AS percentage FROM cards c WHERE c.isStorySpotlight = 1 AND c.text IS NOT NULL GROUP BY c.id ORDER BY c.id NULLS LAST;	card_games
SELECT c.name, COUNT(*)::FLOAT / (SELECT COUNT(*) FROM cards) AS fraction FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'Spanish' GROUP BY c.name ORDER BY fraction DESC NULLS LAST;	card_games
SELECT DISTINCT s.name, st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.totalSetSize = 309 ORDER BY s.name ASC;	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'pt-BR' AND s.block = 'Commander';	card_games
SELECT c.uuid, c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.type = 'Creature' AND l.status = 'Legal';	card_games
SELECT DISTINCT t.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'de' ORDER BY t.type ASC NULLS LAST;	card_games
SELECT COUNT(*) AS count FROM cards c WHERE c.power IS NULL AND c.text IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN rulings r ON c.uuid = r.uuid WHERE l.status = 'legal' AND r.text ilike '%This is a triggered mana ability%' AND c.faceName IS NULL;	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'Pauper' AND c.availability = 'paper';	card_games
SELECT c.artist FROM cards c WHERE c.text ilike '%Das perfekte Gegenmittel zu einer dichten Formation%';	card_games
SELECT f.name FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE c.type = 'Creature' AND c.layout = 'normal' AND c.borderColor = 'black' AND c.artist = 'Matthew D. Wilson' AND f.language = 'French';	card_games
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.printings = 'print' AND r.date = '2009-10-01';	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.type = 'block' AND s.name = 'Ravnica' LIMIT 1;	card_games
SELECT CAST(COUNT(DISTINCT CASE WHEN c.hasContentWarning = 0 THEN c.uuid END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.uuid), 0) AS proportion FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'legal' AND l.format = 'commander' AND c.hasContentWarning IN (0, 1);	card_games
SELECT CAST(COUNT(DISTINCT CASE WHEN c.power IS NULL THEN f.uuid END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.uuid), 0) AS fraction FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'French';	card_games
SELECT CAST(COUNT(DISTINCT CASE WHEN s.type = 'expansion' THEN st.setCode END) AS FLOAT) / NULLIF(COUNT(DISTINCT st.setCode), 0) AS proportion FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'ja';	card_games
SELECT c.printings FROM cards c WHERE c.artist = 'Daren Bader';	card_games
SELECT COUNT(*) AS number_of_cards FROM cards c WHERE c.hasBorder = 'None' AND c.edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards c WHERE c.isOversized = 1 AND c.isReprint = 1 AND c.isPromo = 1;	card_games
SELECT c.name, c.power FROM cards c WHERE c.isArenaOnly = 1 AND c.promoTypes IS NOT NULL AND c.power IS NOT NULL ORDER BY c.name ASC LIMIT 3;	card_games
SELECT f.language FROM foreign_data f WHERE f.multiverseid = 149934;	card_games
SELECT c.cardKingdomFoilId, c.cardKingdomId FROM cards c ORDER BY c.cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT CAST(COUNT(CASE WHEN c.layout!= 'normal' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM cards c;	card_games
SELECT c.number FROM cards c WHERE c.subtypes ilike '%Angel%Wizard%' AND c.faceName = c.name;	card_games
SELECT s.name, s.code FROM sets s WHERE s.isOnlineOnly = 1 ORDER BY s.name ASC LIMIT 3;	card_games
SELECT DISTINCT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Archenemy' AND s.code = 'ARC';	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5;	card_games
SELECT s.type, s.releaseDate, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206;	card_games
SELECT s.code, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC NULLS LAST LIMIT 2;	card_games
SELECT s.id FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.isForeignOnly = 1 AND st.language = 'Japanese' AND s.isFoilOnly = 1;	card_games
SELECT s.name, COUNT(c.uuid) AS card_count FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Russian' GROUP BY s.name ORDER BY card_count DESC NULLS LAST LIMIT 1;	card_games
SELECT CAST(COUNT(*) FILTER (WHERE f.language = 'zh-CN' AND f.availability = 'online') AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM foreign_data f;	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s WHERE s.isJapanese = 1 AND s.isOnlineOnly = 0;	card_games
SELECT c.id FROM cards c WHERE c.borderColor = 'black';	card_games
SELECT c.id FROM cards c WHERE c.frameEffects ilike '%extendedart%';	card_games
SELECT c.name, c.artist FROM cards c WHERE c.borderColor = 'black' AND c.isFullArt = 1 ORDER BY c.name NULLS LAST;	card_games
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 174;	card_games
SELECT s.name FROM sets s WHERE s.code = 'ALL';	card_games
SELECT f.language FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE c.name ilike '%A Pedra Fellwar%' AND f.type = 'flavor';	card_games
SELECT s.code FROM sets s WHERE s.releaseDate = '2007-07-13';	card_games
SELECT s.totalSetSize, s.setCode FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation IN ('Masques', 'Mirage') GROUP BY s.totalSetSize, s.setCode;	card_games
SELECT s.code FROM sets s WHERE s.type = 'expansion' ORDER BY s.code ASC;	card_games
SELECT f.name, c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'boros' AND f.name IS NOT NULL;	card_games
SELECT f.language, f.flavorText, c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'colorpie' ORDER BY f.language ASC;	card_games
SELECT CAST(COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Abyssal Horror';	card_games
SELECT s.code FROM sets s WHERE s.type = 'Expansion' ORDER BY s.code NULLS LAST;	card_games
SELECT f.name, c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'abzan';	card_games
SELECT f.language, c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'azorius' ORDER BY f.language ASC;	card_games
SELECT COUNT(*) AS num_cards FROM cards c WHERE c.artist = 'Aaron Miller';	card_games
SELECT COUNT(*) AS num_cards FROM cards c WHERE c.hand IS NOT NULL AND c.hand!= '0' AND c.isPaper = 1;	card_games
SELECT c.name FROM cards c WHERE c.text IS NOT NULL;	card_games
SELECT c.convertedManaCost FROM cards c WHERE c.name ilike '%Ancestor''s%Chosen%';	card_games
SELECT COUNT(*) FROM cards c WHERE c.borderColor = 'white' AND c.power IS NULL;	card_games
SELECT DISTINCT c.name FROM cards c WHERE c.isPromo = 1 AND c.otherFaceIds IS NOT NULL;	card_games
SELECT DISTINCT t FROM cards c WHERE c.name ilike '%Molimo, Maro-Sorcerer%';	card_games
SELECT DISTINCT s.name AS set_name, s.mtgoCode AS mtgo_code, s.code AS set_code FROM sets s JOIN legalities l ON s.code = l.uuid WHERE s.isFoilOnly = 1 AND s.isNonFoilOnly = 0 AND s.isOnlineOnly = 0 AND s.isPartialPreview = 0 AND s.isForeignOnly = 0 AND s.isFoilOnly = 1 AND l.status = 'legal' AND s.code IN (SELECT s2.code FROM sets s2 JOIN cards c ON s2.code = c.setCode WHERE c.promoTypes = 'bundle');	card_games
SELECT COUNT(DISTINCT a.artist) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.borderColor = 'black' AND c.printings ilike '%arena%mtgo%';	card_games
SELECT c.name, c.convertedManaCost FROM cards c WHERE c.name IN ('Serra Angel', 'Shrine Keeper') ORDER BY c.convertedManaCost DESC;	card_games
SELECT c.artist FROM cards c WHERE c.name ilike '%Battra, Dark Destroyer%';	card_games
SELECT c.name, c.convertedManaCost FROM cards c WHERE c.frameVersion = '2003' ORDER BY c.convertedManaCost DESC NULLS LAST LIMIT 3;	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code JOIN cards c ON c.setCode = s.code WHERE c.name ilike '%Ancestor''s Chosen%' AND st.language = 'it';	card_games
SELECT COUNT(*) AS translations_count FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.name ilike '%Angel of Mercy%';	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hauptset Zehnte Edition';	card_games
SELECT s.translation FROM set_translations s JOIN sets st ON s.setCode = st.code WHERE s.language = 'ko' AND st.code IN (SELECT s.code FROM sets s WHERE s.name ilike '%Ancestor''s Chosen%');	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.setCode = 'hauptset zehnte edition' AND f.flavorText IS NOT NULL AND f.flavorText LIKE '%Adam Rex%';	card_games
SELECT COUNT(*) FROM sets s WHERE s.name = 'Hauptset Zehnte Edition';	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.name = 'Eighth Edition' AND st.language = 'zh-Hans';	card_games
SELECT c.uuid, c.name, s.name AS set_name, s.releaseDate FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE c.name ilike '%Angel of Mercy%' AND s.isOnlineOnly = 1;	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT s.type FROM sets s WHERE s.name ilike '%Hauptset Zehnte Edition%';	card_games
SELECT COUNT(*) FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE LOWER(s.block) = 'ice age' AND LOWER(st.language) = 'it';	card_games
SELECT c.uuid FROM cards c WHERE c.name = 'Adarkar Valkyrie' AND c.isOnlineOnly = 1;	card_games
SELECT s.code, COUNT(*) AS number_of_sets FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'it' AND s.baseSetSize < 10 GROUP BY s.code ORDER BY number_of_sets DESC NULLS LAST;	card_games
SELECT COUNT(*) AS number_of_cards FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE LOWER(c.borderColor) = 'black' AND st.translation = 'English' AND st.setCode = 'Coldsnap';	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT DISTINCT c.artist FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'Coldsnap' ORDER BY c.id ASC LIMIT 1 OFFSET 3;	card_games
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.convertedManaCost > 5 AND c.power IS NULL AND s.code = 'Coldsnap';	card_games
SELECT ft.text FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE LOWER(c.name) = 'ancestor''s chosen' AND LOWER(fd.language) = 'it';	card_games
SELECT fd.language FROM foreign_data fd WHERE fd.name = 'Ancestor''s Chosen';	card_games
SELECT s.translation FROM cards c JOIN foreign_data f ON c.uuid = f.uuid JOIN set_translations s ON c.setCode = s.setCode WHERE c.name = 'Ancestor''s Chosen' AND s.language = 'German';	card_games
SELECT f.text AS italian_ruling FROM foreign_data f JOIN cards c ON f.uuid = c.uuid JOIN sets s ON c.setCode = s.code WHERE s.code = 'Coldsnap';	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC NULLS LAST LIMIT 1;	card_games
SELECT r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Reminisce';	card_games
SELECT CAST(COUNT(*) filter (WHERE c.convertedManaCost = 7) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT CAST(COUNT(DISTINCT c.uuid) AS FLOAT) / NULLIF((SELECT COUNT(DISTINCT s.uuid) FROM sets s WHERE s.code = 'Coldsnap'), 0) AS proportion FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.isFullArt = 1 AND s.code = 'Coldsnap';	card_games
SELECT s.code FROM sets s WHERE s.releaseDate = '2017-07-14';	card_games
SELECT s.keyruneCode FROM sets s WHERE s.code = 'PKHC';	card_games
SELECT s.mcmId FROM sets s WHERE s.code = 'SS2';	card_games
SELECT s.name FROM sets s WHERE s.releaseDate = '2017-06-09';	card_games
SELECT s.type FROM sets s WHERE s.code = 'FTVL';	card_games
SELECT s.parentCode FROM sets s WHERE s.name = 'Commander 2014 Oversized';	card_games
SELECT c.uuid, r.text AS ruling_text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' AND c.hasAlternativeDeckLimit = 1 AND c.hasContentWarning = 1 AND c.hasFoil = 1 AND c.hasNonFoil = 1 AND c.isAlternative = 1 AND c.isFullArt = 1 AND c.isOnlineOnly = 1 AND c.isOversized = 1 AND c.isPromo = 1 AND c.isReprint = 1 AND c.isReserved = 1 AND c.isStarter = 1 AND c.isStorySpotlight = 1 AND c.isTextless = 1 AND c.isTimeshifted = 1 ORDER BY c.uuid ASC;	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation';	card_games
SELECT COUNT(c.id) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Rinascita di Alara';	card_games
SELECT s.type FROM sets s WHERE s.name = 'Huitième édition';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'fr' AND s.code IN (SELECT c.setKingdomId FROM cards c WHERE c.name = 'Tendo Ice Bridge');	card_games
SELECT COUNT(*) AS num_translations FROM set_translations st WHERE LOWER(st.setCode) ='salvat 2011';	card_games
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON s.id = c.set WHERE c.name = 'Fellwar Stone' AND st.language = 'ja';	card_games
SELECT c.name, c.convertedManaCost FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero''s Path' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT s.releaseDate FROM sets s WHERE s.name = 'Ola de frío';	card_games
SELECT s.type FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.convertedManaCost = 3 AND s.name = 'World Championship Decks 2004';	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.name = 'Mirrodin' AND st.language = 'zh-Hans';	card_games
SELECT CAST(SUM(CASE WHEN c.hasNonFoil = 1 THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion_nonfoil FROM cards c JOIN set_translations st ON c.uuid = st.id WHERE st.language = 'ja';	card_games
SELECT CAST(SUM(CASE WHEN c.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE LOWER(st.language) = 'brazilian portuguese';	card_games
SELECT DISTINCT p.printings FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.text IS NOT NULL AND f.flavorText NOT ILIKE '%Aleksi Briclot%';	card_games
WITH CardSetCounts AS (SELECT s.code, COUNT(c.uuid) AS card_count FROM sets s JOIN cards c ON s.code = c.setCode GROUP BY s.code) SELECT s.code FROM CardSetCounts s ORDER BY s.card_count DESC LIMIT 1;	card_games
SELECT c.artist, MAX(c.convertedManaCost) AS max_cost FROM cards c WHERE c.faceName = c.name GROUP BY c.artist ORDER BY max_cost DESC LIMIT 1;	card_games
SELECT c.frameEffects, COUNT(*) AS count FROM cards c WHERE c.hasFoil = 1 GROUP BY c.frameEffects ORDER BY count DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards c WHERE c.duelDeck = 'A' AND c.power IS NULL AND c.hasFoil = 0;	card_games
WITH set_card_counts AS (SELECT s.id, COUNT(c.id) AS total_cards FROM sets s JOIN cards c ON s.code = c.setCode WHERE s.type = 'Commander' AND s.isFoilOnly = 0 AND s.isForeignOnly = 0 AND s.isNonFoilOnly = 0 AND s.isOnlineOnly = 0 AND s.isPartialPreview = 0 AND s.isFoilOnly = 0 GROUP BY s.id) SELECT sc.id FROM set_card_counts sc ORDER BY sc.total_cards DESC LIMIT 1;	card_games
SELECT c.name, c.convertedManaCost FROM cards c ORDER BY c.convertedManaCost DESC NULLS LAST LIMIT 10;	card_games
WITH OldestMythic AS (SELECT MIN(o.originalReleaseDate) AS earliest_release_date FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.rarity = 'Mythic' AND s.isFoilOnly = 0 AND s.isForeignOnly = 0 AND s.isNonFoilOnly = 0 AND s.isOnlineOnly = 0 AND s.isPartialPreview = 0 AND s.releaseDate <= '2020-01-01' ) SELECT s.name, l.status FROM sets s JOIN OldestMythic om ON s.releaseDate = om.earliest_release_date JOIN legalities l ON s.uuid = l.uuid;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE LOWER(fd.language) = 'fr';	card_games
SELECT COUNT(*) AS rare_enchantment_abundance_count FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'R' AND c.type = 'Enchantment' AND c.name = 'Abundance' AND l.status = 'Legal';	card_games
SELECT l.format, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'banned' GROUP BY l.format, c.name ORDER BY COUNT(l.uuid) DESC LIMIT 1;	card_games
SELECT st.translation FROM set_translations st WHERE st.setCode = 'BBD';	card_games
SELECT i.name AS illustrator, COUNT(c.uuid) AS num_cards_illustrated, GROUP_CONCAT(DISTINCT c.type) AS types FROM cards c JOIN foreign_data f ON c.uuid = f.uuid JOIN rulings r ON c.uuid = r.uuid JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = f.name GROUP BY i.name ORDER BY num_cards_illustrated ASC LIMIT 1;	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND l.format = 'Legacy' AND (c.hasContentWarning = 1 OR c.hasAlternativeDeckLimit = 1);	card_games
SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Legal';	card_games
SELECT COUNT(DISTINCT s.code) AS num_sets, ltrim(rtrim(c.language)) AS language FROM sets s JOIN cards c ON s.code = c.setCode WHERE s.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY ltrim(rtrim(c.language));	card_games
SELECT DISTINCT c.artist FROM cards c WHERE c.borderColor = 'black' AND c.isArenaOnly = 1;	card_games
SELECT c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'Old School' AND l.status IN ('restricted', 'banned');	card_games
SELECT COUNT(*) AS number_of_cards FROM cards c WHERE c.artist = 'Matthew D. Wilson' AND c.isOnlineOnly = 0;	card_games
SELECT r.text, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.setCode = 'HOUS';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'ko' AND st.language NOT IN (SELECT language FROM set_translations WHERE setCode = s.code AND language = 'ja');	card_games
SELECT DISTINCT c.frameEffects, c.name FROM cards c WHERE c.artist = 'Allen Williams' ORDER BY c.name NULLS LAST; SELECT l.uuid, l.status FROM legalities l WHERE l.status = 'banned' ORDER BY l.uuid NULLS LAST;	card_games
SELECT u.DisplayName, MAX(u.Reputation) AS MaxReputation FROM users u WHERE LOWER(u.DisplayName) IN ('harlan', 'jarrod dixon') GROUP BY u.DisplayName ORDER BY MaxReputation DESC NULLS LAST;	codebase_community
SELECT u.DisplayName FROM users u WHERE EXTRACT(YEAR FROM u.CreationDate) = 2014 ORDER BY u.DisplayName NULLS LAST;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u WHERE u.LastAccessDate > '2014-09-01';	codebase_community
SELECT u.DisplayName FROM users u ORDER BY u.Views DESC NULLS LAST LIMIT 1;	codebase_community
SELECT CAST(COUNT(DISTINCT CASE WHEN v.DownVotes > 1 THEN u.Id END) AS FLOAT) / NULLIF(COUNT(DISTINCT u.Id), 0) AS proportion FROM users u LEFT JOIN (SELECT UserId, SUM(UpVotes) AS UpVotes, SUM(DownVotes) AS DownVotes FROM votes GROUP BY UserId HAVING SUM(UpVotes) > 100) AS v ON u.Id = v.UserId;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u WHERE u.Views > 10 AND u.CreationDate > '2013-01-01';	codebase_community
SELECT COUNT(p.Id) AS post_count FROM posts p WHERE p.OwnerUserId = (SELECT u.Id FROM users u WHERE LOWER(u.DisplayName) = 'csgillespie');	codebase_community
SELECT p.Title FROM posts p WHERE p.OwnerUserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'csgillespie');	codebase_community
SELECT p.OwnerUserId FROM posts p WHERE p.Title = 'Eliciting priors from experts';	codebase_community
WITH PostPopularity AS (SELECT p.Id, p.Title, p.Score FROM posts p WHERE p.OwnerUserId = 1382 ORDER BY p.Score DESC LIMIT 1) SELECT pp.Title FROM PostPopularity pp;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Score = (SELECT MAX(p2.Score) FROM posts p2);	codebase_community
SELECT SUM(c.Score) AS total_score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.OwnerUserId = 13422;	codebase_community
SELECT p.score FROM posts p JOIN users u ON p.owneruserid = u.id WHERE u.displayname = 'csgillespie' ORDER BY p.score DESC NULLS LAST LIMIT 1;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) AS root_post_count FROM posts p WHERE p.OwnerUserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'csgillespie'); WHERE p.PostTypeId = 1;	codebase_community
SELECT DISTINCT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score = 1;	codebase_community
SELECT p.Id, p.Title, p.Score FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 30 AND p.Score > 19;	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE LOWER(t.TagName) = 'bayesian';	codebase_community
SELECT p.Body, t.Count FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId ORDER BY t.Count DESC NULLS LAST LIMIT 1;	codebase_community
SELECT COUNT(b.Id) AS badge_count FROM badges b WHERE b.UserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'csgillespie');	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie';	codebase_community
SELECT COUNT(*) AS total_badges_2011 FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie' AND EXTRACT(YEAR FROM b.Date) = 2011;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score) FROM posts p WHERE p.OwnerUserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'csgillespie');	codebase_community
SELECT AVG(badges.Count) FROM badges JOIN users ON badges.UserId = users.Id WHERE users.Views > 200;	codebase_community
SELECT CAST(COUNT(CASE WHEN u.Age > 30 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS fraction FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 20;	codebase_community
SELECT COUNT(*) AS number_of_votes FROM votes v WHERE v.creationdate BETWEEN '2010-07-19 00:00:00' AND '2010-07-20 00:00:00' AND v.userid = 58;	codebase_community
SELECT v.creationdate, COUNT(v.id) AS vote_count FROM votes v GROUP BY v.creationdate ORDER BY vote_count DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges b WHERE b.Name = 'Revival';	codebase_community
WITH HighestScoredComment AS (SELECT p.Title, MAX(c.Score) AS MaxScore FROM posts p JOIN comments c ON p.Id = c.PostId GROUP BY p.Title) SELECT hs.Title FROM HighestScoredComment hs ORDER BY hs.MaxScore DESC LIMIT 1;	codebase_community
WITH post_comments AS (SELECT p.Id, COUNT(c.Id) AS comment_count FROM posts p LEFT JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910 GROUP BY p.Id) SELECT pc.comment_count FROM post_comments pc;	codebase_community
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39';	codebase_community
SELECT c.Text FROM comments c WHERE c.PostId = 107829 LIMIT 1;	codebase_community
SELECT p.Title, p.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18';	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041;	codebase_community
SELECT COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'tiago pasqualini';	codebase_community
SELECT v.UserId, u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.Id = 6347;	codebase_community
SELECT COUNT(v.Id) AS vote_count FROM votes v JOIN posts p ON v.PostId = p.Id WHERE LOWER(p.Title) LIKE '%data%visualization%';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(u.DisplayName) = 'datepiccoderguywho programs';	codebase_community
SELECT CAST(COUNT(p.Id) AS FLOAT) / NULLIF(COUNT(v.Id), 0) AS ratio FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.OwnerUserId = 24;	codebase_community
SELECT p.ViewCount FROM posts p WHERE LOWER(p.Title) = 'integration of weka and/or rapidminer into informatica powercenter/developer';	codebase_community
SELECT c.Text FROM comments c WHERE c.Score = 17;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT c.UserId, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text ilike '%thank you user93!%' ORDER BY u.DisplayName NULLS LAST;	codebase_community
SELECT c.Text, c.UserId, c.UserDisplayName FROM comments c WHERE c.UserDisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.text FROM comments c WHERE c.postid IN (SELECT p.id FROM posts p WHERE p.title = 'How does gentle boosting differ from AdaBoost?');	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' ORDER BY u.DisplayName NULLS LAST LIMIT 10;	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE LOWER(p.Title) = 'open source tools for visualizing multi-dimensional data';	codebase_community
SELECT p.title FROM posts p JOIN users u ON p.owneruserid = u.id WHERE LOWER(u.displayname) ='vebjorn ljosa';	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'yevgeny';	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE LOWER(p.Title) = 'why square the difference instead of taking the absolute value in standard deviation?' AND c.UserId = p.LastEditorUserId;	codebase_community
SELECT SUM(v.BountyAmount) AS TotalBounty FROM posts p JOIN votes v ON p.Id = v.PostId WHERE LOWER(p.Title) = 'data';	codebase_community
SELECT u.DisplayName, v.BountyAmount FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.BountyAmount = 50 AND v.VoteTypeId = 8 AND v.PostId IN (SELECT p.Id FROM posts p WHERE p.Title ilike '%variance%');	codebase_community
SELECT p.title, p.score, p.view_count, c.text FROM posts p JOIN tags t ON p.id = t.excerpt_post_id JOIN comments c ON p.id = c.post_id WHERE t.tag_name = 'humor' AND c.score IS NOT NULL;	codebase_community
SELECT SUM(c.Score) AS total_score FROM comments c WHERE c.UserId = 13;	codebase_community
SELECT u.Id, u.Reputation FROM users u ORDER BY u.Reputation DESC NULLS LAST LIMIT 1;	codebase_community
SELECT u.Id FROM users u WHERE u.Views = (SELECT MIN(u2.Views) FROM users u2);	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND EXTRACT(YEAR FROM b.Date) = 2011;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Id > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name IN ('Teacher', 'Supporter') AND u.Location = 'New York';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN postHistory ph ON p.Id = ph.PostId WHERE p.ViewCount >= 1000 GROUP BY u.DisplayName HAVING COUNT(DISTINCT ph.Id) = 1;	codebase_community
SELECT u.DisplayName, b.Name FROM comments c JOIN users u ON c.UserId = u.Id JOIN badges b ON u.Id = b.UserId GROUP BY u.DisplayName, b.Name ORDER BY COUNT(c.Id) DESC;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(u.Location) = 'india' AND LOWER(b.Name) = 'teacher';	codebase_community
SELECT (CAST(COUNT(DISTINCT CASE WHEN EXTRACT(YEAR FROM b.Date) = 2011 THEN b.Id END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN EXTRACT(YEAR FROM b.Date) = 2010 THEN b.Id END), 0) - 1) * 100 AS percentage_change FROM badges b;	codebase_community
SELECT ph.PostHistoryTypeId, COUNT(DISTINCT ph.UserId) FROM postHistory ph WHERE ph.PostId = 3720 GROUP BY ph.PostHistoryTypeId;	codebase_community
SELECT p.Id, p.Title, p.Score FROM posts p WHERE p.Id IN (SELECT pl.PostId FROM postLinks pl WHERE pl.RelatedPostId = 61217) ORDER BY p.Score DESC;	codebase_community
SELECT p.Score, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Id = 395;	codebase_community
SELECT p.Id AS PostId, p.OwnerUserId AS UserId FROM posts p WHERE p.Score > 60 ORDER BY p.Id NULLS LAST;	codebase_community
SELECT SUM(p.FavoriteCount) AS total_favorite_count FROM posts p WHERE p.OwnerUserId = 686 AND EXTRACT(YEAR FROM p.CreationDate) = 2011;	codebase_community
SELECT AVG(v.UpVotes), AVG(u.Age) FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN votes v ON p.Id = v.PostId GROUP BY u.Id HAVING COUNT(p.Id) > 10;	codebase_community
SELECT COUNT(DISTINCT b.UserId) AS announcer_count FROM badges b WHERE b.Name = 'Announcer';	codebase_community
SELECT b.Name FROM badges b WHERE b.Date = '2010-07-19 19:39:08';	codebase_community
SELECT COUNT(c.Id) AS positive_comments FROM comments c WHERE c.Score > 0;	codebase_community
SELECT c.Text FROM comments c WHERE c.CreationDate = '2010-07-19 19:25:47';	codebase_community
SELECT COUNT(*) AS total_posts FROM posts p WHERE p.Score = 10;	codebase_community
SELECT b.Name, u.DisplayName, u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id ORDER BY u.Reputation DESC;	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08';	codebase_community
SELECT b.name FROM badges b JOIN users u ON b.userid = u.id WHERE u.displayname = 'Pierre';	codebase_community
SELECT u.Id, b.Date FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Rochester, NY' ORDER BY b.Date ASC;	codebase_community
SELECT CAST(COUNT(DISTINCT u.Id) AS FLOAT) / NULLIF((SELECT COUNT(DISTINCT u.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Teacher'), 0) AS proportion FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Teacher';	codebase_community
SELECT CAST(COUNT(DISTINCT CASE WHEN u.Age >= 13 AND u.Age <= 19 THEN u.Id END) AS FLOAT) / NULLIF(COUNT(DISTINCT b.UserId), 0) AS proportion FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '2010-07-19 19:19:56';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '2010-07-19 19:37:33';	codebase_community
SELECT u.age, b.name FROM users u JOIN badges b ON u.id = b.userid WHERE LOWER(u.location) = 'vienna, austria' ORDER BY u.age ASC;	codebase_community
SELECT COUNT(*) AS total_adults FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age >= 18;	codebase_community
SELECT u.Views FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08';	codebase_community
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id ORDER BY u.Reputation ASC LIMIT 1;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(u.DisplayName) ='sharpie';	codebase_community
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age >= 65;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Id = 30;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u WHERE u.Location = 'New York';	codebase_community
SELECT COUNT(*) AS total_votes FROM votes v WHERE EXTRACT(YEAR FROM v.creationdate) = 2010;	codebase_community
SELECT COUNT(*) FROM users u WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, u.CreationDate)) >= 18;	codebase_community
SELECT u.DisplayName, u.Views FROM users u ORDER BY u.Views DESC;	codebase_community
SELECT CAST(SUM(CASE WHEN EXTRACT(YEAR FROM v.CreationDate) = 2010 THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(SUM(CASE WHEN EXTRACT(YEAR FROM v.CreationDate) = 2011 THEN 1 ELSE 0 END), 0) AS ratio FROM votes v;	codebase_community
SELECT t.TagName FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE LOWER(u.DisplayName) = 'john stauffer' ORDER BY t.TagName NULLS LAST;	codebase_community
SELECT COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'daniel vassallo';	codebase_community
SELECT COUNT(v.Id) FROM votes v JOIN users u ON v.UserId = u.Id WHERE LOWER(u.DisplayName) = 'harlan';	codebase_community
SELECT p.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) ='slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT p1.id, p1.view_count, p2.id, p2.view_count FROM posts p1 JOIN posts p2 ON p1.owner_display_name = 'Harvey Motulsky' AND p2.owner_display_name = 'Noah Snyder' WHERE p1.view_count > p2.view_count;	codebase_community
SELECT p.id FROM posts p JOIN users u ON p.owneruserid = u.id JOIN votes v ON p.id = v.postid WHERE u.displayname ilike '%Matt Parker%' AND v.votetypeid = 2 GROUP BY p.id HAVING COUNT(v.id) > 4;	codebase_community
WITH NeilComments AS (SELECT c.PostId, c.UserId FROM comments c JOIN users u ON c.UserId = u.Id WHERE LOWER(u.DisplayName) = 'neil mcguigan') SELECT COUNT(c.Score) AS negative_comments FROM NeilComments nc JOIN comments c ON nc.PostId = c.PostId WHERE c.Score < 0;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id WHERE p.Id IN (SELECT c.PostId FROM comments c WHERE c.UserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'Mark Meckes')) AND p.Id NOT IN (SELECT c.PostId FROM comments c WHERE c.UserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'Mark Meckes'));	codebase_community
SELECT DISTINCT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(b.Name) = 'organizer';	codebase_community
SELECT CAST(COUNT(CASE WHEN p.Tags LIKE '%R%' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM posts p WHERE p.CommunityOwnedDate IS NOT NULL;	codebase_community
SELECT p.owner_display_name, p.view_count - lag(p.view_count) OVER (PARTITION BY p.owner_display_name ORDER BY p.creation_date) AS view_count_difference FROM posts p WHERE p.owner_display_name IN ('mornington', 'amos') ORDER BY p.owner_display_name, p.creation_date NULLS LAST;	codebase_community
SELECT COUNT(DISTINCT c.UserId) AS NumberOfUsers FROM comments c WHERE EXTRACT(YEAR FROM c.CreationDate) = 2014;	codebase_community
SELECT COUNT(*) AS total_posts FROM posts p WHERE p.CreationDate = '2010-07-21';	codebase_community
SELECT u.DisplayName, u.Age FROM users u ORDER BY u.Views DESC NULLS LAST LIMIT 1;	codebase_community
SELECT p.LastEditDate, p.LastEditorUserId FROM posts p WHERE p.Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT SUM(CASE WHEN c.Score < 0 THEN 1 ELSE 0 END) AS negative_comments FROM comments c WHERE c.UserId = 13;	codebase_community
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 0;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(u.Location) = 'north pole' AND EXTRACT(YEAR FROM b.Date) = 2011;	codebase_community
SELECT p.OwnerDisplayName, p.Tags FROM posts p WHERE p.FavoriteCount > 150;	codebase_community
SELECT ph.PostId, COUNT(ph.PostHistoryTypeId) AS post_history_count, MAX(p.LastEditDate) AS last_edit_date FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title ilike '%What is the best introductory Bayesian statistics textbook%' GROUP BY ph.PostId ORDER BY post_history_count DESC NULLS LAST, last_edit_date DESC NULLS LAST;	codebase_community
WITH user_badges AS (SELECT u.Id, u.DisplayName, u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers') SELECT ub.LastAccessDate, ub.Location FROM user_badges ub ORDER BY ub.LastAccessDate DESC NULLS LAST;	codebase_community
SELECT p.Title, pl.RelatedPostId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Id = (SELECT pl2.PostId FROM postLinks pl2 WHERE pl2.RelatedPostId = 123456);	codebase_community
SELECT p.Id, b.Name FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId WHERE p.OwnerDisplayName ilike '%Samuel%' AND EXTRACT(YEAR FROM p.CreationDate) = 2013;	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.Score = (SELECT MAX(p2.Score) FROM posts p2);	codebase_community
SELECT u.DisplayName, u.Location FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(t.TagName) = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE LOWER(p.Title) = 'what are principal component scores';	codebase_community
WITH MaxScorePost AS (SELECT p.Id, MAX(p.Score) AS MaxScore FROM posts p GROUP BY p.Id) SELECT u.DisplayName FROM MaxScorePost msp JOIN posts p ON msp.Id = p.Id JOIN users u ON p.OwnerUserId = u.Id ORDER BY msp.MaxScore DESC LIMIT 1;	codebase_community
WITH max_bounty AS (SELECT v.UserId, MAX(v.BountyAmount) AS max_bounty FROM votes v WHERE v.VoteTypeId = 8 GROUP BY v.UserId) SELECT u.DisplayName, u.WebsiteUrl FROM max_bounty mb JOIN users u ON mb.UserId = u.Id;	codebase_community
SELECT p.Title, p.ViewCount FROM posts p ORDER BY p.ViewCount DESC NULLS LAST LIMIT 5;	codebase_community
SELECT COUNT(DISTINCT t.Id) FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id WHERE p.ViewCount BETWEEN 5000 AND 7000;	codebase_community
WITH ValuablePost AS (SELECT p.Id, p.OwnerUserId, p.Score FROM posts p WHERE p.Score = (SELECT MAX(p2.Score) FROM posts p2)) SELECT v.OwnerUserId FROM ValuablePost v;	codebase_community
WITH user_reputation AS (SELECT u.Id, MAX(v.VoteTypeId) AS max_vote_type FROM users u JOIN votes v ON u.Id = v.UserId GROUP BY u.Id) SELECT u.DisplayName, u.Age FROM user_reputation ur JOIN users u ON ur.Id = u.Id ORDER BY ur.max_vote_type DESC NULLS LAST LIMIT 1;	codebase_community
SELECT COUNT(*) AS posts_with_votes_and_bounty FROM votes v JOIN posts p ON v.PostId = p.Id WHERE EXTRACT(YEAR FROM p.CreationDate) = 2011 AND v.BountyAmount = 50;	codebase_community
SELECT u.Id FROM users u ORDER BY u.LastAccessDate DESC NULLS LAST LIMIT 1;	codebase_community
SELECT p.Score FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId ORDER BY t.Count DESC NULLS LAST LIMIT 1;	codebase_community
SELECT date_trunc('month', p.CreationDate) AS MONTH, COUNT(*) AS link_count FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.PostTypeId = 1 AND p.AcceptedAnswerId IS NOT NULL AND date_part('year', p.CreationDate) = 2010 AND p.AcceptedAnswerCount <= 2 GROUP BY MONTH;	codebase_community
WITH PostVoteCount AS (SELECT p.Id, COUNT(v.Id) AS VoteCount FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.OwnerUserId = 1465 GROUP BY p.Id) SELECT pvc.Id FROM PostVoteCount pvc ORDER BY pvc.VoteCount DESC LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(pl2.CreationDate) FROM postLinks pl2);	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT MIN(v.CreationDate) FROM votes v WHERE v.UserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'chl');	codebase_community
SELECT MIN(p.CreationDate) AS FirstPostDate FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age = (SELECT MIN(u2.Age) FROM users u2);	codebase_community
WITH badge_user AS (SELECT u.DisplayName, b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY u.DisplayName ASC) SELECT DISTINCT display_name FROM badge_user;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE LOWER(u.Location) = 'united kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(p.ViewCount) AS average_view_count FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.CreationDate = (SELECT MIN(u2.CreationDate) FROM users u2);	codebase_community
SELECT u.DisplayName, MAX(u.Reputation) AS max_reputation FROM users u GROUP BY u.DisplayName ORDER BY max_reputation DESC NULLS LAST LIMIT 1;	codebase_community
SELECT u.DisplayName, u.Views FROM users u WHERE u.Reputation > 2000 AND u.Views > 1000;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Age >= 18;	codebase_community
SELECT COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND EXTRACT(YEAR FROM p.CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'harvey motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p WHERE p.Score = (SELECT MAX(p2.Score) FROM posts p2);	codebase_community
SELECT AVG(p.Score) AS average_score FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) ='stephen turner';	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND EXTRACT(YEAR FROM p.CreationDate) = 2011;	codebase_community
SELECT p.id, u.displayname FROM posts p JOIN users u ON p.owneruserid = u.id WHERE p.creaiondate BETWEEN '2010-01-01' AND '2010-12-31' ORDER BY p.score DESC LIMIT 1;	codebase_community
SELECT CAST(COUNT(DISTINCT CASE WHEN p.OwnerUserId IN (SELECT u.Id FROM users u WHERE u.Reputation > 1000 AND EXTRACT(YEAR FROM u.CreationDate) = 2011) THEN p.Id END) AS FLOAT) / NULLIF(COUNT(DISTINCT p.Id), 0) AS proportion FROM posts p;	codebase_community
SELECT CAST(COUNT(DISTINCT CASE WHEN u.Age BETWEEN 13 AND 19 THEN u.Id END) AS FLOAT) / NULLIF(COUNT(DISTINCT u.Id), 0) AS proportion_of_teenagers FROM users u;	codebase_community
SELECT SUM(p.ViewCount) AS total_views, u.DisplayName AS last_editor FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(p.Title) = 'computer game datasets' ORDER BY p.CreationDate DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p WHERE p.ViewCount > (SELECT AVG(p2.ViewCount) FROM posts p2);	codebase_community
SELECT COUNT(c.Id) AS comment_count FROM comments c WHERE c.PostId = (SELECT p.Id FROM posts p ORDER BY p.Score DESC LIMIT 1);	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.viewcount > 35000 AND p.commentcount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Id = 183;	codebase_community
SELECT b.Name, b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(u.DisplayName) = 'emmett' ORDER BY b.Date DESC NULLS LAST LIMIT 1;	codebase_community
SELECT COUNT(*) FROM (SELECT u.Id FROM users u JOIN votes v ON u.Id = v.UserId WHERE u.Age >= 18 AND v.UpVotes > 5000) AS subquery;	codebase_community
SELECT EXTRACT(epoch FROM (MAX(u.LastAccessDate) - MIN(u.CreationDate))) AS time_taken FROM users u JOIN badges b ON u.Id = b.UserId WHERE LOWER(u.DisplayName) = 'zolomon';	codebase_community
WITH LatestUser AS (SELECT u.Id FROM users u ORDER BY u.CreationDate DESC LIMIT 1) SELECT COUNT(p.Id) AS posts, COUNT(c.Id) AS comments FROM LatestUser lu JOIN posts p ON lu.Id = p.OwnerUserId JOIN comments c ON lu.Id = c.UserId;	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.PostId IN (SELECT p.Id FROM posts p WHERE LOWER(p.Title) = 'analysing wind data with r') ORDER BY c.CreationDate DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE LOWER(b.Name) = 'citizen patrol';	codebase_community
SELECT COUNT(*) AS number_of_posts FROM posts p JOIN postHistory ph ON p.id = ph.postId JOIN tags t ON p.id = t.excerptPostId WHERE LOWER(t.tagName) = 'careers';	codebase_community
SELECT u.Reputation, u.Views FROM users u WHERE u.DisplayName = 'Jarrod Dixon';	codebase_community
SELECT COUNT(*) AS total_comments, SUM(CASE WHEN p.PostTypeId = 2 THEN 1 ELSE 0 END) AS total_answers FROM comments c JOIN posts p ON c.PostId = p.Id WHERE LOWER(p.Title) = 'clustering 1d data';	codebase_community
SELECT u.CreationDate FROM users u WHERE LOWER(u.DisplayName) = 'irishstat';	codebase_community
SELECT COUNT(p.Id) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.BountyAmount > 30;	codebase_community
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM posts p WHERE p.OwnerUserId = (SELECT u.Id FROM users u ORDER BY u.Reputation DESC LIMIT 1);	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.Score < 20;	codebase_community
SELECT t.Id, COUNT(p.Id) AS post_count FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id WHERE t.Id < 15 GROUP BY t.Id HAVING COUNT(p.Id) <= 20 ORDER BY post_count DESC NULLS LAST;	codebase_community
SELECT t.ExcerptPostId, t.WikiPostId FROM tags t WHERE t.TagName ='sample';	codebase_community
SELECT u.Reputation, SUM(v.UpVotes) AS total_up_votes FROM users u JOIN votes v ON u.Id = v.UserId WHERE LOWER(v.UserId) = (SELECT c.UserId FROM comments c WHERE c.Text ilike '%fine%you%win:%');	codebase_community
SELECT c.text FROM comments c JOIN posts p ON c.postid = p.id WHERE LOWER(p.title) LIKE '%linear%regression%';	codebase_community
SELECT c.Text, c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT c.creationDate, u.age FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.websiteUrl IS NOT NULL ORDER BY c.creationDate DESC NULLS LAST;	codebase_community
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) AS number_of_comments_with_zero_score FROM comments c WHERE c.score = 0 AND c.post_id IN (SELECT p.id FROM posts p WHERE p.comment_count = 1);	codebase_community
SELECT COUNT(DISTINCT c.UserId) AS total_users FROM comments c WHERE c.Score = 0;	codebase_community
SELECT p.Id, COUNT(c.Id) AS comment_count FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item' GROUP BY p.Id;	codebase_community
SELECT u.UpVotes FROM comments c JOIN users u ON c.UserId = u.Id WHERE LOWER(c.Text) = 'r is also lazy evaluated';	codebase_community
SELECT c.Text, c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE LOWER(u.DisplayName) = 'harvey motulsky' ORDER BY c.CreationDate DESC;	codebase_community
SELECT DISTINCT c.UserDisplayName FROM comments c WHERE c.Score BETWEEN 1 AND 5 AND c.UserId IN (SELECT v.UserId FROM votes v WHERE v.DownVotes = 0);	codebase_community
SELECT CAST(COUNT(DISTINCT CASE WHEN u.UpVotes = 0 THEN c.UserId END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.UserId), 0) AS fraction FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT s.superhero_name, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT h.id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id JOIN superhero h ON hp.hero_id = h.id WHERE sp.power_name ilike '%Super Strength%';	superhero
SELECT COUNT(*) FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id WHERE s.height_cm > 200 AND hp.power_id IN (SELECT id FROM superpower WHERE power_name = 'Super Strength');	superhero
SELECT s.full_name, COUNT(hp.power_id) AS power_count FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15 ORDER BY power_count DESC NULLS LAST;	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE LOWER(c.colour) = 'blue';	superhero
SELECT s.skin_colour_id FROM superhero s WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.eye_colour_id IN (SELECT id FROM colour WHERE colour = 'blue') AND sp.power_name = 'Agility';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN colour h ON s.hair_colour_id = h.id WHERE c.colour = 'blue' AND h.colour = 'blond';	superhero
SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT s.full_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC LIMIT 1;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name ilike '%Sauron%';	superhero
SELECT COUNT(*) AS number_of_superheroes FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'blue' AND s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name ilike '%Marvel%Comics%');	superhero
SELECT AVG(s.height_cm) AS average_height FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT CAST(COUNT(DISTINCT CASE WHEN sp.power_name = 'Super Strength' THEN h.id END) AS FLOAT) / NULLIF(COUNT(DISTINCT h.id), 0) AS proportion FROM hero_power hp JOIN superhero h ON hp.hero_id = h.id JOIN superpower sp ON hp.power_id = sp.id WHERE h.publisher_id IN (SELECT id FROM publisher WHERE publisher_name LIKE '%Marvel%');	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics';	superhero
WITH slowest_superhero AS (SELECT s.publisher_id, AVG(s.height_cm) AS avg_height FROM superhero s GROUP BY s.publisher_id ORDER BY avg_height ASC LIMIT 1) SELECT p.publisher_name FROM slowest_superhero ss JOIN publisher p ON ss.publisher_id = p.id;	superhero
SELECT COUNT(*) AS number_of_superheroes FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour ilike '%gold%';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE LOWER(c.colour) = 'blonde';	superhero
WITH AverageHeroAttributes AS (SELECT s.id AS hero_id, AVG(ha.attribute_value) AS avg_attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id GROUP BY s.id) SELECT s.superhero_name, ah.avg_attribute_value FROM AverageHeroAttributes ah JOIN superhero s ON ah.hero_id = s.id ORDER BY ah.avg_attribute_value DESC NULLS LAST LIMIT 1;	superhero
SELECT s.race_id, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'Copycat';	superhero
SELECT COUNT(*) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name ilike '%death touch%';	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name ='strength' AND ha.attribute_value = 100 AND s.gender_id IN (SELECT id FROM gender WHERE gender = 'female');	superhero
WITH powers AS (SELECT s.id AS hero_id, COUNT(hp.power_id) AS power_count FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.id) SELECT s.superhero_name, pr.power_count FROM powers pr JOIN superhero s ON pr.hero_id = s.id ORDER BY pr.power_count DESC NULLS LAST LIMIT 1;	superhero
SELECT COUNT(DISTINCT s.id) AS number_of_vampire_superheroes FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Vampire');	superhero
SELECT CAST(COUNT(DISTINCT CASE WHEN s.alignment_id = 1 THEN s.id END) AS FLOAT) / NULLIF(COUNT(DISTINCT s.id), 0) AS proportion_self_interest FROM superhero s WHERE s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND s.alignment_id IN (1, 2);	superhero
SELECT p.publisher_name, COUNT(s.id) AS number_of_superheroes FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name IN ('DC Comics', 'Marvel Comics') GROUP BY p.publisher_name ORDER BY number_of_superheroes DESC NULLS LAST;	superhero
SELECT p.id FROM publisher p WHERE p.publisher_name = 'Star Trek';	superhero
SELECT AVG(ha.attribute_value) AS average_attribute_value FROM hero_attribute ha;	superhero
SELECT COUNT(*) AS total_superheroes_without_full_name FROM superhero WHERE full_name IS NULL;	superhero
SELECT s.eye_colour_id FROM superhero s WHERE s.id = 75;	superhero
SELECT s.superhero_name, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Deathlok';	superhero
SELECT AVG(s.weight_kg) FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Female';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.gender_id IN (SELECT id FROM gender WHERE gender = 'Male') ORDER BY sp.power_name ASC LIMIT 5;	superhero
SELECT s.superhero_name FROM superhero s WHERE s.race_id IN (SELECT id FROM race WHERE race LIKE '%Alien%');	superhero
SELECT s.superhero_name FROM superhero s WHERE s.height_cm BETWEEN 170 AND 190 AND s.eye_colour_id IS NULL ORDER BY s.superhero_name NULLS LAST;	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 56;	superhero
SELECT s.full_name FROM superhero s WHERE s.race_id IN (SELECT id FROM race WHERE race LIKE '%Demi-God%') LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero s WHERE s.alignment_id IN (SELECT id FROM alignment WHERE alignment = 'bad');	superhero
SELECT s.race_id FROM superhero s WHERE s.weight_kg = 169;	superhero
SELECT s.hair_colour_id FROM superhero s WHERE s.height_cm = 185;	superhero
SELECT s.eye_colour_id FROM superhero s WHERE s.weight_kg = (SELECT MAX(s2.weight_kg) FROM superhero s2);	superhero
SELECT CAST(COUNT(DISTINCT CASE WHEN p.publisher_name = 'Marvel Comics' THEN s.id END) AS FLOAT) / NULLIF(COUNT(DISTINCT s.id), 0) AS proportion FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.height_cm BETWEEN 150 AND 180;	superhero
SELECT s.full_name FROM superhero s WHERE s.gender_id IN (SELECT id FROM gender WHERE gender ='male') AND s.weight_kg > (SELECT AVG(s.weight_kg) * 0.79 FROM superhero s);	superhero
WITH PowerCounts AS (SELECT sp.power_id, COUNT(*) AS power_count FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id GROUP BY sp.power_id) SELECT sp.power_name, pc.power_count FROM PowerCounts pc JOIN superpower sp ON pc.power_id = sp.id ORDER BY pc.power_count DESC NULLS LAST LIMIT 1;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name ilike '%Abomination%';	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(DISTINCT h.id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id JOIN superhero h ON hp.hero_id = h.id WHERE sp.power_name ='stealth';	superhero
SELECT s.full_name, MAX(ha.attribute_value) AS max_strength FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name ='strength') GROUP BY s.full_name ORDER BY max_strength DESC NULLS LAST LIMIT 1;	superhero
SELECT AVG(s.weight_kg) AS average_weight FROM superhero s WHERE s.skin_colour_id IS NULL;	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE LOWER(p.publisher_name) = 'dark horse comics';	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics' ORDER BY s.superhero_name ASC;	superhero
SELECT s.eye_colour_id, c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'flight' ORDER BY s.superhero_name NULLS LAST;	superhero
SELECT s.eye_colour_id, s.hair_colour_id, s.skin_colour_id FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics' AND s.gender_id = (SELECT id FROM gender WHERE gender = 'Female') ORDER BY s.eye_colour_id, s.hair_colour_id, s.skin_colour_id NULLS LAST;	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN colour h ON s.hair_colour_id = h.id JOIN colour sk ON s.skin_colour_id = sk.id JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT s.publisher_id, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'A-Bomb';	superhero
SELECT CAST(COUNT(DISTINCT CASE WHEN s.gender_id = g.id AND c.id = s.eye_colour_id THEN s.id END) AS FLOAT) / NULLIF(COUNT(DISTINCT s.id), 0) AS proportion FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.eye_colour_id = c.id WHERE g.gender = 'female' AND c.colour = 'blue';	superhero
SELECT s.superhero_name, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.full_name ilike '%Charles%Chandler%';	superhero
SELECT s.gender_id, g.gender FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE s.superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power h ON s.id = h.hero_id JOIN superpower sp ON h.power_id = sp.id WHERE sp.power_name ilike '%adaptation%' ORDER BY s.superhero_name NULLS LAST;	superhero
SELECT COUNT(hp.power_id) AS number_of_powers FROM hero_power hp JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = 'Amazo';	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id IN (SELECT s.id FROM superhero s WHERE s.superhero_name ilike '%Hunter%Zolomon%');	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE LOWER(c.colour) = 'amber' ORDER BY s.height_cm ASC NULLS LAST;	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id AND s.hair_colour_id = c.id WHERE c.colour = 'black';	superhero
SELECT s.eye_colour_id, c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.skin_colour_id IN (SELECT id FROM colour WHERE colour = 'gold');	superhero
SELECT s.full_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment ilike '%vampire%';	superhero
SELECT s.superhero_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'neutral';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name ='strength') GROUP BY s.superhero_name ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT s.race_id, a.alignment FROM superhero s JOIN race r ON s.race_id = r.id JOIN alignment a ON s.alignment_id = a.id WHERE s.full_name ilike '%Cameron%Hicks%' ORDER BY s.race_id, a.id NULLS LAST;	superhero
SELECT CAST(COUNT(DISTINCT s.id) AS FLOAT) / NULLIF((SELECT COUNT(DISTINCT s2.id) FROM superhero s2 WHERE s2.gender_id IN (SELECT id FROM gender WHERE gender.gender = 'female')), 0) * 100 AS percentage FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'female' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(s.weight_kg) AS average_weight FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Alien';	superhero
SELECT (SELECT s.weight_kg FROM superhero s WHERE s.full_name = 'Emil Blonsky') - (SELECT s.weight_kg FROM superhero s WHERE s.full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT s.superhero_name, AVG(s.height_cm) AS average_height FROM superhero s GROUP BY s.superhero_name ORDER BY s.superhero_name NULLS LAST;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT s.superhero_name, COUNT(*) AS male_count FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE g.gender ='male' AND s.race_id IN (SELECT id FROM race WHERE race = 'god/eternal') GROUP BY s.superhero_name;	superhero
WITH hero_speed AS (SELECT s.id AS hero_id, MAX(s.height_cm) AS height FROM superhero s GROUP BY s.id) SELECT s.superhero_name, hs.height FROM hero_speed hs JOIN superhero s ON hs.hero_id = s.id ORDER BY hs.height DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero s WHERE s.alignment_id IN (SELECT id FROM alignment WHERE alignment = 'neutral');	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN colour h ON s.hair_colour_id = h.id WHERE c.colour = 'blue' AND h.colour = 'brown';	superhero
SELECT s.publisher_id, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero s WHERE s.publisher_id IS NULL;	superhero
SELECT CAST(COUNT(DISTINCT s.eye_colour_id) AS FLOAT) / NULLIF((SELECT COUNT(*) FROM superhero), 0) AS proportion_of_superheroes_with_blue_eyes FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'blue';	superhero
SELECT CAST(COUNT(DISTINCT CASE WHEN s.gender_id = 1 THEN s.id END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN s.gender_id = 2 THEN s.id END), 0) AS ratio FROM superhero s;	superhero
SELECT s.full_name, s.height_cm FROM superhero s ORDER BY s.height_cm DESC LIMIT 1;	superhero
SELECT sp.id FROM superpower sp WHERE sp.power_name = 'cryokinesis';	superhero
SELECT s.superhero_name FROM superhero s WHERE s.id = 294;	superhero
SELECT s.full_name FROM superhero s WHERE s.weight_kg IS NULL;	superhero
SELECT s.eye_colour_id FROM superhero s WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name ilike '%Helen Parr%';	superhero
SELECT s.race_id, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.weight_kg = 108 AND s.height_cm = 188;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.id = 38;	superhero
SELECT r.race FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN race r ON s.race_id = r.id WHERE ha.attribute_value = (SELECT MAX(ha.attribute_value) FROM hero_attribute ha);	superhero
SELECT s.alignment, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT s.full_name, s.eye_colour_id FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'blue' LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) AS average_attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'neutral';	superhero
SELECT s.skin_colour_id, c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'attribute_100');	superhero
SELECT COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'female' AND s.alignment_id IN (SELECT id FROM alignment WHERE alignment = 'good');	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80;	superhero
SELECT r.race FROM superhero s JOIN colour c ON s.hair_colour_id = c.id JOIN race r ON s.race_id = r.id WHERE c.colour = 'blue' AND s.gender_id IN (SELECT id FROM gender WHERE gender ='male');	superhero
SELECT CAST(COUNT(DISTINCT s.gender_id) AS FLOAT) / NULLIF(COUNT(DISTINCT s.alignment_id), 0) AS proportion FROM superhero s WHERE s.alignment_id IN (SELECT id FROM alignment WHERE alignment = 'bad') AND s.gender_id IN (SELECT id FROM gender WHERE gender = 'female');	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE eye_colour_id IS NOT NULL) - (SELECT COUNT(*) FROM superhero WHERE eye_colour_id IS NULL) AS difference;	superhero
SELECT s.superhero_name, SUM(h.attribute_value) AS total_strength FROM hero_attribute h JOIN superhero s ON h.hero_id = s.id WHERE h.attribute_id IN (SELECT id FROM attribute WHERE attribute_name ='strength') GROUP BY s.superhero_name;	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id IN (SELECT id FROM superhero WHERE full_name = 'Ajax');	superhero
SELECT COUNT(*) AS number_of_heroes FROM superhero WHERE skin_colour_id IN (SELECT id FROM colour WHERE colour = 'green') AND alignment_id IN (SELECT id FROM alignment WHERE alignment = 'villain');	superhero
SELECT COUNT(*) AS number_of_female_superheroes FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Female' AND s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name ilike '%wind%' ORDER BY s.superhero_name ASC;	superhero
SELECT s.gender_id, g.gender FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE sp.power_name ilike '%Phoenix%Force%';	superhero
SELECT s.superhero_name, MAX(s.weight_kg) AS max_weight FROM superhero s WHERE s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name ilike '%DC%Comics%') GROUP BY s.superhero_name ORDER BY max_weight DESC LIMIT 1;	superhero
SELECT AVG(s.height_cm) AS average_height FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics' AND s.full_name not ilike '%human%';	superhero
SELECT s.superhero_name, s.height_cm FROM superhero s WHERE s.height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT p.publisher_name, COUNT(s.id) AS number_of_superheroes FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name IN ('DC Comics', 'Marvel Comics') GROUP BY p.publisher_name ORDER BY number_of_superheroes DESC NULLS LAST;	superhero
SELECT a.attribute_name, MIN(h.attribute_value) AS min_attribute_value FROM hero_attribute h JOIN attribute a ON h.attribute_id = a.id JOIN superhero s ON h.hero_id = s.id WHERE s.superhero_name = 'Black Panther' GROUP BY a.attribute_name ORDER BY min_attribute_value ASC NULLS LAST LIMIT 1;	superhero
SELECT s.eye_colour_id FROM superhero s WHERE s.superhero_name = 'Abomination';	superhero
SELECT s.superhero_name, s.height_cm FROM superhero s WHERE s.height_cm = (SELECT MAX(s2.height_cm) FROM superhero s2);	superhero
SELECT s.superhero_name FROM superhero s WHERE s.full_name ilike '%Charles Chandler%';	superhero
SELECT CAST(COUNT(DISTINCT CASE WHEN s.gender_id = 2 THEN s.id END) AS FLOAT) / NULLIF(COUNT(DISTINCT s.id), 0) AS proportion_female FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'George Lucas';	superhero
SELECT CAST(COUNT(DISTINCT s.alignment_id) filter (WHERE s.alignment = 'good') AS FLOAT) / NULLIF(COUNT(DISTINCT s.alignment_id), 0) AS proportion_good FROM superhero s WHERE s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name ilike '%Marvel%Comics%');	superhero
SELECT COUNT(*) FROM superhero s WHERE s.full_name ilike 'John %';	superhero
SELECT s.id FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT s.full_name FROM superhero s WHERE s.superhero_name = 'Alien';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'brown' AND s.weight_kg < 100;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name ilike '%Aquababy%';	superhero
SELECT s.weight_kg, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.id = 40;	superhero
SELECT AVG(s.height_cm) AS average_height FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral';	superhero
SELECT s.id FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence';	superhero
SELECT s.eye_colour_id, c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(s2.height_cm) FROM superhero s2) * 0.8;	superhero
SELECT d.driverRef FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId = 18 AND r.position > 10;	formula_1
SELECT d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE r.raceId = 19 AND s.status = 'Finished' ORDER BY r.laps DESC LIMIT 1;	formula_1
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Shanghai';	formula_1
SELECT c.name AS circuit_name, r.date AS race_date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT c.name, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.location ilike '%Germany%';	formula_1
SELECT r.position FROM results r JOIN constructors c ON r.constructorId = c.constructorId WHERE c.name = 'Renault' ORDER BY r.position ASC NULLS LAST;	formula_1
SELECT COUNT(DISTINCT r.raceId) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country NOT IN ('Asia', 'Europe') AND r.year = 2010;	formula_1
SELECT r.name, c.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.location) = 'Spain' ORDER BY r.name NULLS LAST;	formula_1
SELECT c.lat, c.lng FROM circuits c WHERE c.name LIKE '%Australian Grand Prix%';	formula_1
SELECT r.name, r.date, r.time, r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name ilike '%Sepang International Circuit%';	formula_1
SELECT r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT c.lat AS latitude, c.lng AS longitude FROM circuits c WHERE c.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.country, r.name, r.date, r.year FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE cr.points = 1 AND r.round = 24;	formula_1
SELECT q1 FROM qualifying q WHERE q.driverId = (SELECT d.driverId FROM drivers d WHERE d.forename = 'Bruno' AND d.surname = 'Senna') AND q.raceId = 354;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '00:01:40' AND q.raceId = 355;	formula_1
SELECT d.number FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q3 = '0:01:54' AND q.raceId = 903;	formula_1
SELECT COUNT(DISTINCT r.resultId) FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.position IS NULL AND r.raceId = (SELECT r2.raceId FROM races r2 WHERE LOWER(r2.name) = 'bahrain grand prix' AND EXTRACT(YEAR FROM r2.date) = 2007);	formula_1
SELECT r.year, r.name AS race_name FROM races r WHERE r.round = 901;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM races r WHERE r.date = '2015-11-29';	formula_1
SELECT d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 ORDER BY d.dob ASC NULLS LAST LIMIT 1;	formula_1
SELECT d.url, d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.time = '00:01:27' AND r.raceId = 161;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE r.raceId = 933 AND s.status = 'FASTEST LAP' ORDER BY d.nationality NULLS LAST LIMIT 1;	formula_1
SELECT c.name, c.lat, c.lng FROM circuits c WHERE c.name ilike '%Malaysian Grand Prix%';	formula_1
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.raceId = 9 ORDER BY cs.points DESC LIMIT 1;	formula_1
SELECT q1 FROM qualifying q WHERE q.driverId IN (SELECT d.driverId FROM drivers d WHERE d.forename = 'Lucas' AND d.surname = 'di Grassi') AND q.raceId = 345;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN qualifying q ON d.driverId = q.driverId WHERE r.raceId = 347 AND q.q2 = '01:15';	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 45 AND q.q3 = '0:01:33';	formula_1
SELECT r.name, to_char(r.date, 'DD-Mon-YYYY') AS race_date, d.surname, d.forename, to_char(r.time, 'HH24:MI') AS race_time FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.driverRef = 'MclarenB' AND res.position = 1 AND res.raceId = 743;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'San Marino Grand Prix' AND r.position = 2 AND EXTRACT(YEAR FROM ra.date) = 2006;	formula_1
SELECT r.year, r.name AS race_name, r.date, r.time, r.url FROM races r WHERE r.year IN (SELECT r2.year FROM races r2 WHERE r2.raceId = 901) ORDER BY r.year;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM races r WHERE r.date = '2015-11-29';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN lapTimes lt ON r.resultId = lt.raceId WHERE r.raceId = 348 ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE r.fastestLapSpeed = (SELECT MAX(r2.fastestLapSpeed) FROM results r2);	formula_1
SELECT (r1.fastestLapSpeed - r2.fastestLapSpeed) / NULLIF(r2.fastestLapSpeed, 0) * 100 AS percentage_change FROM results r1 JOIN results r2 ON r1.raceId = r2.raceId + 1 WHERE r1.driverId = 21 AND r1.raceId = 853;	formula_1
SELECT d.forename, d.surname, COUNT(r.raceId) AS race_count, COUNT(DISTINCT r.raceId) AS unique_races, CAST(COUNT(DISTINCT r.raceId) AS FLOAT) / NULLIF(COUNT(r.raceId), 0) AS race_completion_rate FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId IN (SELECT r.raceId FROM races r WHERE r.date = '1983-07-16') GROUP BY d.forename, d.surname ORDER BY race_completion_rate DESC NULLS LAST;	formula_1
SELECT MIN(r.year) AS first_year FROM races r WHERE r.name LIKE '%Singapore Grand Prix%';	formula_1
SELECT COUNT(r.raceId) AS race_count, r.name, r.date FROM races r WHERE r.year = 2005 ORDER BY r.date DESC;	formula_1
WITH race_date AS (SELECT MIN(r.date) AS first_race FROM races r) SELECT r.name, r.date, r.year, r.month FROM race_date rd JOIN races r ON rd.first_race = r.date WHERE EXTRACT(YEAR FROM r.date) = EXTRACT(YEAR FROM rd.first_race) AND EXTRACT(MONTH FROM r.date) = EXTRACT(MONTH FROM rd.first_race) ORDER BY r.date NULLS LAST;	formula_1
SELECT r.name, r.date FROM races r WHERE r.year = 1999 ORDER BY r.date DESC LIMIT 1;	formula_1
SELECT r.year, COUNT(r.raceId) AS num_races FROM races r GROUP BY r.year ORDER BY num_races DESC LIMIT 1;	formula_1
SELECT r.name FROM races r JOIN seasons s ON r.year = s.year WHERE s.year = 2017 AND r.year!= 2000;	formula_1
SELECT c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = 1950 AND LOWER(c.country) = 'europe' ORDER BY c.name ASC NULLS LAST;	formula_1
SELECT s.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Brands Hatch' ORDER BY s.year DESC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT r.year) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone';	formula_1
SELECT d.forename, d.surname, d.position FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId WHERE ds.raceId IN (SELECT raceId FROM races WHERE name LIKE '%Singapore Grand Prix%') AND EXTRACT(YEAR FROM date) = 2010 ORDER BY ds.position ASC;	formula_1
WITH total_points AS (SELECT d.driverId, d.forename, d.surname, SUM(r.points) AS total_points FROM drivers d JOIN results r ON d.driverId = r.driverId GROUP BY d.driverId, d.forename, d.surname) SELECT tp.forename, tp.surname, tp.total_points FROM total_points tp ORDER BY tp.total_points DESC NULLS LAST LIMIT 1;	formula_1
SELECT d.forename, d.surname, SUM(r.points) AS total_points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.year = 2017 AND r2.circuitId = 16) GROUP BY d.forename, d.surname ORDER BY total_points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name AS race_name, lt.time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN lapTimes lt ON d.driverId = lt.driverId AND r.raceId = lt.raceId ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT AVG(l.time) AS average_lap_time FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId WHERE d.forename = 'Sebastian' AND d.surname = 'Vettel' AND l.raceId IN (SELECT r.raceId FROM races r WHERE r.year = 2009 AND r.name = 'Chinese Grand Prix');	formula_1
SELECT CAST(COUNT(DISTINCT CASE WHEN r.position = 1 THEN NULL END) AS FLOAT) / NULLIF(COUNT(DISTINCT r.resultId), 0) AS proportion FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.date > '2010-01-01');	formula_1
SELECT d.forename, d.surname, d.nationality, AVG(r.points) AS average_points FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.points > 0 GROUP BY d.forename, d.surname, d.nationality ORDER BY average_points DESC LIMIT 1;	formula_1
SELECT MIN(d.dob) AS youngest_dob, d.forename, d.surname FROM drivers d WHERE d.nationality = 'Japanese' GROUP BY d.dob, d.forename, d.surname ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.name, c.location HAVING COUNT(r.raceId) >= 4;	formula_1
SELECT c.name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name AS race_name, c.name AS circuit_name, c.location AS circuit_location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE EXTRACT(MONTH FROM r.date) = 9 AND EXTRACT(YEAR FROM r.date) = 2005;	formula_1
SELECT r.name, d.forename, d.surname FROM results AS r JOIN drivers AS d ON r.driverId = d.driverId WHERE r.grid < 10 AND d.surname = 'Yoong';	formula_1
SELECT COUNT(r.resultId) AS wins FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND ra.circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit');	formula_1
SELECT r.name AS race, s.year FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Schumacher' AND r.fastestLapTime = (SELECT MIN(r2.fastestLapTime) FROM results r2 WHERE r2.driverId = d.driverId);	formula_1
SELECT AVG(r.points) AS average_points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Irvine' AND r.year = 2000;	formula_1
SELECT r.name, r.date, r.time, r.url, d.surname, d.forename, d.nationality, d.url, r.circuitId, r.country, r.lat, r.lng, r.alt, r.url, c.name AS constructor, r.year, r.round, r.position, r.points FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN constructors c ON r.constructorId = c.constructorId WHERE d.surname = 'Hamilton' AND d.forename = 'Lewis' ORDER BY r.year ASC, r.round ASC NULLS LAST;	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date ASC;	formula_1
SELECT r.name, s.year, c.location FROM races r JOIN seasons s ON r.year = s.year JOIN circuits c ON r.circuitId = c.circuitId ORDER BY r.laps DESC LIMIT 1;	formula_1
SELECT CAST(COUNT(CASE WHEN c.name = 'Germany' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.country) = 'europe';	formula_1
SELECT c.lat, c.lng FROM circuits c WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT c.name, MAX(c.lat) AS max_lat FROM circuits c WHERE c.name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') GROUP BY c.name;	formula_1
SELECT c.name FROM circuits c WHERE c.circuitRef ='marina_bay_street_circuit';	formula_1
SELECT c.location FROM circuits c WHERE c.alt = (SELECT MAX(c2.alt) FROM circuits c2);	formula_1
SELECT COUNT(*) FROM drivers d WHERE d.code IS NULL;	formula_1
SELECT c.country, MIN(d.dob) AS min_dob FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN drivers d ON r.year = d.nationality WHERE d.dob IS NOT NULL GROUP BY c.country ORDER BY min_dob ASC NULLS LAST;	formula_1
SELECT d.surname FROM drivers d WHERE d.nationality = 'Italian';	formula_1
SELECT d.url FROM drivers d WHERE d.forename = 'Anthony' AND d.surname = 'Davidson';	formula_1
SELECT d.driverRef FROM drivers d WHERE LOWER(d.forename) = 'lewis' AND LOWER(d.surname) = 'hamilton';	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = 2009 AND r.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.name) ='silverstone';	formula_1
SELECT c.name, r.name, r.date, r.time, r.url FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.name = 'Silverstone';	formula_1
SELECT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND c.name = 'Abu Dhabi Circuit';	formula_1
SELECT COUNT(*) AS number_of_races FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.location) = 'italy';	formula_1
SELECT DISTINCT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name ilike '%Barcelona-Catalunya%';	formula_1
SELECT c.url FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE LOWER(r.name) ='spanish grand prix' AND r.year = 2009;	formula_1
SELECT r.name AS race_name, MIN(l.time) AS fastest_lap_time FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId JOIN lapTimes l ON r.raceId = l.raceId AND res.driverId = l.driverId WHERE d.forename ilike '%Lewis%' AND d.surname ilike '%Hamilton%' GROUP BY r.name;	formula_1
SELECT d.forename, d.surname, r.name AS race_name, MAX(l.time) AS fastest_lap_time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN laps l ON r.resultId = l.resultId GROUP BY d.forename, d.surname, r.name ORDER BY fastest_lap_time DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.name ilike '%Australian Grand Prix%' AND r2.year = 2008) AND r.position = 1;	formula_1
SELECT r.name, r.date FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename ilike '%Lewis%' AND d.surname ilike '%Hamilton%';	formula_1
SELECT r.name, r.date, d.surname, d.forename, d.positionText FROM results AS r JOIN drivers AS d ON r.driverId = d.driverId WHERE d.surname ilike '%Hamilton%' ORDER BY d.position ASC NULLS LAST LIMIT 1;	formula_1
SELECT MAX(r.time) FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races r2 ON r.raceId = r2.raceId WHERE r2.year = 2009 AND r2.circuitId IN (SELECT c.circuitId FROM circuits c WHERE c.country = 'Spain');	formula_1
SELECT DISTINCT r.year FROM races r JOIN drivers d ON r.raceId = d.driverId WHERE d.driverRef = 'LewisHamilton';	formula_1
SELECT r.position FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.raceId = (SELECT r2.raceId FROM races r2 WHERE r2.name = 'Australian Grand Prix' AND r2.year = 2008);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = (SELECT r2.raceId FROM races r2 WHERE r2.year = 2008 AND r2.circuitId = (SELECT c.circuitId FROM circuits c WHERE c.name = 'Melbourne Grand Prix Circuit')) AND r.grid = 4;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM results r JOIN races r2 ON r.raceId = r2.raceId WHERE r2.year = 2008 AND r.position IS NOT NULL;	formula_1
SELECT r.name, d.surname, d.forename, s.status, rt.time, rt.milliseconds FROM results rt JOIN drivers d ON rt.driverId = d.driverId JOIN status s ON rt.statusId = s.status JOIN races r ON rt.raceId = r.raceId WHERE d.forename ilike '%Lewis%' AND d.surname ilike '%Hamilton%' AND r.name ilike '%Australian Grand Prix%' AND EXTRACT(YEAR FROM r.date) = 2008 ORDER BY rt.time ASC NULLS LAST;	formula_1
SELECT r.time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.position = 2 AND r.raceId IN (SELECT r2.raceId FROM races r2 JOIN seasons s ON r2.year = s.year WHERE s.year = 2008 AND r2.circuitId = (SELECT c.circuitId FROM circuits c WHERE c.name = 'Australian Grand Prix'));	formula_1
SELECT d.forename, d.surname, c.name AS constructorName, r.name AS raceName FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN constructors c ON r.constructorId = c.constructorId WHERE r.raceId = (SELECT r2.raceId FROM races r2 WHERE r2.year = 2008 AND r2.name = 'Australian Grand Prix') ORDER BY d.forename, d.surname NULLS LAST;	formula_1
SELECT COUNT(*) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'USA' AND r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.name = 'Australian Grand Prix' AND r2.year = 2008);	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId IN (SELECT r.raceId FROM races r WHERE r.year = 2008 AND r.circuitId = (SELECT c.circuitId FROM circuits c WHERE c.name = 'Melbourne Grand Prix Circuit'));	formula_1
SELECT SUM(r.points) AS total_points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT AVG(r.time) AS average_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT CAST(COUNT(DISTINCT CASE WHEN r.laps = rl.laps THEN r.resultId END) AS FLOAT) / NULLIF(COUNT(DISTINCT r.resultId), 0) AS proportion FROM results r JOIN lapTimes rl ON r.resultId = rl.raceId AND r.driverId = rl.driverId AND r.laps = rl.lap WHERE r.raceId = 2008 AND r.driverId = 22;	formula_1
SELECT ((r2.time - r1.time) / NULLIF(r1.time, 0) * 100) AS percentage_difference FROM (SELECT results.time FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE results.raceId = (SELECT raceId FROM races WHERE EXTRACT(YEAR FROM date) = 2008 AND name = 'Australian Grand Prix') ORDER BY results.position LIMIT 1) AS r1, (SELECT results.time FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE results.raceId = (SELECT raceId FROM races WHERE EXTRACT(YEAR FROM date) = 2008 AND name = 'Australian Grand Prix') ORDER BY results.position DESC LIMIT 1) AS r2;	formula_1
SELECT COUNT(*) FROM circuits c WHERE c.name ilike '%Melbourne%Australia%';	formula_1
SELECT c.lat, c.lng FROM circuits c WHERE c.country = 'United States';	formula_1
SELECT COUNT(*) FROM drivers d WHERE d.nationality = 'GB' AND d.dob > '1980-12-31';	formula_1
SELECT AVG(cr.points) AS average_points FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'British';	formula_1
WITH ConstructorPoints AS (SELECT c.constructorId, SUM(cr.points) AS totalPoints FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId GROUP BY c.constructorId) SELECT cp.constructorId, cp.totalPoints FROM ConstructorPoints cp ORDER BY cp.totalPoints DESC LIMIT 1;	formula_1
SELECT c.name, cr.points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.points = 0 AND cr.raceId = 291;	formula_1
SELECT COUNT(*) FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'Japanese' AND cr.points = 0;	formula_1
SELECT DISTINCT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT c.constructorId) AS french_constructors_with_over_50_laps FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN drivers d ON cr.driverId = d.driverId JOIN results r ON d.driverId = r.driverId AND r.laps > 50 WHERE c.nationality = 'French';	formula_1
SELECT SUM(CASE WHEN r.position IS NOT NULL THEN 1 ELSE 0 END)::FLOAT / NULLIF(COUNT(r.position), 0) AS completion_percentage FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'Japanese' AND r.year BETWEEN 2007 AND 2009;	formula_1
SELECT r.year, AVG(r.time) AS average_time FROM results r JOIN constructorResults cr ON r.resultId = cr.resultId WHERE cr.status = 'Fastest Lap' GROUP BY r.year;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.position = 2 AND d.dob > '1975-01-01';	formula_1
SELECT COUNT(*) AS italian_drivers_dnf FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'Italian' AND r.statusId!= (SELECT statusId FROM status WHERE status = 'Finished');	formula_1
SELECT d.forename, d.surname, MIN(r.time) AS fastest_lap_time FROM drivers d JOIN results r ON d.driverId = r.driverId GROUP BY d.driverId, d.forename, d.surname ORDER BY fastest_lap_time ASC LIMIT 1;	formula_1
SELECT r.resultId, r.laps, r.fastestLap FROM results r JOIN constructorStandings cs ON r.constructorId = cs.constructorId WHERE cs.wins > 0 AND EXTRACT(YEAR FROM r.race.date) = 2009 ORDER BY r.fastestLap DESC NULLS LAST LIMIT 1;	formula_1
SELECT AVG(r.fastestLapSpeed) FROM results r WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE LOWER(r2.name) = 'Spanish Grand Prix' AND r2.year = 2009);	formula_1
SELECT r.name, r.year FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.time IS NOT NULL ORDER BY res.time ASC NULLS LAST LIMIT 1;	formula_1
SELECT CAST(COUNT(DISTINCT CASE WHEN d.dob < '1985-01-01' AND r.lap > 50 THEN r.driverId END) AS FLOAT) / NULLIF(COUNT(DISTINCT r.driverId), 0) AS proportion FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId BETWEEN (SELECT MIN(raceId) FROM races WHERE EXTRACT(YEAR FROM date) = 2000) AND (SELECT MAX(raceId) FROM races WHERE EXTRACT(YEAR FROM date) = 2005);	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'French' AND r.time < '02:00:00';	formula_1
SELECT d.driverRef, d.surname, d.forename FROM drivers d WHERE d.nationality ilike '%America%';	formula_1
SELECT r.raceId FROM races r WHERE r.year = 2009;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId = 18;	formula_1
SELECT d.code, COUNT(*) AS count FROM drivers d WHERE d.nationality = 'Netherlands' GROUP BY d.code ORDER BY d.dob ASC LIMIT 3;	formula_1
SELECT d.url AS driver_url FROM drivers d WHERE d.forename = 'Robert' AND d.surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'Australian' AND d.dob = '1980-01-01';	formula_1
SELECT d.forename, d.surname, d.dob, l.time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN lapTimes l ON r.raceId = l.raceId AND r.driverId = l.driverId WHERE d.nationality = 'German' AND EXTRACT(YEAR FROM d.dob) BETWEEN 1980 AND 1990 ORDER BY l.time ASC LIMIT 3;	formula_1
SELECT d.driverRef FROM drivers d WHERE d.nationality = 'German' ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT r.driverId, r.code FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.dob = '1971-01-01' AND r.fastestLapTime = (SELECT MAX(r2.fastestLapTime) FROM results r2 WHERE r2.raceId = r.raceId) ORDER BY r.driverId NULLS LAST;	formula_1
SELECT d.forename, d.surname, l.time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN lapTimes l ON r.resultId = l.raceId AND r.driverId = l.driverId WHERE d.nationality = 'Spanish' AND d.dob < '1982-01-01' ORDER BY l.time DESC LIMIT 10;	formula_1
SELECT r.year, MIN(l.time) FROM races r JOIN results r1 ON r.raceId = r1.raceId JOIN lapTimes l ON r.raceId = l.raceId GROUP BY r.year ORDER BY MIN(l.time) ASC LIMIT 1;	formula_1
WITH LapTime AS (SELECT r.year, AVG(l.time) AS avg_time FROM races r JOIN lapTimes l ON r.raceId = l.raceId GROUP BY r.year) SELECT lt.year FROM LapTime lt ORDER BY lt.avg_time ASC LIMIT 1;	formula_1
SELECT r.driverId, MIN(l.time) AS fastestLapTime FROM races r JOIN lapTimes l ON r.raceId = l.raceId GROUP BY r.driverId ORDER BY fastestLapTime DESC LIMIT 5;	formula_1
SELECT COUNT(*) FROM results r WHERE r.position IS NOT NULL AND r.position <= r.laps AND r.raceId BETWEEN 50 AND 100 AND r.statusId IN (SELECT statusId FROM status WHERE status = 'Disqualified');	formula_1
SELECT COUNT(DISTINCT r.raceId) AS number_of_races, c.name, c.lat, c.lng FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name ilike '%Austria%' GROUP BY c.name, c.lat, c.lng;	formula_1
SELECT r.name, COUNT(DISTINCT r.resultId) AS num_finishers FROM results r JOIN status s ON r.statusId = s.statusId WHERE s.status = 'Finished' GROUP BY r.name ORDER BY num_finishers DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 23 AND q.number = 2;	formula_1
WITH YoungestDriver AS (SELECT d.driverId, d.forename, d.surname, MIN(q.qualifyId) AS firstQualifyId FROM drivers d JOIN qualifying q ON d.driverId = q.driverId GROUP BY d.driverId, d.forename, d.surname) SELECT r.year, r.name, r.date, r.time FROM YoungestDriver yd JOIN results r ON yd.firstQualifyId = r.resultId;	formula_1
SELECT COUNT(*) AS disqualified_drivers FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'DSQ';	formula_1
SELECT c.name, c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'Italian' ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN (SELECT cs.constructorId, COUNT(cs.wins) AS totalWins FROM constructorStandings cs GROUP BY cs.constructorId ORDER BY totalWins DESC LIMIT 1) AS t ON c.constructorId = t.constructorId;	formula_1
SELECT d.forename, d.surname, lt.time, lt.milliseconds FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.lap = 3 ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT r.name, MIN(l.time) AS fastest_lap_time FROM races r JOIN lapTimes l ON r.raceId = l.raceId GROUP BY r.name ORDER BY fastest_lap_time ASC LIMIT 1;	formula_1
SELECT AVG(r.time) AS average_fastest_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId = (SELECT r2.raceId FROM races r2 WHERE r2.name = 'United States Grand Prix' AND r2.year = 2006) AND r.fastestLapTime IS NOT NULL AND d.nationality = 'British' ORDER BY r.fastestLapTime ASC LIMIT 10;	formula_1
SELECT d.surname, d.forename, AVG(p.duration) AS avg_duration FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN pitStops p ON r.resultId = p.raceId AND r.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.surname, d.forename ORDER BY avg_duration ASC LIMIT 5;	formula_1
SELECT d.forename, d.surname, r.date, r.time FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId IN (SELECT r.raceId FROM races r WHERE LOWER(r.name) LIKE '%canadian grand prix%' AND EXTRACT(YEAR FROM r.date) = 2008) ORDER BY r.position;	formula_1
SELECT c.constructorRef, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId WHERE r.name = 'Singapore Grand Prix' AND r.year = 2009 ORDER BY cs.points DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, d.dob FROM drivers d WHERE d.nationality = 'Austrian' AND EXTRACT(YEAR FROM d.dob) BETWEEN 1981 AND 1991;	formula_1
SELECT d.forename, d.surname, d.url, d.dob FROM drivers d WHERE d.nationality = 'German' AND EXTRACT(YEAR FROM d.dob) BETWEEN 1971 AND 1985 ORDER BY d.dob DESC;	formula_1
SELECT c.location, c.country, c.lat, c.lng FROM circuits c WHERE c.name = 'Hungaroring';	formula_1
WITH MonacoPoints AS (SELECT cr.constructorId, SUM(cr.points) AS totalPoints FROM constructorResults cr JOIN races r ON cr.raceId = r.raceId WHERE LOWER(r.name) ='monaco grand prix' AND r.year BETWEEN 1980 AND 2010 GROUP BY cr.constructorId) SELECT mp.constructorId, c.name, c.nationality, mp.totalPoints FROM MonacoPoints mp JOIN constructors c ON mp.constructorId = c.constructorId ORDER BY mp.totalPoints DESC LIMIT 1;	formula_1
SELECT AVG(r.points) AS average_points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Hamilton' AND r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.name ilike '%Turkish Grand Prix%');	formula_1
SELECT COUNT(raceId) / 10.0 AS average_races_per_year FROM races r WHERE EXTRACT(YEAR FROM r.date) BETWEEN 2000 AND 2009;	formula_1
SELECT d.nationality, COUNT(d.driverId) AS count FROM drivers d GROUP BY d.nationality ORDER BY count DESC LIMIT 1;	formula_1
SELECT COUNT(*) AS number_of_victories FROM (SELECT d.driverId, d.forename, d.surname, r.name AS race_name, MAX(r.wins) AS max_wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE ds.position = 91 GROUP BY d.driverId, d.forename, d.surname, race_name) AS subquery;	formula_1
SELECT r.name, MAX(l.time) AS fastest_lap_time FROM races r JOIN results r1 ON r.raceId = r1.raceId JOIN lapTimes l ON r1.resultId = l.resultId GROUP BY r.name ORDER BY fastest_lap_time DESC LIMIT 1;	formula_1
SELECT c.name, c.location FROM circuits c ORDER BY c.name DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races R2 ON r.raceId = R2.raceId WHERE R2.circuitId = (SELECT c.circuitId FROM circuits c WHERE LOWER(c.location) ='marina bay street circuit') AND R2.year = 2008 AND r.position = 1 AND r.qualifyId = 3;	formula_1
SELECT d.forename, d.surname, d.nationality, r.name AS first_race FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob = (SELECT MIN(d2.dob) FROM drivers d2);	formula_1
WITH AccidentCounts AS (SELECT d.driverRef, COUNT(*) AS accident_count FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE s.status = 'Accident' GROUP BY d.driverRef) SELECT ac.driverRef, ac.accident_count FROM AccidentCounts ac WHERE ac.driverRef IN (SELECT driverRef FROM AccidentCounts ORDER BY accident_count DESC LIMIT 1) AND EXISTS (SELECT 1 FROM races r WHERE r.name = 'Canadian Grand Prix') ORDER BY ac.driverRef;	formula_1
SELECT d.forename, d.surname, COUNT(r.wins) AS wins_count FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE ds.wins = (SELECT MAX(wins) FROM drivers d2 JOIN driverStandings ds2 ON d2.driverId = ds2.driverId) GROUP BY d.forename, d.surname;	formula_1
SELECT MAX(p.duration) AS longest_duration FROM pitStops p;	formula_1
SELECT MIN(raceId), MIN(driverId), MIN(lap), MIN(milliseconds) AS fastestLapTime FROM lapTimes;	formula_1
SELECT MAX(p.time) FROM pitStops p JOIN drivers d ON p.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT pt.lap FROM pitStops pt JOIN drivers d ON pt.driverId = d.driverId JOIN races r ON pt.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.year = 2011;	formula_1
SELECT d.forename, d.surname, SUM(p.duration) AS total_duration FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN pitStops p ON r.raceId = p.raceId AND r.driverId = p.driverId WHERE r.year = 2011 GROUP BY d.forename, d.surname;	formula_1
SELECT MAX(lapTimes.milliseconds) AS max_lap_time FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE LOWER(drivers.surname) = 'hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE r.time = (SELECT MIN(r2.time) FROM results r2);	formula_1
SELECT r.name, c.position FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN status s ON r.statusId = s.statusId JOIN constructors c ON r.constructorId = c.constructorId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND s.status = 'FASTEST LAP';	formula_1
SELECT MAX(l.time) AS lap_record FROM lapTimes l JOIN races r ON l.raceId = r.raceId WHERE r.name ilike '%Austrian Grand Prix%';	formula_1
SELECT l.position, l.time, l.milliseconds FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN circuits c ON l.raceId = c.circuitId WHERE c.country = 'Italy';	formula_1
SELECT r.name, r.date, l.time FROM races r JOIN lapTimes l ON r.raceId = l.raceId WHERE r.circuitId IN (SELECT c.circuitId FROM circuits c WHERE c.location = 'Austria') ORDER BY l.lap ASC LIMIT 1;	formula_1
SELECT ps.time FROM pitStops ps JOIN drivers d ON ps.driverId = d.driverId JOIN results r ON ps.raceId = r.raceId AND ps.driverId = r.driverId WHERE d.forename = 'Max' AND d.surname = 'Verstappen' AND r.circuitId = (SELECT c.circuitId FROM circuits c WHERE c.name = 'Austrian Grand Prix') ORDER BY ps.stop ASC NULLS LAST LIMIT 1;	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN results r ON c.circuitId = r.raceId WHERE r.time = '1:29.488';	formula_1
SELECT AVG(milliseconds) AS average_time_in_ms FROM pitStops ps JOIN drivers d ON ps.driverId = d.driverId WHERE LOWER(d.surname) = 'hamilton';	formula_1
SELECT AVG(lt.milliseconds) AS average_lap_time FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.location) = 'italy';	formula_1
SELECT p.player_api_id FROM Player_Attributes p ORDER BY p.overall_rating DESC LIMIT 1;	european_football_2
SELECT p.player_name, MAX(p.height) AS height FROM Player p GROUP BY p.player_name ORDER BY height DESC LIMIT 1;	european_football_2
SELECT pa.preferred_foot FROM Player_Attributes pa WHERE pa.potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT p.player_api_id) FROM Player_Attributes p WHERE p.overall_rating BETWEEN 60 AND 65 AND p.attacking_work_rate = 'high';	european_football_2
SELECT p.player_api_id, p.player_name, AVG(t.crossing) AS avg_crossing FROM Player_Attributes p JOIN "Team_Attributes" t ON p.player_api_id = t.team_api_id GROUP BY p.player_api_id, p.player_name ORDER BY avg_crossing DESC NULLS LAST LIMIT 5;	european_football_2
SELECT l.name, SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2016' GROUP BY l.name ORDER BY total_goals DESC LIMIT 1;	european_football_2
SELECT t.team_long_name, COUNT(*) AS lost_matches FROM Match m JOIN Team t ON m.home_team_api_id = t.team_api_id WHERE m.season = '2016' AND m.home_team_goal < m.away_team_goal GROUP BY t.team_long_name ORDER BY lost_matches ASC LIMIT 1;	european_football_2
SELECT p.player_name, COUNT(pa.penalties) AS num_penalties FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_name ORDER BY num_penalties DESC LIMIT 10;	european_football_2
SELECT t.team_short_name, COUNT(m.match_api_id) AS match_count FROM Match m JOIN Team t ON (m.home_team_api_id = t.team_api_id OR m.away_team_api_id = t.team_api_id) WHERE m.country_id IN (SELECT id FROM Country WHERE name = 'Scotland') AND m.season = '2010' GROUP BY t.team_short_name ORDER BY match_count DESC NULLS LAST LIMIT 1;	european_football_2
SELECT t.team_api_id, t.team_short_name, ta.buildUpPlaySpeed FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id ORDER BY ta.buildUpPlaySpeed DESC LIMIT 4;	european_football_2
SELECT l.name, COUNT(*) AS draw_count FROM Match m JOIN League l ON m.league_id = l.id WHERE m.date LIKE '2016%' AND m.home_team_goal = m.away_team_goal GROUP BY l.name ORDER BY draw_count DESC NULLS LAST LIMIT 1;	european_football_2
SELECT p.player_name, EXTRACT(YEAR FROM AGE(CURRENT_DATE, TO_DATE(p.birthday, 'YYYY-MM-DD'))) AS age FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.sprint_speed >= 97 AND EXTRACT(YEAR FROM TO_DATE(pa.date, 'YYYY-MM-DD')) BETWEEN 2013 AND 2015 ORDER BY age ASC NULLS LAST;	european_football_2
WITH league_matches AS (SELECT l.name, COUNT(m.id) AS match_count FROM League l JOIN Match m ON l.id = m.league_id GROUP BY l.name) SELECT lm.name, lm.match_count FROM league_matches lm ORDER BY lm.match_count DESC LIMIT 1;	european_football_2
SELECT AVG(p.height) FROM Player p WHERE p.birthday BETWEEN '1990-01-01' AND '1995-12-31';	european_football_2
WITH player_ratings AS (SELECT p.player_api_id, p.player_name, pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE EXTRACT(YEAR FROM pa.date) = 2010) SELECT pr.player_api_id, pr.player_name, pr.overall_rating FROM player_ratings pr WHERE pr.overall_rating > (SELECT AVG(overall_rating) FROM player_ratings) ORDER BY pr.overall_rating DESC NULLS LAST LIMIT 10;	european_football_2
SELECT t.team_fifa_api_id FROM Team_Attributes t WHERE t.buildUpPlaySpeed > 50 AND t.buildUpPlaySpeed < 60;	european_football_2
SELECT t.team_long_name, ta.buildUpPlayPassing FROM Team t JOIN Team_Attributes ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE ta.buildUpPlayPassing > (SELECT AVG(ta.buildUpPlayPassing) FROM Team_Attributes ta) AND EXTRACT(YEAR FROM ta.date) = 2012 ORDER BY ta.buildUpPlayPassing DESC NULLS LAST;	european_football_2
SELECT CAST(COUNT(*) FILTER (WHERE pa.preferred_foot = 'left') AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM Player_Attributes pa WHERE EXTRACT(YEAR FROM pa.date::DATE) BETWEEN 1987 AND 1992;	european_football_2
SELECT l.name, SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM Match m JOIN League l ON m.league_id = l.id GROUP BY l.name ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(pa.long_shots) AS average_long_shots FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Ahmed Samir Farag';	european_football_2
SELECT p.player_name, AVG(pa.heading_accuracy) AS avg_heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 GROUP BY p.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT t.team_long_name, t.team_short_name, ta.buildUpPlayDribblingClass, ta.buildUpPlayPassing FROM Team AS t JOIN Team_Attributes AS ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlayDribblingClass!= 'Normal' ORDER BY ta.buildUpPlayPassing DESC;	european_football_2
SELECT l.name FROM League l JOIN Match m ON l.id = m.league_id WHERE m.season = '2009/2010' GROUP BY l.name HAVING AVG(m.home_team_goal) > AVG(m.away_team_goal);	european_football_2
SELECT t.team_short_name FROM Team t WHERE t.team_short_name = 'Queens Park Rangers';	european_football_2
SELECT p.player_name, p.height, p.weight, p.birthday FROM Player p WHERE EXTRACT(YEAR FROM p.birthday) = 1970 AND EXTRACT(MONTH FROM p.birthday) = 10;	european_football_2
SELECT pat.attacking_work_rate FROM Player_Attributes pat WHERE pat.player_api_id IN (SELECT p.player_api_id FROM Player p WHERE p.player_name ilike '%Franco%Zennaro%');	european_football_2
SELECT t.team_api_id, t.team_long_name, ta.buildUpPlaySpeed, ta.buildUpPlaySpeedClass FROM Team AS t JOIN Team_Attributes AS ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlaySpeedClass = 'High';	european_football_2
SELECT p.player_name, pa.finishing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name ilike '%Francois%Affolter%' AND pa.date = '2014-09-18' AND pa.finishing IS NOT NULL;	european_football_2
SELECT p.player_api_id, pt.overall_rating FROM Player p JOIN Player_Attributes pt ON p.player_api_id = pt.player_api_id WHERE p.player_name ilike '%Gabriel Tamas%' AND pt.date = '2011';	european_football_2
SELECT COUNT(*) FROM Match m WHERE m.country_id IN (SELECT id FROM Country WHERE name = 'Scotland') AND m.season = '2015/2016';	european_football_2
SELECT p.player_name, pa.attacking_work_rate FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT p.player_name, p.height, p.weight, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.potential DESC;	european_football_2
SELECT COUNT(*) AS left_footed_players FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.weight < 130 AND pa.preferred_foot = 'Left';	european_football_2
SELECT DISTINCT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_fifa_api_id = t.team_fifa_api_id WHERE ta.buildUpPlayPassingClass = 'Risky';	european_football_2
SELECT p.player_name, pat.defensive_work_rate FROM Player p JOIN Player_Attributes pat ON p.player_api_id = pat.player_api_id WHERE p.player_name = 'David Wilson';	european_football_2
SELECT p.player_name, p.birthday FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.overall_rating DESC LIMIT 1;	european_football_2
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE c.name = 'Netherlands';	european_football_2
SELECT AVG(M.home_team_goal) AS average_home_goal FROM Match M WHERE M.country_id IN (SELECT id FROM Country WHERE name = 'Poland') AND M.season = '2010/2011';	european_football_2
SELECT p.player_name, AVG(pa.finishing) AS avg_finishing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_name ORDER BY avg_finishing DESC LIMIT 1;	european_football_2
SELECT p.player_name, p.height FROM Player p WHERE p.height > 180;	european_football_2
SELECT COUNT(*) FROM Player p WHERE CAST(p.birthday AS DATE) > '1990-12-31';	european_football_2
SELECT COUNT(*) FROM Player p WHERE p.player_name ilike 'Adam%' AND p.weight > 170;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating > 80 AND EXTRACT(YEAR FROM pa.date) BETWEEN 2008 AND 2010;	european_football_2
SELECT p.overall_rating FROM Player_Attributes p WHERE p.player_api_id = (SELECT a.player_api_id FROM Player a WHERE a.player_name = 'Aaron Doran');	european_football_2
SELECT p.player_name, p.height, p.weight FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.preferred_foot = 'left';	european_football_2
SELECT t.team_long_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT ta.buildUpPlayPassingClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_short_name = 'CLB';	european_football_2
SELECT t.team_short_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlayPassing > 70;	european_football_2
SELECT AVG(pa.overall_rating) AS average_overall_rating FROM Player_Attributes pa WHERE pa.date BETWEEN '2010-01-01' AND '2015-12-31' AND pa.height > 170;	european_football_2
SELECT p.player_name, p.height FROM Player p ORDER BY p.height ASC LIMIT 1;	european_football_2
SELECT c.name FROM League l JOIN Country c ON l.country_id = c.id WHERE l.name = 'Italy Serie A';	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.buildUpPlaySpeed = 31 AND ta.buildUpPlayDribbling = 53 AND ta.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(pa.overall_rating) AS average_overall_rating FROM Player pa WHERE pa.player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(*) FROM Match m JOIN League l ON m.league_id = l.id WHERE l.name = 'Germany 1. Bundesliga' AND m.date BETWEEN '2008-08-01' AND '2008-10-31';	european_football_2
SELECT t.team_short_name FROM Match m JOIN Team t ON m.home_team_api_id = t.team_api_id WHERE m.home_team_goal = 10;	european_football_2
SELECT p.player_name, p.player_api_id, t.team_short_name, ta.buildUpPlaySpeed, ta.buildUpPlayDribbling, ta.buildUpPlayPassing, ta.buildUpPlayPositioningClass, ta.chanceCreationPassing, ta.chanceCreationDribbling, ta.chanceCreationPassingClass, ta.chanceCreationPositioningClass, ta.defencePressure, ta.defenceAggression, ta.defenceDefenderLineClass, ta.defenceTeamWidth, ta.defenceTeamWidthClass, ta.gk_diving, ta.gk_handling, ta.gk_kicking, ta.gk_positioning, ta.gk_reflexes, ta.interceptions, ta.marking, ta.positioning, ta.stamina, ta.strength, ta.volleys, ta.crossing, ta.finishing, ta.free_kick_accuracy, ta.long_shots, ta.acceleration, ta.sprint_speed, ta.agility, ta.reactions, ta.balance, ta.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Team t ON p.player_fifa_api_id = t.team_fifa_api_id JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE pa.balance >= 61 AND pa.potential >= 61 ORDER BY ta.balance DESC, ta.potential DESC;	european_football_2
SELECT (AVG(p1.ball_control) - AVG(p2.ball_control)) AS difference FROM Player_Attributes p1, Player_Attributes p2 WHERE p1.player_api_id = 3455 AND p2.player_api_id = 3456;	european_football_2
SELECT t.team_long_name FROM Team t WHERE t.team_api_id = 'GEN';	european_football_2
SELECT p.player_name, p.birthday FROM Player p WHERE p.player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY p.birthday ASC;	european_football_2
SELECT p.player_name, p.height FROM Player p ORDER BY p.height DESC NULLS LAST LIMIT 1;	european_football_2
SELECT p.player_name, t.team_short_name, t.team_long_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Team t ON p.player_fifa_api_id = t.team_fifa_api_id WHERE pa.attacking_work_rate = 'left' GROUP BY p.player_name, t.team_short_name, t.team_long_name;	european_football_2
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE l.name = 'Jupiler League';	european_football_2
SELECT DISTINCT l.name FROM League l WHERE l.country_id IN (SELECT id FROM Country WHERE name = 'Germany') ORDER BY l.name ASC;	european_football_2
SELECT p.player_name, p.height, p.weight, pa.strength FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.strength DESC LIMIT 1;	european_football_2
SELECT COUNT(DISTINCT p.player_api_id) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE EXTRACT(YEAR FROM p.birthday) < 1986 AND (pa.attacking_work_rate = 'high' OR pa.defensive_work_rate = 'high');	european_football_2
SELECT p.player_name, MAX(t.crossing) AS max_crossing FROM "Player" p JOIN "Player_Attributes" pa ON p.player_api_id = pa.player_api_id JOIN "Team" t ON p.player_api_id = t.team_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') GROUP BY p.player_name ORDER BY max_crossing DESC;	european_football_2
SELECT pa.heading_accuracy FROM Player_Attributes pa WHERE LOWER(pa.player_name) = 'ariel borysiuk';	european_football_2
SELECT COUNT(*) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 AND pa.volleys > 70;	european_football_2
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match m WHERE m.country_id IN (SELECT id FROM Country WHERE name = 'Belgium') AND m.season = '2008/2009';	european_football_2
SELECT t.team_api_id, t.team_fifa_api_id, t.team_long_name, t.team_short_name, ta.buildUpPlayPassing, ta.buildUpPlayPassingClass FROM Team_Attributes AS ta JOIN Team AS t ON ta.team_api_id = t.team_api_id WHERE ta.buildUpPlayPassing IS NOT NULL ORDER BY ta.buildUpPlayPassing DESC NULLS LAST LIMIT 1;	european_football_2
SELECT COUNT(*) AS matches_played FROM Match m WHERE m.country_id IN (SELECT id FROM Country WHERE name = 'Belgium') AND EXTRACT(MONTH FROM TO_DATE(m.date, 'YYYY-MM-DD')) = 4 AND EXTRACT(YEAR FROM TO_DATE(m.date, 'YYYY-MM-DD')) = 2009;	european_football_2
SELECT m.league_id, COUNT(*) AS match_count FROM "Match" m WHERE m.season = '2008/2009' GROUP BY m.league_id ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG(pa.overall_rating) FROM Player pa WHERE EXTRACT(YEAR FROM pa.birthday) < 1986;	european_football_2
SELECT ((ab.overall_rating - pb.overall_rating)::FLOAT / NULLIF(pb.overall_rating, 0)) * 100 AS percentage_difference FROM Player_Attributes ab JOIN Player pab ON ab.player_api_id = pab.player_api_id JOIN Player p ON p.player_api_id = 1115 AND p.player_name = 'Paulin Puel';	european_football_2
SELECT AVG(t.buildUpPlaySpeed) AS average_build_up_play_speed FROM Team_Attributes t JOIN Team ta ON t.team_api_id = ta.team_api_id WHERE ta.team_short_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(pa.overall_rating) AS average_overall_rating FROM Player_Attributes pa WHERE LOWER(pa.player_name) = 'pietro marino';	european_football_2
SELECT SUM(pa.crossing) AS total_crossing_score FROM Player_Attributes pa WHERE pa.player_api_id = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Aaron Lennox');	european_football_2
SELECT MAX(t.buildUpPlayPassing) AS highest_passing_score, t.buildUpPlayPassingClass FROM Team_Attributes t JOIN Team ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE ta.team_short_name = 'Ajax' GROUP BY t.buildUpPlayPassingClass;	european_football_2
SELECT p.preferred_foot FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(pa.overall_rating) AS highest_overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(m.away_team_goal) AS average_goals FROM Match m JOIN Team t ON m.away_team_api_id = t.team_api_id WHERE t.team_long_name = 'Parma' AND m.country_id = (SELECT id FROM Country WHERE name = 'Italy');	european_football_2
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.date = '2016/6/23' AND pa.overall_rating = 77 ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT p.overall_rating FROM Player_Attributes p WHERE p.player_api_id = (SELECT a.player_api_id FROM Player a WHERE a.player_name = 'Aaron Mooy') AND p.date = '2016-02-04';	european_football_2
SELECT pa.potential FROM Player_Attributes pa WHERE pa.date = '2010-08-30' AND pa.player_api_id = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francesco Parravicini');	european_football_2
SELECT t.date, t.attacking_work_rate FROM Player_Attributes t WHERE t.player_api_id = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Francesco Migliore') AND t.date = '2015-05-01';	european_football_2
SELECT pa.attacking_work_rate, pa.defensive_work_rate FROM Player_Attributes pa WHERE pa.player_api_id IN (SELECT m.away_player_11 FROM Match m WHERE m.date = '2013-02-22') AND pa.player_api_id IN (SELECT m.home_player_11 FROM Match m WHERE m.date = '2013-02-22');	european_football_2
SELECT pa.date FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Kevin Constant' AND pa.crossing = (SELECT MAX(pa2.crossing) FROM Player_Attributes pa2 WHERE pa2.player_api_id = p.player_api_id) LIMIT 1;	european_football_2
SELECT ta.buildUpPlaySpeedClass FROM Team_Attributes ta JOIN Team t ON ta.team_fifa_api_id = t.team_fifa_api_id WHERE LOWER(t.team_short_name) = 'willem ii' AND ta.date = '2011-02-22';	european_football_2
SELECT t.buildUpPlayDribblingClass FROM Team_Attributes t JOIN Team ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE ta.team_long_name = 'Leicester City' AND t.date = '2015/9/10';	european_football_2
SELECT t.buildUpPlayPassingClass FROM Team t JOIN Match m ON t.team_api_id = m.home_team_api_id WHERE m.date = '2010-02-22' AND t.team_long_name = 'FC Lorient';	european_football_2
SELECT ta.buildUpPlayPassingClass FROM Team_Attributes ta JOIN Team t ON ta.team_fifa_api_id = t.team_fifa_api_id WHERE t.team_long_name = 'PEC Zwolle' AND ta.date = '2013/9/20';	european_football_2
SELECT t.buildUpPlayCrossingClass FROM Team_Attributes t JOIN Team ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE ta.team_short_name = 'Hull City' AND t.date = '2010/02/22';	european_football_2
SELECT t.buildUpPlayAggression, t.buildUpPlayPassing, t.buildUpPlayPositioning, t.chanceCreationPassing, t.chanceCreationShooting, t.defenceAggression, t.defencePressure, t.defenceTeamWidth FROM Team_Attributes t JOIN Team ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE ta.team_long_name = 'Hannover 96' AND t.date = '2015/9/10';	european_football_2
SELECT AVG(p.overall_rating) AS average_overall_rating FROM Player_Attributes p WHERE p.player_api_id IN (SELECT t.home_player_api_id FROM Match t WHERE t.date BETWEEN '2007-02-22' AND '2016-04-21') AND p.player_api_id IN (SELECT t.away_player_api_id FROM Match t WHERE t.date BETWEEN '2007-02-22' AND '2016-04-21') AND p.player_api_id = 133644;	european_football_2
SELECT CAST((SUM(CASE WHEN p.player_api_id = 206511 THEN pa.overall_rating ELSE 0 END) AS FLOAT) / NULLIF(SUM(CASE WHEN p.player_api_id = 206511 THEN 0 ELSE pa.overall_rating END), 0)) * 100 AS FLOAT) AS percentage FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_api_id IN (206511, 206512) AND pa.date = '2013-07-12';	european_football_2
SELECT p.player_name, p.height FROM Player p ORDER BY p.height DESC NULLS LAST LIMIT 5;	european_football_2
SELECT p.player_api_id FROM Player p ORDER BY p.weight DESC LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, TO_DATE(p.birthday, 'YYYY-MM-DD'))) < 35;	european_football_2
SELECT SUM(M.home_team_goal) AS total_goals FROM Match M JOIN Player P ON M.home_player_1 = P.player_api_id OR M.home_player_2 = P.player_api_id OR M.home_player_3 = P.player_api_id OR M.home_player_4 = P.player_api_id OR M.home_player_5 = P.player_api_id OR M.home_player_6 = P.player_api_id OR M.home_player_7 = P.player_api_id OR M.home_player_8 = P.player_api_id OR M.home_player_9 = P.player_api_id OR M.home_player_10 = P.player_api_id OR M.home_player_11 = P.player_api_id WHERE LOWER(P.player_name) = 'aaron lennon';	european_football_2
SELECT SUM(a.away_team_goal) AS total_away_goals FROM "Match" m JOIN Player p ON m.away_player_1 = p.player_api_id OR m.away_player_2 = p.player_api_id OR m.away_player_3 = p.player_api_id OR m.away_player_4 = p.player_api_id OR m.away_player_5 = p.player_api_id OR m.away_player_6 = p.player_api_id OR m.away_player_7 = p.player_api_id OR m.away_player_8 = p.player_api_id OR m.away_player_9 = p.player_api_id OR m.away_player_10 = p.player_api_id OR m.away_player_11 = p.player_api_id WHERE p.player_name IN ('Daan Smith', 'Filipe Ferreira');	european_football_2
SELECT SUM(m.home_team_goal) AS total_home_goals FROM Match m JOIN Player p ON m.home_player_1 = p.player_api_id OR m.home_player_2 = p.player_api_id OR m.home_player_3 = p.player_api_id OR m.home_player_4 = p.player_api_id OR m.home_player_5 = p.player_api_id OR m.home_player_6 = p.player_api_id OR m.home_player_7 = p.player_api_id OR m.home_player_8 = p.player_api_id OR m.home_player_9 = p.player_api_id OR m.home_player_10 = p.player_api_id OR m.home_player_11 = p.player_api_id WHERE EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.birthday) <= 30;	european_football_2
SELECT p.player_name, SUM(pa.overall_rating) AS total_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_name ORDER BY total_rating DESC LIMIT 10;	european_football_2
SELECT p.player_name, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id ORDER BY pa.potential DESC NULLS LAST LIMIT 5;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.attacking_work_rate = 'High' AND p.player_api_id IN (SELECT pa.player_api_id FROM Player_Attributes pa WHERE pa.attacking_work_rate = 'High') ORDER BY p.player_name ASC;	european_football_2
SELECT p.player_name, MAX(p.birthday) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.finishing = 1 GROUP BY p.player_name ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.birthday LIKE '%Belgium%';	european_football_2
SELECT p.player_name, p.birthday, c.name AS country_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id JOIN Country c ON p.height > 180 JOIN League l ON p.weight > 80 WHERE pa.vision >= 90;	european_football_2
SELECT c.name, AVG(p.weight) AS average_weight FROM Player p JOIN Country c ON p.country_id = c.id GROUP BY c.name ORDER BY average_weight DESC LIMIT 1;	european_football_2
SELECT t.team_long_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT t.team_short_name, ta.buildUpPlayPassingClass FROM Team t JOIN Team_Attributes ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE ta.buildUpPlayPassing > 70 ORDER BY t.team_short_name;	european_football_2
SELECT AVG(p.height) FROM Player p WHERE p.player_api_id IN (SELECT t.team_api_id FROM Team t WHERE t.team_long_name LIKE '%Italy%');	european_football_2
SELECT p.player_name, p.height FROM Player p WHERE p.height > 180 ORDER BY p.player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player p WHERE p.player_name ilike 'Aaron%' AND EXTRACT(YEAR FROM p.birthday) > 1990;	european_football_2
SELECT p6.jumping - p23.jumping AS difference FROM Player_Attributes p6, Player_Attributes p23 WHERE p6.player_api_id = 6 AND p23.player_api_id = 23;	european_football_2
SELECT p.id, p.player_name FROM Player_Attributes p WHERE p.preferred_foot = 'Right' ORDER BY p.potential ASC LIMIT 3;	european_football_2
SELECT COUNT(DISTINCT p.player_api_id) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.crossing = MAX(pa.crossing) AND pa.preferred_foot = 'left' AND pa.attacking_work_rate = 'high';	european_football_2
SELECT CAST(COUNT(*) FILTER (WHERE pa.strength > 80 AND pa.stamina > 80) AS FLOAT) / NULLIF(COUNT(*), 0) AS fraction FROM Player_Attributes pa;	european_football_2
SELECT l.name AS league_name, c.name AS country_name FROM League l JOIN Country c ON l.country_id = c.id WHERE l.name = 'Ekstraklasa';	european_football_2
SELECT m.home_team_goal, m.away_team_goal FROM Match m WHERE m.date = '2008-09-24';	european_football_2
SELECT p.acceleration, p.agility, p.sprint_speed FROM Player_Attributes p WHERE p.player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Alexis Blin');	european_football_2
SELECT ta.team_api_id, ta.team_fifa_api_id, ta.date, ta.buildUpPlaySpeedClass FROM Team_Attributes ta WHERE ta.team_fifa_api_id IN (SELECT t.team_fifa_api_id FROM Team t WHERE t.team_short_name = 'KSV Cercle Brugge') ORDER BY ta.date DESC NULLS LAST;	european_football_2
SELECT COUNT(*) AS total_matches FROM Match m WHERE m.league_id IN (SELECT id FROM League WHERE name = 'Italian Serie A') AND m.season = '2015-2016';	european_football_2
WITH HomeTeamScores AS (SELECT m.home_team_api_id, MAX(m.home_team_goal) AS max_goal FROM Match m WHERE m.country_id IN (SELECT id FROM Country WHERE name = 'Netherlands') AND m.league_id IN (SELECT id FROM League WHERE name = 'Eredivisie') GROUP BY m.home_team_api_id) SELECT t.team_long_name, hts.max_goal FROM HomeTeamScores hts JOIN Team t ON hts.home_team_api_id = t.team_api_id ORDER BY hts.max_goal DESC NULLS LAST LIMIT 1;	european_football_2
SELECT p.player_name, pa.finishing, pa.curve FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.weight = (SELECT MAX(weight) FROM Player);	european_football_2
SELECT l.name, COUNT(m.id) AS total_matches FROM League l JOIN Match m ON l.id = m.league_id WHERE m.season = '2015-2016' GROUP BY l.name ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT t.team_long_name, COUNT(m.away_team_goal) AS goal_count FROM Match m JOIN Team t ON m.away_team_api_id = t.team_api_id GROUP BY t.team_long_name ORDER BY goal_count DESC LIMIT 1;	european_football_2
SELECT p.player_name, p.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id ORDER BY pa.strength DESC LIMIT 1;	european_football_2
SELECT CAST(COUNT(DISTINCT CASE WHEN p.height < 180 THEN p.player_api_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT p.player_api_id), 0) AS proportion FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.strength > 70;	european_football_2
SELECT CASE WHEN p.SEX ='male' THEN 'in-patient' ELSE 'out-patient' END AS sex, COUNT(*) AS count FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX IS NOT NULL GROUP BY sex;	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN p.SEX = 'Female' THEN p.ID END) AS FLOAT) / NULLIF(COUNT(DISTINCT p.ID), 0) AS proportion FROM Patient p WHERE EXTRACT(YEAR FROM p.Birthday) > 1930;	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN P.Description IS NOT NULL THEN P.ID END) AS FLOAT) / NULLIF(COUNT(DISTINCT P.ID), 0) AS proportion_inpatient FROM Patient P WHERE EXTRACT(YEAR FROM P.Birthday) BETWEEN 1930 AND 1940;	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN p.Description = 'outpatient' THEN e.ID END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN p.Description = 'inpatient' THEN e.ID END), 0) AS ratio FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Diagnosis = 'SLE';	thrombosis_prediction
SELECT e.Diagnosis, l.Date FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.ID = 30609 ORDER BY l.Date NULLS LAST;	thrombosis_prediction
SELECT p.SEX, p.Birthday, e.Symptoms, e.`Examination Date` FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.ID = 163109;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 300;	thrombosis_prediction
SELECT p.ID, DATEDIFF('year', p.Birthday, CURRENT_DATE()) AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TAT > 40 ORDER BY age ASC NULLS LAST;	thrombosis_prediction
SELECT p.ID, p.SEX, e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis > 10;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE EXTRACT(YEAR FROM p.Birthday) = 1937 AND l.T_CHO > 200;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN L.TP < 6.4 OR L.TP > 8.3 THEN P.ID END) AS FLOAT) / NULLIF(COUNT(DISTINCT P.ID), 0) AS proportion FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F';	thrombosis_prediction
SELECT AVG(e.`aCL IgG`) AS average_aCL_IgG FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.`First Date` IS NOT NULL AND EXTRACT(YEAR FROM age(p.`First Date`)) >= 50;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'Female' AND EXTRACT(YEAR FROM p.`First Date`) = 1997 AND e.`Examination Date` IS NOT NULL;	thrombosis_prediction
SELECT MIN(P.Birthday) - EXTRACT(YEAR FROM MIN(P.Birthday)) AS age FROM Patient P;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis IS NOT NULL AND EXTRACT(YEAR FROM e.`Examination Date`) = 1997 AND p.SEX = 'Female';	thrombosis_prediction
SELECT MAX(P.Birthday) - MIN(P.Birthday) AS age_range FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG IS NOT NULL;	thrombosis_prediction
SELECT e.Symptoms, e.Diagnosis FROM Examination e WHERE e.ID IN (SELECT MIN(e2.ID) FROM Examination e2 GROUP BY e2.SEX);	thrombosis_prediction
SELECT DATE_TRUNC('month', l.date) AS MONTH, COUNT(DISTINCT p.id) AS avg_patients FROM Laboratory l JOIN Patient p ON l.id = p.id WHERE DATE_PART('year', l.date) = 1998 AND p.sex = 'M' GROUP BY DATE_TRUNC('month', l.date) ORDER BY DATE_TRUNC('month', l.date) NULLS LAST;	thrombosis_prediction
SELECT MIN(l.Date), p.`First Date` FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.Date = (SELECT MIN(l2.Date) FROM Laboratory l2) AND p.Diagnosis = 'SJS';	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN P.SEX = 'Male' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(SUM(CASE WHEN P.SEX = 'Female' THEN 1 ELSE 0 END), 0) AS RATIO FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.UA > 5;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE (e.ID IS NULL OR (e.Examination_Date - p.First_Date) > 365);	thrombosis_prediction
SELECT COUNT(*) AS underage_patients FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday > '1990-12-31' AND e.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'Male' AND e.`T-BIL` > 1;	thrombosis_prediction
SELECT COUNT(*) AS total_patients, Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY total_patients DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.Birthday))) AS average_age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE EXTRACT(MONTH FROM e.`Examination Date`) = 10 AND EXTRACT(YEAR FROM e.`Examination Date`) = 1991;	thrombosis_prediction
SELECT p.Birthday, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = (SELECT ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE HGB = (SELECT MAX(HGB) FROM Patient JOIN Examination ON Patient.ID = Examination.ID));	thrombosis_prediction
SELECT e."aCL IgG" FROM Examination e WHERE e.ID = 3605340 AND e."Examination Date" = '1996-12-02';	thrombosis_prediction
SELECT l.T-CHO AS total_cholesterol FROM Laboratory l WHERE l.ID = 2927464 AND l.Date = '1995-09-04' AND l.T-CHO BETWEEN 150 AND 200;	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis ilike '%AORTITIS%' ORDER BY p.SEX ASC LIMIT 1;	thrombosis_prediction
SELECT e."aCL IgG", e."aCL IgM" FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Diagnosis ilike '%SLE%' AND e.ID IN (SELECT ID FROM Examination WHERE EXTRACT(YEAR FROM "Examination Date") = 1994 AND EXTRACT(MONTH FROM "Examination Date") = 2 AND EXTRACT(DAY FROM "Examination Date") = 19) AND e.ID IN (SELECT ID FROM Examination WHERE EXTRACT(YEAR FROM "Examination Date") = 1993 AND EXTRACT(MONTH FROM "Examination Date") = 11 AND EXTRACT(DAY FROM "Examination Date") = 12);	thrombosis_prediction
SELECT p.SEX, l.GPT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date = '1992-06-12' AND l.GPT = 9;	thrombosis_prediction
SELECT EXTRACT(YEAR FROM AGE(CURRENT_DATE, l.Date)) AS age FROM Laboratory l WHERE l.ID = (SELECT ID FROM Laboratory WHERE UA = 8.4 AND Date = '1991-10-21');	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.`First Date` = '1991-06-13' AND p.Diagnosis = 'SJS' AND EXTRACT(YEAR FROM l.Date) = 1995;	thrombosis_prediction
SELECT p.Description FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID IN (SELECT e.ID FROM Examination e WHERE e.Diagnosis = 'SLE' AND e.`Examination Date` = '1997-01-27') AND p.`First Date` < e.`Examination Date` ORDER BY p.`First Date` ASC LIMIT 1;	thrombosis_prediction
SELECT e.Symptoms FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday = '1959-03-01' AND e."Examination Date" = '1993-09-27';	thrombosis_prediction
SELECT (MAX(L.T-CHO) - MIN(L.T-CHO)) / NULLIF(MAX(L.T-CHO), 0) AS decrease_rate FROM Laboratory L WHERE L.ID IN (SELECT ID FROM Patient WHERE Birthday = '1959-02-18') AND EXTRACT(MONTH FROM L.Date) IN (11, 12) AND EXTRACT(YEAR FROM L.Date) = 1981;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'Behcet''s' AND e.`Examination Date` BETWEEN '1970-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 30 AND l.ALB < 4 AND l.Date BETWEEN '1987-07-06' AND '1996-01-31' ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE p.SEX = 'F' AND EXTRACT(YEAR FROM p.Birthday) = 1964 ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 2 AND e.`ANA Pattern` = 'S' AND e.`aCL IgM` > (SELECT AVG(e2.`aCL IgM`) FROM Examination e2 WHERE e2.Thrombosis = 2 AND e2.`ANA Pattern` = 'S');	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN l.UN < 10 AND l.UN > 1 THEN e.ID END) AS FLOAT) / NULLIF(COUNT(DISTINCT e.ID), 0) AS proportion FROM Examination e JOIN Laboratory l ON e.ID = l.ID;	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN p.SEX = 'M' AND EXTRACT(YEAR FROM p.`First Date`) = 1981 AND e.Diagnosis = 'BEHCET' THEN p.ID END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN p.SEX = 'M' AND EXTRACT(YEAR FROM p.`First Date`) = 1981 THEN p.ID END), 0) AS PERCENTAGE FROM Patient p JOIN Examination e ON p.ID = e.ID;	thrombosis_prediction
SELECT p.ID, p.Description FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-BIL` BETWEEN 0 AND 1.3 AND EXTRACT(MONTH FROM l.Date) = 10 AND EXTRACT(YEAR FROM l.Date) = 1991 AND l.ID IN (SELECT ID FROM Laboratory WHERE `T-BIL` IS NOT NULL);	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND EXTRACT(YEAR FROM p.Birthday) BETWEEN 1980 AND 1989 AND e.ANA IS NULL;	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'PSS' AND l.CRP = '2+' AND l.CRE = '1' AND l.LDH = '123';	thrombosis_prediction
SELECT AVG(L.ALB) AS average_albumin FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.PLT > 400 AND P.Diagnosis ilike '%SLE%';	thrombosis_prediction
SELECT e.Symptoms FROM Examination e WHERE e.Diagnosis = 'SLE' ORDER BY COUNT(e.Symptoms) DESC LIMIT 1;	thrombosis_prediction
SELECT p.`First Date`, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 48473;	thrombosis_prediction
SELECT COUNT(*) AS female_patients_with_aps FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND e.Diagnosis ilike '%APS%';	thrombosis_prediction
SELECT COUNT(*) AS number_of_patients FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.Date BETWEEN '1997-01-01' AND '1997-12-31' AND (l.ALB < 3.4 OR l.ALB > 5.2 OR l.TP < 0.8 OR l.TP > 1.2 OR l.CRP = 'elevated' OR l.CRP = 'increased');	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN e.Thrombosis > 100000 THEN p.ID END) AS FLOAT) / NULLIF(COUNT(DISTINCT p.ID), 0) AS proportion FROM Patient p JOIN Examination e ON p.ID = e.ID;	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN P.SEX = 'Female' THEN E.ID END) AS FLOAT) / NULLIF(COUNT(DISTINCT E.ID), 0) AS proportion_female FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Birthday >= '1980-01-01' AND P.Birthday < '1981-01-01' AND E.Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX ='male' AND e.Diagnosis = 'BEHCET' AND p.`First Date` BETWEEN '1995-01-01' AND '1997-12-31' AND e.Thrombosis IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.WBC < 3.5;	thrombosis_prediction
SELECT EXTRACT(epoch FROM (e.`Examination Date` - p.`First Date`))/86400 AS days_to_examination FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.ID = 821298;	thrombosis_prediction
SELECT l.UA FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.ID = 57266 AND l.Date = (SELECT MAX(l2.Date) FROM Laboratory l2 JOIN Patient p2 ON l2.ID = p2.ID WHERE p2.ID = 57266);	thrombosis_prediction
SELECT l.date FROM Laboratory l JOIN Patient p ON l.id = p.id WHERE p.id = 48473 AND l.got > 40;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, l.Date, l.GOT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date BETWEEN '1994-01-01' AND '1994-12-31' AND l.GOT BETWEEN 0 AND 45;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX ='male' AND l.GPT > 40;	thrombosis_prediction
SELECT p.Description, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > (SELECT AVG(GPT) FROM Laboratory) ORDER BY p.Birthday ASC;	thrombosis_prediction
SELECT AVG(l.LDH) FROM Laboratory l WHERE l.LDH BETWEEN 140 AND 280;	thrombosis_prediction
SELECT p.ID, EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.Birthday)) AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 300 ORDER BY age ASC;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Description, p.`First Date`, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB BETWEEN 30 AND 120;	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE p.Birthday = '1982-04-01' AND p.ID IN (SELECT l.ID FROM Laboratory l WHERE l.ID = p.ID AND l.ALB BETWEEN 30 AND 120);	thrombosis_prediction
SELECT p.ID, p.SEX, p."Birthday" FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.7;	thrombosis_prediction
SELECT p.ID, AVG(l.TP) AS average_TP, STDDEV(l.TP) AS standard_deviation FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.TP > 7.4 GROUP BY p.ID;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p WHERE p.SEX = 'Male' AND p.Birthday > (SELECT MAX(Birthday) FROM Patient) ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT p.ID, l.ALB FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE EXTRACT(YEAR FROM p.Birthday) = 1982 AND l.ALB BETWEEN 3.5 AND 5.5;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN l.ua > 5.5 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM Laboratory l JOIN Patient p ON l.id = p.id WHERE p.sex = 'female';	thrombosis_prediction
SELECT AVG(l.UA) FROM Laboratory l WHERE l.UA IS NOT NULL;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN BETWEEN 10 AND 20;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN > 100 AND l.UN IS NOT NULL AND p.Diagnosis ilike '%RA%';	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'Male' AND l.CRE > 1.2;	thrombosis_prediction
SELECT CASE WHEN SUM(CASE WHEN L.CRE > 1.4 OR L.CRE < 0.9 THEN 1 ELSE 0 END) > SUM(CASE WHEN L.CRE <= 1.4 AND L.CRE >= 0.9 THEN 1 ELSE 0 END) THEN TRUE ELSE FALSE END AS answer FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'M' UNION ALL SELECT CASE WHEN SUM(CASE WHEN L.CRE > 1.4 OR L.CRE < 0.9 THEN 1 ELSE 0 END) <= SUM(CASE WHEN L.CRE <= 1.4 AND L.CRE >= 0.9 THEN 1 ELSE 0 END) THEN TRUE ELSE FALSE END AS answer FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F';	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, MAX(l.`T-BIL`) AS max_tbilirubin FROM Patient p JOIN Laboratory l ON p.ID = l.ID GROUP BY p.ID, p.SEX, p.Birthday ORDER BY max_tbilirubin DESC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT p.SEX, COUNT(*) AS count FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis IS NOT NULL AND e.LAC IS NOT NULL GROUP BY p.SEX HAVING AVG(e.`T-BIL`) > 1 ORDER BY p.SEX NULLS LAST;	thrombosis_prediction
SELECT p.ID, MAX(l.T-CHO) FROM Patient p JOIN Laboratory l ON p.ID = l.ID GROUP BY p.ID ORDER BY p.ID DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.Birthday))) AS average_age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'Male' AND e.T-CHO > 200;	thrombosis_prediction
SELECT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG > 100;	thrombosis_prediction
SELECT COUNT(*) AS number_of_patients FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.TG > 150;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CPK <= 170;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday BETWEEN '1936-01-01' AND '1956-12-31' AND l.CPK > 150;	thrombosis_prediction
SELECT p.ID, p.SEX, EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.Birthday)) AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU NOT IN (SELECT MIN(GLU) FROM Laboratory) AND l.T_CHO IN (SELECT MAX(T_CHO) FROM Laboratory);	thrombosis_prediction
SELECT p.ID, l.GLU FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.`First Date` BETWEEN '1991-01-01' AND '1991-12-31' AND l.GLU >= 70 AND l.GLU <= 110 ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.WBC > 10000 ORDER BY p.Birthday ASC;	thrombosis_prediction
SELECT p.ID, EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.Birthday)) AS age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE RBC < 4.5 ORDER BY age ASC NULLS LAST;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Description, l.RBC FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND p.Description >= DATE '1950-01-01' AND l.RBC < 4.5 AND p.Description <= l.Date;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.HGB < 12 ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis ilike '%SLE%' AND e.HGB IS NOT NULL ORDER BY p.Birthday ASC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT p.ID, date_part('year', age(now(), p.Birthday)) AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.HCT > 45 OR l.HCT < 45 GROUP BY p.ID, date_part('year', age(now(), p.Birthday)) HAVING COUNT(l.ID) >= 2;	thrombosis_prediction
SELECT AVG(L.HCT) AS average_hematocrit FROM Laboratory L WHERE L.Date BETWEEN '1991-01-01' AND '1991-12-31' AND L.HCT < 40;	thrombosis_prediction
SELECT COUNT(CASE WHEN p.PLATELET < 150000 THEN 1 END) AS low_platelet, COUNT(CASE WHEN p.PLATELET > 450000 THEN 1 END) AS high_platelet FROM Patient p WHERE p.PLATELET IS NOT NULL;	thrombosis_prediction
SELECT p.ID, p.Description FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE EXTRACT(YEAR FROM l.Date) = 1984 AND p.Birthday < (CURRENT_DATE - interval '50 year') AND l.PLT < 150;	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN p.SEX = 'F' AND l.PT > 1 THEN p.ID END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN p.SEX = 'F' THEN p.ID END), 0) AS proportion FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE EXTRACT(YEAR FROM AGE(p.Birthday)) > 55 AND l.PT IS NOT NULL;	thrombosis_prediction
SELECT p.ID, p.Birthday, p.Description, p.First Date, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date > '1992-01-01' AND l.PT <= 1.5;	thrombosis_prediction
SELECT COUNT(*) AS number_of_examinations FROM Examination e WHERE e.`Examination Date` > '1997-01-01' AND e.RVVT = 'inactivated partial thromboplastin time';	thrombosis_prediction
SELECT COUNT(*) AS number_of_patients FROM Examination e WHERE e.APTT > 30;	thrombosis_prediction
SELECT COUNT(*) AS abnormal_fibrinogen_count FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'Male' AND l.WBC IS NOT NULL AND l.WBC > 10 AND l.FG IS NOT NULL AND (l.FG < 1 OR l.FG > 4);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday > '1980-01-01' AND l.FG < 1;	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN > 100;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis ilike '%SLE%' AND e.UA IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS number_of_patients FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.IGG < 100;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.IGG = 0 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`aCL IgA` IS NOT NULL AND e.`aCL IgA` > 0 ORDER BY e.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) AS patients_count FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.`First Date` > '1990-01-01' AND e.`aCL IgA` IS NULL;	thrombosis_prediction
SELECT p.Diagnosis, COUNT(*) AS COUNT FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.IGM > 100 GROUP BY p.Diagnosis ORDER BY COUNT DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p WHERE p.ID NOT IN (SELECT l.ID FROM Laboratory l WHERE l.CRP IS NOT NULL);	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l WHERE l.CRP IS NOT NULL AND l.CRP!= 'normal' AND l.ID IN (SELECT ID FROM Patient p WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.Birthday)) > 18);	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RF IS NOT NULL AND l.RF = 'Normal' AND l.TAT > 20;	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday > '1995-01-01' AND e.RF IS NULL;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RF IS NULL AND EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis IS NULL AND e.RF IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.C3 = 1 AND e.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`aCL IgG` IS NOT NULL ORDER BY e.`aCL IgG` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.Thrombosis = 1 AND e.C4 IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RNP = 'Normal';	thrombosis_prediction
SELECT p.Birthday FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.RNP!= 'Normal' ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.`aCL IgG` IS NOT NULL AND e.`aCL IgM` IS NOT NULL AND e.`aCL IgA` IS NOT NULL AND e.Thrombosis = (SELECT MAX(e2.Thrombosis) FROM Examination e2);	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SSb = 'abnormal' ORDER BY p.Birthday ASC NULLS LAST LIMIT 3;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`ANA Pattern` = 'Normal' AND e.`Examination Date` > '1997-01-01';	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Symptoms ilike '%vertigo%' AND e.SSA IS NULL;	thrombosis_prediction
SELECT COUNT(*) AS number_of_patients FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE LOWER(e.SSA) = 'normal' AND EXTRACT(YEAR FROM p.`First Date`) < 1990;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SSA IS NOT NULL ORDER BY p.ID ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE LOWER(e.Diagnosis) ='sle' AND LOWER(e.SSA) = 'normal';	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.SSB = 'normal' AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) AS male_count FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.CENTROMEA = 'normal' AND e.SSB = 'normal' AND p.SEX ='male';	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`DNA-II` > 0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p WHERE p.ID NOT IN (SELECT e.ID FROM Examination e WHERE e.`DNA-II` IS NOT NULL);	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`DNA-II` > 0;	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN l.GOT > 50 THEN e.ID END) AS FLOAT) / NULLIF(COUNT(DISTINCT e.ID), 0) AS proportion FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'Male' AND l.GOT >= 10 AND l.GOT <= 40;	thrombosis_prediction
SELECT MIN(P.Birthday) AS youngest_birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU > 40;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT >= 10 AND l.GPT <= 40 ORDER BY l.GPT DESC NULLS LAST LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT IS NOT NULL AND l.GPT < 40 AND p.SEX = 'M';	thrombosis_prediction
SELECT p.`First Date` FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 0 ORDER BY l.LDH DESC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT p.ID, p.Birthday, l.Date, l.LDH FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 250 ORDER BY p.ID DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB IS NOT NULL AND l.ALB > 100;	thrombosis_prediction
SELECT COUNT(*) AS number_of_patients FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALP <= 120;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 7.4;	thrombosis_prediction
SELECT COUNT(*) AS normal_protein_count FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE LOWER(p.Diagnosis) ='sjs' AND e.LAB.GLU <= 10;	thrombosis_prediction
SELECT e."Examination Date" FROM Examination e WHERE e.ALB = (SELECT MAX(e2.ALB) FROM Examination e2 WHERE e2.ALB IS NOT NULL);	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'Male' AND l.ALB > 3.5 AND l.TP > 7.0;	thrombosis_prediction
SELECT e.aCL_IgG, e.aCL_IgM, e.aCL_IgA FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.UA > 0 AND l.UA <= 7.2 ORDER BY l.UA DESC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT MAX(L.IGG) AS highest_igg FROM Laboratory L WHERE L.CRE <= 1.5;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.CRE <= 1.2 ORDER BY e.`aCL IgG` DESC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) AS number_of_patients FROM Examination e WHERE e.`T-BIL` > 1 AND e.`ANA Pattern` = 'Peripheral' AND e.`ANA` IS NOT NULL;	thrombosis_prediction
SELECT e.aCL_IgG FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.`T-BIL` = (SELECT MAX(l2.`T-BIL`) FROM Laboratory l2 WHERE l2.`T-BIL` IS NOT NULL);	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l WHERE l.T_cho < 200 AND l.TAT < 15;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.`T-CHO` BETWEEN 150 AND 250 AND e.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.TG IS NULL;	thrombosis_prediction
SELECT e.Diagnosis, MAX(l.TG) AS max_triglyceride FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.TG <= 150 GROUP BY e.Diagnosis ORDER BY max_triglyceride DESC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT e.ID FROM Examination e WHERE e.Thrombosis = 0 AND e.CPK > 150 ORDER BY e.ID NULLS LAST;	thrombosis_prediction
SELECT COUNT(*) AS patients_with_positive_coagulation FROM Laboratory l WHERE l.CPK > 100 AND l.PT > 1.5;	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU < 70 OR l.GLU > 140 ORDER BY p.Birthday ASC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) AS patients_without_thrombosis FROM Examination e WHERE e.Thrombosis IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.WBC >= 4.5 AND l.WBC <= 11.5;	thrombosis_prediction
SELECT COUNT(*) AS patients_with_normal_wbc FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis ilike '%SLE%' AND l.WBC IS NOT NULL AND l.WBC > 4.5 AND l.WBC < 11.5;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RBC > 5 AND p.Description IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.PLT > 150 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.ID, pl.PLT FROM Patient p JOIN Laboratory pl ON p.ID = pl.ID WHERE pl.PLT >= 150 AND pl.PLT <= 400 AND p.Diagnosis ilike '%MCTD%';	thrombosis_prediction
SELECT AVG(L.PT) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'Male' AND L.PT IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.Thrombosis = 1 AND e.PT IS NOT NULL AND e.PT <= 1.5;	thrombosis_prediction
SELECT m.major_name FROM member m JOIN major m1 ON m.link_to_major = m1.major_id WHERE m.last_name = 'Sanders' AND m.first_name = 'Angela';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.department = 'Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.department = 'Art and Design';	student_club
SELECT COUNT(DISTINCT m.member_id) AS number_of_students FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name ilike '%Women''s%Soccer%';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name ilike '%Women''s%Soccer%' AND m.link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Student_Club');	student_club
SELECT COUNT(*) AS number_of_students_with_medium_t_shirt FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.t_shirt_size ='medium' AND e.event_name = 'Women''s Soccer';	student_club
SELECT e.event_name, COUNT(*) AS attendance FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.link_to_major = 'Student_Club' GROUP BY e.event_id, e.event_name ORDER BY attendance DESC LIMIT 1;	student_club
SELECT m.college, m.major_name FROM member m JOIN major m2 ON m.link_to_major = m2.major_id WHERE m.position = 'Vice President' AND m2.department = 'Student_Club';	student_club
SELECT DISTINCT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE LOWER(m.first_name) ='maya' AND LOWER(m.last_name) ='mclean';	student_club
SELECT COUNT(DISTINCT a.link_to_event) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name ilike '%Student_Club%' AND e.event_date >= '2019-01-01' AND e.event_date < '2020-01-01';	student_club
SELECT COUNT(*) AS number_of_meetings FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN major m ON a.link_to_member = m.major_id WHERE m.department = 'Student_Club' AND m.college = 'College' AND e.type ='meeting' GROUP BY e.event_id HAVING COUNT(a.link_to_event) > 10;	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event GROUP BY e.event_name HAVING COUNT(a.link_to_member) > 20;	student_club
SELECT AVG(a.attendance) AS average_attendance FROM (SELECT COUNT(*) AS attendance FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE EXTRACT(YEAR FROM e.event_date::DATE) = 2020 GROUP BY a.link_to_event) AS subquery;	student_club
WITH total_spent AS (SELECT e.event_id, SUM(b.spent) AS total_spent FROM event e JOIN budget b ON e.event_id = b.link_to_event GROUP BY e.event_id) SELECT t.event_id, t.total_spent FROM total_spent t ORDER BY t.total_spent DESC LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.major_name) = 'environmental engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name ilike '%Laugh Out Loud%' AND m.link_to_major = (SELECT major_id FROM major WHERE major_name = 'Student_Club');	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE LOWER(ma.major_name) = 'law and constitutional studies';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.last_name = 'Ramsey' AND m.first_name = 'Sherri';	student_club
SELECT m.department, m.college FROM member m WHERE m.member_id ='member_1234567890';	student_club
SELECT SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT SUM(e.cost) AS total_cost FROM "expense" e JOIN "budget" b ON e.link_to_budget = b.budget_id JOIN "member" m ON b.link_to_event = m.link_to_major WHERE m.position = 'Student_Club' AND b.event_status = 'September Meeting';	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Computer Science') AND m.position = 'President of the Student_Club';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE LOWER(z.state) = 'illinois';	student_club
WITH ad_expenses AS (SELECT e.event_id, e.event_date, b.amount AS budget_amount FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name ilike '%September Meeting%' AND b.category = 'advertising' AND b.event_status = 'approved') SELECT SUM(ad_expenses.amount) AS total_advertising_spend FROM ad_expenses;	student_club
SELECT m.department FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.member_id IN ('Pierce', 'Guidi');	student_club
SELECT SUM(b.amount) FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name ilike '%October Speaker%';	student_club
SELECT e.expense_id, e.expense_description, e.approved FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event e2 ON b.link_to_event = e2.event_id WHERE e2.event_date = '2019-10-08' AND e2.type = 'Meeting' AND e.approved = 'yes';	student_club
SELECT AVG(e.cost) AS average_cost FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name ilike '%Elijah%' AND m.last_name ilike '%Allen%' AND EXTRACT(MONTH FROM e.event_date::DATE) IN (9, 10);	student_club
WITH total_2019 AS (SELECT SUM(b.spent) AS total_spent_2019 FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_date LIKE '%2019%' AND e.type = 'Student_Club'), total_2020 AS (SELECT SUM(b.spent) AS total_spent_2020 FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_date LIKE '%2020%' AND e.type = 'Student_Club') SELECT (total_2020.total_spent_2020 - total_2019.total_spent_2019) AS difference_in_total_spent;	student_club
SELECT e.location FROM event e WHERE e.event_name = 'Spring Budget Review';	student_club
SELECT SUM(e.cost) AS total_cost FROM expense e WHERE e.expense_description ilike '%Posters%' AND e.expense_date = '2019-09-04';	student_club
SELECT b.remaining FROM budget b WHERE b.category = 'Food' ORDER BY b.remaining DESC LIMIT 1;	student_club
SELECT e.notes FROM event e WHERE e.event_date = '2019-09-14' AND e.type = 'fundraising';	student_club
SELECT COUNT(DISTINCT m.major_id) FROM major m WHERE m.department = 'College of Humanities and Social Sciences';	student_club
SELECT m.phone FROM member m WHERE m.first_name = 'Carlo' AND m.last_name = 'Jacobs';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.last_name = 'O''Gallagher' AND m.first_name = 'Adela';	student_club
SELECT COUNT(*) FROM budget b WHERE b.event_status = 'exceeded' AND b.link_to_event IN (SELECT e.event_id FROM event e WHERE e.event_name = 'November Meeting');	student_club
SELECT SUM(b.amount) AS total_budget FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name ilike '%September Speaker%';	student_club
SELECT e.status FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Post Cards, Posters' AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'bought' AND b.spent > 0 AND b.remaining > 0 AND b.amount > 0 AND b.event_status = 'b	student_club
SELECT m.major_name FROM member m WHERE m.member_id = 'Brent Thomason';	student_club
SELECT COUNT(*) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.major_name) = 'human development and family studies' AND LOWER(m.t_shirt_size) = 'large';	student_club
SELECT z.type FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.last_name = 'Nielson' AND m.first_name = 'Christof';	student_club
SELECT m.major_name FROM member m JOIN "attendance" a ON m.member_id = a.link_to_member WHERE a.link_to_event = (SELECT event_id FROM event WHERE LOWER(event_name) = 'general meeting');	student_club
SELECT z.short_state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.member_id = 'Sacha Harrison';	student_club
SELECT m.department FROM member m JOIN major m2 ON m.link_to_major = m2.major_id WHERE m.position = 'President';	student_club
SELECT i.date_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name ilike '%Connor%' AND m.last_name ilike '%Hilton%' AND i.amount > 0;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = (SELECT MIN(i2.date_received) FROM income i2);	student_club
SELECT COUNT(*) AS num_times FROM budget b1, budget b2 WHERE b1.link_to_event = 'Yearly Kickoff' AND b2.link_to_event = 'October Meeting' AND b1.event_status = 'Advertisement' AND b2.event_status = 'Advertisement' AND b1.spent > b2.spent;	student_club
SELECT (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) / NULLIF(SUM(b.amount), 0)) * 100 AS percentage FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_date LIKE '%November%';	student_club
SELECT SUM(e.cost) AS total_cost FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense e2 ON b.link_to_event = e2.link_to_budget WHERE e2.expense_description ilike '%pizza%' AND e2.approved = 'TRUE';	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE LOWER(state) = 'va' AND LOWER(county) = 'orange';	student_club
SELECT m.department FROM major m WHERE m.department IN (SELECT d.department FROM major d JOIN member m ON d.major_id = m.link_to_major WHERE m.link_to_major IS NOT NULL AND m.link_to_major IS NOT NULL) AND m.department NOT IN (SELECT d.department FROM major d JOIN member m ON d.major_id = m.link_to_major WHERE m.link_to_major IS NULL) ORDER BY m.department NULLS LAST;	student_club
SELECT m.city FROM member m WHERE m.last_name = 'Firth' AND m.first_name = 'Amy';	student_club
WITH min_remaining AS (SELECT link_to_event, MIN(remaining) AS min_remaining FROM budget GROUP BY link_to_event) SELECT e.event_name, e.event_date, e.location, e.notes, e.status, e.type, b.amount AS budget_amount, b.spent, b.remaining, b.event_status FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN min_remaining mr ON b.link_to_event = mr.link_to_event WHERE b.remaining = mr.min_remaining ORDER BY e.event_date DESC NULLS LAST;	student_club
SELECT DISTINCT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name ilike '%October Meeting%';	student_club
SELECT m.department, COUNT(*) AS number_of_members FROM member m GROUP BY m.department ORDER BY number_of_members DESC NULLS LAST LIMIT 1;	student_club
SELECT m.major_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.phone = '809-555-3360';	student_club
WITH MaxBudget AS (SELECT b.link_to_event, MAX(b.amount) AS max_amount FROM budget b GROUP BY b.link_to_event) SELECT e.event_name, mb.max_amount FROM event e JOIN MaxBudget mb ON e.event_id = mb.link_to_event ORDER BY mb.max_amount DESC NULLS LAST LIMIT 1;	student_club
SELECT e.expense_description, e.cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE LOWER(m.position) = 'vice president';	student_club
SELECT COUNT(DISTINCT a.link_to_member) AS number_of_members FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name ilike '%Women''s%Soccer%';	student_club
SELECT i.date_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name ilike '%Casey%' AND m.last_name ilike '%Mason%';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE LOWER(z.state) ='md';	student_club
SELECT COUNT(DISTINCT a.link_to_event) FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.phone = '954-555-6240';	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.department = 'School of Applied Sciences, Technology and Education' ORDER BY m.member_id NULLS LAST;	student_club
SELECT e.event_id, SUM(b.spent) / NULLIF(SUM(b.amount), 0) AS spend_to_budget_ratio FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'closed' GROUP BY e.event_id ORDER BY spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m WHERE LOWER(m.position) = 'president';	student_club
SELECT MAX(b.spent) AS highest_spent FROM budget b;	student_club
SELECT COUNT(*) AS total_meetings FROM event e WHERE e.event_name ilike '%meeting%' AND e.event_date >= '2020-01-01' AND e.event_date < '2021-01-01';	student_club
SELECT SUM(e.cost) AS total_cost FROM expense e WHERE e.expense_description ilike '%food%';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.first_name, m.last_name HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Georgetown' AND z.state = 'South Carolina';	student_club
SELECT SUM(i.amount) AS total_income FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name ilike '%Grant%' AND m.last_name ilike '%Gilmour%';	student_club
WITH total_income AS (SELECT m.member_id, SUM(i.amount) AS total_income FROM member m JOIN income i ON m.member_id = i.link_to_member GROUP BY m.member_id) SELECT t.member_id FROM total_income t WHERE t.total_income > 40;	student_club
SELECT SUM(e.cost) AS total_cost FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE LOWER(e.event_name) = 'yearly kickoff';	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff' AND a.link_to_event = e.event_id AND m.link_to_major IN (SELECT major_id FROM major WHERE department = 'Finance');	student_club
SELECT m.first_name, m.last_name, i.source, SUM(i.amount) AS total_income FROM income i JOIN member m ON i.link_to_member = m.member_id GROUP BY m.first_name, m.last_name, i.source ORDER BY total_income DESC LIMIT 1;	student_club
SELECT e.event_name, e.event_date, e.location, e.status FROM event e JOIN "expense" ex ON e.event_id = ex.link_to_event WHERE ex.cost = (SELECT MIN(cost) FROM "expense");	student_club
SELECT SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN e.notes ELSE 0 END)::FLOAT / NULLIF(SUM(e.notes), 0) AS proportion FROM event e;	student_club
SELECT CAST(COUNT(DISTINCT m.major_id) AS FLOAT) / NULLIF(COUNT(DISTINCT m2.major_id), 0) AS ratio FROM major m JOIN member m2 ON m.major_id = m2.link_to_major WHERE m.major_name = 'Finance' OR m.major_name = 'Physics';	student_club
SELECT i.source, SUM(i.amount) AS total_amount FROM income i WHERE i.date_received LIKE '%2019-09%' GROUP BY i.source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, m.email FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.department = 'Student_Club' AND m.position = 'Secretary';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.major_name) = 'physics teaching';	student_club
SELECT COUNT(DISTINCT a.link_to_member) AS number_of_members FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name ilike '%Community Theater%' AND e.event_date LIKE '%2019%';	student_club
SELECT COUNT(a.link_to_event) AS number_of_events_attended, m.major_name FROM "attendance" a JOIN "member" m ON a.link_to_member = m.member_id WHERE m.last_name = 'Guidi' AND m.first_name = 'Luisa' GROUP BY m.major_name;	student_club
SELECT AVG(b.spent) AS average_spent FROM budget b WHERE b.event_status = 'done' AND b.category = 'food';	student_club
SELECT e.event_name, SUM(b.spent) AS total_spent FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'advertising' GROUP BY e.event_name ORDER BY total_spent DESC NULLS LAST LIMIT 1;	student_club
SELECT m.member_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE LOWER(m.first_name) ='may' AND LOWER(m.last_name) ='mclean' AND LOWER(e.event_name) = 'women''s soccer';	student_club
SELECT CAST(COUNT(CASE WHEN e.type = 'Community Service' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM event e WHERE e.event_date LIKE '%2019%' AND e.type = 'Community Service';	student_club
SELECT SUM(e.cost) AS total_cost FROM "expense" e JOIN "budget" b ON e.link_to_budget = b.budget_id JOIN event e2 ON b.link_to_event = e2.event_id WHERE e2.event_name ilike '%September Speaker%';	student_club
SELECT m.t_shirt_size, COUNT(*) AS total_orders FROM member m GROUP BY m.t_shirt_size ORDER BY total_orders DESC LIMIT 1;	student_club
SELECT e.event_name, e.event_date FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.event_status = 'closed' AND b.spent > b.amount ORDER BY (b.spent - b.amount) DESC LIMIT 1;	student_club
SELECT e.expense_description, SUM(e.cost) AS total_cost FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_date = 'October Meeting' AND b.event_status = 'approved' GROUP BY e.expense_description;	student_club
SELECT b.category, b.amount FROM budget b WHERE b.link_to_event = 'April Speaker' ORDER BY b.amount ASC;	student_club
SELECT b.link_to_event, b.amount FROM budget b WHERE b.category = 'Food' ORDER BY b.amount DESC NULLS LAST LIMIT 1;	student_club
SELECT b.link_to_event, SUM(b.amount) AS total_amount FROM budget b WHERE b.category = 'Advertising' GROUP BY b.link_to_event ORDER BY total_amount DESC LIMIT 3;	student_club
SELECT SUM(e.cost) AS total_cost FROM expense e WHERE e.expense_description = 'Parking';	student_club
SELECT SUM(e.cost) AS total_cost FROM expense e WHERE e.expense_date = '8/20/2019';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_member = e.link_to_member WHERE m.member_id ='rec4BLdZHS2Blfp4v' GROUP BY m.first_name, m.last_name;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.last_name = 'Harrison' AND m.first_name = 'Sacha';	student_club
SELECT e.expense_description, e.expense_date, e.cost FROM "expense" e JOIN "member" m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large' ORDER BY e.expense_date DESC;	student_club
SELECT m.zip FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount < 50 ORDER BY m.zip NULLS LAST;	student_club
SELECT m.major_name FROM member m JOIN link_to_major l ON m.member_id = l.link_to_member WHERE m.last_name = 'Cullen' AND first_name = 'Phillip';	student_club
SELECT m.position FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE LOWER(ma.department) = 'business';	student_club
SELECT COUNT(*) FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE LOWER(m.t_shirt_size) ='medium' AND LOWER(z.city) = 'business';	student_club
SELECT DISTINCT e.event_name, b.event_status, b.remaining FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30 ORDER BY e.event_name NULLS LAST;	student_club
SELECT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215';	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_date = '2020-03-24T12:00:00';	student_club
SELECT m.major_name FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE m.position = 'Vice President';	student_club
SELECT CAST(COUNT(DISTINCT m.link_to_major) filter (WHERE m.link_to_major = 'Mathematics') AS FLOAT) / NULLIF(COUNT(DISTINCT m.link_to_major), 0) AS proportion FROM member m;	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215';	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) AS total_members_with_large_t_shirt FROM member WHERE t_shirt_size = 'Extra Large';	student_club
SELECT COUNT(DISTINCT m.major_id) FROM major m WHERE m.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, m.department, m.college FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.department = 'Environmental Engineering' ORDER BY m.last_name NULLS LAST;	student_club
SELECT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215' AND b.event_status = 'guest speaker' AND b.spent = 0;	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Electrical and Computer Engineering' ORDER BY z.city ASC, z.state ASC;	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.position = 'Vice President' AND m.link_to_major IN (SELECT major_id FROM major WHERE department = 'Student_Club') AND m.zip IN (SELECT zip_code FROM zip_code WHERE city = 'Eugene' AND state = 'OR');	student_club
SELECT m.last_name, m.position FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_date = '2019-09-10' AND e.type = 'pizza';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.type = 'women''s soccer' ORDER BY m.last_name NULLS LAST;	student_club
SELECT CAST(SUM(CASE WHEN m.t_shirt_size = 'Medium' THEN i.amount ELSE 0 END) AS FLOAT) / NULLIF(SUM(i.amount), 0) AS proportion FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.link_to_major = 'Student_Club' AND i.amount = 50;	student_club
SELECT z.state FROM zip_code z WHERE z.type = 'Post Office Box' ORDER BY z.state;	student_club
SELECT DISTINCT z.zip_code FROM zip_code z WHERE z.city = 'San Juan' AND z.state = 'Puerto Rico' AND z.type = 'Post Office Box';	student_club
SELECT e.event_name FROM event e WHERE e.type = 'game' AND e.status = 'closed' AND e.event_date >= '2019-03-15' AND e.event_date <= '2020-03-20';	student_club
SELECT e.event_id, m.member_id FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 50;	student_club
SELECT m.member_id, m.first_name, m.last_name, e.event_name, a.link_to_event FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE to_date(e.event_date, 'YYYY-MM-DD') BETWEEN '2019-01-10' AND '2019-11-19' AND a.link_to_event IN (SELECT link_to_event FROM expense WHERE approved = 'Yes');	student_club
SELECT m.department FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Katy' AND ma.major_id ='rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.department = 'Business' AND mjr.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT DISTINCT m.email FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN budget b ON a.link_to_event = b.link_to_event WHERE b.spent > 20 AND b.event_status = 'paid' AND b.event_date BETWEEN '2019-09-10' AND '2019-11-19';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.department = 'Education' AND mjr.college = 'Education & Human Services';	student_club
SELECT CAST(SUM(CASE WHEN b.spent > b.amount THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS fraction_of_events_over_budget FROM budget b;	student_club
SELECT e.event_id, e.location, e.status FROM event e WHERE e.event_date BETWEEN '2019-11-01' AND '2020-03-31' ORDER BY e.event_id NULLS LAST;	student_club
SELECT e.expense_id, AVG(e.cost) AS average_cost FROM expense e GROUP BY e.expense_id HAVING AVG(e.cost) > 50 ORDER BY average_cost DESC NULLS LAST;	student_club
SELECT m.first_name, m.last_name FROM member m WHERE m.t_shirt_size = 'Extra Large';	student_club
SELECT CAST(COUNT(DISTINCT CASE WHEN z.type = 'PO Box' THEN z.zip_code END) AS FLOAT) / NULLIF(COUNT(DISTINCT z.zip_code), 0) AS fraction_of_po_boxes FROM zip_code z;	student_club
SELECT e.event_name, e.location FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.amount > b.spent ORDER BY e.event_name NULLS LAST;	student_club
SELECT e.event_name, e.event_date FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN expense ex ON a.link_to_member = ex.link_to_member WHERE ex.expense_description ilike '%pizza%' AND ex.cost > 50 AND ex.cost < 100 ORDER BY e.event_name NULLS LAST;	student_club
WITH total_expenses AS (SELECT m.member_id, m.first_name, m.last_name, m.link_to_major, SUM(e.cost) AS total_cost FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event WHERE e.approved = 'yes' GROUP BY m.member_id, m.first_name, m.last_name, m.link_to_major) SELECT te.member_id, te.first_name, te.last_name, te.link_to_major FROM total_expenses te WHERE te.total_cost > 100;	student_club
SELECT z.city, z.state FROM event e JOIN zip_code z ON e.location = z.city WHERE e.event_id IN (SELECT a.link_to_event FROM attendance a GROUP BY a.link_to_event HAVING COUNT(a.link_to_member) > 40) ORDER BY z.city NULLS LAST;	student_club
SELECT m.member_id, SUM(e.cost) AS total_cost FROM "expense" e JOIN "attendance" a ON e.link_to_event = a.link_to_event JOIN "member" m ON a.link_to_member = m.member_id GROUP BY m.member_id HAVING COUNT(DISTINCT e.link_to_event) > 1 ORDER BY total_cost DESC NULLS LAST LIMIT 1;	student_club
SELECT AVG(e.cost) FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position!='member';	student_club
SELECT e.event_name, e.event_date FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.spent < (SELECT AVG(b2.spent) FROM budget b2);	student_club
SELECT SUM(CASE WHEN e.type = 'game' THEN e.notes::FLOAT ELSE 0 END) / NULLIF(SUM(e.notes::FLOAT), 0) AS fraction FROM event e;	student_club
SELECT b.link_to_event, SUM(b.amount) AS total_amount FROM budget b WHERE b.category IN ('water', 'chips', 'cookies') GROUP BY b.link_to_event ORDER BY total_amount DESC NULLS LAST LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM "expense" e JOIN member m ON e.link_to_member = m.member_id GROUP BY m.first_name, m.last_name ORDER BY total_spent DESC NULLS LAST LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_budget WHERE e.cost > (SELECT AVG(e2.cost) FROM expense e2);	student_club
SELECT (COUNT(DISTINCT CASE WHEN m.zip IN (207, 802) THEN m.member_id END)::FLOAT / NULLIF(COUNT(DISTINCT m.member_id), 0) - 1) * 100 AS percentage FROM member m WHERE m.zip IN (207, 802);	student_club
SELECT m.major_name, m.department FROM member m JOIN major m ON m.member_id ='member_1' ORDER BY m.department NULLS LAST;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.expense_description IN ('water','veggie tray','supplies') GROUP BY m.first_name, m.last_name;	student_club
SELECT m.last_name, m.phone FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.department = 'Elementary Education' ORDER BY m.last_name ASC;	student_club
SELECT b.category, b.amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name ilike '%January Speaker%';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT b.category FROM budget b JOIN expense e ON b.link_to_event = e.link_to_budget WHERE e.expense_description ilike '%Posters%';	student_club
SELECT m.first_name, m.last_name, m.link_to_major FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE m.position = 'Secretary' AND mjr.department = 'Business' ORDER BY m.first_name NULLS LAST;	student_club
SELECT e.event_name, SUM(b.amount) AS total_amount_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category ='speaker gifts' GROUP BY e.event_name;	student_club
SELECT z.city FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.member_id = 'Garrett Girke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND z.zip_code = 28092;	student_club
SELECT COUNT(*) FROM gasstations gs JOIN products p ON gs.chainid = p.productid WHERE LOWER(gs.country) = 'cze' AND LOWER(p.description) = 'premium';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(SUM(CASE WHEN c.Currency = 'CZK' THEN 1 ELSE 0 END), 0) AS ratio FROM customers c;	debit_card_specializing
SELECT c.CustomerID, y.Date, y.Consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date BETWEEN '2012-01-01' AND '2012-12-31' AND c.Segment = 'LAM' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT ym.Date, AVG(ym.Consumption) AS average_consumption FROM "yearmonth" ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND EXTRACT(YEAR FROM ym.Date) = 2013 GROUP BY ym.Date ORDER BY ym.Date ASC;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '2011-01-01' AND '2011-12-31' GROUP BY c.CustomerID ORDER BY total_consumption DESC;	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN "yearmonth" y ON c.CustomerID = y.CustomerID WHERE y.Date LIKE '2012%' AND y.Consumption < 30000;	debit_card_specializing
SELECT ym.Date, SUM(CASE WHEN c.Currency = 'CZK' THEN ym.Consumption ELSE 0 END) AS czech_consumption, SUM(CASE WHEN c.Currency = 'EUR' THEN ym.Consumption ELSE 0 END) AS euro_consumption FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE ym.Date BETWEEN '2012-01-01' AND '2012-12-31' GROUP BY ym.Date ORDER BY ym.Date;	debit_card_specializing
SELECT y.Date, SUM(y.Consumption) AS total_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY y.Date ORDER BY total_consumption DESC NULLS LAST LIMIT 1;	debit_card_specializing
SELECT ym.Date, ym.Consumption FROM "yearmonth" ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = (SELECT ym.Date, ym.Consumption FROM "yearmonth" ym JOIN customers c ON ym.CustomerID = c.CustomerID GROUP BY ym.Date, c.Segment ORDER BY SUM(ym.Consumption) ASC LIMIT 1);	debit_card_specializing
SELECT ym.Date, SUM(ym.Consumption) AS total_consumption FROM "yearmonth" ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'CZK' GROUP BY ym.Date ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT ym.Date, SUM(ym.Consumption) AS total_consumption FROM "yearmonth" ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND EXTRACT(YEAR FROM ym.Date) = 2013 GROUP BY ym.Date ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT ym.CustomerID, ym.Date, (SELECT AVG(y2.Consumption) FROM "yearmonth" y2 WHERE y2.CustomerID = ym.CustomerID AND y2.Date = '2013') AS avg_consumption_2013 FROM "yearmonth" ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'CZK' ORDER BY avg_consumption_2013 NULLS LAST;	debit_card_specializing
WITH segment_2012 AS (SELECT c.CustomerID, SUM(t.Amount) AS total_amount_2012 FROM customers c JOIN "transactions_1k" t ON c.CustomerID = t.CustomerID WHERE c.Currency = 'EUR' AND EXTRACT(YEAR FROM t.Date) = 2012 GROUP BY c.CustomerID), segment_2013 AS (SELECT c.CustomerID, SUM(t.Amount) AS total_amount_2013 FROM customers c JOIN "transactions_1k" t ON c.CustomerID = t.CustomerID WHERE c.Currency = 'EUR' AND EXTRACT(YEAR FROM t.Date) = 2013 GROUP BY c.CustomerID) SELECT s.Segment, ((s2013.total_amount_2013 - s2012.total_amount_2012) / NULLIF(s2012.total_amount_2012, 0)) * 100 AS percentage_increase FROM segment_2012 s2012 JOIN segment_2013 s ON s2012.CustomerID = s.CustomerID JOIN customers c ON s2012.CustomerID = c.CustomerID ORDER BY percentage_increase DESC NULLS LAST LIMIT 1, 1;	debit_card_specializing
SELECT SUM(y.Consumption) AS total_consumption FROM "yearmonth" y WHERE y.CustomerID = 6 AND y.Date BETWEEN '2013-08-01' AND '2013-11-30';	debit_card_specializing
SELECT g.Country, COUNT(*) AS num_stations FROM gasstations g WHERE g.Country IN ('Czech Republic', 'Slovakia') GROUP BY g.Country HAVING g.Country = 'Czech Republic' AND g.Country = 'Slovakia' ORDER BY g.Country;	debit_card_specializing
SELECT ym.CustomerID, ym.Date, ym.Consumption - LAG(ym.Consumption) OVER (PARTITION BY ym.CustomerID ORDER BY ym.Date) AS consumption_difference FROM yearmonth AS ym WHERE ym.CustomerID IN (5, 7) AND ym.Date = '2013-04-01';	debit_card_specializing
SELECT s.segment, COUNT(*) FROM customers c JOIN "yearmonth" y ON c.customerid = y.customerid WHERE c.currency = 'CZK' OR c.currency = 'EUR' GROUP BY s.segment HAVING COUNT(*) > 0;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'Euro' AND y.Date = '2013-10' ORDER BY y.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM customers c JOIN "yearmonth" y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY total_consumption DESC NULLS LAST LIMIT 1;	debit_card_specializing
SELECT SUM(y.Consumption) AS total_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'KAM' AND y.Date = '2013-05-01';	debit_card_specializing
SELECT CAST(COUNT(*) FILTER (WHERE y.Consumption > 46.73) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'LAM';	debit_card_specializing
SELECT g.Country, COUNT(g.GasStationID) AS num_gas_stations FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Amount = t.Price GROUP BY g.Country ORDER BY num_gas_stations DESC NULLS LAST;	debit_card_specializing
SELECT CAST(COUNT(DISTINCT CASE WHEN c.Currency = 'EUR' THEN t.CustomerID END) AS FLOAT) / NULLIF(COUNT(DISTINCT t.CustomerID), 0) AS proportion FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID;	debit_card_specializing
SELECT CAST(COUNT(*) filter (WHERE y.Consumption > 528.3) AS FLOAT) / NULLIF(COUNT(*), 0) AS fraction FROM "yearmonth" y WHERE y.Date LIKE '2012-02-%';	debit_card_specializing
SELECT CAST(COUNT(DISTINCT gs.ChainID) filter (WHERE gs.Segment = 'Premium') AS FLOAT) / NULLIF(COUNT(DISTINCT gs.ChainID), 0) AS proportion FROM gasstations gs WHERE gs.Country = 'Slovakia';	debit_card_specializing
SELECT y.CustomerID, SUM(y.Consumption) AS total_consumption FROM "yearmonth" y WHERE y.Date LIKE '2013-09-%' GROUP BY y.CustomerID ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS total_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date LIKE '%2013-09%' GROUP BY c.Segment ORDER BY total_consumption ASC LIMIT 1;	debit_card_specializing
SELECT y.Date, y.CustomerID, y.Consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date LIKE '2012-06%' AND c.Segment = 'SME' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT ym.Date, ym.Consumption FROM yearmonth ym WHERE ym.Date LIKE '2012%' ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT y.Date, MAX(y.Consumption) AS max_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR GROUP BY y.Date ORDER BY max_consumption DESC;	debit_card_specializing
SELECT p.Description FROM "transactions_1k" t JOIN products p ON t.ProductID = p.ProductID WHERE t.Date BETWEEN '2013-09-01' AND '2013-09-30';	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE EXTRACT(MONTH FROM t.Date) = 6 AND EXTRACT(YEAR FROM t.Date) = 2013;	debit_card_specializing
SELECT DISTINCT gs.ChainID FROM "transactions_1k" t JOIN gasstations gs ON t.GasStationID = gs.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT p.description FROM products p JOIN transactions_1k t ON p.productid = t.productid WHERE t.price >= 1.00;	debit_card_specializing
SELECT AVG(t.Price) AS average_price FROM "transactions_1k" t JOIN "yearmonth" y ON t.CustomerID = y.CustomerID AND EXTRACT(YEAR FROM t.Date) = 2012 AND EXTRACT(MONTH FROM t.Date) = 1;	debit_card_specializing
SELECT COUNT(*) FROM customers c JOIN "yearmonth" y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000;	debit_card_specializing
SELECT p.description FROM products p JOIN "transactions_1k" t ON p.product_id = t.product_id JOIN gasstations g ON t.gasstationid = g.gasstationid WHERE g.country = 'Czech Republic' ORDER BY p.description NULLS LAST;	debit_card_specializing
SELECT EXTRACT(EPOCH FROM t.time) AS transaction_time FROM "transactions_1k" t JOIN gasstations gs ON t.gasstationid = gs.gasstationid WHERE gs.chainid = 11;	debit_card_specializing
SELECT COUNT(*) FROM "transactions_1k" t JOIN gasstations gs ON t.GasStationID = gs.GasStationID WHERE gs.Country = 'Czech Republic' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*) AS number_of_transactions FROM "transactions_1k" t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'Czech Republic' AND t.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(t.price) AS average_price FROM transactions_1k t JOIN gasstations g ON t.gasstationid = g.gasstationid WHERE g.country = 'Czech Republic';	debit_card_specializing
SELECT AVG(t.Price) AS average_price FROM "transactions_1k" t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'Euro';	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount) AS Total_Amount FROM "transactions_1k" t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-25' GROUP BY c.CustomerID ORDER BY Total_Amount DESC LIMIT 1;	debit_card_specializing
SELECT g.country, t.customerid FROM gasstations g JOIN transactions_1k t ON g.gasstationid = t.gasstationid WHERE t.date = '2012-08-25' ORDER BY g.country NULLS LAST LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM "transactions_1k" t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Time = '16:25:00' AND EXTRACT(YEAR FROM t.Date) = 2012;	debit_card_specializing
SELECT c.Segment FROM customers c JOIN "transactions_1k" t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00' ORDER BY c.Segment;	debit_card_specializing
SELECT COUNT(*) FROM "transactions_1k" t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' AND EXTRACT(YEAR FROM t.Date) = 2012 AND EXTRACT(MONTH FROM t.Date) = 8 AND EXTRACT(DAY FROM t.Date) = 26 AND EXTRACT(HOUR FROM t.Time) BETWEEN 0 AND 11;	debit_card_specializing
SELECT c.Segment FROM customers c ORDER BY c.CustomerID ASC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM "transactions_1k" t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00';	debit_card_specializing
SELECT t.ProductID FROM "transactions_1k" t WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT t.Date, t.Amount, y.Date AS year_month, SUM(t.Amount) OVER (PARTITION BY y.Date ORDER BY y.Date) AS cumulative_sum FROM "transactions_1k" t JOIN yearmonth y ON t.CustomerID = y.CustomerID AND t.Date = y.Date WHERE t.Date BETWEEN '2012-01-01' AND '2012-01-31' AND t.Amount = 124.05;	debit_card_specializing
SELECT COUNT(*) FROM "transactions_1k" t JOIN gasstations gs ON t.GasStationID = gs.GasStationID WHERE t.time >= '08:00' AND t.time <= '09:00' AND gs.country = 'CZE' AND date(t.date) = '2012-08-26';	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '2013-06-01' AND y.Consumption = 214582.17;	debit_card_specializing
SELECT g.country FROM gasstations g JOIN "transactions_1k" t ON g.gasstationid = t.gasstationid WHERE t.cardid = 667467;	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '2012-08-24' AND c.CustomerID IN (SELECT t.CustomerID FROM transactions_1k t WHERE t.Amount = 548.4);	debit_card_specializing
SELECT CAST(COUNT(DISTINCT c.CustomerID) filter (WHERE c.Currency = 'EUR') AS FLOAT) / NULLIF(COUNT(DISTINCT c.CustomerID), 0) AS proportion FROM customers c WHERE c.CustomerID IN (SELECT y.CustomerID FROM yearmonth y WHERE y.Date = '2012-08-25');	debit_card_specializing
WITH y1 AS (SELECT ym.CustomerID, SUM(ym.Consumption) AS c12 FROM yearmonth ym WHERE ym.Date LIKE '2012%' GROUP BY ym.CustomerID), y2 AS (SELECT ym.CustomerID, SUM(ym.Consumption) AS c13 FROM yearmonth ym WHERE ym.Date LIKE '2013%' GROUP BY ym.CustomerID) SELECT (c13 - c12) / NULLIF(c12, 0) AS consumption_decrease_rate FROM y1 JOIN y2 ON y1.CustomerID = y2.CustomerID WHERE y1.CustomerID IN (SELECT t.CustomerID FROM transactions_1k t WHERE t.Amount = 634.8);	debit_card_specializing
WITH total_revenue AS (SELECT ts.GasStationID, SUM(ts.Amount) AS total_amount FROM "transactions_1k" ts GROUP BY ts.GasStationID) SELECT tr.GasStationID, tr.total_amount FROM total_revenue tr ORDER BY tr.total_amount DESC LIMIT 1;	debit_card_specializing
SELECT CAST(COUNT(DISTINCT CASE WHEN c.Segment = 'premium' THEN g.GasStationID END) AS FLOAT) / NULLIF(COUNT(DISTINCT g.GasStationID), 0) AS proportion FROM gasstations g JOIN customers c ON g.ChainID = c.CustomerID WHERE g.Country = 'SVK' AND c.Segment IS NOT NULL;	debit_card_specializing
SELECT SUM(t.amount) AS total_spent FROM transactions_1k t WHERE t.customerid = 38508; SELECT SUM(t.amount) AS total_spent_in_jan_2012 FROM transactions_1k t JOIN yearmonth y ON t.customerid = y.customerid AND EXTRACT(MONTH FROM t.date) = 1 AND EXTRACT(YEAR FROM t.date) = 2012 WHERE t.customerid = 38508;	debit_card_specializing
SELECT p.description, SUM(t.amount) AS total_sales FROM products p JOIN "transactions_1k" t ON p.productid = t.productid GROUP BY p.description ORDER BY total_sales DESC LIMIT 5;	debit_card_specializing
WITH total_spend AS (SELECT c.CustomerID, SUM(t.Amount) AS TotalAmount FROM "transactions_1k" t JOIN customers c ON t.CustomerID = c.CustomerID GROUP BY c.CustomerID), max_spend AS (SELECT ts.CustomerID, ts.TotalAmount FROM total_spend ts ORDER BY ts.TotalAmount DESC LIMIT 1), avg_price AS (SELECT t.ProductID, t.Price FROM "transactions_1k" t JOIN max_spend ms ON t.CustomerID = ms.CustomerID GROUP BY t.ProductID), avg_price_per_product AS (SELECT p.ProductID, AVG(ap.Price) AS AvgPrice FROM avg_price ap GROUP BY p.ProductID) SELECT c.Currency, ms.TotalAmount, appp.AvgPrice FROM max_spend ms JOIN customers c ON ms.CustomerID = c.CustomerID JOIN avg_price_per_product appp ON ms.CustomerID = appp.ProductID;	debit_card_specializing
SELECT gs.Country, p.Description, MAX(t.Price) AS MaxPrice FROM "transactions_1k" t JOIN products p ON t.ProductID = p.ProductID JOIN gasstations gs ON t.GasStationID = gs.GasStationID WHERE p.ProductID = 2 GROUP BY gs.Country, p.Description ORDER BY MaxPrice DESC LIMIT 1;	debit_card_specializing
SELECT y.Date, y.Consumption FROM "yearmonth" y JOIN "transactions_1k" t ON y.CustomerID = t.CustomerID AND y.Date = to_date(t.Time, 'DD-Mon-YYYY') WHERE t.ProductID = 5 AND t.Price > 29.00 AND to_date(t.Time, 'DD-Mon-YYYY') >= '2012-08-01' AND to_date(t.Time, 'DD-Mon-YYYY') < '2012-09-01' ORDER BY y.Date NULLS LAST;	debit_card_specializing
