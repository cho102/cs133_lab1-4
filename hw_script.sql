DROP TABLE Employee CASCADE;
DROP TABLE Technician CASCADE;
DROP TABLE Traffic_Controller CASCADE;
DROP TABLE Efficiency_Exam CASCADE;
DROP TABLE Airplane CASCADE;
DROP TABLE Airplane_Test CASCADE;
DROP TABLE TC_Exam CASCADE;
DROP TABLE Airplane_Tech CASCADE;
DROP TABLE Airworthy_Test CASCADE;
DROP TABLE Test_Event CASCADE;

CREATE TABLE Employee( ssn INTEGER NOT NULL, uid INTEGER NOT NULL, PRIMARY KEY (ssn));

CREATE TABLE Technician(phone INTEGER, address CHAR(30), salary INTEGER, lname CHAR(30), t_ssn INTEGER NOT NULL, PRIMARY KEY (t_ssn), FOREIGN KEY (t_ssn) REFERENCES Employee(ssn));

CREATE TABLE Traffic_Controller(age INTEGER, years_exp INTEGER, tc_ssn INTEGER NOT NULL, PRIMARY KEY (tc_ssn), FOREIGN KEY (tc_ssn) REFERENCES Employee(ssn));


CREATE TABLE Efficiency_Exam(level CHAR(10) NOT NULL, duration INTEGER, date CHAR(30), PRIMARY KEY(level));

CREATE TABLE Airplane(reg_num INTEGER NOT NULL, company CHAR(30) NOT NULL, model CHAR(30) NOT NULL, seat_capacity INTEGER, weight INTEGER, fuel_type  CHAR(10), PRIMARY KEY (reg_num));

CREATE TABLE Airplane_Test( FAA_num INTEGER NOT NULL, name CHAR(30) NOT NULL, max_score INTEGER NOT NULL, PRIMARY KEY(FAA_num));

/*Relationships*/
/*Taken*/
CREATE TABLE TC_Exam (tc_ssn INTEGER NOT NULL, level CHAR(10) NOT NULL, PRIMARY KEY(tc_ssn, level), FOREIGN KEY (tc_ssn) REFERENCES Traffic_Controller(tc_ssn), FOREIGN KEY (level) REFERENCES Efficiency_Exam(level));

/*Can Fix*/
CREATE TABLE Airplane_Tech(	t_ssn INTEGER NOT NULL, reg_num INTEGER NOT NULL, PRIMARY KEY(t_ssn, reg_num), FOREIGN KEY (t_ssn) REFERENCES Technician(t_ssn), FOREIGN KEY(reg_num) REFERENCES Airplane(reg_num));

/*Airworthy Test*/
CREATE TABLE Airworthy_Test(reg_num INTEGER NOT NULL, FAA_num INTEGER NOT NULL, PRIMARY KEY (reg_num, FAA_num), FOREIGN KEY(FAA_num) REFERENCES Airplane_Test(FAA_num), FOREIGN KEY(reg_num) REFERENCES Airplane(reg_num));

/*Test Event*/
CREATE TABLE Test_Event(t_ssn INTEGER NOT NULL, reg_num INTEGER NOT NULL, FAA_num INTEGER NOT NULL, PRIMARY KEY(t_ssn, reg_num, FAA_num), FOREIGN KEY (t_ssn) REFERENCES Technician(t_ssn), FOREIGN KEY(FAA_num) REFERENCES Airworthy_Test(FAA_num)/*, FOREIGN KEY(reg_num) REFERENCES Airworthy_Test(reg_num)*/);

