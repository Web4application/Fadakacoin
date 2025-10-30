/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: marketmaker
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_settings`
--

DROP TABLE IF EXISTS `app_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_settings` (
  `key` varchar(256) DEFAULT NULL,
  `value` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO marketmaker.app_settings (`key`, value) VALUES ('ask_multiplier', '1.005');
INSERT INTO marketmaker.app_settings (`key`, value) VALUES ('bid_multiplier', '0.995');
INSERT INTO marketmaker.app_settings (`key`, value) VALUES ('price_movement_threshold', '0.5');
INSERT INTO marketmaker.app_settings (`key`, value) VALUES ('minimum_token_volume_buy', '3001');
INSERT INTO marketmaker.app_settings (`key`, value) VALUES ('maximum_token_volume_buy', '50000');
INSERT INTO marketmaker.app_settings (`key`, value) VALUES ('minimum_token_volume_sell', '150000');
INSERT INTO marketmaker.app_settings (`key`, value) VALUES ('maximum_token_volume_sell', '1000000');
--
-- Table structure for table `cex_order_settings`
--

DROP TABLE IF EXISTS `cex_order_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cex_order_settings` (
  `exchange_id` int(11) NOT NULL,
  `highest_trade_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`exchange_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cex_trade_log`
--

DROP TABLE IF EXISTS `cex_trade_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cex_trade_log` (
  `exchange_id` int(11) NOT NULL,
  `orderId` bigint(20) NOT NULL,
  `tradeId` bigint(20) NOT NULL,
  `amountBase` decimal(32,12) DEFAULT NULL,
  `baseCurrency` varchar(32) DEFAULT NULL,
  `amountCounter` decimal(32,12) DEFAULT NULL,
  `counterCurrency` varchar(32) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `price` decimal(32,12) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `fee` decimal(32,12) DEFAULT NULL,
  `feeCurrency` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`exchange_id`,`tradeId`),
  KEY `cex_trade_log_exchange_id_index` (`exchange_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_accounts`
--

DROP TABLE IF EXISTS `login_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_accounts` (
  `login_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(256) DEFAULT NULL,
  `password` char(128) DEFAULT NULL,
  `salt` char(32) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `created_by` varchar(256) NOT NULL,
  `role` varchar(256) DEFAULT NULL,
  `change_password` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `login_accounts_pk` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_user_assign`
--

DROP TABLE IF EXISTS `login_user_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_user_assign` (
  `user_id` bigint(20) DEFAULT NULL,
  `login_id` bigint(20) DEFAULT NULL,
  KEY `login_user_assign_login_id_index` (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_log`
--

DROP TABLE IF EXISTS `order_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_log` (
  `order_id` bigint(20) NOT NULL,
  `total` decimal(32,12) DEFAULT NULL,
  `price` decimal(32,12) DEFAULT NULL,
  `amount_start` decimal(32,12) DEFAULT NULL,
  `amount_left` decimal(32,12) DEFAULT NULL,
  `zano_usdt_price` decimal(32,12) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `opened` timestamp NULL DEFAULT NULL,
  `closed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `transaction_index` bigint(20) DEFAULT NULL,
  `wallet_ident` varchar(256) NOT NULL,
  PRIMARY KEY (`wallet_ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO marketmaker.settings (transaction_index, wallet_ident) VALUES (0, 'audit');
INSERT INTO marketmaker.settings (transaction_index, wallet_ident) VALUES (0, 'main');
INSERT INTO marketmaker.settings (transaction_index, wallet_ident) VALUES (0, 'refill');


--
-- Table structure for table `swaps`
--

DROP TABLE IF EXISTS `swaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `swaps` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `txid` varchar(128) DEFAULT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `to_finalizer_amount` bigint(20) DEFAULT NULL,
  `to_finalizer_asset_id` varchar(256) DEFAULT NULL,
  `to_initiator_amount` bigint(20) DEFAULT NULL,
  `to_initiator_asset_id` varchar(256) DEFAULT NULL,
  `reason` varchar(256) DEFAULT NULL,
  `my_order_id` bigint(20) DEFAULT NULL,
  `other_order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trade_log`
--

DROP TABLE IF EXISTS `trade_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `trade_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `my_order_id` bigint(20) NOT NULL,
  `other_order_id` bigint(20) NOT NULL,
  `token_amount` bigint(20) DEFAULT NULL,
  `zano_amount` bigint(20) DEFAULT NULL,
  `zano_price` bigint(20) DEFAULT NULL,
  `zano_usdt_price` decimal(16,6) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `txid` varchar(128) DEFAULT NULL,
  `asset_id` varchar(128) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `two_factor_auths`
--

DROP TABLE IF EXISTS `two_factor_auths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `two_factor_auths` (
  `2fa_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(64) DEFAULT NULL,
  `data` varchar(256) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `login_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`2fa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_accounts` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(256) DEFAULT NULL,
  `display_name` varchar(256) DEFAULT NULL,
  `company_name` varchar(256) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zano_assets`
--

DROP TABLE IF EXISTS `fadaka_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fadaka_assets` (
  `asset_id` varchar(128) NOT NULL,
  `current_supply` bigint(20) unsigned DEFAULT NULL,
  `decimals` int(11) DEFAULT NULL,
  `full_name` varchar(64) DEFAULT NULL,
  `hidden_supply` tinyint(1) DEFAULT NULL,
  `meta_info` varchar(256) DEFAULT NULL,
  `owner` varchar(128) DEFAULT NULL,
  `owner_eth_pub_key` varchar(128) DEFAULT NULL,
  `ticker` varchar(128) DEFAULT NULL,
  `total_max_supply` bigint(20) unsigned DEFAULT NULL,
  `is_whitelisted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zano_price_history`
--

DROP TABLE IF EXISTS `fadaka_price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fadaka_price_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `USDT_price` decimal(16,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zano_wallet_balance`
--

DROP TABLE IF EXISTS `fadaka_wallet_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fadaka_wallet_balance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT NULL,
  `asset_id` varchar(128) DEFAULT NULL,
  `wallet_address` varchar(128) DEFAULT NULL,
  `ident` varchar(128) DEFAULT NULL,
  `utxos` int(11) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `unlocked` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fadaka_wallet_balance_asset_id_index` (`asset_id`),
  KEY `fadaka_wallet_balance_asset_id_timestamp_index` (`asset_id`,`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2489 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zano_wallet_transactions`
--

DROP TABLE IF EXISTS `fadaka_wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fadaka_wallet_transactions` (
  `txid` varchar(128) NOT NULL,
  `wallet_ident` varchar(128) NOT NULL,
  `tx_index` bigint(20) DEFAULT NULL,
  `comment` varchar(256) DEFAULT NULL,
  `fee` bigint(20) unsigned DEFAULT NULL,
  `height` bigint(20) unsigned DEFAULT NULL,
  `is_mining` tinyint(1) DEFAULT NULL,
  `is_mixing` tinyint(1) DEFAULT NULL,
  `is_service` tinyint(1) DEFAULT NULL,
  `payment_id` varchar(256) DEFAULT NULL,
  `remote_address` varchar(256) DEFAULT NULL,
  `remote_alias` varchar(256) DEFAULT NULL,
  `service_entries` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`service_entries`)),
  `vout` int(11) NOT NULL,
  `amount` bigint(20) unsigned DEFAULT NULL,
  `asset_id` varchar(256) DEFAULT NULL,
  `is_income` tinyint(1) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `unlock_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`txid`,`vout`,`wallet_ident`),
  KEY `fadaka_wallet_transactions_timestamp_index` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zano_wallets`
--

DROP TABLE IF EXISTS `fadaka_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fadaka_wallets` (
  `ident` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

CREATE TABLE `audit_wallet_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requester` varchar(256) DEFAULT NULL,
  `comment` varchar(256) DEFAULT NULL,
  `error` varchar(256) DEFAULT NULL,
  `txid` varchar(256) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `amount` decimal(32,12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_wallet_transfers_status_index` (`status`),
  KEY `audit_wallet_transfers_txid_index` (`txid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
