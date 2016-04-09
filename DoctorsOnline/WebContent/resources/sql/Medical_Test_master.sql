CREATE TABLE `citybazz_doctoronline`.`medical_test_master` (
  `Medical_Test_Master_id` INT NOT NULL AUTO_INCREMENT,
  `Medical_Test_Master_label` VARCHAR(45) NULL,
  `Medical_Test_Master_desc` VARCHAR(45) NULL,
  `is_active` CHAR(1) NULL DEFAULT '1',
  PRIMARY KEY (`Medical_Test_Master_id`));
  
  CREATE TABLE `citybazz_doctoronline`.`medical_test` (
  `medical_test_id` INT NOT NULL AUTO_INCREMENT,
  `medical_test_label` VARCHAR(45) NULL,
  `medical_test_master_id` VARCHAR(45) NULL,
  `medical_test_desc` VARCHAR(45) NULL,
  `isActive` CHAR(1) NULL DEFAULT '1',
  PRIMARY KEY (`medical_test_id`));

INSERT INTO `citybazz_doctoronline`.`medical_test_master` (`Medical_Test_Master_label`, `Medical_Test_Master_desc`) VALUES ('HAEMATOLOGY', 'HAEMATOLOGY');
INSERT INTO `citybazz_doctoronline`.`medical_test_master` (`Medical_Test_Master_label`, `Medical_Test_Master_desc`) VALUES ('SEROLOGY', 'SEROLOGY');
INSERT INTO `citybazz_doctoronline`.`medical_test_master` (`Medical_Test_Master_label`, `Medical_Test_Master_desc`) VALUES ('CLINICAL PATHOLOGY', 'Clinical pathology');
INSERT INTO `citybazz_doctoronline`.`medical_test_master` (`Medical_Test_Master_label`, `Medical_Test_Master_desc`) VALUES ('BIOCHEMISTRY', 'bio chemistry');
INSERT INTO `citybazz_doctoronline`.`medical_test_master` (`Medical_Test_Master_label`, `Medical_Test_Master_desc`) VALUES ('ELIZA TEST', 'eliza test');
INSERT INTO `citybazz_doctoronline`.`medical_test_master` (`Medical_Test_Master_label`, `Medical_Test_Master_desc`) VALUES ('ENDOCRINOLGY', 'endo crinolgy');
INSERT INTO `citybazz_doctoronline`.`medical_test_master` (`Medical_Test_Master_label`, `Medical_Test_Master_desc`) VALUES ('MICROBIOLOGY', 'micro biology');
INSERT INTO `citybazz_doctoronline`.`medical_test_master` (`Medical_Test_Master_label`, `Medical_Test_Master_desc`) VALUES ('BODY FLUIDS', 'Body fluids');
INSERT INTO `citybazz_doctoronline`.`medical_test_master` (`Medical_Test_Master_label`, `Medical_Test_Master_desc`) VALUES ('PROFILES', 'Profiles');

/* Insert for medical Test*/

INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`, `medical_test_desc`) VALUES ('C.B.C/E.S.R', '1', 'Complete blood count');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('Complete Heamogram', '1');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('HB.', '1');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('Platelet Count', '1');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('Retic Count', '1');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('Smear of Malarial/ Filaria', '1');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('Comb\''s Test', '1');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('BT/CT', '1');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('Prothrombin Time', '1');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('Bi Group & Rh', '1');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('Antiboby titre', '1');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('L.E. Cell Test', '1');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('Widal', '2');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('Dengue IgG/lgM/NS1', '2');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('VDRL', '2');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('ASO Titer', '2');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('C. Reactive Protein', '2');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('Australia Antigen(HBsAg)', '2');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('Anti - HCV', '2');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('RA Test', '2');
INSERT INTO `citybazz_doctoronline`.`medical_test` (`medical_test_label`, `medical_test_master_id`) VALUES ('Mantoux Test', '2');
