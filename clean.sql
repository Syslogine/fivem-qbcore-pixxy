CREATE DATABASE IF NOT EXISTS `QBCoreFramework` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;
USE `QBCoreFramework`;

CREATE TABLE IF NOT EXISTS `apartments` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) DEFAULT NULL,
    `type` varchar(255) DEFAULT NULL,
    `label` varchar(255) DEFAULT NULL,
    `citizenid` varchar(11) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `citizenid` (`citizenid`),
    KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `bank_accounts` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `citizenid` varchar(11) DEFAULT NULL,
    `account_name` varchar(50) DEFAULT NULL,
    `account_balance` int(11) NOT NULL DEFAULT 0,
    `account_type` enum('shared','job','gang') NOT NULL,
    `users` longtext DEFAULT '[]',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `account_name` (`account_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `bank_statements` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `citizenid` varchar(11) DEFAULT NULL,
    `account_name` varchar(50) DEFAULT 'checking',
    `amount` int(11) DEFAULT NULL,
    `reason` varchar(50) DEFAULT NULL,
    `statement_type` enum('deposit','withdraw') DEFAULT NULL,
    `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    PRIMARY KEY (`id`) USING BTREE,
    KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `bans` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(50) DEFAULT NULL,
    `license` varchar(50) DEFAULT NULL,
    `discord` varchar(50) DEFAULT NULL,
    `ip` varchar(50) DEFAULT NULL,
    `reason` text DEFAULT NULL,
    `expire` int(11) DEFAULT NULL,
    `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
    PRIMARY KEY (`id`),
    KEY `license` (`license`),
    KEY `discord` (`discord`),
    KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `crypto` (
    `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
    `worth` int(11) NOT NULL DEFAULT 0,
    `history` text DEFAULT NULL,
    PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb3_general_ci;

CREATE TABLE IF NOT EXISTS `crypto_transactions` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `citizenid` varchar(11) DEFAULT NULL,
    `title` varchar(50) DEFAULT NULL,
    `message` varchar(50) DEFAULT NULL,
    `date` timestamp NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`),
    KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `dealers` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL DEFAULT '0',
    `coords` longtext DEFAULT NULL,
    `time` longtext DEFAULT NULL,
    `createdby` varchar(50) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `gloveboxitems` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `plate` varchar(8) NOT NULL DEFAULT '[]',
    `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    PRIMARY KEY (`plate`),
    KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `houselocations` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) DEFAULT NULL,
    `label` varchar(255) DEFAULT NULL,
    `coords` text DEFAULT NULL,
    `owned` tinyint(1) DEFAULT NULL,
    `price` int(11) DEFAULT NULL,
    `tier` tinyint(4) DEFAULT NULL,
    `garage` text DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `house_plants` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `building` varchar(50) DEFAULT NULL,
    `stage` int(11) DEFAULT 1,
    `sort` varchar(50) DEFAULT NULL,
    `gender` varchar(50) DEFAULT NULL,
    `food` int(11) DEFAULT 100,
    `health` int(11) DEFAULT 100,
    `progress` int(11) DEFAULT 0,
    `coords` text DEFAULT NULL,
    `plantid` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `building` (`building`),
    KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `lapraces` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(50) DEFAULT NULL,
    `checkpoints` text DEFAULT NULL,
    `records` text DEFAULT NULL,
    `creator` varchar(50) DEFAULT NULL,
    `distance` int(11) DEFAULT NULL,
    `raceid` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `seller` varchar(50) DEFAULT NULL,
    `price` int(11) DEFAULT NULL,
    `description` longtext DEFAULT NULL,
    `plate` varchar(50) DEFAULT NULL,
    `model` varchar(50) DEFAULT NULL,
    `mods` text DEFAULT NULL,
    `occasionid` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `phone_gallery` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `citizenid` varchar(11) DEFAULT NULL,
    `gallery` longtext DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `player_photos` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    `title` varchar(50) DEFAULT NULL,
    `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    `author` varchar(50) DEFAULT NULL,
    `date` timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `player_photoshops` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    `title` varchar(50) DEFAULT NULL,
    `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
    `author` varchar(50) DEFAULT NULL,
    `date` timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `police_weapons` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(50) DEFAULT NULL,
    `price` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `prp_peds` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `model` varchar(255) DEFAULT NULL,
    `ped` longtext DEFAULT NULL,
    `coords` text DEFAULT NULL,
    `createdby` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `prp_objects` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `model` varchar(255) DEFAULT NULL,
    `object` longtext DEFAULT NULL,
    `coords` text DEFAULT NULL,
    `createdby` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `removed_objects` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `model` varchar(255) DEFAULT NULL,
    `object` longtext DEFAULT NULL,
    `coords` text DEFAULT NULL,
    `createdby` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `vehicle_keys` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `plate` varchar(8) NOT NULL DEFAULT '[]',
    `owner` varchar(255) NOT NULL DEFAULT '[]',
    `cid` varchar(11) NOT NULL DEFAULT '[]',
    PRIMARY KEY (`plate`),
    KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `vehmods` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `plate` varchar(255) NOT NULL DEFAULT '0',
    `modslot` int(11) NOT NULL DEFAULT 0,
    `mod` int(11) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
