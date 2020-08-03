DROP TABLE IF EXISTS tblIMember;

CREATE TABLE `tblIMember` (
	`name` CHAR(20) NOT NULL,
	`nickname` CHAR(20) NOT NULL,
	`password` CHAR(20) NOT NULL,
	`email` CHAR(20) NOT NULL,
	`profile` CHAR(30) NOT NULL,
	PRIMARY KEY (`nickname`)
);

DROP TABLE IF EXISTS tblIBlog;

CREATE TABLE `tblIBlog` (
	`num` INT(11) NOT NULL AUTO_INCREMENT,
	`message` CHAR(255) NOT NULL,
	`nickname` CHAR(20) NOT NULL,
	`pdate` DATETIME NOT NULL,
	`photo` CHAR(50) NOT NULL,
	`hcnt` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`num`)
);

DROP TABLE IF EXISTS tblIReply;

CREATE TABLE `tblIReply` (
	`rnum` INT(11) NOT NULL AUTO_INCREMENT,
	`num` INT(11) NOT NULL,
	`nickname` CHAR(20) NOT NULL,
	`rdate` DATETIME NOT NULL,
	`comment` CHAR(100) NOT NULL,
	PRIMARY KEY (`rnum`)
);

CREATE TABLE `tblifollow` (
	`follower` CHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`followed` CHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`grade` INT(11) NULL DEFAULT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
