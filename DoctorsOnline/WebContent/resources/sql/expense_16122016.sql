CREATE TABLE `citybazz_doctoronline`.`expense` (
  `expense_id` INT NOT NULL,
  `expense_desc` VARCHAR(45) NULL,
  `expense_bill_amount` DOUBLE NULL,
  `user_id` INT NULL,
  `expense_created_date` DATETIME NULL,
  `expense_created_by` VARCHAR(45) NULL,
  PRIMARY KEY (`expense_id`));

  
  ALTER TABLE `citybazz_doctoronline`.`expense` 
CHANGE COLUMN `expense_id` `expense_id` INT(11) NOT NULL AUTO_INCREMENT ;
