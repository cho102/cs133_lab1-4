/*Problem 1 */
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Graduate;
DROP TABLE IF EXISTS Dept_Prof_Work;
DROP TABLE IF EXISTS Proj_Prof_Work;
DROP TABLE IF EXISTS Proj_Graduate_Work;

CREATE TABLE Department	(	dno CHAR(11) NOT NULL, 	
				dname CHAR(30), 
				office CHAR(30), 
				chairman CHAR(30) NOT NULL,
 				PRIMARY KEY(dno), 
				FOREIGN KEY(chairman) REFERENCES Professor(ssn)	
			);

CREATE TABLE Professor	(	ssn CHAR(11) NOT NULL, 
				age INTEGER, 
				name CHAR(30),
				specialty CHAR(30), 
				rank CHAR(30), 
				PRIMARY KEY (ssn)
			);

CREATE TABLE Project	(	pno CHAR(11) NOT NULL, 
				budget INTEGER, 
				start_date CHAR(11), 
				end_date CHAR(11),  		
				sponsor CHAR(30), 
				manager CHAR(11) NOT NULL, 
				PRIMARY KEY(pno), 
				FOREIGN KEY(manager) REFERENCES Professor(ssn)
			);

CREATE TABLE Graduate	(	ssn CHAR(11) NOT NULL, 
				name CHAR(30) NOT NULL,
				age INTEGER, 
				deg_pg CHAR(30), 
				major CHAR(11) NOT NULL,
				advisor CHAR(11) NOT NULL,
				PRIMARY KEY(ssn),
				FOREIGN KEY(major) REFERENCES Department(dno)
			);

CREATE TABLE Dept_Prof_Work	(	dno CHAR(11) NOT NULL,
					ssn CHAR(11) NOT NULL,
					time_percentage CHAR(11),
					PRIMARY KEY(dno, ssn), 
					FOREIGN KEY(dno) REFERENCES Department(dno),
 					FOREIGN KEY(ssn) REFERENCES Professor(ssn)
				);

CREATE TABLE Proj_Prof_Work	(	ssn CHAR(11) NOT NULL, 								
					pno CHAR(11) NOT NULL, 
					PRIMARY KEY(ssn, pno), 
					FOREIGN KEY(ssn) REFERENCES Professor(ssn), 
					FOREIGN KEY(pno) REFERENCES Project(pno)
				);

CREATE TABLE Proj_Graduate_Work	(	ssn CHAR(11) NOT NULL, 
					pno CHAR(11) NOT NULL, 
					supervisor CHAR(11) NOT NULL,
					since CHAR(11),
					PRIMARY KEY(ssn, pno), 	
					FOREIGN KEY(ssn) REFERENCES Graduate(ssn), 
					FOREIGN KEY(pno) REFERENCES Project(pno),
					FOREIGN KEY(supervisor) REFERENCES Professor(ssn),
				);



/*Problem 2
DROP TABLE Musician Cascade;
DROP TABLE Instrument Cascade;
DROP TABLE Plays Cascade;
DROP TABLE Song Cascade;
DROP TABLE Home Cascade;
DROP TABLE Album Cascade;
DROP TABLE Perform_Song Cascade;


CREATE TABLE Musician	(	ssn CHAR(11) NOT NULL, 
				name CHAR(30) NOT NULL, 
				residence CHAR(30) NOT NULL, 
				PRIMARY KEY(ssn), 
				FOREIGN KEY(residence) REFERENCES Home(address)
			);

CREATE TABLE Instrument	(	instrid CHAR(11) NOT NULL,
				dname CHAR(30), 
				key CHAR(1), 
				PRIMARY KEY(instrid)
			);

CREATE TABLE Plays	(	ssn CHAR(11) NOT NULL, 
				instrid CHAR(11) NOT NULL, 
				PRIMARY KEY(ssn, instrid), 
				FOREIGN KEY (ssn) REFERENCES Musician(ssn), 
				FOREIGN KEY (instrid) REFERENCES Instrument(instrid), 
			);

CREATE TABLE Song	(	songid CHAR(30) NOT NULL,
				title CHAR(30) NOT NULL, 
				author CHAR(30), 
				album_id CHAR(10) NOT NULL, 
				PRIMARY KEY(title, author), 
				FOREIGN KEY (album_id) REFERENCES Album(album_id)
			);

CREATE TABLE Album 	(	album_id CHAR(10) NOT NULL, 
				copyright_date INTEGER, 
				format CHAR(10), 
				title CHAR(30), 
				producer CHAR(11) NOT NULL, 
				PRIMARY KEY (album_id),	
				FOREIGN KEY (producer) REFERENCES Musician(ssn)
			);

CREATE TABLE Home 	(	address CHAR(50) NOT NULL, 
				phone_number INTEGER NOT NULL, 
				PRIMARY KEY(address)
			);

CREATE TABLE Perform_Song 	(	ssn CHAR(11) NOT NULL, 
					songid CHAR(30) NOT NULL,
					PRIMARY KEY(ssn, songid),
					FOREIGN KEY (ssn) REFERENCES Musician(ssn),
					FOREIGN KEY (songid) REFERENCES Song (songid)
				);
*/
