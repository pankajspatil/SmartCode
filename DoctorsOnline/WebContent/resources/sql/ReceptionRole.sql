INSERT INTO `citybazz_doctoronline`.`role_master` (`role_id`, `role_description`, `is_active`) VALUES ('4', 'Reception', '1');

INSERT INTO `citybazz_doctoronline`.`role_menu_map` (`role_id`, `menu_id`, `created_by`, `is_active`) VALUES ('4', '4', 'admin', '1');
INSERT INTO `citybazz_doctoronline`.`role_menu_map` (`role_id`, `menu_id`, `created_by`, `is_active`) VALUES ('4', '5', 'admin', '1');
INSERT INTO `citybazz_doctoronline`.`role_menu_map` (`role_id`, `menu_id`, `created_by`, `is_active`) VALUES ('4', '6', 'admin', '1');
INSERT INTO `citybazz_doctoronline`.`role_menu_map` (`role_id`, `menu_id`, `created_by`, `is_active`) VALUES ('4', '7', 'admin', '1');


UPDATE `citybazz_doctoronline`.`usermaster` SET `userName`='Madhuri', `password`='madhuri', `RoleId`='4' WHERE `userId`='9';

INSERT INTO `citybazz_doctoronline`.`menu_master` (`menu_id`, `menu_description`, `created_by`, `is_active`) VALUES ('8', 'User Management', 'admin', '1');

INSERT INTO `citybazz_doctoronline`.`role_menu_map` (`role_menu_id`, `role_id`, `menu_id`, `created_by`, `is_active`) VALUES ('11', '2', '8', 'admin', '1');


UPDATE `citybazz_doctoronline`.`usermaster` SET `createdBy`='Kiran' WHERE `userId`='9';
