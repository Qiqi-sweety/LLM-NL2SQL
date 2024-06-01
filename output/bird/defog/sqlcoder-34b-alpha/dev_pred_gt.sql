SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS `Highest Eligible Free Rate` FROM frpm WHERE `County Name` = 'Alameda';	california_schools
SELECT frpm.CDSCode, frpm.`Free Meal Count (Ages 5-17)` / frpm.`Enrollment (Ages 5-17)` AS eligible_free_rate FROM frpm WHERE frpm.`District Type` = 'Continuation Schools' ORDER BY eligible_free_rate ASC LIMIT 3;	california_schools
SELECT schools.Zip FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm.`County Name` = 'Fresno' AND frpm.`Charter School (Y/N)` = 1;	california_schools
SELECT schools.mailstreet, schools.mailstrabr, schools.mailcity, schools.mailstate, schools.mailzip FROM schools JOIN frpm ON schools.cdscode = frpm."School Code" WHERE "FRPM Count (K-12)" = (SELECT MAX("FRPM Count (K-12)") FROM frpm)	california_schools
SELECT schools.phone FROM schools JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.charter = 1 AND schools.opendate > '2000-01-01';	california_schools
SELECT COUNT(DISTINCT s.CDSCode) AS num_schools FROM satscores s JOIN schools sc ON s.cds = sc.cdscode WHERE s.AvgScrMath < 400 AND sc.Virtual = 'F';	california_schools
SELECT schools.school FROM schools JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.numtsttakr > 500 AND (schools.magnet = 1 OR schools.gsserved = 'Magnet');	california_schools
SELECT schools.phone FROM schools JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.numtsttakr = (SELECT MAX(satscores.numtsttakr) FROM satscores) AND satscores.numge1500 > 0;	california_schools
SELECT COUNT(satscores.numtsttakr) AS total_sat_test_takers FROM satscores JOIN frpm ON satscores.cds = frpm.cdscode WHERE frpm.frpm_count_k_12 = (SELECT MAX(frpm.frpm_count_k_12) FROM frpm);	california_schools
SELECT COUNT(DISTINCT satscores.cds) FROM satscores JOIN schools ON satscores.cds = schools.cds WHERE satscores.avgscrmath > 560 AND schools.fundingtype = 'Directly funded';	california_schools
SELECT frpm."FRPM Count (Ages 5-17)" FROM frpm JOIN satscores ON frpm.cdscode = satscores.cds WHERE satscores.avgscrread = (SELECT MAX(satscores.avgscrread) FROM satscores)	california_schools
SELECT frpm.CDSCode FROM frpm WHERE (frpm.`Enrollment (K-12)` + frpm.`Enrollment (Ages 5-17)`) > 500;	california_schools
SELECT MAX(frpm.`Percent (%) Eligible Free (Ages 5-17)`) AS highest_eligible_free_rate FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite > 0.3;	california_schools
SELECT schools.phone FROM schools JOIN satscores ON schools.cds = satscores.cds ORDER BY satscores.NumGE1500 / satscores.NumTstTakr DESC LIMIT 3;	california_schools
SELECT schools.NCESSchool, frpm."Enrollment (Ages 5-17)" FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode ORDER BY frpm."Enrollment (Ages 5-17)" DESC LIMIT 5;	california_schools
SELECT schools.district, AVG(satscores.avgscrread) AS average_reading_score FROM satscores JOIN schools ON satscores.cds = schools.cds WHERE schools.statusType = 'Active' GROUP BY schools.district ORDER BY average_reading_score DESC LIMIT 1;	california_schools
SELECT COUNT(satscores.cds) FROM satscores WHERE satscores.NumTstTakr < 100 AND satscores.cds IN (SELECT schools.CDSCode FROM schools WHERE schools.County = 'Alameda');	california_schools
SELECT schools.CharterNum FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.AvgScrWrite = 499;	california_schools
SELECT COUNT(DISTINCT satscores.cds) AS num_schools FROM satscores JOIN schools ON satscores.cds = schools.cds WHERE schools.county = 'Contra Costa' AND schools.fundingtype = 'Directly funded' AND satscores.numtsttakr <= 250;	california_schools
SELECT schools.phone FROM schools JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.avgscrmath = (SELECT MAX(satscores.avgscrmath) FROM satscores)	california_schools
SELECT COUNT(*) FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.County = 'Amador' AND frpm.LowGrade = '9' AND frpm.HighGrade = '12';	california_schools
SELECT COUNT(CDSCode) FROM frpm WHERE "County Name" ILIKE '%los%angeles%' AND "2013-14 CALPADS Fall 1 Certification Status" = 1 AND "Free Meal Count (K-12)" > 500 AND "FRPM Count (K-12)" < 700;	california_schools
SELECT schools.school, satscores.NumTstTakr FROM satscores JOIN schools ON satscores.cds = schools.cds WHERE schools.county = 'Contra Costa' ORDER BY satscores.NumTstTakr DESC LIMIT 1;	california_schools
SELECT schools.school, schools.street, schools.city, schools.state, frpm.enroll12, frpm.enroll517, (frpm.enroll12 - frpm.enroll517) AS difference FROM frpm JOIN schools ON frpm.cds = schools.cds WHERE (frpm.enroll12 - frpm.enroll517) > 30;	california_schools
;	california_schools
SELECT schools.school, satscores.AvgScrMath, schools.fundingtype FROM satscores JOIN schools ON satscores.cds = schools.cds WHERE schools.county = 'Riverside' GROUP BY schools.school, satscores.AvgScrMath, schools.fundingtype HAVING AVG(satscores.AvgScrMath) > 400 ORDER BY AVG(satscores.AvgScrMath) DESC;	california_schools
SELECT schools.school, schools.street, schools.city, schools.state, schools.zip FROM schools JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Monterey' AND frpm.`Percent (%) Eligible Free (Ages 5-17)` > 0.8 AND frpm.`Percent (%) Eligible FRPM (Ages 5-17)` > 0.8;	california_schools
;	california_schools
SELECT schools.school, schools.doc, AVG(frpm.enrollment) AS average_enrollment FROM frpm JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.charter = 0 AND frpm.enrollment - frpm.enrollment >= AVG(frpm.enrollment) GROUP BY schools.school, schools.doc ORDER BY average_enrollment DESC;	california_schools
SELECT schools.openDate FROM schools JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.enrollment_k_12 = (SELECT MAX(frpm.enrollment_k_12) FROM frpm) AND schools.doc = 'K-12 Schools (Public)' ORDER BY schools.openDate ASC LIMIT 1;	california_schools
SELECT schools.city, SUM(frpm.enrollment) AS total_enrollment FROM frpm JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.lowgrade <= '12' AND frpm.highgrade >= '1' GROUP BY schools.city ORDER BY total_enrollment ASC LIMIT 5;	california_schools
SELECT frpm.CDSCode, frpm.SchoolName, frpm.Enrollment, frpm.FreeMealCount, frpm.Percent, frpm.FRPMCount FROM frpm WHERE frpm.Percent IS NOT NULL ORDER BY frpm.Percent DESC LIMIT 10;	california_schools
SELECT frpm."School Name", frpm."FRPM Count (K-12)" / NULLIF(frpm."Enrollment (K-12)", 0) AS "FRPM Rate (K-12)" FROM frpm JOIN schools ON frpm."School Code" = schools."CDSCode" WHERE schools."StatusType" = 'Active' AND schools."Ownership Code" = '66' ORDER BY frpm."FRPM Count (K-12)" DESC LIMIT 5;	california_schools
SELECT schools.school, frpm.website FROM frpm JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.free_meal_count_ages_5_17 BETWEEN 1900 AND 2000;	california_schools
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` AS `Free Rate` FROM frpm WHERE `School Name` ILIKE '%Kacey%Gibson%';	california_schools
SELECT schools.admemail1 FROM schools JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.charter = 1 ORDER BY frpm.enroll12 ASC LIMIT 1;	california_schools
SELECT schools.admlname1, schools.admlname2, schools.admlname3 FROM schools JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.numge1500 >= 1500 ORDER BY satscores.numtsttakr DESC LIMIT 1;	california_schools
SELECT s.Street, s.City, s.State, s.Zip FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE (sc.NumGE1500 / NULLIF(sc.NumTstTakr, 0)) = (SELECT MIN(sc2.NumGE1500 / NULLIF(sc2.NumTstTakr, 0)) FROM satscores sc2);	california_schools
SELECT schools.website FROM schools JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.county = 'Los Angeles' AND satscores.numtsttakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(satscores.numtsttakr) AS average_test_takers FROM satscores JOIN schools ON satscores.cds = schools.cds WHERE schools.county = 'Fresno' AND EXTRACT(YEAR FROM schools.opendate) = 1980;	california_schools
SELECT schools.phone FROM schools JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.district = 'Fresno Unified' ORDER BY satscores.avgscrread ASC LIMIT 1;	california_schools
SELECT schools.school, satscores.avgscrread FROM satscores JOIN schools ON satscores.cds = schools.cdscode WHERE schools.virtual = 'F' ORDER BY satscores.avgscrread DESC LIMIT 5;	california_schools
SELECT schools.edopsname FROM schools JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.avgscrmath = (SELECT MAX(satscores.avgscrmath) FROM satscores)	california_schools
SELECT s.County, AVG(s.AvgScrMath) AS AverageMathScore FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE s.AvgScrMath IS NOT NULL AND s.AvgScrRead IS NOT NULL AND s.AvgScrWrite IS NOT NULL ORDER BY (s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) ASC LIMIT 1;	california_schools
SELECT schools.city, AVG(satscores.avgscrwrite) AS average_writing_score FROM satscores JOIN schools ON satscores.cds = schools.cds WHERE satscores.numge1500 >= 1500 ORDER BY satscores.numtsttakr DESC LIMIT 1;	california_schools
SELECT schools.school, AVG(satscores.avgscrwrite) AS average_writing_score FROM satscores JOIN schools ON satscores.cds = schools.cds WHERE schools.admfname1 ILIKE '%Ricci%' AND schools.admlname1 ILIKE '%Ulrich%' GROUP BY schools.school ORDER BY average_writing_score DESC;	california_schools
SELECT schools.state, COUNT(frpm.enroll12) AS total_enrollment FROM frpm JOIN schools ON frpm.cds = schools.cdscode WHERE schools.doc = '31' GROUP BY schools.state ORDER BY total_enrollment DESC;	california_schools
SELECT COUNT(schools.cdscode) / 12 AS average_schools_opened_per_month FROM schools WHERE schools.county = 'Alameda' AND schools.doc = '52' AND EXTRACT(YEAR FROM schools.opendate) = 1980;	california_schools
SELECT CAST(COUNT(CASE WHEN DOC = '54' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN DOC = '52' THEN 1 END), 0) AS ratio FROM schools WHERE County = 'Orange';	california_schools
SELECT COUNT(schools.County) AS COUNTY_COUNT, schools.County, schools.School, schools.ClosedDate FROM schools WHERE schools.StatusType = 'Closed' GROUP BY schools.County, schools.School, schools.ClosedDate ORDER BY COUNTY_COUNT DESC LIMIT 1;	california_schools
SELECT schools.school, satscores.AvgScrMath, schools.street FROM satscores JOIN schools ON satscores.cds = schools.cds ORDER BY satscores.AvgScrMath DESC LIMIT 1 OFFSET 5;	california_schools
SELECT schools.MailStreet, schools.School FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.AvgScrRead = (SELECT MIN(satscores.AvgScrRead) FROM satscores)	california_schools
SELECT COUNT(*) FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE (sc.AvgScrRead + sc.AvgScrMath + sc.AvgScrWrite) >= 1500 AND s.MailCity = 'Lakeport';	california_schools
SELECT COUNT(NumTstTakr) AS total_test_takers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Fresno';	california_schools
SELECT schools.school, schools.mailzip FROM schools WHERE schools.admfname1 ILIKE '%Avetik%Atoian%' OR schools.admlname1 ILIKE '%Avetik%Atoian%' OR schools.admfname2 ILIKE '%Avetik%Atoian%' OR schools.admlname2 ILIKE '%Avetik%Atoian%' OR schools.admfname3 ILIKE '%Avetik%Atoian%' OR schools.admlname3 ILIKE '%Avetik%Atoian%' ORDER BY schools.school, schools.mailzip;	california_schools
SELECT CAST(COUNT(CASE WHEN schools.county = 'Colusa' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN schools.county = 'Humboldt' THEN 1 END), 0) AS ratio FROM schools WHERE schools.mailstate = 'California';	california_schools
SELECT COUNT(DISTINCT(s.CDSCode)) AS num_schools FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.MailState = 'CA' AND s.County = 'San Joaquin' AND s.StatusType = 'Active';	california_schools
SELECT schools.phone, schools.ext FROM schools JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.avgscrwrite IS NOT NULL ORDER BY satscores.avgscrwrite DESC LIMIT 1 OFFSET 332;	california_schools
SELECT schools.school, schools.phone, schools.ext FROM schools WHERE schools.zip = '95203-3704';	california_schools
SELECT schools.website FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm.AdmFName1 = 'Mike' AND frpm.AdmLName1 = 'Larson' OR frpm.AdmFName1 = 'Dante' AND frpm.AdmLName1 = 'Alvarez';	california_schools
SELECT schools.website FROM schools WHERE schools.virtual = 'P' AND schools.charter = 1 AND schools.county = 'San Joaquin';	california_schools
SELECT COUNT(*) FROM schools WHERE schools.city = 'Hickman' AND schools.doc = 52 AND schools.charter = 1;	california_schools
SELECT COUNT(*) FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.County = 'Los Angeles' AND schools.Charter = 0 AND frpm.`Percent (%) Eligible Free (K-12)` < 0.18;	california_schools
SELECT schools.school, schools.city, satscores.sname, satscores.dname FROM satscores JOIN schools ON satscores.cds = schools.cds WHERE schools.charter = 1 AND schools.charternum = '00D2';	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT CAST(COUNT(CASE WHEN schools.fundingtype = 'Locally Funded' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM schools WHERE schools.county = 'Santa Clara';	california_schools
SELECT COUNT(DISTINCT s.CDSCode) AS num_schools FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Stanislaus' AND s.FundingType = 'Directly Funded' AND s.OpenDate BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT SUM(Closure) AS total_closure FROM schools WHERE County = 'San Francisco' AND DOCType = 'Community College District' AND LastUpdate = '1989-01-01';	california_schools
SELECT COUNT(DISTINCT(schools.CDSCode)) AS total_schools_closed, schools.County FROM schools WHERE schools.SOC = '11' AND EXTRACT(YEAR FROM schools.ClosedDate) BETWEEN 1980 AND 1989 GROUP BY schools.County ORDER BY total_schools_closed DESC LIMIT 1;	california_schools
SELECT schools.NCESDist FROM schools WHERE schools.SOC = '31';	california_schools
SELECT COUNT(DISTINCT(schools.CDSCode)) AS total_schools FROM schools WHERE schools.County = 'Alpine' AND schools.StatusType IN ('Active', 'Closed');	california_schools
SELECT schools.district FROM schools WHERE schools.magnet = 0 AND schools.city = 'Fresno';	california_schools
SELECT SUM(frpm."Enrollment (Ages 5-17)") AS total_enrollment FROM frpm JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.edopscode = 'SSS' AND frpm."Academic Year" = '2014-2015';	california_schools
SELECT frpm."Percent (%) Eligible Free (Ages 5-17)" FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.MailStreet = 'PO Box 1040' AND schools.School = 'Youth Authority School';	california_schools
SELECT MIN(frpm."Low Grade") AS lowest_grade FROM frpm JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.edopscode = 'SPECON' AND schools.ncesdist = '613360';	california_schools
SELECT schools.school, frpm.educationaloptiontype FROM frpm JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.nslpprovisionstatus = 'Breakfast Provision 2' AND schools.county = '37';	california_schools
;	california_schools
SELECT frpm.schoolname, frpm.percent_eligible_frpm_ages_5_17 FROM frpm JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.county = 'Los Angeles' AND frpm.lowgrade = 'K' AND frpm.highgrade = '9';	california_schools
SELECT `Grade Span` FROM schools WHERE `City` ILIKE '%adelanto%' GROUP BY `Grade Span` ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT COUNT(schools.CDSCode) AS number_of_schools FROM schools WHERE schools.County IN ('San Diego', 'Santa Barbara') AND schools.Virtual = 'F';	california_schools
SELECT schools.school, schools.latitude FROM schools ORDER BY schools.latitude DESC LIMIT 1;	california_schools
SELECT schools.school, MIN(schools.latitude) AS lowest_latitude, MIN(frpm.lowgrade) AS lowest_grade FROM schools JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.state = 'CA' GROUP BY schools.school ORDER BY lowest_latitude ASC, lowest_grade ASC LIMIT 1;	california_schools
SELECT MIN(frpm."Low Grade") AS min_low_grade, MAX(frpm."High Grade") AS max_high_grade FROM frpm JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.longitude = (SELECT MAX(longitude) FROM schools);	california_schools
SELECT COUNT(DISTINCT(s.CDSCode)) AS num_schools, COUNT(DISTINCT(s.City)) AS num_cities FROM schools s WHERE s.Magnet = 1 AND s.GSoffered = 'K-8' AND s.GSserved = 'K-8';	california_schools
SELECT AdmFName1, COUNT(AdmFName1) AS COUNT FROM schools GROUP BY AdmFName1 ORDER BY COUNT DESC LIMIT 2;	california_schools
SELECT frpm."District Code", frpm."Percent (%) Eligible Free (K-12)" FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.AdmFName1 = 'Alusine';	california_schools
SELECT schools.district, schools.county, schools.school FROM schools JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.charter = 1 AND frpm.charternumber = '40';	california_schools
SELECT schools.admemail1 FROM schools WHERE schools.county = 'San Bernardino' AND schools.district = 'San Bernardino City Unified' AND schools.soc = '62' AND schools.doc = '54' AND schools.opendate BETWEEN '2009-01-01' AND '2010-12-31';	california_schools
SELECT schools.school, satscores.NumGE1500, schools.admemail1 FROM satscores JOIN schools ON satscores.cds = schools.cds WHERE satscores.numget1500 = (SELECT MAX(satscores.numget1500) FROM satscores)	california_schools
SELECT COUNT(DISTINCT account.account_id) AS number_of_accounts FROM account JOIN district ON account.district_id = district.district_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND district.A3 = 'East Bohemia';	financial
SELECT COUNT(DISTINCT account.account_id) AS eligible_accounts FROM account JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'Prague';	financial
SELECT AVG(A12) AS unemployment_rate_1995, AVG(A13) AS unemployment_rate_1996 FROM district;	financial
SELECT COUNT(DISTINCT district.district_id) FROM district JOIN client ON district.district_id = client.district_id WHERE client.gender = 'F' AND district.A11 > 6000 AND district.A11 < 10000;	financial
SELECT COUNT(DISTINCT client.client_id) AS number_of_clients FROM client JOIN district ON client.district_id = district.district_id WHERE client.gender = 'M' AND district.A3 = 'North Bohemia' AND district.A11 > 8000;	financial
SELECT account.account_id, district.A11, (MAX(district.A11) - MIN(district.A11)) AS gap FROM account JOIN client ON account.account_id = client.client_id JOIN district ON client.district_id = district.district_id WHERE client.gender = 'F' ORDER BY client.birth_date ASC, district.A11 ASC LIMIT 1;	financial
SELECT account.account_id FROM account JOIN client ON account.account_id = client.client_id JOIN district ON client.district_id = district.district_id WHERE account.account_id = 1 AND account.account_id = 2 AND account.account_id = 3 AND account.account_id = 4 AND account.account_id = 5 AND account.account_id = 6 AND account.account_id = 7 AND account.account_id = 8 AND account.account_id = 9 AND account.account_id = 10 AND account.account_id = 11 AND account.account_id = 12 AND account.account_id = 13 AND account.account_id = 14 AND account.account_id = 15 AND account.account_id = 16 AND account.account_id = 17 AND account.account_id = 18 AND account.account_id = 19 AND account.account_id = 20 AND account.account_id = 21 AND account.account_id = 22 AND account.account_id = 23 AND account.account_id = 24 AND account.account_id = 25 AND account.account_id = 26 AND account.account_id = 27 AND account.account_id = 28 AND account.account_id = 29 AND account.account_id = 30 AND account.account_id = 31 AND account.account_id = 32 AND account.account_id = 33 AND account.account_id = 34 AND account.account_id = 35 AND account.account_id = 36 AND account.account_id = 37 AND account.account_id = 38 AND account.account_id = 39 AND account.account_id = 40 AND account.account_id = 41 AND account.account_id = 42 AND account.account_id = 43 AND account.account_id = 44 AND account.account_id = 45 AND account.account_id = 46 AND account.account_id = 47 AND account.account_id = 48 AND	financial
SELECT COUNT(DISTINCT client.client_id) AS number_of_clients FROM client JOIN account ON client.client_id = account.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND client.gender = 'Owner';	financial
SELECT client.client_id, client.gender, client.birth_date, client.district_id, account.account_id, account.district_id, account.frequency, account.date, card.card_id, card.disp_id, card.type, card.issued, disp.client_id, disp.account_id, disp.type, loan.loan_id, loan.account_id, loan.date, loan.amount, loan.duration, loan.payments, loan.status, "order".order_id, "order".account_id, "order".bank_to, "order".account_to, "order".amount, "order".k_symbol, trans.trans_id, trans.account_id, trans.date, trans.type, trans.operation, trans.amount, trans.balance, trans.k_symbol, trans.bank, trans.account FROM client JOIN account ON client.client_id = account.account_id JOIN card ON account.account_id = card.disp_id JOIN disp ON account.account_id = disp.account_id JOIN loan ON account.account_id = loan.account_id JOIN "order" ON account.account_id = "order".account_id JOIN trans ON account.account_id = trans.account_id WHERE account.frequency = 'POPLATEK PO OBRATU';	financial
SELECT account.account_id, account.frequency, account.date, loan.amount FROM account JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK MESICNE' AND account.date = '1997-07-07' AND loan.status = 'APPROVED' ORDER BY loan.amount ASC;	financial
SELECT account.account_id, account.date, loan.amount, loan.duration FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 12 AND account.date BETWEEN '1993-01-01' AND '1993-12-31' ORDER BY loan.amount DESC;	financial
SELECT COUNT(DISTINCT client.client_id) AS number_of_female_clients FROM client JOIN account ON client.client_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE client.gender = 'F' AND client.birth_date < '1950-01-01' AND district.A2 = 'Slokolov';	financial
SELECT account.account_id, account.date FROM account WHERE account.date BETWEEN '1995-01-01' AND '1995-12-31' ORDER BY account.date ASC LIMIT 1;	financial
SELECT account.account_id, account.date, account.frequency, account.district_id, account.amount, account.currency, account.status, account.type, account.subtype, account.iban, account.bic, account.description, account.product, account.deposit_term, account.opening_date, account.maturity_date, account.interest_rate, account.interest_payment, account.balance_payment, account.balance, account.overdraft, account.overdraft_limit, account.withdrawal_limit, account.credit_limit, account.currency_unit, account.currency_subunit, account.currency_symbol, account.currency_decimals, account.currency_iso_num, account.currency_iso_alpha, account.fee_percent, account.fee_other, account.fee_minimum, account.fee_maximum, account.fee_per_operation, account.fee_monthly, account.fee_quarterly, account.fee_semesterly, account.fee_annually, account.fee_bi_annually, account.fee_min_per_operation, account.fee_max_per_operation, account.fee_min_monthly, account.fee_max_monthly, account.fee_min_quarterly, account.fee_max_quarterly, account.fee_min_semesterly, account.fee_max_semesterly, account.fee_min_annually, account.fee_max_annually, account.fee_min_bi_annually, account.fee_max_bi_annually, account.fee_min_per_transaction, account.fee_max_per_transaction, account.fee_min_monthly_per_transaction, account.fee_max_monthly_per_transaction, account.fee_min_quarterly_per_transaction, account.fee_max_quarterly_per_transaction, account.fee_min_semesterly_per_transaction, account.fee_max_semesterly_per_transaction, account.fee	financial
SELECT client.client_id FROM client JOIN card ON client.client_id = card.client_id WHERE card.issued = '1994-03-03';	financial
SELECT account.date FROM account JOIN trans ON account.account_id = trans.account_id WHERE trans.amount = 840 AND trans.date = '1998-10-14';	financial
SELECT account.district_id FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.date = '1994-08-25';	financial
SELECT MAX(trans.amount) AS max_amount FROM trans JOIN card ON trans.account_id = card.disp_id WHERE card.issued = '1996-10-21';	financial
SELECT client.gender FROM client JOIN account ON client.client_id = account.account_id JOIN district ON client.district_id = district.district_id WHERE account.date = client.birth_date AND district.A11 = (SELECT MAX(district.A11) FROM district) ORDER BY client.birth_date ASC LIMIT 1;	financial
SELECT trans.amount FROM trans JOIN account ON trans.account_id = account.account_id JOIN loan ON account.account_id = loan.account_id WHERE loan.amount = (SELECT MAX(loan.amount) FROM loan) AND trans.date = (SELECT MIN(trans.date) FROM trans WHERE trans.account_id = account.account_id);	financial
SELECT COUNT(DISTINCT client.client_id) AS number_of_female_clients FROM client JOIN account ON client.client_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Jesenik' AND client.gender = 'F';	financial
SELECT disp.disp_id FROM disp JOIN account ON disp.account_id = account.account_id JOIN trans ON account.account_id = trans.account_id WHERE trans.amount = 5100 AND trans.date = '1998-09-02';	financial
SELECT COUNT(account.account_id) AS number_of_accounts FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Litomerice' AND EXTRACT(YEAR FROM account.date) = 1996;	financial
SELECT district.A2 FROM client JOIN account ON client.client_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE client.gender = 'F' AND client.birth_date = '1976-01-29';	financial
SELECT client.birth_date FROM client JOIN account ON client.client_id = account.account_id JOIN loan ON account.account_id = loan.account_id WHERE loan.amount = 98832 AND loan.date = '1996-01-03';	financial
SELECT account.account_id FROM account JOIN client ON account.client_id = client.client_id JOIN district ON client.district_id = district.district_id WHERE district.A3 = 'Prague' ORDER BY account.date ASC LIMIT 1;	financial
SELECT CAST(COUNT(CASE WHEN client.gender = 'M' THEN 1 END) AS FLOAT) / NULLIF(COUNT(client.client_id), 0) * 100 AS percentage FROM client JOIN district ON client.district_id = district.district_id WHERE district.A3 = 'Jihočeský kraj' ORDER BY percentage DESC LIMIT 1;	financial
SELECT ((MAX(CASE WHEN date = '1998-12-27' THEN balance END) - MIN(CASE WHEN date = '1993-03-22' THEN balance END)) / NULLIF(MIN(CASE WHEN date = '1993-03-22' THEN balance END), 0)) * 100 AS increase_rate FROM trans WHERE account_id = (SELECT account_id FROM loan WHERE date = '1993-07-05' LIMIT 1);	financial
SELECT CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS FLOAT) / NULLIF(SUM(amount), 0) * 100 AS percentage FROM loan;	financial
SELECT CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM loan WHERE amount < 100000;	financial
SELECT account.account_id, district.A2, district.A3 FROM account JOIN district ON account.district_id = district.district_id WHERE account.date = '1993-02-26' AND account.frequency = 'POPLATEK PO OBRATU';	financial
SELECT account.account_id, account.frequency FROM account JOIN district ON account.district_id = district.district_id WHERE account.date BETWEEN '1995-01-01' AND '2000-12-31' AND district.A2 = 'east Bohemia';	financial
SELECT account.account_id, account.date FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Prachatice';	financial
SELECT district.A2, district.A3 FROM loan JOIN account ON loan.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE loan.loan_id = 4990;	financial
SELECT account.account_id, district.A2 AS district, district.A3 AS region FROM account JOIN loan ON account.account_id = loan.account_id JOIN district ON account.district_id = district.district_id WHERE loan.amount > 300000;	financial
SELECT loan.loan_id, district.A3, district.A11 FROM loan JOIN account ON loan.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE loan.duration = 60;	financial
SELECT district.A2, (district.A13 - district.A12) / district.A12 * 100 AS unemployment_increment_rate FROM district JOIN account ON account.district_id = district.district_id JOIN loan ON loan.account_id = account.account_id WHERE loan.status = 'D' ORDER BY unemployment_increment_rate DESC;	financial
SELECT CAST(COUNT(CASE WHEN district.A2 = 'Decin' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM account JOIN district ON account.district_id = district.district_id WHERE EXTRACT(YEAR FROM account.date) = 1993;	financial
SELECT account.account_id FROM account WHERE account.frequency = 'POPLATEK MESICNE';	financial
SELECT district.A2, COUNT(client.client_id) AS female_account_holders_count FROM client JOIN account ON client.client_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE client.gender = 'F' GROUP BY district.A2 ORDER BY female_account_holders_count DESC LIMIT 10;	financial
SELECT district.A2, SUM(trans.amount) AS total_amount FROM trans JOIN account ON trans.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE trans.type = 'VYDAJ' AND trans.date LIKE '1996-01%' GROUP BY district.A2 ORDER BY total_amount DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT account.account_id) - COUNT(DISTINCT card.disp_id) AS number_of_accounts_without_cards FROM account JOIN district ON account.district_id = district.district_id LEFT JOIN card ON account.account_id = card.disp_id WHERE district.A3 = 'South Bohemia';	financial
SELECT district.A3, COUNT(loan.loan_id) AS active_loans FROM loan JOIN account ON loan.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE loan.status = 'C' GROUP BY district.A3 ORDER BY active_loans DESC LIMIT 1;	financial
SELECT AVG(loan.amount) AS average_loan_amount FROM loan JOIN account ON loan.account_id = account.account_id JOIN client ON account.client_id = client.client_id WHERE client.gender = 'M';	financial
SELECT district.A2, district.A13 FROM district WHERE district.A13 = (SELECT MAX(district.A13) FROM district) AND EXTRACT(YEAR FROM district.A4) = 1996;	financial
SELECT COUNT(account.account_id) AS number_of_accounts FROM account JOIN district ON account.district_id = district.district_id WHERE district.A16 = (SELECT MAX(district.A16) FROM district) AND account.date BETWEEN '1996-01-01' AND '1996-12-31';	financial
SELECT COUNT(DISTINCT account.account_id) AS number_of_accounts FROM account JOIN trans ON account.account_id = trans.account_id WHERE account.frequency = 'POPLATEK MESICNE' AND trans.operation = 'VYBER KARTOU' AND trans.balance < 0;	financial
SELECT account.account_id, COUNT(loan.loan_id) AS number_of_loans FROM account JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK MESICNE' AND loan.amount >= 250000 AND loan.date BETWEEN '1995-01-01' AND '1997-12-31' AND loan.status = 'approved' GROUP BY account.account_id ORDER BY number_of_loans DESC;	financial
SELECT COUNT(DISTINCT account.account_id) AS number_of_accounts FROM account JOIN client ON account.account_id = client.client_id JOIN district ON client.district_id = district.district_id JOIN loan ON account.account_id = loan.account_id WHERE district.A2 = '1' AND loan.status = 'C';	financial
SELECT COUNT(DISTINCT client.client_id) AS number_of_male_clients FROM client JOIN account ON client.client_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE client.gender = 'M' AND district.A15 = (SELECT MAX(district.A15) FROM district WHERE district.A15 < (SELECT MAX(district.A15) FROM district)) AND account.date BETWEEN '1995-01-01' AND '1995-12-31';	financial
SELECT COUNT(*) FROM card WHERE type = 'gold' AND disp_id IN (SELECT disp_id FROM disp WHERE type = 'disponent');	financial
SELECT COUNT(account_id) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Pisek';	financial
SELECT district.A2 FROM district JOIN account ON district.district_id = account.district_id JOIN trans ON account.account_id = trans.account_id WHERE trans.amount > 10000 AND EXTRACT(YEAR FROM trans.date) = 1997 GROUP BY district.A2;	financial
SELECT account.account_id FROM account JOIN district ON account.district_id = district.district_id JOIN `order` ON account.account_id = `order`.account_id WHERE district.A4 = 'Pisek' AND `order`.k_symbol = 'SIPO';	financial
SELECT account.account_id FROM account JOIN disp ON account.account_id = disp.account_id JOIN card ON disp.card_id = card.card_id WHERE card.type = 'GOLD' AND account.account_id IN (SELECT account_id FROM account JOIN disp ON account.account_id = disp.account_id JOIN card ON disp.card_id = card.card_id WHERE card.type = 'JUNIOR') GROUP BY account.account_id;	financial
SELECT AVG(amount) AS average_amount FROM trans WHERE operation = 'VYBER KARTOU' AND date BETWEEN '2021-01-01' AND '2021-12-31';	financial
SELECT account.account_id FROM account JOIN trans ON account.account_id = trans.account_id WHERE account.date BETWEEN '1998-01-01' AND '1998-12-31' AND trans.operation = 'VYBER KARTOU' GROUP BY account.account_id HAVING SUM(trans.amount) < (SELECT AVG(trans.amount) FROM trans WHERE trans.operation = 'VYBER KARTOU');	financial
SELECT client.client_id, client.gender, account.account_id, loan.loan_id, card.card_id FROM client JOIN account ON client.client_id = account.account_id JOIN loan ON account.account_id = loan.account_id JOIN card ON account.account_id = card.account_id WHERE client.gender = 'F';	financial
SELECT COUNT(DISTINCT account.account_id) AS number_of_accounts FROM account JOIN client ON account.account_id = client.client_id JOIN district ON account.district_id = district.district_id WHERE client.gender = 'F' AND district.A3 = 'south Bohemia';	financial
SELECT account.account_id FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Tabor' AND account.frequency = 'OWNER';	financial
SELECT account.frequency FROM account JOIN district ON account.district_id = district.district_id WHERE district.A11 > 8000 AND district.A11 <= 9000 AND account.frequency != 'OWNER';	financial
SELECT COUNT(DISTINCT account.account_id) AS number_of_accounts FROM account JOIN district ON account.district_id = district.district_id JOIN trans ON account.account_id = trans.account_id WHERE district.A3 = 'North Bohemia' AND trans.bank = 'AB';	financial
SELECT district.A2 FROM district JOIN account ON district.district_id = account.district_id JOIN trans ON account.account_id = trans.account_id WHERE trans.type = 'VYDAJ';	financial
SELECT AVG(district.A15) FROM district JOIN account ON district.district_id = account.district_id WHERE district.A15 > 4000 AND account.date >= '1997-01-01' AND account.date < '1998-01-01';	financial
SELECT COUNT(DISTINCT card.card_id) AS eligible_cards FROM card JOIN account ON card.account_id = account.account_id WHERE card.type = 'classic' AND account.frequency = 'OWNER';	financial
SELECT COUNT(client_id) AS male_clients FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha');	financial
SELECT CAST(COUNT(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM card;	financial
SELECT client.name FROM client JOIN account ON client.client_id = account.client_id JOIN loan ON account.account_id = loan.account_id ORDER BY loan.amount DESC LIMIT 1;	financial
SELECT district.A15 FROM account JOIN district ON account.district_id = district.district_id WHERE account.account_id = 532;	financial
SELECT account.district_id FROM account JOIN `order` ON account.account_id = `order`.account_id WHERE `order`.order_id = 33333;	financial
SELECT trans.date, trans.amount FROM trans JOIN client ON trans.account_id = client.client_id WHERE client.client_id = 3356 AND trans.operation = 'VYBER';	financial
SELECT COUNT(DISTINCT account.account_id) AS number_of_accounts FROM account JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND loan.amount < 200000;	financial
SELECT card.type FROM card JOIN disp ON card.disp_id = disp.disp_id JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 13539;	financial
SELECT district.A3 FROM client JOIN district ON client.district_id = district.district_id WHERE client.client_id = 3541;	financial
SELECT district.district_id, COUNT(loan.loan_id) AS number_of_loans FROM district JOIN account ON district.district_id = account.district_id JOIN loan ON account.account_id = loan.account_id WHERE loan.status = 'A' GROUP BY district.district_id ORDER BY number_of_loans DESC LIMIT 1;	financial
SELECT client.gender, client.birth_date, client.district_id, account.frequency, account.date, district.A2, district.A3, district.A4, district.A5, district.A6, district.A7, district.A8, district.A9, district.A10, district.A11, district.A12, district.A13, district.A14, district.A15, district.A16 FROM client JOIN account ON client.client_id = account.account_id JOIN district ON client.district_id = district.district_id JOIN `order` ON account.account_id = `order`.account_id WHERE `order`.order_id = 32423;	financial
SELECT trans.date, trans.type, trans.operation, trans.amount, trans.balance, trans.k_symbol, trans.bank, trans.account FROM trans JOIN account ON trans.account_id = account.account_id WHERE account.district_id = 5;	financial
SELECT COUNT(account.account_id) FROM account WHERE account.district_id = 15;	financial
SELECT client.client_id FROM client JOIN card ON client.client_id = card.client_id WHERE card.type = 'junior' AND card.issued >= '1997-01-01';	financial
SELECT CAST(COUNT(CASE WHEN gender = 'F' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM client JOIN district ON client.district_id = district.district_id WHERE district.A11 > 10000;	financial
SELECT ((SELECT SUM(amount) FROM loan WHERE date BETWEEN '1997-01-01' AND '1997-12-31') - (SELECT SUM(amount) FROM loan WHERE date BETWEEN '1996-01-01' AND '1996-12-31')) / NULLIF((SELECT SUM(amount) FROM loan WHERE date BETWEEN '1996-01-01' AND '1996-12-31'), 0) * 100 AS growth_rate FROM client JOIN account ON client.client_id = account.account_id JOIN loan ON account.account_id = loan.account_id WHERE client.gender = 'M';	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-01-01';	financial
SELECT district.A16 - (SELECT district.A16 FROM district WHERE district.A3 = 'East Bohemia') AS difference FROM district WHERE district.A3 = 'North Bohemia';	financial
SELECT COUNT(DISTINCT CASE WHEN d.type = 'owner' THEN d.disp_id ELSE NULL END) AS owner_dispositions, COUNT(DISTINCT CASE WHEN d.type = 'disponent' THEN d.disp_id ELSE NULL END) AS disponent_dispositions FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.account_id BETWEEN 1 AND 10;	financial
SELECT COUNT(trans.type) AS number_of_statements, SUM(trans.amount) AS total_debit FROM trans WHERE trans.account_id = 3 AND trans.type = 'VYPIS' AND trans.operation = 'DEBIT';	financial
SELECT client.birth_date FROM client WHERE client.client_id = 130;	financial
SELECT COUNT(DISTINCT account.account_id) AS number_of_accounts FROM account JOIN disp ON account.account_id = disp.account_id WHERE account.frequency = 'POPLATEK PO OBRATU';	financial
SELECT SUM(loan.amount) AS total_debt, SUM(trans.amount) AS total_payments FROM loan JOIN account ON loan.account_id = account.account_id JOIN client ON account.client_id = client.client_id JOIN trans ON account.account_id = trans.account_id WHERE client.client_id = 992;	financial
SELECT SUM(trans.amount) AS total_amount, client.gender FROM trans JOIN account ON trans.account_id = account.account_id JOIN client ON account.client_id = client.client_id WHERE trans.trans_id = 851;	financial
SELECT card.type FROM card JOIN disp ON card.disp_id = disp.disp_id JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 9;	financial
SELECT SUM(trans.amount) AS total_amount FROM trans JOIN account ON trans.account_id = account.account_id JOIN client ON account.client_id = client.client_id WHERE client.client_id = 617 AND EXTRACT(YEAR FROM trans.date) = 1998;	financial
SELECT client.client_id FROM client JOIN account ON client.client_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE client.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district.A4 = 'East Bohemia';	financial
SELECT client.client_id FROM client JOIN account ON client.client_id = account.account_id JOIN loan ON account.account_id = loan.account_id WHERE client.gender = 'F' ORDER BY loan.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT client.client_id) AS number_of_clients FROM client JOIN account ON client.client_id = account.account_id JOIN trans ON account.account_id = trans.account_id WHERE client.gender = 'M' AND client.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND trans.type = 'SIPO' AND trans.amount > 4000;	financial
SELECT COUNT(account_id) FROM account WHERE district_id = 1 AND date > '1996-01-01';	financial
SELECT COUNT(DISTINCT client.client_id) AS number_of_clients FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id WHERE client.gender = 'F' AND card.type = 'JUNIOR';	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender = 'F' THEN c.client_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT c.client_id), 0) * 100 AS proportion FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague';	financial
SELECT CAST(COUNT(CASE WHEN gender = 'M' AND frequency = 'POPLATEK TYDNE' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN frequency = 'POPLATEK TYDNE' THEN 1 END), 0) * 100 AS percentage FROM client;	financial
SELECT COUNT(DISTINCT client.client_id) AS number_of_clients FROM client JOIN account ON client.client_id = account.account_id WHERE account.frequency = 'POPLATEK TYDNE';	financial
SELECT account.account_id, account.date, loan.amount FROM account JOIN loan ON account.account_id = loan.account_id WHERE account.date < '1997-01-01' AND loan.duration > 24 ORDER BY loan.amount ASC LIMIT 1;	financial
SELECT account.account_id FROM account JOIN client ON account.account_id = client.client_id WHERE client.gender = 'F' ORDER BY client.birth_date ASC, district.A11 DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT client.client_id) AS number_of_clients FROM client JOIN district ON client.district_id = district.district_id WHERE client.birth_date BETWEEN '1920-01-01' AND '1920-12-31' AND district.A3 = 'east Bohemia';	financial
SELECT COUNT(loan_id) FROM loan WHERE duration = 24 AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK TYDNE');	financial
SELECT account.account_id, AVG(loan.amount) AS average_loan_amount FROM account JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND loan.status = 'C' GROUP BY account.account_id;	financial
SELECT client.client_id, district.A2 FROM client JOIN account ON client.client_id = account.account_id JOIN district ON client.district_id = district.district_id WHERE account.frequency = 'POPLATEK MESICNE';	financial
SELECT client.client_id, age(CURRENT_DATE, client.birth_date) AS age FROM client JOIN account ON client.client_id = account.account_id JOIN card ON account.account_id = card.disp_id WHERE card.type = 'gold' AND account.frequency = 'POPLATEK MESICNE' AND account.date >= '1995-01-01' AND account.date <= '1995-12-31';	financial
SELECT bond.bond_type, COUNT(bond.bond_type) AS count FROM bond GROUP BY bond.bond_type ORDER BY count DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT atom.atom_id) AS number_of_chlorine_atoms FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' AND atom.element = 'cl';	toxicology
SELECT AVG(CASE WHEN atom.element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '-';	toxicology
SELECT AVG(CASE WHEN bond.bond_type = '-' THEN 1 ELSE 0 END) AS average_single_bonded_carcinogenic_molecules FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id JOIN bond ON atom.atom_id = bond.atom_id WHERE molecule.label = '+';	toxicology
SELECT COUNT(DISTINCT atom.atom_id) AS non_carcinogenic_sodium_atoms FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'na' AND molecule.label = '-';	toxicology
SELECT molecule.molecule_id FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '+';	toxicology
SELECT CAST(SUM(CASE WHEN atom.element = 'c' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(atom.atom_id), 0) AS percentage FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '=' GROUP BY atom.molecule_id;	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(atom.atom_id) FROM atom WHERE atom.element != 'br';	toxicology
SELECT COUNT(molecule.label) AS carcinogenic_molecules FROM molecule WHERE molecule.molecule_id BETWEEN 'TR000' AND 'TR099' AND molecule.label = '+';	toxicology
SELECT molecule.molecule_id FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'si';	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR004_8_9';	toxicology
SELECT atom.element FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_type = '='	toxicology
SELECT COUNT(atom.label) AS number_of_labels, atom.label FROM atom WHERE atom.element = 'h' GROUP BY atom.label ORDER BY number_of_labels DESC LIMIT 1;	toxicology
SELECT bond.bond_type FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'te';	toxicology
SELECT atom.atom_id, atom.element, bond.bond_type FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '-';	toxicology
SELECT atom.atom_id, atom.element, molecule.label FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' ORDER BY atom.atom_id;	toxicology
SELECT element, COUNT(element) AS number FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY number ASC LIMIT 1;	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20';	toxicology
SELECT DISTINCT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element != 'sn' AND m.label NOT IN ('+', '-');	toxicology
SELECT COUNT(DISTINCT atom.atom_id) AS total_atoms FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id JOIN bond ON molecule.molecule_id = bond.molecule_id JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element IN ('i', 's') AND bond.bond_type = '-';	toxicology
SELECT atom.atom_id, atom.element, atom.molecule_id, bond.bond_type FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_type = '#';	toxicology
SELECT atom.atom_id, atom.element, atom.molecule_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id2 WHERE connected.atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181') AND atom.molecule_id != 'TR181';	toxicology
SELECT DIVIDE(SUM(element = 'f'), COUNT(molecule_id)) AS percent FROM molecule WHERE label = '+';	toxicology
SELECT SUM(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) / COUNT(bond.bond_id) AS percent FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT atom.element FROM atom WHERE atom.molecule_id = 'TR000' GROUP BY atom.element ORDER BY atom.element ASC LIMIT 3;	toxicology
SELECT atom.atom_id, atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR001_2_6';	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule;	toxicology
SELECT atom.atom_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR_000_2_5';	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2';	toxicology
SELECT molecule.label FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '=' ORDER BY molecule.label ASC LIMIT 5;	toxicology
SELECT DIVIDE(SUM(bond_type = ' = '), COUNT(bond_id)) AS percent FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT DIVIDE(SUM(label = '+'), COUNT(molecule_id)) AS percent FROM molecule;	toxicology
SELECT DIVIDE(SUM(element = 'h'), COUNT(atom_id)) AS percent FROM atom WHERE molecule_id = 'TR206';	toxicology
SELECT bond.bond_type FROM bond WHERE bond.molecule_id = 'TR000';	toxicology
SELECT atom.element FROM atom WHERE atom.molecule_id = 'TR060'; SELECT molecule.label FROM molecule WHERE molecule.molecule_id = 'TR060';	toxicology
SELECT bond.bond_type, COUNT(bond.bond_type) AS bond_count, molecule.label FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.molecule_id = 'TR018' GROUP BY bond.bond_type ORDER BY bond_count DESC LIMIT 1;	toxicology
SELECT molecule.molecule_id FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-' ORDER BY molecule.molecule_id ASC LIMIT 3;	toxicology
SELECT bond.bond_type FROM bond WHERE bond.molecule_id = 'TR006' ORDER BY bond.bond_type ASC LIMIT 2;	toxicology
SELECT COUNT(DISTINCT bond_id) FROM connected WHERE atom_id = 'TR009_12' OR atom_id2 = 'TR009_12';	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE label = '+' AND element = 'br';	toxicology
SELECT bond.bond_type, atom.atom_id, atom.atom_id2 FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 WHERE bond.bond_id = 'TR001_6_9';	toxicology
SELECT molecule.label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(DISTINCT bond_id) AS connections FROM connected WHERE atom_id = 'TR%_19';	toxicology
SELECT atom.element FROM atom WHERE atom.molecule_id = 'TR004';	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT molecule.molecule_id FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE SUBSTRING(atom.atom_id, 7, 2) BETWEEN '21' AND '25' AND molecule.label = '+';	toxicology
SELECT bond.bond_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom AS atom1 ON connected.atom_id = atom1.atom_id JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id WHERE (atom1.element = 'p' AND atom2.element = 'n') OR (atom1.element = 'n' AND atom2.element = 'p');	toxicology
SELECT molecule.label FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '=' AND molecule.label = '+' ORDER BY COUNT(bond.bond_id) DESC LIMIT 1;	toxicology
SELECT AVG(bond_count) AS average_bond_count FROM (SELECT atom.atom_id, COUNT(bond.bond_id) AS bond_count FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.element = 'i' GROUP BY atom.atom_id) AS subquery;	toxicology
SELECT bond.bond_type, bond.bond_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR000_45';	toxicology
SELECT atom.element FROM atom WHERE atom.atom_id NOT IN (SELECT connected.atom_id FROM connected)	toxicology
SELECT atom.atom_id, atom.element FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_type = '#' AND atom.molecule_id = 'TR447';	toxicology
SELECT atom.element FROM atom WHERE atom.atom_id = 'TR144_8_19';	toxicology
SELECT molecule.molecule_id, COUNT(bond.bond_id) AS num_double_bonds FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id JOIN bond ON atom.atom_id = bond.atom_id WHERE molecule.label = '+' AND bond.bond_type = '=' GROUP BY molecule.molecule_id ORDER BY num_double_bonds DESC LIMIT 1;	toxicology
SELECT atom.element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY atom.element ORDER BY COUNT(atom.element) ASC LIMIT 1;	toxicology
SELECT atom.atom_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id2 WHERE atom.element = 'pb';	toxicology
SELECT atom.element FROM atom JOIN bond ON atom.atom_id = bond.bond_id WHERE bond.bond_type = '#';	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN a1.element = 'c' AND a2.element = 'cl' THEN b.bond_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT b.bond_id), 0) AS proportion FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id;	toxicology
SELECT DIVIDE(SUM(CASE WHEN bond.bond_type = '-' AND molecule.label = '+' THEN 1 ELSE 0 END), COUNT(bond.bond_id)) AS proportion FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id;	toxicology
SELECT COUNT(atom_id) AS total_atoms FROM atom WHERE element IN('c', 'h');	toxicology
SELECT atom.atom_id2 FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 's';	toxicology
SELECT atom.atom_id, bond.bond_type FROM atom JOIN bond ON atom.atom_id = bond.bond_id WHERE atom.element = 'sn';	toxicology
SELECT COUNT(DISTINCT atom.element) AS number_of_elements FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_type = '-';	toxicology
SELECT COUNT(DISTINCT atom.atom_id) AS total_atoms FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id JOIN bond ON atom.molecule_id = bond.molecule_id JOIN connected ON atom.atom_id = connected.atom_id WHERE bond.bond_type = '#' AND (atom.element = 'p' OR atom.element = 'br');	toxicology
SELECT bond.bond_id FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.label = '+';	toxicology
SELECT molecule.molecule_id FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-';	toxicology
SELECT DIVIDE(SUM(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END), COUNT(atom.atom_id)) AS percent FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '-';	toxicology
SELECT molecule.label FROM molecule WHERE molecule.molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule.molecule_id FROM molecule WHERE molecule.label = '-';	toxicology
SELECT COUNT(DISTINCT molecule.molecule_id) AS total_carcinogenic_molecules FROM molecule WHERE molecule.label = '+' AND molecule.molecule_id BETWEEN 'TR000' AND 'TR030';	toxicology
SELECT bond.bond_type FROM bond WHERE bond.molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT bond.bond_id) FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'i';	toxicology
SELECT molecule.molecule_id, MAX(molecule.label) AS carcinogenic FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'ca' GROUP BY molecule.molecule_id;	toxicology
SELECT COUNT(DISTINCT atom.element) = 2 FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR001_1_8' AND (atom.element = 'cl' OR atom.element = 'c');	toxicology
SELECT molecule.molecule_id FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE atom.element = 'c' AND bond.bond_type = '#' AND molecule.label = '-' GROUP BY molecule.molecule_id HAVING COUNT(bond.bond_type) = 3 LIMIT 2;	toxicology
SELECT CAST(SUM(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(DISTINCT molecule.molecule_id), 0) AS percentage FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT atom.element FROM atom WHERE atom.molecule_id = 'TR001';	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '='	toxicology
SELECT atom.atom_id, connected.atom_id2 FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#';	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR005_16_26';	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.label = '-' AND bond.bond_type = '-';	toxicology
SELECT molecule.label FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_id = 'TR001_10_11';	toxicology
SELECT bond.bond_id, molecule.label FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#';	toxicology
SELECT COUNT(atom.element) AS toxicology_count FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE substr(atom.atom_id, 7, 1) = '4' AND molecule.label = '+' AND atom.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT molecule.label, CAST(SUM(CASE WHEN atom.element = 'h' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(atom.element), 0) AS ratio FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.molecule_id = 'TR006' GROUP BY molecule.label;	toxicology
SELECT molecule.label FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'ca';	toxicology
SELECT bond.bond_type FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'te';	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id1 OR atom.atom_id = connected.atom_id2 WHERE connected.bond_id = 'TR001_10_11';	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN bond.bond_type = '#' THEN molecule.molecule_id END) AS FLOAT) / NULLIF(COUNT(DISTINCT molecule.molecule_id), 0) * 100 AS percentage FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id;	toxicology
SELECT DIVIDE(SUM(bond_type = ' = '), COUNT(all bond_id)) AS percent FROM bond WHERE molecule_id = 'TR047';	toxicology
SELECT molecule.label FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.atom_id = 'TR001_1';	toxicology
SELECT molecule.label FROM molecule WHERE molecule.molecule_id = 'TR151';	toxicology
SELECT atom.element FROM atom WHERE atom.molecule_id = 'TR151' AND atom.element IN ('cl','c','h','o','s','n','p','na','br','f','i','sn','pb','te','ca')	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM molecule WHERE label = '+';	toxicology
SELECT atom.atom_id FROM atom WHERE atom.element = 'c' AND substr(atom.molecule_id, 3, 3) > 10 AND substr(atom.molecule_id, 3, 3) < 50;	toxicology
SELECT COUNT(atom.atom_id) AS number_of_atoms FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND bond.bond_type = '='	toxicology
SELECT COUNT(atom.atom_id) AS number_of_atoms FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'h' AND molecule.label = '+';	toxicology
SELECT molecule_id FROM atom WHERE atom_id = 'TR00_1';	toxicology
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'c' AND molecule.label != '-';	toxicology
SELECT DIVIDE(SUM(label = '+' AND element = 'h'), COUNT(molecule_id)) * 100.0 AS percentage FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id;	toxicology
SELECT molecule.label FROM molecule WHERE molecule.molecule_id = 'TR124';	toxicology
SELECT atom.atom_id, atom.element FROM atom WHERE atom.molecule_id = 'TR186';	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR007_4_19' OR connected.atom_id2 = 'TR007_4_19';	toxicology
SELECT atom.element FROM atom JOIN bond ON atom.atom_id = bond.bond_id WHERE bond.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(bond.bond_id) AS number_of_double_bonds, molecule.label AS carcinogenic FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.molecule_id = 'TR006' AND bond.bond_type = '='	toxicology
SELECT molecule.label, atom.element FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+'	toxicology
SELECT atom.atom_id, atom.element, bond.bond_type, connected.atom_id2 FROM atom JOIN bond ON atom.atom_id = bond.bond_id JOIN connected ON atom.atom_id = connected.atom_id WHERE bond.bond_type = '-';	toxicology
SELECT molecule.molecule_id, GROUP_CONCAT(atom.element) AS elements FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '#' GROUP BY molecule.molecule_id;	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(DISTINCT bond_id) AS number_of_bonds FROM connected JOIN atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id WHERE atom.element = 'cl';	toxicology
SELECT atom.atom_id, COUNT(bond.bond_type) AS number_of_bond_type FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.molecule_id = 'TR346' GROUP BY atom.atom_id;	toxicology
SELECT COUNT(DISTINCT molecule_id) AS total_molecules, COUNT(DISTINCT CASE WHEN label = '+' THEN molecule_id END) AS carcinogenic_molecules FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond_type = '=';	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 's') AND molecule_id NOT IN (SELECT molecule_id FROM bond WHERE bond_type = '=');	toxicology
SELECT molecule.label FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_id = 'TR001_2_4' AND molecule.label = '+';	toxicology
SELECT COUNT(atom.atom_id) AS atom_count FROM atom WHERE atom.molecule_id = 'TR005';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT molecule.molecule_id FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'cl' AND molecule.label = '+';	toxicology
SELECT molecule.molecule_id FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'c' AND molecule.label = '-';	toxicology
SELECT DIVIDE(SUM(label = '+' AND element = 'cl'), COUNT(molecule_id)) AS percentage FROM molecule;	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT atom.element) FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN connected AS connected2 ON atom.atom_id = connected2.atom_id2 WHERE connected.bond_id = 'TR001_3_4' AND connected2.bond_id = 'TR001_3_4';	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2';	toxicology
SELECT molecule.label FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.atom_id IN ('TR000_2', 'TR000_4');	toxicology
SELECT atom.element FROM atom WHERE atom.atom_id = 'TR000_1';	toxicology
SELECT molecule.label FROM molecule WHERE molecule.molecule_id = 'TR000';	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(bond_id), 0) AS percentage FROM bond;	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'n' AND molecule.label = '+';	toxicology
SELECT molecule.molecule_id FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE atom.element = 's' AND bond.bond_type = '='	toxicology
SELECT molecule_id FROM molecule WHERE label = '-' AND (SELECT COUNT(atom_id) FROM atom WHERE molecule_id = molecule.molecule_id) > 5;	toxicology
SELECT atom.element FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.molecule_id = 'TR024' AND bond.bond_type = '='	toxicology
SELECT molecule.label, COUNT(atom.molecule_id) AS atom_count FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' GROUP BY molecule.label ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT DIVIDE(SUM(label = '+'), COUNT(molecule_id)) * 100.0 AS percentage FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE atom.element = 'h' AND bond.bond_type = '#';	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS num_molecules FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(atom.atom_id) AS number_of_carbons FROM atom WHERE atom.element = 'c' AND atom.molecule_id = 'TR008';	toxicology
SELECT atom.element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.atom_id = 'TR004_7' AND molecule.label = '-';	toxicology
SELECT COUNT(DISTINCT molecule_id) AS total_molecules FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE atom.element = 'o' AND bond.bond_type = '='	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM bond WHERE bond_type = '#') AND label = '-';	toxicology
SELECT atom.element, bond.bond_type FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.molecule_id = 'TR016';	toxicology
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id JOIN bond ON atom.molecule_id = bond.molecule_id JOIN connected ON atom.atom_id = connected.atom_id WHERE molecule.molecule_id = 'TR012' AND atom.element = 'c' AND bond.bond_type = '=';	toxicology
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND atom.element = 'o';	toxicology
SELECT name FROM cards WHERE cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT name FROM cards WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL)	card_games
SELECT name, MAX(faceConvertedManaCost) AS max_face_converted_mana_cost FROM cards GROUP BY name HAVING MAX(faceConvertedManaCost) > AVG(convertedManaCost);	card_games
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015';	card_games
SELECT c.name, s.name, r.date, r.text FROM cards c JOIN sets s ON c.setCode = s.code JOIN legalities l ON c.uuid = l.uuid JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator';	card_games
SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasContentWarning FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN rulings r ON c.uuid = r.uuid WHERE fd.artist = 'Stephen Daniele';	card_games
SELECT r.date, r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT c.name, a.name, COUNT(r.uuid) AS ruling_count, c.isPromo FROM cards c JOIN artists a ON c.artist = a.name JOIN rulings r ON c.uuid = r.uuid GROUP BY c.name, a.name, c.isPromo ORDER BY ruling_count DESC LIMIT 1;	card_games
SELECT name, text FROM foreign_data WHERE name = 'annul' AND number = '29';	card_games
SELECT c.name, fd.name, fd.text, fd.flavorText FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT CAST(COUNT(CASE WHEN language = 'Chinese Simplified' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM foreign_data;	card_games
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name ILIKE '%Angel of Mercy%'	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT borderColor FROM cards WHERE name ILIKE '%Ancestor''s Chosen%';	card_games
SELECT originaltype FROM cards WHERE name ILIKE '%Ancestor''s Chosen%'	card_games
SELECT DISTINCT set_translations.language FROM set_translations JOIN cards ON set_translations.setCode = cards.setCode WHERE cards.name = 'Angel of Mercy';	card_games
SELECT COUNT(DISTINCT c.uuid) AS total_cards FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(DISTINCT c.uuid) AS total_cards FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isStarter = 1;	card_games
SELECT status FROM legalities WHERE uuid = '8ac972b5-9f6e-5cc8-91c3-b9a40a98232e';	card_games
SELECT type FROM cards WHERE name ILIKE '%Benalish%Knight%';	card_games
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Benalish Knight';	card_games
SELECT DISTINCT artist FROM cards WHERE availability ILIKE '%phyrexian%';	card_games
SELECT CAST(COUNT(CASE WHEN borderColor = 'borderless' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM cards;	card_games
SELECT COUNT(DISTINCT c.uuid) AS reprinted_cards_in_german FROM cards AS c JOIN foreign_data AS fd ON c.uuid = fd.uuid JOIN legalities AS l ON c.uuid = l.uuid WHERE fd.language = 'German' AND c.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.borderColor = 'borderless' AND foreign_data.language = 'Russian';	card_games
SELECT CAST(COUNT(CASE WHEN language = 'French' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM cards WHERE isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords like '%flying%';	card_games
SELECT COUNT(DISTINCT c.uuid) AS total_cards FROM cards c WHERE c.originalType = 'Summon - Angel' AND c.subtypes NOT LIKE '%Angel%';	card_games
SELECT c.id FROM cards c WHERE c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT artist FROM cards WHERE artist IS NOT NULL AND artist != '' AND language = 'Chinese Simplified';	card_games
SELECT name FROM cards WHERE availability = 'paper' AND uuid IN (SELECT uuid FROM foreign_data WHERE language = 'Japanese');	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Banned' AND cards.borderColor = 'white';	card_games
SELECT c.uuid, fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'legacy';	card_games
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Beacon of Immortality';	card_games
SELECT COUNT(cards.id) AS total_cards, GROUP_CONCAT(DISTINCT legalities.status) AS legality_status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = 'future';	card_games
SELECT c.name, c.colors FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW';	card_games
SELECT c.name, s.name, ft.language FROM cards c JOIN sets s ON c.setCode = s.code JOIN foreign_data ft ON c.uuid = ft.uuid WHERE s.code = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT c.id, c.colors, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20;	card_games
SELECT c.name, fd.language, fd.text FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.colors = 'B' AND c.originalType = 'Artifact' AND fd.language != 'English';	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(cards.id) FROM cards WHERE cards.artist = 'John Avon' AND (cards.cardKingdomId IS NULL OR cards.cardKingdomFoilId IS NULL);	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = '-1';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability IN ('paper', 'mtgo');	card_games
SELECT SUM(cast(cards.manaCost AS integer)) AS total_unconverted_mana FROM cards WHERE cards.artist = 'Rob Alexander';	card_games
SELECT DISTINCT subtypes, supertypes FROM cards WHERE availability = 'arena';	card_games
SELECT c.setCode FROM cards AS c JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE fd.language = 'Spanish';	card_games
SELECT CAST(COUNT(CASE WHEN hand = '+3' THEN 1 END) AS FLOAT) / NULLIF(COUNT(id), 0) AS percentage FROM cards WHERE frameEffects = 'legendary';	card_games
SELECT CAST(COUNT(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN isStorySpotlight = 1 THEN 1 END), 0) * 100 AS percentage, id FROM cards;	card_games
SELECT name, DIVIDE(SUM(CASE WHEN language = 'Spanish' THEN 1 ELSE 0 END), COUNT(id))*100 AS percentage FROM foreign_data GROUP BY name ORDER BY percentage DESC;	card_games
SELECT set_translations.language FROM set_translations JOIN sets ON set_translations.setCode = sets.code WHERE sets.baseSetSize = 309;	card_games
SELECT COUNT(DISTINCT s.code) AS total_sets FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Commander' AND st.language = 'Portuguese (Brasil)';	card_games
SELECT cards.id, cards.name, cards.type, legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.type = 'Creature' AND legalities.status = 'legal';	card_games
SELECT DISTINCT subtypes, supertypes FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German';	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL AND text IS NOT NULL;	card_games
SELECT COUNT(DISTINCT c.uuid) AS number_of_cards FROM cards c JOIN rulings r ON c.uuid = r.uuid JOIN legalities l ON c.uuid = l.uuid WHERE r.text ILIKE '%This is a triggered mana ability%' AND l.format ILIKE '%pre-modern%' AND c.side IS NULL;	card_games
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability = 'paper' AND id IN (SELECT card_id FROM legalities WHERE format = 'Pauper');	card_games
SELECT artist FROM cards WHERE text ILIKE '%Das perfekte Gegenmittel zu einer dichten Formation%'	card_games
SELECT foreign_data.name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.artist = 'Matthew D. Wilson' AND cards.borderColor = 'black' AND cards.layout = 'normal' AND foreign_data.language = 'French' AND cards.type like '%Creature%';	card_games
SELECT COUNT(DISTINCT c.uuid) AS total_cards FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2009-01-10';	card_games
SELECT set_translations.language FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ravnica' AND sets.baseSetSize = 180;	card_games
;	card_games
;	card_games
SELECT CAST(COUNT(CASE WHEN language = 'Japanese' AND type = 'expansion' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM sets;	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(id) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name, power, promoTypes FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3;	card_games
SELECT foreign_data.language FROM foreign_data WHERE foreign_data.multiverseid = 149934;	card_games
SELECT c.id, c.cardKingdomFoilId, c.cardKingdomId FROM cards c WHERE c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL ORDER BY c.cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT CAST(COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS proportion FROM cards;	card_games
SELECT cards.number FROM cards WHERE cards.subtypes ILIKE '%Angel%' AND cards.subtypes ILIKE '%Wizard%' AND cards.side IS NULL;	card_games
SELECT s.code, s.name FROM sets s WHERE s.mtgoCode IS NULL OR s.mtgoCode = '' ORDER BY s.name ASC LIMIT 3;	card_games
SELECT DISTINCT language FROM set_translations WHERE setCode = 'ARC' AND mcmName = 'Archenemy';	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5;	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206;	card_games
SELECT c.id, s.name FROM cards c JOIN sets s ON c.setCode = s.code JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT sets.id FROM sets JOIN legalities ON sets.code = legalities.code JOIN foreign_data ON sets.code = foreign_data.multiverseid WHERE sets.isForeignOnly = 1 AND sets.isFoilOnly = 1 AND foreign_data.language = 'Japanese';	card_games
SELECT s.code, s.name, s.baseSetSize FROM sets s WHERE s.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT CAST(COUNT(CASE WHEN isOnlineOnly = 1 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Chinese Simplified';	card_games
SELECT COUNT(DISTINCT s.code) AS num_sets FROM sets s LEFT JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese' AND (s.mtgoCode IS NULL OR s.mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT name FROM sets WHERE id = 174;	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT foreign_data.language FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.name = 'A Pedra Fellwar';	card_games
SELECT sets.code FROM sets WHERE sets.releaseDate = '2007-07-13';	card_games
SELECT base_set_size, code FROM sets WHERE block IN ('Masques', 'Mirage');	card_games
SELECT setCode FROM sets WHERE type = 'expansion';	card_games
SELECT foreign_data.name, cards.type FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.watermark = 'boros';	card_games
SELECT foreign_data.language, foreign_data.flavor_text, cards.type FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.watermark = 'colorpie';	card_games
SELECT CAST(COUNT(CASE WHEN convertedManaCost = 10 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM cards WHERE name = 'Abyssal Horror';	card_games
SELECT sets.code FROM sets WHERE sets.type = 'expansion' AND sets.type = 'commander';	card_games
SELECT foreign_data.name, cards.type FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.watermark = 'abzan';	card_games
SELECT c.type, fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Azorius';	card_games
SELECT COUNT(id) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability like '%paper%' AND hand like '+%';	card_games
SELECT name FROM cards WHERE istextless = 0;	card_games
SELECT manaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE availability LIKE '%arena,mtgo%' AND borderColor = 'black';	card_games
SELECT name, convertedManaCost FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC;	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT s.name FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT set_translations.language) AS number_of_translations FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE cards.name = 'Angel of Mercy';	card_games
SELECT name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid JOIN sets ON cards.setCode = sets.code WHERE foreign_data.language = 'German' AND foreign_data.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(DISTINCT c.uuid) AS num_cards FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Korean';	card_games
SELECT COUNT(cards.id) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid JOIN sets ON cards.setCode = sets.code WHERE foreign_data.artist = 'Adam Rex' AND sets.translation = 'Hauptset Zehnte Edition';	card_games
SELECT baseSetSize FROM sets WHERE code = '10E';	card_games
SELECT set_translations.translation FROM set_translations WHERE set_translations.language = 'Simplified Chinese' AND set_translations.setCode = (SELECT sets.code FROM sets WHERE sets.name = 'Eighth Edition');	card_games
SELECT name, mtgoCode FROM cards WHERE name = 'Angel of Mercy' AND mtgoCode IS NOT NULL;	card_games
SELECT sets.releaseDate FROM cards JOIN sets ON cards.setCode = sets.code WHERE cards.name = 'Ancestor''s Chosen';	card_games
SELECT type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = ' Hauptset Zehnte Edition';	card_games
SELECT COUNT(DISTINCT s.code) AS number_of_sets FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT c.uuid) AS num_cards FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Adarkar Valkyrie' AND s.isForeignOnly = 1;	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND name = 'Coldsnap';	card_games
SELECT name FROM cards WHERE setCode = 'Coldsnap' ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT artist FROM cards WHERE artist IN ('Jeremy Jarvis', 'Aaron Miller','Chippy') AND name = 'Coldsnap';	card_games
SELECT name FROM cards WHERE number = 4 AND setCode = 'Coldsnap';	card_games
SELECT COUNT(DISTINCT CASE WHEN T1.power = '*' OR T1.power IS NULL THEN T1.id END) AS num_unknown_power FROM cards T1 JOIN sets T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5;	card_games
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen';	card_games
SELECT foreign_data.language, foreign_data.flavorText FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.flavorText IS NOT NULL;	card_games
SELECT foreign_data.type FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.language = 'German' AND cards.name = 'Ancestor''s Chosen';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND r.date IS NOT NULL AND r.text IS NOT NULL AND EXISTS (SELECT 1 FROM foreign_data fd WHERE fd.uuid = r.uuid AND fd.language = 'Italian');	card_games
SELECT name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND foreign_data.language = 'Italian' ORDER BY cards.convertedManaCost DESC LIMIT 1;	card_games
SELECT rulings.date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce';	card_games
SELECT CAST(SUM(CASE WHEN convertedManaCost = 7 THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(convertedManaCost), 0) * 100 AS percentage FROM cards WHERE name = 'Coldsnap';	card_games
;	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name ILIKE '%From the Vault: Lore%'	card_games
SELECT sets.parentCode FROM sets WHERE sets.name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';	card_games
SELECT sets.releaseDate FROM cards JOIN sets ON cards.setCode = sets.code WHERE cards.name = 'Evacuation';	card_games
SELECT baseSetSize FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Rinascita di Alara';	card_games
SELECT sets.type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Huitième édition';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Tendo Ice Bridge' AND st.language = 'French';	card_games
SELECT COUNT(translation) FROM set_translations WHERE name = 'Salvat 2011' AND translation IS NOT NULL;	card_games
SELECT s.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN sets s ON c.setCode = s.code WHERE c.name = 'Fellwar Stone' AND fd.language = 'Japanese';	card_games
SELECT name, MAX(convertedManaCost) AS max_converted_mana_cost FROM cards WHERE setCode = 'JOU' GROUP BY name;	card_games
SELECT release_date FROM sets JOIN set_translations ON sets.code = set_translations.set_code WHERE set_translations.translation = 'Ola de frío';	card_games
SELECT sets.type FROM cards JOIN sets ON cards.setCode = sets.code WHERE cards.name = 'Samite Pilgrim';	card_games
SELECT COUNT(cards.id) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3;	card_games
SELECT set_translations.translation FROM set_translations WHERE set_translations.language = 'Chinese Simplified' AND set_translations.name = 'Mirrodin';	card_games
;	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(SUM(CASE WHEN language = 'Portuguese (Brazil)' THEN 1 ELSE 0 END), 0) * 100 AS percentage FROM cards;	card_games
;	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1;	card_games
SELECT artist, name, convertedManaCost FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT MAX(frameEffects) AS most_common_frame_effects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT MAX(totalSetSize) FROM sets WHERE type = 'commander';	card_games
SELECT name, manaCost FROM cards WHERE format = 'duel' ORDER BY manaCost DESC LIMIT 10;	card_games
SELECT c.name, s.name, r.date FROM cards c JOIN sets s ON c.setCode = s.code JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'mythic' AND r.status = 'legal' ORDER BY c.originalReleaseDate ASC LIMIT 1;	card_games
SELECT COUNT(DISTINCT c.id) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan BaÇµa' AND fd.language = 'French';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types = 'Enchantment' AND c.name = 'Abundance' AND l.status = 'Legal';	card_games
SELECT l.format, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'banned' GROUP BY l.format ORDER BY COUNT(l.status = 'banned') DESC LIMIT 1;	card_games
SELECT name FROM sets WHERE code = 'BBD';	card_games
SELECT artist, format FROM cards WHERE artist = (SELECT MIN(artist) FROM cards) GROUP BY artist, format;	card_games
SELECT status FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = '1997' AND foreign_data.artist = 'D. Alexander Gregory' AND cards.hasContentWarning = 1 AND legalities.format = 'legacy';	card_games
SELECT name, format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE edhrecRank = 1 AND status = 'banned';	card_games
SELECT AVG(id) AS average_sets_per_year, MAX(COUNT(language)) AS common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31';	card_games
SELECT DISTINCT artist FROM cards WHERE bordercolor = 'black' AND availability = 'arena';	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND (status = 'banned' OR status = 'restricted');	card_games
SELECT COUNT(id) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT r.text, MAX(r.date) AS latest_date FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' GROUP BY r.text ORDER BY latest_date DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'legal';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Korean' AND NOT EXISTS (SELECT 1 FROM set_translations WHERE language = 'Japanese' AND setCode = s.code)	card_games
SELECT c.frameVersion, c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Allen Williams' AND l.status = 'banned';	card_games
SELECT u.DisplayName, MAX(u.Reputation) AS MaxReputation FROM users u WHERE u.DisplayName IN ('Harlan', 'Jarrod Dixon') GROUP BY u.DisplayName ORDER BY MaxReputation DESC;	codebase_community
SELECT users.DisplayName FROM users WHERE year(users.CreationDate) = 2014;	codebase_community
SELECT COUNT(Id) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00';	codebase_community
SELECT users.displayname FROM users ORDER BY users.views DESC LIMIT 1;	codebase_community
SELECT CAST(COUNT(CASE WHEN users.upvotes > 100 AND users.downvotes > 1 THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN users.upvotes > 100 THEN 1 END), 0) AS proportion FROM users;	codebase_community
SELECT COUNT(Id) FROM users WHERE Views > 10 AND EXTRACT(YEAR FROM CreationDate) > 2013;	codebase_community
SELECT COUNT(posts.id) AS post_count FROM posts JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'csgillespie';	codebase_community
SELECT posts.title FROM posts JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'csgillespie';	codebase_community
SELECT users.displayname FROM posts JOIN users ON posts.owneruserid = users.id WHERE posts.title = 'Eliciting priors from experts';	codebase_community
SELECT Title FROM Posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT users.displayname FROM users JOIN posts ON users.id = posts.owneruserid ORDER BY posts.favoritecount DESC LIMIT 1;	codebase_community
SELECT SUM(posts.commentcount) AS total_comments FROM posts JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'csgillespie';	codebase_community
SELECT MAX(AnswerCount) AS MaxAnswerCount FROM posts WHERE OwnerDisplayName = 'csgillespie';	codebase_community
SELECT users.displayname FROM users JOIN posts ON users.id = posts.lasteditoruserid WHERE posts.title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(Id) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL;	codebase_community
SELECT users.displayname FROM users JOIN posts ON users.id = posts.owneruserid WHERE posts.closeddate IS NOT NULL;	codebase_community
SELECT COUNT(posts.id) AS total_posts FROM posts JOIN users ON posts.owneruserid = users.id WHERE users.age > 65 AND posts.score >= 20;	codebase_community
SELECT users.location FROM users JOIN posts ON users.id = posts.owneruserid WHERE posts.title = 'Eliciting priors from experts';	codebase_community
SELECT p.body FROM posts p JOIN tags t ON p.id = t.excerptpostid WHERE t.tagname = 'bayesian';	codebase_community
SELECT p.body FROM posts p JOIN tags t ON p.id = t.excerptpostid WHERE t.count = (SELECT MAX(count) FROM tags)	codebase_community
SELECT COUNT(badges.id) AS badge_count FROM badges JOIN users ON badges.userid = users.id WHERE users.displayname = 'csgillespie';	codebase_community
SELECT badges.Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(Id) FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011;	codebase_community
SELECT users.displayname FROM users JOIN badges ON users.id = badges.userid GROUP BY users.displayname ORDER BY COUNT(badges.id) DESC LIMIT 1;	codebase_community
SELECT AVG(posts.score) AS average_score FROM posts JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'csgillespie';	codebase_community
SELECT AVG(COUNT(b.id)) AS average_badges FROM users u JOIN badges b ON u.id = b.userid WHERE u.views > 200 GROUP BY u.id;	codebase_community
SELECT CAST(COUNT(CASE WHEN u.Age > 65 THEN 1 END) AS FLOAT) / NULLIF(COUNT(p.Id), 0) * 100 AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 20;	codebase_community
SELECT COUNT(votes.id) AS vote_count FROM votes WHERE votes.userid = 58 AND votes.creationdate = '2010-07-19';	codebase_community
SELECT MAX(votes.CreationDate) AS MaxCreationDate FROM votes;	codebase_community
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT posts.title FROM posts JOIN comments ON posts.id = comments.postid WHERE comments.score = (SELECT MAX(comments.score) FROM comments)	codebase_community
SELECT COUNT(comments.id) AS comment_count FROM comments WHERE comments.postid = 1910;	codebase_community
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = '3025' AND c.CreationDate = '2014/4/23 20:29:39.0';	codebase_community
SELECT comments.text FROM comments JOIN posts ON comments.postid = posts.id WHERE posts.parentid = 107829 AND posts.commentcount = '1';	codebase_community
SELECT COUNT(p.id) AS total_posts, SUM(CASE WHEN p.closeddate IS NULL THEN 1 ELSE 0 END) AS total_open_posts FROM posts p JOIN comments c ON p.id = c.postid WHERE c.userid = '23853' AND c.creationdate = '2013-07-12 09:08:18.0';	codebase_community
SELECT users.reputation FROM users JOIN posts ON users.id = posts.owneruserid WHERE posts.id = '65041';	codebase_community
SELECT COUNT(posts.id) AS post_count FROM posts JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'Tiago Pasqualini';	codebase_community
SELECT users.displayname FROM votes JOIN users ON votes.userid = users.id WHERE votes.id = '6347';	codebase_community
SELECT COUNT(votes.id) AS vote_count FROM votes JOIN posts ON votes.post_id = posts.id WHERE posts.title ilike '%data visualization%';	codebase_community
SELECT badges.Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT CAST(COUNT(posts.id) AS FLOAT) / NULLIF(COUNT(votes.id), 0) AS ratio FROM posts JOIN votes ON posts.owneruserid = votes.userid WHERE posts.owneruserid = '24';	codebase_community
SELECT posts.viewcount FROM posts WHERE posts.title ILIKE '%Integration%of%Weka%and/or%RapidMiner%into%Informatica%PowerCenter/Developer%'	codebase_community
SELECT comments.text FROM comments WHERE comments.score = 17;	codebase_community
SELECT users.DisplayName FROM users WHERE users.WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT badges.name FROM badges JOIN users ON badges.userid = users.id WHERE users.displayname = 'SilentGhost';	codebase_community
SELECT users.displayname FROM users JOIN comments ON users.id = comments.userid WHERE comments.text ILIKE '%thank%you%user93!%';	codebase_community
SELECT comments.text FROM comments JOIN users ON comments.userid = users.id WHERE users.displayname = 'A Lion';	codebase_community
SELECT users.displayname, users.reputation FROM users JOIN posts ON users.id = posts.owneruserid WHERE posts.title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT comments.text FROM comments JOIN posts ON comments.postid = posts.id WHERE posts.title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT users.DisplayName FROM users JOIN badges ON users.Id = badges.UserId WHERE badges.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT users.displayname FROM users JOIN posts ON users.id = posts.lasteditoruserid WHERE posts.title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT posts.title FROM posts JOIN users ON posts.lasteditoruserid = users.id WHERE users.displayname = 'Vebjorn Ljosa';	codebase_community
SELECT SUM(posts.score) AS total_score, users.websiteurl FROM posts JOIN users ON posts.lasteditoruserid = users.id WHERE users.displayname = 'Yevgeny';	codebase_community
SELECT comments.Text FROM comments JOIN posts ON comments.PostId = posts.Id WHERE posts.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(votes.bountyamount) AS total_bounty_amount FROM votes JOIN posts ON votes.postid = posts.id WHERE posts.title ilike '%data%';	codebase_community
SELECT users.displayname FROM users JOIN votes ON users.id = votes.userid WHERE votes.bountyamount = 50 AND users.displayname ilike '%variance%'	codebase_community
SELECT p.Title, p.Score, p.ViewCount, c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Tags like '%humor%' ORDER BY p.ViewCount DESC;	codebase_community
SELECT COUNT(comments.id) AS total_comments FROM comments WHERE comments.userid = 13;	codebase_community
SELECT users.id FROM users ORDER BY users.reputation DESC LIMIT 1;	codebase_community
SELECT users.id FROM users ORDER BY users.views ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT badges.UserId) AS supporter_count FROM badges WHERE badges.Name = 'Supporter' AND EXTRACT(YEAR FROM badges.Date) = 2011;	codebase_community
SELECT COUNT(DISTINCT badges.UserId) AS total_users FROM badges GROUP BY badges.UserId HAVING COUNT(badges.Name) > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS total_users FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'New York' AND b.Name IN ('Teacher', 'Supporter');	codebase_community
SELECT users.displayname, users.reputation FROM users JOIN posts ON users.id = posts.owneruserid WHERE posts.id = 1;	codebase_community
SELECT users.id, users.displayname, users.views FROM users JOIN posthistory ON users.id = posthistory.userid GROUP BY users.id, users.displayname, users.views HAVING COUNT(posthistory.postid) = 1 AND users.views >= 1000;	codebase_community
SELECT users.id, users.displayname, COUNT(comments.id) AS comment_count, badges.name AS badge FROM users JOIN comments ON users.id = comments.userid JOIN badges ON users.id = badges.userid GROUP BY users.id, users.displayname, badges.name ORDER BY comment_count DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT users.id) AS total_teachers FROM users JOIN badges ON users.id = badges.userid WHERE users.location = 'India' AND badges.name = 'Teacher';	codebase_community
SELECT ((COUNT(CASE WHEN YEAR(Date) = 2010 THEN Name END) - COUNT(CASE WHEN YEAR(Date) = 2011 THEN Name END)) / NULLIF(COUNT(Name), 0)) * 100 AS percentage_difference FROM badges WHERE Name = 'Student';	codebase_community
SELECT postHistory.PostHistoryTypeId, COUNT(DISTINCT comments.UserId) AS unique_commenters FROM postHistory JOIN comments ON postHistory.Id = comments.PostId WHERE postHistory.PostId = 3720 GROUP BY postHistory.PostHistoryTypeId;	codebase_community
SELECT p.Id, p.Title, p.ViewCount, p.Score, p.AnswerCount, p.CommentCount, p.FavoriteCount, p.Tags, u.DisplayName, u.Reputation, u.Location, u.Views, u.UpVotes, u.DownVotes, u.AccountId, u.Age, u.ProfileImageUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id IN (SELECT RelatedPostId FROM postLinks WHERE PostId = 61217) ORDER BY p.ViewCount DESC;	codebase_community
SELECT p.Score, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Id = 395;	codebase_community
SELECT p.Id, u.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 60;	codebase_community
SELECT SUM(posts.favoritecount) AS total_favorite_count FROM posts JOIN users ON posts.owneruserid = users.id WHERE users.id = 686 AND EXTRACT(YEAR FROM posts.creationdate) = 2011;	codebase_community
SELECT AVG(u.upvotes) AS average_upvotes, AVG(u.age) AS average_age FROM users u WHERE (SELECT COUNT(p.id) FROM posts p WHERE p.owneruserid = u.id) > 10;	codebase_community
SELECT COUNT(DISTINCT badges.UserId) AS total_users FROM badges WHERE badges.Name = 'Announcer';	codebase_community
SELECT badges.Name FROM badges WHERE badges.Date = '2010-07-19 19:39:08';	codebase_community
SELECT COUNT(*) FROM comments WHERE score > 60;	codebase_community
SELECT comments.text FROM comments WHERE comments.creationdate = '2010-07-19 19:25:47.0';	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10;	codebase_community
SELECT badges.name FROM badges JOIN users ON badges.userid = users.id WHERE users.reputation = (SELECT MAX(reputation) FROM users)	codebase_community
SELECT users.reputation FROM users JOIN badges ON users.id = badges.userid WHERE badges.date = '2010-07-19 19:39:08.0';	codebase_community
;	codebase_community
SELECT badges.date, users.location FROM badges JOIN users ON badges.userid = users.id WHERE users.location ILIKE '%Rochester, NY%' ORDER BY badges.date;	codebase_community
;	codebase_community
SELECT CAST(COUNT(CASE WHEN users.age BETWEEN 13 AND 18 THEN users.id END) AS FLOAT) / NULLIF(COUNT(users.id), 0) * 100 AS percentage FROM users JOIN badges ON users.id = badges.userid WHERE badges.name = 'Organizer';	codebase_community
SELECT comments.score FROM comments JOIN posts ON comments.postid = posts.id WHERE posts.creationdate = '2010-07-19 19:19:56.0';	codebase_community
SELECT comments.text FROM comments WHERE comments.creationdate = '2010-07-19 19:37:33.0';	codebase_community
SELECT users.age FROM users JOIN badges ON users.id = badges.userid WHERE users.location = 'Vienna, Austria';	codebase_community
SELECT COUNT(DISTINCT users.id) AS total_adult_supporters FROM users JOIN badges ON users.id = badges.userid WHERE users.age BETWEEN 19 AND 65 AND badges.name = 'Supporter';	codebase_community
SELECT SUM(u.Views) AS total_views FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT badges.name FROM badges JOIN users ON badges.userid = users.id WHERE users.reputation = (SELECT MIN(reputation) FROM users)	codebase_community
SELECT badges.name FROM badges JOIN users ON badges.userid = users.id WHERE users.displayname = 'Sharpie';	codebase_community
SELECT COUNT(DISTINCT users.id) AS total_elders FROM users JOIN badges ON users.id = badges.userid WHERE users.age > 65 AND badges.name = 'Supporter';	codebase_community
SELECT users.displayname FROM users WHERE users.id = 30;	codebase_community
SELECT COUNT(DISTINCT users.id) AS total_users FROM users WHERE users.location ILIKE '%New%York%';	codebase_community
SELECT COUNT(Id) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE age BETWEEN 19 AND 65;	codebase_community
SELECT users.DisplayName, users.Views FROM users ORDER BY users.Views DESC;	codebase_community
;	codebase_community
SELECT tags.tagname FROM tags JOIN posts ON tags.excerptpostid = posts.id JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'John Stauffer';	codebase_community
SELECT COUNT(posts.id) AS post_count FROM posts JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'Daniel Vassallo';	codebase_community
SELECT COUNT(votes.id) AS vote_count FROM votes JOIN users ON votes.userid = users.id WHERE users.displayname = 'Harlan';	codebase_community
SELECT p.id FROM posts p JOIN users u ON p.owneruserid = u.id WHERE u.displayname = 'slashnick' ORDER BY p.answercount DESC LIMIT 1;	codebase_community
SELECT MAX(SUM(ViewCount)) FROM posts WHERE DisplayName = 'Harvey Motulsky' OR DisplayName = 'Noah Snyder';	codebase_community
SELECT COUNT(posts.id) FROM posts JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'Matt Parker' AND posts.id > 4;	codebase_community
SELECT COUNT(*) FROM comments WHERE score < 60 AND postid IN (SELECT id FROM posts WHERE ownerdisplayname = 'Neil McGuigan');	codebase_community
SELECT tags.tagname FROM tags JOIN posts ON tags.id = posts.id JOIN users ON users.id = posts.owneruserid WHERE users.displayname = 'Mark Meckes' AND posts.id NOT IN (SELECT postid FROM comments);	codebase_community
SELECT users.DisplayName FROM users JOIN badges ON users.Id = badges.UserId WHERE badges.Name = 'Organizer';	codebase_community
SELECT CAST(COUNT(CASE WHEN t.TagName = 'r' THEN 1 END) AS FLOAT) / NULLIF(COUNT(DISTINCT p.Id), 0) AS percentage FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN users u ON p.OwnerUserId = u.Id JOIN tags t ON p.Id = t.PostId WHERE u.DisplayName = 'Community';	codebase_community
;	codebase_community
SELECT COUNT(DISTINCT badges.UserId) AS commentator_count FROM badges WHERE badges.Name = 'Commentator' AND EXTRACT(YEAR FROM badges.Date) = 2014;	codebase_community
SELECT COUNT(Id) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59';	codebase_community
SELECT users.displayname, users.age FROM users WHERE users.views = (SELECT MAX(users.views) FROM users)	codebase_community
SELECT p.laseditdate, p.lasteditoruserid FROM posts p WHERE p.title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM comments WHERE Score < 60 AND UserId = 13;	codebase_community
SELECT p.Title, c.UserDisplayName FROM comments c JOIN posts p ON p.Id = c.PostId WHERE c.Score > 60;	codebase_community
SELECT badges.Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.Location = 'North Pole' AND EXTRACT(YEAR FROM badges.Date) = 2011;	codebase_community
SELECT users.displayname, users.websiteurl FROM users JOIN posts ON users.id = posts.owneruserid WHERE posts.favoritecount > 150;	codebase_community
SELECT COUNT(postHistory.id) AS post_history_count, MAX(postHistory.creationDate) AS last_edit_date FROM postHistory JOIN posts ON postHistory.postId = posts.id WHERE posts.title = 'What is the best introductory Bayesian statistics textbook?';	codebase_community
SELECT users.displayname, users.location, users.lastaccessdate FROM users JOIN badges ON users.id = badges.userid WHERE badges.name = 'Outliers' ORDER BY users.lastaccessdate DESC;	codebase_community
[SOL] SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Body like '%How to tell if something happened in a data set which monitors a value over time%' AND pl.LinkTypeId = 3; [/SOL]	codebase_community
SELECT p.Id, b.Name FROM posts p JOIN comments c ON p.Id = c.PostId JOIN users u ON c.UserId = u.Id JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'Samuel' AND YEAR(p.CreationDate) = 2013 AND YEAR(b.Date) = 2013;	codebase_community
SELECT users.displayname FROM posts JOIN users ON posts.owneruserid = users.id ORDER BY posts.viewcount DESC LIMIT 1;	codebase_community
SELECT users.displayname, users.location FROM users JOIN posts ON users.id = posts.owneruserid JOIN tags ON posts.id = tags.excerptpostid WHERE tags.tagname = 'hypothesis-testing';	codebase_community
;	codebase_community
SELECT users.displayname FROM posts JOIN users ON posts.owneruserid = users.id WHERE posts.parentid IS NOT NULL ORDER BY posts.score DESC LIMIT 1;	codebase_community
SELECT users.displayname, users.websiteurl FROM users JOIN votes ON users.id = votes.userid WHERE votes.votetypeid = 8 ORDER BY votes.bountyamount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(DISTINCT t.id) AS tag_count FROM tags t JOIN posts p ON t.excerptpostid = p.id WHERE t.count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT users.age FROM users WHERE users.id = (SELECT users.id FROM users ORDER BY users.reputation DESC LIMIT 1);	codebase_community
SELECT COUNT(DISTINCT p.Id) AS NumberOfPosts FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(p.CreationDate) = 2011 AND v.BountyAmount = 50;	codebase_community
SELECT users.id FROM users ORDER BY users.age ASC LIMIT 1;	codebase_community
SELECT posts.score FROM posts JOIN tags ON posts.id = tags.excerptpostid WHERE tags.count = (SELECT MAX(tags.count) FROM tags)	codebase_community
;	codebase_community
SELECT p.id, p.favoritecount FROM posts p JOIN votes v ON p.id = v.postid WHERE v.userid = 1465 ORDER BY p.favoritecount DESC LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks)	codebase_community
SELECT users.displayname FROM users JOIN badges ON users.id = badges.userid GROUP BY users.id ORDER BY COUNT(badges.name) DESC LIMIT 1;	codebase_community
SELECT MIN(v.CreationDate) AS FirstVoteDate FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl';	codebase_community
SELECT MIN(posts.creationdate) AS first_post_date FROM posts JOIN users ON posts.owneruserid = users.id ORDER BY users.age ASC LIMIT 1;	codebase_community
SELECT users.displayname FROM users JOIN badges ON users.id = badges.userid WHERE badges.name = 'Autobiographer' ORDER BY badges.date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS total_users FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
;	codebase_community
SELECT users.displayname FROM users ORDER BY users.reputation DESC LIMIT 1;	codebase_community
SELECT COUNT(Id) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT users.displayname FROM users WHERE users.age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(Id) FROM posts WHERE OwnerDisplayName = 'Jay Stevens' AND YEAR(CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT AVG(posts.score) AS average_score FROM posts JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'Stephen Turner';	codebase_community
SELECT users.displayname FROM users JOIN posts ON users.id = posts.owneruserid WHERE posts.viewcount > 20000 AND YEAR(posts.creationdate) = 2011;	codebase_community
SELECT p.id, u.displayname FROM posts p JOIN users u ON p.owneruserid = u.id WHERE year(p.creationdate) = 2010 ORDER BY p.favoritecount DESC LIMIT 1;	codebase_community
SELECT CAST(COUNT(Id) filter (WHERE CreationDate = 2011 AND Reputation > 1000) AS FLOAT) / NULLIF(COUNT(Id), 0) * 100 AS percentage FROM users;	codebase_community
;	codebase_community
SELECT p.viewcount, u.displayname FROM posts p JOIN users u ON p.owneruserid = u.id WHERE p.title = 'Computer Game Datasets' ORDER BY p.lastactivitydate DESC LIMIT 1;	codebase_community
SELECT COUNT(Id) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(comments.id) AS comment_count FROM comments JOIN posts ON comments.postid = posts.id WHERE posts.score = (SELECT MAX(posts.score) FROM posts);	codebase_community
SELECT COUNT(Id) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT users.displayname, users.location FROM users JOIN posts ON users.id = posts.lasteditoruserid WHERE posts.id = 183 ORDER BY posts.lasteditdate DESC LIMIT 1;	codebase_community
SELECT Name FROM badges WHERE "UserDisplayName" ILIKE '%Emmett%' ORDER BY "Date" DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT users.id) AS total_users FROM users WHERE users.age BETWEEN 19 AND 65 AND users.upvotes > 5000;	codebase_community
;	codebase_community
SELECT COUNT(DISTINCT p.Id) AS NumberOfPosts, COUNT(DISTINCT c.Id) AS NumberOfComments FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users);	codebase_community
SELECT comments.Text, users.DisplayName FROM comments JOIN posts ON comments.PostId = posts.Id JOIN users ON comments.UserId = users.Id WHERE posts.Title = 'Analysing wind data with R' ORDER BY comments.CreationDate DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT badges.UserId) AS number_of_users FROM badges WHERE badges.Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(posts.id) AS number_of_posts FROM posts JOIN tags ON posts.id = tags.excerptpostid WHERE tags.tagname = 'careers';	codebase_community
SELECT users.reputation, users.views FROM users WHERE users.displayname = 'Jarrod Dixon';	codebase_community
SELECT COUNT(DISTINCT comments.id) AS comment_count, COUNT(DISTINCT answers.id) AS answer_count FROM posts JOIN comments ON posts.id = comments.postid JOIN answers ON posts.id = answers.parentid WHERE posts.title = 'Clustering 1D data';	codebase_community
SELECT users.creationdate FROM users WHERE users.displayname = 'IrishStat';	codebase_community
SELECT COUNT(votes.id) AS number_of_posts FROM votes WHERE votes.bountyamount >= 30;	codebase_community
SELECT CAST(COUNT(CASE WHEN posts.score >= 50 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS percentage FROM posts JOIN users ON posts.owneruserid = users.id WHERE users.reputation = (SELECT MAX(reputation) FROM users)	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(Id) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT tags.ExcerptPostId, tags.WikiPostId FROM tags WHERE tags.TagName = 'sample';	codebase_community
SELECT users.reputation, users.upvotes FROM users JOIN comments ON users.id = comments.userid WHERE comments.text = 'fine, you win :)';	codebase_community
SELECT comments.text FROM comments JOIN posts ON comments.postid = posts.id WHERE posts.title = 'How can I adapt ANOVA for binary data?';	codebase_community
SELECT comments.text FROM comments JOIN posts ON comments.postid = posts.id WHERE posts.viewcount BETWEEN 100 AND 150 ORDER BY comments.score DESC LIMIT 1;	codebase_community
SELECT users.creationdate, users.age FROM users JOIN comments ON users.id = comments.userid WHERE comments.text like '%http://%'	codebase_community
SELECT COUNT(DISTINCT(c.PostId)) AS num_posts FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT CAST(SUM(CASE WHEN comments.score = 0 THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(comments.id), 0) AS proportion FROM comments JOIN posts ON comments.postid = posts.id WHERE posts.commentcount = 1;	codebase_community
SELECT COUNT(DISTINCT(v.UserId)) AS total_users FROM votes v JOIN comments c ON v.PostId = c.PostId WHERE c.Score = 0 AND v.UserId IN (SELECT u.Id FROM users u WHERE u.Age = 40);	codebase_community
SELECT comments.id, comments.text FROM comments JOIN posts ON comments.postid = posts.id WHERE posts.title = 'Group differences on a five point Likert item';	codebase_community
SELECT users.upvotes FROM users JOIN comments ON users.id = comments.userid WHERE comments.text ILIKE '%R%is%also%lazy%evaluated.%'	codebase_community
SELECT comments.Text FROM comments JOIN users ON comments.UserId = users.Id WHERE users.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT users.displayname FROM comments JOIN users ON comments.userid = users.id WHERE comments.score BETWEEN 1 AND 5 AND users.downvotes = 0;	codebase_community
SELECT CAST(COUNT(DISTINCT CASE WHEN u.UpVotes = 0 AND c.Score BETWEEN 5 AND 10 THEN c.UserId END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN c.Score BETWEEN 5 AND 10 THEN c.UserId END), 0) AS percentage FROM comments c JOIN users u ON c.UserId = u.Id;	codebase_community
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT hero_power.hero_id) AS superhero_count FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero WHERE height_cm > 200 AND id IN (SELECT hero_id FROM hero_power WHERE power_id IN (SELECT id FROM superpower WHERE power_name = 'Super Strength'));	superhero
SELECT superhero.full_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.full_name HAVING COUNT(superhero.full_name) > 15;	superhero
SELECT COUNT(DISTINCT superhero.id) AS total_superheroes_with_blue_eyes FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id WHERE superhero.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT hp.hero_id) AS number_of_superheroes FROM hero_power hp JOIN superhero s ON s.id = hp.hero_id JOIN colour c ON c.id = s.eye_colour_id JOIN superpower sp ON sp.id = hp.power_id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id AND colour.colour = 'Blue' JOIN colour AS colour2 ON superhero.hair_colour_id = colour2.id AND colour2.colour = 'Blond';	superhero
SELECT COUNT(superhero.id) AS total_superheroes FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT superhero.full_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' ORDER BY superhero.height_cm DESC LIMIT 1;	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Sauron';	superhero
SELECT COUNT(DISTINCT superhero.id) AS number_of_superheroes FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE colour.colour = 'Blue' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(height_cm) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT CAST(COUNT(CASE WHEN power_name = 'Super Strength' THEN 1 END) AS FLOAT) / NULLIF(COUNT(id), 0) * 100 AS percentage FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id JOIN superpower ON superhero.id = hero_power.hero_id WHERE publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(superhero.id) AS total_superheroes FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics';	superhero
SELECT superhero.superhero_name, publisher.publisher_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = (SELECT MIN(hero_attribute.attribute_value) FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed')	superhero
SELECT COUNT(DISTINCT superhero.id) AS total_superheroes FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT publisher_name FROM publisher JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(superhero.id) AS number_of_superheroes FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Intelligence' ORDER BY hero_attribute.attribute_value ASC LIMIT 1;	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'Copycat';	superhero
SELECT COUNT(DISTINCT superhero.id) AS total_superheroes FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50;	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch';	superhero
SELECT COUNT(DISTINCT superhero.id) AS total_female_superheroes_with_strength_100 FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE gender.gender = 'Female' AND attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = 100;	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.superhero_name ORDER BY COUNT(superhero.superhero_name) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT CAST(COUNT(CASE WHEN alignment = 'Bad' THEN 1 END) AS FLOAT) / NULLIF(COUNT(id), 0) * 100 AS percentage,        CAST(COUNT(CASE WHEN alignment = 'Bad' AND publisher_name = 'Marvel Comics' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN publisher_name = 'Marvel Comics' THEN 1 END), 0) * 100 AS marvel_percentage FROM superhero;	superhero
SELECT (SELECT COUNT(DISTINCT superhero.id) FROM superhero WHERE superhero.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) - (SELECT COUNT(DISTINCT superhero.id) FROM superhero WHERE superhero.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference_in_number_of_superheroes;	superhero
SELECT id FROM publisher WHERE publisher_name ILIKE '%star%trek%';	superhero
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.id = 75;	superhero
SELECT superpower.power_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Deathlok';	superhero
SELECT AVG(superhero.weight_kg) AS average_weight FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female';	superhero
SELECT superpower.power_name FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE gender.gender = 'Male' LIMIT 5;	superhero
SELECT superhero.superhero_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien';	superhero
SELECT superhero.superhero_name FROM superhero WHERE superhero.height_cm BETWEEN 170 AND 190 AND superhero.eye_colour_id = 1;	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_power.hero_id = 56;	superhero
SELECT superhero.full_name FROM superhero WHERE superhero.race_id = (SELECT race.id FROM race WHERE race.race = 'Demi-God') LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 169;	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE superhero.height_cm = 185 AND superhero.race = 'human';	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.weight_kg = (SELECT MAX(weight_kg) FROM superhero)	superhero
SELECT CAST(COUNT(CASE WHEN superhero.publisher_id = 13 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM superhero WHERE superhero.height_cm BETWEEN 150 AND 180;	superhero
SELECT superhero.full_name FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Male' AND superhero.weight_kg > MULTIPLY(AVG(superhero.weight_kg), 0.79);	superhero
SELECT power_name, COUNT(power_name) AS power_count FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id GROUP BY power_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT hero_attribute.attribute_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_power.hero_id = 1;	superhero
SELECT COUNT(DISTINCT hero_id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'stealth';	superhero
SELECT superhero.full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_name = 'strength' ORDER BY hero_attribute.attribute_value DESC LIMIT 1;	superhero
SELECT AVG(CASE WHEN superhero.skin_colour_id = 1 THEN superhero.id ELSE NULL END) AS average_superheroes_with_no_skin_colour FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id;	superhero
SELECT COUNT(superhero.id) AS total_superheroes FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE attribute.attribute_name = 'durability' AND publisher.publisher_name = 'Dark Horse Comics' ORDER BY hero_attribute.attribute_value DESC LIMIT 1;	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Abraham Sapien';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight';	superhero
SELECT s.superhero_name, c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT superhero.superhero_name, publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.hair_colour_id = superhero.skin_colour_id AND superhero.hair_colour_id = superhero.eye_colour_id;	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'A-Bomb';	superhero
SELECT CAST(SUM(CASE WHEN colour = 'Blue' AND gender = 'Female' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN gender = 'Female' THEN 1 END), 0) * 100 AS percentage FROM superhero;	superhero
SELECT superhero.superhero_name, race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.full_name = 'Charles Chandler';	superhero
SELECT gender.gender FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Adaptation';	superhero
SELECT COUNT(DISTINCT superpower.id) AS number_of_powers FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Amazo';	superhero
SELECT superpower.power_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.full_name = 'Hunter Zolomon';	superhero
SELECT superhero.superhero_name, superhero.height_cm FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Amber';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id AND superhero.hair_colour_id = colour.id WHERE colour.colour = 'Black';	superhero
SELECT superhero.superhero_name, colour.colour AS eye_colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN colour AS skin_colour ON superhero.skin_colour_id = skin_colour.id WHERE skin_colour.colour = 'Gold';	superhero
SELECT superhero.full_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire';	superhero
SELECT superhero.superhero_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral';	superhero
SELECT COUNT(DISTINCT hero_id) FROM hero_attribute WHERE attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_name = 'Strength');	superhero
SELECT race.race, alignment.alignment FROM superhero JOIN race ON superhero.race_id = race.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Cameron Hicks';	superhero
SELECT CAST(COUNT(CASE WHEN gender = 'Female' AND publisher_name = 'Marvel Comics' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN publisher_name = 'Marvel Comics' THEN 1 END), 0) * 100 AS percentage FROM superhero;	superhero
SELECT AVG(superhero.weight_kg) AS average_weight FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien';	superhero
SELECT (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Charles Chandler') AS difference FROM superhero;	superhero
SELECT superhero.superhero_name, AVG(superhero.height_cm) AS average_height FROM superhero GROUP BY superhero.superhero_name;	superhero
SELECT superpower.power_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT COUNT(DISTINCT superhero.id) AS total_male_superheroes FROM superhero JOIN race ON superhero.race_id = race.id JOIN gender ON superhero.gender_id = gender.id WHERE race.race = 'god/eternal' AND gender.gender = 'male';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' ORDER BY hero_attribute.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE ha.hero_id = (SELECT id FROM superhero WHERE superhero_name = '3-D Man');	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id AND colour.colour = 'Blue' JOIN colour AS colour2 ON superhero.hair_colour_id = colour2.id AND colour2.colour = 'Brown';	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(superhero.id) FROM superhero WHERE superhero.publisher_id IS NULL;	superhero
SELECT CAST(COUNT(CASE WHEN eye_colour_id = 7 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM superhero;	superhero
SELECT CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END), 0) AS ratio FROM superhero;	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superpower.id FROM superpower WHERE superpower.power_name = 'cryokinesis';	superhero
SELECT superhero.superhero_name FROM superhero WHERE superhero.id = 294;	superhero
SELECT superhero.full_name FROM superhero WHERE (superhero.weight_kg = 0 OR superhero.weight_kg IS NULL);	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Karen Beecher-Duncan';	superhero
SELECT superpower.power_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.full_name = 'Helen Parr';	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 108 AND superhero.height_cm = 188;	superhero
SELECT publisher_name FROM publisher JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.id = 38;	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value = (SELECT MAX(hero_attribute.attribute_value) FROM hero_attribute);	superhero
SELECT alignment.alignment, superpower.power_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Atom IV';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';	superhero
SELECT AVG(hero_attribute.attribute_value) AS average_attribute_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral';	superhero
SELECT superhero.superhero_name, colour.colour FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN alignment a ON s.alignment_id = a.id WHERE g.gender = 'Female' AND a.alignment = 'Good';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value BETWEEN 75 AND 80;	superhero
SELECT race.race FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id JOIN gender ON superhero.gender_id = gender.id JOIN race ON superhero.race_id = race.id WHERE colour.colour = 'blue' AND gender.gender = 'male';	superhero
SELECT CAST(COUNT(CASE WHEN gender.gender_id = 2 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN gender ON superhero.gender_id = gender.id WHERE alignment.alignment = 'Bad';	superhero
SELECT (SELECT COUNT(DISTINCT CASE WHEN s.eye_colour_id = 7 THEN s.id END) FROM superhero s WHERE s.weight_kg = 0 OR s.weight_kg IS NULL) - (SELECT COUNT(DISTINCT CASE WHEN s.eye_colour_id = 1 THEN s.id END) FROM superhero s WHERE s.weight_kg = 0 OR s.weight_kg IS NULL) AS difference FROM superhero s;	superhero
SELECT hero_attribute.attribute_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero.superhero_name = 'Hulk' AND attribute.attribute_name = 'Strength';	superhero
SELECT superpower.power_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Ajax';	superhero
SELECT COUNT(DISTINCT superhero.id) AS number_of_villains FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Green' AND superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero.superhero_name ASC;	superhero
SELECT gender.gender FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id JOIN gender ON superhero.gender_id = gender.id WHERE superpower.power_name = 'Phoenix Force';	superhero
SELECT superhero_name, MAX(weight_kg) AS heaviest_weight FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher_name = 'DC Comics' GROUP BY superhero_name ORDER BY heaviest_weight DESC LIMIT 1;	superhero
SELECT AVG(superhero.height_cm) AS average_height FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id JOIN race ON superhero.race_id = race.id WHERE publisher.publisher_name = 'Dark Horse Comics' AND race.race <> 'Human';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;	superhero
SELECT (SELECT COUNT(superhero.id) FROM superhero WHERE superhero.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) - (SELECT COUNT(superhero.id) FROM superhero WHERE superhero.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS difference;	superhero
SELECT attribute.attribute_name FROM attribute JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Black Panther' ORDER BY hero_attribute.attribute_value ASC LIMIT 1;	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT superhero.superhero_name FROM superhero WHERE superhero.height_cm = (SELECT MAX(superhero.height_cm) FROM superhero);	superhero
SELECT superhero.superhero_name FROM superhero WHERE superhero.full_name ILIKE '%Charles%Chandler%'	superhero
SELECT CAST(COUNT(CASE WHEN gender = 'Female' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'George Lucas');	superhero
SELECT CAST(COUNT(CASE WHEN alignment = 'Good' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM superhero WHERE publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_attribute.hero_id FROM hero_attribute WHERE hero_attribute.attribute_value = (SELECT MIN(hero_attribute.attribute_value) FROM hero_attribute);	superhero
SELECT superhero.full_name FROM superhero WHERE superhero.superhero_name = 'Alien';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'brown' AND superhero.weight_kg < 100;	superhero
SELECT attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT superhero.weight_kg, race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.id = 40;	superhero
SELECT AVG(superhero.height_cm) AS average_height FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral';	superhero
SELECT superhero.id FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Intelligence';	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Blackwulf';	superhero
SELECT superhero.superhero_name, superpower.power_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.height_cm > MULTIPLY(AVG(superhero.height_cm), 0.8);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q1 = (SELECT MAX(q1) FROM qualifying) AND q.raceId = 18;	formula_1
SELECT drivers.surname FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.q2 = (SELECT MIN(qualifying.q2) FROM qualifying WHERE qualifying.raceId = 19) AND qualifying.raceId = 19;	formula_1
SELECT races.year FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.location = 'Shanghai';	formula_1
SELECT races.url FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT races.name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Germany';	formula_1
SELECT circuits.name, results.position FROM circuits JOIN constructors ON circuits.circuitId = constructors.constructorId JOIN results ON constructors.constructorId = results.constructorId WHERE constructors.name = 'Renault' ORDER BY results.position;	formula_1
SELECT COUNT(raceId) FROM races WHERE year = 2010 AND (country != 'Asia' AND country != 'Europe');	formula_1
SELECT races.name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Spain';	formula_1
SELECT circuits.lat, circuits.lng FROM circuits WHERE circuits.name ILIKE '%australian%grand%prix%'	formula_1
SELECT races.url FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Sepang International Circuit';	formula_1
SELECT races.date, races.time FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Sepang International Circuit';	formula_1
SELECT circuits.lat, circuits.lng FROM circuits WHERE circuits.location = 'Abu Dhabi';	formula_1
SELECT circuits.country FROM circuits JOIN races ON circuits.circuitId = races.circuitId JOIN constructorResults ON races.raceId = constructorResults.raceId JOIN constructors ON constructorResults.constructorId = constructors.constructorId WHERE races.raceId = 24 AND constructorResults.points = 1;	formula_1
SELECT q.q1 FROM qualifying q WHERE q.driverId = (SELECT d.driverId FROM drivers d WHERE d.forename = 'Bruno' AND d.surname = 'Senna') AND q.raceId = 354;	formula_1
SELECT drivers.nationality FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.q2 = '0:01:40' AND qualifying.raceId = 355;	formula_1
SELECT drivers.number FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.q3 = '0:01:54' AND qualifying.raceId = 903;	formula_1
SELECT COUNT(DISTINCT r.driverId) AS num_drivers_did_not_finish FROM races AS r LEFT JOIN results AS rr ON r.raceId = rr.raceId AND r.year = rr.raceId WHERE r.name = 'Bahrain Grand Prix' AND r.year = 2007 AND rr.time IS NULL;	formula_1
SELECT races.date FROM races WHERE races.raceId = 901;	formula_1
SELECT COUNT(DISTINCT r.driverId) AS num_finished_drivers FROM races r JOIN results rr ON r.raceId = rr.raceId WHERE r.date = '2015-11-29' AND rr.time IS NOT NULL;	formula_1
SELECT d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT drivers.forename, drivers.surname, drivers.url FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE lapTimes.raceId = 161 AND lapTimes.time = '0:01:27';	formula_1
SELECT drivers.nationality FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.raceId = 933 AND results.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933);	formula_1
SELECT circuits.lat, circuits.lng FROM circuits WHERE circuits.country = 'Malaysia';	formula_1
;	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi') AND raceId = 345;	formula_1
SELECT drivers.nationality FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.q2 = '0:01:15' AND qualifying.raceId = 347;	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q3 = '0:01:33' AND q.raceId = 45;	formula_1
SELECT r.time FROM races AS r JOIN results AS re ON r.raceId = re.raceId JOIN drivers AS d ON re.driverId = d.driverId WHERE r.raceId = 743 AND d.forename = 'Bruce' AND d.surname = 'McLaren';	formula_1
SELECT drivers.forename, drivers.surname FROM results JOIN races ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE races.name = 'San Marino Grand Prix' AND races.year = 2006 AND results.position = 2;	formula_1
SELECT races.date FROM races WHERE races.raceId = 901;	formula_1
SELECT COUNT(DISTINCT(r.driverId)) AS total_drivers FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.date = '2015-11-29';	formula_1
SELECT drivers.forename, drivers.surname, drivers.dob FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.raceId = 872 AND results.time IS NOT NULL ORDER BY drivers.dob DESC LIMIT 1;	formula_1
SELECT drivers.forename, drivers.surname FROM results JOIN lapTimes ON results.raceId = lapTimes.raceId AND results.driverId = lapTimes.driverId WHERE results.raceId = 348 ORDER BY lapTimes.time ASC LIMIT 1;	formula_1
SELECT drivers.nationality FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE results.fastestLapSpeed = (SELECT MAX(results.fastestLapSpeed) FROM results) AND results.raceId = 348;	formula_1
;	formula_1
SELECT COUNT(DISTINCT CASE WHEN time IS NOT NULL THEN driverid END) / NULLIF(COUNT(DISTINCT driverid), 0) AS completion_rate FROM races WHERE date = '1983-07-16';	formula_1
SELECT MIN(year) FROM races WHERE name ILIKE '%singapore%grand%prix%';	formula_1
SELECT COUNT(raceId) AS number_of_races FROM races WHERE year = 2005; SELECT name FROM races WHERE year = 2005 ORDER BY name DESC;	formula_1
;	formula_1
SELECT races.name, races.date FROM races WHERE races.year = 1999 ORDER BY races.round DESC LIMIT 1;	formula_1
SELECT year, MAX(round) AS max_round FROM races GROUP BY year ORDER BY max_round DESC LIMIT 1;	formula_1
SELECT races.name FROM races WHERE races.year = 2017 AND races.name NOT IN (SELECT races.name FROM races WHERE races.year = 2000);	formula_1
SELECT circuits.country, circuits.name, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = (SELECT MIN(year) FROM seasons) AND races.name like '%Grand%Prix%' AND circuits.country like '%Europe%' ORDER BY races.year ASC LIMIT 1;	formula_1
SELECT MAX(races.year) AS last_season FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Brands Hatch' AND races.name = 'British Grand Prix';	formula_1
SELECT COUNT(DISTINCT r.year) AS num_of_seasons FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit' AND r.name = 'British Grand Prix';	formula_1
SELECT drivers.forename, drivers.surname, driverstandings.position FROM driverstandings JOIN drivers ON driverstandings.driverid = drivers.driverid WHERE driverstandings.raceid = (SELECT raceid FROM races WHERE name = 'Singapore Grand Prix' AND year = 2010) ORDER BY driverstandings.position;	formula_1
SELECT drivers.forename, drivers.surname, MAX(results.points) AS max_points FROM results JOIN drivers ON results.driverId = drivers.driverId GROUP BY drivers.driverId ORDER BY max_points DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, r.points FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 1077 AND r.year = 2017 ORDER BY r.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name, lt.time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE lt.time = (SELECT MIN(time) FROM lapTimes)	formula_1
SELECT AVG(milliseconds) FROM lapTimes WHERE raceId = 2009 AND driverId = 1;	formula_1
;	formula_1
SELECT d.forename, d.surname, d.nationality, AVG(r.points) AS avg_points FROM results r JOIN drivers d ON r.driverid = d.driverid GROUP BY d.driverid ORDER BY COUNT(r.wins) DESC, AVG(r.points) DESC LIMIT 1;	formula_1
SELECT drivers.forename, drivers.surname, 2022-YEAR(drivers.dob) AS age FROM drivers WHERE drivers.nationality = 'Japanese' ORDER BY drivers.dob DESC LIMIT 1;	formula_1
SELECT circuits.name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE (races.year BETWEEN 1990 AND 2000) GROUP BY circuits.name HAVING COUNT(races.raceId) = 4;	formula_1
SELECT circuits.name, circuits.location, races.name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'USA' AND races.year = 2006;	formula_1
SELECT races.name, circuits.name, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE MONTH(races.date) = 9 AND YEAR(races.date) = 2005;	formula_1
SELECT r.name FROM results r JOIN drivers d ON r.driverid = d.driverid WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND r.position < 10;	formula_1
SELECT COUNT(r.points) AS num_of_wins FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN circuits c ON ra.circuitId = c.circuitId JOIN drivers d ON r.driverId = d.driverId WHERE c.name = 'Sepang International Circuit' AND d.forename = 'Michael' AND d.surname = 'Schumacher' AND r.points = (SELECT MAX(points) FROM results WHERE raceId = r.raceId);	formula_1
SELECT r.name, r.year FROM races r JOIN results rr ON r.raceId = rr.raceId JOIN lapTimes lt ON rr.raceId = lt.raceId AND rr.driverId = lt.driverId WHERE rr.driverId = (SELECT driverId FROM drivers WHERE forename = 'Michael' AND surname = 'Schumacher') AND lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT AVG(r.points) AS average_points FROM results r JOIN drivers d ON r.driverid = d.driverid WHERE d.forename = 'Eddie' AND d.surname = 'Irvine' AND r.year = 2000;	formula_1
SELECT races.name, results.points FROM races JOIN results ON races.raceId = results.raceId WHERE results.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND races.year = (SELECT MIN(year) FROM races);	formula_1
SELECT races.name, circuits.country FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2017 ORDER BY races.date;	formula_1
SELECT races.name, races.year, circuits.location, MAX(results.laps) AS max_laps FROM races JOIN results ON races.raceId = results.raceId JOIN circuits ON races.circuitId = circuits.circuitId GROUP BY races.raceId ORDER BY max_laps DESC LIMIT 1;	formula_1
SELECT CAST(COUNT(CASE WHEN country = 'Germany' AND name = 'European Grand Prix' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN name = 'European Grand Prix' THEN 1 END), 0) * 100 AS percentage FROM races;	formula_1
SELECT circuits.lat, circuits.lng FROM circuits WHERE circuits.name ILIKE '%silverstone%circuit%';	formula_1
SELECT name FROM circuits WHERE lat = (SELECT MAX(lat) FROM circuits);	formula_1
SELECT circuitRef FROM circuits WHERE name ILIKE '%Marina%Bay%Street%Circuit%';	formula_1
SELECT circuits.country FROM circuits WHERE circuits.alt = (SELECT MAX(circuits.alt) FROM circuits)	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT circuits.country FROM circuits JOIN drivers ON circuits.circuitId = drivers.driverId ORDER BY drivers.dob ASC LIMIT 1;	formula_1
SELECT drivers.surname FROM drivers WHERE drivers.nationality = 'italian';	formula_1
;	formula_1
SELECT drivers.driverRef FROM drivers WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT circuits.name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.year = 2009 AND races.name ILIKE '%spanish%grand%prix%'	formula_1
SELECT DISTINCT races.year FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone';	formula_1
SELECT races.name, races.date, races.url FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone' ORDER BY races.date DESC;	formula_1
SELECT races.date, races.time FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2010 AND circuits.name = 'Yas Marina Circuit';	formula_1
SELECT COUNT(r.raceId) AS num_races FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy';	formula_1
SELECT races.date FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT circuits.url FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009;	formula_1
SELECT MIN(r.fastestLapTime) AS fastest_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT drivers.forename, drivers.surname FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE results.fastestLap = 1 ORDER BY results.fastestLapSpeed DESC LIMIT 1;	formula_1
SELECT d.driverRef FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.position = 1 AND r.raceId = 1077;	formula_1
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY races.date;	formula_1
SELECT races.name FROM results JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND results.rank = (SELECT MIN(rank) FROM results WHERE driverid = drivers.driverid)	formula_1
SELECT MAX(r.fastestLapSpeed) AS fastest_lap_speed FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Spanish Grand Prix' AND ra.year = 2009;	formula_1
SELECT DISTINCT r.year FROM races r JOIN results rr ON r.raceId = rr.raceId JOIN drivers d ON rr.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.positionOrder FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.raceId = 2008;	formula_1
SELECT drivers.forename, drivers.surname FROM results JOIN races ON results.raceId = races.raceId WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' AND results.grid = 4;	formula_1
SELECT COUNT(DISTINCT r.driverId) AS total_drivers FROM results r JOIN races rc ON r.raceId = rc.raceId WHERE r.time IS NOT NULL AND rc.name = 'Australian Grand Prix' AND rc.year = 2008;	formula_1
SELECT lapTimes.time FROM lapTimes JOIN results ON lapTimes.raceId = results.raceId AND lapTimes.driverId = results.driverId WHERE results.position = 1 AND results.year = 2008 AND results.name = 'Australian Grand Prix' AND results.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') ORDER BY lapTimes.milliseconds ASC LIMIT 1;	formula_1
SELECT r.time FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE r.position = 2 AND ra.year = 2008 AND ra.name = 'Australian Grand Prix';	formula_1
SELECT d.forename, d.surname, r.time, d.url FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.position = 1 AND r.raceId = 1 AND r.year = 2008;	formula_1
SELECT COUNT(DISTINCT d.driverId) AS num_drivers FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.nationality = 'American' AND ra.name = 'Australian Grand Prix' AND ra.year = 2008;	formula_1
SELECT COUNT(DISTINCT(r.driverId)) AS total_drivers FROM results r WHERE r.raceId = 1 AND r.time IS NOT NULL AND r.year = 2008;	formula_1
SELECT SUM(r.points) AS total_points FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT AVG(CAST(SUBSTR(r.fastestLapTime, 4) AS FLOAT)) AS average_fastest_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT CAST(COUNT(CASE WHEN time IS NOT NULL THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS completion_rate FROM lapTimes WHERE raceId = 1077;	formula_1
SELECT ((MAX(r.time) - MIN(r.time)) / NULLIF(MAX(r.time), 0)) * 100 AS percentage FROM results r WHERE r.raceid = 1 AND r.position = 1 AND r.year = 2008;	formula_1
SELECT COUNT(circuitId) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne';	formula_1
SELECT circuits.lat, circuits.lng FROM circuits WHERE circuits.country = 'USA';	formula_1
SELECT COUNT(driverId) FROM drivers WHERE nationality = 'British' AND EXTRACT(YEAR FROM AGE(dob)) > 1980;	formula_1
SELECT AVG(points) FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE c.nationality = 'British';	formula_1
SELECT constructors.name, SUM(constructorstandings.points) AS total_points FROM constructorstandings JOIN constructors ON constructorstandings.constructorid = constructors.constructorid GROUP BY constructors.name ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.points = 0 AND cr.raceId = 291;	formula_1
SELECT COUNT(DISTINCT(c.constructorId)) AS num_constructors FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE c.nationality = 'Japan' AND cr.points = 0 GROUP BY c.constructorId HAVING COUNT(DISTINCT(r.raceId)) = 2;	formula_1
SELECT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT(constructors.constructorId)) AS total_constructors FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId JOIN races ON constructorResults.raceId = races.raceId JOIN lapTimes ON races.raceId = lapTimes.raceId WHERE constructors.nationality = 'France' AND lapTimes.lap > 50;	formula_1
;	formula_1
SELECT r.year, AVG(CAST(r.time AS FLOAT)) AS average_time FROM results r WHERE r.position = 1 GROUP BY r.year;	formula_1
SELECT drivers.forename, drivers.surname FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE drivers.dob > '1975-01-01' AND results.position = 2;	formula_1
SELECT COUNT(drivers.driverId) AS total_drivers FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE drivers.nationality = 'Italy' AND results.time IS NULL;	formula_1
SELECT drivers.forename, drivers.surname FROM results JOIN drivers ON results.driverId = drivers.driverId ORDER BY results.fastestLapTime ASC LIMIT 1;	formula_1
SELECT MIN(r.fastestLap) AS fastest_lap_number FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2009 AND r.position = 1;	formula_1
SELECT AVG(r.fastestLapSpeed) AS average_fastest_lap_speed FROM races AS r JOIN results AS re ON r.raceId = re.raceId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009;	formula_1
SELECT races.name, races.year FROM races JOIN results ON races.raceId = results.raceId WHERE results.milliseconds IS NOT NULL ORDER BY results.milliseconds ASC LIMIT 1;	formula_1
;	formula_1
SELECT COUNT(DISTINCT d.driverId) AS total_drivers FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'France' AND lt.milliseconds < 120000;	formula_1
SELECT drivers.driverRef FROM drivers WHERE drivers.nationality = 'America';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) AS num_drivers FROM results WHERE raceId = 18;	formula_1
SELECT d.code, COUNT(CASE WHEN d.nationality = 'Netherlandic' THEN 1 END) AS netherlandic_count FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob = (SELECT MAX(dob) FROM drivers) GROUP BY d.code ORDER BY d.code LIMIT 3;	formula_1
SELECT drivers.driverRef FROM drivers WHERE drivers.forename = 'Robert' AND drivers.surname = 'Kubica';	formula_1
SELECT COUNT(driverId) FROM drivers WHERE nationality = 'Australia' AND EXTRACT(YEAR FROM dob) = 1980;	formula_1
SELECT d.forename, d.surname, MIN(l.time) AS earliest_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'Germany' AND EXTRACT(YEAR FROM d.dob) BETWEEN 1980 AND 1990 GROUP BY d.driverId ORDER BY earliest_lap_time ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'Germany' ORDER BY year(dob) ASC LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE year(d.dob) = 1971 AND r.fastestLapTime IS NOT NULL ORDER BY r.fastestLapTime ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname, MAX(l.time) AS latest_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'Spain' AND EXTRACT(YEAR FROM d.dob) < 1982 GROUP BY d.driverId ORDER BY latest_lap_time DESC LIMIT 10;	formula_1
SELECT races.year FROM races JOIN results ON races.raceId = results.raceId WHERE results.fastestLapTime IS NOT NULL ORDER BY results.fastestLapTime ASC LIMIT 1;	formula_1
SELECT races.year, MAX(lapTimes.time) AS max_time FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId GROUP BY races.year ORDER BY max_time ASC LIMIT 1;	formula_1
SELECT driverId, MIN(time) AS fastest_time FROM lapTimes WHERE lap = 1 GROUP BY driverId ORDER BY fastest_time DESC LIMIT 5;	formula_1
SELECT COUNT(DISTINCT r.driverId) AS finishers_disqualified FROM results r JOIN status s ON r.statusId = s.statusId WHERE s.status = 'Disqualified' AND r.raceId > 50 AND r.raceId < 100 AND r.time IS NOT NULL;	formula_1
SELECT circuits.location, circuits.lat, circuits.lng FROM circuits WHERE circuits.country = 'Austria';	formula_1
SELECT races.round, COUNT(results.position) AS finishers FROM races JOIN results ON races.raceId = results.raceId WHERE results.time IS NOT NULL GROUP BY races.round ORDER BY finishers DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 IS NOT NULL AND q.raceId = 23;	formula_1
SELECT d.forename, d.surname, r.date, q.time FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE d.dob = (SELECT MAX(dob) FROM drivers) ORDER BY r.date, q.time LIMIT 1;	formula_1
SELECT COUNT(DISTINCT(d.driverId)) AS total_disqualified_drivers FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'USA' AND s.status = 'Disqualified';	formula_1
SELECT constructors.name, constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId WHERE constructors.nationality = 'Italy' ORDER BY constructorStandings.points DESC LIMIT 1;	formula_1
;	formula_1
SELECT d.forename, d.surname, MAX(l.time) AS slowest_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE l.lap = 3 AND l.raceId = 1077 GROUP BY d.driverId ORDER BY slowest_time DESC LIMIT 1;	formula_1
SELECT races.name, lapTimes.time FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId WHERE lapTimes.lap = 1 ORDER BY lapTimes.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(r.fastestLapTime) AS average_fastest_lap_time FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE r.rank < 11 AND ra.name = 'United States Grand Prix' AND ra.year = 2006;	formula_1
SELECT drivers.forename, drivers.surname, AVG(pitstops.duration) AS avg_duration FROM pitstops JOIN drivers ON pitstops.driverid = drivers.driverid WHERE drivers.nationality = 'Germany' AND drivers.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY drivers.driverid ORDER BY avg_duration ASC LIMIT 5;	formula_1
SELECT d.forename, d.surname, r.time FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.position = 1 AND r.raceId = (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix' AND year = 2008);	formula_1
SELECT c.constructorRef, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId WHERE r.date = '2009-09-27' AND cs.position = 1;	formula_1
SELECT drivers.forename, drivers.surname, drivers.dob FROM drivers WHERE drivers.nationality = 'Austrian' AND year(drivers.dob) BETWEEN '1981' AND '1991';	formula_1
SELECT drivers.forename || ' ' || drivers.surname AS full_name, drivers.dob, drivers.url FROM drivers WHERE drivers.nationality = 'German' AND year(drivers.dob) BETWEEN '1971' AND '1985' ORDER BY drivers.dob DESC;	formula_1
SELECT circuits.location, circuits.country, circuits.lat, circuits.lng FROM circuits WHERE circuits.name ILIKE '%hungaroring%';	formula_1
SELECT constructorStandings.points, constructors.name, constructors.nationality FROM constructorStandings JOIN races ON constructorStandings.raceId = races.raceId JOIN constructors ON constructorStandings.constructorId = constructors.constructorId WHERE races.name = 'Monaco Grand Prix' AND races.date BETWEEN '1980-01-01' AND '2010-12-31' ORDER BY constructorStandings.points DESC LIMIT 1;	formula_1
SELECT AVG(r.points) AS average_points FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN circuits c ON ra.circuitId = c.circuitId JOIN drivers d ON r.driverId = d.driverId WHERE c.country = 'Turkey' AND d.surname = 'Hamilton';	formula_1
SELECT CAST(COUNT(DISTINCT year) AS FLOAT) / 10 AS average_races_per_year FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31';	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT COUNT(r.wins) AS number_of_victories FROM results r JOIN driverStandings ds ON r.raceId = ds.raceId AND r.driverId = ds.driverId WHERE ds.points = 91;	formula_1
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId WHERE results.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results);	formula_1
SELECT circuits.location, circuits.country FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.date = (SELECT MAX(date) FROM races)	formula_1
SELECT drivers.forename, drivers.surname FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.q3 = (SELECT MIN(q3) FROM qualifying WHERE qualifying.raceId = (SELECT raceId FROM races WHERE races.circuitId = (SELECT circuitId FROM circuits WHERE circuits.name = 'Marina Bay Street Circuit') AND races.year = 2008)) AND qualifying.position = 1;	formula_1
SELECT drivers.forename, drivers.surname, drivers.nationality, races.name FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.dob = (SELECT MAX(drivers.dob) FROM drivers) LIMIT 1;	formula_1
SELECT COUNT(r.statusid) AS num_of_accidents FROM results r JOIN races rc ON r.raceid = rc.raceid WHERE r.statusid = 3 AND rc.name = 'Canadian Grand Prix' ORDER BY num_of_accidents DESC LIMIT 1;	formula_1
SELECT COUNT(r.wins) AS total_wins, d.forename, d.surname FROM results r JOIN drivers d ON r.driverid = d.driverid WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.forename, d.surname;	formula_1
SELECT MAX(duration) FROM pitStops;	formula_1
SELECT MIN(milliseconds) AS fastest_lap_time FROM lapTimes;	formula_1
SELECT MAX(duration) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT pitstops.lap FROM pitstops JOIN results ON pitstops.raceid = results.raceid AND pitstops.driverid = results.driverid WHERE results.position = 1 AND results.year = 2011 AND results.circuitid = 2;	formula_1
SELECT pitstops.driverid, pitstops.duration FROM pitstops JOIN races ON pitstops.raceid = races.raceid WHERE races.date = '2011-03-27' AND races.name = 'Australian Grand Prix';	formula_1
SELECT MIN(lapTimes.time) AS fastest_lap_time FROM lapTimes JOIN results ON lapTimes.raceId = results.raceId AND lapTimes.driverId = results.driverId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND results.position = 1;	formula_1
SELECT drivers.forename, drivers.surname FROM results JOIN lapTimes ON results.raceId = lapTimes.raceId AND results.driverId = lapTimes.driverId WHERE lapTimes.time = (SELECT MIN(time) FROM lapTimes)	formula_1
SELECT circuits.name FROM circuits JOIN races ON circuits.circuitId = races.circuitId JOIN results ON races.raceId = results.raceId JOIN lapTimes ON results.raceId = lapTimes.raceId AND results.driverId = lapTimes.driverId WHERE results.fastestLap = 1 AND lapTimes.lap = results.fastestLap AND results.driverId = 1 AND results.year = 2017;	formula_1
SELECT MIN(milliseconds) AS fastest_lap_time FROM lapTimes WHERE raceId = (SELECT raceId FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Austrian Grand Prix Circuit'));	formula_1
SELECT c.name AS Circuit, r.name AS Race, rr.position, rr.time, rr.milliseconds FROM races r JOIN results rr ON r.raceId = rr.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy' ORDER BY rr.milliseconds ASC;	formula_1
;	formula_1
;	formula_1
SELECT circuits.lat, circuits.lng FROM circuits JOIN results ON circuits.circuitId = results.raceId WHERE results.fastestLapTime = '1:29.488';	formula_1
;	formula_1
SELECT AVG(milliseconds) FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy';	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT Player.player_name, MAX(Player.height) AS max_height FROM Player ORDER BY max_height DESC LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes ORDER BY potential ASC LIMIT 1);	european_football_2
;	european_football_2
SELECT Player_Attributes.player_api_id, MAX(Player_Attributes.crossing) AS max_crossing FROM Player_Attributes GROUP BY Player_Attributes.player_api_id ORDER BY max_crossing DESC LIMIT 5;	european_football_2
;	european_football_2
;	european_football_2
SELECT Player.player_name, MAX(Player_Attributes.penalties) AS max_penalties FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id GROUP BY Player.player_name ORDER BY max_penalties DESC LIMIT 10;	european_football_2
;	european_football_2
SELECT Team.team_long_name, Team_Attributes.buildUpPlaySpeed FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team_Attributes.buildUpPlaySpeed IN (SELECT MAX(Team_Attributes.buildUpPlaySpeed) FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id) ORDER BY Team_Attributes.buildUpPlaySpeed DESC LIMIT 4;	european_football_2
;	european_football_2
;	european_football_2
SELECT League.name, MAX(COUNT(league_id)) AS max_matches FROM Match JOIN League ON Match.league_id = League.id GROUP BY League.name;	european_football_2
;	european_football_2
;	european_football_2
;	european_football_2
;	european_football_2
;	european_football_2
SELECT League.name, SUM(Match.home_team_goal + Match.away_team_goal) AS total_goals FROM Match JOIN League ON Match.league_id = League.id GROUP BY Match.league_id ORDER BY total_goals DESC LIMIT 5;	european_football_2
;	european_football_2
;	european_football_2
;	european_football_2
;	european_football_2
SELECT Team.team_short_name FROM Team WHERE Team.team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name FROM Player WHERE substr(birthday,1,4) = '1970' AND substr(birthday,6,2) = '10';	european_football_2
SELECT attacking_work_rate FROM Player_Attributes WHERE player_api_id = 505942;	european_football_2
SELECT Team_Attributes.buildUpPlayPositioningClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE Team.team_long_name = 'ADO Den Haag';	european_football_2
;	european_football_2
;	european_football_2
;	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE date = (SELECT MAX(date) FROM Player_Attributes) ORDER BY date DESC LIMIT 1;	european_football_2
SELECT Player_Attributes.player_api_id, Player.player_name, Player_Attributes.potential FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id ORDER BY Player_Attributes.potential DESC LIMIT 1;	european_football_2
SELECT COUNT(DISTINCT player_fifa_api_id) AS COUNT FROM Player_Attributes WHERE weight < 130 AND preferred_foot = 'left';	european_football_2
;	european_football_2
SELECT defensive_work_rate FROM Player_Attributes WHERE player_api_id = 505942;	european_football_2
SELECT birthday FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Netherlands';	european_football_2
;	european_football_2
;	european_football_2
SELECT player_name FROM Player WHERE height>180;	european_football_2
SELECT COUNT(id) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(DISTINCT p.player_api_id) AS num_players FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name like 'Adam%' AND pa.weight > 170;	european_football_2
;	european_football_2
SELECT "Player_Attributes"."potential" FROM "Player_Attributes" JOIN "Player" ON "Player_Attributes"."player_api_id" = "Player"."player_api_id" WHERE "Player"."player_name" ILIKE '%Aaron%Doran%';	european_football_2
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.preferred_foot = 'left';	european_football_2
SELECT Team.team_long_name FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team_Attributes.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT Team_Attributes.buildUpPlayPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE Team.team_short_name = 'CLB';	european_football_2
SELECT Team.team_short_name FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team_Attributes.buildUpPlayPassing > 70;	european_football_2
;	european_football_2
SELECT Player.player_name, MIN(Player.height) AS shortest_height FROM Player GROUP BY Player.player_name ORDER BY shortest_height ASC LIMIT 1;	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Italy Serie A';	european_football_2
;	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(id) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT Team.team_short_name FROM Match JOIN Team ON Match.home_team_api_id = Team.team_api_id WHERE Match.home_team_goal = 10;	european_football_2
SELECT Player_Attributes.player_api_id, Player_Attributes.balance, Player_Attributes.potential FROM Player_Attributes WHERE Player_Attributes.potential = 61 ORDER BY Player_Attributes.balance DESC LIMIT 1;	european_football_2
;	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT p.player_name, p.birthday FROM Player p WHERE p.player_name = 'Aaron Lennon' OR p.player_name = 'Abdelaziz Barrada' ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT Player.player_name, MAX(Player.height) AS max_height FROM Player GROUP BY Player.player_name ORDER BY max_height DESC LIMIT 1;	european_football_2
;	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Belgium Jupiler League';	european_football_2
SELECT "League".name FROM "League" JOIN "Country" ON "League".country_id = "Country".id WHERE "Country".name = 'Germany';	european_football_2
SELECT Player_Attributes.player_api_id, MAX(Player_Attributes.overall_rating) AS max_overall_rating FROM Player_Attributes GROUP BY Player_Attributes.player_api_id ORDER BY max_overall_rating DESC LIMIT 1;	european_football_2
;	european_football_2
SELECT Player.player_name, MAX(Player_Attributes.crossing) AS best_crossing FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') GROUP BY Player.player_name ORDER BY best_crossing DESC;	european_football_2
SELECT heading_accuracy FROM Player_Attributes WHERE player_api_id = 505942;	european_football_2
SELECT COUNT(DISTINCT player_api_id) FROM Player_Attributes WHERE height > 180 AND volleys > 70;	european_football_2
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.volleys > 70 AND Player_Attributes.dribbling > 70;	european_football_2
SELECT COUNT(id) FROM Match WHERE season = '2008/2009' AND country_id IN (SELECT id FROM Country WHERE name = 'Belgium');	european_football_2
SELECT long_passing FROM Player_Attributes WHERE date = (SELECT MAX(date) FROM Player_Attributes) ORDER BY date ASC LIMIT 1;	european_football_2
;	european_football_2
;	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE strftime('%Y', birthday) < '1986';	european_football_2
SELECT MULTIPLY(DIVIDE(SUBTRACT(overall_rating WHERE player_name = 'Ariel Borysiuk', overall_rating WHERE player_name = 'Paulin Puel'), overall_rating WHERE player_name = 'Paulin Puel'), 100) AS percentage_difference FROM Player_Attributes;	european_football_2
SELECT AVG(buildUpPlaySpeed) FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE Team.team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating) AS average_overall_rating FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(crossing) AS total_crossing_score FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(chanceCreationPassing), chanceCreationPassingClass FROM Team_Attributes WHERE team_long_name = 'Ajax';	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(overall_rating) FROM Player_Attributes JOIN Player AS T2 ON Player_Attributes.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(Match.away_team_goal) FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Parma' AND Match.country_id = 107;	european_football_2
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.overall_rating = 77 AND Player_Attributes.date = '2016-06-23' ORDER BY Player.birthday DESC LIMIT 1;	european_football_2
;	european_football_2
;	european_football_2
SELECT attacking_work_rate FROM Player_Attributes WHERE player_name = 'Francesco Migliore' AND date = '2015-05-01 00:00:00';	european_football_2
;	european_football_2
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant');	european_football_2
SELECT Team_Attributes.buildUpPlaySpeedClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE Team.team_long_name = 'Willem II' AND Team_Attributes.date = '2012-02-22 00:00:00';	european_football_2
SELECT Team_Attributes.buildUpPlayDribblingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE Team.team_short_name = 'LEI' AND Team_Attributes.date = '2015-09-10 00:00:00';	european_football_2
;	european_football_2
;	european_football_2
;	european_football_2
SELECT Team_Attributes.defenceAggressionClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE Team.team_long_name = 'Hannover 96' AND Team_Attributes.date = '2015-09-10 00:00:00';	european_football_2
;	european_football_2
;	european_football_2
SELECT Player.player_name FROM Player ORDER BY Player.height DESC LIMIT 5;	european_football_2
SELECT Player.player_api_id FROM Player ORDER BY Player.weight DESC LIMIT 10;	european_football_2
SELECT player_name FROM Player WHERE (datetime(CURRENT_TIMESTAMP,'localtime') - datetime(birthday))/365 > 35;	european_football_2
SELECT COUNT(home_team_goal) AS total_home_team_goal FROM Match WHERE home_player_1 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_2 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_3 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_4 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_5 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_6 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_7 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_8 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_9 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_10 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_11 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon');	european_football_2
;	european_football_2
;	european_football_2
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id ORDER BY Player_Attributes.overall_rating DESC LIMIT 10;	european_football_2
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
;	european_football_2
;	european_football_2
SELECT Player.player_name FROM Player JOIN Team ON Player.player_api_id = Team.team_api_id JOIN Country ON Team.country_id = Country.id WHERE Country.name = 'Belgium';	european_football_2
SELECT Player.player_name, Country.name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id JOIN Country ON Player.player_fifa_api_id = Country.id WHERE Player_Attributes.vision > 89;	european_football_2
SELECT Country.name, MAX(AVG(Player.weight)) AS heaviest_average_weight FROM Player JOIN Team ON Player.player_api_id = Team.team_api_id JOIN League ON Team.league_id = League.id JOIN Country ON League.country_id = Country.id GROUP BY Country.name ORDER BY heaviest_average_weight DESC LIMIT 1;	european_football_2
SELECT Team.team_long_name FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team_Attributes.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT Team.team_short_name FROM Team JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team_Attributes.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(height) FROM Player JOIN Country ON Player.country_id = Country.id WHERE Country.name = 'Italy';	european_football_2
SELECT Player.player_name FROM Player WHERE Player.height > 180 ORDER BY Player.player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(DISTINCT player.player_api_id) AS total_players FROM player WHERE player.player_name LIKE 'Aaron%' AND player.birthday > '1990';	european_football_2
;	european_football_2
SELECT Player_Attributes.player_api_id FROM Player_Attributes WHERE Player_Attributes.potential = (SELECT MIN(Player_Attributes.potential) FROM Player_Attributes) AND Player_Attributes.preferred_foot = 'right' ORDER BY Player_Attributes.potential ASC LIMIT 3;	european_football_2
SELECT COUNT(DISTINCT player_api_id) FROM Player_Attributes WHERE preferred_foot = 'left' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes);	european_football_2
SELECT CAST(COUNT(CASE WHEN strength > 80 AND stamina > 80 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM Player_Attributes;	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id JOIN Team ON Team.team_fifa_api_id = League.id WHERE Team.team_long_name = 'Poland Ekstraklasa';	european_football_2
;	european_football_2
SELECT sprint_speed, agility, acceleration FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE player_name = 'Alexis Blin';	european_football_2
SELECT Team_Attributes.buildUpPlaySpeedClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE Team.team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(id) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italian Serie A');	european_football_2
SELECT MAX(home_team_goal) FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Netherlands') AND league_id = (SELECT id FROM League WHERE name = 'Eredivisie');	european_football_2
SELECT finishing, curve FROM Player_Attributes WHERE player_fifa_api_id IN (SELECT player_fifa_api_id FROM Player WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE weight = (SELECT MAX(weight) FROM Player)));	european_football_2
SELECT Team.team_long_name, COUNT(Match.id) AS total_games FROM Match JOIN Team ON Match.home_team_api_id = Team.team_api_id OR Match.away_team_api_id = Team.team_api_id WHERE Match.season = '2015/2016' GROUP BY Team.team_long_name ORDER BY total_games DESC LIMIT 1;	european_football_2
SELECT Team.team_long_name FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id WHERE Match.away_team_goal = (SELECT MAX(Match.away_team_goal) FROM Match)	european_football_2
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT CAST(COUNT(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 END) AS FLOAT) / NULLIF(COUNT(id), 0) * 100 AS percentage FROM Player_Attributes;	european_football_2
SELECT (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '+') - (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '-') AS difference, (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '+') / (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '-') AS percentage_difference FROM Patient;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN SEX = 'F' AND year(Birthday) > '1930' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN SEX = 'F' THEN 1 END), 0) AS percentage FROM Patient;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN Admission = '+' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM Patient WHERE year(Birthday) BETWEEN '1930-01-01' AND '1940-12-31';	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN Diagnosis = 'SLE' AND Admission = '+' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN Diagnosis = 'SLE' AND Admission = '-' THEN 1 END), 0) AS ratio FROM Patient;	thrombosis_prediction
SELECT Examination.Diagnosis FROM Examination WHERE Examination.ID = '30609'; SELECT Laboratory.Date FROM Laboratory WHERE Laboratory.ID = '30609';	thrombosis_prediction
SELECT Patient.SEX, Patient.Birthday, Examination.`Examination Date`, Examination.Symptoms FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.ID = '163109';	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > '500';	thrombosis_prediction
SELECT Patient.ID, age FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE RVVT = '+';	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Examination.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Thrombosis = 2;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.Admission, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE year(Patient.Birthday) = '1937' AND Laboratory.`T-CHO` >= '250';	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALB < 3.5;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN p.sex = 'F' AND l.tp < '6.0' OR l.tp > '8.5' THEN 1 END) AS FLOAT) / NULLIF(COUNT(p.id), 0) * 100 AS percentage FROM patient p JOIN laboratory l ON p.id = l.id;	thrombosis_prediction
SELECT AVG(Examination."aCL IgG") AS average_anti_cardiolipin_antibody_IgG_concentration FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Admission = '+' AND (SUBTRACT(year(current_timestamp), year(Patient.Birthday)) >= '50');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS number_of_patients FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND YEAR(p.Description) = '1997' AND p.Admission = '-';	thrombosis_prediction
SELECT MIN(SUBTRACT(YEAR(Birthday), YEAR(`First Date`))) AS youngest_age FROM Patient;	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS num_patients FROM patient p JOIN examination e ON p.id = e.id WHERE e.thrombosis = '1' AND p.sex = 'F' AND e."Examination Date" BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS age_gap FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG >= 200;	thrombosis_prediction
SELECT Symptoms, Diagnosis FROM Examination WHERE ID = (SELECT MIN(ID) FROM Patient);	thrombosis_prediction
SELECT AVG(COUNT(DISTINCT l.ID)) AS average_patients_per_month FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE p.SEX = 'M' AND l.Date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY EXTRACT(YEAR FROM l.Date), EXTRACT(MONTH FROM l.Date);	thrombosis_prediction
SELECT Laboratory.Date, (year(Patient.`First Date`) - year(Patient.Birthday)) AS age FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Diagnosis = 'SJS' ORDER BY Patient.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN SEX = 'M' AND UA <= 8.0 THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(SUM(CASE WHEN SEX = 'F' AND UA <= 6.5 THEN 1 ELSE 0 END), 0) AS RATIO FROM Laboratory;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS num_patients FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE e.ID IS NULL OR SUBTRACT(YEAR(e.`Examination Date`), YEAR(p.`First Date`)) >= 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS underage_patients_count FROM patient p JOIN examination e ON p.id = e.id WHERE year(p.birthday) < 18 AND e.`examination date` BETWEEN '1990-01-01' AND '1993-12-31';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS total_patients FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.`T-BIL` > '2.0';	thrombosis_prediction
SELECT MAX(COUNT(Diagnosis)) AS most_common_illness FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, Birthday))) AS average_age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Date BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
SELECT P.Birthday, P.SEX, E.Diagnosis, L.HGB, P.Description FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.HGB = (SELECT MAX(L.HGB) FROM Laboratory L) ORDER BY P.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT COUNT(CASE WHEN `Total Cholesterol` < 250 THEN 1 END) AS normal_level_count FROM Laboratory WHERE ID = 2927464 AND Date = '1995-09-04';	thrombosis_prediction
SELECT Patient.SEX FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Diagnosis = 'AORTITIS' ORDER BY Patient.ID ASC LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM Examination WHERE Diagnosis = 'SLE' AND Description = '1994-02-19' AND `Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT Patient.SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GPT = '9' AND Laboratory.Date = '1992-06-12';	thrombosis_prediction
SELECT SUBTRACT('1992', year(Birthday)) AS age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE UA = '8.4' AND Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(Laboratory.ID) AS total_lab_tests FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.`ID` WHERE Patient.`First Date` = '1991-06-13' AND Patient.Diagnosis = 'SJS' AND Laboratory.Date BETWEEN '1995-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT Patient.Description FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.`Examination Date` = '1997-01-27' AND Examination.Diagnosis = 'SLE';	thrombosis_prediction
SELECT Examination.Symptoms FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday = '1959-03-01' AND Examination.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT (SELECT SUM(Laboratory.`T-CHO`) FROM Laboratory WHERE Laboratory.Date LIKE '1981-11-%') - (SELECT SUM(Laboratory.`T-CHO`) FROM Laboratory WHERE Laboratory.Date LIKE '1981-12-%') AS decrease_rate FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.Birthday = '1959-02-18';	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Diagnosis = 'Behcet' AND YEAR(Patient.Description) >= '1970-1-1' AND YEAR(Patient.Description) < '1998-1-1';	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date BETWEEN '1987-07-06' AND '1996-01-31' AND Laboratory.GPT > 30 AND Laboratory.ALB < 4;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) AS number_of_patients FROM Patient WHERE Patient.SEX = 'F' AND YEAR(Patient.Birthday) = 1964 AND Patient.Admission = '+';	thrombosis_prediction
SELECT COUNT(ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Thrombosis = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > MULTIPLY(AVG(`aCL IgM`), 0.2);	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN UA <= 6.5 AND `U-PRO` > 0 AND `U-PRO` < 30 THEN Laboratory.ID END) AS FLOAT) / NULLIF(COUNT(DISTINCT CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN Laboratory.ID END), 0) * 100 AS percentage FROM Laboratory;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND YEAR(p.`First Date`) = '1981';	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.First_Date, Patient.Admission, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.Date LIKE '1991-10%' AND Laboratory.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS number_of_women FROM patient p JOIN examination e ON p.id = e.id WHERE e."ANA Pattern" != 'P' AND p.sex = 'F' AND p.birthday BETWEEN '1980-01-01' AND '1989-12-31';	thrombosis_prediction
SELECT Patient.SEX FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Diagnosis = 'PSS' AND Laboratory.CRP > 2 AND Laboratory.CRE = 1 AND Laboratory.LDH = 123;	thrombosis_prediction
SELECT AVG(Laboratory.ALB) AS average_blood_albumin_level FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'F' AND Laboratory.PLT > 400 AND Patient.Diagnosis = 'SLE';	thrombosis_prediction
SELECT symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY symptoms ORDER BY COUNT(symptoms) DESC LIMIT 1;	thrombosis_prediction
SELECT Patient.Description, Examination.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.ID = 48473;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS number_of_patients FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND e.Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS num_patients FROM patient p JOIN laboratory l ON p.id = l.id WHERE YEAR(l.date) = '1997' AND (l.tp > 8.5 OR l.tp < 6);	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(SUM(CASE WHEN Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END), 0) * 100 AS proportion FROM Examination;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(SEX), 0) * 100 AS percentage FROM Patient WHERE YEAR(Birthday) = '1980' AND Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS num_patients FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.`Examination Date` BETWEEN '1995' AND '1997' AND e.Diagnosis = 'BEHCET' AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS number_of_patients FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(Examination.`Examination Date`, Patient.`First Date`) AS days_difference FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.ID = 821298;	thrombosis_prediction
SELECT CASE WHEN Patient.SEX = 'M' AND Laboratory.UA > 8.0 THEN 'Yes' WHEN Patient.SEX = 'F' AND Laboratory.UA > 6.5 THEN 'Yes' ELSE 'No' END AS 'Uric Acid within a normal range' FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.ID = 57266;	thrombosis_prediction
SELECT Laboratory.Date FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.ID = '48473' AND Laboratory.GOT >= 60;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT < 60 AND YEAR(Laboratory.Date) = 1994;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GPT >= 60;	thrombosis_prediction
SELECT Patient.ID, Patient.Birthday, Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GPT > 60 ORDER BY Patient.Birthday ASC;	thrombosis_prediction
SELECT AVG(Laboratory.LDH) FROM Laboratory WHERE Laboratory.LDH < 500;	thrombosis_prediction
SELECT Patient.ID, age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT Patient.ID, Patient.Admission FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALP < 300;	thrombosis_prediction
SELECT Patient.ID FROM Patient WHERE Patient.Birthday = '1982-04-01' AND Laboratory.ALP < 300;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < 6.0;	thrombosis_prediction
SELECT Patient.ID, Laboratory.Date, Laboratory.TP, (Laboratory.TP - 8.5) AS deviation_from_normal FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.TP > 8.5;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND (Laboratory.ALB <= 3.5 OR Laboratory.ALB >= 5.5) ORDER BY Patient.Birthday DESC;	thrombosis_prediction
SELECT Patient.ID, Laboratory.ALB, CASE WHEN Laboratory.ALB BETWEEN 3.5 AND 5.5 THEN 'Normal' ELSE 'Abnormal' END AS Albumin_Status FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Year(Patient.Birthday) = '1982';	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN Laboratory.UA > 6.5 AND Patient.SEX = 'F' THEN 1 END) AS FLOAT) / NULLIF(COUNT(DISTINCT Patient.ID), 0) AS proportion FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID;	thrombosis_prediction
SELECT AVG(Laboratory.UA) AS average_UA FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.UA < CASE WHEN Patient.SEX = 'M' THEN 8.0 ELSE 6.5 END;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.UN = 29;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.UN < 30 AND Patient.Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS male_patients_with_creatinine_out_of_range FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.CRE >= 1.5;	thrombosis_prediction
SELECT (SUM(CASE WHEN Sex = 'M' AND CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN Sex = 'F' AND CRE >= 1.5 THEN 1 ELSE 0 END)) AS Result FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday, MAX(Laboratory.T-BIL) AS Max_Total_Bilirubin FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID GROUP BY Patient.ID, Patient.SEX, Patient.Birthday ORDER BY Max_Total_Bilirubin DESC LIMIT 1;	thrombosis_prediction
SELECT Patient.SEX, COUNT(Laboratory.ID) AS total_patients FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.`T-BIL` >= 2.0 GROUP BY Patient.SEX;	thrombosis_prediction
SELECT p.id, MAX(l.T-CHO) AS max_t_cho FROM patient p JOIN laboratory l ON p.id = l.id GROUP BY p.id ORDER BY p.birthday ASC LIMIT 1;	thrombosis_prediction
SELECT AVG(YEAR(CURRENT_DATE) - YEAR(birthday)) AS average_age FROM patient WHERE sex = 'M' AND EXISTS (SELECT 1 FROM laboratory WHERE patient.id = laboratory.id AND `T-CHO` >= 250);	thrombosis_prediction
SELECT Patient.ID, Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS num_patients FROM patient p JOIN laboratory l ON p.id = l.id WHERE l.tg >= 200 AND (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS num_patients FROM patient p JOIN laboratory l ON p.id = l.id WHERE year(p.birthday) BETWEEN '1936' AND '1956' AND p.sex = 'M' AND l.cpk >= 250;	thrombosis_prediction
SELECT p.id, p.sex, age, l.glu, l.t_cho FROM patient p JOIN laboratory l ON p.id = l.id WHERE l.glu >= 180 AND l.t_cho < 250;	thrombosis_prediction
SELECT Patient.ID, Laboratory.GLU FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GLU < 180 AND year(Patient.Description) >= 1991;	thrombosis_prediction
SELECT p.id, p.sex, p.birthday, EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.birthday) AS age FROM patient p JOIN laboratory l ON p.id = l.id WHERE l.wbc <= 3.5 OR l.wbc >= 9.0 GROUP BY p.sex ORDER BY age ASC;	thrombosis_prediction
SELECT p.id, p.birthday, e.diagnosis FROM patient p JOIN examination e ON p.id = e.id JOIN laboratory l ON p.id = l.id WHERE l.rbc < 3.5;	thrombosis_prediction
SELECT p.id, p.sex, p.birthday, p.description, p.first_date, p.admission, e.examination_date, e.acl_igg, e.acl_igm, e.ana, e.ana_pattern, e.acl_iga, e.diagnosis, e.kct, e.rvvt, e.lac, e.symptoms, e.thrombosis, l.date, l.got, l.gpt, l.ldh, l.alp, l.tp, l.alb, l.ua, l.un, l.cre, l.t_bil, l.t_cho, l.tg, l.cpk, l.glu, l.wbc, l.rbc, l.hgb, l.hct, l.plt, l.pt, l.aptt, l.fg, l.pic, l.tat, l.tat2, l.u_pro, l.igg, l.iga, l.igm, l.crp, l.ra, l.rf, l.c3, l.c4, l.rnp, l.sm, l.sc170, l.ssa, l.ssb, l.centromea, l.dna, l.dna_ii FROM patient p JOIN examination e ON p.id = e.id JOIN laboratory l ON p.id = l.id WHERE p.sex = 'F' AND (SUBTRACT(year(current_timestamp), year(p.birthday)) >= 50) AND (l.rbc <= 3.5 OR l.rbc >= 6.0)	thrombosis_prediction
SELECT Patient.ID, Patient.SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.HGB < 10;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Diagnosis = 'SLE' AND Laboratory.HGB BETWEEN 10 AND 17 ORDER BY Patient.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT p.ID, age, COUNT(l.ID) AS num_exams FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.HCT >= 52 GROUP BY p.ID, age HAVING COUNT(l.ID) > 2;	thrombosis_prediction
SELECT AVG(Laboratory.HCT) AS average_hct FROM Laboratory WHERE Laboratory.Date LIKE '1991%' AND Laboratory.HCT < 29;	thrombosis_prediction
SELECT COUNT(CASE WHEN PLT < 100 THEN 1 END) AS lower_than_normal_range, COUNT(CASE WHEN PLT > 400 THEN 1 END) AS higher_than_normal_range, COUNT(CASE WHEN PLT < 100 THEN 1 END) - COUNT(CASE WHEN PLT > 400 THEN 1 END) AS difference FROM Laboratory;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.Admission, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date like '1984%' AND Patient.Birthday > date('now', '-50 years') AND Laboratory.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Laboratory.PT >= 14 AND Patient.SEX = 'F' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(SUM(CASE WHEN Laboratory.PT >= 14 THEN 1 ELSE 0 END), 0) * 100 AS percentage FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM Patient.Birthday)) > 55;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.First_Date, Patient.Admission, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.First_Date > '1992-01-01' AND Laboratory.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE "Examination Date" > '1997-01-01' AND APTT IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS num_patients FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis = 3 AND l.APTT > 45;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) AS number_of_patients FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.WBC BETWEEN 3.5 AND 9.0 AND (Laboratory.FG <= 150 OR Laboratory.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS number_of_patients FROM patient p JOIN laboratory l ON p.id = l.id WHERE p.birthday > '1980-01-01' AND (l.fg < 150 OR l.fg > 450);	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.`First Date`, Patient.Admission, Patient.Diagnosis, Laboratory.`U-PRO` FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.`U-PRO` >= 30;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.`U-PRO` BETWEEN 0 AND 30 AND Examination.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS num_patients FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.IGG < 900 AND e.Symptoms = 'abortion';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS num_patients FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.IGG BETWEEN 900 AND 2000 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.`aCL IgA` BETWEEN 80 AND 500 ORDER BY Examination.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS number_of_patients FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`aCL IgA` BETWEEN 80 AND 500 AND YEAR(p.`First Date`) >= 1990;	thrombosis_prediction
SELECT Diagnosis, COUNT(Diagnosis) AS COUNT FROM Examination WHERE "IGM" NOT BETWEEN 40 AND 400 GROUP BY Diagnosis ORDER BY COUNT DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE (l.CRP LIKE '+' OR l.CRP LIKE '-' OR l.CRP < 1.0) AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) FROM patient p JOIN laboratory l ON p.id = l.id WHERE l.crp NOT IN('+-', '-') AND l.crp >= 1.0 AND (YEAR(CURDATE()) - YEAR(p.birthday)) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS number_of_patients FROM patient p JOIN examination e ON p.id = e.id WHERE p.ra IN ('-', '+-') AND e.kct = '+';	thrombosis_prediction
SELECT Patient.ID, Patient.Birthday, Examination.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE YEAR(Patient.Birthday) >= 1995 AND (Patient.RA = '-' OR Patient.RA = '+-');	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.RF < 20 AND (YEAR(CURDATE()) - YEAR(Patient.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS number_of_patients FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.RF < 20 AND e.Thrombosis = '0';	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS num_patients FROM patient p JOIN examination e ON p.id = e.id WHERE e.c3 > 35 AND e.ana_pattern = 'P';	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.HGB NOT BETWEEN 29 AND 52 ORDER BY Laboratory.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT CASE WHEN C4 > 10 THEN ID END) AS normal_C4_count FROM Laboratory WHERE RA = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS num_patients FROM patient p JOIN laboratory l ON p.id = l.id WHERE l.rnp IN ('-', '+-');	thrombosis_prediction
SELECT Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.RNP NOT IN('-', '+-') ORDER BY Patient.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS number_of_patients FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 1 AND (p.Description IS NULL OR p.Description NOT IN ('-', '+-'));	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.SM NOT IN('-', '+-') ORDER BY Patient.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.`Examination Date` >= '1997-01-01' AND Laboratory.SC170 IN('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS number_of_patients FROM patient p JOIN examination e ON p.id = e.id WHERE e.sc170 IN ('-', '+-') AND p.sex = 'M' AND e.symptoms = 'vertigo';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS number_of_patients FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SSA IN ('-','+-') AND YEAR(p.`First Date`) < 1990;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.SSA NOT IN('-', '+-') ORDER BY Patient.`First Date` ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS number_of_patients FROM patient p JOIN examination e ON p.id = e.id WHERE e.ssb IN ('-', '+-') AND e.diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT CASE WHEN Examination.SSB IN ('-', '+-') THEN Examination.ID END) AS num_patients_with_normal_anti_SSB_and_other_symptoms FROM Examination WHERE Examination.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS male_patients_with_normal_centromere_and_ssb FROM patient p JOIN laboratory l ON p.id = l.id WHERE p.sex = 'M' AND l.centromea IN ('-', '+-') AND l.ssb IN ('-', '+-');	thrombosis_prediction
SELECT Patient.ID, Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS num_patients FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Description IS NULL AND e.DNA < 8;	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS number_of_patients FROM patient p JOIN laboratory l ON p.id = l.id WHERE l.dna_ii > 8 AND p.admission = '+';	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN GOT >= 60 AND Diagnosis = 'SLE' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN GOT >= 60 THEN 1 END), 0) AS percentage FROM Laboratory;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) AS number_of_patients FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GOT < 60;	thrombosis_prediction
SELECT MIN(Birthday) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT >= 60;	thrombosis_prediction
SELECT Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GPT < 60 ORDER BY Laboratory.GPT DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS male_patients_with_normal_GOT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND p.SEX = 'M';	thrombosis_prediction
SELECT MIN(FirstDate) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH < 500;	thrombosis_prediction
SELECT MAX(Patient."First Date") AS "Latest Patient's Medical Data Recorded" FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH >= 500;	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS number_of_patients FROM patient p JOIN laboratory l ON p.id = l.id WHERE l.alp >= 300 AND p.admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS number_of_patients FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.ALP < 300;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.`First Date`, Patient.Admission, Patient.Diagnosis, Examination.`Examination Date`, Examination.`aCL IgG`, Examination.`aCL IgM`, Examination.ANA, Examination.`ANA Pattern`, Examination.`aCL IgA`, Examination.Diagnosis, Examination.KCT, Examination.RVVT, Examination.LAC, Examination.Symptoms, Examination.Thrombosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < 6.0;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS number_of_patients FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID WHERE e.Diagnosis = 'SJS' AND l.TP > 6.0 AND l.TP < 8.5;	thrombosis_prediction
SELECT `Examination Date` FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.ALB > 3.5 AND l.ALB < 5.5 ORDER BY l.ALB DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS number_of_patients FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT Patient.ID, Examination.`aCL IgG`, Examination.`aCL IgM`, Examination.`aCL IgA` FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.SEX = 'F' AND Laboratory.UA > 6.50 ORDER BY Laboratory.UA DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(Examination.ANA) AS 'Highest ANA' FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.CRE < 1.5;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRE < 1.5 AND Examination.aCL IgA = (SELECT MAX(Examination.aCL IgA) FROM Examination) ORDER BY Patient.ID;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS num_patients FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.`T-BIL` >= 2.0 AND e.`ANA Pattern` ILIKE '%P%';	thrombosis_prediction
SELECT ANA FROM Examination WHERE `T-BIL` < 2.0 ORDER BY `T-BIL` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS num_patients FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID WHERE l.`T-CHO` >= 250 AND e.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS num_patients FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l."T-CHO" < 250 AND e."ANA Pattern" = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS num_patients FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.TG < 200 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.`First Date`, Patient.Admission, Patient.Diagnosis, Laboratory.Date, Laboratory.GOT, Laboratory.GPT, Laboratory.LDH, Laboratory.ALP, Laboratory.TP, Laboratory.ALB, Laboratory.UA, Laboratory.UN, Laboratory.CRE, Laboratory.`T-BIL`, Laboratory.`T-CHO`, Laboratory.TG, Laboratory.CPK, Laboratory.GLU, Laboratory.WBC, Laboratory.RBC, Laboratory.HGB, Laboratory.HCT, Laboratory.PLT, Laboratory.PT, Laboratory.APTT, Laboratory.FG, Laboratory.PIC, Laboratory.TAT, Laboratory.TAT2, Laboratory.`U-PRO`, Laboratory.IGG, Laboratory.IGA, Laboratory.IGM, Laboratory.CRP, Laboratory.RA, Laboratory.RF, Laboratory.C3, Laboratory.C4, Laboratory.RNP, Laboratory.SM, Laboratory.SC170, Laboratory.SSA, Laboratory.SSB, Laboratory.CENTROMEA, Laboratory.DNA, Laboratory.`DNA-II` FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG < 200 ORDER BY Laboratory.TG DESC LIMIT 1;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Thrombosis = 0 AND Laboratory.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS num_patients FROM patient p JOIN examination e ON p.id = e.id JOIN laboratory l ON p.id = l.id WHERE l.cpk < 250 AND (l.kct = '+' OR l.rvvt = '+' OR l.lac = '+');	thrombosis_prediction
SELECT Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GLU > 180 ORDER BY Patient.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS num_patients FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 0 AND e.GLU < 180;	thrombosis_prediction
SELECT COUNT(DISTINCT p.id) AS number_of_patients FROM patient p JOIN laboratory l ON p.id = l.id WHERE p.admission = '+' AND l.wbc BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS num_patients FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE (Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0) AND Patient.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) AS num_patients FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Diagnosis IS NOT NULL AND e."PLT" > 100 AND e."PLT" < 400;	thrombosis_prediction
SELECT Patient.ID, Laboratory.PLT FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.PLT > 100 AND Laboratory.PLT < 400 AND Examination.Diagnosis = 'MCTD';	thrombosis_prediction
SELECT AVG(Laboratory.PT) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.Sex = 'M' AND Laboratory.PT < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) AS num_patients FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Thrombosis IN (1, 2) AND l.PT < 14;	thrombosis_prediction
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';	student_club
SELECT COUNT(DISTINCT m.member_id) AS num_engineering_students FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Engineering';	student_club
SELECT member.first_name, member.last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Art and Design';	student_club
SELECT COUNT(DISTINCT m.member_id) AS number_of_students FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT member.phone FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(DISTINCT m.member_id) AS number_of_members FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium';	student_club
SELECT event.event_name, COUNT(attendance.link_to_event) AS attendance_count FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id WHERE member.position = 'Student_Club' GROUP BY event.event_name ORDER BY attendance_count DESC LIMIT 1;	student_club
SELECT major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean';	student_club
SELECT COUNT(DISTINCT e.event_id) AS event_count FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.type = 'Student_Club' AND m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(event_id) AS num_meetings FROM event WHERE type = 'Meeting' AND event_id IN (SELECT event_id FROM attendance GROUP BY event_id HAVING COUNT(event_id) > 10);	student_club
SELECT event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event GROUP BY event.event_name HAVING COUNT(event.event_id) > 20;	student_club
;	student_club
SELECT expense.expense_description, MAX(expense.cost) AS maximum_cost FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.type = 'Meeting' GROUP BY expense.expense_description ORDER BY maximum_cost DESC LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id) AS total_members FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT member.first_name, member.last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Laugh Out Loud';	student_club
SELECT member.last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Law and Constitutional Studies';	student_club
SELECT zip_code.county FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Sherri' AND member.last_name = 'Ramsey';	student_club
SELECT college FROM major WHERE major_name = 'Computer Science' AND major_id = (SELECT link_to_major FROM member WHERE first_name = 'Tyler' AND last_name = 'Hewitt');	student_club
SELECT SUM(income.amount) AS total_amount_received FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.position = 'Vice President';	student_club
SELECT SUM(budget.spent) AS total_spent FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'September Meeting' AND budget.category = 'Food';	student_club
SELECT zip_code.city, zip_code.state FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.position = 'President';	student_club
SELECT member.first_name, member.last_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'IL';	student_club
;	student_club
SELECT department FROM major WHERE major_id IN (SELECT link_to_major FROM member WHERE first_name = 'Pierce' AND last_name = 'Guidi');	student_club
SELECT SUM(amount) AS total_budgeted_amount FROM budget WHERE event_name = 'October Speaker';	student_club
SELECT expense.expense_id, expense.expense_description, expense.cost, expense.approved FROM expense JOIN expense_budget ON expense.expense_id = expense_budget.expense_id JOIN budget ON expense_budget.budget_id = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' AND event.event_date = '2019-10-08' AND expense.approved = 'True';	student_club
SELECT AVG(e.cost) AS average_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Elijah' AND m.last_name = 'Allen' AND MONTH(e.expense_date) IN (9, 10);	student_club
;	student_club
SELECT event.location FROM event WHERE event.event_name ILIKE '%Spring%Budget%Review%'	student_club
SELECT expense.cost FROM expense JOIN event ON expense.link_to_event = event.event_id WHERE event.event_name = 'Posters' AND event.event_date = '2019-09-04';	student_club
SELECT MAX(budget.amount) - SUM(budget.spent) AS remaining FROM budget WHERE budget.category = 'Food';	student_club
;	student_club
SELECT COUNT(DISTINCT major.major_id) AS number_of_majors FROM major WHERE major.college = 'College of Humanities and Social Sciences';	student_club
SELECT member.phone FROM member WHERE member.first_name ILIKE '%Carlo%' AND member.last_name ILIKE '%Jacobs%';	student_club
SELECT zip_code.county FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Adela' AND member.last_name = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'November Meeting') AND remaining < 0;	student_club
SELECT SUM(amount) AS total_amount FROM budget WHERE link_to_event = 'rec0Si5cQ4rJRVzd6';	student_club
;	student_club
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Brent' AND member.last_name = 'Thomason';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = 'Human Development and Family Studies' AND t_shirt_size = 'Large';	student_club
SELECT zip_code.type FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Christof' AND member.last_name = 'Nielson';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT zip_code.state FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison';	student_club
SELECT major.department FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'President';	student_club
SELECT income.date_received FROM income WHERE income.source = 'Dues' AND income.member_id = 'rec000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000	student_club
SELECT member.first_name, member.last_name FROM member JOIN income ON member.member_id = income.link_to_member WHERE income.source = 'Dues' ORDER BY income.date_received ASC LIMIT 1;	student_club
SELECT CAST(SUM(CASE WHEN event.event_name = 'Yearly Kickoff' AND budget.category = 'Advertisement' THEN budget.amount ELSE 0 END) AS FLOAT) / NULLIF(SUM(CASE WHEN event.event_name = 'October Meeting' AND budget.category = 'Advertisement' THEN budget.amount ELSE 0 END), 0) AS ratio FROM event JOIN budget ON event.event_id = budget.link_to_event;	student_club
SELECT CAST(SUM(CASE WHEN category = 'Parking' THEN amount ELSE 0 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN event_name = 'November Speaker' THEN 1 END), 0) * 100 AS percentage FROM event JOIN budget ON event.event_id = budget.link_to_event;	student_club
SELECT SUM(cost) AS total_cost FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange' AND state = 'Virginia';	student_club
SELECT DISTINCT major.department FROM major JOIN zip_code ON major.college = 'College of Humanities and Social Sciences';	student_club
SELECT city, county, state FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Amy' AND member.last_name = 'Firth';	student_club
SELECT expense.expense_description, expense.cost FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.remaining = (SELECT MIN(remaining) FROM budget);	student_club
SELECT member.first_name, member.last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'October Meeting';	student_club
SELECT major.college, COUNT(member.member_id) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY major.college ORDER BY member_count DESC LIMIT 1;	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.phone = '809-555-3360';	student_club
SELECT event.event_name, MAX(budget.amount) AS max_budget_amount FROM event JOIN budget ON event.event_id = budget.link_to_event GROUP BY event.event_name ORDER BY max_budget_amount DESC LIMIT 1;	student_club
SELECT expense.expense_description, expense.cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT m.member_id) AS number_of_members FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT date_received FROM income WHERE link_to_member = 'rec00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000	student_club
SELECT COUNT(DISTINCT member.member_id) AS number_of_members FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'MD';	student_club
SELECT COUNT(DISTINCT event.event_id) AS event_count FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id WHERE member.phone = '954-555-6240';	student_club
SELECT member.first_name, member.last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT event.event_name, MAX(DIVIDE(budget.spent, budget.amount)) AS ratio FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' GROUP BY event.event_name ORDER BY ratio DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT SUM(spent) AS total_spent FROM budget WHERE category = 'Food';	student_club
SELECT member.first_name, member.last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member GROUP BY member.member_id HAVING COUNT(attendance.link_to_event) > 7;	student_club
SELECT member.first_name, member.last_name FROM member JOIN major ON member.link_to_major = major.major_id JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE major.major_name = 'Interior Design' AND event.event_name = 'Community Theater';	student_club
SELECT member.first_name, member.last_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina';	student_club
SELECT SUM(income.amount) AS total_income FROM income WHERE income.link_to_member = 'rec0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000	student_club
SELECT member.first_name, member.last_name FROM member JOIN income ON member.member_id = income.link_to_member WHERE income.amount > 40;	student_club
SELECT SUM(cost) AS total_expense FROM expense JOIN event ON expense.link_to_event = event.event_id WHERE event.event_name = 'Baseball game';	student_club
SELECT member.first_name, member.last_name FROM member JOIN budget ON member.member_id = budget.link_to_member WHERE budget.event_status = 'Open' AND budget.category = 'Yearly Kickoff';	student_club
SELECT member.first_name, member.last_name, income.source, MAX(income.amount) AS max_income FROM income JOIN member ON income.link_to_member = member.member_id GROUP BY member.first_name, member.last_name, income.source ORDER BY max_income DESC;	student_club
SELECT event.event_name, MIN(expense.cost) AS lowest_cost FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id JOIN expense ON member.member_id = expense.link_to_member GROUP BY event.event_name ORDER BY lowest_cost ASC LIMIT 1;	student_club
;	student_club
;	student_club
SELECT MAX(source) FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30';	student_club
SELECT member.first_name, member.last_name, member.email FROM member WHERE member.position = 'Secretary';	student_club
SELECT COUNT(DISTINCT member.member_id) AS number_of_members FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Physics Teaching';	student_club
;	student_club
SELECT COUNT(DISTINCT event.event_id) AS num_events_attended, member.link_to_major AS major FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE member.first_name = 'Luisa' AND member.last_name = 'Guidi' GROUP BY member.link_to_major;	student_club
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT event.event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Advertisement' ORDER BY budget.spent DESC LIMIT 1;	student_club
SELECT COUNT(DISTINCT a.link_to_member) AS num_attendees FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND a.link_to_member = 'rec000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000	student_club
SELECT CAST(COUNT(CASE WHEN type = 'Community Service' THEN 1 END) AS FLOAT) / NULLIF(COUNT(event_id), 0) * 100 AS percentage FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT SUM(expense.cost) AS total_cost FROM expense JOIN event ON expense.link_to_event = event.event_id WHERE event.event_name = 'September Speaker' AND expense.expense_description = 'Posters';	student_club
;	student_club
SELECT event.event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' AND budget.remaining < 0 ORDER BY budget.remaining ASC LIMIT 1;	student_club
SELECT expense.expense_description, SUM(expense.cost) AS total_cost FROM expense JOIN attendance ON expense.expense_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' AND expense.approved = 'yes' GROUP BY expense.expense_description;	student_club
SELECT category, amount FROM budget WHERE link_to_event = 'rec0Si5cQ4rJRVzd6' ORDER BY amount ASC;	student_club
SELECT budget_id, MAX(amount) AS max_amount FROM budget WHERE category = 'Food' GROUP BY budget_id ORDER BY max_amount DESC LIMIT 1;	student_club
SELECT budget_id, category, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) AS total_cost FROM expense WHERE expense_description = 'Parking';	student_club
;	student_club
SELECT member.first_name, member.last_name, SUM(expense.cost) AS total_cost FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE member.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY member.first_name, member.last_name;	student_club
SELECT expense.expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison';	student_club
SELECT expense.expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.t_shirt_size = 'X-Large';	student_club
SELECT member.zip FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE expense.cost < 50;	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen';	student_club
SELECT member.position FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business';	student_club
SELECT COUNT(member_id) FROM member WHERE link_to_major = 'Business' AND t_shirt_size = 'Medium';	student_club
SELECT event.event_name, budget.remaining FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 30 ORDER BY budget.remaining DESC;	student_club
SELECT event.type FROM event WHERE event.location = 'MU 215';	student_club
;	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
;	student_club
SELECT event.type FROM event WHERE event.location = 'MU 215';	student_club
SELECT COUNT(income_id) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(major.major_id) AS number_of_majors FROM major WHERE major.department = 'School of Applied Sciences, Technology and Education' AND major.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT member.last_name, major.department, major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering';	student_club
;	student_club
SELECT member.first_name, member.last_name, zip_code.city, zip_code.state FROM member JOIN major ON member.link_to_major = major.major_id JOIN zip_code ON member.zip = zip_code.zip_code WHERE major.department = 'Electrical and Computer Engineering Department' AND member.position = 'Member';	student_club
SELECT event.event_name FROM event JOIN member ON event.event_id = member.link_to_member WHERE member.position = 'Vice President' AND event.location = '900 E. Washington St.' AND event.type = 'Social';	student_club
SELECT member.last_name, member.position FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_description = 'Pizza' AND expense.expense_date = '2019-09-10';	student_club
SELECT member.last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer' AND member.position = 'Member';	student_club
SELECT CAST(COUNT(CASE WHEN amount = 50 THEN 1 END) AS FLOAT) / NULLIF(COUNT(member_id), 0) * 100 AS percentage FROM member WHERE t_shirt_size = 'Medium' AND position = 'Member';	student_club
SELECT DISTINCT zip_code.state, zip_code.short_state FROM zip_code WHERE zip_code.type = 'PO Box';	student_club
SELECT zip_code.zip FROM zip_code JOIN member ON zip_code.zip = member.zip WHERE zip_code.type = 'PO Box' AND member.state = 'Puerto Rico';	student_club
SELECT event.event_name FROM event WHERE event.type = 'Game' AND event.status = 'Closed' AND event.event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT event.event_id, event.event_name, event.event_date, event.type, event.notes, event.location, event.status, member.first_name, member.last_name, member.email, member.position, member.t_shirt_size, member.phone, member.zip, member.link_to_major, budget.category, budget.spent, budget.remaining, budget.amount, budget.event_status, budget.link_to_event, expense.expense_id, expense.expense_description, expense.expense_date, expense.cost, expense.approved, expense.link_to_member, expense.link_to_budget, income.income_id, income.date_received, income.amount, income.source, income.notes, income.link_to_member FROM event JOIN budget ON event.event_id = budget.link_to_event JOIN expense ON budget.budget_id = expense.link_to_budget JOIN income ON expense.link_to_member = income.link_to_member WHERE expense.cost > 50;	student_club
;	student_club
SELECT major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Katy' AND member.link_to_major = 'rec1N0upiVLy5esTO';	student_club
SELECT member.phone FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND major.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT member.email FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND expense.cost > 20;	student_club
SELECT COUNT(DISTINCT member.member_id) AS total_members FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'education' AND member.position = 'Member';	student_club
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(event_id), 0) * 100 AS percentage FROM event;	student_club
;	student_club
;	student_club
;	student_club
;	student_club
SELECT event.event_name, event.location FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 0;	student_club
SELECT event.event_name, event.event_date FROM event JOIN expense ON event.event_id = expense.link_to_event WHERE expense.expense_description = 'Pizza' AND expense.cost > 50 AND expense.cost < 100;	student_club
SELECT member.first_name, member.last_name, major.major_name FROM member JOIN expense ON member.member_id = expense.link_to_member JOIN major ON member.link_to_major = major.major_id WHERE expense.cost > 100;	student_club
SELECT event.event_name, zip_code.city, zip_code.state FROM event JOIN member ON event.event_id = member.link_to_event JOIN zip_code ON member.zip = zip_code.zip_code WHERE event.event_id IN (SELECT link_to_event FROM income GROUP BY link_to_event HAVING COUNT(income_id) > 40) ORDER BY event.event_name;	student_club
SELECT member.first_name, member.last_name, MAX(expense.cost) AS max_cost FROM expense JOIN member ON expense.link_to_member = member.member_id GROUP BY member.first_name, member.last_name HAVING COUNT(expense.event_id) > 1 ORDER BY max_cost DESC;	student_club
;	student_club
SELECT event.event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Parking' AND budget.cost < (SELECT SUM(cost) / COUNT(event_id) FROM budget WHERE category = 'Parking');	student_club
;	student_club
SELECT budget.budget_id, MAX(expense.cost) AS max_cost FROM budget JOIN expense ON budget.budget_id = expense.link_to_budget WHERE expense.expense_description = 'Water, chips, cookies' GROUP BY budget.budget_id ORDER BY max_cost DESC LIMIT 1;	student_club
SELECT member.first_name, member.last_name, MAX(expense.cost) AS max_cost FROM member JOIN expense ON member.member_id = expense.link_to_member GROUP BY member.member_id ORDER BY max_cost DESC LIMIT 5;	student_club
SELECT member.first_name, member.last_name, member.phone FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE expense.cost > (SELECT AVG(cost) FROM expense) ORDER BY member.first_name, member.last_name;	student_club
;	student_club
SELECT m.first_name, m.last_name, m.email, m.position, m.t_shirt_size, m.phone, m.zip, m.link_to_major, ma.major_name, ma.department FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT member.first_name, member.last_name, SUM(expense.cost) AS total_cost FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_description = 'Water, Veggie tray, supplies' GROUP BY member.first_name, member.last_name;	student_club
SELECT member.last_name, member.phone FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Elementary Education';	student_club
SELECT budget.category, budget.amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker';	student_club
SELECT event.event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Food';	student_club
SELECT member.first_name, member.last_name, income.amount FROM member JOIN income ON member.member_id = income.link_to_member WHERE income.date_received = '2019-09-09';	student_club
SELECT expense.expense_description, budget.category FROM expense JOIN budget ON expense.expense_description = 'Posters' AND expense.link_to_budget = budget.budget_id;	student_club
SELECT member.first_name, member.last_name, major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Secretary';	student_club
SELECT event.event_name, SUM(budget.spent) AS total_spent FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Speaker Gifts' GROUP BY event.event_name;	student_club
SELECT city FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Garrett' AND member.last_name = 'Girke';	student_club
SELECT member.first_name, member.last_name, member.position FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Lincolnton' AND zip_code.state = 'North Carolina' AND member.zip = 28092;	student_club
SELECT COUNT(DISTINCT GasStationID) FROM transactions_1k WHERE Country = 'CZE' AND ProductID = 1;	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN Currency = 'CZK' THEN 1 END), 0) AS ratio FROM customers;	debit_card_specializing
SELECT customers.customerid, yearmonth.consumption FROM customers JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.segment = 'LAM' AND yearmonth.date BETWEEN '201201' AND '201212' ORDER BY yearmonth.consumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS AverageMonthlyConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT customers.customerid, SUM(transactions_1k.amount) AS total_amount FROM customers JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE customers.currency = 'CZK' AND transactions_1k.date BETWEEN '201101' AND '201112' GROUP BY customers.customerid ORDER BY total_amount DESC;	debit_card_specializing
SELECT COUNT(DISTINCT customers.customerid) AS total_customers FROM customers JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.segment = 'KAM' AND yearmonth.consumption < 30000 AND yearmonth.date BETWEEN '201201' AND '201212';	debit_card_specializing
SELECT SUM(CASE WHEN customers.currency = 'CZK' THEN yearmonth.consumption ELSE 0 END) - SUM(CASE WHEN customers.currency = 'EUR' THEN yearmonth.consumption ELSE 0 END) AS difference_in_consumption FROM yearmonth JOIN customers ON yearmonth.customerid = customers.customerid WHERE yearmonth.date BETWEEN '201201' AND '201212';	debit_card_specializing
SELECT strftime('%Y', Date) AS YEAR, SUM(Amount) AS Total_Amount FROM transactions_1k WHERE Currency = 'EUR' GROUP BY YEAR ORDER BY Total_Amount DESC LIMIT 1;	debit_card_specializing
SELECT customers.segment, SUM(transactions_1k.amount) AS total_amount FROM customers JOIN transactions_1k ON customers.customerid = transactions_1k.customerid GROUP BY customers.segment ORDER BY total_amount ASC LIMIT 1;	debit_card_specializing
SELECT substr(Date, 1, 4) AS Year, SUM(Consumption) AS Total_Consumption FROM yearmonth WHERE Currency = 'CZK' GROUP BY Year ORDER BY Total_Consumption DESC LIMIT 1;	debit_card_specializing
SELECT yearmonth.date, MAX(yearmonth.consumption) AS max_consumption FROM yearmonth JOIN customers ON yearmonth.customerid = customers.customerid WHERE customers.segment = 'SME' AND yearmonth.date like '2013%' GROUP BY yearmonth.date ORDER BY max_consumption DESC LIMIT 1;	debit_card_specializing
SELECT (SELECT AVG(yearmonth.consumption) FROM yearmonth JOIN customers ON yearmonth.customerid = customers.customerid WHERE customers.segment = 'SME' AND customers.currency = 'CZK' AND yearmonth.date BETWEEN '201301' AND '201312') - (SELECT AVG(yearmonth.consumption) FROM yearmonth JOIN customers ON yearmonth.customerid = customers.customerid WHERE customers.segment = 'LAM' AND customers.currency = 'CZK' AND yearmonth.date BETWEEN '201301' AND '201312') AS difference_in_average_consumption_of_sme_and_lam, (SELECT AVG(yearmonth.consumption) FROM yearmonth JOIN customers ON yearmonth.customerid = customers.customerid WHERE customers.segment = 'LAM' AND customers.currency = 'CZK' AND yearmonth.date BETWEEN '201301' AND '201312') - (SELECT AVG(yearmonth.consumption) FROM yearmonth JOIN customers ON yearmonth.customerid = customers.customerid WHERE customers.segment = 'KAM' AND customers.currency = 'CZK' AND yearmonth.date BETWEEN '201301' AND '201312') AS difference_in_average_consumption_of_lam_and_kam, (SELECT AVG(yearmonth.consumption) FROM yearmonth JOIN customers ON yearmonth.customerid = customers.customerid WHERE customers.segment = 'KAM' AND customers.currency = 'CZK' AND yearmonth.date BETWEEN '201301' AND '201312') - (SELECT AVG(yearmonth.consumption) FROM yearmonth JOIN customers ON yearmonth.customerid = customers.customerid WHERE customers.segment = 'SME' AND customers.currency = 'CZK' AND yearmonth.date BETWEEN '201301' AND '201312') AS difference_in_average_consumption_of_kam_and_sme;	debit_card_specializing
SELECT Segment,        (SUM(CASE WHEN Date BETWEEN '201301' AND '201312' THEN Consumption ELSE 0 END) - SUM(CASE WHEN Date BETWEEN '201201' AND '201212' THEN Consumption ELSE 0 END)) / NULLIF(SUM(CASE WHEN Date BETWEEN '201301' AND '201312' THEN Consumption ELSE 0 END), 0) * 100 AS percentage_change FROM yearmonth WHERE Date BETWEEN '201201' AND '201312' GROUP BY Segment ORDER BY percentage_change DESC LIMIT 1;	debit_card_specializing
SELECT SUM(transactions_1k.amount) AS total_amount FROM transactions_1k JOIN customers ON transactions_1k.customerid = customers.customerid WHERE customers.customerid = 6 AND CAST(substr(transactions_1k.date, 1, 4) AS INTEGER) = 2013 AND CAST(substr(transactions_1k.date, 5, 2) AS INTEGER) BETWEEN 8 AND 11;	debit_card_specializing
SELECT (SELECT COUNT(DISTINCT GasStationID) FROM gasstations WHERE Segment = 'discount' AND Country = 'Czech Republic') - (SELECT COUNT(DISTINCT GasStationID) FROM gasstations WHERE Segment = 'discount' AND Country = 'Slovakia') AS difference;	debit_card_specializing
SELECT (SELECT SUM(yearmonth.consumption) FROM yearmonth WHERE yearmonth.date = '201304' AND yearmonth.customerid = 7) - (SELECT SUM(yearmonth.consumption) FROM yearmonth WHERE yearmonth.date = '201304' AND yearmonth.customerid = 5) AS difference;	debit_card_specializing
SELECT (SELECT COUNT(DISTINCT CASE WHEN customers.currency = 'CZK' THEN customers.customerid END) FROM customers WHERE customers.segment = 'SME') - (SELECT COUNT(DISTINCT CASE WHEN customers.currency = 'EUR' THEN customers.customerid END) FROM customers WHERE customers.segment = 'SME') AS difference;	debit_card_specializing
SELECT customers.customerid, yearmonth.consumption FROM customers JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.segment = 'LAM' AND customers.currency = 'EUR' AND yearmonth.date = '201310' ORDER BY yearmonth.consumption DESC LIMIT 1;	debit_card_specializing
SELECT customers.customerid, SUM(transactions_1k.amount) AS total_amount FROM customers JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE customers.segment = 'KAM' GROUP BY customers.customerid ORDER BY total_amount DESC LIMIT 1;	debit_card_specializing
SELECT SUM(yearmonth.consumption) AS total_consumption FROM yearmonth WHERE yearmonth.date = '201305' AND customers.segment = 'KAM';	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN yearmonth.consumption > 46.73 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage FROM yearmonth JOIN customers ON yearmonth.customerid = customers.customerid WHERE customers.segment = 'LAM';	debit_card_specializing
SELECT gasstations.country, COUNT(DISTINCT gasstations.gasstationid) AS total_gas_stations FROM gasstations JOIN products ON gasstations.gasstationid = products.productid JOIN transactions_1k ON products.productid = transactions_1k.productid GROUP BY gasstations.country ORDER BY AVG(transactions_1k.price / products.amount) DESC;	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN customers.segment = 'KAM' AND customers.currency = 'EUR' THEN 1 END) AS FLOAT) / NULLIF(COUNT(CASE WHEN customers.segment = 'KAM' THEN 1 END), 0) * 100 AS percentage FROM customers;	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN yearmonth.consumption > 528.3 THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS proportion FROM yearmonth WHERE yearmonth.date = '201202';	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN gasstations.segment = 'premium' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) * 100 AS percentage_of_premium_gas_stations FROM gasstations WHERE gasstations.country = 'Slovakia';	debit_card_specializing
SELECT customers.customerid, SUM(yearmonth.consumption) AS total_consumption FROM yearmonth JOIN customers ON yearmonth.customerid = customers.customerid WHERE yearmonth.date = '201309' GROUP BY customers.customerid ORDER BY total_consumption DESC LIMIT 1;	debit_card_specializing
SELECT customers.segment, SUM(yearmonth.consumption) AS total_consumption FROM yearmonth JOIN customers ON yearmonth.customerid = customers.customerid WHERE yearmonth.date = '201309' GROUP BY customers.segment ORDER BY total_consumption ASC LIMIT 1;	debit_card_specializing
SELECT customers.customerid, SUM(yearmonth.consumption) AS total_consumption FROM customers JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.segment = 'SME' AND yearmonth.date = '201206' GROUP BY customers.customerid ORDER BY total_consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(yearmonth.consumption) AS highest_consumption FROM yearmonth WHERE yearmonth.date LIKE '2012%';	debit_card_specializing
SELECT MAX(SUM(Consumption)) / 12 AS max_monthly_consumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR');	debit_card_specializing
SELECT products.description FROM products JOIN transactions_1k ON products.productid = transactions_1k.productid WHERE strftime('%Y%m', transactions_1k.date) = '201309';	debit_card_specializing
SELECT DISTINCT gasstations.country FROM transactions_1k JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid WHERE substr(transactions_1k.date, 1, 4) = '2013' AND substr(transactions_1k.date, 5, 2) = '06';	debit_card_specializing
SELECT DISTINCT gasstations.chainid FROM gasstations JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid JOIN customers ON transactions_1k.customerid = customers.customerid WHERE customers.currency = 'EUR';	debit_card_specializing
SELECT products.description FROM products JOIN transactions_1k ON products.productid = transactions_1k.productid WHERE customers.currency = 'EUR';	debit_card_specializing
SELECT AVG(Price) AS AveragePrice FROM transactions_1k WHERE Date LIKE '%2012-01%';	debit_card_specializing
SELECT COUNT(DISTINCT customers.customerid) AS total_customers FROM customers JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.currency = 'EUR' AND yearmonth.consumption > 1000;	debit_card_specializing
SELECT products.description FROM products JOIN transactions_1k ON products.productid = transactions_1k.productid JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid WHERE gasstations.country = 'CZE';	debit_card_specializing
SELECT DISTINCT "transactions_1k"."Time" FROM "transactions_1k" JOIN "gasstations" ON "transactions_1k"."GasStationID" = "gasstations"."GasStationID" WHERE "gasstations"."ChainID" = 11;	debit_card_specializing
SELECT COUNT(TransactionID) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE') AND Price > 1000;	debit_card_specializing
SELECT COUNT(TransactionID) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE') AND Date > '2012/1/1';	debit_card_specializing
SELECT AVG(Price) AS average_price FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE';	debit_card_specializing
SELECT AVG(Price) AS AveragePrice FROM transactions_1k WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR');	debit_card_specializing
SELECT customers.customerid, SUM(transactions_1k.amount) AS total_amount FROM customers JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE strftime('%Y-%m-%d', transactions_1k.date) = '2012-08-25' GROUP BY customers.customerid ORDER BY total_amount DESC LIMIT 1;	debit_card_specializing
SELECT gasstations.country FROM gasstations JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE transactions_1k.date = '2012-08-25' AND transactions_1k.amount > 0 LIMIT 1;	debit_card_specializing
SELECT customers.currency FROM customers JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE transactions_1k.time = '16:25:00' AND transactions_1k.date = '2012-08-24';	debit_card_specializing
SELECT customers.segment FROM customers JOIN transactions_1k AS T1 ON customers.customerid = T1.customerid WHERE date(T1.date) = '2012-08-23' AND T1.time = '21:20:00';	debit_card_specializing
SELECT COUNT(TransactionID) FROM transactions_1k WHERE "Date" = '2012-08-26' AND "Time" < '13:00:00' AND "Currency" = 'EUR';	debit_card_specializing
SELECT customers.segment FROM customers ORDER BY customers.customerid ASC LIMIT 1;	debit_card_specializing
SELECT gasstations.country FROM transactions_1k AS T1 JOIN gasstations ON T1.gasstationid = gasstations.gasstationid WHERE T1.date = '2012-08-24' AND T1.time = '12:42:00';	debit_card_specializing
SELECT T1.ProductID FROM transactions_1k AS T1 WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00';	debit_card_specializing
SELECT yearmonth.Date, yearmonth.Consumption FROM yearmonth WHERE yearmonth.CustomerID = (SELECT transactions_1k.CustomerID FROM transactions_1k WHERE transactions_1k.Date = '2012-08-24' AND transactions_1k.Amount = 124.05) AND yearmonth.Date like '2012-01-%';	debit_card_specializing
SELECT COUNT(DISTINCT t.TransactionID) AS total_transactions FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date = '2012-08-26' AND t.Time BETWEEN '08:00' AND '09:00';	debit_card_specializing
SELECT customers.currency FROM customers JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE yearmonth.date = '201306' AND yearmonth.consumption = 214582.17;	debit_card_specializing
SELECT gasstations.country FROM transactions_1k JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid WHERE transactions_1k.cardid = 667467;	debit_card_specializing
SELECT customers.currency FROM customers JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE transactions_1k.date = '2012-08-24' AND transactions_1k.amount = 548.4;	debit_card_specializing
SELECT CAST(COUNT(DISTINCT CASE WHEN customers.currency = 'EUR' THEN transactions_1k.customerid END) AS FLOAT) / NULLIF(COUNT(DISTINCT transactions_1k.customerid), 0) AS proportion FROM transactions_1k JOIN customers ON transactions_1k.customerid = customers.customerid WHERE strftime('%Y-%m-%d', transactions_1k.date) = '2012-08-25';	debit_card_specializing
SELECT ((SELECT SUM(yearmonth.consumption) FROM yearmonth WHERE yearmonth.date BETWEEN '2012-01-01' AND '2012-12-31') - (SELECT SUM(yearmonth.consumption) FROM yearmonth WHERE yearmonth.date BETWEEN '2013-01-01' AND '2013-12-31')) / (SELECT SUM(yearmonth.consumption) FROM yearmonth WHERE yearmonth.date BETWEEN '2012-01-01' AND '2012-12-31') AS consumption_decrease_rate FROM yearmonth JOIN transactions_1k ON yearmonth.customerid = transactions_1k.customerid WHERE transactions_1k.amount = 634.8 AND yearmonth.date = '2012-08-25';	debit_card_specializing
SELECT gasstations.gasstationid, SUM(transactions_1k.amount * transactions_1k.price) AS total_revenue FROM transactions_1k JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid GROUP BY gasstations.gasstationid ORDER BY total_revenue DESC LIMIT 1;	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN products.description = 'premium' THEN 1 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS ratio FROM transactions_1k JOIN customers ON transactions_1k.customerid = customers.customerid JOIN products ON transactions_1k.productid = products.productid WHERE customers.segment = 'SVK';	debit_card_specializing
SELECT SUM(t.amount) AS total_amount_spent, SUM(CASE WHEN CAST(t.date AS TEXT) LIKE '201201%' THEN t.amount ELSE 0 END) AS total_amount_spent_in_january_2012 FROM transactions_1k t WHERE t.customerid = 38508;	debit_card_specializing
SELECT p.description, COUNT(t.productid) AS total_sales FROM products p JOIN transactions_1k t ON p.productid = t.productid GROUP BY p.description ORDER BY total_sales DESC LIMIT 5;	debit_card_specializing
SELECT customers.customerid, AVG(transactions_1k.price / transactions_1k.amount) AS average_price_per_item, customers.currency FROM customers JOIN transactions_1k ON customers.customerid = transactions_1k.customerid GROUP BY customers.customerid ORDER BY AVG(transactions_1k.price / transactions_1k.amount) DESC LIMIT 1;	debit_card_specializing
SELECT gasstations.country FROM gasstations JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE transactions_1k.productid = 2 AND transactions_1k.amount = 1 ORDER BY transactions_1k.price DESC LIMIT 1;	debit_card_specializing
SELECT customers.segment, yearmonth.consumption FROM customers JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE yearmonth.date = '201208' AND customers.customerid IN (SELECT transactions_1k.customerid FROM transactions_1k WHERE transactions_1k.productid = 5 AND transactions_1k.price / transactions_1k.amount > 29.00);	debit_card_specializing
