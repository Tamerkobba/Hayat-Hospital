create table Doctor (
DID char (5) NOT NULL, 
primary key (DID),
	
First_Name varchar (15) NOT NULL, 
Last_Name varchar (15) NOT NULL,
	
Specialization varchar (30) NOT NULL, 
room varchar (3) NOT NULL,
	
Floor int NOT NULL,
	
unique (room) 
 Gender varchar (6) NOT NULL CHECK (Gender IN ('Female','Male')) 
) 
  
create table
Department (
Department_Name varchar (15) NOT NULL,
	    
primary key (Department_Name), 
Description varchar (200),
	    
Department_EID char (8) NOT NULL,
	    
foreign key (Department_EID) references Employee (EID) 
) 
 


create table Room (
RID char (4), 
primary key (RID),
      
Status VARCHAR2 (9) NOT NULL CHECK (Status IN ('Empty', 'Occupied')),
      
Cost INT NOT NULL,
      
Type varchar (7) NOT NULL CHECK (Type IN ('Single', 'Double','Triple')) 
) 
 

create table Nurse (
First_Name varchar (15) NOT NULL, 
Last_Name varchar (15) NOT NULL,
       
Birth_Date Date, 
NID char (4) NOT NULL, 
primary key (NID) 
) 
 
create table Patient (
First_Name varchar (15) NOT NULL, 
Last_Name varchar (15) NOT NULL,
	 
Birth_Date Date, 
PID char (6) NOT NULL, 
primary key (PID),
	 
Phone_NO varchar2 (30), 
unique (Phone_NO),
	 
Emergency_Contact varchar (15),
	 
Status varchar (11) NOT NULL CHECK (Status IN ('IN-PATIENT','OUT-PATIENT')),
	 
Case varchar (40), 
Admission_Date Date, 
RID CHAR (4),
	 
FOREIGN KEY (RID) REFERENCES ROOM (RID)) 
 
CREATE TABLE DRUGS 
 (DRUG_CODE VARCHAR2 (3) NOT NULL,
		      
NAME VARCHAR2 (20) NOT NULL, 
Price INT,
		      
PRIMARY KEY (DRUG_CODE) 
) 
 
create table Surgery (
 
Surgery_Code varchar (5), 
primary key (Surgery_Code),
	 
Price INT NOT NULL, 
Reason varchar (50) NOT NULL,
	 
Name varchar (50) NOT NULL 
) 
create table
Lab (
Lab_Name varchar (30), 
primary key (Lab_Name),
     
floor char (1) NOT NULL, 
Room char (3) NOT NULL) 
 
create table Appointment (
Appointment_Number char (5), 
primary key (Appointment_Number),
	     
PID char (6), 
foreign key (PID) references Patient (PID),
	     
floor char (1) NOT NULL, 
Room char (3) NOT NULL,
	     
Reason varchar (20) NOT NULL,
	     
Appointment_Date Date NOT NULL 
) 
 


CREATE TABLE TEST 
 (TEST_CODE VARCHAR2 (3),
		     
RESULT VARCHAR2 (9) NOT NULL CHECK (Result IN ('Negative ', 'Positive')),
		     
Name VARCHAR2 (30) NOT NULL,
		     
PRIMARY KEY (TEST_CODE) 
) 
 
create table Bill (
Bill_ID char (6), 
primary key (Bill_ID), 
Bills_PID char (6),
      
foreign key (Bills_PID) references Patient (PID), 
Amount INT NOT NULL,
      
Deadline Date) 
 
create table Services (
Serviced_PID char (6) NOT NULL, 
Servicing_NID char (4) NOT NULL,
	  
foreign key (Serviced_PID) references Patient (PID),
	  
foreign key (Servicing_NID) references Nurse (NID) 
) 
 
create table Treats_A (
Treated_PID char (6) NOT NULL, 
Treats_DID char (5) NOT NULL,
	  
foreign key (Treated_PID) references Patient (PID),
	  
foreign key (Treats_DID) references Doctor (DID)) 
 
create table Undergoes (
Underwent_PID char (6) NOT NULL,
	   
Undergoes_Surgery_Code varchar (5) NOT NULL,
	   
foreign key (Underwent_PID) references Patient (PID),
	   
foreign key (Undergoes_Surgery_Code) references
	   Surgery (Surgery_Code), 
Surgery_Date Date NOT NULL 
) 
 
create table Symptom 
 (
PID char (6) NOT NULL,
			
Symptom varchar (20) NOT NULL,
			
foreign key (PID) references Patient (PID)) 

CREATE TABLE EQUIPMENT 
 (NUMBER_ID CHAR (3),
		     
EQUIPMENTS_LAB_NAME VARCHAR2 (30) NOT NULL,
		     
PRIMARY KEY (NUMBER_ID),
		     
FOREIGN KEY (EQUIPMENTS_LAB_NAME) REFERENCES
		     LAB (Lab_Name), 
Type varchar (30) NOT NULL,
		     
EQUIPMENTS_DEPARTMENT_NAME VARCHAR (15) NOT NULL,
		     
FOREIGN KEY (EQUIPMENTS_DEPARTMENT_NAME) REFERENCES
		     DEPARTMENT (DEPARTMENT_NAME) 
) 
 create table Takes (
PID char (6) NOT NULL, 
Test_Code varchar (3) NOT NULL,
       
foreign key (PID) references Patient (PID),
       
foreign key (Test_Code) references Test (Test_code),
       
Test_Date Date) 
 
create table Patient_Medical_Record (
RID char (4), 
primary key (RID),
			
Family_History varchar (30),
			
Operations varchar (20),
			
Diagnosis varchar (25) NOT NULL,
			
PID char (6) NOT NULL,
			
foreign key (PID) references Patient (PID) 
) 
CREATE TABLE MEDICATE (
DRUG_CODE VARCHAR (4) NOT NULL, 
PID CHAR (6) NOT NULL,
	  
DID CHAR (5) NOT NULL, 
foreign key (PID) references Patient (PID),
	  
foreign key (DRUG_CODE) references DRUGS (DRUG_CODE),
	  
foreign key (DID) references DOCTOR (DID)) 
 
CREATE TABLE EMPLOYEE (
POSITION VARCHAR2 (20) NOT NULL, 
GENDER VARCHAR2 (6),
	  
EMPLOYEES_DEPARTMENT_NAME VARCHAR2 (15) NOT NULL,
	  
TYPE VARCHAR2 (30) NOT NULL, 
FIRST_NAME VARCHAR2 (15) NOT NULL,
	  
LAST_NAME VARCHAR2 (15) NOT NULL, 
SUPERVISOR_EID CHAR (8),
	  
EID CHAR (8), 
SALARY NUMBER (*, 0), 
BIRTHDAY DATE,
	  
CHECK (Gender IN ('Female', 'male')), 
PRIMARY KEY (EID),
	  
FOREIGN KEY (EMPLOYEES_DEPARTMENT_NAME) REFERENCES
	  DEPARTMENT (DEPARTMENT_NAME),
	  
FOREIGN KEY (SUPERVISOR_EID) REFERENCES EMPLOYEE (EID) 
) 
 




INSERT INTO DEPARTMENT VALUES('Anesthetics','Takes care of patients before, during and after surgery','20150385')
INSERT INTO DEPARTMENT VALUES('Cardiology','Treats patients with diseases of the heart and blood vessels ','20197264')
INSERT INTO DEPARTMENT VALUES('Gynecology','Revolves around the treatment of women’s diseases ','20208895')
INSERT INTO DEPARTMENT VALUES('Neurology','Treats disorders of the nervous system','20172637')
INSERT INTO DEPARTMENT VALUES('Oncology','Specializes in the treatment of cancer','20178594')
INSERT INTO DEPARTMENT VALUES('Urology','Treats problems of the female urinary system and the male genitourinary tract','20211345')
INSERT INTO DEPARTMENT VALUES('Orthopedics','Treatment of patients with skeletal deformities','20220983')
INSERT INTO DEPARTMENT VALUES('Physiotherapy','Assesses, maintains and restores the physical function and performance of the body','20163678') 

INSERT INTO DOCTOR VALUES ('18573','Quentin','Vautour','General medicine','209','2','Male')
INSERT INTO DOCTOR VALUES('99367','Giselle','Dupont','Immunology','311','3','Female')
INSERT INTO DOCTOR VALUES('03975','Dirik','Kuhn','Radiology','911','9','Male')
INSERT INTO DOCTOR VALUES('12647','Anja','Becker','Biochemistry','723','7','Female')
INSERT INTO DOCTOR VALUES('58028','Landon','Young','Bacteriology','395','3','Male')
INSERT INTO DOCTOR VALUES('48759','Jomarie','James','Sonology','225','2','Male')
INSERT INTO DOCTOR VALUES('37810','Alexander','Ariti','Communicative diseases','429','4','Male')
INSERT INTO DOCTOR VALUES('39001','Lucie','Vannier','Dermatology','117,'1','Female')  

INSERT INTO NURSE VALUES('Henry','Roberts','9/10/1991','8934')  
INSERT INTO NURSE VALUES('Clayton', 'White','11/4/1995','1836')
INSERT INTO NURSE VALUES('Charlotte','Robertson','1/19/1997','3975')
INSERT INTO NURSE VALUES('Caden','Green','2/4/1986','6683')
INSERT INTO NURSE VALUES('James','Jones','10/9/1993','0197')
INSERT INTO NURSE VALUES('Sophie','Allen','4/9/1986','4092')
INSERT INTO NURSE VALUES('Grace','Payne','6/9/2001','4765')
INSERT INTO NURSE VALUES('Charlie','Payne','5/13/1989','1009')  
 
INSERT INTO Room VALUES('2205','Occupied',30,'Single')
INSERT INTO Room VALUES('4423','Occupied',80,'Double')
INSERT INTO Room VALUES('1143','Occupied',20,'Triple')
INSERT INTO Room VALUES('7719','Empty',50,'Single')
INSERT INTO Room VALUES('1112','Occupied',90,'Double')
INSERT INTO Room VALUES('9901','Empty',45,'Triple')
INSERT INTO Room VALUES('8830','Occupied',100,'Triple')
INSERT INTO Room VALUES('4410','Occupied',50,'Single')

INSERT INTO PATIENT VALUES('Orla','Thompson','3/29/1992','192747','83992674','Hector Powell ','IN-PATIENT','Broken arm','3/7/2019','2205') 
INSERT INTO PATIENT VALUES('Pauline','Samuels','1/14/1991','389018','03618746','LawsonGallagher','IN-PATIENT','Heart transplant','4/30/2016','4423')
INSERT INTO PATIENT VALUES('Marvin','Kaye','4/29/1994','287563','29093755','Sol Suarez','OUT-PATIENT','Corona disease',NULL,NULL)
INSERT INTO PATIENT VALUES('Mayson','Curry','6/27/1983','205901','01655451','Liam Marshall','IN-PATIENT','Kidney failure ','11/15/2004','1143')
INSERT INTO PATIENT VALUES('Harvey','Rodriguez','11/9/1973','189563','78826003','Ali Haidar','OUT-PATIENT','Broken ankle',NULL,NULL)
INSERT INTO PATIENT VALUES('Mason','Fisher','4/9/1986','008647','03847973','Francis Long','IN-PATIENT','Cancer treatment','8/24/2015','1112')
INSERT INTO PATIENT VALUES('Julia','Glenn','7/19/2001','489438','01889625','Brianna Andrade','OUT-PATIENT','Head injury' ,NULL,NULL)
INSERT INTO PATIENT VALUES('JASON','Thompson','3/29/1992','192987','83992456','Hector Powell','OUT-PATIENT','Broken arm',NULL,NULL) 

INSERT INTO test VALUES('161','Negative ','Kidney function test')
INSERT INTO test VALUES('418','Positive','Lumbar puncture') 
INSERT INTO test VALUES('334','Positive','Malabsorption test') 
INSERT INTO test VALUES('219','Positive','Liver function test') 
INSERT INTO test VALUES('283','Negative ','Gastric fluid analysis') 
INSERT INTO test VALUES('642','Negative ','Amniocentesis') 
INSERT INTO test VALUES('063','Positive','Blood analysis') 
INSERT INTO test VALUES('485','Negative ','Corona virus test') 
 
INSERT INTO DRUGS VALUES('ETO','Etoposide',100) 
INSERT INTO DRUGS VALUES('FLU','Fluconazole',85) 
INSERT INTO DRUGS VALUES('HYD','Hydromorphone',350) 
INSERT INTO DRUGS VALUES('LOM','Lomustine',120) 
INSERT INTO DRUGS VALUES('MAG','Magnesium',190) 
INSERT INTO DRUGS VALUES('OXY','Oxycodone',210) 
INSERT INTO DRUGS VALUES('PEN','Penicillin',75) 
INSERT INTO DRUGS VALUES('WAR','Warfarin ',150) 

INSERT INTO SURGERY VALUES('DOE',3000,'Blurry vision','Debridement of eyeball')
INSERT INTO SURGERY VALUES('CSEC',35000,'Woman having heart or brain condition','Cesarean section ')  
INSERT INTO SURGERY VALUES('COCA',10500,'To cure the aneurysm','Clipping of cerebral aneurysm ')  
INSERT INTO SURGERY VALUES('RUM',9000,'To stop the spread of breast cancer','Radical unilateral mastectomy ')  
INSERT INTO SURGERY VALUES('THR',12300,'Extreme hip pain','Total hip replacement ')  
INSERT INTO SURGERY VALUES('ROOOC',11900,'To treat lung conditions','Radical operation of ovarian cancer ')  
INSERT INTO SURGERY VALUES('TL',16780,'To treat the ovarian cancer','Thoracoscopic lobectomy ')
INSERT INTO SURGERY VALUES('RSORC',13000,'To treat the rectal cancer','Radical resection of rectal cancer ')    

INSERT INTO LAB VALUES('LaboWise',3,'309')
INSERT INTO LAB VALUES('Gateway Labs',4,'411')
INSERT INTO LAB VALUES('Atlas Diagnostics ',8,'801')
INSERT INTO LAB VALUES('Precision Dental Lab',7,'723')
INSERT INTO LAB VALUES('Soul Lab ',3,'307')
INSERT INTO LAB VALUES('Natural Health Laboratories',2,'225')
INSERT INTO LAB VALUES('AccuTests',7,'709')
INSERT INTO LAB VALUES('Lifeline Lab Services ',1,'115')

INSERT INTO EQUIPMENT VALUES('112','LaboWise','Binocular Microscope','Anesthetics')
INSERT INTO EQUIPMENT VALUES('478','Gateway Labs','Binocular Microscope','Anesthetics') 
INSERT INTO EQUIPMENT VALUES('380','Atlas Diagnostics ','Binocular Microscope','Anesthetics') 
INSERT INTO EQUIPMENT VALUES('205','Precision Dental Lab','Binocular Microscope','Anesthetics') 
INSERT INTO EQUIPMENT VALUES('583','Soul Lab ','Binocular Microscope','Anesthetics') 
INSERT INTO EQUIPMENT VALUES('663','Natural Health Laboratories','Binocular Microscope','Anesthetics') 
INSERT INTO EQUIPMENT VALUES('965','AccuTests','Binocular Microscope','Anesthetics')
INSERT INTO EQUIPMENT VALUES('385','Lifeline Lab Services ','Binocular Microscope','Anesthetics')   

INSERT INTO APPOINTMENT VALUES('30138','192747','3','301','Broken arm','9/10/2020')
INSERT INTO APPOINTMENT VALUES('62395','389018','6','623','Heart transplant','5/13/2013') 
INSERT INTO APPOINTMENT VALUES('81164','287563','8','811','Corona disease','9/19/2015') 
INSERT INTO APPOINTMENT VALUES('40922','205901','4','409','Kidney failure','11/11/2021') 
INSERT INTO APPOINTMENT VALUES('50347','189563','5','503','Broken ankle','10/23/2009') 
INSERT INTO APPOINTMENT VALUES('91094','008647','9','910','Cancer treatment','4/27/2011') 
INSERT INTO APPOINTMENT VALUES('41205','489438','4','412','Head injury','12/18/2011') 
INSERT INTO APPOINTMENT VALUES('13017','192747','1','130','Lung surgery','5/13/2022') 

INSERT INTO BILL VALUES('188374','192747','45670','12/3/2022')
INSERT INTO BILL VALUES('193846','389018','23780','1/15/2023')
INSERT INTO BILL VALUES('198562','287563','39540','2/19/2023')
INSERT INTO BILL VALUES('490826','205901','11000','12/9/2022')
INSERT INTO BILL VALUES('551364','189563','12390','5/24/2023')
INSERT INTO BILL VALUES('748262','008647','31990','8/5/2023')
INSERT INTO BILL VALUES('483716','489438','36780','9/21/2023')
INSERT INTO BILL VALUES('193750','192747','20000','11/30/2022')

INSERT INTO SERVICES VALUES('192747','8934')
INSERT INTO SERVICES VALUES('389018','1836')
INSERT INTO SERVICES VALUES('287563','3975')
INSERT INTO SERVICES VALUES('205901','6683')
INSERT INTO SERVICES VALUES('189563','0197')
INSERT INTO SERVICES VALUES('008647','4092')
INSERT INTO SERVICES VALUES('489438','4765')
INSERT INTO SERVICES VALUES('192747','1009')

INSERT INTO UNDERGOES VALUES('192747','DOE','1/30/2022')
INSERT INTO UNDERGOES VALUES('389018','CSEC','12/13/2023')
INSERT INTO UNDERGOES VALUES('287563','COCA','5/18/2023')
INSERT INTO UNDERGOES VALUES('205901','RUM','12/10/2022')
INSERT INTO UNDERGOES VALUES('189563','THR','8/24/2023')
INSERT INTO UNDERGOES VALUES('008647','TL','11/5/2023')
INSERT INTO UNDERGOES VALUES('489438','ROOOC','4/21/2023')
INSERT INTO UNDERGOES VALUES('192747','RSORC','11/24/2022')

INSERT INTO TAKES VALUES('192747','161','10/3/2019')
INSERT INTO TAKES VALUES('389018','418','1/13/2020')
INSERT INTO TAKES VALUES('287563','334','8/18/2021')
INSERT INTO TAKES VALUES('205901','219','1/15/2022')
INSERT INTO TAKES VALUES('189563','283','8/24/2016')
INSERT INTO TAKES VALUES('008647','642','12/8/2017')
INSERT INTO TAKES VALUES('489438','063','11/2/2017')
INSERT INTO TAKES VALUES('192747','485','11/2/2009')

INSERT INTO SYMPTOM VALUES('192747','Broken arm') 
INSERT INTO SYMPTOM VALUES('389018','Heart transplant')
INSERT INTO SYMPTOM VALUES('287563','Corona disease') 
INSERT INTO SYMPTOM VALUES('205901','Kidney failure')
INSERT INTO SYMPTOM VALUES('189563','Broken ankle')
INSERT INTO SYMPTOM VALUES('008647','Cancer treatment') 
INSERT INTO SYMPTOM VALUES('489438','Head injury')
INSERT INTO SYMPTOM VALUES('192747','Broken arm')

INSERT INTO MEDICATE VALUES('FLU','192747','18573')
INSERT INTO MEDICATE VALUES('FLU','389018','99367')
INSERT INTO MEDICATE VALUES('MAG','489438','03975')
INSERT INTO MEDICATE VALUES('LOM','205901','12647')
INSERT INTO MEDICATE VALUES('MAG','189563','58028')
INSERT INTO MEDICATE VALUES('ETO','008647','48759')
INSERT INTO MEDICATE VALUES('FLU','489438','37810')

INSERT INTO PATIENT_MEDICAL_RECORD VALUES('2205',NULL,NULL,'Mild headache','192747')
INSERT INTO PATIENT_MEDICAL_RECORD VALUES('4405','Diabetes','Leg surgery ','Broken leg','389018') 
INSERT INTO PATIENT_MEDICAL_RECORD VALUES('1143','Diabetes','Quarantine','Corona virus','287563')  
INSERT INTO PATIENT_MEDICAL_RECORD VALUES('7719','Bad eyesight','Eye surgery ','Rectal dysfunction','205901')
INSERT INTO PATIENT_MEDICAL_RECORD VALUES('1112','Corona virus','Arm Surgery','Broken arm','189563')  
INSERT INTO PATIENT_MEDICAL_RECORD VALUES('9901','Breast cancer','Skin biopsy ','Skin cancer ','008647')   
INSERT INTO PATIENT_MEDICAL_RECORD VALUES('8830',NULL,'Breast biopsy','Breast cancer','489438') 
INSERT INTO PATIENT_MEDICAL_RECORD VALUES('4410','Low iron levels','Ear inspection ','Ear infection','192747') 


INSERT INTO EMPLOYEE VALUES('Administrator','Female','Anesthetics','Pharmacy Technician','Blair ','Bridges',NULL,'20110373',10000,'12-05-1990')
INSERT INTO EMPLOYEE VALUES('Specialist','male','Cardiology','Physician','Zac','Goldsmith','20110373','20094224',9330,'5/9/2000')
INSERT INTO EMPLOYEE VALUES('Specialist ','male','Gynecology','Surgeon','Ioan','Sherman',NULL,'20228590',8100,'8/23/1998')  
INSERT INTO EMPLOYEE VALUES('Administrator','male','Oncology','Counselor','Ali','haidar','20190813','20179094',9900,'10/9/1993')
INSERT INTO EMPLOYEE VALUES('Silent Doctor','Female','Neurology','Dentist','Chay','Milne','20110373','20182637',12500,'2/4/1989') 
INSERT INTO EMPLOYEE VALUES('Specialist','male','Urology','Physical Therapist','Darien','Parrish','220130676','20155343',7450,'1/5/1986') 
INSERT INTO EMPLOYEE VALUES('Nursing','male','Orthopedics','Medical Assistant','Zac','Goldberg',NULL,'20190813',1030,'6/9/2000')
INSERT INTO EMPLOYEE VALUES('Nursing','Female','Physiotherapy','Nurse','Rosie','Blackmore',NULL,'20130676',9800,'5/13/1999')
 
 
SELECT P.First_Name, P.Last_Name, P.Phone_NO, P.Emergency_contact
FROM Patient P
WHERE EXISTS(
SELECT *
FROM Medicate M
WHERE M.PID = P.PID AND EXISTS(
SELECT *
FROM Drugs D
WHERE D.Drug_Code = M.Drug_Code AND D.Name = 'Magnesium'
) 
AND EXISTS(
SELECT *
FROM Doctor Do
WHERE Do.DID = M.DID AND Do.Fist_Name = 'Dirik' and Do.Last_Name = 'Kuhn'
)
)

SELECT 
COUNT(*) AS Number_of_Empty_Rooms
FROM Room
WHERE Room.Status = 'Empty'


SELECT 
P.PID Patient_ID,
P.Emergency_contact
FROM Patient P
WHERE P.PID IN(
SELECT S.Serviced_PID
FROM Services S
Where S.Servicing_NID = 8934
)
AND P.PID IN(
SELECT T.PID
FROM Takes T
WHERE T.Test_Code = 161 
OR T.Test_Code = 485
)
AND P.PID IN(
SELECT U.Underwent_PID
FROM Undergoes U
WHERE U.Undergoes_Surgery_Code = 'DOE' 
OR U.Undergoes_Surgery_Code = 'RSORC'
)


Select N.NID, N.First_Name, N.Last_Name, COUNT(*) AS Nb_of_Patients_Servicing
FROM Nurse N, Services S
WHERE N.NID = S.SERVICING_NID
GROUP BY N.NID, N.First_Name, N.Last_Name


UPDATE	Employee
SET Salary = 
CASE WHEN Type = 'Pharmacy Technician' THEN Salary * 1.2
WHEN Type = 'Physician' THEN Salary * 1.4
WHEN Type = 'Surgeon' THEN Salary * 1.5 END
WHERE Type = 'Pharmacy Technician' OR Type = 'Physician' OR Type = 'Surgeon'


SELECT       P.PID, P.First_Name, P.Last_Name, Emergency_Contact 
FROM        Patient P
WHERE      P.PID IN (SELECT T.PID 
FROM        TAKES T
WHERE      T.TEST_CODE IN(SELECT TE.TEST_CODE
FROM Test TE
WHERE TE.RESULT = 'Positive' AND TE.Name = 'Blood analysis' 
))


SELECT       D.Fist_Name AS Doc_F_Name, D.Last_Name AS D_L_Name, P.First_Name AS P_F_Name, P.Last_Name AS P_L_Name
FROM         Doctor D, Patient P, Medicate M
WHERE       D.Specialization = 'Radiology' AND D.DID = M.DID AND P.PID = M.PID


SELECT                      A.PID, A.Appointment_Date
FROM                        Appointment A
WHERE EXISTS(SELECT *
FROM Patient  P
WHERE A.PID = P.PID 
)


SELECT B.BILLS_PID as Patient_ID, B.Amount
From BILL B
WHERE B.Deadline = '12/9/2022' AND B.BILLS_PID IN(
SELECT P.PID
FROM Patient P
)


SELECT            P.PID, P.First_Name, P.Last_Name
FROM              Patient P
WHERE            EXISTS (SELECT * FROM Room RP
                          WHERE P.RID = RP.RID AND EXISTS (SELECT * FROM Room R
                          WHERE RP.RID = R.RID AND R.Type = 'Double'))





 




