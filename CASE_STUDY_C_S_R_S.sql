
create database car;
use car;

CREATE TABLE Victims ( victimid INT PRIMARY KEY,
 firstname VARCHAR(55),
 lastname VARCHAR(55), 
dob DATE,
 gender VARCHAR(10),
 address VARCHAR(255),
 phno VARCHAR(11));

CREATE TABLE Suspects (
    suspectid INT PRIMARY KEY,
    firstname VARCHAR(55),
    lastname VARCHAR(55),
    sdob DATE,
    gender VARCHAR(10),
    scontactinfo VARCHAR(255)
);


CREATE TABLE LawEnforcementAgencies (
    agencyid INT PRIMARY KEY,
    agencyname VARCHAR(255),
    jurisdiction VARCHAR(255),
    contactinfo VARCHAR(255)
);

CREATE TABLE Officers (
    officerid INT PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    badgeno VARCHAR(20),
    officerRank VARCHAR(50),
    contactinfo VARCHAR(255),
    agencyid INT,
    FOREIGN KEY (agencyid) REFERENCES LawEnforcementAgencies(agencyid) ON DELETE CASCADE
);




CREATE TABLE Incidents (
    incidentid INT PRIMARY KEY,
    incidenttype VARCHAR(255),
    incidentdate DATE,
    location VARCHAR(255),
    incidentdesc VARCHAR(1000),
    status VARCHAR(50),
    victimid INT,
    suspectid INT,
    agencyid INT,
    FOREIGN KEY (victimid) REFERENCES Victims(victimid),
    FOREIGN KEY (suspectid) REFERENCES Suspects(suspectid) ON DELETE CASCADE,
    FOREIGN KEY (agencyid) REFERENCES LawEnforcementAgencies(agencyid) ON DELETE CASCADE
);
CREATE TABLE Reports (
    reportid INT PRIMARY KEY,
    incidentid INT,
    reportingofficer INT,
    reportdate DATE,
    reportdetails VARCHAR(1000),
    reportstatus VARCHAR(50),
    FOREIGN KEY (incidentid) REFERENCES Incidents(incidentid),
    FOREIGN KEY (reportingofficer) REFERENCES Officers(officerid) ON DELETE CASCADE
);


CREATE TABLE Cases (
    CaseID INT PRIMARY KEY,
    CaseDescription VARCHAR(255)
);


INSERT INTO Victims (victimid, firstname, lastname, dob, gender, address, phno) VALUES   (1, 'John', 'Doe', '1990-01-15', 'Male', '123 Main St, City', '123-456-7890'),   (2, 'Jane', 'Smith', '1985-05-20', 'Female', '456 Oak St, Town', '987-654-3210')	Error Code: 1406. Data too long for column 'phno' at row 1	0.000 sec


-- Inserting data into Victims table
INSERT INTO Victims (victimid, firstname, lastname, dob, gender, address, phno)
VALUES
  (1, 'John', 'Doe', '1990-01-15', 'Male', '123 Main St, City', '12456890'),
  (2, 'Jane', 'Smith', '1985-05-20', 'Female', '456 Oak St, Town', '986543210');

-- Inserting data into Suspects table
INSERT INTO Suspects (suspectid, firstname, lastname, sdob, gender, scontactinfo)
VALUES
  (1, 'Suspect', 'One', '1980-08-25', 'Male', '789 Elm St, Village'),
  (2, 'Susie', 'Suspect', '1992-12-10', 'Female', '321 Pine St, Hamlet');

-- Inserting data into LawEnforcementAgencies table
INSERT INTO LawEnforcementAgencies (agencyid, agencyname, jurisdiction, contactinfo)
VALUES
  (1, 'City Police Department', 'City', 'City PD Contact'),
  (2, 'County Sheriff Office', 'County', 'County SO Contact');

-- Inserting data into Officers table
INSERT INTO Officers (officerid, firstname, lastname, badgeno, officerRank, contactinfo, agencyid)
VALUES
  (1, 'Officer', 'One', '12345', 'Sergeant', 'Officer One Contact', 1),
  (2, 'Officer', 'Two', '54321', 'Detective', 'Officer Two Contact', 2);

-- Inserting data into Incidents table
INSERT INTO Incidents (incidentid, incidenttype, incidentdate, location, incidentdesc, status, victimid, suspectid, agencyid)
VALUES
  (1, 'Robbery', '2023-01-05', '123 Main St, City', 'Robbery at a store', 'Open', 1, 1, 1),
  (2, 'Homicide', '2023-02-15', '456 Oak St, Town', 'Homicide in a park', 'Closed', 2, 2, 2);

-- Inserting data into Reports table
INSERT INTO Reports (reportid, incidentid, reportingofficer, reportdate, reportdetails, reportstatus)
VALUES
  (1, 1, 1, '2023-01-06', 'Initial report for robbery incident', 'Pending'),
  (2, 2, 2, '2023-02-16', 'Final report for homicide incident', 'Approved');

-- Inserting data into Cases table
INSERT INTO Cases (caseid, casedescription)
VALUES
  (1, 'Robbery case with suspect in custody'),
  (2, 'Closed Homicide case with no suspects');
desc car;

CREATE TABLE Cases (
    caseId INT PRIMARY KEY,
    caseDescription VARCHAR(255),
    relatedIncidentId INT,
    FOREIGN KEY (relatedIncidentId) REFERENCES Incidents(incidentId)
);



drop table cases;
use car;
desc cases;
truncate table cases;
rollback;
-- Add more INSERT statements as needed
select * from incidents;
select * from suspects;

