CREATE DATABASE IF NOT EXISTS `core`;
USE `core`;

CREATE TABLE `user_identifiers` (
    `steamname` VARCHAR(40) NOT NULL,
    `steamid` VARCHAR(40) NOT NULL,
    `license` VARCHAR(40) NOT NULL,

    PRIMARY KEY (`steamid`)
);