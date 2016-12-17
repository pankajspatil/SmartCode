INSERT INTO `citybazz_doctoronline`.`menu_master` (`menu_description`, `created_by`, `is_active`) VALUES ('Expense', 'admin', '1');
UPDATE `citybazz_doctoronline`.`menu_master` SET `is_active`='1' WHERE `menu_id`='1';
UPDATE `citybazz_doctoronline`.`menu_master` SET `is_active`='1' WHERE `menu_id`='2';
UPDATE `citybazz_doctoronline`.`menu_master` SET `is_active`='1' WHERE `menu_id`='3';
UPDATE `citybazz_doctoronline`.`menu_master` SET `is_active`='1' WHERE `menu_id`='4';
UPDATE `citybazz_doctoronline`.`menu_master` SET `is_active`='1' WHERE `menu_id`='5';
UPDATE `citybazz_doctoronline`.`menu_master` SET `is_active`='1' WHERE `menu_id`='6';


INSERT INTO `citybazz_doctoronline`.`role_menu_map` (`role_id`, `menu_id`, `created_by`, `is_active`) VALUES ('2', '9', 'admin', '1');
