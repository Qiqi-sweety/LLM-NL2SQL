SELECT MAX(free_meal_count_k12 / NULLIF(enrollment_k12, 0)) AS max_free_rate FROM frpm WHERE county_name = 'Alameda';	california_schools
SELECT f.CDSCode, f.School Name, f.District Name, f.County Name, f.Percentage(%) Eligible Free (Ages 5-17) FROM frpm f ORDER BY f.Percentage(%) Eligible Free (Ages 5-17) ASC LIMIT 3;	california_schools
SELECT s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Fresno' AND f."Charter School (Y/N)" = 1;	california_schools
SELECT s.MailStreet, s.MailCity, s.MailState, s.MailZip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.District Code = (SELECT f.District Code FROM frpm f ORDER BY f.FRPM Count (K-12) DESC LIMIT 1);	california_schools
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f."Charter School (Y/N)" = 1 AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM satscores s WHERE s.Virtual = 'F' AND s.AvgScrMath < 400;	california_schools
SELECT s.CDSCode, s.School FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.NumTstTakr > 500 AND s.Magnet = 1 ORDER BY s.CDSCode;	california_schools
SELECT s.phone FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.IRC = 1 ORDER BY s.NumTstTakr DESC LIMIT 1;	california_schools
WITH frpm_rank AS (SELECT f.CDSCode, f.FRPM_Count_K_12 AS frpm_count FROM frpm f ORDER BY f.FRPM_Count_K_12 DESC LIMIT 10) SELECT s.NumTstTakr FROM frpm_rank fr JOIN satscores s ON fr.CDSCode = s.cds;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM satscores s WHERE s.AvgScrMath > 560 AND s.rtype = 'Directly funded';	california_schools
WITH highest_avg_score AS (SELECT s.cds FROM satscores s WHERE s.rtype = 'SAT' ORDER BY s.AvgScrRead DESC LIMIT 1) SELECT f.frpm_count_ages_5_17 FROM frpm f JOIN highest_avg_score h AS ha ON f.cds = ha.cds;	california_schools
SELECT f.CDSCode FROM frpm f WHERE (f.`Enrollment (K-12)` + f.`Enrollment (Ages 5-17)` > 500);	california_schools
SELECT MAX(free_meal_count / enrollment) AS max_free_meal_rate FROM frpm WHERE cds IN (SELECT s.cds FROM satscores s WHERE s.avg_scr_read > 1500 AND s.avg_scr_math > 1500 AND s.avg_scr_write > 1500);	california_schools
SELECT s.phone FROM satscores s ORDER BY s.AvgScrWrite DESC, s.AvgScrMath DESC, s.AvgScrRead DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, SUM(f.Enrollment (Ages 5-17)) AS total_enrollment FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode GROUP BY s.NCESSchool ORDER BY total_enrollment DESC LIMIT 5;	california_schools
SELECT d.District, AVG(s.AvgScrRead) AS avg_reading_score FROM satscores s JOIN frpm f ON s.CDS = f.CDSCode JOIN schools s1 ON f.District Code = s1.NCESDist WHERE s1.StatusType = 'Active' GROUP BY d.District ORDER BY avg_reading_score DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm f JOIN satscores s ON f.CDSCode = s.cds WHERE f."County Name" = 'Alameda' AND s.NumTstTakr < 100;	california_schools
SELECT s.CharterNum FROM satscores s WHERE s.AvgScrWrite = 499;	california_schools
SELECT COUNT(*) FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE s.NumTstTakr <= 250 AND sc.County = 'Contra Costa' AND sc.FundingType = 'Directly funded';	california_schools
SELECT s.phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds ORDER BY ss.AvgScrMath DESC NULLS LAST LIMIT 1;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Amador' AND f.LowGrade = '9' AND f.HighGrade = '12';	california_schools
SELECT COUNT(*) FROM frpm f WHERE f.COUNTY CODE = 'Los Angeles' AND f.FREE MEAL COUNT (K-12) > 500 AND f.FREE MEAL COUNT (K-12) < 700;	california_schools
SELECT s.School, MAX(t.NumTstTakr) AS Max_Test_Takers FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores t ON f.CDSCode = t.cds WHERE s.County = 'Contra Costa' GROUP BY s.School;	california_schools
SELECT s.school, s.street, s.streetabr, s.city, s.zip, s.state, s.phone, s.ext, s.website, s.opendate, s.closeddate, s.charter, s.charternum, s.fundingtype, s.doc, s.doctype, s.soc, s.sotype, s.edopscode, s.edopsname, s.eilcode, s.eilname, s.gsoffered, s.gserved, s.virtual, s.magnet, s.latitude, s.longitude, s.admfname1, s.admlname1, s.admemail1, s.admfname2, s.admlname2, s.admemail2, s.admfname3, s.admlname3, s.admemail3, s.lastupdate, (s.enrollment(k-12) - s.enrollment(ages 5-17)) AS enrollment_difference FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE (s.enrollment(k-12) - s.enrollment(ages 5-17)) > 30;	california_schools
SELECT s.School, s.District, s.County, frpm.Percent_ Eligible_Free_K_12 FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode WHERE frpm.Percent_Eligible_Free_K_12 > 0.1 AND s.AvgScrWrite >= 1500;	california_schools
WITH avg_math AS (SELECT s.CDSCode, AVG(s.AvgScrMath) AS avg_math FROM satscores s GROUP BY s.CDSCode) SELECT s.School, s.FundingType FROM schools s JOIN avg_math am ON s.CDSCode = am.CDSCode WHERE am.avg_math > 400;	california_schools
SELECT s.CDSCode, s.School, s.Street, s.City, s.Zip, s.State FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.District Code = 10021 AND f.Low Grade = '9' AND f.High Grade = '12' AND f.Percent (%) Eligible Free (Ages 5-17) > 0.8;	california_schools
WITH school_details AS (SELECT s.CDSCode, s.School, s.Phone, AVG(t.AvgScrWrite) AS avg_write_score FROM schools s JOIN satscores t ON s.CDSCode = t.cds WHERE (s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01') GROUP BY s.CDSCode, s.School, s.Phone) SELECT sd.School, sd.avg_write_score, sd.Phone FROM school_details sd ORDER BY sd.School NULLS LAST;	california_schools
WITH avg_diff AS (SELECT AVG(f.Enrollment (K-12) - f.Enrollment (Ages 5-17)) AS avg_diff FROM frpm f WHERE f.Chartier School (Y/N) = 0) SELECT s.School, s.DOCType FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.Chartier School (Y/N) = 0 AND (f.Enrollment (K-12) - f.Enrollment (Ages 5-17)) > (SELECT avg_diff FROM avg_diff);	california_schools
SELECT s.LastUpdate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Low Grade` = 'K' AND f.`High Grade` = '12' ORDER BY f.`Enrollment (K-12)` DESC NULLS LAST LIMIT 1;	california_schools
SELECT s.City, MIN(f.Enrollment (K-12)) AS Min_Enrollment FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode GROUP BY s.City ORDER BY Min_Enrollment ASC LIMIT 5;	california_schools
WITH ranked_schools AS (SELECT s.CDSCode, s.School, s.Enrollment (K-12) AS enrollment, RANK() OVER (ORDER BY s.Enrollment (K-12) DESC) AS rank FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.Low Grade = '1' AND f.High Grade = '12') SELECT rs.School, rs.enrollment, frpm.Percent (%) Eligible Free (K-12) AS eligible_free_rate FROM ranked_schools rs JOIN frpm ON rs.CDSCode = frpm.CDSCode WHERE rs.rank <= 10;	california_schools
SELECT s.CDSCode, s.School, s.District, s.County, (frpm.FRPM_Count_K_12 / NULLIF(frpm.Enrollment_K_12, 0)) AS Eligible_Free_Or_Reduced_Price_Meal_Rate FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode WHERE frpm.District_Type = '66' ORDER BY frpm.FRPM_Count_K_12 DESC NULLS LAST LIMIT 5;	california_schools
SELECT s.CDSCode, s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.Free Meal Count (Ages 5-17) BETWEEN 1900 AND 2000;	california_schools
SELECT (f.`Free Meal Count (Ages 5-17)` / NULLIF(f.`Enrollment (Ages 5-17)`, 0)) AS eligible_free_rate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 ilike '%Kacey%' AND s.AdmLName1 ilike '%Gibson%';	california_schools
SELECT s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f."Charter School (Y/N)" = 1 ORDER BY f."Enrollment (K-12)" ASC NULLS LAST LIMIT 1;	california_schools
SELECT s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3 FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores t ON s.CDSCode = t.cds WHERE t.NumGE1500 IS NOT NULL ORDER BY t.NumGE1500 DESC LIMIT 1;	california_schools
SELECT s.Street, s.City, s.State, s.Zip FROM satscores s WHERE s.NumTstTakr > 0 ORDER BY s.NumGE1500 / NULLIF(s.NumTstTakr, 0) ASC LIMIT 1;	california_schools
SELECT s.Website FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.IRC BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(s.NumTstTakr) AS average_test_takers FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.OpenDate BETWEEN '1980-01-01' AND '1980-12-31' AND sc.County = 'Fresno';	california_schools
SELECT s.phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.district = 'Fresno Unified' ORDER BY ss.AvgScrRead ASC LIMIT 1;	california_schools
SELECT s.CDSCode, s.School, AVG(ss.AvgScrRead) AS avg_reading_score FROM satscores ss JOIN schools s ON ss.CDS = s.CDSCode WHERE s.Virtual = 'F' GROUP BY s.CDSCode, s.School ORDER BY avg_reading_score DESC LIMIT 5;	california_schools
WITH math_scores AS (SELECT s.CDSCode, s.School, s.District, s.County, s.SchoolType, AVG(t.AvgScrMath) AS AvgMath FROM schools s JOIN frpm t ON s.CDSCode = t.CDSCode GROUP BY s.CDSCode, s.School, s.District, s.County, s.SchoolType) SELECT ms.School, ms.District, ms.County, ms.SchoolType, ms.AvgMath FROM math_scores ms ORDER BY ms.AvgMath DESC LIMIT 1;	california_schools
SELECT AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) AS average_score, s.cname FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE s.cds = (SELECT s.cds FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode GROUP BY s.cds ORDER BY AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) ASC LIMIT 1);	california_schools
SELECT AVG(s.AvgScrWrite) AS average_writing_score, s.cname AS school_city FROM satscores s WHERE s.NumTstTakr = (SELECT MAX(s2.NumTstTakr) FROM satscores s2 WHERE s2.NumGE1500 >= 1500) GROUP BY s.cname;	california_schools
SELECT s.School, AVG(ss.AvgScrWrite) AS avg_write_score FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmlName1 ilike '%Ricci%Ulrich%' GROUP BY s.School ORDER BY avg_write_score NULLS LAST;	california_schools
SELECT s.cname, SUM(f.enrollment (k-12)) AS total_enrollment FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.DOC = '31' GROUP BY s.cname ORDER BY total_enrollment DESC NULLS LAST LIMIT 1;	california_schools
SELECT (COUNT(*)/12.0) AS avg_monthly_openings FROM schools WHERE County = 'Alameda' AND StatusType = 'Open' AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31' AND DOC = '52';	california_schools
SELECT CAST(COUNT(DISTINCT CASE WHEN s.DOC = '54' THEN s.CDSCode END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN s.DOC = '52' THEN s.CDSCode END), 0) AS ratio FROM schools s WHERE s.County = 'Orange';	california_schools
SELECT s.County, s.School, s.ClosedDate FROM schools s WHERE s.StatusType = 'Closed' ORDER BY COUNT(s.CDSCode) DESC NULLS LAST;	california_schools
SELECT s.Street FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath IS NOT NULL ORDER BY ss.AvgScrMath DESC NULLS LAST LIMIT 1 OFFSET 5;	california_schools
SELECT s.MailStreet, s.MailCity FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrRead IS NOT NULL ORDER BY ss.AvgScrRead ASC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) AS total_schools FROM satscores s JOIN schools sc ON s.CDSCode = sc.CDSCode WHERE (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) >= 1500 AND sc.MailCity = 'Lakeport';	california_schools
SELECT SUM(s.NumTstTakr) AS total_test_takers FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.MailCity = 'Fresno';	california_schools
SELECT s.School, s.MailZip FROM schools s WHERE s.AdmFName1 ilike '%Avetik%Atoian%' OR s.AdmLName1 ilike '%Avetik%Atoian%' OR s.AdmFName2 ilike '%Avetik%Atoian%' OR s.AdmLName2 ilike '%Avetik%Atoian%' OR s.AdmFName3 ilike '%Avetik%Atoian%' OR s.AdmLName3 ilike '%Avetik%Atoian%';	california_schools
SELECT CAST(COUNT(CASE WHEN s.County = 'Colusa' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN s.County = 'Humboldt' THEN 1 END), 0) AS ratio FROM schools s WHERE s.MailState = 'California' AND s.County IN ('Colusa', 'Humboldt');	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s WHERE LOWER(s.MailState) = 'ca' AND LOWER(s.StatusType) = 'active';	california_schools
SELECT s.Phone, s.Ext FROM satscores s JOIN schools st ON s.cds = st.CDSCode ORDER BY s.AvgScrWrite DESC NULLS LAST LIMIT 1 OFFSET 332;	california_schools
SELECT s.Phone, s.Ext, s.School FROM schools s WHERE s.Zip = '95203-3704';	california_schools
SELECT s.Website FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.AdmFName1 ilike '%Mike Larson%' OR s.AdmFName2 ilike '%Mike Larson%' OR s.AdmFName3 ilike '%Mike Larson%' OR s.AdmLName1 ilike '%Mike Larson%' OR s.AdmLName2 ilike '%Mike Larson%' OR s.AdmLName3 ilike '%Mike Larson%' OR s.AdmFName1 ilike '%Dante Alvarez%' OR s.AdmFName2 ilike '%Dante Alvarez%' OR s.AdmFName3 ilike '%Dante Alvarez%' OR s.AdmLName1 ilike '%Dante Alvarez%' OR s.AdmLName2 ilike '%Dante Alvarez%' OR s.AdmLName3 ilike '%Dante Alvarez%';	california_schools
SELECT s.Website FROM schools s WHERE s.Virtual = 'P' AND s.Charter = 1 AND s.City = 'San Joaquin';	california_schools
SELECT COUNT(*) FROM schools s WHERE s.City = 'Hickman' AND s.DOC = '52' AND s.Charter = 1;	california_schools
SELECT COUNT(*) FROM frpm f WHERE f.`Charter School (Y/N)` = 0 AND f.`County Name` = 'Los Angeles' AND f.`Percent (%) Eligible Free (K-12)` < 0.18;	california_schools
SELECT s.School, s.City, s.AdmFName1, s.AdmLName1, s.AdmEmail1, s.AdmFName2, s.AdmLName2, s.AdmEmail2, s.AdmFName3, s.AdmLName3, s.AdmEmail3 FROM schools s WHERE s.Charter = 1 AND s.CharterNum = '00D2';	california_schools
SELECT COUNT(*) AS total_schools FROM schools s WHERE s.MailCity = 'Hickman' AND s.CharterNum = '00D4';	california_schools
SELECT (COUNT(DISTINCT CASE WHEN s.FundingType = 'Locally funded' THEN s.CDSCode END)::FLOAT / NULLIF(COUNT(DISTINCT s.FundingType), 0)) * 100 AS percentage FROM schools s WHERE s.County = 'Santa Clara';	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s WHERE s.County = 'Stanislaus' AND s.FundingType = 'Directly Funded' AND s.OpenDate BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT SUM(s.ClosingDate - s.OpenDate) AS total_days_open FROM schools s WHERE s.City = 'San Francisco' AND s.StatusType = 'Community College' AND s.ClosedDate IS NOT NULL AND EXTRACT(YEAR FROM s.ClosedDate) = 1989;	california_schools
SELECT s.County, COUNT(s.CDSCode) AS total_closures FROM schools s WHERE s.StatusType = 'Closed' AND s.OpenDate BETWEEN '1980-01-01' AND '1989-12-31' AND s.SOC = '11' GROUP BY s.County ORDER BY total_closures DESC NULLS LAST LIMIT 1;	california_schools
SELECT s.NCESDist FROM schools s WHERE s.SOC = '31';	california_schools
SELECT COUNT(*) FROM schools s WHERE s.StatusType = 'Community Day School' AND s.County = 'Alpine';	california_schools
SELECT d.District FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.Virtual IS NOT NULL AND s.Virtual!= '' AND s.Magnet = 0 AND s.City = 'Fresno';	california_schools
SELECT SUM(s.enroll12) AS total_students FROM schools s JOIN frpm f ON s.cdscode = f.cdscode WHERE s.edopscode = 'SSS' AND s.city = 'Fremont' AND f.`Academic Year` = '2014-2015' AND f.`Low Grade` = '5' AND f.`High Grade` = '17';	california_schools
SELECT SUM(f.RPMCountAges517) AS total_rpm_count FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.MailStreet = 'PO Box 1040' AND s.Virtual = 'Yes';	california_schools
SELECT MIN(f.LOW_GRADE) AS lowest_grade FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.EdOpsCode = 'SPECON' AND s.NCESDist = '613360';	california_schools
SELECT s.School, f.Educational Option Type FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.District Code = '37' AND f.Breakfast Provision 2 IS NOT NULL;	california_schools
SELECT s.City FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.'School Type' = 'High Schools (Public)' AND f.'Low Grade' = '9' AND f.'High Grade' = '12' AND f.'Educational Option Type' = 'Breakfast Provision 2' AND s.County = 'Merced';	california_schools
SELECT s.CDSCode, s.School FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND (f.Low Grade = 'K' AND f.High Grade = '9') AND f.Percent (%) Eligible FRPM (Ages 5-17) IS NOT NULL;	california_schools
SELECT s.School, s.GradeSpan FROM schools s WHERE s.City = 'Adelanto' ORDER BY s.GradeSpan DESC NULLS LAST LIMIT 1;	california_schools
SELECT s.County, COUNT(s.CDSCode) AS num_schools FROM schools s WHERE s.Virtual = 'F' AND s.County BETWEEN 'San Diego' AND 'Santa Barbara' GROUP BY s.County ORDER BY num_schools DESC NULLS LAST LIMIT 1;	california_schools
SELECT s.School, s.Latitude FROM schools s ORDER BY s.Latitude DESC LIMIT 1;	california_schools
SELECT s.city, s.school, s.lowest_grade FROM (SELECT frpm.CDSCode, s.city, s.school, MIN(frpm.Low_Grade) AS lowest_grade FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode WHERE s.State = 'CA' GROUP BY frpm.CDSCode, s.city, s.school) AS subquery ORDER BY subquery.lowest_grade ASC LIMIT 1;	california_schools
SELECT s.GSoffered FROM schools s WHERE s.Longitude = (SELECT MAX(s2.Longitude) FROM schools s2);	california_schools
WITH magnet_k8 AS (SELECT s.CDSCode, s.School, s.City FROM schools s WHERE s.Magnet = 1 AND s.StatusType = 'Open' AND s.GradeRange = 'K-8') SELECT COUNT(DISTINCT m.CDSCode) AS num_schools, COUNT(DISTINCT m.City) AS num_cities FROM magnet_k8 m GROUP BY m.City;	california_schools
WITH admin_names AS (SELECT s.CDSCode, s.District, s.School, s.AdmFName1, s.AdmFName2, s.AdmFName3 FROM schools s) SELECT an.District, an.School, an.AdmFName1, COUNT(*) AS count FROM admin_names an WHERE an.AdmFName1 IS NOT NULL AND an.AdmFName2 IS NULL AND an.AdmFName3 IS NULL GROUP BY an.District, an.School, an.AdmFName1 ORDER BY count DESC LIMIT 2;	california_schools
SELECT s.District Code, CAST(f.`Free Meal Count (K-12)` AS FLOAT) / NULLIF(f.`Enrollment (K-12)`, 0) * 100 AS Percent Eligible Free FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 ILIKE '%Alusine%' OR s.AdmFName2 ILIKE '%Alusine%' OR s.AdmFName3 ILIKE '%Alusine%';	california_schools
SELECT s.admlname3, s.district, s.county, s.school FROM schools s WHERE s.charternum = '40';	california_schools
SELECT s.AdmEmail1, s.AdmEmail2, s.AdmEmail3 FROM schools s WHERE s.County = 'San Bernardino' AND s.District = 'San Bernardino City Unified' AND s.StatusType = 'Open' AND s.OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND s.SOC = '62' AND s.DOC = '54';	california_schools
WITH test_takers AS (SELECT s.CDSCode, COUNT(st.NumTstTakr) AS total_takers FROM frpm f JOIN satscores st ON f.CDSCode = st.CDSCode GROUP BY s.CDSCode) SELECT t.CDSCode, s.sname, s.cname, s.dname, t.total_takers FROM test_takers t JOIN schools s ON t.CDSCode = s.CDSCode ORDER BY t.total_takers DESC LIMIT 1; SELECT s.AdmlEmail1 FROM schools s WHERE s.CDSCode = (SELECT CDSCode FROM test_takers ORDER BY total_takers DESC LIMIT 1);	california_schools
SELECT COUNT(*) FROM account a JOIN trans t ON a.account_id = t.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'POPLATEK PO OBRATU' AND d.A3 ilike '%Východní Čechy%';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 ilike '%Prague%';	financial
SELECT '1995' AS YEAR, AVG(a12) AS average_unemployment FROM district WHERE a12 IS NOT NULL UNION SELECT '1996' AS YEAR, AVG(a13) AS average_unemployment FROM district WHERE a13 IS NOT NULL ORDER BY average_unemployment DESC NULLS LAST LIMIT 1;	financial
SELECT COUNT(DISTINCT d.district_id) FROM district d JOIN account a ON d.district_id = a.district_id JOIN client c ON a.account_id = c.client_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' AND d.A11 > 6000 AND d.A11 < 10000;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000;	financial
WITH female_clients AS (SELECT c.client_id, c.birth_date, d.A11 FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F'), oldest_client AS (SELECT fc.client_id, fc.birth_date FROM female_clients fc ORDER BY fc.birth_date ASC LIMIT 1), youngest_client AS (SELECT fc.client_id, fc.birth_date FROM female_clients fc ORDER BY fc.birth_date DESC LIMIT 1), avg_salary_range AS (SELECT oc.client_id, d.A11 AS avg_salary FROM oldest_client oc JOIN district d ON oc.client_id = d.district_id UNION ALL SELECT yc.client_id, d.A11 AS avg_salary FROM youngest_client yc JOIN district d ON yc.client_id = d.district_id) SELECT (SELECT MAX(avg_salary) FROM avg_salary_range) - (SELECT MIN(avg_salary) FROM avg_salary_range) AS gap_in_avg_salary FROM avg_salary_range;	financial
WITH cte AS (SELECT a.account_id, c.birth_date, d.A11 AS avg_salary, RANK() OVER (ORDER BY c.birth_date ASC, d.A11 DESC) AS rank FROM account a JOIN client c ON a.district_id = c.district_id JOIN disp d ON a.account_id = d.account_id) SELECT account_id FROM cte WHERE rank = 1;	financial
SELECT COUNT(*) FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.frequency = 'POPLATEK TYDNE' AND c.gender = 'Owner';	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.date, a.frequency, l.amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.date >= '1997-01-01' AND a.date < '1998-01-01' AND a.frequency = 'POPLATEK TYDNE' ORDER BY l.amount ASC LIMIT 5;	financial
SELECT a.account_id, a.date, l.amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND EXTRACT(YEAR FROM a.date) = 1993 ORDER BY l.amount DESC NULLS LAST;	financial
SELECT COUNT(*) FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 ilike '%Slokolov%';	financial
SELECT a.account_id FROM account a WHERE EXTRACT(YEAR FROM a.date) = 1995 ORDER BY a.date ASC LIMIT 1;	financial
SELECT a.account_id, a.date, a.frequency FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.date < '1997-01-01' AND l.amount > 3000;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.issued = '1994-03-03';	financial
SELECT a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14';	financial
SELECT a.district_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date = '1994-08-25';	financial
SELECT MAX(t.amount) AS max_amount FROM account a JOIN client c ON a.district_id = c.district_id JOIN disp d ON a.account_id = d.account_id JOIN card cd ON d.disp_id = cd.disp_id JOIN trans t ON a.account_id = t.account_id WHERE c.birth_date = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id ORDER BY c.birth_date ASC, d.A11 DESC LIMIT 1;	financial
SELECT t.account_id, t.date, t.amount FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.account_id = (SELECT l.account_id FROM loan l ORDER BY l.amount DESC LIMIT 1);	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON c.district_id = d.district_id WHERE d.A2 ilike '%Jesenik%' AND c.gender = 'F';	financial
SELECT d.disp_id FROM account a JOIN trans t ON a.account_id = t.account_id JOIN disp d ON a.account_id = d.account_id WHERE t.amount = 5100 AND EXTRACT(YEAR FROM t.date) = 1998 AND EXTRACT(MONTH FROM t.date) = 9 AND EXTRACT(DAY FROM t.date) = 2;	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Litomerice' AND EXTRACT(YEAR FROM a.date) = 1996;	financial
SELECT d.A2 FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM client c JOIN account a ON c.client_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = 98832 AND EXTRACT(YEAR FROM l.date) = 1996 AND EXTRACT(MONTH FROM l.date) = 1 AND EXTRACT(DAY FROM l.date) = 3;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 ilike '%Prague%' ORDER BY c.client_id ASC LIMIT 1;	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender = 'M' THEN c.client_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.client_id), 0) * 100 AS percentage_of_male FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'South Bohemia';	financial
SELECT ((MAX(t.balance) - MIN(t.balance)) / NULLIF(MIN(t.balance), 0)) * 100 AS percentage_change FROM trans t WHERE t.account_id IN (SELECT d.account_id FROM disp d JOIN client c ON d.client_id = c.client_id WHERE c.birth_date BETWEEN '1993-07-05' AND '1993-07-05') AND t.date BETWEEN '1993-03-22' AND '1998-12-27';	financial
SELECT (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) / NULLIF(SUM(l.amount), 0)) * 100 AS percentage FROM loan l;	financial
SELECT (SUM(CASE WHEN l.status = 'C' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage_running FROM loan l WHERE l.amount < 100000;	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date > '1993-01-01' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, COUNT(a.account_id) AS frequency FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.date BETWEEN '1995-01-01' AND '2000-12-31' AND c.gender ='male' AND c.district_id IN (SELECT district_id FROM district WHERE A2 = 'Východní Čechy') GROUP BY a.account_id ORDER BY frequency DESC NULLS LAST;	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 ilike '%Prachatice%';	financial
SELECT d.A2 AS district, d.A3 AS region FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2, d.A3 FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3 AS district, d.A11 AS avg_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.account_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE l.duration = 60;	financial
SELECT d.A3, ((d.A13 - d.A12) / NULLIF(d.A12, 0)) * 100 AS unemployment_rate_increase FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE l.status = 'D' AND EXTRACT(YEAR FROM l.date) BETWEEN 1995 AND 1996;	financial
SELECT CAST(COUNT(CASE WHEN d.A2 = 'Decin' AND EXTRACT(YEAR FROM a.date) = 1993 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS proportion FROM account a JOIN district d ON a.district_id = d.district_id;	financial
SELECT a.account_id FROM account a WHERE a.frequency = 'POPLATEK MESICNE';	financial
SELECT d.A2, COUNT(*) AS female_count FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_count DESC NULLS LAST LIMIT 10;	financial
SELECT d.A2, SUM(t.amount) AS total_withdrawal FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND a.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawal DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT a.account_id) AS number_of_accounts FROM account a JOIN client c ON a.district_id = c.district_id LEFT JOIN disp d ON a.account_id = d.account_id WHERE c.district_id IN (SELECT district_id FROM district WHERE A3 = 'South Bohemia') AND d.account_id IS NULL;	financial
SELECT d.A3 FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'C' GROUP BY d.A3 ORDER BY COUNT(l.loan_id) DESC NULLS LAST LIMIT 1;	financial
SELECT AVG(l.amount) AS average_loan_amount FROM loan l JOIN client c ON l.account_id = c.client_id WHERE c.gender = 'M';	financial
SELECT d.A2, d.A3, d.A4, d.A5, d.A6, d.A7, d.A8, d.A9, d.A10, d.A11, d.A12, d.A13 FROM district d ORDER BY d.A13 DESC NULLS LAST;	financial
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A16 = (SELECT MAX(d.A16) FROM district d);	financial
SELECT COUNT(*) FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.operation = 'VYBER KARTOU' AND a.frequency = 'POPLATEK MESICNE' AND t.balance < 0;	financial
SELECT COUNT(DISTINCT a.account_id) AS number_of_accounts FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND l.amount >= 250000 AND a.date BETWEEN '1995-01-01' AND '1997-12-31';	financial
SELECT COUNT(*) AS number_of_accounts FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.district_id = 1 AND l.status IN ('C', 'D');	financial
SELECT COUNT(c.client_id) FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.gender = 'M' AND a.date = '1995-01-01' ORDER BY a.frequency DESC LIMIT 1;	financial
SELECT COUNT(*) AS number_of_cards FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'gold';	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 ilike '%Pisek%';	financial
SELECT d.A2, COUNT(t.trans_id) AS transaction_count FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE EXTRACT(YEAR FROM t.date) = 1997 AND t.amount > 10000 GROUP BY d.A2 ORDER BY transaction_count DESC NULLS LAST;	financial
SELECT a.account_id FROM account a JOIN `order` o ON a.account_id = o.account_id WHERE o.k_symbol = 'SIPO';	financial
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.account_id = c.card_id WHERE c.type IN ('gold', 'junior') GROUP BY a.account_id HAVING COUNT(DISTINCT c.type) = 2;	financial
SELECT AVG(t.amount) AS average_amount FROM trans t WHERE t.account_id IN (SELECT d.account_id FROM disp d JOIN client c ON d.client_id = c.client_id WHERE c.birth_date BETWEEN '1990-01-01' AND '1999-12-31') AND t.date BETWEEN '2021-01-01' AND '2021-12-31' AND t.operation = 'VYBER KARTOU';	financial
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.operation = 'VYBER KARTOU' AND EXTRACT(YEAR FROM t.date) = 1998 AND t.amount < (SELECT AVG(t2.amount) FROM trans t2 WHERE t2.operation = 'VYBER KARTOU' AND EXTRACT(YEAR FROM t2.date) = 1998);	financial
SELECT a.account_id, a.date, c.gender FROM account a JOIN client c ON a.district_id = c.district_id JOIN disp d ON a.account_id = d.account_id JOIN card cd ON d.disp_id = cd.disp_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 LIKE '%South Bohemia%';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Tabor' AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT a.frequency FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency!= 'OWNER' AND d.A11 BETWEEN 8000 AND 9000;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.district_id IN (SELECT district_id FROM district WHERE A3 LIKE '%North Bohemia%') AND t.bank LIKE '%AB%';	financial
SELECT d.A2 FROM account a JOIN trans t ON a.account_id = t.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(A15) FROM district WHERE A3 IN (SELECT A3 FROM account WHERE date >= '1997-01-01') AND A15 > 4000;	financial
SELECT COUNT(DISTINCT c.card_id) FROM card c JOIN account a ON c.disp_id = a.account_id WHERE c.type = 'classic' AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A2 = 'Hl.m. Praha' AND c.gender = 'M';	financial
SELECT (COUNT(CASE WHEN c.type = 'Gold' AND c.issued < '1998-01-01' THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage FROM card c;	financial
SELECT c.client_id, c.gender FROM client c JOIN account a ON c.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id ORDER BY l.amount DESC NULLS LAST LIMIT 1;	financial
SELECT a.district_id, d.A15 AS num_crimes FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.account_id = 1 AND EXTRACT(YEAR FROM a.date) = 1995;	financial
SELECT a.district_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 33333;	financial
SELECT t.amount FROM trans t JOIN client c ON t.account_id = c.client_id WHERE c.client_id = 3356 AND t.operation = 'VYBER';	financial
SELECT COUNT(*) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT c.type FROM client cl JOIN disp d ON cl.client_id = d.client_id JOIN card c ON d.account_id = c.card_id WHERE cl.client_id = 13539;	financial
SELECT d.A3 FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = 3541;	financial
SELECT d.district_id, COUNT(l.loan_id) AS number_of_loans FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE l.status = 'A' GROUP BY d.district_id ORDER BY number_of_loans DESC NULLS LAST LIMIT 1;	financial
SELECT c.client_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 32423;	financial
SELECT t.trans_id, t.date, t.type, t.amount, t.balance FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5 ORDER BY t.trans_id NULLS LAST;	financial
SELECT COUNT(*) AS number_of_accounts FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.district_id = 18;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.date >= '1997-01-01' AND d.type = 'credit';	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender = 'F' THEN c.client_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT a.account_id), 0) AS proportion FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE d.A11 > 10000;	financial
SELECT ((SUM(CASE WHEN EXTRACT(YEAR FROM l.date) = 1997 THEN l.amount ELSE 0 END) - SUM(CASE WHEN EXTRACT(YEAR FROM l.date) = 1996 THEN l.amount ELSE 0 END)) / NULLIF(SUM(CASE WHEN EXTRACT(YEAR FROM l.date) = 1996 THEN l.amount ELSE 0 END), 0)) * 100 AS growth_rate FROM loan l JOIN client c ON l.account_id = c.client_id WHERE c.gender = 'M';	financial
SELECT COUNT(*) FROM trans t WHERE t.operation = 'VYBER KARTOU' AND t.date > '1995-12-31';	financial
SELECT (SELECT A16 FROM district WHERE A3 = 'North Bohemia') - (SELECT A16 FROM district WHERE A3 = 'East Bohemia') AS difference_in_crimes;	financial
SELECT COUNT(DISTINCT c.client_id) AS client_dispositions, COUNT(DISTINCT d.disp_id) AS disp_dispositions FROM account a JOIN client c ON a.district_id = c.district_id JOIN disp d ON a.account_id = d.account_id WHERE a.account_id BETWEEN 1 AND 10;	financial
SELECT COUNT(*) AS number_of_statements, SUM(CASE WHEN t.type = 'debit' AND t.amount = 3539 THEN 1 ELSE 0 END) AS number_of_debits FROM trans t WHERE t.account_id = 3;	financial
SELECT EXTRACT(YEAR FROM c.birth_date) AS birth_year FROM client c WHERE c.client_id = 130;	financial
SELECT COUNT(*) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT SUM(l.amount) AS total_debt, SUM(l.payments) AS total_payments FROM loan l JOIN account a ON l.account_id = a.account_id WHERE a.account_id IN (SELECT c.client_id FROM client c WHERE c.client_id = 992);	financial
SELECT SUM(t.amount) AS total_amount, c.gender FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.client_id = c.client_id WHERE t.trans_id = 851 AND a.account_id IN (SELECT a.account_id FROM account a JOIN client cl ON a.client_id = cl.client_id WHERE cl.client_id = 4);	financial
SELECT c.type FROM client cl JOIN disp d ON cl.client_id = d.client_id JOIN card c ON d.account_id = c.card_id WHERE cl.client_id = 9;	financial
SELECT SUM(t.amount) AS total_amount FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.client_id = 617 AND EXTRACT(YEAR FROM t.date) = 1998;	financial
SELECT c.client_id FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT c.client_id, l.loan_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC NULLS LAST LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.account_id JOIN loan l ON a.account_id = l.account_id JOIN trans t ON a.account_id = t.account_id WHERE c.gender = 'M' AND EXTRACT(YEAR FROM c.birth_date) BETWEEN 1974 AND 1976 AND l.status = 'SIPO' AND t.amount > 4000;	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Beroun' AND a.date > '1996-12-31';	financial
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.disp_id = cd.disp_id WHERE c.gender = 'F' AND cd.type = 'junior credit card';	financial
SELECT (COUNT(DISTINCT CASE WHEN c.gender = 'F' THEN c.client_id END)::FLOAT / NULLIF(COUNT(DISTINCT c.client_id), 0)) * 100 AS proportion_female FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 ilike '%Prague%' AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender = 'M' AND a.frequency = 'POPLATEK TYDNE' THEN a.account_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN a.frequency = 'POPLATEK TYDNE' THEN a.account_id END), 0) * 100 AS percentage_of_male_clients;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT a.account_id, a.date, l.amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date + interval '24 months' > CURRENT_DATE AND a.date < '1997-01-01' ORDER BY l.amount ASC NULLS LAST;	financial
SELECT a.account_id FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.gender = 'F' ORDER BY c.birth_date ASC, a.A11 ASC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE EXTRACT(YEAR FROM c.birth_date) = 1920 AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(*) AS number_of_accounts FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.duration = 24;	financial
SELECT AVG(l.amount) AS average_loan_amount FROM loan l JOIN account a ON l.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE l.status = 'C' AND t.type = 'POPLATEK PO OBRATU';	financial
SELECT c.client_id, d.district_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK MESICNE';	financial
SELECT c.client_id, (EXTRACT(YEAR FROM age(CURRENT_DATE, c.birth_date))) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.account_id = cd.disp_id WHERE cd.type = 'gold' AND cd.issued <= '1997-12-31' AND cd.issued >= '1980-01-01';	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC NULLS LAST LIMIT 1;	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'cl' AND m.label = '-';	toxicology
SELECT AVG(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT AVG(DIVIDE(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END), COUNT(c.atom_id))) AS average_single_bonded_carcinogenic_molecules FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-';	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT DIVIDE(SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END), COUNT(a.atom_id)) AS percentage FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'double';	toxicology
SELECT COUNT(*) FROM bond b WHERE b.bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom a WHERE a.element!= 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT a.molecule_id FROM atom a WHERE a.element ='si';	toxicology
SELECT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE c.bond_id = 'TR004_8_9'; UNION SELECT a.element FROM connected c JOIN atom a ON c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN connected c2 ON a.atom_id = c2.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'double';	toxicology
SELECT m.label, COUNT(*) AS count_label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY count_label DESC NULLS LAST LIMIT 1;	toxicology
SELECT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'te';	toxicology
SELECT DISTINCT a.atom_id, a2.atom_id AS connected_atom FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT a.atom_id, a2.atom_id AS connected_atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
WITH element_counts AS (SELECT a.element, COUNT(*) AS count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY a.element) SELECT element FROM element_counts ORDER BY count ASC LIMIT 1;	toxicology
SELECT c.bond_id, b.bond_type FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a1.atom_id = 'TR000_8' AND a2.atom_id = 'TR000_20';	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element!='sn' AND m.label NOT IN ('+', '-');	toxicology
SELECT COUNT(*) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('i','s') AND b.bond_type = '-';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR181';	toxicology
SELECT (COUNT(CASE WHEN a.element!= 'f' THEN 1 END)::FLOAT / NULLIF(COUNT(a.element), 0)) * 100 AS percentage FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT DIVIDE(SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END), COUNT(b.bond_id)) AS percent FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR000' GROUP BY a.element ORDER BY a.element LIMIT 3;	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.atom_id IN (SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR001') AND c.atom_id2 IN (SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR001') AND b.bond_id = 'TR001_2_6';	toxicology
SELECT SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN m.label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule m;	toxicology
SELECT c.atom_id FROM connected c WHERE c.bond_id = 'TR_000_2_5';	toxicology
SELECT b.bond_id FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.atom_id = 'TR000_2' AND c.atom_id2 = a.atom_id;	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = 'double' ORDER BY m.label NULLS LAST LIMIT 5;	toxicology
SELECT DIVIDE(SUM(CASE WHEN b.bond_type = 'double' THEN 1 ELSE 0 END), COUNT(b.bond_id)) AS percent FROM bond b WHERE b.molecule_id = 'TR008';	toxicology
SELECT DIVIDE(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END), COUNT(molecule_id)) AS percent FROM molecule;	toxicology
SELECT DIVIDE(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END), COUNT(a.atom_id)) AS percent FROM atom a WHERE a.molecule_id = 'TR206';	toxicology
SELECT b.bond_type FROM bond b WHERE b.molecule_id = 'TR000';	toxicology
SELECT a.element, m.label FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON c.atom_id = m.molecule_id WHERE m.molecule_id = 'TR060';	toxicology
SELECT b.bond_type, COUNT(b.bond_type) AS bond_count FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id WHERE a.molecule_id = 'TR018' GROUP BY b.bond_type ORDER BY bond_count DESC LIMIT 1;SELECT m.label FROM molecule m WHERE m.molecule_id = 'TR018';	toxicology
SELECT m.label FROM molecule m JOIN atom a1 ON m.molecule_id = a1.molecule_id JOIN atom a2 ON a1.molecule_id = a2.molecule_id JOIN connected c ON (a1.atom_id = c.atom_id AND a2.atom_id = c.atom_id2) JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-' GROUP BY m.label ORDER BY m.label ASC LIMIT 3;	toxicology
SELECT b.bond_type FROM bond b WHERE b.molecule_id = 'TR006' ORDER BY b.bond_type ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected c WHERE (c.atom_id = 'TR009_12' OR c.atom_id2 = 'TR009_12') AND c.molecule_id = 'TR009';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'br' AND m.label = '+';	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_id = 'TR001_6_9';	toxicology
SELECT a.molecule_id, CASE WHEN m.label = '+' THEN 'carcinogenic' ELSE 'not carcinogenic' END AS carcinogenic FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT b.molecule_id) FROM bond b WHERE b.bond_type = '#';	toxicology
SELECT COUNT(c.bond_id) AS number_of_connections FROM connected c WHERE c.atom_id = 'TR000_19';	toxicology
SELECT DISTINCT a.element FROM atom a WHERE a.molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a WHERE a.atom_id BETWEEN 'TR000_21' AND 'TR000_25' AND a.molecule_id IN (SELECT m.molecule_id FROM molecule m WHERE m.label = '+');	toxicology
SELECT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'p' AND a2.element = 'n';	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = 'double' ORDER BY m.label DESC NULLS LAST LIMIT 1;	toxicology
SELECT AVG(COUNT(b.bond_id)::FLOAT / NULLIF(COUNT(c.atom_id), 0)) AS average_bonds_per_atom FROM atom a LEFT JOIN connected c ON a.atom_id = c.atom_id LEFT JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'i';	toxicology
SELECT b.bond_type, b.bond_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.atom_id = (SELECT atom_id FROM atom WHERE atom_id = 'TR000_' || lpad(cast(45 AS TEXT), 6, '0'));	toxicology
SELECT DISTINCT a.element FROM atom a WHERE a.atom_id NOT IN (SELECT c.atom_id FROM connected c);	toxicology
SELECT a.atom_id FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a.element FROM atom a WHERE a.atom_id = 'TR144_8_19';	toxicology
SELECT m.molecule_id, COUNT(b.bond_id) AS num_double_bonds FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = 'double bond' AND m.label = '+' GROUP BY m.molecule_id ORDER BY num_double_bonds DESC LIMIT 1;	toxicology
SELECT a.element, COUNT(*) AS count FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.element ORDER BY count ASC LIMIT 1;	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.element = 'pb';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT CAST(COUNT(DISTINCT b.bond_id) AS FLOAT) / NULLIF((SELECT COUNT(DISTINCT a.atom_id) FROM atom a), 0) AS proportion FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id GROUP BY a.element, a2.element ORDER BY proportion DESC LIMIT 1;	toxicology
SELECT DIVIDE(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END), COUNT(b.bond_id)) AS proportion FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT COUNT(*) FROM atom a WHERE a.element IN ('c', 'h');	toxicology
SELECT c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element ='s';	toxicology
SELECT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element ='sn';	toxicology
SELECT COUNT(DISTINCT a.element) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) AS total_atoms FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.element IN ('p', 'br') AND bond.bond_type = '#';	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT DIVIDE(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END), COUNT(*)) AS percent FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT m.label FROM molecule m WHERE m.molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT m.molecule_id FROM molecule m WHERE m.label = '-';	toxicology
SELECT COUNT(*) FROM molecule m WHERE m.molecule_id BETWEEN 'TR000' AND 'TR030' AND m.label = '+';	toxicology
SELECT b.bond_type FROM bond b WHERE b.molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN connected c2 ON c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR001_10_11' AND c2.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT b.bond_id) FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 'i';	toxicology
SELECT MAX(label) AS most_common_label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'ca';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'cl' AND a2.element = 'c' AND b.bond_id = 'TR001_1_8';	toxicology
SELECT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND b.bond_type = '#' AND m.label = '-';	toxicology
SELECT (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END)::FLOAT / NULLIF(COUNT(*), 0)) * 100 AS percentage FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON c.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR001';	toxicology
SELECT b.molecule_id FROM bond b WHERE b.bond_type = 'double';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN connected d ON a.atom_id = d.atom_id2 WHERE c.bond_id = 'TR005_16_26' AND d.bond_id = 'TR005_16_26';	toxicology
SELECT COUNT(*) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT b.bond_id, m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id, a.element, m.label FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT a.element, COUNT(*) AS count FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND substr(a.atom_id, 7, 1) = '4' AND a.element IN ('cl', 'c', 'h', 'o','s', 'n', 'p', 'na', 'br', 'f', 'i','sn', 'pb', 'te', 'ca') GROUP BY a.element;	toxicology
SELECT (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 1.0 / NULLIF(COUNT(a.element), 0)) AS ratio, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR006' AND (m.label = '+' OR m.label = '-') GROUP BY m.label;	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca' AND m.label = '+';	toxicology
SELECT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'te';	toxicology
SELECT a.element AS element1, b.element AS element2 FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom b ON c.atom_id2 = b.atom_id WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN b.bond_type = '#' THEN m.molecule_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT m.molecule_id), 0) AS proportion_of_triple_bonding_compounds FROM molecule m LEFT JOIN bond b ON m.molecule_id = b.molecule_id;	toxicology
SELECT (SUM(CASE WHEN b.bond_type ='='THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percent FROM bond b WHERE b.molecule_id = 'TR047';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_1' AND m.label = '+';	toxicology
SELECT m.label FROM molecule m WHERE m.molecule_id = 'TR151' AND m.label = '+';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR151' AND a.element IN ('cl', 'br', 'as','sn', 'pb', 'te');	toxicology
SELECT COUNT(*) AS carcinogenic_count FROM molecule WHERE label = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id BETWEEN 'TR010' AND 'TR050' AND a.element = 'c';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT DISTINCT b.bond_id FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND b.bond_type = 'double';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+';	toxicology
SELECT c.molecule_id FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.atom_id = 'TR000_1';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label!= '-';	toxicology
SELECT DIVIDE(SUM(CASE WHEN a.element = 'h AND m.label = '+' THEN 1 ELSE 0 END), COUNT(DISTINCT m.molecule_id)) * 100.0 AS percentage FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id;	toxicology
SELECT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR186';	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.atom_id = 'TR000_4';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(c.bond_id) AS num_double_bonds, m.label FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2' AND c.bond_id = 'TR000_3' AND c.bond_id = 'TR000_4' AND c.bond_id = 'TR000_5'; SELECT m.label FROM molecule m WHERE m.molecule_id = 'TR000';	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element IN ('cl', 'c', 'h', 'o','s', 'n', 'p', 'na', 'br', 'f', 'i','sn', 'pb', 'te', 'ca');	toxicology
SELECT b.bond_id, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '-';	toxicology
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a1.element FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) FROM connected c JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id JOIN atom a2 ON c.atom_id = a2.atom_id AND c.atom_id2 = a2.atom_id WHERE a.element = 'cl' OR a2.element = 'cl';	toxicology
SELECT a.atom_id, COUNT(b.bond_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id;	toxicology
SELECT COUNT(DISTINCT b.molecule_id) AS double_bond_molecules, COUNT(DISTINCT a.molecule_id) AS carcinogenic_double_bond_molecules FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE b.bond_type = 'double';	toxicology
SELECT COUNT(*) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element!='s' AND b.bond_type!= 'double';	toxicology
SELECT b.bond_id, a.element, c.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom b ON c.atom_id2 = b.atom_id JOIN molecule m ON c.molecule_id = m.molecule_id WHERE c.bond_id = 'TR001_2_4' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE atom.molecule_id = 'TR005';	toxicology
SELECT COUNT(*) AS single_bonds FROM bond WHERE bond_type = '-';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT DISTINCT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT DIVIDE(SUM(CASE WHEN a.label = '+' AND a.element = 'cl' THEN 1 ELSE 0 END), COUNT(DISTINCT a.molecule_id)) AS percentage FROM atom a WHERE a.element = 'cl';	toxicology
SELECT b.molecule_id FROM bond b WHERE b.bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM connected c JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2';	toxicology
SELECT a.element, a2.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a.atom_id = 'TR000_2' AND a2.atom_id = 'TR000_4';	toxicology
SELECT a.element FROM atom a WHERE a.atom_id = 'TR000_1';	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.molecule_id = 'TR000';	toxicology
SELECT DIVIDE(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END), COUNT(b.bond_id)) AS percentage FROM bond b;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element ='s' AND a.atom_id IN (SELECT a2.atom_id FROM connected c JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id IN (SELECT b.bond_id FROM bond b WHERE b.bond_type = '=='));	toxicology
SELECT m.molecule_id, COUNT(m.molecule_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(m.molecule_id) > 5 ORDER BY m.molecule_id NULLS LAST;	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024';	toxicology
SELECT m.label, COUNT(a.atom_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label LIKE '%+' GROUP BY m.label ORDER BY atom_count DESC NULLS LAST LIMIT 1;	toxicology
SELECT DIVIDE(SUM(CASE WHEN a.element = 'h' AND b.bond_type = '#' THEN 1 ELSE 0 END), COUNT(DISTINCT a.molecule_id)) * 100.0 AS percentage FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule d ON a.molecule_id = d.molecule_id WHERE d.label = '+';	toxicology
SELECT COUNT(*) FROM molecule m WHERE m.label = '+';	toxicology
SELECT COUNT(*) FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id AND c.atom_id2 = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*) AS carbon_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.element = 'c' AND a.molecule_id = 'TR000';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR000_4' AND m.label!= '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a.element = 'o' AND b.bond_type = 'double';	toxicology
SELECT COUNT(*) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR016';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'c' AND b.bond_type = 'double bond' AND b.molecule_id = (SELECT molecule_id FROM molecule WHERE molecule_id = 'TR012');	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'o' AND m.label = '+' ORDER BY a.atom_id NULLS LAST;	toxicology
SELECT c.name, c.text, c.type, c.subtypes, c.supertypes, c.rarity, c.setCode, c.set, c.artist, c.flavorName, c.flavorText, c.watermark, c.uuid FROM cards c WHERE c.cardKingdomFoilId = c.cardKingdomId AND c.cardKingdomId IS NOT NULL;	card_games
SELECT c.uuid, c.name FROM cards c WHERE c.borderColor IS NULL AND c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL;	card_games
SELECT c.name FROM cards c WHERE c.faceConvertedManaCost = (SELECT MAX(c2.faceConvertedManaCost) FROM cards c2);	card_games
SELECT c.name, c.edhrecRank FROM cards c WHERE c.frameVersion = '2015' AND c.edhrecRank < 100;	card_games
SELECT c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity ='mythic' AND l.status = 'Banned' AND l.format = 'gladiator';	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.type = 'Artifact' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power = '*' OR c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT c.uuid, c.text, r.text AS ruling, c.hasContentWarning FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele' ORDER BY c.uuid NULLS LAST;	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name ilike '%Sublime Epiphany%' AND c.number = '74s';	card_games
WITH max_rulings AS (SELECT cards.name, cards.artist, COUNT(rulings.uuid) AS num_rulings FROM cards JOIN rulings ON cards.uuid = rulings.uuid GROUP BY cards.name, cards.artist) SELECT mr.name, mr.artist, mr.num_rulings, CASE WHEN mr.num_rulings = (SELECT MAX(num_rulings) FROM max_rulings) THEN 'Yes' ELSE 'No' END AS is_max_rulings, CASE WHEN cards.isPromo = 1 THEN 'Yes' ELSE 'No' END AS is_promo FROM max_rulings mr JOIN cards ON mr.name = cards.name AND mr.artist = cards.artist ORDER BY mr.num_rulings DESC NULLS LAST LIMIT 1;	card_games
SELECT f.text FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.name = 'Annul' AND c.number = '29';	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT (COUNT(CASE WHEN c.language = 'Chinese Simplified' THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage FROM cards c;	card_games
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT c.type) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.artist = 'Aaron Boyd';	card_games
SELECT c.keywords FROM cards c WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards c WHERE c.power = '*';	card_games
SELECT cards.promoTypes FROM cards WHERE cards.name = 'Duress';	card_games
SELECT c.borderColor FROM cards c WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT c.originalType FROM cards c WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT s.name AS set_name, st.translation AS language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.code IN (SELECT s.code FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Angel of Mercy') AND st.language = 'en';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status ='restricted' AND c.isTextless = 0;	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status ='restricted' AND c.isStarter = 1;	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Cloudchaser Eagle';	card_games
SELECT c.type FROM cards c WHERE c.name = 'Benalish Knight';	card_games
SELECT l.status FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.name = 'Benalish Knight';	card_games
SELECT c.artist FROM cards c WHERE c.setCode = 'phyrexian';	card_games
SELECT (COUNT(CASE WHEN c.borderColor = 'borderless' THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage_of_borderless_cards FROM cards c;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE LOWER(f.language) = 'russian' AND LOWER(c.borderColor) = 'borderless';	card_games
SELECT (COUNT(CASE WHEN c.language = 'French' THEN 1 END)::FLOAT / NULLIF(COUNT(*), 0)) * 100 AS percentage FROM cards c WHERE c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT c.name FROM cards c WHERE c.artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards c WHERE c.borderColor = 'black' AND c.availability ='mtgo';	card_games
SELECT c.id FROM cards c WHERE c.convertedManaCost = 0;	card_games
SELECT c.layout FROM cards c WHERE c.keywords LIKE '%Flying%' ORDER BY c.layout NULLS LAST;	card_games
SELECT COUNT(*) FROM cards c WHERE c.subtypes IS NOT NULL AND c.subtypes!= 'Angel' AND c.originalType = 'Summon - Angel';	card_games
SELECT c.id FROM cards c WHERE c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL;	card_games
SELECT c.id FROM cards c WHERE c.duelDeck = 'a';	card_games
SELECT c.edhrecRank FROM cards c WHERE c.frameVersion = '2015';	card_games
SELECT c.artist FROM cards c WHERE c.artist IS NOT NULL AND c.artist!= '';	card_games
SELECT c.name FROM cards c WHERE c.availability = 'paper' AND c.language = 'Japanese';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND hasFoil = 1 AND hasNonFoil = 1;	card_games
SELECT c.uuid, f.language FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.uuid IN (SELECT l.uuid FROM legalities l WHERE l.format = 'legacy') AND f.language!= 'English';	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT COUNT(c.id), l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'legal';	card_games
SELECT c.name, c.colors FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW';	card_games
SELECT c.name, s.translation, s.language FROM cards c JOIN set_translations s ON c.uuid = s.uuid WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name, c.originalReleaseDate FROM cards c WHERE c.originalType = 'Creature - Elf';	card_games
SELECT c.colors, c.format FROM cards c WHERE c.id BETWEEN 1 AND 20;	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language!= 'English';	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards c WHERE c.artist = 'John Avon' AND c.cardKingdomId IS NOT NULL AND c.cardKingdomFoilId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards c WHERE c.borderColor = 'white' AND c.cardKingdomFoilId = c.cardKingdomId AND c.cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards c JOIN artists a ON c.artist = a.name WHERE a.name = 'UDON' AND c.availability ='mtgo' AND c.hand = -1;	card_games
SELECT COUNT(*) FROM cards WHERE hasContentWarning = 1 AND availability = 'paper' AND frameVersion = '1993';	card_games
SELECT c.manaCost FROM cards c WHERE c.layout = 'normal' AND c.frameVersion = '2003' AND c.borderColor = 'black' AND c.availability = 'paper,mtgo';	card_games
SELECT SUM(CASE WHEN c.artist = 'Rob Alexander' THEN CAST(c.manaCost AS REAL) ELSE 0 END) AS total_unconverted_mana FROM cards c;	card_games
SELECT DISTINCT t FROM cards c WHERE c.availability = 'arena' ORDER BY t NULLS LAST;	card_games
SELECT s.setCode FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN set_translations st ON fd.uuid = st.id WHERE fd.language = 'Spanish';	card_games
SELECT CAST(COUNT(CASE WHEN hand = '+3' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM cards WHERE frameEffects = 'legendary';	card_games
SELECT c.id, COUNT(c.id) AS total_cards, SUM(CASE WHEN c.isStorySpotlight = 1 AND c.isTextless = 1 THEN 1 ELSE 0 END) AS story_spotlight_and_textless_cards, ROUND(SUM(CASE WHEN c.isStorySpotlight = 1 AND c.isTextless = 1 THEN 1 ELSE 0 END) * 1.0 / NULLIF(COUNT(c.id), 0), 2) AS percentage FROM cards c GROUP BY c.id ORDER BY c.id NULLS LAST;	card_games
SELECT c.name, COUNT(*)::FLOAT / (SELECT COUNT(*) FROM cards) * 100 AS percentage FROM cards c WHERE c.language = 'Spanish' GROUP BY c.name ORDER BY percentage DESC NULLS LAST;	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.totalSetSize = 309;	card_games
SELECT COUNT(*) FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE LOWER(st.language) = 'portuguese (brasil)' AND LOWER(s.type) = 'commander';	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.type = 'Creature' AND l.status = 'legal';	card_games
SELECT DISTINCT t.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'de' AND (f.subtypes IS NOT NULL AND f.supertypes IS NOT NULL);	card_games
SELECT COUNT(*) FROM cards c WHERE c.power IS NULL AND (c.text LIKE '%When%' OR c.text LIKE '%has ability%');	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'pre-modern' AND c.rulings IS NOT NULL AND c.rulings LIKE '%This is a triggered mana ability%' AND c.side IS NULL;	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability = 'paper';	card_games
SELECT c.artist FROM cards c WHERE c.text ILIKE '%Das%perfekte%Gegenmittel%zu%einer%dichten%Formation%';	card_games
SELECT f.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.artist = 'Matthew D. Wilson' AND c.layout = 'normal' AND c.borderColor = 'black' AND f.language = 'French' AND c.type = 'Creature';	card_games
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2009-01-10';	card_games
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.totalSetSize = 180;	card_games
SELECT CAST(COUNT(CASE WHEN hasContentWarning = 0 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM cards WHERE format = 'commander' AND status = 'legal';	card_games
SELECT DIVIDE(COUNT(CASE WHEN c.language = 'French' AND (c.power IS NULL OR c.power = '*') THEN 1 END), COUNT(CASE WHEN (c.power IS NULL OR c.power = '*') THEN 1 END)) * 100 AS percentage FROM cards c;	card_games
SELECT DIVIDE(COUNT(DISTINCT CASE WHEN s.language = 'Japanese' THEN s.code END), COUNT(DISTINCT s.code))*100 AS percentage FROM sets s WHERE s.type = 'expansion';	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards c WHERE c.borderColor = 'borderless' AND c.edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT c.name FROM cards c WHERE c.power IS NULL OR c.power = '*' AND c.promoTypes = 'arenaleague' ORDER BY c.name ASC NULLS LAST LIMIT 3;	card_games
SELECT f.language FROM foreign_data f WHERE f.multiverseid = 149934;	card_games
SELECT c.cardKingdomFoilId, c.cardKingdomId FROM cards c WHERE c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL ORDER BY c.cardKingdomFoilId ASC NULLS LAST LIMIT 3;	card_games
SELECT (COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END) * 100.0 / NULLIF(COUNT(CASE WHEN isTextless = 1 THEN 1 END), 0)) AS proportion FROM cards WHERE isTextless = 1 AND layout = 'normal';	card_games
SELECT c.id FROM cards c WHERE c.subtypes ilike '%Angel%' AND c.subtypes ilike '%Wizard%' AND c.side IS NULL;	card_games
SELECT s.name FROM sets s WHERE s.mtgoCode IS NULL OR s.mtgoCode = '' ORDER BY s.name ASC LIMIT 3;	card_games
SELECT DISTINCT language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.mcmName = 'Archenemy' AND s.setCode = 'ARC';	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5;	card_games
SELECT s.name AS set_name, st.translation AS set_translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206;	card_games
SELECT s.code, s.name, s.id FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE LOWER(st.language) = 'it' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT s.id FROM sets s WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND s.mtgoCode = 'Japanese' ORDER BY s.id NULLS LAST;	card_games
SELECT s.code, MAX(s.baseSetSize) AS max_base_set_size FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' GROUP BY s.code ORDER BY max_base_set_size DESC NULLS LAST LIMIT 1;	card_games
SELECT DIVIDE(COUNT(CASE WHEN isOnlineOnly = 1 THEN 1 END), COUNT(*))*100 AS percentage FROM cards WHERE language = 'Chinese Simplified';	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s WHERE s.name ilike '%Japanese%' AND (s.mtgoCode IS NULL OR s.mtgoCode = '');	card_games
SELECT c.id FROM cards c WHERE c.borderColor = 'black';	card_games
SELECT c.id FROM cards c WHERE c.frameEffects = 'extendedart';	card_games
SELECT c.name FROM cards c WHERE c.borderColor = 'black' AND c.isFullArt = 1;	card_games
SELECT s.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.code = '174';	card_games
SELECT s.name FROM sets s WHERE s.code = 'ALL';	card_games
SELECT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'A Pedra Fellwar';	card_games
SELECT s.code FROM sets s WHERE s.releaseDate = '2007-07-13';	card_games
SELECT s.baseSetSize, s.setCode FROM sets s JOIN set_translations st ON s.setCode = st.setCode WHERE st.translation ilike '%Masques%' AND st.translation ilike '%Mirage%';	card_games
SELECT s.setCode FROM sets s WHERE s.type = 'expansion';	card_games
SELECT f.name AS foreign_name, t.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid JOIN types t ON c.uuid = t.uuid WHERE c.watermark = 'boros';	card_games
SELECT c.uuid, s.name AS set_name, s.release_date, s.code, s.total_set_size, s.mcm_id, s.tcgplayer_group_id, s.is_foil_only, s.is_foreign_only, s.is_nonfoil_only, s.is_online_only, s.is_partial_preview, s.keyrune_code, s.mcm_id_extras, s.name AS set_name, s.parent_code, s.release_date, s.tcgo_code, s.type, s.total_set_size, s.tcgplayer_group_id, s.is_foil_only, s.is_foreign_only, s.is_nonfoil_only, s.is_online_only, s.is_partial_preview, s.keyrune_code, s.mcm_id_extras, s.name AS set_name, s.parent_code, s.release_date, s.tcgo_code, s.type, s.total_set_size, s.tcgplayer_group_code, s.is_foil_only, s.is_foreign_only, s.is_nonfoil_only, s.is_online_only, s.is_partial_preview, s.keyrune_code, s.mcm_id_extras, s.name AS set_name, s.parent_code, s.release_date, s.tcgo_code, s.type, s.total_set_size, s.tcgplayer_group_id, s.is_foil_only, s.is_foreign_only, s.is_nonfoil_only, s.is_online_only, s.is_partial_preview, s.keyrune_code, s.mcm_id_extras, s.name AS set_name, s.parent_code, s.release_date, s.tcgo_code, s.type, s.total_set_size, s.tcgplayer_group_id, s.is_foil_only, s.is_foreign_only, s.is_nonfoil_only, s.is_online_only, s.is_partial_preview, s.keyrune_code, s.mcm_id_extras, s.name AS set_name, s.parent_code, s.release_date, s.tcgo_code, s.type, s.total_set_size, s.tcgplayer_group_id, s.is_foil_only, s.is_foreign_only, s.is_nonfoil_only, s.is_online_only, s.is_partial_preview, s.keyrune_code, s.mcm_id_extras, s.name AS set_name, s.parent_code, s.release_date, s.tcgo_code, s.type, s.total_set_size, s.tcgplayer_group_id, s.is_foil_only, s.is_foreign_only, s.is_nonfoil_only, s.is_online_only, s.is_partial_preview, s.keyrune_code, s	card_games
SELECT (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END)::FLOAT / NULLIF(COUNT(*), 0)) * 100 AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Abyssal Horror' AND c.convertedManaCost = 10;	card_games
SELECT s.setCode FROM sets s WHERE s.type = 'Commander';	card_games
SELECT c.artist, c.type FROM cards c WHERE c.watermark = 'abzan';	card_games
SELECT f.language, f.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'azorius';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards c WHERE c.hand LIKE '%+%' AND c.availability LIKE '%paper%';	card_games
SELECT c.name FROM cards c WHERE c.isTextless = 0 ORDER BY c.name;	card_games
SELECT c.convertedManaCost FROM cards c WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards c WHERE c.color = 'white' AND (c.power IS NULL OR c.power = '*');	card_games
SELECT c.name FROM cards c WHERE c.isPromo = 1 AND c.side IS NOT NULL;	card_games
SELECT c.subtypes, c.supertypes FROM cards c WHERE c.name = 'Molimo, Maro-Sorcerer';	card_games
SELECT DISTINCT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT c.artist) FROM cards c WHERE c.borderColor = 'black' AND c.availability ilike '%arena,mtgo%';	card_games
SELECT c.name, c.convertedManaCost FROM cards c WHERE c.name IN ('Serra Angel', 'Shrine Keeper') ORDER BY c.convertedManaCost DESC;	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT c.name, c.faceName, c.convertedManaCost FROM cards c WHERE c.frameVersion = '2003' ORDER BY c.convertedManaCost DESC LIMIT 3;	card_games
SELECT s.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Ancestor''s Chosen'; SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.name = (SELECT s.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Ancestor''s Chosen') AND st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT s.id) FROM set_translations s JOIN cards c ON s.set_code = c.set_code WHERE c.name = 'Angel of Mercy';	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON l.uuid = s.id WHERE s.code = '10E' AND s.name = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name ilike '%Ancestor''s Chosen%' AND fd.language = 'Korean';	card_games
SELECT COUNT(*) AS num_cards FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE LOWER(st.translation) = 'hauptset zehnte edition' AND LOWER(c.artist) = 'adam rex';	card_games
SELECT s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT st.translation FROM set_translations st WHERE st.language = 'Simplified Chinese' AND st.setCode = '10E';	card_games
SELECT c.name FROM cards c WHERE c.name = 'Angel of Mercy' AND c.mtgoCode IS NOT NULL;	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE LOWER(st.language) = 'italian' AND LOWER(s.block) = 'ice age';	card_games
SELECT c.uuid FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Adarkar Valkyrie' AND s.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND st.translation IS NOT NULL AND s.baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards c WHERE c.borderColor = 'black';	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' ORDER BY c.faceConvertedManaCost DESC NULLS LAST LIMIT 1;	card_games
SELECT c.artist FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.artist IN ('Jeremy Jarvis', 'Aaron Miller','Chippy');	card_games
SELECT c.uuid FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.number = 4;	card_games
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.convertedManaCost > 5 AND (c.power = '*' OR c.power IS NULL);	card_games
SELECT fd.flavorText FROM foreign_data fd WHERE fd.name = 'Ancestor''s Chosen' AND fd.language = 'Italian';	card_games
SELECT DISTINCT f.language FROM foreign_data f WHERE f.name = 'Ancestor''s Chosen' AND f.flavorText IS NOT NULL;	card_games
SELECT t.text FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.name = 'Ancestor''s Chosen' AND f.language = 'German';	card_games
SELECT c.uuid, r.text FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN sets s ON c.mtgoCode = s.code JOIN set_translations st ON s.code = st.setCode AND st.language = 'Italian' JOIN rulings r ON c.uuid = r.uuid WHERE s.name = 'Coldsnap';	card_games
SELECT c.name, c.text FROM cards c JOIN foreign_data f ON c.uuid = f.uuid JOIN sets s ON c.mtgjsonV4Id = s.mcmId JOIN set_translations st ON s.code = st.setCode WHERE c.convertedManaCost = (SELECT MAX(c2.convertedManaCost) FROM cards c2) AND f.language = 'Italian' AND s.name = 'Coldsnap';	card_games
SELECT r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Reminisce';	card_games
SELECT DIVIDE(SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END), SUM(1)) * 100 AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT (COUNT(DISTINCT CASE WHEN c.cardKingdomFoilId = c.cardKingdomId AND c.cardKingdomId IS NOT NULL THEN c.uuid END)::FLOAT / NULLIF((SELECT COUNT(DISTINCT c.uuid) FROM cards c WHERE c.name = 'Coldsnap'), 0)) * 100 AS percentage_incredibly_powerful FROM cards c WHERE c.name = 'Coldsnap';	card_games
SELECT s.code FROM sets s WHERE s.releaseDate = '2017-07-14';	card_games
SELECT s.keyruneCode FROM sets s WHERE s.code = 'PKHC';	card_games
SELECT s.mcmId FROM sets s WHERE s.code = 'SS2';	card_games
SELECT s.mcmName FROM sets s WHERE s.releaseDate = '2003-01-01';	card_games
SELECT s.type FROM sets s WHERE s.code IN (SELECT st.setCode FROM set_translations st WHERE st.translation ilike '%From the Vault: Lore%');	card_games
SELECT s.code FROM sets s WHERE s.name = 'Commander 2014 Oversized';	card_games
SELECT c.uuid, c.text FROM cards c WHERE c.artist = 'Jim Pavelec' AND c.hasContentWarning = 1;	card_games
SELECT s.releaseDate FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Evacuation';	card_games
SELECT s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE LOWER(st.translation) = 'rinascita di alara';	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Huitième édition';	card_games
SELECT s.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN set_translations st ON fd.language = 'French' AND fd.uuid = st.setCode WHERE c.text = 'Tendo Ice Bridge';	card_games
SELECT COUNT(*) FROM set_translations st WHERE LOWER(st.translation) IS NOT NULL AND LOWER(st.setCode) ='salvat 2011';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.code IN (SELECT c.setCode FROM cards c WHERE c.name = 'Fellwar Stone') AND st.language = 'Japanese';	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero''s Path' ORDER BY c.convertedManaCost DESC NULLS LAST LIMIT 1;	card_games
SELECT s.releaseDate FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Ola de frío';	card_games
SELECT s.type FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE LOWER(s.name) = 'world championship decks 2004' AND c.convertedManaCost = 3;	card_games
SELECT st.translation FROM set_translations st WHERE st.language = 'Chinese Simplified' AND st.setCode = 'MIR';	card_games
SELECT (SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END)::FLOAT / NULLIF(SUM(CASE WHEN s.language = 'Japanese' THEN 1 ELSE 0 END), 0)) * 100 AS percentage FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.language = 'Japanese';	card_games
SELECT DIVIDE(SUM(c.isOnlineOnly), SUM(c.isOnlineOnly = 1)) * 100 AS percentage FROM cards c JOIN set_translations st ON c.uuid = st.id WHERE st.language = 'Portuguese (Brazil)';	card_games
SELECT DISTINCT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT s.id FROM sets s WHERE s.baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT c.artist, MAX(c.convertedManaCost) AS max_converted_mana_cost FROM cards c WHERE c.side IS NULL GROUP BY c.artist ORDER BY max_converted_mana_cost DESC NULLS LAST LIMIT 1;	card_games
SELECT MAX(frameEffects) AS most_common_frame_effects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards c WHERE c.power IS NULL OR c.power = '*' AND c.hasFoil = 0 AND c.duelDeck = 'a';	card_games
SELECT s.id FROM sets s WHERE s.type = 'Commander' ORDER BY s.totalSetSize DESC LIMIT 1;	card_games
SELECT c.name, MAX(c.manaCost) AS max_mana_cost FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' GROUP BY c.name ORDER BY max_mana_cost DESC LIMIT 10;	card_games
SELECT MIN(c.originalReleaseDate) AS oldest_release_date, l.status AS play_status, s.type AS play_format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE c.rarity ='mythic' AND l.status = 'legal' GROUP BY s.type, l.status;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baga' AND fd.language = 'French';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types = 'Enchantment' AND c.name = 'Abundance' AND l.status = 'Legal';	card_games
SELECT l.uuid, s.name FROM legalities l JOIN cards c ON l.uuid = c.uuid JOIN sets s ON c.setCode = s.code WHERE l.status = 'banned' GROUP BY l.uuid, s.name ORDER BY COUNT(l.uuid) DESC NULLS LAST LIMIT 1;	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.name = 'Battlebond';	card_games
SELECT c.artist, c.format FROM cards c GROUP BY c.artist, c.format ORDER BY COUNT(c.id) ASC LIMIT 1;	card_games
SELECT l.status FROM cards c JOIN foreign_data f ON c.uuid = f.uuid JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND c.hasContentWarning = 1 AND l.format = 'legacy';	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'banned';	card_games
SELECT AVG(s.id) AS average_sets_per_year FROM sets s WHERE s.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY EXTRACT(YEAR FROM s.releaseDate) ORDER BY average_sets_per_year DESC;	card_games
SELECT DISTINCT artist FROM cards WHERE BorderColor = 'black' AND availability = 'arena';	card_games
SELECT c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'oldschool' AND (l.status = 'banned' OR l.status ='restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.uuid IN (SELECT s.mcmId FROM sets s WHERE s.code = 'HOU');	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language not like '%Japanese%' AND st.language = 'Korean';	card_games
SELECT DISTINCT frameVersion FROM cards WHERE artist = 'Allen Williams'; SELECT DISTINCT uuid FROM cards WHERE status = 'banned';	card_games
SELECT u1.DisplayName, MAX(u1.Reputation) AS MaxReputation FROM users u1 WHERE u1.DisplayName = 'Harlan' OR u1.DisplayName = 'Jarrod Dixon' GROUP BY u1.DisplayName ORDER BY MaxReputation DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u WHERE EXTRACT(YEAR FROM u.CreationDate) = 2014;	codebase_community
SELECT COUNT(*) FROM users u WHERE u.LastAccessDate > '2014-09-01 00:00:00';	codebase_community
SELECT u.DisplayName FROM users u ORDER BY u.Views DESC NULLS LAST LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users u WHERE u.UpVotes > 100 AND u.DownVotes > 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u WHERE u.Views > 10 AND EXTRACT(YEAR FROM u.CreationDate) > 2013;	codebase_community
SELECT COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie';	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(p2.FavoriteCount) FROM posts p2);	codebase_community
SELECT SUM(p.CommentCount) AS total_comments FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie';	codebase_community
SELECT p.Score FROM posts p WHERE p.OwnerDisplayName = 'csgillespie' ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.OwnerDisplayName = 'csgillespie' AND p.ParentId IS NULL;	codebase_community
SELECT DISTINCT p.OwnerDisplayName FROM posts p WHERE p.ClosedDate IS NOT NULL ORDER BY p.OwnerDisplayName NULLS LAST;	codebase_community
SELECT COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20;	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id WHERE LOWER(t.TagName) = 'bayesian';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(t2.Count) FROM tags t2);	codebase_community
SELECT COUNT(*) AS NumberOfBadges FROM badges b WHERE LOWER(b.name) = 'csgillespie';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges b WHERE b.UserId IN (SELECT u.Id FROM users u WHERE LOWER(u.DisplayName) = 'csgillespie') AND YEAR(b.Date) = 2011;	codebase_community
WITH BadgeCounts AS (SELECT b.UserId, COUNT(b.Id) AS badge_count FROM badges b GROUP BY b.UserId) SELECT u.DisplayName FROM BadgeCounts bc JOIN users u ON bc.UserId = u.Id ORDER BY bc.badge_count DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score) AS AverageScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'csgillespie';	codebase_community
SELECT AVG(COUNT(b.Id)::FLOAT / NULLIF(COUNT(DISTINCT u.DisplayName), 0)) AS average_badges_per_user FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Views > 200;	codebase_community
SELECT CAST(COUNT(DISTINCT CASE WHEN u.Age > 65 THEN p.Id END) AS FLOAT) / NULLIF(COUNT(DISTINCT p.Id), 0) * 100 AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 20;	codebase_community
SELECT COUNT(v.Id) AS total_votes FROM votes v WHERE v.UserId = 58 AND v.CreationDate = '2010-07-19';	codebase_community
SELECT MAX(v.CreationDate) AS MaxCreationDate FROM votes v;	codebase_community
SELECT COUNT(*) FROM badges b WHERE b.name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(c2.Score) FROM comments c2);	codebase_community
SELECT COUNT(c.Id) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014/4/23 20:29:39.0';	codebase_community
SELECT c.Text FROM comments c WHERE c.PostId = 107829 AND c.CommentCount = 1;	codebase_community
SELECT c.PostId, p.Title FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0' AND p.ClosedDate IS NULL;	codebase_community
SELECT u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 65041;	codebase_community
SELECT COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'tiago pasqualini';	codebase_community
SELECT u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.Id = 6347;	codebase_community
SELECT SUM(v.UpVotes) AS total_up_votes, SUM(v.DownVotes) AS total_down_votes FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT CAST(COUNT(DISTINCT p.Id) AS FLOAT) / NULLIF(COUNT(DISTINCT v.Id), 0) AS ratio FROM posts p JOIN votes v ON p.OwnerUserId = v.UserId WHERE p.OwnerUserId = 24;	codebase_community
SELECT p.ViewCount FROM posts p WHERE p.Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT c.Text FROM comments c WHERE c.Score = 17;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93!';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE LOWER(u.DisplayName) = 'a lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.text FROM posts p JOIN comments c ON p.id = c.postid WHERE LOWER(p.title) = 'how does gentle boosting differ from adaboost';	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' ORDER BY u.DisplayName NULLS LAST LIMIT 10;	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE LOWER(u.DisplayName) ='vebjorn ljosa';	codebase_community
SELECT SUM(p.Score) AS TotalScore FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'; SELECT u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE u.DisplayName = 'Yevgeny' LIMIT 1; SELECT u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE u.DisplayName = 'Yevgeny' LIMIT 1; SELECT p.Score FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'; SELECT SUM(p.Score) AS TotalScore FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'; SELECT p.Score FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'; SELECT u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE u.DisplayName = 'Yevgeny' LIMIT 1; SELECT p.Score FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'; SELECT SUM(p.Score) AS TotalScore FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'; SELECT p.Score FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'; SELECT u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE u.DisplayName = 'Yevgeny' LIMIT 1; SELECT p.Score FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'; SELECT SUM(p.Score) AS TotalScore FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'; SELECT p.Score FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'; SELECT u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE u.DisplayName = 'Yevgeny' LIMIT 1; SELECT p.Score FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'; SELECT SUM(p.Score) AS TotalScore FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgen	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' ORDER BY c.CreationDate;	codebase_community
SELECT SUM(v.BountyAmount) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title ILIKE '%data%';	codebase_community
SELECT u.DisplayName FROM votes v JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Body ilike '%variance%' ORDER BY u.DisplayName NULLS LAST;	codebase_community
SELECT p.Title, p.ViewCount, p.Score, p.Body, c.Text AS Comment, AVG(p.ViewCount) AS average_ViewCount FROM posts p JOIN comments c ON p.Id = c.PostId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'humor' GROUP BY p.Title, p.ViewCount, p.Score, p.Body, c.Text;	codebase_community
SELECT COUNT(c.Id) FROM comments c WHERE c.UserId = 13;	codebase_community
SELECT u.Id FROM users u ORDER BY u.Reputation DESC NULLS LAST LIMIT 1;	codebase_community
SELECT u.Id FROM users u WHERE u.Views = (SELECT MIN(u2.Views) FROM users u2);	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE b.Name = 'Supporter' AND EXTRACT(YEAR FROM b.Date) = 2011;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE COUNT(b.Name) > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(u.Location) = 'new york' AND b.Name IN ('Teacher', 'Supporter');	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1; SELECT u.Reputation FROM users u WHERE u.Id = (SELECT p.OwnerUserId FROM posts p WHERE p.Id = 1);	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Views >= 1000 GROUP BY u.DisplayName, p.Id HAVING COUNT(DISTINCT ph.Id) = 1;	codebase_community
WITH user_comments AS (SELECT c.UserId, COUNT(c.Id) AS comment_count FROM comments c GROUP BY c.UserId) SELECT u.DisplayName, u.ProfileImageUrl, u.Location, u.AboutMe, u.Views, u.UpVotes, u.DownVotes, u.Age, u.WebsiteUrl, b.Name AS badge_name FROM user_comments uc JOIN users u ON uc.UserId = u.Id JOIN badges b ON u.Id = b.UserId ORDER BY uc.comment_count DESC NULLS LAST LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b ON u.Id = b.UserId WHERE LOWER(u.Location) = 'india' AND LOWER(b.Name) = 'teacher';	codebase_community
SELECT (COUNT(CASE WHEN EXTRACT(YEAR FROM b.Date) = 2010 THEN 1 END) * 100.0 / NULLIF(COUNT(CASE WHEN EXTRACT(YEAR FROM b.Date) = 2011 THEN 1 END), 0) - 100) AS percentage_difference FROM badges b WHERE b.Name = 'Student';	codebase_community
SELECT ph.PostHistoryTypeId, COUNT(DISTINCT ph.UserId) AS unique_users_commented FROM postHistory ph WHERE ph.PostId = 3720 GROUP BY ph.PostHistoryTypeId;	codebase_community
SELECT p.ViewCount FROM posts p WHERE p.Id IN (SELECT pl.PostId FROM postLinks pl WHERE pl.PostId = 61217);	codebase_community
SELECT p.Score, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Id = 395;	codebase_community
SELECT p.Id AS PostId, u.Id AS UserId FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount) AS total_favorite_count FROM posts p WHERE p.OwnerUserId = 686 AND EXTRACT(YEAR FROM p.CreationDate) = 2011;	codebase_community
SELECT AVG(Divide(Sum(u.UpVotes), Count(u.Id))) AS average_up_votes, AVG(Divide(Sum(u.Age), Count(u.Id))) AS average_age FROM users u JOIN posts p ON u.Id = p.OwnerUserId GROUP BY u.Id HAVING COUNT(p.OwnerUserId) > 10;	codebase_community
SELECT COUNT(*) FROM badges b WHERE b.Name = 'Announcer';	codebase_community
SELECT b.Name FROM badges b WHERE b.Date = '2010-07-19 19:39:08';	codebase_community
SELECT COUNT(*) AS positive_comments FROM comments c WHERE c.score > 60;	codebase_community
SELECT c.Text FROM comments c WHERE c.CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(p.Id) FROM posts p WHERE p.Score = 10;	codebase_community
WITH user_badges AS (SELECT u.Id AS UserId, u.DisplayName, MAX(u.Reputation) AS MaxReputation, b.Name AS BadgeName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, b.Name) SELECT ub.BadgeName FROM user_badges ub ORDER BY ub.MaxReputation DESC NULLS LAST LIMIT 1;	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT u.Location, b.Date FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Rochester, NY' ORDER BY b.Date NULLS LAST;	codebase_community
SELECT (COUNT(DISTINCT b.UserId) * 100.0 / NULLIF((SELECT COUNT(DISTINCT a.UserId) FROM badges a), 0)) AS percentage FROM badges b WHERE b.Name = 'Teacher';	codebase_community
SELECT CAST(COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 END) AS FLOAT) / NULLIF(COUNT(u.Id), 0) * 100 AS percentage_of_teens FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT c.Text FROM comments c WHERE c.CreationDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE LOWER(u.Location) = 'vienna, austria';	codebase_community
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.Views FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(u2.Reputation) FROM users u2);	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Id = 30;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u WHERE u.Location = 'New York';	codebase_community
SELECT COUNT(*) FROM votes v WHERE YEAR(v.CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users u WHERE u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Views = (SELECT MAX(u2.Views) FROM users u2);	codebase_community
SELECT DIVIDE(COUNT(Id WHERE YEAR(CreationDate) = 2010), COUNT(Id WHERE YEAR(CreationDate) = 2011)) FROM votes;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'john stauffer' ORDER BY t.TagName NULLS LAST;	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.OwnerDisplayName = 'Daniel Vassallo';	codebase_community
SELECT SUM(v.BountyAmount) AS total_bounty FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT p.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) ='slashnick' ORDER BY p.AnswerCount DESC NULLS LAST LIMIT 1;	codebase_community
SELECT MAX(p.ViewCount) FROM posts p WHERE p.OwnerDisplayName IN ('Harvey Motulsky', 'Noah Snyder');	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND p.ViewCount > 4;	codebase_community
SELECT SUM(CASE WHEN c.Score < 60 THEN 1 ELSE 0 END) AS NegativeComments FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Neil McGuigan';	codebase_community
SELECT DISTINCT t.TagName FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN comments c ON p.Id = c.PostId WHERE p.OwnerUserId IN (SELECT u.Id FROM users u WHERE LOWER(u.DisplayName) ='mark meckes') AND c.PostId IS NULL;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT DIVIDE(COUNT(p.Id WHERE p.Tags LIKE '%R%'), COUNT(u.Id WHERE u.DisplayName = 'Community')) AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT SUM(CASE WHEN p.OwnerDisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) - SUM(CASE WHEN p.OwnerDisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) AS difference FROM posts p;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b WHERE b.Name = 'Commentator' AND YEAR(b.Date) = 2014;	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT u.DisplayName, u.Age FROM users u WHERE u.Views = (SELECT MAX(u2.Views) FROM users u2);	codebase_community
SELECT p.LastEditDate, p.LastEditorUserId FROM posts p WHERE p.Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT SUM(c.Score) AS total_negative_comments FROM comments c WHERE c.UserId = 13 AND c.Score < 60;	codebase_community
SELECT p.Title, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score > 60;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE EXTRACT(YEAR FROM b.Date) = 2011 AND u.Location = 'North Pole';	codebase_community
SELECT p.OwnerDisplayName, p.FavoriteCount, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150;	codebase_community
SELECT ph.Text, COUNT(ph.Text) AS post_history_count, MAX(ph.CreationDate) AS last_edit_date FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE LOWER(p.Title) = 'what is the best introductory bayesian statistics textbook?' GROUP BY ph.Text;	codebase_community
SELECT u.LastAccessDate, u.Location FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Outliers';	codebase_community
SELECT p.Title FROM posts p JOIN postlinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId IN (SELECT Id FROM posts WHERE LOWER(Tags) LIKE '%data%set%');	codebase_community
SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN comments c ON p.Id = c.PostId JOIN badges b ON p.OwnerUserId = b.UserId WHERE c.UserDisplayName = 'Samuel' AND YEAR(p.CreationDate) = 2013 UNION SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId WHERE p.OwnerUserId = b.UserId AND YEAR(b.Date) = 2013 AND p.OwnerUserId IN (SELECT u.Id FROM users u WHERE LOWER(u.DisplayName) ='samuel');	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.ViewCount = (SELECT MAX(p2.ViewCount) FROM posts p2);	codebase_community
SELECT u.DisplayName, u.Location FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(t.TagName) = 'hypothesis-testing';	codebase_community
SELECT p.title, pl.linkTypeId FROM posts p JOIN postLinks pl ON p.id = pl.postId WHERE p.title = 'What are principal component scores?';	codebase_community
SELECT p.OwnerDisplayName, p.Title FROM posts p WHERE p.ParentId IS NOT NULL AND p.Score = (SELECT MAX(p2.Score) FROM posts p2 WHERE p2.ParentId IS NOT NULL);	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT p.Title, MAX(p.ViewCount) AS Max_ViewCount FROM posts p GROUP BY p.Title ORDER BY Max_ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags t WHERE t.Count BETWEEN 5000 AND 7000;	codebase_community
SELECT p.OwnerUserId FROM posts p WHERE p.FavoriteCount = (SELECT MAX(p2.FavoriteCount) FROM posts p2);	codebase_community
SELECT u.Age FROM users u WHERE u.Reputation = (SELECT MAX(u2.Reputation) FROM users u2);	codebase_community
SELECT COUNT(*) FROM posts p JOIN votes v ON p.id = v.postid WHERE YEAR(p.creationdate) = 2011 AND v.bountyamount = 50;	codebase_community
SELECT u.Id FROM users u WHERE u.Age = (SELECT MIN(u2.Age) FROM users u2);	codebase_community
SELECT p.Score FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE p.ViewCount = (SELECT MAX(p2.ViewCount) FROM posts p2);	codebase_community
SELECT DIVIDE(COUNT(pl.Id), 12) AS average_monthly_links FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE YEAR(p.CreationDate) = 2010 AND p.AnswerCount <= 2;	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC NULLS LAST LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId ORDER BY pl.CreationDate ASC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(v.CreationDate) FROM votes v WHERE v.UserId IN (SELECT u.Id FROM users u WHERE u.DisplayName = 'chl');	codebase_community
SELECT MIN(u.LastAccessDate) FROM users u;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE LOWER(u.Location) = 'united kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(v.PostId) AS average_posts_voted FROM votes v JOIN users u ON v.UserId = u.Id ORDER BY u.Age DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Reputation = (SELECT MAX(u2.Reputation) FROM users u2);	codebase_community
SELECT COUNT(*) FROM users u WHERE u.Reputation > 2000 AND u.Views > 1000;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) AS NumberOfPosts FROM posts p WHERE LOWER(p.OwnerDisplayName) = 'jay stevens' AND YEAR(p.CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) = 'harvey motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p WHERE p.Score = (SELECT MAX(p2.Score) FROM posts p2);	codebase_community
SELECT AVG(p.Score) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(u.DisplayName) ='stephen turner';	codebase_community
SELECT DISTINCT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT p.Id, p.OwnerDisplayName FROM posts p WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC NULLS LAST LIMIT 1;	codebase_community
SELECT DIVIDE(COUNT(p.Id WHERE p.CreationDate BETWEEN '2011-01-01' AND '2011-12-31' AND u.Reputation > 1000), COUNT(p.Id)) * 100 AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT DIVIDE(COUNT(u.Id WHERE u.Age BETWEEN 13 AND 18), COUNT(u.Id)) AS percentage FROM users u;	codebase_community
SELECT SUM(p.ViewCount) AS total_views, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE LOWER(p.Title) = 'computer game datasets' GROUP BY u.DisplayName ORDER BY p.ViewCount DESC NULLS LAST;	codebase_community
SELECT COUNT(*) AS posts_with_high_views FROM posts p WHERE p.ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
WITH PostScore AS (SELECT p.Id AS PostId, MAX(c.Score) AS MaxCommentScore FROM posts p JOIN comments c ON p.Id = c.PostId GROUP BY p.Id) SELECT ps.MaxCommentScore FROM PostScore ps ORDER BY ps.MaxCommentScore DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.ViewCount > 35000 AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT b.Name FROM badges b WHERE b.UserId IN (SELECT u.Id FROM users u WHERE u.DisplayName = 'Emmett') ORDER BY b.Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users u WHERE u.Age BETWEEN 19 AND 65 AND u.UpVotes > 5000;	codebase_community
SELECT EXTRACT(epoch FROM (MAX(b.Date) - u.CreationDate))/86400 AS days FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT COUNT(p.Id) AS post_count, COUNT(c.Id) AS comment_count FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(u2.CreationDate) FROM users u2);	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE LOWER(b.Name) = 'citizen patrol';	codebase_community
SELECT COUNT(p.Id) FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count IS NOT NULL AND t.Count > 0 AND LOWER(t.TagName) = 'careers';	codebase_community
SELECT u.Reputation, SUM(p.ViewCount) AS total_view_count FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Jarrod Dixon' GROUP BY u.Reputation;	codebase_community
SELECT COUNT(c.Id) AS comment_count, COUNT(p.Id) AS answer_count FROM comments c JOIN posts p ON c.PostId = p.Id WHERE LOWER(p.Title) = 'clustering 1d data';	codebase_community
SELECT u.CreationDate FROM users u WHERE u.DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM votes v WHERE v.BountyAmount >= 30;	codebase_community
SELECT CAST(COUNT(DISTINCT CASE WHEN p.Score >= 50 THEN p.Id END) AS FLOAT) / NULLIF(COUNT(DISTINCT p.Id), 0) AS ratio FROM posts p WHERE p.OwnerUserId = (SELECT u.Id FROM users u ORDER BY u.Reputation DESC LIMIT 1);	codebase_community
SELECT COUNT(*) FROM posts p WHERE p.Score < 20;	codebase_community
SELECT t.TagName, COUNT(t.Id) AS PostCount FROM tags t WHERE t.Id < 15 AND t.Count <= 20 GROUP BY t.TagName ORDER BY PostCount NULLS LAST;	codebase_community
SELECT t.ExcerptPostId, t.WikiPostId FROM tags t WHERE LOWER(t.TagName) ='sample';	codebase_community
SELECT u.Reputation, SUM(v.UpVotes) AS total_up_votes FROM users u JOIN comments c ON u.Id = c.UserId JOIN votes v ON u.Id = v.UserId WHERE c.Text = 'fine, you win :)' GROUP BY u.Reputation;	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE LOWER(p.Title) = 'how can i adapt anova for binary data';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT p.creationdate, (EXTRACT(YEAR FROM age(CURRENT_DATE, p.creationdate)) - 1) AS age FROM users u JOIN badges b ON u.id = b.userid JOIN posts p ON u.id = p.owneruserid JOIN comments c ON u.id = c.userid WHERE c.text ilike '%http://%' ORDER BY p.creationdate NULLS LAST;	codebase_community
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) AS zero_score_comments FROM comments c WHERE c.Score = 0 AND c.PostId IN (SELECT p.Id FROM posts p WHERE p.CommentCount = 1);	codebase_community
SELECT COUNT(DISTINCT c.UserId) AS total_users FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND EXTRACT(YEAR FROM AGE(CURRENT_DATE, u.creationDate)) >= 40;	codebase_community
SELECT p.Id, c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text ilike '%R%is%also%lazy%evaluated%';	codebase_community
SELECT c.Text FROM comments c WHERE LOWER(c.UserDisplayName) = 'harvey motulsky';	codebase_community
SELECT c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.DownVotes = 0 AND c.Score BETWEEN 1 AND 5;	codebase_community
SELECT DIVIDE(COUNT(DISTINCT c.UserId WHERE c.UpVotes = 0 AND c.Score BETWEEN 5 AND 10), COUNT(DISTINCT c.UserId WHERE c.Score BETWEEN 5 AND 10)) AS percentage FROM comments c;	codebase_community
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT h.id) FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id WHERE hp.power_id IN (SELECT id FROM superpower WHERE power_name = 'Super Strength') AND s.height_cm > 200;	superhero
SELECT s.full_name FROM superhero s JOIN hero_power h ON s.id = h.hero_id GROUP BY s.full_name HAVING COUNT(DISTINCT h.power_id) > 15;	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE LOWER(c.colour) = 'blue';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Blue' AND c2.colour = 'Blond';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT s.full_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC LIMIT 1;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Sauron';	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' AND s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT AVG(s.height_cm) AS average_height FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT MULTIPLY(DIVIDE(SUM(CASE WHEN sp.power_name = 'Super Strength' THEN 1 ELSE 0 END), COUNT(s.id)), 100) AS percentage FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(s.id) FROM superhero s WHERE s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT s.publisher_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE c.colour = 'Gold' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT s.publisher_id, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE c.colour = 'Blond';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Intelligence') ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT s.race_id FROM superhero s WHERE s.superhero_name = 'Copycat';	superhero
SELECT COUNT(*) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Death Touch';	superhero
SELECT COUNT(*) FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.gender_id IN (SELECT id FROM gender WHERE gender = 'Female') AND a.attribute_name = 'Strength' AND a.attribute_value = 100;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.superhero_name ORDER BY COUNT(hp.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(s.id) FROM superhero s WHERE s.race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT (COUNT(CASE WHEN s.alignment_id = 2 THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference;	superhero
SELECT p.id FROM publisher p WHERE p.publisher_name = 'Star Trek';	superhero
SELECT AVG(ha.attribute_value) AS average_attribute_value FROM hero_attribute ha;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Deathlok';	superhero
SELECT AVG(s.weight_kg) AS average_weight FROM superhero s WHERE s.gender_id = 2;	superhero
SELECT s.superhero_name, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.gender_id = (SELECT id FROM gender WHERE gender = 'Male') LIMIT 5;	superhero
SELECT s.superhero_name FROM superhero s WHERE s.race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT s.superhero_name FROM superhero s WHERE s.height_cm BETWEEN 170 AND 190 AND s.eye_colour_id = 1;	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 56;	superhero
SELECT s.full_name FROM superhero s WHERE s.race_id = (SELECT id FROM race WHERE race = 'Demi-God') ORDER BY s.full_name LIMIT 5;	superhero
SELECT COUNT(s.id) FROM superhero s WHERE s.alignment_id = 2;	superhero
SELECT s.race_id FROM superhero s WHERE s.weight_kg = 169;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE s.height_cm = 185 AND s.race_id = (SELECT id FROM race WHERE race = 'human');	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(s2.weight_kg) FROM superhero s2);	superhero
SELECT (COUNT(CASE WHEN s.publisher_id = 13 THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage FROM superhero s WHERE s.height_cm BETWEEN 150 AND 180;	superhero
SELECT s.full_name FROM superhero s WHERE s.gender_id IN (SELECT id FROM gender WHERE gender = 'Male') AND (s.weight_kg > (SELECT AVG(s2.weight_kg) * 0.79 FROM superhero s2));	superhero
WITH PowerCount AS (SELECT sp.power_name, COUNT(*) AS power_count FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id GROUP BY sp.power_name) SELECT pc.power_name FROM PowerCount pc ORDER BY pc.power_count DESC NULLS LAST LIMIT 1;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT s.power_name FROM hero_power hp JOIN superpower s ON hp.power_id = s.id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(DISTINCT hp.hero_id) FROM hero_power hp WHERE hp.power_id IN (SELECT sp.id FROM superpower sp WHERE sp.power_name ='stealth');	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength') ORDER BY ha.attribute_value DESC NULLS LAST LIMIT 1;	superhero
SELECT DIVIDE(COUNT(s.id), SUM(CASE WHEN c.id = 1 THEN 1 ELSE 0 END)) AS average FROM superhero s JOIN colour c ON s.skin_colour_id = c.id;	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s WHERE s.publisher_id IN (SELECT p.id FROM publisher p WHERE p.publisher_name = 'Dark Horse Comics');	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'durability' AND s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics') ORDER BY ha.attribute_value DESC NULLS LAST LIMIT 1;	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Abraham Sapien';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Flight';	superhero
SELECT s.eye_colour_id, s.hair_colour_id, s.skin_colour_id FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id AND s.hair_colour_id = c.id AND s.skin_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'A-Bomb';	superhero
SELECT (COUNT(CASE WHEN s.eye_colour_id = c.id AND g.gender = 'Female' THEN 1 END)::FLOAT / NULLIF(COUNT(CASE WHEN g.gender = 'Female' THEN 1 END), 0)) * 100 AS percentage FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' AND g.gender = 'Female';	superhero
SELECT s.superhero_name, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.full_name = 'Charles Chandler';	superhero
SELECT g.gender FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE s.superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(hp.power_id) AS number_of_powers FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id WHERE s.superhero_name = 'Amazo';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour e ON s.eye_colour_id = e.id JOIN colour h ON s.hair_colour_id = h.id WHERE e.colour = 'Black' AND h.colour = 'Black';	superhero
SELECT s.eye_colour_id FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE c.colour = 'Gold';	superhero
SELECT s.full_name FROM superhero s WHERE s.race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT s.superhero_name FROM superhero s WHERE s.alignment_id = 3;	superhero
SELECT COUNT(DISTINCT h.id) FROM superhero h JOIN hero_attribute ha ON h.id = ha.hero_id WHERE ha.attribute_id IN (SELECT a.id FROM attribute a WHERE a.attribute_name = 'Strength');	superhero
SELECT s.race_id, a.alignment FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT (COUNT(CASE WHEN s.gender_id = g.id AND p.publisher_name = 'Marvel Comics' THEN 1 END) / NULLIF(COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 END), 0)) * 100 AS percentage FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT AVG(s.weight_kg) FROM superhero s JOIN race r ON s.race_id = r.id WHERE LOWER(r.race) = 'alien';	superhero
SELECT (SELECT SUM(s.weight_kg) FROM superhero s WHERE s.full_name = 'Emil Blonsky') - (SELECT SUM(s.weight_kg) FROM superhero s WHERE s.full_name = 'Charles Chandler') AS difference;	superhero
SELECT AVG(s.height_cm) AS average_height FROM superhero s;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(s.id) FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE s.race_id = 21 AND g.id = 1;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name AS attributes, h.attribute_value AS values FROM hero_attribute h JOIN superhero s ON h.hero_id = s.id JOIN attribute a ON h.attribute_id = a.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN colour h ON s.hair_colour_id = h.id WHERE c.id = 7 AND h.id = 9;	superhero
SELECT s.publisher_id, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IS NULL;	superhero
SELECT (COUNT(CASE WHEN s.eye_colour_id = 7 THEN 1 END) * 100.0 / NULLIF(COUNT(*), 0)) AS percentage FROM superhero s;	superhero
SELECT DIVIDE(SUM(CASE WHEN s.gender_id = 1 THEN 1 ELSE 0 END), SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END)) AS ratio FROM superhero s;	superhero
SELECT s.superhero_name FROM superhero s WHERE s.height_cm = (SELECT MAX(s2.height_cm) FROM superhero s2);	superhero
SELECT sp.id FROM superpower sp WHERE sp.power_name = 'cryokinesis';	superhero
SELECT s.superhero_name FROM superhero s WHERE s.id = 294;	superhero
SELECT s.full_name FROM superhero s WHERE s.weight_kg = 0 OR s.weight_kg IS NULL;	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr';	superhero
SELECT s.race_id FROM superhero s WHERE s.weight_kg = 108 AND s.height_cm = 188;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.id = 38;	superhero
SELECT s.superhero_name, r.race FROM superhero s JOIN race r ON s.race_id = r.id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Intelligence') ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT s.alignment, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' ORDER BY s.full_name NULLS LAST LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.alignment_id = 3;	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_id = 1 AND hero_attribute.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN alignment a ON s.alignment_id = a.id WHERE a.id = 1 AND g.id = 2;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80;	superhero
SELECT s.race FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE c.colour = 'blue';	superhero
SELECT (COUNT(DISTINCT CASE WHEN g.id = 2 THEN s.id END)::FLOAT / NULLIF(COUNT(DISTINCT s.id), 0)) * 100 AS percentage FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN gender g ON s.gender_id = g.id WHERE a.id = 2;	superhero
SELECT SUM(CASE WHEN s.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN s.eye_colour_id = 1 THEN 1 ELSE 0 END) AS difference FROM superhero s WHERE s.weight_kg = 0 OR s.weight_kg IS NULL;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength') AND s.superhero_name = 'Hulk';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE c.colour = 'Green' AND s.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Wind Control' ORDER BY s.superhero_name NULLS LAST;	superhero
SELECT g.gender FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id JOIN gender g ON s.gender_id = g.id WHERE p.power_name = 'Phoenix Force';	superhero
SELECT s.superhero_name, s.full_name FROM superhero s WHERE s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') ORDER BY s.weight_kg DESC LIMIT 1;	superhero
SELECT AVG(s.height_cm) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.race_id!= (SELECT id FROM race WHERE race = 'Human') AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(*) FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE ha.attribute_name = 'Speed' AND ha.attribute_value = 100;	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS difference;	superhero
SELECT a.attribute_name FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Black Panther' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT s.superhero_name FROM superhero s WHERE s.height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT s.superhero_name FROM superhero s WHERE s.full_name = 'Charles Chandler';	superhero
SELECT (COUNT(CASE WHEN s.gender_id = g.id AND p.publisher_name = 'George Lucas' THEN 1 END)::FLOAT / NULLIF((SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'George Lucas'), 0)) * 100 AS percentage FROM gender g;	superhero
SELECT MULTIPLY(DIVIDE(SUM(CASE WHEN s.alignment_id = 1 THEN 1 ELSE 0 END), COUNT(*)), 100.0) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT h.id FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE ha.attribute_id = (SELECT a.id FROM attribute a WHERE a.attribute_name = 'Intelligence') ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT s.full_name FROM superhero s WHERE s.superhero_name = 'Alien';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.colour = 'Brown';	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.full_name = 'Aquababy';	superhero
SELECT s.weight_kg, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.id = 40;	superhero
SELECT AVG(s.height_cm) FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral';	superhero
SELECT s.id FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Intelligence';	superhero
SELECT colour.colour FROM colour JOIN superhero ON colour.id = superhero.eye_colour_id WHERE superhero.superhero_name = 'Blackwulf';	superhero
SELECT s.superhero_name, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(s2.height_cm) * 0.8 FROM superhero s2);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q1 IN (SELECT MAX(q1) FROM qualifying WHERE raceId = 18) ORDER BY d.driverRef NULLS LAST;	formula_1
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19);	formula_1
SELECT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location ilike '%Shanghai%';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE LOWER(c.country) = 'germany';	formula_1
SELECT r.position FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN constructors c ON r.constructorId = c.constructorId JOIN constructorResults cr ON r.resultId = cr.resultId JOIN races ra ON r.raceId = ra.raceId JOIN circuits ci ON ra.circuitId = ci.circuitId WHERE LOWER(c.name) ='renault';	formula_1
SELECT COUNT(r.raceId) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND (c.country not ilike '%Asia%' OR c.country not ilike '%Europe%');	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name LIKE '%Australian Grand Prix%';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.name) ='sepang international circuit';	formula_1
SELECT r.time FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT c.lat, c.lng FROM circuits c WHERE c.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.country FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN results res ON r.raceId = res.raceId JOIN constructors con ON res.constructorId = con.constructorId WHERE res.points = 1 AND res.raceId = 24;	formula_1
SELECT q1 FROM qualifying WHERE raceId = 354 AND driverId IN (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna');	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '0:01:40' AND q.raceId = 355;	formula_1
SELECT d.number FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q3 = '00:01:54' AND q.raceId = 903;	formula_1
SELECT COUNT(*) AS number_of_drivers FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.position IS NULL AND r.time IS NOT NULL AND r.raceId IN (SELECT r2.raceId FROM races r2 WHERE LOWER(r2.name) = 'bahrain grand prix' AND r2.year = 2007);	formula_1
SELECT r.url FROM races r WHERE r.round = 901;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM races r JOIN results res ON r.raceId = res.raceId WHERE r.date = '2015-11-29' AND res.time IS NOT NULL;	formula_1
SELECT d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC NULLS LAST LIMIT 1;	formula_1
SELECT d.url FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 161 AND r.time = '00:01:27';	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 933 AND r.fastestLapSpeed = (SELECT MAX(r2.fastestLapSpeed) FROM results r2 WHERE r2.raceId = 933);	formula_1
SELECT c.name, c.lat, c.lng FROM circuits c WHERE c.country = 'Malaysia';	formula_1
SELECT c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 9 ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT q.q1 FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE d.forename = 'Lucas' AND d.surname = 'di Grassi' AND q.raceId = 345;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '00:01:15' AND q.raceId = 347;	formula_1
SELECT d.code FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 45 AND q.q3 = '0:01:33';	formula_1
SELECT r.name, to_char(r.date, 'DD-MM-YYYY') AS race_date, to_char(r.time, 'HH24:MI') AS race_time, to_char(TO_TIMESTAMP(r.time::integer), 'HH24:MI') AS time_of_day, d.forename, d.surname, to_char(TO_TIMESTAMP(r.time::integer), 'HH24:MI') AS finish_time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId = 743 AND d.forename ilike '%Bruce%' AND d.surname ilike '%McLaren%';	formula_1
SELECT d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.name = 'San Marino Grand Prix' AND r2.year = 2006) AND r.position = 2;	formula_1
SELECT r.year, r.name FROM races r WHERE r.round = 901;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM races r JOIN results res ON r.raceId = res.raceId WHERE r.date = '2015-11-29';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL GROUP BY d.forename, d.surname ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId = 348 ORDER BY r.time ASC LIMIT 1;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (SELECT MAX(r2.fastestLapSpeed) FROM results r2);	formula_1
SELECT DIVIDE(SUBTRACT(fastestLapSpeed(raceId = 853), fastestLapSpeed(raceId = 854), fastestLapSpeed(raceId = 853)) AS percentage FROM results r WHERE r.driverId = (SELECT d.driverId FROM drivers d WHERE d.surname = 'di Resta' AND d.forename = 'Paul') AND r.raceId = 853;	formula_1
SELECT DIVIDE(COUNT(DISTINCT r.driverId WHERE r.time IS NOT NULL AND r.date = '1983-07-16'), COUNT(DISTINCT r.driverId WHERE r.date = '1983-07-16')) AS percentage FROM races r;	formula_1
SELECT MIN(r.year) AS year FROM races r WHERE r.name LIKE '%Singapore Grand Prix%';	formula_1
SELECT COUNT(*) FROM races r WHERE r.year = 2005; SELECT r.name FROM races r WHERE r.year = 2005 ORDER BY r.name DESC;	formula_1
SELECT r.name, r.date FROM races r WHERE r.year = (SELECT year FROM races ORDER BY date ASC LIMIT 1) AND EXTRACT(MONTH FROM r.date) = EXTRACT(MONTH FROM (SELECT date FROM races ORDER BY date ASC LIMIT 1)) ORDER BY r.date;	formula_1
SELECT r.name, r.date FROM races r WHERE r.year = 1999 ORDER BY r.round DESC LIMIT 1;	formula_1
SELECT r.year, COUNT(r.raceId) AS num_races FROM races r GROUP BY r.year ORDER BY num_races DESC LIMIT 1;	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 AND c.country!= 'Malaysia';	formula_1
SELECT c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.year = (SELECT MIN(year) FROM seasons);	formula_1
SELECT MAX(r.year) AS last_year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Brands Hatch';	formula_1
SELECT COUNT(DISTINCT r.year) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name ilike '%Silverstone%' AND c.location ilike '%United Kingdom%';	formula_1
SELECT d.surname, d.forename, d2.position FROM drivers d JOIN driverStandings d2 ON d.driverId = d2.driverId WHERE d2.raceId IN (SELECT r.raceId FROM races r WHERE r.year = 2010 AND r.name = 'Singapore Grand Prix') ORDER BY d2.position NULLS LAST;	formula_1
SELECT d.forename, d.surname, MAX(r.points) AS points FROM results r JOIN drivers d ON r.driverId = d.driverId GROUP BY d.forename, d.surname ORDER BY points DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, r.points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId = (SELECT r2.raceId FROM races r2 WHERE r2.name = 'Chinese Grand Prix' AND r2.year = 2017) ORDER BY r.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name, MIN(l.time) AS fastest_lap_time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN lapTimes l ON r.resultId = l.raceId AND d.driverId = l.driverId GROUP BY d.forename, d.surname, r.name ORDER BY fastest_lap_time NULLS LAST;	formula_1
SELECT AVG(lapTimes.milliseconds) AS averageLapTime FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.forename = 'Sebastian' AND drivers.surname = 'Vettel' AND lapTimes.raceId = (SELECT raceId FROM races WHERE EXTRACT(YEAR FROM date) = 2009 AND name = 'Chinese Grand Prix');	formula_1
SELECT DIVIDE(COUNT(r.resultId) WHERE r.surname = 'Hamilton' AND r.year >= 2010 AND r.position > 1), (COUNT(r.resultId) WHERE r.surname = 'Hamilton' AND r.year >= 2010) AS percentage FROM results r;	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(d.wins) AS most_wins, AVG(dr.points) AS avg_points FROM drivers d JOIN driverStandings dr ON d.driverId = dr.driverId GROUP BY d.forename, d.surname, d.nationality ORDER BY most_wins DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, 2022 - EXTRACT(YEAR FROM d.dob) AS age FROM drivers d WHERE d.nationality = 'Japanese' ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT c.circuitRef FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.circuitRef HAVING COUNT(r.raceId) >= 4 ORDER BY c.circuitRef NULLS LAST;	formula_1
SELECT c.name, c.location, r.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name, c.name AS circuit_name, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE EXTRACT(MONTH FROM r.date) = 9 AND EXTRACT(YEAR FROM r.date) = 2005;	formula_1
SELECT r.name FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Yoong' AND r.position < 10;	formula_1
SELECT COUNT(r.resultId) AS number_of_wins FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND ra.name LIKE '%Sepang International Circuit%' ORDER BY number_of_wins DESC NULLS LAST;	formula_1
SELECT r.name, r.year FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Schumacher' AND r.fastestLapTime = MIN(r.time);	formula_1
SELECT AVG(r.points) AS average_points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Irvine' AND r.year = 2000;	formula_1
SELECT r.name, r.date, d.points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY r.year ASC LIMIT 1;	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT r.name, r.year, c.name AS circuit_name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.laps = (SELECT MAX(r2.laps) FROM races r2);	formula_1
SELECT (COUNT(CASE WHEN c.country = 'Germany' AND r.name = 'European Grand Prix' THEN 1 END) / NULLIF(COUNT(CASE WHEN r.name = 'European Grand Prix' THEN 1 END), 0)) * 100 AS percentage FROM circuits c JOIN races r ON c.circuitId = r.circuitId;	formula_1
SELECT c.lat, c.lng FROM circuits c WHERE c.name = 'Silverstone';	formula_1
SELECT c.name FROM circuits c WHERE c.lat = (SELECT MAX(c2.lat) FROM circuits c2 WHERE c2.name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring'));	formula_1
SELECT c.circuitRef FROM circuits c WHERE c.name = 'Marina Bay Street Circuit';	formula_1
SELECT c.country FROM circuits c WHERE c.alt = (SELECT MAX(c2.alt) FROM circuits c2);	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT c.country, MIN(d.dob) AS oldest_dob FROM drivers d JOIN circuits c ON d.nationality = c.country GROUP BY c.country ORDER BY oldest_dob LIMIT 1;	formula_1
SELECT d.surname FROM drivers d WHERE d.nationality = 'Italian';	formula_1
SELECT d.url FROM drivers d WHERE d.forename = 'Anthony' AND d.surname = 'Davidson';	formula_1
SELECT d.driverRef FROM drivers d WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = 2008 AND r.name LIKE '%Spanish Grand Prix';	formula_1
SELECT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone';	formula_1
SELECT r.year, r.round, r.name AS race_name, c.name AS circuit_name, c.location, c.country, c.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name ilike '%Silverstone%';	formula_1
SELECT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Yas Marina Circuit' AND EXTRACT(YEAR FROM r.date) = 2011;	formula_1
SELECT COUNT(r.raceId) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE LOWER(c.country) = 'italy';	formula_1
SELECT DISTINCT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT c.url FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE LOWER(r.name) ='spanish grand prix' AND r.year = 2009;	formula_1
SELECT MIN(r.time) AS fastest_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed IS NOT NULL ORDER BY r.fastestLapSpeed DESC NULLS LAST LIMIT 1;	formula_1
SELECT d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races R2 ON r.raceId = R2.raceId WHERE r.raceId = (SELECT r2.raceId FROM races r2 WHERE r2.name = 'Australian Grand Prix' AND r2.year = 2008) AND r.position = 1;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.name, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND r.position = (SELECT MIN(position) FROM results WHERE driverId = d.driverId);	formula_1
SELECT MAX(r.fastestLapSpeed) AS fastest_lap_speed FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE LOWER(r2.name) ='spanish grand prix' AND r2.year = 2009);	formula_1
SELECT DISTINCT r.year FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.surname = 'Hamilton';	formula_1
SELECT r.positionOrder FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.name = 'Australian Grand Prix' AND EXTRACT(YEAR FROM r2.date) = 2008);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.name = 'Australian Grand Prix' AND r2.year = 2008) AND r.grid = 4;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM results r WHERE r.raceId = (SELECT r2.raceId FROM races r2 WHERE r2.name = 'Australian Grand Prix' AND r2.year = 2008) AND r.time IS NOT NULL;	formula_1
SELECT r.name, d.forename, d.surname, l.time, l.milliseconds FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId JOIN lapTimes l ON r.raceId = l.raceId AND res.driverId = l.driverId WHERE d.forename ilike '%Lewis%' AND d.surname ilike '%Hamilton%' AND r.year = 2008 AND l.position = 1;	formula_1
SELECT r.time FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN status s ON r.statusId = s.statusId WHERE r.position = 2 AND r.raceId IN (SELECT r2.raceId FROM races r2 JOIN seasons s2 ON r2.year = s2.year WHERE s2.url = '2008/F1_Racing_2008/Australian_Grand_Prix');	formula_1
SELECT d.forename, d.surname, r.time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId IN (SELECT r.raceId FROM races r WHERE r.year = 2008) AND r.position = 1 ORDER BY r.time ASC NULLS LAST LIMIT 1; SELECT c.url FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = 2008 AND r.raceId IN (SELECT r.raceId FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = (SELECT d.forename FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId IN (SELECT r.raceId FROM races r WHERE r.year = 2008) AND r.position = 1 ORDER BY r.time ASC NULLS LAST LIMIT 1), surname = (SELECT d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId IN (SELECT r.raceId FROM races r WHERE r.year = 2008) AND r.position = 1 ORDER BY r.time ASC NULLS LAST LIMIT 1));	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'American' AND r.raceId = (SELECT r2.raceId FROM races r2 WHERE r2.name = 'Australian Grand Prix' AND r2.year = 2008);	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId IN (SELECT raceId FROM races WHERE year = 2008) AND r.position IS NOT NULL;	formula_1
SELECT SUM(r.points) AS total_points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT AVG(EXTRACT(EPOCH FROM (TO_TIMESTAMP(r.time))) / 60 AS average_fastest_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Hamilton';	formula_1
SELECT CAST(COUNT(DISTINCT r.raceId WHERE r.time IS NOT NULL) AS FLOAT) / NULLIF(COUNT(DISTINCT r.raceId), 0) AS rate FROM results r WHERE r.driverId IN (SELECT d.driverId FROM drivers d WHERE d.nationality = 'Australian') AND r.year = 2008;	formula_1
SELECT ((SUM(CASE WHEN r.position = 1 THEN EXTRACT(EPOCH FROM (TO_TIMESTAMP(r.time))) ELSE 0 END) - SUM(CASE WHEN r.position = r.grid THEN EXTRACT(EPOCH FROM (TO_TIMESTAMP(r.time))) ELSE 0 END)) / NULLIF(SUM(CASE WHEN r.position = r.grid THEN EXTRACT(EPOCH FROM (TO_TIMESTAMP(r.time))) ELSE 0 END), 0)) * 100 AS percentage FROM results r WHERE r.raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND YEAR(date) = 2008) AND time IS NOT NULL;	formula_1
SELECT COUNT(*) FROM circuits c WHERE c.location = 'Melbourne';	formula_1
SELECT c.lat, c.lng FROM circuits c WHERE c.country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers d WHERE d.nationality = 'British' AND EXTRACT(YEAR FROM d.dob) > 1980;	formula_1
SELECT AVG(cr.points) AS average_points FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'British';	formula_1
WITH ConstructorPoints AS (SELECT cr.constructorId, SUM(cr.points) AS totalPoints FROM constructorResults cr GROUP BY cr.constructorId) SELECT c.name, cp.totalPoints FROM ConstructorPoints cp JOIN constructors c ON cp.constructorId = c.constructorId ORDER BY cp.totalPoints DESC NULLS LAST LIMIT 1;	formula_1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE cr.points = 0 AND r.raceId = 291;	formula_1
SELECT COUNT(*) FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN results r ON cr.raceId = r.raceId WHERE c.nationality = 'Japanese' AND r.points = 0 GROUP BY c.name HAVING COUNT(r.raceId) = 2;	formula_1
SELECT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(*) FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN drivers d ON cr.driverId = d.driverId WHERE d.nationality = 'French' AND cr.lap > 50;	formula_1
SELECT (COUNT(DISTINCT CASE WHEN r.time IS NOT NULL AND r.year BETWEEN 2007 AND 2009 THEN r.driverId END)::FLOAT / NULLIF(COUNT(DISTINCT CASE WHEN r.year BETWEEN 2007 AND 2009 THEN r.driverId END), 0)) * 100 AS percentage FROM results r WHERE r.driverId IN (SELECT d.driverId FROM drivers d WHERE d.nationality = 'Japanese');	formula_1
SELECT s.year, AVG(EXTRACT(epoch FROM r.time)) AS average_time FROM results r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ds.position = 1 AND r.time IS NOT NULL GROUP BY s.year;	formula_1
SELECT d.forename, d.surname FROM drivers d WHERE d.dob > '1975-01-01' AND d.rank = 2 ORDER BY d.forename NULLS LAST, d.surname NULLS LAST;	formula_1
SELECT COUNT(*) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN (SELECT rt.driverId, MIN(rt.time) AS minTime FROM lapTimes rt GROUP BY rt.driverId) AS mt ON d.driverId = mt.driverId ORDER BY mt.minTime ASC LIMIT 1;	formula_1
SELECT MAX(raceId) AS fastest_lap_race_id, d.forename, d.surname, MAX(l.lap) AS fastest_lap_number, to_char(MAX(l.time), 'HH24:MI:SS.FF9') AS fastest_lap_time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId JOIN lapTimes l ON r.resultId = l.raceId AND d.driverId = l.driverId AND r.raceId = l.raceId AND r.position = l.position WHERE to_date(r.date, 'YYYY-MM-DD') BETWEEN to_date('2009-01-01', 'YYYY-MM-DD') AND to_date('2009-12-31', 'YYYY-MM-DD') GROUP BY d.forename, d.surname ORDER BY d.forename, d.surname NULLS LAST;	formula_1
SELECT AVG(fastestLapSpeed) AS average_fastest_lap_speed FROM results r JOIN races R1 ON r.raceId = R1.raceId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009;	formula_1
SELECT r.name, r.year FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.time IS NOT NULL AND res.time!= '' ORDER BY res.time ASC LIMIT 1;	formula_1
SELECT (COUNT(DISTINCT r.driverId) / NULLIF((SELECT COUNT(DISTINCT r2.driverId) FROM races r2 WHERE r2.year BETWEEN 2000 AND 2005), 0)) * 100 AS percentage FROM races r WHERE r.year BETWEEN 2000 AND 2005 AND r.laps > 50 AND (EXTRACT(YEAR FROM r.date) - EXTRACT(YEAR FROM d.dob)) < 1985;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.time < '01:00:00';	formula_1
SELECT d.driverRef, d.forename, d.surname FROM drivers d WHERE d.nationality = 'America';	formula_1
SELECT r.raceId FROM races r WHERE r.year = 2009;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM races r WHERE r.raceId = 18;	formula_1
SELECT d.code, COUNT(*) AS count FROM drivers d WHERE d.nationality = 'Netherlands' GROUP BY d.code ORDER BY d.dob LIMIT 3;	formula_1
SELECT d.driverRef FROM drivers d WHERE d.forename = 'Robert' AND d.surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers d WHERE d.nationality = 'Australian' AND EXTRACT(YEAR FROM d.dob) = 1980;	formula_1
SELECT d.forename, d.surname, l.time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'German' AND EXTRACT(YEAR FROM d.dob) BETWEEN 1980 AND 1990 ORDER BY l.time ASC LIMIT 3;	formula_1
SELECT d.driverRef FROM drivers d WHERE d.nationality = 'German' ORDER BY d.dob ASC NULLS LAST LIMIT 1;	formula_1
SELECT r.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE EXTRACT(YEAR FROM d.dob) = 1971 AND r.fastestLapTime IS NOT NULL;	formula_1
SELECT d.forename, d.surname, MAX(l.time) AS max_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE EXTRACT(YEAR FROM d.dob) < 1982 AND d.nationality = 'Spanish' GROUP BY d.forename, d.surname ORDER BY max_lap_time DESC LIMIT 10;	formula_1
SELECT r.year FROM races r WHERE r.year IN (SELECT MAX(r2.year) FROM races r2 WHERE r2.fastestLapTime IS NOT NULL);	formula_1
SELECT MIN(r.year) AS year_with_lowest_speed FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId;	formula_1
SELECT d.driverId, MIN(l.time) AS fastestLapTime FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId GROUP BY d.driverId ORDER BY fastestLapTime DESC LIMIT 5;	formula_1
SELECT COUNT(*) AS disqualified_finishers FROM results r WHERE r.statusId = 2 AND r.time IS NOT NULL AND r.raceId BETWEEN 50 AND 100;	formula_1
SELECT COUNT(r.raceId) AS number_of_races, c.location, c.lat, c.lng FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Austria' GROUP BY c.location, c.lat, c.lng;	formula_1
SELECT r.number, COUNT(DISTINCT r.raceId) AS finisher_count FROM races r JOIN results r1 ON r.raceId = r1.raceId AND r1.position IS NOT NULL GROUP BY r.number ORDER BY finisher_count DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 IS NOT NULL AND q.raceId = 23;	formula_1
SELECT MIN(r.year) AS year_of_first_qualifying_race, r.name, r.date, r.time FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY r.year, r.name, r.date, r.time;	formula_1
SELECT COUNT(*) FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.nationality = 'American' AND r.statusId = 2;	formula_1
SELECT c.name, c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN status s ON cr.status = s.statusId WHERE c.nationality = 'Italian' ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN (SELECT cs.constructorId, SUM(cs.wins) AS total_wins FROM constructorStandings cs GROUP BY cs.constructorId ORDER BY total_wins DESC LIMIT 1) AS cw ON c.constructorId = cw.constructorId;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.raceId IN (SELECT r.raceId FROM races r WHERE r.name ilike '%French Grand Prix%') AND lt.lap = 3 ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT r.name, MIN(l.time) AS fastest_lap_time FROM lapTimes l JOIN races r ON l.raceId = r.raceId GROUP BY r.name ORDER BY fastest_lap_time LIMIT 1;	formula_1
SELECT AVG(r.fastestLapTime) FROM results r WHERE r.raceId = (SELECT raceId FROM races WHERE name = 'United States Grand Prix' AND year = 2006) AND r.rank < 11;	formula_1
SELECT d.forename, d.surname, AVG(p.duration) AS avg_duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.forename, d.surname ORDER BY avg_duration ASC LIMIT 5;	formula_1
SELECT d.surname, d.forename, to_char(r.time, 'HH24:MI:SS.FF9') AS time FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId IN (SELECT r.raceId FROM races r WHERE r.name ilike '%Canadian Grand Prix%' AND to_date(r.date, 'YYYY-MM-DD') = to_date('2008-06-15', 'YYYY-MM-DD')) ORDER BY r.points DESC NULLS LAST LIMIT 1;	formula_1
SELECT c.constructorRef, c.url FROM results r JOIN constructors c ON r.constructorId = c.constructorId WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.name = 'Singapore Grand Prix' AND r2.year = 2009) AND r.position = (SELECT MIN(r2.position) FROM results r2 WHERE r2.raceId = r.raceId);	formula_1
SELECT d.forename, d.surname, d.dob FROM drivers d WHERE d.nationality = 'Austrian' AND EXTRACT(YEAR FROM d.dob) BETWEEN 1981 AND 1991;	formula_1
SELECT d.forename ||'' || d.surname AS full_name, c.url AS wiki_pedia_page_link, d.dob FROM drivers d JOIN constructors c ON d.driverId = c.constructorId WHERE d.nationality = 'German' AND EXTRACT(YEAR FROM d.dob) BETWEEN 1971 AND 1985 ORDER BY d.dob DESC;	formula_1
SELECT c.location, c.country, c.lat, c.lng FROM circuits c WHERE c.name = 'Hungaroring';	formula_1
SELECT SUM(cr.points) AS total_points, c.name, c.nationality FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.year BETWEEN 1980 AND 2010 AND r.name = 'Monaco Grand Prix' GROUP BY c.name, c.nationality ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(r.points) AS average_score FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Hamilton' AND d.nationality = 'British' AND r.name ilike '%Turkish Grand Prix%';	formula_1
SELECT COUNT(raceId) / COUNT(DISTINCT EXTRACT(YEAR FROM r.date)) AS avg_races_per_year FROM races r WHERE r.date BETWEEN '2000-01-01' AND '2010-12-31';	formula_1
SELECT d.nationality FROM drivers d GROUP BY d.nationality ORDER BY COUNT(d.nationality) DESC LIMIT 1;	formula_1
WITH driver_points AS (SELECT d.driverId, SUM(r.points) AS total_points FROM results r JOIN drivers d ON r.driverId = d.driverId GROUP BY d.driverId) SELECT COUNT(*) AS wins FROM driver_points WHERE total_points >= 91;	formula_1
SELECT r.name FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.fastestLapTime = (SELECT MIN(r2.fastestLapTime) FROM results r2);	formula_1
SELECT c.name || ','|| c.country AS full_location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(r2.date) FROM races r2);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.year = 2008 AND q.number = 3 AND q.q3 = (SELECT MIN(q2.q3) FROM qualifying q2 WHERE q2.raceId = r.raceId);	formula_1
SELECT d.forename ||'' || d.surname AS full_name, d.nationality, to_char(MAX(r.date), 'Month DD, YYYY') AS first_race FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob = (SELECT MAX(dob) FROM drivers) GROUP BY d.forename, d.surname, d.nationality;	formula_1
SELECT COUNT(*) FROM results r JOIN status s ON r.statusId = s.statusId WHERE LOWER(r.positionText) = 'canadian grand prix' AND s.status = 'Retired';	formula_1
SELECT d.forename, d.surname, SUM(r.wins) AS total_wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId GROUP BY d.forename, d.surname ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT MAX(p.duration) AS longest_duration FROM pitStops p;	formula_1
SELECT MIN(r.time) AS fastest_lap_time FROM lapTimes r;	formula_1
SELECT MAX(p.duration) FROM pitStops p JOIN drivers d ON p.driverId = d.driverId WHERE d.surname = 'Hamilton';	formula_1
SELECT p.stop, p.lap FROM pitStops p JOIN drivers d ON p.driverId = d.driverId JOIN results r ON d.driverId = r.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.year = 2011 AND r2.name = 'Australian Grand Prix');	formula_1
SELECT d.forename, d.surname, SUM(p.duration) AS total_duration FROM pitStops p JOIN drivers d ON p.driverId = d.driverId JOIN races r ON p.raceId = r.raceId WHERE r.year = 2011 GROUP BY d.forename, d.surname;	formula_1
SELECT l.time FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY l.time ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN (SELECT rt.driverId, MIN(rt.time) AS min_time FROM lapTimes rt GROUP BY rt.driverId) AS mt ON d.driverId = mt.driverId ORDER BY mt.min_time ASC NULLS LAST LIMIT 1;	formula_1
SELECT r.name AS race_name, c.name AS circuit_name, d.surname AS driver_surname, d.forename AS driver_forename, row_number() OVER(PARTITION BY r.name ORDER BY l.time ASC) AS position FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN constructors c ON r.constructorId = c.constructorId JOIN lapTimes l ON r.resultId = l.raceId AND r.driverId = l.driverId WHERE d.driverRef = 'hamilton' AND l.time = (SELECT MIN(l2.time) FROM lapTimes l2 WHERE l2.raceId = r.raceId AND l2.driverId = r.driverId);	formula_1
SELECT MIN(l.time) FROM lapTimes l WHERE l.raceId IN (SELECT r.raceId FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix Circuit');	formula_1
SELECT c.name AS circuit, d.forename, d.surname, lt.time, lt.milliseconds FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes lt ON r.raceId = lt.raceId AND lt.position = 1 JOIN drivers d ON lt.driverId = d.driverId WHERE c.country = 'Italy';	formula_1
SELECT r.name, MIN(l.time) AS fastest_lap_time FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN races r ON l.raceId = r.raceId WHERE r.circuitId IN (SELECT c.circuitId FROM circuits c WHERE c.name = 'Red Bull Ring') GROUP BY r.name ORDER BY fastest_lap_time ASC LIMIT 1;	formula_1
SELECT r.name, d.forename, d.surname, pt.time, pt.duration FROM results AS r JOIN drivers AS d ON r.driverId = d.driverId JOIN pitStops AS pt ON r.raceId = pt.raceId WHERE r.circuitId = (SELECT c.circuitId FROM circuits c WHERE c.name = 'Austrian Grand Prix');	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE res.fastestLap = 129488;	formula_1
SELECT AVG(pitStops.milliseconds) AS average_time FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId WHERE LOWER(drivers.surname) = 'hamilton';	formula_1
SELECT AVG(lapTimes.milliseconds) AS average_lap_time FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.location = 'Italy';	formula_1
SELECT p.player_api_id FROM Player_Attributes p WHERE p.overall_rating = (SELECT MAX(p2.overall_rating) FROM Player_Attributes p2);	european_football_2
SELECT p.player_name, MAX(p.height) AS height FROM Player p GROUP BY p.player_name ORDER BY height DESC LIMIT 1;	european_football_2
SELECT pa.preferred_foot FROM Player_Attributes pa WHERE pa.potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id) FROM Player_Attributes pa WHERE pa.overall_rating >= 60 AND pa.overall_rating < 65 AND pa.defensive_work_rate = 'low';	european_football_2
SELECT p.player_api_id, MAX(pa.crossing) AS max_crossing FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id GROUP BY p.player_api_id ORDER BY max_crossing DESC LIMIT 5;	european_football_2
SELECT l.name FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' ORDER BY MAX(m.home_team_goal + m.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT m.home_team_api_id, COUNT(*) AS losses FROM Match m WHERE m.season = '2015/2016' AND (m.home_team_goal - m.away_team_goal) < 0 GROUP BY m.home_team_api_id ORDER BY losses LIMIT 1;	european_football_2
SELECT p.player_name, MAX(pa.penalties) AS max_penalties FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_name ORDER BY max_penalties DESC LIMIT 10;	european_football_2
SELECT t.team_api_id, COUNT(*) AS number_of_wins FROM Match m JOIN Team t ON (m.away_team_api_id = t.team_api_id AND m.league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League')) WHERE m.season = '2009/2010' AND (m.away_team_goal > m.home_team_goal) GROUP BY t.team_api_id ORDER BY number_of_wins DESC LIMIT 1;	european_football_2
WITH ranked_teams AS (SELECT ta.team_fifa_api_id, ta.team_api_id, ta.date, ta.buildUpPlaySpeed, RANK() OVER (ORDER BY ta.buildUpPlaySpeed DESC) AS rank FROM Team_Attributes ta) SELECT rt.team_fifa_api_id, rt.team_api_id, rt.date, rt.buildUpPlaySpeed FROM ranked_teams rt WHERE rt.rank <= 4;	european_football_2
SELECT l.name, MAX(SUM(m.home_team_goal = m.away_team_goal)) AS max_draws FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY max_draws DESC NULLS LAST LIMIT 1;	european_football_2
SELECT p.player_name, (datetime() - p.birthday) AS age FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE pa.sprint_speed >= 97 AND pa.date >= '2013-01-01 00:00:00' AND pa.date <= '2015-12-31 00:00:00';	european_football_2
SELECT l.name, MAX(COUNT(m.league_id)) AS total_matches FROM Match m JOIN League l ON m.league_id = l.id GROUP BY l.name ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT pa.player_api_id FROM Player_Attributes pa WHERE (SELECT MAX(pa2.overall_rating) FROM Player_Attributes pa2 WHERE pa2.date LIKE '2010%') = pa.overall_rating ORDER BY pa.player_api_id NULLS LAST;	european_football_2
SELECT t.team_fifa_api_id FROM Team_Attributes t WHERE t.buildUpPlaySpeed BETWEEN 51 AND 59;	european_football_2
SELECT ta.team_long_name FROM Team_Attributes ta WHERE ta.buildUpPlayPassing > (SELECT AVG(ta2.buildUpPlayPassing) FROM Team_Attributes ta2 WHERE strftime('%Y', ta2.date) = '2012');	european_football_2
SELECT DIVIDE(MULTIPLY(SUM(CASE WHEN p.preferred_foot = 'left' THEN 1 ELSE 0 END), 1.0), COUNT(p.player_fifa_api_id)) AS percentage_of_left_footed_players FROM Player_Attributes p WHERE p.birthday BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00';	european_football_2
SELECT l.name, SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM Match m JOIN League l ON m.league_id = l.id GROUP BY l.name ORDER BY total_goals ASC NULLS LAST LIMIT 5;	european_football_2
SELECT AVG(DIVIDE(SUM(t.long_shots), COUNT(t.player_fifa_api_id))) AS average_long_shots FROM Player_Attributes t WHERE t.player_api_id = 505942;	european_football_2
SELECT p.player_name, AVG(pa.heading_accuracy) AS avg_heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 GROUP BY p.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT t.team_long_name, AVG(t.chanceCreationPassing) AS average_chance_creation_passing, SUM(t.chanceCreationPassing) AS total_chance_creation_passing FROM Team_Attributes t WHERE t.buildUpPlayDribblingClass = 'Normal' AND t.date >= '2014-01-01 00:00:00' AND t.date <= '2014-12-31 00:00:00' GROUP BY t.team_long_name HAVING SUM(t.chanceCreationPassing) / NULLIF(COUNT(t.id), 0) > t.chanceCreationPassing ORDER BY total_chance_creation_passing DESC;	european_football_2
SELECT l.name FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2009/2010' AND AVG(m.home_team_goal) > AVG(m.away_team_goal);	european_football_2
SELECT t.team_short_name FROM Team t WHERE t.team_long_name = 'Queens Park Rangers';	european_football_2
SELECT p.player_name FROM Player p WHERE CAST(substr(p.birthday, 1, 4) AS INTEGER) = 1970 AND CAST(substr(p.birthday, 6, 2) AS INTEGER) = 10;	european_football_2
SELECT pa.attacking_work_rate FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE LOWER(p.player_name) = 'franco zennaro';	european_football_2
SELECT t.team_long_name, ta.buildUpPlayPositioningClass FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE t.team_long_name = 'ADO Den Haag';	european_football_2
SELECT pa.heading_accuracy AS finishing_rate FROM Player_Attributes pa WHERE pa.date = '2014-09-18 00:00:00' AND pa.player_api_id IN (SELECT pa2.player_api_id FROM Player_Attributes pa2 WHERE pa2.player_fifa_api_id = 218353);	european_football_2
SELECT MAX(p.overall_rating) AS overall_rating FROM Player_Attributes p WHERE p.player_api_id IN (SELECT p2.player_api_id FROM Player p2 WHERE p2.player_name = 'Gabriel Tamas') AND strftime('%Y', p.date) = '2011';	european_football_2
SELECT COUNT(*) FROM Match m JOIN League l ON m.league_id = l.id WHERE LOWER(l.name) ='scotland premier league' AND m.season = '2015/2016';	european_football_2
SELECT p.preferred_foot FROM Player p ORDER BY p.birthday DESC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(pa2.potential) FROM Player_Attributes pa2);	european_football_2
SELECT COUNT(*) FROM Player p WHERE p.weight < 130 AND p.preferred_foot = 'left';	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT pa.defensive_work_rate FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'David Wilson';	european_football_2
SELECT p.birthday FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.id = (SELECT MAX(id) FROM Player_Attributes);	european_football_2
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE c.name = 'Netherlands';	european_football_2
SELECT AVG(M.home_team_goal) AS average_home_goal FROM Match M JOIN Country C ON M.country_id = C.id WHERE C.name = 'Poland' AND M.season = '2010/2011';	european_football_2
SELECT p.player_name, AVG(pa.finishing) AS avg_finishing_rate FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height = (SELECT MAX(height) FROM Player) OR p.height = (SELECT MIN(height) FROM Player) GROUP BY p.player_name ORDER BY avg_finishing_rate DESC NULLS LAST;	european_football_2
SELECT p.player_name FROM Player p WHERE p.height > 180;	european_football_2
SELECT COUNT(*) FROM Player p WHERE strftime('%Y', p.birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player p WHERE p.player_name ilike 'Adam%' AND p.weight > 170;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', pa.date) BETWEEN '2008' AND '2010' AND pa.overall_rating > 80;	european_football_2
SELECT p.overall_rating, p.potential FROM Player_Attributes p WHERE p.player_api_id = 505942;	european_football_2
SELECT pa.player_api_id, pa.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE LOWER(pa.preferred_foot) = 'left';	european_football_2
SELECT t.team_long_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT ta.buildUpPlayPassingClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE LOWER(t.team_short_name) = 'clb';	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.buildUpPlayPassing > 70;	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE strftime('%Y', date) BETWEEN '2010' AND '2015' AND height > 170;	european_football_2
SELECT p.player_name, MIN(p.height) AS height FROM Player p GROUP BY p.player_name ORDER BY height ASC NULLS LAST LIMIT 1;	european_football_2
SELECT c.name FROM League l JOIN Country c ON l.country_id = c.id WHERE l.name = 'Italy Serie A';	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_fifa_api_id = t.team_fifa_api_id WHERE ta.buildUpPlaySpeed = 31 AND ta.buildUpPlayDribbling = 53 AND ta.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(pa.overall_rating) AS average_overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(*) AS matches_count FROM Match m JOIN League l ON m.league_id = l.id WHERE l.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', m.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT t.team_short_name FROM Match m JOIN Team t ON m.home_team_api_id = t.team_api_id WHERE m.home_team_goal = 10;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.balance = (SELECT MAX(pa2.balance) FROM Player_Attributes pa2 WHERE pa2.potential = 61);	european_football_2
SELECT (SELECT AVG(ball_control WHERE player_name = 'Abdou Diallo') - AVG(ball_control WHERE player_name = 'Aaron Appindangoye')) AS difference_of_average_ball_control;	european_football_2
SELECT t.team_long_name FROM Team t WHERE t.team_short_name = 'GEN';	european_football_2
SELECT pl1.player_name, pl2.player_name FROM Player pl1 JOIN Player pl2 ON pl1.player_api_id = pl2.player_api_id WHERE pl1.player_name = 'Aaron Lennon' AND pl2.player_name = 'Abdelaziz Barrada' ORDER BY pl1.birthday DESC, pl2.birthday ASC LIMIT 1;	european_football_2
SELECT p.player_name, MAX(p.height) AS height FROM Player p GROUP BY p.player_name ORDER BY height DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa WHERE pa.preferred_foot = 'left' AND pa.attacking_work_rate ='medium';	european_football_2
SELECT c.name FROM League l JOIN Country c ON l.country_id = c.id WHERE l.name = 'Belgium Jupiler League';	european_football_2
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE c.name = 'Germany';	european_football_2
SELECT p.player_name, p.player_fifa_api_id, p.player_api_id, pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(pa2.overall_rating) FROM Player_Attributes pa2);	european_football_2
SELECT COUNT(*) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', p.birthday)<'1986' AND pa.defensive_work_rate='high';	european_football_2
SELECT p.player_name, MAX(pa.crossing) AS max_crossing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') GROUP BY p.player_name ORDER BY max_crossing DESC NULLS LAST LIMIT 1;	european_football_2
SELECT pa.heading_accuracy FROM Player_Attributes pa WHERE pa.player_api_id = (SELECT p.player_api_id FROM Player p WHERE p.player_name = 'Ariel Borysiuk');	european_football_2
SELECT COUNT(*) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 AND pa.volleys > 70;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match m JOIN Country c ON m.country_id = c.id WHERE c.name = 'Belgium' AND m.season = '2008/2009';	european_football_2
SELECT MAX(p.overall_rating) AS overall_rating, MAX(p.long_passing) AS long_passing FROM Player p ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Match m JOIN League l ON m.league_id = l.id WHERE l.name = 'Belgium Jupiler League' AND strftime('%Y', m.date) = '2009' AND strftime('%m', m.date) = '04';	european_football_2
SELECT m.league_id FROM Match m WHERE m.season = '2008/2009' GROUP BY m.league_id ORDER BY COUNT(m.match_api_id) DESC LIMIT 1;	european_football_2
SELECT AVG(p.overall_rating) AS average_overall_rating FROM Player p WHERE strftime('%Y', p.birthday) < '1986';	european_football_2
SELECT (SELECT (pa.overall_rating - (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel')) / (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel') * 100) AS percentage FROM Player_Attributes pa WHERE pa.player_name = 'Ariel Borysiuk';	european_football_2
SELECT AVG(t.buildUpPlaySpeed) AS average_build_up_play_speed FROM Team t WHERE t.team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating) AS average_overall_rating FROM Player_Attributes T1 WHERE T1.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(pa.crossing) AS total_crossing_score FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(t.buildUpPlayPassing) AS highest_passing_score, t.buildUpPlayPassingClass AS passing_class FROM Team_Attributes t JOIN Team t2 ON t.team_fifa_api_id = t2.team_fifa_api_id WHERE LOWER(t2.team_long_name) = 'ajax';	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_fifa_api_id IN (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Abdou Diallo');	european_football_2
SELECT MAX(t1.overall_rating) AS highest_overall_rating FROM Player_Attributes t1 JOIN Player t2 ON t1.player_api_id = t2.player_api_id WHERE t2.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(M.away_team_goal) AS average_goals FROM Match M JOIN Team T ON M.away_team_api_id = T.team_api_id WHERE T.team_long_name = 'Parma';	european_football_2
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.date = '2016-06-23' AND pa.overall_rating = 77 ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'Aaron Mooy' AND pa.date = '2016-02-04 00:00:00';	european_football_2
SELECT t.player_api_id, t.player_name, t.date, t.overall_rating, t.potential FROM Player_Attributes t WHERE t.player_name = 'Francesco Parravicini' AND t.date = '2010-08-30 00:00:00';	european_football_2
SELECT t.attacking_work_rate FROM Player_Attributes t WHERE t.player_name = 'Francesco Migliore' AND t.date = '2015-05-01 00:00:00';	european_football_2
SELECT da.defensive_work_rate FROM Player_Attributes da WHERE da.player_name = 'Kevin Berigaud' AND da.date = '2013-02-22 00:00:00';	european_football_2
SELECT MIN(date) AS first_date FROM Player_Attributes pa WHERE pa.player_api_id IN (SELECT pa2.player_api_id FROM Player_Attributes pa2 WHERE pa2.player_name = 'Kevin Constant' AND pa2.crossing = (SELECT MAX(crossing) FROM Player_Attributes)) AND pa.player_name = 'Kevin Constant';	european_football_2
SELECT t.buildUpPlaySpeedClass FROM Team_Attributes t JOIN Team ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE ta.team_long_name = 'Willem II' AND t.date = '2012-02-22 00:00:00';	european_football_2
SELECT t.buildUpPlayDribblingClass FROM Team_Attributes t WHERE t.date = '2015-09-10 00:00:00' AND t.team_short_name = 'LEI';	european_football_2
SELECT t.buildUpPlayPassingClass FROM Team t JOIN Team_Attributes ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE t.team_long_name = 'FC Lorient' AND ta.date = '2010-02-22';	european_football_2
SELECT ta.buildUpPlayPassingClass FROM Player_Attributes pa JOIN Team t ON pa.player_api_id = t.team_api_id JOIN Team_Attributes ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE t.team_long_name = 'PEC Zwolle' AND pa.date = '2013-09-20 00:00:00';	european_football_2
SELECT t.team_long_name, ta.buildUpPlayCrossingClass FROM Team t JOIN Match m ON t.team_api_id = m.home_team_api_id OR t.team_api_id = m.away_team_api_id JOIN Team_Attributes ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE t.team_long_name = 'Hull City' AND m.date = '2010-02-22 00:00:00';	european_football_2
SELECT t.team_long_name, ta.defenceAggression FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE t.team_long_name = 'Hannover 96' AND ta.date = '2015-09-10 00:00:00';	european_football_2
SELECT AVG(pa.overall_rating) FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'Marko Arnautovic' AND pa.date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00';	european_football_2
SELECT (pa1.overall_rating - pa2.overall_rating)::FLOAT / NULLIF(pa1.overall_rating, 0) * 100 AS percentage FROM Player_Attributes pa1 JOIN Player_Attributes pa2 ON pa1.date = '2013-07-12' WHERE pa1.player_name = 'Landon Donovan' AND pa2.player_name = 'Jordan Bowery';	european_football_2
SELECT p.player_name FROM Player p WHERE p.height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT p.player_api_id FROM Player p ORDER BY p.weight DESC LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p WHERE datetime(CURRENT_TIMESTAMP,'localtime') - datetime(p.birthday) > 34;	european_football_2
SELECT SUM(m.home_team_goal) AS total_goals FROM Match m JOIN Player p ON m.home_player_1 = p.player_api_id OR m.home_player_2 = p.player_api_id OR m.home_player_3 = p.player_api_id OR m.home_player_4 = p.player_api_id OR m.home_player_5 = p.player_api_id OR m.home_player_6 = p.player_api_id OR m.home_player_7 = p.player_api_id OR m.home_player_8 = p.player_api_id OR m.home_player_9 = p.player_api_id OR m.home_player_10 = p.player_api_id OR m.home_player_11 = p.player_api_id WHERE LOWER(p.player_name) = 'aaron lennon';	european_football_2
SELECT SUM(CASE WHEN m.away_player_1 = p.player_api_id THEN m.away_team_goal ELSE 0 END) AS daan_smith_goals, SUM(CASE WHEN m.away_player_2 = p.player_api_id THEN m.away_team_goal ELSE 0 END) AS filipe_ferreira_goals FROM Match m JOIN Player p ON m.away_player_1 = p.player_api_id OR m.away_player_2 = p.player_api_id WHERE p.player_name = 'Daan Smith' OR p.player_name = 'Filipe Ferreira';	european_football_2
SELECT SUM(M.home_team_goal) AS total_home_team_goals FROM Match M JOIN Player P ON M.home_player_1 = P.player_api_id OR M.home_player_2 = P.player_api_id OR M.home_player_3 = P.player_api_id OR M.home_player_4 = P.player_api_id OR M.home_player_5 = P.player_api_id OR M.home_player_6 = P.player_api_id OR M.home_player_7 = P.player_api_id OR M.home_player_8 = P.player_api_id OR M.home_player_9 = P.player_api_id OR M.home_player_10 = P.player_api_id OR M.home_player_11 = P.player_api_id WHERE (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM CAST(birthday AS DATE)) < 31) AND (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM CAST(birthday AS DATE)) >= 0);	european_football_2
SELECT p.player_name, MAX(pa.overall_rating) AS overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_name ORDER BY overall_rating DESC LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.attacking_work_rate = 'high';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY (CURRENT_TIMESTAMP - p.birthday) ASC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Country c ON p.player_fifa_api_id = c.id WHERE LOWER(c.name) = 'belgium';	european_football_2
SELECT p.player_name, p.country FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.vision > 89;	european_football_2
SELECT p.player_name, MAX(AVG(p.weight)) AS heaviest_avg_weight FROM Player p GROUP BY p.player_name;	european_football_2
SELECT t.team_long_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT t.team_short_name FROM Match m JOIN Team t ON m.home_team_api_id = t.team_api_id WHERE m.country_id = 201 AND m.league_id = 1 AND m.stage = 1 AND m.date BETWEEN '2015-09-01' AND '2015-09-30' AND m.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(p.height) FROM Player p JOIN "Player_Attributes" pa ON p.player_api_id = pa.player_api_id JOIN "Team" t ON pa.team_fifa_api_id = t.team_fifa_api_id JOIN League l ON t.team_api_id = l.id JOIN Country c ON l.country_id = c.id WHERE c.name = 'Italy';	european_football_2
SELECT p.player_name FROM Player p WHERE p.height > 180 ORDER BY p.player_name ASC NULLS LAST LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player p WHERE p.player_name LIKE 'Aaron%' AND p.birthday > '1990';	european_football_2
SELECT (SELECT jumping FROM Player_Attributes WHERE id = 6) - (SELECT jumping FROM Player_Attributes WHERE id = 23) AS difference;	european_football_2
SELECT p.id, p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.preferred_foot = 'right' AND pa.potential = (SELECT MIN(potential) FROM Player_Attributes) ORDER BY p.id LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa WHERE pa.crossing = (SELECT MAX(pa2.crossing) FROM Player_Attributes pa2) AND pa.preferred_foot = 'left';	european_football_2
SELECT CAST(COUNT(CASE WHEN p.stamina > 80 AND p.strength > 80 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM Player_Attributes p;	european_football_2
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE l.name = 'Ekstraklasa' AND c.name = 'Poland';	european_football_2
SELECT m.home_team_goal AS home_score, m.away_team_goal AS away_score FROM Match m WHERE m.date LIKE '%2008-09-24%';	european_football_2
SELECT p.sprint_speed, p.agility, p.acceleration FROM Player_Attributes p JOIN Player pa ON p.player_api_id = pa.player_api_id WHERE pa.player_name = 'Alexis Blin';	european_football_2
SELECT t.buildUpPlaySpeedClass FROM Team t WHERE t.team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*) AS total_games FROM Match WHERE league_id IN (SELECT id FROM League WHERE name = 'Italian Serie A') AND season = '2015/2016';	european_football_2
SELECT MAX(m.home_team_goal) AS highest_score FROM Match m JOIN Team t ON m.home_team_api_id = t.team_api_id JOIN League l ON t.team_fifa_api_id = l.id WHERE LOWER(l.name) = 'eredivisie' AND l.country_id IN (SELECT id FROM Country WHERE LOWER(name) = 'netherlands');	european_football_2
SELECT p.player_name, pa.finishing, pa.curve FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.weight = (SELECT MAX(weight) FROM Player);	european_football_2
SELECT t.team_long_name, COUNT(m.id) AS total_games FROM Team t JOIN Match m ON t.team_api_id = m.home_team_api_id OR t.team_api_id = m.away_team_api_id WHERE m.date BETWEEN '2015-08-01' AND '2016-05-31' GROUP BY t.team_long_name ORDER BY total_games DESC LIMIT 1;	european_football_2
SELECT t.team_long_name FROM Match m JOIN Team t ON m.away_team_api_id = t.team_api_id WHERE m.away_team_goal = (SELECT MAX(m2.away_team_goal) FROM Match m2);	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(pa2.overall_rating) FROM Player_Attributes pa2);	european_football_2
SELECT DIVIDE(COUNT(CASE WHEN p.height < 180 AND p.overall_rating > 70 THEN 1 END), COUNT(*)) * 100 AS percentage FROM Player_Attributes p;	european_football_2
SELECT CAST((COUNT(DISTINCT CASE WHEN p.SEX = 'M' AND p.Admission = '+' THEN p.ID ELSE NULL END) - COUNT(DISTINCT CASE WHEN p.SEX = 'M' AND p.Admission = '-' THEN p.ID ELSE NULL END)) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN p.SEX = 'M' AND p.Admission = '+' THEN p.ID ELSE NULL END), 0) * 100 AS percentage_difference FROM Patient p;	thrombosis_prediction
SELECT DIVIDE(COUNT(DISTINCT p.ID) WHERE EXTRACT(YEAR FROM p.Birthday) > 1930 AND p.SEX = 'F'), (COUNT(DISTINCT p.ID) WHERE p.SEX = 'F') AS percentage FROM Patient p;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN p.Admission = '+' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS proportion_inpatient FROM Patient p WHERE EXTRACT(YEAR FROM p.Birthday) BETWEEN 1930 AND 1940;	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN Admission = '+' THEN ID ELSE NULL END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN Admission = '-' THEN ID ELSE NULL END), 0) AS ratio FROM Patient WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT e.Diagnosis, l.Date FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.ID = 30609;	thrombosis_prediction
SELECT p.SEX, p.Birthday, e.`Examination Date`, e.Symptoms FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 163109;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 500;	thrombosis_prediction
SELECT e.ID, age() - age(p.Birthday) AS age FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.RVVT = '+' ORDER BY age NULLS LAST;	thrombosis_prediction
SELECT p.ID, p.SEX, e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 2;	thrombosis_prediction
SELECT p.ID, p.Description FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE EXTRACT(YEAR FROM p.Birthday) = 1937 AND l.T_CHO >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT DIVIDE(COUNT(CASE WHEN P.SEX = 'F' AND L.TP < '6.0' OR L.TP > '8.5' THEN P.ID END), COUNT(P.ID)) * 100 AS percentage FROM Patient P JOIN Laboratory L ON P.ID = L.ID;	thrombosis_prediction
SELECT AVG(e.aCL IgG) AS average_aCL_IgG FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Description = '+' AND EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.Birthday)) >= 50;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND EXTRACT(YEAR FROM p.Description) = 1997 AND e.Admission = '-';	thrombosis_prediction
SELECT MIN(age) AS youngest_age FROM (SELECT EXTRACT(YEAR FROM age) AS age FROM (SELECT age FROM Patient, Examination WHERE Examination.ID = Patient.ID) AS subquery);	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 1 AND p.SEX = 'F' AND EXTRACT(YEAR FROM e.`Examination Date`) = 1997;	thrombosis_prediction
SELECT MAX(year(Birthday)) - MIN(year(Birthday)) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200;	thrombosis_prediction
SELECT p.description, p.diagnosis FROM Patient p WHERE p.birthday = (SELECT MIN(birthday) FROM Patient); SELECT e.symptoms, e.diagnosis FROM Examination e WHERE e.id = (SELECT id FROM Patient p WHERE p.birthday = (SELECT MIN(birthday) FROM Patient));	thrombosis_prediction
SELECT DIVIDE(COUNT(DISTINCT l.ID), 12) AS average_patients_per_month FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.SEX = 'M' AND p.Birthday BETWEEN '1998-01-01' AND '1998-12-31';	thrombosis_prediction
SELECT MAX(l.Date), p.Birthday FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.Diagnosis ilike '%SJS%' ORDER BY MAX(l.Date) NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT DIVIDE(SUM(CASE WHEN UA <= 8.0 AND P.SEX = 'M' THEN 1 ELSE 0 END), SUM(CASE WHEN UA <= 6.5 AND P.SEX = 'F' THEN 1 ELSE 0 END)) AS ratio FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE UA <= 8.0 AND P.SEX IN ('M', 'F');	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE (EXTRACT(YEAR FROM e.`Examination Date`) - EXTRACT(YEAR FROM p.`First Date`)) >= 1;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE EXTRACT(YEAR FROM p.Birthday) < 18 AND EXTRACT(YEAR FROM e.`Examination Date`) BETWEEN 1990 AND 1993;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.`T-BIL` > 2.0;	thrombosis_prediction
SELECT e.Diagnosis, COUNT(e.Diagnosis) AS COUNT FROM Examination e WHERE e.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY e.Diagnosis ORDER BY COUNT DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, Birthday))) AS average_age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
SELECT age, Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID ORDER BY age DESC, hgb DESC LIMIT 1;	thrombosis_prediction
SELECT e.`aCL IgG` AS ANA_G, e.`aCL IgM` AS ANA_M, e.`aCL IgA` AS ANA_A FROM Examination e WHERE e.ID = 3605340 AND e.`Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT l.T-CHO FROM Laboratory l WHERE l.ID = 2927464 AND l.Date = '1995-09-04' AND l.T-CHO < 250;	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Description = 'AORTITIS' ORDER BY p.ID ASC LIMIT 1;	thrombosis_prediction
SELECT e.aCL IgM FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Description = '1994-02-19' AND e.`Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT = 9 AND l.Date = '1992-06-12';	thrombosis_prediction
SELECT SUBTRACT('1992', YEAR(Birthday)) AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UA = '8.4' AND l.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(l.ID) AS total_tests FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.`First Date` = '1991-06-13' AND l.Date BETWEEN '1995-01-01' AND '1995-12-31' AND p.Diagnosis LIKE '%SJS%';	thrombosis_prediction
SELECT p.Description FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID IN (SELECT e.ID FROM Examination e WHERE e.`Examination Date` = '1997-01-27' AND e.Diagnosis = 'SLE') AND p.`First Date` = (SELECT MIN(p2.`First Date`) FROM Patient p2 WHERE p2.ID = p.ID);	thrombosis_prediction
SELECT e.Symptoms FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday = '1959-03-01' AND e.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT SUBTRACT(SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date like '1981-11-%' THEN l.`T-CHO` END), SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date like '1981-12-%' THEN l.`T-CHO` END)) AS decrease_rate FROM Patient p JOIN Laboratory l ON p.ID = l.ID;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis ilike '%Behcet%' AND EXTRACT(YEAR FROM e.`Examination Date`) >= 1997 AND EXTRACT(YEAR FROM e.`Examination Date`) < 1998 ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND l.GPT > 30 AND l.ALB < 4 ORDER BY p.ID;	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE p.SEX = 'F' AND EXTRACT(YEAR FROM p.Birthday) = 1964 AND p.Admission = '+' ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.Thrombosis = 2 AND e.ANA = 'S' AND e.`aCL IgM` > (SELECT AVG(e2.`aCL IgM`) * 1.2);	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN UA <= 6.5 AND `U-PRO` > 0 AND `U-PRO` < 30 THEN ID END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN ID END), 0) * 100 AS percentage; FROM Laboratory;	thrombosis_prediction
SELECT DIVIDE(SUM(CASE WHEN p.Diagnosis = 'BEHCET' THEN 1 ELSE 0 END), COUNT(*), 100) AS percentage FROM Patient p WHERE p.SEX = 'M' AND EXTRACT(YEAR FROM p.`First Date`) = 1981;	thrombosis_prediction
SELECT p.ID, p.DESCRIPTION FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.admission = '-' AND l.date like '1991-10%' AND l.T_BIL < 2.0 ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p WHERE p.SEX = 'F' AND p.BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31' AND p.ID NOT IN (SELECT e.ID FROM Examination e WHERE e.`ANA Pattern` = 'P');	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'PSS' AND l.CRP > 2 AND l.CRE = 1 AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(L.ALB) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.PLT > 400 AND P.SEX = 'F' AND P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT MAX(e.Symptoms) AS most_common_symptom FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Diagnosis = 'SLE';	thrombosis_prediction
SELECT p.Description, p.Diagnosis FROM Patient p WHERE p.ID = 48473;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND e.Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS number_of_patients FROM Examination e WHERE YEAR(e.`Examination Date`) = 1997 AND (e.TP > 6 AND e.TP < 8.5);	thrombosis_prediction
SELECT (COUNT(CASE WHEN e.Thrombosis > 0 AND p.Diagnosis LIKE '%SLE%' THEN 1 END)::FLOAT / NULLIF(COUNT(CASE WHEN p.Diagnosis LIKE '%SLE%' THEN 1 END), 0)) * 100 AS proportion FROM Patient p JOIN Examination e ON p.ID = e.ID;	thrombosis_prediction
SELECT (COUNT(CASE WHEN P.SEX = 'F' THEN 1 END)::FLOAT / NULLIF(COUNT(P.SEX), 0)) * 100 AS percentage FROM Patient P WHERE YEAR(P.Birthday) = 1980 AND P.Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND p.Diagnosis = 'BEHCET' AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination Date`, `First Date`) AS days_to_examination FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 821298;	thrombosis_prediction
SELECT l.UA FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.ID = 57266 AND ((l.UA > 8.0 AND p.SEX = 'M') OR (l.UA > 6.5 AND p.SEX = 'F'));	thrombosis_prediction
SELECT l.date FROM laboratory l JOIN patient p ON l.id = p.id WHERE l.id = 48473 AND l.got >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ID IN (SELECT l.ID FROM Laboratory l WHERE l.ID IN (SELECT Date FROM Laboratory WHERE YEAR(Date) = 1994) AND GOT < 60);	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GPT >= 60;	thrombosis_prediction
SELECT p.Diagnosis, MAX(p.Birthday) FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.GPT > 60 GROUP BY p.Diagnosis ORDER BY MAX(p.Birthday) ASC;	thrombosis_prediction
SELECT AVG(LD) AS average_ld FROM Laboratory WHERE LD < 500;	thrombosis_prediction
SELECT p.ID, age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT EXTRACT(MONTH FROM e."Examination Date") AS MONTH, COUNT(*) AS number_of_patients, SUM(CASE WHEN p.Admission = '+' THEN 1 ELSE 0 END) AS inpatients, SUM(CASE WHEN p.Admission = '-' THEN 1 ELSE 0 END) AS outpatients FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e."Examination Date" BETWEEN '1992-01-01' AND '1999-12-31' AND e."Examination Date" <= CURRENT_DATE AND e."Examination Date" >= '1992-01-01' AND e."Examination Date" <= CURRENT_DATE AND e.ALP < 300 GROUP BY MONTH ORDER BY MONTH;	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE EXTRACT(MONTH FROM p.Birthday) = 4 AND EXTRACT(DAY FROM p.Birthday) = 1 AND EXTRACT(YEAR FROM p.Birthday) = 1982 AND (SELECT l.ALP FROM Laboratory l WHERE l.ID = p.ID AND l.Date = (SELECT MAX(l2.Date) FROM Laboratory l2 WHERE l2.ID = p.ID)) < 300;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT s.ID, s.Date, s.TP, s.TP - 8.5 AS deviation FROM Laboratory s JOIN Patient p ON s.ID = p.ID WHERE p.SEX = 'F' AND s.TP > 8.5;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND (l.ALB <= 3.5 OR l.ALB >= 5.5) ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT p.ID, p.Description, l.Date, l.ALB FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE Year(p.Birthday) = '1982' AND l.ALB BETWEEN 3.5 AND 5.5;	thrombosis_prediction
SELECT CAST(COUNT(*) filter (WHERE (l.ua > 8.0 AND p.sex = 'M') OR (l.ua > 6.5 AND p.sex = 'F')) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM Patient p JOIN Laboratory l ON p.id = l.id WHERE p.sex = 'F';	thrombosis_prediction
SELECT AVG(L.UA) AS average_UA FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE (L.UA < 8.0 AND P.SEX = 'M') OR (L.UA < 6.5 AND P.SEX = 'F');	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'RA' AND l.UN < 30;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.CRE >= 1.5;	thrombosis_prediction
SELECT CASE WHEN SUM(CASE WHEN P.SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END) THEN 'TRUE' ELSE 'FALSE' END AS answer FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRE >= 1.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, MAX(l.`T-BIL`) AS max_t_bil FROM Patient p JOIN Laboratory l ON p.ID = l.ID GROUP BY p.ID, p.SEX, p.Birthday ORDER BY max_t_bil DESC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT p.SEX, COUNT(*) AS patient_count FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.TBIL >= 2.0 GROUP BY p.SEX;	thrombosis_prediction
SELECT p.ID, MAX(l.T-CHO) AS T_CHO FROM Patient p JOIN Laboratory l ON p.ID = l.ID GROUP BY p.ID ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT AVG(DIVIDE(SUM(SUBTRACT(YEAR(NOW()), YEAR(p.Birthday))), COUNT(p.ID))) AS average_age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.`T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.Description FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.TG > 300;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200 AND EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e WHERE e.CPK < 250 AND e.Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday BETWEEN '1936-01-01' AND '1956-12-31' AND p.SEX = 'M' AND l.CPK >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU >= 180 AND l.`T-CHO` < 250;	thrombosis_prediction
SELECT p.ID, l.GLU FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Description >= '1991' AND l.GLU < 180;	thrombosis_prediction
SELECT p.ID AS patient_id, p.SEX, p.Birthday, date('now') - p.Birthday AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.WBC <= 3.5 OR l.WBC >= 9.0 ORDER BY p.SEX, age ASC;	thrombosis_prediction
SELECT p.ID, p.Diagnosis, EXTRACT(YEAR FROM age(now(), p.Birthday)) AS age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID IN (SELECT e2.ID FROM Examination e2 WHERE e2.RBC < 3.5);	thrombosis_prediction
SELECT p.ID, p.Description, l.RBC FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND (SUBTRACT(YEAR(CURRENT_TIMESTAMP()), YEAR(p.Birthday)) >= 50) AND ((l.RBC <= 3.5) OR (l.RBC >= 6.0)) AND (l.RBC IS NOT NULL);	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.HGB < 10;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND p.Birthday = (SELECT MIN(Birthday) FROM Patient p2 WHERE p2.ID IN (SELECT ID FROM Examination WHERE Diagnosis = 'SLE')) AND 10 < (SELECT HGB FROM Laboratory WHERE ID = p.ID) AND (SELECT HGB FROM Laboratory WHERE ID = p.ID) < 17;	thrombosis_prediction
SELECT p.ID, age FROM Patient p JOIN (SELECT l.ID FROM Laboratory l GROUP BY l.ID HAVING COUNT(l.ID) > 2) AS recent_labs ON p.ID = recent_labs.ID WHERE p.ID IN (SELECT l.ID FROM Laboratory l WHERE l.HCT >= 52);	thrombosis_prediction
SELECT AVG(L.HCT) AS average_hematocrit FROM Laboratory L WHERE L.Date LIKE '1991%' AND L.HCT < 29;	thrombosis_prediction
SELECT (SELECT COUNT(*) FROM Laboratory l WHERE l.PLT < 100) - (SELECT COUNT(*) FROM Laboratory l WHERE l.PLT > 400) AS difference;	thrombosis_prediction
SELECT p.id, p.sex, p.birthday, l.plt FROM patient p JOIN laboratory l ON p.id = l.id WHERE date like '1984%' AND (EXTRACT(YEAR FROM age(CURRENT_DATE, birthday)) < 50) AND (l.plt BETWEEN 100 AND 400);	thrombosis_prediction
SELECT MULTIPLY(DIVIDE(SUM(CASE WHEN L.PT >= 14 AND P.SEX = 'F' THEN 1 ELSE 0 END), SUM(CASE WHEN L.PT >= 14 THEN 1 ELSE 0 END)), 1.0) AS percentage FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(P.Birthday)) > 55 AND L.PT >= 14 AND P.SEX = 'F';	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Description, p.`First Date`, p.Admission, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID AND l.Date = (SELECT MAX(l2.Date) FROM Laboratory l2 WHERE l2.ID = l.ID) WHERE p.`First Date` > '1992-01-01' AND l.PT < 14 ORDER BY p.ID NULLS LAST;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.`Examination Date` > '1997-01-01' AND e.APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.APTT > 45 AND e.Thrombosis = 3;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.WBC BETWEEN 3.5 AND 9.0 AND (l.FG <= 150 OR l.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday > '1980-01-01' AND (l.FG < 150 OR l.FG > 450);	thrombosis_prediction
SELECT DISTINCT p.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`U-PRO` >= 30;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.`U-PRO` BETWEEN 0 AND 30 AND e.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.IGG < 900 AND p.Symptoms = 'abortion';	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.IGG BETWEEN 900 AND 2000 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Description FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`aCL IgA` = (SELECT MAX(IGA) FROM Examination WHERE IGA BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`aCL IgA` BETWEEN 80 AND 500 AND YEAR(p.`First Date`) >= 1990;	thrombosis_prediction
SELECT p.Diagnosis, COUNT(*) AS COUNT FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.IGM NOT BETWEEN 40 AND 400 GROUP BY p.Diagnosis ORDER BY COUNT DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l WHERE l.CRP IS NULL AND (l.CRP LIKE '+' OR l.CRP LIKE '-' OR l.CRP < 1.0);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRP NOT IN ('+', '-') AND l.CRP >= 1.0 AND (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Birthday)) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Diagnosis ilike '%-%' AND e.KCT = '+';	thrombosis_prediction
SELECT e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE YEAR(p.Birthday) >= 1995 AND e.RA IN ('-', '+-');	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE (SELECT COUNT(*) FROM Laboratory l WHERE p.ID = l.ID AND l.RF < 20) > 0 AND (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.RF < 20 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.C3 > 35 AND e.ANA Pattern = 'P';	thrombosis_prediction
SELECT e.ID FROM Examination e WHERE e.`aCL IgA` = (SELECT MAX(e2.`aCL IgA`) FROM Examination e2 WHERE e2.`aCL IgA` > 29 AND e2.`aCL IgA` < 52);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.Thrombosis = 1 AND e.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RNP IN ('-', '+-');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RNP NOT IN('-','+') ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.Symptoms = 'SM' AND e.Thrombosis = 1;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SM NOT IN ('-', '+-') ORDER BY p.Birthday ASC NULLS LAST LIMIT 3;	thrombosis_prediction
SELECT e.ID FROM Examination e WHERE e.`Examination Date` >= '1997-01-01' AND e.Symptoms IN ('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.LAC = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE LOWER(e.SSA) IN ('-','+') AND YEAR(p.`First Date`) < 1990;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SSA NOT IN ('-', '+-') ORDER BY p.`First Date` ASC NULLS LAST LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.SSB IN ('-', '+-') AND e.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SSB IN ('-', '+-') AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.CENTROMEA IN ('-', '+-') AND p.SEX = 'M';	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`DNA-II` >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.`DNA-II` IS NULL AND e.`DNA-II` < 8;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS number_of_patients FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`DNA-II` >= 8 AND p.Admission = '+';	thrombosis_prediction
SELECT (COUNT(DISTINCT e.ID) * 1.0 / NULLIF(COUNT(DISTINCT l.ID), 0)) AS proportion FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Diagnosis = 'SLE' AND l.GOT >= 60;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GOT < 60;	thrombosis_prediction
SELECT MAX(P.Birthday) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT >= 60;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 60 ORDER BY l.GPT DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND p.SEX = 'M';	thrombosis_prediction
SELECT MIN(e.`First Date`) AS min_date FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.LAC IS NOT NULL AND e.LAC = 'MCTD, AMI' AND e.Symptoms IS NOT NULL AND e.Symptoms LIKE '%vertigo%';	thrombosis_prediction
SELECT MAX(p.First Date) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.ID = (SELECT MAX(e2.ID) FROM Examination e2 WHERE e2.LDH >= 500);	thrombosis_prediction
SELECT COUNT(*) AS number_of_patients FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.ALP >= 300 AND p.Admission = '+';	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.ALP < 300 AND e.Admission = '-';	thrombosis_prediction
SELECT e.Diagnosis FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Diagnosis = 'SJS' AND e.TP > 6.0 AND e.TP < 8.5;	thrombosis_prediction
SELECT e.`Examination Date` FROM Examination e WHERE e.ALB = (SELECT MAX(e2.ALB) FROM Examination e2 WHERE e2.ALB > 3.5 AND e2.ALB < 5.5);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT e.aCL_IgG, e.aCL_IgM, e.aCL_IgA FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID WHERE p.SEX = 'F' AND l.UA > 6.50 ORDER BY l.UA DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(e.ANA) AS highest_ana FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.CRE < 1.5;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.CRE < 1.5 ORDER BY e.aCL IgA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.`T-BIL` >= 2.0 AND e.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT MAX(e.`aCL IgG`) AS highest_ana_concentration FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.T_CHO >= 250 AND l.KCT = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.`T-CHO` < 250 AND e.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.TG < 200 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis, MAX(l.TG) AS max_triglyceride FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG < 200 GROUP BY p.Diagnosis ORDER BY max_triglyceride DESC LIMIT 1;	thrombosis_prediction
SELECT e.ID FROM Examination e WHERE e.Thrombosis = 0 AND e.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.CPK < 250 AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+');	thrombosis_prediction
SELECT MIN(P.Birthday) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU > 180;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e WHERE e.GLU < 180 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE LOWER(p.Diagnosis) ='sle' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT e.ID FROM Examination e WHERE e.RBC <= 3.5 OR e.RBC >= 6.0 AND e.Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.PLT > 100 AND e.PLT < 400 AND p.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT e.PLT FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.PLT > 100 AND e.PLT < 400 AND p.Diagnosis = 'MCTD';	thrombosis_prediction
SELECT AVG(L.PT) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'M' AND L.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis IN (1, 2) AND l.PT < 14;	thrombosis_prediction
SELECT m.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.last_name = 'Sanders' AND m.first_name = 'Angela';	student_club
SELECT COUNT(*) FROM member m JOIN major m2 ON m.link_to_major = m2.major_id WHERE m2.department = 'Student_Club' AND m2.college = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE LOWER(ma.department) = 'art and design';	student_club
SELECT COUNT(DISTINCT a.link_to_member) AS number_of_students FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name ilike '%Women''s Soccer%';	student_club
SELECT m.phone FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*) FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.t_shirt_size = 'Medium' AND e.event_name = 'Women''s Soccer';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id JOIN major m2 ON m.link_to_major = m2.major_id WHERE m2.department = 'Student_Club' GROUP BY e.event_id, e.event_name ORDER BY COUNT(a.link_to_event) DESC LIMIT 1;	student_club
SELECT m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT DISTINCT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE a.link_to_member IN (SELECT m.member_id FROM member m WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean');	student_club
SELECT COUNT(DISTINCT a.link_to_event) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE LOWER(e.event_name) = 'Student_Club' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(*) FROM event e WHERE e.type = 'Meeting' AND e.event_id IN (SELECT a.link_to_event FROM attendance a GROUP BY a.link_to_event HAVING COUNT(a.link_to_event) > 10);	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event GROUP BY e.event_name HAVING COUNT(a.link_to_event) > 20;	student_club
SELECT AVG(DIVIDE(COUNT(e.event_id), COUNT(DISTINCT e.event_name))) AS average_attendance FROM event e WHERE e.type = 'Meeting' AND YEAR(e.event_date) = 2020;	student_club
SELECT MAX(e.cost) AS max_cost FROM expense e;	student_club
SELECT COUNT(*) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.major_name) = 'environmental engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE LOWER(ma.major_name) = 'law and constitutional studies';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.last_name = 'Ramsey' AND m.first_name = 'Sherri';	student_club
SELECT m.college FROM member m JOIN major m2 ON m.link_to_major = m2.major_id WHERE m.first_name = 'Tyler' AND m.last_name = 'Hewitt';	student_club
SELECT SUM(i.amount) FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT SUM(b.spent) FROM budget b WHERE b.event_status = 'Open' AND b.category = 'Food' AND b.link_to_event ='rec0akZnLLpGUloLH';	student_club
SELECT m.city, m.state FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.position = 'President' AND e.event_name = 'Spring Elections';	student_club
SELECT m.first_name ||'' || m.last_name AS full_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'IL';	student_club
SELECT SUM(b.spent) AS total_spent_on_advertisement FROM budget b WHERE b.category = 'Advertisement' AND b.link_to_event = (SELECT event_id FROM event WHERE event_name = 'September Meeting');	student_club
SELECT m.department FROM major m JOIN member mem ON m.major_id = mem.link_to_major WHERE mem.first_name = 'Pierce' AND mem.last_name = 'Guidi';	student_club
SELECT SUM(b.amount) AS total_budgeted_amount FROM budget b WHERE b.event_status = 'Open' AND b.link_to_event IN (SELECT event_id FROM event WHERE event_name = 'October Speaker');	student_club
SELECT e.expense_description FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE b.event_status = 'Open' AND e.expense_date = '2019-10-08' AND b.spent = 0;	student_club
SELECT AVG(e.cost) AS average_cost FROM expense e WHERE e.link_to_member IN (SELECT m.member_id FROM member m WHERE m.first_name = 'Elijah' AND m.last_name = 'Allen');	student_club
WITH total_2019 AS (SELECT SUM(b.spent) AS total_spent_2019 FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE YEAR(e.event_date) = 2019), total_2020 AS (SELECT SUM(b.spent) AS total_spent_2020 FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE YEAR(e.event_date) = 2020) SELECT total_spent_2020 - total_spent_2019 AS difference FROM total_2019, total_2020;	student_club
SELECT e.location FROM event e WHERE e.event_name = 'Spring Budget Review';	student_club
SELECT SUM(e.cost) AS total_cost FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE e.event_date = '2019-09-04' AND e.notes ilike '%Poster%';	student_club
SELECT MAX(b.amount) AS max_food_budget, b.remaining AS remaining_of_max_food_budget FROM budget b WHERE b.category = 'Food';	student_club
SELECT i.notes FROM income i WHERE i.source = 'Fundraising' AND i.date_received = '2019-09-14';	student_club
SELECT COUNT(*) FROM major m WHERE LOWER(m.college) = 'college of humanities and social sciences';	student_club
SELECT m.phone FROM member m WHERE m.first_name = 'Carlo' AND m.last_name = 'Jacobs';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Adela' AND m.last_name = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM budget b WHERE b.event_status = 'November Meeting' AND b.remaining < 0;	student_club
SELECT SUM(b.amount) AS total_budget FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'September Speaker';	student_club
SELECT b.event_status FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_date = '2019-08-20' AND b.expense_description = 'Post Cards, Posters';	student_club
SELECT m.major_name FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE m.last_name = 'Thomason' AND m.first_name = 'Brent';	student_club
SELECT COUNT(*) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.major_name = 'Human Development and Family Studies' AND m.t_shirt_size = 'Large';	student_club
SELECT z.type FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE LOWER(m.first_name) = 'christof' AND LOWER(m.last_name) = 'nielson';	student_club
SELECT m.major_name FROM member m WHERE m.position = 'Vice President';	student_club
SELECT z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT m.department FROM member m JOIN major m2 ON m.link_to_major = m2.major_id WHERE m.position = 'President';	student_club
SELECT m.last_name, m.first_name, i.date_received FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1;	student_club
SELECT DIVIDE(SUM(b.amount) FROM budget b WHERE b.category = 'Advertisement' AND b.event_status = 'Yearly Kickoff'), SUM(b.amount) FROM budget b WHERE b.category = 'Advertisement' AND b.event_status = 'October Meeting';	student_club
SELECT (SUM(b.amount WHERE b.category = 'Parking' AND b.link_to_event ='rec0dZPcWXF0QjNnE') / NULLIF(SUM(b.amount WHERE b.link_to_event ='rec0dZPcWXF0QjNnE'), 0)) * 100 AS percentage FROM budget b WHERE b.link_to_event ='rec0dZPcWXF0QjNnE';	student_club
SELECT SUM(CASE WHEN e.expense_description = 'Pizza' THEN e.cost ELSE 0 END) AS total_cost_of_pizzas FROM expense e;	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE LOWER(state) = 'va' AND LOWER(county) = 'orange';	student_club
SELECT m.department FROM major m WHERE m.college = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name ilike '%Amy%' AND m.last_name ilike '%Firth%';	student_club
SELECT e.expense_description FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT m.major_name, COUNT(m.member_id) AS member_count FROM member m GROUP BY m.major_name ORDER BY member_count DESC LIMIT 1;	student_club
SELECT m.major_name FROM member m WHERE m.phone = '809-555-3360';	student_club
SELECT e.event_name, MAX(b.amount) AS highest_budget FROM event e JOIN budget b ON e.event_id = b.link_to_event GROUP BY e.event_name ORDER BY highest_budget DESC LIMIT 1;	student_club
SELECT e.expense_id, e.expense_description, e.cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT i.date_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE LOWER(m.first_name) = 'casey' AND LOWER(m.last_name) ='mason';	student_club
SELECT COUNT(*) FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'MD';	student_club
SELECT COUNT(DISTINCT a.link_to_event) FROM "attendance" a JOIN event e ON a.link_to_event = e.event_id JOIN member m ON a.link_to_member = m.member_id WHERE m.phone = '954-555-6240';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.department) ='school of applied sciences, technology and education';	student_club
SELECT b.link_to_event, b.event_status, b.spent, b.amount, b.spent/b.amount AS ratio FROM budget b WHERE b.event_status = 'Closed' ORDER BY b.spent/b.amount DESC LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m WHERE LOWER(m.position) = 'president';	student_club
SELECT MAX(b.spent) AS max_spent FROM budget b;	student_club
SELECT COUNT(*) FROM event e WHERE e.type = 'Meeting' AND EXTRACT(YEAR FROM e.event_date::DATE) = 2020;	student_club
SELECT SUM(b.spent) AS total_spent_on_food FROM budget b WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.first_name, m.last_name HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.link_to_major = (SELECT major_id FROM major WHERE major_name = 'Interior Design') AND e.event_name = 'Community Theater';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city ilike '%Georgetown%' AND z.state ilike '%South Carolina%';	student_club
SELECT SUM(i.amount) AS total_income FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE LOWER(m.first_name) = 'grant' AND LOWER(m.last_name) = 'gilmour';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost) AS total_expense FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN expense ex ON a.link_to_member = ex.link_to_member WHERE e.event_name ilike '%Yearly Kickoff%';	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff' AND e.type = 'Meeting' AND e.status = 'Open' AND a.link_to_member = m.member_id;	student_club
SELECT m.first_name ||'' || m.last_name AS full_name, i.source, MAX(i.amount) AS total_income FROM income i JOIN member m ON i.link_to_member = m.member_id GROUP BY m.first_name, m.last_name, i.source ORDER BY total_income DESC NULLS LAST LIMIT 1;	student_club
SELECT e.event_id, e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense e1 ON b.link_to_event = e1.link_to_budget WHERE e1.cost = (SELECT MIN(cost) FROM expense);	student_club
SELECT DIVIDE(SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN e.cost ELSE 0 END), SUM(e.cost)) * 100 AS percentage FROM event e;	student_club
SELECT SUM(CASE WHEN m.major_name = 'Finance' THEN 1 ELSE 0 END)::FLOAT / NULLIF(SUM(CASE WHEN m.major_name = 'Physics' THEN 1 ELSE 0 END), 0) AS ratio FROM major m;	student_club
SELECT i.source, MAX(i.amount) AS max_amount FROM income i WHERE i.date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY i.source ORDER BY max_amount DESC NULLS LAST LIMIT 1;	student_club
SELECT m.first_name, m.last_name, m.email FROM member m WHERE m.position = 'Secretary' AND m.link_to_major IN (SELECT m.major_id FROM major WHERE m.department = 'Student Club');	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.major_name) = 'physics teaching';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.event_name = 'Community Theater' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(DISTINCT a.link_to_event) AS number_of_events_attended, m.major_name FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.last_name = 'Guidi' AND m.first_name = 'Luisa' GROUP BY m.major_name;	student_club
SELECT DIVIDE(SUM(b.spent), COUNT(b.spent)) FROM budget b WHERE b.event_status = 'Closed' AND b.category = 'Food';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Advertisement' ORDER BY b.spent DESC NULLS LAST LIMIT 1;	student_club
SELECT m.member_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT DIVIDE(SUM(CASE WHEN e.type = 'Community Service' THEN 1 ELSE 0 END), COUNT(e.event_id)) * 100 AS percentage FROM event e WHERE e.event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT SUM(e.cost) AS total_cost FROM expense e JOIN event ev ON e.link_to_event = ev.event_id WHERE e.expense_description = 'Posters' AND ev.event_name = 'September Speaker';	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC NULLS LAST LIMIT 1;	student_club
SELECT e.event_name, b.remaining FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC NULLS LAST LIMIT 1;	student_club
SELECT e.event_id, e.event_name, SUM(e.cost) AS total_cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE e.approved = 'Yes' AND e.link_to_event ='rec0akZnLLpGUloLH' GROUP BY e.event_id, e.event_name;	student_club
SELECT b.category, b.amount FROM budget b WHERE b.link_to_event IN (SELECT e.event_id FROM event e WHERE e.event_name = 'April Speaker') ORDER BY b.amount ASC;	student_club
SELECT b.link_to_event, MAX(b.amount) AS max_amount FROM budget b WHERE b.category = 'Food' GROUP BY b.link_to_event ORDER BY max_amount DESC LIMIT 1;	student_club
SELECT link_to_event, MAX(amount) AS max_amount FROM budget WHERE category = 'Advertisement' GROUP BY link_to_event ORDER BY max_amount DESC LIMIT 3;	student_club
SELECT SUM(e.cost) AS total_cost FROM expense e WHERE e.expense_description = 'Parking';	student_club
SELECT SUM(e.cost) FROM expense e WHERE e.expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event WHERE m.member_id ='rec4BLdZHS2Blfp4v' GROUP BY m.first_name, m.last_name;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT e.expense_description FROM "expense" e JOIN "member" m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large' ORDER BY e.expense_description NULLS LAST;	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT m.major_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.last_name = 'Cullen' AND m.first_name = 'Phillip';	student_club
SELECT m.position FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.major_name = 'Business';	student_club
SELECT COUNT(*) FROM member m WHERE m.link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business') AND m.t_shirt_size = 'Medium';	student_club
SELECT e.event_name, b.remaining FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;	student_club
SELECT DISTINCT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215';	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_date = '2020-03-24T12:00:00';	student_club
SELECT m.major_name FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE m.position = 'Vice President';	student_club
SELECT DIVIDE(SUM(CASE WHEN position = 'Member' AND link_to_major = 'Mathematics' THEN 1 ELSE 0 END), COUNT(member_id)) * 100 AS percentage FROM member;	student_club
SELECT e.event_name, b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215';	student_club
SELECT COUNT(*) FROM income i WHERE i.amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(DISTINCT m.major_id) FROM major m WHERE m.department = 'School of Applied Sciences, Technology and Education' AND m.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT m.last_name, m.department, m.college FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.major_name = 'Environmental Engineering';	student_club
SELECT DISTINCT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0;	student_club
SELECT z.city, z.state FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id JOIN zip_code z ON m.zip = z.zip_code WHERE mjr.department = 'Electrical and Computer Engineering' AND m.position = 'Member';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.position = 'Vice President' AND e.location = '900 E. Washington St.' AND e.type = 'Social';	student_club
SELECT m.last_name, m.position FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.position = 'Member' AND e.event_name = 'Women''s Soccer';	student_club
SELECT (COUNT(CASE WHEN i.amount = 50 THEN 1 END)::FLOAT / NULLIF(COUNT(DISTINCT m.member_id), 0)) * 100 AS percentage FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE m.t_shirt_size = 'Medium' AND m.position = 'Member';	student_club
SELECT DISTINCT z.city FROM zip_code z WHERE z.type = 'PO Box';	student_club
SELECT z.zip_code FROM zip_code z WHERE z.type = 'PO Box' AND LOWER(z.city) = 'San Juan' AND LOWER(z.state) = 'Puerto Rico';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT m.member_id, e.event_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN expense ex ON m.member_id = ex.link_to_member WHERE ex.cost > 50;	student_club
SELECT m.member_id, m.first_name, m.last_name, e.event_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE a.link_to_event IN (SELECT link_to_event FROM expense WHERE approved = 'true' AND expense_date BETWEEN '2019-01-10' AND '2019-11-19');	student_club
SELECT m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name ilike '%Katy%' AND ma.major_id ='rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE mjr.major_name = 'Business' AND mjr.department = 'Business' AND mjr.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT DISTINCT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND e.cost > 20;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.major_name) = 'education';	student_club
SELECT (SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END)::FLOAT / NULLIF(COUNT(*), 0)) * 100 AS percentage FROM budget b;	student_club
SELECT e.event_id, e.location, e.status FROM event e WHERE e.event_date BETWEEN '2019-11-01' AND '2020-03-31' ORDER BY e.event_id NULLS LAST;	student_club
SELECT e.expense_id, e.expense_description FROM expense e WHERE (SUM(e.cost) / COUNT(e.expense_id)) > 50;	student_club
SELECT m.first_name, m.last_name FROM member m WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT DIVIDE(SUM(type = 'PO Box'), COUNT(zip_code)) * 100 AS percentage_of_po_boxes FROM zip_code;	student_club
SELECT e.event_name, e.location, b.remaining FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 0;	student_club
SELECT e.event_name, e.event_date, e.type, e.notes, e.location, e.status FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN expense ex ON a.link_to_member = ex.link_to_member WHERE ex.expense_description ilike '%Pizza%' AND ex.cost > 50 AND ex.cost < 100 ORDER BY e.event_name NULLS LAST;	student_club
SELECT m.first_name, m.last_name, m.major_name, e.expense_description FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event WHERE e.cost > 100;	student_club
SELECT z.city, z.state FROM event e JOIN zip_code z ON e.location = z.city WHERE e.event_id IN (SELECT a.link_to_event FROM attendance a GROUP BY a.link_to_event HAVING COUNT(a.link_to_member) > 40);	student_club
SELECT m.member_id, SUM(e.cost) AS total_cost FROM "expense" e JOIN "attendance" a ON e.link_to_event = a.link_to_event JOIN member m ON a.link_to_member = m.member_id GROUP BY m.member_id HAVING COUNT(DISTINCT e.link_to_event) > 1 ORDER BY total_cost DESC NULLS LAST LIMIT 1;	student_club
SELECT AVG(b.spent) AS average_spent FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id JOIN budget b ON e.event_id = b.link_to_event WHERE m.position!= 'Member';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Parking' AND b.cost < (SELECT SUM(b.cost) / COUNT(b.event_status) FROM budget b WHERE b.category = 'Parking');	student_club
SELECT (SUM(e.cost) / NULLIF(COUNT(e.event_id), 0)) * 100 AS percentage FROM event e WHERE e.type = 'Game';	student_club
SELECT b.link_to_event, MAX(b.spent) AS max_spent FROM budget b JOIN expense e ON b.link_to_event = e.link_to_budget WHERE e.expense_description = 'Water, chips, cookies' GROUP BY b.link_to_event ORDER BY max_spent DESC NULLS LAST LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM "expense" e JOIN member m ON e.link_to_member = m.member_id GROUP BY m.first_name, m.last_name ORDER BY total_cost DESC NULLS LAST LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone, e.expense_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event WHERE e.cost > (SELECT AVG(cost) FROM expense) ORDER BY m.first_name NULLS LAST, m.last_name NULLS LAST;	student_club
SELECT SUBTRACT(DIVIDE(SUM(CASE WHEN m.zip = 03901 THEN 1 ELSE 0 END), COUNT(CASE WHEN m.position = 'Member' THEN 1 ELSE 0 END)), DIVIDE(SUM(CASE WHEN m.zip = 05001 THEN 1 ELSE 0 END), COUNT(CASE WHEN m.position = 'Member' THEN 1 ELSE 0 END))) AS difference FROM member m;	student_club
SELECT m.major_name FROM member m WHERE m.last_name = 'Gerke' AND m.first_name = 'Garrett';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_event WHERE e.expense_description = 'Water, Veggie tray, supplies' GROUP BY m.first_name, m.last_name;	student_club
SELECT m.last_name, m.phone FROM member m JOIN major mjr ON m.link_to_major = mjr.major_id WHERE LOWER(mjr.major_name) = 'elementary education';	student_club
SELECT b.category, b.amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'January Speaker';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT b.category FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE e.expense_description ilike '%Posters%';	student_club
SELECT m.first_name, m.last_name, m.link_to_major FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary';	student_club
SELECT SUM(b.spent) AS total_spent, e.event_name FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT m.city FROM member m JOIN member_info mi ON m.member_id = mi.member_id WHERE LOWER(mi.first_name) = 'garrett' AND LOWER(mi.last_name) = 'girke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina';	student_club
SELECT COUNT(*) FROM gasstations gs JOIN products p ON gs.segment = p.description WHERE gs.country = 'CZE' AND p.description = 'Premium';	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN c.Currency = 'CZK' THEN 1 END), 0) AS ratio FROM customers c;	debit_card_specializing
SELECT c.CustomerID, c.Currency, SUM(y.Consumption) AS total_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date BETWEEN '201201' AND '201212' AND c.Segment = 'LAM' GROUP BY c.CustomerID, c.Currency ORDER BY total_consumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(y.Consumption) / 12 AS average_monthly_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND y.Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY total_consumption DESC;	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN "yearmonth" y ON c.CustomerID = y.CustomerID WHERE y.Date BETWEEN '201201' AND '201212' AND y.Consumption < 30000 AND c.Segment = 'KAM';	debit_card_specializing
SELECT (SELECT SUM(y.Consumption) FROM yearmonth y WHERE y.CustomerID IN (SELECT c.CustomerID FROM customers c WHERE c.Currency = 'CZK') AND y.Date BETWEEN '201201' AND '201212') - (SELECT SUM(y.Consumption) FROM yearmonth y WHERE y.CustomerID IN (SELECT c.CustomerID FROM customers c WHERE c.Currency = 'EUR') AND y.Date BETWEEN '201201' AND '201212') AS difference_in_consumption;	debit_card_specializing
WITH total_consumption AS (SELECT y.Date, SUM(y.Consumption) AS total_consumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY y.Date) SELECT t.Date AS YEAR, t.total_consumption FROM total_consumption t ORDER BY t.total_consumption DESC NULLS LAST LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS total_consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID GROUP BY c.Segment ORDER BY total_consumption ASC LIMIT 1;	debit_card_specializing
SELECT EXTRACT(YEAR FROM y.Date) AS YEAR, SUM(y.Consumption) AS total_consumption FROM yearmonth y WHERE y.Date LIKE '____-' GROUP BY YEAR ORDER BY total_consumption DESC NULLS LAST LIMIT 1;	debit_card_specializing
SELECT y.Date, SUM(y.Consumption) AS total_consumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date like '2013%' AND c.Segment = 'SME' GROUP BY y.Date ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
WITH smec AS (SELECT SUM(t.amount) AS total_sme, COUNT(DISTINCT t.customerid) AS num_sme FROM transactions_1k t JOIN customers c ON t.customerid = c.customerid WHERE c.currency = 'CZK' AND EXTRACT(YEAR FROM t.date) = 2013), lame AS (SELECT SUM(t.amount) AS total_lam, COUNT(DISTINCT t.customerid) AS num_lam FROM transactions_1k t JOIN customers c ON t.customerid = c.customerid WHERE c.currency = 'CZK' AND EXTRACT(YEAR FROM t.date) = 2013), kam AS (SELECT 0 AS total_kam, 0 AS num_kam FROM dual) SELECT (smec.total_sme / NULLIF(smec.num_sme, 0)) - (lame.total_lam / NULLIF(lame.num_lam, 0)) AS diff_sme_lam, (lame.total_lam / NULLIF(lame.num_lam, 0)) - (kam.total_kam / NULLIF(kam.num_kam, 0)) AS diff_lam_kam, (smec.total_sme / NULLIF(smec.num_sme, 0)) - (kam.total_kam / NULLIF(kam.num_kam, 0)) AS diff_sme_kam FROM smec, lame, kam;	debit_card_specializing
SELECT c.segment, SUM(CASE WHEN EXTRACT(YEAR FROM t.date) = 2013 THEN t.consumption ELSE 0 END) - SUM(CASE WHEN EXTRACT(YEAR FROM t.date) = 2012 THEN t.consumption ELSE 0 END) AS increase, ((SUM(CASE WHEN EXTRACT(YEAR FROM t.date) = 2013 THEN t.consumption ELSE 0 END) - SUM(CASE WHEN EXTRACT(YEAR FROM t.date) = 2012 THEN t.consumption ELSE 0 END)) / NULLIF(SUM(CASE WHEN EXTRACT(YEAR FROM t.date) = 2013 THEN t.consumption ELSE 0 END), 0)) * 100 AS percentage_increase FROM yearmonth t JOIN customers c ON t.customerid = c.customerid WHERE c.currency = 'EUR' AND EXTRACT(YEAR FROM t.date) IN (2012, 2013) GROUP BY c.segment ORDER BY percentage_increase DESC NULLS LAST;	debit_card_specializing
SELECT SUM(y.Consumption) AS total_consumption FROM yearmonth y WHERE y.CustomerID = 6 AND y.Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT (SELECT COUNT(*) FROM gasstations gs WHERE gs.country = 'Czech Republic' AND gs.segment = 'discount') - (SELECT COUNT(*) FROM gasstations gs WHERE gs.country = 'Slovakia' AND gs.segment = 'discount') AS difference;	debit_card_specializing
SELECT ym.CustomerID, SUM(ym.Consumption) AS total_consumption FROM yearmonth ym WHERE ym.Date = '201304' AND ym.CustomerID IN (5, 7) GROUP BY ym.CustomerID;	debit_card_specializing
WITH total_sme_koruna AS (SELECT COUNT(*) AS koruna FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'CZK' AND c.Segment = 'SME'), total_sme_euro AS (SELECT COUNT(*) AS euro FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'EUR' AND c.Segment = 'SME') SELECT (koruna - euro) AS difference FROM total_sme_koruna, total_sme_euro;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND y.Date = '201310' AND c.Currency = 'EUR' ORDER BY y.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(y.Consumption) AS total_consumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date = '201305' AND c.Segment = 'KAM';	debit_card_specializing
WITH lam_customers AS (SELECT t.CustomerID FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Segment = 'LAM' AND t.Amount > 4673) SELECT (SELECT COUNT(*) FROM lam_customers) * 100.0 / NULLIF((SELECT COUNT(*) FROM customers WHERE Segment = 'LAM'), 0) AS percentage FROM dual;	debit_card_specializing
SELECT g.Country, COUNT(*) AS total_gas_stations FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Amount < t.Price * 0.8 GROUP BY g.Country ORDER BY total_gas_stations DESC NULLS LAST;	debit_card_specializing
SELECT (SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END)::FLOAT / NULLIF((SELECT COUNT(*) FROM customers), 0)) * 100 AS percentage FROM customers c;	debit_card_specializing
SELECT CAST(COUNT(*) filter (WHERE ym.Consumption > 528.3) AS FLOAT) / NULLIF(COUNT(*), 0) AS fraction FROM yearmonth ym WHERE ym.Date LIKE '201202';	debit_card_specializing
SELECT (COUNT(CASE WHEN g.Country = 'Slovakia' AND g.Segment = 'Premium' THEN 1 END) * 100.0 / NULLIF(COUNT(CASE WHEN g.Country = 'Slovakia' THEN 1 END), 0)) AS percentage FROM gasstations g;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date = '201309' GROUP BY c.CustomerID ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.segment, MIN(y.consumption) AS min_consumption FROM yearmonth y JOIN customers c ON y.customerid = c.customerid WHERE y.date = '201309' GROUP BY c.segment ORDER BY min_consumption ASC LIMIT 1;	debit_card_specializing
SELECT c.customerid, y.date, SUM(y.consumption) AS total_consumption FROM customers c JOIN yearmonth y ON c.customerid = y.customerid WHERE c.segment = 'SME' AND y.date = '201206' GROUP BY c.customerid, y.date ORDER BY total_consumption ASC LIMIT 1;	debit_card_specializing
SELECT ym.Date, ym.Consumption FROM yearmonth ym WHERE ym.Date like '2012%' ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT y.Date, SUM(y.Consumption) / 12 AS monthly_consumption FROM "yearmonth" y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR GROUP BY y.Date ORDER BY monthly_consumption DESC LIMIT 1;	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID WHERE t.Date >= '20130901' AND t.Date <= '20130930';	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '201306';	debit_card_specializing
SELECT g.ChainID FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CustomerID IN (SELECT c.CustomerID FROM customers c WHERE c.Currency = 'EUR');	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(t.Price) FROM "transactions_1k" t WHERE t.Date LIKE '%2012-01%';	debit_card_specializing
SELECT COUNT(*) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT t.ProductID, p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT t.time FROM transactions_1k t JOIN gasstations g ON t.gasstationid = g.gasstationid WHERE g.chainid = 11;	debit_card_specializing
SELECT COUNT(t.TransactionID) FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(t.Price) AS average_price FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT AVG(t.Price) AS average_price FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount) AS total_amount FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-25' GROUP BY c.CustomerID ORDER BY total_amount DESC NULLS LAST LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00';	debit_card_specializing
SELECT c.Segment FROM customers c JOIN "transactions_1k" t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(t.TransactionID) FROM transactions_1k t JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE y.Date = '2012-08-26' AND t.Time < '13:00:00' AND t.CustomerID IN (SELECT c.CustomerID FROM customers c WHERE c.Currency = 'EUR');	debit_card_specializing
SELECT c.Segment FROM customers c ORDER BY c.CustomerID ASC LIMIT 1;	debit_card_specializing
SELECT gs.Country FROM transactions_1k t JOIN gasstations gs ON t.GasStationID = gs.GasStationID WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00';	debit_card_specializing
SELECT t.ProductID FROM transactions_1k t WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT SUM(t.Amount) AS total_amount, t.Date, t.CustomerID FROM transactions_1k t WHERE t.Amount = 124.05 AND t.Date LIKE '2012-%' GROUP BY t.CustomerID, t.Date;	debit_card_specializing
SELECT COUNT(*) AS number_of_transactions FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE EXTRACT(HOUR FROM to_date(t.time,'HH24:MI')) BETWEEN 8 AND 9 AND to_date(t.time,'HH24:MI') = to_date('2012-08-26','YYYY-MM-DD') AND g.Country = 'CZE';	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date LIKE '%201306' AND y.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.CardID = 667467;	debit_card_specializing
SELECT c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.TransactionID IN (SELECT t.TransactionID FROM transactions_1k t WHERE t.Date = '2012-08-24' AND t.Amount = 548.4);	debit_card_specializing
SELECT CAST(COUNT(*) FILTER (WHERE c.Currency = 'EUR' AND y.Date = '2012-08-25') AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID;	debit_card_specializing
SELECT ((y2012.consumption - y2013.consumption) / NULLIF(y2012.consumption, 0)) AS consumption_decrease_rate FROM (SELECT ym.customerid, SUM(CASE WHEN EXTRACT(YEAR FROM ym.date) = 2012 THEN ym.consumption ELSE 0 END) AS consumption_2012, SUM(CASE WHEN EXTRACT(YEAR FROM ym.date) = 2013 THEN ym.consumption ELSE 0 END) AS consumption_2013 FROM yearmonth ym JOIN transactions_1k t ON ym.customerid = t.customerid WHERE t.amount = 634.8 AND EXTRACT(MONTH FROM ym.date) = 8 AND EXTRACT(DAY FROM ym.date) = 25 GROUP BY ym.customerid) AS y2012, y2013;	debit_card_specializing
WITH total_revenue AS (SELECT t.GasStationID, SUM(t.Amount) AS total_amount FROM transactions_1k t GROUP BY t.GasStationID) SELECT gr.GasStationID, gr.total_amount FROM total_revenue gr ORDER BY gr.total_amount DESC NULLS LAST LIMIT 1;	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN g.Segment = 'premium' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM gasstations g WHERE g.Country = 'SVK';	debit_card_specializing
SELECT SUM(t.amount) AS total_amount_spent FROM transactions_1k t WHERE t.customerid = 38508; SELECT SUM(t.amount) AS total_amount_spent_in_jan_2012 FROM transactions_1k t WHERE t.customerid = 38508 AND t.date = '201201';	debit_card_specializing
SELECT p.description, SUM(t.amount) AS total_sales FROM transactions_1k t JOIN products p ON t.productid = p.productid GROUP BY p.description ORDER BY total_sales DESC LIMIT 5;	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount) AS TotalSpent, AVG(t.Price / NULLIF(t.Amount, 0)) AS AvgPricePerItem, c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID GROUP BY c.CustomerID ORDER BY TotalSpent DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.ProductID = 2 ORDER BY t.Price DESC LIMIT 1;	debit_card_specializing
SELECT y.Date, y.Consumption, t.Price / NULLIF(t.Amount, 0) AS price_per_unit FROM "transactions_1k" t JOIN "yearmonth" y ON t.CustomerID = y.CustomerID AND t.ProductID = 5 AND y.Date like '201208%' WHERE t.Price / NULLIF(t.Amount, 0) > 29.00;	debit_card_specializing
