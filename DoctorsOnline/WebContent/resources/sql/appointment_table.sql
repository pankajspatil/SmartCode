CREATE TABLE `citybazz_doctoronline`.`appointment_master` (
  `appointment_id` INT NOT NULL AUTO_INCREMENT,
  `appointment_desc` VARCHAR(45) NULL,
  `doctor_id` INT NULL,
  `patient_id` INT NULL,
  `appointment_date` DATE NULL,
  `appointment_StartTime` DATETIME NULL,
  `appointment_EndTime` DATETIME NULL,
  `appointment_Status` VARCHAR(20) NULL DEFAULT 'OPEN',
  PRIMARY KEY (`appointment_id`),
  INDEX `doctor_app_id_idx` (`doctor_id` ASC),
  INDEX `patient_app_id_idx` (`patient_id` ASC),
  CONSTRAINT `doctor_app_id`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `citybazz_doctoronline`.`usermaster` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `patient_app_id`
    FOREIGN KEY (`patient_id`)
    REFERENCES `citybazz_doctoronline`.`usermaster` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
