#Creating a new schema called alumni
CREATE DATABASE alumni;
USE alumni;

#Importing all the data using the data import wizard.

#Runnig SQL command to see the structure ofthe six tables

SELECT * FROM college_a_hs;
DESC college_a_hs;

SELECT * FROM college_a_se;
DESC college_a_se;

SELECT * FROM college_a_sj;
DESC college_a_sj;

SELECT * FROM college_b_hs;
DESC college_b_hs;

SELECT * FROM college_b_se;
DESC college_b_se;

SELECT * FROM college_b_sj;
DESC college_b_sj;


##################################################################################################################################################
# For this process first I opened the csv file in excel and made a table with data. Further I used the filter drop down box to find the 
# all the unncessary values which will affect our final result  

# 1. Removing NULL values in 'college_a_hs' and store it as a view.

CREATE VIEW College_A_HS_V AS
    SELECT 
        *
    FROM
        college_a_hs
    WHERE
        MotherName != '' AND HSDegree !='' AND Location != ' ' AND EntranceExam != '' AND Institute != '' AND HSDegree != '-' 
            AND EntranceExam NOT LIKE '-%' AND EntranceExam NOT LIKE '.%' AND EntranceExam != '?'  AND EntranceExam NOT LIKE '__'
            AND EntranceExam != 'nil' AND EntranceExam != 'NILL' AND EntranceExam != 'Null' AND EntranceExam != 'NA' AND EntranceExam != 'N.A'
            AND EntranceExam != 'N/A' AND EntranceExam != 'N-A' AND EntranceExam != 'None' AND EntranceExam != 'Nope' AND EntranceExam != 'Not applied yet'
            AND EntranceExam != 'not given' AND EntranceExam != 'Nothing'
            AND Institute != 'N/A' AND Institute != 'None' AND Institute NOT LIKE '-%' AND Institute NOT LIKE '.' 
            AND Institute != 'Not selected yet.' AND Institute != 'none'AND Institute != 'Not Decide'
            AND Location != 'NA' AND Location NOT LIKE '.%' AND Location NOT LIKE '-%' ;
    
##################################################################################################################################################

#2. Remove NULL values in 'college_a_se' and store it as a view.

CREATE VIEW College_A_SE_V AS
    SELECT 
        *
    FROM
        college_a_se
    WHERE
        MotherName != '' AND Organization !='' AND Location != ' ' #### Getting two blank spaces in location ### 
        AND Organization != 'Nil' AND Organization != 'NA' AND Organization != '.' AND Organization != '-' 
        AND Organization != 'na' AND Location != 'Nowhere' AND Location != 'none' AND Location !='None' AND Location != 'NA'
        AND Location != 'na' AND Location !='.';
 
##################################################################################################################################################
 
#3. Remove NULL values in 'college_a_sj' and store it as a view.

CREATE VIEW College_A_SJ_V AS
    SELECT 
        *
    FROM
        college_a_sj
    WHERE
		ROLLNo != '' AND MotherName != '' AND Organization !='' AND Location != ' ' AND Designation != '' AND Designation != '.'
        AND Location != 'Nowhere' AND Location != 'none' AND Location !='None' AND Location != 'NA'
        AND Location != 'na' AND Location !='.' AND Organization != 'Nil' AND Organization != 'NA' AND Organization != '.' AND Organization != '-' 
        AND Organization != 'na' AND Organization != 'Still Giving exams of Reappears' AND Organization != 'Not employed yet';
        
 ##################################################################################################################################################
 
#4. Remove NULL values in 'college_b_hs' and store it as a view.

CREATE VIEW College_B_HS_V AS
    SELECT 
        *
    FROM
        college_b_hs
    WHERE
		MotherName != '' AND HSDegree !='' AND Location != '' AND EntranceExam != '' AND Institute != '' AND HSDegree != '-'
        AND EntranceExam !='Not required'AND EntranceExam !='nil' AND EntranceExam != 'No' AND EntranceExam != 'NA'
        AND EntranceExam != 'no test' AND EntranceExam !='NW' AND EntranceExam != 'None'
        AND HSDegree != 'NA' AND Institute != 'Not yet' AND Institute != 'Not specified' AND Institute != 'NA'
        AND Institute != 'Na' AND Institute != 'Not Decided' AND Institute != 'Nil' AND Institute != 'NIL' AND Institute != '-'
        AND Location != 'NA' 
        AND Location != '.' AND Location != 'NIL' AND Location != 'Not decided' AND Location != 'Not decided' AND Location NOT LIKE '.%';

##################################################################################################################################################        
        
#5 . Remove NULL values in 'college_b_se' and store it as a view.

CREATE VIEW College_B_SE_V AS
    SELECT 
        *
    FROM
        college_b_se
    WHERE
        MotherName != '' AND Organization !='' AND Location != '' #### Getting two blank spaces in location ### 
        AND Organization != 'Nil' AND Organization != 'NA' AND Organization != '.' AND Organization != '-' 
        AND Organization != 'na' AND Location != 'Nowhere' AND Location != 'none' AND Location !='None' AND Location != 'NA'
        AND Location != 'na' AND Location !='.';
        
##################################################################################################################################################            
#6. Remove NULL values in 'college_b_sj' and store it as a view.
CREATE VIEW College_B_SJ_V AS
    SELECT 
        *
    FROM
        college_b_sj
    WHERE
        FatherName !='' AND MotherName != '' AND Organization != '' AND Location != ' ' AND Designation != ''
        AND Location != 'Nil' AND Location NOT LIKE 'NOT %' AND Location NOT LIKE 'not %' AND Location NOT LIKE '-%'
        AND Location NOT LIKE '.%' AND Location NOT LIKE 'Offer %'
        AND Designation != 'NA' AND Designation != 'none' AND Designation NOT LIKE '.%' AND Designation NOT LIKE 'Not %'
        AND Organization !='NA' AND Organization NOT LIKE '.%' AND Location IS NOT NULL;

##############################################################################################################################################
# Creating a procedure to use String Functions for converting records to lower case.       
     
#1.college_a_hs_v
DELIMITER $$
CREATE PROCEDURE lowercase_a_hs()
BEGIN
SELECT LOWER(Name) Name ,LOWER(FatherName) FatherName ,LOWER(MotherName) MotherName FROM college_a_hs_v;
END $$
DELIMITER ;

CALL lowercase_a_hs();
###########################
#2.college_a_se_v
DELIMITER $$
CREATE PROCEDURE lowercase_a_se()
BEGIN
SELECT LOWER(Name) Name ,LOWER(FatherName) FatherName ,LOWER(MotherName) MotherName FROM college_a_se_v;
END $$
DELIMITER ;

CALL lowercase_a_se();

###########################
#3.college_a_sj_v
DELIMITER $$
CREATE PROCEDURE lowercase_a_sj()
BEGIN
SELECT LOWER(Name) Name ,LOWER(FatherName) FatherName ,LOWER(MotherName) MotherName FROM college_a_sj_v;
END $$
DELIMITER ;

CALL lowercase_a_sj();

###########################
#4.college_b_hs_v
DELIMITER $$
CREATE PROCEDURE lowercase_b_hs()
BEGIN
SELECT LOWER(Name) Name ,LOWER(FatherName) FatherName ,LOWER(MotherName) MotherName FROM college_b_hs_v;
END $$
DELIMITER ;

CALL lowercase_b_hs();

###########################
#5.college_b_se_v
DELIMITER $$
CREATE PROCEDURE lowercase_b_se()
BEGIN
SELECT LOWER(Name) Name ,LOWER(FatherName) FatherName ,LOWER(MotherName) MotherName FROM college_b_se_v;
END $$
DELIMITER ;

CALL lowercase_b_se();

###########################
#6.college_b_se_v
DELIMITER $$
CREATE PROCEDURE lowercase_b_sj()
BEGIN
SELECT LOWER(Name) Name ,LOWER(FatherName) FatherName ,LOWER(MotherName) MotherName FROM college_b_sj_v;
END $$
DELIMITER ;

CALL lowercase_b_sj();

#############################################################################################################################################

# Writing a query to create procedure get_name using the cursor to fetch names of all students from college A.

DELIMITER $$
CREATE PROCEDURE get_name_a()
BEGIN
	DECLARE temp1 TEXT DEFAULT "";
    DECLARE temp2 TEXT DEFAULT "";
    DECLARE temp3 TEXT DEFAULT "";
    DECLARE student_name_hs TEXT DEFAULT "";
    DECLARE student_name_se TEXT DEFAULT "";
    DECLARE student_name_sj TEXT(100000)DEFAULT "";
    DECLARE finished INT DEFAULT 0;
    DECLARE cursor_a_hs CURSOR FOR SELECT Name FROM college_a_hs_v;
    DECLARE cursor_a_se CURSOR FOR SELECT Name FROM college_a_se_v;
    DECLARE cursor_a_sj CURSOR FOR SELECT Name FROM college_a_sj_v;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    
    OPEN cursor_a_hs;
    LOOP_A1:
		LOOP
		FETCH cursor_a_hs INTO temp1;
		SET student_name_hs = CONCAT(student_name_hs, temp1, ";");
		IF finished = 1 THEN LEAVE LOOP_A1; END IF;
    END LOOP;
	CLOSE cursor_a_hs;
    SET finished = 0;
    
	OPEN cursor_a_se;
    LOOP_A2:
		LOOP
		FETCH cursor_a_se INTO temp2;
		SET student_name_se = CONCAT(student_name_se, temp2, ";");
		IF finished = 1 THEN LEAVE LOOP_A2; END IF;
    END LOOP;
	CLOSE cursor_a_se;
    SET finished = 0;   
    
	OPEN cursor_a_sj;
    LOOP_A3:
		LOOP
		FETCH cursor_a_sj INTO temp3;
		SET student_name_sj = CONCAT(student_name_sj, temp3, ";");
		IF finished = 1 THEN LEAVE LOOP_A3; END IF;
    END LOOP;
	CLOSE cursor_a_sj;
    SET finished = 0; 
    
SELECT student_name_hs Higher_studies_names, student_name_se Self_employed_names, student_name_sj Service_Job_Names;
END $$
DELIMITER ;

CALL get_name_a();

################################################################################################################################################

# Writing a query to create procedure get_name using the cursor to fetch names of all students from college B.

DELIMITER $$
CREATE PROCEDURE get_name_b()
BEGIN
	DECLARE temp1 TEXT DEFAULT "";
    DECLARE temp2 TEXT DEFAULT "";
    DECLARE temp3 TEXT DEFAULT "";
    DECLARE student_name_hs TEXT DEFAULT "";
    DECLARE student_name_se TEXT DEFAULT "";
    DECLARE student_name_sj TEXT(100000) DEFAULT "";
    DECLARE finished INT DEFAULT 0;
    DECLARE cursor_b_hs CURSOR FOR SELECT Name FROM college_b_hs_v;
    DECLARE cursor_b_se CURSOR FOR SELECT Name FROM college_b_se_v;
    DECLARE cursor_b_sj CURSOR FOR SELECT Name FROM college_b_sj_v;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    
    OPEN cursor_b_hs;
    LOOP_B1:
		LOOP
		FETCH cursor_b_hs INTO temp1;
		SET student_name_hs = CONCAT(student_name_hs, temp1, ";");
		IF finished = 1 THEN LEAVE LOOP_B1; END IF;
    END LOOP;
	CLOSE cursor_b_hs;
    SET finished = 0;
    
	OPEN cursor_b_se;
    LOOP_B2:
		LOOP
		FETCH cursor_b_se INTO temp2;
		SET student_name_se = CONCAT(student_name_se, temp2, ";");
		IF finished = 1 THEN LEAVE LOOP_B2; END IF;
    END LOOP;
	CLOSE cursor_b_se;
    SET finished = 0;   
    
	OPEN cursor_b_sj;
    LOOP_B3:
		LOOP
		FETCH cursor_b_sj INTO temp3;
		SET student_name_sj = CONCAT(student_name_sj, temp3, ";");
		IF finished = 1 THEN LEAVE LOOP_B3; END IF;
    END LOOP;
	CLOSE cursor_b_sj;
    SET finished = 0; 
    
SELECT student_name_hs Higher_studies_names, student_name_se Self_employed_names, student_name_sj Service_Job_Names;
END $$
DELIMITER ;

CALL get_name_b();

#################################################################################################################################################

# Finally I am Calculating the percentage of career choice of College A and College B Alumni (w.r.t Higher Studies, Self Employed and Service/Job)

-- For college A
SELECT 'Students_who_opted_for_Higher_Studies_College_A' , COUNT(*) FROM college_a_hs UNION
SELECT 'Students_who_are_Self_Employed_College_A' , COUNT(*) FROM college_a_se UNION
SELECT 'Students_who_opted_for_Service/Job_College_A' , COUNT(*) FROM college_a_sj;

SELECT 1157+1016+5633 AS "Total number of almuni from College A";

SELECT 'Percentage_of_students_who_opted_for_Higher_Studies' AS 'Career Choice',
COUNT(*)/7806*100 AS Percent FROM college_a_hs UNION
SELECT 'Percentage_of_students_who_are_Self_Employed', COUNT(*)/7806*100 FROM college_a_se UNION
SELECT 'Percentage_of_students_who_opted_for_Service/Job', COUNT(*)/7517*100 FROM college_a_sj;

               ########################################################################################################

-- For college B
SELECT 'Students_who_opted_for_Higher_Studies_College_B' , COUNT(*) FROM college_b_hs UNION
SELECT 'Students_who_are_Self_Employed_College_B' , COUNT(*) FROM college_b_se UNION
SELECT 'Students_who_opted_for_Service/Job_College_B' , COUNT(*) FROM college_b_sj;

SELECT 199+201+1859 AS "Total number of almuni from College B";

SELECT 'Percentage_of_students_who_opted_for_higher_studies' AS 'Career Choice',
COUNT(*)/2259*100 AS Percent FROM college_b_hs UNION
SELECT 'Percentage_of_students_who_are_Self_Employed', COUNT(*)/2259*100 FROM college_b_se UNION
SELECT 'Percentage_of_students_who_opted_for_Service/Job', COUNT(*)/2259*100 FROM college_b_sj;