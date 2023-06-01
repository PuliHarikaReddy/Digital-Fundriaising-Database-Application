-----------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------CREATION OF TABLES--------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--DROP TABLE STUDENT_DONOR
CREATE TABLE ACTIVE_STUDENT (
STUDENT_ID VARCHAR(20), 
FIRST_NAME VARCHAR(20) NOT NULL, 
LAST_NAME VARCHAR(20) NOT NULL, 
EMAIL VARCHAR(50), 
START_YEAR NUMBER(4) NOT NULL, 
END_YEAR NUMBER(4) NOT NULL, 
PARENT_NAME VARCHAR(30),
DEPARTMENT VARCHAR(20) NOT NULL,
MOBILE NUMBER(11),
CONSTRAINT ACTIVE_PK PRIMARY KEY(STUDENT_ID, EMAIL),
CONSTRAINT ACTIVE_YEARS CHECK (START_YEAR >= '2018' AND START_YEAR <='2022' AND END_YEAR >= '2022' AND END_YEAR <= '2026')
);

--DROP TABLE ALUMNI
CREATE TABLE AlUMNI(
AlUMNI_ID VARCHAR(20),
FIRST_NAME VARCHAR(20) NOT NULL,
LAST_NAME VARCHAR(20) NOT NULL,
EMAIL VARCHAR(50),
GRADUATION_YEAR NUMBER(4) NOT NULL,
ADDRESS VARCHAR(50),
MOBILE NUMBER(11),
CONSTRAINT ALUMNI_PK PRIMARY KEY (ALUMNI_ID,EMAIL),
CHECK(GRADUATION_YEAR < = '2021')
);

--DROP TABLE PARENTS
CREATE TABLE PARENTS (
PARENT_ID VARCHAR(20) PRIMARY KEY,
FIRST_NAME VARCHAR(20) NOT NULL,
LAST_NAME  VARCHAR(20) NOT NULL,
CHILD_STUDENT_ID VARCHAR(20) NOT NULL,
CHILD_EMAIL VARCHAR(50) NOT NULL,
ADDRESS VARCHAR(50),
PHONE NUMBER(11),
ALUMNI_STATUS CHAR(4),
CONSTRAINT PARENT_STATUS CHECK (ALUMNI_STATUS IN ('Yes', 'No')),
FOREIGN KEY (CHILD_STUDENT_ID, CHILD_EMAIL) REFERENCES ACTIVE_STUDENT(STUDENT_ID, EMAIL) ON DELETE CASCADE
);


--DROP TABLE CAMPAIGN
CREATE TABLE CAMPAIGN (
CAMPAIGN_ID VARCHAR(10) PRIMARY KEY,
CAMPAIGN_NAME VARCHAR(50) NOT NULL,
CAMPAIGN_TYPE VARCHAR(20) NOT NULL,
CAMPAIGN_DESCRIPTION VARCHAR(100),
CONSTRAINT CAMP_TYPE CHECK (CAMPAIGN_TYPE IN ('Email', 'In Person', 'Social Media', 'Phonathon'))
);


--DROP TABLE SEMESTER
CREATE TABLE SEMESTER (
SEM CHAR(7),
CAMPAIGN_ID VARCHAR(10),
START_DATE DATE NOT NULL,
END_DATE DATE NOT NULL,
FOREIGN KEY (CAMPAIGN_ID) REFERENCES CAMPAIGN(CAMPAIGN_ID) ON DELETE CASCADE,
PRIMARY KEY(SEM, CAMPAIGN_ID),
CHECK (START_DATE >= '01-Jan-2022' AND START_DATE <='30-Dec-2022' AND END_DATE >= '02-Jan-2022' AND END_DATE <='31-Dec-2022')
);


--DROP TABLE STUDENT_DONOR
CREATE TABLE STUDENT_DONOR (
TRANSACTION_ID VARCHAR(10) PRIMARY KEY,
TRANSACTION_DATE DATE,
FIRST_NAME VARCHAR(20) NOT NULL,
LAST_NAME VARCHAR(20) NOT NULL,
STUDENT_ID VARCHAR(20),
EMAIL VARCHAR(50) NOT NULL,
MOBILE NUMBER(11),
DEPARTMENT VARCHAR(20) NOT NULL,
CAMPAIGN_ID VARCHAR(20),
CAMPAIGN_NAME VARCHAR(50) NOT NULL,
AMOUNT FLOAT NOT NULL,
PAYMENT_TYPE VARCHAR(20) NOT NULL,
FOREIGN KEY (STUDENT_ID, EMAIL) REFERENCES ACTIVE_STUDENT(STUDENT_ID, EMAIL) ON DELETE CASCADE,
FOREIGN KEY (CAMPAIGN_ID) REFERENCES CAMPAIGN(CAMPAIGN_ID) ON DELETE CASCADE,
CONSTRAINT PAYMENT CHECK (PAYMENT_TYPE IN ('Credit Card', 'Apple Pay', 'Cash'))
);


--DROP TABLE PARENT_DONOR
CREATE TABLE PARENT_DONOR (
TRANSACTION_ID VARCHAR(10) PRIMARY KEY,
TRANSACTION_DATE DATE,
FIRST_NAME VARCHAR(20) NOT NULL,
LAST_NAME VARCHAR(20) NOT NULL,
PARENT_ID VARCHAR(20),
EMAIL VARCHAR(50) NOT NULL,
MOBILE NUMBER(11),
CAMPAIGN_ID VARCHAR(20),
CAMPAIGN_NAME VARCHAR(50) NOT NULL,
AMOUNT FLOAT NOT NULL,
PAYMENT_TYPE VARCHAR(20) NOT NULL,
FOREIGN KEY (PARENT_ID) REFERENCES PARENTS(PARENT_ID) ON DELETE CASCADE,
FOREIGN KEY (CAMPAIGN_ID) REFERENCES CAMPAIGN(CAMPAIGN_ID) ON DELETE CASCADE,
CONSTRAINT PARENT_PAYMENT CHECK (PAYMENT_TYPE IN ('Credit Card', 'Apple Pay', 'Cash'))
);

--DROP TABLE ALUMNI_DONOR
CREATE TABLE ALUMNI_DONOR (
TRANSACTION_ID VARCHAR(10) PRIMARY KEY,
TRANSACTION_DATE DATE,
FIRST_NAME VARCHAR(20) NOT NULL,
LAST_NAME VARCHAR(20) NOT NULL,
ALUMNI_ID VARCHAR(20),
EMAIL VARCHAR(50) NOT NULL,
MOBILE NUMBER(11),
GRADUATED_YEAR NUMBER NOT NULL,
CAMPAIGN_ID VARCHAR(20),
CAMPAIGN_NAME VARCHAR(50) NOT NULL,
AMOUNT FLOAT NOT NULL,
PAYMENT_TYPE VARCHAR(20) NOT NULL,
FOREIGN KEY (ALUMNI_ID, EMAIL) REFERENCES ALUMNI(ALUMNI_ID, EMAIL) ON DELETE CASCADE,
FOREIGN KEY (CAMPAIGN_ID) REFERENCES CAMPAIGN(CAMPAIGN_ID) ON DELETE CASCADE,
CONSTRAINT ALUMNI_PAYMENT CHECK (PAYMENT_TYPE IN ('Credit Card', 'Apple Pay', 'Cash'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------INSERTION INT0 TABLES-----------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--STUDENT TABLE
INSERT INTO ACTIVE_STUDENT VALUES('ST01', 'Ram', 'Krishna', 'ram.krish@villanova.edu', '2020', '2024', 'Surya Kumar', 'CLAS CSE', '4846206200');
INSERT INTO ACTIVE_STUDENT VALUES('ST02', 'Edison', 'Kelly', 'ed.kelly@villanova.edu', '2019', '2023', 'Shea Kelly', 'COE SE', '4846216211');
INSERT INTO ACTIVE_STUDENT VALUES('ST03', 'Harry', 'Potter', 'harry.potter@villanova.edu', '2020', '2024', 'James Potter', 'CLAS CSE', '4846106100');
INSERT INTO ACTIVE_STUDENT VALUES('ST04', 'Alex', 'Waynn', 'awaynn@villanova.edu', '2019', '2023', 'Peter Waynn', 'CLAS CHE', '4847051243');
INSERT INTO ACTIVE_STUDENT VALUES('ST05', 'Emma', 'Watson', 'ewatson@villanova.edu', '2021', '2025', 'Chris Watson', 'CLAS SE', '4848157524');
INSERT INTO ACTIVE_STUDENT VALUES('ST06', 'Kristen', 'Stewart', 'kstewart@villanova.edu', '2022', '2026', 'John Stewart', 'CLAS BIO', '4849108520');
INSERT INTO ACTIVE_STUDENT VALUES('ST07', 'Taylor', 'Lautner', 'tlautner@villanova.edu', '2019', '2023', 'Daniel Lautner', 'CLAS CSE', '4841853254');
INSERT INTO ACTIVE_STUDENT VALUES('ST08', 'Elizabeth', 'Reaser', 'ereaser@villanova.edu', '2020', '2024', 'John Reaser', 'CLAS SE', '4848155612');
INSERT INTO ACTIVE_STUDENT VALUES('ST09', 'Robert', 'Pattinson', 'rpattins@villanova.edu', '2021', '2025', 'Richard Peterson', 'CLAS CHE', '4844231054');
INSERT INTO ACTIVE_STUDENT VALUES('ST10', 'Albert', 'Burke', 'aburke@villanova.edu', '2022', '2026', 'David Burke', 'CLAS BIO', '4843125233');
INSERT INTO ACTIVE_STUDENT VALUES('ST11', 'Jackson', 'Rathbone', 'jrathbon@villanova.edu', '2019', '2023', 'Monroe Rathbone', 'CLAS CSE', '4846206000');
INSERT INTO ACTIVE_STUDENT VALUES('ST12', 'Kellan', 'Lutz', 'klutz@villanova.edu', '2020', '2024', 'Bradley Lutz', 'CLAS SE', '4844844844');
INSERT INTO ACTIVE_STUDENT VALUES('ST13', 'Gaia', 'Weiss', 'gweiss@villanova.edu', '2021', '2025', 'Alain Weiss', 'CLAS BIO', '4843203202');
INSERT INTO ACTIVE_STUDENT VALUES('ST14', 'Roxanne', 'McKee', 'rmckee@villanova.edu', '2022', '2026', 'Clarie McKee', 'CLAS CHE', '4845155201');
INSERT INTO ACTIVE_STUDENT VALUES('ST15', 'Anna', 'Kendrick', 'akendric@villanova.edu', '2019', '2023', 'William Kendrick', 'CLAS CSE', '4841234567');
INSERT INTO ACTIVE_STUDENT VALUES('ST16', 'Kate', 'Siegel', 'ksiegel@villanova.edu', '2018', '2022', 'Theresa Siegel', 'CLAS CHE', '4845655262');
INSERT INTO ACTIVE_STUDENT VALUES('ST17', 'Samantha', 'Sloyan', 'akendric@villanova.edu', '2018', '2022', 'Chaitanya Sloyan', 'CLAS SE', '4848963574');
INSERT INTO ACTIVE_STUDENT VALUES('ST18', 'Ricordo', 'Silva', 'akendric@villanova.edu', '2018', '2022', 'Thomas Silva', 'CLAS BIO', '4840324568');
INSERT INTO ACTIVE_STUDENT VALUES('ST19', 'Elliot', 'Sloane', 'esloane@villanova.edu', '2018', '2022', 'Catherine Sloane', 'CLAS CSE', '4849637845');
INSERT INTO ACTIVE_STUDENT VALUES('ST03', 'Harry', 'Potter', 'harryjamespotter@gmail.com', '2020', '2024', 'James Potter', 'CLAS CSE', '4846106100');
INSERT INTO ACTIVE_STUDENT VALUES('ST06', 'Kristen', 'Stewart', 'kristenbella@gmail.com', '2022', '2026', 'John Stewart', 'CLAS BIO', '4849108520');
INSERT INTO ACTIVE_STUDENT VALUES('ST17', 'Samantha', 'Sloyan', 'samantha268@yahoo.com', '2018', '2022', 'Chaitanya Sloyan', 'CLAS SE', '4848963574');
INSERT INTO ACTIVE_STUDENT VALUES('ST13', 'Gaia', 'Weiss', 'gaiaweiss123@yahoo.com', '2021', '2025', 'Alain Weiss', 'CLAS BIO', '4843203202');

SELECT * FROM ACTIVE_STUDENT;

--ALUMNI TABLE
INSERT INTO ALUMNI VALUES('AL01', 'Shea', 'Kelly', 'shea.kelly@villanova.edu', '1997', '111 Avon Rd, PA', '4842402400');
INSERT INTO ALUMNI VALUES('AL02', 'Robert', 'Stark', 'rob.stark@villanova.edu', '2000', '890 Waterloo Rd, PA', '4842412460');
INSERT INTO ALUMNI VALUES('AL03', 'Joffery', 'Baratheon', 'jof.bara@villanova.edu', '2020', '900 Kingslanding, WI', '4841402410');
INSERT INTO ALUMNI VALUES('AL04', 'James', 'Potter', 'j.potter@villanova.edu', '1995', '13 Privet Drive, London, UK', '4842462466');
INSERT INTO ALUMNI VALUES('AL05', 'Ginny', 'Weasley ', 'ginny.w@villanova.edu', '2021', '21 Winterfell Pk, NY', '4842482488');
INSERT INTO ALUMNI VALUES('AL06', 'Minerva', 'Mcgonagall', 'minerva.mc@villanova.edu', '1898', 'Hogwarts Castle, CA', '4842442444');
INSERT INTO ALUMNI VALUES('AL07', 'Neville', 'Longbottom', 'nev.longb@villanova.edu', '2021', '704 Hauser St, NY.', '4842412411');
INSERT INTO ALUMNI VALUES('AL08', 'Sirius', 'Black', 's.black@villanova.edu', '1995', '221B Baker St, London, UK', '4842442410');
INSERT INTO ALUMNI VALUES('AL09', 'Cho', 'Chang', 'cho.chang@villanova.edu', '2016', '79 Wistful Vista, AZ', '4842482468');
INSERT INTO ALUMNI VALUES('AL010', 'Luna', 'Lovegood', 'luna.lgood@villanova.edu', '2020', '322 Maple St, NC.', '4842492499');
INSERT INTO ALUMNI VALUES('AL02', 'Robert', 'Stark', 'robstark1@gmail.com', '2000', '890 Waterloo Rd, PA', '4842412460');
INSERT INTO ALUMNI VALUES('AL07', 'Neville', 'Longbottom', 'longbottom98@gmail.com', '2021', '704 Hauser St, NY.', '4842412411');
INSERT INTO ALUMNI VALUES('AL11', 'Margaret', 'Windsor', 'marg.windsor@villanova.edu', '1860', '1313 Mockingbird Ln, NJ', '4842402401');
INSERT INTO ALUMNI VALUES('AL12', 'Peter', 'Townsend', 'pete.tsend@villanova.edu', '1859', '10001 Cemetery Ln, NC', '4842402402');
INSERT INTO ALUMNI VALUES('AL13', 'Diana', 'Spencer', 'diana.spencer@villanova.edu', '1997', '12 Grimmauld Place, CA', '4842402403');
INSERT INTO ALUMNI VALUES('AL14', 'John', 'Major', 'john.major@villanova.edu', '1990', '742 Evergreen Terrace, PA', '4842402404');
INSERT INTO ALUMNI VALUES('AL15', 'Elizabeth', 'Windsor', 'eliz.windsor@villanova.edu', '1856', '4222 Clinton Way, FL', '4842402405');
INSERT INTO ALUMNI VALUES('AL08', 'Sirius', 'Black', 'seriouslywhite@yahoo.com', '1995', '221B Baker St, London, UK', '4842442410');
INSERT INTO ALUMNI VALUES('AL12', 'Peter', 'Townsend', 'petertownsend59@yahoo.com', '1859', '10001 Cemetery Ln, NC', '4842402402');
INSERT INTO ALUMNI VALUES('AL15', 'Elizabeth', 'Windsor', 'lillibetwindsor@gmail.com', '1856', '4222 Clinton Way, FL', '4842402405');
INSERT INTO ALUMNI VALUES('AL16', 'Chris', 'Watson', 'cwastson@villanova.edu', '2002', '2 Aldwyn Pk, NY','4846806202');
INSERT INTO ALUMNI VALUES('AL17', 'David', 'Burke', 'd.burke@villanova.edu', '1990', '65 Atlantic Avenue, NJ','4846806206');

SELECT * FROM ALUMNI;

--PARENTS TABLE
INSERT INTO PARENTS VALUES('P01','James', 'Potter', 'ST03', 'harry.potter@villanova.edu', '13 Privet Drive, London, UK', '4842462466','Yes');
INSERT INTO PARENTS VALUES('P02','Surya', 'Kumar', 'ST01', 'ram.krish@villanova.edu', '332 Sugartown Rd, PA', '4846806801','No');
INSERT INTO PARENTS VALUES('P03','Shea', 'Kelly', 'ST02', 'ed.kelly@villanova.edu', '111 Avon Rd, PA', '4842402400','Yes');
INSERT INTO PARENTS VALUES('P04','Peter', 'Waynn', 'ST04', 'awaynn@villanova.edu', '60 Spring Mill Rd, PA', '4846806201','No');
INSERT INTO PARENTS VALUES('P05','Chris', 'Watson', 'ST05', 'ewatson@villanova.edu', '2 Aldwyn Pk, NY', '4846806202','Yes');
INSERT INTO PARENTS VALUES('P06','John', 'Stewart', 'ST06', 'kstewart@villanova.edu', '400 Addison Ranch, TX', '4846806202','No');
INSERT INTO PARENTS VALUES('P07','Daniel', 'Lautner', 'ST07', 'tlautner@villanova.edu', 'Sunny Valley Ln, CA', '4846806203','No');
INSERT INTO PARENTS VALUES('P08','John', 'Reaser', 'ST08', 'ereaser@villanova.edu', '5 Park Avenue, NY', '4846806204','No');
INSERT INTO PARENTS VALUES('P09','Richard', 'Peterson', 'ST09', 'rpattins@villanova.edu', '900 Buffalo St, PA', '4846806205','No');
INSERT INTO PARENTS VALUES('P10','David', 'Burke', 'ST10', 'aburke@villanova.edu', '65 Atlantic Avenue, NJ', '4846806206','Yes');
INSERT INTO PARENTS VALUES('P11','Monroe', 'Rathbone', 'ST11', 'jrathbon@villanova.edu', '200 Strafford Rd, FL', '4846806207','No');
INSERT INTO PARENTS VALUES('P12','Margaret', 'Windsor', 'ST12', 'klutz@villanova.edu', '1313 Mockingbird Ln, NJ', '4842402401','Yes');
INSERT INTO PARENTS VALUES('P13','Alain', 'Weiss', 'ST13', 'gweiss@villanova.edu', '81 Springfeilds, MD', '4846806207','No');
INSERT INTO PARENTS VALUES('P14','Clarie', 'McKee', 'ST14', 'rmckee@villanova.edu', 'Jain Rd, London, UK', '4846806208','No');
INSERT INTO PARENTS VALUES('P15','William', 'Kendrick', 'ST15', 'akendric@villanova.edu', '430 Hartwick Rd, MD', '4846806209','No');
INSERT INTO PARENTS VALUES('P16','Theresa', 'Siegel', 'ST16', 'ksiegel@villanova.edu', '7 Springs Bloom, TX', '4846806210','Yes');
INSERT INTO PARENTS VALUES('P17','Chaitanya', 'Sloyan', 'ST17', 'samantha268@yahoo.com', '31 East Drive, PA', '4846806211','No');
INSERT INTO PARENTS VALUES('P18','Thomas', 'Silva', 'ST18', 'akendric@villanova.edu', '100 La Maison Ln, NY', '4846806212','No');
INSERT INTO PARENTS VALUES('P19','Catherine', 'Sloane', 'ST19', 'esloane@villanova.edu', '2 Chapel Dr, MD', '4846806213','No');

SELECT * FROM PARENTS;

--CAMPAIGN TABLE
INSERT INTO CAMPAIGN VALUES('C01','Graduate Student Hardship Fund','Email','This fund supports graduate students who are in need');
INSERT INTO CAMPAIGN VALUES('C02','1842 Day','In Person','Villanova Annual Day of Giving');
INSERT INTO CAMPAIGN VALUES('C03','CLAS Research Fund','Email','Fund for enchancing research opportunities in CLAS'); 
INSERT INTO CAMPAIGN VALUES('C04','Database Project Fund','In Person','Helps students buidling database projects as a part of coursework'); 
INSERT INTO CAMPAIGN VALUES('C05','Falvey Renovation Fund','Phonathon','Fund for renovating Favley Memorial Library'); 
INSERT INTO CAMPAIGN VALUES('C06','Student Scholarship Fund','Email','Fund to support top performing students with scholarships');
INSERT INTO CAMPAIGN VALUES('C07','Wildcats Athletics Fund','Social Media','Fund to support villanova prestigious athletics teams'); 
INSERT INTO CAMPAIGN VALUES('C08','Viso Fund','In Person','This is to support Villanova International Student Organization'); 
INSERT INTO CAMPAIGN VALUES('C09','Univeristy Advancement','Email','This fund is used for areas of need across university'); 
INSERT INTO CAMPAIGN VALUES('C10','Mendal Renovation Fund','Phonathon','This is to support Mendal Science Center Renovation'); 

SELECT * FROM CAMPAIGN;

--SEMESTER TABLE
INSERT INTO SEMESTER VALUES('SPRING','C01','01-Feb-2022','31-Mar-2022');
INSERT INTO SEMESTER VALUES('SUMMER','C02','01-May-2022','30-Sep-2022');
INSERT INTO SEMESTER VALUES('FALL','C03','01-Aug-2022','31-Oct-2022');
INSERT INTO SEMESTER VALUES('SPRING','C04','01-Feb-2022','15-Apr-2022');
INSERT INTO SEMESTER VALUES('SUMMER','C05','01-Jun-2022','31-Aug-2022');
INSERT INTO SEMESTER VALUES('FALL','C06','01-Aug-2022','31-Oct-2022');
INSERT INTO SEMESTER VALUES('SPRING','C07','20-Jan-2022','31-Mar-2022');
INSERT INTO SEMESTER VALUES('FALL','C08','01-Aug-2022','31-Oct-2022');
INSERT INTO SEMESTER VALUES('FALL','C09','01-Aug-2022','30-Sep-2022');
INSERT INTO SEMESTER VALUES('SUMMER','C10','01-Jun-2022','31-Aug-2022');
INSERT INTO SEMESTER VALUES('FALL','C01','15-Aug-2022','01-Nov-2022');
INSERT INTO SEMESTER VALUES('SPRING','C03','01-Feb-2022','01-Apr-2022');
INSERT INTO SEMESTER VALUES('SPRING','C09','01-Feb-2022','15-Mar-2022');
INSERT INTO SEMESTER VALUES('FALL','C04','15-Aug-2022','15-Nov-2022');
INSERT INTO SEMESTER VALUES('FALL','C07','20-Aug-2022','20-Oct-2022');
INSERT INTO SEMESTER VALUES('SPRING','C08','10-Feb-2022','10-Mar-2022');
INSERT INTO SEMESTER VALUES('SPRING','C06','01-Feb-2022','30-Apr-2022');

SELECT * FROM SEMESTER;

--STUDENT_DONOR
INSERT INTO STUDENT_DONOR VALUES('TS01','06-Aug-2022','Harry','Potter','ST03','harry.potter@villanova.edu','4846106100','CLAS CSE', 'C07','Wildcats Athletics Fund',51.6,'Apple Pay');
INSERT INTO STUDENT_DONOR VALUES('TS02','15-Feb-2022','Edison', 'Kelly','ST02','ed.kelly@villanova.edu','4846216211','COE SE','C08','Viso Fund',23.0,'Cash');
INSERT INTO STUDENT_DONOR VALUES('TS03','15-Sep-2022','Harry','Potter','ST03','harry.potter@villanova.edu','4846106100','CLAS CSE', 'C04','Database Project Fund',20.0,'Credit Card');
INSERT INTO STUDENT_DONOR VALUES('TS04','05-Mar-2022','Kellan','Lutz','ST12','klutz@villanova.edu','4844844844','CLAS SE', 'C05','Falvey Renovation Fund',25.0,'Cash');
INSERT INTO STUDENT_DONOR VALUES('TS05','06-Aug-2022','Elizabeth','Reaser','ST08','ereaser@villanova.edu','4846106100','CLAS SE', 'C10','Mendal Renovation Fund',60.5,'Apple Pay');
INSERT INTO STUDENT_DONOR VALUES('TS06','15-Sep-2022','Kate','Siegel','ST16','ksiegel@villanova.edu','4845655262','CLAS CHE', 'C06','Student Scholarship Fund',51.6,'Apple Pay');
INSERT INTO STUDENT_DONOR VALUES('TS07','10-Oct-2022','Ricordo','Silva','ST18','akendric@villanova.edu','4840324568','CLAS BIO', 'C01','Graduate Student Hardship Fund',150,'Apple Pay');
INSERT INTO STUDENT_DONOR VALUES('TS08','10-Aug-2022','Taylor','Lautner','ST07','tlautner@villanova.edu','4841853254','CLAS CSE', 'C02','1842 Day',200,'Credit Card');
INSERT INTO STUDENT_DONOR VALUES('TS09','23-Sep-2022','Jackson','Rathbone','ST11','jrathbon@villanova.edu','4846206000','CLAS CSE', 'C03','CLAS Research Fund',100,'Apple Pay');
INSERT INTO STUDENT_DONOR VALUES('TS10','15-Jun-2022','Roxanne','McKee','ST14','rmckee@villanova.edu','4845155201','CLAS CHE', 'C01','Graduate Student Hardship Fund',143.3,'Cash');
INSERT INTO STUDENT_DONOR VALUES('TS11','20-Aug-2022','Elliot','Sloane','ST19','esloane@villanova.edu','4849637845','CLAS CSE', 'C09','Univeristy Advancement',250.0,'Credit Card');
INSERT INTO STUDENT_DONOR VALUES('TS12','30-Aug-2022','Emma','Watson','ST05','ewatson@villanova.edu','4848157524','CLAS SE', 'C06','Student Scholarship Fund',100.5,'Cash');
INSERT INTO STUDENT_DONOR VALUES('TS13','10-Sep-2022','Albert','Burke','ST10','aburke@villanova.edu','4843125233','CLAS BIO', 'C08','Viso Fund',100.5,'Credit Card');
INSERT INTO STUDENT_DONOR VALUES('TS14','14-Feb-2022','Kristen','Stewart','ST06','kristenbella@gmail.com','4849108520','CLAS BIO', 'C07','Falvey Renovation Fund',50.2,'Cash');
INSERT INTO STUDENT_DONOR VALUES('TS15','08-Oct-2022','Ram','Krishna','ST01','ram.krish@villanova.edu','4846206200','CLAS CSE', 'C01','Graduate Student Hardship Fund',150.8,'Apple Pay');

SELECT * FROM STUDENT_DONOR;


--ALUMNI_DONOR
INSERT INTO ALUMNI_DONOR VALUES('TA01', '06-Mar-2022', 'Robert', 'Stark', 'AL02', 'rob.stark@villanova.edu', '4842412460', '2000', 'C09', 'Univeristy Advancement', 1000, 'Cash');
INSERT INTO ALUMNI_DONOR VALUES('TA02', '01-Mar-2022', 'Ginny', 'Weasley', 'AL05', 'ginny.w@villanova.edu', '4842482488', '2021', 'C06', 'Student Scholarship Fund', 550, 'Apple Pay');
INSERT INTO ALUMNI_DONOR VALUES('TA03', '01-Sep-2022', 'Peter', 'Townsend', 'AL12', 'petertownsend59@yahoo.com', '4842402402', '1859', 'C04', 'Database Project Fundt', 49.9, 'Credit Card');
INSERT INTO ALUMNI_DONOR VALUES('TA04', '15-Feb-2022', 'Cho', 'Chang', 'AL09', 'cho.chang@villanova.edu', '4842482468', '2016', 'C08', 'Viso Fund', 250, 'Credit Card');
INSERT INTO ALUMNI_DONOR VALUES('TA05', '08-Oct-2022', 'Shea', 'Kelly', 'AL01', 'shea.kelly@villanova.edu', '4842402400', '1997', 'C01', 'Graduate Student Hardship Fund', 25, 'Apple Pay');
INSERT INTO ALUMNI_DONOR VALUES('TA06', '30-Sep-2022', 'Elizabeth', 'Windsor', 'AL15', 'lillibetwindsor@gmail.com', '4842402405', '1856', 'C03', 'CLAS Research Fund', 110.25, 'Credit Card');
INSERT INTO ALUMNI_DONOR VALUES('TA07', '15-Jun-2022', 'Luna', 'Lovegood', 'AL010', 'luna.lgood@villanova.edu', '4842492499', '2020', 'C02', '1842 Day', 5555.55, 'Credit Card');
INSERT INTO ALUMNI_DONOR VALUES('TA08', '30-Jun-2022', 'Joffery', 'Baratheon', 'AL03', 'jof.bara@villanova.edu', '4841402410', '2020', 'C06', 'Student Scholarship Fund', 89.99, 'Cash');
INSERT INTO ALUMNI_DONOR VALUES('TA09', '02-Feb-2022', 'Minerva', 'Mcgonagall', 'AL06', 'minerva.mc@villanova.edu', '4842442444', '2000', 'C07', 'Wildcats Athletics Fund', 300.5, 'Apple Pay');
INSERT INTO ALUMNI_DONOR VALUES('TA10', '01-Jun-2022', 'Sirius', 'Black', 'AL08', 's.black@villanova.edu', '4842442410', '1995', 'C04', 'Database Project Fund', 200, 'Credit Card');
INSERT INTO ALUMNI_DONOR VALUES('TA11', '10-Mar-2022', 'Margaret', 'Windsor', 'AL11', 'marg.windsor@villanova.edu', '4842402401', '1860', 'C09', 'Univeristy Advancement', 19.99, 'Apple Pay');
INSERT INTO ALUMNI_DONOR VALUES('TA12', '15-Feb-2022', 'Diana', 'Spencer', 'AL13', 'diana.spencer@villanova.edu', '4842402403', '1997', 'C01', 'Univeristy Advancement', 111.49, 'Credit Card');
INSERT INTO ALUMNI_DONOR VALUES('TA13', '30-Jul-2022', 'James', 'Potter', 'AL04', 'j.potter@villanova.edu', '4842462466', '1995', 'C02', '1842 Day', 299.99, 'Cash');
INSERT INTO ALUMNI_DONOR VALUES('TA14', '25-Sep-2022', 'Neville', 'Longbottom', 'AL07', 'nev.longb@villanova.edu', '4842412411', '2021', 'C03', 'CLAS Research Fund', 999.98, 'Apple Pay');
INSERT INTO ALUMNI_DONOR VALUES('TA15', '01-Apr-2022', 'John', 'Major', 'AL14', 'john.major@villanova.edu', '4842402404', '1990', 'C04', 'Database Project Fundt', 105.9, 'Credit Card');
INSERT INTO ALUMNI_DONOR VALUES('TA16', '09-Aug-2022', 'Elizabeth', 'Windsor', 'AL15', 'eliz.windsor@villanova.edu', '4842402405', '1856', 'C05', 'Falvey Renovation Fund', 1450.05, 'Cash');
INSERT INTO ALUMNI_DONOR VALUES('TA17', '25-Aug-2022', 'Minerva', 'Mcgonagall', 'AL06', 'minerva.mc@villanova.edu', '4842442444', '1898', 'C06', 'Student Scholarship Fund', 2500, 'Credit Card');
INSERT INTO ALUMNI_DONOR VALUES('TA18', '31-Jan-2022', 'Diana', 'Spencer', 'AL13', 'diana.spencer@villanova.edu', '4842402403', '1997', 'C07', 'Wildcats Athletics Fund', 3101.22, 'Apple Pay');
INSERT INTO ALUMNI_DONOR VALUES('TA19', '01-Sep-2022', 'Margaret', 'Windsor', 'AL11', 'marg.windsor@villanova.edu', '4842402401', '1860', 'C10', 'Mendal Renovation Fund', 1500, 'Credit Card');
INSERT INTO ALUMNI_DONOR VALUES('TA20', '20-Aug-2022', 'Shea', 'Kelly', 'AL01', 'shea.kelly@villanova.edu', '4842402400', '1997', 'C08', 'Viso Fund', 500, 'Apple Pay');
INSERT INTO ALUMNI_DONOR VALUES('TA21', '01-Nov-2022', 'Ginny', 'Weasley ', 'AL05', 'ginny.w@villanova.edu', '4842482488', '2021', 'C10', 'Mendal Renovation Fund', 455.25, 'Cash');

SELECT * FROM ALUMNI_DONOR;


--PARENT_DONOR
INSERT INTO PARENT_DONOR VALUES('TP01','12-Mar-2022','Surya','Kumar','P02','skumar@villanova.edu','4846806801','C01','Graduate Student Hardship Fund',100.0,'Apple Pay');
INSERT INTO PARENT_DONOR VALUES('TP02','07-Jul-2022','Peter','Waynn','P04','pwaynn@villanova.edu','4846806201','C02','1842 Day',255.0,'Credit Card');
INSERT INTO PARENT_DONOR VALUES('TP03','18-Jun-2022','John','Stewart','P06','jstewart','4846806202','C03','CLAS Research Fund',100.5,'Cash');
INSERT INTO PARENT_DONOR VALUES('TP04','15-Mar-2022','William','Kendrick','P15','wkendrick@gmail.com','4846806209','C04','Database Project Fund',50.0,'Apple Pay');
INSERT INTO PARENT_DONOR VALUES('TP05','30-Jun-2022','Clarie','McKee','P14','cmckee@villanova.edu','4846806208','C05','Falvey Renovation Fund',25.0,'Credit Card');
INSERT INTO PARENT_DONOR VALUES('TP06','02-Oct-2022','Alain','Weiss','P13','aweiss@villanova.edu','4846806207','C06','Student Scholarship Fund',100.0,'Apple Pay');
INSERT INTO PARENT_DONOR VALUES('TP07','28-Feb-2022','Margaret','Windsor','P12','mwindsor@villanova.edu','4842402401','C07','Wildcats Athletics Fund',50.0,'Cash');
INSERT INTO PARENT_DONOR VALUES('TP08','22-Aug-2022','Daniel','Lautner','P07','dlautner@villanova.edu','4846806203','C08','Viso Fund',150.0,'Credit Card');
INSERT INTO PARENT_DONOR VALUES('TP09','28-Aug-2022','Richard','Peterson','P09','rpeterson@villanova.edu','4846806205','C09','Univeristy Advancement',200.0,'Cash');
INSERT INTO PARENT_DONOR VALUES('TP10','12-Jul-2022','Shea','Kelly','P03','skelly123@villanova.edu','4842402400','C10','Mendal Renovation Fund',150.0,'Apple Pay');
INSERT INTO PARENT_DONOR VALUES('TP11','12-Nov-2022','Monroe','Rathbone','P11','mrathbone@villanova.edu','4846806207','C01','Graduate Student Hardship Fund',200.0,'Cash');
INSERT INTO PARENT_DONOR VALUES('TP12','01-Sep-2022','Catherine','Sloane','P19','csloane12@villanova.edu','4846806213','C02','1842 Day',150.0,'Apple Pay');
INSERT INTO PARENT_DONOR VALUES('TP13','22-Mar-2022','David','Burke','P10','dburke@villanova.edu','4846806206','C03','CLAS Research Fund',50.0,'Credit Card');
INSERT INTO PARENT_DONOR VALUES('TP14','16-Sep-2022','John','Reaser','P02','jreaser@villanova.edu','4846806204','C04','Database Project  Fund',50.0,'Apple Pay');
INSERT INTO PARENT_DONOR VALUES('TP15','22-Jul-2022','Peter','Waynn','P04','pwaynn@villanova.edu','4846806201','C05','Falvey Renovation Fund',750.0,'Credit Card');
INSERT INTO PARENT_DONOR VALUES('TP16','10-Feb-2022','Chris','Watson','P05','ewatson@villanova.edu','4846806202','C09','Univeristy Advancement',10.0,'Cash');
INSERT INTO PARENT_DONOR VALUES('TP17','26-Feb-2022','Clarie','McKee','P14','rmckee@villanova.edu','4846806208','C08','Viso Fund',999.95,'Apple Pay');
INSERT INTO PARENT_DONOR VALUES('TP18','13-Apr-2022','Thomas','Silva','P18','akendric@villanova.edu','4846806212','C06','Student Scholarship Fund',555.55,'Credit Card');
INSERT INTO PARENT_DONOR VALUES('TP19','11-Oct-2022','Catherine','Sloane','P19','esloane@villanova.edu','4846806213','C07','Wildcats Athletics Fund',1001.10,'Credit Card');
INSERT INTO PARENT_DONOR VALUES('TP20','09-Feb-2022','James','Potter','P01','james.potter@villanova.edu','4842462466','C01','Graduate Student Hardship Fund',2499.99,'Credit Card');

SELECT * FROM PARENT_DONOR;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- TABLES ------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--ACTIVE_STUDENT
SELECT * FROM ACTIVE_STUDENT;

--ALUMNI
SELECT * FROM ALUMNI;

--PARENTS
SELECT * FROM PARENTS;

--CAMPAIGN
SELECT * FROM CAMPAIGN;

--SEMESTER
SELECT * FROM SEMESTER;

--STUDENT_DONOR
SELECT * FROM STUDENT_DONOR;

--ALUMNI_DONOR
SELECT * FROM ALUMNI_DONOR;

--PARENT_DONOR
SELECT * FROM PARENT_DONOR;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- UNION -------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- As Digital Fundraiser, I want to find out which payment type i.e., (Credit Card, Cash or Apple Pay) has recieved more donations.

SELECT S.PAYMENT_TYPE, SUM(S.AMOUNT) AS TOTAL_AMOUNT FROM 
((SELECT PAYMENT_TYPE, AMOUNT FROM STUDENT_DONOR)
UNION
(SELECT PAYMENT_TYPE, AMOUNT FROM ALUMNI_DONOR)
UNION
(SELECT PAYMENT_TYPE, AMOUNT FROM PARENT_DONOR))S
GROUP BY S.PAYMENT_TYPE
ORDER BY TOTAL_AMOUNT DESC;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- VIEWS & JOINS------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--As a Digital Fundraiser, I want to view all the campaign information along with their start and end dates

CREATE OR REPLACE VIEW CAMPAIGN_INFORMATION AS
(SELECT C.CAMPAIGN_ID, C.CAMPAIGN_NAME, C.CAMPAIGN_TYPE, S.SEM, S.START_DATE, S.END_DATE, C.CAMPAIGN_DESCRIPTION 
FROM CAMPAIGN C INNER JOIN SEMESTER S
ON C.CAMPAIGN_ID = S.CAMPAIGN_ID);

SELECT * FROM CAMPAIGN_INFORMATION;


--As a Digital Fundraiser, I want to find out in which semester did we get more number of gifts and more money

CREATE OR REPLACE VIEW SEMESTER_BREAKDOWN AS
SELECT S1.SEM, SUM(S1.COUNTS) AS COUNT_OF_GIFTS, SUM(S1.DONATIONS) AS AMOUNT_PER_SEMESTER FROM
((SELECT C.SEM, COUNT(S.AMOUNT) AS COUNTS, SUM(S.AMOUNT) AS DONATIONS FROM STUDENT_DONOR S LEFT JOIN CAMPAIGN_INFORMATION C ON S.CAMPAIGN_ID = C.CAMPAIGN_ID
WHERE S.TRANSACTION_DATE BETWEEN C.START_DATE AND C.END_DATE
GROUP BY C.SEM)
UNION
(SELECT C.SEM, COUNT(P.AMOUNT) AS COUNTS, SUM(P.AMOUNT) AS DONATIONS FROM PARENT_DONOR P LEFT JOIN CAMPAIGN_INFORMATION C ON P.CAMPAIGN_ID = C.CAMPAIGN_ID
WHERE P.TRANSACTION_DATE BETWEEN C.START_DATE AND C.END_DATE
GROUP BY C.SEM)
UNION
(SELECT C.SEM, COUNT(AL.AMOUNT) AS COUNTS, SUM(AL.AMOUNT) AS DONATIONS FROM ALUMNI_DONOR AL LEFT JOIN CAMPAIGN_INFORMATION C ON AL.CAMPAIGN_ID = C.CAMPAIGN_ID
WHERE AL.TRANSACTION_DATE BETWEEN C.START_DATE AND C.END_DATE
GROUP BY C.SEM))S1
GROUP BY S1.SEM
ORDER BY AMOUNT_PER_SEMESTER DESC;

SELECT * FROM SEMESTER_BREAKDOWN;

--As a Digital Fundraiser, I want to find out in which campaign type did we got more number of gifts and more money
CREATE OR REPLACE VIEW CAMPAIGN_TYPE_BREAKDOWN AS
SELECT S1.CAMPAIGN_TYPE, SUM(S1.COUNTS) AS COUNT_OF_GIFTS, SUM(S1.DONATIONS) AS AMOUNT_PER_SEMESTER FROM
((SELECT C.CAMPAIGN_TYPE, COUNT(S.AMOUNT) AS COUNTS, SUM(S.AMOUNT) AS DONATIONS FROM STUDENT_DONOR S LEFT JOIN CAMPAIGN_INFORMATION C ON S.CAMPAIGN_ID = C.CAMPAIGN_ID
WHERE S.TRANSACTION_DATE BETWEEN C.START_DATE AND C.END_DATE
GROUP BY C.CAMPAIGN_TYPE)
UNION
(SELECT C.CAMPAIGN_TYPE, COUNT(P.AMOUNT) AS COUNTS, SUM(P.AMOUNT) AS DONATIONS FROM PARENT_DONOR P LEFT JOIN CAMPAIGN_INFORMATION C ON P.CAMPAIGN_ID = C.CAMPAIGN_ID
WHERE P.TRANSACTION_DATE BETWEEN C.START_DATE AND C.END_DATE
GROUP BY C.CAMPAIGN_TYPE)
UNION
(SELECT C.CAMPAIGN_TYPE, COUNT(AL.AMOUNT) AS COUNTS, SUM(AL.AMOUNT) AS DONATIONS FROM ALUMNI_DONOR AL LEFT JOIN CAMPAIGN_INFORMATION C ON AL.CAMPAIGN_ID = C.CAMPAIGN_ID
WHERE AL.TRANSACTION_DATE BETWEEN C.START_DATE AND C.END_DATE
GROUP BY C.CAMPAIGN_TYPE))S1
GROUP BY S1.CAMPAIGN_TYPE
ORDER BY AMOUNT_PER_SEMESTER DESC;

SELECT * FROM CAMPAIGN_TYPE_BREAKDOWN;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- TRANSACTIONS ------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SAVEPOINT CHECKPOINT1;

SELECT * FROM STUDENT_DONOR;
SELECT * FROM SEMESTER;

UPDATE STUDENT_DONOR 
SET AMOUNT = AMOUNT + 100
WHERE TRANSACTION_ID = 'TS03';

UPDATE SEMESTER 
SET START_DATE = '01-APR-22'
WHERE SEM = 'SPRING' AND CAMPAIGN_ID = 'C01';

SELECT * FROM STUDENT_DONOR;
SELECT * FROM SEMESTER;

ROLLBACK TO CHECKPOINT1;

SELECT * FROM STUDENT_DONOR;
SELECT * FROM SEMESTER;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- TRIGGERS ----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--TRIGGER 1
SET SERVEROUTPUT ON;

-- All start dates and end dates for a campaign should match with the season/semester. 
-- If a new insertion has dates beyond or before specific season, a trigger should fire.

CREATE OR REPLACE TRIGGER SEMRULE
BEFORE INSERT
ON SEMESTER
FOR EACH ROW
BEGIN
IF :NEW.SEM = 'SPRING' AND (:NEW.START_DATE<='15-Jan-22' OR :NEW.END_DATE>='05-May-22') THEN
    DBMS_OUTPUT.PUT_LINE('THE ENTERED DATES ARE NOT MATCHING WITH THE SPRING SEASON');
ELSIF :NEW.SEM ='FALL' AND ( :NEW.START_DATE<='15-Aug-22' OR :NEW.END_DATE>='15-Dec-22') THEN
    DBMS_OUTPUT.PUT_LINE('THE ENTERED DATES ARE NOT MATCHING WITH THE FALL SEASON');
ELSIF :NEW.SEM = 'SUMMER' AND ( :NEW.START_DATE<'01-Jun-22' OR :NEW.END_DATE>'01-Aug-22') THEN
    DBMS_OUTPUT.PUT_LINE('THE ENTERED DATES ARE NOT MATCHING WITH THE SUMMER SEASON');
ELSE
    DBMS_OUTPUT.PUT_LINE('THERE IS NO PROBLEM WITH THE DATES ENTERED');
END IF;
END;

--TESTING
INSERT INTO SEMESTER VALUES('SUMMER','C01','15-Jan-2022','20-Feb-2022');

DELETE FROM SEMESTER WHERE SEM='SUMMER' AND CAMPAIGN_ID = 'C01';

INSERT INTO SEMESTER VALUES('FALL','C05','12-May-2022','23-May-2022');

DELETE FROM SEMESTER WHERE SEM='FALL' AND CAMPAIGN_ID = 'C05';

INSERT INTO SEMESTER VALUES('SPRING','C10','20-Sep-2022','14-Oct-2022');

DELETE FROM SEMESTER WHERE SEM='SPRING' AND CAMPAIGN_ID = 'C10';


--TRIGGER 2

--When a donor tries to donate to campaign that is not live i.e., if the transaction date does not lie in between the start and end dates of a campaign. 
--It means the campaign is closed and if a donor tries to donate for closed campaigns, a trigger should fire

SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER STUDENT_DONOR_RULE
BEFORE INSERT 
ON STUDENT_DONOR
FOR EACH ROW
DECLARE
    CAMP_ID VARCHAR(10);
    CAMPAIGN_SDATE DATE;
    CAMPAIGN_EDATE DATE;
BEGIN
SELECT CAMPAIGN_ID, START_DATE, END_DATE INTO CAMP_ID, CAMPAIGN_SDATE, CAMPAIGN_EDATE FROM SEMESTER WHERE CAMPAIGN_ID = :NEW.CAMPAIGN_ID;
IF :NEW.TRANSACTION_DATE NOT BETWEEN CAMPAIGN_SDATE AND CAMPAIGN_EDATE THEN
    DBMS_OUTPUT.PUT_LINE('SORRY, THIS CAMPAIGN IS CLOSED. PLEASE CHOOSE ANOTHER CAMPAIGN.');
ELSE
    DBMS_OUTPUT.PUT_LINE('THANK YOU FOR YOUR DONATION!');
END IF;
END;

--TESTING
INSERT INTO STUDENT_DONOR VALUES ('TS16','01-OCT-22', 'Emma', 'Watson', 'ST05', 'ewatson@villanova.edu', '4848157524', 'CLAS SE', 'C02', '1842 Day', 1842.50,'Cash');

DELETE FROM STUDENT_DONOR WHERE TRANSACTION_ID = 'TS16';
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- STORED PROCEDURES -------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;

--PROCEDURE 1

--As a Digital Fundraiser, I want to find out the parents who are an alumni and who are also parent to an active student
--I want to their details along with their alumni id.

CREATE OR REPLACE PROCEDURE PARENT_AND_ALUMNI
AS
PA SYS_REFCURSOR;
BEGIN
OPEN PA FOR 
SELECT DISTINCT (P.FIRST_NAME || ' ' || P.LAST_NAME) AS PARENT_ALUMNI_NAME, A.ALUMNI_ID, A.EMAIL, (S.FIRST_NAME || ' ' ||S.LAST_NAME) AS CHILD_NAME
FROM PARENTS P, ACTIVE_STUDENT S, ALUMNI A WHERE P.CHILD_STUDENT_ID = S.STUDENT_ID AND P.ALUMNI_STATUS = 'Yes' AND P.FIRST_NAME = A.FIRST_NAME AND P.LAST_NAME = A.LAST_NAME;
DBMS_SQL.RETURN_RESULT(PA);
END;

EXECUTE PARENT_AND_ALUMNI;

--PROCEDURE 2

--As a Digital Fundraiser, I want to campaign breakdown
--How much did the students, parents & alumni donate to each campaign

CREATE OR REPLACE PROCEDURE CAMPAIGN_BREAKDOWN
AS
CB SYS_REFCURSOR;
BEGIN
OPEN CB FOR
SELECT DISTINCT C.CAMPAIGN_ID, C.CAMPAIGN_NAME, S.STUDENT_DONATIONS, P.PARENT_DONATIONS, A.ALUMNI_DONATIONS  FROM
(SELECT CAMPAIGN_ID, SUM(AMOUNT) AS STUDENT_DONATIONS FROM STUDENT_DONOR GROUP BY CAMPAIGN_ID) S, 
(SELECT CAMPAIGN_ID, SUM(AMOUNT) AS PARENT_DONATIONS FROM PARENT_DONOR GROUP BY CAMPAIGN_ID)P, 
(SELECT CAMPAIGN_ID, SUM(AMOUNT) AS ALUMNI_DONATIONS FROM ALUMNI_DONOR GROUP BY CAMPAIGN_ID) A, CAMPAIGN C
WHERE C.CAMPAIGN_ID = S.CAMPAIGN_ID AND C.CAMPAIGN_ID = A.CAMPAIGN_ID AND C.CAMPAIGN_ID = P.CAMPAIGN_ID
ORDER BY CAMPAIGN_ID;
DBMS_SQL.RETURN_RESULT(CB);
END;

EXECUTE CAMPAIGN_BREAKDOWN;

--PROCEDURE 3

----As a Digital Fundraiser, I want to find out which campaign did the best and which did the worst

CREATE OR REPLACE PROCEDURE CAMPAIGN_PERFORMANCE
AS
CP SYS_REFCURSOR;
BEGIN
OPEN CP FOR
SELECT S2.CAMPAIGN_ID,C.CAMPAIGN_NAME, S2.TOTAL_AMOUNT_FOR_EACH_CAMPAIGN
FROM
(SELECT S1.CAMPAIGN_ID, SUM(S1.AMOUNT) AS TOTAL_AMOUNT_FOR_EACH_CAMPAIGN
FROM
((SELECT DISTINCT S.CAMPAIGN_ID, S.AMOUNT FROM STUDENT_DONOR S)
UNION
(SELECT DISTINCT P.CAMPAIGN_ID, P.AMOUNT FROM PARENT_DONOR P)
UNION
(SELECT DISTINCT A.CAMPAIGN_ID, A.AMOUNT FROM ALUMNI_DONOR A))S1
GROUP BY S1.CAMPAIGN_ID
ORDER BY TOTAL_AMOUNT_FOR_EACH_CAMPAIGN) S2 , CAMPAIGN C
WHERE S2.CAMPAIGN_ID = C.CAMPAIGN_ID;
DBMS_SQL.RETURN_RESULT(CP);
END;

EXECUTE CAMPAIGN_PERFORMANCE;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- FUNCTIONS ---------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;
--FUNCTION 1
--STUDENT DONATIONS TOTAL
--As a Digital Fundraiser, I want to find out how many dollars did students contribute
CREATE OR REPLACE FUNCTION STUDENT_AMOUNT
RETURN FLOAT IS
S_TOTAL FLOAT :=0;
BEGIN
SELECT SUM(AMOUNT) INTO S_TOTAL FROM STUDENT_DONOR;
RETURN S_TOTAL;
END;

DECLARE 
   S FLOAT; 
BEGIN 
   S := STUDENT_AMOUNT(); 
   dbms_output.put_line('TOTAL AMOUNT DONATED BY STUDENTS: ' || S || ' Dollars'); 
END; 

--FUNCTION 2
--PARENT DONATIONS TOTAL
--As a Digital Fundraiser, I want to find out how many dollars did parents contribute
CREATE OR REPLACE FUNCTION PARENT_AMOUNT
RETURN FLOAT IS
P_TOTAL FLOAT :=0;
BEGIN
SELECT SUM(AMOUNT) INTO P_TOTAL FROM PARENT_DONOR;
RETURN P_TOTAL;
END;

DECLARE 
   P FLOAT; 
BEGIN 
   P := PARENT_AMOUNT(); 
   dbms_output.put_line('TOTAL AMOUNT DONATED BY PARENTS: ' || P || ' Dollars'); 
END; 

--FUNCTION 3
--ALUMNI DONATIONS TOTAL
--As a Digital Fundraiser, I want to find out how many dollars did alumni contribute
CREATE OR REPLACE FUNCTION ALUMNI_AMOUNT
RETURN FLOAT IS
A_TOTAL FLOAT :=0;
BEGIN
SELECT SUM(AMOUNT) INTO A_TOTAL FROM ALUMNI_DONOR;
RETURN A_TOTAL;
END;

DECLARE 
   A FLOAT; 
BEGIN 
   A := ALUMNI_AMOUNT(); 
   dbms_output.put_line('TOTAL AMOUNT DONATED BY ALUMNI: ' || A || ' Dollars'); 
END; 

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- SEQUENCES ---------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM SEMESTER;

--ALTER TABLE SEMESTER DROP COLUMN TEMP_ID;


--drop sequence seq; 

CREATE SEQUENCE seq
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 100;

ALTER TABLE SEMESTER
ADD TEMP_ID INT;

SAVEPOINT SECONDCHECKPOINT;


SELECT * FROM SEMESTER;

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'SPRING' AND CAMPAIGN_ID='C01';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'SUMMER' AND CAMPAIGN_ID='C02';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'FALL' AND CAMPAIGN_ID='C03';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'SPRING' AND CAMPAIGN_ID='C04';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'SUMMER' AND CAMPAIGN_ID='C05';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'FALL' AND CAMPAIGN_ID='C06';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'SPRING' AND CAMPAIGN_ID='C07';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'FALL' AND CAMPAIGN_ID='C08';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'FALL' AND CAMPAIGN_ID='C09';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'SUMMER' AND CAMPAIGN_ID='C10';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'FALL' AND CAMPAIGN_ID='C01';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'SPRING' AND CAMPAIGN_ID='C03';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'SPRING' AND CAMPAIGN_ID='C09';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'FALL' AND CAMPAIGN_ID='C04';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'FALL' AND CAMPAIGN_ID='C07';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'SPRING' AND CAMPAIGN_ID='C08';

UPDATE SEMESTER
SET TEMP_ID=seq.nextval
WHERE SEM= 'SPRING' AND CAMPAIGN_ID='C06';

SELECT * FROM SEMESTER;

insert into SEMESTER values('SUMMER','C01','01-JUN-2022','30-JUN-2022',seq.nextval);

SELECT * FROM SEMESTER;

ROLLBACK TO SAVEPOINT SECONDCHECKPOINT;

--DELETE FROM SEMESTER WHERE SEM = 'SUMMER' AND CAMPAIGN_ID = 'C01';
