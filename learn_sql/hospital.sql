CREATE TABLE `DOCTOR` (
`id` char(5) NOT NULL,
`fname` char(15) NOT NULL,
`Iname` char(15) NOT NULL,
`phone` char(12) NOT NULL,
`beeper` char(12) NOT NULL,
PRIMARY KEY (`id`) 
);

CREATE TABLE `INSURANCE` (
`company` char(15) NOT NULL,
`contact_fname` char(15) NOT NULL,
`contact_Lname` char(15) NOT NULL,
`phone` char(12) NOT NULL,
PRIMARY KEY (`company`) 
);

CREATE TABLE `PATIENT` (
`id` char(5) NOT NULL,
`doctorid` char(5) NOT NULL,
`fname` char(15) NOT NULL,
`Iname` char(15) NOT NULL,
`street` char(15) NOT NULL,
`city` char(10) NOT NULL,
`state` char(2) NOT NULL,
`zip` char(10) NOT NULL,
`phone` char(12) NOT NULL,
PRIMARY KEY (`id`) 
);

CREATE TABLE `INSURE` (
`patientid` char(5) NOT NULL,
`insurancescompany` char(15) NOT NULL,
PRIMARY KEY (`patientid`, `insurancescompany`) 
);


ALTER TABLE `PATIENT` ADD CONSTRAINT `fk_doctorid` FOREIGN KEY (`doctorid`) REFERENCES `DOCTOR` (`id`);
ALTER TABLE `INSURE` ADD CONSTRAINT `fk_patientid` FOREIGN KEY (`patientid`) REFERENCES `PATIENT` (`id`);
ALTER TABLE `INSURE` ADD CONSTRAINT `fk_insurcom` FOREIGN KEY (`insurancescompany`) REFERENCES `INSURANCE` (`company`);

